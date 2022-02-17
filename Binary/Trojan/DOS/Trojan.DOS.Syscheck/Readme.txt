   FloodDrive README
   -----------------

   Program name    : FloodDrive
   Type            : Virus
   Sub Type        : Trojan
   Nature          : Destructive
   Aliases         : TROJ.FLOOD_DRIVE
   Variants        : None
   Risk Assessment : Medium
   Size            : 39920 bytes (40 KB)
   Author          : Benny T.
   Version         : 1.12
   Language        : Pascal
   Compiled on     : Borland Turbo Pascal 7.0
   Date created    : 23 April 2000
   Updated         : 29 April 2000
   Platform        : Windows 95/98/NT
   Propagate/Transport : none
   Detection       : Undetected by antivirus softwares

   Changes in version 1.12:
   - Changed graphics full screen routine to assembly code based routine for smaller
     filesize and faster execution.

   Changes in version 1.11:
   - Changed fake message display to a more realistic, Windows oriented message.
   - Added full screen routine for fake message when running not in C:\ drive

   Changes in version 1.10:
   - Added routine to set all garbage (flood) files to hidden
   - Fixed Runtime Error bug when running from autoexec.bat
   - Put entire flood routine into one module (procedure) for
     more efficient flooding and bigger filesize of garbage files.
   - Added alternative fake display message when running from
     autoexec.bat
   - Added routine to append to garbage files when already exist. This
     would increase filesize instead of overwriting existing ones.

   FloodDrive is a trojan that carries malicious payload. It is meant to destroy.
   As the name implies, FloodDrive will flood the entire c:\ drive until there is
   no space left on the hard disk. There is a possibility that the computer will
   crash when this occurs.
   FloodDrive can run on any computer with Windows 95/98 or Windows NT installed
   but the trojan itself will not spread to other computers.

   When FloodDrive is executed, it first displays a full blank screen, delays for
   700 Miliseconds and then displays a fake message informing the user that there
   is an error in the hard drive and attempting save recovery .
   Alternatively, when FloodDrive is run in C:\ drive, it will display a fake
   message that the system configuration is being updated.
   FloodDrive then checks the operating system of the computer. If it is
   a Windows 95/98 system, FloodDrive then installs itself to c:\windows\system
   as syschk.exe and modifies autoexec.bat to load the trojan everytime the
   computer reboots. If it is a Windows NT system, FloodDrive installs itself
   into c:\winnt\system32 as ntsys.exe and modifies autoexec.bat

   FloodDrive has a malicious payload that could be very very dangerous.
   While displaying the fake message, the trojan drops numerous files with no
   extension and with the filename 1,2,3,4......and so on in c:\ drive.
   Each file is 73326 bytes and contains text of number 9999999999999.
   All these garbage files are hidden.
   This routine will carry on non stop until the program exits or the entire
   c:\ drive becomes full.

   If the user exits the program, the settings in autoexec.bat will ensure that
   the trojan will perform its malicious routines again when the computer reboots.
   When FloodDrive is run more that once, it will append to the garbage files
   if the filename exists instead of overwriting them. Hence, the garbage filesize
   would increase.

   I'm planning to create a variant for FloodDrive which is even more destructive.


   **********FloodDrive is just for educational purpose, DO NOT RELEASE !!***********
