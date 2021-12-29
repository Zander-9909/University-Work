#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#define ALMOST_EMPTY      5// 3 inch
#define ALMOST_FULL       25 // 2 inch
#define TANK_FULL         30 // 

typedef enum pump_States { OFF, ON_HIGH, ON_LOW, DRAIN } pump_state_e; 	// declare variable as pump state enum


typedef struct pump_s {
  float flow;
  pump_state_e state;
} pump_t;

pump_state_e pump_update_state(pump_t *pump, float tank_height);
void pump_init(pump_t *pump);
char readFlag(char *input);


