@1 // push argument 1
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@1 // pop pointer 1
D=A
@R3
D=D+A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0 // pop that 0
D=A
@THAT
D=D+M
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@1 // pop that 1
D=A
@THAT
D=D+M
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@0 // push argument 0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // sub
M=M-1
A=M
D=M
A=A-1
M=M-D
@0 // pop argument 0
D=A
@ARG
D=D+M
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
(.$MAIN_LOOP_START)
@0 // push argument 0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP // if_goto COMPUTE_ELEMENT
M=M-1
A=M
D=M
@.$COMPUTE_ELEMENT
D;JNE
@.$END_PROGRAM // goto END_PROGRAM
0;JMP
(.$COMPUTE_ELEMENT)
@0 // push that 0
D=A
@THAT
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@1 // push that 1
D=A
@THAT
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP // add
M=M-1
A=M
D=M
A=A-1
M=D+M
@2 // pop that 2
D=A
@THAT
D=D+M
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@1 // push pointer 1
D=A
@R3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // add
M=M-1
A=M
D=M
A=A-1
M=D+M
@1 // pop pointer 1
D=A
@R3
D=D+A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@0 // push argument 0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // sub
M=M-1
A=M
D=M
A=A-1
M=M-D
@0 // pop argument 0
D=A
@ARG
D=D+M
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D
@.$MAIN_LOOP_START // goto MAIN_LOOP_START
0;JMP
(.$END_PROGRAM)
