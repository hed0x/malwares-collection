   #include <stdio.h>
   #include <stdlib.h>
   #include <unistd.h>
   #include <fcntl.h>
   #include <string.h>
   #include <elf.h>

   #define N   16

   int main(int argc, char *argv[])
   {
       char *pdata, *data;
       Elf32_Ehdr ehdr;
       Elf32_Phdr *phdr;
       unsigned long start, stop, len, n;
       int fd;
       int i;
       int plen;

       if (argc != 4) {
           fprintf(stderr, "usage: elf-text2egg filename start stop\n");
           exit(1);
       }

       start = strtol(argv[2], NULL, 16);
       stop = strtol(argv[3], NULL, 16);

       if (stop <= start) {
           fprintf(stderr, "ERROR: stop <= start\n");
           exit(1);
       }

       fd = open(argv[1], O_RDONLY);
       if (fd < 0) {
           perror("open");
           exit(1);
       }

       if (read(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr)) {
           perror("read");
           exit(1);
       }

       if (strncmp(ehdr.e_ident, ELFMAG, SELFMAG)) {
           fprintf(stderr, "Not ELF\n");
           exit(1);
       }

           pdata = (char *)malloc(plen = sizeof(*phdr)*ehdr.e_phnum);
           if (pdata == NULL) {
                   perror("malloc");
                   exit(1);
           }

           if (lseek(fd, ehdr.e_phoff, SEEK_SET) < 0) {
                   perror("lseek");
                   exit(1);
           }

           if (read(fd, pdata, plen) != plen) {
                   perror("read");
                   exit(1);
           }

       for (phdr = (Elf32_Phdr *)pdata, i = 0; i < ehdr.e_phnum; i++) {
           if (
               phdr->p_type == PT_LOAD &&
               phdr->p_vaddr <= start &&
               phdr->p_vaddr + phdr->p_filesz >= stop
           ) {
               break;
           }
           ++phdr;
       }

       if (i == ehdr.e_phnum) {
           fprintf(stderr, "No SEGMENT\n");
           exit(1);
       }

       if (lseek(fd, phdr->p_offset + start - phdr->p_vaddr, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       data = (char *)malloc(len = stop - start);
       if (data == NULL) {
           perror("malloc");
           exit(1);
       }

       if (read(fd, data, len) != len) {
           perror("read");
           exit(1);
       }

       n = 0;
       while (n < len) {
           printf("\t\"");
           for (i = 0; n < len && i < N; i++) {
               printf("\\x%2.2x", data[n] & 0xff);
               ++n;
           }
           printf("\"\n");
       }

       exit(0);
   }
