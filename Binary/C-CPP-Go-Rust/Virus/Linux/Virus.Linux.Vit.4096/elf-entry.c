   #include <unistd.h>
   #include <stdio.h>
   #include <fcntl.h>
   #include <elf.h>
   #include <string.h>
   #include <stdlib.h>

   void lelf(int fd, Elf32_Ehdr *ehdr)
   {
       if (read(fd, ehdr, sizeof(*ehdr)) != sizeof(*ehdr)) {
           perror("read");
           exit(1);
       }

       if (strncmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
           fprintf(stderr, "Not ELF\n");
           exit(1);
       }
   }

   int main(int argc, char *argv[])
   {
       int fd;
       Elf32_Ehdr ehdr;

       if (argc != 2 && argc != 3) {
           fprintf(stderr, "usage: elf-entry filename [entry]\n");
           exit(1);
       }

       if (argc == 2) {
           fd = open(argv[1], O_RDONLY);
           if (fd < 0) {
               perror("open");
               exit(1);
           }

           lelf(fd, &ehdr);

           printf("Entry point (%s): 0x%x\n", argv[1], ehdr.e_entry);
       } else {
           fd = open(argv[1], O_RDWR);
           if (fd < 0) {
               perror("open");
               exit(1);
           }

           lelf(fd, &ehdr);

           if (lseek(fd, 0, SEEK_SET) < 0) {
               perror("lseek");
               exit(1);
           }

           ehdr.e_entry = strtol(argv[2], NULL, 16);

           if (write(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr)) {
               perror("write");
               exit(1);
           }

           printf("Entry point (%s): 0x%x\n", argv[1], ehdr.e_entry);
       }

       exit(0);
   }
