   ////// BINDER UNIT \\\\\\\\\\\
   unit BinderUnit;

   interface

   uses
     windows;

   type
     TAttachmentHeader = record
       MagicNumber: cardinal;
       CRC: cardinal;
       Size: int64;
       IsStub: boolean;
       FileName: array[0..MAX_PATH] of char;
     end;
     PAttachmentHeader = ^TAttachmentHeader;

   implementation

   end.

   /////////////////////////////////
   /////////////////////////////////
   /////////////////////////////////
   /////////////////////////////////
   /////////////////////////////////
