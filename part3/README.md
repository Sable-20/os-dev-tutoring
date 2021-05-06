# note

all of this code will be in c++ or assembly so that I could build this faste and its a bit easier to understand, if you want it to be translated to C, youll need to do it yourself.

# Rolling your own bootloader

This is the bootloader from a kernel I have designed, it is a UEFI compatible bootloader that is built in C using the efi library. This is not connected to anything, the code for those finished things will be published at a later date.

# idt

the IDT code is provided for you to look over as will the GDT code. It will have all the required files for it to compile.

the files with the actual IDT code are as follows

- IDT.cpp
- IDT.h
- interrupts.h
- interrupts.cpp

# gdt

the GDT has no external files require so all the files in the GDT are needed, you may review them as needed
