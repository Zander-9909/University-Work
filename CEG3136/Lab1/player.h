#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#ifndef __PLAYER_H__
#define __PLAYER_H__

typedef enum { USE_C, USE_ASSEMBLY } code_t;

typedef struct player_s{
  uint16_t state;
  char (*player_won)(struct player_s *player);
  char (*player_make_move)(struct player_s *player, int row, int col);
  char (*player_check_move)(struct player_s *player, int row, int col);
} player_t;

char player_won_c(player_t * player);
char player_make_move_c(player_t *player, int row, int col);
char player_check_move_c(player_t *player, int row, int col);
void player_init(player_t * player, code_t type);

extern char player_check_move_s(player_t *player, int row, int col);
extern char player_make_move_s(player_t *player, int row, int col);
extern char player_won_s(player_t * player);

#endif
