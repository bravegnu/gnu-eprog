	.text
entry:	b start			@ Skip over the data
arr:	.byte 10, 20, 25	@ Read-only array of bytes
eoa:				@ Address of end of array + 1

	.align
start:
	ldr   r0, =eoa	 	@ r0 = &eoa
	ldr   r1, =arr		@ r1 = &arr
	mov   r3, #0		@ r3 = 0
loop:	ldrb  r2, [r1], #1	@ r2 = *r1++
	add   r3, r2, r3	@ r3 += r2
	cmp   r1, r0		@ if (r1 != r0)
	bne   loop		@    goto loop
stop:	b stop
