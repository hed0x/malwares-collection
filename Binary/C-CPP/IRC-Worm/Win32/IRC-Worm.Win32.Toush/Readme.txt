   Name                         : W32.Poison-RC.Worm
   Aliases                      : IRC.Poison-RC.Worm
   Author                       : Benny T.
   Type                         : mIRC Worm
   Date created                 : 19 March 2001
   Updated                      : 19 March 2001
   Size                         : 72192 bytes
   Executable filename          : q160301.exe
   Platform                     : Win32
   OS supported                 : Windows 95/98/98SE/ME/NT/2000
   Language                     : C++
   Compiled                     : Borland C++ 5.02
   Primary transport            : mIRC chat client
   Secondary transport          : none
   Detection                    : Undetected by Antivirus programs
   Variants                     : None
   Risk assessment              : Low
   Installs into system         : Yes
   API Hooks                    : Yes
   Memory resident              : No
   Polymorphic                  : No
   Stealth                      : No
   E-mail propagation           : No
   IRC propagation              : Yes
   Password grabber             : No
   FTP server                   : No
   Keystroke logger             : No
   Direct action                : No
   Encrypted                    : No
   Infects PE executables       : No
   Infects DOS executables      : No
   Payload                      : No
   Date triggered               : No
   Event triggered              : No
   Destructive                  : No
   Remote Access Trojan         : No
   Runs everytime Windows start : No
   Anti-Deletion                : Yes


   This is my first attempt in creating an mIRC worm in C++. Therefore, Poison-RC is an extremely simple mIRC propagating worm with an anti-deletion feature. The feature ensures that the worm executable remains in the infected system. When it gets deleted, it is able to restore it's main executable.
   Poison-RC has no payload. it installs into Windows system directory once executed and modifies Autoexec.bat. It masquerades as a bogus security patch program from Microsoft.

   -----------------------------------------------------------------------------------------
   WARNING !! Poison-RC is meant for educational purposes only. DO NOT RELEASE !!
