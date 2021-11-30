; Project Name:        Mary_Mitchell.asm
; Program Description: Program to read values from an arrary, add another value
;                      to those, and save the sums into specific registers.
;                      Run on Visual Studio with masm.
; Author:              Mary Mitchell
; Course:              COMP 3350-001
; Sources:             No sources other than the information from lecture
; Creation Date:       22 September 2021
; Submission Date:     24 Spetember 2021

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword
.data
	input BYTE 1, 2, 3, 4, 5, 6, 7, 8
	shift BYTE 2
.code
main PROC
	; reset registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	; 1+2 in high position of AX
	mov ah, [input]
	add ah, shift
	; 2+2 in low position of AX
	mov al, [input+1]
	add al, shift
	; 3+2 in high position of BX
	mov bh, [input+2]
	add bh, shift
	; 4+2 in low position of BX
	mov bl, [input+3]
	add bl, shift
	; 5+2 in high position of CX
	mov ch, [input+4]
	add ch, shift
	; 6+2 in low position of CX
	mov cl, [input+5]
	add cl, shift
	; 7+2 in high position of DX
	mov dh, [input+6]
	add dh, shift
	; 8+2 in low position of DX
	mov dl, [input+7]
	add dl, shift

	invoke ExitProcess, 0
main ENDP
END main


