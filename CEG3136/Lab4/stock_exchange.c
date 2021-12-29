#include <stdlib.h>
#include "stock_exchange.h"

static stock_exchange_t singleton_exchange;

void stock_exchange_init(uint32_t seed){
  int i;
  stock_exchange_t * exchange = &singleton_exchange;
  stock_t* stock = exchange->stocks;
  investor_t *investor = exchange->investors;
  char name_buffer[64];
  memset (exchange, 0, sizeof(stock_exchange_t));
  srand(seed);

  // initialize stocks
  for (i=0; i<NUM_STOCKS; i++) {
    uint16_t price = (rand() * 100. / RAND_MAX); 
    sprintf(name_buffer, "stock%04d", i);
    stock_initial_public_offering (stock, price+10, name_buffer);
    stock_display(stock);
    stock++;
  }
  // initialize investors
  for (i=0; i<NUM_INVESTORS; i++) {
    uint32_t cache = (rand() * 1000. / RAND_MAX); 
    sprintf(name_buffer, "investor%04d", i);
    investor_init (investor, name_buffer, 1000+100*cache);
    investor_display(investor);
    investor++;
  }
}

stock_t* stock_exchange_get_random_stock(){
  int indx = rand() * 1. * NUM_STOCKS / RAND_MAX;
  if (indx == NUM_STOCKS) indx = NUM_STOCKS - 1;
  return &singleton_exchange.stocks[indx];
}

void stock_exchange_update(uint32_t time){
  uint32_t indx = time & (NUM_INVESTORS-1);
  investor_t *investor = &singleton_exchange.investors[indx];
  investor_add_transaction(investor);
}

void stock_exchange_display_stats(void){
	int16_t i = 0;
	stock_exchange_t *exchange = &singleton_exchange;
	investor_t *current = exchange->investors;
	investor_t best = current[i];
	investor_t worst = current[i];
	
  printf ("Number of BUY transactions: %d \n", get_num_buy());
  printf ("Number of SELL transactions: %d \n", get_num_sell());
	//Best and worst performing 
	
	for (i=0; i<NUM_INVESTORS; i++) {
		if(calc_networth(&current[i]) >= calc_networth(&best)) best = current[i];
		if(calc_networth(&current[i]) <= calc_networth(&worst)) worst = current[i];
		display_G_L(&current[i]);
  }
		
	printf("\nBest performer: %s \n",best.name);
	printf("Worst performer: %s \n",worst.name);
}




