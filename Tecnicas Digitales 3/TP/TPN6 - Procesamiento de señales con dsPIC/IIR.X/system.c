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

#include "system.h"          /* variables/params used by system.c             */

/******************************************************************************/
/* System Level Functions                                                     */
/*                                                                            */
/* Custom oscillator configuration funtions, reset source evaluation          */
/* functions, and other non-peripheral microcontroller initialization         */
/* functions get placed in system.c.                                          */
/*                                                                            */
/******************************************************************************/

/* Refer to the device Family Reference Manual Oscillator section for
information about available oscillator configurations.  Typically
this would involve configuring the oscillator tuning register or clock
switching useing the compiler's __builtin_write_OSCCON functions.
Refer to the C Compiler for PIC24 MCUs and dsPIC DSCs User Guide in the
compiler installation directory /doc folder for documentation on the
__builtin functions.*/

/* TODO Add clock switching code if appropriate.  An example stub is below.   */
void ConfigureOscillator(void)
{
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
        
        ACLKCONbits.APSTSCLR = 0b111;
        ACLKCONbits.SELACLK = 0;
#if 0

#endif
}

