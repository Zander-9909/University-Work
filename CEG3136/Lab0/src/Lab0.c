#include "stm32f4xx.h"
#include "stdio.h"
char textbuffer[40] = ""; // Text buffer
int main(void)
{
	
SCB->CCR |= SCB_CCR_STKALIGN_Msk; // Enable double word stack alignment
//(recommended in Cortex-M3 r1p1, default in Cortex-M3 r2px and Cortex-M4)
printf("\nHello world!\n");
printf ("textbuffer address = 0x%x \n", (unsigned int) textbuffer);
	
while (textbuffer[0] != 'q') {
		printf("Please enter text:");
		fgets(textbuffer, (sizeof(textbuffer)-1), stdin);
		printf("\nYou entered :%s\n",textbuffer);
	}

}