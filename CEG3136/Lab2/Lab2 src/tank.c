#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"
#include "tank.h"

extern char drain;

void tank_init(tank_t *tank){
  tank->input_flow_to_height_rate = 1.0 * PUMP_PIPE_DIAMETER * PUMP_PIPE_DIAMETER / (TANK_DIAMETER * TANK_DIAMETER);
  tank->output_flow_to_height_rate = 1.0 * COSUMER_PIPE_DIAMETER * COSUMER_PIPE_DIAMETER / (TANK_DIAMETER * TANK_DIAMETER);
}

int get_usage_rate(){
  float p = rand() * 100.0 / RAND_MAX;
	if(drain == 1){
		return 200;
	}
	else{
  int v = (int) p;
  return v;
	}
}

void tank_update_height(tank_t *tank, float pump_flow){
  float new_height =  tank->height + 
                      pump_flow * tank->input_flow_to_height_rate - 
	                    get_usage_rate() * tank->output_flow_to_height_rate / 100; 
	if (new_height >= 0) tank->height = new_height;
	else                 tank->height = 0;
}


