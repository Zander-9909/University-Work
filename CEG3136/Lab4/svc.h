#include "stm32f4xx.h"
#include "stdio.h"
#include <string.h>
#include "stock_exchange.h"

void __svc(0) svc_zero(investor_t*investor, stock_holding_t *holding,unsigned int svc_number);
void __svc(1) svc_one(investor_t*investor, stock_holding_t *holding,unsigned int svc_number);

void __SVC_0(investor_t*investor, stock_holding_t *holding);
void __SVC_1(investor_t*investor, stock_holding_t *holding);
extern  char SVC_Handler_s(void);
void SVC_Handler_c (investor_t*investor, stock_holding_t *holding, unsigned int svc_number);
