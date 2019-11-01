;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC12F and PIC16F
;
; File description:	Main firmwarefile
;
; Copyright: 		Copyright 2011-2012 Mikael Gustafsson
;
; Version:			1.0.2 March 2012
;
; Webpage: 			http://mrmackey.no-ip.org/elektronik/ds30loader/
;
; Thanks to:		Claudio Chiculita, this code is based on the Tiny PIC bootloader
;
; History:			1.0.2 Bugfix: brg16 for some devices including 16f88x
;						  Improvement: configurable write verification for both flash and eeprom
;						  Improvement: added configurable delay for tx enable pin
;						  Improvement: status register is cleared on exit, improves compatibility with some compilers
;						  Improvement: separate timeouts for hello and data rx
;						  Improvement: new settting KICK_WD
;						  Change: size is now 256 words
;						  New feature: read functionality, commercial version only
;						  New feature: I2C operation, commercial version only
;					1.0.1 Bugfix: BRG16 was broken
;						  Improvement: supports uart 2
;						  Improvement: send unknown command
;						  Improvement: PIC12 support
;						  Improvement: support new PIC16's that has no eeprom
;					1.0.0 Improvement: improved timeout calculation
;					      Improvement: higher baudrates setting
;					      New feature: auto baud rate detection
;						  Bugfix: tx enable tris bit was not cleared
;					0.9.4 Improvement: New setting, HELLORETRIES
;					      Bugfix: Banksel added for RCREG to be compatible with some devices including 1827;					
;					0.9.3 added tx enable code
;						  compatible with pic16 with extended instruction set
;					0.9.2 -
;					0.9.1 Moved goto to usr appl. to make room for page selection
;					0.9.0 Initial release
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
;    along with ds30 Loader. If not, see <http://www.gnu.org/licenses/>.
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
; Includes
;------------------------------------------------------------------------------ 
		#include "settings.inc"
		#include "user_code.inc"
		
		
;------------------------------------------------------------------------------
; Defines
;------------------------------------------------------------------------------
		radix DEC
		
		#define	VERMAJ		1										;firmware version major
		#define	VERMIN		0										;firmware version minor
		#define	VERREV		2										;firmware version revision
		
		#define HELLO 		0xC1
		#define OK 			'K'										;erase/write ok
		#define CHECKSUMERR	'N'										;checksum error
		#define	VERFAIL		'V'										;verification failed
		#define	BLPROT     	'P'                              		;bl protection tripped
		#define	UCMD     	'U'                              		;unknown command	
				
		if BLTIME >= 500
			#define delay2		100
		else
			#define delay2		5
		endif	
		
		#define	BLSTART		( BLINIT * (FOSC / 4000) / ((delay2 * ((256*9)+4))+5) )
		#define	BLDELAY		( BLTIME * (FOSC / 4000) / ((delay2 * ((256*9)+4))+5) )
		
		
		ifndef USE_BRGH
			ifndef USE_BRG16
				#define	UBRG		( (((FOSC / BAUDRATE) / 32) - 1) / 2 )	;baudrate
			else
				#define	UBRG		( (((FOSC / BAUDRATE) / 8) - 1) / 2 )	;baudrate
			endif
		endif
				
		ifdef USE_BRGH
			ifdef USE_BRG16
				#define	UBRG		( (((FOSC / BAUDRATE) / 2) - 1) / 2 )	;baudrate
			else
				#define	UBRG		( (((FOSC / BAUDRATE) / 8) - 1) / 2 )	;baudrate
			endif
		else
			
		endif
		
		#define	BLPLP		(BLPLW / PAGESIZEW)						;bootloader placement, pages from end
		#define	PAGESIZER	(PAGESIZEW/ROWSIZEW)					;pagesize [rows]
		#define	ROWSIZEB	(ROWSIZEW*2)							;rowsize [bytes]
		#define STARTADDR	( MAX_FLASH - BLPLP * PAGESIZER * ROWSIZEW )			;bootloader placement		

		; Debug output
		;messg	UBRG_IS #v(UBRG)
		;messg	blstartis 	#v(BLSTART)
		;messg	bldelayis 	#v(BLDELAY)
		
		;
		errorlevel 			1, -305									; suppress warning msg that takes f as default
		
		
;------------------------------------------------------------------------------
; Extended PIC16F
;------------------------------------------------------------------------------
	ifndef EEDATL
		#define	EEDATL	EEDATA
	endif	
	ifndef EEADRL
		#define	EEADRL	EEADR
	endif
	ifndef INDF
		#define	INDF_	INDF0
	else
		#define	INDF_	INDF
	endif
	ifndef FSR
		#define	FSR_	FSR0L
	else
		#define	FSR_	FSR
	endif
	
	ifndef EEADRL
		#define EEADRL		EEADR
	endif
	
	ifndef PMCON1
		#define	EECON1_		EECON1
		#define	EECON2_		EECON2
		#define	EEDATL_		EEDATL
		#define	EEDATH_		EEDATH
		#define	EEADRL_		EEADRL
		#define	EEADRH_		EEADRH
	else
		#define	EECON1_		PMCON1
		#define	EECON2_		PMCON2
		#define	EEDATL_		PMDATL
		#define	EEDATH_		PMDATH
		#define	EEADRL_		PMADRL
		#define	EEADRH_		PMADRH
	endif


