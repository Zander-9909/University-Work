#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#include "player.h"

typedef struct game_s {
  player_t player[2]; // 2 player game
  player_t player_checker[2]; // checker for asm code
  int turn;
  char textbuffer[64]; // Text buffer
} game_t;

char game_move_valid(game_t *game, int row, int col);  // return 1 if valid, 0 otherwise
void game_init(game_t *game);
void game_get_move(game_t *game);
void game_set_move(game_t *game);
void game_display_board(game_t *game);
char game_result(game_t *game);


