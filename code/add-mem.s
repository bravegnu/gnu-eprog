	.data
val1:	.4byte 10		@ First number
val2:	.4byte 30		@ Second number
result:	.4byte 0		@ 4 byte space for result

	.text
	.align
start:
	ldr   r0, =val1	 	@ r0 = &val1
	ldr   r1, =val2		@ r1 = &val2

	ldr   r2, [r0]		@ r2 = *r0
	ldr   r3, [r1]		@ r3 = *r1

	add   r4, r2, r3	@ r4 = r2 + r3

	ldr   r0, =result	@ r0 = &result
	str   r4, [r0]		@ *r0 = r4

stop:	b stop
