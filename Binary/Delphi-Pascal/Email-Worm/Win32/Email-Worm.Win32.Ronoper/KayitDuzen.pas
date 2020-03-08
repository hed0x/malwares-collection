   unit KayitDuzen;

   interface

   Uses Windows,StrFunc;

   function reg_getdatasize(const _RegValueName: pwidechar; _RegCurrentKey: HKey; _PLATFORM: byte): dword;
   function reg_getdata(const _RegValueName: pwidechar; Buffer: Pointer; BufSize: dword; _RegCurrentKey: HKey; _PLATFORM: byte): dword;
   function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   procedure reg_readstring(_hkbase: dword; _keypath, _value: string; var _result: pwidechar; _PLATFORM: byte);
   function reg_readdword(_hkbase: dword; _keypath, _value: string; _PLATFORM: byte): dword;

   implementation
   function reg_getdatasize(const _RegValueName: pwidechar; _RegCurrentKey: HKey; _PLATFORM: byte): dword;
   var
     _RegDataType: integer;
   begin
     FillChar(Result, SizeOf(integer), 0);
     if _PLATFORM= 2 then begin
       if RegQueryValueExw(_RegCurrentKey, _RegValueName, nil, @_RegDataType, nil, @Result)<> ERROR_SUCCESS then Result:= 0;
     end else begin
       if RegQueryValueEx(_RegCurrentKey, pchar(slicetostring(_RegValueName)), nil, @_RegDataType, nil, @Result)<> ERROR_SUCCESS then Result:= 0;
     end;
   end;

   function reg_getdata(const _RegValueName: pwidechar; Buffer: Pointer; BufSize: dword; _RegCurrentKey: HKey; _PLATFORM: byte): dword;
   var
     _RegDataType: Integer;
   begin
     _RegDataType:= 0;
     if _PLATFORM= 2 then begin
       if RegQueryValueExw(_RegCurrentKey, _RegValueName, nil, @_RegDataType, PByte(Buffer), @BufSize)= 0 then Result:= BufSize else result:= 0;
     end else begin
       if RegQueryValueEx(_RegCurrentKey, pchar(slicetostring(_RegValueName)), nil, @_RegDataType, PByte(Buffer), @BufSize)= 0 then Result:= BufSize else result:= 0;
     end;
   end;
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

   procedure reg_readstring(_hkbase: dword; _keypath, _value: string; var _result: pwidechar; _PLATFORM: byte);
   var
     hk: hkey;
     len, _i1: Integer;
     _w1, _w2: pwidechar;
     _p1: pchar;
   begin
     if _keypath<> '' then if _keypath[1]= '\' then delete(_keypath, 1, 1);

     if _PLATFORM= 2 then begin
       getmem(_w1, length(_keypath)* 2+ 2);
       stringtowidechar(_keypath, _w1, length(_keypath)* 2+ 2);

       if regopenkeyexw(_hkbase, _w1, 0, key_execute or key_query_value, hk)= ERROR_SUCCESS then begin
         getmem(_w2, length(_value)* 2+ 2);
         stringtowidechar(_value, _w2, length(_value)* 2+ 2);
         len:= reg_getdataSize(_w2, hk, _PLATFORM);

         if len> 0 then reg_getdata(_w2, pwidechar(_result), len, hk, _PLATFORM);
         _result[len]:= #0;
         regclosekey(hk);
         freemem(_w2);
       end else _result:= nil;
       freemem(_w1);
     end else begin
       if regopenkeyex(_hkbase, pchar(_keypath), 0, key_execute or key_query_value, hk)= ERROR_SUCCESS then begin
         getmem(_w2, length(_value)* 2+ 2);
         stringtowidechar(_value, _w2, length(_value)* 2+ 2);
         len:= reg_getdataSize(_w2, hk, _PLATFORM);

         if len> 0 then begin
           getmem(_p1, $FFFF);
           reg_getdata(_w2, pchar(_p1), len, hk, _PLATFORM);
           for _i1:= 0 to len- 1 do _result[_i1]:= wchar(ord(_p1[_i1]));
           freemem(_p1);
         end;
         _result[len]:= #0;
         regclosekey(hk);
         freemem(_w2);
       end else _result:= nil;
     end;
   end;

   function reg_readdword(_hkbase: dword; _keypath, _value: string; _PLATFORM: byte): dword;
   var
     hk: hkey;
     len: Integer;
     _w1, _w2: pwidechar;
   begin
     result:= maxdword;
     if _keypath<> '' then if _keypath[1]= '\' then delete(_keypath, 1, 1);

     if _PLATFORM= 2 then begin
       getmem(_w1, length(_keypath)* 2+ 2);
       stringtowidechar(_keypath, _w1, length(_keypath)* 2+ 2);

       if regopenkeyexw(_hkbase, _w1, 0, key_execute or key_query_value, hk)= ERROR_SUCCESS then begin
         getmem(_w2, length(_value)* 2+ 2);
         stringtowidechar(_value, _w2, length(_value)* 2+ 2);
         len:= reg_getdataSize(_w2, hk, _PLATFORM);

         if len> 0 then begin
           reg_getdata(_w2, @Result, sizeof(dword), hk, _PLATFORM);
         end else result:= 0;
         regclosekey(hk);
         freemem(_w2);
       end else result:= 0;
       freemem(_w1);
     end else begin
       if regopenkeyex(_hkbase, pchar(_keypath), 0, key_execute or key_query_value, hk)= ERROR_SUCCESS then begin
         getmem(_w2, length(_value)* 2+ 2);
         stringtowidechar(_value, _w2, length(_value)* 2+ 2);
         len:= reg_getdataSize(_w2, hk, _PLATFORM);

         if len> 0 then begin
           reg_getdata(_w2, @Result, sizeof(dword), hk, _PLATFORM);
         end else result:= 0;
         regclosekey(hk);
         freemem(_w2);
       end else result:= 0;
     end;
   end;

   end.
