/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

/* Device header file */
#if defined(__XC16__)
    #include <xc.h>
#elif defined(__C30__)
    #if defined(__dsPIC33E__)
    	#include <p33Exxxx.h>
    #elif defined(__dsPIC33F__)
    	#include <p33Fxxxx.h>
    #endif
#endif

#include <stdint.h>          /* For uint16_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include "dsp.h"
/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

extern fractional AdcBufferA[32]__attribute__((space(dma)));
extern fractional AdcBufferB[32]__attribute__((space(dma)));
extern fractional DacBufferA[32]__attribute__((space(dma)));
extern fractional DacBufferB[32]__attribute__((space(dma)));

#define FP 40000000
#define BAUDRATE 9600
#define BRGVAL ((FP/BAUDRATE)/16) - 1


void InitApp(void)
{
    /* Inicializacion del Timmer 5, el cual maneja al ADC */
    T5CONbits.TON = 0;      // Disable Timer
    T5CONbits.TCS = 0;      // Select external clock source
    T5CONbits.TGATE = 0;    // Disable Gated Timer mode
    T5CONbits.TCKPS = 0b00; // Select 1:1 Prescaler
    TMR5 = 0x00;            // Clear timer register
    PR5 = 0x03FF;           // Load the period value f = 39062.5
    IPC7bits.T5IP = 0x01;   // Set Timer5 Interrupt Priority Level
    IFS1bits.T5IF = 0;      // Clear Timer5 Interrupt Flag
    IEC1bits.T5IE = 0;      // Enable Timer5 interrupt
    T5CONbits.TON = 1;      // Start Timer
    
    //************************************************************************//
    
    //Configuracion ADC
    
    AD1CON1bits.FORM = 3;   // Datos fraccionales con signo
    AD1CON1bits.SSRC = 0b100;   // Timer 5 es el temporizador de muestreo.
    AD1CON1bits.ASAM = 1;   // 1 = muestreo automatico. 0 = muestreo manual
    AD1CON2bits.VCFG = 4;   // 4 = Vdd y Vss como referencia de voltaje //0
    AD1CON1bits.AD12B = 1;  // 1 = 12 bits, 0 = 10 bits
    AD1CON2bits.ALTS = 1;   // Alternate Input Sample Mode Select Bit. Muestreo Ping-Pong?
    AD1CON2bits.CHPS = 0;   // Muestreo Canal CH0
    AD1CON3bits.ADRC = 0;   // Clock de conversion derivado clock general
    AD1CON3bits.ADCS = 9;   // TAD = TCY * (ADCS + 1) = (1/40M) * 10 = 250ns (4 MHz)
    AD1CON1bits.ADDMABM = 1;// DMA buffers are built in conversion order mode
    AD1CON2bits.SMPI = 0;   // Incrementa el DMA luego de cada muestra/conversion
    AD1CHS0bits.CH0SA = 0;  // Entrada positiva en AN0
    AD1CHS0bits.CH0NA = 0;  // MUXA -ve input selection (VREF-) for CH0
    AD1PCFGL = 0xFFFF;      //Configuro todos los bits como digitales. 1 = D 0 = A
    AD1PCFGLbits.PCFG0 = 0; // Defino AN0 como analogico. Primer bit
    IFS0bits.AD1IF = 0;     // Clear the Analog-to-Digital interrupt flag bit
    IEC0bits.AD1IE = 0;     // Do Not Enable Analog-to-Digital interrupt
    AD1CON1bits.ADON = 1;   // Turn on the ADC

    //DMA 2 Asignado a ADC
    
    DMA2CONbits.AMODE = 0; /* Register Indirect with Post Increment */
    DMA2CONbits.MODE = 2; /* Continuous Mode with Ping-Pong Enabled */
    DMA2CONbits.DIR = 0; /* Transferencia de periferico a RAM */
    //DMA2PAD = (volatile unsigned int)&DAC1RDAT; /* Point DMA to DAC1RDAT */
    DMA2PAD = 0x0300; //DMA lee desde periferico ADC
    DMA2CNT = 31; /* 32 DMA Request */
    DMA2REQ = 13; //Configuro DMA para ADC1
    DMA2STA = __builtin_dmaoffset(AdcBufferA);
    DMA2STB = __builtin_dmaoffset(AdcBufferB); 
    IFS1bits.DMA2IF = 0; /* Clear DMA Interrupt Flag */
    IEC1bits.DMA2IE = 1; /* Set DMA Interrupt Enable Bit */
    DMA2CONbits.CHEN = 1; /* Enable DMA Channel 0 */

    //DMA 1 Asignado a Canal Izquierdo del DAC
    
    DMA1CONbits.AMODE = 0; /* Register Indirect with Post Increment */
    DMA1CONbits.MODE = 2; /* Continuous Mode with Ping-Pong Enabled */
    DMA1CONbits.DIR = 1; /* Ram-to-Peripheral Data Transfer */
    DMA1PAD = (volatile unsigned int)&DAC1LDAT; /* Point DMA to DAC1LDAT */
    DMA1CNT = 31; /* 32 DMA Request */
    DMA1REQ = 79; /* Select DAC1LDAT as DMA Request Source */
    DMA1STA = __builtin_dmaoffset(DacBufferA);
    DMA1STB = __builtin_dmaoffset(DacBufferB);   
    IFS0bits.DMA1IF = 0; /* Clear DMA Interrupt Flag */
    IEC0bits.DMA1IE = 1; /* Set DMA Interrupt Enable Bit */
    DMA1CONbits.CHEN = 1; /* Enable DMA Channel 1 */
    
    //Configuracion DAC
    DAC1STATbits.ROEN = 1; /* Right Channel DAC Output Enabled */
    DAC1STATbits.LOEN = 1; /* Left Channel DAC Output Enabled */
    DAC1STATbits.RITYPE = 1; /* Right Channel Interrupt if FIFO is Empty */
    DAC1STATbits.LITYPE = 1; /* Left Channel Interrupt if FIFO is Empty */
    DAC1CONbits.AMPON = 0; /* Amplifier is Disabled During Sleep/Idle Modes */
    DAC1CONbits.DACFDIV = 15; /* Divide Clock by 1 (Assumes Clock is 25.6MHz) */
    DAC1CONbits.FORM = 1; /* Data Format is signed */
    DAC1CONbits.DACEN = 1; /* DAC1 Module Enabled */
    //DAC1DFLT = 0x0000;          /* Cuando FIFO vacia registro en cero */
    
    
    
    //UART
        
    TRISBbits.TRISB2 = 0;
    RPINR18bits.U1RXR = 5;  //Defino puerto de recepcion
    RPOR9bits.RP19R = 6;    //Defino puerto de transmision

    U1MODEbits.UARTEN = 0;  // Enable UART
    
    U1MODEbits.STSEL = 0;   // 1-Stop bit
    U1MODEbits.PDSEL = 0;   // No Parity, 8-Data bits
    U1MODEbits.ABAUD = 0;   // Auto-Baud disabled
    U1MODEbits.BRGH = 0;    // Standard-Speed mode
    U1BRG = BRGVAL;         // Baud Rate setting for 9600
    U1STAbits.URXISEL = 0;
    IEC0bits.U1RXIE = 1;    // Activa la interrupcion por valores recibidos
    
    IFS0bits.U1RXIF = 0;
    U1MODEbits.UARTEN = 1;  // Enable UART
    
    U1STAbits.UTXEN = 1;    // Activa la transmision de la UART
}



