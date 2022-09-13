Imports System
Imports System.ComponentModel
Imports System.Diagnostics

Namespace Complex
	' Token: 0x0200001B RID: 27
	Public Class ProcessKiller
		' Token: 0x060000B8 RID: 184 RVA: 0x0000AC7C File Offset: 0x00008E7C
		Public Shared Function ProcessCompareProductName(p As Process, match As String) As Boolean
			Dim result As Boolean
			Try
				result = p.ProcessName.ToLower().Contains(match.ToLower())
			Catch ex As Win32Exception
				result = False
			Catch ex2 As InvalidOperationException
				result = False
			Catch ex3 As NullReferenceException
				result = False
			Catch
				result = False
			End Try
			Return result
		End Function

		' Token: 0x060000B9 RID: 185 RVA: 0x0000ACF4 File Offset: 0x00008EF4
		Public Shared Sub ClosingCycle(names As String, dnames As String)
			Dim processes As Process() = Process.GetProcesses()
			Dim i As Integer = 0
			While i < processes.Length
				Dim process As Process = processes(i)
				If ProcessKiller.ProcessCompareProductName(process, names.ToLower()) Then
					Try
						process.Kill()
						process.WaitForExit()
						Program.CleanMyStuff()
					Catch ex As InvalidOperationException
					Catch ex2 As PlatformNotSupportedException
						Exit Try
					Catch
					End Try
				End If
				IL_4D:
				i += 1
				Continue While
				GoTo IL_4D
			End While
		End Sub
	End Class
End Namespace
