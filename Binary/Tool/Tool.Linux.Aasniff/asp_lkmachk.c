/*
# gcc -O6 -c aasp_lkmachk.c -I/usr/src/linux/include
# insmod aasp_lkmachk.o device=eth0
# rmmod aasp_lkmachk

Anti Anti Sniffer Patch (by vecna@s0ftpj.org) - MAC checker module 

*/

#define MODULE
#define __KERNEL__

#include <linux/config.h>
#include <linux/module.h>
#include <linux/version.h>

#include <linux/byteorder/generic.h>
/* on kernel 2.2.16 I've find some problem and for fix I've cut inclusion
   of generic.h 
*/
#include <linux/netdevice.h>
#include <net/protocol.h>
#include <net/pkt_sched.h>
#include <net/tcp.h>
#include <net/ip.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/skbuff.h>

#include <linux/kernel.h>
#include <linux/mm.h>
#include <linux/file.h>
#include <asm/uaccess.h>

#define r_mac sk->mac.ethernet->h_dest  /* received mac */
#define t_mac true->dev_addr	   	/* true mac */

char *device;
MODULE_PARM(device, "s"); 

struct device *true;
struct packet_type aasp_ip, aasp_arp;

int chk_mac_arp(struct sk_buff *sk, struct device *dev, struct packet_type *pt) 	{

	if( r_mac[0] ==r_mac[1] ==r_mac[2] ==r_mac[3] ==r_mac[4]
	    ==r_mac[5] ==0xff)
		/* mac broadcast */
		goto end;

	if( (r_mac[0] !=t_mac[0]) || (r_mac[1] !=t_mac[1]) ||
	    (r_mac[2] !=t_mac[2]) || (r_mac[3] !=t_mac[3]) ||
	    (r_mac[4] !=t_mac[4]) || (r_mac[5] !=t_mac[5]) )
		{
		/* ARP mac spoof detected */
		sk->nh.arph->ar_hrd = 0;
		sk->nh.arph->ar_pro = 0;
		sk->nh.arph->ar_op = 0;
		goto end;
		}
end:
	kfree_skb(sk);
	return(0);
	}

int chk_mac_ip(struct sk_buff *sk, struct device *dev, struct packet_type *pt) 
	{

	if( r_mac[0] ==r_mac[1] ==r_mac[2] ==r_mac[3] ==r_mac[4]
	    ==r_mac[5] ==0xff)
		/* mac broadcast*/
		goto end;

	if( (r_mac[0] !=t_mac[0]) || (r_mac[1] !=t_mac[1]) ||
	    (r_mac[2] !=t_mac[2]) || (r_mac[3] !=t_mac[3]) ||
	    (r_mac[4] !=t_mac[4]) || (r_mac[5] !=t_mac[5]) )
		{
		/* IP check - anti spoof detect! */
		sk->nh.iph->tot_len = 0;
		sk->nh.iph->check = 0;
		goto end;
		}
end:
	kfree_skb(sk);
	return(0);
	}

int init_module(void) 
	{

	if (device) 
		{
		true =dev_get(device);
		if (true ==NULL) 
			{
			printk("Did not find device %s!\n", device);
			return -EINVAL;
			} 
		}
	else 
		{
		printk("Usage: insmod aasp_lkmachk.o device=device name \n\n");
		return -ENODEV;
		}		

	printk("Mac checker module run on %s - by vecna@s0ftpj.org\n",device);
	printk("Full codes of Anti Anti Sniffer Patch can be"
		" downloadated at www.s0ftpj.org\n");

	aasp_ip.dev = true;
	aasp_ip.type = htons(ETH_P_IP);
	aasp_ip.func = chk_mac_ip;

	aasp_arp.dev = true;
	aasp_arp.type = htons(ETH_P_ARP);
	aasp_arp.func = chk_mac_arp;

	dev_add_pack(&aasp_ip);
	dev_add_pack(&aasp_arp);

	return(0);
	}

void cleanup_module(void)
	{
	dev_remove_pack(&aasp_ip);
	dev_remove_pack(&aasp_arp);
	printk("Anti Anti Sniffer Patch - MAC checker module unload\n");
	}
