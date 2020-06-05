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
D=M
@LCL
M=D
@Sys.init // goto Sys.init
0;JMP
($L1) // return-address


(main) //// function main
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

(main$new)

(main) //// function main
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

