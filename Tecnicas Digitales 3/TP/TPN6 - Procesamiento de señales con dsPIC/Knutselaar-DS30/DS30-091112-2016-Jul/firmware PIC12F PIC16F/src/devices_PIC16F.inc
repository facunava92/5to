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
	ifdef	__16F882
		#include	p16F882.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x0800
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		456
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F87
		#include	p16F87.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		457
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__16F88
		#include	p16F88.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		458
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__16F883
		#include	p16F883.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		459
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F884
		#include	p16F884.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		460
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F886
		#include	p16F886.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		461
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		8
		#define		AUTOERASE		1
	endif
	ifdef	__16F887
		#include	p16F887.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		462
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		8
		#define		AUTOERASE		1
	endif
	ifdef	__16F1933
		#include	p16F1933.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		463
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1936
		#include	p16F1936.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		512
		#define		DEVICEID		464
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1937
		#include	p16F1937.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		512
		#define		DEVICEID		465
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1939
		#include	p16F1939.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		466
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1947
		#include	p16F1947.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		467
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1827
		#include	p16F1827.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		384
		#define		DEVICEID		468
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1826
		#include	p16F1826.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x0800
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		469
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F720
		#include	p16F720.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x800
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		470
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F721
		#include	p16F721.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		471
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1825
		#include	p16F1825.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		472
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1938
		#include	p16F1938.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		473
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1934
		#include	p16F1934.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		474
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1946
		#include	p16F1946.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		512
		#define		DEVICEID		475
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__16F1829
		#include	p16F1829.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		476
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1526
		#include	p16F1526.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		768
		#define		DEVICEID		477
		#define		HAS_UART2		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1527
		#include	p16F1527.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1536
		#define		DEVICEID		478
		#define		HAS_UART2		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1516
		#include	p16F1516.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		512
		#define		DEVICEID		479
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F818
		#include	p16F818.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x0400
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		480
		#define		HAS_EE   		1
		#define		PAGESIZEW		64
		#define		ROWSIZEW		8
	endif
	ifdef	__16F819
		#include	p16F819.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x0800
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		481
		#define		HAS_EE   		1
		#define		PAGESIZEW		64
		#define		ROWSIZEW		8
	endif
	ifdef	__16F873
		#include	p16F873.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		192
		#define		DEVICEID		482
		#define		HAS_EE   		1
		#define		PAGESIZEW		1
		#define		ROWSIZEW		1
		#define		AUTOERASE		1
	endif
	ifdef	__16F874
		#include	p16F874.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		192
		#define		DEVICEID		483
		#define		HAS_EE   		1
		#define		PAGESIZEW		1
		#define		ROWSIZEW		1
		#define		AUTOERASE		1
	endif
	ifdef	__16F876
		#include	p16F876.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		484
		#define		HAS_EE   		1
		#define		PAGESIZEW		1
		#define		ROWSIZEW		1
		#define		AUTOERASE		1
	endif
	ifdef	__16F877
		#include	p16F877.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		485
		#define		HAS_EE   		1
		#define		PAGESIZEW		1
		#define		ROWSIZEW		1
		#define		AUTOERASE		1
	endif
	ifdef	__16F1822
		#include	p16F1822.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x800
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		486
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		16
	endif
	ifdef	__16F1823
		#include	p16F1823.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x800
		#define		RAM_START		
		#define		RAM_SIZEB		128
		#define		DEVICEID		487
		#define		HAS_EE   		1
		#define		PAGESIZEW		16
		#define		ROWSIZEW		16
	endif
	ifdef	__16F1824
		#include	p16F1824.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		488
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1828
		#include	p16F1828.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		256
		#define		DEVICEID		489
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F876A
		#include	p16F876A.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		490
		#define		HAS_EE   		1
		#define		PAGESIZEW		4
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F877A
		#include	p16F877A.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		368
		#define		DEVICEID		491
		#define		HAS_EE   		1
		#define		PAGESIZEW		4
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F873A
		#include	p16F873A.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		192
		#define		DEVICEID		492
		#define		HAS_EE   		1
		#define		PAGESIZEW		4
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F874A
		#include	p16F874A.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		
		#define		RAM_SIZEB		192
		#define		DEVICEID		493
		#define		HAS_EE   		1
		#define		PAGESIZEW		4
		#define		ROWSIZEW		4
		#define		AUTOERASE		1
	endif
	ifdef	__16F1517
		#include	p16F1517.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		512
		#define		DEVICEID		496
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1518
		#include	p16F1518.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		497
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1519
		#include	p16F1519.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		498
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__16F1847
		#include	p16F1847.inc
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		
		#define		RAM_SIZEB		1024
		#define		DEVICEID		499
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
