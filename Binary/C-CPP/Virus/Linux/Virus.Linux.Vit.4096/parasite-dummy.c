   char parasite[16] =
       "\0\xb8\0\0\0\0"        /* movl $0x0, %eax      */
       "\xff\xe0"              /* jump *%eax           */
   ;

   long hentry = 2;
   long entry = 1;
   int plength = sizeof(parasite);
