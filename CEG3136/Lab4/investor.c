#include <stdlib.h>
#include "investor.h"
#include "stock_exchange.h"

static uint16_t investor_cnt = 0;
static uint32_t num_buy = 0;
static uint32_t num_sell = 0;
static uint32_t initial = 0;

void investor_init (investor_t *investor, char* name, uint32_t cache){
  memset(investor, 0, sizeof(investor_t));  // initialize struct with zero
  investor->cache = cache;
  memcpy(investor->name, name, strlen(name));
  investor->id = investor_cnt;
	investor->initial = cache;
  investor_cnt++;
}

void investor_display(investor_t *investor){
	uint32_t total = investor->cache;
  uint32_t value;
  uint16_t i;
  
  printf ("%s: cashe %d", investor->name, investor->cache);
  for (i=0; i<MAX_HOLDINGS; i++) {
    if (investor->holdings[i].stock != NULL) {
      value = investor->holdings[i].quantity * investor->holdings[i].stock->price;
      if (value > 0) printf (" (%s %d)", investor->holdings[i].stock->name, value);
      total += value;
    }
  }
  printf (" ----- total %6d \n", total);
}

int calc_networth(investor_t *investor){
	uint32_t value = 0;
  uint32_t total = investor->cache;
  uint16_t a;
	if (investor == NULL) return 0;
	total = investor->cache;
	for (a=0; a<MAX_HOLDINGS; a++) {
		if (investor->holdings[a].stock != NULL) {
			value = investor->holdings[a].quantity * investor->holdings[a].stock->price;
			total += value;
		}
	}
  return total;
}

void display_G_L(investor_t *investor){
	uint32_t networth = calc_networth(investor);
	uint32_t value = investor->initial;
	uint32_t GL = (networth-value)*100/value;
	printf("%s: GL %d",investor->name,GL);
	printf("\n");
}

void investor_add_transaction(investor_t *investor){
  transaction_e type = (transaction_e)((rand() * 100. / RAND_MAX) < 60);   // 60% buy, 40% sell
  switch (type) {
    case BUY: {
      stock_holding_t *holding = NULL;
      uint32_t price;
      uint16_t max_quantity;
      int i;
      
      for (i=0; i<MAX_HOLDINGS; i++){ // find empty holding
        if (investor->holdings[i].stock == NULL) {
          holding = &investor->holdings[i];
          break;
        }
      }
      if (holding == NULL) return;  // no holdings available
      holding->stock = stock_exchange_get_random_stock();
      price = stock_get_cur_value(holding->stock);
      max_quantity = investor->cache / price; // to guarantee enough cashe
      if (max_quantity > 1) {
        do {
          holding->quantity = 1 + (1.0 * rand() * max_quantity / RAND_MAX); 
        } while (holding->quantity > max_quantity);
      }
      else {
        holding->quantity = max_quantity;
      }
      svc_zero (investor,holding,0);
      break;
    }
    case SELL: {
      stock_holding_t *holding = NULL;
      int i, n, indx;
      // count holdings
      n = 0;
      for (i=0; i<MAX_HOLDINGS; i++) {
        if (investor->holdings[i].stock == NULL) continue;
        n++;
      }
      if (n == 0) return; // nothing to sell
      // select random holding
      indx = 1.0 * rand() * n / RAND_MAX; 
      n = 0;
      for (i=0; i<MAX_HOLDINGS; i++) {
        if (investor->holdings[i].stock == NULL) continue;
        if (n == indx) {
          holding = & investor->holdings[i];
          break;
        }
        n++;
      }

      svc_one (investor,holding,1);
      break;
    }
  }
}

char investor_buy (investor_t *investor, stock_holding_t *holding){
  if (__get_IPSR() != (uint32_t) (16+SVCall_IRQn)) return 0;  // not SVC
  if (holding == NULL) return 0;  // nothing to buy!
  if (holding->quantity  == 0) { // abort
    holding->stock = NULL;
  }
  else { // buy it
    investor->cache -= holding->stock->price * holding->quantity;
    num_buy++;
    printf ("BUY: "); stock_display(holding->stock);
    printf ("BUY: "); investor_display(investor);
  }
  return (holding->stock != NULL);
}
char investor_sell (investor_t *investor, stock_holding_t *holding){
  if (__get_IPSR() != (uint32_t) (16+SVCall_IRQn)) return 0;  // not SVC
  if (holding == NULL) return 0;  // nothing to sell!
  investor->cache += holding->quantity * stock_get_cur_value(holding->stock); // complete sail
  num_sell++;
  holding->quantity = 0;
  printf ("SELL: "); stock_display(holding->stock);
  printf ("SELL: "); investor_display(investor);
  holding->stock = NULL; // delete holding
  return 1;
}


uint32_t get_num_buy(void){ return num_buy; }
uint32_t get_num_sell(void) { return num_sell; }

