   Unit IniFiles;
   /////////////////////////////////////////////////////////////////////////////
   // ACL library project
   //
   // IniFiles.Pas
   //
   // Wrapped from IniFiles.pas by Alexander V. Hramov (fduch)
   //                              http://fduch.i-connect.com
   // Created: 14/Jun/2000
   //
   // History: 14/Jun/2000 fduch  - Initially creating.
   /////////////////////////////////////////////////////////////////////////////
   interface

   uses Windows, SClasses, AclUtils;

   {$R-,T-,H+,X+}

   type
     TCustomIniFile = class(TObject)
     private
       FFileName: string;
       procedure CreateFmt(Msg: String; Data: string);
     public
       constructor Create(const FileName: string);
       function SectionExists(const Section: string): Boolean;
       function ReadString(const Section, Ident, Default: string): string; virtual; abstract;
       procedure WriteString(const Section, Ident, Value: String); virtual; abstract;
       function ReadInteger(const Section, Ident: string; Default: Longint): Longint; virtual;
       procedure WriteInteger(const Section, Ident: string; Value: Longint); virtual;
       function ReadBool(const Section, Ident: string; Default: Boolean): Boolean; virtual;
       procedure WriteBool(const Section, Ident: string; Value: Boolean); virtual;
       function ReadFloat(const Section, Name: string; Default: Double): Double; virtual;
       procedure WriteFloat(const Section, Name: string; Value: Double); virtual;
       procedure ReadSection(const Section: string; Strings: TStrings); virtual; abstract;
       procedure ReadSections(Strings: TStrings); virtual; abstract;
       procedure ReadSectionValues(const Section: string; Strings: TStrings); virtual; abstract;
       procedure EraseSection(const Section: string); virtual; abstract;
       procedure DeleteKey(const Section, Ident: String); virtual; abstract;
       procedure UpdateFile; virtual; abstract;
       function ValueExists(const Section, Ident: string): Boolean;
       property FileName: string read FFileName;
     end;

     { TIniFile - Encapsulates the Windows INI file interface
       (Get/SetPrivateProfileXXX functions) }

     TIniFile = class(TCustomIniFile)
     public
       function ReadString(const Section, Ident, Default: string): string; override;
       procedure WriteString(const Section, Ident, Value: String); override;
       procedure ReadSection(const Section: string; Strings: TStrings); override;
       procedure ReadSections(Strings: TStrings); override;
       procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
       procedure EraseSection(const Section: string); override;
       procedure DeleteKey(const Section, Ident: String); override;
       procedure UpdateFile; override;
     end;

   Implementation

   procedure TCustomIniFile.CreateFmt(Msg: String; Data: string);
   begin
     MessageBox(0, PChar(Msg+Data), 'Error', MB_OK);
   end;

   constructor TCustomIniFile.Create(const FileName: string);
   begin
     FFileName := FileName;
   end;

   function TCustomIniFile.SectionExists(const Section: string): Boolean;
   var
     S: TStrings;
   begin
     S := TStringList.Create;
     try
       ReadSection(Section, S);
       Result := S.Count > 0;
     finally
       S.Free;
     end;
   end;

   function TCustomIniFile.ReadInteger(const Section, Ident: string;
     Default: Longint): Longint;
   var
     IntStr: string;
   begin
     IntStr := ReadString(Section, Ident, '');
     if (Length(IntStr) > 2) and (IntStr[1] = '0') and
       ((IntStr[2] = 'X') or (IntStr[2] = 'x')) then
       IntStr := '$' + Copy(IntStr, 3, Maxint);
     Result := StrToIntDef(IntStr, Default);
   end;

   procedure TCustomIniFile.WriteInteger(const Section, Ident: string; Value: Longint);
   begin
     WriteString(Section, Ident, IntToStr(Value));
   end;

   function TCustomIniFile.ReadBool(const Section, Ident: string;
     Default: Boolean): Boolean;
   begin
     Result := ReadInteger(Section, Ident, Ord(Default)) <> 0;
   end;


   function TCustomIniFile.ReadFloat(const Section, Name: string; Default: Double): Double;
   var
     FloatStr: string;
   begin
     FloatStr := ReadString(Section, Name, '');
     Result := Default;
     if FloatStr <> '' then
      Result := StrToFloat(FloatStr);
   end;

   procedure TCustomIniFile.WriteFloat(const Section, Name: string; Value: Double);
   begin
     WriteString(Section, Name, FloatToStr(Value));
   end;

   procedure TCustomIniFile.WriteBool(const Section, Ident: string; Value: Boolean);
   const
     Values: array[Boolean] of string = ('0', '1');
   begin
     WriteString(Section, Ident, Values[Value]);
   end;

   function TCustomIniFile.ValueExists(const Section, Ident: string): Boolean;
   var
     S: TStrings;
   begin
     S := TStringList.Create;
     try
       ReadSection(Section, S);
       Result := S.IndexOf(Ident) > -1;
     finally
       S.Free;
     end;
   end;

   { TIniFile }

   function TIniFile.ReadString(const Section, Ident, Default: string): string;
   var
     Buffer: array[0..2047] of Char;
   begin
     SetString(Result, Buffer, GetPrivateProfileString(PChar(Section),
       PChar(Ident), PChar(Default), Buffer, SizeOf(Buffer), PChar(FFileName)));
   end;

   procedure TIniFile.WriteString(const Section, Ident, Value: string);
   begin
     if not WritePrivateProfileString(PChar(Section), PChar(Ident),
       PChar(Value), PChar(FFileName)) then
         CreateFmt('Ini file write error. File name: ', FileName);
   end;

   procedure TIniFile.ReadSections(Strings: TStrings);
   const
     BufSize = 16384;
   var
     Buffer, P: PChar;
   begin
     GetMem(Buffer, BufSize);
     try
       Strings.BeginUpdate;
       try
         Strings.Clear;
         if GetPrivateProfileString(nil, nil, nil, Buffer, BufSize,
           PChar(FFileName)) <> 0 then
         begin
           P := Buffer;
           while P^ <> #0 do
           begin
             Strings.Add(P);
             Inc(P, StrLen(P) + 1);
           end;
         end;
       finally
         Strings.EndUpdate;
       end;
     finally
       FreeMem(Buffer, BufSize);
     end;
   end;

   procedure TIniFile.ReadSection(const Section: string; Strings: TStrings);
   const
     BufSize = 16384;
   var
     Buffer, P: PChar;
   begin
     GetMem(Buffer, BufSize);
     try
       Strings.BeginUpdate;
       try
         Strings.Clear;
         if GetPrivateProfileString(PChar(Section), nil, nil, Buffer, BufSize,
           PChar(FFileName)) <> 0 then
         begin
           P := Buffer;
           while P^ <> #0 do
           begin
             Strings.Add(P);
             Inc(P, StrLen(P) + 1);
           end;
         end;
       finally
         Strings.EndUpdate;
       end;
     finally
       FreeMem(Buffer, BufSize);
     end;
   end;

   procedure TIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
   var
     KeyList: TStringList;
     I: Integer;
   begin
     KeyList := TStringList.Create;
     try
       ReadSection(Section, KeyList);
       Strings.BeginUpdate;
       try
         for I := 0 to KeyList.Count - 1 do
           Strings.Values[KeyList[I]] := ReadString(Section, KeyList[I], '');
       finally
         Strings.EndUpdate;
       end;
     finally
       KeyList.Free;
     end;
   end;

   procedure TIniFile.EraseSection(const Section: string);
   begin
     if not WritePrivateProfileString(PChar(Section), nil, nil,
       PChar(FFileName)) then
         CreateFmt('Ini file write error. File name: ', FileName);
   end;

   procedure TIniFile.DeleteKey(const Section, Ident: String);
   begin
     WritePrivateProfileString(PChar(Section), PChar(Ident), nil,
        PChar(FFileName));
   end;

   procedure TIniFile.UpdateFile;
   begin
     WritePrivateProfileString(nil, nil, nil, PChar(FFileName));
   end;

   end.
