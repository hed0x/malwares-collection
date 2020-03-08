   @echo off
   md "C:\Program Files\Folding@Home\"
   copy "FAH3Console.exe" "C:\Program Files\Folding@Home\"
   copy "client.cfg" "C:\Program Files\Folding@Home\"
   copy "folding.reg" "C:\Program Files\Folding@Home\"
   regedit /s "C:\Program Files\Folding@Home\folding.reg"
   copy "INSTSRV.EXE" "C:\Program Files\Folding@Home\"
   copy "SRVANY.EXE" "C:\Program Files\Folding@Home\"
   copy "NETSVC.EXE" "C:\Program Files\Folding@Home\"
   "C:\Program Files\Folding@Home\INSTSRV.EXE" Folding@Home "C:\Program Files\Folding@Home\SRVANY.EXE"
   net start Folding@Home
