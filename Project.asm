TITLE My First Project   
INCLUDE Irvine32.inc
INCLUDE Macros.inc
BUFFER_SIZE = 501
.data
buffer BYTE 40 DUP(?),0dh,0ah
bufSize DWORD ($-buffer)
errMsg BYTE "Cannot open file",0dh,0ah,0
filename     BYTE "output.txt",0
fileHandle   HANDLE ?			; handle to output file
bytesWritten DWORD ?    			; number of bytes written   ;File VAriables
quesL1 DWORD 10 DUP(?)
quesL2 DWORD 10 DUP(?)
quesL3 DWORD 10 DUP(?)			;QUESTION ADDRESSES
player BYTE "Enter Player Name: ",0
spaces1 BYTE "                                                                      ",0
arr1 BYTE 1,4,2,2,3,3,1,2,4,3
arr2 BYTE 2,4,3,1,2,2,1,1,1,4
arr3 BYTE 3,4,3,2,4,1,1,1,2,3		;ANSWERS
name1 BYTE 10 DUP(?)
scoreL1 BYTE ?  
scoreL2 BYTE ?  
scoreL3 BYTE ?						;SCORE OF EACH LEVEL 
msg1 BYTE "YOUR LEVEL 1 SCORE: ",0
msg3 BYTE "YOUR LEVEL 2 SCORE: ",0
msg4 BYTE "YOUR LEVEL 3 SCORE: ",0
string1 BYTE "Excellent IQ LEVEL",0
string2 BYTE "FAIR IQ LEVEL ",0
string3 BYTE "POOR IQ LEVEL",0				;IQ STAGING
string4 BYTE 'C','O','N','G','R','A','T','U','L','A','T','I','O','N',' ','L','E','V','E','L',' ','P','A','S','S','E','D',0	;REWARD
string5 BYTE "    QUIZ/INTELLIGENCE GAME",0
string6 BYTE "         PROJECT BY",0dh,10,"                                                                          Asna Arshad 21K-2000",13,0
string7 BYTE "PRESS ANY KEY TO CONTINUE!!!!",0
QuizScore BYTE "YOUR QUIZ SCORE: ",0
finalmsg BYTE "YOUR IQ LEVEL: ",0
Opt BYTE "WHAT DO YOU WANT ? ",0ah,"1: PLAY A QUIZ GAME ",0ah,"2: CALCULATE YOUR IQ ",0ah,"Enter choice: ",0
life BYTE 5		;LIFE FOR PLAYER ONLY IN OPT QUIZ
TotalScore WORD ?
count DWORD 27


buffer2 BYTE BUFFER_SIZE DUP(10)
f_name BYTE "players.txt",0
f_handle HANDLE ?
stringlength dword ?
str1 byte  "cannot open",0
space byte 0dh,0ah

bufferSize = 5000
buffers BYTE bufferSize DUP(?)
filehandles HANDLE ?
filenames BYTE "input.txt", 0
bytesReads DWORD ?
answer_arrays DWORD 11 DUP(0)

bufferSize2 = 5000
buffers2 BYTE bufferSize2 DUP(?)
filehandles2 HANDLE ?
filenames2 BYTE "input2.txt", 0
bytesReads2 DWORD ?
answer_arrays2 DWORD 11 DUP(0)

bufferSize1 = 5000
buffers1 BYTE bufferSize1 DUP(?)
filehandles1 HANDLE ?
filenames1 BYTE "input1.txt", 0
bytesReads1 DWORD ?
answer_arrays1 DWORD 11 DUP(0)

aq1c_size = 66
aq1c BYTE 67 DUP(?)
aq2c_size = 67
aq2c BYTE 68 DUP(?)
aq3c_size = 101
aq3c BYTE 103 DUP(?)
aq4c_size = 101
aq4c BYTE 102 DUP(?)
aq5c_size = 69
aq5c BYTE 70 DUP(?)
aq6c_size = 102
aq6c BYTE 103 DUP(?)
aq7c_size = 89
aq7c BYTE 90 DUP(?)
aq8c_size = 89
aq8c BYTE 90 DUP(?)
aq9c_size = 124
aq9c BYTE 125 DUP(?)
aq10c_size = 58
aq10c BYTE 59 DUP(?)
addresses DWORD 11 DUP(?)
;finalSize = 92, 185, 422, 640, 737, 918, 997, 1094, 1211, 1315

