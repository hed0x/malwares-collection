   unit Unit1;

   interface

   uses windows;

   type
    ta_8u=packed array [0..65530] of byte;
    t_encoding=(uuencode,base64,mime);

    Procedure encode_base64(sfile:string;ofile:string);
    function encode_line(mode:t_encoding; const buf; size:Integer):String;

   const
    bin2b64:String='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    b642bin:String='~~~~~~~~~~~^~~~_TUVWXYZ[\]~~~|~~~ !"#$%&''()*+,-./0123456789~~~~~~:;<=>?@ABCDEFGHIJKLMNOPQRS';
    bin2uue:String='`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';
    uue2bin:String=' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_ ';
    linesize = 45;

   implementation

   function encode_line(mode:t_encoding; const buf; size:Integer):String;
   var
    buff: ta_8u absolute buf;
    offset: shortint;
    pos1,pos2: byte;
    i: byte;
    sOut: String;
   begin
    setlength(sOut,size*4 div 3 + 4);
    fillchar(sOut[1],size*4 div 3 +2,#0);
    if mode=uuencode then
    begin
      sOut[1]:=char(((size-1) and $3f)+$21);
      size:=((size+2) div 3)*3;
    end;// if
    offset:=2;
    pos1:=0;
    pos2:=0;
    case mode of
      uuencode:     pos2:=2;
      base64, mime: pos2:=1;
    end;// case
    sOut[pos2]:=#0;
    while pos1<size do
    begin
      if offset > 0 then
      begin
        sOut[pos2]:=char(ord(sOut[pos2]) or ((buff[pos1] and ($3f shl offset)) shr offset));
        offset:=offset-6;
        inc(pos2);
        sOut[pos2]:=#0;
      end
      else
        if offset < 0 then
        begin
          offset:=abs(offset);
          sOut[pos2]:=char(ord(sOut[pos2]) or ((buff[pos1] and ($3f shr offset)) shl offset));
          offset:=8-offset;
          inc(pos1);
        end
        else
        begin
          sOut[pos2]:=char(ord(sOut[pos2]) or ((buff[pos1] and $3f)));
          inc(pos2);
          inc(pos1);
          sOut[pos2]:=#0;
          offset:=2;
        end;
    end;

    case mode of
      uuencode:
      begin
        if offset=2 then dec(pos2);
        for i:=2 to pos2 do
          sOut[i]:=bin2uue[ord(sOut[i])+1];
      end;// uuencode
      base64, mime:
      begin
        if offset=2 then dec(pos2);
        for i:=1 to pos2 do
          sOut[i]:=bin2b64[ord(sOut[i])+1];
        while (pos2 and 3)<>0  do
        begin
          inc(pos2);
          sOut[pos2]:='=';
        end;
      end;// base64, mime
    end;// case
    encode_line:=copy(sOut,1,pos2);
   end;// function encode_line

   Procedure encode_base64(sfile:string;ofile:string);
   var
    bug: pointer;
    size: Integer;
    fil:textfile;
    hFile:THandle;
    dwRead:DWORD;
   begin
    bug:=NIL;
    try
      assignfile(fil,ofile);
      rewrite(fil);
      getmem(bug,linesize);
      hFile := CreateFile(pchar(sfile), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
      SetFilePointer(hFile, 0, nil, FILE_BEGIN);
      repeat
        ReadFile(hFile, bug^, linesize, dwRead, nil);
        size := dwRead;
        if size>0 then
          write(fil,encode_line(base64,bug^,size));
   //       Result := result + #13#10 + (encode_line(base64,bug^,size));
      until (dwRead < 1);
     finally
      if bug<>nil then
        freemem(bug,linesize);
    end;// try
    closefile(fil);
   end;// function encode_base64

   end.
