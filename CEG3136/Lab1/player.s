
  AREA    |.text|, CODE, READONLY
  PRESERVE8;
  THUMB;


  EXPORT player_check_move_s

player_check_move_s FUNCTION	; char player_check_move_s(player_t *player, int row, int col);
	; r0 *player
	; r1 row
	; r2 col
	PUSH {R4-R5,LR}
	MOV R3,R0 ; copy R0 to R3
	
	LDRH R0,[R3,#0x00] ; Load R0 with the value at memory location stored in R3
	ADD R5,R2,R1 ; add the row and column values, store them in R5
	LSLS R5, #2 ; Shift R5 2 to the left
	MOVS R4,#0x01 ; Move HEX1 into R4
	LSLS R4,R4,R5 ; Shift R4 to the left by the value specified in R5 (row+column)
	ANDS R0,R0,R4 ; AND R0 and R4 together, store in R0
	CBZ R0,RE2     ; 
	MOVS R0,#0x00
	POP {R4-R5,PC}
RE2	
	MOVS R0,#0x01
	POP {R4-R5,PC} ; End of Function
	
  ENDFUNC
  

  EXPORT player_make_move_s

player_make_move_s FUNCTION	; char player_make_move_s(player_t *player, int row, int col);
	; r0 *player
	; r1 row
	; r2 col
	PUSH {R4-R5,LR}
	MOV R3,R0 ; copy R0 to R3
	
	LDRH R0,[R3,#0x00] ; Load R0 with the value at memory location stored in R3
	ADD R5,R2,R1 ; add the row and column values, store them in R5
	LSLS R5, #2 ; Shift R5 2 to the left
	MOVS R4,#0x01 ; Move HEX1 into R4
	LSLS R4,R4,R5 ; Shift R4 to the left by the value specified in R5 (row+column)
	ANDS R0,R0,R4 ; AND R0 and R4 together, store in R0
	CBZ R0,ifM    ; 
	MOVS R0,#0x00
	POP {R4-R5,PC}
ifM LDRH R0,[R3,#0x00]
	ADD R5,R2,R1,LSL #2
	MOVS R4,#0x01
	LSLS R4,R4,R5
	ORRS R0,R0,R4
	STRH R0,[R3,#0x00]
	MOVS R0,#0x01 ;Return 1
	POP {R4-R5,PC} ; End of Function
  ENDFUNC
  
  EXPORT player_won_s

player_won_s FUNCTION	; char player_won_s(player_t * player);
	; r0 *player
	MOV	 R1,R0					    ; copy the player to R1
	MOVS R0, #0x00               ;initialize R0 to HEX0
	;if 1: 0x07
	LDRB R2,[R1,#0x00]           ;Loads the value of R1 into R2
	AND R2,R2,#0x07              ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, #0x07
	BNE if2;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 2: 0x70
if2	LDRB R2,[R1,#0x00]           ;Loads the value of R1 into R2
	AND R2,R2,#0x70              ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, #0x70
	BNE if3;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 3: 0x700
if3	LDRB R2,[R1,#0x00]           ;Loads the value of R1 into R2
	AND R2,R2,#0x700              ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, #0x700
	BNE if4;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 4: 0x111
if4	LDRH R2,[R1,#0x00]           ;Loads the value of R1 into R2
	MOVW R3,#0x111
	AND R2,R2,R3             ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, R3
	BNE if5;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 5: 0x222
if5	LDRH R2,[R1,#0x00]           ;Loads the value of R1 into R2
	MOVW R3,#0x222
	AND R2,R2,R3             ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, R3
	BNE if6;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 6: 0x444
if6	LDRH R2,[R1,#0x00]           ;Loads the value of R1 into R2
	MOVW R3,#0x444
	AND R2,R2,R3             ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, R3
	BNE if7;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 7: 0x124
if7	LDRH R2,[R1,#0x00]           ;Loads the value of R1 into R2
	AND R2,R2,#0x124             ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, #0x124
	BNE if8;branch to next if
	MOVS R0,#0x01
	B RETURN; branch to return
	
	;if 8: 0x421
if8	LDRH R2,[R1,#0x00]           ;Loads the value of R1 into R2
	MOVW R3,#0x421
	AND R2,R2,R3             ;ANDs R2 and HEX7 together and stores it in R2
	CMP R2, R3
	BNE RETURN
	MOVS R0,#0x01
	B RETURN; branch to return
RETURN	BX	LR 						; return
  ENDFUNC
  
  END