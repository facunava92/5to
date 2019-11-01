;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC12F and PIC16F
;
; File description:	user settings and configuration bits
;
; Copyright: 		Copyright 2010-2012 Mikael Gustafsson
;                                                                             
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
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
; Device
;------------------------------------------------------------------------------
		LIST      	P=16F1938


;------------------------------------------------------------------------------
; Includes
;------------------------------------------------------------------------------
        #include	"devices.inc"


;------------------------------------------------------------------------------
; User preferences
;------------------------------------------------------------------------------
		radix DEC

		#define		FOSC			16000000		;xxx
		#define		BLINIT			2000			;xxx hello receive timeout [ms]
		#define		HELLOTRIES		2				;xxx number of non hello characters received before branching to the user application
		#define		BLTIME			2000			;xxx data receive timeout [ms]
		

;------------------------------------------------------------------------------
; UART settings
;------------------------------------------------------------------------------
		#define		USE_UART1		1				;xxx uncomment to use uart1
		;#define	USE_UART2		1				;xxx uncomment to use uart2
		#define		BAUDRATE	 	9600			;xxx baudrate
		;#define	USE_ABAUD		1				;xxx auto baud rate detection, only available on enhanced mid-range devices(?)
		#define		USE_BRGH		1				;xxx
		;#define	USE_BRG16		1				;xxx 16-bit brg, only available on enhanced mid-range devices(?)

		;#define	USE_TXENABLE	1				;xxx uncomment to use a tx enable pin		
		#ifdef USE_TXENABLE
			#define	TXE_DELAY 		10				;xxx time in us to wait before transmitting after pulling the tx enable pin high
			#define	TRISR_TXE		TRISB			;xxx tris register containing tx enable
			#define	PORTR_TXE		PORTB			;xxx port register containing tx enable
			#define	TRISB_TXE		TRISB0			;xxx tris bit for tx enable
			#define PORTB_TXE		RB0				;xxx port bit for tx enable
		#endif


;------------------------------------------------------------------------------
; Advanced settings
;------------------------------------------------------------------------------
		;#define 	KICK_WD			1				;xxx uncomment if the watchdog is enabled
		#define		WRITE_VER		1				;xxx do flash write verification
		#define		EWRITE_VER		1				;xxx do eeprom write verification

		#define		BLPLW			256				;bootloader placement, words from end, should be a multiple of 64
		
				
;------------------------------------------------------------------------------
; Configuration bits, these macros can be found at the end of the inc-files located in 
; C:\Program Files\Microchip\MPASM Suite\
;
; These can also be set in MPLAB IDE instead, they are found in Configure->Configuration bits...
;------------------------------------------------------------------------------
		; Template for standard PIC16F, usually two-three letter like PIC16F88 or PIC16F877
		;__CONFIG    _CONFIG1, _DEBUG_OFF &_HS_OSC & _WDT_OFF & _PWRTE_OFF & _MCLR_ON & _BODEN_OFF & _LVP_OFF
		;__CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF

		; Template for enhanced PIC16F, usually four letter like PIC16F1936
		__CONFIG    _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _IESO_OFF & _FCMEN_OFF 
		__CONFIG    _CONFIG2, _PLLEN_ON & _LVP_OFF


;------------------------------------------------------------------------------
; ds30 Loader commercial version
;------------------------------------------------------------------------------
;-Supports read of flash and EEPROM
;-Supports software UART
;-Read more at www.ds30loader.com


;------------------------------------------------------------------------------
; End of file
;------------------------------------------------------------------------------	
