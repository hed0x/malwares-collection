   {The program find_intruder determines which files are infected by the INTRUDER
    virus on a specified disk drive. It works by looking for the same ID code as
    the virus does when determining whether a file has already been infected. That
    code is located at the initial code segment, offset 0, in the EXE file. This
    must be located in the disk file and read, and compared with the value
    contained in INTRUDER}


   program find_intruder;     {Compile with Turbo Pascal 4.0 or higher}

   uses dos;

   const
     id_check         :word=$C8AA;         {Intruder ID code word to look for}

   type
     header_type      =record              {EXE file header structure}
       signature      :word;
       lp_size        :word;
       pg_count       :word;
       rel_tbl_entries:word;
       hdr_paragraphs :word;
       minalloc       :word;
       maxalloc       :word;
       init_ss        :word;
       init_sp        :word;
       chksum         :word;
       init_ip        :word;
       init_cs        :word;
       rel_tbl_ofs    :word;
       overlay        :word;
       end;

   var
     check_file       :file;               {File being checked}
     header           :header_type;        {Exe header data area for file being checked}
     id_byte          :word;               {Init CS:0000 value from the file being checked}
     srchpath         :string;             {Used to store the current path being searched}


   {The following routine checks one file for infection by opening it, reading
    the EXE header, calculating the location of Initial CS:0000, and reading 2
    bytes from there. Then it compares those bytes with id_check. If they're the
    same, then the file is infected. If the signature is not correct, then the
    program will also display that, so you can find out if you have any non-EXE
    files with the extent .EXE with it.}

   procedure check_one_file(fname:string);
   begin
     assign(check_file,fname);             {Set up the file with this path\name}
   {$I-}                                   {I/O checking handled explicitly here}
     reset(check_file,1);                  {Open the file}
     if IOResult<>0 then                   {If an error, just report it to the console}
       begin
         writeln('IO error on the file ',fname);
         exit;
       end;
     BlockRead(check_file,header,sizeof(header));                  {Read the EXE header}
     if IOResult<>0 then
       begin
         writeln('IO error on the file ',fname);
         exit;
       end;
     if header.signature<>ord('Z')*256+ord('M') then
       begin
         writeln(fname,' is not an EXE program file!');
         exit;
       end;
     Seek(check_file,16*(header.hdr_paragraphs+header.init_cs));   {Go seek Init CS:0000}
     if IOResult<>0 then                                           {Don't forget to take into account the size}
       begin                                                       {of header in calculating this!}
         writeln('IO error on the file ',fname);
         exit;
       end;
     BlockRead(check_file,id_byte,2);                              {Read 2 bytes at Init CS:0000}
     if IOResult<>0 then
       begin
         writeln('IO error on the file ',fname);
         exit;
       end;
     close(check_file);                                            {and close the file}
     if IOResult<>0 then
       begin
         writeln('IO error on the file ',fname);
         exit;
       end;
   {$I+}
     if id_byte=id_check then writeln(fname,' is infected.')       {if id_byte read from file = id_check, it's infected}
   end;


   {The following routine checks all files in the specified path, or any of its
    subdirectories for infection. It will check a whole disk if the initial path
    is '\'. Note that it is recursive, and if directories are nested too deep,
    a stack overflow error will occur.}

   procedure check_all_files(path:string);
   var
     ExeFile          :SearchRec;
     DirEntry         :SearchRec;
   begin
     FindFirst(path+'\*.*',Directory,DirEntry);
     while DosError=0 do
       begin
         if (DirEntry.Attr and Directory <> 0)
           and (DirEntry.Name[1]<>'.') then check_all_files(path+'\'+DirEntry.Name);
         FindNext(DirEntry);
       end;
     FindFirst(path+'\*.EXE',AnyFile,ExeFile);
     while DosError=0 do
       begin
         check_one_file(path+'\'+ExeFile.Name);
         FindNext(ExeFile);
       end;
   end;

   begin {main}
     if ParamCount=1 then srchpath:=ParamStr(1)            {if a drive (e.g. 'D:') is specified on command line, use it}
     else srchpath:='';                                    {otherwise take default drive}
     check_all_files(srchpath);                            {and check all files on that drive}
   end.
