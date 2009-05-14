	.section "vectors"
reset:	b     start
undef:  b     undef
swi:	b     swi
pabt:	b     pabt
dabt:	b     dabt
	nop
irq:	b     irq
fiq:	b     fiq

	.text
start:
	@@ Copy data to RAM.
	ldr   r0, =flash_sdata
	ldr   r1, =ram_sdata
	ldr   r2, =data_size
copy:
	ldrb  r4, [r0], #1
	strb  r4, [r1], #1
	subs  r2, r2, #1
	bne   copy
	
	@@ Initialize .bss
	ldr   r0, =sbss
	ldr   r1, =ebss
	ldr   r2, =bss_size
	mov   r4, #0
zero:	
	strb  r4, [r0], #1
	subs  r2, r2, #1
	bne   zero
	
	@@ Initialize the stack pointer
	ldr   sp, =0xA4000000

	bl    main

stop:	b     stop
