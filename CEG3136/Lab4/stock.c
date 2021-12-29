#include "stock.h"

static uint16_t stock_cnt = 0;
static uint32_t time_stamp = 0;

void stock_initial_public_offering (stock_t* stock, uint16_t price, char* name){
  stock->initial_price = price;
  stock->price = price;
  stock->volatility = rand();
  stock->trend = rand();
  stock->trend -= 127;  // signed value in the range -127, 127
  memcpy(stock->name, name, strlen(name));
  stock->id = stock_cnt;
  stock_cnt++;
}

uint16_t stock_get_cur_value(stock_t* stock){
  int x = (1.0 * time_stamp * stock->trend / 0x10000);
  int y = ((1.0 * stock->volatility * rand() / RAND_MAX) - 0x80);
  int delta = x + y * stock->initial_price / 0x100;

  if (delta > stock->initial_price) delta = stock->initial_price;
  if (delta <=  -stock->initial_price) delta = 1 - stock->initial_price;
  stock->price = stock->initial_price + delta;
  time_stamp ++;
  return stock->price;
}

void stock_display(stock_t* stock){
  printf ("%s: price %6d\n", stock->name, stock->price);
}
