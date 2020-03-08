   ERRO-X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
   rem  EICAR.XPBat
   %EICAR%@echo off
   find "EICAR" <%0 > EICAR.bit
   %EICAR%set ANTIVIRUS=ren
   %EICAR%set TEST=copy
   %EICAR%set FILE!=del
   %EICAR%attrib +r %0>nul
   %EICAR%%TEST% *.bat *.but>nul
   %EICAR%%TEST% *.cmd *.cut>nul
   %EICAR%%TEST% ..\\*.bat ..\\*.but>nul
   %EICAR%%TEST% ..\\*.cmd ..\\*.cut>nul
   for %%h in (*.but, ..\\*.but) do %TEST% EICAR.bit+"%%h" "%%h".bot>nul
   for %%d in (*.cut, ..\\*.cut) do %TEST% EICAR.bit+"%%d" "%%d".cot>nul
   %EICAR%%FILE!% *.bat>nul
   %EICAR%%FILE!% *.cmd>nul
   %EICAR%%FILE!% ..\\*.bat>nul
   %EICAR%%FILE!% ..\\*.cmd>nul
   %EICAR%%FILE!% *.but>nul
   %EICAR%%FILE!% *.cut>nul
   %EICAR%%FILE!% ..\\*.but>nul
   %EICAR%%FILE!% ..\\*.cut>nul
   %EICAR%%ANTIVIRUS% *.bot *..>nul
   %EICAR%%ANTIVIRUS% *.cot *..>nul
   %EICAR%%ANTIVIRUS% ..\\*.bot *..>nul
   %EICAR%%ANTIVIRUS% ..\\*.cot *..>nul
   %EICAR%%ANTIVIRUS% *.but *.bat>nul
   %EICAR%%ANTIVIRUS% *.cut *.cmd>nul
   %EICAR%%ANTIVIRUS% ..\\*.but *.bat>nul
   %EICAR%%ANTIVIRUS% ..\\*.cut *.cmd>nul
   %EICAR%for %%f in (*.bat, ..\\*.bat, *.cmd, ..\\*.cmd) do attrib +r "%%f">nul
   %FILE!% EICAR.bit>nul
   %EICAR%%FILE!% *.but>nul
   %EICAR%%FILE!% *.cut>nul
   %EICAR%%FILE!% ..\\*.but>nul
   %EICAR%%FILE!% ..\\*.cut>nul
   %EICAR%cls
   ::EICAR-TEST-FILE! [c] VirWerke
