ENTRY(_start)

SECTIONS
{
	.init : {
		*(.init)
	}

	.text : {
		*(.text*)
		_etext = .;
	}

	.rodata : {
		*(.rodata*)
	}

	.data : {
		*(.data*)
	}

	.bss : {
		__bss_start = .;
		*(.bss*)
		*(COMMON)
		__bss_end = .;
	}
}

__bss_size = (__bss_end - __bss_start) >> 3;
