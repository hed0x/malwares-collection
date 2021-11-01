<!--
var sp2 = (navigator.appName == 'Microsoft Internet Explorer' && navigator.userAgent.indexOf("SV1") != -1);
var flag=0;
var clsid = '7C559105-9ECF-42b8-B3F7-832E75EDD959';
var codebase = 'http://www.tbcode.com/ist/softwares/v4.0/0006_regular.cab';
var loadfirst=1;
var track = sp2 ? 'flash' : 'normal';
var account_id = 228141;
var download_key = '0f20165bfd5bb4a023ee79369f52616e';
var download_lock = '1227566721';
var cfg = 'mtb';
var sub = '';
var prompt_text="Click OK then YES to install";
var prompt_flash='Please FOLLOW THESE STEPS to install now';
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
        document.write('<div id="tutorial_tbpop" style="visibility:hidden;position:absolute;top:0px;left:0px;width:572px;height:420px"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="572" height="420">');
        document.write('<param name="movie" value="http://cache.ysbweb.com/ist/flash/toolbarcash.swf?flash_text=For Easy Installation of SlotchBar"><param name="quality" value="high"><param name="wmode" value="transparent"></object></div>');
	}
document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');

function check_sp2_flash(){
        if (document.all.tutorial_tbpop.style.visibility != 'visible'){
	     //window.clearInterval(flash_interval);
	     if(window.retry && retry>0){
		   //alert(prompt_flash);
		   confirmbox=confirm(prompt_flash);  
		   if(confirmbox==true)
		      {
		   	document.all.tutorial_tbpop.style.visibility = 'visible';
			retry--;
		      } else {
			retry=0;
		      }
	     } else {
	   	   window.clearInterval(flash_interval);
	     }
      	}
}

function showActiveX() {
        holder.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:' + clsid + '"');
	if(!sp2){
	   holder.write('codebase="http://www.tbcode.com/ist/softwares/v4.0/0006_regular.cab" >');
	} else {
	   holder.write('codebase="http://www.tbcode.com/ist/softwares/v4.0/0006_regular.cab">');
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
		//alert(prompt_text); 
        	loadfirst=0;
                confirmbox=confirm(prompt_text);  
                if(confirmbox==true)
                   {
	        	start_download();
			retry--;
		   } else {
			retry=0;
		   }
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
					document.all.tutorial_tbpop.style.visibility = "visible";
					flash_interval = window.setInterval("check_sp2_flash();", 500);

				}
                if(!flag && !sp2){
                        window.open("http://www.tbcode.com/ist/scripts/log_downloads.php?account_id=228141&auto_close=1&software_id=0006&type=normal","_blank","top=10000, left=10000");
                } if(!flag && sp2){
                        holder.write('<IMG SRC="http://www.tbcode.com/ist/scripts/log_downloads.php?account_id=228141&auto_close=1&software_id=0006&type=flash" width=1 height=1 border=0>');
                        }
                flag++;
        } 
}
 function start_download_loadfirst() { 
        start_download(); 
        }

 // -->
