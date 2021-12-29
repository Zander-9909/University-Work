#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"
#include "pump.h"
#include "tank.h"

#define PUMP_PIPE_DIAMETER      3	// 3 inch
#define COSUMER_PIPE_DIAMETER   2 // 2 inch
#define TANK_DIAMETER          50 // 

#define ALMOST_EMPTY      5// 3 inch
#define ALMOST_FULL       25 // 2 inch
#define TANK_FULL         30 // 

uint32_t volatile msTicks;                       // Counter for millisecond Interval
tank_t tank;
pump_t pump;
char state_names[3][20] = {"OFF", "ON_HIGH", "ON_LOW"};
char drain = 'n';


void SysTick_Handler (void) {                    // SysTick Interrupt Handler
  msTicks++;                                     // Increment Counter
	readFlag(&drain);
	pump_update_state(&pump, tank.height);
  tank_update_height(&tank, pump.flow);
}

void sys_clock_timer_init(int period) {                
  if (SysTick_Config (SystemCoreClock / period)) { // SysTick period in seconds
    printf("\nError SysTick_Config!\n");  // Handle Error 
  }
}
 
void Device_Initialization (void)  {             // Configure & Initialize MCU
  sys_clock_timer_init (1000);            // setup device-specific timer
  pump_init(&pump);
  tank_init(&tank);
}

void promptDrain (void){
	char value;
	printf("\nWould you like to drain the tank? [y or n]\n");
	value = getchar();
	if(value == 'y')drain = 1;
	else drain = 0;
}


int main(void)
{
  //char textbuffer[40]; // Text buffer
	char val;
  SCB->CCR |= SCB_CCR_STKALIGN_Msk; // Enable double word stack alignment 
  //(recommended in Cortex-M3 r1p1, default in Cortex-M3 r2px and Cortex-M4)
  printf("\nHello world!\n");
  printf("\n SystemCoreClock = %d \n", SystemCoreClock);

  Device_Initialization ();
	
  while (1) {
			promptDrain();
		  while(drain == 1){
				printf("\nEnd draining? [y or n]\n");
				val = getchar();
				if(val == 'y'){
					drain = 0;
				}
			}
  }
}


