	.text
	b start			@ Skip over the data
arr:	.byte 10, 20, 25	@ Read-only array of bytes
eoa:				@ Address of end of array + 1

	.align
start:
	ldr   r0, =arr	 	@ r0 = &arr
	ldr   r1, =eoa		@ r1 = &eoa

	bl    sum		@ Invoke the sum subroutine
	
stop:	b stop
