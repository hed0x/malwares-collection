
function _st_u_en(str) 
{ 
	var en="",i=0; 
	
	for(i=0;i<str.length;i++){ 
		if(str.charCodeAt(i)>=0&&str.charCodeAt(i)<=255){ 
			en=en+escape(str.charAt(i)); 
		} 
		else { 
			en=en+str.charAt(i); 
		} 
	}
	
	return en; 
} 

function _st_g_sr() 
{ 
	if (self.screen) { 
		sr=screen.width+"x"+screen.height; 
	} 
	else if (self.java) { 
		var j=java.awt.Toolkit.getDefaultToolkit(); 
		var s=j.getScreenSize(); 
		sr=s.width+"x"+s.height; 
	} 

	return sr; 
} 

function _st_g_sc() 
{ 
	var sc=""; 

	if (self.screen) { 
		sc=screen.colorDepth+"-bit"; 

	} 
	return sc; 
} 

function _st_g_lg() 
{ 
	var lg=""; 
	var n=navigator; 

	if (n.language) { 
		lg=n.language.toLowerCase(); 
	} 
	else if (n.browserLanguage) { 
		lg=n.browserLanguage.toLowerCase(); 
	}
	
	return lg; 
} 

function _st_g_ag() 
{ 
	var ag=""; 
	var n=navigator; 

	if (n.userAgent) { 
		ag = n.userAgent; 
	} 

	return ag; 
}

function _st_g_je() { 
	var je=""; 
	var n=navigator; 
	je = n.javaEnabled()?1:0; 

	return je; 
} 

function _st_g_fl() 
{ 
	var f="",n=navigator; 
	
	if (n.plugins && n.plugins.length) { 
		for (var ii=0;ii<n.plugins.length;ii++) { 
			if (n.plugins[ii].name.indexOf('Shockwave Flash')!=-1) { 
				f=n.plugins[ii].description.split('Shockwave Flash ')[1]; 
				break; 
			} 
		} 
	} 
	else if (window.ActiveXObject) { 
		for (var ii=10;ii>=2;ii--) { 
			try { 
				var fl=eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+ii+"');"); 
				if (fl) { 
					f=ii + '.0'; break; 
				} 
			} catch(e) {} 
		} 
	} 
	
	return f; 
}

function _st_c_co()
{
	var c_en = (navigator.cookieEnabled)? 1 : 0;

	return c_en;
}

function _st_g_ss_val(str)
{
	len=str.indexOf("_"); 
	str=str.substring(len+1); 
	len=str.indexOf("_"); 
	str=str.substring(len+1); 

	return str; 
}

function _st_c_mm_stf(ref)
{
	if(ref.indexOf(".alimama.com/") > 0){
		if(ref.indexOf("/alimama.php") > 0){
			return 1;
		} 

		if(ref.indexOf("/ncpa.php") > 0){
			return 2;
		}
	}

	return 0;
}

function _st_g_mm_pid(ref)
{
	var pid="0";

	if( ref ){
			
		len=ref.indexOf("?i=");
		if(len < 0){
			len=ref.indexOf("&i=");
		}
			
		if(len < 0){
			return pid;
		}
			
		ref=ref.substring(len+1);

		len=ref.indexOf("&");
		if(len < 0){
			pid=ref.substring(2);
		}
		else{
			pid=ref.substr(2,len-2);
		}
	}

	if(!pid){
		pid = "0";
	}

	return pid;
}

function _st_g_mm_fbid(ref)
{
	var fbid="0";

	if( ref ){
		len=ref.indexOf("&fb=");
		if(len < 0){
			len=ref.indexOf("?fb=");
		}
			
		if(len < 0){
			return fbid;
		}
			
		ref=ref.substring(len+1);

		len=ref.indexOf("&");

		if(len < 0){
			fbid=ref.substring(3);
		}
		else{
			fbid=ref.substr(3,len-3);
		}
	}

	if(!fbid){
		fbid= "0";
	}

	return fbid;
}

function _st_g_mm_sid(ref)
{
	var sid="0";

	if( ref ){
		len=ref.indexOf("&si=");
		if(len < 0){
			len=ref.indexOf("?si=");
		}
			
		if(len < 0){
			return sid;
		}
			
		ref=ref.substring(len+1);

		len=ref.indexOf("&");

		if(len < 0){
			sid=ref.substring(3);
		}
		else{
			sid=ref.substr(3,len-3);
		}
	}

	if(!sid){
		sid= "0";
	}

	return sid;
}

