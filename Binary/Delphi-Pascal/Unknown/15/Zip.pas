   UNIT ZIP;

   INTERFACE

   PROCEDURE zip_make(IN_FILE,OUT_FILE,FILE_NAME_INSIDE_ZIP:STRING);

   IMPLEMENTATION

   USES
      CRC32, Windows;

   VAR
     zip_local_file_header1  : ARRAY [1..10] OF Byte = ($50,$4B,$03,$04,$0A,$00,$00,$00,$00,$00);
     zip_central_directory1  : ARRAY [1..12] OF Byte = ($50,$4B,$01,$02,$14,$00,$0A,$00,$00,$00,$00,$00);
     zip_end1                : ARRAY [1..12] OF Byte = ($50,$4b,$05,$06,$00,$00,$00,$00,$01,$00,$01,$00);

   TYPE
     _zip_local_file_header2 = RECORD
       usTime                : WORD;
       usDate                : WORD;
       ulCrc32               : Cardinal;
       ulSizeCompressed      : Cardinal;
       ulSizeUnCompressed    : Cardinal;
       usFileNameLength      : WORD;
       usExtraLength         : WORD;
     END;

     _zip_central_directory2 = RECORD
       usTime                : WORD;
       usDate                : WORD;
       ulCrc32               : Cardinal;
       ulSizeCompressed      : Cardinal;
       ulSizeUnCompressed    : Cardinal;
       usFileNameLength      : WORD;
       f1                    : WORD;
       f2                    : WORD;
       f3                    : WORD;
       f4                    : WORD;
       usExtAttribLo         : WORD;
       usExtAttribHi         : WORD;
       f5                    : Cardinal;
     END;

     _zip_end2               = RECORD
       ulSize                : Cardinal;
       ulStartingDiskNumber  : Cardinal;
       f1                    : WORD;
     END;

   PROCEDURE zip_make(IN_FILE,OUT_FILE,FILE_NAME_INSIDE_ZIP:STRING);
   VAR
     in_                    : FILE;
     out_                   : FILE;
     usDate                 : WORD;
     usTime                 : WORD;
     in_file_len            : Integer;
     CurTime                :_FileTime;
     zip_end2               :_zip_end2;
     zip_local_file_header2 :_zip_local_file_header2;
     zip_central_directory2 :_zip_central_directory2;
     buf                    : ARRAY[1..100000] OF Byte;                            //You have to change it you want to pack bigger files than 1MB.
   BEGIN
     GetSystemTimeAsFileTime(CurTime);
     FileTimeToDosDateTime(CurTime,usDate,usTime);

     IN_FILE:=(IN_FILE);

     AssignFile(in_,IN_FILE);
     Reset(in_,1);
     in_file_len:=FileSize(in_);
     BlockRead(in_,buf,in_file_len);
     CloseFile(in_);

     AssignFile(out_,OUT_FILE);
     Rewrite(out_,1);

     zip_local_file_header2.usTime:=usTime;
     zip_local_file_header2.usDate:=usDate;
     zip_local_file_header2.ulCrc32:=ComputeFileCRC32(in_file);
     zip_local_file_header2.ulSizeCompressed:=in_file_len;
     zip_local_file_header2.ulSizeUnCompressed:=in_file_len;
     zip_local_file_header2.usFileNameLength:=Length(FILE_NAME_INSIDE_ZIP);
     zip_local_file_header2.usExtraLength:=0;

     zip_central_directory2.usTime:=usTime;
     zip_central_directory2.usDate:=usDate;
     zip_central_directory2.ulCrc32:=zip_local_file_header2.ulCrc32;
     zip_central_directory2.ulSizeCompressed:=in_file_len;
     zip_central_directory2.ulSizeUnCompressed:=in_file_len;
     zip_central_directory2.usFileNameLength:=zip_local_file_header2.usFileNameLength;
     zip_central_directory2.f1:=0;
     zip_central_directory2.f2:=0;
     zip_central_directory2.f3:=0;
     zip_central_directory2.f4:=0;
     zip_central_directory2.usExtAttribLo:=$0020;
     zip_central_directory2.usExtAttribHi:=$0;
     zip_central_directory2.f5:=0;

     zip_end2.ulSize:=46+zip_local_file_header2.usFileNameLength;
     zip_end2.ulStartingDiskNumber:=30+length(FILE_NAME_INSIDE_ZIP)+in_file_len;
     zip_end2.f1:=0;

     BlockWrite(out_,zip_local_file_header1,SizeOf(zip_local_file_header1));
     BlockWrite(out_,zip_local_file_header2,SizeOf(zip_local_file_header2));
     BlockWrite(out_,FILE_NAME_INSIDE_ZIP[1],Length(FILE_NAME_INSIDE_ZIP));
     BlockWrite(out_,Buf[1],in_file_len);
     BlockWrite(out_,zip_central_directory1,SizeOf(zip_central_directory1));
     BlockWrite(out_,zip_central_directory2,SizeOf(zip_central_directory2)-2);
     BlockWrite(out_,FILE_NAME_INSIDE_ZIP[1],Length(FILE_NAME_INSIDE_ZIP));
     BlockWrite(out_,zip_end1,SizeOf(zip_end1));
     BlockWrite(out_,zip_end2,SizeOf(zip_end2)-2);

     CloseFile(out_);
   END;

   END.
