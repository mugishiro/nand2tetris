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


(Sys.init) //// function Sys.init

@4000 //// push constant 4000
D=A
@SP
A=M
M=D
@SP
M=M+1

@0 //// pop pointer 0
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

@5000 //// push constant 5000
D=A
@SP
A=M
M=D
@SP
M=M+1

@1 //// pop pointer 1
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
@Sys.main // goto Sys.main
0;JMP
($L2) // return-address

@1 //// pop temp 1
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

(Sys.init$LOOP)

@Sys.init$LOOP //// goto LOOP
0;JMP

(Sys.main) //// function Sys.main
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
@0 // push 0
D=A
@SP // push d_register
A=M
M=D
@SP
M=M+1

@4001 //// push constant 4001
D=A
@SP
A=M
M=D
@SP
M=M+1

@0 //// pop pointer 0
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

@5001 //// push constant 5001
D=A
@SP
A=M
M=D
@SP
M=M+1

@1 //// pop pointer 1
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

@200 //// push constant 200
D=A
@SP
A=M
M=D
@SP
M=M+1

@1 //// pop local 1
D=A
@LCL
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

@40 //// push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1

@2 //// pop local 2
D=A
@LCL
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

@6 //// push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1

@3 //// pop local 3
D=A
@LCL
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

@123 //// push constant 123
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
@Sys.add12 // goto Sys.add12
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

@2 //// push local 2
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@3 //// push local 3
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1

@4 //// push local 4
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

@SP //// add
M=M-1
A=M
D=M
A=A-1
M=D+M

@SP //// add
M=M-1
A=M
D=M
A=A-1
M=D+M

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

(Sys.add12) //// function Sys.add12

@4002 //// push constant 4002
D=A
@SP
A=M
M=D
@SP
M=M+1

@0 //// pop pointer 0
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

@5002 //// push constant 5002
D=A
@SP
A=M
M=D
@SP
M=M+1

@1 //// pop pointer 1
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

@12 //// push constant 12
D=A
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

