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
#include <stdio.h>               /* printf */ 
#include <stdbool.h>       /* Includes true/false definition */
#include <dsp.h>
#include "user.h" 

extern fractional inputADC_A[FFT_SIZE]__attribute__((space(dma)));
extern fractional inputADC_B[FFT_SIZE]__attribute__((space(dma)));
extern fractional ham_window[FFT_SIZE/2]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));
extern fractional black_window[FFT_SIZE/2]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));
extern fractional fftOut[FFT_SIZE];

fractional buffer[FFT_SIZE];


extern fractcomplex fftInput[FFT_SIZE]__attribute__((space(ymemory),aligned(FFT_SIZE*2*2)));
extern fractcomplex twiddleFactors[FFT_SIZE/2]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));



uint16_t i;
int16_t	peakFrequencyBin = 0;                   /* Declare post-FFT variables to compute the */
uint16_t peakFrequency = 0;			/* frequency of the largest spectral component */


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


void __attribute__((__interrupt__, no_auto_psv)) _T3Interrupt(void)
{
/* Interrupt Service Routine code goes here */
IFS0bits.T3IF = 0; // Clear Timer3 Interrupt Flag

    _LATB2 = ~_LATB2;       /* Conmuta LED1 */
    _LATB3 = ~_LATB3;       /* Conmuta LED2 */
    
    _LATC3 = ~_LATC3;       /* Conmuta D0 */
}

void __attribute__((interrupt, no_auto_psv))_DMA0Interrupt(void)
{
IFS0bits.DMA0IF = 0; /* Clear DMA Channel 1 Interrupt Flag */
/* User Code to update Left Buffer in DMA */
}

void __attribute__((interrupt, no_auto_psv))_DMA1Interrupt(void)
{
IFS0bits.DMA1IF = 0; /* Clear DMA Channel 1 Interrupt Flag */
/* User Code to update Left Buffer in DMA */
}

void __attribute__((interrupt, no_auto_psv))_DMA2Interrupt(void)
{  
    for(i = 0; i<FFT_SIZE; i++)
    {
        if(DMACS1bits.PPST1)
            buffer[i]= inputADC_A[i];

        else if(!DMACS1bits.PPST1)
            buffer[i]= inputADC_B[i];
    }

    for(i = 0; i<FFT_SIZE; i++)
    {
        fftInput[i].real = buffer[i];
        fftInput[i].imag = 0;

    }

    if( PORTBbits.RB7 == 1) //BOTON1
        VectorWindow(FFT_SIZE, &buffer[0], &buffer[0], ham_window);

    if( PORTBbits.RB10 == 1) //BOTON2
        VectorWindow(FFT_SIZE, &buffer[0], &buffer[0], black_window);
    
    for(i = 0; i<FFT_SIZE; i++)
    {
        fftInput[i].real = fftInput[i].real >> 1;
    }
    /* Perform FFT operation */
    FFTComplexIP(LOG2N, &fftInput[0], &twiddleFactors[0], COEFFS_IN_DATA);
     
	/* Store output samples in bit-reversed order of their addresses */
	BitReverseComplex (LOG2N, &fftInput[0]);
    
        for(i = 0; i<FFT_SIZE; i++)
    {
        fftInput[i].real = fftInput[i].real << 1;
    }
    
	/* Compute the square magnitude of the complex FFT output array so we have a Real output vector */
	SquareMagnitudeCplx(FFT_SIZE, &fftInput[0], &fftOut[0]);
  
    printf("\n\rSTART\n\r"); //print START. MATLAB uses this as a start delimiter
	
	printf("ROWS=%d\n\r", FFT_SIZE); //print the number of rows, so matlab can make the correct sized buffer
	
	for(i = 0; i < FFT_SIZE; i++)
	{
		// output: frequency vector, the calculated fft, raw samples
		printf("%f %f\n\r", (double) Fract2Float(fftOut[i]),(double) Fract2Float(buffer[i])); 
	}
	
	printf("END\n\r"); //output end so matlab knows we're done

    /*
    printf("ADC\n"); 
    for(i=0; i<FFT_SIZE; i++)
    {
        printf("%f\n",(double) Fract2Float(buffer[i]));
    }
    
    printf("FFT\n"); 
    for(i=0; i<FFT_SIZE; i++)
    {
        printf("%f \n",(double) Fract2Float(fftOut[i]));
    }
    */
    IFS1bits.DMA2IF = 0; /* Clear DMA Channel 2 Interrupt Flag */


}

void __attribute__((interrupt, no_auto_psv))_U1RXInterrupt(void)
{

    
if (U1RXREG == 'p')
{
    DMA2CONbits.CHEN = 1;
    DMA2REQbits.FORCE = 1;
}
IFS0bits.U1RXIF = 0; /* Clear DMA Channel 0 Interrupt Flag */

}
