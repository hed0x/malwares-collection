Module IP
    Dim str2 As New Net.WebClient
    Function Func1234()



        Try
            Dim str5 As String = str2.DownloadString("http://myip.dnsomatic.com/")

            Return str5

        Catch ex As Exception
            'MsgBox("Error Please start me again.")
        End Try
#Disable Warning BC42105 ' Die Funktion "Func1234" gibt nicht für alle Codepfade einen Wert zurück. Wenn das Ergebnis verwendet wird, kann zur Laufzeit eine NULL-Verweisausnahme auftreten.
    End Function
End Module
