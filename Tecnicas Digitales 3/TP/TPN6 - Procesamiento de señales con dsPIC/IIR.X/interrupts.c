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

#include <stdint.h>        /* Includes uint16_t definition   */
#include <stdbool.h>       /* Includes true/false definition */
#include <dsp.h>
/******************************************************************************/
/* Interrupt Vector Options                                                   */
/******************************************************************************/
/*                                                                            */
/* Refer to the C30 (MPLAB C Compiler for PIC24F MCUs and dsPIC33F DSCs) User */
/* Guide for an up to date list of the available interrupt options.           */
/* Alternately these names can be pulled from the device linker scripts.      */
/*                                                                            */
/* dsPIC33F Primary Interrupt Vector Names:                                   */
/*                                                                            */
/* _INT0Interrupt      _C1Interrupt                                           */
/* _IC1Interrupt       _DMA3Interrupt                                         */
/* _OC1Interrupt       _IC3Interrupt                                          */
/* _T1Interrupt        _IC4Interrupt                                          */
/* _DMA0Interrupt      _IC5Interrupt                                          */
/* _IC2Interrupt       _IC6Interrupt                                          */
/* _OC2Interrupt       _OC5Interrupt                                          */
/* _T2Interrupt        _OC6Interrupt                                          */
/* _T3Interrupt        _OC7Interrupt                                          */
/* _SPI1ErrInterrupt   _OC8Interrupt                                          */
/* _SPI1Interrupt      _DMA4Interrupt                                         */
/* _U1RXInterrupt      _T6Interrupt                                           */
/* _U1TXInterrupt      _T7Interrupt                                           */
/* _ADC1Interrupt      _SI2C2Interrupt                                        */
/* _DMA1Interrupt      _MI2C2Interrupt                                        */
/* _SI2C1Interrupt     _T8Interrupt                                           */
/* _MI2C1Interrupt     _T9Interrupt                                           */
/* _CNInterrupt        _INT3Interrupt                                         */
/* _INT1Interrupt      _INT4Interrupt                                         */
/* _ADC2Interrupt      _C2RxRdyInterrupt                                      */
/* _DMA2Interrupt      _C2Interrupt                                           */
/* _OC3Interrupt       _DCIErrInterrupt                                       */
/* _OC4Interrupt       _DCIInterrupt                                          */
/* _T4Interrupt        _DMA5Interrupt                                         */
/* _T5Interrupt        _U1ErrInterrupt                                        */
/* _INT2Interrupt      _U2ErrInterrupt                                        */
/* _U2RXInterrupt      _DMA6Interrupt                                         */
/* _U2TXInterrupt      _DMA7Interrupt                                         */
/* _SPI2ErrInterrupt   _C1TxReqInterrupt                                      */
/* _SPI2Interrupt      _C2TxReqInterrupt                                      */
/* _C1RxRdyInterrupt                                                          */
/*                                                                            */
/* dsPIC33E Primary Interrupt Vector Names:                                   */
/*                                                                            */
/* _INT0Interrupt     _IC4Interrupt      _U4TXInterrupt                       */
/* _IC1Interrupt      _IC5Interrupt      _SPI3ErrInterrupt                    */
/* _OC1Interrupt      _IC6Interrupt      _SPI3Interrupt                       */
/* _T1Interrupt       _OC5Interrupt      _OC9Interrupt                        */
/* _DMA0Interrupt     _OC6Interrupt      _IC9Interrupt                        */
/* _IC2Interrupt      _OC7Interrupt      _PWM1Interrupt                       */
/* _OC2Interrupt      _OC8Interrupt      _PWM2Interrupt                       */
/* _T2Interrupt       _PMPInterrupt      _PWM3Interrupt                       */
/* _T3Interrupt       _DMA4Interrupt     _PWM4Interrupt                       */
/* _SPI1ErrInterrupt  _T6Interrupt       _PWM5Interrupt                       */
/* _SPI1Interrupt     _T7Interrupt       _PWM6Interrupt                       */
/* _U1RXInterrupt     _SI2C2Interrupt    _PWM7Interrupt                       */
/* _U1TXInterrupt     _MI2C2Interrupt    _DMA8Interrupt                       */
/* _AD1Interrupt      _T8Interrupt       _DMA9Interrupt                       */
/* _DMA1Interrupt     _T9Interrupt       _DMA10Interrupt                      */
/* _NVMInterrupt      _INT3Interrupt     _DMA11Interrupt                      */
/* _SI2C1Interrupt    _INT4Interrupt     _SPI4ErrInterrupt                    */
/* _MI2C1Interrupt    _C2RxRdyInterrupt  _SPI4Interrupt                       */
/* _CM1Interrupt      _C2Interrupt       _OC10Interrupt                       */
/* _CNInterrupt       _QEI1Interrupt     _IC10Interrupt                       */
/* _INT1Interrupt     _DCIEInterrupt     _OC11Interrupt                       */
/* _AD2Interrupt      _DCIInterrupt      _IC11Interrupt                       */
/* _IC7Interrupt      _DMA5Interrupt     _OC12Interrupt                       */
/* _IC8Interrupt      _RTCCInterrupt     _IC12Interrupt                       */
/* _DMA2Interrupt     _U1ErrInterrupt    _DMA12Interrupt                      */
/* _OC3Interrupt      _U2ErrInterrupt    _DMA13Interrupt                      */
/* _OC4Interrupt      _CRCInterrupt      _DMA14Interrupt                      */
/* _T4Interrupt       _DMA6Interrupt     _OC13Interrupt                       */
/* _T5Interrupt       _DMA7Interrupt     _IC13Interrupt                       */
/* _INT2Interrupt     _C1TxReqInterrupt  _OC14Interrupt                       */
/* _U2RXInterrupt     _C2TxReqInterrupt  _IC14Interrupt                       */
/* _U2TXInterrupt     _QEI2Interrupt     _OC15Interrupt                       */
/* _SPI2ErrInterrupt  _U3ErrInterrupt    _IC15Interrupt                       */
/* _SPI2Interrupt     _U3RXInterrupt     _OC16Interrupt                       */
/* _C1RxRdyInterrupt  _U3TXInterrupt     _IC16Interrupt                       */
/* _C1Interrupt       _USB1Interrupt     _ICDInterrupt                        */
/* _DMA3Interrupt     _U4ErrInterrupt    _PWMSpEventMatchInterrupt            */
/* _IC3Interrupt      _U4RXInterrupt     _PWMSecSpEventMatchInterrupt         */
/*                                                                            */
/* For alternate interrupt vector naming, simply add 'Alt' between the prim.  */
/* interrupt vector name '_' and the first character of the primary interrupt */
/* vector name.  There is no Alternate Vector or 'AIVT' for the 33E family.   */
/*                                                                            */
/* For example, the vector name _ADC2Interrupt becomes _AltADC2Interrupt in   */
/* the alternate vector table.                                                */
/*                                                                            */
/* Example Syntax:                                                            */
/*                                                                            */
/* void __attribute__((interrupt,auto_psv)) <Vector Name>(void)               */
/* {                                                                          */
/*     <Clear Interrupt Flag>                                                 */
/* }                                                                          */
/*                                                                            */
/* For more comprehensive interrupt examples refer to the C30 (MPLAB C        */
/* Compiler for PIC24 MCUs and dsPIC DSCs) User Guide in the                  */
/* <C30 compiler instal directory>/doc directory for the latest compiler      */
/* release.  For XC16, refer to the MPLAB XC16 C Compiler User's Guide in the */
/* <XC16 compiler instal directory>/doc folder.                               */
/*                                                                            */
/******************************************************************************/
/* Interrupt Routines                                                         */
/******************************************************************************/




