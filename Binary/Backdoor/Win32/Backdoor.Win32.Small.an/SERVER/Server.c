//(c) Vecna 2003

#include <stdio.h>
#include <miracl.h>
#include <windows.h>
#include <winsock.h>



#define	RNDBASE	1024*1024*1024



const char convert_table[0x40]={
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
	'O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b',
	'c','d','e','f','g','h','i','j','k','l','m','n','o','p',
	'q','r','s','t','u','v','w','x','y','z','0','1','2','3',
	'4','5','6','7','8','9','@','_'
};



#define PACKET_SIZE 60



#define convert(value) for(e=0;e<0x40;e++){					\
							if(convert_table[e]==value){	\
								value=e;					\
								break;						\
							}								\
						}



int _ip;
short _port;
char _nickname[MAX_PATH];
char _dirbase[MAX_PATH];



typedef struct{
	char *name;
	int size;
	int already;
	void *next;
} FILE_STRUCT;



typedef struct{
	char phase;
	int name_hash;
	big reply_challenge;
	void *filelist;
	void *next;
} USER_STRUCT;



SOCKET main_socket;
USER_STRUCT *client_list;



USER_STRUCT *find_client(int hashname){
	USER_STRUCT *list_ptr;

	list_ptr=client_list;
	if(list_ptr){
		do{
			if(list_ptr->name_hash==hashname)break;
		}while(list_ptr=list_ptr->next);
	}

	return list_ptr;
}



int hash_nick(char *data, int size){
	int i, c;

	for (i=0,c=0; i<size; i++)
		c^=(c<<((i<4)?8:1))^data[i];

	return c;
}



request_file(char *filename,char *user,int already){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];

	strcpy(buffer,"PRIVMSG ");
	strcat(buffer,user);
	strcat(buffer," :Manda ");
	strcat(buffer,filename);
	strcat(buffer," ");
	strcat(buffer,itoa(already+1,buffer2,10));
	strcat(buffer,"\n");
	send(main_socket,buffer,strlen(buffer),0);
}



