/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/
#define FP 40000000
#define BAUDRATE 9600
#define BRGVAL ((FP/BAUD RATE)/16) - 1
/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */
void LED(void);
void Timer(void);
void PLL(void);
void LED(void);
void TIMER(void);
void PLL(void);
void DAC(void);
void DMA_CH0(void);
void DMA_CH1(void);
void DMA_CH2(void);
void TIMER_5(void);
void ADC(void);
void Ej1(void);
void Ej2(void);
void Ej3(void);
void Ej4(void);
void Ej5(void);