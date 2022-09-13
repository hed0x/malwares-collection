Imports System
Imports System.Diagnostics
Imports System.Threading

Namespace Complex
	' Token: 0x0200000D RID: 13
	Public Module MutexHelper
		' Token: 0x0600004E RID: 78 RVA: 0x00008788 File Offset: 0x00006988
		Public Sub CheckMutex(myMutex As String)
			Using mutex As Mutex = New Mutex(False, "Global\" + myMutex)
				If Not mutex.WaitOne(0, False) Then
					Process.GetCurrentProcess().Kill()
				End If
			End Using
		End Sub
	End Module
End Namespace