bq1c_size = 82
bq1c BYTE 83 DUP(?)
bq2c_size = 75
bq2c BYTE 76 DUP(?)
bq3c_size = 157
bq3c BYTE 158 DUP(?)
bq4c_size = 171
bq4c BYTE 172 DUP(?)
bq5c_size = 166
bq5c BYTE 167 DUP(?)
bq6c_size = 80
bq6c BYTE 81 DUP(?)
bq7c_size = 140
bq7c BYTE 141 DUP(?)
bq8c_size = 130
bq8c BYTE 131 DUP(?)
bq9c_size = 123
bq9c BYTE 124 DUP(?)
bq10c_size = 86
bq10c BYTE 87 DUP(?)
addresses2 DWORD 11 DUP(?)

cq1c_size = 90
cq1c BYTE 91 DUP(?)
cq2c_size = 183
cq2c BYTE 184 DUP(?)
cq3c_size = 151
cq3c BYTE 152 DUP(?)
cq4c_size = 220
cq4c BYTE 221 DUP(?)
cq5c_size = 99
cq5c BYTE 100 DUP(?)
cq6c_size = 216
cq6c BYTE 217 DUP(?)
cq7c_size = 75
cq7c BYTE 76 DUP(?)
cq8c_size = 95
cq8c BYTE 96 DUP(?)
cq9c_size = 115
cq9c BYTE 116 DUP(?)
cq10c_size = 102
cq10c BYTE 103 DUP(?)
addresses1 DWORD 11 DUP(?)


Level3_Print PROTO, questions:PTR DWORD, answers:PTR DWORD, scorel3:byte
Level2_Print PROTO, questions2:PTR DWORD, answers2:PTR DWORD, scorel2:byte
Level1_Print PROTO, questions1:PTR DWORD, answers1:PTR DWORD, scorel1:byte
QLevel3_Print PROTO, questions:PTR DWORD, answers:PTR DWORD, scorel3:byte
QLevel2_Print PROTO, questions2:PTR DWORD, answers2:PTR DWORD, scorel2:byte
QLevel1_Print PROTO, questions1:PTR DWORD, answers1:PTR DWORD, scorel1:byte

.code
main PROC
mov eax,white+(red*16)
call settextcolor

;///////FILING - APPEND MODE////////////////
;;START OF PROGRAM
mov edx,offset f_name
call outputfile
mov f_handle,eax
cmp eax,INVALID_HANDLE_VALUE     
jne file_ok
mov edx,offset str1
call writestring
jmp quit

file_ok:
mov edx,offset PLAYER
call writestring
mov ecx,BUFFER_SIZE
mov edx,offset buffer2
call readstring
mov stringlength,eax

INVOKE SetFilePointer,
f_Handle,0,0,FILE_END

mov eax,f_handle
mov edx,offset space
mov ecx,1
call writetofile

mov eax,f_handle
mov edx,offset buffer2
mov ecx,stringlength
call writetofile
call crlf
INVOKE CloseHandle, fileHandle	;FILING

quit:
call spaces
mov edx,offset string5
call writestring
call crlf
call spaces
mov edx,offset string6
call writestring
call crlf
call spaces
mov edx,offset string7
call writestring
call crlf
call readchar
call clrscr								;MAIN MENU
mov eax,0
mov esi,0

call clrscr
mov edx,offset Opt
call WriteString
Call ReadDec							
cmp eax,1
je Quiz   ;///PLAYERS JUMPS TO QUIZ IF CHOICE==1



;///CALLING IQ LEVEL FUNCTIONS////////
INVOKE Level1_Print, ADDR addresses1, ADDR answer_arrays1, scoreL1
mov ax,2000
call Delay 
call clrscr
INVOKE Level2_Print, ADDR addresses2, ADDR answer_arrays2, scoreL2
mov ax,2000
call Delay
call clrscr
INVOKE Level3_Print, ADDR addresses, ADDR answer_arrays, scoreL3
call clrscr

