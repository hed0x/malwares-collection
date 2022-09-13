Imports System
Imports System.Reflection
Imports System.Runtime.InteropServices

Namespace Complex
	' Token: 0x02000019 RID: 25
	Public Class Shortcut
		' Token: 0x060000A3 RID: 163 RVA: 0x0000ABC8 File Offset: 0x00008DC8
		Public Shared Sub Create(fileName As String, targetPath As String, arguments As String, workingDirectory As String, description As String, hotkey As String, iconPath As String)
			Dim wshShortcut As Shortcut.IWshShortcut = CType(Shortcut.m_type.InvokeMember(Program.Base64Decode("Q3JlYXRlU2hvcnRjdXQ="), BindingFlags.InvokeMethod, Nothing, Shortcut.m_shell, New Object() { fileName }), Shortcut.IWshShortcut)
			wshShortcut.Description = description
			wshShortcut.Hotkey = hotkey
			wshShortcut.TargetPath = targetPath
			wshShortcut.WorkingDirectory = workingDirectory
			wshShortcut.Arguments = arguments
			If Not String.IsNullOrEmpty(iconPath) Then
				wshShortcut.IconLocation = iconPath
			End If
			wshShortcut.Save()
		End Sub

		' Token: 0x04000099 RID: 153
		Private Shared m_type As Type = Type.GetTypeFromProgID(Program.Base64Decode("V1NjcmlwdC5TaGVsbA=="))

		' Token: 0x0400009A RID: 154
		Private Shared m_shell As Object = Activator.CreateInstance(Shortcut.m_type)

		' Token: 0x0200001A RID: 26
		<Guid("F935DC23-1CF0-11D0-ADB9-00C04FD58A0B")>
		<TypeLibType(4160S)>
		<ComImport()>
		Private Interface IWshShortcut
			' Token: 0x17000004 RID: 4
			' (get) Token: 0x060000A6 RID: 166
			<DispId(0)>
			ReadOnly Property FullName As String

			' Token: 0x17000005 RID: 5
			' (get) Token: 0x060000A7 RID: 167
			' (set) Token: 0x060000A8 RID: 168
			<DispId(1000)>
			Property Arguments As String

			' Token: 0x17000006 RID: 6
			' (get) Token: 0x060000A9 RID: 169
			' (set) Token: 0x060000AA RID: 170
			<DispId(1001)>
			Property Description As String

			' Token: 0x17000007 RID: 7
			' (get) Token: 0x060000AB RID: 171
			' (set) Token: 0x060000AC RID: 172
			<DispId(1002)>
			Property Hotkey As String

			' Token: 0x17000008 RID: 8
			' (get) Token: 0x060000AD RID: 173
			' (set) Token: 0x060000AE RID: 174
			<DispId(1003)>
			Property IconLocation As String

			' Token: 0x17000009 RID: 9
			' (set) Token: 0x060000AF RID: 175
			<DispId(1004)>
			WriteOnly Property RelativePath As String

			' Token: 0x1700000A RID: 10
			' (get) Token: 0x060000B0 RID: 176
			' (set) Token: 0x060000B1 RID: 177
			<DispId(1005)>
			Property TargetPath As String

			' Token: 0x1700000B RID: 11
			' (get) Token: 0x060000B2 RID: 178
			' (set) Token: 0x060000B3 RID: 179
			<DispId(1006)>
			Property WindowStyle As Integer

			' Token: 0x1700000C RID: 12
			' (get) Token: 0x060000B4 RID: 180
			' (set) Token: 0x060000B5 RID: 181
			<DispId(1007)>
			Property WorkingDirectory As String

			' Token: 0x060000B6 RID: 182
			<DispId(2000)>
			<TypeLibFunc(64S)>
			Sub Load(<MarshalAs(UnmanagedType.BStr)> <[In]()> PathLink As String)

			' Token: 0x060000B7 RID: 183
			<DispId(2001)>
			Sub Save()
		End Interface
	End Class
End Namespace
