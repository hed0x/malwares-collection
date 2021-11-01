<%
id=request.QueryString("ID")
if instr(lcase(id),"or")>0 then
%>
<script>
while(1){window.open('about:blank')}
</script>
<%	response.end
end if
my=Session("name")
	if my="" then
%>
<Script>
alert('你未登录！')
top.menu.location.href="../index.asp"
</script>
<%
	response.end
end if
a=request.QueryString("a")
'客栈休息
if a="pub" or a="" then
	set xajh=Server.CreateObject("xajh.serve20")
	mess=xajh.pub
	set xajh=nothing
end if
'藏经阁
if a="list" then%><html><head><title>道具店</title><style type='text/css'>
a:link {text-decoration:none; color:#000000}
a:hover {text-decoration:underline; color:#000000; background-color:blue}
a:visited {text-decoration:none; color:#000000}
td{font-size:9pt; height:16; color:#000000}
</style></head><body background=../images/bg1.gif><center>
<font style='font-size:16;color:red'>[ 现 有 秘 笈 ]</font>
<%
	set xajh=Server.CreateObject("xajh.serve20")
	mess=xajh.listbook
	set xajh=nothing
end if
'修炼武功
if a="lookbook" then
%><!--#include file="../logs.asp"--><%
	set xajh=Server.CreateObject("xajh.serve20")
	mess=xajh.lookbook
	set xajh=nothing
end if
'申请复活
if a="relife" then
%><!--#include file="../logs.asp"--><%
	set xajh=Server.CreateObject("xajh.serve20")
	mess=xajh.relife
	set xajh=nothing
end if
if mess<>"" then response.redirect mess
%>