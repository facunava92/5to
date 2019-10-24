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
#include <dsp.h>           /* Incluye libreria para DSP                       */
#include "user.h"            /* variables/params used by user.c               */

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* <Initialize variables in user.h and insert code for user algorithms.> */
extern unsigned int Data_ADC_BufferA[32] __attribute__((space(dma)));
extern unsigned int Data_ADC_BufferB[32] __attribute__((space(dma)));
extern unsigned int Data_DAC_BufferA[32] __attribute__((space(dma)));
extern unsigned int Data_DAC_BufferB[32] __attribute__((space(dma)));

void Init_GPIO(void)
{
    /* Inicializar GPIO, Leds y Botonoes */
    TRISBbits.TRISB2 = 0; //Configurar puerto B2 (led1) como salida
    TRISBbits.TRISB7 = 1; //Configurar puerto B7 (boton1) como entrada
}
void Init_DAC(void)
{ 
// Con DMA
// DMA Channel 1 set to DAC1LDAT (Config canal 1 DMA con canal Izquierdo del DAC)

DMA0CONbits.AMODE = 0;                       // Register Indirect with Post Increment 
DMA0CONbits.MODE = 2;                        // Continuous Mode with Ping-Pong Enabled 
DMA0CONbits.DIR = 1;                         // Ram-to-Peripheral Data Transfer 
DMA0PAD = (volatile unsigned int)&DAC1RDAT;  // Point DMA to DAC1LDAT 
DMA0CNT = 31;                                // 32 DMA Request 
DMA0REQ = 78;                                // Select DAC1LDAT as DMA Request Source 
DMA0STA = __builtin_dmaoffset(Data_DAC_BufferA);
DMA0STB = __builtin_dmaoffset(Data_DAC_BufferB);
IFS0bits.DMA0IF = 0;                         // Clear DMA Interrupt Flag 
IEC0bits.DMA0IE = 1;                         // Set DMA Interrupt Enable Bit 
DMA0CONbits.CHEN = 1;                        // Enable DMA Channel 1 

// DAC1 Code 

DAC1STATbits.ROEN = 1;                       // Habilitacion canal izquierdo del DAC
DAC1STATbits.RITYPE = 1;                     // Interrupcion del canal izquierdo si la FIFO esta vacia
DAC1CONbits.AMPON = 0;                       // Desabilita el amplificador durante los modos Idle y Sleep 
DAC1CONbits.DACFDIV = 0b0001111;             // Divide el Clock por 16  (El Clock es Fvco=160Mhz/256)
DAC1CONbits.FORM = 1;                        // Formato de dato Signado 
DAC1DFLT = 0x8000;                           // Cuando FIFO vacia registro en cero
DAC1CONbits.DACEN = 1;                       // Habilitacion del modulo DAC1 
 
}

void Init_ADC(void)
{

///////////////////////Config DMA CH2 con ADC1
DMA2CONbits.AMODE = 0;                      // Register Indirect with Post Increment 
DMA2CONbits.MODE = 2;                       // Continuous Mode with Ping-Pong Enabled 
DMA2CONbits.DIR = 0;                        // Lee desde el registro del perisferico y escribe sobre la RAM
DMA2PAD = (volatile unsigned int)&ADC1BUF0; // Apunta el DMA al ADC1
DMA2CNT = 31;                               // 32 DMA Request 
DMA2REQ = 0b0001101;                        // Seleccion del ADC1 como fuente de solicitud de interrupacion al DMA
DMA2STA = __builtin_dmaoffset(Data_ADC_BufferA);
DMA2STB = __builtin_dmaoffset(Data_ADC_BufferB);
IFS1bits.DMA2IF = 0;                        // Clear DMA Interrupt Flag 
IEC1bits.DMA2IE = 1;                        // Set DMA Interrupt Enable Bit 
DMA2CONbits.CHEN = 1;                       // Enable DMA Channel 0
   
////////////////////////Config ADC1
AD1CON1bits.AD12B = 1;                      //Modo de operacion de ADC de 12 bits y canal simple
AD1CON2bits.VCFG = 0b100;                   //Seleccion de Vdd y Vss como voltaje de referencia
AD1CON3bits.ADRC = 0;                       //Seleccion del clock del adc dervidado del clock del sistema (Tcy=Tad)
AD1CON3bits.ADCS = 0b00001001;              //Divisor del Clock por 10 (Tad= Tcy * (ADCS+1) = Tcy * 10)
AD1PCFGL = 0xFFFF;                          //Configurar todos los 32 bits como entradas digitales (*Referencia: pag 50, Manual ADC)
AD1PCFGLbits.PCFG0 = 0;                     //Configurar solo AN0 como entrada analógica      (*Referencia: pag 50, Manual ADC) 
AD1CON2bits.CHPS = 0b00;                    //Conversion solo en el canal 0
AD1CHS0bits.CH0SA = 0;                      //Seleccion de AN0 como entrada positiva para el muestreo del canal 0
AD1CHS0bits.CH0NA = 0;                      //Seleccion de Vref- como entrada negativa para el muestreo del canal 0
AD1CON1bits.ASAM = 1;                       //Habilita muestreo automatico
AD1CON1bits.FORM = 0b11;                    //Tipo de datos fraccional con signo
AD1CON2bits.SMPI = 0b0000;                  //Incrementa direccion del DMA por cada operacion muestra/conversion
AD1CON1bits.SSRC = 0b100;                   //Timer 5 como temporizador del ADC1
AD1CON3bits.SAMC = 0b00000101;              // Periodo de muestreo = 5 x Tad = SAMC*Tad
IFS0bits.AD1IF = 0;       
IEC0bits.AD1IE = 0;  
/////////////Configuracion Timer 5///////////////////////
T5CONbits.TON = 0;                          // Deshabilita timer 5 (Frena cualquier actividad que este realizando)
T5CONbits.TCS = 0;                          // Entrada de clk derivada del reloj de instrucciones interno Fcy=Fosc/2= 80Mhz/2=40MIPS(modo timer)
T5CONbits.TGATE = 0;                        // Desabilita la entrada de reloj de modo timer por compuertas
T5CONbits.TCKPS = 0b00;                     // Selecciona el preescaler en modo 1:1
TMR5 = 0x00;                                // Limpia los registros del timer 
PR5 = 0x3FF;                                // Carga el valor de Periodo del timer de 16 bits = n°de cuentas - 1 = Fcy/fdeseada = 40MIPS/39062.5= 1024 cuentas = PR5+1
IPC7bits.T5IP = 0x01;                       // Seteo del nivel de prioridad de interrupcion del timer 5
IFS1bits.T5IF = 0;                          // Limpia el Flag del timer 5
IEC1bits.T5IE = 0;                          // Deshablitia la interrupcion del timer 5 (no hace falta ya que se usa para comandar el ADC)
T5CONbits.TON = 1;                          // Inicia el Timer 5 de 16 bits
///////////////////////////////////////////////////////
AD1CON1bits.ADON = 1;                       //Encender el ADC1
}