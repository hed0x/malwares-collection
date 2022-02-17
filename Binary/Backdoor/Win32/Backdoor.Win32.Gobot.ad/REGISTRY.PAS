   UNIT  Registry;

   INTERFACE

   USES
     Windows, uStrList, AclUtils;

   type
     TRegKeyInfo = record
       NumSubKeys   : Integer;
       MaxSubKeyLen : Integer;
       NumValues    : Integer;
       MaxValueLen  : Integer;
       MaxDataLen   : Integer;
       FileTime     : TFileTime;
     end;

     TRegDataType = (rdUnknown,rdString,rdExpandString,rdInteger,rdBinary);

     TRegDataInfo = record
       RegData  : TRegDataType;
       DataSize : Integer;
     end;

     TRG = class(TObject)
     private
       FCurrentKey   : HKEY;
       FRootKey      : HKEY;
       FCurrentPath  : string;
       FCloseRootKey : Boolean;
       FAccess       : LongWord;
       procedure SetRootKey(Value:HKEY);
     protected
       function  GetData(const Name:string;Buffer:Pointer;BufSize:Integer;var RegData:TRegDataType) : Integer;
       procedure PutData(const Name:string;Buffer:Pointer;BufSize:Integer;RegData:TRegDataType);
     public
       constructor Create; overload;
       procedure CloseKey;
       procedure GetValueNames(Strings: TStrlist);
       procedure WriteString(const Name,Value: string);
       procedure WriteInteger(const Name:string;Value:Integer);
       function  ReadString(const Name:string) : string;
       function  GetKeyInfo(var Value: TRegKeyInfo): Boolean;
       function  ValueExists(const Name:string) : Boolean;
       function  ReadInteger(const Name:string) : Integer;
       function  GetDataSize(const ValueName:string) : Integer;
       function  OpenKey(const Key:string;CanCreate:Boolean) : Boolean;
       function  GetDataInfo(const ValueName:string;var Value:TRegDataInfo) : Boolean;
       function  ReadBinaryData(const Name:string;var Buffer;BufSize: integer) : Integer;
       property  RootKey: HKEY read FRootKey write SetRootKey;
       property  CurrentKey: HKEY read FCurrentKey;
     end;

   Implementation

   function DataTypeToRegData(Value:Integer) : TRegDataType;
   begin
     CASE Value OF
       REG_SZ        : Result:=rdString;
       REG_EXPAND_SZ : Result:=rdExpandString;
       REG_DWORD     : Result:=rdInteger;
       REG_BINARY    : Result:=rdBinary;
     ELSE
       Result:=rdBinary
     END;
   end;

   constructor TRG.Create;
   begin
     RootKey:=HKEY_CURRENT_USER;
     FAccess:=KEY_ALL_ACCESS;
   end;

   procedure TRG.CloseKey;
   begin
     if FCurrentKey<>0 then begin
       RegCloseKey(FCurrentKey);
       FCurrentKey:=0;
       FCurrentPath:='';
     end;
   end;

   procedure TRG.SetRootKey(Value:HKEY);
   begin
     if RootKey<>Value then begin
       if FCloseRootKey then begin
         RegCloseKey(RootKey);
         FCloseRootKey:=False;
       end;
       FRootKey:=Value;
       CloseKey;
     end;
   end;

   function TRG.OpenKey(const Key:String;Cancreate:boolean) : Boolean;
   var
     TempKey     : HKey;
     S           : string;
     Disposition : Integer;
     Relative    : Boolean;
     T           : HKEY;
   begin
     S:=Key;
     Relative:=not((S<>'')and(S[1]='\'));
     if not Relative then Delete(S,1,1);
     if (FCurrentKey=0)or not Relative then T:=RootKey else T:=FCurrentKey;
     TempKey:=0;
     if not CanCreate or(S='') then Result:=RegOpenKeyEx(T,PChar(S),0,FAccess,TempKey)=ERROR_SUCCESS
      else Result:=RegCreateKeyEx(T,PChar(S),0,nil,REG_OPTION_NON_VOLATILE,FAccess,nil,TempKey,@Disposition)=ERROR_SUCCESS;
     if Result then begin
       if (FCurrentKey<>0)and Relative then S:=FCurrentPath+'\'+S;
       CloseKey;
       FCurrentKey:=TempKey;
       FCurrentPath:=S;
     end;
   end;

   function TRG.GetKeyInfo(var Value: TRegKeyInfo): Boolean;
   begin
     FillChar(Value, SizeOf(TRegKeyInfo), 0);
     Result := RegQueryInfoKey(CurrentKey, nil, nil, nil, @Value.NumSubKeys,
       @Value.MaxSubKeyLen, nil, @Value.NumValues, @Value.MaxValueLen,
       @Value.MaxDataLen, nil, @Value.FileTime) = ERROR_SUCCESS;
     if SysLocale.FarEast and (Win32Platform = VER_PLATFORM_WIN32_NT) then
       with Value do
       begin
         Inc(MaxSubKeyLen, MaxSubKeyLen);
         Inc(MaxValueLen, MaxValueLen);
       end;
   end;

   procedure TRG.GetValueNames(Strings: TStrList);
   var
     Len: DWORD;
     I: Integer;
     Info: TRegKeyInfo;
     S: string;
   begin
     if GetKeyInfo(Info) then
     begin
       SetString(S, nil, Info.MaxValueLen + 1);
       for I := 0 to Info.NumValues - 1 do
       begin
         Len := Info.MaxValueLen + 1;
         RegEnumValue(CurrentKey, I, PChar(S), Len, nil, nil, nil, nil);
         Strings.Add(PChar(S));
       end;
     end;
   end;

   function TRG.GetDataInfo(const ValueName:string;var Value:TRegDataInfo) : Boolean;
   var
     DataType : Integer;
   begin
     FillChar(Value,SizeOf(TRegDataInfo),0);
     Result:=RegQueryValueEx(FCurrentKey,PChar(ValueName),nil,@DataType,nil,@Value.DataSize)=ERROR_SUCCESS;
     Value.RegData:=DataTypeToRegData(DataType);
   end;

   function TRG.GetDataSize(const ValueName:string) : Integer;
   var
     Info : TRegDataInfo;
   begin
     if GetDataInfo(ValueName,Info) then Result:=Info.DataSize else Result:=-1;
   end;

   procedure TRG.WriteString(const Name,Value:string);
   begin
     PutData(Name,PChar(Value),Length(Value)+1,rdString);
   end;

   function TRG.ReadString(const Name:string): string;
   var
     Len     : Integer;
     RegData : TRegDataType;
   begin
     Len:=GetDataSize(Name);
     if Len>0 then begin
       SetString(Result,nil,Len);
       GetData(Name,PChar(Result),Len,RegData);
       if (RegData=rdString)or(RegData=rdExpandString)then SetLength(Result,StrLen(PChar(Result)));
     end else Result:='';
   end;

   procedure TRG.WriteInteger(const Name:string;Value:Integer);
   begin
     PutData(Name,@Value,SizeOf(Integer),rdInteger);
   end;

   function TRG.ReadInteger(const Name:string) : Integer;
   var
     RegData : TRegDataType;
   begin
     GetData(Name,@Result,SizeOf(Integer),RegData);
   end;

   function TRG.ReadBinaryData(const Name:string;var Buffer;BufSize:Integer) : Integer;
   var
     RegData : TRegDataType;
     Info    : TRegDataInfo;
   begin
     if GetDataInfo(Name,Info) then begin
       Result:=Info.DataSize;
       RegData:=Info.RegData;
       if ((RegData=rdBinary)or(RegData=rdUnknown))and(Result<=BufSize)then GetData(Name,@Buffer,Result,RegData);
     end else Result:=0;
   end;

   procedure TRG.PutData(const Name:string;Buffer:Pointer;BufSize:Integer;RegData:TRegDataType);
   VAR
     O : Integer;
   begin
     case RegData of
       rdString       : O:=REG_SZ;
       rdExpandString : O:=REG_EXPAND_SZ;
       rdInteger      : O:=REG_DWORD;
       rdBinary       : O:=REG_BINARY;
     else
       O:=REG_NONE;
     end;
     RegSetValueEx(FCurrentKey,PChar(Name),0,O,Buffer,BufSize);
   end;

   function TRG.GetData(const Name:string;Buffer:Pointer;BufSize:Integer;var RegData:TRegDataType) : Integer;
   var
     DataType : Integer;
   begin
     DataType:=REG_NONE;
     RegQueryValueEx(FCurrentKey,PChar(Name),nil,@DataType,PByte(Buffer),@BufSize);
     Result:=BufSize;
     RegData:=DataTypeToRegData(DataType);
   end;

   function TRG.ValueExists(const Name:string) : Boolean;
   var
     Info : TRegDataInfo;
   begin
     Result:=GetDataInfo(Name,Info);
   end;

   end.
