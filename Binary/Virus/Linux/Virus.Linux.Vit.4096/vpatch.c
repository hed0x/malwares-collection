   #include <stdio.h>
   #include <stdlib.h>
   #include <unistd.h>
   #include <fcntl.h>

   int main(int argc, char *argv[])
   {
       char val;
       int fd;

       if (argc != 3 && argc != 4) {
           fprintf(stderr, "usage: vpatch filename loc [val]\n");
           exit(1);
       }

       if (argc == 3) {
           fd = open(argv[1], O_RDWR);
           if (fd < 0) {
               perror("open");
               exit(1);
           }

           if (lseek(fd, atol(argv[2]), SEEK_SET) < 0) {
               perror("lseek");
               exit(1);
           }

           if (read(fd, &val, sizeof(val)) != sizeof(val)) {
               perror("read");
               exit(1);
           }

           printf("0x%x\n", val & 255);

           exit(0);
       }

       val = atoi(argv[3]);

       fd = open(argv[1], O_RDWR);
       if (fd < 0) {
           perror("open");
           exit(1);
       }

       if (lseek(fd, atol(argv[2]), SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       if (write(fd, &val, sizeof(val)) != sizeof(val)) {
           perror("write");
           exit(1);
       }

       exit(0);
   }
