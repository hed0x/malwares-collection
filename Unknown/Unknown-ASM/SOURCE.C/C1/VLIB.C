
 /* 	VLIB.C file 	*/

#pragma inline
#include"v.h"

 int  _Cdecl puts(const char *ptr)
 {  if(write(stdout,ptr,strlen(ptr)) == -1) return -1;
return write(stdout,"\n\r",2);		}

 void message(char *ptr)
 {
   _AH = 9; _DX = (int) ptr;
    asm int 21h;
   return;
 }

char	*_Cdecl strcat	(char *dest, char *src)
{ strcpy(dest + strlen(dest),src);
  return dest;	}

char	* _Cdecl strcpy	(char *dest, char *src)
{ 
  while(*dest++ = *src++);
  return --dest; 
}

int	 _Cdecl strcmp	(const char *s1, const char *s2)
{ int i = 0;
  while(s1[i] && s2[i]){
  if (s1[i] > s2[i]) return  1;
  if (s1[i] < s2[i]) return -1;
  i++; }
  if (s1[i]) return  1;
  if (s2[i]) return -1;
  else return 0;
}


size_t	 _Cdecl strlen	(const char *s)
{ int i = 0;
  while(s[i]) i++;
  return i;
}