/* TODO Add interrupt routine code here. */

//Registro de control del DMA: DMACS1

// PPST= 1 -> B memory selected 
// PPST =0 -> A memory selected

// PPST1 -> Canal 1 del DMA
// PPST2 -> Canal 2 del DMA

// Ejemplo PPST0=1 -> Està seleccionado DMA0STB 




extern fractional AdcBufferA[32]__attribute__((space(dma)));
extern fractional AdcBufferB[32]__attribute__((space(dma)));
extern fractional DacBufferA[32]__attribute__((space(dma)));
extern fractional DacBufferB[32]__attribute__((space(dma)));

extern IIRTransposedStruct lowpassfilter;
extern IIRTransposedStruct bandpassfilter;
extern IIRTransposedStruct highpassfilter;

extern fractional AdcBufferA[32]__attribute__((space(dma)));
extern fractional AdcBufferB[32]__attribute__((space(dma)));
extern fractional DacBufferA[32]__attribute__((space(dma)));
extern fractional DacBufferB[32]__attribute__((space(dma)));



extern fractional temp_buffer_low[32];
extern fractional temp_buffer_band[32];
extern fractional temp_buffer_high[32];
extern fractional final_buffer[32];

extern fractional Gl;
extern fractional Gb;
extern fractional Gh;




