	@ Args
	@ r0: Start address of array
	@ r1: End address of array
	@
	@ Result
	@ r3: Sum of Array
	
	.global sum
	
sum:	mov   r3, #0		@ r3 = 0
loop:	ldrb  r2, [r0], #1	@ r2 = *r0++    ; Get array element
	add   r3, r2, r3	@ r3 += r2      ; Calculate sum
	cmp   r0, r1		@ if (r0 != r1)	; Check if hit end-of-array
	bne   loop		@    goto loop  ; Loop
	mov   pc, lr		@ pc = lr	; Return when done
