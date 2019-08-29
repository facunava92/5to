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

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* <Initialize variables in user.h and insert code for user algorithms.> */

extern unsigned int RightBufferA[32]__attribute__((space(dma)));
extern unsigned int RightBufferB[32]__attribute__((space(dma)));
extern unsigned int LeftBufferA[32]__attribute__((space(dma)));
extern unsigned int LeftBufferB[32]__attribute__((space(dma)));

void InitApp(void)
{
    /* TODO Initialize User Ports/Peripherals/Project here */
    /* Setup analog functionality and port direction */

    /* Initialize peripherals */
//    Ej1();    Ej2();      Ej3();    Ej4();
    Ej5();
}

void LED(void)
{
    TRISBbits.TRISB2 = 0;   //LED1
    TRISBbits.TRISB3 = 0;   //LED2
    TRISCbits.TRISC3 = 0;   //D0 para osciloscopio
    TRISBbits.TRISB7 = 1;   //BOTON1
    TRISBbits.TRISB10 = 1;  //BOTON2
    
}

void TIMER(void)
{
    T3CONbits.TON = 0; // Stop any 16-bit Timer3 operation
    T2CONbits.TON = 0; // Stop any 16/32-bit Timer2 operation
    T2CONbits.T32 = 1; // Enable 32-bit Timer mode
    T2CONbits.TCS = 0; // Select internal instruction cycle clock
    T2CONbits.TGATE = 0; // Disable Gated Timer mode
    T2CONbits.TCKPS = 0b00; // Select 1:1 Prescaler
    TMR3 = 0x00; // Clear 32-bit Timer (msw)
    TMR2 = 0x00; // Clear 32-bit Timer (lsw)
    PR3 = 0x0131; // Load 32-bit period value (msw)
    PR2 = 0x2D00; // Load 32-bit period value (lsw)
    IPC2bits.T3IP = 5; // Set Timer3 Interrupt Priority Level
    IFS0bits.T3IF = 0; // Clear Timer3 Interrupt Flag
    IEC0bits.T3IE = 1; // Enable Timer3 interrupt
    T2CONbits.TON = 1; // Start 32-bit Timer
    }

void PLL(void){
    // Configure PLL prescaler, PLL postscaler, PLL divisor
    PLLFBD=30; // M = 32
    CLKDIVbits.PLLPOST=0; // N2 = 2
    CLKDIVbits.PLLPRE=0; // N1 = 2
    // Initiate Clock Switch to Primary Oscillator with PLL (NOSC = 0b011)
    __builtin_write_OSCCONH(0x03);
    __builtin_write_OSCCONL(OSCCON | 0x01);
    // Wait for Clock switch to occur
    while (OSCCONbits.COSC != 0b011);
    // Wait for PLL to lock
    while(OSCCONbits.LOCK!=1) {};
    
    /*RegistCro de control del clock auxiliar*/
    ACLKCONbits.APSTSCLR = 0b111; // Divido Fvco por 1
    ACLKCONbits.SELACLK = 0b000; // Seleccion del PLL como fuente del clk aux 
}

void DAC(void){
    DAC1CONbits.DACEN = 1; /* DAC1 Module Enabled */
    DAC1STATbits.ROEN = 1; /* Right Channel DAC Output Enabled */
    DAC1STATbits.LOEN = 1; /* Left Channel DAC Output Enabled */
    DAC1STATbits.RITYPE = 1; /* Right Channel Interrupt if FIFO is Empty */
    DAC1STATbits.LITYPE = 1; /* Left Channel Interrupt if FIFO is Empty */
    DAC1CONbits.AMPON = 0; /* Amplifier Disabled During Sleep and Idle Modes */
    DAC1CONbits.DACFDIV = 15; /* Divide Clock by 16 (Assumes Clock is 160MHz) */
    DAC1CONbits.FORM = 1; /* Data Format is Signed (2's complemet) */
    DAC1DFLT = 0x0000; /* Default value set to Midpoint when FORM = 1 */
 //   IFS4bits.DAC1RIF = 0; /* Clear Right Channel Interrupt Flag */
 //   IFS4bits.DAC1LIF = 0; /* Clear Left Channel Interrupt Flag */
 //   IEC4bits.DAC1RIE = 1; /* Right Channel Interrupt Enabled */
 //   IEC4bits.DAC1LIE = 1; /* Left Channel Interrupt Enabled */
}

 /* DMA Channel 0 set to DAC1RDAT */
void DMA_CH0(void){
    DMA0CONbits.AMODE = 0; /* Register Indirect with Post Increment */
    DMA0CONbits.MODE = 2; /* Continuous Mode with Ping-Pong Enabled */
    DMA0CONbits.DIR = 1; /* Ram-to-Peripheral Data Transfer */
    DMA0PAD = (volatile unsigned int)&DAC1RDAT; /* Point DMA to DAC1RDAT */
    DMA0CNT = 31; /* 32 DMA Request */
    DMA0REQ = 78; /* Select DAC1RDAT as DMA Request Source */
    DMA0STA = __builtin_dmaoffset(RightBufferA);
    DMA0STB = __builtin_dmaoffset(RightBufferB);
    IFS0bits.DMA0IF = 0; /* Clear DMA Interrupt Flag */
    IEC0bits.DMA0IE = 1; /* Set DMA Interrupt Enable Bit */
    DMA0CONbits.CHEN = 1; /* Enable DMA Channel 0 */
}