process_line(char *input){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	char who[MAX_PATH];
	char reply[MAX_PATH];
	char size[MAX_PATH];
	char *reply_ptr;
	USER_STRUCT *chunk;
	USER_STRUCT *oldchunk;
	FILE_STRUCT *file_desc;
	big challenge1;
	big challenge2;
	big rndmax;
	int fsize;
	int i;
	int j;

	int f;
	FILE *outfile;
	char a,b,c,d,e,bb,cc;

	printf(input);
	
	if(strncmp(input,"PING",sizeof("PING")-1)==0){
		strcpy(buffer,"PONG ");
		strcat(buffer,&input[6]);
		send(main_socket,buffer,strlen(buffer),0);
	}else{
		memset(reply,0,MAX_PATH);
		sscanf(input,"%s %s %s %s %s",&buffer,&buffer2,&who,&reply,&size);
		if(strcmp(buffer2,"PRIVMSG")==0){

			for(i=1,j=strlen(buffer);i<=j;i++){
				if(buffer[i]=='!'){
					who[i-1]=0;
					break;
				}else who[i-1]=buffer[i];
			}

			if(!(chunk=find_client(hash_nick((char *)&who,strlen(who))))){
				chunk=client_list;
				if(!chunk){
					client_list=malloc(sizeof(USER_STRUCT));
					chunk=client_list;
				}else{
					do{
						oldchunk=chunk;
						chunk=oldchunk->next;
					}while(chunk);
					chunk=oldchunk->next=malloc(sizeof(USER_STRUCT));
				}
				
				memset(chunk,0,sizeof(USER_STRUCT));
				chunk->name_hash=hash_nick((char *)&who,strlen((const char *)who));

				rndmax=mirvar(RNDBASE);
				challenge1=mirvar(0);
				challenge2=mirvar(0);
				chunk->reply_challenge=mirvar(0);

				bigrand(rndmax,challenge1);
				bigrand(rndmax,challenge2);
				multiply(challenge1,challenge1,challenge1);
				multiply(challenge2,challenge2,challenge2);
				multiply(challenge1,challenge2,chunk->reply_challenge);

				cotstr(challenge1,buffer);
				cotstr(challenge2,buffer2);

				mirkill(rndmax);
				mirkill(challenge1);
				mirkill(challenge2);

				strcpy(reply,"PRIVMSG ");
				strcat(reply,who);
				strcat(reply," :Quanto é ");
				strcat(reply,buffer);
				strcat(reply," * ");
				strcat(reply,buffer2);
				strcat(reply," ?\n");
				send(main_socket,reply,strlen(reply),0);
			}else{

				switch(chunk->phase){
					case 0:
						challenge1=mirvar(0);
						cinstr(challenge1,&reply[1]);
						if(compare(challenge1,chunk->reply_challenge)==0){
							strcpy(buffer,"PRIVMSG ");
							strcat(buffer,who);
							strcat(buffer," :Você é legal...\n");
							send(main_socket,buffer,strlen(buffer),0);
							chunk->phase++;
						}
						mirkill(challenge1);
						break;
					case 1:
						fsize=atoi(size);
						if(fsize){
							if(!(file_desc=((FILE_STRUCT *)chunk->filelist))){
									file_desc=chunk->filelist=malloc(sizeof(FILE_STRUCT));
							}else{
								while(file_desc->next)
									file_desc=file_desc->next;
								file_desc->next=malloc(sizeof(FILE_STRUCT));
								file_desc=file_desc->next;
							}
							memset(file_desc,0,sizeof(FILE_STRUCT));
							file_desc->size=fsize;
							if(!(file_desc->name))file_desc->name=malloc(strlen(reply));
							strcpy(file_desc->name,reply+1);
						}else{
							if((file_desc=((FILE_STRUCT *)chunk->filelist))){
								request_file(file_desc->name,who,file_desc->already);
								chunk->phase++;
							}
						}
						break;
					default:
						file_desc=(FILE_STRUCT *)chunk->filelist;

						f=0;
						memset(buffer,0,MAX_PATH);

						reply_ptr=reply+1;

						while((char)*reply_ptr){
							a=(char)*reply_ptr++;
							bb=b=(char)*reply_ptr++;
							cc=c=(char)*reply_ptr++;
							d=(char)*reply_ptr++;

							convert(a);
							convert(b);
							convert(c);
							convert(d);

							a|=((d&3)<<6);
							b|=(((d>>2)&3)<<6);
							c|=(((d>>4)&3)<<6);

							buffer[f++]=a;
							if(bb!='!')buffer[f++]=b;
							if(cc!='!')buffer[f++]=c;
						}
						
						strcpy(size,file_desc->name);
						j=strlen(size);

						for(i=1;i!=j;i++){
							if((char)size[i]=='\\'){
								memset(buffer2,0,MAX_PATH);
								strncpy(buffer2,file_desc->name,i);

								strcpy(reply,_dirbase);
								strcat(reply,buffer2);

								CreateDirectory(reply,NULL);
							}
						}
						
						strcpy(buffer2,_dirbase);
						strcat(buffer2,file_desc->name);
						if(outfile=fopen(buffer2,"ab")){
							fseek(outfile,0,SEEK_END);
							file_desc->already+=fwrite(buffer,1,f,outfile);
							fclose(outfile);
						}
						
						if(file_desc->already==file_desc->size){
							chunk->filelist=file_desc->next;
							free(file_desc);
	
							if((FILE_STRUCT *)chunk->filelist)
								request_file(((FILE_STRUCT *)(chunk->filelist))->name,who,((FILE_STRUCT *)(chunk->filelist))->already);
							else{
								strcpy(buffer,"PRIVMSG ");
								strcat(buffer,who);
								strcat(buffer," :Feito!\n");
								send(main_socket,buffer,strlen(buffer),0);
								chunk->phase--;
							}
						}
						break;
				}
			}
		}/*PRIVMSG*/
	}
}
			 

			 
void read_ini(){
	HOSTENT* i;
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	int j;
	int k;
    miracl *mip;

    mip=mirsys(512,2);
    mip->IOBASE=10;

	irand(GetTickCount());

	GetModuleFileNameA(NULL,buffer,MAX_PATH);

	k=(int)buffer;
	for(j=strlen(buffer); j; j--)
		if(buffer[j]=='.'){
			k+=j+1;
			break;
		}
	strcpy((char*)k,"INI");

	GetPrivateProfileStringA("Server","IRCPort","6667",buffer2,MAX_PATH,buffer);
	_port=atoi(buffer2);

	GetPrivateProfileStringA("Server","IRCServer","eu.undernet.org",buffer2,MAX_PATH,buffer);
	if((_ip=inet_addr(buffer2))==-1)
		if(i=gethostbyname(buffer2))
			_ip=*(int*)i->h_addr_list[0];

	GetPrivateProfileStringA("Server","IRCNick","_server_",_nickname,MAX_PATH,buffer);

	GetPrivateProfileStringA("Server","BaseDir","C:",_dirbase,MAX_PATH,buffer);
}



int main(int argc, char* argv[]){
	WSADATA provider_info;
	SOCKADDR_IN my_addr;
	FD_SET readfds;
	char buffer[MAX_PATH];
	char *j;
	char *k;
	int i;
	int a;

	WSAStartup(1,&provider_info);

	read_ini();

	if((main_socket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP))!=-1){
		readfds.fd_count=1;
		readfds.fd_array[0]=main_socket;

		my_addr.sin_family=AF_INET;
		my_addr.sin_port=htons(_port);
		my_addr.sin_addr.s_addr=_ip;

		if(!(connect(main_socket,(const struct sockaddr*)&my_addr,sizeof(my_addr)))){
			strcpy(buffer,"NICK ");
			strcat(buffer,_nickname);
			strcat(buffer,"\nUSER ");
			strcat(buffer,_nickname);
			strcat(buffer," remote file server\n");
			send(main_socket,buffer,strlen(buffer),0);

			while(select(1,&readfds,0,0,0)!=-1){

				j=malloc(MAX_PATH);
				k=j;
				a=0;

				while((i=recv(main_socket,k,MAX_PATH,0))==MAX_PATH){
					a+=MAX_PATH;
					j=realloc(j,a+MAX_PATH);
					k=j+a;
				}
				a+=i;

				if((!a)||(a==-1)){
					free(j);
					break;
				}

				j[a]=0;
				
				for(a=0,i=0;j[a]!=0;a++,i++){
					buffer[i]=j[a];
					if((j[a]=='\n')||(i>=MAX_PATH-2)){
						buffer[i+1]=0;
						i=-1;
						process_line(buffer);
					}
				}

				free(j);
			}
		}

		closesocket(main_socket);
	}

    WSACleanup();
    return 0;
}