mov ax,0
mov al,scoreL1
push ax
mov al,scoreL2
push ax
mov al,scoreL3
push ax
call Percentage   ;//PERCENTAGE FUNCTION TO CALCULATE PERCENTAGE OF IQ
mov ax,TotalScore
push eax
call standing
jmp exi



Quiz:				;QUIZ FUNCTIONS CALLED
;///////Calling IQ FUNCTIONS
INVOKE QLevel1_Print, ADDR addresses1, ADDR answer_arrays1, scoreL1
mov ax,2000
call Delay
call clrscr
mov al,life
cmp al,0
je I1 
call Crlf
call reward
call crlf
mov ax,2000
call Delay 
call clrscr
cld


INVOKE QLevel2_Print, ADDR addresses2, ADDR answer_arrays2, scoreL2
mov ax,2000
call Delay
call clrscr
mov al,life
cmp al,0
je I2
;call Crlf
call reward
;call crlf
mov ax,2000
call Delay
call clrscr 

INVOKE QLevel3_Print, ADDR addresses, ADDR answer_arrays, scoreL3
mov ax,1000
call Delay
call clrscr
mov al,life
cmp al,0
je I3
;call Crlf
call reward
call crlf
mov ax,2000
call Delay 
call clrscr

mov eax,0
mov al,scoreL1
add al,scoreL2
add al,scoreL3
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi
I1:
call clrscr
mov eax,0
mov al,scoreL1
call crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi

I2:
mov eax,0
mov al,scoreL1
add al,scoreL2
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi

I3:
mov eax,0
mov al,scoreL1
add al,scoreL2
add al,scoreL3
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
exi:
exit
main ENDP

;/////////MAIN ENDP



;//FUNCTIONS DEFINED

reward Proc		;//REWARD WILL BE DISPLAYED AFTER PLAYER CROSSES LEVEL
pushad
mov dl,69
mov dh,18
call gotoxy
mov ebx,0
mov esi,0
L5:
cmp ebx,count
jz Rw
mov al,string4[esi]
call WriteChar
mov eax,150
call Delay
inc esi
dec count
jmp L5

Rw:
mov eax,27
mov count,eax
mov eax,0
popad
ret
reward ENDP





Percentage Proc
push ebp
mov ebp,esp
mov eax,0
mov ax,[ebp+8]		;RESTORING SCORES FROM STACK
add ax,[ebp+10]
add ax,[ebp+12]
mov bx,100
mul bx
mov bx,60
div bx
mov TotalScore,ax
mov edx,offset finalmsg
call WriteString
mov ax,TotalScore
call writedec
mov al,'%'
call WriteChar
call Crlf
pop ebp
ret 
Percentage ENDP

;//////IQ STANDING
standing PROC
push ebp
mov ebp,esp
mov eax,[ebp+8]
mov TotalScore,ax
cmp TotalScore,100
JE EQUAL
cmp TotalScore,60
JGE GREATER
mov edx,offset string3
call crlf
call writestring
call crlf
exit
EQUAL:     
mov edx,offset string1
call crlf
call writestring
call crlf
exit
GREATER:
mov edx, offset string2
call crlf
call writestring
call crlf
pop ebp
ret
standing endp

spaces PROC
call crlf
call crlf
call crlf
mov edx,offset spaces1
call writestring
ret
spaces endp

outputfile proc
invoke createfile,
addr f_name,
generic_write,
do_not_share,
null,
OPEN_existing,
file_attribute_normal,
0
ret
outputfile endp


;/////////////IQ FUNCTION DEF
Level3_Print PROC, questions:PTR DWORD, answers:PTR DWORD, scoreLev3:BYTE
pushad
mov edx, OFFSET filenames
call OpenInputFile
mov filehandles, eax

mov edx, OFFSET buffers
mov ecx, bufferSize
call ReadFromFile
mov bytesReads, eax

mov ecx, cq1c_size
mov esi, OFFSET buffers
mov edi, OFFSET cq1c
rep movsb
mov cq1c[91], 0
mov addresses[1 * TYPE addresses], OFFSET cq1c

