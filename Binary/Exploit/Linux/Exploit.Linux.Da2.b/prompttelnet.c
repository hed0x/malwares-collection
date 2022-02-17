/*(c)Gildo
this is a little telnet client that listen as a server for 
the beginning of the connection, it will send commands
to the remote computer and will display the answers from it.
socket sock_in will send input to remote computer, while
socket sock_out will receve output and error.
*/


#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <errno.h>


#define PORT 18002
#define BUF_SIZE 1024

int main()
{
  int sock_out,sock_in,s;
  char receved[BUF_SIZE];
  char sent[BUF_SIZE];

  struct sockaddr_in addr_client,addr_my;
  int len;
  int ret;

  s=socket(AF_INET,SOCK_STREAM,0);
  addr_my.sin_family=AF_INET;
  addr_my.sin_port=htons(PORT);
  addr_my.sin_addr.s_addr=INADDR_ANY;
  
  bind(s,(struct sockaddr*)&addr_my,sizeof(addr_my));  //bind
  listen(s,2); 
  
  len=sizeof(addr_my);
  if(!getsockname(s,(struct sockaddr*)&addr_my,&len))
    printf("listening on port %u=0x%x\n",ntohs(addr_my.sin_port),
           ntohs(addr_my.sin_port));

  len=sizeof(addr_client);
  sock_out=accept(s,(struct sockaddr*)&addr_client,&len); //connect stdout sock
  printf("accepted connection from %u.%u.%u.%u:%u  [stdout/stderr]\n",
             (ntohl(addr_client.sin_addr.s_addr)>>24) & 0xff,
             (ntohl(addr_client.sin_addr.s_addr)>>16)&0xff,
             (ntohl(addr_client.sin_addr.s_addr)>>8)&0xff,
             (ntohl(addr_client.sin_addr.s_addr))&0xff,
             ntohs(addr_client.sin_port));

  len=sizeof(addr_client);
  sock_in=accept(s,(struct sockaddr*)&addr_client,&len); //connect stdin sock
  if(sock_in==-1 || sock_out==-1)goto end;
  printf("accepted connection from %u.%u.%u.%u:%u  [stdin]\n",
             (ntohl(addr_client.sin_addr.s_addr)>>24) & 0xff,
             (ntohl(addr_client.sin_addr.s_addr)>>16)&0xff,
             (ntohl(addr_client.sin_addr.s_addr)>>8)&0xff,
             (ntohl(addr_client.sin_addr.s_addr))&0xff,
             ntohs(addr_client.sin_port));

  printf("now you can type commands on the other host\n"
  	 "type \"exit\" when you want to quit\n");

  receved[BUF_SIZE-1]=0;
  sent[0]=0;
  while(1)  //use "exit\n" to exit
  {
    ret=send(sock_in,sent,strlen(sent),MSG_DONTWAIT);
    if(ret==-1)perror("");

    sleep(1);
    
    ret=recv(sock_out,receved,BUF_SIZE-1,MSG_DONTWAIT);
    if(ret==0)goto end;
    if(ret!=-1)
    {
      do
      {
        receved[ret]='\0';
        printf("%s",receved);
      }while((ret=recv(sock_out,receved,BUF_SIZE-1,MSG_DONTWAIT))>0);
      printf("\n");
    }

    ret=read(0,sent,BUF_SIZE-2);
    if(ret<0)goto end;
    sent[ret+1]='\n';
    sent[ret]='\0';
  }

end:
  close(s);
  close(sock_out);
  close(sock_in);
  return 0;
}