;------------------------------------------------------------------------------
; Variables
;------------------------------------------------------------------------------ 
		cblock 0x70		;0x70-0x7f are available in all banks
			crc			;receive checksum
			dcnt		;datacount
			cnt1		;receive timeout timer
			cnt2		;receive timeout timer
			cnt3		;receive timeout timer
			cntHello	;
			addrh		;high address byte
			cmd			;command
			doerase		;
			rowcnt
			rowcnt2
            Delay1
            Delay2
            serbuf
            TEMP
            unused
            ;only 16 bytes available in all banks
		endc
		cblock 0x20		;only bank 0 but accessed using indirect addressing, 0x20-0x70 = 80bytes
			buffer:(PAGESIZEW*2 + 1)	;receive buffer
		endc
		
		
;------------------------------------------------------------------------------
; Macros
;------------------------------------------------------------------------------ 	
SendL 	macro 	sbyte
			movlw 	sbyte
			call	Send
		endm

	
;------------------------------------------------------------------------------
; Reset vector
;------------------------------------------------------------------------------ 
		org     0x0000
		PAGESEL blstart
		goto    blstart


;------------------------------------------------------------------------------
; GOTO user application
;------------------------------------------------------------------------------ 	
		org 	STARTADDR - 3	;space to deposit goto to user application
loadusr	
		nop						;page select, replaced by gui
		nop						;page select, replaced by gui
		nop						;goto, replaced by gui
	
	
;------------------------------------------------------------------------------
; Start of bootloader code
;------------------------------------------------------------------------------ 	
		org 	STARTADDR
blstart	
	
		
;------------------------------------------------------------------------------
; Init
;------------------------------------------------------------------------------	

		UserInit				;macro in user_code.inc
		
		ifdef 	DEV_MODE
			dev_init
		endif		
		
		
		;----------------------------------------------------------------------
		; TX enable, make tx enable pin output and set to 0
		;----------------------------------------------------------------------
		ifdef USE_TXENABLE
			banksel	TRISR_TXE
			bcf		TRISR_TXE, TRISB_TXE
			banksel	PORTR_TXE
			bcf		PORTR_TXE, PORTB_TXE
		endif		
		
		
		;----------------------------------------------------------------------
		; Init communication module
		;---------------------------------------------------------------------- 		
		call	CommInit
		
		
;------------------------------------------------------------------------------
; Wait for computer
;------------------------------------------------------------------------------
waitpc	movlw	HELLOTRIES
		movwf	cntHello
rhello	movlw	BLSTART
		call 	RcvIni				;->bank ?
		sublw 	HELLO
		skpnz	
		goto	sendid
		; Not hello received
		decfsz	cntHello
		goto	rhello	
		goto	exit
			
		
;------------------------------------------------------------------------------
; Send device id and firmware version
;------------------------------------------------------------------------------
sendid	SendL 	( DEVICEID & 0xff )	;->bank ?
		SendL	( ((DEVICEID&0x100)>>1) + VERMAJ )
		SendL	( ((DEVICEID&0x200)>>2) + (VERMIN<<4) + VERREV )
		
		
;------------------------------------------------------------------------------
; Main loop
;------------------------------------------------------------------------------	
Main	clrf	STATUS
		SendL 	OK				;->bank ?, everything OK, ready and waiting
mainl	clrf 	crc
		

		;----------------------------------------------------------------------
		; Receive address
		;----------------------------------------------------------------------			
		; Dummy upper byte
		call 	Receive			;->bank ?
		; High byte
		call 	Receive			;->bank ?
		banksel	EEADRH_			
		movwf 	EEADRH_			;bank 2/3
		movwf	addrh
		; Low byte				
		call 	Receive			;->bank ?
		banksel	EEADRL_
		movwf 	EEADRL_			;bank 2/3
		
		
		;----------------------------------------------------------------------
		; Receive command
		;----------------------------------------------------------------------			
		call 	Receive			;->bank ?	
		movwf 	cmd	
		
				
		;----------------------------------------------------------------------
		; Receive nr of data bytes that will follow
		;----------------------------------------------------------------------			
		call 	Receive			;->bank ?	
		movwf 	dcnt	
		
		
		;----------------------------------------------------------------------
		; Receive data
		;----------------------------------------------------------------------	
		movlw	buffer
		movwf	FSR_
rcvoct	call 	Receive			;->bank ?
		movwf 	INDF_
		incf	FSR_
		decfsz 	dcnt
		goto 	rcvoct
		
		
		;----------------------------------------------------------------------
		; Check checksum
		;----------------------------------------------------------------------			
		movf 	crc, f
		skpz
		goto 	crcfail
		
		
		;----------------------------------------------------------------------
		; Init buffer pointer
		;----------------------------------------------------------------------
		movlw	buffer
		movwf	FSR_			;available in all banks
		
				
		;----------------------------------------------------------------------
		; Check command
		;----------------------------------------------------------------------			
		; Erase page
		btfss	cmd, 0
		goto	cwrrow
		bsf		doerase, 0
		goto	Main		
		; Write row
