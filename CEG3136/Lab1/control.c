#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#include "player.h"
#include "game.h"

game_t the_game;

int main(void)
{
  char winner;
  SCB->CCR |= SCB_CCR_STKALIGN_Msk; // Enable double word stack alignment 
  //(recommended in Cortex-M3 r1p1, default in Cortex-M3 r2px and Cortex-M4)
  printf("\nWelcome to the Tic-Tac-Tow game!\n");
  printf ("The game struct address is 0x%x \n",  &the_game);
	game_init(&the_game);
  game_display_board(&the_game);
  do {
    game_get_move(&the_game);
    game_set_move(&the_game);
    game_display_board(&the_game);
  } while ((winner = game_result(&the_game)) == '-');
  printf ("Game finished, result: %c \n", winner);
}
