/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/
#define Fosc            80000000 
#define Fcy             (Fosc/2)
#define Fs              39062.5
#define SAMPLING_RATE   39062.5
#define SAMPPRD         (Fcy/Fs)-1

#define ADCREQ      13

#define FP 40000000
#define BAUDRATE 115200
#define BRGVAL ((FP/BAUDRATE)/16) - 1

#define FFT_SIZE 256
#define LOG2N 8

/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */
void GPIO(void);
void TIMER(void);
void PLL(void);
void DMA_CH1(void);
void DMA_CH2(void);
void TIMER_5ADC(void);
void ADC(void);
void COM_UART(void);