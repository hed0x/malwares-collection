   unit System;

   {$R-,S-,Q-,I-,N-,E-}

   interface

   const
     _Consts : record end = ();

   implementation

   procedure InitTurbo; far; external;
   procedure HaltError; far; external;
   procedure HaltTurbo; far; external;
   {$L SYSTEM.OBJ}

   end.
