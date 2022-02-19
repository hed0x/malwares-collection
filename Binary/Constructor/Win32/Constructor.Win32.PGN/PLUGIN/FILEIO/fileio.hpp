
#ifndef __FILEIO_HPP__
#define __FILEIO_HPP__

#pragma pack(push)
#pragma pack(1)

struct ff_struct                // win32 "searchrec" structure
{
  DWORD ff_attr;
  DWORD ff_time_create[2];
  DWORD ff_time_lastaccess[2];
  DWORD ff_time_lastwrite[2];
  DWORD ff_size_hi;
  DWORD ff_size;
  DWORD ff_reserved[2];
  char  ff_fullname[260];
  char  ff_shortname[260];
};

DWORD __stdcall fcreate (char* fname);    // returns 0 if error
DWORD __stdcall fopen_ro(char* fname);    //
DWORD __stdcall fopen_rw(char* fname);    //
DWORD __stdcall fclose(DWORD handle);
DWORD __stdcall fread (DWORD handle, BYTE* buf, DWORD bufsize, DWORD fpos); // returns numread
DWORD __stdcall fwrite(DWORD handle, BYTE* buf, DWORD bufsize, DWORD fpos); // returns numwritten
DWORD __stdcall fgetattr(char* fname);    // returns FFFFFFFF if error
int   __stdcall fsetattr(char* fname, DWORD attr); // returns 0 if error
DWORD __stdcall fgetsize(DWORD handle);
int   __stdcall fdelete(char* fname);                    // returns 0 if error
int   __stdcall frename(char* srcfile, char* dstfile);   // returns 0 if error

DWORD __stdcall findfirst(char* fname,  struct ff_struct* ff); // returns 0 if error
DWORD __stdcall findnext (DWORD handle, struct ff_struct* ff); // returns 0 if error
void  __stdcall findclose(DWORD handle);

void  __stdcall fgettimev(DWORD handle); // r3-only , single-threaded
void  __stdcall fsettimev(DWORD handle); // last_write_time += 2 sec

#pragma pack(pop)

#endif // __FILEIO_HPP__
