;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC18F
;
; File description:	user settings and configuration bits
;
; Copyright: 		Copyright � 09-11, Mikael Gustafsson
;
; Webpage: 			http://mrmackey.no-ip.org/elektronik/ds30loader/
;
; History:			3.0.0 first version of this file
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
		processor	18F46K22							;xxx


;------------------------------------------------------------------------------
; Includes
;------------------------------------------------------------------------------
        #include "devices.inc"


;------------------------------------------------------------------------------
; User preferences
;------------------------------------------------------------------------------
		radix DEC
		
		#define		OSCF			8000000			;xxx oscillator frequency
		#define		BLINIT			2000			;xxx hello receive timeout [ms]
		#define		HELLOTRIES		2				;xxx number of non hello characters received before branching to the user application
		#define		BLTIME			2000			;xxx data receive timeout [ms]


;------------------------------------------------------------------------------
; UART settings
;------------------------------------------------------------------------------			
		#define		USE_UART1		1				;xxx uncomment to use uart1
		;#define	USE_UART2		1				;xxx uncomment to use uart2
		#define		BAUDRATE	 	19200			;xxx baudrate
        ;#define	USE_ABAUD		1				;xxx uncomment to use auto baud rate detection, READ ERRATA FIRST        
		;#define	USE_BRG16		1				;xxx uncomment to use 16-bit brg
		;#define	USE_TXENABLE	1					;xxx uncomment to use a tx enable pin		
		#ifdef USE_TXENABLE
			#define	TRISR_TXE		TRISC			;xxx tris register containing tx enable
			#define	LATR_TXE		LATC			;xxx port register containing tx enable
			#define	TRISB_TXE		TRISC6			;xxx tris bit for tx enable
			#define LATB_TXE		RC6				;xxx port bit for tx enable
		#endif


;------------------------------------------------------------------------------
; CAN settings, commercial version only www.ds30loader.com
;------------------------------------------------------------------------------		
		

;------------------------------------------------------------------------------
; Security, commercial version only www.ds30loader.com
;------------------------------------------------------------------------------'


;------------------------------------------------------------------------------
; Advanced settings
;------------------------------------------------------------------------------		
		#define		PROT_GOTO		1				;xxx protect goto at 0x00
		#define		PROT_BL 		1				;xxx protect bootloader
		
		ifdef IS_PIC18F
				#define		BLPLP		8			;bootloader placement, pages from end
				#define		BLSIZEP		8			;bootloader size [pages], used by bootloader protection	
		endif
		
		ifdef IS_PIC18FJ		
				#define		BLPLP		2			;bootloader placement, pages from end
				#define		BLSIZEP		1			;bootloader size [pages], used by bootloader protection	
		endif
		

;------------------------------------------------------------------------------
; Configuration bits, these macros can be found at the end of the inc-files located in 
; C:\Program Files\Microchip\MPASM Suite\
;
; These can also be set in MPLAB IDE instead, they are found in Configure->Configuration bits...
;------------------------------------------------------------------------------
		
		; xxx

     config FOSC = INTIO67			     ;interne oscillator A6, A7 poortfunctie
	 ;config FOSC = HSMP
     config PLLCFG = OFF                ;Oscillator used directly  
     config FCMEN = OFF			     	;Fail-Safe Clock Monitor disabled
     config IESO = OFF			         ;internal external switchover mode
     config PWRTEN = On			     	;power-up timer  (18F46K22)
     config BOREN = On			         ;brown-out reset
     config BORV = 285			         ;brown-out reset value (2,85V) (18F46K22)
     config WDTEN = OFF			     	;watchdog timer
     config WDTPS = 128			     	;1:128 WDT prescalar
     config PBADEN = OFF			     ;analog port B<4:0> 
     config STVREN = On			     	;;stack overflow reset
     config LVP = OFF			         ;low voltage programming
     config XINST = OFF			     	;Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
     config Debug = OFF			     	;no debug
     config CCP2MX = PORTB3             ;CCP2 input/output is multiplexed with RB3 

;------------------------------------------------------------------------------
; End of file
;------------------------------------------------------------------------------	
