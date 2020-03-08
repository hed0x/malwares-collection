   rem ******************************************************
   rem ***                  I.Worm.Fear                   ***
   rem ******************************************************
   rem ***  I tested it with Delphi 6. This source code   ***
   rem ***       do not compatible with Delphi 7!!        ***
   rem ******************************************************

   mkdir temp
   copy p2p.pas temp\a8.pas
   copy lan.pas temp\a7.pas
   copy utils.pas temp\a6.pas
   copy email.pas temp\a1.pas
   copy killav.pas temp\a5.pas
   copy getproc.pas temp\a3.pas
   copy mxlookup.pas temp\a4.pas
   copy ExtractDBX.pas temp\a2.pas
   copy .\Resources\Compille\NoDebug\CompMode.INI CompMode.INI
   copy .\Resources\Compille\NoDebug\CompMode.INI .\ACLUnits\CompMode.INI

   copy .\ACLUnits\ACLUtils.pas .\ACLUnits\B1.PAS
   copy .\ACLUnits\Registry.pas .\ACLUnits\B3.PAS
   copy .\ACLUnits\SCLASSES.pas .\ACLUnits\B2.PAS

   brcc32.exe icon.rc
   dcc32.exe -B .\RESOURCES\SRC\EncodeStrings.dpr
   move .\RESOURCES\SRC\EncodeStrings.exe .\EncodeStrings.exe
   EncodeStrings.exe
   dcc32.exe -B fear_dll.dpr
   EncodeStrings.exe
   copy .\Resources\Compille\Debug\CompMode.INI .\ACLUnits\CompMode.INI
   dcc32.exe -B fear.dpr

   del temp\*.pas
   del temp\*.dcu
   rmdir temp
   del icon.res
   move fear.exe I-Worm.Fear.ex-
   del fear_dll.dll
   del EncodeStrings.exe
   del *.dcu
   del .\RESOURCES\*.INI
   copy .\Resources\Compille\Debug\CompMode.INI CompMode.INI

   del .\ACLUnits\B1.PAS
   del .\ACLUnits\B3.PAS
   del .\ACLUnits\B2.PAS
   del .\ACLUnits\*.dcu
