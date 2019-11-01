;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC12F and PIC16F
;
; File description:	user init and exit code
;
; Copyright: 		Copyright © 2011, Mikael Gustafsson
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
; UserInit()
; Description: this is executed immediately on start-up before the boot loader code
;------------------------------------------------------------------------------
UserInit macro 	
		ifndef DEV_MODE
			; Set internal oscillator to 8MHz
			;banksel	OSCCON
			;bsf		OSCCON, IRCF0	;bank 1
			;bsf		OSCCON, IRCF1
			;bsf		OSCCON, IRCF2		 			
			
			; Make uart pins digital
			ifdef	ANSEL				
				error Do you need to configura uart pins to be digital? If not, remove this line
				;banksel ANSEL
			endif
			ifdef	ANSELA
				error Do you need to configura uart pins to be digital? If not, remove this line
				;banksel ANSELA
			endif
		endif ;DEV_MODE
		endm
		
		
;------------------------------------------------------------------------------
; UserExit()
; Description: this is executed right before the user application is loadaed
;------------------------------------------------------------------------------
UserExit macro
		
		endm
		

;------------------------------------------------------------------------------
; End of file
;------------------------------------------------------------------------------	