void DMA_CH1(void){
    DMA1CONbits.AMODE = 0; /* Register Indirect with Post Increment */
    DMA1CONbits.MODE = 2; /* Continuous Mode with Ping-Pong Enabled */
    DMA1CONbits.DIR = 1; /* Ram-to-Peripheral Data Transfer */
    DMA1PAD = (volatile unsigned int)&DAC1LDAT; /* Point DMA to DAC1RDAT */
    DMA1CNT = 31; /* 32 DMA Request */
    DMA1REQ = 79; /* Select DAC1LDAT as DMA Request Source */
    DMA1STA = __builtin_dmaoffset(LeftBufferA);
    DMA1STB = __builtin_dmaoffset(LeftBufferB);
    IFS0bits.DMA1IF = 0; /* Clear DMA Interrupt Flag */
    IEC0bits.DMA1IE = 1; /* Set DMA Interrupt Enable Bit */
    DMA1CONbits.CHEN = 1; /* Enable DMA Channel 0 */
}

void DMA_CH2(void){
 /* DMA Channel 2 set to ADC1 */
    DMA2CONbits.AMODE = 0; /* Register Indirect with Post Increment */
    DMA2CONbits.MODE = 2; /* Continuous Mode with Ping-Pong Enabled */
    DMA2CONbits.DIR = 0; /*Read from Peripheral address, write to DPSRAM address*/
    DMA2PAD = (volatile unsigned int)&ADC1BUF0; /* Point DMA to ADC1BUF0 */
    DMA2CNT = 31; /* 32 DMA Request */
    DMA2REQ = 13; /* Select DAC1RDAT as ADC Convert Done Source */
    DMA2STA = __builtin_dmaoffset(RightBufferB);
    DMA2STB = __builtin_dmaoffset(RightBufferA);
    IFS1bits.DMA2IF = 0; /* Clear DMA Interrupt Flag */
    IEC1bits.DMA2IE = 1; /* Set DMA Interrupt Enable Bit */
    DMA2CONbits.CHEN = 1; /* Enable DMA Channel 1 */
}

    void TIMER_5(void){    
    T5CONbits.TON = 0;      // Stop any 16-bit Timer3 operation
    T5CONbits.TCS = 0;      // Select internal instruction cycle clock
    T5CONbits.TGATE = 0;    // Disable Gated Timer mode
    T5CONbits.TCKPS = 0b00; // Select 1:1 Prescaler
    TMR2 = 0x00; // Clear 32-bit Timer (lsw)
    PR5 = 0x0400;           // Load 32-bit period value (msw)
    IPC7bits.T5IP = 0x01;   // Set Timer3 Interrupt Priority Level
    IFS1bits.T5IF = 0;      // Clear Timer3 Interrupt Flag
    IEC1bits.T5IE = 0;      // Enable Timer3 interrupt
    T5CONbits.TON = 1;      // Start 16-bit Timer
    }

void ADC(void){
    AD1CON1bits.AD12B = 1;  // Select 12-bit mode
    AD1CON2bits.VCFG = 0;   // AVDD - AVss reference
    AD1CON3bits.ADRC = 0;   //ADC Clock is derived from Systems Clock
    AD1CON3bits.ADCS = 9;   // ADC Conversion Clock TAD = TCY * (ADCS + 1) = (1/40M) * 3 =
                            // 75 ns (13.3 MHz)
                            // ADC Conversion Time for 10-bit Tconv = 12 * TAD = 900 ns (1.1 MHz)
    AD1PCFGL = 0xFFFF;
    AD1PCFGLbits.PCFG0 = 0; // AN0 as Analog Input
    AD1CON2bits.CHPS = 0;   // Converts channel CH0
    AD1CHS0bits.CH0SA = 0;  // Select AN0 for CH0 +ve input
    AD1CHS0bits.CH0NA = 0;  // Select AN0 for CH0 +ve input
    AD1CON1bits.ASAM = 1;   // ADC Sample Control: Sampling begins immediately after
    AD1CON1bits.FORM = 3;   // Data Output Format: Signed Fraction (Q15 format)
                            // conversion
    AD1CON2bits.SMPI = 0; // SMPI must be 0
    
    
    AD1CON1bits.SSRC = 4; // Timer5 generates SOC trigger
    AD1CON3bits.SAMC = 5; // Auto Sample Time = 5 * TAD
    
    AD1CON1bits.ADON = 1; // Turn on the ADC
}

void COM_UART(void){
U1MODEbits.STSEL = 0; // 1-stop bit
U1MODEbits.PDSEL = 0; // No Parity, 8-data bits
U1MODEbits.ABAUD = 0; // Auto-Baud disabled
U1MODEbits.BRGH = 0; // Standard-Speed mode
U1BRG = BRGVAL; // Baud Rate setting for 9600
U1STAbits.URXISEL = 1; //Enable interrupt after one RX character is received;
U1MODEbits.UARTEN = 1; // Enable UART

}

void Ej1(void)
{
    LED();
}

void Ej2(void){
    PLL();   
    TIMER();
}

void Ej3(void){
    DMA_CH0();
    DMA_CH1();
    DAC();
}
    
void Ej4(void){
    Ej3();
    DMA_CH2();
    TIMER_5();
    ADC();
}

void Ej5(void){
    PLL();   
    ADC();
}