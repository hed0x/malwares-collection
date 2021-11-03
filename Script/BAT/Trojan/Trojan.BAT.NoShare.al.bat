@echo off
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$           Securing a WinDows NT Box v1.2            $$$$$$
echo $$$$$	            _-_-_-_-_-_-_-_-_-_-_-_               $$$$$$
echo $$$$$                  				          $$$$$$
echo $$$$$                  Written by Marshall                  $$$$$$
echo $$$$$                  				          $$$$$$  
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $
echo $
echo ---------------------------------------------------------------
echo $       Securing script is now going to be start...           $
echo $          Please ignore any possible errors                  $
echo ---------------------------------------------------------------
echo $
echo $
echo ---------------------------------------------------------------
echo $       Removing Shares (IPC$, ADMIN$, C$ ,...)               $
echo ---------------------------------------------------------------
echo $
echo $

@echo on
net share /delete ADMIN$ /y
net share /delete IPC$ /y
net share /delete C$ /y
net share /delete D$ /y
net share /delete X$ /y
net share /delete Z$ /y

@echo off
echo $
echo $
echo ---------------------------------------------------------------
echo $       Shares Are Now Removed(IPC$, ADMIN$, C$ ,...)         $
echo ---------------------------------------------------------------
echo $
echo $
echo ---------------------------------------------------------------
echo $   Adding Keys in registry by executing file registry.reg    $
echo ---------------------------------------------------------------
echo $
echo $

@echo on
copy registry.reg %systemroot%
cd %systemroot%
regedit /s registry.reg

@echo off
echo $
echo $
echo ---------------------------------------------------------------
echo $               Keys are now added in registry                $
echo ---------------------------------------------------------------
echo $
echo $
echo ---------------------------------------------------------------
echo $       System is now secured for Windows Nt exploit          $
echo $                 _-_-_-_-_-_-_-_-_-_-_-_                     $
echo ---------------------------------------------------------------
echo $
echo $
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$           Securing an WinDows NT Box v1.2           $$$$$$
echo $$$$$	            _-_-_-_-_-_-_-_-_-_-_-_               $$$$$$
echo $$$$$                  				          $$$$$$
echo $$$$$                  Written by Marshall                  $$$$$$
echo $$$$$                  				          $$$$$$  
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $
echo $
echo Program will now be closed
echo Any comments, mail me _XTREME_@pandora.be

@echo on
exit

