   @Echo off
   del sfx.pmp
   ..\utils\sfxer *.p*
   pklite dest.com
   ..\utils\bin2pas dest.com sfx.pmp
   bpc pmp
   del dest.com
   @Echo on
   @Echo PMP Demo program created !
