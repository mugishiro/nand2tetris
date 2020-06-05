@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // eq
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L1
D;JEQ
D=0
@$L2
0;JMP
($L1)
D=-1
($L2)
@SP
A=M-1
M=D
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // eq
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L3
D;JEQ
D=0
@$L4
0;JMP
($L3)
D=-1
($L4)
@SP
A=M-1
M=D
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // eq
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L5
D;JEQ
D=0
@$L6
0;JMP
($L5)
D=-1
($L6)
@SP
A=M-1
M=D
@892 // push constant 892
D=A
@SP
A=M
M=D
@SP
M=M+1
@891 // push constant 891
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // lt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L7
D;JLT
D=0
@$L8
0;JMP
($L7)
D=-1
($L8)
@SP
A=M-1
M=D
@891 // push constant 891
D=A
@SP
A=M
M=D
@SP
M=M+1
@892 // push constant 892
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // lt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L9
D;JLT
D=0
@$L10
0;JMP
($L9)
D=-1
($L10)
@SP
A=M-1
M=D
@891 // push constant 891
D=A
@SP
A=M
M=D
@SP
M=M+1
@891 // push constant 891
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // lt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L11
D;JLT
D=0
@$L12
0;JMP
($L11)
D=-1
($L12)
@SP
A=M-1
M=D
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1
@32766 // push constant 32766
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // gt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L13
D;JGT
D=0
@$L14
0;JMP
($L13)
D=-1
($L14)
@SP
A=M-1
M=D
@32766 // push constant 32766
D=A
@SP
A=M
M=D
@SP
M=M+1
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // gt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L15
D;JGT
D=0
@$L16
0;JMP
($L15)
D=-1
($L16)
@SP
A=M-1
M=D
@32766 // push constant 32766
D=A
@SP
A=M
M=D
@SP
M=M+1
@32766 // push constant 32766
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // gt
M=M-1
A=M
D=M
A=A-1
D=M-D
@$L17
D;JGT
D=0
@$L18
0;JMP
($L17)
D=-1
($L18)
@SP
A=M-1
M=D
@57 // push constant 57
D=A
@SP
A=M
M=D
@SP
M=M+1
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1
@53 // push constant 53
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
@112 // push constant 112
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
@SP // neg
A=M-1
M=-M
@SP // and
M=M-1
A=M
D=M
A=A-1
M=D&M
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP // or
M=M-1
A=M
D=M
A=A-1
M=D|M
@SP // not
A=M-1
M=!M
