;Peter Kehoe
;2841804
;Assignment 3
;
;Question 4
;Extend your program from question 3 to create and adder for 
;two 8-digit numbers

clo			
jmp start		
org c0
db "                +               ---------"

org 3
start:
mov CL, c1
call 37
add cl, 10
call 37
add cl, 20
call 37

mov cl, c1
call 82
add cl, 10
call 82

mov DL, 30
mov CL, c8		;CL Here needed to be changed to point to a different starting location
adding:
	call 54
	dec CL
	cmp CL, c0
jnz adding
cmp DL, 30
jz finish
add cl, 30
mov [CL], dl

org 54
push CL
mov al, [cl]
add cl, 10
mov bl, [cl]
add al, bl
add al, dl
sub al, 90
push al
pop dl
div dl, a
add dl, 30
mod al, a
add cl, 20
add al, 30
mov [cl], al
pop CL
ret

org 82
push cl
push DL

push CL
pop DL
add dl, 8	;DL our pointer to mark the end, needed to be increased by 8 for this question	
begin:
	in 00
	cmp al, 30
	js begin
	cmp al, 40
	jns begin
mov [CL], al
inc cl
cmp cl, DL
jnz begin

pop DL
pop cl
ret

org 37
push cl
push cl
pop dl
add dl, 8
mov al, 20
clean:
	mov [cl], al
	inc cl
	cmp cl, dl
	js clean
mov [f0], al
pop cl
ret

finish:
end