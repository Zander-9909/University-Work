
#include "svc.h"
#include "stock_exchange.h"

void SVC_Handler_c (investor_t*investor, stock_holding_t *holding, unsigned int svc_number) {                    // SVC Interrupt Handler
  printf("svc_number = %d\n", svc_number);                                     // Increment Counter
  switch (svc_number) {
    case 0: __SVC_0(investor, holding); break;
    case 1: __SVC_1(investor, holding); break;
  }
}

void __SVC_0(investor_t*investor, stock_holding_t *holding){
  investor_buy(investor,holding);
}
void __SVC_1(investor_t*investor, stock_holding_t *holding){
  investor_sell(investor,holding);
}

