;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC16
;
; File description:	UART functions
;
; Copyright: 		Copyright 2011-2012 Mikael Gustafsson
;                                                                             
;------------------------------------------------------------------------------

;-----------------------------------------------------------------------------
;    This file is part of ds30 Loader.
;
;    ds30 Loader is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation.
;
;    ds30 Loader is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with ds30 Loader. If not, see <http:;www.gnu.org/licenses/>.
;------------------------------------------------------------------------------ 
		

;------------------------------------------------------------------------------
; UARTs
;------------------------------------------------------------------------------ 
		 
		ifndef USE_UART1
			ifndef USE_UART2
				error "No communication is specified"
			endif
		endif
		
		ifdef USE_UART1
			ifdef USE_UART2
				error "Both uarts are specified"
			endif
			
			#define PIRRCIF_		PIR1				;uart interupt status register
			#define RCIF_			RCIF		
			
			ifdef TX1STA
			   	#define TXSTA_		TX1STA				;uart status
			   	#define	RCSTA_		RC1STA				;uart status
			   	#define	SPBRG_		SP1BRGL				;uart baudrate
			   	#define	SPBRGH_		SP1BRGH				;uart baudrate
			   	#define	TXREG_		TX1REG				;uart transmit
			   	#define	RCREG_		RC1REG				;uart receive
			   	#define	BAUDCON_	BAUD1CON			;uart receive
			else
			   	#define	TXSTA_		TXSTA				;uart status
			   	#define	RCSTA_		RCSTA				;uart status
			   	#define	SPBRG_		SPBRG				;uart baudrate
			   	#define	SPBRGH_		SPBRGH				;uart baudrate
			   	#define	TXREG_		TXREG				;uart transmit
			   	#define	RCREG_		RCREG				;uart receive
			   	ifdef BAUDCON
			   		#define	BAUDCON_	BAUDCON			;uart receive
			   	else
			   		#define	BAUDCON_	BAUDCTL				;uart receive
			   	endif
			endif
		endif

		ifdef USE_UART2
			ifndef HAS_UART2
				error "UART2 specified for a device that only has uart1"
			endif			
			
			#define PIRRCIF_	PIR4					;uart interupt status register
			#define RCIF_		RC2IF

		   	#define	TXSTA_		TX2STA					;uart status
		   	#define	RCSTA_		RC2STA					;uart status
		   	#define	SPBRG_		SP2BRGL					;uart baudrate
			#define	SPBRGH_		SP2BRGH					;uart baudrate
		   	#define	TXREG_		TX2REG					;uart transmit
		   	#define	RCREG_		RC2REG					;uart receive
			#define	BAUDCON_	BAUD2CON				;uart receive
			#define	BAUDCTL_	BAUD2CTL				;uart receive
		endif
		
		;
		ifdef USE_TXENABLE
			#define	TXE_DELAY_CNT	( (TXE_DELAY * FOSC) / (4000000 * 3) )
		endif

				
;------------------------------------------------------------------------------
; Range check
;------------------------------------------------------------------------------
		ifndef USE_BRG16
			if UBRG > 255
				error spbrg_value_ is out of range
			endif
		else
			if UBRG > 65535
				error spbrg_value_ is out of range
			endif
		endif
		
		if UBRG == 0
			error spbrg_value_ might be out of range
		endif
		

;------------------------------------------------------------------------------
; CommInit()
;------------------------------------------------------------------------------	
CommInit
		; Baud rate	
		banksel	SPBRG_
		movlw	(UBRG & 0xff)
		movwf	SPBRG_				;bank 1/3
		
		; Brg16
		ifdef USE_BRG16
			movlw	(UBRG >> 8)
			banksel	SPBRGH_
			movwf	SPBRGH_			;bank 1/3
			banksel BAUDCON_
			bsf		BAUDCON_, BRG16	;bank 1/3
		endif
		; Receive		
		movlw	b'10010000'
		banksel	RCSTA_
		movwf	RCSTA_				;bank 0/3
		; Transmit		
		ifdef USE_BRGH
			movlw	b'00100100'
		else
			movlw	b'00100000'
		endif
		banksel TXSTA_
		movwf	TXSTA_				;bank 1/3
		
		
		;----------------------------------------------------------------------
		; UART with auto baudrate detection
		;----------------------------------------------------------------------
		ifdef USE_ABAUD
			;Enable auto baud rate detection
			banksel BAUDCON_		;bank 3
			bsf		BAUDCON_, ABDEN			
			; Wait for auto baud rate detection to complete and do timeout control
			movlw 	BLDELAY
			movwf 	cnt1								
rpt2_		movlw	delay2
			movwf	cnt2		
rpt3_		clrf 	cnt3		
rptc_		clrwdt
			banksel	BAUDCON_
			btfss 	BAUDCON_, ABDEN	;bank 3
			goto 	abaudok
notrcv_		decfsz 	cnt3, f
			goto 	rptc_
			decfsz 	cnt2, f
			goto 	rpt3_
			decfsz 	cnt1, f
			goto 	rpt2_
			; Timed out if we get here			
			goto	exit
			;Send ok
abaudok		SendL 	OK				;->bank ?
		endif	
		
		return
		

;------------------------------------------------------------------------------
; CommExit()
;------------------------------------------------------------------------------	
CommExit
		banksel	RCSTA_
		clrf	RCSTA_			;reset receive status and control register
		banksel	TXSTA_		
		clrf	TXSTA_			;reset transmit status and control register
		
		return	
		
		
;------------------------------------------------------------------------------
; Receive()
;------------------------------------------------------------------------------	
Receive	movlw 	BLDELAY
RcvIni	movwf 	cnt1								
rpt2	movlw	delay2
		movwf	cnt2		
rpt3	clrf 	cnt3		
rptc	
		ifdef KICK_WD
			clrwdt
		endif
		banksel	PIRRCIF_
		btfss 	PIRRCIF_, RCIF_	;bank 0
		goto 	notrcv
		banksel RCREG_
		movfw 	RCREG_			;bank 0/3, return read data in W, same bank as PIR1
		addwf 	crc, f			;compute crc
		return		
notrcv	decfsz 	cnt3, f
		goto 	rptc
		decfsz 	cnt2, f
		goto 	rpt3
		decfsz 	cnt1, f
		goto 	rpt2
		; Receive timed out if we get here
		goto	exit
		
		
;------------------------------------------------------------------------------
; Send()
;------------------------------------------------------------------------------		
Send	; Enable tx
		ifdef USE_TXENABLE
			movwf	TEMP
			banksel	PORTR_TXE			
			bsf		PORTR_TXE, PORTB_TXE;bank ?
			movlw	TXE_DELAY_CNT
			movwf	cnt1
txe_del_lo	decfsz	cnt1
			goto	txe_del_lo
			movfw	TEMP
		endif		
		;Send byte
		banksel	TXREG_
		movwf 	TXREG_					;bank 0/3
		; Wait for transmit shift register to get empty
		banksel	TXSTA_	
txwait	btfss	TXSTA_, TRMT			;bank 1/3
		goto	txwait
		; Disable tx 
		ifdef USE_TXENABLE
			banksel	PORTR_TXE
			bcf		PORTR_TXE, PORTB_TXE;bank ?
		endif
		; Send complete
		return
	
	
;------------------------------------------------------------------------------	
; End of file
;------------------------------------------------------------------------------	
