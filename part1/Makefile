x86_64_asm_source_files := $(shell find src/impl/x86_64 -name *.asm)
# what this is doing it running SHELL which allows you to use shell commands
# its finding all files in src/impl/x86_64 that have the .asm extension
x86_64_asm_object_files := $(patsubst src/impl/x86_64/%.asm, build/x86_64/%.o, $(x86_64_asm_source_files))
# this is using a path substitution to find compiled files
# look at patsub for more detailed explanation but basically 
# its using the same instructuctions but substitute the build folder for the src folder


# this is re defining them by taking in the build and source files, it makes the directory
# build/x86_64 and then assembles them using nasm
$(x86_64_asm_object_files): build/x86_64/%.o : src/impl/x86_64/%.asm
	mkdir -p $(dir $@) && \
	nasm -f elf64 $(patsubst build/x86_64/%.o, src/impl/x86_64/%.asm, $@) -o $@

# this is our PHONY declaration letting us make the function
.PHONY: build-x86_64
build-x86_64: $(x86_64_asm_object_files)
	mkdir -p dist/x86_64 && \
	x86_64-elf-ld -n -o dist/x86_64/kernel.bin -T targets/x86_64/linker.ld $(x86_64_asm_object_files) && \
	cp dist/x86_64/kernel.bin targets/x86_64/iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/x86_64/kernel.iso targets/x86_64/iso
# this takes in the object files as an argument
# it uses the cross compiler to make the kernel binary files
# the target is defined with the linker file and the object files
# we're co[ying the bin to targets
# finally we do a grub mkrescue