void __attribute__((interrupt, no_auto_psv))_DMA2Interrupt(void) //DMA asignado al ADC
{
IFS1bits.DMA2IF = 0; /* Clear DMA Channel 0 Interrupt Flag */
/* User Code to update Right Buffer in DMA*/
if (DMACS1bits.PPST2==0) //Està seleccionada la memoria A
{   
    IIRTransposed(32,temp_buffer_low,AdcBufferB,&lowpassfilter);//Procesar en la memoria B
    IIRTransposed(32,temp_buffer_band,AdcBufferB,&bandpassfilter);
    IIRTransposed(32,temp_buffer_high,AdcBufferB,&highpassfilter);
      }
else
{  
    IIRTransposed(32,temp_buffer_low,AdcBufferA,&lowpassfilter);//Procesar en la memoria B
    IIRTransposed(32,temp_buffer_band,AdcBufferA,&bandpassfilter);
    IIRTransposed(32,temp_buffer_high,AdcBufferA,&highpassfilter);
    } 
//
VectorScale(32,temp_buffer_low,temp_buffer_low,Gl);
VectorScale(32,temp_buffer_band,temp_buffer_band,Gb);
VectorScale(32,temp_buffer_high,temp_buffer_high,Gh);

VectorAdd(32,final_buffer,temp_buffer_low,temp_buffer_band);
VectorAdd(32,final_buffer,final_buffer,temp_buffer_high);

        
}



void __attribute__((interrupt, no_auto_psv))_DMA1Interrupt(void) //DMAs asignados al DAC
{
IFS0bits.DMA1IF = 0; /* Clear DMA Channel 1 Interrupt Flag */
/* User Code to update Left Buffer in DMA */

if (DMACS1bits.PPST1==0) //Està seleccionada la memoria A
    VectorCopy(32,DacBufferB,final_buffer);
else
   VectorCopy(32,DacBufferA,final_buffer);//Procesar la memoria A

}

char A,key; //Variable donde almaceno el caracter recibido

extern fractional max;
extern fractional min;
extern fractional delta;

void __attribute__((__interrupt__, no_auto_psv)) _U1RXInterrupt(void) //Interrupcion se ejecuta cuendo recibe un caracter
{
    IFS0bits.U1RXIF = 0;
    key = U1RXREG; //Recibo Caracter
    
    
    
    switch (key)
    {
        case ('Q'):
            if (Gl+delta<=max&&Gl+delta>=min)
                Gl=Gl+delta;
            break;
        case ('A'):
            if (Gl-delta>=min)
                Gl=Gl-delta;
            break;
        case ('W'):
            if (Gb+delta<=max&&Gb+delta>=min)
                Gb=Gb+delta;            
            break;
        case ('S'):
            if (Gb-delta>=min)
                Gb=Gb-delta;
            break;
        case ('E'):
            if (Gh+delta<=max&& Gh+delta>=min)
                Gh=Gh+delta; 
            break;
        case ('D'):
            if (Gh-delta>=min)
                Gh=Gh-delta;
            break;
        default: 
            A='N';
               
        }
    //U1TXREG = (A);
    LATBbits.LATB2 = !LATBbits.LATB2;
    
}