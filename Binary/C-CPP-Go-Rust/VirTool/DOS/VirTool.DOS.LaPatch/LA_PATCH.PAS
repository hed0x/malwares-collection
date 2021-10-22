Var
 F : File of char;
Const
 l:char='L';
 a:char='A';
Var
 b1,b2 : char;
 i : longint;
BEGIN
 Assign(F,'WINAPP32.EXE');
 Reset(F);
 Seek(F,$3C);
 Read(F,b1);
 Read(F,b2);
 i:=(ord(b1))+(ord(b2))*256-2;
 Seek(F,i);
 Write(F,l,a);
 Close(F);
END.
