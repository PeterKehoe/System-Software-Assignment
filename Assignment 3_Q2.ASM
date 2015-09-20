;Peter Kehoe
;2841804
;Assignment 3
;
;Question 2
;Write a similar program as in question 1, this time show the sum on the VDU

clo

mov DL, C1	;DL used as a point to where input data is to be stored
mov CL, C1	;CL used as a point to where needed data for addtion can be found
call 60		;Call to a procedure to clean the VDU

call 50		;Input/check
mov [dl], al	;move input to VDU
add dl, 10	;update pointer DL tp next location
call 50		;second input/check
mov [dl], al	
add dl, 20	;update pointer DL to point to the result location

mov al, [cl]	;Values needed for the addtion are retrived using he pointer CL
add cl, 10	;
mov bl, [cl] 	;
add al, bl	;
sub al, 60	;

push al		;
mod al, a	;
add al, 30	;
mov [dl], al	;Right most digit moved to VDU
dec dl		;Pointer DL updated to the next out put location

pop al		;carry calculated and moved to VDU
div al, a	;or ignored if it is 0
jz finish	;
add al, 30	;
mov [dl], al	;
finish:		;

org 50		;input/checking procedure
begin:
	in 00
	cmp al, 30
	js begin
	cmp al, 40
	jns begin
ret

org c0		;org of needed formating
db "                +               --"

org 60		;Cleans the VDU
push cl		;
mov al, 20	;
mov [cl], al	;
add cl, 10	;
mov [cl], al	;
add cl, 20	;
mov [cl], al	;
dec cl		;
mov [cl], al	;
pop cl		;
ret		;
end