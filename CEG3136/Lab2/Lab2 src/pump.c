#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"
#include "pump.h"

char drainPump = 'n';

void pump_init(pump_t *pump){
  pump->state = OFF;
  pump->flow = 0;
}

char readFlag(char *input){
	drainPump = *input;
	return drainPump;
}

pump_state_e pump_update_state(pump_t *pump, float tank_height){
  // this is just a stub!
  // implement the state machine here
	
	int nextState = 0;
	int presentState = pump->state;
	
	switch (presentState){//state transitions 
		case OFF: 
			if(drainPump == 1){
				pump->flow = 0.0;
				pump->state = DRAIN;
			}
			if(tank_height < ALMOST_EMPTY){
				pump->flow = 1;
				pump->state = ON_HIGH;
			}
			break;
			
		case ON_HIGH:
			if(drainPump == 1){
				pump->flow = 0.0;
				pump->state = DRAIN;
			}			
			if(tank_height > ALMOST_FULL){
				pump->flow = 0.5;
				pump->state = ON_LOW;
			}
			break;
		
		case ON_LOW: 
			if(drainPump == 1){
				pump->flow = 0.0;
				pump->state = DRAIN;
			}
			if(tank_height >= TANK_FULL){
				pump->flow = 0.0;
				pump->state = OFF;
			}
			break;
			
		case DRAIN:
			if(drainPump == 1){
				pump->flow = 0.0;
				pump->state = DRAIN;
			}
			else{
			pump->flow = 0.0;
			pump->state = OFF;
			}
			
			default:
				break;
	}
	
  return nextState;
}