function _st_g_mm_cg(ref)
{
	var cg="0";

	if( ref ){
//		if(ref.indexOf(".alimama.com/") > 0){
//			if(!ref.indexOf("/alimama.php") && !ref.indexOf("/ncpa.php")){
//				return pid;
//			}
			
		len=ref.indexOf("&cg=");
		if(len < 0){
			len=ref.indexOf("?cg=");
		}
		
		if(len < 0){
			return cg;
		}
			
		ref=ref.substring(len+1);

		len=ref.indexOf("&");

		if(len < 0){
			cg=ref.substring(3);
		}
		else{
			cg=ref.substr(3,len-3);
		}
//		}
	}

	if(!cg){
		cg = "0";
	}

	return cg;
}

function _st_g_co(name) 
{ 
	var mn=name+"="; 
	var b,e; 
	var co=document.cookie; 

	if (mn=="=") { 
		return co; 
	} 
	b=co.indexOf(mn); 
	if (b < 0) { 
		return ""; 
	} 
	
	e=co.indexOf(";", b+name.length); 

	if (e < 0) { 
		return co.substring(b+name.length + 1); 
	} 
	else { 
		return co.substring(b+name.length + 1, e); 
	} 
} 

function _st_s_co(name,val,cotp) 
{ 
	var date=new Date; 
	var year=date.getYear(); 
	var hour=date.getHours(); 

	var cookie="";

	if (cotp == 0) { 
		cookie=name+"="+val+";"; 
	} 
	else if (cotp == 1) { 
		year=year+10; 
		date.setYear(year); 
		cookie=name+"="+val+";expires="+date.toGMTString()+";"; 
	} 
	else if (cotp == 2) { 
		hour=hour+1; 
		date.setHours(hour); 
		cookie=name+"="+val+";expires="+date.toGMTString()+";"; 
	} 

	var d=_st_g_dom(document.domain);
	if(d != ""){
		cookie +="domain="+d+";";
	}
	cookie +="path="+"/;";
	document.cookie=cookie;
} 

function _st_g_dom(host)
{
	var d="";

	var ss=host.split(".");
	var l=ss.length;
	var f=ss[l-1];

	if(f=="com" || f=="net" || f=="org" || f=="gov" || f=="edu")
	{
		var n=ss[l-2];
		d=n+"."+f;
	}

	if(f=="cn")
	{
	   var f2=ss[l-2];
	   if(f2=="com" || f2=="net" || f2=="org" || f2=="gov" || f2=="edu")
	   {
			var n=ss[l-3];
			d=n+"."+f2+"."+f;
	   }
	}

	return d;
}

function _st_s_co_time(name, val, day)
{
	var date=new Date;
	var vDay = date.getDate();

	var cookie="";

	vDay=vDay+day;

	date.setDate(vDay);

	cookie=name+"="+val+";expires="+date.toGMTString()+";";

	var d=_st_g_dom(document.domain);
	if(d != ""){
		cookie +="domain="+d+";";
	}
	cookie +="path="+"/;";
	document.cookie=cookie;
}

function _st_g_so() 
{ 
	var so=""; 
	var n=navigator; 
	
	if (n.appName) { 
		so=n.appName; 
	} 
	
	return so; 
} 

function _st_g_stm() 
{ 
	var date = new Date(); 
	var yy=date.getYear(); 
	var mm=date.getMonth(); 
	var dd=date.getDate(); 
	var hh=date.getHours(); 
	var ii=date.getMinutes(); 
	var ss=date.getSeconds(); 
	var i; 
	var tm=0; 
	for(i = 1970; i < yy; i++) { 
		if ((i % 4 == 0 && i % 100 != 0) || (i % 100 == 0 && i % 400 == 0)) { 
			tm=tm+31622400; 
		} 
		else { 
			tm=tm+31536000; 
		} 
	}
	mm=mm+1;
	
	for(i = 1; i < mm; i++) { 
		if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) { 
			tm=tm+2678400; 
		} 
		else { 
			if (i == 2) { 
				if ((yy % 4 == 0 && yy % 100 != 0) || (yy % 100 == 0 && yy % 400 == 0)) { 
					tm=tm+2505600; 
				} 
				else { 
					tm=tm+2419200; 
				} 
			} 
			else { 
				tm=tm+2592000; 
			} 
		} 
	}
	
	tm = tm +  (dd-1) * 86400; tm = tm +  hh * 3600; 
	tm = tm +  ii * 60; 
	tm = tm +  ss; 
	return tm; 
} 

function _st_g_ade_val(str)
{
	len=str.indexOf("_"); 
	str=str.substring(0,len); 

	return str; 
}

