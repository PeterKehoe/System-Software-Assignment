;Peter Kehoe
;2841804
;Assignment 3
;
;Question 3
;Create a program similar to quesrion 2 that will add two 2-digit numbers


clo
jmp start	
org c0			;formatting for the VDU
db "                +               ---"

org 3		;This section clears the VDU 
start:		;For multible runs of the program
mov CL, c1	;
call 37		;
add CL, 10	;
call 37		;
add CL, 20	;
call 37		;

mov CL, c2	;CL used as a pointer to where the numbers should be stored on the VDU
call 80		;Procdure to take the first set of inputs
add cl, 10	;update the pointer CL
call 80		;Procdure to take the second set of inputs

mov DL, 30	;DL used to store to carry componant for the addition and set to 30 (Ascii 0)
mov CL, c2	;CL used to point to a colume of data
adding:
	call 53	;Procedure to add the two numbers in a colume + the carry
	dec CL	;CL updated to point to the next colume 
cmp CL, c1	;Stops once CL reachs the left most colume
jz adding
cmp DL, 30	;If the final carry is 0 jump to finish
jz finish	;
add cl, 30	;other wise print it to the approperate location on the VDU
mov [CL], dl	;

org 53
push CL
mov al, [cl]	;values stored in AL, BL and the arrry in DL
add cl, 10	;
mov bl, [cl]	;
add al, bl
add al, dl
sub al, 90	;Sub 90 to get the humber to a hex value not a Ascii value
push al
pop dl
div dl, a	;Answer is Div by a and stored in DL to become the carry for the next calculation.
add dl, 30	;
mod al, a	;
add cl, 20	;The Mod of the ans is then moved to the VDU to be diplayed in the 
add al, 30	;Location pointed to by CL
mov [cl], al	;
pop CL
ret

org 80
push cl
push DL

	push CL			
	pop DL			;DL used to mark the position of the last input
	dec DL			;
	begin:	
		in 00		;Check the input is numeric 
		cmp al, 30	;
		js begin	;
		cmp al, 3a	;
		jns begin	
	mov [CL], al		;move the iput to the laction pointed to by CL
	dec cl			;update the pointer CL
	cmp cl, DL		;Continues to jump until CL has reached DL
	jz begin

pop DL
pop cl
ret

org 37				;procdure for cleaning the VDU
push cl				;
push cl				;
pop dl				;
inc dl				;
mov al, 20			;	
clean:				;
	mov [cl], al		;
	inc cl			;
	cmp cl, dl		;
	jz clean		;
mov [f0], al			;
pop cl				;
ret				;
finish:			
end