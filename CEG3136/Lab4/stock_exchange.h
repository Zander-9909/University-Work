#ifndef __STOCK_EXCHANG_H__
#define __STOCK_EXCHANG_H__


#include "investor.h"

#define NUM_STOCKS  256
#define NUM_INVESTORS 64
//#define NUM_STOCKS  16
//#define NUM_INVESTORS 8


typedef struct {
  stock_t stocks[NUM_STOCKS];               // stocks available in the exchange
  investor_t investors[NUM_INVESTORS];
} stock_exchange_t;

void stock_exchange_init(uint32_t seed);
stock_t* stock_exchange_get_random_stock(void);

void stock_exchange_update(uint32_t time);
void stock_exchange_display_stats(void);

#endif

