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
#include <dsp.h>           /* Libreria con funciones de procesamiento de señales*/

#include "system.h"        /* System funct/params, like osc/peripheral config */
#include "user.h"          /* User funct/params, such as InitApp              */

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

fractional inputADC_A[FFT_SIZE]__attribute__((space(dma)));
fractional inputADC_B[FFT_SIZE]__attribute__((space(dma)));
fractional fftOut[FFT_SIZE];

fractcomplex fftInput[FFT_SIZE]__attribute__((space(ymemory),aligned(FFT_SIZE*2*2)));
fractcomplex twiddleFactors[FFT_SIZE/2]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));
fractional ham_window[FFT_SIZE]__attribute__((space(xmemory), far ,aligned(FFT_SIZE*2)));
fractional black_window[FFT_SIZE]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));

/* i.e. uint16_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/



int16_t main(void)
{

    TwidFactorInit(LOG2N, &twiddleFactors[0], 0);
    HanningInit (FFT_SIZE, ham_window);
    BlackmanInit (FFT_SIZE, black_window);

    /* Initialize IO ports and peripherals */
    InitApp();

    while(1)
    {

    }
}