mov ecx, cq2c_size
add esi, 2
mov edi, OFFSET cq2c
rep movsb
mov cq2c[184], 0
mov addresses[2 * TYPE addresses], OFFSET cq2c

mov ecx, cq3c_size
add esi, 2
mov edi, OFFSET cq3c
rep movsb
mov cq3c[152], 0
mov addresses[3 * TYPE addresses], OFFSET cq3c

mov ecx, cq4c_size
add esi, 2
mov edi, OFFSET cq4c
rep movsb
mov cq4c[221], 0
mov addresses[4 * TYPE addresses], OFFSET cq4c

mov ecx, cq5c_size
add esi, 2
mov edi, OFFSET cq5c
rep movsb
mov cq5c[100], 0
mov addresses[5 * TYPE addresses], OFFSET cq5c

mov ecx, cq6c_size
add esi, 2
mov edi, OFFSET cq6c
rep movsb
mov cq6c[217], 0
mov addresses[6 * TYPE addresses], OFFSET cq6c

mov ecx, cq7c_size
add esi, 2
mov edi, OFFSET cq7c
rep movsb
mov cq7c[76], 0
mov addresses[7 * TYPE addresses], OFFSET cq7c

mov ecx, cq8c_size
add esi, 2
mov edi, OFFSET cq8c
rep movsb
mov cq8c[96], 0
mov addresses[8 * TYPE addresses], OFFSET cq8c

mov ecx, cq9c_size
add esi, 2
mov edi, OFFSET cq9c
rep movsb
mov cq9c[116], 0
mov addresses[9 * TYPE addresses], OFFSET cq9c

mov ecx, cq10c_size
add esi, 2
mov edi, OFFSET cq10c
rep movsb
mov cq10c[103], 0
mov addresses[10 * TYPE addresses], OFFSET cq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers
mov ebp, questions
mov esi,offset arr3
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,3
	E1:
	inc esi
	je S
	loop l3
	S:
	call crlf
	mov edx,offset msg4
	call writestring
	mov al,bl
	call writedec
	mov scoreL3,bl
	mov scorelev3,0
	popad
ret
Level3_Print ENDP


Level2_Print PROC, questions2:PTR DWORD, answers2:PTR DWORD, scoreLev2:BYTE
pushad
mov edx, OFFSET filenames2
call OpenInputFile
mov filehandles2, eax

mov edx, OFFSET buffers2
mov ecx, bufferSize2
call ReadFromFile
mov bytesReads2, eax

mov ecx, bq1c_size
mov esi, OFFSET buffers2
mov edi, OFFSET bq1c
rep movsb
mov bq1c[83], 0
mov addresses2[1 * TYPE addresses2], OFFSET bq1c

mov ecx, bq2c_size
add esi, 2
mov edi, OFFSET bq2c
rep movsb
mov bq2c[76], 0
mov addresses2[2 * TYPE addresses2], OFFSET bq2c

mov ecx, bq3c_size
add esi, 2
mov edi, OFFSET bq3c
rep movsb
mov bq3c[158], 0
mov addresses2[3 * TYPE addresses2], OFFSET bq3c

mov ecx, bq4c_size
add esi, 2
mov edi, OFFSET bq4c
rep movsb
mov bq4c[172], 0
mov addresses2[4 * TYPE addresses2], OFFSET bq4c

mov ecx, bq5c_size
add esi, 2
mov edi, OFFSET bq5c
rep movsb
mov bq5c[167], 0
mov addresses2[5 * TYPE addresses2], OFFSET bq5c

mov ecx, bq6c_size
add esi, 2
mov edi, OFFSET bq6c
rep movsb
mov bq6c[81], 0
mov addresses2[6 * TYPE addresses2], OFFSET bq6c

mov ecx, bq7c_size
add esi, 2
mov edi, OFFSET bq7c
rep movsb
mov bq7c[141], 0
mov addresses2[7 * TYPE addresses2], OFFSET bq7c

mov ecx, bq8c_size
add esi, 2
mov edi, OFFSET bq8c
rep movsb
mov bq8c[131], 0
mov addresses2[8 * TYPE addresses2], OFFSET bq8c

