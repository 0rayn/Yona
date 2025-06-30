NAME     := kernel.img
LOADADDR := 0x80000
ELF      := build/$(NAME:.img=.elf)
MAP      := build/$(NAME:.img=.map)

# Find all .c and .S source files recursively in src/
CSRCS    := $(shell find src -name '*.c')
ASRCS    := $(shell find src -name '*.S')

# Create object file paths by replacing "src/" with "build/" and ".c/.S" with ".o"
COBJS    := $(patsubst src/%.c,build/%.o,$(CSRCS))
AOBJS    := $(patsubst src/%.S,build/%.o,$(ASRCS))
AllOBJS  := $(COBJS) $(AOBJS)

# Include dirs from all subfolders of src and include
INCDIRS  := $(sort $(dir $(CSRCS) $(ASRCS)))
CFLAGS   := -mcpu=cortex-a76 -mlittle-endian -Wall -O0 -ffreestanding -fsigned-char \
            -nostartfiles -nostdlib -nostdinc -g -fno-exceptions
CFLAGS   += $(foreach d,$(INCDIRS),-I$d) -Iinclude

AFLAGS   := -mcpu=cortex-a76 -mlittle-endian -O0 -g
AFLAGS   += $(foreach d,$(INCDIRS),-I$d) -Iinclude

# Default target
all: build $(NAME)

# Create build dir (and subdirs if needed)
build:
	@mkdir -p build

# Compile C source files to object files
build/%.o: src/%.c
	@mkdir -p $(dir $@)
	@echo "gcc $@"
	@aarch64-none-elf-gcc $(CFLAGS) -c $< -o $@

# Compile Assembly source files to object files
build/%.o: src/%.S
	@mkdir -p $(dir $@)
	@echo "as $@"
	@aarch64-none-elf-gcc $(AFLAGS) -c $< -o $@

# Link everything into an ELF and create a raw kernel image
$(NAME): $(AllOBJS)
	@echo "============================================================================="
	@echo "Linking..."
	@aarch64-none-elf-ld -o $(ELF) -Map $(MAP) -nostdlib \
		--section-start=.init=$(LOADADDR) --no-warn-rwx-segments \
		-g -T linker.ld $(AllOBJS)
	@aarch64-none-elf-objcopy -O binary $(ELF) build/$(NAME)
	@cp build/$(NAME) .

# Clean build artifacts
clean:
	@rm -rf build $(NAME)

re: clean all

.Phony: re clean all 
