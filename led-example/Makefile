# Makefile by Satyria.de -> see https://satyria.de/arm/index.php?title=Working_with_Make_and_Linker_Script
CSRCS := $(wildcard *.c)
CPPSRCS := $(wildcard *.cpp)
ASRCS := $(wildcard *.S)
COBJS := $(CSRCS:.c=.o)
CPPOBJS := $(CPPSRCS:.cpp=.o)
AOBJS := $(ASRCS:.S=.o)
AllOBJS := $(COBJS) $(CPPOBJS) $(AOBJS)
LOADADDR = 0x80000

GCCFLAGS = -mcpu=cortex-a76 -mlittle-endian -Wall -O0 -ffreestanding \
           -nostartfiles -nostdlib -nostdinc -g -I ./include

AFLAGS = -mcpu=cortex-a76 -mlittle-endian  -I ./include -O0 -g

CFLAGS = -mcpu=cortex-a76 -mlittle-endian -Wall -fsigned-char -ffreestanding -g \
         -I ./include -O0 -fno-exceptions 

CPPFLAGS = -fno-exceptions -fno-rtti -nostdinc++ -mcpu=cortex-a76 -mlittle-endian -Wall -fsigned-char \
			  -ffreestanding -g -I ./include -O0 -mstrict-align -std=c++14 -Wno-aligned-new

all: clean new kernel_2712.img

%.o: %.S
	@echo "as $@"
	@aarch64-none-elf-gcc $(AFLAGS) -c $< -o $@

%.o: %.c
	@echo "gcc $@"
	@aarch64-none-elf-gcc $(CFLAGS) -c $< -o $@

%.o: %.cpp
	@echo "g++ $@"
	@aarch64-none-elf-g++ $(CPPFLAGS) -c $< -o $@

kernel_2712.img: $(AllOBJS)
	@echo "============================================================================="
	@echo "Linking..."
	@aarch64-none-elf-ld -o kernel_2712.elf -Map kernel_2712.map -nostdlib \
		--section-start=.init=$(LOADADDR) --no-warn-rwx-segments \
		-g -T linker.ld $(AllOBJS)
	aarch64-none-elf-objcopy -O binary kernel_2712.elf kernel_2712.img

clean:
	/bin/rm -f kernel_2712.elf *.o *.img > /dev/null 2> /dev/null || true

new:
	/bin/clear