mov ecx, bq9c_size
add esi, 2
mov edi, OFFSET bq9c
rep movsb
mov bq9c[124], 0
mov addresses2[9 * TYPE addresses2], OFFSET bq9c

mov ecx, bq10c_size
add esi, 2
mov edi, OFFSET bq10c
rep movsb
mov bq10c[87], 0
mov addresses2[10 * TYPE addresses2], OFFSET bq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers2
mov ebp, questions2
mov esi,offset arr2
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,2
	E1:
	inc esi
	je S
	loop l3
	S:
	call crlf
	mov edx,offset msg3
	call writestring
	mov al,bl
	call writedec
	mov scoreL2,bl
	mov scorelev2,0
	popad
ret
Level2_Print ENDP

Level1_Print PROC, questions1:PTR DWORD, answers1:PTR DWORD, scoreLev1:BYTE
pushad
mov edx, OFFSET filenames1
call OpenInputFile
mov filehandles1, eax

mov edx, OFFSET buffers1
mov ecx, bufferSize1
call ReadFromFile
mov bytesReads1, eax

mov ecx, aq1c_size
mov esi, OFFSET buffers1
mov edi, OFFSET aq1c
rep movsb
mov aq1c[67], 0
mov addresses1[1 * TYPE addresses1], OFFSET aq1c

mov ecx, aq2c_size
add esi, 2
mov edi, OFFSET aq2c
rep movsb
mov aq2c[68], 0
mov addresses1[2 * TYPE addresses1], OFFSET aq2c

mov ecx, aq3c_size
add esi, 2
mov edi, OFFSET aq3c
rep movsb
mov aq3c[102], 0
mov addresses1[3 * TYPE addresses1], OFFSET aq3c

mov ecx, aq4c_size
add esi, 2
mov edi, OFFSET aq4c
rep movsb
mov aq4c[101], 0
mov addresses1[4 * TYPE addresses1], OFFSET aq4c

mov ecx, aq5c_size
add esi, 2
mov edi, OFFSET aq5c
rep movsb
mov aq5c[70], 0
mov addresses1[5 * TYPE addresses1], OFFSET aq5c

mov ecx, aq6c_size
add esi, 2
mov edi, OFFSET aq6c
rep movsb
mov aq6c[103], 0
mov addresses1[6 * TYPE addresses1], OFFSET aq6c

mov ecx, aq7c_size
add esi, 2
mov edi, OFFSET aq7c
rep movsb
mov aq7c[90], 0
mov addresses1[7 * TYPE addresses1], OFFSET aq7c

mov ecx, aq8c_size
add esi, 2
mov edi, OFFSET aq8c
rep movsb
mov aq8c[90], 0
mov addresses1[8 * TYPE addresses1], OFFSET aq8c

mov ecx, aq9c_size
add esi, 2
mov edi, OFFSET aq9c
rep movsb
mov aq9c[125], 0
mov addresses1[9 * TYPE addresses1], OFFSET aq9c

mov ecx, aq10c_size
add esi, 2
mov edi, OFFSET aq10c
rep movsb
mov aq10c[59], 0
mov addresses1[10 * TYPE addresses1], OFFSET aq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers1
mov ebp, questions1
mov esi,offset arr1
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,1
	E1:
	inc esi
	je S
	loop l3
	S:
	call crlf
	mov edx,offset msg1
	call writestring
	mov al,bl
	call writedec
	mov scoreL1,bl
	mov scorelev1,0
	popad
ret
Level1_Print ENDP



;////////////////QUIZ FUNCTIONS DEFINATION
QLevel1_Print PROC, questions1:PTR DWORD, answers1:PTR DWORD, scoreLev1:BYTE
pushad
mov edx, OFFSET filenames1
call OpenInputFile
mov filehandles1, eax

mov edx, OFFSET buffers1
mov ecx, bufferSize1
call ReadFromFile
mov bytesReads1, eax

mov ecx, aq1c_size
mov esi, OFFSET buffers1
mov edi, OFFSET aq1c
rep movsb
mov aq1c[67], 0
mov addresses1[1 * TYPE addresses1], OFFSET aq1c

