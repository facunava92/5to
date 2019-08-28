'****************************************************************
'*  Name    : 40PIC Display, Knipper, Poort en Sound Test       *
'*  Author  : Knutselaar.eu                                     *
'*  Notice  : Copyright (c) 2014                                *
'*          : All Rights Reserved                               *
'*  Date    : 07-02-2014                                        *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************
Device 16F877A            
;Config HS_OSC , WDT_OFF, PWRTE_ON, LVP_OFF  (Zijn in bootloader geset)

    Xtal = 20
    Declare All_Digital TRUE            ;Alle ingangen digitaal
    Declare LCD_DataUs 85               ;LCD timing voor wat oudere 16x2 displays (default = 50) 
    
    Declare Hserial_Baud  = 9600          ;Transmissiesnelheid van de data over de bus
    Declare Hserial_RCSTA = %10010000     ;Bit7:Enable serial port / Bit4:Continu ontvangen
    Declare Hserial_TXSTA = %00100000     ;Bit5:Transmitpin ingeschakeld (TXEN (Transmit ENable) = 1)
    Declare Hserial_Clear On

    Symbol Speaker = PORTD.0
    Symbol Red = PORTD.1
    Dim    commStart   As Byte 

    Cls
    Print At 1,1, " Knutselaar.eu  "   ; HD44780 default Proton aansluiting
    Print At 2,2, "WWWWWWWWWWWWWWWW"

    Sound Speaker, [115,20]  

loop:

    HSerIn 2000 , Timeout , [Dec commStart] 'Hier luistert de PIC gedurende 2 seconden of er data binnenkomt.
                                            'Er wordt geluisterd naar getallen (gestuurd in string (DEC) formaat b.v. "34") (commStart)
    
    If commStart = 34 Then
        HSerOut ["PIC 16F877A bootloader test programma",13]
    Else                                                     
        HSerOut ["Data Ontvangen: ",Dec commStart ,13]
    End If
        
    GoTo skipTimeout

    Timeout:                                'Na 2 seconden geen data gaat het naar "Timeout"
    
    HSerOut ["PIC ontvangt geen Data  ",13]
    
    skipTimeout:                      
    Toggle Red                                   
    GoTo loop                  

End                         

