On Error Resume Next
'取得本机器的网卡物理地址： MacAddress
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colNicConfigs = objWMIService.ExecQuery _
("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True") 

For Each objNicConfig In colNicConfigs
Set objNic = objWMIService.Get _
("Win32_NetworkAdapter.DeviceID=" & objNicConfig.Index)
 
'本机器的网卡物理地址写入变量 : strMacAddress
strMacAddress = objNic.MACAddress

Next


'读取配置文件
dim files,file,strReadLine ,RowNumber
Const ForReading = 1
set files=CreateObject("Scripting.FileSystemObject")
if files.fileexists("E:\AutoConfig\config.cfg", ForReading) then
set file=files.opentextfile("E:\AutoConfig\config.cfg")
else
msgbox("请在程序目录下放置MAC列表文件(文件名为:config.cfg)")
end if

RowNumber = 0
Do While file.AtEndOfStream <> True
strReadLine = file.ReadLine
RowNumber = RowNumber + 1 
If InStr(strReadLine,strMacAddress) <> 0 Then
ComputerConfig = Split(strReadLine , ";")

Exit Do
End If
Loop


'修改IP地址
strComputer = "."

SubnetIPAddress = "192.168.0."
LocalIPAddress = SubnetIPAddress & RowNumber

Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colNetAdapters = objWMIService.ExecQuery _
("Select * from Win32_NetworkAdapterConfiguration where IPEnabled=TRUE")
strIPAddress = Array(LocalIPAddress)
strSubnetMask = Array("255.255.255.0")
strGateway = Array("192.168.0.100")
strGatewayMetric = Array(1)
For Each objNetAdapter in colNetAdapters
errEnable = objNetAdapter.EnableStatic(strIPAddress, strSubnetMask)
errGateways = objNetAdapter.SetGateways(strGateway, strGatewaymetric)

Next

'修改机器名
Set WshShell = CreateObject("Wscript.Shell")
Set Fso = CreateObject("SCripting.FileSystemObject")

WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName", ComputerConfig(0) ,"REG_SZ"
WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\NV Hostname", ComputerConfig(0) ,"REG_SZ"
WshShell.RegWrite "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Hostname", ComputerConfig(0) ,"REG_SZ" 

'修改CS-CDKEY
WshShell.RegWrite "HKCU\Software\Valve\CounterStrike\Settings\Key", ComputerConfig(3),"REG_SZ"
WshShell.RegWrite "HKU\S-1-5-21-839522115-507921405-2146800195-500\Software\Valve\CounterStrike\Settings\Key", ComputerConfig(3),"REG_SZ"
WshShell.RegWrite "HKU\S-1-5-21-1085031214-220523388-839522115-500\Software\Valve\CounterStrike\Settings\Key", ComputerConfig(3),"REG_SZ" 
WshShell.RegWrite "HKU\S-1-5-21-1614895754-1417001333-839522115-500\Software\Valve\CounterStrike\Settings\key", ComputerConfig(3),"REG_SZ"

'清除启动项
WshShell.RegDelete"HKLM\Software\Microsoft\Windows\CurrentVersion\Run\AutoConfig"
Set Wshell=Nothing

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate,(Shutdown)}!\\" & strComputer & "\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery _
("Select * from Win32_OperatingSystem")
For Each objOperatingSystem in colOperatingSystems
ObjOperatingSystem.Reboot()  
Next 
On Error GoTo 0