.data

  string_specifier: .asciz "%[^\n]"
  string_buffer: .space 155
  char_specifier: .asciz "%c"
  string_x: .asciz "%d"
  string: .asciz "Input a string:"
  newline: .asciz "\n"
  char: .asciz "x"

.global main
.text

main:

//print the intro lines
ldr x0, =string
bl printf
//take the string as an Input
 ldr x0, =string_specifier
 ldr x1, =string_buffer
 bl scanf
 //load the sting into a register that preserves its value over function calls
ldr x20, =string_buffer
//branch to the loop length
b loop_length

loop_length:
//initialize the counter with 0 and go to loop
mov x21, #0

loop:
//load the char ascii value and check that its not equal to the end.
ldrb w22, [x20, x21]
cbz w22, loop_exit
//branch and check if its a vowel
b vowel
b loop

loop_exit:
ldr x0, =newline
bl printf
b exit

vowel:
//A
ldrb w22, [x20, x21]
sub x23, x22, #65
cbz x23, printX
//E
mov x23, #0
sub x23, x22, #69
cbz x23, printX
//I
mov x23, #0
sub x23, x22, #73
cbz x23, printX
//O
mov x23, #0
sub x23, x22, #79
cbz x23, printX
//U
mov x23, #0
sub x23, x22, #85
cbz x23, printX
//a
mov x23, #0
sub x23, x22, #97
cbz x23, printX
//e
mov x23, #0
sub x23, x22, #101
cbz x23, printX
//i
mov x23, #0
sub x23, x22, #105
cbz x23, printX
//o
mov x23, #0
sub x23, x22, #111
cbz x23, printX
//u
mov x23, #0
sub x23, x22, #117
cbz x23, printX
//else print the char
b printchar

printX:
//prints and x instead of the char at index
ldr x0, =char
bl printf
add x21, x21, #1
//return to the loop
b loop

printchar:
//prints char at that index
ldr x0, =char_specifier
ldrb w22, [x20, x21]
mov x1, x22
bl printf
add x21, x21, #1
//return to the loop
b loop

exit:
  	mov x0, #0
  	mov x8, #93
  	svc #0
