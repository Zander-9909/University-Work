#include "stdio.h"
#include "stdlib.h"
#include "stm32f4xx.h"

#include "player.h"
#include "game.h"


char game_move_valid(game_t *game, int row, int col){  // return 1 if valid, 0 otherwise
  char c[3] = {0,0,0};
  char s[3] = {0,0,0};
  c[0] = game->player[0].player_check_move(&game->player[0], row, col) + '0';
  c[1] = game->player[1].player_check_move(&game->player[1], row, col) + '0';
  s[0] = game->player_checker[0].player_check_move(&game->player_checker[0], row, col) + '0';
  s[1] = game->player_checker[1].player_check_move(&game->player_checker[1], row, col) + '0';
  if (c[0] != s[0] || c[1] != s[1]) printf ("Error player_check_move check failed: [c] %s, [s] %s XXXXXXXXXXXXXXXXXXXXXX\n", c, s);
  //return (player_check_move(&game->player[0], row, col) & player_check_move(&game->player[1], row, col));  // the location is vacant in both players state
  return (c[0] & c[1] & 0x1);
}
void game_init(game_t *game){
  int i;
  game->turn = 0;
  game->textbuffer[0] = '\0';
  for (i=0; i<2; i++) {
    player_init(&game->player[i], USE_C);  // the main game use C
    player_init(&game->player_checker[i], USE_ASSEMBLY); // the checker use Assembly
  }
}
void game_get_move(game_t *game){
  char player_turn = game->turn & 1 ? 'X' : 'O';  // O is on even turns, X is on odd turns
  char done = 0;
  printf("Play %c enter move, e.g. b1: ", player_turn);
  while (!done) {
    fgets(game->textbuffer, (sizeof(game->textbuffer)-1), stdin);	
    while (game->textbuffer[0] < 'a' || game->textbuffer[0] > 'c' || game->textbuffer[1] < '0' || game->textbuffer[1] > '2') {
      printf ("Illegal move, moves must be row,col (e.g. b2), your move: ");
      fgets(game->textbuffer, (sizeof(game->textbuffer)-1), stdin);	
    }
    if (game_move_valid(game, game->textbuffer[0] - 'a', game->textbuffer[1] - '0')) done = 1;
    else printf ("this position is already played, your move: ");
  }
}
void game_set_move(game_t *game){
  game->player_checker[game->turn&1].player_make_move(&game->player_checker[game->turn&1], game->textbuffer[0] - 'a', game->textbuffer[1] - '0');
  game->player[game->turn&1].player_make_move(&game->player[game->turn&1], game->textbuffer[0] - 'a', game->textbuffer[1] - '0');
  // check that both plaey and player_checker game states are the same
  if (game->player_checker[game->turn&1].state != game->player[game->turn&1].state) {
          printf ("Error - game state mismatch for player %c: [c] 0x%x, [s] 0x%x XXXXXXXXXXXXXXXXXXXXXX\n", 
              game->turn & 1 ? 'X' : 'O',
              game->player[game->turn&1].state, game->player_checker[game->turn&1].state);
  }
	game->turn++;
}

void game_display_board(game_t *game){
  int i, j;
  printf ("  0  1  2 , turn = %0d, player's turn %c\n", game->turn, game->turn & 1 ? 'X' : 'O');
   for(i=0; i<3; i++) {
     printf ("%c ", 'a' + i);
      for (j=0; j<3; j++){
        printf ("%c ", game->player[0].state & (1 << ((i << 2) + j)) ? 'O' : game->player[1].state & (1 << ((i << 2) + j)) ? 'X' : '-');
      }
      printf ("\n");
   }
}
char game_result(game_t *game){
  char result = '-';  // game not completed yet
  char check = result;

  if (game->player_checker[0].player_won(&game->player_checker[0])) check = 'O';
  else if (game->player_checker[1].player_won(&game->player_checker[1])) check = 'X';
  else if (game->turn >= 9)  check = 'D'; // D - draw

  if (game->player[0].player_won(&game->player[0])) result = 'O';
  else if (game->player[1].player_won(&game->player[1])) result = 'X';
  else if (game->turn >= 9)  result = 'D'; // D - draw

  if (result != check) printf ("Error game result check error: [c] %c, [s] %c XXXXXXXXXXXXXXXXXXXXXX\n", result, check);
  return result;
}

