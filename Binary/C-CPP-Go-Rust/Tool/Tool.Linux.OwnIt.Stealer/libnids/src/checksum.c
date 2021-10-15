
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>

#if ( __i386__ || __i386 )
// all asm procedures are copied from Linux 2.0.36 and 2.2.10 kernels

/*
  computes the checksum of a memory block at buff, length len, and
  adds in "sum" (32-bit)
 
  returns a 32-bit number suitable for feeding into itself or
  csum_tcpudp_magic
 
  this function must be called with even lengths, except for the last
  fragment, which may be odd
 
  it's best to have buff aligned on a 32-bit boundary
*/
u_int
csum_partial(const u_char * buff, int len, u_int sum)
{
  __asm__ (
/*		"pushl %esi
	pushl %ebx
	movl 20(%esp),%eax	# Function arg: u_int sum
	movl 16(%esp),%ecx	# Function arg: int len
        movl 12(%esp),%esi	# Function arg: u_char *buff*/

       "testl $2, %%esi		
	jz 2f			
	subl $2, %%ecx		
	jae 1f			
	addl $2, %%ecx		
	jmp 4f
1:	movw (%%esi), %%bx
	addl $2, %%esi
	addw %%bx, %%ax
	adcl $0, %%eax
2:
	movl %%ecx, %%edx
	shrl $5, %%ecx
	jz 2f
	testl %%esi, %%esi
1:	movl (%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 4(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 8(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 12(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 16(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 20(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 24(%%esi), %%ebx
	adcl %%ebx, %%eax
	movl 28(%%esi), %%ebx
	adcl %%ebx, %%eax
	lea 32(%%esi), %%esi
	dec %%ecx
	jne 1b
	adcl $0, %%eax
2:	movl %%edx, %%ecx
	andl $0x1c, %%edx
	je 4f
	shrl $2, %%edx		
3:	adcl (%%esi), %%eax
	lea 4(%%esi), %%esi
	dec %%edx
	jne 3b
	adcl $0, %%eax
4:	andl $3, %%ecx
	jz 7f
	cmpl $2, %%ecx
	jb 5f
	movw (%%esi),%%cx
	leal 2(%%esi),%%esi
	je 6f
	shll $16,%%ecx
5:	movb (%%esi),%%cl
6:	addl %%ecx,%%eax
	adcl $0, %%eax
7: "
       : "=a"(sum)
       : "0"(sum), "c"(len), "S"(buff)
       : "bx", "dx");

  return (sum);
}

/*
  This is a version of ip_compute_csum() optimized for IP headers,
  which always checksum on 4 octet boundaries.
 
  By Jorge Cwik <jorge@laser.satlink.net>, adapted for linux by Arnt
  Gulbrandsen.
*/
inline u_short ip_fast_csum(u_char * iph, u_int ihl)
{
  u_int sum;
  
  __asm__ __volatile__("
	    movl (%1), %0
	    subl $4, %2
	    jbe 2f
	    addl 4(%1), %0
	    adcl 8(%1), %0
	    adcl 12(%1), %0
1:	    adcl 16(%1), %0
	    lea 4(%1), %1
	    decl %2
	    jne	1b
	    adcl $0, %0
	    movl %0, %2
	    shrl $16, %0
	    addw %w2, %w0
	    adcl $0, %0
	    notl %0
2:
	    "
	/*
	  Since the input registers which are loaded with iph and ipl
	  are modified, we must also specify them as outputs, or gcc
	  will assume they contain their original values.
	*/
	: "=r" (sum), "=r" (iph), "=r" (ihl)
	: "1" (iph), "2" (ihl));
  
  return (sum);
}

/* Fold a partial checksum. */
static inline u_int
csum_fold(u_int sum)
{
  __asm__("
	addl %1, %0
	adcl $0xffff, %0
	"
	: "=r" (sum)
	: "r" (sum << 16), "0" (sum & 0xffff0000)
	  );
  return ((~sum) >> 16);
}
 
/*
  computes the checksum of the TCP/UDP pseudo-header
  returns a 16-bit checksum, already complemented
*/
static inline u_short
csum_tcpudp_magic(u_int saddr, u_int daddr, u_short len,
		  u_short proto, u_int sum)
{
  __asm__("
	addl %1, %0
	adcl %2, %0
	adcl %3, %0
	adcl $0, %0
	"
	: "=r" (sum)
	: "g" (daddr), "g"(saddr), "g"((ntohs(len) << 16) + proto * 256), "0"(sum));
  return (csum_fold(sum));
}

/*
  this routine is used for miscellaneous IP-like checksums, mainly in
  icmp.c
*/
inline u_short
ip_compute_csum(u_char * buff, int len)
{
  return (csum_fold(csum_partial(buff, len, 0)));
}

inline u_short
my_tcp_check(struct tcphdr *th, int len, u_int saddr, u_int daddr)
{
  return csum_tcpudp_magic(saddr, daddr, len, IPPROTO_TCP,
			   csum_partial((char *)th, len, 0));
}
inline u_short
my_udp_check(void *u, int len, u_int saddr, u_int daddr)
{
  return csum_tcpudp_magic(saddr, daddr, len, IPPROTO_UDP,
			   csum_partial((char *)u, len, 0));
}

#else /* !i386 */

struct psuedo_hdr
{
  u_int saddr;      
  u_int daddr;      
  u_char zero;        
  u_char protocol;    
  u_short len;        
};

u_short
ip_check_ext(register u_short *addr, register int len, int addon)
{
  register int nleft = len;
  register u_short *w = addr;
  register int sum = addon;
  u_short answer = 0;

  /*
   *  Our algorithm is simple, using a 32 bit accumulator (sum),
   *  we add sequential 16 bit words to it, and at the end, fold
   *  back all the carry bits from the top 16 bits into the lower
   *  16 bits.
   */
  while (nleft > 1)  {
    sum += *w++;
    nleft -= 2;
  }
  /* mop up an odd byte, if necessary */
  if (nleft == 1) {
    *(u_char *)(&answer) = *(u_char *)w;
    sum += answer;
  }  
  /* add back carry outs from top 16 bits to low 16 bits */
  sum = (sum >> 16) + (sum & 0xffff);     /* add hi 16 to low 16 */
  sum += (sum >> 16);                     /* add carry */
  answer = ~sum;                          /* truncate to 16 bits */
  return (answer);
}

u_short
ip_fast_csum(u_short *addr, int len)
{
  return ip_check_ext(addr, len << 2, 0);
}

u_short
ip_compute_csum(u_short *addr, int len)
{
  return ip_check_ext(addr, len, 0);
}

u_short
my_tcp_check(struct tcphdr *th, int len, u_int saddr, u_int daddr)
{
  int i, sum = 0;
  struct psuedo_hdr hdr;
  
  hdr.saddr = saddr;
  hdr.daddr = daddr;
  hdr.zero = 0;
  hdr.protocol = IPPROTO_TCP;
  hdr.len = htons(len);
  for (i = 0; i < sizeof(hdr); i += 2)
    sum += *(u_short *)((char *)(&hdr) + i);
  
  return (ip_check_ext((u_short *)th, len, sum));
}                     
u_short
my_udp_check(void *u, int len, u_int saddr, u_int daddr)
{
  int i, sum = 0;
  struct psuedo_hdr hdr;
  
  hdr.saddr = saddr;
  hdr.daddr = daddr;
  hdr.zero = 0;
  hdr.protocol = IPPROTO_UDP;
  hdr.len = htons(len);
  for (i = 0; i < sizeof(hdr); i += 2)
    sum += *(u_short *)((char *)(&hdr) + i);
  
  return (ip_check_ext((u_short *)u, len, sum));
}                     

#endif /* !i386 */
