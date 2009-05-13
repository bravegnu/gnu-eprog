SECTIONS {
	 . = 0x00000000;
	 .text : { * (.text); }

	 . = 0x00000400;
	 .data : { * (.data); }
}