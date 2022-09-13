Imports System
Imports System.Security.Cryptography

Namespace Complex
	' Token: 0x02000004 RID: 4
	Public Class Crypto
		' Token: 0x0600001D RID: 29 RVA: 0x00006870 File Offset: 0x00004A70
		Public Shared Function RandomString(string_length As Integer) As String
			Dim result As String
			Using rngcryptoServiceProvider As RNGCryptoServiceProvider = New RNGCryptoServiceProvider()
				Dim num As Integer = string_length * 6
				Dim num2 As Integer = (num + 7) / 8
				Dim array As Byte() = New Byte(num2 - 1) {}
				rngcryptoServiceProvider.GetBytes(array)
				result = Convert.ToBase64String(array)
			End Using
			Return result
		End Function
	End Class
End Namespace