cwrrow	btfsc 	cmd, 1			
		goto 	erase
		; Write eeprom word
		ifdef HAS_EE
			btfsc 	cmd, 2			
			goto	eeprom
		endif
		; Else, unknown command
		SendL	UCMD				;->bank?
		goto		mainl
		
		
;------------------------------------------------------------------------------
; Exit
;------------------------------------------------------------------------------			
exit	
		call	CommExit
		ifdef DEV_MODE
			dev_exit
		endif
		UserExit
		clrf	STATUS
		goto 	loadusr

		
		;----------------------------------------------------------------------
		; Erase page
		;----------------------------------------------------------------------					
erase	
		btfss 	doerase, 0
        goto    writerow		
		ifndef AUTOERASE
			movlw	0x94			;program mem, erase, enable write
			call 	Write			;->bank 3
			banksel	EECON1_
			bcf		EECON1_, FREE	;bank 2/3, disable erase
		endif
		clrf	doerase
		
						
		;----------------------------------------------------------------------
		; Write row
		;----------------------------------------------------------------------					
writerow
		movlw	ROWSIZEW
		movwf	rowcnt
		movwf	rowcnt2	
wrword
		; Load latches
		movfw 	INDF_
		banksel	EEDATL_
		movwf	EEDATL_			;bank 2/3
		incf	FSR_
		movfw	INDF_
		movwf	EEDATH_			;bank 2/3
		incf	FSR_
		;Write
		movlw	0x84			;program mem, enable write
		call	Write			;->bank 3
		; Word write complete, more words to be writen?
		banksel	EEADRL_		
		incf	EEADRL_			;bank 2/3
		decfsz	rowcnt
		goto	wrword

		;----------------------------------------------------------------------
		; Write complete, verify row
		;----------------------------------------------------------------------	
		ifdef WRITE_VER
verword
		decf	EEADRL_			;bank 2/3
		; Read word
		banksel EECON1_		
		ifdef HAS_EE	
			bsf		EECON1_, EEPGD	;bank 3
		endif
		bsf		EECON1_, RD		;bank 3
		nop
		nop
		; Compare high byte	
		decf	FSR_
		movfw	INDF_
		andlw	0x3F			;maybe we should only compare low 6 bits?
		banksel	EEDATH_
		subwf	EEDATH_			;bank 2/3
		btfss	STATUS, Z
		goto	verfail
		; Compare low byte			
		decf	FSR_
		movfw	INDF_
		subwf	EEDATL_			;bank 2/3
		btfss	STATUS, Z
		goto	verfail
		; Loop?
		decfsz 	rowcnt2
		goto 	verword	
		; Verify succesfull
		endif
		goto 	Main						
				
		
		;----------------------------------------------------------------------
		; Write eeprom byte
		;----------------------------------------------------------------------	
	ifdef HAS_EE			
		; Load latch
eeprom	movfw	INDF_
		banksel	EEDATL_
		movwf	EEDATL_			;bank 2/3
		; Write
		movlw 	0x04
		call 	Write			;->bank 3		
		; Wait for write to complete
eewait	
		btfsc	EECON1_, WR		;bank 3
		goto	eewait	
		
		
		;----------------------------------------------------------------------
		; Write complete, verify byte
		;----------------------------------------------------------------------				
		ifdef EWRITE_VER		
		; Read
		bsf		EECON1_, RD		;bank 3
		movfw	INDF_
		; Compare
		banksel	EEDATL_
		subwf	EEDATL_			;bank 2/3
		btfss	STATUS, Z
		goto	verfail
		; Verify succesfull
		endif
		goto 	Main
	endif
				
				
		;----------------------------------------------------------------------
		; Verify fail
		;----------------------------------------------------------------------
verfail	
		SendL 	VERFAIL			;->bank ?
		goto 	mainl
		
						
		;----------------------------------------------------------------------
		; Checksum error
		;----------------------------------------------------------------------
crcfail	
		SendL 	CHECKSUMERR		;->bank ?
		goto 	mainl

		
;------------------------------------------------------------------------------
; Write()
;------------------------------------------------------------------------------		
Write
		;
		banksel	EECON1_
		movwf	EECON1_			;bank 3
		; Write		
		movlw	0x55
		movwf	EECON2_			;bank 3
		movlw	0xaa
		movwf	EECON2_			;bank 3
		bsf		EECON1_, WR		;bank 3, start write
		nop
		nop	
waitwre		
		btfsc	EECON1_, WR		;bank 3
		goto	waitwre				
		bcf		EECON1_, WREN	;bank 3 disable writes
		return
		
		
;------------------------------------------------------------------------------
; Functions
;------------------------------------------------------------------------------		
		#include "uart.inc"


;------------------------------------------------------------------------------
; End of code
;
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.
;------------------------------------------------------------------------------			
		end
