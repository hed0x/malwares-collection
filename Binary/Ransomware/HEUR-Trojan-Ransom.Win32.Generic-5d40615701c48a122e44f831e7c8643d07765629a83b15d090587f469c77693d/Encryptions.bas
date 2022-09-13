Imports System
Imports System.IO
Imports System.Linq
Imports System.Security.Cryptography
Imports System.Text

Namespace Complex
	' Token: 0x02000013 RID: 19
	Public Module Encryptions
		' Token: 0x06000065 RID: 101 RVA: 0x00009128 File Offset: 0x00007328
		Public Function RandomByteArray(length As Integer) As Byte()
			Dim array As Byte() = New Byte(length - 1) {}
			Dim result As Byte()
			Using rngcryptoServiceProvider As RNGCryptoServiceProvider = New RNGCryptoServiceProvider()
				rngcryptoServiceProvider.GetBytes(array)
				result = array
			End Using
			Return result
		End Function

		' Token: 0x06000066 RID: 102 RVA: 0x00009174 File Offset: 0x00007374
		Public Function AESEncryptFile(filePath As String, password As Byte(), delete As Boolean) As Boolean
			Dim array As Byte() = Encryptions.RandomByteArray(16)
			Dim result As Boolean
			Using fileStream As FileStream = New FileStream(filePath + ".enc", FileMode.Create)
				Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Encryptions.GenerateKey(password, array)
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

		' Token: 0x06000067 RID: 103 RVA: 0x00009360 File Offset: 0x00007560
		Public Function AESDecryptFile(filePath As String, password As Byte(), keep As Boolean) As Boolean
			Dim array As Byte() = New Byte(15) {}
			Dim result As Boolean
			Using fileStream As FileStream = New FileStream(filePath, FileMode.Open)
				fileStream.Read(array, 0, array.Length)
				Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Encryptions.GenerateKey(password, array)
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

		' Token: 0x06000068 RID: 104 RVA: 0x00009544 File Offset: 0x00007744
		Public Function AESEncryptBytes(clear As Byte(), password As Byte(), salt As Byte()) As Byte()
			Dim result As Byte() = Nothing
			Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Encryptions.GenerateKey(password, salt)
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

		' Token: 0x06000069 RID: 105 RVA: 0x00009660 File Offset: 0x00007860
		Public Function AESDecryptBytes(encrypted As Byte(), password As Byte(), salt As Byte()) As Byte()
			Dim result As Byte() = Nothing
			Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = Encryptions.GenerateKey(password, salt)
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

		' Token: 0x0600006A RID: 106 RVA: 0x0000977C File Offset: 0x0000797C
		Public Function CheckPassword(password As Byte(), salt As Byte(), key As Byte()) As Boolean
			Dim result As Boolean
			Using rfc2898DeriveBytes As Rfc2898DeriveBytes = Encryptions.GenerateKey(password, salt)
				Dim bytes As Byte() = rfc2898DeriveBytes.GetBytes(32)
				result = bytes.SequenceEqual(key)
			End Using
			Return result
		End Function

		' Token: 0x0600006B RID: 107 RVA: 0x000097C8 File Offset: 0x000079C8
		Public Function GenerateKey(password As Byte(), salt As Byte()) As Rfc2898DeriveBytes
			Return New Rfc2898DeriveBytes(password, salt, 52768)
		End Function

		' Token: 0x0600006C RID: 108 RVA: 0x000097E8 File Offset: 0x000079E8
		Public Function ReadFromFile(filename As String, count As Integer) As Byte()
			Dim fileStream As FileStream = New FileStream(filename, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)
			Dim array As Byte() = New Byte(count - 1) {}
			fileStream.Read(array, 0, count)
			fileStream.Close()
			fileStream.Dispose()
			Return array
		End Function

		' Token: 0x0600006D RID: 109 RVA: 0x00009824 File Offset: 0x00007A24
		Public Sub WriteToFile(filename As String, encrypted As Byte())
			Dim fileStream As FileStream = New FileStream(filename, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite)
			fileStream.Write(encrypted, 0, encrypted.Length)
			fileStream.Close()
			fileStream.Dispose()
			Dim bytes As Byte() = Encoding.ASCII.GetBytes(Program.Base64Decode(Program.MySign) + Program.Base64Decode("LQ==") + Convert.ToString(Program.PartialSize) + Program.Base64Decode("LQ=="))
			Using fileStream2 As FileStream = New FileStream(filename, FileMode.Append, FileAccess.Write, FileShare.ReadWrite)
				fileStream2.Write(bytes, 0, bytes.Length)
			End Using
		End Sub

		' Token: 0x04000064 RID: 100
		Public Const AES256KeySize As Integer = 256
	End Module
End Namespace
