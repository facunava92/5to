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

fractcomplex twiddleFactors[FFT_SIZE/2]__attribute__((space(xmemory), aligned(FFT_SIZE*2)));

/* i.e. uint16_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/



int16_t main(void)
{

    TwidFactorInit(LOG2N, &twiddleFactors[0], 0);

    /* Initialize IO ports and peripherals */

    while(1)
    {

    }
}
