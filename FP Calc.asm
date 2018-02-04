.data
welcome: .asciiz "Please enter the option number from the list below:\n"
option1: .asciiz "1. Area of a circle\n"
option2: .asciiz "2. Circumference of a circle\n"
option3: .asciiz "3. Area of rectangle\n"
option4: .asciiz "4. Perimeter of rectangle\n"
option5: .asciiz "5. Exit program\n\n"
invalid: .asciiz "That is not a valid option number.\n\n"
radiusPrompt: .asciiz "\nPlease enter the radius: "
lengthPrompt: .asciiz "\nPlease enter the length: "
widthPrompt: .asciiz "\nPlease enter the width: "
areaText: .asciiz "\nArea = "
circumText: .asciiz "\nCircumference = "
perimText: .asciiz "\nPerimeter = "
exit: .asciiz "\nThank you for using my program. Goodbye."
line: .asciiz "\n"
zeroD: .double 0.0
piS: .float 3.1415

.text
main:
la $a0, welcome	#print welcome message and prompt for option number
addi $v0, $0, 4
syscall
la $a0, option1	#print option 1
addi $v0, $0, 4
syscall
la $a0, option2	#print option 2
addi $v0, $0, 4
syscall
la $a0, option3	#print option 3
addi $v0, $0, 4
syscall
la $a0, option4	#print option 4
addi $v0, $0, 4
syscall
la $a0, option5	#print option 5
addi $v0, $0, 4
syscall
addi $v0, $0, 5	#read user input
syscall
beq $v0, 1, op1	#branch to appropriate option
beq $v0, 2, op2
beq $v0, 3, op3
beq $v0, 4, op4
beq $v0, 5, op5

invalidOp:
la $a0, invalid	#prompt for another option because input is invalid (return to menu
addi $v0, $0, 4
syscall
j main

op1:
la $a0, radiusPrompt	#ask for radius (as float)
addi $v0, $0, 4
syscall
addi $v0, $0, 6	#read input
syscall
mul.s $f4, $f0, $f0	#compute Area
l.s $f5, piS
mul.s $f12, $f4, $f5
la $a0, areaText	#output computed Area
addi $v0, $0, 4
syscall
addi $v0, $0, 2
syscall
la $a0, line
addi $v0, $0, 4
syscall
j main		#return to menu

op2:
la $a0, radiusPrompt	#ask for radius (as float)
addi $v0, $0, 4
syscall
addi $v0, $0, 6	#read input
syscall
add.s $f4, $f0, $f0	#compute circumference
l.s $f5, piS
mul.s $f12, $f4, $f5
la $a0, circumText	#output computed Circumference
addi $v0, $0, 4
syscall
addi $v0, $0, 2
syscall
la $a0, line
addi $v0, $0, 4
syscall
j main		#return to menu

op3:
la $a0, lengthPrompt	#ask for length of rectangle (as double)
addi $v0, $0, 4
syscall
addi $v0, $0, 7	#read input
syscall
l.d $f4, zeroD
add.d $f6, $f0, $f4	#save length
la $a0, widthPrompt	#ask for width of rectangle (as double)
addi $v0, $0, 4
syscall
addi $v0, $0, 7	#read input
syscall
mul.d $f12, $f6, $f0	#compute Area
la $a0, areaText	#output computed Area
addi $v0, $0, 4
syscall
addi $v0, $0, 3
syscall
la $a0, line
addi $v0, $0, 4
syscall
j main		#return to menu

op4:
la $a0, lengthPrompt	#ask for length as double
addi $v0, $0, 4
syscall
addi $v0, $0, 7	#read input
syscall
add.d $f4, $f0, $f0	#double length
la $a0, widthPrompt	#ask for width (as double)
addi $v0, $0, 4
syscall
addi $v0, $0, 7	#read input
syscall
add.d $f6, $f0, $f0	#double width
add.d $f12, $f4, $f6	#compute Perimeter
la $a0, perimText	#output computed Perimeter
addi $v0, $0, 4
syscall
addi $v0, $0, 3
syscall
la $a0, line
addi $v0, $0, 4
syscall
j main		#return to menu

op5:
la $a0, exit	#print exit message
addi $v0, $0, 4
syscall
addi $v0, $0, 10	#exit program
syscall
