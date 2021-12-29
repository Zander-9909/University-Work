#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#include "player.h"

char player_won_c(player_t * player){
  char won = 0;
  if      ((player->state & 0x0007) == 0x0007) won = 1;
  else if ((player->state & 0x0070) == 0x0070) won = 1;
  else if ((player->state & 0x0700) == 0x0700) won = 1;
  else if ((player->state & 0x0111) == 0x0111) won = 1;
  else if ((player->state & 0x0222) == 0x0222) won = 1;
  else if ((player->state & 0x0444) == 0x0444) won = 1;
  else if ((player->state & 0x0124) == 0x0124) won = 1;
  else if ((player->state & 0x0421) == 0x0421) won = 1;
  return won;
}

char player_make_move_c(player_t *player, int row, int col){
  if (player->state & (1 << ((row << 2) + col))) return 0; // bad move
  player->state |= (1 << ((row << 2) + col));
  return 1;
}
char player_check_move_c(player_t *player, int row, int col){
  if (player->state & (1 << ((row << 2) + col))) return 0; // bad move
  return 1;
}

void player_init(player_t * player, code_t type){
  player->state = 0;
  switch (type) {
    case USE_C:         player->player_won = player_won_c; 
                        player->player_make_move = player_make_move_c;
                        player->player_check_move = player_check_move_c;
                        break;
    case USE_ASSEMBLY:  player->player_won = player_won_s; 
                        player->player_make_move = player_make_move_s;
                        player->player_check_move = player_check_move_s;
                        break;
  }    
}
