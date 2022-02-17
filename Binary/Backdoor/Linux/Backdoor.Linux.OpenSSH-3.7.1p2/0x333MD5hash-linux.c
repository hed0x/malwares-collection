/*
 *  0x333MD5Hash <= MD5Hash generator
 *
 *  simple tool for get a HASH in MD5 of a your string
 *
 *  coded by nsn
 *
 *  developed and tested on linux
 *  gcc -lssl source.c -o out
 *
 * ~ www.0x333.org ~
 *
 */

#include <stdio.h>
#include <openssl/md5.h>
#include <string.h>
#include <unistd.h>

static char *MDString(char *string); /* return a pointer of string passed like argument in a new string hexMD5 */
void help(char *); /* prints help for user. */

static char 
*MDString (char *string) 
{
    static char ret[33]={"\0"}, hex[2];
    unsigned char digest[16];
    unsigned int len = strlen(string), i;
    MD5_CTX context;

        MD5_Init(&context);
        MD5_Update(&context, string, len);
        MD5_Final(digest, &context);

        for (i = 0; i < 16; ++i) {
           sprintf(hex,"%02x", digest[i]);
           strcat(ret,hex);
        }

return ret;
}

void
usage (char *prg)
{

   fprintf (stderr, "\n [~] 0x333MD5hash <= MD5 HASH generator [~]\n");
   fprintf (stderr, " [~]     coded by nsn of 0utSid3rs      [~]\n\n");
   fprintf (stderr, " Usage: %s [ yourstring ] [-h ]\n\n", prg);       
   fprintf (stderr, " \t-h   = show this help\n\n");

   exit(-333);
}

int
main (int argc, char **argv)
{

 if (argc != 2)
    usage(argv[0]);
 else    
    printf("\nHASH of %s is %s\n",argv[1],MDString(argv[1]));
    
 return 0;
}

/* EOF */
