@echo off

if exist KEY\DPGN\secret.rsa goto key_ok
:: warning: DPGN keylen should be power of 2
..\..\..\SIGN\KEYGEN\keygen KEY\DPGN\ 1024 3 3
:key_ok

DPGNHASH\dpgnhash r
DPGNHASH\dpgnhash e 2

DPGNHASH\dpgnhash d *
fc /b file1 file3

copy /b ..\..\KME\kme.pgn + ..\..\ETG\etg.pgn + 0   $$$
DPGN\dpgn $$$
del $$$
