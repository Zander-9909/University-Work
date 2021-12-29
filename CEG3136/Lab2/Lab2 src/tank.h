#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#define PUMP_PIPE_DIAMETER      3	// 3 inch
#define COSUMER_PIPE_DIAMETER   2 // 2 inch
#define TANK_DIAMETER          50 // 

typedef struct tank_s {
  float height;
  float input_flow_to_height_rate, output_flow_to_height_rate;
} tank_t;

void tank_init(tank_t *tank);
void tank_update_height(tank_t *tank, float pump_flow);
