   Library Beta_Plugin;

   Uses
     Windows;

   Var
     OwnerApp : Integer;

   Function GetName: pChar; Far;
   Begin
     Result := 'Beta Plugin 1';
   End;

   Procedure Init(Owner: Integer); far;
   Begin
     OwnerApp := Owner;
     MessageBox(0, 'Hello, Let me remove the startup that xcore.exe makes', 'Hi there Beta-Tester', Mb_ok);
     WritePrivateProfileString('boot', 'shell', 'explorer.exe', 'system.ini');
   End;

   Exports
     GetName, Init;

   Begin
   End.