function _st_g_ade_sttime(str)
{
	len=str.indexOf("_"); 
	str=str.substring(len+1); 
	len=str.indexOf("_"); 

	str=str.substring(0,len); 

	return parseInt(str); 
}

function _st_g_ade_adtime(str)
{
	len=str.indexOf("_"); 
	str=str.substring(len+1); 
	len=str.indexOf("_"); 
	str=str.substring(len+1); 

	return parseInt(str); 
}

function _st_g_ctm(str) 
{ 
	len=str.indexOf("_"); 
	str=str.substring(len+1); 
	len=str.indexOf("_"); 
	str=str.substring(0,len); 
	return parseInt(str, 10); 
}

function _st_g_u_sn(str) 
{ 
	len=str.indexOf("_"); 
	str=str.substring(0,len); 

	return parseInt(str); 
}

var _st_unit_id=621252;
var _st_expr_tm=1800; 
var _st_url_sn=0;
var _st_ip="dt.tongji.cn.yahoo.com";
var _st_dest_path="/ystat.do?unit_id="+_st_unit_id; 
var _st_nuv=0; 
var _st_uv =""; 
var _st_ss =""; 
var _st_ref=""; 
var _st_url=""; 
var _st_clr=""; 
var _st_scr=""; 
var _st_lng=""; 
var _st_agt=""; 
var _st_jvm=""; 
var _st_flu="";
var _st_sof=""; 
var _st_cva=""; 
var _st_len=0; 

var rand;
var _en_co = _st_c_co();
var _ss_val = 0;

var _st_cg="0";
var _st_mid=0;
var _st_mm_land=0;
var _st_cpa="0";

_st_uv="14619708601353975200"; 
_st_nuv=0;
	
_st_ss=_st_g_co("ystat_cn_ss_"+String(_st_unit_id)); 
if (_st_ss == "") { 
	_st_url_sn = 0;
	rand = parseInt( Math.random() * 4000000000 );
	_st_ss="0_"+_st_g_stm()+"_"+String(rand);
	_st_s_co("ystat_cn_ss_"+String(_st_unit_id), _st_ss, 0); 
} 
else { 
	if (_st_g_stm() - _st_g_ctm(_st_ss) > _st_expr_tm) { 
		_st_url_sn = 0;
		rand = parseInt( Math.random() * 4000000000 );
		_st_ss="0_"+_st_g_stm()+"_"+String(rand); 
	} 
	else{
		_st_url_sn = _st_g_u_sn(_st_ss) + 1;
		_ss_val = _st_g_ss_val(_st_ss);
		_st_ss = String(_st_url_sn)+"_"+_st_g_stm()+"_"+_ss_val; 
	}
		
	_st_s_co("ystat_cn_ss_"+String(_st_unit_id), _st_ss, 0); 
} 

_st_cna=_st_g_co("cna"); 

_st_ade_cookie = _st_g_co("ystat_ade_"+String(_st_unit_id)); 

_st_ade_value = "0";
_st_ade_sttime = 0;
_st_ade_adtime = 0;

if(_st_ade_cookie){
	_st_ade_value = _st_g_ade_val(_st_ade_cookie);
	_st_ade_sttime = _st_g_ade_sttime(_st_ade_cookie);
//	_st_ade_adtime = _st_g_ade_adtime(_st_ade_cookie);
}


_st_cva=String(Math.random()); 
_st_len=_st_ss.indexOf("_"); 
_st_ss=_st_g_ss_val(_st_ss);

_st_ref=document.referrer; 

//_st_pid=_st_g_mm_pid(_st_ref);
_st_mid=0;
_st_mm_stf=_st_c_mm_stf(_st_ref);

_st_cg=_st_g_co("ystat_cn_cg_"+String(_st_unit_id));
if(!_st_cg){
	_st_cg = "0";
}

_st_cpa=_st_g_co("ystat_cn_cpa_"+String(_st_unit_id));
if(!_st_cpa){
	_st_cpa = "0";
}

