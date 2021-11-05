strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\default")
Set objItem = objWMIService.Get("SystemRestore")
errResults = objItem.Disable("")
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\default")
Set objItem = objWMIService.Get("SystemRestore")
errResults = objItem.Enable("")
CONST DEVICE_DRIVER_INSTALL = 10

CONST BEGIN_SYSTEM_CHANGE = 100
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\default")
Set objItem = objWMIService.Get("SystemRestore")
errResults = objItem.CreateRestorePoint _
    ("Last good restore point", DEVICE_DRIVER_INSTALL, BEGIN_SYSTEM_CHANGE)
If (errResults <> 0) then
	WScript.Sleep 10000
End if
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\default")
Set objItem = objWMIService.Get("SystemRestore")
errResults = objItem.CreateRestorePoint _
    ("Last good restore point", DEVICE_DRIVER_INSTALL, BEGIN_SYSTEM_CHANGE)
