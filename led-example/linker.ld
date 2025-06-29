/* linker.ld (Linker-Script) by Satyria.de -> see https://satyria.de/arm/index.php?title=Working_with_Make_and_Linker_Script */
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
	.init_array : {
		__init_start = .;
		KEEP(*(.init_array*))
		__init_end = .;
	}
	.ARM.exidx : {
		__exidx_start = .;
		*(.ARM.exidx*)
		__exidx_end = .;
	}
	.eh_frame : {
		*(.eh_frame*)
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
__bss_size = (__bss_end - __bss_start)>>3;
