   ____________________________________________________________________________________________
   \\                                                                                        //
   //                                                                                        \\
   \\                                    Tamiami Worm                                        //
   //                                    Version  1.3                                        \\
   \\                                      coded by                                          //
   //                                         DiA                                            \\
   \\                             Ready Rangers Liberation Front                             //
   //                  DiA_hates_machine@gmx.de - http://www.vx-dia.de.vu/                   \\
   \\                                                                                        //
   //________________________________________________________________________________________\\


   // Disclaimer
        I am not responsible for anything that you do with this source. So take care when you
       want to test this or parts of this code. If you don't know how to handle malware, please
       close this for your and others pleasure.

   // Intro
        Welcome to my best and biggest creation. It spreads via several ways, wich i describe
       here. Also it has some nice features, and still more to come. When you look at the
       source code, you will see that some functions are not used. Thats because i decided
       that simpler is better for this worm. As example the autostart function, in the first
       version of Tamiami it was able to infect an autostart application. But now it has a tool
       included that make termination of the worm harder, but read later about it. I am sure
       I will make some more versions of the worm, because I have still much ideas.

   // HTTP Server
        The worm has it's own HTTP server, that can provide a website at the infected computer.
       The HTTP server is used for mail spreading via a spoofed link, and spreading via IRC and
       mIRC. Read on for that.

   // Website creator
        Yes, thats right, the worm creates a website on an infected computer. For that it get's
       three pictures from user's "My Pictures" folder. It then creates HTML code that contain
       the pictures, sublinks to enlarge it, and a link to the worm binary, tarned as an
       selfextracting archive, containing more pictures.

   // Mail spreading via spoofed link
        The worm has now only mail spreading via simple MAPI (SMTP version in progress). The
       worm send's a mail with the spoofed link to an infecting computer (where the website
       is) to all mail addresses that can be found in the inbox of Outlook.

   // Spoofed link
        Tamiami send's only spoofed links (Mail, IRC, mIRC). The IP of the infected machine
       is spoofed by the http://user:pass@IP(in %hex) formation.

   // Mail spreading via attachment
        If mail spreading via spoofed link failed (eg can't run HTTP server), the worm send's
       mails to all addresses in inbox of Outlook with a binary of the worm attached.

   // Disabling MAPI warning
        For sending mail's without a warning by Outlook the worm disables it via an entry in
       the registry.

   // Extract mail addresses
        The worm read's mail addresses from the Outlook inbox and store the addresses as files
       in a folder. Why that? If you do it via files, you have no victim address twice, and
       invalid file names mean invalid mail addresses.

   // Two languages
        The worm is able to spread via two languages, german if system is a german one,
       otherwise english. Spreads via two languages in mail spreading, zip & rar spreading,
       also it creates website and spoofed links in two languages.

   // Autostart
        As I sayed in the intro, the worm has a simple autostart, via a entry in the registry.
       Other functions for autostart can be found in the documentation.

   // Creating a mutex
        To not run twice the worm creates a mutex. Before it do it's action it checks if the
       mutex already exist, if so the worm terminate it's process, because it already run.

   // Update Tamiami
        The worm is able to update itself, if a newer version come to system, and an older
       already exist, the worm update itself on it.

   // Disabling XP firewall
        The firewall that comes with XP SP2 will be disabled by the worm, via an entry in the
       registry.

   // Drive spreading
        The worm checks every drive from B:\ to Z:\ if it's a remote drive (fixed share). If
       so it copy's the worm binary with a random name.

   // RAR & ZIP worm
        Tamiami search on all fixed drives (remote or local) for all ZIP and RAR archives.
       If it found one, the worm add's itself with an random name to the archive.

   // IRC spreading
        Tamiami connects to 6 of the biggest IRC server and join channels with much people
       inside and idle there. It recocnize when a user join a channel, and then it send's
       a private message with a spoofed link to the infected PC and it's website. If worm
       get's kicked or banned it joins a new channel and spreads there.

   // mIRC spreading
        When mIRC is running the worm loads a script dynamicly into mIRC. The script spread
       the worm binary via DCC when someone join a channel.

   // IRC backdoor
        Inside the worm there is also an IRC backdoor, not for criminal intend, but maybe
       to clean infected machines if this worm is outbreak. The bot only have raw, quit,
       version and download and execute commands.

   // DOC infection
        The worm drop's a .vbs file that insert code in Word's Normal.dot template, that
       code infects every opened .doc file with a small dropper code and the worm binary.

   // Take car for me
        To avoid termination, the worm drop's my tool "TakeCareOnMe" to disk, and execute it
       with the worm path as parameter. That way, it restart's Tamiami when it got's
       terminated.

   // Payload
        The payload activte on September 17 every year. Then it prints random text with random
       color and random position to the screen. The loop is infinite, so very annoying. And
       if worm is terminated, it get restarted by TakeCareOnMe.

   // Outro
        Hope that "read me" covers all features of the worm, to get an closer look you can look
       at the big documentation "_Ver_Inc_Docu.h". I am sure in near or far future you will see
       a newer version of this worm. So long, have fun with this code.

                                                                       DiA/RRLF - 16.06.2006
