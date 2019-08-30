'****************************************************************
'*  Name    : 28PIC-KnipperA5-Serial-port-test.BAS              *
'*  Author  : Knutselaar.eu                                     *
'*  Date    : 07/02/2014                                        *
'*  Version : 2.0                                               *
'*  Notes   : De 18F25K20 werkt op maximaal 3.3V                *
'*          :                                                   *
'****************************************************************
Device 18F25K20
XTAL = 8
        ;Config settings in bootloader

        'CONFIG FOSC = INTIO67			;Interne oscillator, A6,A7 port fucties
    	';CONFIG FOSC = HS			;external oscillator
    	'CONFIG FCMEN = OFF			;Fail-Safe Clock Monitor disabled
    	'CONFIG IESO = OFF			;internal external switchover mode
    	'CONFIG PWRT = ON			;power-up timer
    	'CONFIG BOREN = ON			;brown-out reset
    	'CONFIG BORV = 27			;brown-out reset value (2,7V)
    	'CONFIG WDTEN = OFF			;watchdog timer
    	'CONFIG WDTPS = 128			;1:128 WDT prescalar
    	'CONFIG PBADEN = OFF			;analog port B<4:0> 
    	'CONFIG STVREN = ON			;;stack overflow reset
    	'CONFIG LVP = OFF			;low voltage programming
    	'CONFIG XINST = OFF			;Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
    	'CONFIG DEBUG = OFF			;no debug
		'CONFIG CCP2MX = PORTBE   	        ;CCP2 input/output is multiplexed with RB3

    Declare ALL_DIGITAL TRUE
    Declare HSERIAL_BAUD  = 9600          ;Transmissiesnelheid van de data over de bus
    Declare HSERIAL_RCSTA = %10010000     ;Bit7:Enable serial port / Bit4:Continu ontvangen
    Declare HSERIAL_TXSTA = %00100000     ;Bit5:Transmitpin ingeschakeld (TXEN (Transmit ENable) = 1)
    Declare HSERIAL_CLEAR On
    
    Declare LCD_DATAUS 75     ;LCD timing voor wat oudere 16x2 displays (default = 50)

    Dim     commStart   As Byte
    Symbol  LED         = LATA.5
    
    Cls
    Print At 1,1, " Knutselaar.eu  " ; Standaard 16x2 HD44780 default Proton aansluiting

loop:

    HSerIn 2000 , Timeout , [Dec commStart] 'Hier luistert de PIC gedurende 2 seconden of er data binnenkomt.
                                            'Er wordt geluisterd naar getallen (gestuurd in string (DEC) formaat b.v. "34") (commStart)
    
    If commStart = 34 Then
        HSerOut ["PIC 18F25K22 bootloader test programma",13]
    Else                                                     
        HSerOut ["Data Ontvangen: ",Dec commStart ,13]
    End If
        
    GoTo skipTimeout

    Timeout:                                'Na 2 seconden geen data gaat het naar "Timeout"
    
    HSerOut ["PIC ontvangt geen Data  ",13]
    
    skipTimeout:
    
    Toggle LED

    GoTo loop

End


