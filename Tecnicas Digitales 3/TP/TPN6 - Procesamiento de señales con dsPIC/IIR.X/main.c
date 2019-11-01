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


#include <stdint.h>        /* Includes uint16_t definition                    */
#include <stdbool.h>       /* Includes true/false definition                  */

#include "system.h"        /* System funct/params, like osc/peripheral config */
#include "user.h"          /* User funct/params, such as InitApp              */
#include "dsp.h"
/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

//s_pb = {0x0048,0x0090,0x7CD6,0x0048,0x3C7E }
//s_PB1 = {0x43C7,0x7871,0x88F4,0x43C7,0xBE83 }
//s_PB2 = {0x0296,0x052C,0x663E,0x0296,0xD719 }
//s_pa = {0x399C,0x8CC7,0x719C,0x399C,0xD050 }





fractional lowpass_coeff[20]__attribute__((space(xmemory), aligned(64))) =
{0x004f,0x009e,0x73a7,0x004f,0xcb19,0x004f,0x009e,0x73a7,0x004f,0xcb19,0x004f,0x009e,0x73a7,0x004f,0xcb19,0x004f,0x009e,0x73a7,0x004f,0xcb19};

fractional bandpass_coeff[40]__attribute__((space(xmemory), aligned(128))) =
{0x03c0,0x0780,0x4f5c,0x03c0,0xe178,0x03c0,0x0780,0x4f5c,0x03c0,0xe178,0x03c0,0x0780,0x4f5c,0x03c0,0xe178,0x03c0,0x0780,0x4f5c,0x03c0,0xe178,0x3cc2,0x867c,0x7ace,0x3cc2,0xc4f6,0x3cc2,0x867c,0x7ace,0x3cc2,0xc4f6,0x3cc2,0x867c,0x7ace,0x3cc2,0xc4f6,0x3cc2,0x867c,0x7ace,0x3cc2,0xc4f6};

fractional high_coeff[20]__attribute__((space(xmemory), aligned(64))) =
{0x34f8,0x9610,0x6935,0x34f8,0xd2e1,0x34f8,0x9610,0x6935,0x34f8,0xd2e1,0x34f8,0x9610,0x6935,0x34f8,0xd2e1,0x34f8,0x9610,0x6935,0x34f8,0xd2e1};


IIRTransposedStruct lowpassfilter;
IIRTransposedStruct bandpassfilter;
IIRTransposedStruct highpassfilter;

fractional AdcBufferA[32]__attribute__((space(dma)));
fractional AdcBufferB[32]__attribute__((space(dma)));
fractional DacBufferA[32]__attribute__((space(dma)));
fractional DacBufferB[32]__attribute__((space(dma)));


fractional delay_low_1[4] __attribute__((space(ymemory),far));
fractional delay_low_2[4] __attribute__((space(ymemory),far));

fractional delay_band_1[8] __attribute__((space(ymemory),far));
fractional delay_band_2[8] __attribute__((space(ymemory),far));

fractional delay_high_1[4] __attribute__((space(ymemory),far));
fractional delay_high_2[4] __attribute__((space(ymemory),far));

fractional temp_buffer_low[32];
fractional temp_buffer_band[32];
fractional temp_buffer_high[32];
fractional final_buffer[32];

fractional Gl=0x4000;
fractional Gb=0x4000;
fractional Gh=0x4000;

fractional max=0x7FFF;
fractional min=0x0000;
fractional delta=0x0CCD;

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int16_t main(void)
{
    lowpassfilter.numSectionsLess1=3;   
    lowpassfilter.coeffsBase=lowpass_coeff;
    lowpassfilter.coeffsPage=0xFF00;
    lowpassfilter.delayBase1=delay_low_1; 
    lowpassfilter.delayBase2=delay_low_2;
    lowpassfilter.finalShift=0;

    bandpassfilter.numSectionsLess1=7;
    bandpassfilter.coeffsBase=bandpass_coeff;
    bandpassfilter.coeffsPage=0xFF00;
    bandpassfilter.delayBase1=delay_band_1; 
    bandpassfilter.delayBase2=delay_band_2;
    bandpassfilter.finalShift =0;   
    
    highpassfilter.numSectionsLess1=3;
    highpassfilter.coeffsBase=high_coeff;
    highpassfilter.coeffsPage=0xFF00;
    highpassfilter.delayBase1=delay_high_1; 
    highpassfilter.delayBase2=delay_high_2;
    highpassfilter.finalShift=0;    
    
    IIRTransposedInit(&lowpassfilter);
    IIRTransposedInit(&bandpassfilter);
    IIRTransposedInit(&highpassfilter);
    
    /* Configure the oscillator for the device */
    ConfigureOscillator();

    /* Initialize IO ports and peripherals */
    InitApp();

    /* TODO <INSERT USER APPLICATION CODE HERE> */

    while(1)
    {

    }
}

//   -Ver tipo de dato del búffer.
//   -Normalizar la señal de entrada?? para que sea tipo fractional
//    Què onda el & en el buffer