mov ecx, aq2c_size
add esi, 2
mov edi, OFFSET aq2c
rep movsb
mov aq2c[68], 0
mov addresses1[2 * TYPE addresses1], OFFSET aq2c

mov ecx, aq3c_size
add esi, 2
mov edi, OFFSET aq3c
rep movsb
mov aq3c[102], 0
mov addresses1[3 * TYPE addresses1], OFFSET aq3c

mov ecx, aq4c_size
add esi, 2
mov edi, OFFSET aq4c
rep movsb
mov aq4c[101], 0
mov addresses1[4 * TYPE addresses1], OFFSET aq4c

mov ecx, aq5c_size
add esi, 2
mov edi, OFFSET aq5c
rep movsb
mov aq5c[70], 0
mov addresses1[5 * TYPE addresses1], OFFSET aq5c

mov ecx, aq6c_size
add esi, 2
mov edi, OFFSET aq6c
rep movsb
mov aq6c[103], 0
mov addresses1[6 * TYPE addresses1], OFFSET aq6c

mov ecx, aq7c_size
add esi, 2
mov edi, OFFSET aq7c
rep movsb
mov aq7c[90], 0
mov addresses1[7 * TYPE addresses1], OFFSET aq7c

mov ecx, aq8c_size
add esi, 2
mov edi, OFFSET aq8c
rep movsb
mov aq8c[90], 0
mov addresses1[8 * TYPE addresses1], OFFSET aq8c

mov ecx, aq9c_size
add esi, 2
mov edi, OFFSET aq9c
rep movsb
mov aq9c[125], 0
mov addresses1[9 * TYPE addresses1], OFFSET aq9c

mov ecx, aq10c_size
add esi, 2
mov edi, OFFSET aq10c
rep movsb
mov aq10c[59], 0
mov addresses1[10 * TYPE addresses1], OFFSET aq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers1
mov ebp, questions1
mov esi,offset arr1
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,1
	jmp E2
	E1:
	DEC life
	mov al,life
	cmp al,0
	je S
	E2:
	inc esi
	loop l3
	S:
	call crlf
	mov edx,offset msg1
	call writestring
	mov al,bl
	call writedec
	mov scoreL1,bl
	mov scorelev1,0
	popad
ret
QLevel1_Print ENDP

QLevel2_Print PROC, questions2:PTR DWORD, answers2:PTR DWORD, scoreLev2:BYTE
pushad
mov edx, OFFSET filenames2
call OpenInputFile
mov filehandles2, eax

mov edx, OFFSET buffers2
mov ecx, bufferSize2
call ReadFromFile
mov bytesReads2, eax

mov ecx, bq1c_size
mov esi, OFFSET buffers2
mov edi, OFFSET bq1c
rep movsb
mov bq1c[83], 0
mov addresses2[1 * TYPE addresses2], OFFSET bq1c

mov ecx, bq2c_size
add esi, 2
mov edi, OFFSET bq2c
rep movsb
mov bq2c[76], 0
mov addresses2[2 * TYPE addresses2], OFFSET bq2c

mov ecx, bq3c_size
add esi, 2
mov edi, OFFSET bq3c
rep movsb
mov bq3c[158], 0
mov addresses2[3 * TYPE addresses2], OFFSET bq3c

mov ecx, bq4c_size
add esi, 2
mov edi, OFFSET bq4c
rep movsb
mov bq4c[172], 0
mov addresses2[4 * TYPE addresses2], OFFSET bq4c

mov ecx, bq5c_size
add esi, 2
mov edi, OFFSET bq5c
rep movsb
mov bq5c[165], 0
mov addresses2[5 * TYPE addresses2], OFFSET bq5c

mov ecx, bq6c_size
add esi, 2
mov edi, OFFSET bq6c
rep movsb
mov bq6c[81], 0
mov addresses2[6 * TYPE addresses2], OFFSET bq6c

mov ecx, bq7c_size
add esi, 2
mov edi, OFFSET bq7c
rep movsb
mov bq7c[141], 0
mov addresses2[7 * TYPE addresses2], OFFSET bq7c

