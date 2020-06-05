@256 //// init
D=A
@SP
M=D
// call Sys.init
@$L1 // push $L1
D=A
@SP // push d_register
A=M
M=D
@SP
M=M+1

@LCL // push LCL
D=M
@SP // push d_register
A=M
M=D
@SP
M=M+1

@ARG // push ARG
D=M
@SP // push d_register
A=M
M=D
@SP
M=M+1

@THIS // push THIS
D=M
@SP // push d_register
A=M
M=D
@SP
M=M+1

@THAT // push THAT
D=M
@SP // push d_register
A=M
M=D
@SP
M=M+1

@SP // ARG=SP-n-5
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=A
@LCL
M=D
@Sys.init // goto Sys.init
0;JMP
($L1) // return-address


(SimpleFunction.test) //// function SimpleFunction.test
@0 // push 0
D=A
@SP // push d_register
A=M
M=D
@SP
M=M+1
@0 // push 0
D=A
@SP // push d_register
A=M
M=D
@SP
M=M+1

@0 //// push local 0
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@1 //// push local 1
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP //// add
M=M-1
A=M
D=M
A=A-1
M=D+M

@SP //// not
A=M-1
M=!M

@0 //// push argument 0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP //// add
M=M-1
A=M
D=M
A=A-1
M=D+M

@1 //// push argument 1
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP //// sub
M=M-1
A=M
D=M
A=A-1
M=M-D

@LCL //// return
D=M // FRAME=LCL
@R13
M=D
@5 // RET=*(FRAME-5)
A=D-A
D=M
@R14
M=D
@SP // *ARG=pop()
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG // SP=ARG+1
D=M+1
@SP
M=D
@1 // THAT=*(FRAME-1)
D=A
@R13
A=M-D
D=M
@THAT
M=D

@2 // THIS=*(FRAME-2)
D=A
@R13
A=M-D
D=M
@THIS
M=D

@3 // ARG=*(FRAME-3)
D=A
@R13
A=M-D
D=M
@ARG
M=D

@4 // LCL=*(FRAME-4)
D=A
@R13
A=M-D
D=M
@LCL
M=D

@R14 // goto RET
A=M
0;JMP