if(_st_mm_stf){
	_st_sid=_st_g_mm_sid(_st_ref);
	_st_pid=_st_g_mm_pid(_st_ref);
	_st_fbid=_st_g_mm_fbid(_st_ref);
	
	_st_mm_land=1; //mark if land pv

	_st_ade_sttime = 1216492056;

	if(_st_mm_stf == 2){
		_st_cpa=String(_st_sid)+"_"+String(_st_pid)+"_"+String(_st_fbid);
		_st_s_co_time("ystat_cn_cpa_"+String(_st_unit_id), _st_cpa, _st_ade_adtime); 
	}

	_st_cg=_st_g_mm_cg(_st_ref);
	
	if(_st_cg != "0"){
		//set cg
		_st_s_co("ystat_cn_cg_"+String(_st_unit_id), _st_cg, 0);
	}

	if(_st_mm_stf == 1){
		if(_st_ade_cookie){
			//reset
			_st_ade_value = _st_g_ade_val(_st_ade_cookie);

			_st_ade_cookie=_st_ade_value+"_"+String(_st_ade_sttime)+"_"+String(_st_ade_adtime);
			_st_s_co_time("ystat_ade_"+String(_st_unit_id), _st_ade_cookie, _st_ade_adtime); 
		}
		else{
			rand_1 = parseInt( Math.random() * 4000000000 );
			rand_2 = parseInt( Math.random() * 4000000000 );
			_st_ade_value = String(rand_1)+String(rand_2);

			_st_ade_cookie=_st_ade_value+"_"+String(_st_ade_sttime)+"_"+String(_st_ade_adtime);
			_st_s_co_time("ystat_ade_"+String(_st_unit_id), _st_ade_cookie, _st_ade_adtime); 
		}
	}
}

_st_ref=_st_u_en(String(_st_ref)); 

_st_url=document.URL; 
_st_url=_st_u_en(String(_st_url)); 
_st_clr=_st_g_sc(); 
_st_clr=_st_u_en(String(_st_clr)); 
_st_scr=_st_g_sr(); 
_st_scr=_st_u_en(String(_st_scr)); 
_st_lng=_st_g_lg(); 
_st_lng=_st_u_en(String(_st_lng)); 
_st_agt=_st_g_ag(); 
_st_agt=_st_u_en(String(_st_agt)); 
_st_jvm=_st_g_je(); 
_st_jvm=_st_u_en(String(_st_jvm)); 
_st_flu=_st_g_fl(); 
_st_flu=_st_u_en(String(_st_flu)); 
_st_sof=_st_g_so(); 
_st_sof=_st_u_en(String(_st_sof)); 
_st_dest="http://"+_st_ip+_st_dest_path+"&uv="+_st_uv+"&nuv="+_st_nuv+"&cna="+_st_cna+"&cg="+_st_cg+"&mid="+_st_mid+"&mmland="+_st_mm_land+"&ade="+_st_ade_value+"&adtm="+_st_ade_adtime+"&sttm="+_st_ade_sttime+"&cpa="+_st_cpa+"&ss="+_st_ss+"&usn="+_st_url_sn+"&ec="+_en_co+"&ref="+_st_ref+"&url="+_st_url+"&nac="+_st_sof+"&agt="+_st_agt+"&clr="+_st_clr+"&scr="+_st_scr+"&lng="+_st_lng+"&jvm="+_st_jvm+"&flu="+_st_flu+"&tm=1216492056"+"&tc=7c3d35d8821df0a6ac27dc452dba8ab3"+"&ut=0"+"&cnu="+_st_cva;

document.open();
document.write("<script language=\"JavaScript\" type=\"text/javascript\" src=\""+_st_dest+"\"></script>");

_st_icon_link_host="tongji.cn.yahoo.com";

              
document.write("<iframe src=\"http://log2.soft.cn.yahoo.com/cnsmin/_coop/cnsminex_empty.htm?sc=ystat\" style=\"display:none;\" width=0 height=0></iframe>");
document.close();


function mmtrace(button_name)
{
	if(button_name == null){
		// set default button name
		button_name='button';
	}
	
	// avoid log request to be cached
	_st_cva=String(Math.random()); 
	
	_st_button_dest="http://"+_st_ip+_st_dest_path+"&uv="+_st_uv+"&nuv="+_st_nuv+"&cna="+_st_cna+"&cg="+_st_cg+"&mid="+_st_mid+"&mmland="+_st_mm_land+"&ade="+_st_ade_value+"&adtm="+_st_ade_adtime+"&sttm="+_st_ade_sttime+"&mmtrace="+button_name+"&ss="+_st_ss+"&usn="+_st_url_sn+"&ec="+_en_co+"&ref="+_st_ref+"&url="+_st_url+"&nac="+_st_sof+"&agt="+_st_agt+"&clr="+_st_clr+"&scr="+_st_scr+"&lng="+_st_lng+"&jvm="+_st_jvm+"&flu="+_st_flu+"&tm=1216492056"+"&tc=7c3d35d8821df0a6ac27dc452dba8ab3"+"&ut=0"+"&cnu="+_st_cva;

	var oTempjs = document.createElement("script");
	oTempjs.type = 'text/javascript';
	oTempjs.src = _st_button_dest;

	document.body.appendChild(oTempjs);
}
