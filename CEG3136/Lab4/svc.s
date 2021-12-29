  AREA    |.text|, CODE, READONLY
  PRESERVE8;
  THUMB;


  EXPORT SVC_Handler

SVC_Handler FUNCTION	; char SVC_Handler();
    IMPORT SVC_Handler_c
    TST LR,#4             ; Called from Handler Mode? 
    MRSNE R12,PSP         ; Yes, use PSP 
    MOVEQ R12,SP          ; No, use MSP 
    LDR R12,[R12,#24]     ; Read Saved PC from Stack 
    LDRH R12,[R12,#-2]    ; Load Halfword 
    BICS R12,R12,#0xFF00  ; Extract SVC Number
	MOV  R2, R12
    B SVC_Handler_c
  ENDFUNC
  
  END