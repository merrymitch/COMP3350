; Project 3:    Mary_Mitchell.asm
; Author:       Mary Mitchell
; Description:  A program that will read a value from an array, and 
;               then place this value in another array with the 
;               location shifted by a certain amount. 
; Sources:      The project rubric and the lecture briefing.
; Date Created: 14 October 2021
; Date Revised: 15 October 2021

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
	; DWORD variable for shift value
	shift DWORD 3
	; BYTE array that will be shifted 
	input BYTE 1, 2, 3, 4, 5, 6, 7, 8
	; BYTE array that is the length of input, with uninitialized values
	output BYTE LENGTHOF input DUP(?)
.code
	main proc
		; Clear the registers used in this program
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0
		mov esi, 0
		mov edi, 0
		; Set esi and edi to the beginning each array
		mov esi, OFFSET input
		mov edi, OFFSET output
		; Move esi along the input array so it's at the address
		; of the variable that will become first in the new array
		; (i.e. move to values that will wrap around)
		mov eax, LENGTHOF input
		sub eax, shift
		add esi, eax
		; Put the variable shift into ecx for the first loop counter.
		mov ecx, shift
		; The first loop will run 'shift' amount of times. It will 
		; place the values that need to wrap around the array in their
		; proper places at the front of 'output'. 
		L1: 
			mov bl, [esi]
			mov [edi] , bl
			add esi, 1
			add edi, 1
			mov bl, 0
		loop L1
		; Reset esi to the front of the input array to read the rest of the values
		mov esi, OFFSET input
		; Set ecx to the number of values not shifted yet.
		; This will be used to loop through the remaining values.
		mov ecx, LENGTHOF input
		sub ecx, shift
		; This loop shifts the values that did not have to wrap around
		; the array and places them into shifted positions in 'output'.
		L2: 
			mov bl, [esi]
			mov [edi] , bl
			add esi, 1
			add edi, 1
			mov bl, 0
		loop L2
		invoke ExitProcess, 0
	main endp
end main 
