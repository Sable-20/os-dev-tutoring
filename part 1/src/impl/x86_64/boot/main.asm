global start
; entry point for when we start linking

section .text
    ; the text section is basically where we put the code

    bits 32
    ; this is us setting our bits to 32 since 
    ; even though this is a 64bit operating system we have to do a few
    ; things in 32 bit mode first
start:
    ; print `OK`

    ; this will be using video memory since we dont have
    ; a VGA buffer to print to the screen yet
    ; this will be removed later
    ; 0xb8000 is the video address memory
    mov dword [0xb8000], 0x2f4b2f4f

    ; the `halt` instruction that tells it to stop, eventually we will loop this 
    ; instead of halting it
    hlt