mov ecx, bq8c_size
add esi, 2
mov edi, OFFSET bq8c
rep movsb
mov bq8c[131], 0
mov addresses2[8 * TYPE addresses2], OFFSET bq8c

mov ecx, bq9c_size
add esi, 2
mov edi, OFFSET bq9c
rep movsb
mov bq9c[124], 0
mov addresses2[9 * TYPE addresses2], OFFSET bq9c

mov ecx, bq10c_size
add esi, 2
mov edi, OFFSET bq10c
rep movsb
mov bq10c[87], 0
mov addresses2[10 * TYPE addresses2], OFFSET bq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers2
mov ebp, questions2
mov esi,offset arr2
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,2
	jmp E2
	E1:
	DEC life
	mov al,life
	cmp al,0
	je S
	E2:
	inc esi
	loop l3
	S:
	call crlf
	mov edx,offset msg3
	call writestring
	mov al,bl
	call writedec
	mov scoreL2,bl
	mov scorelev2,0
	popad
ret
QLevel2_Print ENDP

QLevel3_Print PROC, questions:PTR DWORD, answers:PTR DWORD, scoreLev3:BYTE
pushad
mov edx, OFFSET filenames
call OpenInputFile
mov filehandles, eax

mov edx, OFFSET buffers
mov ecx, bufferSize
call ReadFromFile
mov bytesReads, eax

mov ecx, cq1c_size
mov esi, OFFSET buffers
mov edi, OFFSET cq1c
rep movsb
mov cq1c[91], 0
mov addresses[1 * TYPE addresses], OFFSET cq1c

mov ecx, cq2c_size
add esi, 2
mov edi, OFFSET cq2c
rep movsb
mov cq2c[184], 0
mov addresses[2 * TYPE addresses], OFFSET cq2c

mov ecx, cq3c_size
add esi, 2
mov edi, OFFSET cq3c
rep movsb
mov cq3c[152], 0
mov addresses[3 * TYPE addresses], OFFSET cq3c

mov ecx, cq4c_size
add esi, 2
mov edi, OFFSET cq4c
rep movsb
mov cq4c[221], 0
mov addresses[4 * TYPE addresses], OFFSET cq4c

mov ecx, cq5c_size
add esi, 2
mov edi, OFFSET cq5c
rep movsb
mov cq5c[100], 0
mov addresses[5 * TYPE addresses], OFFSET cq5c

mov ecx, cq6c_size
add esi, 2
mov edi, OFFSET cq6c
rep movsb
mov cq6c[217], 0
mov addresses[6 * TYPE addresses], OFFSET cq6c

mov ecx, cq7c_size
add esi, 2
mov edi, OFFSET cq7c
rep movsb
mov cq7c[76], 0
mov addresses[7 * TYPE addresses], OFFSET cq7c

mov ecx, cq8c_size
add esi, 2
mov edi, OFFSET cq8c
rep movsb
mov cq8c[96], 0
mov addresses[8 * TYPE addresses], OFFSET cq8c

mov ecx, cq9c_size
add esi, 2
mov edi, OFFSET cq9c
rep movsb
mov cq9c[116], 0
mov addresses[9 * TYPE addresses], OFFSET cq9c

mov ecx, cq10c_size
add esi, 2
mov edi, OFFSET cq10c
rep movsb
mov cq10c[103], 0
mov addresses[10 * TYPE addresses], OFFSET cq10c

mWrite "Total bytes in file: "
call WriteDec
call Crlf
call Crlf
mov ecx, 10
mov edi, answers
mov ebp, questions
mov esi,offset arr3
add ebp, 4
add edi, 4
L3:
	mov edx, [ebp]
	call WriteString
	call crlf
	add ebp,4
	add edi,4
	call readdec
	cmp al,[esi]
	jne E1
	add bl,3
	jmp E2
	E1:
	DEC life
	mov al,life
	cmp al,0
	je S
	E2:
	inc esi
	loop l3
	S:
	call crlf
	mov edx,offset msg4
	call writestring
	mov al,bl
	call writedec
	mov scoreL3,bl
	mov scorelev3,0
	popad
ret
QLevel3_Print ENDP


END main