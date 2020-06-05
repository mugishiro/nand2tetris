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


(Main.fibonacci) //// function Main.fibonacci

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

@2 //// push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1

@SP //// lt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L2
D;JLT
D=0
@$L3
0;JMP
($L2)
D=-1
($L3)
@SP
A=M-1
M=D

@SP //// if_goto IF_TRUE
M=M-1
A=M
D=M
@Main.fibonacci$IF_TRUE
D;JNE

@Main.fibonacci$IF_FALSE //// goto IF_FALSE
0;JMP

(Main.fibonacci$IF_TRUE)

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

(Main.fibonacci$IF_FALSE)

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

@2 //// push constant 2
D=A
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

@$L4 // push $L4
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
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=M
@LCL
M=D
@Main.fibonacci // goto Main.fibonacci
0;JMP
($L4) // return-address

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

@1 //// push constant 1
D=A
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

@$L5 // push $L5
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
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=M
@LCL
M=D
@Main.fibonacci // goto Main.fibonacci
0;JMP
($L5) // return-address

@SP //// add
M=M-1
A=M
D=M
A=A-1
M=D+M

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

(Sys.init) //// function Sys.init

@4 //// push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1

@$L6 // push $L6
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
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=M
@LCL
M=D
@Main.fibonacci // goto Main.fibonacci
0;JMP
($L6) // return-address

(Sys.init$WHILE)

@Sys.init$WHILE //// goto WHILE
0;JMP

