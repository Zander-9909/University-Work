#include "stm32f4xx.h"
#include "stdio.h"
#include <string.h>

char textbuffer[34] = ""; // Text buffer

uint32_t volatile msTicks;                       // Counter for millisecond Interval

void SysTick_Handler (void) {                    // SysTick Interrupt Handler
  msTicks++;                                     // Increment Counter
}

//void SVC_Handler (void) {                        // SVC Interrupt Handler
//}

void sys_clock_timer_init(int period) {                
  if (SysTick_Config (SystemCoreClock / period)) { // SysTick period in seconds
    printf("\nError SysTick_Config!\n");  // Handle Error 
  }
}
 
void Device_Initialization (void)  {             // Configure & Initialize MCU
  sys_clock_timer_init (1000);            // setup device-specific timer
	NVIC_EnableIRQ	(	EXTI0_IRQn	);
	NVIC_EnableIRQ	(	EXTI1_IRQn	);
	NVIC_EnableIRQ	(	EXTI2_IRQn	);
}

void EXTI0_IRQHandler (void) {
	printf("EXTI0_IRQHandler clk cnt 0x%x \n", msTicks);
}

void EXTI1_IRQHandler (void) {
	printf("EXTI1_IRQHandler clk cnt 0x%x \n", msTicks);
}

void EXTI2_IRQHandler (void) {
  // printf ("^beep^"); // for debugging
}




//void __svc(0) svc_zero(const char *string);
//void __svc(1) svc_one(const char *string);

//void SVCHandler_main(unsigned int * svc_args);


//void __SVC_0(const char *string){
//  printf("svc_zero: %s\n", string);
//}
//void __SVC_1(const char *string){
//  printf("svc_one: %s\n", string);
//}

/*
__asm void SVCHandler(void)
{
    IMPORT SVCHandler_main
    TST lr, #4
    ITE EQ
    MRSEQ R0, MSP
    MRSNE R0, PSP
    B SVCHandler_main
}
*/
/*
void SVC_Handler(void)
{
    __asm(".global SVC_Handler_Main");
    __asm("TST LR, #4             ;");
    __asm("ITE EQ                 ;");
    __asm("MRSEQ r0, MSP");
    __asm("MRSNE r0, PSP");
    __asm("B SVC_Handler_Main");
}
*/
/*
__asm void SVC_Handler (void) {
  PRESERVE8 
    TST LR,#4             ; Called from Handler Mode? 
    MRSNE R12,PSP         ; Yes, use PSP 
    MOVEQ R12,SP          ; No, use MSP 
    LDR R12,[R12,#24]     ; Read Saved PC from Stack 
    LDRH R12,[R12,#-2]    ; Load Halfword 
    BICS R12,R12,#0xFF00  ; Extract SVC Number
}
*/
/*
void SVCHandler_main(unsigned int * svc_args)
{
    unsigned int svc_number;
    // Stack contains:
    // R0, R1, R2, R3, R12, R14, the return address and xPSR
    // First argument (R0) is svc_args[0]
    svc_number = ((char *)svc_args[6])[-2];
    switch(svc_number)
    {
        case 0:
            break;
        case 1:
            break;
        default:
            break;
    }
}
*/

int main(void)
{
  SCB->CCR |= SCB_CCR_STKALIGN_Msk; // Enable double word stack alignment 
  //(recommended in Cortex-M3 r1p1, default in Cortex-M3 r2px and Cortex-M4)
  printf("\nHello world!\n");
  printf ("textbuffer address = 0x%x \n", (unsigned int) textbuffer);
	
  Device_Initialization ();
  
  
  while (textbuffer[0] != 'q') {
    printf("Enter passcode to ARM:");
    fgets(textbuffer, (sizeof(textbuffer)-1), stdin);		
  }
	NVIC_DisableIRQ	(	EXTI0_IRQn	);
	NVIC_DisableIRQ	(	EXTI1_IRQn	);
	NVIC_DisableIRQ	(	EXTI2_IRQn	);
}
