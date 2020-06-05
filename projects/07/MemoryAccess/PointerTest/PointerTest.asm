@3030 // push constant 3030
D=A
@SP
A=M
M=D
@SP
M=M+1
@0 // pop pointer 0
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
@3040 // push constant 3040
D=A
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
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1
@2 // pop this 2
D=A
@THIS
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
@46 // push constant 46
D=A
@SP
A=M
M=D
@SP
M=M+1
@6 // pop that 6
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
@0 // push pointer 0
D=A
@R3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@SP // add
M=M-1
A=M
D=M
A=A-1
M=D+M
@2 // push this 2
D=A
@THIS
A=D+M
D=M
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
@6 // push that 6
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
