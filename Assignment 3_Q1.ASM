;Peter Kehoe
;2841804
;Assignment 3
;
;Question 1
;create a program that take two single-digit numbers from the simple keyboard 
;and adds them together. print the answer to the VDU

clo
jmp start

org 03
start:
mov al, 20		;Cleans the result from previous runs of the program.
mov [f0], al		;
mov [f1], al		;

call 40			;Call to a method that gets an input and checks it's a number
push al 		;Saves the first number to the stack
call 40			;Gets/Checks the second number

pop bl			;Two ascii values in AL and BL
add al, bl			
sub al, 60 		;Subtracting 60 from the answer to get the numeric answer

push al
mod al, a		;Mod the answer by 10(a)to get the right most digit
add al, 30
mov [F1], al		;Move it to the VDU

pop al
div al, a		;Div by 10(a) to get the carry
jz finish		;Jump to Finish if the carry is 0
add al, 30
mov [F0], al
finish:

org 40
begin:
	in 00		;get input
	cmp al, 30	;checks it's larger then 30
	js begin
	cmp al, 3a
	jns begin	;check it's smaller then 40	
ret

end