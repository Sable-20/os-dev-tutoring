section .multiboot_header
; the section is needed so we can correctly position
; it during linking

header_start:
    ; magic number
    ; this magic number was kind of just chosen
    ; the CPU can read this number and if it sees it itll know that this is an operating system
    ; that means it knows its OK to boot
    ; this must be in here or it will not boot
    dd 0xe85250d6

    ; architecture
    ; the architecture is MIPS, ARM, x86, or x86_64
    dd 0 ; this is showing that its in protected mode
    ; protected mode is the main operating mode of modern Intel processors
    ; since the 80286 (16 bit) after the 32 bit we can now work with a maximum of 4GB 
    ; of addressable memory, we can work with this virtual memory to enter real mode(will be addressed later)
    ; protected mode enables the system to enforce strict memory and hardware I/O protection

    ; header length
    dd header_end - header_start

    ; checksum
    ;    num... - (magic number + protected mode + header length)
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

    ; end tag
    dw 0
    dw 0 
    dd 8
header_end: