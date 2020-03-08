   Attribute VB_Name = "UNDER"

   Public Sub MAIN()

   End Sub

   Attribute VB_Name = "toolsmacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??,??,???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.toolsmacro.MAIN"
   Dim Pc
   Dim pe As Object
   Dim pp
   On Error Resume Next
   start:

   ReDim Box1__$(0)
   Box1__$(0) = ""

   ReDim Box2__$(2)
   Box2__$(0) = "under"
   Box2__$(1) = "under"
   Box2__$(2) = "under"

   ReDim Box3__$(0)
   Box3__$(0) = ""

   WordBasic.BeginDialog 359, 271, "under ??"
       WordBasic.PushButton 234, 6, 120, 21, "under", "Push1"
       WordBasic.PushButton 234, 29, 120, 21, "under", "Push2"
       WordBasic.PushButton 234, 55, 120, 21, "under", "Push3"
       WordBasic.PushButton 234, 79, 120, 21, "under", "Push4"
       WordBasic.PushButton 234, 103, 120, 21, "under", "Push5"
       WordBasic.PushButton 234, 130, 120, 21, "under", "Push6"
       WordBasic.PushButton 234, 154, 120, 21, "stop", "Push7"
       WordBasic.Text 10, 9, 96, 18, "under:", "Text1"
       WordBasic.Text 10, 175, 112, 13, "under:", "Text2"
       WordBasic.Text 10, 207, 64, 15, "under:", "Text3"
       WordBasic.TextBox 11, 23, 213, 18, "TextBox5"
       WordBasic.ListBox 18, 44, 211, 129, Box1__$(), "ListBox1"
       WordBasic.DropListBox 11, 189, 342, 48, Box2__$(), "DropListBox1"
       WordBasic.ListBox 11, 222, 341, 37, Box3__$(), "ListBox2"
   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
   Pc = WordBasic.Dialog.UserDialog(dlg)
   If Pc = 2 Then GoTo bye:
   If Pc = 7 Then
    WordBasic.BeginDialog 204, 100, "????!"
       WordBasic.Text 10, 6, 189, 13, "???????????!", "Text1"
       WordBasic.Text 10, 25, 188, 13, "??????!", "Text2"
       WordBasic.Text 10, 44, 187, 13, "THAT IS THE WAY ??!", "Text3"
       WordBasic.Text 10, 63, 187, 13, "UNDERSTAND?!!", "Text4"
       WordBasic.OKButton 110, 77, 88, 21
    WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog
    Set pe = WordBasic.CurValues.UserDialog
    pp = WordBasic.Dialog.UserDialog(pe)
    GoTo start:
   End If
   WordBasic.Beep
   WordBasic.MsgBox "??ALEX!?????!!", 64
   GoTo start:
   bye:


   End Sub
