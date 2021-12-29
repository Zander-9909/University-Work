#ifndef __STOCK_H__
#define __STOCK_H__

#include "stm32f4xx.h"
#include "stdio.h"
#include <stdlib.h>
#include <string.h>

typedef enum {BUY, SELL} transaction_e;
typedef enum {PENDING, COMPLETE, ABORTED} transaction_status_e;

typedef struct stock_s {
  uint16_t initial_price;
  uint16_t price;
  uint8_t  volatility;
  int8_t   trend;
  uint16_t id;
  char name[64];
} stock_t;

typedef struct stock_holding_s{
  stock_t *stock;
  uint16_t quantity;
} stock_holding_t;

void stock_initial_public_offering (stock_t* stock, uint16_t price, char* name);
uint16_t stock_get_cur_value(stock_t* stock);
void stock_display(stock_t* stock);


#endif
