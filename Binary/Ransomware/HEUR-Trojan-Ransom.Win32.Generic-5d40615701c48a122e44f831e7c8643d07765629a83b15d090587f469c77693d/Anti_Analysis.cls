Imports System
Imports System.Diagnostics
Imports System.IO
Imports System.Management
Imports System.Runtime.InteropServices
Imports Microsoft.VisualBasic.Devices

Namespace Complex
	' Token: 0x02000006 RID: 6
	Friend Class Anti_Analysis
		' Token: 0x0600002A RID: 42 RVA: 0x00006EC0 File Offset: 0x000050C0
		Public Shared Sub RunAntiAnalysis()
			If Anti_Analysis.DetectManufacturer() OrElse Anti_Analysis.DetectDebugger() OrElse Anti_Analysis.DetectSandboxie() OrElse Anti_Analysis.IsSmallDisk() OrElse Anti_Analysis.IsXP() Then
				Process.GetCurrentProcess().Kill()
			End If
			Environment.FailFast(Nothing)
		End Sub

		' Token: 0x0600002B RID: 43 RVA: 0x00006F0C File Offset: 0x0000510C
		Private Shared Function IsSmallDisk() As Boolean
			Try
				Dim num As Long = 61000000000L
				If New DriveInfo(Path.GetPathRoot(Environment.SystemDirectory)).TotalSize <= num Then
					Return True
				End If
			Catch
			End Try
			Return False
		End Function

		' Token: 0x0600002C RID: 44 RVA: 0x00006F64 File Offset: 0x00005164
		Private Shared Function IsXP() As Boolean
			Try
				If New ComputerInfo().OSFullName.ToLower().Contains("xp") Then
					Return True
				End If
			Catch
			End Try
			Return False
		End Function

		' Token: 0x0600002D RID: 45 RVA: 0x00006FB8 File Offset: 0x000051B8
		Private Shared Function DetectManufacturer() As Boolean
			Try
				Using managementObjectSearcher As ManagementObjectSearcher = New ManagementObjectSearcher("Select * from Win32_ComputerSystem")
					Using managementObjectCollection As ManagementObjectCollection = managementObjectSearcher.[Get]()
						For Each managementBaseObject As ManagementBaseObject In managementObjectCollection
							Dim text As String = managementBaseObject("Manufacturer").ToString().ToLower()
							If(text = "microsoft corporation" AndAlso managementBaseObject("Model").ToString().ToUpperInvariant().Contains("VIRTUAL")) OrElse text.Contains("vmware") OrElse managementBaseObject("Model").ToString() = "VirtualBox" Then
								Return True
							End If
						Next
					End Using
				End Using
			Catch
			End Try
			Return False
		End Function

		' Token: 0x0600002E RID: 46 RVA: 0x0000713C File Offset: 0x0000533C
		Private Shared Function DetectDebugger() As Boolean
			Dim flag As Boolean = False
			Dim result As Boolean
			Try
				Anti_Analysis.CheckRemoteDebuggerPresent(Process.GetCurrentProcess().Handle, flag)
				result = flag
			Catch
				result = flag
			End Try
			Return result
		End Function

		' Token: 0x0600002F RID: 47 RVA: 0x0000717C File Offset: 0x0000537C
		Private Shared Function DetectSandboxie() As Boolean
			Dim result As Boolean
			Try
				If Anti_Analysis.GetModuleHandle("SbieDll.dll").ToInt32() <> 0 Then
					result = True
				Else
					result = False
				End If
			Catch
				result = False
			End Try
			Return result
		End Function

		' Token: 0x06000030 RID: 48
		Public Declare Function GetModuleHandle Lib "kernel32.dll" (lpModuleName As String) As IntPtr

		' Token: 0x06000031 RID: 49
		Private Declare Function CheckRemoteDebuggerPresent Lib "kernel32.dll" (hProcess As IntPtr, ByRef isDebuggerPresent As Boolean) As Boolean
	End Class
End Namespace
