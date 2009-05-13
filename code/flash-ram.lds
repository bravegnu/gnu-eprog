SECTIONS {
	. = 0x00000000;
	.text : { * (.text); }

	. = 0xA0000000;
	.data : { * (.data); }
}