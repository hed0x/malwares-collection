#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

void vulnerable(int type,int *shellcode);

#define BUF_SIZE 1000

/*
 * BUFFER_TO_OVERFLOW_SIZE is the value that 
 * I need to know in my attack program
 */
#define BUFFER_TO_OVERFLOW_SIZE 300

int main()
{
  int sock,s;
  char receved[BUF_SIZE];
  struct sockaddr_in addr_client,addr_my;
  int len;
  int c;
  int ret,type;

  s=socket(AF_INET,SOCK_STREAM,0);
  listen(s,1); //(struct sockaddr*)
  len=sizeof(addr_my);
  if(!getsockname(s,(struct sockaddr*)&addr_my,&len))
    printf("listening on port %u\n",ntohs(addr_my.sin_port));
  len=sizeof(addr_client);
  sock=accept(s,(struct sockaddr*)&addr_client,&len);  
  printf("accepted connection from %d.%d.%d.%d:%u\n",
             (addr_client.sin_addr.s_addr) & 0xff,
             ((addr_client.sin_addr.s_addr)>>8)&0xff,
             ((addr_client.sin_addr.s_addr)>>16)&0xff,
             ((addr_client.sin_addr.s_addr)>>24)&0xff,
             ntohs(addr_client.sin_port));

  do
  {
    ret=recv(sock,receved,BUF_SIZE,0);
    printf("receved %d bytes\n",ret);
    if(ret>0)
    {
      switch(receved[0])
      {
      case 'A': //return address of buffer to overflow
        type=1;
        vulnerable(type,&c);
        send(sock,(char*)&c,sizeof(int),0);
        printf("sent address of buf\n");
        break;
      case 'X': //exploit
        type=0;
        printf("exploiting\n");
        receved[ret]=0;
        vulnerable(type,(int*)((char*)receved+1));
        printf("exploit done\n"
        	"now the other boy is running a shell\n"
        	"on your computer, be happy");
      defaulf:
      }
    }
  }while(ret>0);

  close(s);
  close(sock);
  return 0;
}


void vulnerable(int type,int *shellcode)
{
  char buf[BUFFER_TO_OVERFLOW_SIZE];
  int i;
  if(type==1) {*shellcode=(int)buf;printf("addr of buf = 0x%x\n",buf);return;}
  printf("receved %d bytes\n",strlen((char*)shellcode));

#ifdef DEBUG  //this print the content of the receved string
  for(i=0;i<200;i++)
    printf(" %d=\\x%x",i,0xff&*(((char*)shellcode)+i));
  printf("\nat end***\n");
  for(i=184;i<(strlen((char*)shellcode)&(~3));i+=4)
    printf("(%d)=0x%x  ",i,*(int*)(((char*)shellcode)+i));
#endif

  strcpy(buf,(char*)shellcode);
  printf("\nend of vulnerable()\n");
}

