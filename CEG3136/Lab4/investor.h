#ifndef __INVESTOR_H__
#define __INVESTOR_H__

#include "stock.h"

#define MAX_HOLDINGS  1024

typedef struct investor_s {
  uint16_t id;
  uint32_t cache;
  char name[64];
  stock_holding_t holdings[MAX_HOLDINGS];
	uint32_t initial;
} investor_t;

void investor_init (investor_t *investor, char* name, uint32_t cache);
void investor_display(investor_t *investor);
char investor_buy (investor_t *investor, stock_holding_t *holding);
char investor_sell (investor_t *investor, stock_holding_t *holding);
void investor_add_transaction(investor_t *investor);
uint32_t get_num_buy(void);
uint32_t get_num_sell(void);

void display_G_L(investor_t *investor);
int calc_networth(investor_t *investor);
void __svc(0) svc_zero(investor_t*investor, stock_holding_t *holding,unsigned int svc_number);
void __svc(1) svc_one(investor_t*investor, stock_holding_t *holding,unsigned int svc_number);

#endif
