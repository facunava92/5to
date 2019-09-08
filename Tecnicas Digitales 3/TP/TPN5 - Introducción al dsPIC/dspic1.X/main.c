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

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint16_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/
int16_t max_pos = 0x7FFF;
int16_t max_neg = 0x8000;
uint8_t RDAC = 0;
uint8_t LDAC = 0;

char data = 0;

unsigned int RightBufferA[32]__attribute__((space(dma))) = {0};
unsigned int RightBufferB[32]__attribute__((space(dma))) = {0};

unsigned int LeftBufferA [32]__attribute__((space(dma))) = {0x0000,0x18F8,0x30FB,0x471C,0x5A81,0x6A6C,0x7640,0x7D89,0x7FFF,0x7D89,0x7640,0x6A6C,0x5A81,0x471C,0x30FB,0x18F8,0x0000,0xE707,0xCF04,0xB8E3,0xA57E,0x9593,0x89BF,0x8276,0x8001,0x8276,0x89BF,0x9593,0xA57E,0xB8E3,0xCF04,0xE707}; 
unsigned int LeftBufferB [32]__attribute__((space(dma))) = {0x0000,0x18F8,0x30FB,0x471C,0x5A81,0x6A6C,0x7640,0x7D89,0x7FFF,0x7D89,0x7640,0x6A6C,0x5A81,0x471C,0x30FB,0x18F8,0x0000,0xE707,0xCF04,0xB8E3,0xA57E,0x9593,0x89BF,0x8276,0x8001,0x8276,0x89BF,0x9593,0xA57E,0xB8E3,0xCF04,0xE707}; 

void main(void)
{

    /* Configure the oscillator for the device */
    ConfigureOscillator();

    /* Initialize IO ports and peripherals */
    InitApp();

    /* TODO <INSERT USER APPLICATION CODE HERE> */
   // uint32_t i;

    
    while(1)
    {

 // #### 1.1
    //_LATB2 = _RB7;
    //_LATB3 = _RB10;
    
    /*
    uint32_t i;
    for(i=0; i<=155000; i++);
    _LATB2 = ~_LATB2;
    _LATB3 = ~_LATB3;
    */
        
    }
}
