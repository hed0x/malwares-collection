   library kiltro;

    uses
     Forms,
     Cpl,
     Windows,
     unidadworm in 'unidadworm.pas' {Form1};

   {$R *.RES}

    procedure ExecuteApp;
     begin
      Application.Initialize;
      Application.CreateForm(TForm1, Form1);
     Application.Run;
    end;

    {Definimos la funcion que hablará con el panel de control}
    {A callback function to export at Control Panel}
    function CPlApplet(hwndCPl: THandle; uMsg: DWORD;
                     lParam1, lParam2: LongInt):LongInt;stdcall;
    var
      NewCplInfo:PNewCplInfo;
    begin
      Result:=0;
      case uMsg of
       {El panel de control nos pregunta si somos un CPL..., devolvemos TRUE}
       {Yes, it's a CPL, return True.}
       CPL_INIT:
        Result:=1;
       {Numero de Iconos de nuestro applet}
       {Icon Count}
       CPL_GETCOUNT:
        Result:=1;
       {Devolvemos info de nuestro icono}
       {Return Info of our Icon}
       CPL_NEWINQUIRE:
        begin
         NewCplInfo:=PNewCplInfo(lParam2);
         with NewCplInfo^ do
         begin
          dwSize:=SizeOf(TNewCplInfo);
          dwFlags:=0;
          dwHelpContext:=0;
          lData:=0;
          {El icono de nuestra aplicacion}
          {An icon to display on Control Panel.}
          hIcon:=LoadIcon(HInstance,'MAINICON');
          {Nombre del applet CPL}
          {CPL applet name}
          szName:='Project1';
          {Descripcion}
          {Description}
          szInfo:='Kitro.cpl';
          szHelpFile:='';
         end;
       end;
       {Ejecutamos el CPL}
       {Executing our CPL}
       CPL_DBLCLK:
        ExecuteApp;

       else Result:=0;
      end;
    end;

    {Exportamos la funcion del CPL}
    {Exporting the function of CplApplet}
    exports
      CPlApplet;
    end.
