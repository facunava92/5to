;------------------------------------------------------------------------------
;
; Title:			ds30 Loader for PIC12F and PIC16F
;
; File description:	device specific constants
;
; Copyright: 		Copyright 2010-2012 Mikael Gustafsson
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
	ifdef	__12F1822
		#include	p12F1822.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x800
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		494
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		16
	endif
	ifdef	__12F1840
		#include	p12F1840.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		495
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
