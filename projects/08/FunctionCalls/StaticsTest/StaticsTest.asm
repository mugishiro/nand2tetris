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


(Class1.set) //// function Class1.set

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

@SP //// pop static 0
M=M-1
A=M
D=M
@Class1.0
M=D

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

@SP //// pop static 1
M=M-1
A=M
D=M
@Class1.1
M=D

@0 //// push constant 0
D=A
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

(Class1.get) //// function Class1.get

@Class1.0 //// push static 0
D=M
@SP
A=M
M=D
@SP
M=M+1

@Class1.1 //// push static 1
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

(Sys.init) //// function Sys.init

@6 //// push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1

@8 //// push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1

@$L2 // push $L2
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=M
@LCL
M=D
@Class1.set // goto Class1.set
0;JMP
($L2) // return-address

@0 //// pop temp 0
D=A
@R5
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

@23 //// push constant 23
D=A
@SP
A=M
M=D
@SP
M=M+1

@15 //// push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1

@$L3 // push $L3
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP // LCL=SP
D=M
@LCL
M=D
@Class2.set // goto Class2.set
0;JMP
($L3) // return-address

@0 //// pop temp 0
D=A
@R5
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
@Class1.get // goto Class1.get
0;JMP
($L4) // return-address

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
@Class2.get // goto Class2.get
0;JMP
($L5) // return-address

(Sys.init$WHILE)

@Sys.init$WHILE //// goto WHILE
0;JMP

(Class2.set) //// function Class2.set

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

@SP //// pop static 0
M=M-1
A=M
D=M
@Class2.0
M=D

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

@SP //// pop static 1
M=M-1
A=M
D=M
@Class2.1
M=D

@0 //// push constant 0
D=A
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

(Class2.get) //// function Class2.get

@Class2.0 //// push static 0
D=M
@SP
A=M
M=D
@SP
M=M+1

@Class2.1 //// push static 1
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

