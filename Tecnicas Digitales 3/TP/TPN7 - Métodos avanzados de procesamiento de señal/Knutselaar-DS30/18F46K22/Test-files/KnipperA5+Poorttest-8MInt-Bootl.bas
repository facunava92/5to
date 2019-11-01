'****************************************************************
'*  Name    : 40PIC-KnipperA5-Serial-port-test.BAS              *
'*  Author  : Knutselaar.eu                                     *
'*  Date    : 19/08/2016                                        *
'*  Version : 2.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************

Device 18F46K22

;Config settingen zitten reeds in het bootloader programma.
;Onderstaand hoe deze settingen ingesteld zijn.
     ;config FOSC = INTIO67			     ;interne oscillator A6, A7 poortfuntie
     ;config PLLCFG = OFF                ;Oscillator used directly  
     ;config FCMEN = OFF			     	;Fail-Safe Clock Monitor disabled
     ;config IESO = OFF			         ;internal external switchover mode
     ;config PWRTEN = On			     	;power-up timer  (18F46K22)
     ;config BOREN = On			         ;brown-out reset
     ;config BORV = 285			         ;brown-out reset value (2,85V) (18F46K22)
     ;config WDTEN = OFF			     	;watchdog timer
     ;config WDTPS = 128			     	;1:128 WDT prescalar
     ;config PBADEN = OFF			     ;analog port B<4:0> 
     ;config STVREN = On			     	;;stack overflow reset
     ;config LVP = OFF			         ;low voltage programming
     ;config XINST = OFF			     	;Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
     ;config Debug = OFF			     	;no debug
     ;config CCP2MX = PORTB3             ;CCP2 input/output is multiplexed with RB3 
  

    Xtal = 8

    OSCCON = %01100110  ;8 mhz,int-osc
    TRISA  = %11011111  ;A5 output
    ANSELA = %00000000  ;Port A Digital
    ANSELC = %00000000  ;Port C Digital

    Declare Hserial_Baud  = 9600          ;Transmissiesnelheid van de data over de bus
    Declare Hserial_RCSTA = %10010000     ;Bit7:Enable serial port / Bit4:Continu ontvangen
    Declare Hserial_TXSTA = %00100000     ;Bit5:Transmitpin ingeschakeld (TXEN (Transmit ENable) = 1)
    Declare Hserial_Clear On
    
    Declare LCD_DataUs 75     ;LCD timing voor wat oudere 16x2 displays (default = 50)

    Dim     commStart   As Byte
    Symbol  LED         = LATA.5
    
    Cls
    Print At 1,1, " Knutselaar.eu  " ; Standaard 16x2 HD44780 default Proton aansluiting

loop:

    HSerIn 2000 , Timeout , [Dec commStart] 'Hier luistert de PIC gedurende 2 seconden of er data binnenkomt.
                                            'Er wordt geluisterd naar getallen (gestuurd in string (DEC) formaat b.v. "34") (commStart)
    
    If commStart = 34 Then
        HSerOut ["PIC 18F46K22 bootloader test programma",13]
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
