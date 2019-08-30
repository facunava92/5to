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
	ifdef	__18F1220
		#include	p18F1220.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		256
		#define		DEVICEID		257
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F1230
		#include	p18F1230.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		256
		#define		DEVICEID		258
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2220
		#include	p18F2220.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		259
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2221
		#include	p18F2221.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		260
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F4220
		#include	p18F4220.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		261
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F4221
		#include	p18F4221.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x1000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		262
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F1320
		#include	p18F1320.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		256
		#define		DEVICEID		263
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F1330
		#include	p18F1330.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		256
		#define		DEVICEID		264
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F13K22
		#include	p18F13K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		256
		#define		DEVICEID		265
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F13K50
		#include	p18F13K50.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		266
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2320
		#include	p18F2320.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		267
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2321
		#include	p18F2321.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		268
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2331
		#include	p18F2331.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		269
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F23K20
		#include	p18F23K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		270
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F4320
		#include	p18F4320.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		271
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F4321
		#include	p18F4321.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		272
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F4331
		#include	p18F4331.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		273
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F43K20
		#include	p18F43K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		274
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F14K22
		#include	p18F14K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		275
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F14K50
		#include	p18F14K50.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		276
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F2420
		#include	p18F2420.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		277
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2423
		#include	p18F2423.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		278
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2431
		#include	p18F2431.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		279
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2450
		#include	p18F2450.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		280
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F2480
		#include	p18F2480.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		281
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F24K20
		#include	p18F24K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		282
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4420
		#include	p18F4420.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		283
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4423
		#include	p18F4423.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		284
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4431
		#include	p18F4431.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		285
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F4450
		#include	p18F4450.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		286
		#define		PAGESIZEW		32
		#define		ROWSIZEW		8
	endif
	ifdef	__18F4480
		#include	p18F4480.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		287
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F44K20
		#include	p18F44K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		288
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2455
		#include	p18F2455.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x6000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		289
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2458
		#include	p18F2458.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x6000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		290
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4455
		#include	p18F4455.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x6000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		291
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4458
		#include	p18F4458.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x6000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		292
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2520
		#include	p18F2520.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		293
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2523
		#include	p18F2523.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		294
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2550
		#include	p18F2550.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		295
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2553
		#include	p18F2553.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		296
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F2580
		#include	p18F2580.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		297
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F25K20
		#include	p18F25K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		298
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4520
		#include	p18F4520.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		299
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4523
		#include	p18F4523.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		300
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4550
		#include	p18F4550.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		301
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4553
		#include	p18F4553.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		302
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F4580
		#include	p18F4580.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		303
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F45K20
		#include	p18F45K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		304
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		16
	endif
	ifdef	__18F6520
		#include	p18F6520.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		305
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F8520
		#include	p18F8520.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		306
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F2525
		#include	p18F2525.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3968
		#define		DEVICEID		307
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F2585
		#include	p18F2585.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		308
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4525
		#include	p18F4525.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3968
		#define		DEVICEID		309
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4585
		#include	p18F4585.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		310
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6527
		#include	p18F6527.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		311
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8527
		#include	p18F8527.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0xC000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		312
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F2620
		#include	p18F2620.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3968
		#define		DEVICEID		313
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F2680
		#include	p18F2680.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		314
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F26K20
		#include	p18F26K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		315
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4620
		#include	p18F4620.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3968
		#define		DEVICEID		316
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4680
		#include	p18F4680.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		317
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F46K20
		#include	p18F46K20.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		318
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6622
		#include	p18F6622.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		319
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8622
		#include	p18F8622.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		320
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F2682
		#include	p18F2682.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x14000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		321
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4682
		#include	p18F4682.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x14000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		322
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F2685
		#include	p18F2685.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		323
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F4685
		#include	p18F4685.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		324
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6627
		#include	p18F6627.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		325
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6628
		#include	p18F6628.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		326
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8627
		#include	p18F8627.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		327
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8628
		#include	p18F8628.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x18000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		328
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6722
		#include	p18F6722.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		329
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F6723
		#include	p18F6723.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		330
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8722
		#include	p18F8722.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		331
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F8723
		#include	p18F8723.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3936
		#define		DEVICEID		332
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F452
		#include	p18F452.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		333
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F458
		#include	p18F458.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		334
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F448
		#include	p18F448.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		335
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F258
		#include	p18F258.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		336
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F248
		#include	p18F248.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		337
		#define		HAS_CAN 		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F8680
		#include	p18F8680.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3328
		#define		DEVICEID		338
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F25K22
		#include	p18F25K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		339
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F23K22
		#include	p18F23K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		340
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F24K22
		#include	p18F24K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		341
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F26K22
		#include	p18F26K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3896
		#define		DEVICEID		343
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F43K22
		#include	p18F43K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x2000
		#define		RAM_START		0
		#define		RAM_SIZEB		512
		#define		DEVICEID		344
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F44K22
		#include	p18F44K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x4000
		#define		RAM_START		0
		#define		RAM_SIZEB		768
		#define		DEVICEID		345
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F45K22
		#include	p18F45K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		1536
		#define		DEVICEID		346
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F46K22
		#include	p18F46K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3896
		#define		DEVICEID		347
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F67K22
		#include	p18F67K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3862
		#define		DEVICEID		348
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		64
		#define		ROWSIZEW		64
	endif
	ifdef	__18F66K22
		#include	p18F66K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3862
		#define		DEVICEID		349
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F65K22
		#include	p18F65K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		350
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F85K22
		#include	p18F85K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		2048
		#define		DEVICEID		351
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F86K22
		#include	p18F86K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3862
		#define		DEVICEID		352
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F87K22
		#include	p18F87K22.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3862
		#define		DEVICEID		353
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		64
		#define		ROWSIZEW		64
	endif
	ifdef	__18F8720
		#include	p18F8720.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3840
		#define		DEVICEID		354
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F6620
		#include	p18F6620.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3840
		#define		DEVICEID		355
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F6720
		#include	p18F6720.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x20000
		#define		RAM_START		0
		#define		RAM_SIZEB		3840
		#define		DEVICEID		433
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F8620
		#include	p18F8620.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3840
		#define		DEVICEID		434
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		4
	endif
	ifdef	__18F25K80
		#include	p18F25K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		435
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F26K80
		#include	p18F26K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		436
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F45K80
		#include	p18F45K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		437
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F46K80
		#include	p18F46K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		438
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F65K80
		#include	p18F65K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x8000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		439
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
	ifdef	__18F66K80
		#include	p18F66K80.inc
		#define		IS_PIC18F 		1
		#define		VALID_DEV		1
		#define		MAX_FLASH		0x10000
		#define		RAM_START		0
		#define		RAM_SIZEB		3648
		#define		DEVICEID		440
		#define		HAS_CAN 		1
		#define		HAS_UART2		1
		#define		HAS_EE   		1
		#define		BIGEE   		1
		#define		PAGESIZEW		32
		#define		ROWSIZEW		32
	endif
