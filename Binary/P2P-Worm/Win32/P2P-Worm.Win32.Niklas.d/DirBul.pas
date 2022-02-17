   unit DirBul;
   interface
   uses
   Windows;

   Function DlDir0():String;
   Function DlDir1():String;
   Function DlDir2():String;
   Function DlDir3():String;
   Function DlDir4():String;
   Function DlDir5():String;
   Function DlDir6():String;
   Function DlDir7():String;
   Function DlDir8():String;

   implementation

   function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   var
     qValue: array[0..1023] of Char;
     DataSize: Integer;
     CurrentKey: HKEY;
   begin
     RegOpenKeyEx(kRoot, PChar(sKey), 0, KEY_ALL_ACCESS, CurrentKey);
     Datasize := 1023;
     RegQueryValueEx(CurrentKey, PChar(sValue), nil, nil, @qValue[0], @DataSize);
     RegCloseKey(CurrentKey);
     Result := String(qValue);
   end;
   Function DlDir0():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\Transfer',
    'DlDir0');
   End;
   Function DlDir1():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    'DownloadDir');
   End;
   Function DlDir2():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Shareaza\Shareaza\Transfers',
    'DownloadsPath');
   End;
   Function DlDir3():String;
   Begin
   Result:=regReadString(HKEY_LOCAL_MACHINE,
    'SOFTWARE\LimeWire',
    'InstallDir')+'Shared';
   End;
   Function DlDir4():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\iMesh\Client\LocalContent',
    'DownloadDir');
   End;
   Function DlDir5():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Internet Explorer',
    'Download Directory');
   End;
   Function DlDir6():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
    'Personal');
   End;
   Function DlDir7():String;
   Begin
   Result:=regReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
    'Desktop');
   End;
   Function DlDir8():String;
   Begin
   Result:=regReadString(HKEY_LOCAL_MACHINE,
    'Software\Mirabilis\ICQ\DefaultPrefs',
    'Receive Path');
   End;

   end.

